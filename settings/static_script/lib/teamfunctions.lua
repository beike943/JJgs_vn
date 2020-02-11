-- 亚历山大
--
function gf_team_operate_member(nTeamID, funcOperate, bSkip, ...)
	bSkip	= bSkip or 0;

	local tMember	= GetTeamMemberInfo(nTeamID);
	if not tMember	then return 0 end

	local szName	= "";
	local nRetCode	= 0;
	for _, tInfo in tMember do
		nRetCode = funcOperate(tInfo, gf_UnPack(arg));
		if (not nRetCode or 1 ~= nRetCode) and 1 ~= bSkip then
			szName	= (tInfo and tInfo.Name) or "";
			return 0, szName;
		end
	end

	return 1;
end

-- GS判断
function gf_team_check_gs(nTeamID)
	local f_check_gs = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_gs, 0, nil);
end

-- 地图判断
function gf_team_check_map(nTeamID, nMapID)
	local f_check_map = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nPlayerMapID		= GetWorldPos();
		PlayerIndex				= OldPlayerIndex;

		if %nMapID ~= nPlayerMapID		then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_map, 0, nil);
end

-- 地图判断
function gf_team_check_map_ex(nTeamID, nMapID)
	local f_check_map = function(tInfo)
		if not tInfo then return 0 end

		if %nMapID ~= tInfo.SubWorldID	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_map, 0, nil);
end

-- 等级判断
function gf_team_check_level(nTeamID, nMinLv, nMaxLv)
	local f_check_level = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nPlayerLevel		= GetLevel();
		PlayerIndex				= OldPlayerIndex;

		if %nMinLv > nPlayerLevel	then return 0 end
		if %nMaxLv < nPlayerLevel	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_level, 0, nil);
end

-- 等级判断
function gf_team_check_level_ex(nTeamID, nMinLv, nMaxLv)
	local f_check_level = function(tInfo)
		if not tInfo then return 0 end

		if %nMinLv > tInfo.Level	then return 0 end
		if %nMaxLv < tInfo.Level	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_level, 0, nil);
end

-- 流派判断
function gf_team_check_route(nTeamID)
	local f_check_route = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nCheck			= gf_CheckPlayerRoute();
		PlayerIndex				= OldPlayerIndex;

		return nCheck;
	end

	return gf_team_operate_member(nTeamID, f_check_route, 0, nil);
end

-- 流派判断
function gf_team_check_route_ex(nTeamID)
	local check_route = function(tInfo)
		if not tInfo then return 0 end

		local nCheck			= gf_CheckPlayerRoute(tInfo.Route);

		return nCheck;
	end

	return gf_team_operate_member(nTeamID, check_route, 0, nil);
end

-- PK值判断
function gf_team_check_pk_value(nTeamID, nMinPK, nMaxPK)
	local f_check_pk_value = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nPlayerPKValue	= GetPKValue();
		PlayerIndex				= OldPlayerIndex;

		if %nMinPK > nPlayerPKValue	then return 0 end
		if %nMaxPK < nPlayerPKValue	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_pk_value, 0, nil);
end

-- 帮会成员判断
function gf_team_check_tong(nTeamID, nMinPK, nMaxPK)
	local szTongName = GetTongName();
	local f_check_tong = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nPlayerTongName	= GetTongName();
		PlayerIndex				= OldPlayerIndex;

		if %szTongName ~= nPlayerTongName	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_tong, 0, nil);
end

-- 休眠判断
function gf_team_check_sleep(nTeamID)
	local f_check_sleep = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nRetCode			= IsSleeping();
		PlayerIndex				= OldPlayerIndex;

		if 1 == nRetCode	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_sleep, 0, nil);
end

-- 队伍消息
function gf_team_message(nTeamID, szMsg, nType)
	szMsg	= tostring(szMsg);
	nType	= nType or 0;

	local f_message = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;

		if 1 == %nType then
			Say(%szMsg, 0);
		elseif 2 == %nType then
			Talk(1, "", %szMsg);
		else
			Msg2Player(%szMsg);
		end

		PlayerIndex				= OldPlayerIndex;

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_message, 1, nil);
end

-- 获取流派数
function gf_team_get_route_count(nTeamID)
	local tRoute = {};

	local f_get_route_count = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		local OldPlayerIndex	= PlayerIndex;
		PlayerIndex				= tInfo.PlayerIDX;
		local nRoute			= GetPlayerRoute();
		PlayerIndex				= OldPlayerIndex;

		%tRoute[nRoute]			= 1;

		return 1;
	end

	gf_team_operate_member(nTeamID, f_get_route_count, 1, nil);

	return gf_get_table_count(tRoute);
end

-- 获取流派数
function gf_team_get_route_count_ex(nTeamID)
	local tRoute = {};

	local f_get_route_count = function(tInfo)
		if not tInfo			then return 0 end

		%tRoute[tInfo.Route]	= 1;

		return 1;
	end

	gf_team_operate_member(nTeamID, f_get_route_count, 1, nil);

	return gf_get_table_count(tRoute);
end

