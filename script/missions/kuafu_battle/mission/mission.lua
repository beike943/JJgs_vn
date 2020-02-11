Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function InitMission()
	KF_InItBattle();
	KF_CreateNpc();
	KF_CreateChannel();
end

function RunMission()
	KF_RunBattle();
end

function EndMission()
	KF_EndBattle();
end

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	KF_LeaveBattle();
	PlayerIndex = RoleIndex;
end

function JoinMission(RoleIndex, nCamp)
	PlayerIndex = RoleIndex;
	KF_JoinBattle(nCamp);
	PlayerIndex = RoleIndex;
end