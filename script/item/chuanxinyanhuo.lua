-- ====================== 文件信息 ====================== 
                                                          
-- 剑侠情缘onlineII 通缉任务传信烟火文件                 
-- Edited by starry night                                 
-- 2005/11/28 PM 17:40                                    
                                                          
-- ======================================================

--引用通缉任务头文件
Include("\\script\\task\\killer\\killer_head.lua");

function OnUse() 

	local nMapID = GetWorldPos();
	
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog","在比较的情况下，不允许使用这个对象.")
		return
	end	

	if GetFightState() == 1 and nMapID < 700 then
		Say("你确定要叫一个杀手来帮你吗?",
				2,
				"是/yes",
				"不需要/no")
	else
		Talk(1,"","你只能在城外使用这个物品");
	
	end;
end;

function yes()
	if GetPKEnmityState() > 0 then
		Talk(1,"end_dialog","在比较的情况下，不允许使用这个对象")
		return
	end	
	if GetFightState() ~= 1 then
		Talk(1,"","你只能在城外使用这个物品");
		return
	end

	local nLastUseTime = GetTask(TASK_USEYANHUO_TIME);
	local nNowTime = GetTime();
	local nTime = nNowTime - nLastUseTime;
	local nRemainTime = nTime;
	local strTime = "";
		
		nTime = 900 - nTime;
		
		if nTime < 0 then
			nTime = 0;
		end;
		
		strTime = TurnTime(nTime);
		
		if nRemainTime < 900 then
			Say("不能连续使用这个物品，限制<color=yellow>15<color>分钟(剩余时间"..strTime..")",0);
			return
		end;
	
	local nDelOk = DelItem(2,1,203,1,1);
	
		if nDelOk ~=1 then 
			return
		end;
		
		DoFireworks(808,1);--烟花效果
	
	local nTopKillerName,nTopKillerMode = GetTopKillerData();
	local nMapID,nWx,nWy = GetWorldPos(); 
	local nTopKillerIndex = CreateNpc(nTopKillerMode,nTopKillerName,nMapID,nWx,nWy,-1,1,1,100);
	
		SetTask(TASK_USEYANHUO_TIME,nNowTime);
		
		--设置在该地图生成杀手生存时间为一小时	
		SetNpcLifeTime(nTopKillerIndex,3600);  

		--设置顶级杀手脚本
		SetNpcScript(nTopKillerIndex,"\\script\\task\\killer\\killer_talk_top.lua");
		
		TaskTip("必须在60分钟内干掉这个顶级杀手。"); 
	
end;

function no()

end;
