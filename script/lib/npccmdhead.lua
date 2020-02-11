--Include("\\script\\lib\\define.lua")

NPCCOMMAND = {
	do_none			= 0,		-- 什么也不干
	do_stand		= 1,		-- 站立
	do_goto			= 2,		-- 去(走/跑)往某个目的地 Param_x, Param_y 目的地点坐标
	do_skill		= 3,		-- 发技能:	向目标点发技能	 Param_X, Param_Y, 目标点场景坐标;
					--			向目标Npc发技能	 Param_X = enumSPT_TARGET_NPC,  Param_Y = 目标Npc的ID;
					--			向目标陷阱发技能 Param_X = enumSPT_TARGET_TRAP, Param_Y = 目标陷阱的子弹ID;
					--			Param_Z : 0~15bit 技能ID; 15~23 技能等级; 24~31 预留
					--			Param_E : C2S,S2C发送do_skill命令时自动填充
					--					  C2S:	0~7bit 技能随机种子;	8~15 随机种子计数器;	(发送到服务器端待有效性检测)
					--					  S2C:	0~7bit 技能随机种子;	8~15 随机种子计数器;	16~23 发招速度百分比加成;	24~31 收招速度百分比加成

	do_talk			= 4 ,		-- 跟Npc说话    Param_X = dwNpcId
	do_hurt			= 5 ,		-- 受伤/受打击 ParamX 为-1时发送的是反击技能的同步 为0时发送的是后仰命令,为1时发送的是偷窃技能的同步
	do_parry		= 6 ,		-- 格挡
	do_dodge		= 7 ,		-- 闪避
	do_death		= 8 ,		-- 死亡, Param_X = 倒下的方向,Param_Y = 倒下的时间(游戏侦数)
	do_revive		= 9 ,		-- 重生
	do_beatback		= 10,		-- 击退, Param_X = 击退的方向,Param_Y = 击退的时间(游戏侦数), Param_Z = 是否忽略击退免疫
	do_beatdown		= 11,		-- 击飞, Param_X = 击飞的方向,Param_Y = 击飞的时间(游戏侦数)
	do_fakehurt		= 12,		-- 客户端虚假的被击动作
	do_upturn		= 13,		-- 爬起来
	do_sit			= 14,		-- 打坐
	do_reading		= 15,		-- 研读
	do_faint		= 16,		-- 昏迷
	do_interactive	= 17,		-- 玩家之间交互, Param_X = 交互的具体动作, Param_Y = 是否主动（0-被动，1-主动）
	do_chaos_run	= 18,		-- 混乱跑
	do_gather		= 19,		-- 采集
	do_home_coming	= 20,		-- 回城
	do_gather_end	= 21,  		-- 采集结束
	do_delude_run	= 22,		-- 迷惑跑
	do_delude_skill	= 23,		-- 迷惑攻击
	do_ride			= 24,		-- 骑乘, Param_X = 要骑乘的物品的游戏世界物品索引, Param_Y = 0 下马 1 上马, Param_Z = 0不卸装 1 = 卸装
	do_train		= 25,		-- 训练宠物
	----han't beed checked below--
	--do_idle		,		-- 喘气
	do_stall		= 26,		-- 摆摊
	do_smelt		= 27,		-- 修炼内丹
}

eSkillParamType =
{
	enumSPT_TARGET_NPC	= -1,	-- 目标Npc
	enumSPT_TARGET_TRAP	= -2,	-- 目标Trap
}
--?gm ds NpcCommand(484,3,1634*32,3536*32,65536*20+146)

------------------------------------------------------------------
g_NpcAI = {}
AT_SM_ATTACK 	= 17;	-- A过去
AT_SM_MOVE		= 18;	-- M过去
AT_SM_PATROL	= 19;	-- P过去
AT_SM_PROTECT	= 20;	-- 主动跟随保护	(不能用还)

function g_NpcAI:checkNpc(npc)
	local m,x,y = GetNpcWorldPos(npc);
	--print("MapID=",m)
	if m < 700 then
		WriteLog(format("[Error] [NpcAI] [npc=%s at (%d,%d,%d)] [callfrom:%s # %s]",
			GetNpcName(npc), m, x, y, tostring(CALL_SCRIPT_NAME), tostring(CALL_FUNCTION_NAME)));
		return 1
	end
	return 1;
end
function g_NpcAI:setAI(npc, aiType)
	if not self:checkNpc(npc) then return end
	return AddUnitStates(npc, 7, aiType);
end
function g_NpcAI:setWayPoint(npc, tpos)
	if not self:checkNpc(npc) then return end
	ClearAiParam(npc);
	for i = 1, getn(tpos) do
		local x, y = tpos[i][1] * 32, tpos[i][2] * 32;
		PushAiParam(npc, 0, x, y);
	end
end
