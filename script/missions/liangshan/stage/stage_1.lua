Include("\\script\\missions\\liangshan\\head.lua");
Include("\\script\\missions\\liangshan\\stage\\stagebase.lua");

Include("\\script\\missions\\liangshan\\runtime_data_stat.lua")

tStage_1 = {}
tStage_1 = gf_Inherit(tStageBase)
tStage_1.basePos = TStageBaseInfo[1]
tStage_1.tRulePoses = {
		{50,	50},	-- 1
		{50,	100},
		{50,	150},	-- 3
		{100,	50},
		{100,	100},	-- 5
		{100,	150},
		{150,	50},	-- 7
		{150,	100},
		{150,	150},	-- 9
		{200,	100},	--BOSS
		{200,	60},	--WAIT_1
		{200,	70},	--WAIT_2
		{52,	25},	--PASS
}
tStage_1.tFish = {
	tGroup = {},
	tModel = {
		NpcName[59],
		NpcName[60],
		NpcName[61],
		NpcName[62],
	},
	tPos = {POS_2, POS_4, POS_6, POS_8},							--杂鱼创建坐标
	lifetime = g_objLSRule:GetNum(IniStage1Key,"FishLifeTime"),		--杂鱼存活时间
	count = g_objLSRule:GetNum(IniStage1Key,"FishCrtNum"),			--杂鱼每个点创建数量
}
tStage_1.tBoxes = {
	tGroup = {},
	tModel = {
		{NpcName[63][1], NpcName[63][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
		{NpcName[64][1], NpcName[64][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
		{NpcName[65][1], NpcName[65][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
		{NpcName[66][1], NpcName[66][2], "\\script\\missions\\liangshan\\mission\\mission.lua"},
	},
	tPos = {POS_1, POS_3, POS_5, POS_7, POS_9},
	lifetime = g_objLSRule:GetNum(IniStage1Key,"BoxLifeTime"),			--箱子存活时间
}
tStage_1.tWaitingNpc = {
	tGroup = {},
	tModel = {
		[NpcName[67][2]] = {NpcName[67][1], NpcName[67][2], POS_WAIT_1, "\\script\\missions\\liangshan\\mission\\mission.lua"},
		[NpcName[68][2]] = {NpcName[68][1], NpcName[68][2], POS_WAIT_2, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	},
	tFightModel = {
		[NpcName[67][2]] = {NpcName[67][1], NpcName[67][2],POS_WAIT_1, ""},
		[NpcName[68][2]] = {NpcName[68][1], NpcName[68][2], POS_WAIT_2, ""},
	},
}
tStage_1.tPassNpc = {
	tModel = {
		[NpcName[1][2]] = {NpcName[1][1], NpcName[1][2], POS_PASS, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	}
}
tStage_1.tSkipNpc = {
	tModel = {
		[NpcName[1][2]] = {NpcName[1][1], NpcName[1][2], {345,183}, "\\script\\missions\\liangshan\\mission\\mission.lua"},
	},
	tItem  = {TJYLInfo[4],TJYLInfo[1],TJYLInfo[2],TJYLInfo[3]},
	nDelNum = g_objLSRule:GetNum(IniStage1Key,"SkipItemNum"),
}

tStage_1.passMsg = LSMsgToTeam[13][1]
tStage_1.tWelcome = LSMsgToTeam[14][1]
tStage_1.nEntryTrap = 1

function tStage_1:init()
	tStageBase.init(self);
	Msg2MSAll(MISSION_ID, format(LSMsgToTeam[15],LSStageName[1]));
	self:createSkipNpc();
	LM_Say(NpcSayInfo[6][1][1],getn(NpcSayInfo[6][1][2]),NpcSayInfo[6][1][2])
end
function tStage_1:OnTimer()
	local nState = mf_GetMissionV(MISSION_ID,MV_STAGE_STATE)
	if nState == SS_FIGHTING then
		self:createBox();
	end
	tStageBase.OnTimer(self)
end
function tStage_1:start()
	tStageBase.start(self);
	self:createBox();
end
function tStage_1:createBox()
	local tPoses = self.tBoxes.tPos;
	local tModels = self.tBoxes.tModel;
	for _, tPos in tPoses do
		local tModel = tModels[random(1,getn(tModels))];
		local nNpcIdx = CreateNpc(tModel[1], tModel[2], self:getMapPos(tPos));
		SetNpcScript(nNpcIdx, tModel[3]);
		SetNpcLifeTime(nNpcIdx, self.tBoxes.lifetime)
	end
end

----

function tStage_1:OnTalk2Waiting()
	local name = "<color=green>"..GetTargetNpcName().."<color>";
	Say(name..NpcSayInfo[6][2][1],getn(NpcSayInfo[6][2][2]),NpcSayInfo[6][2][2]);
end

function tStage_1:OnTalk2Skip()
	local name = "<color=green>"..GetTargetNpcName().."<color>";
	Say(name..NpcSayInfo[6][3][1],getn(NpcSayInfo[6][3][2]),NpcSayInfo[6][3][2]);
end

function tStage_1:skip(bSure,nSubWorld)
	local nOldSubWorld = SubWorld
	if nSubWorld then
		SubWorld = nSubWorld
	end
	if not bSure then
	local name = "<color=green>"..GetTargetNpcName().."<color>";
		Say(name..format(NpcSayInfo[6][4][1],0,TJYLInfo[4]),getn(NpcSayInfo[6][4][2]),NpcSayInfo[6][4][2])
		return
	end
--	if GetItemCount(self.tSkipNpc.tItem[2], self.tSkipNpc.tItem[3], self.tSkipNpc.tItem[4]) < self.tSkipNpc.nDelNum then
--		Msg2Player(format(LSMsgToPlayer[13],self.tSkipNpc.tItem[1]))
--	end
--	--删除物品
--	if 1 ~= DelItem(self.tSkipNpc.tItem[2], self.tSkipNpc.tItem[3], self.tSkipNpc.tItem[4], self.tSkipNpc.nDelNum) then
--		return 0
--	end
	--跳关
	gf_ModifyTask(VET_MS_TASKID_JUYILING, N_JOIN_TIANJIAOLING_NEED);
	_stat_when_ib_consume(N_JOIN_TIANJIAOLING_NEED)--IB消耗统计
	_stat_when_back_door_mode()--后门次数统计
	_stat_when_first_4_stage_pass()
	SetMissionV(MV_STAGE_LEVEL, 7);
	nextStage();
	
	SubWorld = nOldSubWorld
end

function tStage_1:OnNpcDeath(npcIdx)
	local name = GetNpcName(npcIdx)
	local tStateRult = {
		[NpcName[63][2]] = 4,
		[NpcName[64][2]] = 3,
		[NpcName[65][2]] = 2,
		[NpcName[66][2]] = 1,
	}
	local nState = tStateRult[name]
	if nState then
		self:castRandomState(npcIdx, nState);
	else
	end
end

function tStage_1:castRandomState(npcIdx, nType)
	local w,x,y = GetNpcWorldPos(npcIdx);
	local tAllState = LSBuffInfo[1]
	nType = nType or random(1, getn(tAllState));
	local tState = tAllState[nType];
	if not tState then
		return
	end
	local msg = format(LSMsgToTeam[31], tState[3], tState[2][1][3]/18, tState[1]);

	local addState2Player = function()
		local myW, myX, myY = GetWorldPos();
		if abs(myX - %x) + abs(myY - %y) > 10 then
			return
		end
		for _, state in %tState[2] do
			CastState(gf_UnPack(state));
		end
		SyncCustomState(1,%tState[2][1][5], 1, %tState[3]);
		Msg2MSAll(MISSION_ID, GetName()..%msg);
	end

	mf_OperateAllPlayer(MISSION_ID,addState2Player,nil,1)
end

function tStage_1:createSkipNpc()
	for key, tNpc in self.tSkipNpc.tModel do
		local m,x,y = self:getMapPos2(tNpc[3]);
		local nNpcIdx = CreateNpc(tNpc[1], tNpc[2], m, x, y, 6);
		AddUnitStates(nNpcIdx, 7, 0);
		AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));
		SetNpcScript(nNpcIdx, tNpc[4]);
	end
end

function tStage_1:OnTalk()
	if GetTeamMember(0) == PlayerIndex and SS_WAITING == GetMissionV(MV_STAGE_STATE) then
		for keyname, _ in self.tSkipNpc.tModel do
			if GetTargetNpcName() == keyname then
				self:OnTalk2Skip();
				return
			end
		end
	end
	tStageBase.OnTalk(self);
end
