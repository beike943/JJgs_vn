--´º½ÚÀûÊÇ°ü½Å±¾
Include("\\script\\online\\spring2014\\sp_head.lua")
Include("\\script\\lib\\talktmp.lua")

function OnUse(nItem)
	if sp_IsOpenActivity() ~= 1 then
		return 0;
	end
	if gf_GetPlayerRebornCount() <= 0 and gf_CheckBaseCondition(85) ~= 1 then
			return 0;
	end
	sp_DailyReset();
	local nDayAcc = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.DayAcc);
	local nTimes = 0;
	for i = 1, 7 do
		if sp_GetIsComplete(i) ~= 0 then
			nTimes = nTimes + 1;
		end
	end
	local strMsg = format("HiÖn t¹i ®· tÝch lòy phÇn th­ëng: %d ®iÓm kinh nghiÖm, %d ®iÓm ch©n khÝ, %d qu¶ ph¸o.", 
		(800000+50000*nDayAcc)*nTimes, (100+10*nDayAcc)*nTimes, nDayAcc+nTimes);
	for i = 1, 7 do
		local tCityTable = SP_CITY_TABLE[i];
		if not tCityTable or getn(tCityTable) ~= 2 then
			return 0;
		end
		local tNpcTable = SP_TARGER_NPC_TABLE[i];
		if not tNpcTable or getn(tNpcTable) ~= 5 then
			return 0;
		end
		local nSubIndex = sp_GetWhichNpc(i);
		if nSubIndex < 1 or nSubIndex > 5 then
			return 0;
		end
		local nIsComplete = sp_GetIsComplete(i);
		if nIsComplete == 1 then
			strMsg = strMsg..format("\n<color=green><%d>: cho %s h­íng vÒ %s chóc TÕt <color>", i, tCityTable[2], tNpcTable[nSubIndex]);
		else
			strMsg = strMsg..format("\n<color=white><%d>: cho %s h­íng vÒ %s chóc TÕt <color>", i, tCityTable[2], tNpcTable[nSubIndex]);
		end
	end
	local tSay = {};
	tSay.msg = strMsg;
	tSay.sel = {
		{"NhËn bao l× x× h«m nay", "sp_GetDailyAward"},
		{"KÕt thóc ®èi tho¹i", "nothing"},
	};
	temp_Talk(tSay);
end


function sp_GetDailyAward()
	local bCheck = nil;
	for i = 1, 7 do
		if sp_GetIsComplete(i) == 0 then
			bCheck = 1;
			break;
		end
	end
	if bCheck then
		Talk(1,"","Ng­¬i ch­a hoµn thµnh hÕt nhiÖm vô chóc TÕt, kh«ng thÓ nhËn th­ëng!");
		return 0;
	end
	if SP_TASK_GROUP:GetTask(SP_TASK_GROUP.IsAward) ~= 0 then
		Talk(1,"","Ng­¬i ®· nhËn th­ëng råi");
		return 0;
	end
	if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
		return 0;
	end
	if DelItem(2, 1, 30624, 1) ~= 1 then
		return 0;
	end
	local nDayAcc = SP_TASK_GROUP:GetTask(SP_TASK_GROUP.DayAcc);
	local nExp = 800000+50000*nDayAcc;
	local nZhenQi = 100+10*nDayAcc;
	local nCount = 6+nDayAcc;
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.IsAward, 1);
	SP_TASK_GROUP:SetTask(SP_TASK_GROUP.DayAcc, nDayAcc + 1);
	gf_ModifyExp(nExp*7);
	AwardGenuineQi(nZhenQi*7);
	gf_AddItemEx2({2,1,30625,nDayAcc+7,4}, "Ph¸o N¨m Míi", "Event TÕt Kingsoft", "Bao L× X× N¨m Míi", 0, 1);
end

