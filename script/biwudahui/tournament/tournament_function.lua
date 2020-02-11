Include("\\settings\\static_script\\exchg_server\\exchange_server_func.lua")
Include("\\script\\lib\\sdb.lua")
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
--Include("\\script\\online\\spring_festival09\\spring_festival_head.lua"); --09´º½Ú»î¶¯
Include("\\script\\equip_shop\\equip_shop_head.lua");
Include("\\script\\misc\\observer\\observer_head.lua");
--Include("\\script\\misc\\soul\\soul.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\script\\lib\\define.lua")

g_ThisFile = "\\script\\biwudahui\\tournament\\tournament_function.lua";

--ĞèÒªĞ´ÈëÊı¾İ¿âµÄ±äÁ¿
tRelayTask = {
	TSK_CURREALRESULT,
	TSK_TOTAL_POINT,
	TSK_CURSIGNEDRESULT,
	TSK_CURWEEKMATCH,
	TSK_TOTALMATCH,
	TASK_BIWU_WIN_10,
	TSK_TOTALWIN,
	TSK_CURWEEKWIN,
	TASK_BIWU_DUIZHAN_JINGYAN,
	TASK_BIWU_LOSE_10,
	TSK_TOTALLOSE,
	TSK_CURWEEKLOSE,
	TSK_BODY_WEEK,
	TASKID_WLZB_POINT,
--	TASKID_ACH_BIWU_WIN_TOTAL,
--	TASKID_ACH_USE_NEW_ROUTE,
--	TASKID_ACH_WIN_NEW_ROUTE,
};

--¹ÆÊ¦µÄ±äÁ¿
tGushiTask = {
	2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
};

function BWDH_SetTask(nTaskId, nTaskVal)
	return SetTask(nTaskId, nTaskVal,TASK_ACCESS_CODE_BIWUDAHUI)
end

--ÉèÖÃ±ÈÎäµÄÁ½Î»Íæ¼ÒµÄÕ½¶·×´Ì¬
function BWT_SetFightState(nState)
	local tbPlayer = {GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2)};
	local nOldPlayerIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if PlayerIndex ~= 0 then
			SetFightState(nState);
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--ÏòÁ½Î»Íæ¼ÒTalk»òÕßSay
function BWT_Talk(szTalk,bTalkSay)
	bTalkSay = bTalkSay or 0;
	local tbPlayer = {GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2)};
	local nOldPlayerIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		if PlayerIndex ~= 0 then
			if bTalkSay == 0 then
				Talk(1,"",szTalk);
			else
				Say(szTalk,0);
			end;
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--×ª»»Missionµ±Ç°×´Ì¬
function BWT_ChangeMSState(nState)
	if nState == MS_STATE_IDEL then
		BWT_SetFightState(0);
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	elseif nState == MS_STATE_CHECK_EQUIPMENT then
		BWT_SetFightState(0);
		SetMissionV(MV_MISSION_STATE,MS_STATE_CHECK_EQUIPMENT);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
		SetMissionV(MV_TIMER_LOOP,CHECK_EQUIPMENT_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊı
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,CHECK_EQUIPMENT_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷
	elseif nState == MS_STATE_READY then
		BWT_SetFightState(1);
		SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
		SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊı
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷
	elseif nState == MS_STATE_STARTED then
		BWT_SetFightState(1);
		SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
		SetMissionV(MV_TIMER_LOOP,STARTED_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖĞøÊ±¼ä
		StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
		StartMissionTimer(MISSION_ID,TIMER_ID,STARTED_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öĞÂµÄ¼ÆÊ±Æ÷
	elseif nState == MS_STATE_ENDING then
		BWT_SetFightState(0);
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
	end;
end;
--»ñÈ¡¶ÔÊÖµÄË÷Òı¡£Ö»ÄÜÔÚÀŞÌ¨³¡µØÀïÃæÓÉÍæ¼Ò´¥·¢Ê¹ÓÃ
function BWT_GetOpponentIndex()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nIdx1,nIdx2 = GetMissionV(MV_PLAYERINDEX1),GetMissionV(MV_PLAYERINDEX2);
	if PlayerIndex == nIdx1 then
		return nIdx2;
	elseif PlayerIndex == nIdx2 then
		return nIdx1;
	else
		gf_ShowDebugInfor("PlayerIndex trong hµm sè BWT_GetOpponentIndex bŞ lçi");
	end;
end;
--Çå³ıÁÙÊ±ÈÎÎñ±äÁ¿
function BWT_ClearTempTask()
	for i=TSK_TEMP_BEGIN,TSK_TEMP_END do
		SetTaskTemp(i,0);
	end;
end;
--¼ÆËã±¾´Î½ÏÒÕ»ñÊ¤»ñµÃµÄ»ı·Ö£¬ÓÉ»ñÊ¤·½µ÷ÓÃ
function BWT_CalculateWinPoint()
	local nOldPlayerIdx = PlayerIndex;
	local nRetPoint = 0;
	local nLevel = GetLevel();
	local nPoint = GetTask(TSK_CURREALRESULT);
	local nOppIdx = BWT_GetOpponentIndex();
	PlayerIndex = nOppIdx;
	local nOppLevel = GetLevel();
	local nOppPoint = GetTask(TSK_CURREALRESULT);
	PlayerIndex = nOldPlayerIdx;
	local nLevelDiff = nLevel - nOppLevel;	--µÈ¼¶²î£ºÊ¤·½¼õ¸º·½
	local nPointDiff = nPoint - nOppPoint;
	nRetPoint = 15;
	if nPointDiff >= -100 then
		for i=1,getn(TB_POINTDIFF_RELATION) do
			if nPointDiff >= TB_POINTDIFF_RELATION[i][1] then
				nRetPoint = TB_POINTDIFF_RELATION[i][2];
				break;
			end;
		end;
	end;
	if nLevelDiff > 0 then
		for i=1,getn(TB_LEVELDIFF_RELATION) do
			if nLevelDiff >= TB_LEVELDIFF_RELATION[i][1] then
				nRetPoint = floor(nRetPoint*TB_LEVELDIFF_RELATION[i][2]/100);
				break;
			end;
		end;
	end;
	if nRetPoint >= 15 then
		WriteLog("["..LOG_ERROR_HEAD.."]:"..tostring(GetName())..", "..tostring(GetName(nOppIdx)).."nPointDiff:"..nPointDiff..",nLevelDiff:"..nLevelDiff..",error point:"..nRetPoint);
		nRetPoint = 15;
	end;
	if nRetPoint <= 0 then
		nRetPoint = 1;
	end;
	return nRetPoint;
end;
--Ê±¼äµ½Ê±·ÖÎöÁ½Î»Íæ¼ÒµÄ×´Ì¬£¬¾ö¶¨×îÖÕÊ¤¸º¹ØÏµ
function BWT_GetDrawState(nPIdx1,nPIdx2)
	local tbDamageInfo1,tbDamageInfo2 = BWT_GetDamageValue(nPIdx1,nPIdx2);
	local nResult1,nResult2 = 0,0;
	nResult1 = tbDamageInfo1[1];	--¶ÔÍæ¼Ò1µÄÉËº¦°Ù·Ö±È
	nResult2 = tbDamageInfo2[1];	--¶ÔÍæ¼Ò2µÄÉËº¦°Ù·Ö±È
	if nResult1 > nResult2 then	--Öµ´óµÄÎª¸º·½
		nState = 2;	--±íÊ¾2ºÅÍæ¼ÒÓ®
	elseif nResult1 < nResult2 then
		nState = 1;	--±íÊ¾1ºÅÍæ¼ÒÓ®
	else
		nState = 0;	--´òÆ½ÁË
	end;
	return nState;
end;
--ÊäÈëÍæ¼Ò1ºÍÍæ¼Ò2£¬»ñÈ¡ËûÃÇ¸÷×ÔÊÜµ½µÄÉËº¦ĞÅÏ¢
function BWT_GetDamageValue(nPIdx1,nPIdx2)
	local nOldPIdx = PlayerIndex;
	local nDamageToP1,nDamageToP2 = 0,0;
	local nMaxLife1,nMaxLife2 = 0,0;
	local nState = 0;
	PlayerIndex = nPIdx1;
	nDamageToP2 = GetToPlayerDamage();
	nMaxLife1 = GetMaxLife();
	PlayerIndex = nPIdx2;
	nDamageToP1 = GetToPlayerDamage();
	nMaxLife2 = GetMaxLife();
	local nResult1,nResult2 = 0,0;
	nResult1 = tonumber(format("%.3f",nDamageToP1/nMaxLife1*100));	--¶ÔÍæ¼Ò1µÄÉËº¦Öµ
	nResult2 = tonumber(format("%.3f",nDamageToP2/nMaxLife2*100));	--¶ÔÍæ¼Ò2µÄÉËº¦Öµ
	PlayerIndex = nOldPIdx;
	return {nResult1,nDamageToP1,nMaxLife1},{nResult2,nDamageToP2,nMaxLife2};
end;

--´¦Àí½ÏÒÕ½á¹û¡£nResultType1Ê±±íÊ¾´òÆ½ÊÖ,·Ç1Îª¾ö³öÊ¤¸º¡£Ä¬ÈÏÖµÎª0
function BWT_ReportResult(nWinnerIdx,nLoserIdx,nResultType)
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 0 and GLB_BW_BiWuCheck() == 1 then --¿ªÆôÁËÈ«ÇøÈ«·ş±ÈÎäºóÔÚÔ­·ş²»ÔÙ»ñµÃ½±Àø
		local oldPlayerIndex = PlayerIndex
		PlayerIndex = nWinnerIdx;
		Say("Kú thi vßng lo¹i §¹i Héi Tû Vâ thiªn h¹ ®Ö nhÊt toµn quèc ®· chİnh thøc b¾t ®Çu vµo tuÇn nµy, c¸c vŞ ®¹i hiÖp b©y giê ®· cã thÓ cïng so tµi víi c¸c cao thñ kh¾p n¬i råi! Chi tiÕt cã thÓ ®Õn ®¹i sø §¹i Héi Tû Vâ hái xem, tû vâ server sÏ kh«ng nhËn ®­îc thªm phÇn th­ëng vµ tİch ®iÓm.",0);
		PlayerIndex = nLoserIdx;
		Say("Kú thi vßng lo¹i §¹i Héi Tû Vâ thiªn h¹ ®Ö nhÊt toµn quèc ®· chİnh thøc b¾t ®Çu vµo tuÇn nµy, c¸c vŞ ®¹i hiÖp b©y giê ®· cã thÓ cïng so tµi víi c¸c cao thñ kh¾p n¬i råi! Chi tiÕt cã thÓ ®Õn ®¹i sø §¹i Héi Tû Vâ hái xem, tû vâ server sÏ kh«ng nhËn ®­îc thªm phÇn th­ëng vµ tİch ®iÓm.",0);
		PlayerIndex = oldPlayerIndex;
		return 0;
	end
	nResultType = nResultType or 0;
	local tbDamageInfo1,tbDamageInfo2 = BWT_GetDamageValue(nWinnerIdx,nLoserIdx);
	Msg2MSAll(MISSION_ID,"Th«ng tin s¸t th­¬ng: ");
	Msg2MSAll(MISSION_ID,"Ng­êi ch¬i "..BWT_GetName(nWinnerIdx).."  g©y ra:"..tbDamageInfo2[2]..",% s¸t th­¬ng:"..tbDamageInfo2[1].."%");
	Msg2MSAll(MISSION_ID,"Ng­êi ch¬i "..BWT_GetName(nLoserIdx).."  g©y ra:"..tbDamageInfo1[2]..",% s¸t th­¬ng:"..tbDamageInfo1[1].."%");
	local nOldPIdx = PlayerIndex
	if nResultType == 1 then	--´òÆ½ÁË
		PlayerIndex = nWinnerIdx;
		Say("Hai bªn hßa, trõ <color=yellow>1<color> ®iÓm so tµi.",0);
		Msg2Player("B¹n bŞ trõ 1 ®iÓm so tµi");
		BWT_AddPoint(-1);
		merit_1V1(-1);
		PlayerIndex = nLoserIdx;
		Say("Hai bªn hßa, trõ <color=yellow>1<color> ®iÓm so tµi.",0);
		Msg2Player("B¹n bŞ trõ 1 ®iÓm so tµi");
		BWT_AddPoint(-1);
		merit_1V1(-1);
		_Write1V1PointLog(nWinnerIdx,nLoserIdx,-1,-1)
		PlayerIndex = nOldPIdx;
		Msg2MSAll(MISSION_ID,BWT_GetName(nWinnerIdx).."cïng víi "..BWT_GetName(nLoserIdx).." kÕt qu¶ hßa nhau");
	else
		--¼ÆËã¹¦Ñ«ºÍµÈ¼¶
		PlayerIndex = nWinnerIdx;
		local nWinMerit = _merit_GetMerit();
		local nWinLevel = GetLevel() + gf_GetPlayerRebornCount() * 10;
		PlayerIndex = nLoserIdx;
		local nLostMerit = _merit_GetMerit();
		local nLostLevel = GetLevel() + gf_GetPlayerRebornCount() * 10;
		
		--¸ø½±Àø
		PlayerIndex = nWinnerIdx;
		local nWinRoute = GetPlayerRoute() --Ê¤·½Á÷ÅÉ
		local nPoint = BWT_CalculateWinPoint();	--ÓÉ»ñÊ¤·½µ÷ÓÃ
		BWT_AddPoint(nPoint);
		merit_1V1(1, nWinMerit - nLostMerit, nWinLevel - nLostLevel, 0); --¹¦Ñ«ºÍ½£ÏÀ
		SetMissionV(MV_BIWU_RESULT,nWinnerIdx);
		Say("B¹n ®· chiÕn th¾ng <color=yellow>"..BWT_GetName(nLoserIdx).."<color>, nhËn ®­îc <color=yellow>"..nPoint.."<color> ®iÓm so tµi, ®iÓm so tµi tuÇn nµy lµ "..GetTask(TSK_CURREALRESULT)..".",0);
		Msg2Player("B¹n nhËn ®­îc "..nPoint.." ®iÓm so tµi");
		PlayerIndex = nLoserIdx;
		local nLoseRoute = GetPlayerRoute()--¸º·½Á÷ÅÉ
		BWT_AddPoint(-nPoint);
		merit_1V1(0, nLostMerit - nWinMerit, nLostLevel - nWinLevel, 0); --¹¦Ñ«ºÍ½£ÏÀ
		Say("B¹n ®· thua <color=yellow>"..BWT_GetName(nWinnerIdx).."<color>, bŞ gi¶m <color=yellow>"..nPoint.."<color> ®iÓm so tµi, ®iÓm so tµi tuÇn nµy lµ "..GetTask(TSK_CURREALRESULT)..".",0);
		Msg2Player("B¹n ®· bŞ gi¶m "..nPoint.." ®iÓm so tµi");
		PlayerIndex = nOldPIdx;
		Msg2MSAll(MISSION_ID,BWT_GetName(nWinnerIdx).."ChiÕn th¾ng råi "..BWT_GetName(nLoserIdx)..", giµnh ®­îc th¾ng lîi.");
		
		--PKÊ¤ÀûÍ³¼Æ
		local nPKStatWinKey = nWinRoute*100+nLoseRoute
		local nPKStatLoseKey = nLoseRoute * 100 + nWinRoute
		AddRuntimeStat(15,1,nPKStatWinKey,1)
		AddRuntimeStat(15,2,nPKStatWinKey,1)
		AddRuntimeStat(15,2,nPKStatLoseKey,1)
		
		_Write1V1PointLog(nWinnerIdx,nLoserIdx,nPoint,-1*nPoint)
	end;
	BWT_AddBiWuRecord(nWinnerIdx,nLoserIdx,nResultType);	--ĞèÔÚ¸øÓè»ı·Öºóµ÷ÓÃ

--	if get_spring_festival_state09() == 1 then
--		PlayerIndex = nWinnerIdx;
--		local nDate = tonumber(date("%Y%m%d"));
--		if GetTask(TASK_BIWU_JINNIU_DATE) < nDate then
--			BWDH_SetTask(TASK_BIWU_JINNIU_DATE,nDate);
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,0);
--			BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,0);
--		end
--		BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,GetTask(TASK_BIWU_JINNIU_CHANG)+1);
--		if GetTask(TASK_BIWU_JINNIU_CHANG) >= 10 and GetTask(TASK_BIWU_JINNIU_NUM) == 0 then
--			AddItem(tSFItem[1][2],tSFItem[1][3],tSFItem[1][4],GET_BIWU_JINNIU_NUM);
--			Msg2Player("Äã½ñÌì½øĞĞÁË10³¡±ÈÎä£¬»ñµÃ"..GET_BIWU_JINNIU_NUM.."¸ö"..tSFItem[1][1].."¡£");
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,1);
--		end
--		PlayerIndex = nLoserIdx;
--		local nDate = tonumber(date("%Y%m%d"));
--		if GetTask(TASK_BIWU_JINNIU_DATE) < nDate then
--			BWDH_SetTask(TASK_BIWU_JINNIU_DATE,nDate);
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,0);
--			BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,0);
--		end
--		BWDH_SetTask(TASK_BIWU_JINNIU_CHANG,GetTask(TASK_BIWU_JINNIU_CHANG)+1);
--		if GetTask(TASK_BIWU_JINNIU_CHANG) >= 10 and GetTask(TASK_BIWU_JINNIU_NUM) == 0 then
--			AddItem(tSFItem[1][2],tSFItem[1][3],tSFItem[1][4],GET_BIWU_JINNIU_NUM);
--			Msg2Player("Äã½ñÌì½øĞĞÁË10³¡±ÈÎä£¬»ñµÃ"..GET_BIWU_JINNIU_NUM.."¸ö"..tSFItem[1][1].."¡£");
--			BWDH_SetTask(TASK_BIWU_JINNIU_NUM,1);
--		end
--		PlayerIndex = nOldPIdx;
--	end
end;

function _Write1V1PointLog(nWinnerIdx,nLoserIdx, nWinnerPnt,nLoserPnt)
	local strAction = "1v1_match"
	local strDate = date("%Y_%m_%d")

	local hFile = openfile(format("logs/gest_convention/%s/%s.log", strDate, strAction), "a+");
	if (hFile == nil) then
		execute(format("mkdir \"%s\"", "logs/gest_convention/"));
		execute(format("mkdir \"%s\"", format("logs/gest_convention/%s/", strDate)));
		hFile = openfile(format("logs/gest_convention/%s/%s.log", strDate, strAction), "a+");
		write (hFile, "Account\tRole\tPoint\tTotalPoint\tCurZiGePoint\tDate\n")
	end
	if (hFile ~= nil) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = nWinnerIdx
		local szMsg = format("%s\t%s\t%d\t%d\t%d\t%s\n"
			, GetAccount(), GetName(), nWinnerPnt, GetTask(TSK_CURREALRESULT), GetTask(TSK_CURLADDERVALUE), strDate)
		write (hFile, szMsg)
		PlayerIndex = nLoserIdx
		szMsg = format("%s\t%s\t%d\t%d\t%d\t%s\n"
			, GetAccount(), GetName(), nLoserPnt, GetTask(TSK_CURREALRESULT), GetTask(TSK_CURLADDERVALUE), strDate)
		write (hFile, szMsg)
		PlayerIndex = OldPlayerIndex
		closefile (hFile)
	end
end

--»ñµÃ±ÈÎäË«·½µÄÃû×Ö
function BWT_GetFighterName(nMapID)
	nMapID = nMapID or SubWorldIdx2ID(SubWorld);
	return mf_GetMissionS(MISSION_ID,MS_PLAYERNAME1,nMapID),
		   mf_GetMissionS(MISSION_ID,MS_PLAYERNAME2,nMapID);
end;
--»ñÈ¡µ±Ç°·şÎñÆ÷ÉÏ¿ÉÓÃµÄ³¡µØÊıÁ¿
function BWT_GetServerIdleRoomNum()
	local nCount = 0;
	local nTotalCount = 0;
	for i,v in TB_MAPID do
		if SubWorldID2Idx(i) >= 0 then
			nCount = nCount + GetMapLoadCount(v[2]);
			nTotalCount = nTotalCount + MAX_ROOM_NUM;
		end;
	end;
	return nTotalCount - nCount;
end;
--³õÊ¼»¯Ò»ÂÖ±ÈÎä,GMScriptÖĞÖ´ĞĞ
--»ñÈ¡Ä³·şÎñÆ÷¿ÉÓÃ³¡µØÊıÁ¿£¬È»ºóÑ¡³öºÏÊÊÊıÁ¿µÄÅä¶ÔÍæ¼Ò£¬¿ªÆô³¡µØ£¬°ÑÍæ¼Ò´«½øÈ¥
function BWT_InitOneRound()
	do
		return BWT_InitOneRoundEx();	--ÓÃ×îĞÂµÄÅä¶Ô¹æÔò
	end;
	local nCount = BWT_GetServerIdleRoomNum();
	local tbPlayer = {};
	local nRetCode,nPIdx1,nPIdx2 = 0,0,0;
	local nPairCount = 0;
	for i=1,nCount do
		nRetCode,nPIdx1,nPIdx2 = BWT_SentInviteToPlayer();
		if nRetCode == -1 then	--Èç¹ûÃ»Í¨¹ı¼ì²é
			tinsert(tbPlayer,nPIdx1);	--¼Óµ½tableÀïÃæ
			tinsert(tbPlayer,nPIdx2);
		elseif nRetCode == 1 then
			nPairCount = nPairCount + 1;
		end;
	end;
	local nOldPIdx = PlayerIndex;
	--BWT_SentInviteToPlayer»á°ÑÍæ¼Ò´ÓÁĞ±íÖĞÒÆ³ı£¬ËùÒÔÏÂÃæµÄ´úÂëÊÇÒª°ÑÍæ¼Ò¼Ó»ØÈ¥µÄ
	for i=1,getn(tbPlayer) do	--°ÑÍæ¼Ò¼Ó»ØÁĞ±í
		PlayerIndex = tbPlayer[i];
		if GetTask(TSK_CHECK_FAIL) == 0 then	--Èç¹û¼ì²éÍ¨¹ıÁË¾Í¼Ó»ØÁĞ±í
			BWT_JoinGestConvention();
		end;
	end;
	PlayerIndex = nOldPIdx;
	return nPairCount;
end;
--ÁíÒ»¸ö³õÊ¼»¯±ÈÎäµÄº¯Êı
--¸ù¾İÒ»¶¨µÄ¹æÔòÑ¡³ön£¨floor(ÁĞ±íÖĞµÄÍæ¼ÒÊıÁ¿/2)£©¶ÔÍæ¼Ò
function BWT_InitOneRoundEx()
	-- ÏÈ¼ì²é¶ÓÁĞ È¡³ö²»·ûºÏµÄÈË
	BWT_CheckAllPlayerState();
	--
	local tbPlayer = {};
	local nRetCode,nPIdx1,nPIdx2 = 0,0,0;
	local nPairCount = 0;
	local nPair = floor(GetGestQueueSize()/2);	--È¡µÃÅä¶ÔµÄ¶ÔÊı
	local nPIdx1,nPIdx2 = 0,0;
	for i=1,nPair do
		nRetCode,nPIdx1,nPIdx2 = BWT_GetPairGestPlayer(i);	--´Ëº¯Êı»áÈÃÍæ¼ÒÍË³öÁĞ±í
		if nRetCode == 0 then
			tinsert(tbPlayer,nPIdx1);
		else
			nRetCode = BWT_SentInviteToPlayer(nPIdx1, nPIdx2);	--¸Ãº¯ÊıÒ²»áÈÃÑ¡ÖĞµÄÍæ¼ÒÔİÊ±ÍË³öÁĞ±í
			if nRetCode == 0 then
				break
			elseif nRetCode == -1 then	--Èç¹ûÃ»Í¨¹ı¼ì²é
				tinsert(tbPlayer,nPIdx1);
				tinsert(tbPlayer,nPIdx2);
			elseif nRetCode == 1 then
				nPairCount = nPairCount + 1;
				BWT_CostOneRount(nPIdx1, nPIdx2);
			end
		end
	end

	local nOldPIdx = PlayerIndex;
	--BWT_SentInviteToPlayer»á°ÑÍæ¼Ò´ÓÁĞ±íÖĞÒÆ³ı£¬ËùÒÔÏÂÃæµÄ´úÂëÊÇÒª°ÑÍæ¼Ò¼Ó»ØÈ¥µÄ
	for i = 1, getn(tbPlayer) do	--°ÑÍæ¼Ò¼Ó»ØÁĞ±í
		PlayerIndex = tbPlayer[i];
		if GetTask(TSK_CHECK_FAIL) == 0 then	--Èç¹û¼ì²éÍ¨¹ıÁË¾Í¼Ó»ØÁĞ±í
			BWT_JoinGestConvention();
		end
	end
	PlayerIndex = nOldPIdx;
	--AddRuntimeStat(26,1,0,2*nPairCount)--²ÎÓë1V1ÈË´Î
	return nPairCount;
end
--»ñµÃÒ»¶ÔÍæ¼Ò¡£
--²ÎÊı2ÎªÆæÊıÊ±Îª×î¸ß»ı·ÖµÄÍæ¼ÒÅä¶Ô£¬È»ºó°ÑÍæ¼ÒÒÆ³ı³öÁĞ±í£¬
--²ÎÊı2ÎªÅ¼ÊıÊ±Îª×îµÍ»ı·ÖµÄÍæ¼ÒÅä¶Ô£¬È»ºó°ÑÍæ¼ÒÒÆ³ı³öÁĞ±í£¬
--ÖØ¸´ÒÔÉÏÅä¶Ô¹ı³ÌÖ±µ½ÁĞ±íÀïÃæÃ»ÓĞÍæ¼Ò
function BWT_GetPairGestPlayer(nOrder)
	local nQueueSize = GetGestQueueSize();
	if nQueueSize <= 1 then
		return 0,0,0;	--Î¨Ò»·µ»ØÅä¶ÔÊ§°ÜµÄÇé¿ö
	end

	local nDirection			= 0;	--1ÎªÏòÉÏÆ¥ÅäÍæ¼Ò£¬-1ÎªÏòÏÂÆ¥ÅäÍæ¼Ò
	local nPIdx1				= 0;	--Íæ¼Ò1µÄË÷Òı
	local nPIdx2				= 0;	--Íæ¼Ò2µÄË÷Òı
	local nLevel				= 0;	--Íæ¼Ò1µÄµÈ¼¶
	local nPoint				= 0;	--Íæ¼Ò1µÄµ±Ç°»ı·Ö
	local nResult				= 0;	--Íæ¼Ò1Ê¤¸ºÊı

	if mod(nOrder,2) == 1 then	--ÆæÊı
		nPIdx1 = GetPlayerByGestQueueIndex(nQueueSize - 1);
		nDirection = -1;	--ÏòÏÂÆ¥Åä
	else	--Å¼Êı
		nPIdx1 = GetPlayerByGestQueueIndex(0);
		nDirection = 1;		--ÏòÉÏÆ¥Åä
	end

	nLevel	= GetLevel(nPIdx1);
	nPoint	= GetTask(TSK_CURREALRESULT, nPIdx1);
	nResult	= GetTask(TASKID_BIWU_MATCH_RESULT, nPIdx1);

	local nPointRangeLv		= 0;	--»ı·Ö²îµÈ¼¶
	local nPointRangeStep		= 30;	--»ı·Ö²î²½³¤
	local nPointRangeLvMax		= 3;	--»ı·Ö²î×î´óµÈ¼¶
	local nLevelRangeLv		= 0;	--µÈ¼¶²îµÈ¼¶
	local nLevelRangeStep		= 1;	--µÈ¼¶²î²½³¤
	local nLevelRangeLvMax		= 99;	--µÈ¼¶²î×î´óµÈ¼¶
	nPointRangeLv = nPointRangeLvMax;
	nLevelRangeLv = nLevelRangeLvMax;

	local nTempPIdx			= 0;				--ÁÙÊ±Íæ¼Ò
	local nTempPointRangeLv	= 0;				--ÁÙÊ±»ı·Ö²îµÈ¼¶
	local nTempLevelRangeLv	= 0;				--ÁÙÊ±µÈ¼¶²îµÈ¼¶
	local nQueueIdx			= 0;				--Åä¶ÔÁĞ±íÀïÃæµÄ¶ÓÁĞË÷Òı
	local nMaxQueueIdx			= nQueueSize - 1;	--Åä¶ÔÁĞ±íÖĞµÄ×î´óË÷Òı£¬ÓÉÓÚË÷ÒıÊÇ´Ó0¿ªÊ¼µÄ£¬ËùÒÔ×î´óË÷Òı¾ÍÊÇnQueueSize-1

	for i = 1, nMaxQueueIdx do
		local bPass = 1;
		nQueueIdx = floor((nMaxQueueIdx * (1 - nDirection) / 2) + nDirection * i);	--´ÓÍ·¸ã»¹ÊÇ´ÓÎ²¸ã
		nTempPIdx = GetPlayerByGestQueueIndex(nQueueIdx);

		if 1 == bPass then
			bPass = ((nTempPIdx > 0) and 1) or 0;
		end

		if 1 == bPass then
			bPass = ((nResult == GetTask(TASKID_BIWU_MATCH_RESULT, nTempPIdx)) and 1) or 0;
		end

		if 1 == bPass then
			bPass = GLB_BW_Block_Route_Check_Ex(nPIdx1, nTempPIdx);
		end

		if 1 == bPass then
			nTempPointRangeLv = floor(abs(nPoint - GetTask(TSK_CURREALRESULT, nTempPIdx)) / nPointRangeStep) + 1;
			nTempLevelRangeLv = floor(abs(nLevel - GetLevel(nTempPIdx))                   / nLevelRangeStep) + 1;

			if nTempPointRangeLv < nPointRangeLv then
				bPass = 1;
			elseif nTempPointRangeLv == nPointRangeLv then
				if nTempLevelRangeLv < nLevelRangeLv then
					bPass = 1;
				elseif nTempLevelRangeLv == nLevelRangeLv then
					bPass = random(0, 1);
				else
					bPass = 0;
				end
			else
				bPass = 0;
			end
		end

		if 1 == bPass then
			nPIdx2			= nTempPIdx;
			nPointRangeLv	= nTempPointRangeLv;
			nLevelRangeLv	= nTempLevelRangeLv;
		end
	end

	if 0 == nPIdx2 then
		return 0, nPIdx1, nPIdx2;
	end

	BWT_QuitGestConvention(nPIdx1);
	BWT_QuitGestConvention(nPIdx2);
	return 1, nPIdx1, nPIdx2;
end
--¼ì²éËùÓĞÍæ¼ÒµÄ×´Ì¬ÊÇ·ñ¿ÉÒÔ²Î¼Ó±ÈÎä
function BWT_CheckAllPlayerState()
	local nQueueSize	= GetGestQueueSize();
	local tFailPlayer	= {};
	for i = 0, nQueueSize - 1 do
		local nPIdx = GetPlayerByGestQueueIndex(i);
--		if 0 == CheckXYY(nPIdx) then
--			tinsert(tFailPlayer, nPIdx);
--		end
	end

	tFailPlayer.n = nil;
	for _, nPIdx in tFailPlayer do
		BWT_QuitGestConvention(nPIdx);
		GLB_BW_LEAVE(200, nPIdx);
	end
end
--±ÈÈüÒ»³¡Òª¿Û³ıµÄXX --±ØĞë¶¼ÊÇÄÜ¹»³É¹¦¿Û³ıµÄ
function BWT_CostOneRount(nPIdx1, nPIdx2)
	GLB_BW_Block_Route_Cost(nPIdx1);
	GLB_BW_Block_Route_Cost(nPIdx2);
end
--¼ì²éÍæ¼Òµ±Ç°×´Ì¬ÊÇ·ñ¿ÉÒÔ½ÓÊÜÑûÇë
function BWT_CheckPlayerState(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nTimeElapse = GetTime() - GetTask(TSK_LAST_INVITE_TIME);
	if nTimeElapse >= 0 and nTimeElapse <= INVITE_INTERVAL_TIME then	--Èç¹ûnTimeElapseĞ¡ÓÚ0,ÄÇÃ´±íÊ¾³öÏÖ¹ı¿ç·şĞĞÎª£¬ÕâÖÖÇé¿ö²»±ØÏŞÖÆËû
		BWDH_SetTask(TSK_CHECK_FAIL,0);	--Ò²Ëã¼ì²éÍ¨¹ı
		PlayerIndex = nOldPIdx;
		return 0;	--Èç¹û¾àÀëÉÏ´Î¾Ü¾ø»ò±ÈÎä½áÊøÊ±¼äĞ¡ÓÚINVITE_INTERVAL_TIMEÃë
	end;
	--PKÖµ´óÓÚ4,ËÀÍö£¬°ÚÌ¯£¬²»ÔÚºÏ·¨µØÍ¼
	if GetPKValue() >= 4 or IsPlayerDeath() == 1 or IsStalling() == 1 or BWT_CheckValidMap() == 0 then	--Èç¹ûµ±Ç°ÊÇËÀÍö×´Ì¬»òÔÚ°ÚÌ¯»ò²»ÔÚºÏ·¨µØÍ¼
		BWDH_SetTask(TSK_CHECK_FAIL,1);	--ÕâÀï×÷Ò»¸ö¼ì²é²»Í¨¹ıµÄ±ê¼Ç
		TaskTip("Tr¹ng th¸i cña b¹n hiÖn kh«ng ®­îc tû vâ, b¹n ®· rêi khái cuéc thi.");
		Msg2Player("Tr¹ng th¸i cña b¹n hiÖn kh«ng ®­îc tû vâ, b¹n ®· rêi khái cuéc thi. H·y kiÓm tra ®iÓm PK cña b¹n cã ph¶i >=4, hiÖn cã ph¶i ë tr¹ng th¸i tö vong hoÆc ®ang ë gÇn TuyÒn Ch©u");
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	BWDH_SetTask(TSK_CHECK_FAIL,0);	--¼ì²éÍ¨¹ı±ê¼Ç
	PlayerIndex = nOldPIdx;
	return 1;
end;
--¼ì²éµ±Ç°Ëù´¦µØÍ¼ÊÇ²»ÊÇ¿ÉÒÔ½ÓÊÕ±ÈÎäÑûÇë
function BWT_CheckValidMap(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local tbValidMap = {
				100,105,108,103,104,106,107,109,110,111,112,
				113,114,115,116,151,306,307,319,320,974,7100,
				};
	local nCurMapID = GetWorldPos();
	for i=1,getn(tbValidMap) do
		if nCurMapID == tbValidMap[i] then
			PlayerIndex = nOldPIdx;
			return 1;
		end;
	end;
	PlayerIndex = nOldPIdx;
	return 0;
end;
--ÏòÒ»¶ÔÑ¡ÊÖ·¢ËÍ±ÈÎäÑûÇë
function BWT_SentInviteToPlayer(nPIdx1,nPIdx2)
	local nHour = tonumber(date("%H"));
	if BWT_CheckBiWuTime() == 0 then
		return 0;	--²»ÔÚ±ÈÎäÊ±¼äÄÚ
	end;
	local nOldPIdx = PlayerIndex;
	if not nPIdx1 then	--Èç¹ûÃ»ÓĞÊäÈë²ÎÊı
		nPIdx1,nPIdx2 = GetPairGestPlayer();
	end;
	if nPIdx1 == 0 and nPIdx2 == 0 then	--Èç¹ûÃ»Åä¶Ô³É¹¦
		return 0;
	end;
	BWT_QuitGestConvention(nPIdx1);	--Ñ¡³öÀ´ºóÏÈÍË³öÁĞ±í
	BWT_QuitGestConvention(nPIdx2);
	if BWT_CheckPlayerState(nPIdx1) == 0 or BWT_CheckPlayerState(nPIdx2) == 0 then
		return -1,nPIdx1,nPIdx2;
	end;
	local nCurTime = GetTime();
	PlayerIndex = nPIdx1;
	BWT_SetTaskTemp(TSK_TEMP_CHOICE,0);	--ÇåÑ¡ÔñÇé¿ö
	BWDH_SetTask(TSK_LAST_INVITE_TIME,nCurTime);
	BWDH_SetTask(TSK_OPPNAME_HASH,Hash(GetName(nPIdx2)));	--¼ÇÂ¼¶ÔÊÖÃû×ÖHASHÂëÓÃÓÚ»Øµ÷Ê±µÄ×îÖÕÈ·ÈÏ
	PlayerIndex = nPIdx2;
	BWT_SetTaskTemp(TSK_TEMP_CHOICE,0);
	BWDH_SetTask(TSK_OPPNAME_HASH,Hash(GetName(nPIdx1)));
	BWDH_SetTask(TSK_LAST_INVITE_TIME,nCurTime);
	OnWant(nPIdx1,nPIdx2);
	PlayerIndex = nOldPIdx;
	return 1;
end;
--»ñÈ¡ÁÙÊ±±äÁ¿µÄÖµ
function BWT_GetTaskTemp(nID,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nValue = GetTaskTemp(TSK_TEMP_CHOICE);
	PlayerIndex = nOldPIdx;
	return nValue;
end;
--ÉèÖÃÁÙÊ±±äÁ¿
function BWT_SetTaskTemp(nID,nValue,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	SetTaskTemp(nID,nValue);
	PlayerIndex = nOldPIdx;
end;
--»ñÈ¡¶¯Ì¬±ÈÎä³¡µØID
function BWT_GetIdleRoom()
	local nCount = 0;
	local nMapID,nMapIdx = 0,0;
	for i,v in TB_MAPID do
		if SubWorldID2Idx(i) >= 0 then
			nCount = GetMapLoadCount(v[2]);
			if nCount < MAX_ROOM_NUM then
				nMapID,nMapIdx = DynamicLoadMap(v[2]);
				return nMapID,nMapIdx,i;
			end;
		end;
	end;
	return 0,0,0;
end;
--¿ªÆôÒ»³¡±ÈÎä
function BWT_OpenMatch(nPIdx1,nPIdx2)
	local nMapID,nMapIdx,nCityID = BWT_GetIdleRoom();
	if nMapID == 0 and nMapIdx == 0 then
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
--	local nDirection,nNum = BWT_GetFieldDirection(nCityID);
--	if nDirection == 0 then
--		gf_ShowDebugInfor("BWT_GetFieldDirection·µ»ØÖµÎª0,0");
--		WriteLog("["..LOG_ERROR_HEAD.."]:BWT_GetFieldDirection·µ»ØÖµÎª0,0");
--		print("Fail2");
--		return 0;
--	end;
	if mf_OpenMission(MISSION_ID,nMapID) == 1 then
		mf_SetMissionV(MISSION_ID,MV_CITY_ID,nCityID,nMapID);
		mf_SetMissionV(MISSION_ID,MV_MAPID,nMapID,nMapID);
		mf_SetMissionV(MISSION_ID,MV_MAPIDX,nMapIdx,nMapID);
--		mf_SetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nDirection,nMapID);
		mf_SetMissionV(MISSION_ID,MV_FIELD_NUM,nNum,nMapID);
		PlayerIndex = nPIdx1;
		mf_JoinMission(MISSION_ID,A_CAMP,nMapID);
		PlayerIndex = nPIdx2;
		mf_JoinMission(MISSION_ID,B_CAMP,nMapID);
--		BWT_InitOneRound();	--ÔÙ³õÊ¼»¯Ò»ÂÖ
		WriteLog(format("[§¹i Héi Tû Vâ b¾t ®Çu] [Hai bªn ®èi trËn: %s vs %s] [Th«ng tin trËn ®Êu: %d,%d,%d]",GetName(nPIdx1),GetName(nPIdx2),nMapID,nMapIdx,nCityID))
	end;
	PlayerIndex = nOldPIdx;
end;
--¹Ø±Õ±ÈÎä³¡µØ
function BWT_CloseField()
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	CloseMission(MISSION_ID);
	local nRetCode = FreeDynamicMap(nMapID,nMapIdx);	--FreeDynamicMapÒ²»áµ÷ÓÃCloseMisssion
	if nRetCode == 0 then
		WriteLog("["..LOG_ERROR_HEAD.."]:FreeDynamicMap bŞ lçi, nRetCode:"..nRetCode);
	end;
	WriteLog(format("[§¹i Héi Tû Vâ kÕt thóc] [Th«ng tin trËn ®Êu: %d,%d]",nMapID,nMapIdx))
end;
--¼ì²éÍæ¼Ò×°±¸ÊÇ·ñ·ûºÏ±ÈÎä¹æ¶¨£¬Èç¹û·ûºÏ¹æ¶¨·µ»Ø1,²»·ûºÏ·µ»Ø0ºÍÒ»¸ötable
--tableÀïÃæÖ¸Ã÷ÁË»¹ÓĞÄÄĞ©Î»ÖÃµÄ×°±¸²»·ûºÏ
function BWT_CheckEquipment(nPIdx)
	do--ËùÓĞ×°±¸¶¼ÔÊĞí
		return 1
	end
	
--	local nOldPIdx = PlayerIndex;
--	PlayerIndex = nPIdx or PlayerIndex;
--	local nEquipIdx = 0;
--	local nCheckNum = 0;
--	local tbEquipPos = {};	--×°±¸ĞÅÏ¢table
--	for i=1,6 do	--¼ì²éÍ·ÒÂ¿ãÎäÆ÷Ê×ÊÎ1Ê×ÊÎ2
--		nEquipIdx = GetPlayerEquipIndex(i-1);
--		if nEquipIdx == 0 then	--Ã»´©×°±¸
--			nCheckNum = nCheckNum + 1;
--			tbEquipPos[i] = 1;
--		else
--			if BWT_CheckSuohunEquip(nEquipIdx) == 1 then
--				if BWT_CheckNormalEquip(nEquipIdx) == 1 or BWT_CheckSuitEquip(nEquipIdx) == 1 then	--Ì××°ºÍÆÕÍ¨×°¼ì²é³É¹¦
--					nCheckNum = nCheckNum + 1;
--					tbEquipPos[i] = 1;
--				else
--					tbEquipPos[i] = 0;
--				end;
--			else
--				tbEquipPos[i] = 0;
--			end
--		end;
--	end;
--	for i=7,12 do	--¼ì²éÍ·ÒÂ¿ãÎäÆ÷Ê×ÊÎ1Ê×ÊÎ2
--		nEquipIdx = GetPlayerEquipIndex(i-1);
--		if nEquipIdx == 0 then	--Ã»´©×°±¸
--			nCheckNum = nCheckNum + 1;
--			tbEquipPos[i] = 1;
--		else
--			if BWT_CheckSuohunEquip(nEquipIdx) == 1 then
--				nCheckNum = nCheckNum + 1;
--				tbEquipPos[i] = 1;
--			else
--				tbEquipPos[i] = 0;
--			end
--		end;
--	end;
--	PlayerIndex = nOldPIdx;
--	if nCheckNum == 12 then	--ËùÓĞ×°±¸¶¼Í¨¹ı¼ì²é
--		return 1,tbEquipPos;
--	else
--		return 0,tbEquipPos;
--	end;
end;

--¼ì²éËù´©×°±¸ÊÇ·ñÊÇ×Ô¼ºÃû×ÖµÄËø»ê×°±¸
function BWT_CheckSuohunEquip(nEquipIdx)
	local nOwnName = GetItemOwner(nEquipIdx);
	local nPlayerName = GetName();
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
		nPlayerName = strName;
	end
	if nOwnName == "" or nOwnName == nPlayerName then
		return 1;
	else
		return 0;
	end
end

--¼ì²éÌ××°
function BWT_CheckSuitEquip(nEquipIdx)
	if BWT_CheckBaGuaSuit(nEquipIdx) == 1
		or BWT_CheckRouteSuitID(nEquipIdx) == 1
		or BWT_CheckCangJianSuitID(nEquipIdx) == 1
		or BWT_ShiTuSuitID(nEquipIdx) == 1 then
		return 1;
	else
		return 0;
	end;
end;
--¼ì²é°ËØÔ×°ID
function BWT_CheckBaGuaSuit(nEquipIdx)
	if GetItemMaxLingQi(nEquipIdx) > 0 then
		return 1;
	end;
	return 0;
end;
--¼ì²éÊ¦ÃÅ×°ID
function BWT_CheckRouteSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_ROUTE_SUIT_ID[nRoute]) do
		if nSuitID == TB_ROUTE_SUIT_ID[nRoute][i] then
			return 1;
		end;
	end;
	return 0;
end;
--¼ì²é²Ø½£Ì××°ID
function BWT_CheckCangJianSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_CANGJIAN_SUIT_ID) do
		if nSuitID == TB_CANGJIAN_SUIT_ID[i] then
			return 1;
		end;
	end;
	return 0;
end;
--¼ì²éÊ¦Í½×°Ì××°ID
function BWT_ShiTuSuitID(nEquipIdx)
	local nRoute = GetPlayerRoute();
	local nSuitID = GetEquipSuitID(nEquipIdx);
	for i=1,getn(TB_SHITU_SUIT_ID) do
		if nSuitID == TB_SHITU_SUIT_ID[i] then
			return 1;
		end;
	end;
	return 0;
end;
--¼ì²éÆÕÍ¨×°±¸
function BWT_CheckNormalEquip(nEquipIdx)
	if BWT_CheckHatID(nEquipIdx) == 1
		or BWT_CheckClothID(nEquipIdx) == 1
		or BWT_CheckTrousersID(nEquipIdx) == 1
		or BWT_CheckRingID(nEquipIdx) == 1
		or BWT_CheckWeaponID(nEquipIdx) == 1 then
		return 1;
	else
		return 0;
	end;
end;
--¼ì²éÊ×ÊÎID
function BWT_CheckRingID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 102 then
		for i=1,getn(TB_RING_ID) do
			if type(TB_RING_ID[i]) == "table" then
				if nID3 >= TB_RING_ID[i][1] and nID3 <= TB_RING_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_RING_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--¼ì²éÃ±×ÓID
function BWT_CheckHatID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 103 then
		for i=1,getn(TB_HAT_ID) do
			if type(TB_HAT_ID[i]) == "table" then
				if nID3 >= TB_HAT_ID[i][1] and nID3 <= TB_HAT_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_HAT_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--¼ì²éÒÂ·şID
function BWT_CheckClothID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 100 then
		for i=1,getn(TB_CLOTH_ID) do
			if type(TB_CLOTH_ID[i]) == "table" then
				if nID3 >= TB_CLOTH_ID[i][1] and nID3 <= TB_CLOTH_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_CLOTH_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--¼ì²é¿ã×ÓID
function BWT_CheckTrousersID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	if nID1 == 0 and nID2 == 101 then
		for i=1,getn(TB_TROUSERS_ID) do
			if type(TB_TROUSERS_ID[i]) == "table" then
				if nID3 >= TB_TROUSERS_ID[i][1] and nID3 <= TB_TROUSERS_ID[i][2] then
					return 1;
				end
			else
				if nID3 == TB_TROUSERS_ID[i] then
					return 1;
				end
			end
		end;
	end;
	return 0;
end;
--¼ì²éÎäÆ÷ID
function BWT_CheckWeaponID(nEquipIdx)
	local nID1,nID2,nID3 = GetItemInfoByIndex(nEquipIdx);
	for i=1,getn(TB_WEAPON_ID) do
		if nID1 == TB_WEAPON_ID[i][1] and nID2 == TB_WEAPON_ID[i][2] and nID3 == TB_WEAPON_ID[i][3] then
			return 1;
		end;
	end;
	return 0;
end;
--³õÊ¼»¯³¡µØNPC
function BWT_InitFieldNpc()
	local nMapID = gf_GetCurMapID();
	local nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn","Thñ khè",nMapID,1533,3170);
	SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
	nNpcIdx = CreateNpc("R­¬ng ®å Trung Nguyªn","Thñ khè",nMapID,1655,3317);
	SetNpcScript(nNpcIdx,"\\script\\biwudahui\\npc\\npc_itemkeeper.lua");
end;
--»ñµÃ¿ÉÓÃµÄ±ÈÎä³¡µØµÄ·½ÏòÓë±àºÅ
function BWT_GetFieldDirection(nCityID)
	local tbMapID = gf_GetDataTable(GetSameMaps(TB_MAPID[nCityID][2]));
	local tbFieldInfo = {};
	local nMapID = 0;
	local nDirection,nNum = 0,0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		if nMapID ~= TB_MAPID[nCityID][2] then
			if mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID) ~= MS_STATE_IDEL then
				nDirection = mf_GetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nMapID);
				nNum = mf_GetMissionV(MISSION_ID,MV_FIELD_NUM,nMapID);
				tinsert(tbFieldInfo,{nDirection,nNum});
			end;
		end;
	end;
	local bFound = 0;
	for i=1,4 do  --ËÄ¸ö·½Ïò
		for j=1,8 do  --Ã¿¸ö·½ÏòÓĞ¼¸¸ö³¡µØ
			bFound = 0;
			for k=1,getn(tbFieldInfo) do
				if tbFieldInfo[k][1] == i and tbFieldInfo[k][2] == j then
					bFound = 1;
				end;
			end;
			if bFound == 0 then
				return i,j;
			end;
		end;
	end;
	return 0,0;
end;
--»ñµÃÄ³³¡±ÈÎäµÄĞÅÏ¢£¬°üÀ¨±ÈÎäË«·½Ë÷Òı£¬³¡µØµ±Ç°×´Ì¬£¬ÊÇ·ñÔÊĞí¹Û¿´
function BWT_GetMatchInfo(nCityID,nDirection,nNum)
	local nMapID = BWT_GetDesMapID(nCityID,nDirection,nNum);
	if nMapID == 0 then
		return 0,0,0,0;
	end;
	local szName1,szName2 = BWT_GetFighterName(nMapID);
	local nState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID);
	local nPIdx1 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX1,nMapID);
	local nPIdx2 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX2,nMapID);
	if GetTask(TSK_ALLOW_AUDIENCE,nPIdx1) == 1 and GetTask(TSK_ALLOW_AUDIENCE,nPIdx2) == 1 then
		return nPIdx1,nPIdx2,nState,1;
	else
		return nPIdx1,nPIdx2,nState,0;
	end;
end;
--»ñµÃÄ¿±ê±ÈÎäµØÍ¼µÄµØÍ¼ID£¬Èç¹û·µ»ØµØÍ¼IDÎª0Ôò±íÊ¾¸Ã³¡µØÎ´¿ªÆô
function BWT_GetDesMapID(nCityID,nDirection,nNum)
	local nFieldID = TB_MAPID[nCityID][2];
	local tbMapID = gf_GetDataTable(GetSameMaps(nFieldID));
	local nMapID = 0;
	local nFieldDirection,nFieldNum = 0,0;
	for i=1,getn(tbMapID) do
		nMapID = tbMapID[i];
		nFieldDirection = mf_GetMissionV(MISSION_ID,MV_FIELD_DIRECTION,nMapID);
		nFieldNum = mf_GetMissionV(MISSION_ID,MV_FIELD_NUM,nMapID);
		if nFieldDirection == nDirection and nFieldNum == nNum then
			return nMapID;
		end;
	end;
	return 0;
end;
--¹ÛÖÚ¼ÓÈë¹Û¿´
function BWT_AudienceJoin(nCityID,nDirection,nNum,bAllow)
	if bAllow == 0 then
		Talk(1,"","Xin lçi! Ng­êi ch¬i ë Tû vâ tr­êng nµy kh«ng cho ng­êi kh¸c xem thi ®Êu.");
		return 0;
	end;
	local nMapID = BWT_GetDesMapID(nCityID,nDirection,nNum);
	local nState = mf_GetMissionV(MISSION_ID,MV_MISSION_STATE,nMapID);
	local nAudienceNum = mf_GetPlayerCount(MISSION_ID,AUDIENCE_CAMP,nMapID);
	if nState == MS_STATE_IDEL then
		Talk(1,"","Khu vùc nµy ®· bŞ ®ãng.");
		return 0;
	end;
	if nAudienceNum >= MAX_AUDIENCE_NUM then
		Talk(1,"","Sè l­îng ng­êi khu vùc nµy ®· ®¹t giíi h¹n tèi ®a: <color=yellow>"..MAX_AUDIENCE_NUM.."<color> ng­êi");
		return 0;
	end;
	mf_JoinMission(MISSION_ID,AUDIENCE_CAMP,nMapID);
end;
--´¦ÀíTrapµã¡£
--ÊäÈë²ÎÊıÎª·½Ïò¡£º¯ÊıÀïÃæ½øĞĞ³¡µØÄÚ´¦µÄÅĞ¶Ï
function BWT_ProcessTrap(nDirection)
	do
		return 0
	end
	if GetTaskTemp(TSK_TEMP_CAMP) == 0 then	--³¡ÍâTrapµã´¦Àí
		local selTab = {};
		local nCityID = 0;
		local nCurMapID = GetWorldPos();
		local nPIdx1,nPIdx2 = 0,0;
		local nState = 0;
		for i,v in TB_MAPID do
			if v[1] == nCurMapID then
				nCityID = i;
				break;
			end;
		end;
		for i=1,8 do
			nPIdx1,nPIdx2,nState,bAllow = BWT_GetMatchInfo(nCityID,nDirection,i);
			if nState > MS_STATE_IDEL then
				tinsert(selTab,format("Ta muèn vµo"..i.." - (khu thi ®Êu)/#BWT_AudienceJoin(%d,%d,%d,%d)",nCityID,nDirection,i,bAllow));
			end;
		end;
		if getn(selTab) == 0 then
			Talk(1,"","L«i ®µi nµy kh«ng cã ng­êi thi ®Êu");
			return 0;
		end;
		tinsert(selTab,"Kh«ng vµo xem/nothing");
		local tbDirection = {"H­íng ®«ng","H­íng nam","H­íng T©y","H­íng B¾c"};
		Say("B¹n muèn vµo khu vùc nµo trong <color=yellow>"..tbDirection[nDirection].."<color>?",getn(selTab),selTab);
	else	--³¡ÄÚTrapµã´¦Àí
		DelMSPlayer(MISSION_ID,AUDIENCE_CAMP);
	end;
end;

--¼ÇÂ¼Ê¤¸º£¬nResultTypeÎª1Ê±±íÊ¾Æ½¾Ö
function BWT_AddBiWuRecord(nWinnerIdx,nLoserIdx,nResultType)
	nResultType = nResultType or 0;
	local nOldPIdx = PlayerIndex;
	local nCurWeekWin = 0;
	local nCurXinDeNum = 0;
	local nCount = 0;
	PlayerIndex = nWinnerIdx;
	BWDH_SetTask(TASKID_BIWU_MATCH_RESULT, 1);
	BWDH_SetTask(TSK_CURWEEKMATCH,GetTask(TSK_CURWEEKMATCH)+1);
	BWDH_SetTask(TSK_TOTALMATCH,GetTask(TSK_TOTALMATCH)+1);
	if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --¼ÇÂ¼Ç°10³¡µÄÊ¤³¡Êı
		BWDH_SetTask(TASK_BIWU_WIN_10,GetTask(TASK_BIWU_WIN_10)+1);
	end
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --10³¡ºóÇ¿ÖÆµÇ¼Ç
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		SignUpGestResult();
	end
	if nResultType ~= 1 then
		nCurWeekWin = GetTask(TSK_CURWEEKWIN);
		BWDH_SetTask(TSK_TOTALWIN,GetTask(TSK_TOTALWIN)+1);
		BWDH_SetTask(TSK_CURWEEKWIN,nCurWeekWin+1);
		--³É¾Í---------------------------------------
--		BWDH_SetTask(TASKID_ACH_BIWU_WIN_TOTAL,GetTask(TASKID_ACH_BIWU_WIN_TOTAL)+1);
--		local nRoute = GetPlayerRoute();
--		local nLoseRoute = GetPlayerRoute(nLoserIdx);
--		if nRoute == 31 or nRoute == 32 then
--			BWDH_SetTask(TASKID_ACH_USE_NEW_ROUTE,GetTask(TASKID_ACH_USE_NEW_ROUTE)+1);
--		end
--		if nLoseRoute == 31 or nLoseRoute == 32 then
--			BWDH_SetTask(TASKID_ACH_WIN_NEW_ROUTE,GetTask(TASKID_ACH_WIN_NEW_ROUTE)+1);
--		end
		----------------------------------------------
--		if GLB_BW_BiWuCheck() == 1 then	
--			if GetTask(TSK_CURWEEKWIN) <= REQUIRE_MATCH_TIME then --Ç°10³¡ÓĞ
--				BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)+12);
--				Msg2Player("Äã»ñµÃ12µã¶ÔÕ½¾­Ñé£¬Ã¿ÈËÃ¿ÖÜ¿ÉÒÔ»ñµÃ120µã¶ÔÕ½¾­Ñé£¬ÄãÒÑ¾­»ñµÃÁË"..(GetTask(TSK_CURWEEKWIN)*12).."µã¶ÔÕ½¾­Ñé");
--			end
--		end
		WLZB_AddPoint();	-- baqizhi
	end;
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 and GLB_BW_BiWuCheck() == 1 then --°Ñ±äÁ¿Ğ´ÈëÊı¾İ¿â
		--GLB_BW_SetTask(0,0,tRelayTask);
		
		exgsvr_func_save_player_task()--ÏòÔ´·ş´æÅÌ
--		local nRoute = GetPlayerRoute();
--		if nRoute == 21 then --¶ñĞÄµÄ¹ÆÊ¦
--			GLB_BW_SetTask(0,1,tGushiTask);
--		end
--		GLB_BW_SetTask(0,2);--Í¬²½åĞÒ£±Ò
--		GLB_BW_SetTask(0,3);--Í¬²½åĞÒ£Óñ
	end
	WriteLog(format("[§¹i Héi Tû Vâ] [Role: %s Acc: %s  CÊp: %d  tİch ®iÓm: %d  m«n ph¸i: %d   KÕt qu¶: th¾ng Kı hiÖu hßa: %d]", GetName(), GetAccount(), GetLevel(),GetTask(TSK_CURREALRESULT),GetPlayerRoute(),nResultType));
	PlayerIndex = nLoserIdx;
	BWDH_SetTask(TASKID_BIWU_MATCH_RESULT, 0);
	BWDH_SetTask(TSK_CURWEEKMATCH,GetTask(TSK_CURWEEKMATCH)+1);
	BWDH_SetTask(TSK_TOTALMATCH,GetTask(TSK_TOTALMATCH)+1);
	if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --¼ÇÂ¼Ç°10³¡µÄ¸º³¡Êı
		BWDH_SetTask(TASK_BIWU_LOSE_10,GetTask(TASK_BIWU_LOSE_10)+1);
	end
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --10³¡ºóÇ¿ÖÆµÇ¼Ç
		BWDH_SetTask(TSK_CURSIGNEDRESULT,GetTask(TSK_CURREALRESULT));
		SignUpGestResult();
	end
	if nResultType ~= 1 then
		BWDH_SetTask(TSK_TOTALLOSE,GetTask(TSK_TOTALLOSE)+1);
		BWDH_SetTask(TSK_CURWEEKLOSE,GetTask(TSK_CURWEEKLOSE)+1);
		if GLB_BW_BiWuCheck() == 1 then
--			if GetTask(TSK_CURWEEKMATCH) <= REQUIRE_MATCH_TIME then --Ç°10³¡ÓĞ£¬ÒÑ¾­ĞŞ¸ÄÎªÊ§°ÜÃ»ÓĞÁË
--				BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)+8);
--				Msg2Player("Äã»ñµÃ8µã¶ÔÕ½¾­Ñé£¬Ã¿ÖÜµÄÇ°10³¡½ÏÒÕ¿ÉÒÔ»ñµÃ¶ÔÕ½¾­Ñé¡£");
--			end
		end
		WLZB_DecPoint();	-- baqizhi
	end;
	if nCurGs == 1 and GLB_BW_BiWuCheck() == 1 then --°Ñ±äÁ¿Ğ´ÈëÊı¾İ¿â
		exgsvr_func_save_player_task()--ÏòÔ´·ş´æÅÌ
--		GLB_BW_SetTask(0,0,tRelayTask);
--		local nRoute = GetPlayerRoute();
--		if nRoute == 21 then --¶ñĞÄµÄ¹ÆÊ¦
--			GLB_BW_SetTask(0,1,tGushiTask);
--		end
--		GLB_BW_SetTask(0,2);
--		GLB_BW_SetTask(0,3);
	end
	WriteLog(format("[§¹i Héi Tû Vâ] [Role: %s Acc: %s  CÊp: %d  tİch ®iÓm: %d  m«n ph¸i: %d   KÕt qu¶: b¹i Kı hiÖu hßa: %d]", GetName(), GetAccount(), GetLevel(),GetTask(TSK_CURREALRESULT),GetPlayerRoute(),nResultType));
	PlayerIndex = nOldPIdx;
end;
--»ñµÃÖÜÊı
function BWT_GetWeekNum()
--	local nCurTime = GetTime();
--	local nOffset = 8*3600*24+13*3600; 	--ÔİÊ±ÎÒ»¹Ã»ËãÃ÷°×
--	nCurTime = nCurTime - nOffset;
--	return floor(nCurTime/(7*3600*24));
	local nWeekNum = GetPlayerBwRank();
	return nWeekNum;
end;
--Ã¿ÖÜÒ»Çå¡£¼Ç×¡£ºplayerlogininÀï»¹ÓĞÒ»·İÒ»Ä£Ò»ÑùµÄ´úÂë
function BWT_WeeklyClear()
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then --¿ç·ş²»Äñ
		return 0;
	end
	local nWeekNum = BWT_GetWeekNum();
	local nBodyWeek = GetTask(TSK_BODY_WEEK);
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBodyWeek - nWeekNum >= 1 then	--ºÏ·şºónWeekNum»á´Ó0¿ªÊ¼
		WriteLog(format("[biwudahui] BWT_WeeklyClear [Role:%s Acc:%s Level:%d BodyWeek=%d WeekNum=%d repair BodyWeek ]", GetName(), GetAccount(), GetLevel(),nBodyWeek, nWeekNum))
		BWDH_SetTask(TSK_BODY_WEEK,nWeekNum-1);	--Í¬²½Íæ¼ÒÉíÉÏµÄÖÜÊı
		BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum-1);	--Í¬²½Íæ¼ÒÁìÈ¡½±ÀøµÄÖÜÊı
		nBodyWeek = nWeekNum-1;
	end;
	if nBodyWeek >= nWeekNum then
		return 0;
	end;
	BWT_PointAttenuation();
	BWDH_SetTask(TSK_CURWEEKMATCH,0);	--±¾ÖÜ×Ü²ÎÓë³¡´Î
	BWDH_SetTask(TSK_CURWEEKWIN,0);		--±¾ÖÜÊ¤Àû³¡´Î
	BWDH_SetTask(TSK_CURWEEKLOSE,0);		--±¾ÖÜÊ§°Ü³¡´Î
	BWDH_SetTask(TSK_CURWEEKGETXINDE,0);	--±¾ÖÜÍ¨¹ı½ÏÒÕ»ñµÃµÄĞÄµÃÊıÁ¿
	BWDH_SetTask(TSK_CURSIGNEDRESULT,0);	--µÇ¼Ç»ı·ÖÇå0
	BWDH_SetTask(TSK_GET_XINDE_STATE,0);	--±¾ÖÜ»ñµÃÊµÕ½ĞÄµÃÇé¿öÇå0
	BWDH_SetTask(TSK_USE_XINDE,0);		--±¾ÖÜÊ¹ÓÃÊµÕ½ĞÄµÃÇå£°
	BWDH_SetTask(TSK_BUY_HORSE,0);		--±¾ÖÜÂòÂíÇå£°
	BWDH_SetTask(TSK_USE_CHUANGONG_XINDE,0);	--Ê¹ÓÃ´«¹¦ĞÄµÃ
	BWDH_SetTask(TSK_XZ_AWARD_JUNGONG,0);	--±¾ÖÜ¶Ò»»µÄÕ½³¡½±Àø´ÎÊı
	BWDH_SetTask(TSK_XZ_AWARD_SHIMEN,0);		--±¾ÖÜ¶Ò»»µÄÊ¦ÃÅ½±Àø´ÎÊı
	BWDH_SetTask(TSK_XZ_AWARD_LINGSHI,0);	--±¾ÖÜ¶Ò»»µÄÁéÊ¯½±Àø´ÎÊı
	BWDH_SetTask(TSK_XZ_AWARD_JINGYAN,0);	--±¾ÖÜ¶Ò»»µÄ¾­Ñé½±Àø´ÎÊı
	BWDH_SetTask(TASK_BIWU_WIN_10,0);	--Ç°10³¡µÄÊ¤Àû³¡´Î
	BWDH_SetTask(TASK_BIWU_LOSE_10,0);	--Ç°10³¡µÄÊ§°Ü³¡´Î
	BWDH_SetTask(TASK_BIWU_GET_AWARD_10,0);	--ÊÇ·ñÁìÈ¡ÁËÇ°10³¡µÄ½±Àø
--	BWDH_SetTask(TASKID_3F_BW_AWARD,0); --Èı½Ú»î¶¯
	if GetTask(TSK_CURREALRESULT) < 200 then
		BWDH_SetTask(TSK_CURREALRESULT,200);	--µÍÓÚ100·ÖµÄ»Ø¹éµ½100·Ö
	end;
end;
--Ëø¶¨Óë½âËø×°±¸
function BWT_LockEquipment(bLock)
	local tbEquipPos = {0,1,2,3,4,5,6,7,8,10,17,18,19};
	for i=1,getn(tbEquipPos) do
		ForbidEquipSolt(tbEquipPos[i],bLock);
	end
end;
--¼ì²éÊÇ·ñÒª°Ñ¹ÛÖÚÌß³ö³¡µØ
function BWT_CheckKickAudience()
	local nPIdx1 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX1);
	local nPIdx2 = mf_GetMissionV(MISSION_ID,MV_PLAYERINDEX2);
	if nPIdx1 == 0 or nPIdx2 == 0 then
		return 0;
	end;
	if GetTask(TSK_ALLOW_AUDIENCE,nPIdx1) == 0 or GetTask(TSK_ALLOW_AUDIENCE,nPIdx2) == 0 then
		mf_Say2Camp(MISSION_ID,AUDIENCE_CAMP,"TuyÓn thñ thi ®Êu kh«ng muèn cã ng­êi xem, b¹n ®· tho¸t khái khu vùc thi ®Êu.",0,"");
		mf_DelAllMSPlayer(MISSION_ID,AUDIENCE_CAMP);
		return 1;
	end;
	return 0;
end;

--ĞŞ¸Ä½ÏÒÕ»ı·Ö
function BWT_AddPoint(nPoint,nPIdx)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	BWT_WeeklyClear();
	local nCurPoint = GetTask(TSK_CURREALRESULT);
	local nRegPoint = GetTask(TSK_CURSIGNEDRESULT);
	nCurPoint = nCurPoint + nPoint;
	BWDH_SetTask(TSK_CURREALRESULT,nCurPoint);
	if nPoint > 0 then
		BWDH_SetTask(TSK_TOTAL_POINT,GetTask(TSK_TOTAL_POINT)+nPoint);
	end;
	if GetTask(TSK_CURWEEKMATCH) >= REQUIRE_MATCH_TIME then --Èç¹ûµ±Ç°·ÖÊı±ÈÖ®Ç°µÇ¼ÇµÄ·ÖÊıÒªµÍ30·Ö
		BWDH_SetTask(TSK_CURSIGNEDRESULT,nCurPoint);
--		SignUpGestResult();	--Ç¿ÖÆ°Ñ·ÖÊıµÇ¼ÇÉÏÈ¥
--		gf_ShowMsg("Äúµ±Ç°µÄÕæÊµ»ı·Ö±ÈµÇ¼Ç»ı·ÖµÍÁË30·Ö»ò¸ü¶à£¬ËùÒÔÏµÍ³½øĞĞÇ¿ĞĞµÇ¼Ç£¬ÄúÏÖÔÚµÄµÇ¼Ç»ı·ÖÊÇ<color=yellow>"..nCurPoint.."<color>¡£",2);
	end;
	if GetTask(TSK_JOIN_LIST) == 1 then
		QuitGestConvention();
		JoinGestConvention();
	end;
	PlayerIndex = nOldPIdx;
end;
--»ı·Ö½øĞĞË¥¼õ
function BWT_PointAttenuation()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	local nBodyWeek = GetTask(TSK_BODY_WEEK);
	if nBodyWeek >= nWeekNum then
		return 0;
	end;
	local nCurPoint = GetTask(TSK_CURREALRESULT);
	local nWeekElapse = nWeekNum - nBodyWeek;
	local nAttenPoint = BWT_GetPointAttenuation(nCurPoint,nWeekElapse);
	if nCurPoint-nAttenPoint > 0 then
		Msg2Player("§iÓm tİch lòy tû vâ gi¶m"..(nCurPoint-nAttenPoint).." ®iÓm");
	end;
	BWDH_SetTask(TSK_CURREALRESULT,nAttenPoint);
	BWDH_SetTask(TSK_BODY_WEEK,nWeekNum);	--¼ÇÂ¼Ë¥¼õµÄÖÜÊı
	BWDH_SetTask(TSK_LASTWEEKLADDER,0);	--Ë¥¼õÊ±ÇåµôÉÏÖÜÅÅÃû
	if nBWRank ~= -1 and nBWRank <= 10 then	--Èç¹û½øÈëÁËÅÅĞĞ°ñ
		BWDH_SetTask(TSK_LASTWEEKLADDER,nBWRank);
		local nBestWeekRank = GetTask(TSK_HIGHESTWEEKLADDER);
		if nBestWeekRank == 0 or nBWRank < nBestWeekRank then
			BWDH_SetTask(TSK_HIGHESTWEEKLADDER,nBWRank);	--×î¸ßÖÜÅÅÃû
		end;
	end;
	WriteLog("["..LOG_HEAD.."]:"..GetName().."§iÓm tİch lòy tû vâ gi¶m. Tr­íc lóc gi¶m: "..nCurPoint..", sau khi gi¶m: "..nAttenPoint);
end;
--·â×°µÄQuitGestConvention
function BWT_QuitGestConvention(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	QuitGestConvention();
	BWDH_SetTask(TSK_JOIN_LIST,0);
--	if BWDH_DEBUG_VERSION == 1 then
--		Msg2Player("QuitGestConvention")
--	end
	PlayerIndex = nOldPIdx;
end;
--·â×°µÄJoinGestConvention
function BWT_JoinGestConvention(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nLevel = GetLevel();
	if nLevel >= MIN_LEVEL then
		JoinGestConvention();
		BWDH_SetTask(TSK_JOIN_LIST,1);
	end;
--	if BWDH_DEBUG_VERSION == 1 then
--		Msg2Player("JoinGestConvention")
--	end
	PlayerIndex = nOldPIdx;
end;
--±ÈÎä¿ªÊ¼Ê±¶ÔÍæ¼Ò½øĞĞµÄÉèÖÃ
function BWT_SetPlayerFightState(nCamp,nPIdx)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	PlayerIndex = nPIdx;
	BWT_LockEquipment(1);
	UseSkillEnable(1);
	DesaltPlayer(0,0);
	Restore();
	RestoreNeili();
	ClearColdDown();	--Çå³ıËùÓĞÒ©CD
	CastState("imme_clear_skill_interval",-1,0);	--Ïû³ıËùÓĞ¼¼ÄÜµÄÀäÈ´Ê±¼ä
	PlayerIndex = nOldPIdx;
end;
--ÉèÖÃÍæ¼ÒËæ»úÎ»ÖÃ
function BWT_SetRandomPos(nPIdx, nExcept)
	local nOldPIdx = PlayerIndex;
	nPIdx = nPIdx or PlayerIndex;
	PlayerIndex = nPIdx;
	local nRand = random(1,getn(TB_ENTRY[4]));
	if nExcept and nExcept == nRand then
		nRand = nRand + 1
		if nRand > getn(TB_ENTRY[4]) then
			nRand = 1
		end
	end
	SetPos(TB_ENTRY[4][nRand][1],TB_ENTRY[4][nRand][2]);
	Restore();
	RestoreNeili();
	PlayerIndex = nOldPIdx;
	return nRand
end;
--¼ÆËã»ı·ÖË¥¼õ£¬·µ»ØÖµÊÇ¾­¹ıË¥¼õºóµÄ»ı·Ö£¨Õâ¸öº¯ÊıÃûÆğµÃºÜÓĞÎÊÌâ°¡-_-b£©
function BWT_GetPointAttenuation(nPoint,nWeek)
	if nPoint <= 300 then
		return nPoint;
	end;
	for i=1,nWeek do
		if nPoint <= 300 then
			break;
		else
			nPoint = nPoint - floor((nPoint-300)/2);
		end;
	end;
	return nPoint;
end;
--»ñµÃ¡°Ò»ÖÜ¡±Ê£ÓàÊ±¼ä£¨µ¥Î»Ãë£©
function BWT_GetWeekTimeLeft()
	local nWeekDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));
	local nSecLeft = 60*60*24-(nHour*3600+nMin*60+nSec);
	local nTime = 0;
	if nWeekDay < 5 then
		nTime = (5-nWeekDay-1)*3600*24+nSecLeft+21*3600;
	elseif nWeekDay == 5 then
		nTime = 6*3600*24+nSecLeft+21*3600;
	else
		nTime = (11-nWeekDay)*3600*24+nSecLeft+21*3600;
	end;
	return nTime;
end;
--¼ì²éÊÇ²»ÊÇÔÚ±ÈÎäÊ±¼ä¶Î
function BWT_CheckBiWuTime()
--	local nWeekDay = tonumber(date("%w"));
--	if nWeekDay ~= 0 and nWeekDay ~= 1 and nWeekDay ~= 6 then
--		return 0;
--	end
	if BWDH_DEBUG_VERSION and BWDH_DEBUG_VERSION == 1 then
		return 1
	end
	
	local nHour = tonumber(date("%H"));
	--19µãÖÁ21µã
	if nHour >= 20 and nHour < 22 then
		return 1
	else
		return 0;
	end;
end;
--==========================================================================================
--ËµÃ÷Ïà¹ØµÄÄÚÈİ£¬»¹ÊÇĞ´ÔÚÒ»Æğ°É£¬²»È»¸ÄÀ´¸ÄÈ¥Ì«Âé·³ÁË
function know_detail()
	local selTab = {
				"§¹i héi tû vâ/know_detail_1",
				"So tµi/know_detail_2",
				"h¹ng/know_detail_3",
				"§iÓm/know_detail_4",
				--"½±Àø/know_detail_5",
				"Kh«ng cÇn/nothing",
				}
	Say(g_szInfoHead.."B¹n muèn biÕt ph­¬ng diÖn nµo?",getn(selTab),selTab);
end;

function know_detail_1()
	Talk(1,"know_detail",g_szInfoHead.."§¹i héi tû vâ\n    §¹i héi tû vâ lµ g×? §ã chİnh lµ cuéc thi do triÒu ®×nh tæ chøc nh»m tuyÓn chän nh©n sÜ vâ l©m ­u tó, ®­îc chia lµm 2 giai ®o¹n: Vßng lo¹i vµ vßng chung kÕt. NÕu b¹n muèn tham gia, cÇn ph¶i ®Õn BiÖn Kinh t×m §Æc Sø §¹i Héi Tû Vâ, ®ã lµ ng­êi ®­îc triÒu ®×nh ®Ò cö chuyªn phôc tr¸ch §¹i héi tû vâ.\n    ChØ cã ng­êi ch¬i chuyÓn sinh 5 cÊp 96 trë lªn míi cã thÓ tham gia §¹i héi tû vâ thiªn h¹ ®Ö nhÊt.");
end;

function know_detail_2()
	Talk(1,"know_detail_2_2",g_szInfoHead.."Tû vâ \n    Tû vâ nh­ thÕ nµo? Sau khi tû vâ liªn server më ra, ®Çu tiªn b¹n cÇn t×m ®¹i sø §¹i Héi Tû Vâ ®Ó ®Õn khu vùc tû vâ liªn server. Sau ®ã, sÏ cã thÓ ë giao diÖn §¹i Héi Tû Vâ chän tû vâ.\n   Muèn tû vâ rÊt ®¬n gi¶n, cø tõ 20:00-22:00, chØ cÇn b¹n ë trong khu vùc tû vâ liªn server, trong giao diÖn §¹i Héi Tû Vâ chän tû vâ lµ ®­îc råi, hÖ thèng sÏ tù ®éng gióp b¹n t×m ®èi thñ.\n   Chó ı, chØ cÇn t×m ®­îc ®èi thñ, hÖ thèng sÏ tù ®éng ®­a b¹n lªn l«i ®µi tû vâ.");
end;

function know_detail_2_1()
	Talk(1,"know_detail_2_2",g_szInfoHead.."NhËn th«ng tin thi ®Êu ë ®©u?\n    Khu vùc b¹n cã thÓ nhËn ®­îc th«ng tin thi ®Êu hiÖn cã:\n    TuyÒn Ch©u, T©y TuyÒn Ch©u, B¾c TuyÒn Ch©u, §«ng H¶i H¶i T©n 1, §«ng H¶i H¶i T©n 2, Long TuyÒn th«n, Vò Di s¬n, Thanh ¢m ®éng_1, Thanh ¢m ®éng_2, Thanh Khª ®éng, L­ìng Thñy ®éng_1, L­ìng Thñy ®éng_2, V­¬ng MÉu ®éng_1, V­¬ng MÉu ®éng_2, V©n Méng Tr¹ch, Giang T©n th«n, Phong §«, Phong Ma ®éng_1, Phong Ma ®éng_2, bªn ngoµi ®¹i héi tû vâ TuyÒn Ch©u.");
end;

function know_detail_2_2()
	Talk(2,"know_detail",g_szInfoHead.."Tû vâ nªn chó ı g×? \n     §Ó mäi ng­êi cã thÓ tû vâ trong mét m«i tr­êng c«ng b»ng, cho nªn ®¹t ra mét sè quy t¾c. Tr­íc khi tû vâ cÇn chó ı néi dung d­íi ®©y: \n1: khi ®­a vµo l«i ®µi tû vâ tÊt c¶ tr¹ng th¸i trªn ng­êi sÏ bŞ xãa, bao gåm pet ®i theo hoÆc thi thÓ do Ngò §éc Tµ HiÖp chiªu gäi còng bŞ xãa. \n2: ngoµi danh hiÖu s­ m«n ra, c¸c danh hiÖu kh¸c ®Òu v« hiÖu trong l«i ®µi tû vâ. \n3: Thuéc tİnh mçi 10 gi©y phôc håi sinh lùc vµ néi lùc trªn trang bŞ sÏ v« hiÖu\n","\n4: kh«ng thÓ ®æi trang bŞ, nh­ng cã thÓ ®æi mËt tŞch");
end;

function know_detail_3()
	Talk(1,"know_detail_3_1",g_szInfoHead.."XÕp h¹ng \n    	xÕp h¹ng thÕ nµo? nÕu b¹n tû vâ ®ñ 10 trËn hoÆc 10 trËn trë lªn trong tuÇn, hÖ thèng sÏ tù ®éng ®¨ng kı ®iÓm tİch lòy cña b¹n. ®¨ng kı ®iÓm tİch lòy th× cã thÓ tham gia xÕp h¹ng tuÇn nay. 11 giê 30 phót tèi chñ nhËt cña mçi tuÇn sÏ tiÕn hµnh xÕp h¹ng. <color=yellow> chó ı: ph¶i ®¶m b¶o tr­íc 11 giê 30 phót trë vÒ server nguån.<color>");
end;
function know_detail_3_1()
	Talk(1,"know_detail",g_szInfoHead.."XÕp h¹ng\n    XÕp h¹ng cã t¸c dông g×? nÕu xÕp h¹ng cã thÓ ®i vµo top 10 cña l­u ph¸i, th× ng­¬i cã thÓ nhËn ®­îc ®iÓm t­ c¸ch vµ gi¶i th­ëng; nÕu xÕp h¹ng ®Çu cña l­u ph¸i, th× chóc mõng ng­¬i, ng­¬i ®· lµ ®Ö nhÊt cao thñ cña l­u ph¸i m×nh tuÇn nay, sÏ nhËn ®­îc ®iÓm xÕp h¹ng cao nhÊt vµ gi¶i th­ëng nhiÒu nhÊt.\n    Gamer xÕp h¹ng tèt sÏ ®i vµo b¶ng xÕp h¹ng ®¹i héi tû vâ liªn server.nÕu ng­¬i ch­a vµo top 10 cña l­u ph¸i m×nh, ®õng n¶n lßng, chØ cÇn tû vâ ®ñ 10 trËn trong tuÇn nay,còng cã thÓ nhËn th­ëng.nhËn th­ëng t¹i giao diÖn ®¹i héi tû vâ,click nhËn gi¶i th­ëng tiÕn hµnh thao t¸c t­¬ng quan.");
end;

function know_detail_4()
	Talk(1,"know_detail",g_szInfoHead.."XÕp h¹ng \n    §iÓm lµ g×? §iÓm cña §¹i Héi Tû Vâ cã 2 lo¹i, mét lo¹i lµ ®iÓm tİch lòy tû vâ, mét lo¹i lµ ®iÓm t­ c¸ch. \n ®iÓm tİch lòy tû vâ lµ ®iÓm t¨ng vµ gi¶m khi tû vâ nhËn ®­îc, hÖ thèng ®¨ng kı xong sÏ xÕp h¹ng theo ®iÓm nµy, nÕu ®iÓm v­ît qua 300, mçi tuÇn nh÷ng ®iÓm v­ît qua 300 ®ã sÏ bŞ gi¶m nöa.");
end;

--function know_detail_5()
--	Talk(1,"know_detail_5_1",g_szInfoHead.."½±Àø·ÖÒÔÏÂ¼¸ÖÖ£º\n    ¾­Ñé£º¿ªÆô¿ç·ş±ÈÎä´ó»áÔ¤Ñ¡ÈüÖ®ºó£¬¸ù¾İÃ¿ÖÜ²Î¼Ó±ÈÎäµÄÇ°10³¡½ÏÒÕ½á¹û£¬ÔÚ±¾	·ş±ÈÎä´ó»á½çÃæÁìÈ¡¡°ÊµÕ½ĞÄµÃ¡±¡£Ã¿ÖÜ´Ó½ÏÒÕÖĞ×î¶à¿ÉÒÔÄÃµ½20±¾¡°ÊµÕ½ĞÄµÃ¡±¡£\n    »ı·Ö´ïµ½120·Ö¿ÉÒÔÔÚ±ÈÎä½çÃæÁìÈ¡10±¾ÊµÕ½ĞÄµÃ£¬»ı·Ö´ïµ½150·Ö¿ÉÒÔ¶àÁìÈ¡10	±¾ÊµÕ½ĞÄµÃ£¬»ı·Ö´ïµ½200·Ö¿ÉÒÔÔÙÁìÈ¡10±¾ÊµÕ½ĞÄµÃ¡£\n    Ã¿ÖÜ×î¶à¿É»»È¡50±¾¡°ÊµÕ½ĞÄµÃ¡±£¬Ã¿ÖÜ¿ÉÒÔÊ¹ÓÃ100±¾¡°ÊµÕ½ĞÄµÃ¡±¡£");
--end;
--
--function know_detail_5_1()
--	Talk(1,"know_detail_5_2",g_szInfoHead.."    ¿Ì°å£º²Î¼Ó¿ç·ş±ÈÎä´ó»áÔ¤Ñ¡Èü£¬¸ù¾İ±¾ÖÜµÄÊ¤³¡Êı¿ÉÔÚ±ÈÎä´ó»á½çÃæÁìÈ¡Ê×ÊÎÀà»¨	ÎÆ¿Ì°å½±Àø¡£Ã¿ÈËÃ¿ÖÜ×î¶à¿É»ñµÃ10³¡Ê¤³¡½±Àø¡£\n    ¶ÔÕ½¾­Ñé£º²Î¼Ó¿ç·ş±ÈÎä´ó»áÔ¤Ñ¡Èü£¬»ñÊ¤ºó¿É»ñµÃ¶ÔÕ½¾­Ñé¡£Ã¿ÈËÃ¿ÖÜ×î¶à¿É»ñµÃ	10³¡Ê¤³¡µÄ¶ÔÕ½¾­Ñé¡£¶ÔÕ½¾­Ñé¿ÉÔÚ±ÈÎä´ó»á½çÃæ¡°¶Ò»»×°±¸¡±´¦¶Ò»»Ê×ÊÎÀà»¨ÎÆ¿Ì°å¡£");
--end;
--
--function know_detail_5_2()
--	Talk(1,"know_detail",g_szInfoHead.."    ³ÆºÅ£º»ı·ÖÅÅÃûµ½Ç°10¾ÍÓĞ×¨ÃÅµÄ³ÆºÅ£¬µÚ1ÃûÒ»µµ£¬µÚ2¡¢3ÃûÒ»µµ£¬µÚ4ÖÁ10ÃûÒ»µµ¡£²»Í¬µµ´ÎµÄ³ÆºÅ»á¸½´øÒ»¶¨µÄÄÜÁ¦¼Ó³É¡£\n    ×øÆï£ºÖ»ÒªÄÃµ½±¾Á÷ÅÉµÄÇ°3Ãû£¬¾ÍÓĞ×Ê¸ñÁìÈ¡ÌØ¶¨×øÆï£º×¦»Æ·Éµç»ò³àÍÃ£¬±¾Á÷ÅÉµÄµÚ1Ãû£¬¿ÉÒÔÃâ·Ñ×âÓÃ×¦»Æ·Éµç»ò³àÍÃ¡£\n    ×âµ½µÄÉñ¾ÔÄÜ¹»Î¬³Ö7Ìì¡£");
--end
--===========================================================================================
--½±ÀøµÄÒ²·ÅÕâÀï°É£¬²»È»ÒªĞŞ¸ÄÁ½¸öµØ·½Ì«Âé·³ÁË¡£
function BWT_GetAward()
	BWT_WeeklyClear();
	local strtab = {
		"NhËn th­ëng tû vâ tuÇn nµy/BWT_GetWeekAward",
		"NhËn th­ëng xÕp h¹ng tuÇn tr­íc/BWT_GetRankAward",
--		"ÁìÈ¡Çø·ş½±Àø/BWT_GetGlobalAward",
		"KÕt thóc ®èi tho¹i/nothing"
	};
	Say(g_szInfoHead.."B¹n muèn nhËn th­ëng lo¹i nµo?",
		getn(strtab),
		strtab)
end;

function BWT_GetWeekAward()
	local strtab = {
		"NhËn th­ëng trËn tham gia/BWT_GetWeekAward_Win",
		--"ÁìÈ¡±ÈÎä»ı·ÖµÄ½±Àø/BWT_GetWeekAward_Point",
		--"ÁìÈ¡½£ÏÀ±Ò½±Àø/BWT_GetWeekAward_Gold",
		"KÕt thóc ®èi tho¹i/nothing",
	}
	local nDate = tonumber(date("%Y%m%d"));
--	if nDate <= 20101010 then
--		tinsert(strtab,3,"ÁìÈ¡ÑÌ»ğ²ÄÁÏ°ü/BWT_GetYanhuo");
--	end
	Say(g_szInfoHead.."B¹n muèn nhËn th­ëng lo¹i nµo?",
		getn(strtab),
		strtab)
end

function BWT_GetWeekAward_Gold()
	if GetTask(TSK_CURWEEKWIN) < 10 then
		Talk(1,"",g_szInfoHead.."§¹i Héi Tû Vâ tuÇn nµy kh«ng th¾ng ®ñ 10 trËn, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end
	if gf_GetTaskByte(TASK_BIWU_GET_AWARD_10,2) ~= 0 then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn phÇn th­ëng Vµng vâ l©m cña tuÇn nµy.");
		return 0;
	end
	gf_SetTaskByte(TASK_BIWU_GET_AWARD_10,2,1, TASK_ACCESS_CODE_BIWUDAHUI);
	gf_SetLogCaption("§¹i Héi Tû Vâ-PhÇn th­ëng Vµng vâ l©m");
	gf_Modify("Money",300000);
	gf_SetLogCaption("");
end

function BWT_GetWeekAward_Win()
	if GetTask(TSK_CURWEEKMATCH) < REQUIRE_MATCH_TIME then
		Talk(1,"",g_szInfoHead.."Sè lÇn ng­¬i tham gia so tµi tuÇn nµy İt h¬n <color=yellow>"..REQUIRE_MATCH_TIME.."<color> trËn, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end
	if gf_GetTaskByte(TASK_BIWU_GET_AWARD_10,1) ~= 0 then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn th­ëng trËn tham gia tuÇn tr­íc.");
		return 0;
	end
	
	local nExp = 20000000 --* GetTask(TASK_BIWU_WIN_10) / REQUIRE_MATCH_TIME
--	local nCount = GetTask(TASK_BIWU_WIN_10)*2+GetTask(TASK_BIWU_LOSE_10);
--	local nRingCount = min(GetTask(TSK_CURWEEKWIN),10)*4;  --Ã¿ÖÜ×î¶à»ñµÃ10³¡Ê¤ÀûµÄ¿Ì°å
	if nExp > 0 then
		if gf_Judge_Room_Weight(3,10,"") ~= 1 then
			return 0;
		end
		gf_SetTaskByte(TASK_BIWU_GET_AWARD_10,1,1, TASK_ACCESS_CODE_BIWUDAHUI);
		--soul_GivePoint(GetTask(TSK_CURWEEKWIN) * 10);
		gf_SetLogCaption("§¹i Héi Tû Vâ-PhÇn th­ëng trËn tham gia")
		--gf_AddItemEx({2,1,1101,nCount},"ÊµÕ½ĞÄµÃ");
		--gf_AddItemEx({2,95,1511,10,4},"¶·ÆÇÁî");
--		if GLB_BW_BiWuCheck() == 1 then
--			gf_AddItemEx({2,95,595,nRingCount},"1¼¶½äÖ¸ÎÆÊÎ¿Ì°å");
----			EarnXYY(10);
--		end
		--gf_Modify("Pvp",2400);
		--gf_Modify("Dzjy",2400);
		gf_Modify("Exp",nExp);
		gf_AddItemEx({2,1,30499,2},"Hu©n ch­¬ng anh hïng");
		gf_AddItemEx({2,1,30692,10},"R­¬ng §¹i Héi Tû Vâ");
		AddRuntimeStat(20, 1, 0, 1)
		AddRuntimeStat(20, 4, 0, 10)
		gf_SetLogCaption("");
		--Observer:onEvent(OE_BIWU_MATCH,{GetTask(TSK_CURWEEKMATCH),GetTask(TASK_BIWU_WIN_10),GetTask(TASK_BIWU_LOSE_10)});
	end;
end

function BWT_GetYanhuo()
--	local nDate = tonumber(date("%Y%m%d"));
--	if nDate <= 20101010 then
--		local nCurAward = GetTask(TASKID_3F_BW_AWARD);
--		local nCurMatch = GetTask(TSK_CURWEEKMATCH);
--		if nCurAward < 30 then
--			local nCurCount = min(nCurMatch,30) - nCurAward
--			if nCurCount > 0 then
--				BWDH_SetTask(TASKID_3F_BW_AWARD,GetTask(TASKID_3F_BW_AWARD)+nCurCount);
--				gf_SetLogCaption("3f2010.±ÈÎä´ó»á")
--				gf_AddItemEx({2,95,738,nCurCount},"ÑÌ»ğ²ÄÁÏ°ü");
--				Msg2Player("Ã¿1³¡±ÈÎä¿É»ñµÃ1¸öÑÌ»ğ²ÄÁÏ°ü£¬Ã¿ÖÜ×î¶à»»È¡30¸ö£¡");
--				gf_SetLogCaption("");
--			else
--				Talk(1,"",g_szInfoHead.."ÁìÈ¡ÑÌ»ğ²ÄÁÏ°üÊıÁ¿µÈÓÚµ±ÖÜ²Î¼Ó±ÈÎä´ó»áµÄ³¡´ÎÊıÁ¿£¬Ã¿ÖÜ×î¶à»»È¡30¸ö£¡Ä¿Ç°ÄãÃ»ÓĞĞÂµÄÑÌ»ğ²ÄÁÏ°ü¿ÉÒÔÁìÈ¡£¬±¾ÖÜÄãÒÑ¾­ÁìÈ¡ÁË"..nCurAward.."¸öÑÌ»ğ²ÄÁÏ°ü¡£")
--			end
--		else
--			Talk(1,"",g_szInfoHead.."Ã¿ÖÜ×î¶à»»È¡30¸ö£¡±¾ÖÜÄãÒÑ¾­ÁìÈ¡ÍêÁË£¬ÏÂÖÜÔÙÀ´°É¡£");
--		end
--	end
end

function BWT_GetWeekAward_Point()
	if GetTask(TSK_CURWEEKMATCH) < REQUIRE_MATCH_TIME then
		Talk(1,"",g_szInfoHead.."Sè lÇn ng­¬i tham gia so tµi tuÇn nµy İt h¬n <color=yellow>"..REQUIRE_MATCH_TIME.."<color> trËn, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end
	local nRegPoint = GetTask(TSK_CURREALRESULT); --Ê¹ÓÃÊµ¼ÊµÄ½ÏÒÕ·ÖÊı
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	local nCount = 0;
	if nRegPoint >= 200 and nGetXinDeState < 30 then
		BWDH_SetTask(TSK_GET_XINDE_STATE,30);
		nCount = 30 - nGetXinDeState;
	elseif nRegPoint >= 150 and nGetXinDeState < 20 then
		nCount = 20 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,20);
	elseif nRegPoint >= 120 and nGetXinDeState < 10 then
		nCount = 10 - nGetXinDeState;
		BWDH_SetTask(TSK_GET_XINDE_STATE,10);
	end;

	local szString1,szString2,szString3 = "","","";
	local nGetXinDeState = GetTask(TSK_GET_XINDE_STATE);
	if nGetXinDeState == 30 then
		szString1 = "<color=red>§· l·nh<color>";
		szString2 = "<color=red>§· l·nh<color>";
		szString3 = "<color=red>§· l·nh<color>";
	elseif nGetXinDeState == 20 then
		szString1 = "<color=red>§· l·nh<color>";
		szString2 = "<color=red>§· l·nh<color>";
		szString3 = "<color=yellow>Ch­a l·nh<color>";
	elseif nGetXinDeState == 10 then
		szString1 = "<color=red>§· l·nh<color>";
		szString2 = "<color=yellow>Ch­a l·nh<color>";
		szString3 = "<color=yellow>Ch­a l·nh<color>";
	else
		szString1 = "<color=yellow>Ch­a l·nh<color>";
		szString2 = "<color=yellow>Ch­a l·nh<color>";
		szString3 = "<color=yellow>Ch­a l·nh<color>";
	end;

	if nCount > 0 then
		gf_AddItemEx({2,1,1101,nCount},"Thùc chiÕn t©m ®¾c");
		Talk(1,"",g_szInfoHead.."T×nh h×nh nhËn th­ëng nh­ sau:\n§iÓm tİch lòy ®¹t 120 nhËn ®­îc 10 Thùc ChiÕn T©m §¾c       "..szString1.."\n§iÓm tİch lòy ®¹t 150 nhËn tiÕp 10 Thùc ChiÕn T©m §¾c     "..szString2.."\n§iÓm tİch lòy ®¹t 200 nhËn thªm 10 Thùc ChiÕn T©m §¾c     "..szString3);
	else
		Talk(1,"",g_szInfoHead.."T×nh h×nh nhËn th­ëng nh­ sau:\n§iÓm tİch lòy ®¹t 120 nhËn ®­îc 10 Thùc ChiÕn T©m §¾c       "..szString1.."\n§iÓm tİch lòy ®¹t 150 nhËn tiÕp 10 Thùc ChiÕn T©m §¾c     "..szString2.."\n§iÓm tİch lòy ®¹t 200 nhËn thªm 10 Thùc ChiÕn T©m §¾c     "..szString3);
	end;
end

function BWT_GetRankAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."XÕp h¹ng ®iÓm tİch lòy tuÇn tr­íc kh«ng n»m trong 10 h¹ng ®Çu nªn kh«ng ®­îc nhËn phÇn th­ëng.");
		return 0;
	end;
	local selTab = {};
--	tinsert(selTab,"ÎÒÒªÁìÈ¡³ÆºÅ/BWT_GetTitleAward");
--	tinsert(selTab,"ÎÒÒªÁìÈ¡ÎäÆ÷ÌØĞ§/BWT_GetWeaponEffectAward");
--	if nBWRank <= 3 then	--Ç°£³Ãû¿ÉÒÔÂòÂí
--		tinsert(selTab,"ÎÒÒª×âÓÃ×øÆï/BWT_GetHorseAward");
--	end;
	tinsert(selTab,format("Gi¶i th­ëng xÕp h¹ng/#BWT_GetRankAward_Exp(%d)", nBWRank));
	tinsert(selTab,"T¹m thêi kh«ng l·nh/nothing");
	Say(g_szInfoHead.."XÕp h¹ng ®iÓm tİch lòy tuÇn tr­íc lµ h¹ng <color=yellow>"..nBWRank.."<color>, b¹n muèn nhËn phÇn th­ëng nµo?",getn(selTab),selTab);
	BWT_PointAttenuation();
end

function BWT_GetRankAward_Exp(nBWRank)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if GetTask(TSK_GET_AWARD_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn phÇn th­ëng.");
		return 0;
	end;
	if nBWRank >= 1 and nBWRank <= 10 then
		local nExp = 100000000--(11 - nBWRank)*10000*10000
		gf_SetLogCaption("Gi¶i th­ëng xÕp h¹ng mçi tuÇn §¹i Héi Tû Vâ")
		BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum);
		gf_Modify("Exp",nExp);
		gf_AddItemEx({2,1,30499,6},"Hu©n ch­¬ng anh hïng");
		gf_AddItemEx({2,1,30692,30},"R­¬ng §¹i Héi Tû Vâ");
		AddRuntimeStat(20, 2, 0, 1)
		AddRuntimeStat(20, 4, 0, 30)
		
		gf_SetLogCaption("");
	end
end

function BWT_GetWeaponEffectAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."XÕp h¹ng ®iÓm tİch lòy tuÇn tr­íc kh«ng n»m trong 10 h¹ng ®Çu nªn kh«ng ®­îc nhËn phÇn th­ëng.");
		return 0;
	end;
	local nCheckRoute,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRoute == 0 then
		return 0;
	end;
	if GetTask(TSK_WEAPON_EFFECT_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn phÇn th­ëng.");
		return 0;
	end;
	local nWeaponIdx = GetPlayerEquipIndex(2)
	--ÎäÆ÷×°±¸ÅĞ¶Ï
	if  nWeaponIdx == 0 then
		Talk(1,"",g_szInfoHead.."H·y trang bŞ vò khİ tr­íc råi ®Õn t×m ta!")
		return 0;
	end
	local nType = 0;
	if nBWRank == 1 then	--Èç¹ûÊÇµÚÒ»Ãû
		nType = 1;
	else
		nType = 2;
	end;
	local selTab = {
				"§ång ı/#BWT_AddWeaponEffect("..nType..")",
				"Hñy bá/nothing",
				}
	Say(g_szInfoHead.."NhËn danh hiÖu ®¹i héi tû vâ sÏ <color=yellow>che mÊt danh hiÖu s­ m«n hoÆc danh hiÖu ®¹i héi vâ l©m cïng lo¹i cña b¹n<color>, b¹n x¸c nhËn muèn nhËn phÇn th­ëng danh hiÖu cña ®¹i héi tû vâ?",getn(selTab),selTab);
end;

function BWT_AddWeaponEffect(nType)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."XÕp h¹ng ®iÓm tİch lòy tuÇn tr­íc kh«ng n»m trong 10 h¹ng ®Çu nªn kh«ng ®­îc nhËn phÇn th­ëng.");
		return 0;
	end;
	local nWeaponIdx = GetPlayerEquipIndex(2);
	--ÎäÆ÷×°±¸ÅĞ¶Ï
	if  nWeaponIdx == 0 then
		Talk(1,"",g_szInfoHead.."H·y trang bŞ vò khİ tr­íc råi ®Õn t×m ta!")
		return 0;
	end
	local tbWeaponEffect = {"Ph¸ Qu©n","Tinh Di"};
	local szWeaponEffectName = tbWeaponEffect[nType];
	BWDH_SetTask(TSK_WEAPON_EFFECT_WEEK,nWeekNum);
	BindWeaponEffect(szWeaponEffectName,7*24*3600);
	Msg2Player("B¹n ®· nhËn hiÖu øng cña vò khİ:"..szWeaponEffectName..", thêi gian duy tr× lµ 7 ngµy.");
	WriteLog("["..LOG_HEAD.."]:"..GetName().."§· nhËn th­ëng hiÖu øng cña vò khİ:"..szWeaponEffectName);
end;

function BWT_GetTitleAward()
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."XÕp h¹ng ®iÓm tİch lòy tuÇn tr­íc kh«ng n»m trong 10 h¹ng ®Çu nªn kh«ng ®­îc nhËn phÇn th­ëng.");
		return 0;
	end;
	local nCheckRoute,nRoutePos = gf_CheckPlayerRoute();
	if nCheckRoute == 0 then
		return 0;
	end;
	if GetTask(TSK_GET_AWARD_WEEK) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn phÇn th­ëng.");
		return 0;
	end;
	local nTitleGenre = 0;
	if nRoutePos == 2 then	--°¦£¬ÓÉÓÚÅäÖÃ±íÌî´íÁË£¬Ö»ºÃ½«´í¾Í´íÁË
		nRoutePos = 3;
	elseif nRoutePos == 3 then
		nRoutePos = 2;
	end;
	if nBWRank == 1 then	--Èç¹ûÊÇµÚÒ»Ãû
		if nBWLevel == 0 then	--Èç¹ûÊÇĞÂĞã±ÈÎä´ó»á
			nTitleGenre = 27;
		else	--Èç¹ûÊÇÌìÏÂµÚÒ»±ÈÎä´ó»á
			nTitleGenre = 28;
		end;
	elseif nBWRank <= 3 then
		nTitleGenre = 26;
	elseif nBWRank <= 10 then
		nTitleGenre = 25;
	end;
	local selTab = {
				"§ång ı/#BWT_AddBiWuTitle("..nTitleGenre..","..nRoutePos..")",
				"Hñy bá/nothing",
				}
	Say(g_szInfoHead.."NhËn danh hiÖu ®¹i héi tû vâ sÏ <color=yellow>che mÊt danh hiÖu s­ m«n hoÆc danh hiÖu ®¹i héi vâ l©m cïng lo¹i cña b¹n<color>, b¹n x¸c nhËn muèn nhËn phÇn th­ëng danh hiÖu cña ®¹i héi tû vâ?",getn(selTab),selTab);
end;

function BWT_AddBiWuTitle(nID1,nID2)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBWRank == -1 or nBWRank > 10 then
		Talk(1,"",g_szInfoHead.."XÕp h¹ng ®iÓm tİch lòy tuÇn tr­íc kh«ng n»m trong 10 h¹ng ®Çu nªn kh«ng ®­îc nhËn phÇn th­ëng.");
		return 0;
	end;
	local nTimeLeft = 7*24*3600;
	BWT_RemoveOtherBiWuTitle(nID2);
	AddTitle(nID1,nID2);
	SetTitleTime(nID1, nID2, GetTime() + nTimeLeft);
	SetCurTitle(nID1, nID2);
	BWDH_SetTask(TSK_GET_AWARD_WEEK,nWeekNum);
	WriteLog("["..LOG_HEAD.."]:"..GetName().."NhËn phÇn th­ëng danh hiÖu ®¹i héi tû vâ. ID danh hiÖu: "..nID1..", "..nID2);
end;

function BWT_RemoveOtherBiWuTitle(nRoutePos)
	for i=23,28 do
		if IsTitleExist(i,nRoutePos) == 1 then
			RemoveTitle(i,nRoutePos);
		end;
	end;
end;

function BWT_GetHorseAward()
	if GetTask(TSK_BUY_HORSE) ~= 0 then
		Talk(1,"","TuÇn nµy b¹n ®· thuª thó c­ìi, kh«ng thÓ thuª n÷a.");
		return 0;
	end;
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	local selTab = {};
	if nBWLevel == 0 then
		tinsert(selTab,"Thuª Xİch Kı (Tèc ®é 30, phİ thuª 10 vµng)/#BWT_BuyHorse(1)");
		tinsert(selTab,"Thuª Hoµng Kı (Tèc ®é 30, phİ thuª 10 vµng)/#BWT_BuyHorse(2)");
	else
		tinsert(selTab,"Thuª Tr¶o Hoµng Phi §iÖn (Tèc ®é 40, phİ thuª 20 vµng)/#BWT_BuyHorse(3)");
		tinsert(selTab,"Thuª Xİch Thè (Tèc ®é 40, phİ thuª 20 vµng)/#BWT_BuyHorse(4)");
	end;
	tinsert(selTab,"Kh«ng thuª/nothing");
	if nBWRank > 0 and nBWRank <= 3 then
		Say(g_szInfoHead.."XÕp h¹ng tİch lòy tuÇn tr­íc cña b¹n n»m trong 3 h¹ng ®Çu, xÕp thø <color=yellow>"..nBWRank.."<color>, b¹n cã thÓ thuª nh­ng lo¹i thó c­ìi ë bªn trªn. B¹n muèn thuª lo¹i nµo? <color=red>Chó ı: H¹n sö dông lµ 7 ngµy, yªu cÇu nh©n vËt cÊp 80 míi ®­îc dïng<color>. <color=yellow>NÕu b¹n h¹ng 1 l­u ph¸i th× ®­îc thuª thó c­ìi miÔn phİ.<color>",getn(selTab),selTab);
	else
		Talk(1,"",g_szInfoHead.."Xin lçi! TuÇn tr­íc b¹n kh«ng ®¹t 3 h¹ng ®Çu cña l­u ph¸i, kh«ng thÓ thuª thó c­ìi. Chóc b¹n may m¾n.");
	end;
end;

g_tbHorseInfo =
{	--IDĞÅÏ¢£¬¼Û¸ñ£¬³ÖĞøÌìÊı
	[1] = {{0,105,5,"Xİch Kı"},10,7},
	[2] = {{0,105,6,"Hoµng Kı"},10,7},
	[3] = {{0,105,10,"Tr¶o Hoµng Phi §iÖn"},20,7},
	[4] = {{0,105,12,"Xİch Thè"},20,7},
}

function BWT_BuyHorse(nType)
	local nWeekNum,nBWLevel,nBWRank = GetPlayerBwRank();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	if nBWRank <= 0 or nBWRank > 3 then
		Talk(1,"",g_szInfoHead.."XÕp h¹ng tİch lòy tuÇn tr­íc n»m trong <color=yellow>3 h¹ng ®Çu<color> míi cã thÓ thuª thó c­ìi.");
		return 0;
	end;
	if gf_JudgeRoomWeight(2,100,"") == 0 then
		return 0;
	end;
	local nNeedMoney = g_tbHorseInfo[nType][2];
	if nBWRank ~= 1 then	--Èç¹û²»ÊÇµÚ1Ãû¾ÍÒª¸øÇ®£¡
		if GetCash() < nNeedMoney*10000 then
			Talk(1,"","Ng©n l­îng cña b¹n kh«ng ®ñ, b¹n cÇn <color=yellow>"..nNeedMoney.."<color> l­îng míi ®­îc thuª ngùa nµy.");
			return 0;
		end;
		Pay(nNeedMoney*10000);
	end;
	local nItemIdx = 0;
	local nTimeLeft = 7*24*3600;
	local nID1,nID2,nID3 = g_tbHorseInfo[nType][1][1],g_tbHorseInfo[nType][1][2],g_tbHorseInfo[nType][1][3];
	local szHorseName = g_tbHorseInfo[nType][1][4];
	local nLastDay = g_tbHorseInfo[nType][3];
	_,nItemIdx = AddItem(nID1,nID2,nID3,1,1,-1,-1,-1,-1,-1,-1);
	SetItemExpireTime(nItemIdx,nLastDay*24*3600);
	Msg2Player("B¹n nhËn ®­îc 1 "..szHorseName..", thêi h¹n "..nLastDay.."Thiªn");
	BWDH_SetTask(TSK_BUY_HORSE,1);
	WriteLog("["..LOG_HEAD.."]:"..GetName().."Thuª 1 con ngùa: "..szHorseName);
end;
--»ñµÃÄ³¸öÍæ¼ÒµÄÖ°ÒµÃû×Ö
function BWT_GetPlayerRouteName(nPIdx)
	local nOldPIdx = PlayerIndex;
	local szRouteName = "";
	PlayerIndex = nPIdx;
	szRouteName = gf_GetRouteName(GetPlayerRoute());
	PlayerIndex = nOldPIdx;
	return szRouteName;
end;
--ÒÆ³ı·Ç·¨µÄ×´Ì¬
function BWT_RemoveNonlicetState()
	local tbNonlicet =
	{
		[1] = {9901,9906},
		[2] = {19801279,19801281},
	}
	for i=1,getn(tbNonlicet) do
		for j=tbNonlicet[i][1],tbNonlicet[i][2] do
			RemoveState(j);
		end;
	end;
end;
--»ñÈ¡Íæ¼ÒÃû×Ö
function BWT_GetName(nPIdx)
	nPIdx = nPIdx or PlayerIndex;
	local nOldPIdx = PlayerIndex;
	local szName = "";
	PlayerIndex = nPIdx;
	if GetMaskStatus() == 1 then
		szName = "Ng­êi thÇn bİ";
	else
		szName = GetName();
	end;
	PlayerIndex = nOldPIdx;
	return szName;
end;
function nothing()

end;

--===============ÒÔÏÂÎª´¦Àí¿ç·ş±ÈÎäº¯Êı======================
tGsName = {
--	{"1-1","ÌÒ»¨µº"},
--	{"1-2","ÎäÒÄÉ½"},
--	{"1-4","ÁúÃÅÕò"},
--	{"1-7","Ò©Íõ¹È"},
--	{"1-10","ÔÆÃÎÔó"},
--	{"1-11","±ùĞÄ¶´"},
--	{"1-12","Çå·ç¸ó"},
--	{"1-13","×ÏÔÆĞù"},
--	{"1-14","ÎäÁÖÃË"},
--	{"2-1","ÎâÔ½ÀÏ×æ"},
--	{"2-3","ÂÌÁÖÃËÖ÷"},
--	{"2-4","Ç¹ÉñÙøÌì"},
--	{"3-1","ÌìÊ¦ÃØ¾³"},
--	{"3-3","ÍõÆì²¿Âä"},
--	{"3-7","½£ÃÅ·ÉÑ©"},
--	{"3-9","½£¸óÊñµÀ"},
--	{"3-10","Â¥À¼ÏşÔÂ"},
--	{"4-1","ÂäĞÇ³½"},
};

--ÊÇ·ñ¿ªÆôÁË¿ç·ş±ÈÎä
--ĞÂ·ş¿ªÆôĞèÒªÊÖ¶¯ĞŞ¸Ä»¹Òª¸ÄÉÏÃæµÄrelayÃû
function GLB_BW_BiWuCheck()
	return 1;
end

tBwChangeItem = {
--	{30,{{2,95,596,1},"2¼¶Ê×ÊÎÎÆÊÎ°ü"}},
--	{5, {{2,95,839,1},"Ì«Ê¼Ê¯"}},
--	{30,{{2,95,739,1},"±ÈÎäÉñÃØÀñºĞ"}},
};
g_TempItemName = "Kinh nghiÖm ®èi chiÕn ";
--¶ÔÕ½¾­Ñé¶Ò»»×°±¸
function GLB_BW_ChangeItem()
	local strtab = {};
	for i = 1,getn(tBwChangeItem) do
		tinsert(strtab,"§ång ı"..tBwChangeItem[i][1]..g_TempItemName.."§æi"..tBwChangeItem[i][2][2].."/#GLB_BW_AskChange("..i..")");
	end
--	tinsert(strtab, "ÎÒÒªÁìÈ¡Ò«ÑôÁî»òğ©ÔÂÁî	/GLB_BW_Award_Ling");
--	tinsert(strtab, "ÎÒÒªÊ¹ÓÃÒ«ÑôÁî»òğ©ÔÂÁî¶Ò»»Åû·ç»ò»ÕÕÂ		/#GLB_BW_ChangeItem2(2)");
--	tinsert(strtab, "ÎÒÒªÊ¹ÓÃğ©ÔÂËéÆ¬»òÒ«ÑôËéÆ¬¶Ò»»Åû·ç»ò»ÕÕÂ	/#GLB_BW_ChangeItem2(1)");
	tinsert(strtab, "§æi th­ëng PVP	/#show_equip_shop(48)");

	tinsert(strtab,"KÕt thóc ®èi tho¹i/nothing");
	Say("B¹n muèn ®æi phÇn th­ëng nµo?",
		getn(strtab),
		strtab)
end

function GLB_BW_AskChange(nType)
	if GetTask(TASK_BIWU_DUIZHAN_JINGYAN) < tBwChangeItem[nType][1] then
		Talk(1,"","  "..g_TempItemName.."Kh«ng ®ñ."..g_TempItemName.."Tham gia §¹i Héi Tû Vâ liªn server sÏ nhËn ®­îc.");
		return 0;
	end
	Say("QuyÕt ®Şnh dïng <color=yellow>"..tBwChangeItem[nType][1].." ®iÓm<color>"..g_TempItemName.."§æi <color=yellow>"..tBwChangeItem[nType][2][2].."<color> chø?",
		3,
		"§ång ı/#GLB_BW_ConfirmChange("..nType..")",
		"trë l¹i/GLB_BW_ChangeItem",
		"KÕt thóc ®èi tho¹i/nothing")
end

function GLB_BW_ConfirmChange(nType)
	if GetTask(TASK_BIWU_DUIZHAN_JINGYAN) < tBwChangeItem[nType][1] then
		Talk(1,"","  "..g_TempItemName.."Kh«ng ®ñ."..g_TempItemName.."Tham gia §¹i Héi Tû Vâ liªn server sÏ nhËn ®­îc.");
		return 0;
	end
	if gf_Judge_Room_Weight(1,100,"") ~= 1 then
		return 0;
	end
	BWDH_SetTask(TASK_BIWU_DUIZHAN_JINGYAN,GetTask(TASK_BIWU_DUIZHAN_JINGYAN)-tBwChangeItem[nType][1]);
	gf_SetLogCaption(" kinh nghiÖm ®èi chiÕn ®æi trang bŞ ")
	gf_AddItemEx(tBwChangeItem[nType][2][1],tBwChangeItem[nType][2][2]);
	gf_SetLogCaption("");
end

function GLB_BW_Award_Ling(bConfirm)
	bConfirm = bConfirm or 0;

	if 1 ~= bConfirm then
		Say("Trong Thiªn M«n TrËn Liªn Server, ng­êi ch¬i cuèi cïng ®¸nh tróng boss Cuång T­íng Minh NhËt, sÏ cã t­ c¸ch ®Õn chç cña ta nhËn 1 DiÖu D­¬ng LÖnh. (Cuång T­íng Minh NhËt chØ xuÊt hiÖn trong Thiªn M«n TrËn cña bang héi cÊp 3, ®ång thêi mçi côm server liªn th«ng chØ xuÊt hiÖn 1 con boss) Trong Thiªn M«n TrËn Liªn Server, ng­êi ch¬i cuèi cïng ®¸nh tróng boss Ngôy T­íng ¸m NguyÖt, sÏ cã t­ c¸ch ®Õn chç cña ta nhËn 1 H¹o NguyÖt LÖnh.",
		2,
		"Ta muèn nhËn!	/#GLB_BW_Award_Ling(1)",
		"KÕt thóc ®èi tho¹i	/nothing");
		return
	end

	local nYYL	= gf_GetTaskByte(TASKID_TMZ_BOSS, 1);
	local nHYL	= gf_GetTaskByte(TASKID_TMZ_BOSS, 2);

	if 0 == nYYL and 0 == nHYL then
		Talk(1, "", "B¹n kh«ng thÓ nhËn DiÖu D­¬ng LÖnh hoÆc H¹o NguyÖt LÖnh.");
		return 0;
	end

	if 1 ~= gf_JudgeRoomWeight(2, 100, "") then
		return 0;
	end

	if 0 < nYYL then
		gf_SetLogCaption("§æi DiÖu D­¬ng LÖnh");
		gf_AddItemEx({2, 95, 742, nYYL, 1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng LÖnh");
		gf_SetTaskByte(TASKID_TMZ_BOSS, 1, 0);
	end
	if 0 < nHYL then
		gf_SetLogCaption("§æi H¹o NguyÖt LÖnh");
		gf_AddItemEx({2, 95, 743, nHYL, 1, -1, -1, -1, -1, -1, -1}, "H¹o NguyÖt LÖnh");
		gf_SetTaskByte(TASKID_TMZ_BOSS, 2, 0);
	end
	gf_SetLogCaption("");

	return 1;
end

tBwChangeItem2 = {
	[1]	= {
		szMsg	= "Dïng 999 M¶nh H¹o NguyÖt sÏ ®æi ®­îc H¹o NguyÖt Phi Phong hoÆc Huy Ch­¬ng, dïng 999 M¶nh DiÖu D­¬ng ®æi ®­îc DiÖu D­¬ng Phi Phong hoÆc Huy Ch­¬ng.",
		tInfo	= { -- Ò«ÑôËéÆ¬¡¢ğ©ÔÂËéÆ¬¡¢Ò«ÑôÁî¡¢ğ©ÔÂÁî¡¢ÌìÃÅ½ğÎÄ»¢·û
			{{999, 0, 0, 0, 0},	0,	{{0, 118, 3, 1, 1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng Háa V©n Phi Phong (Giao dŞch)"}},
			{{999, 0, 0, 0, 0},	0,	{{0, 117, 3, 1, 1, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng Thèng Ngù LÖnh (Giao dŞch)"}},
			{{0, 999, 0, 0, 0},	0,	{{0, 118, 2, 1, 1, -1, -1, -1, -1, -1, -1}, "H¹o NguyÖt CÈm §o¹n Phi Phong (Giao dŞch)"}},
			{{0, 999, 0, 0, 0},	0,	{{0, 117, 2, 1, 1, -1, -1, -1, -1, -1, -1}, "H¹o NguyÖt ¢n NghÜa LÖnh (Giao dŞch)"}},
		},
	},
	[2]	= {
		szMsg	= "	Tham gia Thiªn M«n TrËn Liªn Server sÏ nhËn ®­îc DiÖu D­¬ng LÖnh hoÆc H¹o NguyÖt LÖnh, dïng vËt phÈm ®ã ®Ó ®Õn chç cña ta ®æi Phi Phong hoÆc Huy Ch­¬ng.",
		tInfo	= { -- Ò«ÑôËéÆ¬¡¢ğ©ÔÂËéÆ¬¡¢Ò«ÑôÁî¡¢ğ©ÔÂÁî¡¢ÌìÃÅ½ğÎÄ»¢·û
			{{0, 0, 1, 0, 800},	5000, {{0, 118, 3, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng Háa V©n Phi Phong (Kh«ng thÓ giao dŞch)"}},
			{{0, 0, 1, 0, 800},	5000, {{0, 117, 3, 1, 4, -1, -1, -1, -1, -1, -1}, "DiÖu D­¬ng Thèng Ngù LÖnh (Kh«ng thÓ giao dŞch)"}},
			{{0, 0, 0, 1, 200},	1200, {{0, 118, 2, 1, 4, -1, -1, -1, -1, -1, -1}, "H¹o NguyÖt CÈm §o¹n Phi Phong (Kh«ng thÓ giao dŞch)"}},
			{{0, 0, 0, 1, 200},	1200, {{0, 117, 2, 1, 4, -1, -1, -1, -1, -1, -1}, "H¹o NguyÖt ¢n NghÜa LÖnh (Kh«ng thÓ giao dŞch)"}},
		},
	},
};

g_TempItemName2 = {{"M¶nh DiÖu D­¬ng", 2, 95, 741}, {"M¶nh H¹o NguyÖt", 2, 95, 740}, {"DiÖu D­¬ng LÖnh", 2, 95, 742}, {"H¹o NguyÖt LÖnh", 2, 95, 743}, {"Thiªn M«n Kim V¨n Hæ Phï", 2, 100, 45}}

function GLB_BW_ChangeItem2(nIndex)
	if not nIndex then
		return 0;
	end

	local tChange = tBwChangeItem2[nIndex];
	if not tChange then
		return 0;
	end

	local tMenu = {};
	for nElemIdx, tElemInfo in tChange.tInfo do
		local szInfo = "Dïng thÎ";
		for idx, count in tElemInfo[1] do
			if 0 < count then
				szInfo = szInfo .. format("%d %s,", count, g_TempItemName2[idx][1]);
			end
		end
		if 0 < tElemInfo[2] then
			szInfo = szInfo .. format("%d vµng,", tElemInfo[2]);
		end
		szInfo = strsub(szInfo, 1, strlen(szInfo) - 2); -- È¥µô×îºóµÄ¡°£¬¡±ºÅ »òÕß ¡°ÓÃ¡±×Ö
		szInfo = szInfo .. format("§æi %s	/#GLB_BW_ConfirmChange2(%d, %d)", tElemInfo[3][2], nIndex, nElemIdx);
		tinsert(tMenu, szInfo);
	end

	tinsert(tMenu, "KÕt thóc ®èi tho¹i	/nothing");

	Say(tChange.szMsg, getn(tMenu), tMenu);
end

function GLB_BW_ConfirmChange2(nIndex, nElemIdx)
	if not nIndex then
		return 0;
	end

	local tChange = tBwChangeItem2[nIndex];
	if not tChange then
		return 0;
	end

	local tElem   = tChange.tInfo[nElemIdx];
	if not tElem then
		return 0;
	end

	for idx, count in tElem[1] do
		if count > GetItemCount(g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4]) then
			Talk(1, "", "Mang theo trªn ng­êi" .. g_TempItemName2[idx][1] .. "Kh«ng ®ñ" .. count .. ".");
			return 0;
		end
	end

	if 1 ~= gf_JudgeRoomWeight(1, 100, "") then
		return 0;
	end

	if 0 < tElem[2] and 1 ~= Pay(tElem[2] * 10000) then
		Talk(1, "", "Vµng trªn ng­êi kh«ng ®ñ" .. tElem[2] .. " Kim ");
		return 0;
	end

	for idx, count in tElem[1] do
		if 0 < count then
			if 1 ~= DelItem(g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4], count) then
				WriteLog(format(" ®æi %s [DeleteItem] [Failed] [Acc:%s] [Role:%s] [Item:%sx%d,%d,%d,%d]", tElem[3][2], GetAccount(), GetName(), g_TempItemName2[idx][1], count, g_TempItemName2[idx][2], g_TempItemName2[idx][3], g_TempItemName2[idx][4]));
				return 0;
			end
		end
	end

	gf_SetLogCaption("§æi"..tElem[3][2]);
	gf_AddItemEx(tElem[3][1], tElem[3][2]);
	gf_SetLogCaption("");

	Msg2Global(format("Ng­êi ch¬i %s ®· ®æi 1 %s", GetName(), tElem[3][2]));

	return 1;
end

--»ñÈ¡¿ç·şÍæ¼ÒÇø·şºÍÃû×Ö
function GLB_BW_GetRealmName(strName)
	local aa,bb,strGbGroup,strGbName = strfind(strName,"(.-)*(.*)");
	return strGbGroup,strGbName;
end

tBwGlobalAward = {
	{
		{"Thó c­ìi chuyªn dïng cho §¹i Héi Tû Vâ ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng©n Hæ',7*24*3600)"},
		{"Danh hiÖu: Vßng lo¹i-Gi¶i Nguyªn","GLB_BW_AddTitle(6,3,'Vßng lo¹i-Gi¶i Nguyªn')"},
	},
	{
		{"Thó c­ìi chuyªn dïng cho §¹i Héi Tû Vâ ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng©n Hæ',7*24*3600)"},
		{"Danh hiÖu: Vßng lo¹i-¸ Nguyªn","GLB_BW_AddTitle(6,4,'Vßng lo¹i-¸ Nguyªn')"},
	},
	{
		{"Thó c­ìi chuyªn dïng cho §¹i Héi Tû Vâ ","GLB_BW_AddItemEx({0,105,107,1,1,-1,-1,-1,-1,-1,-1},'Ng©n Hæ',7*24*3600)"},
		{"Danh hiÖu: Vßng lo¹i-Héi Nguyªn","GLB_BW_AddTitle(6,5,'Vßng lo¹i-Héi Nguyªn')"},
	},
};

function BWT_GetGlobalAward()
	local nWeekNum = BWT_GetWeekNum();
	if nWeekNum == -1 then	--Relay¹ÒÁË
		return 0;
	end;
	local nBWRank = GetGlobalBwRank();
	if GetTask(TASK_BIWU_GET_REALM_AWARD) >= nWeekNum then
		Talk(1,"",g_szInfoHead.."B¹n ®· nhËn phÇn th­ëng.");
		return 0;
	end;
	if gf_Judge_Room_Weight(4,100,g_szInfoHead) ~= 1 then
		return 0;
	end
	local tbRank = GetBwAllRank(1); --²ÎÊı1±íÊ¾È«·şÅÅÃû£¬²ÎÊı0»ò²»Ìî±íÊ¾±¾·şÅÅÃû¡£
	if tbRank == nil or getn(tbRank) == 0 then
		return 0;
	end
	local strName = GetName();
	local strGbGroup,strGbName = "","";
	local strCurGroup = GetRelayGroup();
	local nSelfRank,nBestRank = 0,0;
	local strShowName = "";
	for i=1,getn(tGsName) do
		if tGsName[i][1] == strCurGroup then
			strCurGroup = tGsName[i][2];
			break;
		end
	end
	for i=1,getn(tbRank) do
		strGbGroup,strGbName = GLB_BW_GetRealmName(tbRank[i].Name);
		if strGbName == strName then
			nSelfRank = i;
		end
		if strGbGroup == strCurGroup then
			strShowName = strShowName..","..strGbName;
			if nBestRank == 0 then
				nBestRank = i;
			end
		end
	end
	BWDH_SetTask(TASK_BIWU_GET_REALM_AWARD,nWeekNum);
	if nSelfRank ~= 0 and nSelfRank <= 3 then
		for i = 1,getn(tBwGlobalAward[nBWRank]) do
			dostring(tBwGlobalAward[nBWRank][i][2]);
		end
	end
	local tbRankAward = {{1,{2,0,109,3},"Bång Lai Tiªn Lé"},{10,{2,0,109,2},"Bång Lai Tiªn Lé"},{20,{2,0,109,1},"Bång Lai Tiªn Lé"},};
	if nBestRank > 20 or nBestRank == 0 then
		Talk(1,"",g_szInfoHead.."TuÇn tr­íc server kh«ng cã cao thñ nhËn ®­îc t¸n th­ëng cña triÒu ®×nh, mong c¸c vŞ h·y tiÕp tôc cè g¾ng.");
		return 0
	end
	for i = 1,getn(tbRankAward) do
		if nBestRank <= tbRankAward[i][1] then
			gf_AddItemEx(tbRankAward[i][2],tbRankAward[i][3]);
			Msg2Global("Do "..strShowName.."Trong §¹i Héi Tû Vâ biÓu hiÖn v­ît tréi, ng­êi ch¬i trong server cã thÓ nhËn phÇn th­ëng ["..tbRankAward[i][3].."].");
			break;
		end
	end
end

--°Ñ±äÁ¿ÖµĞ´Èë¹²ÏíÊı¾İ¿â
function GLB_BW_SetTask(nkey1,nkey2,tb)
	local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
	strName = "Realm_"..strName;
	local TbList = {};
	local TbListTemp = {};
	local nNum = 16;
	local nItemKey = 0;
	local strItemKey = "";
	local strFormat = "";
	if nkey1 == 0 and nkey2 == 1 then --¹ÆÊ¦
		local tb_gushi = {};
		for k,v in tb do
			local nValue = GetTask(v);
			strFormat = strFormat.."d";
			tinsert(tb_gushi,nValue);
		end
		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"GS",strFormat,gf_UnPack(tb_gushi));
	elseif nkey1 == 0 and nkey2 == 0  then
		for i = 1,getn(tb) do
			tinsert(TbList,tb[i]);
			tinsert(TbList,GetTask(tb[i]));
		end
		nItemKey = ceil(getn(TbList)/nNum);
		for i = 1,nItemKey do
			local strFormat = ""
			TbListTemp[i] = {};
			for j = (i-1)*nNum+1,min(getn(TbList),nNum*i) do
				strFormat = strFormat.."d";
				tinsert(TbListTemp[i],TbList[j]);
			end
			strItemKey = "BW"..tostring(i);
			AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,strItemKey,strFormat,gf_UnPack(TbListTemp[i]));
		end
--	elseif nkey1 == 0 and nkey2 == 2 then --åĞÒ£±ÒµÄÏûºÄ
--		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYB","d",GetTask(TASKID_XOYO_CONSUME));
--	elseif nkey1 == 0 and nkey2 == 3 then --åĞÒ£ÓñµÄÏûºÄ
--		AddRelayShareDataToSourceRealm(strName,nkey1,nkey2,g_ThisFile,"GLB_BW_ST_Nothing",0,"XYY","d",GetTask(TASKID_XOYOYU_CONSUME));
	end
end

function GLB_BW_ST_Nothing()

end

function GLB_BW_AddItemEx(tbItem,strName,nTime)
	nTime = nTime or 0;
	gf_SetLogCaption("§¹i Héi Tû Vâ-PhÇn th­ëng server");
	local nRet,nIdx = gf_AddItemEx(tbItem,strName);
	if nTime ~= 0 and nIdx ~= 0 then
		SetItemExpireTime(nIdx,nTime);
	end
	gf_SetLogCaption("")
end

function GLB_BW_AddTitle(nID1,nID2,strName)
	for i=3,5 do
		RemoveTitle(6,i);
	end
	if IsTitleExist(nID1,nID2) <= 0 then
		if AddTitle(nID1,nID2) > 0 then
			SetTitleTime(nID1,nID2, GetTime() + 7*24*3600);
			SetCurTitle(nID1,nID2)
			Msg2Player("B¹n nhËn ®­îc ["..strName.."] danh hiÖu");
			WriteLog("[§¹i Héi Tû Vâ-PhÇn th­ëng server]:"..GetName().." nhËn ®­îc ["..strName.."] danh hiÖu");
		end
	end
end

function GLB_BW_LEAVE(nCityID, nPIdx)
	nPIdx = nPIdx or PlayerIndex;
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;

	local nVersion,nCurGs = GetRealmType();
	UseScrollEnable(1);	--ÔÊĞíÊ¹ÓÃ»Ø³Ç·û
	SetLogoutRV(0);
	UseMask(0,0);
--	if nCurGs == 0 then
--		NewWorld(nCityID,TB_EXIT[nCityID][1],TB_EXIT[nCityID][2]);
--	else
--		ChangeGroupWorld(nCityID,TB_EXIT[nCityID][1],TB_EXIT[nCityID][2],0);
--	end
	BWDH_Change_Map(nCityID,TB_EXIT_CITY[nCityID][1],TB_EXIT_CITY[nCityID][2])

	PlayerIndex = nOldPIdx;
end

function OnWant(nPIdx,nOppIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx;
	local nCheckMapCode1,nCheckMapCode2 = 0,0;
	local nCheckTag = 0;

	BWDH_SetTask(TSK_OPPNAME_HASH,0);
	BWDH_SetTask(TSK_OPPNAME_HASH,0,nOppIdx);
	nCheckMapCode1 = BWT_CheckValidMap();
	nCheckMapCode2 = BWT_CheckValidMap(nOppIdx);
	if nCheckMapCode1 == 0 then	--1ºÅÑ¡ÊÖ¼ì²éÃ»Í¨¹ı
		gf_ShowMsg("Kh­íc tõ tû vâ (kh«ng cã trong b¶n ®å quy ®Şnh), trõ 2 ®iÓm! B¹n ®· rêi khái so tµi.");
		BWT_AddPoint(-2)
		nCheckTag = 1;	--±íÊ¾ÓĞÈËÃ»Í¨¹ı¼ì²é
	end;
	if nCheckMapCode2 == 0 then	--2ºÅÑ¡ÊÖ¼ì²éÃ»Í¨¹ı
		if nCheckTag == 0 then	--Èç¹û1ºÅ¼ì²éÍ¨¹ıÁË
			gf_ShowMsg("§èi thñ kh­íc tõ tû vâ!");	--¸ø1ºÅ·¢ÏûÏ¢
		end;
		gf_ShowMsg("Kh­íc tõ tû vâ (kh«ng cã trong b¶n ®å quy ®Şnh), trõ 2 ®iÓm! B¹n ®· rêi khái so tµi.",1,nOppIdx);
		BWT_AddPoint(-2,nOppIdx)
		nCheckTag = 1;
	else	--Èç¹û2ºÅÑ¡ÊÖ¼ì²éÍ¨¹ı
		if nCheckTag == 1 then	--2ºÅÍ¨¹ı£¬1ºÅÃ»Í¨¹ı
			gf_ShowMsg("§èi thñ kh­íc tõ tû vâ!",1,nOppIdx);	--¸ø2ºÅ·¢ÏûÏ¢
		end;
	end;
	if nCheckTag == 1 then	--Èç¹ûÓĞÈËÃ»Í¨¹ı¼ì²é
		PlayerIndex = nOldPIdx;
		return 0;
	end;
	if BWT_OpenMatch(PlayerIndex,nOppIdx) == 0 then
		gf_ShowMsg("T¹m thêi kh«ng cã khu thi ®Êu d­ ra");
		BWT_JoinGestConvention();
		BWT_JoinGestConvention(nOppIdx);
		gf_ShowMsg("T¹m thêi kh«ng cã khu thi ®Êu d­ ra",1,nOppIdx);
	end;
	PlayerIndex = nOldPIdx;
end

function GLB_BW_Get_Block_Route()
	local tRoute		= gf_GetRouteTable();
	local tBlockRoute	= {};

	for i, nRoute in tRoute do
		if 1 == gf_GetTaskBit(TASKID_BIWU_BLOCK_ROUTE, i) then
			tinsert(tBlockRoute, nRoute);
		end
		if MAXNUM_BLOCK_ROUTE <= getn(tBlockRoute) then
			break
		end
	end

	tBlockRoute.n = nil;

	return tBlockRoute;
end

function GLB_BW_Block_Route_Check(nRoute)
	local tRoute		= gf_GetRouteTable();
	local nRet = 1;
	for i,k in tRoute do
		if k == nRoute then
			if gf_GetTaskBit(TASKID_BIWU_BLOCK_ROUTE, i) == 1 then
				nRet = 0;
			end
			break;
		end
	end
	return nRet;
end

function GLB_BW_Block_Route_Check_Ex(nPIdx1, nPIdx2)
	local nRet		= 0;
	local nOldPIdx	= 0;
	local nRoute1	= GetPlayerRoute(nPIdx1);
	local nRoute2	= GetPlayerRoute(nPIdx2);

	if nRoute1 == nRoute2 then
		return 1;
	end

	nOldPIdx	= PlayerIndex;
	PlayerIndex	= nPIdx1;
	nRet		= GLB_BW_Block_Route_Check(nRoute2);
	PlayerIndex	= nOldPIdx;

	if 0 == nRet then
		return 0;
	end

	nOldPIdx	= PlayerIndex;
	PlayerIndex	= nPIdx2;
	nRet		= GLB_BW_Block_Route_Check(nRoute1);
	PlayerIndex	= nOldPIdx;

	return nRet;
end

function GLB_BW_Block_Route_Cost(nPIdx)
--	nPIdx1 = nPIdx1 or PlayerIndex;
--
--	local nOldPIdx	= PlayerIndex;
--	PlayerIndex		= nPIdx;
--	local tRoute	= GLB_BW_Get_Block_Route();
--	if getn(tRoute) > 0 then
--		PayXYY(TB_BW_BLOCK_ROUTE_COST[getn(tRoute)], format("BLOCK_ROUTE[%d]", getn(tRoute)));
--	end
--	PlayerIndex		= nOldPIdx;
end

function WLZB_AddPoint()
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local s = SDB("_GL_GestConvention_Jiaoyi_w", 1, GetPlayerRoute());
	s:apply("\\script\\biwudahui\\tournament\\mission\\mission.lua", "WLZB_AddPoint_CB");
end

function WLZB_AddPoint_CB(key, n1, n2, nCount)
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local t = SDB("_GL_GestConvention_Jiaoyi_w", n1, n2);
	local point = getBound(t, nCount) + 20;
	Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm Vâ L©m Tranh B¸!", point));
	point = point + GetTask(TASKID_WLZB_POINT);
	BWDH_SetTask(TASKID_WLZB_POINT, point);
	--GLB_BW_SetTask(0,0,tRelayTask);
	exgsvr_func_save_player_task()--ÏòÔ´·ş´æÅÌ

	--SendGlbDBData(1, format('DELETE FROM `wlzb_auditions` WHERE `name`="%s";', name));
	--format('UPDATE `wlzb_auditions` SET `point`=%d WHERE `name`="%s";', point, name);
	SendGlbDBData(0, format('REPLACE INTO `wlzb_auditions` VALUES ("%s", "%s", %d, %d, "%s");',
		GetName(), tRouteName[GetPlayerRoute()], GetLevel(), point, GetRelayGroup()));
end

function getBound(t,nCount)
	if not t then
		return 0
	end
	local myname = GetName();
	for i = 0, min(nCount, 20) do
		local l = t[i];
		if l[1] == myname then
			return 20 - i;
		end
	end
	return 0;
end

function WLZB_DecPoint()
	local nData = tonumber(date("%Y%m%d"));
	if nData < 20110428 or nData > 20110519 then
		return
	end
	local lastPoint = GetTask(TASKID_WLZB_POINT);
	local point = min(lastPoint, max(10, floor(lastPoint * 0.03)));
	if point <= 0 then return end
	Msg2Player(format("B¹n tæn thÊt %d ®iÓm Vâ L©m Tranh B¸!", point));
	point = GetTask(TASKID_WLZB_POINT) - point;
	BWDH_SetTask(TASKID_WLZB_POINT, point);
	--GLB_BW_SetTask(0,0,tRelayTask);
	exgsvr_func_save_player_task()--ÏòÔ´·ş´æÅÌ

	--SendGlbDBData(1, format('DELETE FROM `wlzb_auditions` WHERE `name`="%s";', name));
	--format('UPDATE `wlzb_auditions` SET `point`=%d WHERE `name`="%s";', point, name);
	SendGlbDBData(0, format('REPLACE INTO `wlzb_auditions` VALUES ("%s", "%s", %d, %d, "%s");',
		GetName(), tRouteName[GetPlayerRoute()], GetLevel(), point, GetRelayGroup()));
end

function BWDH_Change_Map(nMapId, nMapX, nMapY, nRule)
	if BWDH_OPEN_IN_MATCH_FIELD and BWDH_OPEN_IN_MATCH_FIELD == 1 then
		ChangeGroupWorld(nMapId, nMapX, nMapY)
	else
		NewWorld(nMapId, nMapX, nMapY)
	end
end
