Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online_activites\\trigger_IDs.lua");

FG_StartDate = 2010121000;
FG_EndDate = 2011013024;
FG_ACTIVITY_ID = 24;
FG_MISSION_ID = 53;
FG_CAMP_ID = 0;
FG_TIMER_ID = 82;
FG_TRIGGER_ID = TD_FRUIT_GATHER_TRIGGER_ID;
FG_TEMP_TASK_KEY_GATHER_TREE_INDEX = VET_201012_06_TASK_TEMP_TREE_INDEX;
FG_NORMAL_TREE_EXP_BONUS = 2000;
FG_SPECIAL_TREE_EXP_BONUS = 4000;

-- base 100
FG_NORMAL_TREE_ITEM_BONUS_TABLE = 
{
	{31, 80, ""}, -- ²»ÖÐ½±
	{1, 1, "Ch«m Ch«m", {2, 1, 30165, 1}},
	{1, 1, "Nh·n", {2, 1, 30164, 1}},
	{1, 1, "Cam", {2, 1, 30166, 1}},
	{1, 1, "Dõa", {2, 1, 30167, 1}},
	{1, 1, "M¨ng côt", {2, 1, 30168, 1}},
	{1, 1, "B­ëi", {2, 1, 30169, 1}},
	{1, 1, "D©u", {2, 1, 30170, 1}},
	{1, 1, "Chuèi", {2, 1, 30171, 1}},
	{1, 1, "Xoµi", {2, 1, 30172, 1}},
	{1, 1, "§µo", {2, 1, 30173, 1}},
	{1, 1, "MËn", {2, 1, 30174, 1}},
	{1, 1, "V¶i", {2, 1, 30175, 1}},
	{1, 1, "T¸o", {2, 1, 30176, 1}},
	{1, 1, "B¬", {2, 1, 30177, 1}},
	{1, 1, "§u §ñ", {2, 1, 30178, 1}},
	{1, 1, "M·ng cÇu", {2, 1, 30179, 1}},
	{1, 1, "Khãm", {2, 1, 30180, 1}},
	{1, 1, "Lª", {2, 1, 30181, 1}},
	{1, 1, "Bßn Bon", {2, 1, 30182, 1}},
	{1, 1, "KhÕ", {2, 1, 30183, 1}}
}
FG_SPECIAL_TREE_ITEM_BONUS_TABLE = 
{
	{31, 80, ""}, -- ²»ÖÐ½±
	{1, 1, "Ch«m Ch«m", {2, 1, 30165, 1}},
	{1, 1, "Nh·n", {2, 1, 30164, 1}},
	{1, 1, "Cam", {2, 1, 30166, 1}},
	{1, 1, "Dõa", {2, 1, 30167, 1}},
	{1, 1, "M¨ng côt", {2, 1, 30168, 1}},
	{1, 1, "B­ëi", {2, 1, 30169, 1}},
	{1, 1, "D©u", {2, 1, 30170, 1}},
	{1, 1, "Chuèi", {2, 1, 30171, 1}},
	{1, 1, "Xoµi", {2, 1, 30172, 1}},
	{1, 1, "§µo", {2, 1, 30173, 1}},
	{1, 1, "MËn", {2, 1, 30174, 1}},
	{1, 1, "V¶i", {2, 1, 30175, 1}},
	{1, 1, "T¸o", {2, 1, 30176, 1}},
	{1, 1, "B¬", {2, 1, 30177, 1}},
	{1, 1, "§u §ñ", {2, 1, 30178, 1}},
	{1, 1, "M·ng cÇu", {2, 1, 30179, 1}},
	{1, 1, "Khãm", {2, 1, 30180, 1}},
	{1, 1, "Lª", {2, 1, 30181, 1}},
	{1, 1, "Bßn Bon", {2, 1, 30182, 1}},
	{1, 1, "KhÕ", {2, 1, 30183, 1}}
}


FG_MAPS = 
{
	6001,
	6002,
	6003,
	6004,
	6005
};

FG_MAP_MAP = 
{
	[100] = FG_MAPS[3],
	[150] = FG_MAPS[5],
	[200] = FG_MAPS[2],
	[300] = FG_MAPS[1],
	[350] = FG_MAPS[4]
};

FG_EXIT_POINTS = 
{
	[FG_MAPS[1]] = {300, 1760, 3632},	
	[FG_MAPS[2]] = {200, 1447, 2908},	
	[FG_MAPS[3]] = {100, 1403, 2916},	
	[FG_MAPS[4]] = {350, 1351, 2900},	
	[FG_MAPS[5]] = {150, 1727, 3175}
};

FG_TREE_SPAWN_POINTS =
{
	{1541, 3160}, {1529, 3189}, {1539, 3222}, {1553, 3188},
	{1695, 3170}, {1675, 3189}, {1678, 3216}, {1699, 3199},
	{1634, 3444}, {1628, 3473}, {1653, 3478}, {1634, 3502},
	{1542, 3394}, {1527, 3359}, {1544, 3343}, {1557, 3365},
	{1579, 3180}, {1594, 3200}, {1606, 3178}, {1590, 3155},	
	{1684, 3307}, {1679, 3286}, {1695, 3264}, {1703, 3283},
	{1688, 3506}, {1677, 3476}, {1688, 3448}, {1702, 3484},
	{1536, 3507}, {1528, 3475}, {1541, 3448}, {1561, 3461}
};

FG_BOSS_SPAWN_POINT = 
{
	1615, 3331
};

FG_TIMER_INTERVAL = 30 * 18;
FG_ZONE_MAX_TEAM_COUNT = 4;

FG_NORMAL_TREE_TEMPLATE = "C©y hoa qu¶";
FG_NORMAL_TREE_NAME = "C©y hoa qu¶";
FG_NORMAL_TREE_VALUE = 1;
FG_SPECIAL_TREE_TEMPLATE = "C©y B¹ch Kim";
FG_SPECIAL_TREE_NAME = "C©y B¹ch Kim";
FG_SPECIAL_TREE_VALUE = 2;
FG_BOSS1_TEMPLATE = "TÒ Thiªn §¹i Th¸nh ";
FG_BOSS1_NAME = "TÒ Thiªn §¹i Th¸nh ";
FG_BOSS2_TEMPLATE = "TÒ Thiªn §¹i Th¸nh  2";
FG_BOSS2_NAME = "TÒ Thiªn §¹i Th¸nh ";
FG_CHEST_TEMPLATE = "B¶o r­¬ng Tµi nguyªn";
FG_CHEST_NAME = "B¶o R­¬ng Mü HÇu V­¬ng";

FG_MONSTERS = 
{
	{"Thiªn §×nh T¹p C«ng", "Thiªn §×nh T¹p C«ng", 1},
	{"Thiªn §×nh TiÓu Tèt", "Thiªn §×nh TiÓu Tèt", 1},
	{"Thiªn §×nh T¸n Tiªn Tö", "Thiªn §×nh T¸n Tiªn Tö", 2},
	{"Thiªn §×nh CÇm Tiªn Tö", "Thiªn §×nh CÇm Tiªn Tö", 2},
	{"Thiªn §×nh Tiªu Tiªn Tö", "Thiªn §×nh Tiªu Tiªn Tö", 2},
	{"Thiªn §×nh T× Bµ Tiªn Tö", "Thiªn §×nh T× Bµ Tiªn Tö", 2}, 
	{"Thiªn §×nh Hé VÖ Tr­ëng", "Thiªn §×nh Hé VÖ Tr­ëng", 4},
	{"Thiªn §×nh B¸ch Phu Tr­ëng", "Thiªn §×nh B¸ch Phu Tr­ëng", 4},
	{"Ph©n Th©n Long ThÇn", "Ph©n Th©n Long ThÇn", 10},
	{"Ph©n Th©n Phông ThÇn", "Ph©n Th©n Phông ThÇn", 10},
	{"Ph©n Th©n Hæ ThÇn", "Ph©n Th©n Hæ ThÇn", 10},
	{"Ph©n Th©n ¦ng ThÇn", "Ph©n Th©n ¦ng ThÇn", 10}
};

FG_MONSTER_SPAWN_RULE = 
{
	{0, 5, 
		{
			{1, 4100},
			{2, 4100},
			{3, 400},
			{4, 400},
			{5, 400},
			{6, 400},
			{7, 100},
			{8, 100}
		},
	8},
	{6, 20,
		{
			{1, 800},
			{2, 800},
			{3, 2000},
			{4, 2000},
			{5, 2000},
			{6, 2000},
			{7, 200},
			{8, 200}
		},
	8},
	{21, 40,
		{
			{3, 1500},
			{4, 1500},
			{5, 1500},
			{6, 1500},
			{7, 2000},
			{8, 1900},
			{9, 25},
			{10, 25},
			{11, 25},
			{12, 25}
		},
	8},	
	{41, 60,
		{
			{7, 4500},
			{8, 4500},
			{9, 25},
			{10, 25},
			{11, 25},
			{12, 25}	
		},
	8},		
	{61, 10000,
		{
			{9, 2500},
			{10, 2500},
			{11, 2500},
			{12, 2500}	
		},
	1}
}

FG_MAP_TASK_KEYS_TEAM_COUNT = 
{
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9
};
FG_MAP_TASK_KEYS_ZONE_MONSTER_VALUE =  
{
	10, 
	11, 
	12, 
	13,
	14,
	15,
	16,
	17,
	18
}

FG_MAP_TASK_KEY_STATE = 19;
FG_MAP_TASK_KEY_TIMER_LOOP = 20;
FG_MAP_TASK_KEY_CHEST_INDEX = 21;
FG_MAP_TASK_KEY_TREE_BEING_GATHERED = {};
for i=1, getn(FG_TREE_SPAWN_POINTS) do
	FG_MAP_TASK_KEY_TREE_BEING_GATHERED[i] = FG_MAP_TASK_KEY_CHEST_INDEX + i;
end

FG_TEMP_TASK_KEY_ZONE_INDEX = VET_201012_06_TASK_TEMP_ZONE_INDEX;

FG_STATE_NONE = 0;
FG_STATE_INITING = 1;
FG_STATE_RUNNING = 2;
FG_STATE_ENDING = 3;

FG_STATE_TIME_LOOP = 
{
	[FG_STATE_NONE] = 0,
	[FG_STATE_INITING] = 5 * 60 * 18 / FG_TIMER_INTERVAL - 1,
	[FG_STATE_RUNNING] = 20 * 60 * 18 / FG_TIMER_INTERVAL - 1,
	[FG_STATE_ENDING] = 1
};

FG_PLAYER_SPAWN_POINTS = 
{
	{1546, 3141, "Ký hiÖu Gi¸p v­ên Xu©n"},
	{1682, 3175, "Ký hiÖu Gi¸p v­ên H¹"},
	{1655, 3431, "Ký hiÖu Gi¸p v­ên Thu"},
	{1531, 3405, "Ký hiÖu Gi¸p v­ên §«ng"},
	{1579, 3218, "Ký hiÖu Êt v­ên Xu©n"},
	{1704, 3312, "Ký hiÖu Êt v­ên H¹"},
	{1670, 3514, "Ký hiÖu Êt v­ên Thu"},
	{1558, 3492, "Ký hiÖu Êt v­ên §«ng"}
};

FG_PLAYER_SPECIAL_SPAWN_POINT = 
{
	1633, 3338
};

function FG_GetTreeIndex(npcIndex)
	local result = 0;
	local mapID, x, y = GetNpcWorldPos(npcIndex);
	for i=1, getn(FG_TREE_SPAWN_POINTS) do
		if FG_TREE_SPAWN_POINTS[i][1] == x and FG_TREE_SPAWN_POINTS[i][2] == y then
			result = i;
			break;
		end
	end
	return result;
end

function FG_SetTreeGatherState(npcIndex, beingGathered)
	--WriteLog("FG_SetTreeGatherState::npcIndex: "..npcIndex..", beingGathered: "..beingGathered);
	local mapID, x, y = GetNpcWorldPos(npcIndex);
	local index = FG_GetTreeIndex(npcIndex);
	mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TREE_BEING_GATHERED[index], beingGathered, mapID);
end

function FG_DestroyTree(npcIndex)
	local index = FG_GetTreeIndex(npcIndex);
	local mapID, x, y = GetNpcWorldPos(npcIndex);
	--WriteLog("FG_DestroyTree::npcIndex: "..npcIndex..", mapID: "..mapID..", x: "..x..", y: "..y..", index: "..index);
	SetNpcLifeTime(npcIndex, 0);
	if 0 < index then
		return mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TREE_BEING_GATHERED[index], 0, mapID);
	end
end

function FG_GetTreeGatherState(npcIndex)
	local result = -1;
	local index = FG_GetTreeIndex(npcIndex);
	local mapID, x, y = GetNpcWorldPos(npcIndex);
	if 0 < index then
		result = mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TREE_BEING_GATHERED[index], mapID);
	else
		result = -1;
	end
	--WriteLog("FG_GetTreeGatherState::npcIndex: "..npcIndex..", mapID: "..mapID..", x: "..x..", y: "..y..", index: "..index..", result: "..result);	
	return result;
end

function FG_GetMonsterValue(npcIndex)
	local result = 0;
	local npcName = GetNpcName(npcIndex);
	for i=1, getn(FG_MONSTERS) do
		if FG_MONSTERS[i][1] == npcName then
			result = FG_MONSTERS[i][3];
			break;
		end
	end
	return result;
end

function FG_GetZoneIndex(x, y)
	local zoneIndex = 0;
	for i=1, getn(FG_TREE_SPAWN_POINTS) do
		if FG_TREE_SPAWN_POINTS[i][1] == x and FG_TREE_SPAWN_POINTS[i][2] == y then
			zoneIndex = mod(i-1, 4) + 1
			break;
		end
	end
	--WriteLog("FG_GetZoneIndex::x: "..x..", y: "..y..", zoneIndex: "..zoneIndex);
	return zoneIndex;
end

function FG_AddZoneMonsterValue(mapID, zoneIndex, monsterValue)
	local oldMonsterValue = FG_GetZoneMonsterValue(mapID, zoneIndex);
	--WriteLog("FG_AddZoneMonsterValue::mapID: "..mapID..", zoneIndex: "..zoneIndex..", monsterValue: "..monsterValue..", oldMonsterValue: "..oldMonsterValue);	
	--WriteLog("FG_AddZoneMonsterValue::FG_MAP_TASK_KEYS_ZONE_MONSTER_VALUE[zoneIndex]: "..FG_MAP_TASK_KEYS_ZONE_MONSTER_VALUE[zoneIndex]);
	mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEYS_ZONE_MONSTER_VALUE[zoneIndex], oldMonsterValue+monsterValue, mapID);
end

function FG_GetZoneMonsterValue(mapID, zoneIndex)
	local result = mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEYS_ZONE_MONSTER_VALUE[zoneIndex], mapID);
	--WriteLog("FG_GetZoneMonsterValue::mapID: "..mapID..", zoneIndex: "..zoneIndex..", result: "..result);
	return result;
end

function FG_SpawnTrees(mapID)
	--WriteLog("FG_SpawnTrees::mapID: "..mapID);
	local pos = 0;
	local specialTreeCount = 0;
	local spawnTable = {};
	for i=1, getn(FG_TREE_SPAWN_POINTS) do
		spawnTable[i] = 0;
	end
	while 4 > specialTreeCount do
		pos = random(1, 32);
		if spawnTable[pos] == 0 then
			spawnTable[pos] = 1;
			specialTreeCount = specialTreeCount + 1;
		end
	end
	for i=1, getn(FG_TREE_SPAWN_POINTS) do
		local npcIndex = 0;
		local zoneIndex = FG_GetZoneIndex(FG_TREE_SPAWN_POINTS[i][1], FG_TREE_SPAWN_POINTS[i][2]);
		--WriteLog("FG_SpawnTrees::zoneIndex: "..zoneIndex);
		if 0 == spawnTable[i] then
			npcIndex = CreateNpc(FG_NORMAL_TREE_TEMPLATE, FG_NORMAL_TREE_NAME, mapID, FG_TREE_SPAWN_POINTS[i][1], FG_TREE_SPAWN_POINTS[i][2]); 
			FG_AddZoneMonsterValue(mapID, zoneIndex, FG_NORMAL_TREE_VALUE);
		else
			npcIndex = CreateNpc(FG_SPECIAL_TREE_TEMPLATE, FG_SPECIAL_TREE_NAME, mapID, FG_TREE_SPAWN_POINTS[i][1], FG_TREE_SPAWN_POINTS[i][2]); 
			FG_AddZoneMonsterValue(mapID, zoneIndex, FG_SPECIAL_TREE_VALUE);
		end
		SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_06\\npc\\xtree.lua");
		FG_SetTreeGatherState(npcIndex, 0);
	end
end

function FG_SpawnMonster(mapID, x, y, chances)
	WriteLog("FG_SpawnMonster::mapID: "..mapID..", x: "..x..", y: "..y..", chances: "..tostring(chances));
	local monsterIndex = 0;
	local chance = random(1, 1000);
	local tmp = 0;
	local zoneIndex = FG_GetZoneIndex(x, y);
	for i=1, getn(chances) do
		tmp = tmp + chances[i][2];
		if tmp >= chance then
			monsterIndex = chances[i][1];
			break;
		end
	end
	WriteLog("FG_SpawnMonster::chance: "..chance..", monsterIndex: "..monsterIndex);	
	if 0 < monsterIndex then
		local delta = random(-5, 5);
		local npcIndex = CreateNpc(FG_MONSTERS[monsterIndex][2], FG_MONSTERS[monsterIndex][1], mapID, x+delta, y+delta);
		FG_AddZoneMonsterValue(mapID, zoneIndex, FG_MONSTERS[monsterIndex][3]);
		SetNpcDeathScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_06\\npc\\monster_death.lua");
	else
		--WriteLog("FG_SpawnMonster::internal error, invalid monster index");
	end
end

function FG_SpawnMonsters(mapID, x, y)
	--WriteLog("FG_SpawnMonsters::mapID: "..mapID..", x: "..x..", y: "..y);
	local zoneIndex = FG_GetZoneIndex(x, y);
	local monsterValue = FG_GetZoneMonsterValue(mapID, zoneIndex);
	local chances, monsterCount = 0;
	--WriteLog("FG_SpawnMonsters::monsterValue: "..monsterValue);
	for i=1, getn(FG_MONSTER_SPAWN_RULE) do
		if monsterValue >= FG_MONSTER_SPAWN_RULE[i][1] and monsterValue <= FG_MONSTER_SPAWN_RULE[i][2] then
			chances = FG_MONSTER_SPAWN_RULE[i][3];
			monsterCount = FG_MONSTER_SPAWN_RULE[i][4];
			break;
		end
	end
	--WriteLog("FG_SpawnMonsters::monsterCount: "..monsterCount);
	for i=1, monsterCount do
		FG_SpawnMonster(mapID, x, y, chances);
	end
end

function FG_SpawnBoss1(mapID)
	--WriteLog("FG_SpawnBoss1::mapID: "..mapID);
	local npcIndex = CreateNpc(FG_BOSS1_TEMPLATE, FG_BOSS1_NAME, mapID, FG_BOSS_SPAWN_POINT[1], FG_BOSS_SPAWN_POINT[2]);
	SetNpcDeathScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_06\\npc\\boss1_death.lua");
end

function FG_SpawnBoss2(mapID, x, y)
	--WriteLog("FG_SpawnBoss2::mapID: "..mapID);
	local npcIndex = CreateNpc(FG_BOSS2_TEMPLATE, FG_BOSS2_NAME, mapID, x, y);
	SetNpcDeathScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_06\\npc\\boss2_death.lua");
end

function FG_SpawnChest(mapID, x, y)
	--WriteLog("FG_SpawnChest::mapID: "..mapID);
	local npcIndex = CreateNpc(FG_CHEST_TEMPLATE, FG_CHEST_NAME, mapID, x, y);
	SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_06\\npc\\treasure_chest.lua");
	mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_CHEST_INDEX, npcIndex, mapID);
end

function FG_DestroyChest(mapID)
	--WriteLog("FG_DestroyChest::mapID: "..mapID);
	local npcIndex = mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_CHEST_INDEX, mapID);
	SetNpcLifeTime(npcIndex, 0);
	mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_CHEST_INDEX, 0, mapID);
end

function FG_IsZoneFull(mapID, zoneIndex)	
	if FG_ZONE_MAX_TEAM_COUNT > mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEYS_TEAM_COUNT[zoneIndex], mapID) then
		return 0;
	else
		return 1;
	end
end

function FG_CheckPlayer(index)
	local result = 0;
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = index;
	--WriteLog("FG_CheckPlayer::GetName(): "..GetName()..", GetLevel(): "..GetLevel()..", GetPlayerFaction(): ".. GetPlayerFaction());
	if 80 <= GetLevel() then
		if 0 ~= GetPlayerFaction() then
			if 1 == gf_Check55FullSkill() then
				result = 1;
			end
		end
	end
	PlayerIndex = oldPlayerIndex;
	--WriteLog("FG_CheckPlayer::result: "..result);
	return result;
end

function FG_SetPlayer()
	SetFightState(1);
	SetLogoutRV(1);
	SetCreateTeam(1);
	SetPKFlag(0, 0);
	ForbidChangePK(1);	
end

function FG_ResetPlayer()
	SetFightState(0);
	ForbidChangePK(0);		
	SetFightState(0);		
	SetPKFlag(0, 0);	
end

function FG_TeamEnter(mapID, zoneIndex)
	--WriteLog("FG_TeamEnter::mapID: "..mapID..", zoneIndex: "..zoneIndex);
	if 1 ~= FG_IsZoneFull(mapID, zoneIndex) then
		local teamSize = GetTeamSize();
		local oldPlayerIndex = PlayerIndex;
		local chance = random(1, 1000);
		if 1000 == chance then
			zoneIndex = 9;
		end	
		--WriteLog("FG_TeamEnter::teamSize: "..teamSize);
		for i=1, teamSize do
			PlayerIndex = GetTeamMember(i);
			--WriteLog("FG_TeamEnter::PlayerIndex: "..PlayerIndex);
			FG_Enter(mapID, zoneIndex);
		end
		PlayerIndex = oldPlayerIndex;
		mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEYS_TEAM_COUNT[zoneIndex], mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEYS_TEAM_COUNT[zoneIndex])+1);
	end
end

function FG_GetPlayerZoneIndex()
	return GetTaskTemp(FG_TEMP_TASK_KEY_ZONE_INDEX);
end

function FG_Enter(mapID, zoneIndex)
	--WriteLog("FG_Enter::mapID: "..mapID..", zoneIndex: "..zoneIndex..", GetName(): "..GetName());
	if 1 <= zoneIndex and 8 >= zoneIndex then
		NewWorld(mapID, FG_PLAYER_SPAWN_POINTS[zoneIndex][1], FG_PLAYER_SPAWN_POINTS[zoneIndex][2]);
		Msg2Player("C¸c b¹n ®· ®Õn"..FG_PLAYER_SPAWN_POINTS[zoneIndex][3].."V­ên c©y");
	else
		NewWorld(mapID, FG_PLAYER_SPECIAL_SPAWN_POINT[1], FG_PLAYER_SPECIAL_SPAWN_POINT[2]);
		Msg2Player("C¸c h¹ kh«ng hiÓu t¹i sao m×nh l¹i bÞ chuyÓn ®Õn 1 khu v­ên c©y kú l¹"); 
	end
	SetTaskTemp(FG_TEMP_TASK_KEY_ZONE_INDEX, zoneIndex);
	FG_SetPlayer();
end

function FG_SetState(mapID, state)
	--WriteLog("FG_SetState::mapID: "..mapID..", state: "..state);
	mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_STATE, state, mapID);
	mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TIMER_LOOP, FG_STATE_TIME_LOOP[state], mapID);

	if state == FG_STATE_RUNNING then
		ClearMapNpc(mapID);
		FG_SpawnTrees(mapID);
		FG_SpawnBoss1(mapID);
	end
end

function FG_GetState(mapID)
	--WriteLog("FG_GetState::mapID: "..mapID);
	return mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_STATE, mapID);
end

function FG_Start()
	--WriteLog("FG_Start::called");
	for i=1, getn(FG_MAPS) do
		--WriteLog("FG_Start::FG_MISSION_ID: "..FG_MISSION_ID..", FG_MAPS[i]: "..FG_MAPS[i]);
		mf_OpenMission(FG_MISSION_ID, FG_MAPS[i]);
	end;
end

function FG_DeleteAllPlayers()
	local playerIndices = mf_GetMSPlayerIndex(MISSION_ID,0);
	local oldPlayerIndex = PlayerIndex;
	for i=1,getn(playerIndices) do
		PlayerIndex = playerIndices[i];
		if PlayerIndex > 0 then
			DelMSPlayer(FG_MISSION_ID, FG_CAMP_ID);
		end
	end;
	PlayerIndex = oldPlayerIndex;
end;

function FG_Init()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("FG_Init::SubWorld: "..SubWorld..", mapID: "..mapID);
	StartMissionTimer(FG_MISSION_ID, FG_TIMER_ID, FG_TIMER_INTERVAL);
	--WriteLog("FG_Init::FG_STATE_INITING: "..FG_STATE_INITING);		
	FG_SetState(mapID, FG_STATE_INITING);
	--WriteLog("FG_Init::FG_GetState(mapID): "..FG_GetState(mapID));
	RunMission(FG_MISSION_ID);
end

function FG_End()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_End::SubWorld: "..SubWorld..", mapID: "..mapID);
	StopMissionTimer(FG_MISSION_ID, FG_TIMER_ID);
	FG_DeleteAllPlayers();
	ClearMapNpc(mapID, 1);
	mf_ClearMissionData(mapID);
end

function FG_OnTimer()
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TIMER_LOOP, mapID);
	if 0 == loopCount then
		local state = FG_GetState(mapID);
		if FG_STATE_INITING == state then
			FG_SetState(mapID, FG_STATE_RUNNING);
		elseif FG_STATE_RUNNING == state then
			FG_SetState(mapID, FG_STATE_ENDING);
		elseif FG_STATE_ENDING == state then
			CloseMission(FG_MISSION_ID);
		end
	else
		loopCount = loopCount - 1;
		mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TIMER_LOOP, loopCount, mapID);
	end
end

function FG_IsInGatherMap()
	local result = 0;
	local mapID = GetWorldPos();
	for i=1, getn(FG_MAPS) do
		if FG_MAPS[i] == mapID then
			result = 1;
			break;
		end
	end
	return result;
end

function FG_GetMembersLeftCount()
	local teamSize = GetTeamSize();
	local result = 1;
	for i=1, teamSize do
		local oldPlayerIndex = PlayerIndex;
		PlayerIndex = GetTeamMember(i);
		if FG_IsInGatherMap() and 0 == IsPlayerDeath() then
			result = result + 1;
		end
		PlayerIndex = oldPlayerIndex;
	end
	return result;
end

function FG_IsSpecialTree(npcIndex)
	local npcName = GetNpcName(npcIndex);
	if npcName == FG_SPECIAL_TREE_NAME then
		return 1
	else
		return 0
	end
end

function FG_GetGatherMap(mapID)
	return FG_MAP_MAP[mapID];
end

function FG_Join()
	AddMSPlayer(FG_MISSION_ID, FG_CAMP_ID);
end

function FG_MoveToExitPoint()
	local mapID = GetWorldPos();
	local exitPoint = FG_EXIT_POINTS[mapID];
	if nil ~= exitPoint then
		NewWorld(exitPoint[1], exitPoint[2], exitPoint[3]);
	end
end

function FG_Leave()
	if GetName() == GetCaptainName() then
		local teamSize = GetTeamSize();
		local oldPlayerIndex = PlayerIndex;		
		for i=1, teamSize do
			if PlayerIndex ~= GetTeamMember[i] then
				PlayerIndex = GetTeamMember[i];
				DelMSPlayer(FG_MISSION_ID, FG_CAMP_ID);	
			end
		end
		PlayerIndex = oldPlayerIndex;
	end
	FG_MoveToExitPoint();
	FG_RemoveTrigger();
	FG_ResetPlayer();
end

function FG_RemoveTrigger()
	local triggerIndex = GetTrigger(FG_TRIGGER_ID);
	--WriteLog("FG_RemoveTrigger::GetName(): "..GetName()..", triggerIndex: "..triggerIndex);
	if 0 < triggerIndex then
		RemoveTrigger(triggerIndex);
	end
end

function FG_GatherSuccess()
	--WriteLog("FG_GatherSuccess::called");
	local teamSize = GetTeamSize();	
	local npcIndex = GetTaskTemp(FG_TEMP_TASK_KEY_GATHER_TREE_INDEX);
	local expBonusTable = {{2, 100, 0, 1}}
	local itemBonusTable = {};
	if 1 == FG_IsSpecialTree(npcIndex) then
		expBonusTable[1][3] = FG_SPECIAL_TREE_EXP_BONUS * teamSize;
		itemBonusTable = FG_SPECIAL_TREE_ITEM_BONUS_TABLE;
	else 
		expBonusTable[1][3] = FG_NORMAL_TREE_EXP_BONUS * teamSize;
		itemBonusTable = FG_NORMAL_TREE_ITEM_BONUS_TABLE;
	end

	local itemID = {};
	local itemName = "";
	local chance = random(1, 100);
	WriteLog("FG_GatherSuccess::chance: "..chance);
	local tmp = 0;
	for i=1, getn(itemBonusTable) do
		tmp = tmp + itemBonusTable[i][2];
		if tmp >= chance then
			if 1 == itemBonusTable[i][1] then
				itemID = itemBonusTable[i][4];
				itemName = itemBonusTable[i][3];
			end
			break;	
		end
	end
	for i=1, teamSize do
		local oldPlayerIndex = PlayerIndex;
		PlayerIndex = GetTeamMember(i);
		if "" ~= itemName then
			gf_AddItemEx2(itemID, itemName, "2010_12.06_fruit_gathering", "tree_item_bonus");
		end
		gf_EventGiveRandAward(expBonusTable, 100, 1, "2010_12.06_fruit_gathering", "tree_exp_bonus");				
		PlayerIndex = oldPlayerIndex;
	end
	-- release the tree
	local index = FG_GetTreeIndex(npcIndex);
	local mapID, x, y = GetNpcWorldPos(npcIndex);
	if 0 < index then
		return mf_SetMissionV(FG_MISSION_ID, FG_MAP_TASK_KEY_TREE_BEING_GATHERED[index], 0, mapID);
	end	
end

function FG_GatherFailure()
	FG_RemoveTrigger();
	SetTaskTemp(FG_TEMP_TASK_KEY_GATHER_TREE_INDEX, 0);
end

function FG_OnPlayerLogin()
	FG_RemoveTrigger();
end

function main()
	do return end
	local curDate = tonumber(date("%Y%m%d%H"));
	if FG_StartDate <= curDate and FG_EndDate >= curDate then
		FG_Start();
	end
end

function FG_TestKillBoss()
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == FG_BOSS1_NAME then
			Death(npcIndices[i]);
		end
	end		
end