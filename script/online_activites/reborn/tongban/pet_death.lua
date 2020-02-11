function OnDeath(npcIndex)
	local nPlayerIdx = GetUnitCurStates(npcIndex,6)
	local OldIdx = PlayerIndex
	PlayerIndex = nPlayerIdx
	if GetName() == GetNpcName(npcIndex) then
		Talk(1,"","ChÕt råi!")
	end
	SetNpcLifeTime(npcIndex,0)
	PlayerIndex = OldIdx	
end