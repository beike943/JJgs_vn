--隐藏关卡2
--start -> match -> start -> match -> start -> over -> ... -> allover
Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");
Include("\\script\\class\\mem.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

tStageHide_1 = {}
tStageHide_1 = gf_Inherit(tStageBase)
tStageHide_1.basePos = {0, 0};
tStageHide_1.tFish = {
		tGroup = {},
		tModel = {
		},
		tPos = {
		},
		lifetime = 0,
		count = 0,
	}
tStageHide_1.tWaitingNpc = {
		tGroup = {},
		tModel = {
			[NpcName[97][2]] = {NpcName[97][1],NpcName[97][2],POS_BOSS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		},
		tFightModel = {
		},
	}
tStageHide_1.tPassNpc = {
	tModel = {
		[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2], POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStageHide_1.passMsg = LSMsgToTeam[13][6]
tStageHide_1.tMatch = {
	tLive = {}, -- 实况
	tInfo = LSMsgToTeam[27],
	tRule = {
		[1] = 2,	-- 1 win 2
		[2] = 3,	-- 2 win 3
		[3] = 1,	-- 3 win 1
	},
	tTeamRule = {
		[1] = 1,
		[2] = 1,
		[3] = 1,
		[4] = 1,
		[5]	= 2,
		[6]	= 2,
		[7]	= 2,
		[8]	= 2,
	},
	nLimit = 2, -- 2胜为赢
}
tStageHide_1.nMaxMatchTime = 5 * 60;

function tStageHide_1:init()
	SetMissionV(MV_STAGE_STATE, SS_FIGHTING);
	SetMissionV(MV_LOOP, 0);
	SetMissionV(MV_FISH_TIME, 0);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[26],LSStageName[7]));
	self:createWaitingNpc();
	resetPosition();

	LM_StartTimeGuage(LSTimeGuageString[5], tStageHide_1.nMaxMatchTime, 0, 1);
end

function tStageHide_1:OnTalk2Waiting()
	Say("<color=green>"..GetTargetNpcName().."<color>"..NpcSayInfo[12][1][1],getn(NpcSayInfo[12][1][2]),NpcSayInfo[12][1][2])
end

function tStageHide_1:start()
	local nMapID = gf_GetCurMapID();
	self.tMatch.tLive[nMapID] = self.tMatch.tLive[nMapID] or {};
	self.tMatch.tLive[nMapID][PlayerIndex] = self.tMatch.tLive[nMapID][PlayerIndex] or {};
	local tPlayer = self.tMatch.tLive[nMapID][PlayerIndex];
	local strNpcName = GetTargetNpcName()
	if not tPlayer.bMatch then
		tPlayer.bMatch	 = 0;
		tPlayer.nWinNum  = 0;
		tPlayer.nLoseNum = 0;
	end
	if 0 ~= tPlayer.bMatch then
		Say("<color=green>"..strNpcName.."<color>"..NpcSayInfo[12][2][1],getn(NpcSayInfo[12][2][2]),NpcSayInfo[12][2][2])
		return
	end
	if tPlayer.nWinNum >= self.tMatch.nLimit or tPlayer.nLoseNum >= self.tMatch.nLimit then
		self:MatchOver(tPlayer.nWinNum, tPlayer.nLoseNum);
		return
	end
	Say("<color=green>"..strNpcName.."<color>: "..NpcSayInfo[12][3][1].."("..GetName()..")"..tPlayer.nWinNum..":"..tPlayer.nLoseNum.."("..strNpcName..")", getn(tStageHide_1.tMatch.tInfo),
		tStageHide_1.tMatch.tInfo[1].." /#tStageHide_1:Match(1)",
		tStageHide_1.tMatch.tInfo[2].." /#tStageHide_1:Match(2)",
		tStageHide_1.tMatch.tInfo[3].." /#tStageHide_1:Match(3)"
		);
end

function tStageHide_1:cleanStage()
	local nMapId = gf_GetCurMapID();
	tStageHide_1.tMatch.tLive[nMapId] = {};
	tStageBase.cleanStage(self);
	SetMissionV(MV_MATCH_COUNT, 0);
	SetMissionV(MV_MATCH_WIN, 0);
	SetMissionV(MV_MATCH_AWARD, 0);
	LM_StopTimeGuage(1);
end

function tStageHide_1:MatchOver(nWin, nLose)
	local nTotalMatch	= GetMissionV(MV_MATCH_COUNT);
	local nTotalWin	= GetMissionV(MV_MATCH_WIN);
	local strNpcName	= GetNpcName(GetTargetNpc());
	local nTeamSize	= GetTeamSize();
	local szMsg = nWin..LSMsgToTeam[28][1]..nLose..LSMsgToTeam[28][2]
	local szMsg_2 = format(LSSysTalk[12][1],GetName())
	if nWin > nLose then
		szMsg = nWin..LSMsgToTeam[28][1]..nLose..LSMsgToTeam[28][3]
		szMsg_2 = format(LSSysTalk[12][2],GetName())
		nTotalWin = nTotalWin + 1;
	end
	nTotalMatch = nTotalMatch + 1;
	szMsg_2 = szMsg_2..format(LSSysTalk[12][3],nTotalWin,(nTotalMatch - nTotalWin),nTotalWin)
	SetMissionV(MV_MATCH_COUNT, nTotalMatch);
	SetMissionV(MV_MATCH_WIN, nTotalWin);
	Talk(1, "", szMsg);
	Msg2MSAll(MISSION_ID, szMsg_2);
	self.tMatch.tLive[gf_GetCurMapID()][PlayerIndex].bMatch = 1;
	if nTotalMatch == nTeamSize and 1 ~= GetMissionV(MV_MATCH_AWARD) then
		self:AllMatchOver();
	end
end

function tStageHide_1:AllMatchOver()
	local nTotalMatch	= GetMissionV(MV_MATCH_COUNT);
	local nTotalWin	= GetMissionV(MV_MATCH_WIN);
	local nTeamSize	= GetTeamSize();
	local szMsg = LSMsgToTeam[29][1]
	local nAward = 0;
	if 1 ~= GetMissionV(MV_MATCH_AWARD) then
		SetMissionV(MV_MATCH_AWARD, 1);
		if nTotalWin >= tStageHide_1.tMatch.tTeamRule[nTeamSize] then
			szMsg = szMsg..LSMsgToTeam[29][2]
			nAward = 2;
		else
			szMsg = szMsg..LSMsgToTeam[29][3]
			nAward = 1;
		end
	end
	Msg2MSAll(MISSION_ID, szMsg);
	StopMissionTimer(MISSION_ID, TIMER_ID);
	StartMissionTimer(MISSION_ID, TIMER_ID, PASS_TIME);
	local nMapId = gf_GetCurMapID()
	ClearMapNpc(nMapId);
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
--		create_box_tong(m, x, y,1)
--	end
	local nRand = random(1, 3);
	for i = 1, 4 do
		create_box_yin(m, x, y,nStage)
		--tMission:dropBox2(m, x, y, 2, 2, 0);
	end
	Observer:onTeamEvent(SYSEVENT_LIANGSHAN_STAGE_FINISH, nStage)
end

function tStageHide_1:Match(nSel)
	local nMapID = gf_GetCurMapID();
	local tPlayer = self.tMatch.tLive[nMapID][PlayerIndex];
	local nSel_2 = random(1, 3);
	local szMsg = self.tMatch.tInfo[nSel_2].."!";
	if nSel_2 == nSel then
		szMsg = NpcSayInfo[12][4][1][1]
	elseif nSel_2 == self.tMatch.tRule[nSel] then
		szMsg = NpcSayInfo[12][4][1][2]
		tPlayer.nLoseNum = tPlayer.nLoseNum + 1;
	else
		szMsg = NpcSayInfo[12][4][1][3]
		tPlayer.nWinNum = tPlayer.nWinNum + 1;
	end
	local strNpcName = GetTargetNpcName();
	Say("<color=green>"..strNpcName.."<color>: "..szMsg, getn(NpcSayInfo[12][4][2]),NpcSayInfo[12][4][2])
end

function tStageHide_1:OnTalk()
	local name = GetTargetNpcName();
	for keyname, _ in self.tWaitingNpc.tModel do
		if name == keyname then
			self:OnTalk2Waiting();
			return
		end
	end
	tStageBase.OnTalk(self);
end

function tStageHide_1:OnTimer()
	local nState = GetMissionV(MV_STAGE_STATE);
	local nFishTime = 0;
	if SS_FIGHTING == nState then		-- 借用 MV_STAGE_STATE 存时间
		nFishTime = GetMissionV(MV_FISH_TIME) + FIGHT_TIME / frame_per_second;
		SetMissionV(MV_FISH_TIME, nFishTime);
		if nFishTime >= tStageHide_1.nMaxMatchTime then
			self:AllMatchOver();
			return
		end
	elseif SS_FIGHTING == nState then
		return
	end

	tStageBase.OnTimer(self);
end
