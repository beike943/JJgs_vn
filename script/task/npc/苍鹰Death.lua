Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
function OnDeath(nNpcIndex)
	if GetMapTaskTemp(512,Map_Glb_Valve11) > 0 then 
		SetMapTaskTemp(512,Map_Glb_Valve11,GetMapTaskTemp(512,Map_Glb_Valve11)-1);
		SetNpcLifeTime(nNpcIndex,0);
	end
	if tGtTask:check_cur_task(79) ~= 1 then
		return 0;
	end
	--DelItem(2,0,30046,GetItemCount(2,0,30046));
	if GetItemCount(2,0,30048) >= 1 then
		return 0;
	end
	if AddItem(2,0,30048,1) ~= 1 then
		print("ERROR:Task78");
	end
end