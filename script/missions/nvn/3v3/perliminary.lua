Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")

Preliminary.MIN_ROUND_COUNT = 2;		-- ×îÐ¡±ÈÈü³¡´Î
Preliminary.SIFT_LOSE_COUNT = 2;

function Preliminary:addPlayer()
	local oldPidx = PlayerIndex;
	local szAllHint = "";
	local bAllow = 1;
	local teamSize = GetTeamSize();
	if teamSize > WARTEAM_SIZE then
		return Talk(1, "", format("Nh©n sè cïng tæ ®éi kh«ng qu¸ %d ng­êi tæ ®éi míi cã thÓ tham gia liªn ®Êu vßng lo¹i!",WARTEAM_SIZE));
	end
	if GetCaptainName() ~= GetName() then
		Talk(1, "", "CÇn ®éi tr­ëng thao t¸c!");
		return 0;
	end
	local fightTeamID = GetFightTeamID() or 0;
	if 0 == fightTeamID then
		szAllHint = szAllHint .."§éi tr­ëng kh«ng cã chiÕn ®éi!";
		bAllow = 0;
	end
	local tRoute = {}
	local nVic = 0;
	for i = 1, teamSize do
		PlayerIndex = GetTeamMember(i)
		local nRoute = GetPlayerRoute();
		if tRoute[nRoute] then
			szAllHint = szAllHint.."\n["..GetName().."] Cã ®éi viªn cïng hÖ ph¸i!";
			bAllow = 0;
		end
		tRoute[nRoute] = 1;
		local check, szMyHint = checkEquipment()
		if check ~= 1 then
			szAllHint = szAllHint.."\n"..szMyHint;
			bAllow = 0;
		end
		if GetFightTeamID() ~= fightTeamID then
			szAllHint = szAllHint.."\n["..GetName().."] Kh«ng cïng chiÕn ®éi víi ®éi tr­ëng!";
			bAllow = 0;
		end
		nVic = max(nVic, GetTask(TASKID_3V3_WIN_ROUND_DAILY));
	end
	if (g_nTodayRound or 0) - nVic >= self.SIFT_LOSE_COUNT then
		szAllHint = szAllHint .. "Ng­¬i ®· bÞ lo¹i!";
		bAllow = 0;
	end
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

function Preliminary:startARound(nTodayRound)
	nTodayRound = nTodayRound + 1;
	SetRoundToday(nTodayRound);
	local tPlayers, tTeams = P3v3_GetPlayers(), P3v3_GetTeams();
	self.tTeams = tTeams;
	self.tLoser = {}
	if nTodayRound > self.MIN_ROUND_COUNT then
		tTeams = self:shiftTeam(tTeams, nTodayRound);
		self.tTeams = tTeams;
		if self:checkTeams() == nil then
			self:gameover();
			return
		end
	end
	sort(self.tTeams, self.sortTeamByScore);	-- todo: check

	if nTodayRound > MAX_ROUND_DAILY or tonumber(date("%H")) >= 22 then
		self:gameover();
	end
	local tTeamA, tTeamB = self:make2Group(self.tTeams);
	
	for i = 1, getn(tTeamA) do
		enterBattle_3v3(tTeamA[i], tTeamB[i], 0);
	end
end

function Preliminary:shiftTeam(tTeams, nCurRound)
	local oldPidx = PlayerIndex;
	tTeams.n = nil;
	local tmpTeams = {}
	for k, team in tTeams do
		team.n = nil;
		local nVic = 0;
		for p, pid in team do
			PlayerIndex = pid
			nVic = max(nVic, GetTask(TASKID_3V3_WIN_ROUND_DAILY));
		end
		if nCurRound - nVic > self.SIFT_LOSE_COUNT then
			self:kickTeam(team);
			tTeams[k] = nil;
		else
			tinsert(tmpTeams, team);
		end
	end
	PlayerIndex = oldPidx;
	return tmpTeams;
end

function Preliminary:kickTeam(tTeam)
	local oldPidx = PlayerIndex;
	tinsert(self.tLoser, tTeam);
	PlayerIndex = tTeam[1];
	Msg2Global("ChiÕn ®éi [%s] bÞ lo¹i", GetFightTeamInfo());
	P3v3_Leave();
	PlayerIndex = oldPidx;
end

function Preliminary:checkTeams()
	local nCurTeams = getn(self.tTeams)
	if nCurTeams > FINALS_TEAM_COUNT then
		return 1;
	end
	if nCurTeams < FINALS_TEAM_COUNT then
		local nReviveTeamCount = FINALS_TEAM_COUNT - nCurTeams;
		sort(self.tLoser, self.sortTeamByScore);
		for i = 1, nReviveTeamCount do
			tinsert(self.tTeams, self.tLoser[i]);
		end
	end
	self.tTeams.n = nil;
end

function Preliminary:gameover()
	self:SetFinalTeams(self.tTeams);

	DebugOutput("KÕt thóc vßng lo¹i");
	--if GetGSIndex()[0] ~= 1 then return end
	local sdb = SDB(SDBKEY_3V3, 0, 0);
	sdb:modify("BattleDate", {"ddddd", 0, 0, 1, 0, 0});
	SetStartTime(1);
end

function Preliminary:make2Group(tTeams)
	-- °´»ý·Ö·Ö2²¨, Èç¹û³öÏÖÆæÊý, µÚÒ»ÃûÂÖ¿Õ
	local tTeamA, tTeamB = {}, {};
	local nTeamSize = getn(tTeams);
	local nGroupSize = floor(nTeamSize/2);
	local nStart = 0;
	if mod(nTeamSize, 2) == 1 then
		nStart = 1;
		tinsert(tTeamA, tTeams[1]);
	end

	local s1 = floyd_rm4n(nGroupSize, nGroupSize);
	local s2 = floyd_rm4n(nGroupSize, nGroupSize);
	for i = 1, nGroupSize do
		local n1, n2 = s1[i] + nStart, s2[i] + nGroupSize + nStart;
		tinsert(tTeamA, i, tTeams[n1]);
		tinsert(tTeamB, tTeams[n2]);
	end
	tTeamA.n, tTeamB.n = nil, nil;
	return tTeamA, tTeamB;
end

function Preliminary.sortTeamByWin(t1, t2)
	if not t1 then
		return 1;
	end
	if not t2 then
		return nil;
	end
	local oldPidx = PlayerIndex;
	local v1, v2 = 0, 0;
	for i = 1, getn(t1) do
		PlayerIndex = t1[i];
		v1 = max(v1, GetTask(TASKID_3V3_WIN_ROUND_DAILY));
	end
--	v1 = v1 / getn(t1);
	for i = 1, getn(t2) do
		PlayerIndex = t2[i]
		v2 = max(v2, GetTask(TASKID_3V3_WIN_ROUND_DAILY));
	end
--	v2 = v2 / getn(t2)
	PlayerIndex = oldPidx;
	return v2 < v1;
end
function Preliminary.sortTeamByScore(t1, t2)
	if not t1 then
		return 1;
	end
	if not t2 then
		return nil;
	end
	local oldPidx = PlayerIndex;
	local v1, v2 = 0, 0;
	for i = 1, getn(t1) do
		PlayerIndex = t1[i];
		v1 = max(v1, GetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE));
	end
--	v1 = v1 / getn(t1);
	for i = 1, getn(t2) do
		PlayerIndex = t2[i]
		v2 = max(v2, GetTask(TASKID_3V3_MATCH_FIGHTTEAM_SCORE));
	end
--	v2 = v2 / getn(t2)
	PlayerIndex = oldPidx;
	return v2 < v1;
end

function Preliminary:SetFinalTeams(tTeams)
	local sdb = SDB(SDBKEY_3V3, 3, 1);
	msg = "KÕt thóc vßng lo¹i!\n danh s¸ch chung kÕt nh­ sau:\n"
	local nCount = min(getn(tTeams), FINALS_TEAM_COUNT);
	for i = 1, nCount do
		local tTeam = tTeams[i];
		PlayerIndex = 0;
		for i = 1, getn(tTeam) do
			PlayerIndex = tTeam[i] or 0;
			if PlayerIndex ~= 0 then
				break;
			end
		end
		if PlayerIndex ~= 0 then
			local teamID = GetFightTeamID();
			local teamName = GetFightTeamInfo();
			sdb[i] = {"fs", teamID, teamName};
			msg = msg .. format("%2d - %s\n", i, GetFightTeamInfo(teamID));
		end
	end
	DebugOutput("tTopTeamIDs = ",msg)
	Msg2Global(msg);
end

function Preliminary:LoadFinalTeams(cb, nCount, sdbData)
	if not nCount then
		return SDBCallBack(SDBKEY_3V3, 3, 1, callout(Preliminary.LoadFinalTeams, self, cb));
	end
	local maxCount = min(nCount, FINALS_TEAM_COUNT)
	local tTeams = {}
	local tTeamNames = {}
	for i = 1, maxCount do
		tTeams[i] = sdbData[i-1][2]
		tTeamNames[i] = sdbData[i-1][3];
	end
	cb({tTeams, tTeamNames});
end

function Preliminary:onFinishBattle(winTeamID, loseTeamID, winTeamName, loseTeamName)
	if not winTeamID or winTeamID == 0 then
		return
	end
	local msg = ""
	
	if not loseTeamID or loseTeamID == 0 then
		msg = format("%s ®éi trËn nµy kh«ng cã ®èi thñ, giµnh th¾ng lîi!", winTeamName);
	else
		msg = format("%s ®éi chiÕn th¾ng %s ®éi, giµnh th¾ng lîi!", winTeamName, loseTeamName);
	end
	Msg2Global(msg);
end

--t1, t2 = Preliminary:make2Group({1,2,3,4,5,6,7,8,9,10});
--print(Val2Str(t1));
--print(Val2Str(t2));
--t1, t2 = Preliminary:make2Group({1,2,3,4,5,6,7,8,9});
--print(Val2Str(t1));
--print(Val2Str(t2));
