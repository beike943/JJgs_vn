-- =============================================================
-- FileName : boss_baoxiang_wudu.lua
-- Desc     : Îå¶¾boss±¦ÏäµÄ½Å±¾£¬ÃÅÅÉbossÈÎÎñÖÐµôÂäµÄ±¦Ïä£¬µãÈ¡¿ÉÒÔ»ñµÃºÃ¶àgood¶«Î÷µÄ¹¦ÄÜ
-- Date     : Dec 19 2006
-- Creator  : Tony(Jizheng)
-- =============================================================
Include("\\script\\lib\\writelog.lua")

TASK_ID_LAST_GET_DATE = 88			-- ÉÏ´ÎÁìÈ¡ÈÎÎñµÄÊ±¼ä£¬ÈÎÎñ±äÁ¿ID
TASK_ID_HAVE_GOT_TODAY = 89			-- ½ñÌìÊÇ·ñÒÑ¾­ÁìÈ¡ÁËÈÎÎñ,ÈÎÎñ±äÁ¿ID

tGaojiMiji = {
	[0] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"TiÒm Long TÞch DiÖt Kinh",0,107,167},{"Thiªn La Liªn Ch©u Lôc",0,107,169},{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170},{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171},{"Hçn §én TrÊn Nh¹c MËt TÞch",0,107,172},{"Quü Thiªn Du Long MËt TÞch",0,107,173},{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174},{"Qu©n Tö TiÖt Phong MËt TÞch",0,107,175},{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176},{"Xuyªn V©n L¹c Hång MËt TÞch",0,107,177},{"U Minh Phong Ma Lôc",0,107,178},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
	[1] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"TiÒm Long TÞch DiÖt Kinh",0,107,167}},
	[2] = {{"Kim Cang B¸t Nh· Kinh",0,107,166}},
	[3] = {{"V« TrÇn Bå §Ò Kinh",0,107,168}},
	[4] = {{"TiÒm Long TÞch DiÖt Kinh",0,107,167}},
	[5] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169}},
	[6] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169}},
	[7] = {{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170},{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171}},
	[8] = {{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170}},
	[9] = {{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171}},
	[10] = {{"Hçn §én TrÊn Nh¹c MËt TÞch",0,107,172},{"Quü Thiªn Du Long MËt TÞch",0,107,173}},
	[11] = {{"Hçn §én TrÊn Nh¹c MËt TÞch",0,107,172}},
	[12] = {{"Quü Thiªn Du Long MËt TÞch",0,107,173}},
	[13] = {{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174},{"Qu©n Tö TiÖt Phong MËt TÞch",0,107,175}},
	[14] = {{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174}},
	[15] = {{"Qu©n Tö TiÖt Phong MËt TÞch",0,107,175}},
	[16] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176},{"Xuyªn V©n L¹c Hång MËt TÞch",0,107,177}},
	[17] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176}},
	[18] = {{"Xuyªn V©n L¹c Hång MËt TÞch",0,107,177}},
	[19] = {{"U Minh Phong Ma Lôc",0,107,178},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
	[20] = {{"U Minh Phong Ma Lôc",0,107,178}},
	[21] = {{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}}
};

-- ³õÊ¼¶Ô»°Èë¿Ú
function main()
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- ÉÏ´Î½ÓÈÎÎñÊÇÊ²Ã´Ê±ºò
	local nCurrTime = {date("%y"), date("%m"), date("%d")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	
	local nCurNpcIndex = GetTargetNpc()
	local nCurLevel = GetUnitCurStates(nCurNpcIndex, 0)
	if (nCurLevel == 99) then
		return
	end
	AddUnitStates(nCurNpcIndex, 0, 100)		-- ´Ë¶Î·ÀË¢
	
	
	if (nLastGetTaskDate < nCurDay) then	-- ½ñÌì»¹Ã»ÓÐÁìÈ¡ÈÎÎñ
		Say("B¹n vÉn ch­a b¸o danh tham gia cao thñ thñ thö luyÖn, tói quµ nµy kh«ng thÓ nhËn.", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- ´Ë¶Î·ÀË¢
		return
	end
	
	-- Ã»ÓÐÈëÁ÷ÅÉ¾Í²»ÄÜ¿ªÏä×Ó
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B¹n vÉn ch­a b¸i s­ häc vâ, tói quµ nµy kh«ng thÓ nhËn!", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- ´Ë¶Î·ÀË¢
		return
	end
	
	-- ½ñÌìÒÑ¾­¼ðÈ¡ÁËÒ»¸ö
	local nCanGotBox = GetTask(TASK_ID_HAVE_GOT_TODAY)
	if (nCanGotBox == 0) then
		Say("Xin lçi, h«m nay b¹n ®· nhËn quµ råi kh«ng thÓ nhËn thªm.", 0)
		AddUnitStates(nCurNpcIndex, 0, -100)		-- ´Ë¶Î·ÀË¢
		return
	end
	
	local nRand = random(1,1000);
	if nRand <= 20 then
		local nRandIdx = random(1,getn(tGaojiMiji[19]));
		AddItem(tGaojiMiji[19][nRandIdx][2],tGaojiMiji[19][nRandIdx][3],tGaojiMiji[19][nRandIdx][4],1);
		Msg2Player("ThiÕu hiÖp më b¶o r­¬ng nhËn ®­îc "..tGaojiMiji[19][nRandIdx][1]);
	else
		local nSel = random(1, 1000)	-- ±¦Ïä³ö¶«Î÷µÄ¸ÅÂÊ
		
		if (nSel <= 478) then			-- 47.8%µÄ¸ÅÂÊ£¬µÃµ½100w¾­Ñé
			ModifyExp(1000000)
			Msg2Player("B¹n ®· më ®­îc b¶o r­¬ng, nhËn ®­îc 1000000 ®iÓm kinh nghiÖm.")
		elseif (nSel <= 956) then		-- 47.8%µÄ¸ÅÂÊ£¬µÃµ½Î´¿ª·âµÄ76¼¶ÎäÆ÷
			get_76_weapon()
			ModifyExp(500000)
		Msg2Player("B¹n më ®­îc b¶o r­¬ng, nhËn ®­îc mét vò khÝ cÊp 76 vµ 500000 ®iÓm kinh nghiÖm!")
		elseif (nSel <= 966) then		-- 1%   µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅ¾í±¾ÉÏ
			get_faction_misbook(0)
		elseif (nSel <= 971) then		-- 0.5% µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅ¾í±¾ÖÐ
			get_faction_misbook(1)
		elseif (nSel <= 973) then		-- 0.2% µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅ¾í±¾ÏÂ
			get_faction_misbook(2)
		elseif (nSel <= 989) then		-- 1.6% µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅÌ××°¶þ¿ã×Ó
			get_suit_2_shoe()
			ModifyExp(500000)
			Msg2Player("B¹n ®· më ®­îc b¶o r­¬ng, nhËn ®­îc trang phôc cña s­ m«n vµ 500000 ®iÓm kinh nghiÖm!")
		elseif (nSel <= 992) then		-- 0.3% µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅÌ××°ÈýÍ·
			get_suit_3_head()
			Msg2Player("B¹n më ®­îc b¶o r­¬ng, nhËn ®­îc trang phôc cña s­ m«n.")
		elseif (nSel <= 997) then		-- 0.5% µÄ¸ÅÂÊ£¬µÃµ½Ê¦ÃÅÌ××°ÈýÊ×ÊÎ
			get_suit_3_deco()
			Msg2Player("B¹n më ®­îc b¶o r­¬ng, nhËn ®­îc vËt phÈm trang søc cña s­ m«n.")
		elseif (nSel <= 1000) then		-- 0.3% µÄ¸ÅÂÊ£¬µÃµ½´ó½³Ê¦ÊÖÊé
			AddItem(2, 0, 397, 1)
			Msg2Player("B¹n më ®­îc b¶o r­¬ng, nhËn ®­îc 1 quyÓn mËt tÞch.")
		end
	end
	Msg2SubWorld("Ng­êi ch¬i"..GetName().."§¸nh b¹i  Cæ MÆc, nhËn ®­îc Tói tïy th©n");
	-- °Ñ×Ô¼ºÉ¾³ý
	local nSelfIndex = GetTargetNpc()
	SetNpcLifeTime(nSelfIndex, 0)
	SetTask(TASK_ID_HAVE_GOT_TODAY, 0)
	WriteLogEx("Boss su mon","nhÆt tói Ngò §éc")
end;

-- µÃµ½Ê¦ÃÅÌ××°ÈýÍ·
function get_suit_3_head()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- ±ê×¼ÄÐ - 1
	-- ¿ýÎàÄÐ - 2
	-- ÐÔ¸ÐÅ® - 3
	-- ½¿Ð¡Å® - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- ÉÙÁÖË×¼Ò
		if (nBodyType <= 2) then
			nItemDetail = 220 + nBodyType
		else
			nItemDetail = 220 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- ÉÙÁÖÎäÉ®
		if (nBodyType <= 2) then
			nItemDetail = 320 + nBodyType
		else
			nItemDetail = 320 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- ÉÙÁÖìøÉ®
		if (nBodyType <= 2) then
			nItemDetail = 420 + nBodyType
		else
			nItemDetail = 420 + random(1, 2)
		end
	elseif (nSel <= 16) then		-- ÌÆÃÅ				
		nItemDetail = 620 + nBodyType
	elseif (nSel <= 20) then		-- ¶ëáÒ·ð¼Ò
		if (nBodyType > 2) then
			nItemDetail = 820 + (nBodyType - 2)
		else
			nItemDetail = 820 + random(1, 2)
		end
	elseif (nSel <= 24) then		-- ¶ëáÒË×¼Ò
		if (nBodyType > 2) then
			nItemDetail = 920 + (nBodyType - 2)
		else
			nItemDetail = 920 + random(1, 2)
		end
	elseif (nSel <= 28) then		-- Ø¤°ï¾»ÒÂ
		nItemDetail = 1120 + nBodyType
	elseif (nSel <= 32) then		-- Ø¤°ïÎÛÒÂ
		nItemDetail = 1220 + nBodyType
	elseif (nSel <= 36) then		-- Îäµ±µÀ¼Ò
		nItemDetail = 1420 + nBodyType
	elseif (nSel <= 40) then		-- Îäµ±Ë×¼Ò
		nItemDetail = 1520 + nBodyType
	elseif (nSel <= 44) then		-- ÑîÃÅÇ¹Æï
		nItemDetail = 1720 + nBodyType
	elseif (nSel <= 48) then		-- ÑîÃÅ¹­Æï
		nItemDetail = 1820 + nBodyType
	elseif (nSel <= 74) then		-- Îå¶¾¹ÆÊ¦×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nItemDetail = 2020 + nBodyType
	elseif (nSel <= 100) then		-- Îå¶¾Ð°ÏÀ×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nItemDetail = 2120 + nBodyType
	end
	
	AddItem(0, 103, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","mò m«n ph¸i",1,"","G:0,D:103,P:"..nItemDetail)
end;

-- µÃµ½Ê¦ÃÅÌ××°ÈýÊ×ÊÎ
function get_suit_3_deco()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- ±ê×¼ÄÐ - 1
	-- ¿ýÎàÄÐ - 2
	-- ÐÔ¸ÐÅ® - 3
	-- ½¿Ð¡Å® - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- ÉÙÁÖË×¼Ò
		if (nBodyType <= 2) then
			nItemDetail = 220 + nBodyType
		else
			nItemDetail = 220 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- ÉÙÁÖÎäÉ®
		if (nBodyType <= 2) then
			nItemDetail = 320 + nBodyType
		else
			nItemDetail = 320 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- ÉÙÁÖìøÉ®
		if (nBodyType <= 2) then
			nItemDetail = 420 + nBodyType
		else
			nItemDetail = 420 + random(1, 2)
		end
	elseif (nSel <= 16) then		-- ÌÆÃÅ				
		nItemDetail = 620 + nBodyType
	elseif (nSel <= 20) then		-- ¶ëáÒ·ð¼Ò
		if (nBodyType > 2) then
			nItemDetail = 820 + (nBodyType - 2)
		else
			nItemDetail = 820 + random(1, 2)
		end
	elseif (nSel <= 24) then		-- ¶ëáÒË×¼Ò
		if (nBodyType > 2) then
			nItemDetail = 920 + (nBodyType - 2)
		else
			nItemDetail = 920 + random(1, 2)
		end
	elseif (nSel <= 28) then		-- Ø¤°ï¾»ÒÂ
		nItemDetail = 1120 + nBodyType
	elseif (nSel <= 32) then		-- Ø¤°ïÎÛÒÂ
		nItemDetail = 1220 + nBodyType
	elseif (nSel <= 36) then		-- Îäµ±µÀ¼Ò
		nItemDetail = 1420 + nBodyType
	elseif (nSel <= 40) then		-- Îäµ±Ë×¼Ò
		nItemDetail = 1520 + nBodyType
	elseif (nSel <= 44) then		-- ÑîÃÅÇ¹Æï
		nItemDetail = 1720 + nBodyType
	elseif (nSel <= 48) then		-- ÑîÃÅ¹­Æï
		nItemDetail = 1820 + nBodyType
	elseif (nSel <= 74) then		-- Îå¶¾¹ÆÊ¦×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nItemDetail = 2020 + nBodyType
	elseif (nSel <= 100) then		-- Îå¶¾Ð°ÏÀ×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nItemDetail = 2120 + nBodyType
	end
	
	AddItem(0, 102, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","trang søc m«n ph¸i",1,"","G:0,D:102,P:"..nItemDetail)
end;

-- µÃµ½Ê¦ÃÅÌ××°¶þ¿ã×Ó
function get_suit_2_shoe()
	local nBodyType = GetBody()
	local nItemDetail = 0
	-- ±ê×¼ÄÐ - 1
	-- ¿ýÎàÄÐ - 2
	-- ÐÔ¸ÐÅ® - 3
	-- ½¿Ð¡Å® - 4

	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- ÉÙÁÖË×¼Ò
		if (nBodyType <= 2) then
			nItemDetail = 210 + nBodyType
		else
			nItemDetail = 210 + random(1, 2)
		end
	elseif (nSel <= 8) then		-- ÉÙÁÖÎäÉ®
		if (nBodyType <= 2) then
			nItemDetail = 310 + nBodyType
		else
			nItemDetail = 310 + random(1, 2)
		end
	elseif (nSel <= 12) then		-- ÉÙÁÖìøÉ®
		if (nBodyType <= 2) then
			nItemDetail = 410 + nBodyType
		else
			nItemDetail = 410 + random(1, 2)
		end
	elseif (nSel <= 16) then		-- ÌÆÃÅ				
		nItemDetail = 610 + nBodyType
	elseif (nSel <= 20) then		-- ¶ëáÒ·ð¼Ò
		if (nBodyType > 2) then
			nItemDetail = 810 + (nBodyType - 2)
		else
			nItemDetail = 810 + random(1, 2)
		end
	elseif (nSel <= 24) then		-- ¶ëáÒË×¼Ò
		if (nBodyType > 2) then
			nItemDetail = 910 + (nBodyType - 2)
		else
			nItemDetail = 910 + random(1, 2)
		end
	elseif (nSel <= 28) then		-- Ø¤°ï¾»ÒÂ
		nItemDetail = 1110 + nBodyType
	elseif (nSel <= 32) then		-- Ø¤°ïÎÛÒÂ
		nItemDetail = 1210 + nBodyType
	elseif (nSel <= 36) then		-- Îäµ±µÀ¼Ò
		nItemDetail = 1410 + nBodyType
	elseif (nSel <= 40) then		-- Îäµ±Ë×¼Ò
		nItemDetail = 1510 + nBodyType
	elseif (nSel <= 44) then		-- ÑîÃÅÇ¹Æï
		nItemDetail = 1710 + nBodyType
	elseif (nSel <= 48) then		-- ÑîÃÅ¹­Æï
		nItemDetail = 1810 + nBodyType
	elseif (nSel <= 74) then		-- Îå¶¾¹ÆÊ¦×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nItemDetail = 2010 + nBodyType
	elseif (nSel <= 100) then		-- Îå¶¾Ð°ÏÀ×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nItemDetail = 2110 + nBodyType
	end
	
	AddItem(0, 101, nItemDetail, 1, 1, -1, -1, -1, -1, -1, -1)
	WriteLogEx("Boss su mon","h¹ y m«n ph¸i",1,"","G:0,D:101,P:"..nItemDetail)
end;

-- ¸ù¾Ý¿ªÏä×ÓµÄÈËµÄÁ÷ÅÉ£¬»ñµÃ76¼¶Î´¿ª·âµÄÎäÆ÷
function get_76_weapon()
	local nPlayerRoute = GetPlayerRoute()

	if (nPlayerRoute == 2) then				-- ÉÙÁÖË×¼Ò
		if (random(1, 2) == 1) then
			AddItem(2, 1, 377, 1)
		else
			AddItem(2, 1, 379, 1)
		end
	elseif (nPlayerRoute == 3) then			-- ÉÙÁÖìø×Ú
		AddItem(2, 1, 382, 1)
	elseif (nPlayerRoute == 4) then			-- ÉÙÁÖÎä×Ú
		AddItem(2, 1, 375, 1)
	elseif (nPlayerRoute == 6) then			-- ÌÆÃÅ
		AddItem(2, 1, 378, 1)
	elseif (nPlayerRoute == 8) then			-- ¶ëáÒ·ð¼Ò
		AddItem(2, 1, 376, 1)
	elseif (nPlayerRoute == 9) then			-- ¶ëáÒË×¼Ò
		AddItem(2, 1, 380, 1)
	elseif (nPlayerRoute == 11) then		-- Ø¤°ï¾»ÒÂ
		AddItem(2, 1, 375, 1)
	elseif (nPlayerRoute == 12) then		-- Ø¤°ïÎÛÒÂ
		AddItem(2, 1, 377, 1)
	elseif (nPlayerRoute == 14) then		-- Îäµ±µÀ¼Ò
		AddItem(2, 1, 376, 1)
	elseif (nPlayerRoute == 15) then		-- Îäµ±Ë×¼Ò
		AddItem(2, 1, 381, 1)
	elseif (nPlayerRoute == 17) then		-- ÑîÃÅÇ¹Æï
		AddItem(2, 1, 383, 1)
	elseif (nPlayerRoute == 18) then		-- ÑîÃÅ¹­Æï
		AddItem(2, 1, 384, 1)
	elseif (nPlayerRoute == 20) then		-- Îå¶¾Ð°ÏÀ
		AddItem(2, 1, 386, 1)
	elseif (nPlayerRoute == 21) then		-- Îå¶¾¹ÆÊ¦
		AddItem(2, 1, 385, 1)
	end
	WriteLogEx("Boss su mon","vò khÝ ch­a gi¸m ®Þnh",1)
end;

-- »ñµÃÊ¦ÃÅÃØ¼®¾í±¾Ò»¸ö£¬nType = 0/1/2 ±íÊ¾ ÉÏ¾í/ÖÐ¾í/ÏÂ¾í
function get_faction_misbook(nType)
	local strTab = {"[th­îng]", "[trung]", "[h¹]"}
	
	local nBookType = tonumber(nType)
	local nBase = 0
	local nSel = random(1, 100)
	
	if (nSel <= 4) then			-- ÉÙÁÖË×¼Ò
		nBase = 916
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch ThiÕu L©m Tôc gia."..strTab[nBookType + 1])
	elseif (nSel <= 8) then		-- ÉÙÁÖÎäÉ®
		nBase = 919
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch ThiÕu L©m Vâ t¨ng"..strTab[nBookType + 1])
	elseif (nSel <= 12) then		-- ÉÙÁÖìøÉ®
		nBase = 922
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch ThiÕu L©m ThiÒn t¨ng"..strTab[nBookType + 1])
	elseif (nSel <= 16) then		-- ÌÆÃÅ				
		nBase = 925
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch §­êng M«n"..strTab[nBookType + 1])
	elseif (nSel <= 20) then		-- ¶ëáÒ·ð¼Ò
		nBase = 928
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch Nga My PhËt gia"..strTab[nBookType + 1])
	elseif (nSel <= 24) then		-- ¶ëáÒË×¼Ò
		nBase = 931
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch Nga My Tôc gia"..strTab[nBookType + 1])
	elseif (nSel <= 28) then		-- Ø¤°ï¾»ÒÂ
		nBase = 934
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch C¸i Bang TÜnh y"..strTab[nBookType + 1])
	elseif (nSel <= 32) then		-- Ø¤°ïÎÛÒÂ
		nBase = 937
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch C¸i Bang ¤ y"..strTab[nBookType + 1])
	elseif (nSel <= 36) then		-- Îäµ±µÀ¼Ò
		nBase = 940
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch Vâ §ang §¹o gia"..strTab[nBookType + 1])
	elseif (nSel <= 40) then		-- Îäµ±Ë×¼Ò
		nBase = 943
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch Vâ §ang Tôc gia"..strTab[nBookType + 1])
	elseif (nSel <= 44) then		-- ÑîÃÅÇ¹Æï
		nBase = 946
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch D­¬ng M«n Th­¬ng kþ"..strTab[nBookType + 1])
	elseif (nSel <= 48) then		-- ÑîÃÅ¹­Æï
		nBase = 949
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch D­¬ng M«n Cung kþ"..strTab[nBookType + 1])
	elseif (nSel <= 74) then		-- Îå¶¾¹ÆÊ¦×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nBase = 952
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch Ngò §éc Cæ s­"..strTab[nBookType + 1])
	elseif (nSel <= 100) then		-- Îå¶¾Ð°ÏÀ×Ô¼ºµÄ¸ÅÂÊ±È½Ï¸ß
		nBase = 955
		Msg2Player("B¹n më b¶o r­¬ng, nhËn ®­îc mét phÇn cña quyÓn mËt tÞch Ngò §éc Tµ hiÖp"..strTab[nBookType + 1])
	end
	
	AddItem(2, 1, nBase + nBookType, 1)
	WriteLogEx("Boss su mon","mËt tÞch trÊn ph¸i",1,"","G:2,D:1,P:"..(nBase + nBookType))
end;

