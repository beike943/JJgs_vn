-- ÑÇÀúÉ½´ó
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

function gf_team_operate_member_ex(nTeamID, funcOperate, bSkip, ...)
	bSkip	= bSkip or 0;

	local tMember	= GetTeamMemberInfo(nTeamID);
	if not tMember	then return 0 end

	local szName	= "";
	local nRetCode	= 0;
	local tPlayers	= {};
	for _, tInfo in tMember do
		nRetCode = funcOperate(tInfo, gf_UnPack(arg));
		if (not nRetCode or 1 ~= nRetCode) and 1 ~= bSkip then
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tInfo.PlayerIDX;
			szName = GetSafeName() or "";
			PlayerIndex = nOldPlayerIndex;
			tinsert(tPlayers, {tInfo.PlayerIDX, szName});
		end
	end
	
	return tPlayers;
end

-- GSÅÐ¶Ï
function gf_team_check_gs(nTeamID)
	local f_check_gs = function(tInfo)
		if not tInfo			then return 0 end
		if 0 >= tInfo.PlayerIDX then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_gs, 0, nil);
end

-- µØÍ¼ÅÐ¶Ï
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

-- µØÍ¼ÅÐ¶Ï
function gf_team_check_map_ex(nTeamID, nMapID)
	local f_check_map = function(tInfo)
		if not tInfo then return 0 end

		if %nMapID ~= tInfo.SubWorldID	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_map, 0, nil);
end

-- µÈ¼¶ÅÐ¶Ï
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

-- µÈ¼¶ÅÐ¶Ï
function gf_team_check_level_ex(nTeamID, nMinLv, nMaxLv)
	local f_check_level = function(tInfo)
		if not tInfo then return 0 end

		if %nMinLv > tInfo.Level	then return 0 end
		if %nMaxLv < tInfo.Level	then return 0 end

		return 1;
	end

	return gf_team_operate_member(nTeamID, f_check_level, 0, nil);
end

-- Á÷ÅÉÅÐ¶Ï
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

-- Á÷ÅÉÅÐ¶Ï
function gf_team_check_route_ex(nTeamID)
	local check_route = function(tInfo)
		if not tInfo then return 0 end

		local nCheck			= gf_CheckPlayerRoute(tInfo.Route);

		return nCheck;
	end

	return gf_team_operate_member(nTeamID, check_route, 0, nil);
end

-- PKÖµÅÐ¶Ï
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

-- °ï»á³ÉÔ±ÅÐ¶Ï
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

-- ÐÝÃßÅÐ¶Ï
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

-- ¶ÓÎéÏûÏ¢
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

-- »ñÈ¡Á÷ÅÉÊý
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

-- »ñÈ¡Á÷ÅÉÊý
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

function gf_Msg2Caption(nTeamID, szMsg)
	if not nTeamID or type(nTeamID) ~= "number" then return 0; end
	if not szMsg or type(szMsg) ~= "string" then return 0; end
	
	local nOldSubWorld = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	Msg2Player(szMsg);
	PlayerIndex = nOldSubWorld;
	return 1;
end

--¼ì²é¶ÓÎéÌõ¼þ
--·µ»Ø£º1£º·ûºÏ
--    £º0, "MemberNum", szName£º²»·ûºÏ
function gf_CheckTeamOptions(nTeamID, tOptions)
--	local tOptions = {
--		MemberNum,		--¶ÓÎé³ÉÔ±	{min, max}
--		MemberRouteNum,	--¶ÓÎéÁ÷ÅÉÊýÁ¿	{min, max}
--		MemberLevel,	--Íæ¼ÒµÈ¼¶	{min, max},
--		MemberHaveRoute,--³ÉÔ±ÊÇ·ñÒÑÈëÁ÷ÅÉ MemberHaveRoute = 1,
--		tTaskIdCond = {{TASKID_1, {min, max}},},
--		tItemsCond = {{{g, d, p}, {min, max}},},
--		PKValue,		--{min, max}
--	};
	if not nTeamID or type(nTeamID) ~= "number" then return 0; end
	
	local tRes = {};
	
	if tOptions.MemberNum then
		local nTeamSize = GetTeamSize();
		if (tOptions.MemberNum[1] and tOptions.MemberNum[1] > nTeamSize) or (tOptions.MemberNum[2] and nTeamSize > tOptions.MemberNum[2]) then
			tinsert(tRes, {"MemberNum", 0});
		end
	end
	if tOptions.MemberRouteNum then
		local nRouteNum = gf_team_get_route_count_ex(nTeamID);
		if (tOptions.MemberRouteNum[1] and tOptions.MemberRouteNum[1] > nRouteNum) or (tOptions.MemberRouteNum[2] and tOptions.MemberRouteNum[2] < nRouteNum) then
			tinsert(tRes, {"MemberRouteNum", 0});
		end
	end
	
	if tOptions.MemberLevel then
		local tPlayers = gf_team_operate_member_ex(nTeamID, function(tInfo)
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tInfo.PlayerIDX;
			local nLv = GetLevel();
			PlayerIndex = nOldPlayerIndex;
			
			if (%tOptions.MemberLevel[1] and nLv < %tOptions.MemberLevel[1]) or (%tOptions.MemberLevel[2] and nLv > %tOptions.MemberLevel[2]) then
				return 0;
			end
			return 1;
		end);
		if getn(tPlayers) > 0 then
			tinsert(tRes, {"MemberLevel", tPlayers});
		end
	end
	
	if tOptions.MemberHaveRoute then
		local tPlayers = gf_team_operate_member_ex(nTeamID, function(tInfo)
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tInfo.PlayerIDX;
			local nRoute = GetPlayerRoute();
			PlayerIndex = nOldPlayerIndex;
			if 0 == nRoute then
				return 0;
			end
			return 1;
		end);
		if getn(tPlayers) > 0 then
			tinsert(tRes, {"MemberHaveRoute", tPlayers});
		end
	end
	
	if tOptions.RoomWeight then
		local tPlayers = gf_team_operate_member_ex(nTeamID, function(tInfo)
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tInfo.PlayerIDX;
			if GetFreeItemRoom() < %tOptions.RoomWeight[1] or GetMaxItemWeight()-GetCurItemWeight() < %tOptions.RoomWeight[2] then
				PlayerIndex = nOldPlayerIndex;
				return 0;
			end
			PlayerIndex = nOldPlayerIndex;
			return 1;
		end);
		if getn(tPlayers) > 0 then
			tinsert(tRes, {"RoomWeight", tPlayers});
		end
	end
	
	if tOptions.PKValue then
		local tPlayers = gf_team_operate_member_ex(nTeamID, function(tInfo)
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tInfo.PlayerIDX;
			if (%tOptions.PKValue[1] and GetPKValue() < %tOptions.PKValue[1]) or (%tOptions.PKValue[2] and GetPKValue() > %tOptions.PKValue[2]) then
				PlayerIndex = nOldPlayerIndex;
				return 0;
			end
			PlayerIndex = nOldPlayerIndex;
			return 1;
		end);
		if getn(tPlayers) > 0 then
			tinsert(tRes, {"PKValue", tPlayers});
		end
	end
	
	--		tTaskIdCond = {{TASKID_1, {min, max}},},
	if tOptions.tTaskIdCond then
		local tPlayers = gf_team_operate_member_ex(nTeamID, 
		function(tInfo)
			local nOldPlayerIndex = PlayerIndex;
			PlayerIndex = tInfo.PlayerIDX;
			for _, tTask in %tOptions.tTaskIdCond do
				local nTaskid = tTask[1];
				local tRange  = tTask[2];
				if GetTask(nTaskid) < tRange[1] or GetTask(nTaskid) > tRange[2] then
					PlayerIndex = nOldPlayerIndex;
					return 0;
				end
			end
			PlayerIndex = nOldPlayerIndex;
			return 1;
		end);
			
		if getn(tPlayers) > 0 then
			tinsert(tRes, {"tTaskIdCond", tPlayers});
		end
	end
	
	return 1, tRes;
end

--¹Ø¿¨½øÈëÏÞÖÆ(¼ÇÂ¼´ÎÊýµÄtaskid£¬ ´ÎÊýÉÏÏÞ)
function gf_CheckEnterLimit(nTaskID, nTimes)
	local tConditions = {
		["tTaskIdCond"]	= {"Sè lÇn vµo ¶i ®· v­ît qu¸ giíi h¹n (Mçi ngµy " .. nTimes .. " lÇn)", 1},
	};
	
	local tOptions = {
		["tTaskIdCond"]		= {{nTaskID, {0, nTimes-1}},},
	};
		
	local nTeamID = GetTeamID();
	
	local _, tResInfo = gf_CheckTeamOptions(nTeamID, tOptions);
	if tResInfo and getn(tResInfo) > 0 then
		for i = 1, getn(tResInfo) do
			local tCondition = tConditions[tResInfo[i][1]];
			if tCondition then
				local szName = "";
				if tCondition[2] then
					local tPlayers = tResInfo[i][2];
					if getn(tPlayers) > 0 then szName = tPlayers[1][2]; end
					for k = 2, getn(tPlayers) do
						szName = szName .. ", " .. tPlayers[k][2];
					end
				end
				gf_team_message(nTeamID, szName .. tCondition[1], 2);
			end
		end
		return 0;
	end
	return 1;
end

