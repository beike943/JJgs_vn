TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- µ±Ç°Ñ¡ÔñµÄÊ¦ÃÅÈÎÎñµÄÄÑ¶ÈµÈ¼¶

function killmonster()
	local task_id = 11
	local task_info = GetInfo(task_id, 4)					-- ÈÎÎñNPCÄ£°åID
			 	 
   	if (GetIfDoingTask(task_id, task_info) == 1) then
		FillTaskValue(task_id)
		TaskTip("NhiÖm vô th­¬ng héi: Truy s¸t "..task_info.." ®· hoµn thµnh")
	end
end

function killmonster1()
	local task_id = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local task_info = GetInfo(task_id, 4)					-- ÈÎÎñNPCÄ£°åID
			 	 
   	if (GetIfDoingTask(task_id, task_info) == 1) then
		FillTaskValue(task_id)
		TaskTip("NhiÖm vô s­ m«n tuÇn hoµn: Truy s¸t "..task_info.." ®· hoµn thµnh")
	end
end