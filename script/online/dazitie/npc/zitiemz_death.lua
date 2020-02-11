Include("\\script\\online\\dazitie\\dzt_head.lua")

function OnDeath(id, f, x)
	if f ~= 0 then return end
	SetNpcLifeTime(id, 0);
	if dzt_check_condition() == 1 then
		dzt_get_award_1();
	end
	dzt_rc_boss();
end