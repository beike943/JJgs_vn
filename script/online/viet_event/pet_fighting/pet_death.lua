Include("\\script\\online\\viet_event\\vng_task_control.lua")

function OnDeath(npcIndex)
	local nPlayerIdx = GetUnitCurStates(npcIndex,6)
	local OldIdx = PlayerIndex	
	SetNpcLifeTime(npcIndex,10)	
	PlayerIndex = nPlayerIdx
	if GetName() == GetNpcName(npcIndex) then
		SetNpcScript(npcIndex,"")
		SetNpcLifeTime(npcIndex,0)	
		--Msg2Player(GetName().." "..GetTime().." 0")
		local nPetIndex = GetTaskTemp(TSK_TMP_PET_INDEX)
		local nEnemyIndex = GetTaskTemp(TSK_TMP_ENEMY_INDEX)
		local nEnemyPetIndex = GetTaskTemp(TSK_TMP_PET_ENEMY_INDEX)
		local nFlag = floor(GetTask(TASK_PET_FIGHT)/10)	
		--Msg2Player(nPetIndex.." "..nEnemyIndex.." "..nEnemyPetIndex.." "..nFlag)
		
		if GetTrigger(2516) ~= 0 then
			RemoveTrigger(GetTrigger(2516))
		end		
		SetTaskTemp(TSK_TMP_PET_INDEX,0)
		--SetTaskTemp(TSK_TMP_ENEMY_INDEX,0)
		--SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,0)
		if nFlag ~= 0 then
			AddUnitStates(nFlag,6, - GetUnitCurStates(nFlag,6))
		end
		--Msg2Player(GetName(nEnemyIndex).." "..GetTime().." 1")
		
		if GetName(nEnemyIndex) == GetNpcName(nEnemyPetIndex) then
			local nCheck = 1
			PlayerIndex = nEnemyIndex
			--Msg2Player(GetName(nEnemyIndex).." "..GetTime().." 21")
			if GetTaskTemp(TSK_TMP_PET_INDEX) == 0 then
				--Msg2Player(GetName().." "..GetTime().." 2")
				nCheck = 0
			end
			PlayerIndex = nPlayerIdx
			if nCheck ~= 0 then
				--Msg2Player(GetName(nEnemyIndex).." "..GetTime().." 3")
				SetTask(TASK_PET_FIGHT,0)
				Say("So tµi B¹n §ång Hµnh thÊt b¹i, xin ®õng n¶n lßng!",0)
				--Msg2Player("So tµi B¹n §ång Hµnh thÊt b¹i, xin ®õng n¶n lßng.")	
								
				PlayerIndex = nEnemyIndex
				if GetTrigger(2516) ~= 0 then
					RemoveTrigger(GetTrigger(2516))
				end
				--Msg2Player(GetName(nEnemyIndex).." "..GetTime().." 4")
				SetTaskTemp(TSK_TMP_PET_INDEX,0)
				--SetTaskTemp(TSK_TMP_ENEMY_INDEX,0)
				--SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,0)
				SetTask(TASK_PET_FIGHT,1)
				if GetTask(TRANSLIFE_MISSION_ID) == 21 and GetTask(TRANSLIFE_TASK_34) < 4 then
					SetTask(TRANSLIFE_TASK_34, GetTask(TRANSLIFE_TASK_34) +1)
					if GetTask(TRANSLIFE_TASK_34) == 4 then
						TaskTip("Hoµn thµnh yªu cÇu cña §¶o Chñ §µo Hoa §¶o. Mau ®i th«ng b¸o!")
					end
				end
				Say("Chóc mõng b¹n so tµi B¹n §ång Hµnh chiÕn th¾ng! Mau ®i nhËn th­ëng!",0)
				--Msg2Player("Chóc mõng b¹n so tµi B¹n §ång Hµnh chiÕn th¾ng! Mau ®i nhËn th­ëng.")
				PlayerIndex = nPlayerIdx
				--Msg2Player(GetName().." "..GetTime(nEnemyIndex).." 5")				
				SetNpcLifeTime(nEnemyPetIndex,5)
			else	
				--Msg2Player(GetName().." "..GetTime(nEnemyIndex).." 6")
				SetTask(TASK_PET_FIGHT,2)
				Say("So tµi B¹n §ång Hµnh lÇn nµy 2 bªn hßa nhau!",0)
				--Msg2Player("So tµi B¹n §ång Hµnh lÇn nµy 2 bªn hßa nhau.")	
				PlayerIndex = nEnemyIndex
				SetTask(TASK_PET_FIGHT,2)
				Say("So tµi B¹n §ång Hµnh lÇn nµy 2 bªn hßa nhau!",0)
				--Msg2Player("So tµi B¹n §ång Hµnh lÇn nµy 2 bªn hßa nhau.")	
				PlayerIndex = nPlayerIdx				
			end			
		end		
	end	
	PlayerIndex = OldIdx	
end