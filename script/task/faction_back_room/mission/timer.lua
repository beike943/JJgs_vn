Include("\\script\\task\\faction_back_room\\mission\\mission_head.lua");
function OnTimer()
	if GetMSPlayerCount(MISSION_ID,0) <= 0 then	--如果没人了就把场地给关了
		BR_CloseStage();
		return 0;
	end;
	local nState = GetMissionV(MV_MISSION_STATE);
	if nState == MS_STATE_IDEL then
	
	elseif nState == MS_STATE_READY then
		MS_ProcessReadyTimer();
	elseif nState == MS_STATE_STARTED then
		MS_ProcessStartedTimer();
	elseif nState == MS_STATE_SHORT_PAUSE then
		MS_ProcessShortPauseTimer();
	elseif nState == MS_STATE_END_WAITING then
		MS_ProcessEndingTimer();
	end;
end;