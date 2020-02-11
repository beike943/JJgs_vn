function OnDeath(id)
	SetNpcLifeTime(id, 0);
	local npcIndex = CreateNpc("lihai", "Lª H¶i", 6073, 1590, 3220);
	SetNpcLifeTime(npcIndex, 10);
	Msg2Player("Lª H¶i:".."Hoµng Nhi........")
	Msg2Player("Lª H¶i:".."Hoµng Nhi........")
	NpcChat(ncpIndex, "Hoµng Nhi........")
end