Include("\\script\\task\\global_task\\task_id.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\task\\global_task\\gtask_head.lua")
Include("\\script\\tmp_task_id_def.lua")

function OnDeath(id, f, x)
	SetNpcLifeTime(id, 0);
--	local npcIndex = GetTaskTemp(TMP_TASK_ID_RECORD_TEMP_VALUE);
--	if not npcIndex or npcIndex < 1 then
--		return 0;
--	end
--	if GetNpcName(npcIndex) == "ÔÀ²»Èº" then
--		SetNpcLifeTime(npcIndex, 0);
--	end
end