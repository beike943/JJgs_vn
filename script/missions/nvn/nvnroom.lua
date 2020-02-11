Include("\\script\\missions\\nvn\\battle\\battle_head.lua")

function OnStart(roomId, nType, mapId, option)
	local tPlayersA, tPlayersB = NvnRoom_GetInfo(roomId);
	if nType then
		return enterTeamFight(roomId, mapId, tPlayersA, tPlayersB, option, nType);
	end
end

function OnView(roomId)
	local map = getFightMap(roomId);
	if not map then return end
	local mapID, mapIdx = map[1], map[2];
	BattleMission_TeamFight:Enter(mapID, 3);
end
	