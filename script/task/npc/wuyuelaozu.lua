function Call_wuyuelaozu()
	local npcIndex = CreateNpc("Ng« ViÖt L·o Tæ","Ng« ViÖt L·o Tæ", GetWorldPos());
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\wuyuelaozu.lua");
	SetNpcLifeTime(npcIndex, 15 * 60);
end


function OnDeath(id)
	SetNpcLifeTime(id, 0);
end