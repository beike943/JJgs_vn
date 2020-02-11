--≈‹¬Ìµ¿
Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");
Include("\\script\\missions\\liangshan\\daily_tasks.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

tStage_5 = {}
tStage_5 = gf_Inherit(tStageBase)
tStage_5.basePos  = {1600, 2900};
tStage_5.entryPos = {1650, 3130};
tStage_5.tRulePoses = tStage_4.tRulePoses;
tStage_5.tBoss = {
		tPos = {POS_2, POS_4, POS_6, POS_8},
		script = "\\script\\missions\\liangshan\\mission\\boss_death.lua",
	}
tStage_5.tWaitingNpc = {
		tGroup = {},
		tModel = {
			[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2],POS_WAIT_2,"\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tFightModel = {
		},
	}
tStage_5.tPassNpc = {
	tModel = {
		[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2],POS_PASS,"\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStage_5.tGod	= {
	tInfo	= LSBuffInfo[2][1],
	tState	= LSBuffInfo[2][2],
}
tStage_5.passMsg = LSMsgToTeam[13][5]
tStage_5.tWelcome = {}

function tStage_5:init()
	local nMapID = gf_GetCurMapID();
	local funResetPos = function()
		NewWorld(%nMapID, %tStage_5.entryPos[1], %tStage_5.entryPos[2]);
	end
	mf_OperateAllPlayer(MISSION_ID, funResetPos, nil, 1);
	Msg2MSAll(MISSION_ID,LSMsgToTeam[22]);
	tStageBase.init(self);
	Msg2MSAll(MISSION_ID,format(LSMsgToTeam[15],LSStageName[5]));
end

function tStage_5:OnTalk2Waiting()
	local strNpcName = GetTargetNpcName()
	Say("<color=green>"..strNpcName.."<color>"..NpcSayInfo[10][1][1],getn(NpcSayInfo[10][1][2]),NpcSayInfo[10][1][2])
end

function tStage_5:start()
	tStageBase.start(self);
	self:AddAllGodState();
	LM_StartTimeGuage(LSTimeGuageString[3],30, 1, 1);
	LM_Talk(1, "", format(LSSysTalk[9],tStage_5.tGod.tInfo[1],tStage_5:GetInfo()))
end

function tStage_5:passStage()
	LM_SetTaskDone(1);
	self:cleanStage();
	self:createPassNpc();
end

function tStage_5:cleanStage()
	LM_StopTimeGuage(1);
	LM_StopTimeGuage(2);
	self:CleanAllGodState();
	tStageBase:cleanStage();
end

function tStage_5:createBoss()
	local tPoses = self.tBoss.tPos;
	for i = 1, getn(tPoses) do
		local m, x, y = self:getMapPos(tPoses[i]);
		local bossId = tMission:createBoss(self.bosslevel, m, x, y, self.tBoss.script, CampEnemy);
		local name = tMission:getBossName(bossId)
		Msg2MSAll(MISSION_ID, name..LSMsgToTeam[16]);
		SetMissionV(MV_CUR_BOSS_ID, bossId);
		SetMissionV(MV_BOSS_CREATE_TIME, GetTime());
		tMission:killBoss(bossId);
	end
end

function tStage_5:OnBossDeath(npcIdx)
	local name = GetNpcName(npcIdx)
	local nBossCount = GetMissionV(MV_BOSS_COUNT);
	nBossCount = nBossCount + 1;
	SetMissionV(MV_BOSS_COUNT, nBossCount);

	local curTime = GetTime();
	local bossTime = curTime - GetMissionV(MV_BOSS_CREATE_TIME);
	local stageTime = curTime - GetMissionV(MV_STAGE_START_TIME);
	WriteLog(format("[liangshan:BossDeath] [stage=%d, bossname=%s, bossTime=%d, playerCount=%d, stageTime=%d]",
		GetMissionV(MV_STAGE_LEVEL), name,  bossTime, GetTeamSize(), stageTime));
	
	local m, x, y = GetNpcWorldPos(npcIdx);
	create_box_tong(m,x,y,nBossCount)
	--tMission:dropBox(npcIdx);
--	if random(1,2) == 1 then
--		create_box_tong(m,x,y,nBossCount)
--		--tMission:dropBox(npcIdx);
--	end

	local nRand = random(1, 3);
	local m, x, y = GetNpcWorldPos(npcIdx);
	for i = 1, 4 do
		create_box_yin(m,x,y,nBossCount)
	end
--	for i = 1, nRand do
--		tMission:dropBox2(m, x, y, 2, 2, 0);
--	end
	self:giveAward(nBossCount);

	if nBossCount >= getn(self.tBoss.tPos) then
		create_box_gold(m,x,y,4)
		self:BossDownAddWXXS()
		SetMissionV(MV_BOSS_COUNT, 0);
		self:GameOver();
	end
	Observer:onTeamEvent(SYSEVENT_LIANGSHAN_STAGE_FINISH, nBossCount)
end

function tStage_5:GameOver()
	LM_StopTimeGuage(1);
	LM_StopTimeGuage(2);
	self:ReviveAllPlayer();
	self:CleanAllGodState();

	StopMissionTimer(MISSION_ID, TIMER_ID);
	StartMissionTimer(MISSION_ID, TIMER_ID, PASS_TIME);

	SetMissionV(MV_STAGE_STATE, SS_PASSING);
	SetMissionV(MV_LOOP, 0);
	self:passStage();
end

function tStage_5:ReviveAllPlayer()
	local funReviveAllPlayer = function()
		if IsPlayerDeath() ~= 0 or GetLife() <= 0 then
			local nOldIndex = PlayerIndex;
			RevivePlayer(0);
			PlayerIndex = nOldIndex;
			StartTimeGuage(LSTimeGuageString[4], 10, 0, 2);
			CastState("state_dispear",0,10*18); --Œﬁµ–
			RestoreAll();
			tStage_5:AddGodState();
		end
	end;
	mf_OperateAllPlayer(MISSION_ID, funReviveAllPlayer, nil, 1);
end

function tStage_5:AddAllGodState()
	local funAddAllGodState = function()
		tStage_5:AddGodState();
	end;
	mf_OperateAllPlayer(MISSION_ID, funAddAllGodState, nil, 1);
end

function tStage_5:CleanAllGodState()
	local funAddAllGodState = function()
		tStage_5:CleanGodState();
	end;
	mf_OperateAllPlayer(MISSION_ID, funAddAllGodState, nil, 1);
end

function tStage_5:CleanGodState()
	local tState = self.tGod.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

function tStage_5:AddGodState()
	self:CleanGodState();
	local tState = self.tGod.tState;
	for i = 1, getn(tState) do
		CastState(tState[i][2], tState[i][3], self.tGod.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
	end
	SyncCustomState(1, tState[1][1], 1, self.tGod.tInfo[1]);
end

function tStage_5:GetInfo()
	local strInfo	= "";
	local tState	= tStage_5.tGod.tState;
	for i = 1, getn(tState) do
		strInfo = strInfo..format(tState[i][4], tState[i][3])..", ";
	end
	strInfo = strInfo..format(tStage_5.tGod.tInfo[3], tStage_5.tGod.tInfo[2])..".";
	return strInfo;
end

function tStage_5:OnPlayerDeath(Launcher)
	local name = GetNpcName(Launcher);
	WriteLog(format("[liangshan:playerDeath] [killer=%s, stage=%d] [playerName=%s, lv=%d, route=%d]",
		name, GetMissionV(MV_STAGE_LEVEL), GetName(), GetLevel(), GetPlayerRoute()));
	Msg2MSAll(MISSION_ID, GetName()..LSMsgToTeam[19])
end

function tStage_5:OnTimer()
	local nState = GetMissionV(MV_STAGE_STATE);

	if SS_FIGHTING == nState then
		self:ReviveAllPlayer();
	end

	tStageBase:OnTimer();
end

function tStage_5:OnTalk()
	local name = GetTargetNpcName();
	if GetTeamMember(0) ~= PlayerIndex then
		tStageBase.OnTalk(self);
		return
	end

	if SS_WAITING == GetMissionV(MV_STAGE_STATE) then
		for keyname, _ in self.tWaitingNpc.tModel do
			if name == keyname then
				self:OnTalk2Waiting();
				return
			end
		end
	end

	if SS_PASSING == GetMissionV(MV_STAGE_STATE) then
		for keyname, _ in self.tPassNpc.tModel do
			if name == keyname then
				self:OnTalk2PassNpc();
				return
			end
		end
	end
end
