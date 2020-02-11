--Create date:2008-1-9 15:09
--Author:yanjun
--Description:Mission¿ò¼ÜÏà¹Øº¯Êý
Include("\\script\\biwudahui\\tournament\\tournament_function.lua");
--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	BWT_InitFieldNpc();
	BWT_ChangeMSState(MS_STATE_CHECK_EQUIPMENT);
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);
	SetMissionS(MS_MISSION_STRING,"CÊm ThÕ Th©n phï");	--Õâ¸öÓÃ·¨Ì«Ææ¹Ö
	WriteLog("["..LOG_HEAD.."]: TrËn Mission b¾t ®Çu, MSUID lµ: "..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local nPos1 = BWT_SetRandomPos(nPIdx1,nil);
	BWT_SetRandomPos(nPIdx2, nPos1);
	BWT_ChangeMSState(MS_STATE_STARTED);
	Talk2SomeOne(nPIdx1,1,"","Tû vâ chÝnh thøc b¾t ®Çu!");
	Talk2SomeOne(nPIdx2,1,"","Tû vâ chÝnh thøc b¾t ®Çu!");
	Msg2MSAll(MISSION_ID,"Tû vâ chÝnh thøc b¾t ®Çu!");
end;
--Mission½áÊø
function MS_EndMission()
	local nMSUID = GetMissionV(MV_MISSION_UID);
	local nMapID = GetMissionV(MV_MAPID);
	local nMapIdx = GetMissionV(MV_MAPIDX);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	BWT_ChangeMSState(MS_STATE_IDEL);
	mf_ClearMissionData();
	ClearMapNpc(nMapID);
	FreeDynamicMap(nMapID,nMapIdx);
	WriteLog("["..LOG_HEAD.."]: TrËn Mission kÕt thóc, MSUID lµ:"..nMSUID);
end;
--Àë¿ªMission
function MS_LeaveMission()
	local nOldIdx = PlayerIndex;
	local nCamp = GetTaskTemp(TSK_TEMP_CAMP);
	local nState = GetMissionV(MV_MISSION_STATE);
	if (nCamp == A_CAMP or nCamp == B_CAMP) and (nState ~= MS_STATE_ENDING) then	--Èç¹ûÊÇÑ¡ÊÖÍË³ö
		local szName = BWT_GetName();
		local nOppIdx = BWT_GetOpponentIndex();
		local szOppName = BWT_GetName(nOppIdx);
		BWT_ChangeMSState(MS_STATE_ENDING);
		Msg2MSAll(MISSION_ID,szName.." rêi khái trËn ®Êu,"..szOppName.." chiÕn th¾ng ë trËn so tµi nµy");
		BWT_ReportResult(nOppIdx,PlayerIndex);
	end;
	PlayerIndex = nOldIdx;
	local nCityID = GetMissionV(MV_CITY_ID);
	local nOutMapID = TB_MAPID[nCityID][1];
	local nDirection = random(1,getn(TB_EXIT));
	MS_RestorePlayerState(1);

	NewWorld(nOutMapID,TB_EXIT[nDirection][2],TB_EXIT[nDirection][3]);
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	MS_SetPlayerState(nCamp);
	AddMSPlayer(MISSION_ID,nCamp);
end;

function MS_ProcessCheckEquipmentTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nOldPIdx = PlayerIndex;
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	local tbPIdx = {nPIdx1,nPIdx2};
	local nMapID = gf_GetCurMapID();
	local szHint = "";
	local nOldPIdx = PlayerIndex;
	if nLoop == 0 then
		local nCheckRetCode1 = BWT_CheckEquipment(nPIdx1);
		local nCheckRetCode2 = BWT_CheckEquipment(nPIdx2);
		if nCheckRetCode1 == 0 and nCheckRetCode2 == 0 then	--Ë«·½¶¼Ã»´©ºÃÒÂ·þ
			for i=1,getn(tbPIdx) do
				PlayerIndex = tbPIdx[i];
				Talk(1,"","Hai bªn ®Òu ch­a mÆc xong y phôc, ®Êu hßa, trõ <color=yellow>1<color> ®iÓm so tµi.");
				BWT_AddPoint(-1);
			end;
			PlayerIndex = nOldPIdx;
			BWT_ChangeMSState(MS_STATE_ENDING);
			return 0;
		end;
		if nCheckRetCode1 == 0 then	--1ºÅÑ¡ÊÖÃ»´©ºÃÒÂ·þ
			Msg2MSAll(MISSION_ID,"Do "..BWT_GetName(nPIdx1).." trong thêi gian quy ®Þnh ch­a mÆc xong trang bÞ, "..BWT_GetName(nPIdx2).." chiÕn th¾ng trËn so tµi nµy");
			BWT_ReportResult(nPIdx2,nPIdx1);
			BWT_ChangeMSState(MS_STATE_ENDING);
			PlayerIndex = nOldPIdx;
			return 0;
		end;
		if nCheckRetCode2 == 0 then	--2ºÅÑ¡ÊÖÃ»´©ºÃÒÂ·þ
			Msg2MSAll(MISSION_ID,"Do "..BWT_GetName(nPIdx2).." trong thêi gian quy ®Þnh ch­a mÆc xong trang bÞ, "..BWT_GetName(nPIdx1).." chiÕn th¾ng trËn so tµi nµy");
			BWT_ReportResult(nPIdx1,nPIdx2);
			BWT_ChangeMSState(MS_STATE_ENDING);
			PlayerIndex = nOldPIdx;
			return 0;
		end;
		PlayerIndex = nOldPIdx;
		BWT_SetPlayerFightState(1,nPIdx1);
		BWT_SetPlayerFightState(2,nPIdx2);
--		Msg2MSAll(MISSION_ID,"×°±¸¼ì²éÊ±¼ä½áÊø£¬½ÓÏÂÀ´ÊÇ×¼±¸Ê±¼ä¡£");
		Talk2SomeOne(nPIdx1,1,"","L­u ph¸i ®èi thñ lµ <color=yellow>"..BWT_GetPlayerRouteName(nPIdx2).."<color>. TiÕp theo lµ thêi gian chuÈn bÞ.");
		Talk2SomeOne(nPIdx2,1,"","L­u ph¸i ®èi thñ lµ <color=yellow>"..BWT_GetPlayerRouteName(nPIdx1).."<color>. TiÕp theo lµ thêi gian chuÈn bÞ.");
		Msg2SomeOne(nPIdx1,"L­u ph¸i ®èi thñ lµ :"..BWT_GetPlayerRouteName(nPIdx2)..". TiÕp theo lµ thêi gian chuÈn bÞ.");
		Msg2SomeOne(nPIdx2,"L­u ph¸i ®èi thñ lµ :"..BWT_GetPlayerRouteName(nPIdx1)..". TiÕp theo lµ thêi gian chuÈn bÞ.");
		--SetTask(1429, 1);--¸Ä±ä³É²»¿ÉÒÔÇÐ»»ÎåÐÐÅÌµÄ×´Ì¬
		BWT_ChangeMSState(MS_STATE_READY);
	else
		local nCheckRetCode,tbEquip = 0,{};
		for i=1,getn(tbPIdx) do
			nCheckRetCode,tbEquip = BWT_CheckEquipment(tbPIdx[i]);
			szHint = "";
			if nCheckRetCode == 0 then
				for i=1,getn(tbEquip) do
					if tbEquip[i] ~= 1 then
						szHint = szHint.."<color=yellow>"..TB_EquipPosName[i].."<color> vµo,";
					end;
				end;
				Talk2SomeOne(tbPIdx[i],1,"","Trang bÞ kh«ng phï hîp quy ®Þnh tû vâ lµ"..szHint.."H·y kiÓm tra trang bÞ cña b¹n.");
			end;
		end;
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		--Msg2MSAll(MISSION_ID,"¾à×°±¸¼ì²é½áÊø»¹ÓÐ"..tf_GetTimeString(nLoop*CHECK_EQUIPMENT_TIMER_INTERVAL*60).."¡£Çë±ÈÎäË«·½ÈÏÕæ¼ì²é×Ô¼ºÉíÉÏµÄ×°±¸ÊÇ·ñ·ûºÏ±ÈÎä¹æ¶¨");
	end;
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Thêi gian chuÈn bÞ kÕt thóc cßn "..tf_GetTimeString(nLoop*READY_TIMER_INTERVAL*60)..", mêi c¸c tuyÓn thñ chuÈn bÞ");
	end;
end;
--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nDrawState = 0;
	local nPIdx1 = GetMissionV(MV_PLAYERINDEX1);
	local nPIdx2 = GetMissionV(MV_PLAYERINDEX2);
	if nLoop == 0 then
		BWT_ChangeMSState(MS_STATE_ENDING);
		nDrawState = BWT_GetDrawState(nPIdx1,nPIdx2);
		if nDrawState == 0 then
			BWT_ReportResult(nPIdx1,nPIdx2,1);
		elseif nDrawState == 1 then
			BWT_ReportResult(nPIdx1,nPIdx2);
		elseif nDrawState == 2 then
			BWT_ReportResult(nPIdx2,nPIdx1);
		end;
		Msg2MSAll(MISSION_ID,"KÕt thóc so tµi! C¸c ng­¬i sÏ ®­îc tho¸t ra trong chèc l¸t.");
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Thêi gian kÕt thóc tû vâ cßn "..tf_GetTimeString(nLoop*STARTED_TIMER_INTERVAL*60));
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		BWT_CloseField();
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H«n lÔ s¾p kÕt thóc, chØ cßn"..tf_GetTimeString(nLoop*ENDING_TIMER_INTERVAL*60));
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_RestorePlayerState(0);
	WriteLog("["..LOG_HEAD.."]: Ng­êi ch¬i "..GetName().." Rêi Mission kh«ng b×nh th­êng, ®ang trong qu¸ tr×nh xö lý ®¨ng nhËp.");
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = GetTime();
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState(nCamp)
	local nCityID = GetMissionV(MV_CITY_ID);
	local nDirection = GetMissionV(MV_FIELD_DIRECTION);
	local nFieldNum = GetMissionV(MV_FIELD_NUM);
	local tbDirection = {"H­íng ®«ng","H­íng nam","H­íng T©y","H­íng B¾c"};
	local nMapID = gf_GetCurMapID();
	local szTips = "";
	BWT_WeeklyClear();
	BWT_ClearTempTask();
	SetTaskTemp(TSK_TEMP_CAMP,nCamp);
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetFightState(0);	--ºÍÆ½×´Ì¬
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	StallEnable(0);	--½ûÖ¹°ÚÌ¯
	OpenFriendliness(0);	--²»Ôö¼ÓºÃ¸Ð¶È
	SetDeathPunish(0);	--ÎÞËÀÍö³Í·£
	InteractiveEnable(0);	--½ûÖ¹»¥¶¯
	UseDummy(0,1);	--Çå³ýÌæÉí·ûÐ§¹û
	ForbitLevelUp(1);	--½ûÖ¹Éý¼¶
	ForbitAddProp(1);	--½ûÖ¹²Ù×÷Ç±ÄÜµã
	ForbidChangePK(0);	--¿ÉÒÔ×ª»»PK×´Ì¬£¨Èç¹ûÓÐÈË´ËÊ±ÔÚÇÐ´è£¬ÊÇ²»ÄÜ×ª»»PK×´Ì¬µÄ£¬ËùÒÔÕâÀïÓÃÖ¸ÁîÉèÖÃÔÊÐí×ª»»PK×´Ì¬£©
	UseSkillEnable(0);	--½ûÖ¹Îä¹¦
	KillFollower();		--É¾³ý¸úËæNPC
	if IsPlayerDeath() == 1 then
		RevivePlayer(0);
	end;
	SetPlayerRestrictions(0,1);	--ÏÞÖÆÎïÆ·Ê¹ÓÃ
	if nCamp == AUDIENCE_CAMP then
		SetPKFlag(0,0);	--PK×´Ì¬
		DesaltPlayer(1,0);
		NewWorld(nMapID,TB_ENTRY[2][1],TB_ENTRY[2][2]);
	else
		NewWorld(nMapID,TB_ENTRY[3][nCamp][1],TB_ENTRY[3][nCamp][2]);
		SetDeathScript(DEATH_SCRIPT);
		SetPKFlag(1,nCamp);	--PK×´Ì¬
		gf_ForbidFactionSkill(1);
		BlockSkill(19);	--ÆÁ±Î´ò×ø
		SetCurTitle(0,0);
		SetPlayerRestrictions(2,1);	--ÉèÖÃ³ÆºÅÊôÐÔÎÞÐ§
		SetLockCurTitle(0);	--²»¿É¸ü»»³ÆºÅ
		SetPlayerRestrictions(1,1);	--ÏÞÖÆÄ³Ð©×°±¸ÉÏµÄÊôÐÔ
		ResetToPlayerDamage();
		RemvoeTempEffect();	--Çå³ýËùÓÐÁÙÊ±×´Ì¬
		ClearColdDown();	--Çå³ýËùÓÐÒ©CD
		--RemoveRevivals();	--Çå³ý±¦±¦
		Restore();
		RestoreNeili();
--		local nUseMask = GetMaskStatus();
--		UseMask(nUseMask,0);	--Ç¿ÖÆÏÔÊ¾Ãû×Ö
		RemoveState(9900);	--Çå³ý³ÇÊÐ½±ÕÂ»»µÄ×´Ì¬
		ClearStolenSkill();	--Çå³ýÒÑÍµÈ¡µÄ¼¼ÄÜ£¬Õë¶Ô¹÷×Ó
		CastState("imme_clear_skill_interval",-1,0);	--Ïû³ýËùÓÐ¼¼ÄÜµÄÀäÈ´Ê±¼ä
		SetMissionV(MV_PLAYERINDEX1-1+nCamp,PlayerIndex);	--¼ÇÂ¼Íæ¼ÒµÄË÷Òý
		SetMissionS(MS_PLAYERNAME1-1+nCamp,GetName());
		if UNCOMPLETED_VERSION ~= 1  then
			BWT_QuitGestConvention();	--ÍË³öÅä¶ÔÁÐ±í
		end;
		BWT_RemoveNonlicetState();
		szTips = " <color=yellow>Mau chãng mÆc trang bÞ phï hîp tr­íc khi kÕt thóc thêi gian chuÈn bÞ, nÕu kh«ng sÏ lì mÊt trËn ®Êu.<color>";
	end;
	ForbidChangePK(1);	--½ûÖ¹×ª»»PK×´Ì¬
	if GetPlayerFaction() ~= 6 then --²»ÊÇÑîÃÅ²»ÄÜÆïÂí
		ForbidRiding(1);
	end
--	local szString = "Äã½øÈëÁË"..TB_MAPID[nCityID][3]..tbDirection[nDirection]..nFieldNum.."ºÅ³¡µØ¡£";
--	Msg2Player(szString);
--	Say(szString..szTips,0);
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
--bUseMask:±ÈÎäÑ¡ÊÖÊÇ·ñÒª±ä³ÉÉñÃØÈË¡£1ÊÇ£¬0·ñ
function MS_RestorePlayerState(bUseMask)
	bUseMask = bUseMask or 1;
	local nCamp = GetTaskTemp(TSK_TEMP_CAMP);
	local nTime = GetTime();
	SetLogoutRV(1);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	LeaveTeam();	--Àë¿ª¶ÓÎé
	SetFightState(0);	--ºÍÆ½×´Ì¬
	SetDeathScript("");	--Çå¿ÕËÀÍö½Å±¾
	SetTempRevPos(0,0,0);	--É¾³ýÁÙÊ±ÖØÉúµã
	ForbidChangePK(0);	--¿ÉÒÔ×ª»»PK×´Ì¬
	SetPKFlag(0,0);	--ÎÞPK×´Ì¬
	local nVersion,nCurGs = GetRealmType();
	if nCurGs ~= 1 then
		ForbitTrade(0);	--ÔÊÐí½»Ò×
		StallEnable(1);	--ÔÊÐí°ÚÌ¯
	end
	OpenFriendliness(1);	--¿ÉÔö¼ÓºÃ¸Ð¶È
	SetDeathPunish(1);	--ÓÐËÀÍö³Í·£
	InteractiveEnable(1);	--ÔÊÐí»¥¶¯
	SetLockCurTitle(1);	--¿É¸ü»»³ÆºÅ
	SetPlayerRestrictions(0,0);
	SetPlayerRestrictions(1,0);
	SetPlayerRestrictions(2,0);
	DesaltPlayer(0,0);
	ForbitLevelUp(0);
	ForbitAddProp(0);
	UseSkillEnable(1);
	ForbidRiding(0);
	--SetTask(1429, 0);--¸Ä±ä³É¿ÉÒÔÇÐ»»ÎåÐÐÅÌµÄ×´Ì¬
--	UseMask(bUseMask,0);	--Ç¿ÖÆ±äÉñÃØÈË
	if nCamp ~= AUDIENCE_CAMP then	--Èç¹ûÊÇ±ÈÈüÑ¡ÊÖ
		BWDH_SetTask(TSK_ALLOW_AUDIENCE,1);	--ÔÊÐí¹ÛÕ½
		SetMissionV(MV_PLAYERINDEX1-1+nCamp,0);
		RestoreAll();
		ClearColdDown();	--Çå³ýËùÓÐÒ©CD
		CastState("imme_clear_skill_interval",-1,0);	--Ïû³ýËùÓÐ¼¼ÄÜµÄÀäÈ´Ê±¼ä
		ResetToPlayerDamage();
		BWDH_SetTask(TSK_LAST_INVITE_TIME,nTime-floor(INVITE_INTERVAL_TIME/2));	--±ÈÈü³öÀ´µÄCDËõ¶ÌÒ»°ë
		gf_ForbidFactionSkill(0);
		UnBlockSkill(19);	--ÔÊÐí´ò×ø
		local nTimesLeft = GetTask(TSK_JOIN_LIST_TYPE);
		if nTimesLeft > 1 then	--Ö»²Î¼ÓnTimesLeft´ÎµÄ
			BWT_JoinGestConvention();	--¼ÓÈëÅä¶ÔÁÐ±í
			BWDH_SetTask(TSK_JOIN_LIST_TYPE,nTimesLeft-1);
		elseif nTimesLeft == -1 then	--Ò»Ö±²Î¼ÓµÄ
			BWT_JoinGestConvention();	--¼ÓÈëÅä¶ÔÁÐ±í
		end;
		local nCurWeekMatch = GetTask(TSK_CURWEEKMATCH);
		if nCurWeekMatch == REQUIRE_MATCH_TIME then
			gf_ShowMsg("TuÇn nµy ng­¬i ®· tham gia "..REQUIRE_MATCH_TIME.."Khu vùc tû vâ, hÖ thèng ®· gióp b¹n tù ®éng ®¨ng ký tÝch ®iÓm.\n<color=red> sau nµy mçi khi tiÕn hµnh tû vâ hÖ thèng sÏ gióp b¹n tù ®éng ®¨ng ký!<color>");
		end;
	end;
	BWT_ClearTempTask();
	BWT_LockEquipment(0);
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 1 then
		ForbidChangePK(1);
	end
end;

