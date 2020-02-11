Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");

function OnDeath(launcher)
	local mapID = SubWorldIdx2ID(SubWorld);
	local spawnPoint = SB_PlayerSpawnPointList[random(1, getn(SB_PlayerSpawnPointList))];
	SetTempRevPos(mapID, spawnPoint[1]*32, spawnPoint[2]*32);
	SetDeathScript("\\script\\online_activites\\2010_12\\activity_05\\player_death.lua");
end