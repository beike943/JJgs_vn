Include("\\script\\missions\\nvn\\3v3\\3v3define.lua")
Include("\\script\\missions\\base\\mission_head.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\define.lua")

thisFile = "\\script\\missions\\nvn\\battle\\battle.lua";

BattleMission_TeamFight = {
	missionID = 64,
	AllrealMapID = {
		[2] = {6069,6066,6067,6068}
	},
	dynamicMap = 1,
	
	name = "TeamFight",
}
BattleMission_TeamFight = inherit(missionHead, BattleMission_TeamFight)

function BattleMission_TeamFight:getRealMapID()
	nType, maxCount = GetGlbValue(GV_MISSION_TEMP_BEGIN), GetGlbValue(GV_MISSION_TEMP_BEGIN + 1)
	DebugOutput("BattleMission_TeamFight:getRealMapID",nType, maxCount);
	if not nType then return end
	if nType == 1 then
		return self.AllrealMapID[nType][maxCount][random(1, getn(self.AllrealMapID[nType][maxCount]))];
	elseif nType == 2 then
		return self.AllrealMapID[nType][random(1, getn(self.AllrealMapID[nType]))];
	end
end

function enterTeamFight(roomId, mapId, tPlayersA, tPlayersB)
	local oldpid = PlayerIndex
	SetGlbValue(GV_MISSION_TEMP_BEGIN, nType);
	local nMemCount = getn(tPlayersA);
	SetGlbValue(GV_MISSION_TEMP_BEGIN + 1, nMemCount);
	local realMapID = BattleMission_TeamFight:getRealMapID(nType,nMemCount)
	if not realMapID then
		DebugOutput(format("[ERROR] [NVN_BATTLE] [NO REALMAPID] [roomId=%d, nType=%d, mapId=%d, nMemCount=%d]",
			roomId, nType, mapId, nMemCount));
		return
	end
	BattleMission_TeamFight.realMapID = realMapID;
	local mapID, mapIdx = BattleMission_TeamFight:Create()
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
