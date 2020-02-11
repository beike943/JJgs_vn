Include("\\script\\battles\\butcher\\head.lua")

function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
end

function RunMission()
	SetMissionV(MS_STATE,2);
	
--	bt_assignrank(1) --¸øËÎ·½µÄÍæ¼Ò·ÖÅä¹ÙÏÎ
--	bt_assignrank(2) --¸øÁÉ·½µÄÍæ¼Ò·ÖÅä¹ÙÏÎ

	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
		break
		end
 		if (pidx > 0) then
 			PlayerIndex = pidx;
		end
	--´ËÊ±ÎªGM·¢²¼ÃüÁî£¬ÕıÊ½´òÏìÕ½¶·
	PutMessage("Qu©n ®Şch ®· b¾t ®Çu hµnh ®éng! C¸c t­íng sÜ mau x«ng pha tiÒn tuyÕn, anh dòng chiÕn ®Êu!") 
end

end;

function EndMission()
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 39);
	StopMissionTimer(MISSIONID ,40);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t")
	DeleteChannel("Liªu"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t")


	SetGlbValue(GLB_BATTLESTATE, 0) --ÉèÖÃ¸ÃÈ«¾Ö±äÁ¿Îª1£¬±êÖ¾µ±Ç°·şÎñÆ÷Õı´¦ÓÚËÎÁÉÕ½ÒÛ½×¶Î£¬´ËÊ±ÏåÑô»òÖìÏÉÕòµÄ³ö¿Úµã×Ô¶¯ÉèÔÚËÎÁÉÕ½ÒÛµÄ±¨Ãûµã£¬·ñÔòÔòÉèÔÚÔ­ËÎÁÉÕ½³¡µØÍ¼
	sl_clearbattledata()	--±¾´ÎÕ½¶·½áÊøºó£¬Çå³ıÕ½³¡ĞÅÏ¢
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--¼ÆËãÕ½¹¦ÏµÊı£¬ÖØÖÃÕ½¹¦
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	ForbidChangePK(0);

	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "Tèng"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t")
	else
		LeaveChannel(PlayerIndex, "Liªu"..szGAME_GAMELEVEL[level].."D¹ng thøc cõu s¸t")
	end
	SetPKFlag(0, 0)

	--ÔÚÕ½³¡¿ªÕ½ÒÔºóÀë¿ªÕ½³¡ÔòÊÓÎª¡°ÌÓÀë¡±£¬ÏŞÖÆ±¾³¡´Î²»¿ÉÔÙ½øÈëÈÎºÎÒ»·½
	--¾ßÌåÊµÏÖÎª1Ğ¡Ê±Ö®ÄÚ²»ÄÜÔÙ´Î½øÈëÕ½³¡
--	if GetMissionV(MS_STATE) == 2 then
--		local nLeaveTime = tonumber(date("%y%m%d%H%M"));
--		BT_SetData(PL_LEAVETIME, nLeaveTime);
--	end

	sf_onplayerleave()
--	SyncTaskValue(700 + PL_BATTLEPOINT);--Í¬²½Íæ¼ÒµÄ×ÜÕ½¹¦¸ø¿Í»§¶Ë£¬ÓÃÓÚÕ½¹¦¹ºÂò¹¦ÄÜ
	if( GetMissionV( MS_STATE ) ~= 3 ) then
		BT_UpdateMemberCount();
		ResetBonus()		--¼ÆËãÕ½¹¦ÏµÊı£¬ÖØÖÃÕ½¹¦
	end
	
	if( GetMissionV( MS_STATE ) == 2 and wl_search_memcount() == 1 ) then
		CloseMission( MISSIONID )
	end
end;

