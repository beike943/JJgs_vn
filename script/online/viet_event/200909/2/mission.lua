--=============================================
--create by baiyun 2009.8.31
--describe:越南版9月份中秋活动走军灯笼mission函数
--=============================================
Include("\\script\\online\\viet_event\\200909\\2\\mission_head.lua");
Include("\\script\\online\\viet_event\\200909\\2\\mission_functions.lua");
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