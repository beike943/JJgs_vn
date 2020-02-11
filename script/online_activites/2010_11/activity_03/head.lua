Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online_activites\\trigger_IDs.lua");
Include("\\script\\lib\\globalfunctions.lua");

GT_mapIDs = 
{
	108, --ÈªÖÝ¸®±±
	205, --±å¾©¸®¶«
	406, --ÎäÁêÉ½
}

GT_gatheredCountTaskIDTable = 
{
	VET_201011_03_TASK_GATHERED_COUNT1,
	VET_201011_03_TASK_GATHERED_COUNT2,
	VET_201011_03_TASK_GATHERED_COUNT3,
	VET_201011_03_TASK_GATHERED_COUNT4
}

GT_hasExchangedTaskIDTable = 
{
	VET_201011_03_TASK_EXCHANGED1,
	VET_201011_03_TASK_EXCHANGED2,
	VET_201011_03_TASK_EXCHANGED3,
	VET_201011_03_TASK_EXCHANGED4
}

GT_currentGatherIndexTempTaskID = VET_201011_03_TASK_TEMP_GATHER_INDEX;
GT_triggerIndexTempTaskID = VET_201011_03_TASK_TEMP_TRIGGER_INDEX;

GT_sunflowerID = {2, 1, 30250};
GT_sunflowerCount = 50;

GT_exchangeTable = 
{
	{{2, 1, 30263}, 300, GT_sunflowerID, GT_sunflowerCount, "Gç"},
	{{2, 1, 30261}, 300, GT_sunflowerID, GT_sunflowerCount, "§¸"},
	{{2, 1, 30262}, 180, GT_sunflowerID, GT_sunflowerCount, "Lóa"},
	{{2, 1, 30260}, 180, GT_sunflowerID, GT_sunflowerCount, "S¾t"},
}

GT_limitTable = 
{
	300,
	300,
	180,
	180
}

function GT_isValidMap()
	local mapID = GetWorldPos();
	--WriteLog("GT_isValidMap::map ID: "..mapID);
	for i=1, getn(GT_mapIDs) do
		if mapID == GT_mapIDs[i] then
			return 1;
		end
	end
	return 0;
end

function GT_setCurrentGatherIndex(index)
	SetTaskTemp(GT_currentGatherIndexTempTaskID, index);
end

function GT_getCurrentGatherIndex()
	local result = GetTaskTemp(GT_currentGatherIndexTempTaskID);
	if nil == result then
		result = 0;
	end
	return result;
end

function GT_getGatheredCount(index)
	local result = GetTask(GT_gatheredCountTaskIDTable[index]);
	if nil == result then
		result = 0;
	end
	return result;
end

function GT_addGatheredCount(index)
	SetTask(GT_gatheredCountTaskIDTable[index], GetTask(GT_gatheredCountTaskIDTable[index])+1);
end

function GT_gatheredCountLimited(index)
	--WriteLog("GT_gatheredCountLimited::index: "..index..", GT_getGatheredCount(index): "..GT_getGatheredCount(index));
	if GT_limitTable[index] <= GT_getGatheredCount(index) then
		return 1;
	else
		return 0;
	end
end

function GT_doGather(index)
	local gatherMap = 
	{
		1,
		5,
		3,
		4
	}
	if 1 == GT_isValidMap() then
		if 1 == GT_gatheredCountLimited(index) then
			--WriteLog("GT_doGather::gather count limited");
			Msg2Player("Sè lÇn thu thËp vËt phÈm nµy cña b¹n ®· ®¹t giíi h¹n trong ngµy h«m nay");
			return 0;
		else
			GT_setCurrentGatherIndex(index);
			StartFakeGathering(gatherMap[index]);
			--TODO: how to guarantee customID is unique?
			local triggerIndex = CreateTrigger(1, 1504, TD_GATHER_TRIGGER_ID);
			--WriteLog("GT_doGather::created trigger{"..triggerIndex.."}");
			if 0 ~= triggerIndex then
				SetTaskTemp(GT_triggerIndexTempTaskID, triggerIndex);
				SetTimerType(triggerIndex, 0);
				SetTimerCount(triggerIndex, 5);
				ContinueTimer(triggerIndex);
			end
			return 1;
		end
	else
		--WriteLog("invalid gather map");	
		return 0;
	end
end

function GT_onStoppingFakeGathering()
	GT_cancelGatherLogic();
end

function GT_cancelGatherLogic()
	GT_setCurrentGatherIndex(0);
	local triggerIndex = GetTaskTemp(GT_triggerIndexTempTaskID);
	if 0 < triggerIndex then
		--WriteLog("GT_cancelGatherLogic::remove trigger{"..triggerIndex.."}");
		RemoveTrigger(triggerIndex);
	end
end

function GT_cancelGather()
	StopFakeGathering();
	GT_cancelGatherLogic();
end

function GT_giveItem()
	--WriteLog("GT_giveItem::called");
	local cgi = GT_getCurrentGatherIndex();
	local triggerIndex = GetTaskTemp(GT_triggerIndexTempTaskID);
	--WriteLog("GT_giveItem::cig: "..cgi..", triggerIndex: "..triggerIndex);		
	if 0 < cgi then
		if 0 == GT_gatheredCountLimited(cgi) then
			local itemID = {GT_exchangeTable[cgi][1][1], GT_exchangeTable[cgi][1][2], GT_exchangeTable[cgi][1][3], 1};
			local itemName = GT_exchangeTable[cgi][5];
			gf_AddItemEx2(itemID, itemName, "gather event", "gather");
			GT_addGatheredCount(cgi);
		else
			GT_cancelGather();
		end;
	end
end

function GT_onTimer()
	GT_giveItem()
end

function GT_dayBegin()
	for i=1, getn(GT_hasExchangedTaskIDTable) do
		SetTask(GT_hasExchangedTaskIDTable[i], 0);
	end
	for i=1, getn(GT_gatheredCountTaskIDTable) do
		SetTask(GT_gatheredCountTaskIDTable[i], 0);
	end
end

function GT_hasExchanged(index)
	return GetTask(GT_hasExchangedTaskIDTable[index]);
end

function GT_isEnoughResource(index)
	if GT_exchangeTable[index][2] > GetItemCount(GT_exchangeTable[index][1][1], GT_exchangeTable[index][1][2], GT_exchangeTable[index][1][3]) then
		return 0;
	else 
		return 1;
	end
end

function GT_exchange(index)
	--WriteLog("GT_exchange::index: "..index);
	if 0 == GT_isEnoughResource(index) then
		return 0;
	else 
		local exchangeTable = {
			{GT_exchangeTable[index][5], GT_exchangeTable[index][1][1], GT_exchangeTable[index][1][2], GT_exchangeTable[index][1][3], GT_exchangeTable[index][2]},
			{"Hoa H­íng D­¬ng", 100, {"Hoa H­íng D­¬ng", {GT_exchangeTable[index][3][1], GT_exchangeTable[index][3][2], GT_exchangeTable[index][3][3], GT_exchangeTable[index][4]}}}
		};	
		if 1 == gf_ExchangeItemEx(exchangeTable, "gather", "exchange") then
			SetTask(GT_hasExchangedTaskIDTable[index], 1);
		end;
	end
end
