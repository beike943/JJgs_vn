--------------------------------------------------------------------
-- 地玄宫
-- by windle
-- 2010-3-28 21:00
--------------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\npccmdhead.lua");
Include("\\settings\\static_script\\missions\\base\\tmission.lua");
Include("\\script\\lib\\itemfunctions.lua");
--Include("\\script\\西南区\\玉融峰\\npc\\sjzx_head.lua");
--Include("\\script\\misc\\observer\\observer_head.lua");
--Include("\\script\\misc\\data_state\\state.lua")
--Include("\\settings\\static_script\\misc\\missionaward_head.lua")

Include("\\script\\missions\\dixuangong\\mission_head.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage0.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage1.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage2.lua")
Include("\\script\\missions\\dixuangong\\stage\\stage3.lua")
Include("\\script\\missions\\dixuangong\\stage\\stagex.lua")
Include("\\script\\missions\\dixuangong\\stage\\stagexx.lua")

Include("\\script\\missions\\dixuangong\\npc\\box_tong.lua")
Include("\\script\\missions\\dixuangong\\npc\\box_yin.lua")
Include("\\script\\missions\\dixuangong\\npc\\box_gold.lua")

MISSION_ID = 63;
TIMER_ID = 93;

missionOption = {
	--进入操作
	nInitFightState = 1,	--初始战斗状态（进入Mission时的战斗状态）
	szInitDeahScript = "",	--初始死亡脚本（进入Mission时的死亡脚本）

	bForbidChangePK = 0,	--进入关卡时是否禁止转换PK状态
	bUseScrollEnable = 0,	--进入关卡时是否允许使用回城符
	bForbitTrade = 0,		--进入关卡时是否禁止交易
	bStallEnable = 0,		--进入关卡时是否允许摆摊
	bOpenFriendliness = 0,	--进入关卡时是否可以增加好感度
	bDeathPunish = 0,		--进入关卡时是否有死亡惩罚
	bClearMomentum = 0,		--进入关卡时是否要清空杀气值
	bInteractiveEnable = 1,	--进入关卡时是否允许做互动动作
	bForbitTeam = 1,		--进入关卡时是否禁止队伍操作
	bLeaveTeam = 0,			--进入关卡时是否要离开队伍
	bForbitMomentum = 1,	--不可增加杀气值
	bForbitSuperSkill = 0,	--屏蔽镇派

	--离开操作
	nRestoreFightState = 0,	--离开时要恢复的战斗状态（离开Mission时的战斗状态）
	szRestoreDeahScript = "",	--离开Mission时要挂的死亡脚本

	bRestoreForbidChangePK = 0,		--离开关卡时是否禁止转换PK状态
	bRestoreUseScrollEnable = 1,	--离开关卡时是否允许使用回城符
	bRestoreForbitTrade = 0,		--离开关卡时是否禁止交易
	bRestoreStallEnable = 0,		--离开关卡时是否允许摆摊
	bRestoreOpenFriendliness = 1,	--离开关卡时是否可以增加好感度
	bRestoreDeathPunish = 1,		--离开关卡时是否有死亡惩罚
	bRestoreClearMomentum = 0,		--离开关卡时是否要清空杀气值
	bRestoreInteractiveEnable = 0,	--离开关卡时是否允许做互动动作
	bRestoreForbitTeam = 0,			--离开关卡时是否禁止队伍操作
	bRestoreLeaveTeam = 0,			--离开关卡时是否要退队
}

timer = gf_CopyInherit(msTimer, {
	MissionId = MISSION_ID,
	nTimerId = TIMER_ID,
})

camp1 = gf_CopyInherit(msCamp, {
	MissionId = MISSION_ID,
	CampId = 1,
	CampType = CampPlayer,
})
camp2 = gf_CopyInherit(msCamp, {
	MissionId = MISSION_ID,
	CampId = 2,
	CampType = CampEnemy,
})
camp3 = gf_CopyInherit(msCamp, {
	MissionId = MISSION_ID,
	CampId = 3,
	CampType = CampNeutral,
})

dixuangong = newMission {
	fileName = "\\script\\missions\\dixuangong\\mission.lua",
	name = "мa Huy襫 Cung",
	MissionId = MISSION_ID,
	MapId = 0,
	realMapId = 427,

	stages = {
		tStage0,
		tStage1,
		tStage2,
		tStage3,
		tStageX,
		tStageXX,
	},
	msOption = missionOption,
	msTimer = timer,
	msCamp = {
		[1] = camp1,
		[2] = camp2,
		[3] = camp3,
	},
	rule = {
		["s0"] = 1,
		["s1"] = 2,
		["s2"] = 3,
		["s3"] = 4,
		["sx"] = 5,
		["so"] = 6,
	},
	entryPos = {1625, 3277},
	exitPos = {
--		{426,1517,3101},
--		{426,1649,3110},
			{500,1780,3102},
			{500,1780,3102},
	},
	Trap1 = "\\script\\missions\\dixuangong\\trap\\trap1.lua",
	Trap2 = "\\script\\missions\\dixuangong\\trap\\trap2.lua",
	Box1 = "\\script\\missions\\dixuangong\\npc\\box.lua",
	Box2 = "\\script\\missions\\dixuangong\\npc\\ibbox.lua",
	Box3 = "\\script\\missions\\dixuangong\\npc\\ibbox2.lua",
	Box4 = "\\script\\missions\\dixuangong\\npc\\box1.lua",
};
--------------------------------------------------------------------
function dixuangong:getExitPos(nCamp)
	local pos = self:GetMissionV(MV_RETURN_MAP_ID);
	if pos ~= 1 and pos ~= 2 then
		pos = 1;
	end
	return gf_UnPack(self.exitPos[pos]);
end

function dixuangong:missionfinish()
	self:SetMissionV(MV_MISSION_STATUS, 1);
	self:Close();
end

function dixuangong:init()
	self.rule["missionfinish"] = self.missionfinish;
	self.msTimer.MissionId = self.MissionId;
	for i = 1, getn(self.msCamp) do
		self.msCamp[i].MissionId = self.MissionId;
	end
end

function dixuangong:beforeLeave()
	tStageX:CleanGodState();
end

dixuangong:init()
--------------------------------------------------------------------

function createMission(bTianJiaolingMode)
	self = dixuangong;
	
	if join_consume(bTianJiaolingMode,1) ~= 1 then
		return
	end
	
	local nMapId = self:Open();
	if not nMapId or nMapId <= 0 then
		return
	end
	self:TeamJoin(nMapId);

	self:setSubWorld(nMapId);
	local pos = 2;
	if GetTask(TASK_GT_WENSHI_FRIENDLY) > 0 then
		pos = 1;
	end
	self:SetMissionV(MV_RETURN_MAP_ID, pos);
	if 1 == bTianJiaolingMode then
		tStage0_speEnter()--后门模式
	end
	self:resetSubWorld();
	--统计副本开启次数
	AddRuntimeStat(1,1,bTianJiaolingMode,1);
	--参加总人数统计
	AddRuntimeStat(1,2,0,gf_GetTeamSize());
	--开启时80-89人数
	AddRuntimeStat(1,4,0,gf_GetTeamPlayerCountByLevel(80,90));
	--开启时90-99人数
	AddRuntimeStat(1,5,0,gf_GetTeamPlayerCountByLevel(90,100));
	--转生人数统计
	AddRuntimeStat(1,6,0,gf_GetTeamRebornPlayerCount());
	--流派人数统计
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		AddRuntimeStat(1,15,GetPlayerRoute(),1);
	end
	PlayerIndex = oldPlayerIndex;
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(4)");	
	end);
end

-------------------------------------------------------------
function ChangeNpc2Talk(npc)
	AddUnitStates(npc, 7, 0);
	ChangeNpcToFight(npc, 0, 6);
end

function ChangeNpc2Fight(npc)
	AddUnitStates(npc, 7, 2);
	ChangeNpcToFight(npc, 2, 0);
end

function findNpc(npcName)
	local tNpcs = GetMapNpcIdx(g_theMS:getMapId());
	for i = 1, getn(tNpcs) do
		local npc = tNpcs[i];
		if GetNpcName(npc) == npcName then
			return npc;
		end
	end
end
function findAllNpc(npcName)
	local npcs = {}
	local tNpcs = GetMapNpcIdx(g_theMS:getMapId());
	for i = 1, getn(tNpcs) do
		local npc = tNpcs[i];
		if GetNpcName(npc) == npcName then
			tinsert(npcs, npc);
		end
	end
	npcs.n = nil;
	return npcs;
end

function randomin(t)
	if getn(t) < 1 then return end
	return t[random(1, getn(t))];
end

function isCaption()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
end

function reviveAll()
	g_theMS.msCamp[1]:turnPlayer(function ()
		if IsPlayerDeath() ~= 0 or GetLife() <= 1 then
			RevivePlayer(0);
		end
	end)
end
