Include("\\script\\online_activites\\201409\\huadeng.lua")

function InitMission()
	StartMissionTimer(HD_MISSION_ID[3], HD_TIMER_ID[3], 18);
end

function RunMission()
end

function JoinMission()
end

function EndMission()
	StopMissionTimer(HD_MISSION_ID[3], HD_TIMER_ID[3]);
end

function OnLeave()
end