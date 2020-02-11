--filename:timer.lua
--create date:2006-06-16
--describe:Á¸²ÝÕù¶áÕ½³¡ÖÐÖ÷¼ÆÊ±Æ÷½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\resourcebattle\\resourcebattle_head.lua");
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
			AddGlobalNews("Th¶o cèc chiÕn, Ph¸o ®µi chiÕn, Th«n trang chiÕn s¾p khai cuéc, nh÷ng ai ®· b¸o danh nhanh chãng vµo trong chuÈn bÞ.");
			Msg2Global("Th¶o cèc chiÕn, Ph¸o ®µi chiÕn, Th«n trang chiÕn s¾p khai cuéc, nh÷ng ai ®· b¸o danh nhanh chãng vµo trong chuÈn bÞ.");
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
	local nResSong = Get_ResCount(SONG_ID);
	local nResLiao = Get_ResCount(LIAO_ID);
	local sResult = "";
	if nLoop == 0 then	
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." ®· kÕt thóc.");
		if nResSong > nResLiao then
			sResult = "Phe Tèng giµnh th¾ng lîi chung cuéc t¹i chiÕn dÞch th¶o cèc"
		elseif nResLiao > nResSong then
			sResult = "Phe Liªu giµnh th¾ng lîi chung cuéc t¹i chiÕn dÞch th¶o cèc"
		else
			sResult = "Tèng-Liªu ®«i bªn bÊt ph©n th¾ng b¹i t¹i chiÕn dÞch th¶o cèc"
		end;
		BT_ClearRelayData();
		Msg2MSAll(MISSION_ID,"L­¬ng th¶o hai bªn nép cuèi cïng lµ: Tèng ["..nResSong.."], Liªu ["..nResLiao.."]."..sResult);
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		Msg2MSAll(MISSION_ID,"L­¬ng th¶o Tèng-Liªu hiÖn cã"..nResSong..":"..nResLiao..", tiÕn ®é thêi gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		if mod(nLoop,2) == 0 then
			Reflash_Res();	--40ÃëË¢ÐÂÒ»´ÎÁ¸²Ýµã
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--Ã¿Ò»·ÖÖÓ¹«²¼Ò»ÏÂµ±Ç°Ë«·½ÈËÊý
			Msg2MSAll(MISSION_ID,"Sè ng­êi Tèng-Liªu hiÖn t¹i: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
			Create_Res_Npc(ceil(GetMSPlayerCount(MISSION_ID,ALL_ID)/2));	--Ò»·ÖÖÓË¢Ò»´Î¸ß¼¶Á¸²Ý¶Ñ
		end;
		if mod(nLoop,15) == 0 then	--Ã¿Îå·ÖÖÓ´¥·¢Ò»´ÎÉ½Ôô´ò½ÙºóÓªÊÂ¼þ
			Create_Cateran_Even();
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

function tell_end(tArg)
	Say(tBattleName[BATTLE_TYPE].."®· kÕt thóc, sù næ lùc cña c¸c vÞ sÏ ®­îc ban th­ëng xøng ®¸ng.",0);
	SetFightState(0);
end;