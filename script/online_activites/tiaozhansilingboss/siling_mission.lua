Include("\\script\\online_activites\\tiaozhansilingboss\\mission_head.lua");

function InitMission()
    --print("enter InitMission--------------------------------")
    MS_InitMission();
end;

function RunMission()
    --print("enter RunMission--------------------------------")
    MS_StartMission();
end;

function EndMission()
    --print("enter EndMission--------------------------------")
    MS_EndMission();
end;

function OnLeave(RoleIndex)
end;

function JoinMission(RoleIndex,nCamp)
end;
