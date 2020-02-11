--隐藏关卡2
--start -> match -> start -> match -> start -> over -> ... -> allover
Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");
Include("\\script\\class\\mem.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

tStageHide_2 = {}
tStageHide_2 = gf_Inherit(tStageBase)
tStageHide_2.basePos = {0, 0};
tStageHide_2.tBoss = {
		tModel = {
		},
		tPos = {
		},
	}
tStageHide_2.tFish = {
		tGroup = {},
		tModel = {
			{NpcName[69][1],NpcName[69][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[70][1],NpcName[70][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[71][1],NpcName[71][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[72][1],NpcName[72][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tPos = {POS_1, POS_3, POS_5, POS_7},
		lifetime = 60,
		count = 15,
	}
tStageHide_2.tWaitingNpc = {
		tGroup = {},
		tModel = {
			[NpcName[98][2]] = {NpcName[98][1],NpcName[98][2],		POS_2, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[99][2]] = {NpcName[99][1],NpcName[99][2],		POS_4, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[100][2]] = {NpcName[100][1],NpcName[100][2],	POS_6, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[101][2]] = {NpcName[101][1],NpcName[101][2],	POS_8, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tFightModel = {
			[NpcName[98][2]] = {NpcName[98][1],NpcName[98][2],		POS_2, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[99][2]] = {NpcName[99][1],NpcName[99][2],		POS_4, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[100][2]] = {NpcName[100][1],NpcName[100][2],	POS_6, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[101][2]] = {NpcName[101][1],NpcName[101][2],	POS_8, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
	}
tStageHide_2.tPassNpc = {
	tModel = {
		[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2], POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStageHide_2.passMsg =LSMsgToTeam[13][7]
tStageHide_2.nMaxMatchTime = 3 * 60;

function tStageHide_2:init()
	SetMissionV(MV_STAGE_STATE, SS_WAITING);
	SetMissionV(MV_LOOP, 0);
	SetMissionV(MV_FISH_TIME, 0);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[26],LSStageName[8]));
	LM_Say(NpcSayInfo[13][1][1],getn(NpcSayInfo[13][1][2]),NpcSayInfo[13][1][2])
	self:createWaitingNpc();
end

function tStageHide_2:OnTalk2Waiting()
	Say(NpcSayInfo[13][2][1][GetTargetNpcName()], getn(NpcSayInfo[13][2][2]),NpcSayInfo[13][2][2])
end

function tStageHide_2:start()
	StopMissionTimer(MISSION_ID,TIMER_ID)
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_STAGE_STATE,SS_FIGHTING);
	SetMissionV(MV_LOOP, 0);
	SetMissionV(MV_STAGE_START_TIME, GetTime())
	resetPosition();
	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	self:createWaitingNpc(1);
	self:createFish();

	LM_StartTimeGuage(LSTimeGuageString[6], tStageHide_2.nMaxMatchTime, 0, 1);
	SetMissionV(MV_FISH_TIME, 0);
end

function tStageHide_2:cleanStage()
	local nMapId = gf_GetCurMapID();
	LM_StopTimeGuage(1);
	tStageBase.cleanStage(self);
end

function tStageHide_2:createBoss()
	local tPoses = self.tBoss.tPos;
	local tModel = self.tBoss.tModel;
	for i = 1, getn(tModel) do
		local nNpcIdx = CreateNpc(tModel[i][1], tModel[i][2], self:getMapPos(tPoses[i]));
		if tModel[i][3] then
			SetNpcDeathScript(nNpcIdx, tModel[i][3]);
		end
		SetCampToNpc(nNpcIdx, CampEnemy);
	end
end

function tStageHide_2:OnPlayerDeath(Launcher)
	local name = GetNpcName(Launcher);
	WriteLog(format("[liangshan:playerDeath] [killer=%s, stage=%d] [playerName=%s, lv=%d, route=%d]",name, GetMissionV(MV_STAGE_LEVEL), GetName(), GetLevel(), GetPlayerRoute()));
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[30],GetName()));
	bAllDeath = 1;
	local funCheckAllDeath = function()
		if IsPlayerDeath() == 0 and GetLife() > 0 then
			bAllDeath = 0;
		end
	end
	mf_OperateAllPlayer(MISSION_ID,funCheckAllDeath, nil, 1);
	if 1 == bAllDeath then
		self:GameOver();
	end
end

function tStageHide_2:GameOver()
	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);

	local nAward = 0;
	nLivePlayer  = 0;
	nDeathPlayer = 0;
	local funReviveAllPlayer = function()
		if IsPlayerDeath() ~= 0 or GetLife() <= 0 then
			nDeathPlayer = nDeathPlayer + 1;
			RevivePlayer(0);
		else
			nLivePlayer = nLivePlayer + 1;
		end
	end
	mf_OperateAllPlayer(MISSION_ID, funReviveAllPlayer, nil, 1);

	if nDeathPlayer == 0 then
		nAward = 2;
		LM_Talk(1, "", LSSysTalk[13][1]);
	elseif nLivePlayer >= 2 then
		nAward = 1;
		LM_Talk(1, "", LSSysTalk[13][2]);
	else
		nAward = 0;
		LM_Talk(1, "", LSSysTalk[13][3]);
		CloseMission(47);
	end
	StopMissionTimer(MISSION_ID, TIMER_ID);
	StartMissionTimer(MISSION_ID, TIMER_ID, PASS_TIME);

	SetMissionV(MV_STAGE_STATE, SS_PASSING);
	SetMissionV(MV_LOOP, 0);

	self:passStage();

	local m, x, y = self:getMapPos(POS_BOSS);
	local nStage = GetMissionV(MV_STAGE_LEVEL);
	if nStage >= HIDEMISSION_BEGIN then	-- 隐藏关卡的下一关
		nStage = GetMissionV(MV_STAGE_LEVEL_OLD);
	end
	create_box_tong(m, x, y,nStage)
	create_box_gold(m, x, y,nStage)
--	for i = 1, nAward do
--		--tMission:dropBox2(m, x, y);
--	end

	local nRand = random(1, 3);
	for i = 1, 4 do
		create_box_yin(m, x, y, nStage)
		--tMission:dropBox2(m, x, y, 2, 2, 0);
	end
	Observer:onTeamEvent(SYSEVENT_LIANGSHAN_STAGE_FINISH, nStage)

end
--计时器调用
function tStageHide_2:OnTimer()
	local nState = GetMissionV(MV_STAGE_STATE);
	local nFishTime = 0;
	if SS_FIGHTING == nState then		-- 借用 MV_STAGE_STATE 存时间
		nFishTime = GetMissionV(MV_FISH_TIME) + FIGHT_TIME / frame_per_second;
		SetMissionV(MV_FISH_TIME, nFishTime);
		if nFishTime >= tStageHide_2.nMaxMatchTime then
			self:GameOver();
			return
		end
	end

	tStageBase.OnTimer(self);
end
