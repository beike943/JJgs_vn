--作者：严军
--创建日期：07年11月21日11:44
--NPC死亡脚本
--注意：考虑到因不明原因造成NPC刷在关卡以外的地图，需对NPC死亡时所处的地图作判断
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function OnDeath(nNpcIdx)
	if GetMissionV(MV_NSC_REMOVE_NPC_BODY) == 1 then
		BR_RemoveNpcIndex(nNpcIdx);
		SetNpcLifeTime(nNpcIdx,0);
	end;
	local nNeedKillCount = GetMissionV(MV_NSC_NEED_KILL_NUMBER);
	local nCurKillCount = GetMissionV(MV_NSC_KILL_NPC_COUNT);
	SetMissionV(MV_NSC_KILL_NPC_COUNT,nCurKillCount+1);
	SetMissionV(MV_NSC_REFLASH_KILL_NUMBER,GetMissionV(MV_NSC_REFLASH_KILL_NUMBER)+1);
	if BR_CheckWinCondition() == 1 then	--检查是否达到过关要求
		if GetMissionV(MV_MISSION_STATE) ~= MS_STATE_STARTED then
			return 0;
		end;
		BR_EndStage();
	else
		Msg2MSAll(MISSION_ID,"还需要击杀: "..(nNeedKillCount-nCurKillCount-1));
	end;
end;