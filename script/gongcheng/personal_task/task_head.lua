
function init_fight()
	CreateTrigger(0, 1242, 266)
	CreateTrigger(2, 1812, 228)
	SetFightState(1)
	SetPKFlag(0,0)
	OpenFriendliness(0)					-- 不提升好感
	ForbidChangePK(1)
	SetLogoutRV(1)
	SetDeathPunish(0)
end

function uninit_fight()
	SetFightState(0)
	RemoveTrigger(GetTrigger(266))
	OpenFriendliness(1)					-- 提升好感
	ForbidChangePK(0)
	SetDeathPunish(1)
end

function init_pk()
	SetFightState(1)
	ForbidChangePK(0)
end

function init_farm()
	SetFightState(1)
	SetPKFlag(0,0)
	ForbidChangePK(1)
end