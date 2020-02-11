function OnDeath(id, f, x)
	local nMapID, nX, nY = GetNpcWorldPos(id)
	for i = 1, 3 do
		local npcIndex = CreateNpc("xiaozuoqi", "Thó C­ìi Nhá", nMapID, nX + random(-4, 4), nY + random(-4, 4));
		if npcIndex > 0 then
			SetNpcScript(npcIndex, "\\script\\online_activites\\201409\\box.lua");
			SetNpcLifeTime(npcIndex, 5 * 60);
		end
	end
	SetNpcLifeTime(id, 0);
	SetCurrentNpcSFX(PIdx2NpcIdx(), 936, 1, 0, 3 * 18);
end