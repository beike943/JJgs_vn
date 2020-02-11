--≈‹¬Ìµ¿
Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");

tStage_4 = {}
tStage_4 = gf_Inherit(tStageBase)
tStage_4.basePos = {1600, 2900};
tStage_4.tRulePoses = {
		{50,	5},		--POS_1
		{100,	-8},
		{145,	-16},	--POS_3
		{110,	44},
		{160,	25},	--POS_5
		{210,	48},
		{165,	60},	--POS_7
		{185,	12},
		{240,	36},	--POS_9
		{160,	25},	--BOSS
		{160,	-5},	--WAIT_1
		{225,	165},	--WAIT_2
		{60,	-25},	--PASS
		{(1639-1600)*5, (2888-2900)*2.5},
		{(1641-1600)*5, (2891-2900)*2.5},
		{(1644-1600)*5, (2894-2900)*2.5},
		{(1647-1600)*5, (2898-2900)*2.5},
}
tStage_4.tFish = {
		tGroup = {},
		tModel = {
			{NpcName[84][1],NpcName[84][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[85][1],NpcName[85][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[86][1],NpcName[86][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[87][1],NpcName[87][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tPos = {POS_1, POS_3, POS_7, POS_9},
		lifetime = 60,
		count = 6,
	}
tStage_4.tWaitingNpc = {
		tGroup = {},
		tModel = {
			[NpcName[88][2]] = {NpcName[88][1],NpcName[88][2],POS_WAIT_1,"\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tFightModel = {
		},
}
tStage_4.tRobotWaitingNpc = {
		tGroup = {},
		tModel = {
			{NpcName[89][1],NpcName[89][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[90][1],NpcName[90][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[91][1],NpcName[91][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
			{NpcName[92][1],NpcName[92][2],"\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tPos = {POS_PASS+1, POS_PASS+2, POS_PASS+3, POS_PASS+4},
		lifetime	= 60,
		eCamp		= CampNeutral,
		bWaitingNpc	= 1,
		nSlotTime	= 1 * frame_per_second,	-- ∂¡Ãı
}
tStage_4.tRobotFightingNpc = {
		tGroup = {},
		tModel = {
			NpcName[93],
			NpcName[94],
			NpcName[95],
			NpcName[96],
		},
		tPos = {POS_2, POS_4, POS_6, POS_8},
		lifetime	= 60,
		eCamp		= CampPlaye,
		bFightingNpc= 1,
	}
tStage_4.tPassNpc = {
	tModel = {
		[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2],POS_PASS,"\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStage_4.passMsg = LSMsgToTeam[13][4]
tStage_4.tWelcome = LSMsgToTeam[14][4]
tStage_4.nEntryTrap = 7

function tStage_4:init()
	tStageBase.init(self);
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[15],LSStageName[4]));
end

function tStage_4:OnTalk2Waiting()
	local strNpcName = GetTargetNpcName()
	Say("<color=green>"..strNpcName.."<color>"..NpcSayInfo[9][1][1],getn(NpcSayInfo[9][1][2]),NpcSayInfo[9][1][2])
end

function tStage_4:OnTalk2RobotNpc(eRobot)
	if 0 ~= GetMissionV(MV_ROBOT_TYPE) then	-- ∑¿À¢
		return 0;
	end
	CastState("state_fetter", 1, self.tRobotWaitingNpc.nSlotTime);
	ProgressSlot(self.tRobotWaitingNpc.nSlotTime);
end

function tStage_4:start()
	tStageBase.start(self);
	self:RefreshRobot();
	LM_StartTimeGuage(LSTimeGuageString[2], 30, 1, 1);
end

function tStage_4:cleanStage()
	local nMapID = gf_GetCurMapID();
	LM_StopTimeGuage(1);
	SetMissionV(MV_ROBOT_TYPE, 0);
	self.tRobotWaitingNpc.tGroup[nMapID] = {};
	self.tRobotFightingNpc.tGroup[nMapID] = {};
	tStageBase.cleanStage(self);
end

function tStage_4:OnTimer()
	local nState = GetMissionV(MV_STAGE_STATE);

	if SS_FIGHTING == nState then
		self:RefreshRobot();
	end

	tStageBase.OnTimer(self);
end

function tStage_4:ActiveRobot(eRobot)
	if 0 ~= GetMissionV(MV_ROBOT_TYPE) then
		return 0;
	end
	self:ClearRobot(self.tRobotWaitingNpc);
	self:ClearRobot(self.tRobotFightingNpc);
	self:CreateRobot(self.tRobotFightingNpc, eRobot);
	SetMissionV(MV_ROBOT_TYPE, eRobot);
	Msg2MSAll(MISSION_ID, LSMsgToTeam[20]);
end

function tStage_4:RefreshRobot()
	self:ClearRobot(self.tRobotWaitingNpc);
	self:ClearRobot(self.tRobotFightingNpc);
	self:CreateRobot(self.tRobotWaitingNpc);
	SetMissionV(MV_ROBOT_TYPE, 0);
	Msg2MSAll(MISSION_ID, LSMsgToTeam[21]);
end

function tStage_4:CreateRobot(tRobot, eRobot)
	local e, idx = nil, nil;
	for i = 1, getn(tRobot.tPos) do
		if tRobot.bFightingNpc then
			idx = tRobot.tPos[i];
		end
		if eRobot then
			e = eRobot;
		else
			e = i;
		end
		self:CreateARobot(tRobot, e, idx);
	end
end

function tStage_4:CreateARobot(tRobot, eRobot, nPosIdx)
	local tNpc		= tRobot.tModel[eRobot];
	local tPos		= tRobot.tPos[eRobot];
	if not nPosIdx then
		nPosIdx = tPos;
	end
	local m, x, y = self:getMapPos(nPosIdx);
	local aiType = nil;
	if tRobot.bWaitingNpc then
		aiType = 6;
	end
	local nNpcIdx	= CreateNpc(tNpc[1], tNpc[2], m, x, y, aiType);
	if tRobot.bWaitingNpc then
		AddUnitStates(nNpcIdx, 7, 0);
		AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));
	end
	if tNpc[3] then
		SetNpcScript(nNpcIdx, tNpc[3]);
	end
	SetNpcLifeTime(nNpcIdx, tRobot.lifetime);
	SetCampToNpc(nNpcIdx, tRobot.eCamp);
	tRobot.tGroup[m] = tRobot.tGroup[m] or {};
	tinsert(tRobot.tGroup[m], nNpcIdx);
end

function tStage_4:ClearRobot(tRobot)
	local nMapID = gf_GetCurMapID();
	local tGroup = tRobot.tGroup[nMapID];
	if nil == tGroup then
		return 0;
	end
	for i = 1, getn(tGroup) do
		SetNpcLifeTime(tGroup[i], 0);
	end
	tRobot.tGroup[nMapID] = {};
end

function OnProgressCallback()
	local strNpcName = GetTargetNpcName()
	for eRobot, tModel in tStage_4.tRobotWaitingNpc.tModel do
		if strNpcName == tModel[2] then
			tStage_4:ActiveRobot(eRobot);
		end
	end
end

function tStage_4:OnTalk()
	local name = GetTargetNpcName()
	if self.tRobotWaitingNpc then
		for eRobot, tModel in self.tRobotWaitingNpc.tModel do
			if name == tModel[2] then
				self:OnTalk2RobotNpc(eRobot);
				return
			end
		end
	end

	tStageBase.OnTalk(self);
end
