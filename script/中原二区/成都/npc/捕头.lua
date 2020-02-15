-- ====================== 文件信息 ======================             
             
-- 剑侠情缘onlineII 通缉任务实体处理文件             
-- Edited by Starry              
-- 2005/09/05 PM 16:21             
             
-- ======================================================             

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function main()

	local strButouTitle = "<color=green>捕头<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nLevel = GetLevel();
	local nTotalPoint = GetTask(TASK_POINT_TOTAL); 
	
	--积分补偿
	if random(1,20) == 1 then
		NpcChat(GetTargetNpc(),"Nghe n鉯 tr猲 ngi c馻 b鋘 s竧 th?Л阯g c騨g c?Linh Th筩h, thi誹 hi謕 ph秈 theo d鈏 b鋘 ch髇g!");
	end;
	if nTotalPoint == 0 then
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = GetTask(TASK_KILLER_DONUM)*100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);
	end; 
			
	--检查时间是否为周一至周四20点至24点
--	if CheckTime() == 1 then
	if CheckTime() <= 1 then
	
		--接收任务的等级最低为20级
		if nLevel >= 20 then
					
			if task_state == 0 then
				Say(strButouTitle.."衙门办案时间从20点开始",
					4,
					"领取杀手任务/Task_Confirm",
					"任务流程/Task_Show",
					"任务背景/Task_Backdrop",
					"没事了/Taks_Exit");	
			end;
			
			if task_state >= 1 then
			
				local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
				local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
				local nKillerName = getKillerName(nSurnameID,nFirstnameID);	
				local nPosID = GetTask(TASK_KILLER_MAP_ID);
				local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
				Say(strButouTitle.."当前任务是杀死  <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"任务完成/Task_Finish",
					"没事了/Taks_Exit",
					"取消任务/Task_Cancel");		
			end;
		
		else
			Say(strButouTitle.."杀手太厉害，还是等 <color=yellow>20级<color> 以后再来吧!",0)
				
		end;
		
	elseif task_state >= 1 then
			
		local nSurnameID = GetTask(TASK_KILLER_SURNAME_ID);
		local nFirstnameID = GetTask(TASK_KILLER_FIRSTNAME_ID);
		local nKillerName = getKillerName(nSurnameID,nFirstnameID);		
		local nPosID = GetTask(TASK_KILLER_MAP_ID);
		local nMapName,nMapID,nWx,nYx,nMx,nMy = getPosData(nPosID);
				
			Say(strButouTitle.."当前任务是杀死  <color=yellow>"..nMapName.."("..nMx..", "..nMy..")<color>: <color=yellow>"..nKillerName.."<color>?",
					3,
					"任务完成/Task_Finish",
					"没事了/Taks_Exit",
					"取消任务/Task_Cancel");		
	else
		Say(strButouTitle.."<color=yellow>周一<color>到<color=yellow>周四<color>晚<color=yellow>20<color>点到<color=yellow>24<color>点才能领取杀手任务。",
				3,
				"任务流程/Task_Show",
				"任务背景/Task_Backdrop",
				"没事了/Taks_Exit");
	end;
end;

--接受任务
function Task_Confirm()

	local nKillerName = "";
	local nKillerMode = "";
	local nMapName = "";
	local nMapID = 0;
	local nWx,nWy,nMx,nMy = 0,0,0,0;
	local strButouTitle = "<color=green>捕头<color>:";
	local nTriggerID = 0;
	local nCustomID = 0;
	local nTime = 0;
	local nBuTouMapID = GetWorldPos();
	local nTotal_DoNum = 0;
	local i=0;
	local nNowTime = GetTime();
	local nLastTime = GetTask(TASK_ACCEPT_TIME);--获取上一次接获任务时间
	local nCoolTime = 300 - (nNowTime-nLastTime);
			if nLastTime == nil or nCoolTime < 0 then
				nCoolTime = 0;
			end;
	local strCoolTime = TurnTime(nCoolTime);
	
	--根据地点读取该地点目前接获通缉任务的人数
--	if nBuTouMapID == 100 then nTotal_DoNum = GetMapTaskTemp(100,1);i=1;end;--泉州
--	if nBuTouMapID == 150 then nTotal_DoNum = GetMapTaskTemp(150,1);i=2;end;--扬州
--	if nBuTouMapID == 200 then nTotal_DoNum = GetMapTaskTemp(200,1);i=3;end;--汴京
--	if nBuTouMapID == 300 then nTotal_DoNum = GetMapTaskTemp(300,1);i=4;end;--成都
--	if nBuTouMapID == 350 then nTotal_DoNum = GetMapTaskTemp(350,1);i=5;end;--襄阳
	
--	一天内同一地点捕快出接获任务次数少于100
--	if nTotal_DoNum < 100 then 
		
		--接获任务后需要5分钟方能接下一次任务
		if nCoolTime ~= 0 then
			Talk(1,"",strButouTitle.." 你还需要等待"..strCoolTime.."才能领取任务!")
			return
		end;
		
		--生成一个杀手数据
		nKillerName,nKillerMode,nMapName,nMapID,nWx,nWy,nMx,nMy = createKillerData();
				
		SetTask(TASK_KILLER_STATE_ID,1);--接受一个通缉任务，置变量为 1
		--SetMapTaskTemp(nBuTouMapID,1,nTotal_DoNum+1);--记录一天内容易地点捕快接获任务次数
		SetTask(TASK_PLAYER_LEVEL,GetLevel());--记录玩家接获任务时的等级
		
		--nTotal_DoNum = GetMapTaskTemp(BuTouMapData[i][1],1);
		
		Say(strButouTitle.."杀手:<color=yellow>"..nKillerName.."<color>在 <color=yellow>"..nMapName.."("..nMx..","..nMy..")<color>. 出现，快去杀了他!",0);--（这是本次该捕头发布的的第<color=yellow>"..nTotal_DoNum.."<color>次任务，每次发布任务数量为<color=yellow>100<color>次。）",0);
		
		--生成时间触发器，计数值为1800
		CreateTrigger(1,400,500);
		ContinueTimer(GetTrigger(500));
		
		--保存当前时间
		nTime = GetTime();--获取1970年至今经过的秒数
		SetTask(TASK_ACCEPT_TIME,nTime);
		
		--生成地图触发器
		nTriggerID,nCustomID = GetTriggerID(nMapID);
		CreateTrigger(2,nTriggerID,600);
		
		--保存地图触发器ID
		SetTask(TASK_TRIGGER_ID,nTriggerID);

		TaskTip("成功领取杀手任务，快去杀了他!");
		
		if GetItemCount(2,0,338) <= 0 then
			AddItem(2,0,338,1,1);
		end;
				
--	else
--		Say(strButouTitle.."<color=yellow>"..BuTouMapData[i][2].."<color>本批通缉名单已发布完毕！",0);
--				 
--	end;
		
end;

--完成任务及奖励配取
function Task_Finish()

	local strButouTitle = "<color=green>捕头<color>:";
	local task_state = GetTask(TASK_KILLER_STATE_ID);
	local nDoNum = GetTask(TASK_KILLER_DONUM);
	
	if task_state == 2 then
		Say(strButouTitle.."任务完成的不错嘛!",0);
		KillerAward();
		SetTask(TASK_KILLER_STATE_ID,0);--完成任务，任务状态置0
		SetTask(TASK_KILLER_DONUM,nDoNum+1);--完成任务，次数加1
		
		--积分累计处理
		local nTotalPoint = GetTask(TASK_POINT_TOTAL);
		local nPointCoefficient = GetPointCoefficient();
			nTotalPoint = nTotalPoint + 100*nPointCoefficient;
		SetTask(TASK_POINT_TOTAL,nTotalPoint);	
		
		--删去通缉令
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;
		-- 师徒任务 （杀手）
		local nChance, nMaxChance = CustomDataRead("mp_shashou")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shashou", "dd", nChance, nMaxChance)
				Msg2Player("Ho祅 th祅h nhi謒 v?s?-s竧 th?"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say(strButouTitle.."别骗我，快去杀了他!",0);
	end;
end;

--取消任务
function Task_Cancel()

local strButouTitle = "<color=green>捕头<color>:";

	Say(strButouTitle.."真的要取消任务?",
	2,
	"再想想/Task_Exit",
	"取消任务/Task_CancelConfirm");
	
end;

--再次确认取消任务
function Task_CancelConfirm()

local strButouTitle = "<color=green>捕头<color>:";

	SetTask(TASK_KILLER_STATE_ID,0);--取消任务，任务状态置0
	SetTask(TASK_KILLER_STATE_STAR,0);
	Say(strButouTitle.."你个胆小鬼!",0);
	
	TaskPunish();

		--删去通缉令
		if GetItemCount(2,0,338) > 0 then
			DelItem(2,0,338,1,1);
		end;	
	
	--删掉该地图触发器
	RemoveTrigger(GetTrigger(600));
	--删掉时间触发器
	RemoveTrigger(GetTrigger(500));
	
end;

--通缉任务流程说明
function Task_Show()

local str1 = "<color=yellow>20级<color>,以上 <color=yellow>20h:00<color> 到 <color=yellow>24h:00<color> 在<color=yellow>捕头<color> 处领取通缉任务。";
local str2 = "玩家领取任务后要在<color=yellow>30 分种<color> 内完成。超时或取消算任务失败。";
local str3 = "无论完成任务、取消任务、任务失败，都要间隔 <color=yellow>5 分种<color> 才能再次领取任务。";

	Talk(3,"",str1,str2,str3);

end;

--通缉任务背景说明
function Task_Backdrop()

local str1 = "...";
local str2 = "...";
local str3 = "...";
	
	Talk(3,"",str1,str2,str3);
	
end;
	
--空函数，不做任何事
function Taks_Exit()

end;
