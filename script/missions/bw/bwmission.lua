Include("\\script\\missions\\bw\\bwhead.lua")

function InitMission()
	for i = 1, 40 do 
		SetMissionV(i,0);--允许报名了
	end;
	
	for i = 1, 10 do 
		SetMissionS(i, "")
	end;
	SetMissionV(MS_STATE, 1);
	SetMissionV(BW_KEY, random(10000000)+1);
	StartMissionTimer(MISSIONID, TIME_NO1, TIMER_1);
	StartMissionTimer(MISSIONID, TIME_NO2, TIMER_2);
end;

function RunMission()

	OldPlayer = PlayerIndex;

	idx = 0
	idx , pidx = GetNextPlayer(MISSIONID, idx, 1);
	if (pidx > 0) then
	   	PlayerIndex = pidx;
	   	SetFightState(1);
	end


	idx = 0
	idx , pidx = GetNextPlayer(MISSIONID, idx, 2);
	if (pidx > 0) then
	   	PlayerIndex = pidx;
	   	SetFightState(1);
	end

	PlayerIndex = OldPlayer;
 	SetMissionV(MS_STATE, 2);
end;

function EndMission()
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		local index = GetMissionV(MS_PLAYER1ID + i -1);
		if (index > 0) then
		    PlayerIndex = index;
            SetTaskTemp(JOINROOMINDEX,0);
        end
	end;
	PlayerIndex = OldPlayer;

	for i = 1, 40 do 
		SetMissionV(i , 0);
	end;
	
	for i  = 1, 10 do 
		SetMissionS(i, "")
	end;
	
	GameOver();
	StopMissionTimer(MISSIONID, TIME_NO1);
	StopMissionTimer(MISSIONID, TIME_NO2);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	
	if (GetName() == GetMissionS(1)) then
		SetMissionV(MS_PLAYER1ID, 0);
	end;
	if (GetName() == GetMissionS(2)) then
		SetMissionV(MS_PLAYER2ID, 0);
	end;

	str2 = GetName().."Tho竧 kh醝 chi課 trng";

    --Msg2MSAll(MISSIONID, str2);
    
	RestorePKCamp();
	
    NewWorld(GetLeavePos());
    
end;