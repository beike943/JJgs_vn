Include("\\script\\missions\\taiyi\\head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\misc\\missionaward_head.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\floyd.lua");
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\teamfunctions.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

thisFile = "\\script\\missions\\taiyi\\mission.lua";

--·¢ËÍÏûÏ¢¸ø¶Ó³¤
function Msg2Captain(Msg)
	if GetTeamSize() == 0 then
		return 0;
	end
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	Msg2Player(Msg);
	PlayerIndex = nOldPlayerIndex;
end

function TY_GetCaptainSafeName()
	if GetTeamSize() == 0 then
		return "";
	end
	local szRetName = "";
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	szRetName = GetSafeName();
	PlayerIndex = nOldPlayerIndex;
	return szRetName;
end

function TY_GetCaptainName()
	if GetTeamSize() == 0 then
		return "";
	end
	local szRetName = "";
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	szRetName = GetName();
	PlayerIndex = nOldPlayerIndex;
	return szRetName;
end

function TY_GetCaptainAccount()
	if GetTeamSize() == 0 then
		return "";
	end
	local szRetAccount = "";
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = GetTeamMember(0);
	szRetAccount = GetAccount();
	PlayerIndex = nOldPlayerIndex;
	return szRetAccount;
end

function TY_IsCaptain()
	if PlayerIndex == GetTeamMember(0) then
		return 1;
	end
	return nil;
end

--»ñÈ¡¶ÓÎéÖÐ²»Í¬Á÷ÅÉµÄÊýÁ¿
function TY_GetTeamPlayerRouteNum()
	local nSize = GetTeamSize();
	if nSize == 0 then
		return 0;
	end
	local tTemp = {};
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i - 1);
		tinsert(tTemp, GetPlayerRoute());
	end
	PlayerIndex = nOldPlayerIndex;
	local tExist = {};
	local nCount = 0;
	for i = 1, getn(tTemp) do
		if tExist[tTemp[i]] == 0 then
			nCount = nCount + 1;
			tExist[tTemp[i]] = 1;
		end
	end
	
	return nCount;
end

--¼ì²é¶ÓÎéÖÐµÄÍæ¼ÒÊÇ·ñÈ«²¿ÈëÁ÷ÅÉ
function TY_CheckAllPlayerRoute()
	local nSize = GetTeamSize();
	if nSize == 0 then
		return 0;
	end
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i - 1);
		if gf_CheckPlayerRoute() ~= 1 then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function TY_ConfirmClose()
	local szMsg = "<color=green>Méc QuÕ Anh<color>: X¸c nhËn rêi ¶i. ";
	suSay(szMsg, 2, "Rêi khái/TY_CloseMission", "Hñy bá/nothing");
end

function TY_CloseMission()
	SetMissionV(MV_MISSION_STATUS, 1);
	local nMapId = this.msPosition:getMapID();
	tExistNpcList[nMapId] = nil;
	SetTeamPKStatus(GetTeamID(), 0, 0);
	CloseMission(this.missionID);
end

--ÏÈÔÚ»º´æ±íÕÒÔÙÔÚµØÍ¼ÕÒ
function TY_FindNpc(szName)
	local nMapId = this.msPosition:getMapID();
	if tExistNpcList[nMapId] then
		for k, v in tExistNpcList[nMapId] do
			if v == szName and GetNpcName(k) == szName then
				return k;
			end
		end
	end
	
	local tNpcIdx = GetMapNpcIdx(nMapId);
	if not tNpcIdx then return 0; end
	for i = 1, getn(tNpcIdx) do
		if GetNpcName(tNpcIdx[i]) == szName then
			return tNpcIdx[i];
		end
	end
	return 0;
end

--nCreate = nil²»ÖØ¸´´´½¨Npc
function TY_CreateNpc(NpcInfo, tPos, bNotCreate)
	local nMapId = this.msPosition:getMapID();	--SubWorldIdx2ID(SubWorld);
	local nNpcIdx = nil;
	if bNotCreate then
		nNpcIdx = TY_FindNpc(NpcInfo[2]);
		if 0 ~= nNpcIdx then
			SetNpcPos(nNpcIdx, tPos[1], tPos[2]);
			SetNpcScript(nNpcIdx, NpcInfo[3]);
			SetCampToNpc(nNpcIdx, NpcInfo[4]);
			return nNpcIdx;
		end
	end
	
	nNpcIdx = CreateNpc(NpcInfo[1], NpcInfo[2], nMapId, tPos[1], tPos[2]);
	
	if NpcInfo[3] then
		SetNpcScript(nNpcIdx, NpcInfo[3]);
	end
	SetCampToNpc(nNpcIdx, NpcInfo[4]);
	if not tExistNpcList[nMapId] then tExistNpcList[nMapId] = {}; end
	tExistNpcList[nMapId][nNpcIdx] = NpcInfo[2];
	return nNpcIdx;
end

--¹ÖÎïÑ°ÕÒÖ¸¶¨×ø±ê·¶Î§ÄÚµÄËæ»úÍæ¼Ò¹¥»÷
function TY_FindRandomPlayer(tPos, nNum)
	if not tPos then return 0; end
	this.msCamp:reflash();
	local nOldPlayerIndex = PlayerIndex;
	local tPlayers = {};
	for k, v in this.msCamp.players do
		PlayerIndex = v;
		local _, x, y = GetWorldPos();
		if (abs(tPos[1] - x) <= 50 and abs(tPos[2] - y) <= 50) and 0 == IsPlayerDeath() then
			tinsert(tPlayers, v);
		end
	end
	PlayerIndex = nOldPlayerIndex;
	local nSize = getn(tPlayers);
	if nNum then
		nNum = min(nNum, nSize);
		local tList = floyd_m4n(nSize, nNum);
		tList.n = nil;
		local tTemp = {};
		
		for k, v in tList do
			tinsert(tTemp, tPlayers[k]);
		end
		return tTemp;
	end
	if 0 == nSize then return 0; end
	return tPlayers[random(1, nSize)];
end

function TY_FindRandomPlayerPos(tPos)
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = TY_FindRandomPlayer(tPos);
	if 0 == PlayerIndex then
		PlayerIndex = nOldPlayerIndex;
		return nil;
	end
	local nMapId, x, y = GetWorldPos();
	return nMapId, x, y;
end

function TY_SetPlayerPos(tPos)
	SetFightState(1);
	SetPos(tPos[1], tPos[2]);
end

function TY_SetNpcType2Talk(nNpcIdx)
	AddUnitStates(nNpcIdx, 7, 0);
	AddUnitStates(nNpcIdx, 8, -GetUnitCurStates(nNpcIdx, 8));	--ÊÓÒ°±ä0
	ChangeNpcToFight(nNpcIdx, 0, 6);
end

function TY_SetNpcType2Fight(nNpcIdx)
	AddUnitStates(nNpcIdx, 7, 3-GetUnitCurStates(nNpcIdx, 7));
	AddUnitStates(nNpcIdx, 8, 1000);
	ChangeNpcToFight(nNpcIdx, 3, 0);
end

function TY_ReviveAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp, function()
			if IsPlayerDeath() == 1 or GetLife() <= 1 then
				RevivePlayer(0);
			end
		end);
end

function TY_IsPlayerAllDead()
	local nOldPlayerIndex = PlayerIndex;
	local nSize = GetTeamSize();
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i);
		if not (1 == IsPlayerDeath() or GetLife() <= 1) then
			PlayerIndex = nOldPlayerIndex;
			return 0;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function TY_ClearDamagePoint()
	this.msCamp:turnPlayer(0, function()
		ResetToPlayerDamage();
		ResetToNpcDamage();
	end);
end

function TY_RecordDamagePoint()
	local tDamage = {}
	this.msCamp:turnPlayer(0, function()
		local nRoute = GetPlayerRoute();
		if tList[nRoute] then
			tinsert(%tDamage, {tostring(GetSafeName()), tonumber(GetToNpcDamage())})
			--local msg = format("[%s] [Êä³öÉËº¦:%d]", GetSafeName(), GetToNpcDamage());
			--%this:Msg2MSAll(msg);
		end
	end);
	sort(tDamage, function (t1, t2)
			return t1[2] > t2[2]
		end);
	this:Msg2MSAll("XÕp h¹ng s¸t th­¬ng:")
	local nRank = 1
	for k, v in tDamage do
		if type(v) == "table" then
			this:Msg2MSAll(format("-%d- [%s] [%d]", nRank, v[1], v[2]))
			nRank = nRank + 1
		end
	end
end

function TY_ClearPlayerSFX()
	this.msCamp:turnPlayer(nCamp, function() 
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 1, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 1, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), -1, 0, 1);
			SetCurrentNpcSFX(PIdx2NpcIdx(PlayerIndex), 0, 0, 1);
		end);
end

function TY_AddGodState()
	TY_ClearAllGodState();
	local tState = tGodStates.tState;
	local szMsg = "";
	for i = 1, getn(tState) do
		CastState(tState[i][2], tState[i][3], tGodStates.tInfo[2] * 60 * 18, 1, tState[i][1], 1);
		szMsg = szMsg .. tState[i][4] .. "\n";
	end
	
	SyncCustomState(1, tState[1][1], 1, tGodStates.tInfo[1]);
	RestoreAll();
	Talk(1, "", format("NhËn ®­îc hiÖu qu¶ <color=yellow>“%s”<color>:\n%s<color=green>Duy tr× %d phót.<color>", tGodStates.tInfo[1], szMsg, tGodStates.tInfo[2]));
end

function TY_ClearAllGodState()
	local tState = tGodStates.tState;
	for i = 1, getn(tState) do
		RemoveState(tState[i][1]);
	end
end

--Çå³ý±¾µØÉÏµÄËùÓÐÖ¸¶¨Ãû×Önpc
function TY_ClearNpc(name)
	local nMapId = this.msPosition:getMapID();
	local tNpcs = GetMapNpcIdx(nMapId);
	
	if type(name) == "table" then
		for k, v in tNpcs do
			for i = 1, getn(name) do
				if GetNpcName(v) == name[i] then
					SetNpcLifeTime(v, 0);
					SetNpcScript(v, "");
					if tExistNpcList[nMapId] and tExistNpcList[nMapId][v] then tExistNpcList[nMapId][v] = nil; end
					break;
				end
			end
		end
	elseif type(name) == "string" then
		for k, v in tNpcs do
			if GetNpcName(v) == name then
				SetNpcLifeTime(v, 0);
				SetNpcScript(v, "");
				if tExistNpcList[nMapId] and tExistNpcList[nMapId][v] then tExistNpcList[nMapId][v] = nil; end
			end
		end
	end
end

function TY_ClearColdDown(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp, function() ClearColdDown(); end);
end

function TY_RestoreAll(nCamp)
	nCamp = nCamp or 0;
	this.msCamp:turnPlayer(nCamp, function() ClearColdDown(); RestoreAll(); end);
end

function TY_GoToStage(tCurPhase, tTargetPhase, nPreLv)
	if tCurPhase.guage and tCurPhase.guage.id then
		this.msCamp:turnPlayer(0, StopTimeGuage, tCurPhase.guage.id);
	end
	TY_ClearMapNpc();
	remove_boxes()--É¾³ýËùÓÐ±¦Ïä
	TY_ReviveAll();
	TY_RestoreAll();
	TY_ClearAllGodState();
	TY_ClearPlayerSFX();
	SetMissionV(tTargetPhase.curPhaseLv, nPreLv);
	tCurPhase = tTargetPhase.phases[nPreLv];
	tCurPhase:onInit(tTargetPhase);
end

function TY_ClearMapNpc()
	local nMapId = this.msPosition:getMapID();
	ClearMapNpc(nMapId);
	tExistNpcList[nMapId] = {};
	
	local tNpcIdx = GetMapNpcIdx();
	if tNpcIdx and getn(tNpcIdx) >= 1 then
		WriteLog("[TY_ClearMapNpc] [Tiªu diÖt tÊt c¶ Npc trong b¶n ®å bÞ lçi!!!!!!!!!!!]");
	end
	
	if GetMSPlayerCount(tTY.missionID) == 0 then
		CloseMission(tTY.missionID);
	end
end

function TY_FindAllNpc(szName)
	local tNpcIdx = {};
	local nMapId = this.msPosition:getMapID();
	local tTmp = GetMapNpcIdx(nMapId);
	for i = 1, getn(tTmp) do
		if szName == GetNpcName(tTmp[i]) and IsNpcDeath(tTmp[i]) ~= 1 then
			tinsert(tNpcIdx, tTmp[i]);
		end
	end
	return tNpcIdx;
end

function TY_MakeRequireTable(nStageId)
	local tRequire = {};
	if nStageId <= LEVEL_RANGE then	--èóÌìÁÖ
		for i = 1, 8 do
			tinsert(tRequire, {TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1});
		end
	else --Ì«Ò»Ëþ
		for i = 1, 8 do
			tinsert(tRequire, {TYT_IB_ITEM[2],TYT_IB_ITEM[3],TYT_IB_ITEM[4], 1});
		end
	end
	return tRequire;
end

function TY_ClearTaskID()
	local nNowWeek = tf_GetWeekSequence();
	if nNowWeek > GetTask(TASKID_TAIYI_LATEST_WEEK) then	--Weekly
		SetTask(TASKID_TAIYI_LATEST_WEEK, nNowWeek);
		SetTask(TASKID_TAIYI_FOREST_JOIN_IN_TIME, 0);
		SetTask(TASKID_TAIYI_TOWER_JOIN_IN_TIME, 0);
		SetTask(tTaskID.JoinInTime[eMSName.FOREST], 0);
		SetTask(tTaskID.JoinInTime[eMSName.TOWER], 0);
	end
end

function TY_GetExpAward(nMSType, nDifType, nStageId)
	if not TYT_EXP_AWARD or not TYT_EXP_AWARD[nMSType] or 
	 not TYT_EXP_AWARD[nMSType][nDifType] or not TYT_EXP_AWARD[nMSType][nDifType][nStageId] then
		DebugOutput("TY_GetExpAward ERROR!")
		return 0;
	end
	local nRcount = min(gf_GetRouteCount(), 8);
	local nRAdd = TYT_EXP_ROUTE_COUNT_ADD[nRcount];
	--VNG_CFG_EXTRA_TYT_ADD_RATE¸±±¾¾­ÑéÏµÊý¼Ó³É\script\ks2vng\missions\mission_award_add_rate_cfg.lua
	local nExp = TYT_EXP_AWARD[nMSType][nDifType][nStageId] * (1 + nRAdd + GetVipCardParam() + VNG_CFG_EXTRA_TYT_ADD_RATE); 
	this.msCamp:turnPlayer(0, callout(gf_ModifyExp, nExp));
end

function TY_DorpBox(nMSType, nDifType, nStageId)
	local nMapId = GetWorldPos();
	local tPos = {
		[eMSName.FOREST] = {
			[1] = {1461, 2869},
			[2] = {1640, 2863},
			[3] = {1630, 3191},
		},
		[eMSName.TOWER] = {
			[1] = {1244, 3451},
			[2] = {1448, 3469},
			[3] = {1662, 3487},
		},
	}
	if not TYT_DROP_BOX_AWARD or not TYT_DROP_BOX_AWARD[nMSType] or 
	 not TYT_DROP_BOX_AWARD[nMSType][nDifType] or not TYT_DROP_BOX_AWARD[nMSType][nDifType][nStageId] then
		DebugOutput("TY_DorpBox ERROR!")
		return 0;
	end
	local tDorpBox = TYT_DROP_BOX_AWARD[nMSType][nDifType][nStageId];
	for i = 1, getn(tDorpBox) do
		if getn(tDorpBox[i]) == 4 then
			for j = 1, tDorpBox[i][3] do
				local nNpcIndex = CreateNpc(tDorpBox[i][1], tDorpBox[i][2], nMapId, tPos[nMSType][nStageId][1] +  random(-i, i) + random(-j, j), tPos[nMSType][nStageId][2] +  random(-i, i) + random(-j, j));
				SetNpcScript(nNpcIndex, tDorpBox[i][4]);
				--SetNpcLifeTime(nNpcIndex, 5*60);
			end
		else
			for j = 1,tDorpBox[i][2] do
				create_box(tDorpBox[i][1], nMapId, tPos[nMSType][nStageId][1], tPos[nMSType][nStageId][2])
			end
		end
	end
end

function TY_GiveAward(nMSType, nDifType, nStageId, tPos)
	--¸ø¾­Ñé¿©
	TY_GetExpAward(nMSType, nDifType, nStageId);
	--Ë¢Ïä×Ó¿©
	TY_DorpBox(nMSType, nDifType, nStageId);
end

function TY_AddAttackState()
	this.msCamp:turnPlayer(0, function()
		local nRoute = GetPlayerRoute();
		local nType = 1;
		if 1 ~= _JX2WZ then nType = 2; end
		if tRouteList[nRoute] and tRouteList[nRoute][2][nType] > 0 then
			RemoveState(10010);
			Msg2Player(format("TÊn c«ng +%d%%, duy tr× 5 phót", tRouteList[nRoute][2][nType]));
			CastState("state_attack_npc_add_spec", tRouteList[nRoute][2][nType], 5*60*18, 1, 10010);
		end
	end);
end

function TY_RollCardCallBack(id)
	local nMapId = GetWorldPos();
	if nMapId < 65537 then
		SendScript2Client('Open([[ma]])');	--¹Ø±Õ·­ÅÆ½çÃæ
		return 0;
	end
	
	if gf_Judge_Room_Weight(2, 20, "") ~= 1 then
		return 0;
	end
	
	local tStage = this.msPhases[1]:GetPhase();
	local nMSType = gf_GetTaskBit(TASKID_TAIYI_LAST_PASSED_STAGE, 5) + 1;	--FOREST or TOWER
	local nDifType = gf_GetTaskBit(TASKID_TAIYI_LAST_PASSED_STAGE, 4) + 1;	--NORMAL or HARD
	
	local szName = {
		[eMSName.FOREST] = "Ph¹n Thiªn L©m",
		[eMSName.TOWER] = "Th¸i NhÊt Th¸p",
	};
	
	local tAward, nRand = nil, nil;
	local g,d,p,n = 0,0,0,0;
	if id < 8 then
		if eDifType.HARD == nDifType then
			local nCurE, nMaxE = ModifyEnergy(0,1)
			if nCurE < 20 then
				Talk(1,"",format("Tinh lùc kh«ng ®ñ %d ®iÓm, kh«ng thÓ lËt thÎ nhËn th­ëng",20))
				return 0;
			end
		end
				
		gf_SetLogCaption(format("%s.LËt thÎFree", szName[nMSType]));
		
		tAward = TYT_PRICE[nMSType][1][nDifType];
	
		local nSum = 0
		for i = 1, getn(tAward) do
			nSum = nSum + tAward[i][3]
		end
		nRand = random(1, nSum);
		
		for i = 1, getn(tAward) do
			nRand = nRand - tAward[i][3];
			if nRand <= 0 then
				--¿Û³ý¾«Á¦
				if eDifType.HARD == nDifType then
					local nRet, nMax = ModifyEnergy(-20,1)
					if nRet == -1 then
						return 0;
					end
				end
				
				if type(tAward[i][2]) == "table"  then
					if type(tAward[i][2][1]) ~= "function" then 
						gf_AddItemEx2(tAward[i][2], tAward[i][1], szName[nMSType], "Kim R­¬ng", (tAward[i][5] or 0) * 24 * 3600, 1);
						g, d, p, n = tAward[i][2][1], tAward[i][2][2], tAward[i][2][3], tAward[i][2][4];
					else
						g, d, p, n = tAward[i][2][1](tAward[i][2][2], tAward[i][2][3]);
					end
				end
				
				if tAward[i][4] and tAward[i][4] == 1 then
					Msg2Global(format("Cung hû %s më phÇn th­ëng ¶i %s nhËn ®­îc [%s]#%d!", GetSafeName(), szName[nMSType], tAward[i][1], tAward[i][2][4]));
				end
				
				break;
			end
		end
		
		MA_Team_SyncItem(id, g, d, p, n, GetName());
		gf_SetLogCaption("");
		
		if eDifType.NORMAL == nDifType then
			if nMSType == eMSName.FOREST then
				AddRuntimeStat(18, 36, 0, 1);
			elseif nMSType == eMSName.TOWER then
				AddRuntimeStat(18, 38, 0, 1);
			end
		elseif eDifType.HARD == nDifType then
			if nMSType == eMSName.FOREST then
				AddRuntimeStat(18, 48, 0, 1);
			elseif nMSType == eMSName.TOWER then
				AddRuntimeStat(18, 50, 0, 1);
			end
		end
	else
		local tItem = MA_GetRequire(id);
		if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
			Talk(1, "", "Mang theo trªn ng­êi"..TYT_IB_ITEM[1].."Kh«ng ®ñ!");
			return 0;
		end
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tItem[1], tItem[2], tItem[3], tItem[4]})
		
		gf_SetLogCaption(format("%s.LËt thÎPay", szName[nMSType]));
				
		local TASKID_TAIYITA_CONSUME = tTaskID.ConsumeTaskID[nMSType];
		local nConsumeV = GetTask(TASKID_TAIYITA_CONSUME) + 2;
		SetTask(TASKID_TAIYITA_CONSUME, nConsumeV);
		
		if nConsumeV >= 300 then
			--SetTask(TASKID_TAIYITA_CONSUME, 0);
			--300±Øµô
		end
		
		tAward = TYT_PRICE[nMSType][2][nDifType];

		local nMin = 0;
		for i = 1, 2 do
			nMin = nMin + tAward[i][3];
		end
		if nConsumeV >= 30 then
			nMin = 1
		end
		local nSum = 0
		for i = 1, getn(tAward) do
			nSum = nSum + tAward[i][3]
		end
		--DebugOutput("nMin, nSum =", nMin, nSum)
		nRand = random(nMin, max(nMin, nSum));
		for i = 1, getn(tAward) do
			nRand = nRand - tAward[i][3];
			if nRand <= 0 then
				if type(tAward[i][2]) == "table"  then
					if type(tAward[i][2][1]) ~= "function" then 
						gf_AddItemEx2(tAward[i][2], tAward[i][1], szName[nMSType], "Kim R­¬ng", (tAward[i][5] or 0) * 24 * 3600, 1);
						g, d, p, n = tAward[i][2][1], tAward[i][2][2], tAward[i][2][3], tAward[i][2][4];
					else
						g, d, p, n = tAward[i][2][1](tAward[i][2][2], tAward[i][2][3]);
					end
				end
				
				if tAward[i][4] and tAward[i][4] == 1 then
					Msg2Global(format("Cung hû %s më phÇn th­ëng ¶i %s nhËn ®­îc [%s]#%d!", GetSafeName(), szName[nMSType], tAward[i][1], tAward[i][2][4]));
				end
				
				break;
			end
		end
		MA_Team_SyncItem(id, g, d, p, n, GetName());
		gf_SetLogCaption("");
		
		AddRuntimeStat(18, 5, GetMissionV(2)-1, (tItem[4] or 1));
		
		if eDifType.NORMAL == nDifType then
			if nMSType == eMSName.FOREST then
				AddRuntimeStat(18, 37, 0, 1);
			elseif nMSType == eMSName.TOWER then
				AddRuntimeStat(18, 39, 0, 1);
			end
		elseif eDifType.HARD == nDifType then
			if nMSType == eMSName.FOREST then
				AddRuntimeStat(18, 49, 0, 1);
			elseif nMSType == eMSName.TOWER then
				AddRuntimeStat(18, 51, 0, 1);
			end
		end
	end
	
	local itemName = GetItemName(g,d,p);
	if itemName == "Viªm Linh Ti" then
		AddRuntimeStat(18, 44, 0, 1);
	elseif itemName == "Da Ma Lang" then
		AddRuntimeStat(18, 45, 0, 1);
	elseif itemName == "Da §Þa Long" then
		AddRuntimeStat(18, 46, 0, 1);
	elseif itemName == "Th¸i NhÊt LÖnh" then
		AddRuntimeStat(18, 47, 0, 1);
	end
end

--´¦Àí¹ý¹Ø¸ø½±Àø£¬È¥³ý×´Ì¬
function TY_StagePassed(tStage, tPos)
	TY_ReviveAll(0);
	TY_ClearAllGodState();
	TY_ClearMapNpc();
	TY_ClearPlayerSFX();
	
	--Èç¹ûÊÇ·Ç¹ý¶É¹Ø£¬Ôò¸ø½±Àø
	if tMainLevelID[tStage.nStageId] then
		WriteLog(format("[Th¸i NhÊt Th¸p.%s] [V­ît qua ¶i %d] [§éi tr­ëng RoleName: %s Account: %s]", (GetMissionV(this.mv_02) == eDifType.NORMAL and "Th­êng") or "Anh Hïng", (tStage.nStageId-2-TOTAL_STAGE)/3, TY_GetCaptainName(), TY_GetCaptainAccount()));
		local nMSType = GetMissionV(this.mv_01);	--FOREST or TOWER
		local nDifType = GetMissionV(this.mv_02);	--NORMAL or HARD
				
		local strMsg = nil;
		if (TOTAL_STAGE + 3*3 + 2) == tStage.nStageId then
			strMsg = format("Chóc mõng %s thèng lÜnh giang hå tinh anh lo¹i bá Ph¹n Thiªn L©m %s, thµnh c«ng x«ng vµo Th¸i NhÊt Th¸p!", TY_GetCaptainSafeName(), (GetMissionV(this.mv_02) == eDifType.HARD and "(Anh Hïng)") or "(Th­êng)");
		elseif (TOTAL_STAGE + 6*3 + 2) == tStage.nStageId then
			strMsg = format("Chóc mõng %s thèng lÜnh giang hå tinh anh ®¸nh b¹i Gia LuËt Phi Hång %s, lÊy l¹i tro cèt cña D­¬ng NghiÖp!", TY_GetCaptainSafeName(), (GetMissionV(this.mv_02) == eDifType.HARD and "(Anh Hïng)") or "(Th­êng)");
		end
		
		local nHaveNewRoute = TY_CheckTeamHaveNewRoute();
		this.msCamp:turnPlayer(0, function()
			SetTask(TASKID_TAIYI_LAST_PASSED_STAGE, %tMainLevelID[%tStage.nStageId]);
			if %nDifType == eDifType.HARD then
				gf_SetTaskBit(TASKID_TAIYI_LAST_PASSED_STAGE, 4, 1);
			end
			if %nMSType == eMSName.TOWER then
				gf_SetTaskBit(TASKID_TAIYI_LAST_PASSED_STAGE, 5, 1);
			end
		end);
		
		if strMsg then Msg2Global(strMsg); end
		
		TY_RecordDamagePoint();
		
		local nStageId = tMainLevelID[tStage.nStageId];
		if nStageId > 3 then nStageId = nStageId - 3; end
		TY_GiveAward(nMSType, nDifType, nStageId, tPos);
		
		this.msCamp:turnPlayer(0, callout(vaf_get_prize_item_30709, 10, 1));
		if GetMissionV(this.mv_02) == eDifType.NORMAL then
			Observer:onTeamEvent(SYSEVENT_TAIYI_NOR_STAGE_FINISH, tMainLevelID[tStage.nStageId])
		else
			Observer:onTeamEvent(SYSEVENT_TAIYI_HARD_STAGE_FINISH, tMainLevelID[tStage.nStageId])
		end
	end
end

--ÆÕÍ¨Ä£Ê½ÏÂ²¹³änpc
function TY_SupplyNpc(nStageId)
	if GetMissionV(this.mv_02) ~= eDifType.NORMAL then
		return 0;
	end
	local tPlayers = this.msCamp:reflash();
	if 0 == getn(tPlayers) then return 0; end
	local nOldPlayerIndex = PlayerIndex;
	PlayerIndex = tPlayers[1];
	local nSize = GetTeamSize();
	PlayerIndex = nOldPlayerIndex;
	local nNum = 8 - nSize;
	if nNum <= 0 then return 0; end
	local nMapId = this.msPosition:getMapID();
	local bHaveFo = nil;
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i);
		if 8 == GetPlayerRoute() then
			bHaveFo = 1;
			break;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	local nNpcIdx = nil;
	local nLevelID = tMainLevelID[nStageId];
	if not bHaveFo then
		nNpcIdx = CreateNpc("Nga My PhËt Gia Thñ Täa", "Nga My PhËt Gia Thñ Täa", nMapId, tFriendNpcPos[nLevelID][nNum][1], tFriendNpcPos[nLevelID][nNum][2]);
		SetCampToNpc(nNpcIdx, CampPlayer);
		CastState2Npc(nNpcIdx, "state_dispear", 100, 15*60*18);
		nNum = nNum - 1;
	end
	
	local tList = nil;
	if _JX2WZ == 1 then
		tList = floyd_m4n(15, nNum);
	else
		tList = floyd_m4n(10, nNum);
	end
	tList.n = nil;
	for k, v in tList do
		nNpcIdx = CreateNpc(tFriendNpcList[k][1], tFriendNpcList[k][2], nMapId, tFriendNpcPos[nLevelID][nNum][1], tFriendNpcPos[nLevelID][nNum][2]);
		SetCampToNpc(nNpcIdx, CampPlayer);
		CastState2Npc(nNpcIdx, "state_dispear", 100, 15*60*18);
		nNum = nNum - 1;
	end
	
	return 1;
end

function TY_CheckAndCostJingLi(szNpcName, nMSType, nDifType, bOnlyCheck)
	local nCostNum = TYT_JOIN_COST_JINGLI[nMSType][nDifType];
	if not nCostNum then
		return 0;
	end
	local bIsFailed = 0;
	local msg = szNpcName..format("Tinh lùc cña c¸c thµnh viªn sau ®©y kh«ng ®ñ <color=green>%d<color> ®iÓm:\n<color=red>", nCostNum);
	local nOldPlayerIndex = PlayerIndex
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if ModifyEnergy(0, 1) < nCostNum then
			msg = msg..GetName().."\n"
			bIsFailed = 1;
		end
	end
	PlayerIndex = nOldPlayerIndex;
	if bIsFailed == 1 then
		Talk(1,"",msg);
		return 0;
	end
	if bOnlyCheck and bOnlyCheck == 1 then
		return 1;
	end
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		ModifyEnergy(-nCostNum, 1);
	end
	PlayerIndex = nOldPlayerIndex;
	return 1;
end

function TY_CheckAndCostItem(szNpcName, nMSType, nDifType, bOnlyCheck)
	local tCostItem = TYT_JOIN_COST_ITEM[nMSType][nDifType];
	if not tCostItem or getn(tCostItem) ~= 2 then
		return 0;
	end
	if GetName() ~= GetCaptainName() then
		Talk(1,"",szNpcName.."H·y b¶o ®éi tr­ëng qua ®©y.");
		return 0;
	end
	if GetItemCount(tCostItem[1][1], tCostItem[1][2], tCostItem[1][3]) < tCostItem[1][4] then
		Talk(1,"",szNpcName..format("§¹o cô %s trong tói kh«ng ®ñ %d c¸i", tCostItem[2], tCostItem[1][4]));
		return 0;
	end
	if bOnlyCheck and bOnlyCheck == 1 then
		return 1;
	end
	if DelItem(tCostItem[1][1], tCostItem[1][2], tCostItem[1][3], tCostItem[1][4]) ~= 1 then
		return 0;
	end
	local tDifName = {
		[eDifType.NORMAL] = "Th­êng",
		[eDifType.HARD] = "Anh hïng",
	}
	local tMSName = {
		[eMSName.FOREST] = "Ph¹n Thiªn L©m",
		[eMSName.TOWER] = "Th¸i NhÊt Th¸p",
	};
	Msg2Player(format("Tiªu hao %d c¸i %s ®Ó vµo %s%s", tCostItem[1][4], tCostItem[2], tDifName[nDifType], tMSName[nMSType]));
	AddRuntimeStat(18, 5, nDifType-1, (tCostItem[1][4] or 1));
	Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tCostItem[1][1], tCostItem[1][2], tCostItem[1][3], tCostItem[1][4]})
	return 1;
end


function TY_EnterCondCheck(szNpcName, nMSType, nDifType)
	local tMSName = {
		[eMSName.FOREST] = "Ph¹n Thiªn L©m",
		[eMSName.TOWER] = "Th¸i NhÊt Th¸p",
	};
	
	local nTeamID = GetTeamID();
	if 0 == nTeamID then Talk(1, "", szNpcName..format("%s cÇn tæ ®éi ®Ó vµo.", tMSName[nMSType]));  return 0; end
	if PlayerIndex ~= GetTeamMember(0) then
		if GetTeamSize() ~= 0 then
			Talk(1, "", szNpcName.."H·y b¶o ®éi tr­ëng qua ®©y.");
			return 0;
		end
	end
	
	if 1 ~= gf_team_check_gs(nTeamID) then
		Talk(1, "", szNpcName.."H·y triÖu tËp h¶o h÷u cïng v­ît ¶i ®i!");
		return 0;
	end
	
	local tConditions = {
		["MemberNum"] 		= {"Thµnh viªn nhãm kh«ng tháa ®iÒu kiÖn."},
		["MemberRouteNum"] 	= {"L­u ph¸i nhãm kh«ng tháa ®iÒu kiÖn."},
		["MemberLevel"] 	= {"CÊp kh«ng tháa ®iÒu kiÖn.", 1},
		["MemberHaveRoute"] = {"Kh«ng cã l­u ph¸i.", 1},
		["RoomWeight"] 		= {"Tói kh«ng ®ñ 1 «.", 1},
		["PKValue"]			= {"TrÞ PK lµ 10, téi ¸c tµy trêi, kh«ng ®­îc vµo.", 1},
	};
	local _, tResInfo = gf_CheckTeamOptions(nTeamID, tOptions[nMSType][nDifType]);
	if tResInfo and getn(tResInfo) > 0 then
		if eDifType.NORMAL == nDifType then
			Talk(1, "", format(szNpcName.."%s cÇn tæ ®éi ®i vµo. Thµnh viªn tæ ®éi ph¶i <color=yellow> ®¼ng cÊp >= cÊp 90, sè tæ ®éi >=1 vµ ®· gia nhËp l­u ph¸i <color> míi vµo ®­îc", tMSName[nMSType]));
		else
			Talk(1, "", format(szNpcName.."%s cÇn tæ ®éi ®i vµo. Thµnh viªn tæ ®éi ph¶i <color=yellow> ®¼ng cÊp >= cÊp 90, sè l­u ph¸i >=4 vµ ®· gia nhËp l­u ph¸i <color> míi vµo ®­îc", tMSName[nMSType]));
		end
		
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
				gf_Msg2Caption(nTeamID, szName .. tCondition[1]);
			end
		end
		return 0;
	end

	local nTaskID = 0;
	local nLimitTimes = 99999;
	if nMSType == eMSName.FOREST and nDifType == eDifType.NORMAL then
		nTaskID = TASKID_FTL_NORMAL_ENTER_LIMIT;
		nLimitTimes = TYT_JOIN_TIMES_FOREST_NOMARL
	elseif nMSType == eMSName.FOREST and nDifType == eDifType.HARD then
		nTaskID = TASKID_FTL_HERO_ENTER_LIMIT;
		nLimitTimes = TYT_JOIN_TIMES_FOREST_HARD
	elseif nMSType == eMSName.TOWER and nDifType == eDifType.NORMAL then
		nTaskID = TASKID_TY_NORMAL_ENTER_LIMIT;
		nLimitTimes = TYT_JOIN_TIMES_TOWER_NOMARL
	elseif nMSType == eMSName.TOWER and nDifType == eDifType.HARD then
		nTaskID = TASKID_TY_HERO_ENTER_LIMIT;
		nLimitTimes = TYT_JOIN_TIMES_TOWER_HARD
	else
		return 0
	end
	
	return gf_CheckEnterLimit(nTaskID, nLimitTimes)
	
end

function TMZ_GetDynamicMapCount()
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	local nCount = 0;
	local nMapID = 0;
	for i = 1,getn(tbMapID) do
		if tbMapID[i] == MAP_ID then
			tremove(tbMapID,i);
		end
	end
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if mf_GetMissionV(MISSION_ID,MV_TMZ_LOAD,nMapID) == 1 then
			nCount = nCount + 1;
		end;
	end;
	return nCount;
end;


--¼ì²é×î´ó¿ª³¡ÊýÁ¿
function TY_CheckMapCountLimit(szNpcName, nTargetMSType, nTargetMSDif)
	local tMapId = gf_GetDataTable(GetSameMaps(tTY.realMapID));
	for i = 1, getn(tMapId) do
		if tTY.realMapID == tMapId[i] then
			tremove(tMapId, i);
		end
	end
	
	local tRecord = {
		[eDifType.NORMAL] = {
			[eMSName.FOREST] = 0,
			[eMSName.TOWER] = 0,
		},
		[eDifType.HARD] = {
			[eMSName.FOREST] = 0,
			[eMSName.TOWER] = 0,
		},
	};
	
	for i = 1, getn(tMapId) do
		nMapId = tMapId[i];
		local nMSType = mf_GetMissionV(tTY.missionID, tTY.mv_01, nMapId);
		local nDifType = mf_GetMissionV(tTY.missionID, tTY.mv_02, nMapId);
		
		if not nMSType or not nDifType or not (nMSType == eMSName.FOREST or nMSType == eMSName.TOWER) or not (nDifType == eDifType.NORMAL or nDifType == eDifType.HARD) then
			WriteLog(format("[Th¸i NhÊt Th¸p] [ERROR] [nMSType=%s, nDifType=%s]", tostring(nMSType), tostring(nDifType)));
		end
		
		tRecord[nDifType][nMSType] = tRecord[nDifType][nMSType] + 1;
	end
	
	if tRecord[nTargetMSDif][nTargetMSType] >= tGlbValue[nTargetMSType][nTargetMSDif][2] then
		Talk(1, "", format("%s%s ®ang rÊt chËt chéi vµ ®«ng ng­êi, xin h·y quay l¹i sau!", szNpcName, tGlbValue[nTargetMSType][nTargetMSDif][3]));
		return 0;
	end
	return 1;
end

function TY_CheckTeamHaveNewRoute()
	local nSize = GetTeamSize();
	if nSize == 0 then
		return nil;
	end
	local nRes = nil;
	local nOldPlayerIndex = PlayerIndex;
	for i = 1, nSize do
		PlayerIndex = GetTeamMember(i - 1);
		local nRoute = GetPlayerRoute();
		if 1 == _JX2WZ then
			if 31 == nRoute or 32 == nRoute then
				nRes = 1;
				break;
			end
		else
			if 31 == nRoute or 32 == nRoute or 26 == nRoute then
				nRes = 1;
				break;
			end
		end
	end
	PlayerIndex = nOldPlayerIndex;
	return nRes;
end

function nothing()
	
end

function TY_DailyClear()
	DebugOutput("TY_DailyClear()")
	SetTask(TASKID_TY_NORMAL_ENTER_LIMIT, 0)
	SetTask(TASKID_TY_HERO_ENTER_LIMIT, 0)
	SetTask(TASKID_FTL_NORMAL_ENTER_LIMIT, 0)
	SetTask(TASKID_FTL_HERO_ENTER_LIMIT, 0)
end
