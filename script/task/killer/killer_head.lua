-- ====================== �ļ���Ϣ ====================== 
                                                          
-- ������ԵonlineII ͨ������ͷ�ļ�                  
-- Edited by starry night                                 
-- 2005/09/05 PM 16:21                                    
                                                          
-- ======================================================

--��ȡ���֧��
Include("\\script\\class\\ktabfile.lua");
--�Ի�����֧��
--Include("\\script\\\task\\world\\task_head.lua");
-- �ַ��������ܿ�
Include("\\script\\lib\\string.lua");
Include("\\script\\shinynight_head.lua");
--2006��ʥ���ڻ����֧��
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

--����������ز���

TASK_KILLER_STATE_ID        = 1100; -- ͨ������״̬
TASK_KILLER_MAP_ID          = 1101; -- ��ͼID
                            
TASK_KILLER_NPCMODE_ID      = 1102; -- ɱ��ģ��ID
TASK_KILLER_SURNAME_ID      = 1103; -- ɱ����ID
TASK_KILLER_FIRSTNAME_ID    = 1104; -- ɱ����ID
                            
TASK_KILLER_NPCINDEX_ID     = 1105; -- ��ʱ���ɵ�ɱ������
TASK_KILLER_PAR_NPCINDEX_ID = 1106; -- ��ʱ���ɵ�ɱ��ͬ������
TASK_KILLER_STATE_STAR      = 1107; -- ͨ�����񿪹� 1 Ϊ��ʼ��0 Ϊ�ر�
TASK_KILLER_DONUM           = 1108; -- ������ͨ���������                          
TAKS_KILLER_START_TIME      = 1109; -- ��¼��ҿ�ʼ�����ʱ�䣨���ڣ�
TASK_PLAYER_LEVEL						= 1110; -- ��ҽӻ�����ʱ�ĵȼ�
TASK_TRIGGER_ID             = 1111; -- ��¼����ɱ�ֵĵ�ͼ������ID
TASK_ACCEPT_TIME            = 1112; -- ��¼��ҽӻ������ʱ�䣨��1970�����񾭹���������
TASK_KILLER_DONUM_LIMIT     = 1113; -- ��¼�õ�ͼ��������ҽӻ��������
TASK_USEYANHUO_TIME         = 1114; -- ��¼ʹ�ô����̻��ʱ��
TASK_POINT_TOTAL            = 1115; -- ��¼���ͨ���������

TASK_TRIGGER_RECT           = 600;  -- ɱ�ֵĵ�ͼ������
TASK_TRIGGER_TIME           = 500;  -- ɱ�ּ�ʱ��

--��ͷ���ڵĵ�ͼ��Ϣ
BuTouMapData = {
	
	[1]={100,"Ȫ��"},
	[2]={150,"����"},
	[3]={200,"�꾩"},
	[4]={300,"�ɶ�"},
	[5]={350,"����"},
	 
}

--ͨ���������ϵ���ȼ���Ӧ��
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

--����ɱ������
--���أ�ɱ����ID��ɱ����ID
function getKillerNameID()

local nXRow = tabKillerSurname:getRow();
local nMRow = tabKillerFirstname:getRow();
local nSurnameID = tonumber(tabKillerSurname:getCell(random(3,nXRow),"SurnameID"));
local nFirstnameID = tonumber(tabKillerFirstname:getCell(random(3,nMRow),"FirstnameID"));
	
	return nSurnameID,nFirstnameID;

end;


--����ɱ������ID��ȡɱ������
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


--������ҵȼ�ѡȡ����ȼ����������䣩
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


--������ҵȼ�����ɱ�ֵȼ�����
--����ֵ��ɱ��ID����
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

 
--������ҵȼ�ѡѡȡ������һ��ɱ��ģ��ID
function getKillerID(nLevel)

local argKillerID = getKillerLevelArg(nLevel);
local nKillerModeID = argKillerID[random(1,getn(argKillerID))];
	
	return nKillerModeID;

end;


--����ɱ��ģ��ID����һ��ɱ��ģ������
function getKillerMode(nKillerModeID)

local nRow = tabKillerMode:selectRowNum("KillerID",nKillerModeID);
local nKillerMode = tabKillerMode:getCell(nRow,"KillerMode");
	
	return nKillerMode;

end;


--������ҵȼ������ͼ�ȼ�����
--����ֵ����ͼID����
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


--������ҵȼ�����һ����ͼID
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
	

--���ݵ�ͼID��ȡ��ͼ�����Ϣ
--����ͼ������ͼ��ID����������X����������Y����ͼ����x����ͼ����y��
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


--����һ��ɱ��
--���أ�ɱ�����֣�ɱ��ģ�壬��ͼ���ƣ���ͼID����������x����������y����ͼ����x����ͼ����y��
function createKillerData()

	--��ȡɱ������
	local nSurnameID,nFirstnameID = getKillerNameID();
	local nKillerName = getKillerName(nSurnameID,nFirstnameID);
	
	--����ɱ������ID
	SetTask(TASK_KILLER_SURNAME_ID,nSurnameID);
	SetTask(TASK_KILLER_FIRSTNAME_ID,nFirstnameID);
	
	--��ȡ�������ȼ�����
	local nLevel = selectLevelArea();
	
	--��ȡɱ��ģ��
	local nKillerModeID = getKillerID(nLevel);
	local nKillerMode = getKillerMode(nKillerModeID);
	
	--����ɱ��ģ��ID
	SetTask(TASK_KILLER_NPCMODE_ID,nKillerModeID);	
	
	--��ȡ��ͼ�����Ϣ
	local nKillerPosID = getPosID(nLevel);
	local nMapName,nMapID,nWx,nWy,nMx,nMy = getPosData(nKillerPosID);
	
	--�����ͼID
	SetTask(TASK_KILLER_MAP_ID,nKillerPosID);
	
	--��¼�ӻ���������
	local nStartTime = tonumber(date("%y")..date("%m")..date("%d"));
		
	--����ӻ������ʱ��
	SetTask(TAKS_KILLER_START_TIME,nStartTime);

		return nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy;
			
end;


--�ڵ�ͼָ���ط�����һ��ɱ��
function CreateKiller()

--��ȡɱ������ID
local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
local	nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
--��ȡɱ������
local nKillerName = "S�t th?"..getKillerName(nSurnameID,nFirstnameID);	

--��ȡɱ��ģ��ID
local nKillerModeID = GetTask(TASK_KILLER_NPCMODE_ID);			
--��ȡɱ��ģ��
local nKillerMode = getKillerMode(nKillerModeID);	

--��ȡ��ͼID
local nKillerPosID = GetTask(TASK_KILLER_MAP_ID);	
--��ȡ��ͼ�����Ϣ
local nMapName,nMapID,nWx,nWy,nMx,nMy = getPosData(nKillerPosID);
	
--��ָ���ط�����һ��ɱ��,������Npc����
local nKillerIndex = 0;
local nKillerIndex = CreateNpc(nKillerMode,nKillerName,nMapID,nWx,nWy,-1,1,1,450);

--����ɱ������ʱ��
local	nAcceptTime = GetTask(TASK_ACCEPT_TIME);
local nNowTime = GetTime();
local nTime = 1800-(nNowTime - nAcceptTime);
	
	if nTime < 0 then
		nTime = 0;
	end;

	SetNpcLifeTime(nKillerIndex,nTime); 

	--���ø�Npcɱ�ֽű�
	SetNpcScript(nKillerIndex,"\\script\\task\\killer\\killer_talk.lua");
	
	--ɾ���õ�ͼ������
	RemoveTrigger(GetTrigger(600)); 
		
	--����ɱ����ʱID
	SetTask(TASK_KILLER_NPCINDEX_ID,nKillerIndex);
	
end;



--����ɱ�ֵȼ�����ɱ��ͬ��ȼ�����
--����ֵ��ɱ��ͬ��ID����
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


--ѡȡһ��ɱ��ͬ��ģ��ID
function getKillerParModeID()

local argKillerParID = getKillerParLevelArg();
local nKillerParID = argKillerParID[random(1,getn(argKillerParID))];

	SetTask(TASK_KILLER_PAR_NPCINDEX_ID,nKillerParID);

	return nKillerParID;
	
end;

--��ȡɱ��ͬ��ģ������
function getKillerParMode(nKillerParID)

local nRow = tabKillerParMode:selectRowNum("KillerParID",nKillerParID);
local nKillerParModeName = tabKillerParMode:getCell(nRow,"KillerParMode");

	return nKillerParModeName;
	
end;


--ͨ��ɱ�����ƻ�ȡҩƷ����
function AwardMedicine()

local nLevel = selectLevelArea();
local argMedicineID = getAwardMedicineArg(nLevel);

local i = 1;
local nKind = 2;--����ҩƷ����Ϊ2��
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


--����ҩƷ��������
--����һ��ҩƷID����
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


--������ҵȼ����춥��ɱ��ID����
--����ֵ��ɱ��ID����
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

--��ȡ����ɱ��ģ��ID
function getTopKillerID(nLevel)

local argTopKillerID = getTopKillerLevelArg(nLevel);
local nTopKillerID = argTopKillerID[random(1,getn(argTopKillerID))];

	return nTopKillerID;
	
end;

--��ȡ����ɱ��ģ������
function getTopKillerMode(nTopKillerID)

local nRow = tabTopKillerMode:selectRowNum("KillerTopID",nTopKillerID);
local nTopKillerMode = tabTopKillerMode:getCell(nRow,"KillerTopMode");

	return nTopKillerMode;
	
end;


--��ȡ����ɱ�������Ϣ
--���η��أ�ɱ������ɱ��ģ����
function GetTopKillerData()

	--��ȡ����ɱ������
	local nSurnameID,nFirstnameID = getKillerNameID();
	local nTopKillerName = getKillerName(nSurnameID,nFirstnameID);
	
	if nTopKillerName ~= nil then
		nTopKillerName = "S�t th?��u m�c"..nTopKillerName;
	else
		nTopKillerName = "S�t th?��u m�c"
	end

	--��ȡ��ҵȼ�����
	local nLevel = selectLevelArea();
	
	if nLevel < 40 then
		nLevel = 40;
	end; 

	--��ȡ����ɱ��ģ��ID��ģ����
	local nTopKillerID = getTopKillerID(nLevel);
	local nTopKillerMode = getTopKillerMode(nTopKillerID);
	
		return nTopKillerName,nTopKillerMode
		 
end;

--ɱ��ɱ�ֵĽ���
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
	-----------------ʥ���---------------------
		Xmas_prize_get(4)
	--------------------����------------------------
end;

--��ȡ��ͼ������ID
function GetTriggerID(nMapID)
local nRow = tabTriggerID:selectRowNum("PosID",nMapID);
local nTriggerID = tonumber(tabTriggerID:getCell(nRow,"TriggerID"));
local nCustomID = tonumber(tabTriggerID:getCell(nRow,"CustomID"));

	return nTriggerID,nCustomID;
	
end;


--ɱ�������ʱ��,ָ��ʱ�䣨900����û�е���ָ����ͼ������ʧ��
function TimeOut()

	RemoveTrigger(GetTrigger(600));
	RemoveTrigger(GetTrigger(500));
	
	TaskTip("ʱ�䵽ɱ������ʧ��!");
	TaskPunish();
	
	SetTask(TASK_KILLER_STATE_STAR,0);
	SetTask(TASK_KILLER_STATE_ID,0);
	
	DelItem(2,0,338,1,1);

end;

-- ����ĳͷ�
function TaskPunish()

local nReputation = GetReputation();

-- �������� 2 ��

	if nReputation < 2 then
		if nReputation >= 0 then
			ModifyReputation(-nReputation,0);
		end
	else
		ModifyReputation(-2,0);
	end

	Msg2Player("��С������ȡ���ˣ����Կ���2������!");
	TaskTip("��С������ȡ���ˣ����Կ���2������!");

end;

-- ��ȡ��һ���ϵ��
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

--��һ������ת��Ϊʱ���֣���
function TurnTime(nSec)

local nHour = floor(nSec/3600);
local nMinute = floor(mod(nSec,3600)/60); 
local nSecond = floor(mod((mod(nSec,3600)),60));
local str = "";

	str = " <color=yellow>"..nHour.."<color> Сʱ<color=yellow>"..nMinute.."<color> �� <color=yellow>"..nSecond.."<color> �� ";
	
	return str

end

--��ȡ��ǰ���ڣ�����0��6�������졫��������
function GetWeekDay()
	return tonumber(date("%w"))
end;

--���ص�ǰСʱ�ͷ���
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--��һ������20�� - 24��
function CheckTime()

	local nWeek = GetWeekDay();
	if nWeek == 5 or nWeek == 6 or nWeek ==0 then
		return 0
	end;

	--����20:01 �� 23:59
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
		-- ��������������ɫ
		strColorText = "<color=green>"..strName.."<color>"..strsub(str, strPoint, strlen(str));
	end;
			
	-- �����ص��ʶ��ɫ
	strColorText = join(split(strColorText,strKeyLeft), "<color=yellow>");
	strColorText = join(split(strColorText,strKeyRight), "<color>");
	
	-- �����Ա��ʶ
	strColorText = join(split(strColorText,strKeySex), strSexChange);
	
	str = strColorText;
	return str;
	
end;


-- ���ڴ���һ��ѡ��ĶԻ����� Say(""...);
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


-- �Ӻ�����������չ�Ի� TALK �����Ĺ���
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

-- �Ӻ��������Ի�ȡ��ҵ��Ա�ֱ�ӷ����ַ���
function GetPlayerSex()

local mySex -- ������ʾ�����Ա���ַ�

	if (GetSex() == 1) then
		mySex = "��i hi�p"
	elseif (GetSex() == 2) then
		mySex = "N?hi�p "
	end
	
	return mySex
	
end


-- ʲôҲ�����Ŀպ���
function Task_Exit()

end;


