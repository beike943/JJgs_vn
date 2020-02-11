Include("\\script\\online_activites\\2010_12\\activity_06\\head.lua");

function InitMission()
	--WriteLog("InitMission::called");
	FG_Init();
end;

function RunMission()
	--WriteLog("RunMission::called");
end;

function EndMission()
	--WriteLog("EndMission::called");
	--FG_End();
end;

function OnLeave(playerIndex)
	--WriteLog("OnLeave::called");	
	PlayerIndex = playerIndex;
	FG_Leave();
	PlayerIndex = playerIndex;	
end;

function JoinMission(playerIndex, Camp)
	--WriteLog("JoinMission::called");	
	PlayerIndex = playerIndex;
	FG_Join();
	PlayerIndex = playerIndex;	
end;
