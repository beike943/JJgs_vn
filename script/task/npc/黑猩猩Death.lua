Include("\\script\\task\\global_task\\task_id.lua")

function OnDeath(Index)
	SetMapTaskTemp(111,Map_Glb_Valve2,GetMapTaskTemp(111,Map_Glb_Valve2)-1);
	SetNpcLifeTime(Index,0);
end