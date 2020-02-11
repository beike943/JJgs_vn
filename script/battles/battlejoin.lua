--coding by romandou 2004-12-22
--’Ω“€µƒ±®√˚µ„Npc∂‘ª∞Ω≈±æ
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\battleinfo.lua")

function main()
CleanInteractive()	--∂œø™Ωªª•

--bt_setnormaltask2type()
if (BT_GetGameData(GAME_BATTLEID) == 0 ) then
	Say("ßπi qu©n ch≠a xu t ph∏t. T≠Ìng s‹ xin nghÿ ng¨i ÆÓi l÷nh!",0)
	return
end
	local factionnumber = GetPlayerRoute()
	if( factionnumber == 0 ) then
		Say("Ng≠¨i ch≠a gia nhÀp m´n ph∏i nµo! Chi’n tr≠Íng r t khËc li÷t! H‰c xong v‚ ngh÷ h∑y quay lπi tham chi’n!", 0)
		return
	end
	-------------------------------------------------------------------	
	--≈–∂œÕÊº“ «∑ÒŒ™Ã”¿Î◊¥Ã¨
--	local nTime = tonumber(date("%y%m%d%H%M"));
--	if nTime - BT_GetData(PL_LEAVETIME) < 60 then
--		Say("’Ω’Û÷Æº‰£¨¡Ÿ’ÛÕ—Ã”£¨µ±“‘æ¸∑®¥” ¬£¨ƒ„ªπ «œ»∫√∫√∑¥ °“ªœ¬∞…°£", 0);
--		return
--	end;


--≈–∂œÕÊº“µ»º∂”Î±®√˚µ„µ»º∂ «∑Òœ‡  ∫œ
	wid = SubWorldIdx2ID(SubWorld);
	local pl_level = GetLevel() --ÕÊº“µ»º∂
	local bt_level = 0;	-- µ±«∞µÿÕºÀ˘ Ùµƒ’Ω“€µ»º∂
	
	if (pl_level < 40 ) then
		Say("Xin lÁi! Ng≠¨i ch≠a Æ’n c p 40! H∑y quay lπi sau nh–!",2, "Ta sœ quay lπi/bt_oncancel", "T◊m hi”u Nhπn M´n quan chi’n/bt_onbattleinfo");--£ø£ø°∞ƒ„µƒµ»º∂–°”⁄40º∂ªÚ’ﬂ√ª”–¥¯◊„“¯¡Ω°£°±
		return 
	elseif pl_level >= 40 and pl_level < 70 then
		bt_level = 1
	elseif (pl_level >= 70) then
		bt_level = 2
--	else
--		bt_level = 2
	end;

	if (tbGAME_SIGNMAP[bt_level] ~= wid) then
		 local maplevel = bt_map2battlelevel(wid)
		 if ( maplevel == 0) then
		 	print("ID b∂n ÆÂ Æi”m b∏o danh b∏o lÁi, xin ki”m tra lπi!");
		 	return 	
		 end
		 Say("N¨i nµy lµ"..szGAME_GAMELEVEL[maplevel]..", Æºng c p cÒa ng≠¨i chÿ c„ th” Æ’n"..szGAME_GAMELEVEL[bt_level].." b∏o danh!", 0)--£ø£ø√ª”–∑÷µ»º∂µƒÃ· æ–≈œ¢		 
		 return
	end

-------------------------------------------------------------------	

	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Say("Ti“n ph≠¨ng Æang nghœn lËi! Tπm thÍi kh´ng th” vµo chi’n tr≠Íng!", 0 )
		return
	end

	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	if (state == 0) then
		Say("Xin lÁi! Hi÷n chi’n tr≠Íng ch≠a mÎ. Khi kh∏c h∑y quay lπi!", 0 )
		SubWorld = tempSubWorld;
		return
	elseif (state == 3) then
		Say("Xin lÁi! Hi÷n chi’n tr≠Íng Æ∑ k’t thÛc. Khi kh∏c h∑y quay lπi!", 0)
		SubWorld = tempSubWorld;
		return
	else
		battlename = BT_GetBattleName();
	end;
	SubWorld = tempSubWorld;
	
	sl_clearplayerdata()	--√øæ÷–¬ø™ º«Â≥˝ÕÊº“…œ“ªæ÷µƒ–≈œ¢£¨◊‹’Ωπ¶≤ª«Â≥˝
	local str = ""
	if (bt_ncamp == 1) then
		str = "TÙc ng˜ c„ c©u: Thi™n hπ h≠ng vong, th t phu h˜u tr∏ch. Nay gi∆c Li™u x©m phπm bÍ c‚i ta, QuËc gia l©m nguy. Lµ con d©n ßπi TËng, ta ph∂i tÀn trung b∏o QuËc! Anh hÔng! Xin h∑y Æ«u qu©n gi’t gi∆c lÀp c´ng!"
	else
		str = "HÏi c∏c dÚng s‹ Li™u QuËc! Nay ta chi™u mÈ c∏c ng≠¨i Æi ti™u di÷t TËng qu©n ngoan cË, hoµn thµnh b∏ nghi÷p cÒa ßπi Li™u ta. H∑y tÀn trung b∏o quËc, Æ«u qu©n gi’t gi∆c lÀp c´ng!"
	end
if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
	if (state ~= 1 and state ~= 2 ) then
		Say("Xin lÁi! Hi÷n chi’n tr≠Íng Æ∑ k’t thÛc. Khi kh∏c h∑y quay lπi!", 0)
		return 
	end
	BT_SetData( PL_SERIESKILL, 0 )	--¡¨’∂ ˝«Â0
	BT_SetData( PL_KILLPLAYER, 0 )	--…±»À ˝«Â0
	if (bt_ncamp == 1) then
		Say(str, 2, "Gia nhÀp/bt_joinsong", "Ta suy ngh‹ lπi!/bt_oncancel");
	else
		Say(str, 2, "Gia nhÀp/bt_joinjin", "Ta suy ngh‹ lπi!/bt_oncancel");
	end
	return	
end;

if (BT_GetData(PL_BATTLECAMP) ~= bt_ncamp and BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) ) then
	if (bt_ncamp == 1) then
		Say("Tr´ng ng≠¨i t≠Ìng mπo gian ∏c, nh t Æﬁnh lµ gian t’ Li™u QuËc. Ng≠Íi Æ©u! Mau bæt n„!",0)
		Msg2Player("TrÀn nµy ng≠¨i thuÈc phe Li™u, h∑y Æ’n Æi”m b∏o danh xin Li™u Qu©n MÈ Binh Quan vµo trÀn!")
	else
		Say("To gan! D∏m x©m nhÀp l∑nh Æﬁa ßπi Li™u ta, ch∏n sËng µ!",0)
		Msg2Player("TrÀn nµy ng≠¨i thuÈc phe TËng, h∑y Æ’n Æi”m b∏o danh xin TËng Qu©n MÈ Binh Quan vµo trÀn!")	
	end;
	return 
end

----------------------------------------------------------------------
--’˝ Ω±®√˚ ±µƒÃıº˛ «£¨
--1°¢“—æ≠±®¡À±æ¥Œµƒ’Ω“€
--2°¢“—æ≠ «±æ∑Ω’Ω“€µƒ’Û”™¡À
--3°¢”Î±æ¥Œ’Ωæ÷µƒ’Ωæ÷µ»º∂œ‡∑˚¡À

--’˝ Ωø…“‘±®√˚¡À

Say( str, 2, "ß≠Óc!/bt_enterbattle", "ß” ta suy ngh‹ lπi/bt_oncancel");
end;

function bt_enterbattle()
	MapId = BT_GetGameData(GAME_MAPID);
	
	if (MapId > 0) then
		idx = SubWorldID2Idx(MapId);
		
		if (idx < 0) then
			Say("Xin lÁi! Ti“n ph≠¨ng Æang nghœn lËi, tπm thÍi kh´ng th” vµo chi’n tr≠Íng!",0)
			SignMapId = SubWorldIdx2ID(SubWorld);
			BattleId = BT_GetGameData(GAME_BATTLEID);
			print("ERROR !!!Battle[%d]Level[%d]'s BattleMap[%d] and SignMap[%d] Must In Same Server!", BattleId, BT_GetGameData(GAME_LEVEL),MapId, SignMapId); 
			return
		end
		
		local OldSubWorld = SubWorld;
		SubWorld = idx;
		BT_SetData(PL_BATTLECAMP, bt_ncamp)
		JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp)
	--??if getcamp=ÀŒ,Ω¯»Î’Ω≥° ±Ã· æ°∞ƒ„∫√£¨ª∂”≠ƒ„º”»ÎÀŒæ¸£¨œ÷‘⁄¡…±¯…–Œ¥≥ˆœ÷£¨¥Ûº“œ»…‘ ¬–›œ¢°£“ªµ©«∞∑Ω∫≈Ω«¥µœÏ£¨’Ω∂∑æÕª·ø™ º°£°∞
	--??else =¡…,Ω¯»Î’Ω≥° ±Ã· æ"¡…π˙µƒ”¬ ø£¨ª∂”≠ƒ„µƒµΩ¿¥£°œ÷‘⁄ÀŒæ¸…–Œ¥≥ˆœ÷£¨¥Ûº“œ»…‘ ¬–›œ¢°£“ªµ©«∞∑Ω∫≈Ω«¥µœÏ£¨’Ω∂∑æÕª·ø™ º°£"
		local SubWorld = OldSubWorld;
		return
	else
		Say("Xin lÁi! Ti“n ph≠¨ng Æang nghœn lËi, tπm thÍi kh´ng th” vµo chi’n tr≠Íng!", 0);
	end
end;

function bt_wantjin()
		Say("Ng≠¨i thÀt s˘ muËn gia nhÀp phe Li™u? Sau khi ch‰n phe sœ c„ hi÷u l˘c trong mÈt vﬂng! Chÿ c„ th” ch‰n phe kh∏c khi trÀn sau bæt Æ«u!",2, "Ta quy’t gia nhÀp phe Li™u/bt_joinjin", "ß” ta suy ngh‹ lπi/bt_oncancel");
end;

function bt_wantsong()
		Say("Ng≠¨i thÀt s˘ muËn gia nhÀp phe TËng? Sau khi ch‰n phe sœ c„ hi÷u l˘c trong mÈt vﬂng! Chÿ c„ th” ch‰n phe kh∏c khi trÀn sau bæt Æ«u!",2, "Ta quy’t gia nhÀp phe TËng/bt_joinsong", "ß” ta suy ngh‹ lπi/bt_oncancel");
end;

function bt_joinsong()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 1)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("’Ω“€π´∏Ê£∫–¬’Ω“€ø™ º¡À£¨ƒ˙…œ“ª¥Œµƒ’Ω“€◊‹’Ωπ¶Ω´±ª«Â¡„°£")
	Msg2Player("Hoan ngh™nh anh hÔng. H∑y nhanh ch©n vµo chi’n tr≠Íng!")
	Say("Hoan ngh™nh anh hÔng trÎ thµnh t≠Ìng s‹ TËng Tri“u. Hi÷n Æ∑ khai chi’n! C„ muËn lÀp t¯c vµo chi’n tr≠Íng?", 2, "ß≠Óc!/bt_enterbattle", "ß” ta suy ngh‹ lπi/bt_oncancel");
end;

function bt_joinjin()
	BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID))
	BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES))
	BT_SetData(PL_BATTLECAMP, 2)
	BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND))
--	BT_SetData(PL_BATTLEPOINT, 0)
--	Msg2Player("’Ω“€π´∏Ê£∫–¬’Ω“€ø™ º¡À£¨ƒ˙…œ“ª¥Œµƒ’Ω“€◊‹’Ωπ¶Ω´±ª«Â¡„°£")
	Msg2Player("Hoan ngh™nh dÚng s‹ Li™u QuËc! H∑y nhanh ch©n vµo chi’n tr≠Íng!")
	Say("Hoan ngh™nh anh hÔng trÎ thµnh dÚng s‹ Li™u QuËc. Hi÷n Æ∑ khai chi’n! C„ muËn lÀp t¯c vµo chi’n tr≠Íng?", 2, "ß≠Óc!/bt_enterbattle", "ß” ta suy ngh‹ lπi/bt_oncancel");
end;

function bt_oncancel()

end
