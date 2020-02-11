Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddActivity(KF_ACTIVITY_JIANGJUN);
		KF_AddScore(GetMissionV(KF_SCORE_JIANGJUN));
	else
		KF_AddScore(GetMissionV(KF_SCORE_JIANGJUN), CampOne_ID, f);
	end
	SetNpcLifeTime(id, 0);
	Msg2MSAll(KF_MISSION_ID, format("%s bÞ ®¸nh b¹i, lui vÒ ®¹i doanh %s.", "Liªu T­íng Qu©n", "Qu©n Liªu"));
end