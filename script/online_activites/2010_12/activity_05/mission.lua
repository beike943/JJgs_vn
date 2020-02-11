Include("\\script\\online_activites\\2010_12\\activity_05\\head.lua");

function InitMission()
	SB_Init();
end;

function RunMission()
end;

function EndMission()
	SB_End();
end;

function OnLeave(playerIndex)			
	--WriteLog("OnLeave::called");
	PlayerIndex = playerIndex;
	SB_Leave();
	PlayerIndex = playerIndex;	
end;

function JoinMission(playerIndex, Camp)
	PlayerIndex = playerIndex;
	SB_Join();
	PlayerIndex = playerIndex;	
end;