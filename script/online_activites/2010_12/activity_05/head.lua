Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\missionfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\task_access_code_def.lua")

CR_TEMPLATE = "Giang hå hµo kiÖt";
CR_NAME = "Xa phu ®Êu tr­êng tuyÕt";

SB_ACTIVITY_ID = 23;
SB_COST = 50000; --201301ÖØ¿ª»î¶¯ÐÞ¸Ä
SB_MIN_LEVEL = 80; --201301ÖØ¿ª»î¶¯ÐÞ¸Ä
SB_MAX_EXP = 10000000;
SB_MAX_ZHENQI = 800;
SB_TASK_KEY_ENTRANCE_MAP_INDEX = VET_201012_05_TASK_ENTRANCE_MAP_INDEX;
SB_TASK_KEY_EXP_GAINED = VET_201012_05_TASK_EXP_GAINED;
SB_TASK_KEY_ZHENQI_GAINED = VET_201212_05_TASK_ZHENQI_GAINED;
SB_MISSION_ID = 52;
SB_MISSION_TIMER_ID = 81;
SB_WAVE_TIMER_ID = 83;
SB_TIMER_INTERVAL = 30 * 18;
SB_MISSION_TIMER_COUNT = 60 * 60 * 18 / SB_TIMER_INTERVAL - 1;
SB_WAVE_TIMER_COUNT = 60 * 5 * 18 / SB_TIMER_INTERVAL - 1;
SB_CAMP_ID = 1;
SB_MAX_PLAYER = 100;
SB_MAP_TASK_KEY_STATE = 1;
SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE = 2;
SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX = 3;
SB_MAP_TASK_KEY_ATTACK_BOSS_INDEX = 4;
SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE = 5;
SB_MAP_TASK_KEY_MISSION_TIMER_LOOP = 6;
SB_MAP_TASK_KEY_WAVE_TIMER_LOOP = 7;
SB_MAP_TASK_KEY_WAVE_TIMEOUT = 8;

SB_MONSTER_WAVE_THRESHOLD = 10;
SB_MAX_TIME = 60 * 60 * 18;

SB_MonsterSpawnPointList = 
{
	{1729, 3354},
	{1759, 3275},
	{1818, 3291},
	{1822, 3399},
	{1795, 3527},
	{1753, 3592},
	{1689, 3562},
	{1696, 3461},
	{1670, 3373},
	{1728, 3362}
};

SB_BossSpawnPoint = 
{
	1756, 
	3427
}

SB_CarterSpawnPointList = 
{
	{1665, 3652},
	{1665, 3224},
	{1857, 3226},
	{1856, 3652},
}

SB_DIALOG_BOSS_TEMPLATE = "BOSS tuyÕt yªu ®èi tho¹i";
SB_DIALOG_BOSS_NAME = "Thiªn S¬n TuyÕt Yªu (®èi tho¹i)";
SB_ATTACK_BOSS_TEMPLATE = "BOSS tuyÕt yªu chiÕn ®Êu";
SB_ATTACK_BOSS_NAME = "Thiªn S¬n TuyÕt Yªu (boss)";
SB_MONSTER1_TEMPLATE = "TuyÕt qu¸i 1";
SB_MONSTER1_NAME = "TiÓu TuyÕt Qu¸i";
SB_MONSTER1_COUNT = 20;
SB_MONSTER2_TEMPLATE = "TuyÕt qu¸i 3";
SB_MONSTER2_NAME = "§¹i TuyÕt Qu¸i";
SB_MONSTER2_COUNT = 4;
SB_MONSTER_COUNT_PER_WAVE = getn(SB_MonsterSpawnPointList) * (SB_MONSTER1_COUNT+SB_MONSTER2_COUNT)

SB_ExitSpawnPoint = {
	{100, 1365, 2932},	--ÈªÖÝ
	{200, 1409, 3048},	--ãê¾©
	{300, 1820, 3573},	--³É¶¼
};

SB_MapList = 
{
	963,
	962,
	961
}

SB_MapMap = 
{
	[100] = SB_MapList[1],
	[200] = SB_MapList[2],
	[300] = SB_MapList[3]
};

SB_SkillList = 
{
	30001,
	30002,
	30003,
	30004,
	30005,
	30006,
	30007,
	30008,
	30009
};

SB_PlayerSpawnPointList = 
{
	{1859,3230},
	{1664,3654},
	{1664,3229},
	{1854,3654}
};



SB_MapList = 
{
	961, 
	962,
	963
};

function SB_HandleExp(exp, zqValue)
	--Ð¡¹Ö¸ø¾­Ñé
	local expGained = GetTask(SB_TASK_KEY_EXP_GAINED);
	if expGained < SB_MAX_EXP then
		local realExp = exp;
		if exp + expGained >= SB_MAX_EXP then
			realExp = SB_MAX_EXP - expGained;
		end
		ModifyExp(realExp);
		SetTask(SB_TASK_KEY_EXP_GAINED, GetTask(SB_TASK_KEY_EXP_GAINED)+realExp);
	else
		Msg2Player("§iÓm kinh nghiÖm tiªu diÖt qu¸i nhá trong trËn nµy ®· ®¹t giíi h¹n, kh«ng thÓ nhËn thªm ®iÓm kinh nghiÖm khi tiªu diÖt qu¸i nhá");
	end
	--¸øÓèÕæÆø
	local zqGained = GetTask(SB_TASK_KEY_ZHENQI_GAINED);
	if zqGained < SB_MAX_ZHENQI then
		local realZQ = zqValue;
		if zqValue + zqGained >= SB_MAX_ZHENQI then
			realZQ = SB_MAX_ZHENQI - zqGained;
		end
		AwardGenuineQi(realZQ);
		SetTask(SB_TASK_KEY_ZHENQI_GAINED, GetTask(SB_TASK_KEY_ZHENQI_GAINED) + realZQ, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN);
	else
		Msg2Player("Sè l­îng ch©n khÝ khi diÖt qu¸i nhËn ®­îc trong trËn nµy cña c¸c h¹ ®· ®¹t giíi h¹n, kh«ng thÓ nhËn thªm ch©n khÝ khi giÕt qu¸i");
	end
end

function SB_IsInSnowMap()
	local mapID = GetWorldPos()
	local result = 0;
	for i=1, getn(SB_MapList) do
		if mapID == SB_MapList[i] then
			result = 1;
			break;
		end
	end
	return result;
end

function SB_GetMonsterWave(mapID)
	return mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, mapID);
end

function SB_IsMonsterWaveKilled(mapID)
	local killedCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, mapID);
	if killedCount >= SB_MONSTER_COUNT_PER_WAVE then
		return 1;
	else
		return 0;
	end
end

function SB_IsMonsterWaveTimeout(mapID)
	if 1 == mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, mapID) then
		return 1;
	else
		return 0;
	end
end

function SB_LearnSkill()
	for i=1, getn(SB_SkillList) do
		--WriteLog("SB_LearnSkill::skillID: "..SB_SkillList[i])
		LearnSkill(SB_SkillList[i]);
	end
end

function SB_SetState()
	StallEnable(0);
	SetPKFlag(2,1);
	ForbidChangePK(1);
	LeaveTeam();
	ForbidRead(1); -- ÏÂÏß»áÇå³ý
	SetCreateTeam(1);
	RemvoeTempEffect();
	CleanInteractive();
	SetTask(SB_TASK_KEY_EXP_GAINED, 0);
	SetTask(SB_TASK_KEY_ZHENQI_GAINED, 0, TASK_ACCESS_CODE_CHRISTMASSNOWDOWN);
end

function SB_ResetState()
	--WriteLog("SB_ResetState::GetName(): "..GetName());
	ForbidChangePK(0);		
	SetFightState(0);		
	SetPKFlag(0, 0);
	ForbitTrade(0);
	SetCreateTeam(0);
	InteractiveEnable(1);
	for i=1, getn(SB_SkillList) do
		--WriteLog("SB_ResetState::skillID: "..SB_SkillList[i]);
		if 1 == HaveLearnedSkill(SB_SkillList[i]) then
			RemoveSkill(SB_SkillList[i])
		end;
	end
end

function SB_CheckEquipment()
	local result = 1;
	for i=0, 12 do
		if 1 ~= i and 3 ~=i and 10 ~= i and 11 ~= i then
			local genre, detail, particular = GetPlayerEquipInfo(i);
			if genre ~= 0 or detail ~= 0 or particular ~= 0 then
				result = 0;
				break;
			end
		end;
	end;
	return result;
end

function SB_CheckPlayerCount(mapID)
	local playerCount = mf_GetPlayerCount(SB_MISSION_ID, SB_CAMP_ID, mapID);
	if SB_MAX_PLAYER <= playerCount then
		return 0
	else
		return 1
	end
end

function SB_CheckState(mapID)
	--WriteLog("SB_CheckState::mapID: "..mapID);
	if 1 == mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, mapID) then
		return 1;
	else
		return 0;
	end
end

function SB_LockEquipment(lock)
	local equipPositions = {0,1,2,3,4,5,6,7,8,10};
	for i=1,getn(equipPositions) do
		ForbidEquipSolt(equipPositions[i], lock);
	end;
end;

function SB_OnEntered()
	SB_SetState();
	SB_LearnSkill();
	SB_LockEquipment(1);	
	gf_WriteLogEx("NEM TUYET 022013bk", "kick ho¹t thµnh c«ng", 1, "B¸o danh tham gia ®¸nh tuyÕt")
end

function SB_Join()
	local mapID = GetWorldPos();
  mapID = SB_MapMap[mapID];
	if 1 == Pay(SB_COST) then
		local spawnPoint = SB_PlayerSpawnPointList[random(1, getn(SB_PlayerSpawnPointList))];
		--ÕâÀïÓÐË¢µÄBUG
		CleanInteractive();
		if 1 == NewWorld(mapID, spawnPoint[1], spawnPoint[2]) then
			AddMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
			--WriteLog("SB_Enter::GetMSPlayerCount("..SB_MISSION_ID..", "..SB_CAMP_ID.."): "..GetMSPlayerCount(SB_MISSION_ID, SB_CAMP_ID));
			SetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX, mapID-960);
			SetTempRevPos(mapID, spawnPoint[1]*32, spawnPoint[2]*32);
			SetDeathScript("\\script\\online_activites\\2010_12\\activity_05\\player_death.lua");
			SB_OnEntered();
		end
	end
end

function SB_Leave()
	local entranceMapIndex = GetTask(SB_TASK_KEY_ENTRANCE_MAP_INDEX);
	if 0 == entranceMapIndex then
		entranceMapIndex = 1;
	end
	local exitSpawnPoint = SB_ExitSpawnPoint[entranceMapIndex];
	if 1 == NewWorld(exitSpawnPoint[1], exitSpawnPoint[2], exitSpawnPoint[3]) then
		SB_ResetState();
		SB_LockEquipment(0);
	end
end

function SB_Announce()
	AddGlobalNews("Thiªn S¬n TuyÕt Yªu dÉn theo tiÓu qu¸i ®· xuÊt hiÖn t¹i §Êu Tr­êng TuyÕt ®¹i n¸o linh ®×nh, c¸c vÞ anh hïng hao kiÖt h·y nhanh chãng ®Õn t×m Xa Phu §Êu Tr­êng TuyÕt t¹i Thµnh §«, BiÖn Kinh vµ TuyÒn Ch©u ®Ó chuyÓn vµo ®Êu tr­êng tuyÕt thu phôc bän chóng");	
end

function SB_OnPlayerLogin()
	if gf_CheckEventDateEx(SB_ACTIVITY_ID) == 1 then
		SB_ResetState();
	end
end

function main()
	if gf_CheckEventDateEx(SB_ACTIVITY_ID) == 1 then
		SB_Start();
	end
end

function SB_Start()
	for i=1, getn(SB_MapList) do
		mf_OpenMission(SB_MISSION_ID, SB_MapList[i]);
	end;
	SB_Announce();
end

function SB_OnMissionTimer()
	--WriteLog("SB_OnTimer::SB_MAP_TASK_KEY_MISSION_TIMER_LOOP: "..SB_MAP_TASK_KEY_MISSION_TIMER_LOOP);
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, mapID);
	--WriteLog("SB_OnTimer::loopCount: "..loopCount);
	if 0 == loopCount then
		CloseMission(SB_MISSION_ID);
	else
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, loopCount-1, mapID);
	end
end

function SB_OnWaveTimer()
	local mapID = SubWorldIdx2ID(SubWorld);
	local loopCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, mapID);
	--WriteLog("SB_OnWaveTimer::loopCount: "..loopCount);	
	if 0 == loopCount then
		--WriteLog("SB_OnWaveTimer::timeout");
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, 1, mapID);
	else
		mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, loopCount-1, mapID);
	end
end

function SB_SpawnMonsters(mapID, x, y, monsterTemplate, monsterName, deathScript, monsterCount)
	--WriteLog("SB_SpawnMonsters::mapID: "..mapID);
	--WriteLog("SB_SpawnMonsters:: x: "..x..", y: "..y..", monsterTemplate: "..monsterTemplate..", monsterName: "..monsterName..", deathScript: "..deathScript);
	--WriteLog("SB_SpawnMonsters::monsterCount: "..monsterCount);
	for j=1, monsterCount do
		local deltaX = random(-5, 5);
		local deltaY = random(-5, 5);
		local npcIndex = CreateNpc(monsterTemplate, monsterName, mapID, x+deltaX, y+deltaY); 
		if deathScript ~= "" then
			SetNpcDeathScript(npcIndex, deathScript);
		end
	end	
end

function SB_SpawnWaveMonsters(mapID)
	--WriteLog("SB_SpawnWaveMonsters::mapID: "..mapID);
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == SB_MONSTER1_NAME or npcName == SB_MONSTER2_NAME then
			SetNpcLifeTime(npcIndices[i], 0);
		end
	end	

	for i=1, getn(SB_MonsterSpawnPointList) do
		SB_SpawnMonsters(mapID, SB_MonsterSpawnPointList[i][1], SB_MonsterSpawnPointList[i][2], SB_MONSTER1_TEMPLATE, SB_MONSTER1_NAME, "\\script\\online_activites\\2010_12\\activity_05\\npc\\monster1_death.lua", SB_MONSTER1_COUNT);
		SB_SpawnMonsters(mapID, SB_MonsterSpawnPointList[i][1], SB_MonsterSpawnPointList[i][2], SB_MONSTER2_TEMPLATE, SB_MONSTER2_NAME, "\\script\\online_activites\\2010_12\\activity_05\\npc\\monster2_death.lua", SB_MONSTER2_COUNT);
	end
	local monsterWave = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, mapID);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, monsterWave+1, mapID);
	--WriteLog("SB_SpawnWaveMonsters::monsterWave: "..monsterWave+1);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, 0, mapID);
	StopMissionTimer(SB_MISSION_ID, SB_WAVE_TIMER_ID);
	StartMissionTimer(SB_MISSION_ID, SB_WAVE_TIMER_ID, SB_TIMER_INTERVAL);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMER_LOOP, SB_WAVE_TIMER_COUNT, mapID);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_WAVE_TIMEOUT, 0, mapID);
	Msg2MSAll(SB_MISSION_ID, "TuyÕt qu¸i xuÊt hiÖn, c¸c vÞ ®¹i hiÖp h·y nhanh chãng tiªu diÖt chóng");
end

function SB_SpawnBoss()
	local mapID = SubWorldIdx2ID(SubWorld);
	local dialogBossIndex = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, mapID);
	SetNpcLifeTime(dialogBossIndex, 0);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, 0, mapID);
	local attackBossIndex = CreateNpc(SB_ATTACK_BOSS_TEMPLATE, SB_ATTACK_BOSS_NAME, mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
	SetNpcDeathScript(attackBossIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\attack_boss_death.lua");
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_ATTACK_BOSS_INDEX, attackBossIndex, mapID);
end

function SB_OnMonsterDied()
	--WriteLog("SB_OnMonsterDied::called");
	local mapID = SubWorldIdx2ID(SubWorld);
	local killedCount = mf_GetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, mapID);
	killedCount = killedCount + 1;
	--WriteLog("SB_OnMonsterDied::mapID: "..mapID..", killedCount: "..killedCount);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, killedCount, mapID);
	--WriteLog("SB_OnMonsterDied::SB_MISSION_ID: "..SB_MISSION_ID..", SB_CAMP_ID: "..SB_CAMP_ID..", SB_MONSTER_COUNT_PER_WAVE: "..SB_MONSTER_COUNT_PER_WAVE);
	--WriteLog("SB_OnMonsterDied::GetMSPlayerCount("..SB_MISSION_ID..", "..SB_CAMP_ID.."): "..GetMSPlayerCount(SB_MISSION_ID, SB_CAMP_ID));
	Msg2MSGroup(SB_MISSION_ID, "Qu¸i vËt ®· bÞ tiªu diÖt"..killedCount.."/"..SB_MONSTER_COUNT_PER_WAVE..")", SB_CAMP_ID);
	if killedCount >= SB_MONSTER_COUNT_PER_WAVE then
		Msg2MSAll(SB_MISSION_ID, "Qu¸i vËt ®· bÞ tiªu diÖt toµn bé, cã thÓ khiªu chiÕn ®ît qu¸i tiÐp theo");
	end
end

function SB_OnBossDied()
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, 0, mapID);
	StopMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID);
	CloseMission(SB_MISSION_ID);
end

function SB_Init()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_Init::SubWorld: "..SubWorld..", mapID: "..mapID);
	--WriteLog("SB_Init::test1");		
	local npcIndex = CreateNpc(SB_DIALOG_BOSS_TEMPLATE, SB_DIALOG_BOSS_NAME, mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
	--WriteLog("SB_Init::npcIndex: "..npcIndex);		
	SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\dialog_boss.lua");
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_DIALOG_BOSS_INDEX, npcIndex, mapID);	
	
	for i=1, getn(SB_CarterSpawnPointList) do
		npcIndex = CreateNpc(CR_TEMPLATE, CR_NAME, mapID, SB_CarterSpawnPointList[i][1], SB_CarterSpawnPointList[i][2]);
		SetNpcScript(npcIndex, "\\script\\online_activites\\2010_12\\activity_05\\npc\\carter.lua");
	end
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_STATE, 1, mapID);
	--WriteLog("SB_Init::SB_CheckState("..mapID.."): "..SB_CheckState(mapID));
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, 0, mapID);
	StartMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID, SB_TIMER_INTERVAL);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MISSION_TIMER_LOOP, SB_MISSION_TIMER_COUNT, mapID);
	RunMission(SB_MISSION_ID);
end

function SB_DeleteAllPlayers()
	local playerIndices = mf_GetMSPlayerIndex(SB_MISSION_ID,0);
	local oldPlayerIndex = PlayerIndex;
	for i=1,getn(playerIndices) do
		PlayerIndex = playerIndices[i];
		if PlayerIndex > 0 then
			DelMSPlayer(SB_MISSION_ID, SB_CAMP_ID);
		end
	end;
	PlayerIndex = oldPlayerIndex;
end;

function SB_End()
	SB_DeleteAllPlayers();
	StopMissionTimer(SB_MISSION_ID, SB_MISSION_TIMER_ID);
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_End::SubWorld: "..SubWorld..", mapID: "..mapID);
	ClearMapNpc(mapID, 0);
	mf_ClearMissionData(mapID);
end

function SB_TestKillAll()
	--WriteLog("SB_TestKillAll::called");
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == "TiÓu TuyÕt Qu¸i" or npcName == "§¹i TuyÕt Qu¸i" then
			Death(npcIndices[i]);
		end
	end
end

function SB_TestGoBoss()
	local mapID = SubWorldIdx2ID(SubWorld);
	--WriteLog("SB_TestGoBoss::mapID: "..mapID);
	NewWorld(mapID, SB_BossSpawnPoint[1], SB_BossSpawnPoint[2]);
end

function SB_TestGoCarter()
	SB_Leave();
end

function SB_TestSetMonsterWave(wave)
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_CURRENT_MONSTER_WAVE, wave, mapID);
end

function SB_TestSetMonsterKilled(killedCount)
	local mapID = SubWorldIdx2ID(SubWorld);
	mf_SetMissionV(SB_MISSION_ID, SB_MAP_TASK_KEY_MONSTER_KILLED_CUR_WAVE, killedCount, mapID);
end

function SB_TestKillBoss()
	local npcIndices = GetMapNpcIdx(SubWorldIdx2ID(SubWorld));
	for i=1, getn(npcIndices) do
		local npcName = GetNpcName(npcIndices[i]);
		if npcName == SB_ATTACK_BOSS_NAME then
			Death(npcIndices[i]);
		end
	end	
end

function SB_Test1()
	SB_TestSetMonsterWave(10);
	SB_TestSetMonsterKilled(264);
end