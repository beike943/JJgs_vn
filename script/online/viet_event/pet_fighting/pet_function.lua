
function MS_JoinMission(nCamp)
	CleanInteractive();		
	if NewWorld(101,1564,3149) == 1 then
		MS_SetPlayerState(nCamp);
		AddMSPlayer(MISSION_ID,nCamp);		
		return 1;
	else
		return 0;
	end;
end

function MS_LeaveMission()
	MS_RestorePlayerState()	
	if GetTrigger(2516) ~= 0 then
		local nPetIndex = GetTaskTemp(TSK_TMP_PET_INDEX)
		local nEnemyIndex = GetTaskTemp(TSK_TMP_ENEMY_INDEX)
		local nEnemyPetIndex = GetTaskTemp(TSK_TMP_PET_ENEMY_INDEX)
		local nFlag = floor(GetTask(TASK_PET_FIGHT)/10)		
		local OldIndex = PlayerIndex
		
		RemoveTrigger(GetTrigger(2516))
		
		SetTaskTemp(TSK_TMP_PET_INDEX,0)
		SetTaskTemp(TSK_TMP_ENEMY_INDEX,0)
		SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,0)
		
		AddUnitStates(nFlag,6, - GetUnitCurStates(nFlag,6))
		
		if GetName(nEnemyIndex) == GetNpcName(nEnemyPetIndex) then			
			SetNpcLifeTime(nEnemyPetIndex,3)
			SetTask(TASK_PET_FIGHT,0)			
			
			PlayerIndex = nEnemyIndex			
			if GetTrigger(2516) ~= 0 then
				RemoveTrigger(GetTrigger(2516))
			end		
			SetTaskTemp(TSK_TMP_PET_INDEX,0)
			SetTaskTemp(TSK_TMP_ENEMY_INDEX,0)
			SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,0)
			SetTask(TASK_PET_FIGHT,1)
			Say("Chóc mõng b¹n so tµi B¹n §ång Hµnh chiÕn th¾ng! Mau ®i nhËn th­ëng!",0)
			Msg2Player("Chóc mõng b¹n so tµi B¹n §ång Hµnh chiÕn th¾ng! Mau ®i nhËn th­ëng.")
			PlayerIndex = OldIndex			
		end	
		SetNpcLifeTime(nPetIndex,0)	
	end
	NewWorld(200,1501,2978)
end;

function MS_SetPlayerState(nCamp)	
	LeaveTeam();	
	ForbitTrade(1);	
	InteractiveEnable(0);	
	StallEnable(0);	
	UseScrollEnable(0);	
	UseSkillEnable(0)
	SetPKFlag(1,nCamp);
	ForbidRead(1);
	ForbidChangePK(1);	
	SetFightState(0);
	KillFollower();		
	SetLogoutRV(1);
	SetTempRevPos(200,1501 * 32, 2978 * 32);
end;

function MS_RestorePlayerState()
	LeaveTeam();			
	ForbitTrade(0);
	InteractiveEnable(1);	
	StallEnable(1);	
	UseScrollEnable(1);
	UseSkillEnable(1)	
	ForbidRead(0);	
	ForbidChangePK(0);	
	SetPKFlag(0,0);
	SetFightState(0);	
	KillFollower();		
	SetLogoutRV(0);
	SetTempRevPos(0,0,0);
end