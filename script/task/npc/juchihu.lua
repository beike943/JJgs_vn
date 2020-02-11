function OnDeath(id, f, x)
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("juchihu", "Cù XÝ Hæ", 6024, 1603, 2982);
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\juchihu.lua");
end