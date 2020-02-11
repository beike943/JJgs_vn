Include("\\script\\missions\\kuafu_battle\\kf_head.lua")

function OnDeath(id, f, x)
	if f == 0 then
		KF_AddActivity(KF_ACTIVITY_XIANFENG);
		KF_AddScore(KF_SCORE_XIANFENG);
	end
	SetMissionV(MV_BATTLE_XIANFENG_TAG_LIAO, 2);
	SetMissionV(MV_BATTLE_XIANFENG_DEATHTIME_LIAO, GetTime());
	SetNpcLifeTime(id, 0);
	Msg2MSAll(KF_MISSION_ID, format("%s ®ét kÝch thÊt b¹i, lui vÒ ®¹i doanh %s.", "Liªu Tiªn Phong", "Qu©n Liªu"));
end