--by liubo
--´¥·¢Æ÷
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")

function OnTimer()
	--print("OnTimer called!")
	SetMissionV(MV_LZZ_GAME_LOOP,GetGameLoop())
	if GetMissionV(MV_LZZ_STATE) == MS_STATE_PEACE then
		--print("Process_Peace_Timer() called!")
		Process_Peace_Timer()
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_READY then
		--print("Process_Ready_Timer() called!")
		Process_Ready_Timer()
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_FIGHT then
		--print("Process_Fight_Timer() called!")
		Process_Fight_Timer()
	elseif GetMissionV(MV_LZZ_STATE) == MS_STATE_COMPLETE then
		--print("Process_WaitOut_Timer() called!")
		Process_WaitOut_Timer()
	else 
		--print("OnTimer Error!")
		StopMissionTimer(MISSIONID,TIMERID)
		WriteLog(tSTRING_MISSION_LOG[1])
		CloseMission(MISSIONID)	
	end
end

function Process_Peace_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP)
	local nPlayerOne = GetMSPlayerCount(MISSIONID,CampSong_ID)
	local nPlayerTwo = GetMSPlayerCount(MISSIONID,CampLiao_ID)
	--¸üÐÂÃæ°å
	LZZ_Panel_Show()
	--Èç¹ûË«·½¶¼Ã»ÓÐÈËÁË£¬¹Ø±ÕMission
	if nPlayerOne == 0 and nPlayerTwo == 0 then
		StopMissionTimer(MISSIONID,TIMERID)
		CloseMission(MISSIONID)	
	end
	if nLoop <= 0 then
		--print("CloseMission Called!")
		StopMissionTimer(MISSIONID,TIMERID)
		Msg2MSAll(MISSIONID,format(tSTRING_MISSION[1],PLAYER_NEED_NUM))
		CloseMission(MISSIONID)		
	else
		--¼ÆÊý¼õÒ»
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		if mod(nLoop,3) == 0 then --5*3Ãë²¥·ÅÒ»´Î
			Msg2MSAll(MISSIONID,"TiÕn ®é thêi gian: ["..(PEACE_TIMER_LOOP-nLoop+1).."/"..(PEACE_TIMER_LOOP+1).."]")
			Msg2MSAll(MISSIONID,"Tû lÖ sè ng­êi 2 phe:"..tCampName[1].."["..nPlayerOne.."]:["..nPlayerTwo.."]"..tCampName[2]..". Khi c¶ 2 phe ®Òu ®¹t "..PLAYER_NEED_NUM.." ng­êi, H¶i ChiÕn Long Ch©u sÏ b¾t ®Çu")
		end
		if nPlayerOne >= PLAYER_NEED_NUM and nPlayerTwo >= PLAYER_NEED_NUM then
			StopMissionTimer(MISSIONID,TIMERID)
			StartMissionTimer(MISSIONID,TIMERID,READY_TIME)
			SetMissionV(MV_TIMER_LOOP,READY_TIMER_LOOP)
			SetMissionV(MV_LZZ_STATE,MS_STATE_READY)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[2],READY_TIME_ATOM))
		end
	end
end

function Process_Ready_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP)
	local nPlayerOne = GetMSPlayerCount(MISSIONID,CampSong_ID)
	local nPlayerTwo = GetMSPlayerCount(MISSIONID,CampLiao_ID)	
	--¸üÐÂÃæ°å
	LZZ_Panel_Show()
	--Èç¹ûË«·½¶¼Ã»ÓÐÈËÁË£¬¹Ø±ÕMission
	if nPlayerOne == 0 or nPlayerTwo == 0 then
		StopMissionTimer(MISSIONID,TIMERID)
		Msg2MSAll(MISSIONID,format(tSTRING_MISSION[1],PLAYER_NEED_NUM))
		CloseMission(MISSIONID)	
	end
	if nLoop <= 0 then
		--ÅÐ¶ÏÏÂÈËÊý
		StopMissionTimer(MISSIONID,TIMERID)
		RunMission(MISSIONID)
		WriteLog("[H¶i ChiÕn Long Ch©u b¾t ®Çu]: thêi gian lµ"..GetMissionV(MV_LZZ_LOG_TIME).."H¶i ChiÕn Long Ch©u ®· b¾t ®Çu råi, sè ng­êi tham gia lµ: ["..nPlayerOne.."]:["..nPlayerTwo.."], tæng sè ng­êi lµ: "..(nPlayerOne+nPlayerTwo))
	else
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		if mod(nLoop,3) == 0 then	--5*3Ãë²¥·ÅÒ»´Î
			Msg2MSAll(MISSIONID," cßn "..Get_Time_String(READY_TIME/FRAME_PER_SECOND*nLoop)..", H¶i ChiÕn Long Ch©u ®· b¾t ®Çu, tû lÖ hµo kiÖn gi÷a 2 phe lµ:"..tCampName[1].."["..nPlayerOne.."]:["..nPlayerTwo.."]"..tCampName[2])
		end
	end
end

function Process_Fight_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP)
	local nPlayerOne = GetMSPlayerCount(MISSIONID,CampSong_ID)
	local nPlayerTwo = GetMSPlayerCount(MISSIONID,CampLiao_ID)	
	local nPointOne = GetMissionV(MV_LZZ_CAMPONE_POINT)
	local nPointTwo = GetMissionV(MV_LZZ_CAMPTWO_POINT)	
	--¸üÐÂÃæ°å
	LZZ_Panel_Show()
	--Èç¹ûË«·½¶¼Ã»ÓÐÈËÁË£¬¹Ø±ÕMission
	if nPlayerOne == 0 and nPlayerTwo == 0 then
		StopMissionTimer(MISSIONID,TIMERID)
		CloseMission(MISSIONID)	
	end
	if nLoop <= 0 then
		StopMissionTimer(MISSIONID,TIMERID)
		StartMissionTimer(MISSIONID,TIMERID,WAITOUT_TIME)
		SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP)
		SetMissionV(MV_LZZ_STATE,MS_STATE_COMPLETE)
		if nPointOne == nPointTwo then 
			SetMissionV(MV_LZZ_WINNER_CAMP,ALL_ID)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[3],tCampName[1],tCampName[2],FIGHT_TIME_ATOM))
		elseif nPointOne > nPointTwo then
			SetMissionV(MV_LZZ_WINNER_CAMP,CampSong_ID)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[5],tCampName[1]))
		elseif nPointOne < nPointTwo then
			SetMissionV(MV_LZZ_WINNER_CAMP,CampLiao_ID)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[5],tCampName[2]))
		end
		--½áÊøÒôÐ§
		LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_war_end.wav",ALL_ID)
		LZZ_OperateAllPlayer(lzz_tell_end,{},ALL_ID)	
	else
		--print("nLoop=",nLoop)
		--print("FIGHT_TIMER_LOOP=",FIGHT_TIMER_LOOP)
		--¿ªÊ¼µÄÊ±ºò²¥·ÅÒ»´Î
		if nLoop == FIGHT_TIMER_LOOP then
			--print("--¿ªÊ¼µÄÊ±ºò²¥·ÅÒ»´Î")
			--²¥·Å¿ªÊ¼ÒôÐ§
			LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_war_beginB.WAV",ALL_ID)
			Msg2MSAll(MISSIONID,tSTRING_MISSION[4])
		end
		--ÑîÆßÐãË¢³öÀ´
		if nLoop == FIGHT_TIMER_YQX then
			----print("--ÑîÆßÐãË¢³öÀ´")
			LZZ_Yangqixiu_Npc()
		end
		--ÏôÌ©Ë¢³öÀ´
		if nLoop == FIGHT_TIMER_XT then
			----print("--ÏôÌ©Ë¢³öÀ´")
			LZZ_Xiaotai_Npc()
		end
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		--ÊÇ·ñË¢³ö»ð´¬
		--============================ÁÉ
		local nTag1,nTag2, nTag3, nTag4
		nTag1 = GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG1)
		nTag2 = GetMissionV(MV_LZZ_LIAOFIREBOAT_TAG2)
		if nTag1 == 0 and nPointTwo >= FIRE_BOAT_TIME_ONE and nPointTwo < FIRE_BOAT_TIME_TWO then
			--ÁíÒ»·½ÏÖ³ö»ð´¬
			LZZ_Liao_Fireboat()
		end
		if nTag1 == 1 and nTag2 == 0 and nPointTwo >= FIRE_BOAT_TIME_TWO and nPointTwo < OVER_GAME_POINT then
			--ÁíÒ»·½ÏÖ³ö»ð´¬
			LZZ_Liao_Fireboat()
		end
		--============================ËÎ
		nTag3 = GetMissionV(MV_LZZ_SONGFIREBOAT_TAG1)
		nTag4 = GetMissionV(MV_LZZ_SONGFIREBOAT_TAG2)
		if nTag3 == 0 and nPointOne >= FIRE_BOAT_TIME_ONE and nPointOne < FIRE_BOAT_TIME_TWO then
			--ÁíÒ»·½ÏÖ³ö»ð´¬
			LZZ_Song_Fireboat()
		end
		if nTag3 == 1 and nTag4 == 0 and nPointOne >= FIRE_BOAT_TIME_TWO and nPointOne < OVER_GAME_POINT then
			--ÁíÒ»·½ÏÖ³ö»ð´¬
			LZZ_Song_Fireboat()
		end
		-------------------------------------------
		if nPlayerOne == 0 then
			if mod(nLoop,6) ==0 then
				SetMissionV(MV_LZZ_CAMPTWO_POINT,nPointTwo+INCREASE_POINT)
			end
		end
		if nPlayerTwo == 0 then
			if mod(nLoop,6) ==0 then
				SetMissionV(MV_LZZ_CAMPONE_POINT,nPointOne+INCREASE_POINT)
			end
		end
		--¼ì²é±È·Ö
		if nPointOne >= OVER_GAME_POINT and nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSIONID,TIMERID)
			StartMissionTimer(MISSIONID,TIMERID,WAITOUT_TIME)
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP)
			SetMissionV(MV_LZZ_STATE,MS_STATE_COMPLETE)
			SetMissionV(MV_LZZ_WINNER_CAMP,ALL_ID)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[3],tCampName[1],tCampName[2],OVER_GAME_POINT))
			LZZ_OperateAllPlayer(lzz_tell_end,{},ALL_ID)
			--½áÊøÒôÐ§
			LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_war_end.wav",ALL_ID)
			return 0								
		end		
		if nPointOne >= OVER_GAME_POINT then
			StopMissionTimer(MISSIONID,TIMERID)
			StartMissionTimer(MISSIONID,TIMERID,WAITOUT_TIME)
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP)
			SetMissionV(MV_LZZ_STATE,MS_STATE_COMPLETE)
			SetMissionV(MV_LZZ_WINNER_CAMP,CampSong_ID)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[5],tCampName[1]))
			LZZ_OperateAllPlayer(lzz_tell_end,{},ALL_ID)	
			--½áÊøÒôÐ§
			LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_war_end.wav",ALL_ID)
			return 0			
		end
		if nPointTwo >= OVER_GAME_POINT then
			StopMissionTimer(MISSIONID,TIMERID)
			StartMissionTimer(MISSIONID,TIMERID,WAITOUT_TIME)
			SetMissionV(MV_TIMER_LOOP,WAITOUT_TIMER_LOOP)
			SetMissionV(MV_LZZ_STATE,MS_STATE_COMPLETE)
			SetMissionV(MV_LZZ_WINNER_CAMP,CampLiao_ID)
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[5],tCampName[2]))
			LZZ_OperateAllPlayer(lzz_tell_end,{},ALL_ID)	
			--½áÊøÒôÐ§
			LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_war_end.wav",ALL_ID)
			return 0
		end		
		--15*4Ãë¹ã²¥Ò»´Î
		if mod(nLoop,4) == 0 then
			Msg2MSAll(MISSIONID,"TiÕn ®é thêi gian: ["..(FIGHT_TIMER_LOOP-nLoop+1).."/"..(FIGHT_TIMER_LOOP+1).."]")
			Msg2MSAll(MISSIONID,"§iÓm chiÕn ®Êu 2 qu©n hiÖn t¹i: "..tCampName[1].."["..OVER_GAME_POINT-nPointTwo.."]:["..OVER_GAME_POINT-nPointOne.."]"..tCampName[2])
		end		
		--15*10Ãë¹ã²¥Ò»´Î
		if mod(nLoop,10) == 0 then
			Msg2MSAll(MISSIONID,format(tSTRING_MISSION[6],tCampName[1],nPlayerOne,nPlayerTwo,tCampName[2]))
		end
		--15*8Ãë=2min²éÑ¯Ò»´Î
		if mod(nLoop,8) == 0 then
			LZZ_OperateAllPlayer(lzz_kicksleep,{},ALL_ID) --Ë¯ÃßµÄÇ¿ÐÐÌß³öÕ½³¡
		end
		--1.5*60=15*6ÃëË¢ÐÂÒ»´ÎÆ¯Á÷Ïä
		if getn(tMsBoxCopy) == 0 then
			for i = 1,getn(tMsBox) do
				tMsBoxCopy[i][1] = tMsBox[i][1]
				tMsBoxCopy[i][2] = tMsBox[i][2]
			end
		end	
		if mod(nLoop,6) == 0 and getn(tMsBoxCopy) ~= 0 then		
			LZZ_Drifting_Box()
		end
		--»ð´¬Î»ÖÃÅÐ¶Ï
		LZZ_FireBoat_Position()
		--ÖÎÓúºÍÆ½×´Ì¬ÏÂµÄÍæ¼Ò
		LZZ_CureAllPlayer()
	end
end

function Process_WaitOut_Timer()
	local nLoop = GetMissionV(MV_TIMER_LOOP)
	--¸üÐÂÃæ°å
	LZZ_Panel_Show()
	if nLoop <= 0 then
		StopMissionTimer(MISSIONID,TIMERID)
		CloseMission(MISSIONID)
	else
		--½áÊøNPC¶Ô»°
		if nLoop == WAITOUT_TIMER_LOOP then
			----print("--½áÊøÒôÐ§")
			--½áÊøÒôÐ§
			--LZZ_OperateAllPlayer(PlaySound,"\\sound\\vn\\scene\\scene_war_end.wav",ALL_ID)
			--
			local nResult = GetMissionV(MV_LZZ_WINNER_CAMP)
			if nResult == CampSong_ID then
				LZZ_Yangqixiu_Npc()
			elseif nResult == CampLiao_ID then
				LZZ_Xiaotai_Npc()
			else
				Msg2MSAll(MISSIONID,tSTRING_MISSION[7])
				Msg2MSAll(MISSIONID,tSTRING_MISSION[8])
			end
		end
		SetMissionV(MV_TIMER_LOOP,nLoop-1)
		--5*2Ãë¹ã²¥Ò»´Î
		if mod(nLoop,2) == 0 then
			Msg2MSAll(MISSIONID," cßn "..(WAITOUT_TIME/FRAME_PER_SECOND*nLoop).."gi©y tho¸t khái trËn H¶i ChiÕn Long Ch©u lÇn nµy.")
		end
	end
end
