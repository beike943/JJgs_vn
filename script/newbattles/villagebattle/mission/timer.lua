--filename:timer.lua
--create date:2006-06-5
--describe:´åÂäÕ½¼ÆÊ±Æ÷
Include("\\script\\newbattles\\villagebattle\\villagebattle_head.lua");
function OnTimer()
	if GetMissionV(MV_BATTLE_STATE) == MS_STATE_PEACE then
	
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_READY then
		Process_Ready_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_FIGHT then
		Process_Fight_Timer();
	elseif GetMissionV(MV_BATTLE_STATE) == MS_STATE_COMPLETE then
		Process_WaitOut_Timer();
	end;
end;

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nGlobalState = GetGlbValue(GLB_NEW_BATTLESTATE);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		RunMission(MISSION_ID);
		if mod(nGlobalState,10) == 1 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--±äÎªxx2
			AddGlobalNews("Thu ThËp L­¬ng Th¶o, B¶o VÖ Thµnh Tr×, Gi¶i Cøu N«ng Trang s¾p khai cuéc, nh÷ng ai ®· b¸o danh nhanh chãng vµo trong chuÈn bÞ.");
			Msg2Global("Thu ThËp L­¬ng Th¶o, B¶o VÖ Thµnh Tr×, Gi¶i Cøu N«ng Trang s¾p khai cuéc, nh÷ng ai ®· b¸o danh nhanh chãng vµo trong chuÈn bÞ.");
		end;
	else
--		if mod(nLoop,10) == 0 then
--			AddGlobalNews("¾àÑãÃÅ¹Ø²Ý¹È³¡Õù¶áÕ½¡¢ÑãÃÅ¹ØÅÚÌ¨Õù¶áÕ½¡¢ÑãÃÅ¹Ø´åÂäÕù¶áÕ½Èý³¡Õ½ÒÛ´òÏì»¹ÓÐ"..(floor(nLoop/10)*5).."·ÖÖÓ£¬Çë¸÷Â·Ó¢ÐÛËÙËÙ±¨Ãû²ÎÕ½£¬ÓùµÐÇÚÍõ£¡");
--			Msg2Global("¾àÑãÃÅ¹Ø²Ý¹È³¡Õù¶áÕ½¡¢ÑãÃÅ¹ØÅÚÌ¨Õù¶áÕ½¡¢ÑãÃÅ¹Ø´åÂäÕù¶áÕ½Èý³¡Õ½ÒÛ´òÏì»¹ÓÐ"..(floor(nLoop/10)*5).."·ÖÖÓ£¬Çë¸÷Â·Ó¢ÐÛËÙËÙ±¨Ãû²ÎÕ½£¬ÓùµÐÇÚÍõ£¡");
--		end;
		Msg2MSAll(MISSION_ID," cßn "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s¾p b¾t ®Çu. Sè ng­êi Tèng-Liªu hiÖn lµ: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	--´¦ÀíÄ¿±êÕ½¶·NPC´ò¶·³¬Ê±
	process_fight_timeout(SONG_ID)
	process_fight_timeout(LIAO_ID)
	local nStepSong = GetMissionV(MV_SONG_TASKSTEP);
	local nStepLiao = GetMissionV(MV_LIAO_TASKSTEP);
	local sResult = "";
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		SetMissionV(MV_WINNER,ALL_ID);	--Ê±¼ä½áÊøÊ±Ë«·½¶¼Ã»ÓÐÕÒµ½Ê×Áì£¬»áÔÚEndMission´¦´¦ÀíÊ¤¸º¹ØÏµ
		if nStepSong > nStepLiao then
			sResult = "Phe Tèng giµnh th¾ng lîi chung cuéc t¹i chiÕn dÞch Gi¶i Cøu N«ng Trang";
		elseif nStepLiao > nStepSong then
			sResult = "Phe Liªu giµnh th¾ng lîi chung cuéc t¹i chiÕn dÞch Gi¶i Cøu N«ng Trang";
		else
			sResult = "Tèng-Liªu hai bªn bÊt ph©n th¾ng b¹i t¹i chiÕn dÞch Gi¶i Cøu N«ng Trang";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." ®· kÕt thóc, Tèng-Liªu hai bªn vÉn ch­a t×m ra thñ lÜnh.");
		Msg2MSAll(MISSION_ID,"NhiÖm vô t×m thñ lÜnh thæ d©n hai bªn lµ: Tèng ["..nStepSong.."], Liªu ["..nStepLiao.."]."..sResult);
		Msg2MSAll(MISSION_ID,"");
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"TiÕn ®é nhiÖm vô cña Tèng-Liªu hiÖn lµ: Tèng ["..nStepSong.."]:["..nStepLiao.."] Liªu, tiÕn ®é thêi gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"Sè ng­êi Tèng-Liªu hiÖn t¹i: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID," cßn "..(COMPLETE_TIME/18*nLoop).." gi©y rêi khái chiÕn tr­êng");
	end;
end;
--´¦ÀíÓëÄ¿±êNPCÕ½¶·³¬Ê±µÄÇé¿ö
function process_fight_timeout(nCamp)
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local sNewTargetName = "";
	local nTaskFailed = 0;
	if GetMissionV(MV_TARGET_NPC_STATE_SONG+nCamp-1) == 1 then	--Èç¹ûÄ¿Ç°ÈÎÎñNPCÎªÕ½¶·×´Ì¬
		local nNpcType = GetMissionV(MV_FIGHT_NPC_TYPE_SONG+nCamp-1);
		local nBeginTime = GetMissionV(MV_NPC_FIGHT_BEGIN_SONG+nCamp-1);
		if nNpcType == SICK_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT1 then
				BT_ShowDebugInfor("Qu¸ giê thï hËn NPC");
				Modify_Task_Step(nCamp,-2);
				nTaskFailed = 1;
			end;
		elseif nNpcType == ANGRY_NPC then
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT2 then
				BT_ShowDebugInfor("Qu¸ giê phÉn né NPC");
				Modify_Task_Step(nCamp,-3);
				nTaskFailed = 1;
			end;		
		else
			if nBeginTime - nLoop >= FIGHT_NPC_TIMEOUT3 then
				BT_ShowDebugInfor("Qu¸ giê cuång b¹o NPC");
				Modify_Task_Step(nCamp,-5);
				nTaskFailed = 1;
			end;		
		end;
		if nTaskFailed == 1 then
			sNewTargetName = Go_To_Next_Step(nCamp);
			if sNewTargetName == "" then	--nCamp·½ÈËÊýÎª0
				return 0;
			end;
			BT_OperateAllPlayer(tell_fail,{sNewTargetName,nCamp},nCamp);
		end
	end;
end;

function tell_fail(tArg)
	local sName = tArg[1];
	local nCamp = tArg[2];
	local sContent = "";
	sContent = "§¸ng tiÕc! NhiÖm vô ®· thÊt b¹i. Nh­ng ta võa nhËn ®­îc tin tøc: Thæ d©n <color=yellow>"..sName.."<color> cã thÓ biÕt vÞ trÝ cña thñ lÜnh, mêi <color=yellow>"..GetMissionS(MSTR_SONG_ONE+nCamp-1)..","..GetMissionS(MSTR_SONG_TWO+nCamp-1)..","..GetMissionS(MSTR_SONG_THREE+nCamp-1).."<color> mau ®Õn ®ã t×m B¸ch Sù Th«ng cã liªn quan ®Ó t×m ra t«ng tÝch <color=yellow>"..sName.."<color>.";
	Say(sContent,0);
end;

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."®· kÕt thóc, sù næ lùc cña c¸c vÞ sÏ ®­îc ban th­ëng xøng ®¸ng.",0);
	SetFightState(0);
	--store_battle_infor();
end;

function store_battle_infor()
	local nSongStep = GetMissionV(MV_SONG_TASKSTEP);
	local nLiaoStep = GetMissionV(MV_LIAO_TASKSTEP);
	local tPointRank = BT_SortMSPlayerByTaskValue(PT_BATTLEPOINT,0)
	local tRankTable = {
					[1] = "",
					[2] = "",
					[3] = "",
					[4] = "",
					[5] = "",
					}
	for i=1,5 do
		if tPointRank[i] == nil then
			break;
		else
			tRankTable[i] = tPointRank[i];
		end;
	end;
	CustomDataSave(CD_BTS_VILLAGE,"ddsssss",nSongStep,nLiaoStep,tRankTable[1],tRankTable[2],tRankTable[3],tRankTable[4],tRankTable[5]);
end;