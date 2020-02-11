--脚本名称：西北区关卡mission系统文件文件
--脚本功能：mission相关的系统操
--策划人：严军
--代码开发人：村长
--代码开发时间：2007-08-08
--代码修改记录：
--=================公共变量定义区
Include("\\script\\missions\\northwest_mission\\mission\\mission_head.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\online\\zgc_public_fun.lua")												--村长的公共函数

--mission开始
function InitMission()
	SetMissionV(MS_STATE_ID,MS_state_wait_start)	--设置Mission的状态为准备状态
	SetMissionV(MS_TIMMER_LOOP_ID,Timmer_loop_num)	--设置计时器总计时次数
	StartMissionTimer(MS_ID,Timmer_ID,Timer_interval)	--开始一个计时器
end
--mission结束
function EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID)								--清除所有npc
	ClearMapObj(nMapID)								--清除地图所有物品
	mf_ClearMissionData()
	StopMissionTimer(MS_ID,Timmer_ID)
	mf_DelAllMSPlayer(MS_ID,0)			--从Mission里面删除所有的玩家
end
--离开mission
function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex
	player_log_out_pub_deal()
	local nMapID = SubWorldIdx2ID(SubWorld)
	local tb_player = mf_GetMSPlayerIndex(MS_ID,0,nMapID)
	if getn(tb_player) == 0 then
		CloseMission(MS_ID)
	end
	PlayerIndex = RoleIndex
end
--加入mission
function JoinMission(RoleIndex,nCamp)
	local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
	PlayerIndex = RoleIndex
		local stage_seq = GetMissionV(MS_STATE_DIFF_ID)
		local mission_diff = GetTask(Task_ID_stage_diff)
		CleanInteractive()
		StartTimeGuage(Stage_info[stage_seq].stage_start_time_bar,60,0,1)
		Msg2Player(Stage_info[stage_seq].stage_start_msg)
		Talk(1,"",Stage_info[stage_seq].stage_start_talk)
		--复杂关卡需要的特殊处理
		if mission_diff == 2 then
			SetPKFlag(1,1)			--PK状态
			ForbidChangePK(1)		--禁止转换PK状态
			SetCreateTeam(1)		--禁止队伍操作
			--第四关单独处理:清除拔草数量
			if stage_seq == 4 then
				SetTask(1856,0)
			end
			--关卡次数记录
			local week_seq_save = GetTask(Mission_week_seq_TaskID)
			local times_save = GetTask(Mission_login_times_TaskID)
			local week_seq_now = Zgc_pub_week_seq()
			if week_seq_save == nil or week_seq_save < Zgc_pub_week_seq() then
				SetTask(Mission_week_seq_TaskID,week_seq_now)
				SetTask(Mission_login_times_TaskID,1)
			else
				SetTask(Mission_login_times_TaskID,(times_save + 1))
			end
			if week_seq_save ~= Zgc_pub_week_seq() then
				SetTask(Mission_week_seq_TaskID,Zgc_pub_week_seq())
				SetTask(Mission_login_times_TaskID,1)
			end
		end
		SetFightState(1)			--设置战斗模式
		UseScrollEnable(0)		--禁止使用回城符
		ForbitTrade(1)			--禁止交易
		StallEnable(0)				--禁止摆摊
		SetDeathPunish(0)		--无死亡惩罚
		OpenFriendliness(0)	--不增加好感度
		gf_ForbidFactionSkill(1)	--镇派屏蔽
		KillFollower()
		CreateTrigger(3,Trigger_ID,Trigger_save_ID)
		SetDeathScript("\\script\\missions\\northwest_mission\\mission\\mission_player_death.lua")
		AddMSPlayer(MS_ID,nCamp)
	PlayerIndex = RoleIndex
end


