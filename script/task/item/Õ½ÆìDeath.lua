Include("\\script\\task\\global_task\\task_id.lua")
function OnDeath(npcIndex)
	local nMapId,nX,nY = GetNpcWorldPos(GetTask(Task_id_011));
	SetNpcLifeTime(npcIndex,0);
	--’Ω∆Ï ˝¡øºı1
	SetMapTaskTemp(nMapId,Map_Glb_Valve,(GetMapTaskTemp(nMapId,Map_Glb_Valve) or 0) - 1);
	--∑¿ ÿ ß∞‹
	SetTask(Task_id_010,(10 * 60) / 30 + 1);
end