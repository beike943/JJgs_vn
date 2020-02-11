Include("\\script\\online\\viet_event\\pet_instance\\head.lua")

function OnDeath(npcIndex)
	SetNpcLifeTime(npcIndex, 0)
	SetNpcScript(npcIndex, "")
	DelGroupUnit(GROUP_MOB, npcIndex)
end