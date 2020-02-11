
function CreateNpcCHZJ()
	local npcIndex = CreateNpc("chihuojiaojiaozhu","Xi Háa Gi¸o Chñ", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\chihuojiaozhu.lua");
	SetNpcLifeTime(npcIndex, 15 * 60);
end

function OnDeath(id)
	SetNpcLifeTime(id, 0);
end
