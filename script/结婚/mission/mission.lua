Include("\\script\\½á»é\\marriage_head.lua");
function InitMission()
	MR_InitMarryField();
end;

function RunMission()
	MR_StartMarry();
end;

function EndMission()
	MR_EndMarry();
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	MR_LeaveMarryField();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	MR_JoinMarryField(nCamp);
	PlayerIndex = RoleIndex;
end;