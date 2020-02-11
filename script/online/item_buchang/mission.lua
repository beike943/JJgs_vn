Include("\\script\\online\\item_buchang\\ibc_head.lua")

function InitMission()
	StartMissionTimer(IBC_MISSION_ID, IBC_TIMER_ID, 18);
end

function RunMission()
end

function JoinMission()
end

function EndMission()
	StopMissionTimer(IBC_MISSION_ID, IBC_TIMER_ID);
end

function OnLeave()
end