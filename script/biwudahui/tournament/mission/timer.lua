Include("\\script\\biwudahui\\tournament\\mission\\mission_head.lua");
function OnTimer()
	BWT_CheckKickAudience();
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_IDEL then
	
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_CHECK_EQUIPMENT then
		MS_ProcessCheckEquipmentTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then
		MS_ProcessReadyTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_STARTED then
		MS_ProcessStartedTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_ENDING then
		MS_ProcessEndingTimer();
	end;
end;