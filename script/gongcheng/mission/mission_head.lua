Include("\\script\\gongcheng\\gongcheng_function.lua");
Include("\\script\\lib\\writelog.lua");

--Missionº¯Êý==============================================================================
--³õÊ¼»¯Mission
function MS_InitMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_READY);	--ÉèÖÃMissionµÄ×´Ì¬Îª×¼±¸×´Ì¬
	SetMissionV(MV_TIMER_LOOP,READY_TIMER_COUNT);	--ÉèÖÃ¼ÆÊ±Æ÷×Ü¼ÆÊ±´ÎÊý
	StartMissionTimer(MISSION_ID,TIMER_ID,READY_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸ö¼ÆÊ±Æ÷
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local szCityName,nCityMapID,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	local szGongName,szShouName = GCZ_GetCampNameFromRelay(nCityMapID,ALL_ID);
	SetMissionS(MS_GONG_TONG_NAME,szGongName);
	SetMissionS(MS_SHOU_TONG_NAME,szShouName);
	SetMissionS(MS_CITY_NAME,szCityName);
	local nMSUID = MS_CreateMSUID(nCityIdx);	--´´½¨Ò»¸öMissionÎ¨Ò»ID
	SetMissionV(MV_MISSION_UID,nMSUID);	
	GCZ_InitGraveyard();
	GCZ_CreateTrap(nBattleMapID);
	GCZ_InitTrap();	--Èý¸ö³ÇÃÅË«·½¾ù¿ÉÍ¨¹ýÖ±µ½Ä³Ò»·½ÅÉÈË×¤ÊØºó
	GCZ_CreateNpc(nBattleMapID);
	WriteLog("[C«ng thµnh chiÕn] C«ng thµnh : 1 trËn Mission ®· b¾t ®Çu, MSUID lµ: "..nMSUID..". Phe c«ng: "..szGongName.."; Phe thñ: "..szShouName);
end;
--Mission¿ªÊ¼
function MS_StartMission()
	SetMissionV(MV_MISSION_STATE,MS_STATE_GONGMEN);	--ÉèÖÃMissionµÄ×´Ì¬Îª¿ªÊ¼×´Ì¬
	SetMissionV(MV_TIMER_LOOP,GONGMEN_TIMER_COUNT);	--ÉèÖÃ¿ªÊ¼×´Ì¬µÄ³ÖÐøÊ±¼ä
	StopMissionTimer(MISSION_ID,TIMER_ID);	--½áÊøÇ°Ò»¸ö¼ÆÊ±Æ÷
	StartMissionTimer(MISSION_ID,TIMER_ID,GONGMEN_TIMER_INTERVAL*FRAME_PER_MIN);	--¿ªÊ¼Ò»¸öÐÂµÄ¼ÆÊ±Æ÷
	mf_Talk2Camp(MISSION_ID,ALL_ID,"§¹i qu©n ®· ®Õn, trèng trËn ®· vang...C«ng thµnh chiÕn b¾t ®Çu!!!!!");
	Msg2MSAll(MISSION_ID,"§¹i qu©n ®· ®Õn, trèng trËn ®· vang...C«ng thµnh chiÕn b¾t ®Çu!!!!!");
	GCZ_PlaySound(ALL_ID,"Õ½¶·¿ªÊ¼.wav");
	SetMissionV(MV_CUR_MUSIC_GONG,MUSIC_WEIJI);	--ÉèÖÃ×î³õµÄ±³¾°ÒôÀÖ
	SetMissionV(MV_CUR_MUSIC_SHOU,MUSIC_YOUSHI);
	GCZ_PlayBackGroundMusic(ALL_ID);
	SetMissionV(MV_DESTROY_EAST_DOOR,0);	--ÕâÈýÌõÖ¸Áî·½±ã²âÊÔÊ±Ê¹ÓÃRunMission
	SetMissionV(MV_DESTROY_SOUTH_DOOR,0);
	SetMissionV(MV_DESTROY_WEST_DOOR,0);
end;
--Mission½áÊø
function MS_EndMission()
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	SetMissionV(MV_MISSION_STATE,MS_STATE_IDEL)
	local nMSUID = GetMissionV(MV_MISSION_UID);
	--	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	mf_DelAllMSPlayer(MISSION_ID,ALL_ID);	--´ÓMissionÀïÃæÉ¾³ýËùÓÐµÄÍæ¼Ò
	mf_ClearMissionData();
	ClearMapNpc(nBattleMapID);
	ClearMapTrap(nBattleMapID);
	WriteLog("[C«ng thµnh C«ng thµnh chiÕn]:1 trËn Mission ®· kÕt thóc, MSUID lµ: "..nMSUID);
end;
--Àë¿ªMission
function MS_LeaveMission()
	local nGuardID = GetTaskTemp(TEMP_GURAD_ID);
	local nCamp = GCZ_GetPlayerCamp();
	local nOldPlayerIdx = PlayerIndex;
	if nGuardID ~= 0 then	--Èç¹ûÊÇÊØÎÀÀë¿ª
		SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nCamp-1,0);	--ÏàÓ¦µÄ¼ÇÂ¼ÊØÎÀË÷ÒýµÄMissionVÇå0
		if nCamp == GONG_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,SHOU_ID);
		elseif nCamp == SHOU_ID then
			SetMissionV(MV_TRAP_EAST_DOOR+nGuardID-1,ALL_ID);
		end;
	end;
	local bFighting = GetTaskTemp(TEMP_ARENA_FIGHTING);
	if bFighting ~= 0 then	--Èç¹ûÕýÔÚµ¥Ìô
		local nEnemyCamp = GCZ_GetEnemyCamp();
		local nEnemyIdx = GetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,0);	--»ñÈ¡µ¥Ìô¶ÔÊÖµÄË÷Òý
		if nEnemyIdx > 0 then
			SetMissionV(MV_GPIDX_EAST_DOOR+2*(nGuardID-1)+nEnemyCamp-1,nEnemyIdx);	--ÉèÖÃÐÂµÄÊØÎÀ
		end;
		PlayerIndex = nEnemyIdx;
		SetMissionV(MV_EAST_DOOR_DRAW+nGuardID-1,0);
		RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));
		SetFightState(0);
		Restore();
		RestoreNeili();
		SetPos(tEntrancePos[nEnemyCamp][1],tEntrancePos[nEnemyCamp][2]);
		SetTaskTemp(TEMP_ARENA_FIGHTING,0);
		Say("§èi thñ rêi m¹ng, b¹n giµnh ®­îc th¾ng lîi khiªu chiÕn ®¬n ®Êu",0);
		Msg2Player("Tõ chiÕn tr­êng ®¬n ®Êu quay vÒ hËu doanh!");
		PlaySound("\\sound\\µ¥ÌôÊ¤Àû.wav");
		SetTaskTemp(TEMP_CHALLENGER,0);	--Ó®ÁËµÄ¾Í²»ÊÇÌôÕ½ÕßÁË
		Msg2MSAll(MISSION_ID,GetName(nEnemyIdx).."("..tCampNameZ[nEnemyCamp]..") khiªu chiÕn ®¬n ®Êu ®· th¾ng "..GetName(nOldPlayerIdx).."("..tCampNameZ[nCamp].."), trë thµnh t©n Thñ vÖ cña "..tDoorName[nGuardID]..".");
		PlayerIndex = nOldPlayerIdx;
	end;
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_RestorePlayerState();	--Õâ¸öÒªÔÚNewWorldÖ®Ç°£¬²»È»ÇÐ»»²»ÁËPK×´Ì¬
	NewWorld(tExitPos[nCamp][nCity][1],tExitPos[nCamp][nCity][2],tExitPos[nCamp][nCity][3]);
	Msg2MSAll(MISSION_ID,tCampNameZ[nCamp].."-"..GetName().." ®· rêi khái chiÕn tr­êng");
end;
--¼ÓÈëMission
function MS_JoinMission(nCamp)
	SetTaskTemp(TEMP_CAMP,nCamp);
	local nBattleMapID = SubWorldIdx2ID(SubWorld);
	local _,_,nCityIdx = GCZ_GetCityInfo(nBattleMapID);
	SetTaskTemp(TEMP_CITY_INDEX,nCityIdx);
	NewWorld(nBattleMapID,tEntrancePos[nCamp][1],tEntrancePos[nCamp][2]);
	if GCZ_IsReinforcement(nCamp,nBattleMapID) == 1 then
		AddMSPlayer(MISSION_ID,nCamp+2);
		SetTaskTemp(TEMP_REINFORCEMENT,nCamp);
	else
		AddMSPlayer(MISSION_ID,nCamp);
	end;
	Msg2MSAll(MISSION_ID,"§¹i hiÖp"..GetName().." ®· gia nhËp "..tCampNameZ[nCamp]);
	MS_SetPlayerState();
	if nCamp == GONG_ID then
		Say("Phe c«ng: ph¸ hñy vµ chiÕm lÜnh <color=yellow>8<color>kú ph­ín hoÆc khi C«ng thµnh chiÕn kÕt thóc ph¸ hñy vµ chiÕm lÜnh <color=yellow>6<color>kú ph­ín lµ giµnh th¾ng lîi. C¬ quan thµnh m«n ch­a bÞ ph¸ hñy hoÆc tr­íc khi chiÕm lÜnh kh«ng thÓ tiÕn vµo thµnh.",0);
	elseif nCamp == SHOU_ID then
		Say("phe thñ: C«ng thµnh chiÕn kÕt thóc, nÕu b¶o vÖ ®­îc <color=yellow>5<color>kú ph­ín tøc giµnh chiÕn th¾ng. Chó ý: NÕu phe c«ng ph¸ hñy vµ chiÕm lÜnh ®­îc <color=yellow>8<color> kú ph­ín th× C«ng thµnh chiÕn lËp tøc kÕt thóc, thñ thµnh thÊt b¹i. Phe ta khi trÊn thñ thµnh, ®Þch ph­¬ng sÏ kh«ng thÓ vµo ®­îc thµnh.",0);
	end;
end;
--´¦Àí×¼±¸½×¶ÎµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessReadyTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		RunMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,GetMissionS(MS_CITY_NAME).." chiÕn sù cßn "..(nLoop*READY_TIMER_INTERVAL).." phót n÷a sÏ b¾t ®Çu ");
	end;
end;
--¹¥ÃÅ½×¶Î¼ÆÊ±Æ÷
function MS_ProcessGongMenTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		GCZ_ComeToGongmeng();
		for i=1,getn(tChengMenJiGuanPos) do
			local nJiGuanIdx = GetMissionV(MV_EAST_JIGUAN_INDEX+i-1);
			if nJiGuanIdx ~= 0 then
				--SetNpcLifeTime(nJiGuanIdx,0);	--ÈÃÃ»ÏûÊ§µÄ³ÇÃÅ»ú¹ØÏûÊ§
				AddUnitStates(nJiGuanIdx,1,-100000000);	--½«³ÇÃÅ»ú¹ØµÄÉúÃüÉèÎª0
				SetMissionV(MV_DESTROY_EAST_DOOR+i-1,1);	--³ÇÃÅÎªÓÀ¾Ã´ò¿ª×´Ì¬
				SetMissionV(MV_EAST_JIGUAN_INDEX+i-1,0);
			end;
		end;
		GCZ_Msg2Camp("C«ng thµnh ®¹i ph¸o ®­îc khai háa, thµnh m«n bÞ ph¸ hñy hoµn toµn",ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C¸ch thêi gian C«ng thµnh ®¹i ph¸o cßn "..(nLoop*GONGMEN_TIMER_INTERVAL).." phót ");
	end;
end;
--¹¥³Ç½×¶Î¼ÆÊ±Æ÷
function MS_ProcessGongChengTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		SetMissionV(MV_MISSION_STATE,MS_STATE_ENDING);
		SetMissionV(MV_TIMER_LOOP,ENDING_TIMER_COUNT);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,ENDING_TIMER_INTERVAL*FRAME_PER_MIN);
		local nCurFlagCount = GetMissionV(MV_FLAG_OWN_COUNT);
		local szResult = "";
		local nBattleMapID = SubWorldIdx2ID(SubWorld);
		local _,nCityMapID = GCZ_GetCityInfo(nBattleMapID);
		if nCurFlagCount >= FLAG_COUNT_END_WIN then	--¹¥³Ç·½Ó®ÁË
			SetCityWarWinner(nCityMapID,GetMissionS(MS_GONG_TONG_NAME));
			szResult = "C«ng thµnh chiÕn ®· kÕt thóc, cuèi cïng bang héi <color=yellow>"..GetMissionS(MS_GONG_TONG_NAME).."<color> chiÕm lÜnh thµnh c«ng (do bang héi <color=red>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> thñ vÖ) <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(GONG_ID,"¹¥³ÇÕ½Ê¤Àû.wav");
			GCZ_PlaySound(SHOU_ID,"¹¥³ÇÕ½Ê§°Ü.wav");
			SetMissionV(MV_WAR_RESULT,GONG_ID);	--ÉèÖÃ½á¹û
		else	--ÊØ³Ç·½Ó®ÁË
			SetCityWarWinner(nCityMapID,GetMissionS(MS_SHOU_TONG_NAME));
			szResult = "C«ng thµnh chiÕn ®· kÕt thóc, cuèi cïng bang héi <color=yellow>"..GetMissionS(MS_SHOU_TONG_NAME).."<color> trÊn ¸p thµnh c«ng bang héi <color=red>"..GetMissionS(MS_GONG_TONG_NAME).."<color>, gi÷ v÷ng ®­îc <color=green>"..GetMissionS(MS_CITY_NAME).."<color>.";
			GCZ_PlaySound(SHOU_ID,"¹¥³ÇÕ½Ê¤Àû.wav");
			GCZ_PlaySound(GONG_ID,"¹¥³ÇÕ½Ê§°Ü.wav");
			SetMissionV(MV_WAR_RESULT,SHOU_ID);	--ÉèÖÃ½á¹û
		end;
		local lfFunc = function(tArg)
			Say(%szResult,0);
			SetFightState(0);
			if GetTask(TNC_CAMP) == GetMissionV(MV_WAR_RESULT) then
				SetTask(TASK_AWARD_WIN,GetTask(TASK_AWARD_WIN)+1);
			else
				SetTask(TASK_AWARD_LOST,GetTask(TASK_AWARD_LOST)+1);
			end;
		end;
		mf_OperateAllPlayer(MISSION_ID,lfFunc,{},ALL_ID);
		AddGlobalCountNews(szResult,1);
		Msg2Global(sf_RemoveTag(szResult,"<",">"));
		PlayMusic("\\music\\themusicisnotexist.mp3",1);
		Msg2MSAll(MISSION_ID,"C«ng thµnh chiÕn ®· kÕt thóc, mäi ng­êi rêi khái chiÕn tr­êng th«i");
		WriteLog("[c«ng thµnh C«ng thµnh chiÕn]:"..sf_RemoveTag(szResult,"<",">").."MSUID lµ "..GetMissionV(MV_MISSION_UID));
		WriteLogEx("Cong Thanh Chien",szResult)
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"Thêi gian c«ng thµnh cßn "..(nLoop*GONGMEN_TIMER_INTERVAL).." phót ");
	end;
end;
--´¦ÀíµÈ´ý½áÊøµÄ¼ÆÊ±Æ÷º¯Êý
function MS_ProcessEndingTimer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then		
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
		Msg2MSAll(MISSION_ID,"C«ng thµnh chiÕn tr­êng s¾p kÕt thóc, chØ cßn"..(nLoop*ENDING_TIMER_INTERVAL).." phót ");
	end;
end;
--µÇÂ½´¥·¢Æ÷º¯Êý
function OnLogin()
	MS_RestorePlayerState();
	WriteLog("[c«ng thµnh C«ng thµnh chiÕn]: HiÖp kh¸ch  "..GetName().." Rêi Mission kh«ng b×nh th­êng, ®ang trong qu¸ tr×nh xö lý ®¨ng nhËp.");
end;
--=====================================================================================
--´´½¨Ò»¸öMSUID£¨µ±Ç°MissionÎ¨Ò»±êÊ¶£©
function MS_CreateMSUID(nCityIdx)
	local nMSUID = tonumber(date("%y%m%d"))*10+nCityIdx+random(1,1000);	--ºóÃæµÄ¼ÓÊýÊÇÓÃÀ´·½±ã²âÊÔµÄ
	return nMSUID;
end;
--½øÈë³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_SetPlayerState()
	SetTask(TNC_MUID,GetMissionV(MV_MISSION_UID));
	local nCamp = GCZ_GetPlayerCamp();
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	SetTask(TNC_CAMP,nCamp);
	SetCampToPlayer(tCampNameP[nCamp]);
	EnterChannel(tCityChannel[nCity][1]);
	EnterChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	LeaveTeam();
	SetLogoutRV(1);	--ÉèÖÃµÇÂ½µãÎª³ÇÊÐÖØÉúµã
	SetDeathPunish(0);	--ÎÞËÀÍö³Í·£
	InteractiveEnable(0);	--¹Ø±Õ½»»¥	±ØÐëÔÚNewWorldÖ®ºóÖ´ÐÐ²ÅÓÐÐ§
	StallEnable(0);	--½ûÖ¹°ÚÌ¯(ÏÂÏßºó»á±»Çåµô)
	UseScrollEnable(0);	--½ûÖ¹Ê¹ÓÃ»Ø³Ç·û
	SetPKFlag(1,nCamp);
	ForbidChangePK(1);	--½ûÖ¹¸Ä±äPK×´Ì¬
	SetFightState(0);
	KillFollower();	--É¾³ý¸ú°à
	ClearStolenSkill();	--Çå³ýÒÑÍµÈ¡µÄ¼¼ÄÜ£¬Õë¶Ô¹÷×Ó
	SetDeathScript("\\script\\gongcheng\\player_death.lua");
	local nCurMapID = tCityInfo[nCity][3];
	SetTempRevPos(nCurMapID,tEntrancePos[nCamp][1]*32,tEntrancePos[nCamp][2]*32);	--ÉèÖÃÖØÉúµã
	CreateTrigger(3,LOG_ID,LOG_CUSTOM_ID);
	PlayMusic("\\music\\"..tMusicFileName[GetMissionV(MV_CUR_MUSIC_GONG+nCamp-1)],1);	--²¥·Å±³¾°ÒôÀÖ
end;
--Àë¿ª³¡µØÊ±Í³Ò»½øÐÐµÄ²Ù×÷
function MS_RestorePlayerState()
	RemoveTrigger(GetTrigger(LOG_CUSTOM_ID));
	local nCamp = GCZ_GetPlayerCamp();
	SetLogoutRV(0)
	SetDeathPunish(1);
	InteractiveEnable(1)
	StallEnable(1)
	UseScrollEnable(1);
	ForbidChangePK(0);
	SetPKFlag(0,0);
	LeaveTeam();
	SetFightState(0)
	SetDeathScript("");
	SetTempRevPos(0,0,0);
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	SetCampToPlayer("");
	--ÏÂÃæÈýÌõÖ¸ÁîÖ÷ÒªÊÇÕë¶Ôµ¥ÌôµÄÍæ¼Ò
	DesaltPlayer(0);
	UseSkillEnable(1);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
	local nCity = GetTaskTemp(TEMP_CITY_INDEX);
	MS_ClearTempTaskValue();
	if nCity > 0 then	--Èç¹ûÊÇOnLogin´¥·¢µÄ£¬nCity¾ÍÊÇ0,ÓÚÊÇ²»ÓÃ´¦ÀíÁË
		LeaveChannel(tCityChannel[nCity][1]);
		LeaveChannel(tCampChannel[(nCity-1)*2+nCamp][1]);
	end;
end;
--Çå³ýËùÓÐµÄÕ½³¡ÁÙÊ±±äÁ¿
function MS_ClearTempTaskValue()
	for i=TEMP_BEGIN,TEMP_END do
		SetTaskTemp(i,0);
	end;
end;