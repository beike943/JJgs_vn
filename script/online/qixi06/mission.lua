Include("\\script\\online\\qixi06\\mission_head.lua");

function InitMission()
	--AddGlobalNews("ChiÕn tr­êng Nh¹n m«n quan-Tµi nguyªn chiÕn ®· më, mau ®Õn T­ M· TÊn Nguyªn b¸o danh!")
	AddNewResource()
	mf_SetMissionV(MISSION_ID,MV_STATE,MS_STATE_BEGIN,MAP_ID);
	RunMission(MISSION_ID);
end;

function RunMission()
	mf_SetMissionV(MISSION_ID,MV_STATE,MS_STATE_FIGHT,MAP_ID);	
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

function EndMission()

end;