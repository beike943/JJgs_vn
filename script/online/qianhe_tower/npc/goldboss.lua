Include("\\script\\online\\qianhe_tower\\qht_head.lua")

--function OnDeath(id,f,x)
--	local nMapID,nX,nY = GetWorldPos();
--	SetMapTaskTemp(nMapID, QHT_MAPTEMPTASK_BOSS_MAX, GetMapTaskTemp(nMapID, QHT_MAPTEMPTASK_BOSS_MAX) - 1);
--	if f ~= 0 then return end --不是玩家击杀
--	SetNpcLifeTime(id, 0);
--	qht_award_five(id);
--end

--relay boss death
function OnDeath(id, f, x)
	if f ~= 0 then return end --不是玩家击杀
	local nMapID,nX,nY = GetWorldPos();
	SetMapTaskTemp(nMapID, QHT_MAPTEMPTASK_BOSS_MAX, GetMapTaskTemp(nMapID, QHT_MAPTEMPTASK_BOSS_MAX) - 1);
	if nMapID == QHT_MAP_TABLE[1] and GetNpcName(id) == QHT_RELAY_CREATE_GOLD_BOSS[1][2] then
		qht_award_six(id);
	end
	if nMapID == QHT_MAP_TABLE[2] and GetNpcName(id) == QHT_RELAY_CREATE_GOLD_BOSS[2][2] then
		qht_award_seven(id);
	end
	if nMapID == QHT_MAP_TABLE[3] and GetNpcName(id) == QHT_RELAY_CREATE_GOLD_BOSS[3][2] then
		qht_award_eight(id);
	end
	SetNpcLifeTime(id, 0);
	AddRuntimeStat(22, 14, 0, 1);
end