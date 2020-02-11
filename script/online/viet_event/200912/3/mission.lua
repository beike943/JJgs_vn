--=============================================
--create by baiyun 2009.11.25
--describe:越南版12月份圣诞节活动冰冷巫师mission函数
--=============================================
Include("\\script\\online\\viet_event\\200912\\3\\mission_head.lua");
Include("\\script\\online\\viet_event\\200912\\3\\mission_functions.lua");
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
	MS_LeaveMission();
	PlayerIndex = RoleIndex;
end;

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	MS_JoinMission(nCamp);
	PlayerIndex = RoleIndex;
end;
