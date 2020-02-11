Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnDeath(npcIndex)
	if GetMapTaskTemp(512,Map_Glb_Valve10) > 0 then 
		SetMapTaskTemp(512,Map_Glb_Valve10,GetMapTaskTemp(512,Map_Glb_Valve10)-1);
		SetNpcLifeTime(npcIndex,0);
	end
	if tGtTask:check_cur_task(78) ~= 1 then
		DelItem(2,0,30044,GetItemCount(2,0,30044));
		DelItem(2,0,30043,GetItemCount(2,0,30043));
		return 0;
	end
	if GetItemCount(2,0,30045) >= 1 then
		return 0;
	end
	if AddItem(2,0,30045,1) ~= 1 then
		print("ERROR:Task78");
	end
end