--Õâ¸öÎÄ¼ş¶¨ÒåÒ»Ğ©·½±ãMission²Ù×÷µÄº¯Êı
--º¯ÊıÃû¸ñÊ½£ºmf_MissionFunction(nArg...)
--ËùÓĞº¯ÊıµÄ×îºóÒ»¸öÊäÈë²ÎÊıÎªnMapID£¬Õâ¸ö²ÎÊıÖ÷ÒªÊÇÓÃÀ´Ö§³ÖMissionµØÍ¼Íâ²Ù×÷MissionµÄ
--===========================================================================================
--Çå³ıËùÓĞMission±äÁ¿
function mf_ClearMissionData(nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	for i=1,10 do
		SetMissionS(i,"");
	end;
	for i=1,100 do
		SetMissionV(i,0);
	end;
	SubWorld = nOldSubWorld;
end;
--¶ÔMissionÖĞÄ³Ò»ÕóÓªÍæ¼Ò½øĞĞÍ³Ò»²Ù×÷
--Ê¹ÓÃ·½·¨£ºÏÈ¶¨ÒåÒ»¸öÖ´ĞĞº¯Êı£¬Õâ¸öº¯ÊıµÄÊäÈë²ÎÊıÎªÒ»table¡£
--È»ºó°ÑÕâ¸öº¯Êı×÷ÎªµÚ¶ş¸öÊäÈë²ÎÊı¸ømf_OperateAllPlayerº¯Êı¡£
--Í¨¹ı´«tableµÄ·½Ê½¿ÉÒÔ´«¶à¸ö²ÎÊı¸øÖ´ĞĞº¯Êı¡£
function mf_OperateAllPlayer(nMissionID,func,tArg,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local OldPlayerIndex = PlayerIndex;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);	
	local nPlayerCount = getn(IDTab);
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				func(tArg);
			else
				WriteLog("[Toµn bé hµm sè b¸o lçi]: mf_OperateAllPlayer hµm sè, trong IDTab h­íng dÉn ng­êi ch¬i nhá h¬n hoÆc b»ng 0");
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--µÃµ½MissionÀïÃæµÄÈËÊı,²ÎÊıÒ»ÎªMissionID,²ÎÊı¶şÎªMissionÕóÓª£¬²ÎÊıÈıÎªMissionÏà¹ØµØÍ¼ID£¬
function mf_GetPlayerCount(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nPlayerCount = 0;
	nPlayerCount = GetMSPlayerCount(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
	return nPlayerCount;
end;
--µÃµ½Ä³MissionÄ³ÕóÓªµÄËùÓĞÍæ¼ÒµÄË÷Òı£¬´æÓÚÒ»¸öÊı×é×÷º¯ÊıµÄ·µ»ØÖµ
function mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local tIndex = {};
	local nTotalPlayerNum = GetMSPlayerCount(nMissionID,nCamp);
	local msidx,sidx = 0,0;
	if nTotalPlayerNum ~= 0 then
		for i=1,nTotalPlayerNum do
			msidx,sidx = GetNextPlayer(nMissionID,msidx,nCamp);
			if sidx > 0 then
				tIndex[i] = sidx;
			end
		end
	end;
	if nTotalPlayerNum ~= getn(tIndex) then
		WriteLog("[Toµn bé hµm sè b¸o lçi]: trong hµm sè ms_GetMSPlayerIndex nhËn ®­îc sè ng­êi cña phe nµo ®ã so víi getn(tIndex) kh«ng ®ång nhÊt. Sè ng­êi:"..nTotalPlayerNum..", getn(tIndex) chªnh lÖch lµ:"..getn(tIndex));
	end;
	SubWorld = nOldSubWorld;
	return tIndex;
end;
--¸Ä±äÄ³ÕóÓªÀïÃæËùÓĞÍæ¼ÒµÄÄ³Ò»¸öÁÙÊ±±äÁ¿µÄÖµ
function mf_SetCampTempValue(nMissionID,nCamp,nTaskID,nValue,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				SetTaskTemp(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--¸Ä±äÄ³ÕóÓªÀïÃæËùÓĞÍæ¼ÒµÄÄ³Ò»¸öÈÎÎñ±äÁ¿µÄÖµ
function mf_SetCampTaskValue(nMissionID,nCamp,nTaskID,nValue,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local nPlayerCount = getn(IDTab);
	local nOldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = IDTab[i];
			if PlayerIndex > 0 then
				SetTask(nTaskID,nValue);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--Õë¶ÔÄ³¸öÈÎÎñ±äÁ¿µÄÖµÀ´½øĞĞÅÅĞò¡£µÚÒ»¸ö²ÎÊıÊÇÕ½³¡µÄÈÎÎñ±äÁ¿ID£¬µÚ¶ş¸ö²ÎÊıÎª1±íÊ¾ÉıĞò£¬0±íÊ¾½µĞò
--µÚÈı¸ö²ÎÊıÖ¸¶¨ÕóÓª£¬Ä¬ÈÏÖµÎª0¡£·µ»ØÖµÎªÒ»¸ö±£´æÅÅÍêĞòºóµÄÍæ¼ÒË÷Òıtable
--µÚËÄ¸ö²ÎÊıÊÇµØÍ¼ID
function mf_SortMSPlayerByTaskValue(nMissionID,nTaskID,bAscend,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local fCompare = function(nPIndex1,nPIndex2)
		local nValue1,nValue2 = 0,0;
		PlayerIndex = nPIndex1;
		nValue1 = GetTask(%nTaskID);
		PlayerIndex = nPIndex2;
		nValue2 = GetTask(%nTaskID);
		if %bAscend == 1 then	--ÉıĞòÅÅÁĞ
			nValue1 = -nValue1;
			nValue2 = -nValue2;
		end;
		if nValue1 > nValue2 then
			return 1;
		else
			return nil;
		end;
	end;
	sort(tIDTab,fCompare);
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
	return tIDTab;
end;
--Õë¶ÔÄ³¸öº¯ÊıÀ´ÅÅĞò£¬ÉıĞò»ò½µĞòÓÉ×Ô¶¨ÒåµÄº¯ÊıÀ´¾ö¶¨
function mf_SortMSPlayerByFunction(nMissionID,func,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nOldPlayerIndex = PlayerIndex;
	local tIDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	sort(tIDTab,func);
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
	return tIDTab;
end;
--»ñµÃMissionÀïÃæËùÓĞ·ûºÏÄ³Ò»Ìõ¼şµÄÍæ¼ÒµÄÄ³Ò»ÏîĞÅÏ¢£¬ÒÔtableµÄĞÎÊ½·µ»Ø
--Ìõ¼şÓÉFuncº¯Êı¶¨ÖÆ
--·µ»ØµÄtableµÄÔªËØ½á¹¹ÓÉFunc·µ»ØµÄ½á¹û¾ö¶¨¡£
function mf_GetMSPlayerInfo(nMissionID,Func,tArg,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local IDTab = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local tInfo = {};
	local nOldPlayerIndex = PlayerIndex;
	local nCounter = 1;
	local nRetInfo;
	for i=1,getn(IDTab) do
		PlayerIndex = IDTab[i];
		nRetInfo = Func(tArg);
		if nRetInfo ~= nil then
			tInfo[nCounter] = nRetInfo;
			nCounter = nCounter + 1;
		end;
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
	return tInfo;
end;
--»ñµÃMissionÀïÃæÄ³¸öÕûĞÎ±äÁ¿Öµ£¬ÕâÀï´«nMission±äÁ¿ÓĞµã¶àÓàÁË£¬ËãÁË£¬±£³ÖÒ»ÖÂĞÔ
function mf_GetMissionV(nMissionID,nValueID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local nValue = GetMissionV(nValueID);
	SubWorld = nOldSubWorld;
	return nValue;
end;
--ÉèÖÃMissionµÄÄ³¸öÕûĞÎ±äÁ¿Öµ
function mf_SetMissionV(nMissionID,nValueID,nValue,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	SetMissionV(nValueID,nValue);
	SubWorld = nOldSubWorld;
end;
--»ñµÃMissionÀïÃæÄ³¸ö×Ö·û´®±äÁ¿Öµ
function mf_GetMissionS(nMissionID,nStringID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then	
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local sString = GetMissionS(nStringID);
	SubWorld = nOldSubWorld;
	return sString;
end;
--ÉèÖÃMissionµÄÄ³¸ö×Ö·û´®±äÁ¿Öµ
function mf_SetMissionS(nMissionID,nStringID,sString,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	SetMissionS(nStringID,sString);
	SubWorld = nOldSubWorld;
end;
--¿ªÆôÒ»¸öMission
function mf_OpenMission(nMissionID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	OpenMission(nMissionID)
	SubWorld = nOldSubWorld;
	return 1;
end;
--¹Ø±ÕÒ»¸öMission
function mf_CloseMission(nMissionID,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	CloseMission(nMissionID)
	SubWorld = nOldSubWorld;
end;
--¼ÓÈëÒ»¸öMission
function mf_JoinMission(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	JoinMission(nMissionID,nCamp)
	SubWorld = nOldSubWorld;
end;
--´ÓMissionÀïÃæÉ¾³ıËùÓĞÍæ¼Ò
function mf_DelAllMSPlayer(nMissionID,nCamp,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local tPlayer = mf_GetMSPlayerIndex(nMissionID,nCamp,nMapID);
	local nOldPlayerIndex = PlayerIndex;
	for i=1,getn(tPlayer) do
		PlayerIndex = tPlayer[i];
		if PlayerIndex > 0 then
			DelMSPlayer(nMissionID,0);
		end
	end;
	PlayerIndex = nOldPlayerIndex;
	SubWorld = nOldSubWorld;
end;
--¶¯Ì¬MissionµÄÖ§³Öº¯Êı£¬±ØĞëÕıÈ·¶¨ÒåtMissionTS
--·µ»ØMissionµÄ×´Ì¬ºÍÀëÕâ¸ö×´Ì¬½áÊøËùÊ£ÓàµÄÊ±¼ä£¨µ¥Î»·ÖÖÓ£©
function mf_GetMissionCurState()
	local nCurTime = tonumber(date("%H%M"));
	local lfGetTimeDiff = function(nTime1,nTime2)
		return (floor(nTime2/100)-floor(nTime1/100))*60+mod(nTime2,100)-mod(nTime1,100);
	end;
	for nState,tTimeTable in tMissionTS do
		for i=1,getn(tTimeTable) do
			if nCurTime >= tTimeTable[i][1] and nCurTime <= tTimeTable[i][2] then
				local nMinLeft = lfGetTimeDiff(nCurTime,tTimeTable[i][2]);
				return nState,nMinLeft;
			end;
		end;
	end;
	return 0;
end;
--¶¯Ì¬¿ªÆôMission£¬ÕâÀïÖ»ÊÇ±Èmf_OpenMission¶àÁËÒ»²½ÅĞ¶Ï£¬¾ÍÊÇÅĞ¶ÏMissionVµÄµÚÒ»¸ö±äÁ¿ÊÇ·ñÎª0
--·µ»Ø0±íÊ¾µ±Ç°²»ÊôÓÚMission½øĞĞ½×¶Î£¬·µ»Ø1±íÊ¾¿ªÆôMission³É¹¦»òMissionÒÑ¾­¿ªÆô£¬
--·µ»Ønil±íÊ¾¿ªÆôMissionÊ§°Ü
function mf_OpenDynamicMission(nMissionID,nMapID)
	if mf_GetMissionV(nMissionID,1,nMapID) == 0 then
		if mf_GetMissionCurState() ~= 0 then
			return mf_OpenMission(nMissionID,nMapID);
		else
			return 0;
		end;
	else
		return 1;
	end;
end;
--ÏòÄ³¸öÕóÓªµÄËùÓĞÍæ¼ÒTalk
function mf_Talk2Camp(nMissionID,nCamp,szString,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local lfFunc = function(tArg)
		Talk(1,"",%szString);
	end;
	mf_OperateAllPlayer(nMissionID,lfFunc,{},nCamp,nMapID);
	SubWorld = nOldSubWorld;
end;
--ÏòÄ³¸öÕóÓªµÄËùÓĞÍæ¼ÒSay
--µÚÎå¸ö²ÎÊıszScriptFileNameÊÇÒª±£Ö¤Íæ¼Òµ±Ç°Ëù¹Ò½Å±¾ÓĞSayÀïÃæËùĞèµÄ»Øµ÷º¯Êı
function mf_Say2Camp(nMissionID,nCamp,szString,tSelTab,szScriptFileName,nMapID)
	local nOldSubWorld = SubWorld;
	if nMapID ~= nil then
		SubWorld = SubWorldID2Idx(nMapID);
	end;
	if SubWorld < 0 then
		SubWorld = nOldSubWorld;
		return nil;
	end;
	local lfFunc = function(tArg)
		SetPlayerScript(%szScriptFileName);
		Say(%szString,getn(%tSelTab),%tSelTab);
	end;
	if tSelTab == 0 then
		lfFunc = function(tArg)
			Say(%szString,0);
		end;		
	end;
	mf_OperateAllPlayer(nMissionID,lfFunc,{},nCamp,nMapID);
	SubWorld = nOldSubWorld;
end;
--¸øÄ³¸öÕóÓªµÄËùÓĞÍæ¼Ò¼ÓÒ»¸ö×´Ì¬
--µÚÈı¸ö²ÎÊıÊÇÒ»¸ötable£¬ÀïÃæÌîCastStateµÄÎå¸ö²ÎÊı£¨°´Ë³Ğò£©
--ÈçtArg = {"state_vertigo",10,10*18,0,1}	È«ÌåÔÎ10Ãë
function mf_CastStateMSPlayer(nMissionID,nCamp,tArg,nMapID)
	local lfFunc = function(tArg)
		CastState(tArg[1],tArg[3],tArg[3],tArg[4],tArg[5]);
	end;
	mf_OperateAllPlayer(nMissionID,func,tArg,nCamp,nMapID)
end;
