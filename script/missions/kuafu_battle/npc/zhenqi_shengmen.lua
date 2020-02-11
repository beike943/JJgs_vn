Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	KF_CreateZhenqi(3, id, f, x);
	SetNpcLifeTime(id, 0);
end