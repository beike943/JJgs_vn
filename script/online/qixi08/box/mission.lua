--Mission C« §¶o pet fighting 
-- Created by TuanNA5
-- VNG patch

Include("\\script\\online\\qixi08\\box\\mission_head.lua")

function InitMission()	
	mf_SetMissionV(MISSION_ID,MV_STATE,MS_STATE_BEGIN,MAP_ID);
	RunMission(MISSION_ID);
end

function RunMission()
	mf_SetMissionV(MISSION_ID,MV_STATE,MS_STATE_FIGHT,MAP_ID);	
end;

function EndMission()
end

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	MS_LeaveMission();
	PlayerIndex = RoleIndex;
end

function JoinMission(RoleIndex,nCamp)
	PlayerIndex = RoleIndex;
	MS_JoinMission(nCamp);
	PlayerIndex = RoleIndex;
end
