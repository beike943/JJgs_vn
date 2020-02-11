Include("\\script\\missions\\liangshan\\daily_tasks.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

tStageBase = {
	basePos = {},
	bosslevel = 1,
	waitLoop = {
		[SS_WAITING		] = 10 * 60 / (WAITING_TIME/frame_per_second),
		[SS_FIGHTING 	] = 30 * 60 / (FIGHT_TIME/frame_per_second),
		[SS_PASSING		] = 10 * 60 / (PASS_TIME/frame_per_second),
		[SS_FISH		] = nil,
		[SS_WAITING_2	] = 10 * 60 / (WAITING_TIME/frame_per_second),
	},
	tBoss = {
		tPos = {POS_BOSS},
		script = "\\script\\missions\\liangshan\\mission\\boss_death.lua",
	},
	tFish = {
		tModel = {},
		tPos = {},
	},
	tWaitingNpc = {
	},
	tPassNpc = {
		tModel = {
			[NpcName[1][2]] = {NpcName[1][1], NpcName[1][1], POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		}
	},
	passMsg = "...",
}

function tStageBase:init()
	SetMissionV(MV_STAGE_STATE, SS_WAITING);
	SetMissionV(MV_LOOP, 0);
	StopMissionTimer(MISSION_ID,TIMER_ID);
	StartMissionTimer(MISSION_ID,TIMER_ID,WAITING_TIME);
	self:createWaitingNpc();
	SetMissionV(MV_SHOW_WELCOME, 2);
end

function tStageBase:createWaitingNpc(bFight)
	local tModel = self.tWaitingNpc.tModel;
	if bFight then
		tModel = self.tWaitingNpc.tFightModel;
	end
	for key, tNpc in tModel do
		local m,x,y = self:getMapPos(tNpc[3]);
		local aiType = nil;
		if not bFight then
			aiType = 6;
		end
		local nNpcIdx = CreateNpc(tNpc[1], tNpc[2], m, x, y, aiType);
		if not bFight then
			AddUnitStates(nNpcIdx, 7, 0);
			AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));
		end
		SetNpcScript(nNpcIdx, tNpc[4]);
	end
end

function tStageBase:createPassNpc()
	for key, tNpc in self.tPassNpc.tModel do
		local m,x,y = self:getMapPos(tNpc[3]);
		local nNpcIdx = CreateNpc(tNpc[1], tNpc[2], m, x, y, 6);
		AddUnitStates(nNpcIdx, 7, 0);
		AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));
		SetNpcScript(nNpcIdx, tNpc[4]);
	end
end

function tStageBase:start()
	StopMissionTimer(MISSION_ID,TIMER_ID)
	StartMissionTimer(MISSION_ID,TIMER_ID,FIGHT_TIME);
	SetMissionV(MV_STAGE_STATE,SS_FIGHTING);
	SetMissionV(MV_LOOP, 0);
	SetMissionV(MV_STAGE_START_TIME, GetTime())
	resetPosition();
	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	self:createBoss();
	self:createWaitingNpc(1)
	self:createFish();
	local nStage = GetMissionV(MV_STAGE_LEVEL);
	local m, x, y = self:getMapPos(self:getBossPos());
	if nStage < 7 then
		--Observer:onEvent(OE_LS_CREATE_NPC,{m, x, y}); --pvp地图传入mapID和阵营，pve传入mapID和坐标
	end
end

function tStageBase:OnTimer()
	local nState = GetMissionV(MV_STAGE_STATE);
	local nLoop = GetMissionV(MV_LOOP) + 1;
	SetMissionV(MV_LOOP, nLoop);
	if nState == SS_WAITING or nState == SS_WAITING_2 then		--关卡等待提示
		Msg2MSAll(MISSION_ID, format(LSMsgToTeam[7].."%d/%d", nLoop, self.waitLoop[nState]));
		if nLoop >= self.waitLoop[nState] then
			CloseMission(MISSION_ID);
		end
	elseif nState == SS_FIGHTING then		--关卡进行提示
		Msg2MSAll(MISSION_ID, format(LSMsgToTeam[8].."%d/%d", nLoop, self.waitLoop[nState]));
		self:createFish();
		if nLoop >= self.waitLoop[nState] then
			CloseMission(MISSION_ID);
		end
	elseif nState == SS_PASSING then		--关卡等待结束提示
		Msg2MSAll(MISSION_ID, format(LSMsgToTeam[9].."%d/%d", nLoop, self.waitLoop[nState]));
		if nLoop >= self.waitLoop[nState] then
			CloseMission(MISSION_ID);
		end
	end
end
--boss创建
function tStageBase:createBoss()
	local m, x, y = self:getMapPos(self:getBossPos());
	local bossId = tMission:createBoss(self.bosslevel, m, x, y, self.tBoss.script, CampEnemy);
	local name = tMission:getBossName(bossId)
	Msg2MSAll(MISSION_ID, name..LSMsgToTeam[10]);
	SetMissionV(MV_CUR_BOSS_ID, bossId);
	SetMissionV(MV_BOSS_CREATE_TIME, GetTime());
	tMission:killBoss(bossId);
end
--获取boss创建坐标
function tStageBase:getBossPos()
	local tPos = self.tBoss.tPos[1];
	return tPos;
end
--创建杂鱼
function tStageBase:createFish()
	local tPoses = self.tFish.tPos;
	local tModel = self.tFish.tModel;
	for _, tPos in tPoses do
		for i = 1, self.tFish.count do
			local fishtype = random(1, getn(tModel));
			self:createAFish(fishtype, tPos);
		end
	end
end
--继续创建杂鱼
function tStageBase:createAFish(fishtype, nPosIdx)
	local tModel = self.tFish.tModel;
	local tNpc = tModel[fishtype];
	assert(tNpc);
	local nNpcIdx = CreateNpc(tNpc[1], tNpc[2], self:getMapPos(nPosIdx));
	if tNpc[3] then
		SetNpcDeathScript(nNpcIdx, tNpc[3]);
	end
	SetNpcLifeTime(nNpcIdx, self.tFish.lifetime);
	SetCampToNpc(nNpcIdx, CampEnemy);
end

function tStageBase:getMapPos(nPosIdx)
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	local tOldStage	= _stage[nOldStage];
	local tPos			= tOldStage.tRulePoses[nPosIdx];
	local nX			= tPos[1]/5		+ tOldStage.basePos[1];
	local nY			= tPos[2]/2.5	+ tOldStage.basePos[2];
	return gf_GetCurMapID(), nX, nY;
end

function tStageBase:getMapPos2(tPos)
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	local tOldStage	= _stage[nOldStage];
	local nX			= tPos[1]/5		+ tOldStage.basePos[1];
	local nY			= tPos[2]/2.5	+ tOldStage.basePos[2];
	return gf_GetCurMapID(), nX, nY;
end

function tStageBase:passStage()
	local nStage		= GetMissionV(MV_STAGE_LEVEL);
	local nOldStage	= GetMissionV(MV_STAGE_LEVEL_OLD);
	if nOldStage == 4 then
		LM_SetTaskDone(1);
	elseif nOldStage == 6 then
		LM_SetTaskDone(2);
	end
	self:cleanStage();
	self:giveAward();
	self:createPassNpc();
end

function tStageBase:cleanStage()
end

function tStageBase:giveAward(nStage)
	local fawrd = function(nStage)
		local ExpAddRate = (1 + GetVipCardParam() + T_ROUTE_CNT_EXP_ADD_RATE[GetMissionV(MV_LS_ROUTE_COUNT)])*(1+LS_EXP_ADD_RATE)
		if not nStage then
			nStage = GetMissionV(MV_STAGE_LEVEL)
    		if nStage >= HIDEMISSION_BEGIN then	-- 隐藏关卡的下一关
    			nStage = GetMissionV(MV_STAGE_LEVEL_OLD);
    		end
		end
		if 6 == nStage then
			local nBossCount = GetMissionV(MV_BOSS_COUNT)
			nStage = 5 + nBossCount
		end
		local nExp = T_LS_AWARD_EXP_STAGE[nStage] or 0;
		nExp = nExp * ExpAddRate
--		nExp = nExp * nExp * nExp;
		local nTimes = GetTask(VET_MS_LS_TASKID_LIANGSHAN_ITEM_DAILY);
--		if nTimes >= 13 then
--			nExp = nExp * 4 / 6 * 1.5;
--		elseif nTimes >= 9 then
--			nExp = nExp * 5 / 6 * 1.5;
--		else
--			nExp = nExp * 1.8
--		end
		SetTask(VET_MS_LS_TASKID_LIANGSHAN_ITEM_DAILY, nTimes + 1);
		gf_Modify("Exp", floor(nExp));
	end
	mf_OperateAllPlayer(MISSION_ID,fawrd,nStage,1)
end
-----------------------------------------------------------
function tStageBase:OnPlayerDeath(Launcher)
	local name = GetNpcName(Launcher);
	WriteLog(format("[liangshan:playerDeath] [killer=%s, stage=%d] [playerName=%s, lv=%d, route=%d]",
		name, GetMissionV(MV_STAGE_LEVEL), GetName(), GetLevel(), GetPlayerRoute()));
	bAllDeath = 1;
	local f = function()
		if IsPlayerDeath() == 0 and GetLife() > 0 then
			bAllDeath = 0;
		end
	end
	mf_OperateAllPlayer(MISSION_ID,f,nil,1);
	if bAllDeath == 1 then

	local bossId = GetMissionV(MV_CUR_BOSS_ID)
	local name = tMission:getBossName(bossId);
		Msg2MSAll(MISSION_ID,LSMsgToTeam[11]);
		CloseMission(MISSION_ID);
	end
end

function tStageBase:OnBossDeath(npcIdx)
	local bossId = GetMissionV(MV_CUR_BOSS_ID)
	local name = tMission:getBossName(bossId);
	local name2 = GetNpcName(nNpcIdx);
	tMission:killBoss(bossId);
	Msg2MSAll(MISSION_ID, name..LSMsgToTeam[12]);
	local curTime = GetTime();
	local bossTime = curTime - GetMissionV(MV_BOSS_CREATE_TIME);
	local stageTime = curTime - GetMissionV(MV_STAGE_START_TIME);
	WriteLog(format("[liangshan:BossDeath] [stage=%d, bossname=%s, bossTime=%d, playerCount=%d, stageTime=%d]",GetMissionV(MV_STAGE_LEVEL),name,bossTime,GetTeamSize(),stageTime));
	--self:BossDownAddWXXS()--不再掉落五行玄石
	StopMissionTimer(MISSION_ID, TIMER_ID);
	StartMissionTimer(MISSION_ID, TIMER_ID, PASS_TIME);

	local nMapId = gf_GetCurMapID();
	ClearMapNpc(nMapId);
	SetMissionV(MV_STAGE_STATE, SS_PASSING);
	SetMissionV(MV_LOOP, 0);
	self:passStage();

	local nStage		= GetMissionV(MV_STAGE_LEVEL);
	local m, x, y = GetNpcWorldPos(npcIdx);
	--免费箱子
	--tMission:dropBox(npcIdx);
	create_box_tong(m, x, y,nStage)
	create_box_gold(m, x, y,nStage)
--	if random(1,2) == 1 then
--		--tMission:dropBox(npcIdx);
--		create_box_tong(m, x, y,nStage)
--	end

	--收费箱子
	local nRand = random(1, 3);
	for i = 1, 4 do
		--tMission:dropBox2(m, x, y, 2, 2, 0);
		create_box_yin(m, x, y, nStage)
	end
	Observer:onTeamEvent(SYSEVENT_LIANGSHAN_STAGE_FINISH, nStage)
end

function tStageBase:OnTalk2PassNpc()
	local name = "<color=green>"..GetTargetNpcName().."<color>:";
	MU_Msg2Team(self.passMsg)
	Say(name..self.passMsg, 3,
		NpcSayInfo[5][1].."/nextStage",
		NpcSayInfo[5][2].."/#tMission:showBossState()",
		NpcSayInfo[5][3].."/nothing");
end

function tStageBase:OnNpcDeath(npcIdx)
end

function tStageBase:OnTalk()
	local name = GetTargetNpcName();
	if GetTeamMember(0) ~= PlayerIndex then
		Say(name..NpcSayInfo[5][4],
			2,
			NpcSayInfo[5][2].."/#tMission:showBossState()",
			NpcSayInfo[5][3].."/nothing"
		)
		return
	end
	for keyname, _ in self.tWaitingNpc.tModel do
		if name == keyname then
			self:OnTalk2Waiting();
			return
		end
	end
	for keyname, _ in self.tPassNpc.tModel do
		if name == keyname then
			self:OnTalk2PassNpc();
			return
		end
	end
end
--==:村长 5-25-2011增加击败BOSS获得五行玄石奖励
function tStageBase:BossDownAddWXXS()
--	local fAddWXXS = function()
--		local nKill = GetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_BOSS_KILL) + 1
--		local nGot = floor(nKill/2)
--		--今天已经获得数量
--		if nGot >= nWXXSGetEveryDayMax then
--			return
--		end
--		SetTask(VET_MS_LS_TASKID_LIANGSHAN_DAILY_BOSS_KILL,nKill)
--		--杀两个boss获得一个
--		if mod(nKill,2) ~= 0 then
--			return
--		end
--		--增加五行玄石
--		if gf_Judge_Room_Weight(1,1) == 1 then
--			local bAddFlag = AddItem(LsPrizeWXXS[1],LsPrizeWXXS[2],LsPrizeWXXS[3],1)
--			if bAddFlag == 1 then
--				Msg2Player(format(LSMsgToPlayer[19],nGot + 1,LsPrizeWXXS[4],nWXXSGetEveryDayMax))
--			end
--		else
--			Msg2Player(format(LSMsgToPlayer[18],LsPrizeWXXS[4]))
--		end
--		--活动调用
--		vaf_liangshan_boss_down()
--	end
--	mf_OperateAllPlayer(MISSION_ID,fAddWXXS,nil,1);
end
function start()
	remove_jingli_box()--移除精力宝箱
	remove_tong_box()
	remove_yin_box()
	remove_gold_box()
	SetMissionV(MV_LS_ROUTE_COUNT, getRouteCount())
	RunMission(MISSION_ID);
end
