Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddScore(KF_SCORE_XIAOYG);
		KF_AddActivity(KF_ACTIVITY_XIAOYG);
		gf_TeamOperate(KF_GiveMonsterBuff,3);
	end
end