Include("\\script\\online\\qianhe_tower\\qht_head.lua")

if qht_activity_isopen() == 1 then
	qht_gs_daily_clean();
end