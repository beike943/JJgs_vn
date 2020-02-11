Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");
Include("\\script\\function\\vip_card\\vc_head.lua")
Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

tStage_6 = {}
tStage_6 = gf_Inherit(tStageBase)
tStage_6.basePos = {1597, 2820};
tStage_6.tRulePoses = {
		{50,	50},	-- 1
		{50,	100},
		{50,	150},	-- 3
		{100,	50},
		{100,	100},	-- 5
		{100,	150},
		{150,	50},	-- 7
		{150,	100},
		{150,	150},	-- 9
		{0,		50},	--BOSS
		{80,	100},	--WAIT_1
		{200,	70},	--WAIT_2
		{80,	100},	--PASS
		{-15 , 15, 56},
		{-33 , 24, 56},
		{-51 , 33, 56},
		{-69 , 42, 56},
		{-87 , 51, 56},
		{-105, 60, 56},
		{15 , 15, 8},
		{33 , 24, 8},
		{51 , 33, 8},
		{69 , 42, 8},
		{87 , 51, 8},
		{105, 60, 8},
		{-105+4,69 +2, 40},
		{-87 +4,78 +2, 40},
		{-69 +4,87 +2, 40},
		{-51 +4,96 +2, 40},
		{-33 +4,105+2, 40},
		{-15 +4,114+2, 40},
}
tStage_6.nMaxBossCount = 4;
tStage_6.bosslevel = 2;
tStage_6.tFish = {
		tGroup = {},
		tModel = {},
		tPos = {},
		lifetime = 60,
		count = 1,
	}
tStage_6.tBossPos = {
	[1] = {POS_PASS+1,POS_PASS+2,POS_PASS+3,POS_PASS+4,POS_PASS+5,POS_PASS+6,POS_PASS+7,POS_PASS+8,POS_PASS+9,POS_PASS+10,POS_PASS+11,POS_PASS+12,POS_PASS+13,POS_PASS+14,POS_PASS+15,POS_PASS+16,POS_PASS+17,POS_PASS+18,},
	[2] = {56, 56, 56, 56, 56, 56, 8, 8, 8, 8, 8, 8, 40, 40, 40, 40, 40, 40},
	}

tStage_6.tWaitingNpc = {
		tModel = {
			[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2], POS_WAIT_1, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		}
	}

tStage_6.tPassNpc = {
		tModel = {
			[NpcName[1][1]] = {NpcName[1][1], NpcName[1][2], POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		}
	}
function tStage_6:init()
	tStageBase.init(self);
	Msg2MSAll(MISSION_ID,format(LSMsgToTeam[15],LSStageName[6]));
end
function tStage_6:createWaitingNpc(bFight)
	tStageBase.createWaitingNpc(self);
	self:createShowBoss(bFight)
end
function tStage_6:createShowBoss(bFight)
	local bossId = 0;
	if bFight then
		bossId = GetMissionV(MV_CUR_BOSS_ID)
	end
	for i = 1, getn(tMission.tBossModel) do
		if bossId ~= i then
			local tModel = tMission.tBossModel[i];
			local map, x, y = self:getMapPos(self.tBossPos[1][i]);
			local nNpcIdx = CreateNpc(tModel[1], tModel[1], map, x, y, 6);
			AddUnitStates(nNpcIdx, 7, 0);
			SetNpcDir(nNpcIdx, self.tBossPos[2][i]);
			local nOldEyeRange = GetUnitCurStates(nNpcIdx, 8);
			AddUnitStates(nNpcIdx, 8, -nOldEyeRange);
			if GetMissionV(MV_STAGE_STATE) == SS_PASSING then
			end
		end
	end
end
----

function tStage_6:OnTalk2Waiting()
	local name = "<color=green>"..GetTargetNpcName().."<color>";
	local state = GetMissionV(MV_STAGE_STATE);
	if state == SS_WAITING_2 or state == SS_WAITING then
		local tSel = NpcSayInfo[11][1][2]
		if GetTeamMember(0) ~= PlayerIndex then
			tSel = {
				NpcSayInfo[11][1][2][1],NpcSayInfo[11][1][2][2],NpcSayInfo[11][1][2][4]
			}
		end
		Say(name..NpcSayInfo[11][1][1],
			getn(tSel), tSel);
		return
	elseif state == SS_FIGHTING then
	elseif state == SS_PASSING then
		Say("<color=green>"..GetTargetNpcName().."<color>"..NpcSayInfo[11][2][1],getn(NpcSayInfo[11][1][2]),NpcSayInfo[11][1][2])
	end
end
tStage_6.OnTalk2PassNpc = tStage_6.OnTalk2Waiting;

function tStage_6:OnTimer()
	tStageBase.OnTimer(self)

	local state = GetMissionV(MV_STAGE_STATE);
	local nLoop = GetMissionV(MV_LOOP) + 1;
	if state == SS_PASSING or state == SS_WAITING_2 or state == SS_WAITING then
		if GetMissionV(MV_DAYE) ~= 0 then
			Msg2MSAll(MISSION_ID, format(LSMsgToTeam[23],TJYLInfo[4]));
		end
	end
end

function tStage_6:OnTalk()
	local name = GetTargetNpcName();
	local state = GetMissionV(MV_STAGE_STATE);
	if state == SS_WAITING_2 or state == SS_WAITING then
	for keyname, _ in self.tWaitingNpc.tModel do
		if name == keyname then
			self:OnTalk2Waiting();
			return
		end
	end
	end
	tStageBase.OnTalk(self);
end

function tStage_6:OnNpcDeath(npcIdx)
end

function preStart()
	local state = GetMissionV(MV_STAGE_STATE);
	if state ~= SS_WAITING_2 and state ~= SS_WAITING then
		Talk(1, "","Х th玭g quan,nhanh ch鑞g r阨 kh醝!");
		return
	end
	if GetMissionV(MV_DAYE) ~= 0 or GetMissionV(MV_DAYE_2) ~= 0 then
		Talk(1, "",LSSysTalk[1]);
		return
	end
	if DelItem(T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED) == 1 then
		SetMissionV(MV_DAYE, PlayerIndex);
		SetMissionV(MV_LAO_ER, PlayerIndex);
		gf_ModifyTask(VET_MS_TASKID_JUYILING, N_CALL_BOSS_TIANJIAOLING_NEED);
		start();
		
		_stat_when_ib_consume(N_CALL_BOSS_TIANJIAOLING_NEED)--IB消耗统计
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {T_TIANJIAOLING[1],T_TIANJIAOLING[2],T_TIANJIAOLING[3],N_CALL_BOSS_TIANJIAOLING_NEED})
	else
		Talk(1, "", format(LSSysTalk[10],T_TIANJIAOLING[4],T_TIANJIAOLING[4]));
	end
end

function preClose()
	if GetMissionV(MV_DAYE) ~= 0 or GetMissionV(MV_DAYE_2) ~= 0 then
		Talk(1, "", LSSysTalk[11]);
		return
	end
	local state = GetMissionV(MV_STAGE_STATE);
	if state == SS_WAITING_2 or state == SS_WAITING or state == SS_PASSING then
		_stat_when_all_pass()--数据统计
		_op_on_team(_stat_on_player_when_all_pass)--数据统计
		CloseMission(MISSION_ID)
	end
end
function tStage_6:OnBossDeath(npcIdx)
	local bossId = GetMissionV(MV_CUR_BOSS_ID)
	local name = tMission:getBossName(bossId);
	local curTime = GetTime();
	local bossTime = curTime - GetMissionV(MV_BOSS_CREATE_TIME);
	local stageTime = curTime - GetMissionV(MV_STAGE_START_TIME);
	tMission:killBoss(bossId);
	Msg2MSAll(MISSION_ID, name..LSMsgToTeam[24]);
	local nBossCount = GetMissionV(MV_BOSS_COUNT) + 1;
	WriteLog(format("[liangshan:BossDeath] [stage=%d, bossname=%s, bossTime=%d, playerCount=%d, stageTime=%d, BossCount=%d]",
		GetMissionV(MV_STAGE_LEVEL), name,  bossTime, GetTeamSize(), stageTime, nBossCount));
	self:BossDownAddWXXS()
	SetMissionV(MV_LOOP, 0);
	local fRevive = function()
		if IsPlayerDeath() == 1 or GetLife() <= 1 then
			RevivePlayer(0);
		end
		RestoreAll();
	end
	mf_OperateAllPlayer(MISSION_ID,fRevive,nil,1);
	local m, x, y = GetNpcWorldPos(npcIdx);
	if nBossCount >= self.nMaxBossCount then
		StopMissionTimer(MISSION_ID, TIMER_ID);
		StartMissionTimer(MISSION_ID, TIMER_ID, PASS_TIME);
		Msg2MSAll(MISSION_ID, format(LSMsgToTeam[25], PASS_TIME/18));
		local nMapId = gf_GetCurMapID();
		ClearMapNpc(nMapId);
		SetMissionV(MV_STAGE_STATE, SS_PASSING);
		self:passStage();
		self:createShowBoss();
		create_box_gold(m,x,y,8)
		tMission:dropBox(npcIdx, 1);
		gf_TeamOperateEX(_vc_LS_Pass_8, 0)
		Observer:onTeamEvent(SYSEVENT_LIANGSHAN_STAGE_FINISH, 8)
		return
	end
	self:giveAward();
	SetMissionV(MV_BOSS_COUNT, nBossCount);
	SetMissionV(MV_STAGE_STATE,SS_WAITING_2);
	tMission:dropBox(npcIdx, 1);--好汉箱
--	tMission:dropBox2(m, x, y);
	local nRand = random(1, 3);
	for i = 1, 4 do
		--tMission:dropBox2(m, x, y, 2, 2, 0);
		create_box_yin(m,x,y,nBossCount+4)
	end
	create_box_tong(m,x,y,nBossCount+4)
	Observer:onTeamEvent(SYSEVENT_LIANGSHAN_STAGE_FINISH, nBossCount+4)
end
