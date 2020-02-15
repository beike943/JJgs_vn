-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务头文件                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--获取表格支持
Include("\\script\\class\\ktabfile.lua");
--对话命令支持
--Include("\\script\\\task\\world\\task_head.lua");
-- 字符串处理功能库
Include("\\script\\lib\\string.lua");
Include("\\script\\shinynight_head.lua");
--2006年圣诞节活动奖励支持
Include("\\script\\online\\zgc_temp_fun.lua")

tabKillerSurname = new(KTabFile, "\\settings\\task\\killer\\killer_surname.txt");
tabKillerFirstname = new(KTabFile, "\\settings\\task\\killer\\killer_firstname.txt");
tabKillerMode = new(KTabFile, "\\settings\\task\\killer\\killer_mode.txt");
tabKillerPos = new(KTabFile, "\\settings\\task\\killer\\killer_pos.txt");
tabKillerParMode = new(KTabFile, "\\settings\\task\\killer\\killer_par_mode.txt");
tabAwardMedicine = new(KTabFile, "\\settings\\task\\killer\\award_medicine.txt");
tabKillerPosTop = new(KTabFile, "\\settings\\task\\killer\\killer_top_pos.txt");
tabTopKillerMode = new(KTabFile, "\\settings\\task\\killer\\killer_top_mode.txt");
tabTaskPay = new(KTabFile, "\\settings\\task\\killer\\killer_pay.txt");
tabAwardEquip = new(KTabFile, "\\settings\\task\\killer\\topkiller_equip.txt");
tabTriggerID = new(KTabFile, "\\settings\\task\\killer\\pos_trigger_id.txt");

--定义任务相关参数

TASK_KILLER_STATE_ID        = 1100; -- 通缉任务状态
TASK_KILLER_MAP_ID          = 1101; -- 地图ID
                            
TASK_KILLER_NPCMODE_ID      = 1102; -- 杀手模板ID
TASK_KILLER_SURNAME_ID      = 1103; -- 杀手姓ID
TASK_KILLER_FIRSTNAME_ID    = 1104; -- 杀手名ID
                            
TASK_KILLER_NPCINDEX_ID     = 1105; -- 临时生成的杀手索引
TASK_KILLER_PAR_NPCINDEX_ID = 1106; -- 临时生成的杀手同伴索引
TASK_KILLER_STATE_STAR      = 1107; -- 通缉任务开关 1 为开始；0 为关闭
TASK_KILLER_DONUM           = 1108; -- 玩家完成通缉任务次数                          
TAKS_KILLER_START_TIME      = 1109; -- 记录玩家开始任务的时间（日期）
TASK_PLAYER_LEVEL						= 1110; -- 玩家接获任务时的等级
TASK_TRIGGER_ID             = 1111; -- 记录生成杀手的地图触发器ID
TASK_ACCEPT_TIME            = 1112; -- 记录玩家接获任务的时间（从1970年至今经过的秒数）
TASK_KILLER_DONUM_LIMIT     = 1113; -- 记录该地图上所有玩家接获任务次数
TASK_USEYANHUO_TIME         = 1114; -- 记录使用传信烟火的时间
TASK_POINT_TOTAL            = 1115; -- 记录玩家通缉任务积分

TASK_TRIGGER_RECT           = 600;  -- 杀手的地图触发器
TASK_TRIGGER_TIME           = 500;  -- 杀手计时器

--捕头所在的地图信息
BuTouMapData = {
	
	[1]={100,"泉州"},
	[2]={150,"扬州"},
	[3]={200,"汴京"},
	[4]={300,"成都"},
	[5]={350,"襄阳"},
	 
}

--通缉任务积分系数等级对应表
KillerPointData = {

	[20]={1.0},
	[25]={1.1},
  [30]={1.2},
  [35]={1.3},
  [40]={1.4},
  [45]={1.5},
  [50]={1.6},
  [55]={1.7},
  [60]={1.8},
  [65]={1.9},
  [70]={2.0},
  [75]={2.1},
  [80]={2.2},
  [85]={2.3},
  [90]={2.4},
  [95]={2.5},
  
}

--构造杀手姓名
--返回：杀手姓ID，杀手名ID
function getKillerNameID()

local nXRow = tabKillerSurname:getRow();
local nMRow = tabKillerFirstname:getRow();
local nSurnameID = tonumber(tabKillerSurname:getCell(random(3,nXRow),"SurnameID"));
local nFirstnameID = tonumber(tabKillerFirstname:getCell(random(3,nMRow),"FirstnameID"));
	
	return nSurnameID,nFirstnameID;

end;


--根据杀手姓名ID获取杀手姓名
function getKillerName(nSurnameID,nFirstnameID)

local nName = "";
local nSurname = "";
local nFirstname = "";
local nXRow = 0;
local nMrow = 0;

	nXRow = tabKillerSurname:selectRowNum("SurnameID",nSurnameID);
	nMRow = tabKillerFirstname:selectRowNum("FirstnameID",nFirstnameID);
	
	nSurname = tabKillerSurname:getCell(nXRow,"Text");
	nFirstname = tabKillerFirstname:getCell(nMRow,"Text");

	nName = nSurname..nFirstname;
		
	return nName;
	
end;


--根据玩家等级选取任务等级（任务区间）
function selectLevelArea()

local playerLevel = GetLevel();

	if playerLevel < 10 then 
		return 10;
	end;
	
	if playerLevel > 70 then 
		return 70;
	else 
		return floor(playerLevel/10)*10;
	end;
	
end;


--根据玩家等级构造杀手等级数组
--返回值：杀手ID数组
function getKillerLevelArg(nLevel)

local argKillerID = {};
local i = 0;


	for i=3,tabKillerMode:getRow() do
		if tonumber(tabKillerMode:getCell(i,"Level"))==nLevel then
			tinsert(argKillerID,tonumber(tabKillerMode:getCell(i,"KillerID")));

		end;
	end;
	
	return argKillerID;

end;

 
--根据玩家等级选选取并返回一个杀手模板ID
function getKillerID(nLevel)

local argKillerID = getKillerLevelArg(nLevel);
local nKillerModeID = argKillerID[random(1,getn(argKillerID))];
	
	return nKillerModeID;

end;


--根据杀手模板ID返回一个杀手模板名字
function getKillerMode(nKillerModeID)

local nRow = tabKillerMode:selectRowNum("KillerID",nKillerModeID);
local nKillerMode = tabKillerMode:getCell(nRow,"KillerMode");
	
	return nKillerMode;

end;


--根据玩家等级构造地图等级数组
--返回值：地图ID数组
function getPosLevelArg(nLevel)

local argPosID = {};
local i = 0;

	for i=3,tabKillerPos:getRow() do
		if tonumber(tabKillerPos:getCell(i,"Level")) <= nLevel then
			tinsert(argPosID,tonumber(tabKillerPos:getCell(i,"PosID")));
		end;
	end;
	
	return argPosID;
	
end;


--根据玩家等级返回一个地图ID
function getPosID(nLevel)

local argPosID = 0;
local nPosID = 0;

	if nLevel >= 70 then
		nLevel = 70;
	end;

	argPosID = getPosLevelArg(nLevel);
	nPosID = argPosID[random(1,getn(argPosID))];

	return nPosID;

end;
	

--根据地图ID获取地图相关信息
--（地图名，地图号ID，世界坐标X，世界坐标Y，地图坐标x，地图坐标y）
function getPosData(nPosID)

local nRow = tabKillerPos:selectRowNum("PosID",nPosID);
local nMapName = tabKillerPos:getCell(nRow,"MapName");
local nMapID = tonumber(tabKillerPos:getCell(nRow,"MapID"));
local nWx = tonumber(tabKillerPos:getCell(nRow,"WorldX"));
local nWy = tonumber(tabKillerPos:getCell(nRow,"WorldY"));
local nMx = tonumber(tabKillerPos:getCell(nRow,"MapX"));
local nMy = tonumber(tabKillerPos:getCell(nRow,"MapY"));

	return nMapName,nMapID,nWx,nWy,nMx,nMy;
	
end;


--构建一个杀手
--返回（杀手名字，杀手模板，地图名称，地图ID，世界坐标x，世界坐标y，地图坐标x，地图坐标y）
function createKillerData()

	--获取杀手姓名
	local nSurnameID,nFirstnameID = getKillerNameID();
	local nKillerName = getKillerName(nSurnameID,nFirstnameID);
	
	--保存杀手姓名ID
	SetTask(TASK_KILLER_SURNAME_ID,nSurnameID);
	SetTask(TASK_KILLER_FIRSTNAME_ID,nFirstnameID);
	
	--获取玩家任务等级区间
	local nLevel = selectLevelArea();
	
	--获取杀手模板
	local nKillerModeID = getKillerID(nLevel);
	local nKillerMode = getKillerMode(nKillerModeID);
	
	--保存杀手模板ID
	SetTask(TASK_KILLER_NPCMODE_ID,nKillerModeID);	
	
	--获取地图相关信息
	local nKillerPosID = getPosID(nLevel);
	local nMapName,nMapID,nWx,nWy,nMx,nMy = getPosData(nKillerPosID);
	
	--保存地图ID
	SetTask(TASK_KILLER_MAP_ID,nKillerPosID);
	
	--记录接或任务日期
	local nStartTime = tonumber(date("%y")..date("%m")..date("%d"));
		
	--保存接获任务的时间
	SetTask(TAKS_KILLER_START_TIME,nStartTime);

		return nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy;
			
end;


--在地图指定地方生成一个杀手
function CreateKiller()

--获取杀手姓名ID
local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
local	nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
--获取杀手姓名
local nKillerName = "S竧 th?"..getKillerName(nSurnameID,nFirstnameID);	

--获取杀手模板ID
local nKillerModeID = GetTask(TASK_KILLER_NPCMODE_ID);			
--获取杀手模板
local nKillerMode = getKillerMode(nKillerModeID);	

--获取地图ID
local nKillerPosID = GetTask(TASK_KILLER_MAP_ID);	
--获取地图相关信息
local nMapName,nMapID,nWx,nWy,nMx,nMy = getPosData(nKillerPosID);
	
--在指定地方产生一个杀手,返回其Npc索引
local nKillerIndex = 0;
local nKillerIndex = CreateNpc(nKillerMode,nKillerName,nMapID,nWx,nWy,-1,1,1,450);

--设置杀手生存时间
local	nAcceptTime = GetTask(TASK_ACCEPT_TIME);
local nNowTime = GetTime();
local nTime = 1800-(nNowTime - nAcceptTime);
	
	if nTime < 0 then
		nTime = 0;
	end;

	SetNpcLifeTime(nKillerIndex,nTime); 

	--设置该Npc杀手脚本
	SetNpcScript(nKillerIndex,"\\script\\task\\killer\\killer_talk.lua");
	
	--删掉该地图触发器
	RemoveTrigger(GetTrigger(600)); 
		
	--保存杀手临时ID
	SetTask(TASK_KILLER_NPCINDEX_ID,nKillerIndex);
	
end;



--根据杀手等级构造杀手同伴等级数组
--返回值：杀手同伴ID数组
function getKillerParLevelArg()

local argKillerParID = {};
local nKillerModeID = GetTask(TASK_KILLER_NPCMODE_ID);
local nRow = tabKillerMode:selectRowNum("KillerID",nKillerModeID);
local nLevel = tonumber(tabKillerMode:getCell(nRow,"Level"));

local i = 0;

	for i=3,tabKillerParMode:getRow() do
		if tonumber(tabKillerParMode:getCell(i,"Level"))==nLevel then
			tinsert(argKillerParID,tonumber(tabKillerParMode:getCell(i,"KillerParID")));
		end;
	end;
	
	return argKillerParID;

end;


--选取一个杀手同伴模板ID
function getKillerParModeID()

local argKillerParID = getKillerParLevelArg();
local nKillerParID = argKillerParID[random(1,getn(argKillerParID))];

	SetTask(TASK_KILLER_PAR_NPCINDEX_ID,nKillerParID);

	return nKillerParID;
	
end;

--获取杀手同伴模板名称
function getKillerParMode(nKillerParID)

local nRow = tabKillerParMode:selectRowNum("KillerParID",nKillerParID);
local nKillerParModeName = tabKillerParMode:getCell(nRow,"KillerParMode");

	return nKillerParModeName;
	
end;


--通过杀手令牌获取药品奖励
function AwardMedicine()

local nLevel = selectLevelArea();
local argMedicineID = getAwardMedicineArg(nLevel);

local i = 1;
local nKind = 2;--奖励药品种类为2种
local argAwardID = {};
local n = 0;
local j = 0;
local nRow = 0;
local argAwardData = {};
local k = 0;
local nG = 0;
local nD = 0;
local nP = 0;
local nNum = 0;
	
	k = random(1,getn(argMedicineID));
	nRow = tabAwardMedicine:selectRowNum("MedicineID",argMedicineID[k]);

	nG = tonumber(tabAwardMedicine:getCell(nRow,"Genre"));
	nD = tonumber(tabAwardMedicine:getCell(nRow,"Detail"));
	nP = tonumber(tabAwardMedicine:getCell(nRow,"Particular"));
	nNum = random(tonumber(tabAwardMedicine:getCell(nRow,"MinNum")),tonumber(tabAwardMedicine:getCell(nRow,"MaxNum")));
		
	AddItem(nG,nD,nP,nNum,1);
		
end;


--构造药品奖励数组
--返回一个药品ID数组
function getAwardMedicineArg(nLevel)

local argMidicineID = {};
local i = 0;
local nNum = tabAwardMedicine:getRow();

	for i=3,nNum do
		if tonumber(tabAwardMedicine:getCell(i,"Level"))==nLevel then
			tinsert(argMidicineID,tonumber(tabAwardMedicine:getCell(i,"MedicineID")));
		end;
	end;

	return argMidicineID; 

end;  


--根据玩家等级构造顶级杀手ID数组
--返回值：杀手ID数组
function getTopKillerLevelArg(nLevel)

local i = 0;
local argTopKillerID = {};
local nNum = tabTopKillerMode:getRow();


	for i=3,nNum do
		if tonumber(tabTopKillerMode:getCell(i,"Level"))==nLevel then
			tinsert(argTopKillerID,tonumber(tabTopKillerMode:getCell(i,"KillerTopID")));
		end;
	end;
	
	return argTopKillerID;

end;

--获取顶级杀手模板ID
function getTopKillerID(nLevel)

local argTopKillerID = getTopKillerLevelArg(nLevel);
local nTopKillerID = argTopKillerID[random(1,getn(argTopKillerID))];

	return nTopKillerID;
	
end;

--获取顶级杀手模板名字
function getTopKillerMode(nTopKillerID)

local nRow = tabTopKillerMode:selectRowNum("KillerTopID",nTopKillerID);
local nTopKillerMode = tabTopKillerMode:getCell(nRow,"KillerTopMode");

	return nTopKillerMode;
	
end;


--获取顶级杀手相关信息
--依次返回：杀手名，杀手模板名
function GetTopKillerData()

	--获取顶级杀手姓名
	local nSurnameID,nFirstnameID = getKillerNameID();
	local nTopKillerName = getKillerName(nSurnameID,nFirstnameID);
	
	if nTopKillerName ~= nil then
		nTopKillerName = "S竧 th?u m鬰"..nTopKillerName;
	else
		nTopKillerName = "S竧 th?u m鬰"
	end

	--获取玩家等级区域
	local nLevel = selectLevelArea();
	
	if nLevel < 40 then
		nLevel = 40;
	end; 

	--获取顶级杀手模板ID及模板名
	local nTopKillerID = getTopKillerID(nLevel);
	local nTopKillerMode = getTopKillerMode(nTopKillerID);
	
		return nTopKillerName,nTopKillerMode
		 
end;

--杀死杀手的奖励
function KillerAward()

local nLevel = GetTask(TASK_PLAYER_LEVEL);
local nRow = tabTaskPay:selectRowNum("Level",nLevel);
--local nExp = tonumber(tabTaskPay:getCell(nRow,"Exp"));
local nExp = GetTask(TASK_PLAYER_LEVEL)*GetTask(TASK_PLAYER_LEVEL)*1.5;
--local nMoney = tonumber(tabTaskPay:getCell(nRow,"Money"));
local nMoney = sqrt(nLevel)*400;
local nReputation = random(3,5);
	ModifyExp(multiple_reward(SYS_KILLER_TASK, nExp));
	Earn(nMoney);
	ModifyReputation(nReputation,0);
	-----------------圣诞活动---------------------
		Xmas_prize_get(4)
	--------------------结束------------------------
end;

--获取地图触发器ID
function GetTriggerID(nMapID)
local nRow = tabTriggerID:selectRowNum("PosID",nMapID);
local nTriggerID = tonumber(tabTriggerID:getCell(nRow,"TriggerID"));
local nCustomID = tonumber(tabTriggerID:getCell(nRow,"CustomID"));

	return nTriggerID,nCustomID;
	
end;


--杀手任务计时器,指定时间（900）内没有到达指定地图则任务失败
function TimeOut()

	RemoveTrigger(GetTrigger(600));
	RemoveTrigger(GetTrigger(500));
	
	TaskTip("时间到杀手任务失败!");
	TaskPunish();
	
	SetTask(TASK_KILLER_STATE_STAR,0);
	SetTask(TASK_KILLER_STATE_ID,0);
	
	DelItem(2,0,338,1,1);

end;

-- 任务的惩罚
function TaskPunish()

local nReputation = GetReputation();

-- 减少声望 2 点

	if nReputation < 2 then
		if nReputation >= 0 then
			ModifyReputation(-nReputation,0);
		end
	else
		ModifyReputation(-2,0);
	end

	Msg2Player("胆小鬼，任务取消了，所以扣你2点声望!");
	TaskTip("胆小鬼，任务取消了，所以扣你2点声望!");

end;

-- 获取玩家积分系数
function GetPointCoefficient()
	local nLevel = GetTask(TASK_PLAYER_LEVEL);
	local nTaskLevel = floor(nLevel/10)*10
	local nLevelCoefficient = 0;
		if nLevel-nTaskLevel > 5 then	
			nTaskLevel = nTaskLevel + 5;
		end;
		
		if nTaskLevel~=0  then
			nLevelCoefficient = KillerPointData[nTaskLevel][1];
		end;
	
	if nLevelCoefficient~=nil then

	end
	
		return 	nLevelCoefficient 
end;

--把一个秒数转换为时：分：秒
function TurnTime(nSec)

local nHour = floor(nSec/3600);
local nMinute = floor(mod(nSec,3600)/60); 
local nSecond = floor(mod((mod(nSec,3600)),60));
local str = "";

	str = " <color=yellow>"..nHour.."<color> 小时<color=yellow>"..nMinute.."<color> 分 <color=yellow>"..nSecond.."<color> 秒 ";
	
	return str

end

--获取当前星期，返回0～6（星期天～星期六）
function GetWeekDay()
	return tonumber(date("%w"))
end;

--返回当前小时和分钟
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--周一至周四20点 - 24点
function CheckTime()

	local nWeek = GetWeekDay();
	if nWeek == 5 or nWeek == 6 or nWeek ==0 then
		return 0
	end;

	--换算20:01 ～ 23:59
	local nBegin = 20 * 60 + 1;
	local nEnd = 23 * 60 + 59;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;

function SetTaskSayColor(str)

	local strKey = ":";
	local strKeyLeft = "{";
	local strKeyRight = "}";
	local strKeySex = "<sex>";
	local strPoint = strfind(str,strKey,1)
	local strName = "";
	local strColorText = str;
	
	local strSexChange = GetPlayerSex();
	
	if strPoint~=nil and strPoint>=1 then 
		strName = strsub(str, 1, strPoint-1);
		-- 处理人物名称颜色
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- 处理重点标识颜色
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- 处理性别标识
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", SetTaskSayColor(strSay[1]))..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- 子函数，用于扩展对话 TALK 函数的功能
function TalkEx(fun,szMsg)

	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[i]))..","
	end
	szmsg = szmsg..format("%q",SetTaskSayColor(szMsg[num]))
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"

	dostring(szmsg)
	
end

-- 子函数，用以获取玩家的性别，直接返回字符串
function GetPlayerSex()

local mySex -- 用以显示人物性别的字符

	if (GetSex() == 1) then
		mySex = "Чi hi謕"
	elseif (GetSex() == 2) then
		mySex = "N?hi謕 "
	end
	
	return mySex
	
end


-- 什么也不做的空函数
function Task_Exit()

end;


