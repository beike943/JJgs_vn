--filename:timer.lua
--create date:2006-06-19
--describe:ÅÚÌ¨Õù¶áÕ½³¡ÖÐÖ÷¼ÆÊ±Æ÷½Å±¾
Include("\\script\\newbattles\\emplacementbattle\\emplacementbattle_head.lua");
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
		if mod(nLoop,10) == 0 then
			AddGlobalNews("Giê khai chiÕn ba n¬i: Thu ThËp L­¬ng Th¶o, B¶o VÖ Thµnh Tr×, Gi¶i Cøu N«ng Trang chØ cßn"..(floor(nLoop/10)*5).." phót, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh tham gia!");
			Msg2Global("Giê khai chiÕn ba n¬i: Thu ThËp L­¬ng Th¶o, B¶o VÖ Thµnh Tr×, Gi¶i Cøu N«ng Trang chØ cßn"..(floor(nLoop/10)*5).." phót, mêi c¸c vÞ anh hïng nhanh chãng b¸o danh tham gia!");
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
		elseif GetMissionV(MV_TAKE_TIME_LIAO) ~= 0 then
			nOccupyTime = GetTime() - GetMissionV(MV_TAKE_TIME_LIAO);
			SetMissionV(MV_OCCUPY_TIME_LIAO,GetMissionV(MV_OCCUPY_TIME_LIAO)+nOccupyTime);
			SetMissionV(MV_TAKE_TIME_LIAO,0);			
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
			sResult = "B¶o VÖ Thµnh Tr× kÕt thóc, phe Tèng giµnh th¾ng lîi chung cuéc!";
		elseif nTimeLiao > nTimeSong then
			sResult = "B¶o VÖ Thµnh Tr× kÕt thóc, phe Liªu giµnh th¾ng lîi chung cuéc!";
		else
			sResult = "B¶o VÖ Thµnh Tr× kÕt thóc, hai bªn hßa nhau!";
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