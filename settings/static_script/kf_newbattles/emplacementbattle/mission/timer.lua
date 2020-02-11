--filename:timer.lua
--create date:2006-06-19
--describe:ÅÚÌ¨Õù¶áÕ½³¡ÖÐÖ÷¼ÆÊ±Æ÷½Å±¾
Include("\\settings\\static_script\\kf_newbattles\\emplacementbattle\\emplacementbattle_head.lua");
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
			--AddGlobalNews("¿ç·þÅÚÌ¨Õ½ÒÛÒÑ¾­´òÏì,ÇëÒÑ±¨ÃûµÄÓ¢ÐÛÑ¸ËÙ¸ÏÍùÕ½³¡£¡Î´±¨ÃûµÄÓ¢ÐÛÇëÁô´ýÔ­´¦£¬¾²ºò¼ÑÒô£¡");
			--Msg2Global("¿ç·þÅÚÌ¨Õ½ÒÛÒÑ¾­´òÏì,ÇëÒÑ±¨ÃûµÄÓ¢ÐÛÑ¸ËÙ¸ÏÍùÕ½³¡£¡Î´±¨ÃûµÄÓ¢ÐÛÇëÁô´ýÔ­´¦£¬¾²ºò¼ÑÒô£¡");
		end;
	else
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Ph¸o §µi ChiÕn Liªn Server khai chiÕn cßn "..(floor(nLoop/10)*5).." phót, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh tham gia!");
			Msg2Global("Ph¸o §µi ChiÕn Liªn Server khai chiÕn cßn "..(floor(nLoop/10)*5).." phót, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh tham gia!");
		end;
		Msg2MSAll(MISSION_ID," cßn "..Get_Time_String(READY_TIME/18*nLoop)..", "..tBattleName[BATTLE_TYPE].."s¾p b¾t ®Çu. Sè ng­êi Tèng-Liªu hiÖn lµ: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
	end;
end;

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP);
	local nPlayerSong = GetMSPlayerCount(MISSION_ID,SONG_ID);
	local nPlayerLiao = GetMSPlayerCount(MISSION_ID,LIAO_ID);

	local nOccupyTime = 0;
	if nLoop == 0 then
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--Èç¹ûÄ¿Ç°»¹Õ¼Áì×ÅÅÚÌ¨
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			SetMissionV(MV_OCCUPY_TIME_SONG,GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_SONG,0);		
			SetMissionV(MV_OCCUPY_TIME_SONG, GetMissionV(MV_OCCUPY_TIME_SONG) + 100);
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			SetMissionV(MV_OCCUPY_TIME_LIAO,GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_LIAO,0);			
			SetMissionV(MV_OCCUPY_TIME_LIAO, GetMissionV(MV_OCCUPY_TIME_LIAO) + 100);
		end;
		local nTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		local sResult = "";
		if nTimeSong > nTimeLiao then
			SetMissionV(MV_WINNER,SONG_ID);--ËÎÓ®
		elseif nTimeSong == nTimeLiao then
			SetMissionV(MV_WINNER,ALL_ID);--´òÆ½
		else
			SetMissionV(MV_WINNER,LIAO_ID);--ÁÉÓ®
		end;
		if nTimeSong > nTimeLiao then
			sResult = "Nh¹n M«n Quan-Ph¸o ®µi chiÕn kÕt thóc, phe Tèng giµnh th¾ng lîi chung cuéc!";
		elseif nTimeLiao > nTimeSong then
			sResult = "Nh¹n M«n Quan-Ph¸o ®µi chiÕn kÕt thóc, phe Liªu giµnh th¾ng lîi chung cuéc!";
		else
			sResult = "Nh¹n M«n Quan-Ph¸o ®µi chiÕn kÕt thóc, hai bªn hßa nhau!";
		end;
		Msg2MSAll(MISSION_ID,tBattleName[BATTLE_TYPE].." ®· kÕt thóc.");
		Msg2MSAll(MISSION_ID,"Thêi gian chiÕm lÜnh ph¸o ®µi gi÷a Tèng-Liªu lµ: Tèng ["..nTimeSong.." gi©y], Liªu ["..nTimeLiao.." gi©y]."..sResult);
		StopMissionTimer(MISSION_ID,TIMER_ID);
		StopMissionTimer(MISSION_ID,INJURE_TIMER_ID);
		StartMissionTimer(MISSION_ID,TIMER_ID,WAITOUT_TIME);
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP);
		SetMissionV(MV_BATTLE_STATE,MS_STATE_COMPLETE);
		BT_ClearRelayData();
		BT_OperateAllPlayer(tell_end,{},ALL_ID);
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		local nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG);
		local nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO);
		if GetMissionV(MV_TAKE_TIME_SONG) ~= 0 then	--Èç¹ûÄ¿Ç°»¹Õ¼Áì×ÅÅÚÌ¨
			nOccupyTimeSong = GetTime() - GetMissionV(MV_TAKE_TIME_SONG);
			nOccupyTimeSong = GetMissionV(MV_OCCUPY_TIME_SONG)+nOccupyTimeSong;
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTimeLiao = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			nOccupyTimeLiao = GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTimeLiao;	
		end;
		Msg2MSAll(MISSION_ID,"TiÕn ®é thêi gian: ["..(FIGHT_TIMER_LOOP-nLoop+1)..":"..(FIGHT_TIMER_LOOP+1).."]");
		local nScaleSong = floor(100*(nOccupyTimeSong/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		local nScaleLiao = floor(100*(nOccupyTimeLiao/((FIGHT_TIME/18)*(FIGHT_TIMER_LOOP+1))));
		Msg2MSAll(MISSION_ID,"Thêi gian chiÕm lÜnh ph¸o ®µi hiÖn t¹i gi÷a Tèng-Liªu lµ: Tèng ["..nScaleSong.."]:["..nScaleLiao.."] Liªu");
		if mod(nLoop,2) == 0 then
			BT_OperateAllPlayer(BT_KickSleeper,{},ALL_ID);
		end;
		if mod(nLoop,3) == 0 then	--Ò»·ÖÖÓ±¨Ò»´ÎË«·½ÈËÊý
			Msg2MSAll(MISSION_ID,"Sè ng­êi Tèng-Liªu trong chiÕn tr­êng hiÖn lµ: Tèng ["..nPlayerSong.."]:["..nPlayerLiao.."] Liªu");
		end;
		if mod(nLoop,5*3) == 0 then	--Îå·ÖÖÓË¢Ò»´ÎNPC
			Create_Npc("Thæ d©n",GetMissionV(MV_KILL_NATIVE_COUNT));
			SetMissionV(MV_KILL_NATIVE_COUNT,0);
			Create_Npc("VÖ binh Ph¸o ®µi",GetMissionV(MV_KILL_GUARD_COUNT));
			SetMissionV(MV_KILL_GUARD_COUNT,0);		
		end;
		if mod(nLoop,4) == 0 then
			Create_Random_Pos_Box(GetMissionV(MV_KILL_BOX_COUNT));
		end;
		if (nLoop == 105 or nLoop == 75 or nLoop == 45 or nLoop == 15) and 0 ~= Create_LengXiangLing_Boss() then
			Msg2MSAll(MISSION_ID, format("BOSS%s ®· ®æi míi", "L·nh H­¬ng L¨ng"));
		end
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
	PlayMusic("\\music\\themusicisnotexist.mp3",1);
	Say(tBattleName[BATTLE_TYPE].."®· kÕt thóc, sù næ lùc cña c¸c vÞ sÏ ®­îc ban th­ëng xøng ®¸ng.",0);
	SetFightState(0);
end;