Include("\\script\\online\\olympic\\oly_head.lua")

function OnDeath(npcIndex,f,x)
		if f ~= 0 then
			return 0;
		end
		if GetTeamSize() ~= 0 then
			local OldPlayerIndex = PlayerIndex;
			for i= 1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i); 
--				print("GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX)",GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX));
--				print("npcIndex",npcIndex); 
				if GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX) == tonumber(npcIndex) then
--					print("oly_GiveAward1();")
					SetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX,0)
					oly_GiveAward1();
					--+1
					gf_SetTaskByte(VET_OLY_TASK3,2,gf_GetTaskByte(VET_OLY_TASK3,2) + 1,TASK_ACCESS_CODE_OLYMPIC);
					--PlayerIndex = OldPlayerIndex;
					--break;
				end
			end
			PlayerIndex = OldPlayerIndex;
		else
--				print("GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX)",GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX));
--				print("npcIndex",npcIndex); 
			if GetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX) == tonumber(npcIndex) then
--				print("oly_GiveAward1();")
				SetTaskTemp(TMP_TASK_ID_OLY_MHGL_TEMP_INDEX,0)
				oly_GiveAward1();
				--+1
				gf_SetTaskByte(VET_OLY_TASK3,2,gf_GetTaskByte(VET_OLY_TASK3,2) + 1,TASK_ACCESS_CODE_OLYMPIC);
			end
		end
		
		SetNpcLifeTime(npcIndex,0);
end