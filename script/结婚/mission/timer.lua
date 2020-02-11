Include("\\script\\½á»é\\marriage_head.lua");
function OnTimer()
	if GetMissionV(MV_FIELD_STATE) == MS_STATE_IDEL then
	
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_READY then
		MR_ProcessReadyTimer();
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_STARTED then
		MR_ProcessStartedTimer();
	elseif GetMissionV(MV_FIELD_STATE) == MS_STATE_COMPLETE then
		MR_ProcessWaitOutTimer();
	end;
end;