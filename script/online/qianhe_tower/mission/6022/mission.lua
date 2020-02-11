Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")

function InitMission()
	StartMissionTimer(QHT_MISSION_ID[2], QHT_TIMER_ID[2], 18)
end

function RunMission()
end

function JoinMission()
end

function EndMission()
	StopMissionTimer(QHT_MISSION_ID[2], QHT_TIMER_ID[2])
end

function OnLeave()
end