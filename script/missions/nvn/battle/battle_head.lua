Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\settings\\static_script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\define.lua")

thisFile = "\\script\\missions\\nvn\\battle\\battle.lua";

MV_TEAM_ALIVE_1 	= 10
MV_TEAM_ALIVE_2 	= 11
MV_TEAM_PIDX		= 12	-- 12 ~ 27	16个
MV_TEAM_PIDX_1		= 12	-- 12 ~ 19
MV_TEAM_PIDX_2		= 20	-- 20 ~ 27
mi = {12, 20}
ma = {19, 27}

MV_BATTLE_RESULT	= 50

MV_TEAM_FIGHTER_1	= 51	-- 正在打的
MV_TEAM_FIGHTER_2	= 52
MV_ROOM_ID		= 53
MV_MISSION_TYPE		= 54	-- 类型 0=nvn; 1=1v1; 2=3v3;

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

CampName = {"чi ", "чi xanh"}

BattleMission_TeamFight = {
	missionID = 64,
	AllrealMapID = {
		6068,
	},
	dynamicMap = 1,

	name = "TeamFight",
}
BattleMission_TeamFight = inherit(missionHead, BattleMission_TeamFight)

g_tRoomId2MapId = {}

function BattleMission_TeamFight:getRealMapID()
	nType, maxCount = GetGlbValue(GV_MISSION_TEMP_BEGIN), GetGlbValue(GV_MISSION_TEMP_BEGIN + 1)
	return self.AllrealMapID[random(1, getn(self.AllrealMapID))];
end

function enterTeamFight(roomId, mapId, tPlayersA, tPlayersB, option, nType)
	local oldpid = PlayerIndex
	SetGlbValue(GV_MISSION_TEMP_BEGIN, nType);
	local nMemCount = getn(tPlayersA);
	SetGlbValue(GV_MISSION_TEMP_BEGIN + 1, nMemCount);

	local mapID, mapIdx = BattleMission_TeamFight:Create()
	g_tRoomId2MapId[roomId] = {mapID, mapIdx};
	mf_SetMissionV(_, MV_ROOM_ID, roomId, mapID);
	mf_SetMissionV(_, MV_ROOM_OPTION, option, mapID);
	mf_SetMissionV(_, MV_MISSION_TYPE, 0, mapID);
	for i, v in tPlayersA do
		PlayerIndex = v;
		BattleMission_TeamFight:Enter(mapID, 1);
	end
	for i, v in tPlayersB do
		PlayerIndex = v;
		BattleMission_TeamFight:Enter(mapID, 2);
	end
	PlayerIndex = oldpid;
	return 1;
end

function getFightMap(roomId)
	return g_tRoomId2MapId[roomId];
end

------------------------------------------------------
function enterBattle_3v3(tTeamA, tTeamB, bLeave)
	bLeave = bLeave or 1;
	tTeamA, tTeamB = tTeamA or {}, tTeamB or {}
	DebugOutput("enterBattle_3v3", Val2Str(tTeamA), Val2Str(tTeamB));
	local oldpid = PlayerIndex
	local mapID, mapIdx = BattleMission_TeamFight:Create();
	mf_SetMissionV(_, MV_MISSION_TYPE, 2, mapID);
	for i = 1, getn(tTeamA) do
		PlayerIndex = tTeamA[i];
		if bLeave == 1 then P3v3_Leave() end
		BattleMission_TeamFight:Enter(mapID, 1);
		AddRuntimeStat(8, 5, GetPlayerRoute(), 1);--按流派统计参加人数
		--cdkey活动
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(2)");	
	end
	for i = 1, getn(tTeamB) do
		PlayerIndex = tTeamB[i];
		if bLeave == 1 then P3v3_Leave() end
		BattleMission_TeamFight:Enter(mapID, 2);
		AddRuntimeStat(8, 5, GetPlayerRoute(), 1);--按流派统计参加人数
		--cdkey活动
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(2)");	
	end
	PlayerIndex = oldpid;
	--统计开启的次数
	AddRuntimeStat(8, 1, 0, 1);
	--统计队伍的个数
	local nTeam = 0;
	if getn(tTeamA) > 0 then	nTeam = nTeam + 1;	end
	if getn(tTeamB) > 0 then	nTeam = nTeam + 1;	end
	AddRuntimeStat(8, 2, 0, nTeam);
	StatLog("3v3_begin", 1);
	return 1;
end
