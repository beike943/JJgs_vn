Include ("\\script\\online_activites\\reborn\\task\\boss\\boss_head.lua")

function OnDeath(nNpcIndex)
	SetNpcLifeTime(nNpcIndex, 0)
	SetNpcScript(nNpcIndex, "")
        VET_201003_GIVE_BOSS_AWARD()
end
