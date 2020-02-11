--Task150
function kill_yaohu()
	local npcIndex;
	npcIndex = CreateNpc("zhandouzhoubuhuo", "Chu BÊt HoÆc", 6073, 1598, 3212);
	SetNpcLifeTime(npcIndex, 6*60)
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\zbh_che_death.lua");
	SetCampToNpc(npcIndex,"camp_enemy");
	npcIndex = CreateNpc("zhandouchaihuanger", "Sµi Hoµng Nhi", 6073, 1601, 3210);
	SetNpcLifeTime(npcIndex, 6*60)
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\zbh_che_death.lua");
	SetCampToNpc(npcIndex,"camp_enemy");
	npcIndex = CreateNpc("zhandouyaohu", "Yªu Hå", 6073, 1600, 3208);
	SetNpcLifeTime(npcIndex, 10*60)
	SetNpcDeathScript(npcIndex, "\\script\\task\\npc\\yaohu_death.lua");
	SetCampToNpc(npcIndex, "camp_evil");
end    

dostring("kill_yaohu()") 