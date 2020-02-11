Include("\\script\\missions\\tong_mission\\mission\\mission_head.lua");
function OnTimer()
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:OnTimerTriggerEven();
	StopMissionTimer(MISSION_ID,ASSI_TIMER_ID);
end;