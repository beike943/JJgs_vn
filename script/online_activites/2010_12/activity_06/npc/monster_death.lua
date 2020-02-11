Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

function OnDeath(npcIndex)
	local mapID = SubWorldIdx2ID(SubWorld);
	local monsterValue = FG_GetMonsterValue(npcIndex);
	local zoneIndex = FG_GetPlayerZoneIndex();
	FG_AddZoneMonsterValue(mapID, zoneIndex, -monsterValue);
	SetNpcLifeTime(npcIndex, 0);
end