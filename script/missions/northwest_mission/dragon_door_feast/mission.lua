--脚本名称：西北区关卡mission系统文件文件
--脚本功能：mission相关的系统操
--策划人：严军
--代码开发人：村长
--代码开发时间：2007-08-08
--代码修改记录：
--=================公共变量定义区
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\missions\\northwest_mission\\dragon_door_feast\\mission_head.lua")

function InitMission()
	SetMissionV(MS_STATE_ID,1)												--设置Mission的状态为准备状态
	SetMissionV(MS_PLAYER_NUM,0)
	SetMissionV(MS_TIMMER_LOOP_ID,feast_time_loop_num)	--设置计时器总计时次数
	SetMissionV(MS_feast_timmer_deputy_loop_ID,-1)				--设置为-1则不计数
	StartMissionTimer(FEAST_MS_ID,Timmer_ID,Timer_interval)	--开始一个计时器
end
function EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID)									--清除所有npc
	ClearMapObj(nMapID)									--清除地图所有物品
	SetMissionV(MS_STATE_ID,MS_state_unuse)
	mf_ClearMissionData()
	StopMissionTimer(FEAST_MS_ID,Timmer_ID)
	--清除玩家
	local player = mf_GetMSPlayerIndex(FEAST_MS_ID,0,nMapID)
	local player_num = getn(player)
	if player_num > 0 then
		for i = 1, player_num do
			OnLeave(player[i])
		end
	end
	mf_DelAllMSPlayer(FEAST_MS_ID,CAMP_ALL)			--从Mission里面删除所有的玩家
	mf_ClearMissionData()
	StopMissionTimer(FEAST_MS_ID,Timmer_ID)
end

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex
	OnLogin()
	PlayerIndex = RoleIndex
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex		
		AddMSPlayer(FEAST_MS_ID,nCamp)	
		--进入关卡状态设置		
		InteractiveEnable(0)
		LeaveTeam()
		SetFightState(1)
		SetPKFlag(1,1)		--PK状态
		ForbidChangePK(1)	--禁止转换PK状态
		SetCreateTeam(1)
		UseScrollEnable(0)	--禁止使用回城符
		ForbitTrade(1)		--禁止交易
		StallEnable(0)		--禁止摆摊
		SetDeathPunish(0)	--无死亡惩罚
		OpenFriendliness(0)	--不增加好感度
		KillFollower()		
		CreateTrigger(3,Login_trigger_ID,Trigger_save_ID)		
		--进入关卡时间进度条设置
		local ms_step = GetMissionV(Ms_feast_step)
		local sec_remain = GetMissionV(MS_TIMMER_LOOP_ID)
		--系统主进度
		for i = 1,getn(Tb_time_bar_info_main) do
			if sec_remain <=Tb_time_bar_info_main[i][1] and sec_remain > Tb_time_bar_info_main[i][2] then
				StartTimeGuage(Tb_time_bar_info_main[i][3],(sec_remain - Tb_time_bar_info_main[i][2]),0,1)
				break
			end
		end
		--系统副进度
		local ms_denputy_step = GetMissionV(Ms_feast_deputy_step)
		if ms_denputy_step ~= 0 then
			StartTimeGuage(Tb_time_bar_info_denputy[i][1],(Tb_time_bar_info_denputy[i][1] + GetMissionV(Ms_feast_forstep_time) - GetTime()),0,2)
		end
	PlayerIndex = RoleIndex
end


