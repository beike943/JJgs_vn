Include("\\settings\\static_script\\missions\\base\\missionbase.lua")
Include("\\settings\\static_script\\missions\\base\\phasebase.lua")
Include("\\script\\missions\\eyt_battle\\eyt_head.lua")

--------------------------------------------------------------
eytMission_waiting = {
	maxsecond = 2 * 60,
	guage = {
		msg = "Giai ®o¹n chuÈn bÞ",
		time = 2 * 60,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function eytMission_waiting.Init()
	self = eytMission_waiting;
	SetMissionV(this.battleState, EYT_STATE_PEACE);
	eyt_CreateFo();
	DebugOutput("eytMission_waiting.Init()")
end

function eytMission_waiting.Close()
	this:Msg2MSAll("Sè ng­êi kh«ng ®ñ, tû vâ kÕt thóc!");
	this:Close();
end

function eytMission_waiting.CheckStart()
	local nRedPlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_RED);
	local nBluePlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_BLUE);
	DebugOutput(nRedPlayer, nBluePlayer);
	if nRedPlayer == EYT_PLAYER_MAX and nBluePlayer == EYT_PLAYER_MAX then
		phaseBase.onFinish(self);
	end
	this.msCamp:turnPlayer(0, eyt_FloatReport);
end

function eytMission_waiting.Message()
	local nRedPlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_RED);
	local nBluePlayer = this.msCamp:getCount(this.missionID, EYT_CAMP_BLUE);
	this:Msg2MSAll(format("H·y chuÈn bÞ, sè ng­êi ®éi ®á: %d, sè ng­êi ®éi xanh: %d, hai bªn ®Òu ®¹t %d ng­êi sÏ lËp tøc më tû vâ!", nRedPlayer, nBluePlayer, EYT_PLAYER_MAX));
end

eytMission_waiting.actions = {
	[1] = eytMission_waiting.Init,
	[3] = eytMission_waiting.Message,
}

eytMission_waiting.cycActions = {
	[10] = {
		[0] = eytMission_waiting.CheckStart,
	},
	[31] = {
		[0] = eytMission_waiting.Message,
	},	
}

eytMission_waiting = inherit(cycPhase, eytMission_waiting);
eytMission_waiting.onTimeout = eytMission_waiting.Close;

eytMission_fighting = {
	maxsecond = 12 * 60,
	guage = {
		msg = "TiÕn ®é chiÕn ®Êu",
		time = 12 * 60,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function eytMission_fighting.Init()
	self = eytMission_fighting;
	SetMissionV(this.battleState, EYT_STATE_FIGHT);
	--SetMissionV(this.flagTime, GetTime());
	DebugOutput("eytMission_fighting.Init");
	this.msCamp:turnPlayer(0, SendScript2Client, [[Add3EElf(450,350,"\\image\\EFFECT\\sfx\\ÆäËû\\Õ½¶·¿ªÊ¼_Ô½ÄÏ.3e",1000*2,0.7)]])
	this.msCamp:turnPlayer(0, RestoreAll);
	this.msCamp:turnPlayer(0, eyt_SetJoinTime, GetTime());
	this.msCamp:turnPlayer(0, eyt_AddOnceJoinTimes);
	AddRuntimeStat(27, 3, 0, 1); --³É¹¦¿ªÆô´ÎÊý
	this:Msg2MSAll("Tû vâ chÝnh thøc b¾t ®Çu!");
end

function eytMission_fighting:onPlayerDeath(event, killId)
	DebugOutput("eytMission_fighting.onPlayerDeath(event, killId)", event, killId, PlayerIndex)
	--Çå³ýÒ©CD
	ClearColdDown();
	--ÏÈÇåÑ©ºÞ×´Ì¬ÔÙ¼Ó
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	eyt_KillSome(NpcIdx2PIdx(killId));
end

function eytMission_fighting:onNpcDeath(event, tParam)
	DebugOutput("eytMission_fighting.onNpcDeath(event, npcIdx, f, x)", event, tParam[1], tParam[2], tParam[3], GetNpcName(tParam[1]));
end

function eytMission_fighting:onTalk(event)
	DebugOutput("eytMission_fighting.onTalk(event)", event, GetNpcName(GetTargetNpc()));
	local npcIndex = GetTargetNpc();
	if GetNpcName(npcIndex) == EYT_NPC_FLAG then
		local nMapID, nX, nY = GetWorldPos();
		local npcMapID, npcX, npcY = GetNpcWorldPos(npcIndex);
		if nMapID ~= npcMapID then
			return 0;
		end
		if (nX - npcX) * (nX -npcX) + (nY - npcY) * (nY - npcY) > 36 then
			Msg2Player("Kho¶ng c¸ch qu¸ xa, më cê thÊt b¹i!");
			return 0;
		end
		DoWait(119, 120, 10);
		this.msCamp:turnPlayer(0, HeadMsg2Player, format("%s ®ang më cê...", GetName()));
	end
end

function eytMission_fighting:OnRevive(event)
	DebugOutput("eytMission_fighting.OnRevive(event)", event, GetName());
	SetFightState(0);
	eyt_SetTempRevPos();
	SetTempRevScript(thisFile);
	SetTaskTemp(TMP_TASK_KF_TIME, 0);
	eyt_AddBuff();
	RestoreAll();
end

function eytMission_fighting.CheckScore()
	local nRed = GetMissionV(this.redScore);
	local nBlue = GetMissionV(this.blueScore);
	if nRed >= EYT_SCROE_MAX or nBlue >= EYT_SCROE_MAX then
		eytMission_fighting:onFinish();
		this.msCamp:turnPlayer(0, SetFightState, 0);
	end
end

function eytMission_fighting.Msg()
	eyt_Report();
end

function eytMission_fighting.CreateFlag()
	local nCurTime = GetTime();
	local nOldTime = GetMissionV(this.flagTime);
	if nCurTime - nOldTime > EYT_FLAG_REFLESH_TIME then
		if eyt_CreateFlag() ~= 0 then
			SetMissionV(this.flagTime, nCurTime);
			this.msCamp:turnPlayer(0, HeadMsg2Player, "§· t¹o míi chiÕn kú!");
			this:Msg2MSAll("§· t¹o míi ChiÕn Kú ¢n O¸n §µi!");
		end
	end
end

function eytMission_fighting.CheckStatus()
	this.msCamp:turnPlayer(0, eyt_FloatReport)
	this.msCamp:turnPlayer(0, eyt_CheckAndKickSleep);
	if GetMSPlayerCount(this.missionID) <= 1 then
		DebugOutput("GetMSPlayerCount", this.missionID, GetMSPlayerCount(this.missionID));
		eytMission_fighting:onFinish();
		this.msCamp:turnPlayer(0, SetFightState, 0);
	end
end

function eytMission_fighting:onFinish()
	DebugOutput("eytMission_fighting:onFinish");
	phaseBase.onFinish(self)
	
	this.msCamp:reflash(EYT_CAMP_RED);
	local redTb = this.msCamp.players;
	this.msCamp:reflash(EYT_CAMP_BLUE);
	local blueTb = this.msCamp.players;
	
	local nOldPlayer = PlayerIndex;
	local nRedDamage = 0;
	for i = 1,getn(redTb) do
		PlayerIndex = redTb[i];
		nRedDamage = nRedDamage + GetToPlayerDamage();
	end
	local nBlueDamage = 0;
	for i = 1,getn(blueTb) do
		PlayerIndex = blueTb[i];
		nBlueDamage = nBlueDamage + GetToPlayerDamage();
	end
	PlayerIndex = nOldPlayer;
	
	local nWiner = 0;
	local RedPlayerCount = getn(redTb);
	local BluePlayerCount = getn(blueTb);
	
	AddRuntimeStat(27, 4, 0, RedPlayerCount+BluePlayerCount); --½áÊøÊ±µÄÈËÊý
	
	if RedPlayerCount ~= 0 and BluePlayerCount ~= 0 then
		local nRed = GetMissionV(this.redScore);
		local nBlue = GetMissionV(this.blueScore);
		if nRed > nBlue then
			nWiner = EYT_CAMP_RED;
			this:Msg2MSAll(format("Tû vâ s¾p kÕt thóc, tû sè gi÷a hai ®éi lµ [%d:%d], %s nhËn ®­îc th¾ng lîi cuèi cïng!", nRed, nBlue, EYT_CAMP_NAME[EYT_CAMP_RED]));
		elseif nRed < nBlue then
			nWiner = EYT_CAMP_BLUE;
			this:Msg2MSAll(format("Tû vâ s¾p kÕt thóc, tû sè gi÷a hai ®éi lµ [%d:%d], %s nhËn ®­îc th¾ng lîi cuèi cïng!", nRed, nBlue, EYT_CAMP_NAME[EYT_CAMP_BLUE]));
		else
			if nRedDamage >= nBlueDamage then
				nWiner = EYT_CAMP_RED;
				this:Msg2MSAll(format("Tû vâ s¾p kÕt thóc, tû sè gi÷a hai ®éi lµ %d, s¸t th­¬ng lµ [%d:%d], %s nhËn ®­îc th¾ng lîi cuèi cïng!", nRed, nRedDamage + 12345, nBlueDamage, EYT_CAMP_NAME[EYT_CAMP_RED]));
			else
				nWiner = EYT_CAMP_BLUE;
				this:Msg2MSAll(format("Tû vâ s¾p kÕt thóc, tû sè gi÷a hai ®éi lµ %d, s¸t th­¬ng lµ [%d:%d], %s nhËn ®­îc th¾ng lîi cuèi cïng!", nRed, nRedDamage, nBlueDamage + 12345, EYT_CAMP_NAME[EYT_CAMP_BLUE]));
			end
		end
	elseif RedPlayerCount > 0 and BluePlayerCount == 0 then
		nWiner = EYT_CAMP_RED;
		this:Msg2MSAll(format("Tû vâ s¾p kÕt thóc, sè ng­êi %s kh«ng ®ñ, %s giµnh ®­îc th¾ng lîi cuèi cïng!", EYT_CAMP_NAME[EYT_CAMP_BLUE], EYT_CAMP_NAME[EYT_CAMP_RED]));
	elseif BluePlayerCount > 0 and RedPlayerCount == 0 then
		nWiner = EYT_CAMP_BLUE;
		this:Msg2MSAll(format("Tû vâ s¾p kÕt thóc, sè ng­êi %s kh«ng ®ñ, %s giµnh ®­îc th¾ng lîi cuèi cïng!", EYT_CAMP_NAME[EYT_CAMP_RED], EYT_CAMP_NAME[EYT_CAMP_BLUE]));
	end
	
	SetMissionV(this.result, nWiner);
	
	local nOldPlayer = PlayerIndex;
	if nWiner == EYT_CAMP_RED then
		for i = 1,getn(redTb) do
			PlayerIndex = redTb[i];
			eyt_AddSucc();
		end
		for i = 1,getn(blueTb) do
			PlayerIndex = blueTb[i];
			eyt_AddFail();
		end
	else
		for i = 1,getn(redTb) do
			PlayerIndex = redTb[i];
			eyt_AddFail();
		end
		for i = 1,getn(blueTb) do
			PlayerIndex = blueTb[i];
			eyt_AddSucc();
		end		
	end
	PlayerIndex = nOldPlayer;
	
	this:Msg2MSAll(format("PhÇn th­ëng cña Tû Vâ ¢n O¸n §µi do Ng­êi NhËn Th­ëng Liªn Server ë c¸c thµnh chÝnh ph¸t, chØ ®­îc nhËn th­ëng trong ngµy!"))
end

function eytMission_fighting:onTimeout()
	return self:onFinish();
end

eytMission_fighting.actions = {
	[1] = eytMission_fighting.Init,
}

eytMission_fighting.cycActions = {
	[1] = {
		[0] = eytMission_fighting.CheckScore,
	},
	[5] = {
		[0] = eytMission_fighting.CreateFlag,
	},
	[7] = {
		[0] = eytMission_fighting.CheckStatus,
	},
	[45] = {
		[0] = eytMission_fighting.Msg,
	},
}

eytMission_fighting.triggers = {
	PlayerDeath = {
		{action = eytMission_fighting.onPlayerDeath,},
	},
	OnRevive = {
		{action = eytMission_fighting.OnRevive,},
	},
	NpcDeath = {
		{action = eytMission_fighting.onNpcDeath,},
	},
	Talk = {
		{action = eytMission_fighting.onTalk,},
	}
}

eytMission_fighting = inherit(cycPhase, eytMission_fighting);

eytMission_ending = {
	maxsecond = 15,
	guage = {
		msg = "Thêi gian rêi khái",
		time = 15,
		cyc = 0,
		id = 1,
	},
	DEBUG = 1,
};

function eytMission_ending.Init()
	self = eytMission_ending;
	SetMissionV(this.battleState, EYT_STATE_COMPLETE);
	DebugOutput("eytMission_ending.Init()")
	this.msCamp:turnPlayer(0, eyt_SetJoinTime, 0);
	this.msCamp:turnPlayer(0, eyt_ShowExit, GetMissionV(this.result));
end

function eytMission_ending.PlayerData()
	this.msCamp:reflash(0);
	local PlayerTb = this.msCamp.players;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, getn(PlayerTb) do
		PlayerIndex = PlayerTb[i];
		Msg2Player(format("ChiÕn tÝch c¸ nh©n: Tæng s¸t th­¬ng %d, Tiªu diÖt %d, BÞ tiªu diÖt %d, cãng hiÕn ®iÓm tÝch lòy %d", GetToPlayerDamage(), eyt_GetKill(), eyt_GetKilled(), eyt_GetMyScore()));
	end
	PlayerIndex = oldPlayerIndex;
end

function eytMission_ending.onFinish()
	DebugOutput("eytMission_ending:onFinish()")
	this:Close();
end

eytMission_ending.actions = {
	[1] = eytMission_ending.Init,
	[5] = eytMission_ending.PlayerData,
}

eytMission_ending = inherit(cycPhase, eytMission_ending);
eytMission_ending.onTimeout = eytMission_ending.onFinish;

--------------------------------------------------------------
eytMission = {
	phases = {
		eytMission_waiting,
		eytMission_fighting,
		eytMission_ending,
	},
	maxsecond = 15 * 60,
	timerID = 101,
};
eytMission = inherit(phaseBase, eytMission);

------------------------------------------------------------
EYT_MISSION = inherit(missionBase, EYT_MISSION);

function EYT_MISSION:Close()
	missionBase.Close(self);
end

EYT_MISSION.msOption.OnPlayerJoin = function(self, nCamp)
	CountDownRevive(EYT_COUNTDOWN_REVIVE, EYT_COUNTDOWN_TIME);
	eyt_ResetKill();
	eyt_ResetKilled();
	eyt_ResetMyScore();
	KillFollower();
	SetFightState(0);
	eyt_SetTempRevPos();
	SetTempRevScript(thisFile);
	Msg2Player(format("Ng­¬i ®· gia nhËp %s", EYT_CAMP_NAME[nCamp]));
	this:Msg2MSAll(format("%s gia nhËp Tû Vâ ¢n O¸n §µi", GetName()));
	AddRuntimeStat(27, 1, GetPlayerRoute(), 1); --Í³¼ÆÁ÷ÅÉ²ÎÓëÈËÊý
end

EYT_MISSION.msOption.OnPlayerLeave = function(self, nCamp)
	DebugOutput("OnPlayerLeave missionid =", this.missionID)
	CountDownRevive(0, 0);
	FloatMsg2Player("");
	SetTempRevPos(0,0,0);
	SetTempRevScript("");
	if GetMissionV(this.battleState) ~= EYT_STATE_FIGHT then
		eyt_SetJoinTime(0);
	end
end

EYT_MISSION.onMissionInit = function(self)
	
end

EYT_MISSION.msPhases = {
	eytMission,
};

EYT_MISSION.msPosition.entryPos = EYT_REV_POS;

EYT_MISSION.msPosition.exitPos = {
	{428, 1310, 2693},
	{428, 1405, 2800},
	{428, 1490, 2743},
	{428, 1366, 2608},
};

EYT_MISSION.msOption.nInitFightState = 0;
EYT_MISSION.msOption.szInitDeahScript = thisFile;
EYT_MISSION.msOption.bLeaveTeam = 0;
EYT_MISSION.msOption.bRestoreSetPkFlag = 0;
EYT_MISSION.msOption.bRestoreSetPkCamp = 0;
EYT_MISSION.msOption.bRestoreForbidChangePK = 0;
EYT_MISSION.msOption.bRestoreLeaveTeam = 0;

this = EYT_MISSION;

--------------------------------------------------------------


