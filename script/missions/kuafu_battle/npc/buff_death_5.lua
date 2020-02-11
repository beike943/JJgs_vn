Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddScore(KF_SCORE_DAYG);
		KF_AddActivity(KF_ACTIVITY_DAYG);
		KF_OperateAllPlayer(KF_GiveMonsterBuff, 5, KF_GetCamp());
		--¸øÄãÒ»°ÑNBÎäÆ÷
		KF_GetNBWeapon();
	end
end