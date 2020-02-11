--create date:2007-07-04
--author:yanjun
--describe:°ï»á¹Ø¿¨MissionÍ·ÎÄ¼þ
Include("\\script\\missions\\tong_mission\\main_function.lua");

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊý
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_SECOND);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷
	local nMSUID = MS_CreateMSUID();	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	local nMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_STAGE_OVER,1);	--·Ç´³¹ØÊ±¼ä¶Î
	TM_CreateFieldNpc(nMapID);
	local nYearWeek = tonumber(date("%y%W"));
	SetMissionV(MV_WEEK,nYearWeek);
	local szTongName = GetMissionS(MS_TONG_NAME);
	TM_SetRelayTongData(szTongName,KEY_ATTEND,"d",nYearWeek);
	DelRelayShareDataCopy(szTongName,0,0);
	WriteLog("[Bang héi v­ît ¶i]:"..szTongName.."Bang héi b¾t ®Çu v­ît ¶i, nMSUID: "..nMSUID);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,ALL_CAMP);
	if nPlayerCount < MIN_PLAYER_COUNT then
		Msg2MSAll(MISSION_ID,"Tæng ng­êi trong ¶i Ýt h¬n "..MIN_PLAYER_COUNT.." ng­êi, cöa ¶i ®· bÞ ®ãng.");
		CloseMission(MISSION_ID);
		return 0;
	end;
	SetMissionV(MV_MISSION_STATE,MS_STATE_STARTED);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
	StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
	Msg2MSAll(MISSION_ID,"Thêi gian chuÈn bÞ ®· kÕt thóc");
end;
--Mission½áÊø
function MS_EndMission()
	local nMapID = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nMapID);
	ClearMapObj(nMapID);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL);
	local nMSUID = GetMissionV(MV_MISSION_UID);
	local szTongName = GetMissionS(MS_TONG_NAME);
	mf_DelAllMSPlayer(MISSION_ID,CAMP_ALL);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	mf_ClearMissionData();
	TM_SetTongFieldState(nMapID,0);
	WriteLog("[Bang héi v­ît ¶i]:"..szTongName.."¶i bang héi ®· kÕt thóc, nMSUID?"..nMSUID);
end;
--Àë¿ªMission
function MS_LeaveMission()
	local nMapID = GetTaskTemp(TSK_TEMP_MAP_ID);
	MS_RestorePlayerState();
	NewWorld(nMapID,tPos_Entrance[nMapID][1],tPos_Entrance[nMapID][2]-10);
	local nPlayerCount = GetMSPlayerCount(MISSION_ID,ALL_CAMP);
	gf_ShowDebugInfor("player count:"..GetMSPlayerCount(MISSION_ID,0));
	if nPlayerCount < MIN_PLAYER_COUNT then
		if GetMissionV(MV_MISSION_STATE) > MS_STATE_READY then
			Msg2MSAll(MISSION_ID,"Ng­êi ch¬i trong ¶i Ýt h¬n "..MIN_PLAYER_COUNT.." ng­êi, cöa ¶i sÏ kÕt thóc.");
			CloseMission(MISSION_ID);
		end;
	end;
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	CleanInteractive();
	local nMapID = SubWorldIdx2ID(SubWorld);
	NewWorld(nMapID,tPos_Out_Room[1],tPos_Out_Room[2]-10);
	MS_SetPlayerState();
	AddMSPlayer(MISSION_ID,nCamp)
	Msg2MSAll(MISSION_ID,GetName().."TiÕn vµo ¶i");
	Say("Chó ý: sè ng­êi néi ®­êng vµ ngo¹i ®­êng kh«ng  ®­îc Ýt h¬n <color=yellow>"..MIN_PLAYER_COUNT.."<color> ng­êi, nÕu kh«ng cöa ¶i sÏ tù ®éng ®ãng cöa.",0);
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Thêi gian chuÈn bÞ kÕt thóc cßn "..(tf_GetTimeString(nLoop*READY_TIMER_INTERVAL)));
	end;
end;
--´¦ÀíMission¿ªÊ¼ºóµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessStartedTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	SetMissionV(MV_TIMER_LOOP,nLoop+1);
	local nStage = GetMissionV(MV_STAGE);
	TB_STAGE[nStage]:ProcessTimer();
	nLoop = nLoop + 1;
	local szMsg = "";
	local nPlayerCount = mf_GetPlayerCount(MISSION_ID,ALL_ID);
	if mod(nLoop,12) == 0 then	--1·ÖÖÓÒ»±¨
		szMsg = "HiÖn t¹i sè ng­êi trong ¶i cã: "..nPlayerCount;
	end;
	if nPlayerCount < MIN_PLAYER_COUNT then
		Msg2MSAll(MISSION_ID,"Tæng ng­êi trong ¶i Ýt h¬n "..MIN_PLAYER_COUNT.." ng­êi, cöa ¶i ®· bÞ ®ãng.");
		CloseMission(MISSION_ID);
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"H«n lÔ s¾p kÕt thóc, chØ cßn"..(tf_GetTimeString(nLoop*ENDING_TIMER_INTERVAL)));
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[¶i Bang Héi]: Ng­êi ch¬i "..GetName().." Rêi Mission kh«ng b×nh th­êng, ®ang trong qu¸ tr×nh xö lý ®¨ng nhËp.");
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID()
	local nMSUID = random(1,999999);	--Ëæ»úÒ»¸ö°É£¬MSUID¶Ô¹Ø¿¨ºÃÏñÃ»Ê²Ã´ÓÃ´¦
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()
	local nCurWeek = tonumber(date("%y%W"));
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
	SetFightState(1);	--Õ½¶·×´Ì¬
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	SetDeathScript("\\script\\missions\\tong_mission\\npc\\death_player.lua");
	local nMapID = GetTaskTemp(TSK_TEMP_MAP_ID);
	SetTempRevPos(nMapID,tPos_Entrance[nMapID][1]*32,(tPos_Entrance[nMapID][2]-10)*32);	--ËÀÍöÖØÉúµã
	SetPKFlag(1,1);	--PK×´Ì¬
	ForbidChangePK(1);	--½ûÖ¹×ª»»PK×´Ì¬
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	ForbitTrade(1);	--½ûÖ¹½»Ò×
	StallEnable(0);	--½ûÖ¹°ÚÌ¯
	OpenFriendliness(0);	--²»Ôö¼ÓºÃ¸Ð¶È
	SetDeathPunish(0);	--ÎÞËÀÍö³Í·£
	SetMomentum(0);		--Çå³ýÉ±ÆøÖµ
	InteractiveEnable(0);	--½ûÖ¹»¥¶¯
	ClearStolenSkill();	--Çå³ýÒÑÍµÈ¡µÄ¼¼ÄÜ£¬Õë¶Ô¹÷×Ó
	if GetTongName() ~= GetMissionS(MS_TONG_NAME) then
		SetTaskTemp(TSK_TEMP_HELPER,1);	--±ê¼ÇÎªÍâÔ®
	end;
	TM_WeeklyClear();	--Ò»ÖÜÒ»Çå
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()
	SetLogoutRV(0);
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	SetFightState(0);	--ºÍÆ½×´Ì¬
	SetDeathScript("");	--Çå¿ÕËÀÍö½Å±¾
	SetTempRevPos(0,0,0);	--É¾³ýÁÙÊ±ÖØÉúµã
	ForbidChangePK(0);	--¿ÉÒÔ×ª»»PK×´Ì¬
	SetPKFlag(0,0);	--ÎÞPK×´Ì¬
	UseScrollEnable(1);	--ÔÊÐíÊ¹ÓÃ»Ø³Ç·û
	ForbitTrade(0);	--ÔÊÐí½»Ò×
	StallEnable(1);	--ÔÊÐí°ÚÌ¯
	OpenFriendliness(1);	--¿ÉÔö¼ÓºÃ¸Ð¶È
	SetDeathPunish(1);	--ÓÐËÀÍö³Í·£
	LeaveTeam();	--Àë¿ª¶ÓÎé
	StopTimeGuage(-2);
	InteractiveEnable(1);	--ÔÊÐí»¥¶¯
	MS_ClearTempTaskValue();
end;
--Çå³ýMissionËùÓÃµ½µÄÁÙÊ±±äÁ¿
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;

