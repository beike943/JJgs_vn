Include("\\script\\missions\\tong_mission\\mission\\mission_head.lua");
function InitMission()
	MS_InitMission();
end;

function RunMission()
	MS_StartMission();
end;

function EndMission()
	MS_EndMission();
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	SetMomentum(0)
	MS_LeaveMission();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	MS_JoinMission(nCamp);
	PlayerIndex = RoleIndex;
end;