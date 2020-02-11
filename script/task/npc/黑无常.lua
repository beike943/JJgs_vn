Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnDeath()
	if GetTask(Task_id_008) == 0 and tGtTask:check_cur_task(70) == 1 then
		SetTask(Task_id_008,1);
	end
end