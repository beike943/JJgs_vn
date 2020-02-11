Include("\\script\\online\\qianhe_tower\\qht_head.lua")

function OnDeath(id,f,x)
	local nMapID,nX,nY = GetWorldPos();
	SetMapTaskTemp(nMapID, QHT_MAPTEMPTASK_BOSS_MAX, GetMapTaskTemp(nMapID, QHT_MAPTEMPTASK_BOSS_MAX) - 1);
	if f ~= 0 then return end --²»ÊÇÍæ¼Ò»÷É±
	SetNpcLifeTime(id, 0);
	qht_award_four(id);
	AddRuntimeStat(22, 12, 0, 1);
end