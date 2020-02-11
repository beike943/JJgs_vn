Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

function OnDeath(npcIdx)
	local mapID, x, y = GetNpcWorldPos(npcIdx);
	SetNpcLifeTime(npcIdx, 0);
	FG_SpawnChest(mapID, x, y);
end