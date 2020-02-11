Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")

function main()
	if tGtTask:check_cur_task(105) == 0 or GetTask(Task_id_016) == 1 then
		Talk(1,"","C¬ quan rÊt nguy hiÓm kh«ng nªn ®Õn gÇn!");
		return 0;
	end
	if GetItemCount(2,0, 30058) > 0 then
			SetTask(Task_id_016, 1);
			SetCurrentNpcSFX(GetTargetNpc(), 971, 2, 0, 5);
	else
		Talk(1,"","Kh«ng cã ch×a khãa kh«ng thÓ khëi ®éng c¬ quan")	
	end
end