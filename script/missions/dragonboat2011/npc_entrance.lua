--½Å±¾¹¦ÄÜ£º¹Ø¿¨½ÓÒýÈË¶Ô»°
--¹¦ÄÜÉè¼Æ£º´óÐÜ¡¢Ð¡ÓîÖæ
--¹¦ÄÜ¿ª·¢£ºÁõ²¨¡¢´å³¤
--¹¦ÄÜ²âÊÔ£ºÐ¡ÐÜ¡¢·¹½ã
--¿ª·¢Ê±¼ä£º2011-8-23
--ÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\missions\\dragonboat2011\\lzz_function.lua")
Include("\\script\\missions\\dragonboat2011\\string.lua")

--ÁúÖÛsay¶Ô»°Õ¹¿ª
function DragonBoat_Say(tSayInfo)
	Say(tSayInfo[1],getn(tSayInfo[2]),tSayInfo[2])
end

function nothing()
end

function main()
	Talk(1,"",sNpcNameEntrance.."H¶i ChiÕn Long Ch©u ®ang ®­îc n©ng cÊp, ®¹i hiÖp h·y quay l¹i sau !!!")
	return 0
	--DragonBoat_Say(tSTRING_NPC_SAY[1][1])
end

--½øÈë¹Ø¿¨
function join_mission()
	--print("join_mission() called!")
	--Ê±¼äÏÞÖÆ
	local nTime = tonumber(date("%H%M"))
	if (not ((tMsOpenTime[1][1] <= nTime and nTime < tMsOpenTime[1][2]) or (tMsOpenTime[2][1] <= nTime and nTime < tMsOpenTime[2][2]) or (tMsOpenTime[3][1] <= nTime and nTime < tMsOpenTime[3][2]))) then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[1])
		return 0
	end
	--¼ÓÈëµÈ¼¶ÏÞÖÆ
	local nLevel = GetLevel();
	if nLevel < PLAY_NEED_LV then 
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[2],PLAY_NEED_LV))
		return 0
	end
	--ÈëÁ÷ÅÉ²Å¸ø½ø
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[3])
		return 0
	end
	--Ñ§»á1Ì×55¼¶¼¼ÄÜ
	if gf_Check55HaveSkill() == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[4])
		return 0
	end
	--ÉÏ´Î½±ÀøÊÇ·ñÁìÈ¡
	if GetTask(VET_LZZ_PLAYER_RESULT) > 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[5])
		return 0
	end 
	--ÊÇ·ñÊÇµ¥ÈË±¨Ãû²Î¼Ó
	if GetTeamSize() > 1 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[6])
		return 0
	end
	--¿Û³ý±¨Ãû·ÑÓÃ
	if Pay(REGIST_FEES) == 0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[14])
		return 0
	end
	--ÅÐ¶Ï±³°ü¿Õ¼ä
	if gf_Judge_Room_Weight(2,1,"") == 0 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[11])
		return 0
	end
	--½â³ý×ù¼ÄÉÏµÄ×°±¸
	local nRezult = UnEquipAtPosition(10)
	if nRezult ~= 1 and nRezult ~= 2 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[13])
		return 0
	end
	--È¡ÏÂÎäÆ÷
	nRezult = UnEquipAtPosition(2)
	if nRezult ~= 1 and nRezult ~= 2 then 
		Talk(1,"",sNpcNameEntrance..tSTRING_DRAG_NPC[10])
		return 0
	end
	--print("join_mission() called! again")
	--È«¾ÖÈÎÎñ±äÁ¿´¦Àí
	SetTask(VET_LZZ_PLAYER_TAG,0)
	SetTask(VET_LZZ_PLAYER_TAG2,0)
	SetTask(VET_LZZ_PLAYER_POINT,0)
	SetTask(VET_LZZ_PLAYER_CAMP,0)
	SetTask(VET_LZZ_ENROLL_MAPID,0)
	SetTask(VET_LZZ_DRAGBOAT_KIND,0)
	SetTask(VET_LZZ_MISSION_MAPID,0)
	--ÅÅ¶Ó»úÖÆ
	local nCurMapId = LZZ_GetSuitMap()
	local nCityMapId = GetWorldPos()
	local nMissionMapId
	if nCurMapId ~= 0 then
		--print(MISSIONID,CampSong_ID,nCurMapId)
		local nSong = mf_GetPlayerCount(MISSIONID,CampSong_ID,nCurMapId)
		local nLiao = mf_GetPlayerCount(MISSIONID,CampLiao_ID,nCurMapId)
		--print("nSong="..nSong)
		--print("nLiao="..nLiao)
		if mf_GetPlayerCount(MISSIONID,CampSong_ID,nCurMapId) <= mf_GetPlayerCount(MISSIONID,CampLiao_ID,nCurMapId) then 
				mf_JoinMission(MISSIONID,CampSong_ID,nCurMapId);
				SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
				WriteLogEx(LONGCHAU_LOG_TITLE, "vµo chiÕn tr­êng")
				--print(GetWorldPos())
				nMissionMapId = GetWorldPos()
				SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
				--print(1)
				--ÉèÖÃÎª²ÎÈüÑ¡ÊÖ
				SetTask(PLAYER_STATUS,2)
				SetTask(VET_LZZ_PLAYER_1715,2)
				--Çå³ý×´Ì¬
				RemvoeTempEffect()
		else					
				mf_JoinMission(MISSIONID,CampLiao_ID,nCurMapId);
				SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
				WriteLogEx(LONGCHAU_LOG_TITLE, "vµo chiÕn tr­êng")
				--print(GetWorldPos())
				nMissionMapId = GetWorldPos()
				SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
				--print(2)
				--ÉèÖÃÎª²ÎÈüÑ¡ÊÖ
				SetTask(PLAYER_STATUS,2)
				SetTask(VET_LZZ_PLAYER_1715,2)
				--Çå³ý×´Ì¬
				RemvoeTempEffect()
		end
	else --Ã»ÓÐºÏÊÊµÄ£¬ÐÂ¿ªÒ»¸ö
		--print("Ã»ÓÐºÏÊÊµÄ£¬ÐÂ¿ªÒ»¸ö")
		local nRoomID,nRoomIdx,nRoomCount = LZZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[11]);
			return 0
		end
		if mf_OpenMission(MISSIONID,nRoomID) == 1 then
			mf_SetMissionV(MISSIONID,MV_LZZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSIONID,MV_LZZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSIONID,MV_LZZ_MAP_INDEX,nRoomIdx,nRoomID);					
			mf_JoinMission(MISSIONID,CampSong_ID,nRoomID);
			SetTask(VET_LZZ_ENROLL_MAPID,nCityMapId)
			--print(GetWorldPos())
			nMissionMapId = GetWorldPos()
			SetTask(VET_LZZ_MISSION_MAPID,nMissionMapId)
			--print(3)
			--ÉèÖÃÎª²ÎÈüÑ¡ÊÖ
			SetTask(PLAYER_STATUS,2)
			SetTask(VET_LZZ_PLAYER_1715,2)
			--Çå³ý×´Ì¬
			RemvoeTempEffect()
		end
	end	

end

--¹Ø¿¨ÐÅÏ¢½éÉÜ
function mision_info()
	DragonBoat_Say(tSTRING_NPC_SAY[1][2])
end

--ÁìÈ¡ÉÏÒ»³¡º£ÉÏÁúÖÛÕ½½±Àø
function get_award(nType)
	--¼ì²éÊÇ·ñÒ»ÌìÄÚÁìÈ¡¾­Ñé³¬¹ýÁË600W
	local nDay = zgc_pub_day_turn()
	if GetTask(VET_LZZ_PLAYER_AWARD_DAY) ~= nDay then
		SetTask(VET_LZZ_PLAYER_AWARD_DAY,nDay)
		SetTask(VET_LZZ_PLAYER_AWARD,0)
	end

	--¼ì²éÊÇ·ñ²Î¼Ó¹ý
	if GetTask(VET_LZZ_PLAYER_RESULT) <=0 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[7])
		return 0
	end

	if gf_Judge_Room_Weight(3,10," ") ~= 1 then
        	Talk(1,"","Hµnh trang c¸c h¹ kh«ng ®ñ chç trèng ®Ó nhËn th­ëng")
		return 0
    	end

	local nNum = GetTask(VET_LZZ_PLAYER_AWARD)
	if nNum >= 6 then
		Talk(1,"",sNpcNameEntrance..tSTRING_NPC_TALK[8])
		return 0
	end
	--Check lo¹i huy hiÖu
	local tbNeedItem = tAwardItemNeed[nType]
	if type(tbNeedItem[1]) == "string" then
		if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
			Talk(1,"","C¸c h¹ kh«ng cã "..tbNeedItem[1].." ®Ó nhËn th­ëng.");
			return 0;
		end
	end
	
	local nQCPoint =  tbQuanCong[nType][1]
	if GetTask(VET_LZZ_PLAYER_RESULT) == 2 or GetTask(VET_LZZ_PLAYER_RESULT) == 3 then
		nQCPoint =  tbQuanCong[nType][2]
	end
	
	if GetTask(701) < 0 then
		nQCPoint = 0 - nQCPoint
	end
		
	if GetTask(VET_LZZ_PLAYER_RESULT) == 1 then 
		if nNum == 5 then
			gf_Modify("Exp",FAIL_AWARD)
			SetTask(701,GetTask(701) + nQCPoint )
			Msg2Player("B¹n nhËn ®­îc ".. tbQuanCong[nType][1].." ®iÓm qu©n c«ng!")
			SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
			if nType == 1 or nType == 2 or nType == 3 then
				gf_EventGiveRandAward(tAwardAll,100000,1)
			end
			Talk(2,"",sNpcNameEntrance..tSTRING_NPC_TALK[12],sNpcNameEntrance..format(tSTRING_NPC_TALK[9],FAIL_AWARD))
		else
			gf_Modify("Exp",WIN_AWARD)
			SetTask(701,GetTask(701) + nQCPoint )
			Msg2Player("B¹n nhËn ®­îc ".. tbQuanCong[nType][1].." ®iÓm qu©n c«ng!")
			SetTask(VET_LZZ_PLAYER_AWARD,nNum+2)
			if nType == 1 or nType == 2 or nType == 3 then
				gf_EventGiveRandAward(tAwardAll,100000,1)
			end
			Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[9],WIN_AWARD))
		end
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end
	--Ê§°Ü½±Àø
	if GetTask(VET_LZZ_PLAYER_RESULT) == 2 then
		gf_Modify("Exp",FAIL_AWARD)
		SetTask(701,GetTask(701) + nQCPoint )		
		Msg2Player("B¹n nhËn ®­îc "..tbQuanCong[nType][2].." ®iÓm qu©n c«ng!")
		SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[10],FAIL_AWARD))
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end	
	--Æ½¾Ö
	if GetTask(VET_LZZ_PLAYER_RESULT) == 3 then
		gf_Modify("Exp",FAIL_AWARD)
		SetTask(701,GetTask(701) + nQCPoint )		
		Msg2Player("B¹n nhËn ®­îc "..tbQuanCong[nType][2].." ®iÓm qu©n c«ng!")
		SetTask(VET_LZZ_PLAYER_AWARD,nNum+1)
		Talk(1,"",sNpcNameEntrance..format(tSTRING_NPC_TALK[13],FAIL_AWARD))
		SetTask(VET_LZZ_PLAYER_RESULT,0)
	end	
	WriteLogEx(LONGCHAU_LOG_TITLE, "Qu©n c«ng §ua ThuyÒn Rång: "..nQCPoint..", lo¹i "..nType)	
end

--½øÈë¹Ø¿¨Ìõ¼þ½éÉÜ
function mission_condition()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[1]);
end

--¿ª·ÅÊ±¼ä½éÉÜ
function mission_open_time()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[2]);
end

--º£ÉÏÁúÖÛÕ½¹æÔò½éÉÜ
function mission_rule()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[3]);
end

--½±Àø½éÉÜ
function mission_prize()
	Talk(1,"",sNpcNameEntrance..tSTRING_INTRODUCE[4]);
end

function get_award_infor()
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "§¹i hiÖp ®· lËp ®­îc c«ng lín, h·y nhËn phÇn th­ëng H¶i ChiÕn Long Ch©u."
	
	tinsert(tbSayDialog, "- Kh«ng sö dông qu©n c«ng ch­¬ng ®Ó l·nh th­ëng/#get_award(0)")
	tinsert(tbSayDialog, "- Sö dông qu©n c«ng ch­¬ng ®Ó l·nh th­ëng/#get_award(1)")
	tinsert(tbSayDialog, "- Sö dông huy hiÖu chiÕn c«ng ®¹i ®Ó l·nh th­ëng/#get_award(2)")	
	tinsert(tbSayDialog, "- Sö dông huy hiÖu chiÕn c«ng huy hoµng ®Ó l·nh th­ëng/#get_award(3)")
	tinsert(tbSayDialog, "Trë l¹i/main")
	
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
end
