Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\nvn\\3v3\\head.lua");
Include("\\script\\missions\\nvn\\3v3\\daymatch.lua");
Include("\\script\\missions\\nvn\\3v3\\perliminary.lua");
Include("\\script\\missions\\nvn\\3v3\\finals.lua");
Include("\\script\\missions\\nvn\\data_mgr.lua")
Include("\\script\\system_switch_config.lua")

function OnP3v3_AddPlayer(battleState)
	DebugOutput("OnP3v3_AddPlayer", battleState);
	local oldPidx = PlayerIndex
	if battleState == BS_DAYMATCH then
		DayMatch:addPlayer();
	elseif battleState == BS_PRELIMINARY then
		Preliminary:addPlayer();
	elseif battleState == BS_FINALS then
		Finals:addPlayer();
	end
	PlayerIndex = oldPidx;
end

function delPlayer()
	DebugOutput("-----delPlayer------");
	local oldPidx = PlayerIndex;
	if GetTeamSize() > 1 then
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			lockEquipment(0);
			P3v3_Leave(1);
		end
	else
		lockEquipment(0);
		P3v3_Leave(1);
	end
	PlayerIndex = oldPidx;
end

function OnP3v3_DelPlayer(battleState)
	DebugOutput("OnP3v3_DelPlayer",battleState);
	local oldPidx = PlayerIndex
	if battleState == BS_DAYMATCH then
		delPlayer();
	elseif battleState == BS_PRELIMINARY then
		delPlayer();
	elseif battleState == BS_FINALS then
		Finals:delPlayer();
	end
	PlayerIndex = oldPidx;
end

function On3v3StartRound(battleState, nTodayRound)
	DebugOutput("On3v3StartRound", battleState, nTodayRound)
	if not nTodayRound then
		nTodayRound = GetRoundToday(callout(On3v3StartRound, battleState));
		if not nTodayRound then return end
	end

	if battleState == BS_DAYMATCH then
		return DayMatch:startARound(nTodayRound);
	elseif  battleState == BS_PRELIMINARY then
		return Preliminary:startARound(nTodayRound);
	elseif  battleState == BS_FINALS then
		return Finals:startARound(nTodayRound);
	end
end 

function checkEquipment()
	local tEquipPos = {0,1,2,3,4,5,6,7,8,9,10,11,17,18,19};
	local tEquipName = {"§Çu","Ngo¹i trang","Vò khÝ","H¹ y","Trang søc 1","Trang søc 2","Ngo¹i trang ®Çu","Th­îng y","Ngo¹i trang","Phã MËt tÞch","M·","MËt tÞch", "¸o Choµng", "Huy HiÖu", "§«i giµy"};
	local szMyHint = "";
	local bTag = 0;
	for i = 1, getn(tEquipPos) do
		nEquipIdx = GetPlayerEquipIndex(tEquipPos[i]);
		if nEquipIdx ~= 0 then
			local nG,nD,nP = GetItemInfoByIndex(nEquipIdx);
			for j = 1, getn(_3V3_EQUIP_BLACKLISTS) do
				if nG == _3V3_EQUIP_BLACKLISTS[j][1] and nD == _3V3_EQUIP_BLACKLISTS[j][2] and nP == _3V3_EQUIP_BLACKLISTS[j][3] then
					szMyHint = szMyHint.."<color=yellow>"..tEquipName[i].."<color> vµo,";
					bTag = 1;
				end
			end
		end
	end
	if bTag == 1 then
		szMyHint = format("Ng­êi ch¬i [%s] trang bÞ kh«ng phï hîp víi quy ®Þnh tØ vâ lµ %s h·y kiÓm tra t×nh tr¹ng trang bÞ cña ng­¬i.", GetName(), szMyHint);
		return 0, szMyHint;
	else
		return 1;
	end
end

function onFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName)
	DebugOutput("OnFinishBattle", winTeamID, loseTeamID, winTeamName, loseTeamName)
	if g_t3v3Data.battleState == BS_DAYMATCH then
		DayMatch:OnFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName);
	elseif g_t3v3Data.battleState == BS_PRELIMINARY then
		Preliminary:onFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName);
	elseif g_t3v3Data.battleState == BS_FINALS then
		Finals:onFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName);
	end
end

function reset3v3()
	OnInit();
end

function reset3v3Timer()
	DebugOutput(date())
	local nHour, nMinute, nSecond = tonumber(date("%H")), tonumber(date("%M")), tonumber(date("%S"));

	-- 15:00 Ô¤Èü
	-- 16:30 ¾öÈü
	-- 20:00 Ô¤Èü
	-- 21:30 ¾öÈü
	nSecond = 60 - nSecond;
	if g_t3v3Data.battleState == BS_PRELIMINARY then
		if nHour < 15 then
			nHour = 14 - nHour;
			nMinute = 59 - nMinute;
		elseif nHour <= 17 then
			nHour = 0;
			nMinute = 5 - mod(nMinute, 5);			
		elseif nHour < 20 then
			nHour = 19 - nHour;
			nMinute = 59 - nMinute;
			nSecond = 60 - nSecond;
		elseif nHour <= 22 then
			nHour = 0;
			nMinute = 4 - mod(nMinute, 5);
		else
			nHour = 24;
			nMinute = 59 - nMinute;
		end
	else
		if nHour < 16 or (nHour == 16 and nMinute < 30) then
			nHour = 16 - nHour;
			nMinute = 29 - nMinute;
			if nMinute < 0 then
				nHour = nHour - 1;
				nMinute = nMinute + 60;
			end
		elseif nHour < 17 then
			nMinute = 5 - mod(nMinute, 5);
		elseif nHour < 21 or (nHour == 21 and nMinute < 30) then
			nHour = 21 - nHour;
			nMinute = 29 - nMinute;
			if nMinute < 0 then
				nHour = nHour - 1;
				nMinute = nMinute + 60;
			end
		elseif nHour < 23 then
			nHour = 0;
			nMinute = 4 - mod(nMinute, 5);
		else
			nHour = 24;
			nMinute = 59 - nMinute;			
		end			
	end
	local nTime = nHour * 3600 + nMinute * 60 + nSecond;
	DebugOutput(format("[3v3 init] vµo lóc %d giê %d phót %d gi©y (%d gi©y) sau khi më!",nHour, nMinute, nSecond, nTime));
	K3v3Hall.SetTimer(nTime * 18);
end

function lockEquipment(bLock)
	bLock = bLock or 1;
	local tbEquipPos = {0,1,2,3,4,5};
	for i=1, getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i], bLock);
	end;
	if bLock == 1 then
		Msg2Player("§· mÆc trang bÞ ®i vµo tr¹ng th¸i khãa");
	elseif bLock == 0 then
		Msg2Player("§· mÆc trang bÞ më tr¹ng th¸i khãa");
	end
end

--KxvxRankData.cpp callback
function _update3v3CurrentMatchRank(RankType, bCrossMatch)
	DebugOutput("_update3v3CurrentMatchRank RankType, bCrossMatch =", RankType, bCrossMatch);
	if bCrossMatch ~= 1 then
		--ÈÕ³£¸üÐÂÅÅÃû
		if 0 == RankType then
			local nLocalRank = GetXvxPlayerRank(0);
			DebugOutput("nLocalRank =", nLocalRank)
			gf_SetMyTaskByte(TASKID_CUR_MATCH_RANK, 1, 2, nLocalRank);
		end
		if 1 == RankType then
			local nGlobalRank = GetXvxPlayerRank(1);
			DebugOutput("nGlobalRank =", nGlobalRank)
			gf_SetMyTaskByte(TASKID_CUR_MATCH_RANK, 3, 4, nGlobalRank);
		end
	else
		--½ÇÉ«¿çÈü¼¾£¬¿Óµù
		DebugOutput("_update3v3CurrentMatchRank CROSSMATCH--->")
		if gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 3) == 1 then
			local s = SDB(SDBKEY_RANK_LOCAL_COPY, 0, 0);
			s:apply2(callout(_update3v3CurrentMatchRankCB, 3));
		end
		if gf_GetTaskByte(TASKID_3V3_AWARD_TAG, 4) == 1 then
			local s = SDB(SDBKEY_RANK_GLOBAL_COPY, 0, 0, 2);
			s:apply2(callout(_update3v3CurrentMatchRankCB, 4));
		end
	end
end

function _update3v3CurrentMatchRankCB(nSeq, nCount, sdb)
	DebugOutput("_update3v3CurrentMatchRankCB nCount ,sdb =", nSeq, nCount, sdb);
	if nCount <= 0 then
		DebugOutput("[3v3 ERROE] [Player CrossMatch]_update3v3CurrentMatchRankCB  nCount <= 0!");
		WriteLog("[3v3 ERROE] [Player CrossMatch]_update3v3CurrentMatchRankCB  nCount <= 0!");
	end
	if gf_GetTaskByte(TASKID_3V3_AWARD_TAG, nSeq) ~= 1 then
		return 0;
	end
	--¼ÆËãÅÅÃû
	local nPlayerRank = 0;
	local sPlayerName = GetName();
	local nPlayerRoute = GetPlayerRoute();
	local sName = "######";
	DebugOutput("sPlayerName, nPlayerRoute =",sPlayerName, nPlayerRoute)
	for i = 1, nCount do
		local sData = sdb[i-1];
		if sData and sData[1] then
			if 3 == nSeq then
				sName = sData[1];
			elseif 4 == nSeq then
				_, sName = gf_GetRealmName(sData[1]);
			end
			DebugOutput("RealmName, Name, Route, Tong, Score, Bool1, Bool2=", sData[1], sName, sData[3], 
				sData[4], sData[2], tostring(sPlayerName) == tostring(sName), tonumber(nPlayerRoute) == tonumber(sData[3]));
			if tostring(sPlayerName) == tostring(sName) and tonumber(nPlayerRoute) == tonumber(sData[3]) then
				nPlayerRank = i;
				break;
			end			
		end
	end
	--ÉèÖÃÉÏÈü¼¾ÅÅÃû
	if gf_GetTaskByte(TASKID_3V3_AWARD_TAG, nSeq) == 1 then
		gf_SetTaskByte(TASKID_3V3_AWARD_TAG, nSeq, 0);
		if 3 == tonumber(nSeq) then
			gf_SetMyTaskByte(TASKID_LAST_MATCH_RANK, 1, 2, nPlayerRank); --±¾·þÅÅÃû
			gf_SetTaskByte(TASKID_3V3_AWARD_TAG, 2, 1); --¿çÈü¼¾½±Àø¿ÉÒÔÁìÈ¡ÁË
			SetTask(TASKID_CUR_MATCH_RANK, 0); --±¾ÈüÇåÁã
			Msg2Player("Tham gia ®Êu quý 3 v 3 thµnh c«ng!")
			DebugOutput(format("[3v3] [player:%s] [rank:%d]cross match ---------> seccussful!!!", sPlayerName, nPlayerRank));
			WriteLog(format("[3v3] [player:%s] [rank:%d]cross match ---------> seccussful!!!", sPlayerName, nPlayerRank));
		elseif 4 == tonumber(nSeq) then
			gf_SetMyTaskByte(TASKID_LAST_MATCH_RANK, 3, 4, nPlayerRank); --¿ç·þÅÅÃû
			DebugOutput(format("[3v3] [player:%s] [global rank:%d]cross match ---------> seccussful!!!", sPlayerName, nPlayerRank));
			WriteLog(format("[3v3] [player:%s] [global rank:%d]cross match ---------> seccussful!!!", sPlayerName, nPlayerRank));
		end
	end
end