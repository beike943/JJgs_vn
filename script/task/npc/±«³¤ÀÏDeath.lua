function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex,0);
	local nNpcIdx = CreateNpc("Bao trng l穙","Bao trng l穙",215,1748,3066);
	SetNpcScript(nNpcIdx,"\\script\\中原一区\\黑风洞\\npc\\鲍长老.lua");
end