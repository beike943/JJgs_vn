--Include("\\script\\tmp_task_id_def.lua")

function main()
	--if GetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX) == GetTargetNpc() then
		SetNpcLifeTime(GetTargetNpc(),0);
		AddItem(2,1,30398,1);
		--SetTaskTemp(TMP_TASK_ID_OLY_YMH_TEMP_INDEX,0);
	--end	
end