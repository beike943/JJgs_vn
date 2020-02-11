Include("\\settings\\static_script\\online\\qianhe_tower\\qht_define.lua")

function InitMission()
	StartMissionTimer(QHT_MISSION_ID[1], QHT_TIMER_ID[1], 18)
end

function RunMission()
end

function JoinMission()
end

function EndMission()
	StopMissionTimer(QHT_MISSION_ID[1], QHT_TIMER_ID[1])
end

function OnLeave()
end