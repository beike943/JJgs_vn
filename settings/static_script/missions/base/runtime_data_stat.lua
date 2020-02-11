--公共统计函数

Include("\\script\\lib\\globalfunctions.lua")

function _stat_trans_player_count(nMainId, nSubId, nTransMin, nTransMax)
	local _nTrans = gf_GetPlayerRebornCount() or 0
	if _nTrans >= nTransMin and _nTrans <= nTransMax then
		AddRuntimeStat(nMainId, nSubId, 0, 1)
	end
end

function _stat_level_player_count(nMainId, nSubId, nLevelMin, nLevelMax)
	local _nLevel = GetLevel() or 0
	if _nLevel >= nLevelMin and _nLevel <= nLevelMax then
		AddRuntimeStat(nMainId, nSubId, 0, 1)
	end
end

function _op_on_team(_func, tPara)
	local nOldIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		_func(tPara)
	end
	PlayerIndex = nOldIndex;
end

function _op_on_mission_players(nMissionId,nCamp,_func, tPara)
	local nTotalPlayerNum = GetMSPlayerCount(nMissionId,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		local nOldIndex = PlayerIndex;
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(nMissionId,msidx,nCamp);
			if sidx > 0 then
				PlayerIndex = sidx;
				_func(tPara)
			end
		end
		PlayerIndex = nOldIndex;
	end;
end