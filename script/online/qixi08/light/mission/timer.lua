Include("\\script\\online\\qixi08\\light\\mission\\mission_head.lua");
function OnTimer()
	if GetMissionV(AOYUN_LIGHT_MISSION_STATE) == AOYUN_LIGHT_STATE_IDEL then
	
	elseif GetMissionV(AOYUN_LIGHT_MISSION_STATE) == AOYUN_LIGHT_STATE_READY then
		MS_ProcessReadyTimer();
	elseif GetMissionV(AOYUN_LIGHT_MISSION_STATE) == AOYUN_LIGHT_STATE_DIANDENG then
		MS_ProcessDiandengTimer();
	elseif GetMissionV(AOYUN_LIGHT_MISSION_STATE) == AOYUN_LIGHT_STATE_STARTED then
		MS_ProcessStartedTimer();
	elseif GetMissionV(AOYUN_LIGHT_MISSION_STATE) == AOYUN_LIGHT_STATE_ENDING then
		MS_ProcessEndingTimer();
	end;
end;