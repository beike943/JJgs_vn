--Include("\\script\\mail\\mail_lux.lua")
Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")

Finals.SIFT_LOSE_COUNT = 1

function Finals.Init(tTeams)
	if not tTeams then
		return Preliminary:LoadFinalTeams(Finals.Init);
	end
	if getn(tTeams) == 0 then
		DebugOutput("[3v3] [Finals Init Error");
		return
	end
	Finals.tTopTeamIDs = tTeams[1];
	Finals.tTopTeamNames = tTeams[2];
end

function Finals:addPlayer()
	local oldPidx = PlayerIndex;
	local szAllHint = "";
	local bAllow = 1;
	local teamSize = GetTeamSize();
	if teamSize > WARTEAM_SIZE then
		return Talk(1, "", format("Nh©n sË cÔng tÊ ÆÈi kh´ng qu∏ %d ng≠Íi tÊ ÆÈi mÌi c„ th” tham gia li™n Æ u chung k’t!",WARTEAM_SIZE));
	end
	if GetCaptainName() ~= GetName() then
		Talk(1, "", "C«n ÆÈi tr≠Îng thao t∏c!");
		return 0;
	end
	local fightTeamID = GetFightTeamID() or 0;
	if 0 == fightTeamID then
		szAllHint = szAllHint .."ßÈi tr≠Îng kh´ng c„ chi’n ÆÈi!";
		bAllow = 0;
	else
		bAllow = 0;
		for i = 1, getn(self.tTopTeamIDs) do
			if fightTeamID == self.tTopTeamIDs[i] then
				bAllow = 1;
				break;
			end
		end
		if (bAllow == 0) then
			szAllHint = szAllHint .. "Chi’n ÆÈi cÒa ÆÈi tr≠Îng kh´ng ph∂i ÆÈi Æ u chung k’t ho∆c Æ∑ bﬁ loπi";
		end
	end
	local tRoute = {}
	local nVic = 0;
	for i = 1, teamSize do
		PlayerIndex = GetTeamMember(i)
		local nRoute = GetPlayerRoute();
		if tRoute[nRoute] then
			szAllHint = szAllHint.."\n["..GetName().."] C„ ÆÈi vi™n cÔng h÷ ph∏i!";
			bAllow = 0;
		end
		tRoute[nRoute] = 1;
		local check, szMyHint = checkEquipment()
		if check ~= 1 then
			szAllHint = szAllHint.."\n"..szMyHint;
			bAllow = 0;
		end
		if GetFightTeamID() ~= fightTeamID then
			szAllHint = szAllHint.."\n["..GetName().."] Kh´ng cÔng chi’n ÆÈi vÌi ÆÈi tr≠Îng";
			bAllow = 0;
		end
		nVic = max(nVic, GetTask(TASKID_3V3_WIN_ROUND_DAILY));
	end
--	if (g_nTodayRound or 0) - nVic >= self.SIFT_LOSE_COUNT then
--		szAllHint = szAllHint .. "ƒ˙“—±ªÃ‘Ã≠!";
--		bAllow = 0;
--	end
	if bAllow ~= 1 then
		for i = 1, WARTEAM_SIZE do
			PlayerIndex = GetTeamMember(i);
			Talk(1, "", szAllHint);
		end
		return 0
	else
		for i = 1, WARTEAM_SIZE do
			PlayerIndex = GetTeamMember(i);
			lockEquipment(1);
			P3v3_Enter(1,1);
		end
	end
end

function Finals:delPlayer()
--	Talk(1, "", "æˆ»¸÷–≤ªƒ‹ÕÀ≥ˆ±»»¸");
	delPlayer();
end

function Finals:startARound(nTodayRound)
	nTodayRound = nTodayRound + 1;
	local tTeams = P3v3_GetTeams();
	DebugOutput("tTeams", Val2Str(tTeams));
	local tFightTeams = self:sortFightTeams(tTeams);
	self.tFightTeams = tFightTeams;
	local tTopTeamIDs = self.tTopTeamIDs;
	DebugOutput("tTopTeamIDs=",Val2Str(tTopTeamIDs));
	DebugOutput("tFightTeams=",Val2Str(tFightTeams));
	
	SetRoundToday(nTodayRound);
	DebugOutput("Round=", nTodayRound, g_nTodayRound)
	local nTeams = getn(tTopTeamIDs)
	DebugOutput("nTeams=",nTeams);
	local nMax = mi(nTeams)
	DebugOutput("nMax = ",nMax, nTodayRound);
	if nTodayRound > 1 then
	for i = 1, nMax/2 do
		local nFightTeamID_S = tTopTeamIDs[i] or 0;
		local nFightTeamID_B = tTopTeamIDs[nMax - i + 1] or 0;
		DebugOutput("VS:",i,nFightTeamID_S, nFightTeamID_B);
		local nVicS = getFightTeamVic(tFightTeams[nFightTeamID_S]);
		local nVicB = getFightTeamVic(tFightTeams[nFightTeamID_B]);
		local msg = format("[3v3 chung k’t] [t›nh Æi”m] [VS: (iD=%f, Score=%d) (iD=%f, Score=%d)]",
			nFightTeamID_S, nVicS, nFightTeamID_B, nVicB);
		DebugOutput(msg);
		WriteLog(msg);
		if nVicS > nVicB or nFightTeamID_B == 0 then
			self:kickTeam(tFightTeams[nFightTeamID_B]);
		elseif nVicB > nVicS then
			self:kickTeam(tFightTeams[nFightTeamID_S]);
			tTopTeamIDs[i] = nFightTeamID_B;
		else
			local msg = format("[3v3 Error] [Finals] [ScoreEqual] [Team1=%.0f, Team2=%.0f]", nFightTeamID_S or 0, nFightTeamID_B or 0);
			WriteLog(msg);
			DebugOutput(msg)
		end
		tTopTeamIDs[nMax - i + 1] = nil;
	end
	end
	local nMaxNew = getn(tTopTeamIDs);
	DebugOutput("nMaxNew = ",nMaxNew);
--	assert(nMaxNew == nMax/2);
	
	if (nMaxNew == 1) then
		self.tFinalTop = self.tFinalTop or {}
		self.tFinalTop[nTodayRound + 1] = {tTopTeamIDs[1], GetFightTeamInfo(tTopTeamIDs[1])}
		return self:gameover();
	end
	nMaxNew = mi(nMaxNew);
	for i = 1, nMaxNew/2 do
		local nFightTeamID_S = tTopTeamIDs[i] or 0;
		local nFightTeamID_B = tTopTeamIDs[nMaxNew - i + 1] or 0;
		DebugOutput(format("%d (%d) VS %d (%d)", i, nFightTeamID_S, nMaxNew - i + 1, nFightTeamID_B));
		if (tFightTeams[nFightTeamID_S] or tFightTeams[nFightTeamID_B]) then
			enterBattle_3v3(tFightTeams[nFightTeamID_S], tFightTeams[nFightTeamID_B], 0);
		end
	end
end

function Finals:sortFightTeams(tTeams)
	local tFightTeams = {};
	for i = 1, getn(tTeams) do
		local nFightTeamID = getFightTeamIDByTeam(tTeams[i]);
		tFightTeams[nFightTeamID] = tTeams[i];
	end
	return tFightTeams;
end

function getFightTeamIDByTeam(team)
	PlayerIndex = 0;
	for j = 1, getn(team) do
		PlayerIndex = team[j] or 0;
		if PlayerIndex ~= 0 then
			break;
		end
	end
	if PlayerIndex ~= 0 then
		return GetFightTeamID();
	end
end
function getFightTeamVic(team)
	if not team then return 0 end
	PlayerIndex = 0;
	local nVic = 0;
	for j = 1, getn(team) do
		PlayerIndex = team[j] or 0;
		if PlayerIndex ~= 0 then
			nVic = max(nVic, GetTask(TASKID_3V3_WIN_ROUND_DAILY));
		end
	end
	return nVic;
end

function Finals:sortTeamByTop(tTeams)
	local sortedTeams = {}
	local nTeamCount = getn(tTeams);
	DebugOutput("nTeamCount", nTeamCount);
	for i = 1, nTeamCount do
		local team = tTeams[i];
		local myTeamID = getFightTeamIDByTeam(team);
		if myTeamID then
			for id = 1, getn(self.tTopTeamIDs) do
				if myTeamID == self.tTopTeamIDs[id] then
					sortedTeams[id] = team;
				end
			end
		end
	end
	return sortedTeams;
end

function Finals:kickTeam(tTeam)
	DebugOutput("kickTeam", tTeam and Val2Str(tTeam))
	if not tTeam then return end
	local oldPidx = PlayerIndex;
	PlayerIndex = tTeam[1];
	delPlayer();
	self.tFinalTop = self.tFinalTop or {}
	self.tFinalTop[g_nTodayRound] = self.tFinalTop[g_nTodayRound] or {}
	local teamID, teamName = GetFightTeamID(), GetFightTeamInfo();
	tinsert(self.tFinalTop[g_nTodayRound], teamID);
	tinsert(self.tFinalTop[g_nTodayRound], teamName);
	msg = format("Chi’n ÆÈi [%s] bﬁ loπi", teamName)
	Msg2Global(msg);
	WriteLog("[3v3 chung k’t]"..msg);
	DebugOutput(msg)
	PlayerIndex = oldPidx;
end

function Finals:gameover()
	g_bFinals = 0
	DebugOutput("Finals:gameover");

	self:saveFinalTop();
	DebugOutput("K’t thÛc chung k’t!!!");
	--if GetGSIndex()[0] ~= 1 then return end
	local sdb = SDB(SDBKEY_3V3, 0, 0);
	sdb:modify("BattleDate", {"ddddd", 0, 0, 0, 1, 0});
	
	SetStartTime(1);
end

function Finals:saveFinalTop()
	DebugOutput("FinalTop", Val2Str(self.tFinalTop));
	local nMax = getn(self.tFinalTop);
	local sdb = SDB(SDBKEY_3V3_MATCH_RANK, 0, g_t3v3Data.nMatchRound);
	local sdb2 = SDB(SDBKEY_3V3_MATCH_AWARD, 0, g_t3v3Data.nMatchRound);
	local msg = "K’t qu∂ chung k’t:\n"
	local nTop = 1
	for i = nMax, 1, -1 do
		local tRoundTop = self.tFinalTop[i];
		if tRoundTop then
			tRoundTop.n = nil;
			local count = getn(tRoundTop) / 2
			DebugOutput("Data = ",Val2Str(tRoundTop))
			tinsert(tRoundTop, 1, strrep("fs", count));
			DebugOutput("data = ", Val2Str(tRoundTop));
			sdb[tostring(nTop)] = tRoundTop;
			for i = 2, getn(tRoundTop), 2 do
				local memberNames = totable(GetFightTeamMemberList(tRoundTop[2]));
				for _, name in memberNames do
					SendAwardMail(name, nTop);
				end
			end
			msg = msg .. format("X’p hπng %2d li™n Æ u \n", nTop);
			nTop = nTop + 1
			for n = 1, count do
				msg = msg .. tRoundTop[n*2+1] .. "\n";
			end
		end
	end
	Msg2Global(msg);
	WriteLog("[3v3 chung k’t]"..msg);
	DebugOutput(msg)
end

function mi(n)
	local m = 2;
	while m < n do
		m = m * 2;
	end
	return m
end

function Finals:onFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName)
	if not winTeamID or winTeamID == 0 then
		return
	end
	local msg = ""
	
	if not loseTeamID or loseTeamID == 0 then
		msg = format("%s ÆÈi trÀn nµy kh´ng c„ ÆËi thÒ, giµnh thæng lÓi!", winTeamName);
	else
		msg = format("%s ÆÈi chi’n thæng %s ÆÈi, giµnh thæng lÓi!", winTeamName, loseTeamName);
	end
	Msg2Global(msg);
	WriteLog("[3v3 chung k’t]"..msg);
	DebugOutput(msg)
end

function SendAwardMail(name, nRank)
	local szRank = format("X’p hπng %d li™n Æ u", nRank);
	if nRank == 1 then
		szRank = "Qu∏n Qu©n";
	elseif nRank == 2 then
		szRank = "∏ Qu©n";
	elseif nRank == 3 then
		szRank = "Qu˝ Qu©n";
	end
	sendScriptMail("Ph«n th≠Îng chung k’t tÿ v‚ li™n Æ u", szTo, "Ph«n th≠Îng chung k’t tÿ v‚ li™n Æ u", 
		format("ChÛc mıng ng≠¨i nhÀn Æ≠Óc qu˝ th¯ %d chung k’t tÿ v‚ li™n Æ u", g_t3v3Data.nMatchRound, szRank),
		[[SendScript2VM("\\script\\missioins\\nvn\\3v3npc.lua", format("getAward_3v3_match_real(%d)",nRank))]], 
		"checkLiangshanAward")
end
