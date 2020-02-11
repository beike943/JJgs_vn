Include("\\script\\task\\killer_hall\\mission\\mission_head.lua");
function OnTimer()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_IDEL then
	
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then
		MS_ProcessReadyTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_STARTED then
		MS_ProcessStartedTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_ENDING then
		MS_ProcessEndingTimer();
	end;
end;