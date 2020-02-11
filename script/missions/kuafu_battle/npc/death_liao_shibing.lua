Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		local nCamp = KF_GetCamp();
		if nCamp == CampOne_ID then
			KF_AddScore(KF_SCORE_SHIBING, CampOne_ID);
			KF_AddActivity(KF_ACTIVITY_SHIBING, CampOne_ID)
		end
	end
	SetNpcLifeTime(id, 0);
end