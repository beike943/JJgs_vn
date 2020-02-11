--≈‹¬Ìµ¿
--SS_WAITING_2 -> SS_FISH -> SS_WAITING -> SS_FIGHTING -> SS_PASSING

Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");

tStage_3 = {}
tStage_3 = gf_Inherit(tStageBase)
tStage_3.basePos = {1600, 3000};
tStage_3.tRulePoses = {
		{(1578-1600)*5,	(2985-3000)*2.5},
		{(1571-1600)*5,	(2993-3000)*2.5},
		{(1591-1600)*5,	(2995-3000)*2.5},
		{(1578-1600)*5,	(3010-3000)*2.5},
		{(1600-1600)*5,	(3006-3000)*2.5},
		{(1587-1600)*5,	(3020-3000)*2.5},
		{(1614-1600)*5,	(3013-3000)*2.5},
		{(1601-1600)*5,	(3031-3000)*2.5},
		{(1615-1600)*5,	(3029-3000)*2.5},
		{(1595-1600)*5, (3012-3000)*2.5},	--BOSS
		{(1611-1600)*5, (3048-3000)*2.5},	--WAIT_1
		{(1608-1600)*5, (3047-3000)*2.5},	--WAIT_2
		{(1586-1600)*5, (2985-3000)*2.5},	--PASS
}
tStage_3.tFish = {
		tGroup = {},
		tModel = {
			{NpcName[78][1],NpcName[78][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[79][1],NpcName[79][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[80][1],NpcName[80][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[81][1],NpcName[81][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tPos = {POS_1, POS_2, POS_3, POS_4, POS_5, POS_6, POS_7, POS_8, POS_9},
		lifetime = 60,
		count = 5,
	}
tStage_3.tWaitingNpc = {
		tGroup = {},
		tModel = {
			[NpcName[82][2]] = {NpcName[82][1],NpcName[82][2],POS_WAIT_1, "\\script\\missions\\liangshan\\mission\\mission.lua"},
			[NpcName[83][2]] = {NpcName[83][1],NpcName[83][2], POS_WAIT_2, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tFightModel = {
		},
	}
tStage_3.nMaxFishTime	= 180; --√Î
tStage_3.tPassNpc = {
	tModel = {
		[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2],POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStage_3.passMsg = LSMsgToTeam[13][3]
tStage_3.tAwardSkill = 1424
tStage_3.tWelcome = LSMsgToTeam[14][3]
tStage_3.nEntryTrap = 4

function tStage_3:cleanStage()
	local nMapID = gf_GetCurMapID();
	LM_StopTimeGuage(1);
	SetMissionV(MV_FISH_COUNT, 0);
	SetMissionV(MV_FISH_COUNT_2, 0);
	SetMissionV(MV_FISH_TIME, 0);
	self:CleanAllTempAward();
	tStageBase:cleanStage();
end

function tStage_3:init()
	tStageBase.init(self);
	SetMissionV(MV_STAGE_STATE, SS_WAITING_2);
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[15],LSStageName[3]));
	SetMissionV(MV_FISH_TIME, 0);
end

function tStage_3:OnTalk2Waiting()
	local eState = GetMissionV(MV_STAGE_STATE)
	local tMsg, tMenu = nil, nil;
	if SS_WAITING_2 == eState then
		tMsg = {
			[NpcName[82][2]] = "<color=green>"..NpcName[82][2].."<color>: "..NpcSayInfo[8][1][1][1],
			[NpcName[83][2]] = "<color=green>"..NpcName[83][2].."<color>: "..NpcSayInfo[8][1][1][2],
		};
		tMenu = NpcSayInfo[8][1][2]
	elseif SS_WAITING == eState then
		local nFishCount   = GetMissionV(MV_FISH_COUNT);
		local nFishCount_2 = GetMissionV(MV_FISH_COUNT_2);
		if nFishCount >= nFishCount_2 then
			tMsg = {
			[NpcName[82][2]] = "<color=green>"..NpcName[82][2].."<color>"..NpcSayInfo[8][2][1][1],
			[NpcName[83][2]] = "<color=green>"..NpcName[83][2].."<color>"..NpcSayInfo[8][2][1][2],
		};
		else
			tMsg = {
			[NpcName[82][2]] = "<color=green>"..NpcName[82][2].."<color>"..NpcSayInfo[8][3][1][1],
			[NpcName[83][2]] = "<color=green>"..NpcName[83][2].."<color>"..NpcSayInfo[8][3][1][2],
		};
		end
		tMenu = NpcSayInfo[8][3][2]
	end
	if not tMsg or not tMenu then
		return 0;
	end
	Say(tMsg[GetTargetNpcName()], getn(tMenu), tMenu);
end

function tStage_3:startfish()
	LM_Talk(1, "", format(LSSysTalk[8],NpcName[82][2],NpcName[83][2]));
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID, TIMER_ID, FIGHT_TIME_2);
	SetMissionV(MV_STAGE_STATE,SS_FISH);
	resetPosition();
	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	self:createFish();
	LM_StartTimeGuage(LSTimeGuageString[1], self.nMaxFishTime, 0, 1);
end

function tStage_3:startboss()
	StopMissionTimer(MISSION_ID,TIMER_ID)
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_STAGE_STATE,SS_FIGHTING);
	SetMissionV(MV_LOOP, 0);
	resetPosition();
	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	self:createBoss();
end

function tStage_3:OnNpcDeath(npcIdx)
	SetMissionV(MV_FISH_COUNT, GetMissionV(MV_FISH_COUNT) + 1);
	SetNpcLifeTime(npcIdx,0);
end

function tStage_3:OnFishCountRefresh()
	local nFishCount_2 = GetMissionV(MV_FISH_COUNT_2) + random(17, 22);
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[17],GetMissionV(MV_FISH_COUNT),NpcName[82][2],NpcName[83][2],nFishCount_2));
	SetMissionV(MV_FISH_COUNT_2, nFishCount_2);
end

function tStage_3:OnFishTimeOver()
	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	local nFishCount   = GetMissionV(MV_FISH_COUNT);
	local nFishCount_2 = GetMissionV(MV_FISH_COUNT_2);
	local szTitle = format(NpcSayInfo[8][4][1][1],nFishCount,NpcName[82][2],NpcName[83][2],nFishCount_2)
	if nFishCount >= nFishCount_2 then
		self:TempAwardItem();
		szTitle = szTitle..NpcSayInfo[8][4][1][2]
		Msg2MSAll(MISSION_ID, LSMsgToTeam[18])
	end
	LM_Say(szTitle, getn(NpcSayInfo[8][4][2],NpcSayInfo[8][4][2]));
	SetMissionV(MV_STAGE_STATE, SS_WAITING);
	SetMissionV(MV_LOOP, 0);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID,TIMER_ID,WAITING_TIME);
	self:createWaitingNpc();
end

function tStage_3:TempAwardItem()
	local funAward = function()
		LearnSkill(tStage_3.tAwardSkill);
	end
	mf_OperateAllPlayer(MISSION_ID, funAward, nil, 1)
end

function tStage_3:CleanAllTempAward()
	local funCleanTempAward = function()
		tStage_3:CleanTempAward();
	end;
	mf_OperateAllPlayer(MISSION_ID, funCleanTempAward, nil, 1);
end

function tStage_3:CleanTempAward()
	if HaveLearnedSkill(self.tAwardSkill) == 1 then
		RemoveSkill(self.tAwardSkill);
	end
end

function tStage_3:OnTimer()
	local nState = GetMissionV(MV_STAGE_STATE);
	local nFishTime = 0;
	if SS_FISH == nState then
		nFishTime = GetMissionV(MV_FISH_TIME) + FIGHT_TIME_2 / frame_per_second;
		SetMissionV(MV_FISH_TIME, nFishTime);
		self:OnFishCountRefresh();
		if mod(nFishTime, FIGHT_TIME_2 / frame_per_second * 2) == 0 then
			self:createFish();
		end
		if nFishTime >= self.nMaxFishTime then
			self:OnFishTimeOver();
			return
		end
	elseif SS_FIGHTING == nState then
		return
	end
	tStageBase.OnTimer(self);
end
