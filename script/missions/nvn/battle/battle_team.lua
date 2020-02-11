Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\nvn\\battle\\battle_team_head.lua")
Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\script\\lib\\define.lua")

MV_TEAM_ALIVE_1 	= 10
MV_TEAM_ALIVE_2 	= 11
MV_TEAM_PIDX		= 12	-- 12 ~ 27	16¸ö
MV_TEAM_PIDX_1		= 12	-- 12 ~ 19
MV_TEAM_PIDX_2		= 20	-- 20 ~ 27

mi = {12, 20}
ma = {19, 27}

MV_BATTLE_RESULT	= 50

MV_TEAM_FIGHTER_1	= 51	-- ÕýÔÚ´òµÄ
MV_TEAM_FIGHTER_2	= 52

TEAM_PIDX_MAX		= 12
MAX_TEAM_PLAYER 	= 8
MV_TEAM_ALIVE = {
	MV_TEAM_ALIVE_1,
	MV_TEAM_ALIVE_2,
}
MV_TEAM_FIGHTER = {
	MV_TEAM_FIGHTER_1,
	MV_TEAM_FIGHTER_2,
}

CampName = {"§éi ®á", "§éi xanh"}

--======================================================================================
-- ×¼±¸½×¶Î

phaseTeamFight_waiting = {
	maxsecond = 60,
	guage = {
		msg = "§îi më", 
		time = 60, 
		cyc = 0, 
		id = 1,
	},	
	DEBUG = 1,
}
function phaseTeamFight_waiting.Init()
	this:Msg2MSAll("ChuÈn bÞ chiÕn ®Êu, sau 1 phót sÏ b¾t ®Çu");
	this.msCamp:turnPlayer(0, setPlayer2Viewer);
end
function phaseTeamFight_waiting.ShowMsg()
--	this:Msg2MSAll("¶ÔÊÖÐÅÏ¢, @#$$^%#$");
end
phaseTeamFight_waiting.actions = {
	[1] = BattleMission_TeamFight.Init,
	[30] = BattleMission_TeamFight.ShowMsg,
}

phaseTeamFight_waiting = inherit(cycPhase, phaseTeamFight_waiting)
phaseTeamFight_waiting.onTimeout = phaseTeamFight_waiting.onFinish;

---------------------------------------------------------------------
-- Õ½¶·½×¶Î
phaseTeamFight_fighting = phaseBase({
	maxsecond = 10 * 60,
	guage = {
		msg = "TiÕn ®é chiÕn ®Êu", 
		time = 10 * 60, 
		cyc = 0, 
		id = 1,
	},
	DEBUG = 1,
})

function phaseTeamFight_fighting:onInit(father)
	phaseBase.onInit(self, father)
	this.msCamp:turnPlayer(0, setPlayer2Fighter);
end

function phaseTeamFight_fighting:onTimer()
	phaseBase.onTimer(self);
	DebugOutput("FightState--->", GetMissionV(MV_TEAM_ALIVE_1), GetMissionV(MV_TEAM_ALIVE_2));
	if GetMissionV(MV_TEAM_ALIVE_1) < 1 then
		if GetMissionV(MV_TEAM_ALIVE_2) < 1 then
			SetMissionV(MV_BATTLE_RESULT, 3);
			return self:onFinish();
		else
			SetMissionV(MV_BATTLE_RESULT, 2);
			return self:onFinish(2);
		end
	elseif GetMissionV(MV_TEAM_ALIVE_2) < 1 then
		SetMissionV(MV_BATTLE_RESULT, 1);
		return self:onFinish(1);
	end
end
function phaseTeamFight_fighting:onPlayerDeath(event, data)
	DebugOutput("phaseTeamFight_fighting:onPlayerDeath",event, data)
	for nCamp = 1, 2 do
		for mv = mi[nCamp], ma[nCamp] do
			if PlayerIndex == GetMissionV(mv) then
				this:Msg2MSAll(format("[%s] ng­êi ch¬I [%s] thÊt b¹i", CampName[nCamp],GetName()));
				SetMissionV(mv, 0);
				SetMissionV(MV_TEAM_ALIVE[nCamp], GetMissionV(MV_TEAM_ALIVE[nCamp]) - 1);
				RevivePlayer(0);
				setPlayer2Viewer();
				return 1;
			end
		end
	end
end
function phaseTeamFight_fighting:onTimeout()
	return self:onFinish();
end

function checkTeamBattleResult()
	local tPlayer = {}
	tPlayer[1] = z.msCamp:reflash(1);
	tPlayer[2] = BattleMission_TeamFight.msCamp:reflash(2);
	local damage = {0, 0}
	for i = 1, 2 do
		local tPlayer = msCamp:reflash(i);
		for n = 1, tPlayer do
			PlayerIndex = tPlayer[n]
			damage[i] = damage[i] + GetToPlayerDamage();
		end
	end
	if damage[1] > damage[2] then
		return 1;
	elseif damage[1] < damage[2] then
		return 2;
	else
		return 0;
	end
end

function phaseTeamFight_fighting:onFinish(result)
	if not result then
		result = checkTeamBattleResult();
	end
	if result == 0 then
		this:Msg2MSAll("Hßa");
	elseif result == 1 then
		this:Msg2MSAll(CampName[1].."ChiÕn th¾ng!");
	else
		this:Msg2MSAll(CampName[2].."ChiÕn th¾ng!");
	end
	phaseBase.onFinish(self)
	local nOldPlayer = PlayerIndex;
	BattleMission_TeamFight.msCamp:reflash(result); --Ê¤Àû·½
	local nWinTb = BattleMission_TeamFight.msCamp.players
	local strWinRoute = "";
	for i = 1,getn(nWinTb) do
		PlayerIndex = nWinTb[i];
		addNvnScore(TASKID_NVN_SCORE, 100);
		strWinRoute = strWinRoute.."["..tostring(GetPlayerRoute()).."]";
	end
	BattleMission_TeamFight.msCamp:reflash(3-result); --Ê§°Ü·½
	local nLoseTb = BattleMission_TeamFight.msCamp.players
	local strLoseRoute = "";
	for i = 1,getn(nLoseTb) do
		PlayerIndex = nLoseTb[i];
		local nvnRank = getNvnRank();
		if nvnRank <= 4 then
		elseif nvnRank <= 7 then
			addNvnScore(-80);
		elseif nvnRank <= 9 then
			addNvnScore(-95);
		end
		strLoseRoute = strLoseRoute.."["..tostring(GetPlayerRoute()).."]";
	end	
	PlayerIndex = nOldPlayer;
	WriteLog(format("[NVN][phaseTeamFight][HÖ ph¸i bªn th¾ng:%s][HÖ ph¸i bªn thua:%s]",strWinRoute,strLoseRoute))
end

phaseTeamFight_fighting.triggers = {
	PlayerDeath = { 
		{action = phaseTeamFight_fighting.onPlayerDeath,},
	},
}

---------------------------------------------------------------------
-- ½áÊø½×¶Î

phaseTeamFight_ending = phaseBase({
	maxsecond = 5,
	guage = {
		msg = "Thêi gian rêi khái", 
		time = 5, 
		cyc = 0, 
		id = 1,
	},
	DEBUG = 1,
})

function phaseTeamFight_ending:onTimeout()
	this:Close();
end
---------------------------------------------------------------------
phaseTeamFight = {
	phases = {
		phaseTeamFight_waiting,
		phaseTeamFight_fighting,
		phaseTeamFight_ending,
	},
	maxsecond = 10 * 60 + 5 + 60,
	timerID = 84,
}
phaseTeamFight = inherit(cycPhase, phaseTeamFight)

--=====================================================================
BattleMission_TeamFight = inherit(missionBase, BattleMission_TeamFight)

BattleMission_TeamFight.msOption.OnPlayerJoin = function(self, nCamp)
	local nCount = GetMissionV(MV_TEAM_ALIVE[nCamp]) + 1;
	SetMissionV(MV_TEAM_ALIVE[nCamp], nCount);
	local mv = MV_TEAM_PIDX + (nCount - 1) + (nCamp - 1) * MAX_TEAM_PLAYER
	SetMissionV(mv, PlayerIndex);
	ResetToPlayerDamage();
	RestoreAll();
	ClearColdDown();	--Çå³ýËùÓÐÒ©CD
	RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬
	ClearStolenSkill();	--Çå³ýÒÑÍµÈ¡µÄ¼¼ÄÜ£¬Õë¶Ô¹÷×Ó
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ýËùÓÐ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	--BWT_RemoveNonlicetState();
	DebugOutput(format("%s gia nhËp [%s] phe",GetName(), CampName[nCamp]));
end

BattleMission_TeamFight.msOption.OnPlayerLeave = function(self, nCamp)
	DesaltPlayer(0);
	if GetMissionV(MV_BATTLE_RESULT) == 0 then
		for nCamp = 1, 2 do
			for mv = mi[nCamp], ma[nCamp] do
				if GetMissionV(mv) == PlayerIndex then
					this:Msg2MSAll(format("%s rêi khái ¶i!",GetName()));
					SetMissionV(mv, 0);
					SetMissionV(MV_TEAM_ALIVE[nCamp], GetMissionV(MV_TEAM_ALIVE[nCamp]) - 1);
					return
				end
			end
		end
	end
	DebugOutput(GetName().."Rêi cöa ¶i");
end

BattleMission_TeamFight.msPhases = {
	phaseTeamFight,
}

BattleMission_TeamFight.msPosition.entryPos = {
	[6066] = {{1554,3193},{1641,3196}},
	[6067] = {{1538,3250},{1595,3190}},
	[6068] = {{1537,3302},{1649,3177}},
	[6069] = {{1574,3234},{1625,3244}},
	[6070] = {{1620,3245},{1595,3211}},
	[6071] = {{1592,3214},{1633,3255}},
	[6072] = {{1587,3220},{1663,3130}},
}
BattleMission_TeamFight.msPosition.getEntryPos = function(self, nCamp)
	local pos = self.entryPos[self:getRealMapID()];
	if type(pos[1]) == "table" then
		pos = pos[nCamp] or pos[1];
	end
	return self:getMapID(), gf_UnPack(pos);
end

BattleMission_TeamFight.msPosition.exitPos = {
		8000,1399,2847,
}

BattleMission_TeamFight.msOption.nInitFightState = 0;
BattleMission_TeamFight.msOption.szInitDeahScript = thisFile;
this = BattleMission_TeamFight;
--======================================================================================
function setPlayer2Viewer()
	DesaltPlayer(1, 10)
	SetFightState(0)
end
function setPlayer2Fighter()
	DesaltPlayer(0)
	SetFightState(1)
end

function OnDeath()
	this:onEvent("PlayerDeath")
end

----ÒÆ³ý·Ç·¨µÄ×´Ì¬
--function BWT_RemoveNonlicetState()
--	local tbNonlicet =
--	{
--		[1] = {9901,9906},
--		[2] = {19801279,19801281},
--	}
--	for i=1,getn(tbNonlicet) do
--		for j=tbNonlicet[i][1],tbNonlicet[i][2] do
--			RemoveState(j);
--		end;
--	end;
--end;

function this.info(n,p)
	if not p then return end
	DebugOutput(format("Nh©n sè ®èi chiÕn hiÖn t¹i: %d vs %d  (%d)", GetMissionV(MV_TEAM_ALIVE_1), GetMissionV(MV_TEAM_ALIVE_2), n));
	local f1, f2 = GetMissionV(MV_TEAM_FIGHTER_1), GetMissionV(MV_TEAM_FIGHTER_2)
	DebugOutput(format("Ng­êi ch¬i ®èi chiÕn hiÖn t¹i: %s(%d) vs %s(%d)", GetName(f1), f1, GetName(f2), f2));
	
	for nCamp = 1, 2 do 
		DebugOutput("§éi"..nCamp)
		for i = mi[nCamp], ma[nCamp] do
			local p = GetMissionV(i)
			DebugOutput(format("  %d : %s(%d)", i, GetName(p), p));
		end
	end
end


g_tRankScore = {
	{0		 ,"NhÊt Vâ Gi¶"},	
	{2000    ,"NhÞ Vâ SÜ"},	
	{6000    ,"Tam Vâ S­"},	
	{10000   ,"Tø Vâ HiÖp"},	
	{14000   ,"Ngò Vâ T«ng"},	
	{18000   ,"Lôc Vâ Linh"},	
	{22000   ,"ThÊt Vâ Hoµng"},	
	{28000   ,"B¸t Vâ Quû"},	
	{35000   ,"Cöu Vâ T«n"},	
	{60000   ,"Vâ Th¸nh"},
}
function addNvnScore(nScore)
	local newScore = GetTask(TASKID_NVN_SCORE) + nScore;
	SetTask(TASKID_NVN_SCORE, newScore);
	--resetNvnRank();
end

function getNvnScore()
	return GetTask(TASKID_NVN_SCORE);
end
function getNvnRank()
	return GetTask(TASKID_NVN_RANK);
end
function resetNvnRank()
	local nScore = GetTask(TASKID_NVN_SCORE);
	local oldRand = GetTask(TASKID_NVN_RANK)
	for i = getn(g_tRankScore), 1 -1 do
		if nScore > g_tRankScore[i][1] then
			if i == oldRand then
				break;
			else
				SetTask(TASKID_NVN_RANK, i);
				if i > oldRand then
					Msg2Player("Ng­¬i t¨ng bËc råi! HiÖn t¹i lµ"..g_tRankScore[i][2]);
				else
					Msg2Player("Ng­¬i h¹ bËc råi ! HiÖn t¹i lµ"..g_tRankScore[i][2]);					
				end
			end
			break;
		end
	end
end
