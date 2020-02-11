Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\missions\\kuafu_battle\\runtime_data_stat.lua")

function OnDeath(Launcher)
	--清除药CD
	ClearColdDown();
	--先清雪恨状态再加
	RemoveState(9908);
	RemoveState(9909);
	RemoveState(9910);
	RemoveState(9911);
	--npc buff Remove
	for i = 20101, 20106 do
		RemoveState(i);
	end
	--非开战状态死的无视
	local nBattleState = GetMissionV(MV_BATTLE_STATE);
	if nBattleState ~= MS_STATE_FIGHT then	
		return 0;
	end;
	--重生
	KF_RevivePlayer();
	--死亡的时候记录死亡时间
	SetTaskTemp(TMP_TASK_KF_TIME, GetTime());
	--被杀死活跃度+1
	KF_AddActivity(KF_ACTIVITY_PLAYERDEATH);
	--计数被杀次数
	gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 1, 2) + 1);
	--标记死亡了
	gf_SetTaskBit(KF_BATTLE_TASK, 27, 1, TASK_ACCESS_CODE_KF_BATTLE);
	--删除NB武器
	DelNBWeapon();
	
	--杀人的玩家活跃和积分处理
	local DeathPlayerIndex = PlayerIndex;
	local KillerPlayerIndex = NpcIdx2PIdx(Launcher);	
	if KillerPlayerIndex > 0 and KillerPlayerIndex ~= DeathPlayerIndex then
		local nOldPlayerIndex = PlayerIndex
		PlayerIndex = KillerPlayerIndex;
		KF_AddActivity(KF_ACTIVITY_PLAYER);
		KF_AddScore(KF_SCORE_PLAYER);
		--记录杀人次数
		gf_SetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4, gf_GetMyTaskTempByte(TMP_TASK_KF_KILL_NUM, 3, 4) + 1);
		
		_stat_when_kill_player()
		
		PlayerIndex = DeathPlayerIndex;
		_stat_when_death()
		
		PlayerIndex = nOldPlayerIndex
	end
end