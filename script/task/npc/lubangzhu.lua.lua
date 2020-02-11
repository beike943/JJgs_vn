Include("\\script\\tmp_task_id_def.lua")

function OnDeath(id, f, x)
	if GetItemCount(2, 0, 30056) < 1 then
		AddItem(2, 0, 30056, 1);
	end
	SetNpcLifeTime(id, 0);
end