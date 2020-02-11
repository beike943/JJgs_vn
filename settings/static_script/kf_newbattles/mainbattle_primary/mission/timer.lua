--filename:timer.lua
--create date:2006-06-22
--describe:Ö÷Õ½³¡ÖĞÖ÷¼ÆÊ±Æ÷½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\mainbattle_primary\\mainbattle_head.lua");
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
		if mod(nGlobalState,10) == 3 then
			SetGlbValue(GLB_NEW_BATTLESTATE,nGlobalState+1);	--±äÎªxx4
			AddGlobalNews("ChiÕn tr­êng Ngäc M«n quan ®· khai chiÕn. Xin mêi ch­ vŞ anh hïng ®· b¸o danh nhanh chãng vµo trong chuÈn bŞ");
			Msg2Global("ChiÕn tr­êng Ngäc M«n quan ®· khai chiÕn. Xin mêi ch­ vŞ anh hïng ®· b¸o danh nhanh chãng vµo trong chuÈn bŞ");
		end;
	else
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Thêi gian ChiÕn tr­êng Ngäc M«n quan khai chiÕn cßn "..(floor(nLoop/10)*5).." phót, mêi c¸c vŞ anh hïng nhanh chãng b¸o danh tham gia!");
			Msg2Global("Thêi gian ChiÕn tr­êng Ngäc M«n quan khai chiÕn cßn "..(floor(nLoop/10)*5).." phót, mêi c¸c vŞ anh hïng nhanh chãng b¸o danh tham gia!");
		end;
		Msg2MSAll(MISSION_ID," cßn "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s¾p b¾t ®Çu. Sè ng­êi Tèng-Liªu hiÖn lµ: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
		SetMissionV(MV_TIMER_LOOP,nLoop-1);
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." ®· kÕt thóc.");
		if nPubPointSong > nPubPointLiao then
			SetMissionV(MV_WINNER,SONG_ID);
		elseif nPubPointSong < nPubPointLiao then
			SetMissionV(MV_WINNER,LIAO_ID);
		else
			SetMissionV(MV_WINNER,ALL_ID);
		end;
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		local nVillageResult = GetGlbValue(GLB_VILLAGE);
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"TiÕn ®é thêi gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then
			Msg2MSAll(MISSION_ID,"Sè ng­êi Tèng-Liªu hiÖn t¹i: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
		end;
		if mod(nLoop,9) == 0 then	--Èı·ÖÖÓË¢Ò»´Î±¦Ïä
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
			Msg2MSAll(MISSION_ID,"§iÓm tİch lòy c«ng céng Tèng-Liªu hiÖn lµ: Tèng ["..nPubPointSong.."]:["..nPubPointLiao.."] Liªu");
		end;
		if mod(nLoop,30) == 0 then	--Ê®·ÖÖÓË¢Ò»´ÎÆæÈËÒìÊ¿ºÍÍÁÃñÊ×Áì
			Create_Nonaligned_Hero();
			Create_VillagerHeader(nVillageResult);
			BT_ShowBattleRank(10);	--ÏÔÊ¾¸öÈË»ı·ÖÅÅĞĞ°ñÇ°10Ãû
		end;
		if mod(nLoop,9) == 0 then
			BT_ShowDebugInfor("LËp thæ d©n, sè ng­êi:"..GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Random_Pos_Villager(nVillageResult,GetMissionV(MV_KILL_VILLAGER_COUNT));
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_SONG_SOLDIER_COUNT),SONG_ID);
			Create_Fight_NPC(TYPE_SOLDIER,GetMissionV(MV_KILL_LIAO_SOLDIER_COUNT),LIAO_ID);
		end;
		BT_DrivePlayerOutOfShelter();
		BT_CureAllPlayer();
	end;
end;

function Process_WaitOut_Timer()
	local nPlayerAll = GetMSPlayerCount(MISSION_ID,ALL_ID);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nLoop = GetMissionV(MV_TIMER_LOOP);
	if nLoop == 0 then
		StopMissionTimer(MISSION_ID,TIMER_ID);
		CloseMission(MISSION_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID," cßn "..(COMPLETE_TIME/18*nLoop).." gi©y rêi khái chiÕn tr­êng");
	end;
end;

function tell_end(tArg)
	local nPubPointSong = BT_GetMissionPoint(SONG_ID);
	local nPubPointLiao = BT_GetMissionPoint(LIAO_ID);
	local nWhoWin = GetMissionV(MV_WINNER);
	if nWhoWin == SONG_ID then
		szResult = "Phe Tèng th¾ng lîi";
	elseif nWhoWin == LIAO_ID then
		szResult = "Phe Liªu th¾ng lîi ";
	else
		szResult = "hai phe hßa nhau";
	end;
	SetFightState(0);
	RemoveTrigger(GetTrigger(FIGHT_TRIGGER_ID));	--É¾³ıµ¥ÌôÊ±¼ä´¥·¢Æ÷
	BT_SetTempData(PTT_FIGHT_STATE,ROOM_STATE_IDLE);--Çå³ıµ¥ÌôĞÅÏ¢
	BT_SetTempData(PTT_ROOMINDEX,0);
	Say(tBattleName[BATTLE_TYPE].." ®· kÕt thóc, b¹n giÕt ®­îc <color=yellow>"..BT_GetData(PTNC_KILL).."<color> ng­êi, tö trËn <color=yellow>"..BT_GetData(PTNC_DEATH).."<color> lÇn. <color=yellow>§iÓm tİch lòy phe Tèng: "..nPubPointSong..", tİch lòy c«ng céng phe Liªu:"..nPubPointLiao..", cuèi cïng "..szResult.."<color>. C¸c vŞ ®· rÊt næ lùc, chuÈn bŞ ®ãn nhËn ban th­ëng cña hoµng th­îng.",0);
end;