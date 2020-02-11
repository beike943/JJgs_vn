Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");
Include("\\script\\global\\action_bar_callback.lua");

XT_TRIGGER_ID1 = 1507;
XT_TRIGGER_ID2 = FG_TRIGGER_ID;

--timer count的值很奇怪, 应该是5s by SunZhuoshi
XT_TIMER_COUNT1 = 3;
XT_TEMP_TASK_KEY_GATHER_TREE_INDEX = FG_TEMP_TASK_KEY_GATHER_TREE_INDEX;
XT_GATHER_TIME = 30;

function XT_OnPlayerGathering()
	FG_RemoveTrigger();
	local chance = random(1, 100);
	local npcIndex = GetTaskTemp(XT_TEMP_TASK_KEY_GATHER_TREE_INDEX);
	local mapID, x, y = GetNpcWorldPos(npcIndex);
	--WriteLog("XT_OnPlayerGathering::GetName(): "..GetName()..", npcIndex: "..npcIndex..", mapID: "..mapID..", x: "..x..", y: "..y..", chance: "..chance);
	if 25 >= chance then
		FG_SpawnMonsters(mapID, x, y);
	end
end

function main()
	do	return	end
	--WriteLog("main::GetName(): "..GetName());
	local npcIndex = GetTargetNpc();
	--WriteLog("main::npcIndex: "..npcIndex);
	local gatherState = FG_GetTreeGatherState(npcIndex);
	if 1 == gatherState then
		local oldGatherTreeIndex = GetTaskTemp(XT_TEMP_TASK_KEY_GATHER_TREE_INDEX);
		if npcIndex == oldGatherTreeIndex then
			--重复点击
		else
			Msg2Player("Thao t竎 th蕋 b筰, nh鱪g ngi ch琲 kh竎 產ng thu th藀 c﹜ n祔");
		end
		return
	elseif 0 == gatherState then
		FG_SetTreeGatherState(npcIndex, 1);
		DoWait(22, 23, XT_GATHER_TIME);
		--WriteLog("main::save temp npcIndex: "..npcIndex);
		SetTaskTemp(XT_TEMP_TASK_KEY_GATHER_TREE_INDEX, npcIndex);
		local triggerIndex = CreateTrigger(1, XT_TRIGGER_ID1, XT_TRIGGER_ID2);
		SetTimerType(triggerIndex, 0);
		SetTimerCount(triggerIndex, XT_TIMER_COUNT);
		ContinueTimer(triggerIndex);
	end
end


