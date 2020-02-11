function OnDeath(id, f, x)
	local nMapID, nX, nY = GetNpcWorldPos(id)
	for i = 1, 4 do
		local npcIndex = CreateNpc("zuoqifenshen", "Ph©n th©n thó C­ng Cña Chó Cuéi", nMapID, nX + random(-4, 4), nY + random(-4, 4));
		if npcIndex > 0 then
			SetNpcDeathScript(npcIndex, "\\script\\online_activites\\201409\\wugang_death2.lua");
			SetNpcLifeTime(npcIndex, 5 * 60);
		end
	end
	SetNpcLifeTime(id, 0);
end