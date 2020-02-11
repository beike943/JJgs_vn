Include("\\script\\gongcheng\\mission\\mission_head.lua");
function OnTimer()
	if GetMissionV(MV_MISSION_STATE) == MS_STATE_IDEL then
	
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_READY then
		MS_ProcessReadyTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_GONGMEN then
		MS_ProcessGongMenTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_GONGCHENG then
		MS_ProcessGongChengTimer();
	elseif GetMissionV(MV_MISSION_STATE) == MS_STATE_ENDING then
		MS_ProcessEndingTimer();
	end;
end;