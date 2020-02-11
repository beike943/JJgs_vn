-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÍÆ¹ãÔ±ÏµÍ³½Å±¾
-- Edited by peres
-- 2005/02/22 PM 18:03

-- ======================================================

--Include("\\script\\task\\teach\\teach_main.lua");
IncludeLib("SPREADER");

	-- ĞÂÊÖÍÆ¹ãÏµÍ³ËùÓÃµÄÀ©Õ¹µã(16Î»)
	GSP_ACCOUNT_EXTPOINT 		= 7;
	GSP_ACCOUNT_TYPE_NORMAL 	= 0; -- ÆÕÍ¨ÕÊºÅ
	GSP_ACCOUNT_TYPE_UNKNOWN	= 1; -- Ô­ÓÎÏ·ÍÆ¹ãÕ¾ÕÊºÅ£¿£¿
	GSP_ACCOUNT_TYPE_NEWPLAYER 	= 2; -- ĞÂÊÖÍÆ¹ãÕÊºÅ[ĞÂÊÖ¿ª»§¿¨(KS¿ªÍ·)]
    GSP_ACCOUNT_TYPE_CDKEY 		= 3; -- Í¨¹ıcd-key¼¤»îµÄÕÊºÅ
-------------------------------------------------------

-------------------------------------------------------
	-- ÈÎÎñ±äÁ¿£º¼ÇÂ¼ÓÎÏ·ÍÆ¹ãÔ±ÏµÍ³½ÇÉ«ĞÅÏ¢	
	GSP_TASKID_ROLEREINFO = 1398;
	GSP_TASKID_TAG_BYTE_ROLETYPE 	= 1;	-- GetBit(1) = 0 - ÆÕÍ¨½ÇÉ«, 1 - CDKEY¼¤»î½ÇÉ«
	GSP_TASKID_TAG_BIT_01BONUS 		= 8+1;	-- GetBit(8+1) = 1 -  ÒÑÁìÈ¡ 1¼¶½±Àø
	GSP_TASKID_TAG_BIT_15BONUS 		= 8+2; 	-- GetBit(8+2) = 1 -  ÒÑÁìÈ¡15¼¶½±Àø
	GSP_TASKID_TAG_BIT_30BONUS 		= 8+3;	-- GetBit(8+3) = 1 -  ÒÑÁìÈ¡30¼¶½±Àø
	GSP_TASKID_TAG_BIT_40BONUS 		= 8+4;	-- GetBit(8+4) = 1 -  ÒÑÁìÈ¡40¼¶½±Àø
	GSP_TASKID_TAG_BIT_01BONUS2		= 8+5;	-- GetBit(8+5) = 1 -  ÒÑÁìÈ¡ Ã»ÓĞ50Á½Òø×ÓµÄ1¼¶½±Àø
-----------------------
	-- ½ÇÉ«ÀàĞÍ(ÈÎÎñ±äÁ¿µÄµÚ¸ö×Ö½Ú)
		GSP_TASKID_ROLETYPE_NORMAL 	= 0; -- ÆÕÍ¨½ÇÉ«
		GSP_TASKID_ROLETYPE_CDKEY 	= 1; -- CDKEY¼¤»î½ÇÉ«
-------------------------------------------------------

-------------------------------------------------------
-- ÒÔÏÂÖµÓëPaySys¶¨ÒåÒ»ÖÂ
GSP_CDKEY_ACTION_SUCCESS 		= 1 -- ³É¹¦
GSP_CDKEY_ACTION_FAILED	 		= 2 -- Ê§°Ü
GSP_CDKEY_E_CDKEYERROR			= 3 -- CDKEY²»ÕıÈ·
GSP_CDKEY_E_INPUTED_CDKEY		= 74 -- ÕÊºÅÒÑ¾­±»¼¤»îÁË
GSP_CDKEY_E_NEWTIMEOUT 			= 75 -- ÕÊºÅÒÑ³¬Ê±¡·10Ğ¡Ê±ÁË
GSP_CDKEY_E_NEWACTIVED 			= 76 -- ÕÊºÅ²»ÊôÓÚ¿ÉÒÔ¼¤»îµÄ¶«Î÷
GSP_CDKEY_E_CDKEY_USED_OR_NOT_OPEN	= 77 -- ÊäÈëµÄCDKEY»¹Ã»ÓĞ±»Ê¹ÓÃ»òÕßÒÑ¾­±»±ğÈËÊ¹ÓÃÁË
-------------------------------------------------------

-- Èë¿Úº¯Êı
function spreader_main()
	Say("Hoan nghªnh b¹n ®Õn th¨m <color=green>Sø gi¶<color>! HiÖn ®ang cã nhiÒu ho¹t ®éng dµnh cho T©n thñ. Cã thÓ gióp g× cho b¹n ch¨ng?", 
		4, 
		"NhËn phÇn th­ëng t©n thñ/XSTG_award",
		"NhËp [CD-KEY]kİch ho¹t tµi kho¶n cña b¹n/gsp_input_cdkey", 
		"NhËn phÇn th­ëng giai ®o¹n sau khi kİch ho¹t [CD-KEY]cña b¹n/gsp_phase_prize",
		"Liªn quan Sø gi¶.../gsp_about")
end;

-- ÊäÈë[CD-KEY]¼¤»îÄúµÄÕÊºÅ
function gsp_input_cdkey()
	local nValue = GetBeSpreadFlag()
	if (nValue == 1) then
		local szError = "Tµi kho¶n nµy ®· kİch ho¹t, kh«ng cÇn nhËp [CD-KEY]n÷a."
		Say("<color=green>Sø gi¶<color>:"..szError, 0)
		return
	end
	-- Í¨Öª¿Í»§¶Ë´ò¿ªÊäÈë¿ò
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Vui lßng nhËp CD-KEY:")
end

-- ÁìÈ¡ÄúµÄ[CD-KEY]¼¤»îºó½×¶Î½±Àø
function gsp_phase_prize()
    local nValue = GetBeSpreadFlag()
    local nStage = GetTask(GSP_TASKID_ROLEREINFO)
    if (nValue ~= 1) then
		Say("B¹n ch­a dïng [CD-KEY]kİch ho¹t tµi kho¶n nµy, kh«ng thÓ l·nh ®­îc phÇn th­ëng. Vui lßng xem chi tiÕt trªn trang chñ.", 0)
		return
    end
	
	-- ĞÂµÄĞÂÊÖÍÆ¹ãÕÊºÅ½±Àø
	get_xstg_award()
end;

-- CDKEY¼ìÑé½á¹û·µ»Ø´¦Àí
function gsp_cdkey_verify_result(nResult)
	print("Result:"..nResult)
	local szMsg = 
	{	"Ch­a ph¸t hiÖn lçi, vui lßng liªn hÖ víi dŞch vô kh¸ch hµng cña chóng t«i!",
		"[CD-KEY]v« hiÖu, vui lßng nhËp chİnh x¸c [CD-KEY]!",
		"NhËp [CD-KEY]chİnh x¸c, kİch ho¹t tµi kho¶n thµnh c«ng! Hoan nghªng b¹n ®Õn th¨m Sø gi¶!",
		"ThÊt b¹i: Tµi kho¶n ®· v­ît qu¸ 10 giê sö dông, kh«ng thÓ ®¨ng nhËp!",
		"ThÊt b¹i: Tµi kho¶n ®· kİch ho¹t, kh«ng thÓ ®¨ng nhËp lÇn n÷a!",
		"ThÊt b¹i: [CD-KEY]nµy t¹m thêi kh«ng dïng ®­îc hoÆc ®· bŞ sö dông!",
		"ThÊt b¹i: Tµi kho¶n nµy kh«ng thÓ kİch ho¹t ®­îc!"}
		
	local nSel = 1
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4
	elseif (nResult == GSP_CDKEY_E_INPUTED_CDKEY) then
		nSel = 5
	elseif (nResult == GSP_CDKEY_E_CDKEY_USED_OR_NOT_OPEN) then
		nSel = 6
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 7
	end

	print("GSP_CDKEY_ACTION_SUCCESS:"..GSP_CDKEY_ACTION_SUCCESS)
	print("GSP_CDKEY_E_NEWTIMEOUT"..GSP_CDKEY_E_NEWTIMEOUT)
	print("nSel:"..nSel)
	Msg2Player(szMsg[nSel])
	Say("[<color=green>Sø gi¶<color>]:"..szMsg[nSel], 0)

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
        SetBeSpreadFlag()
	end
	return 1
end;

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey)
end;

function gsp_about()
	Say("HiÖn ®ang cã nhiÒu ho¹t ®éng gióp T©n thñ nhanh chãng t¨ng cÊp. Xin xem chi tiÕt trªn trang chñ.", 0)
end;

function gsp_cancel()
end

-- ĞÂµÄXSTGÕÊºÅ½±ÀøÏµÍ³
function XSTG_award()
	local strAccount = GetAccount()
	local str1 = strsub(strAccount, 1, 1)
	local str2 = strsub(strAccount, 2, 2)
	local str3 = strsub(strAccount, 3, 3)
	local str4 = strsub(strAccount, 4, 4)
	-- ÅĞ¶ÏÊÇ²»ÊÇĞÂÊÖÍÆ¹ãÕÊºÅ
	if ((str1 == 'K' or str1 == 'k') and
		(str2 == 'S' or str2 == 's') and
		(str3 == 'T' or str3 == 't') and
		(str4 == 'G' or str4 == 'g')) then
		Say("Khi T©n thñ ®¹t ®Õn cÊp 10, cÊp 20, cÊp 30, cÊp 50, cÊp 55, cÊp 58, cÊp 60 ®Òu cã thÓ nhËn ®­îc phÇn th­ëng t­¬ng øng, néi dung cô thÓ xin xem trang chñ. Xin x¸c nhËn l¹i kho¶ng trèng cña hµnh trang vµ cÇn l·nh phÇn th­ëng g×?",
			2,
			"Ta muèn l·nh phÇn th­ëng /get_xstg_award",
			"T¹m thêi kh«ng muèn l·nh/gsp_cancel")
	else
		Say("Xin lçi! Tµi kho¶n nµy kh«ng thuéc t©n thñ!", 0)
	end
end;

-- ÕæµÄÁìÈ¡XSTG½×¶Î½±Àø
function get_xstg_award()
	local nHaveGetLevel = GetTask(95)		-- ÉÏ´ÎÁìÈ¡½±ÀøµÄµÈ¼¶
	local nCurLevel = GetLevel()			-- µ±Ç°Íæ¼ÒµÈ¼¶
	
	-- 10¼¶µÄ½±Àø
	if (nCurLevel >= 10 and nHaveGetLevel < 10) then
		local nRandom = random(1, 2)
		if (nRandom == 1) then
			AddItem(1, 0, 2, 150)		-- ½ğ´´É¢
			Msg2Player("B¹n nhËn ®­îc 150 b×nh Kim S¸ng t¸n!")
		else
			AddItem(1, 0, 7, 150)		-- Ğ¡»¹µ¤
			Msg2Player("B¹n nhËn ®­îc 150 b×nh TiÓu Hoµn ®¬n!")
		end
		SetTask(95, 10)
		return
	end
	
	-- 20¼¶µÄ½±Àø
	if (nCurLevel >= 20 and nHaveGetLevel < 20) then
		AddItem(1, 0, 2, 150)		-- ½ğ´´É¢
		AddItem(1, 0, 7, 150)		-- Ğ¡»¹µ¤
		Msg2Player("B¹n nhËn ®­îc 150 b×nh Kim S¸ng t¸n vµ 150 b×nh TiÓu Hoµn ®¬n!")
		SetTask(95, 20)
		return
	end
	
	-- 30¼¶µÄ½±Àø
	if (nCurLevel >= 30 and nHaveGetLevel < 30) then
		get_xstg_suit(0, 30)
		return
	end
	
	-- 50¼¶µÄ½±Àø
	if (nCurLevel >= 50 and nHaveGetLevel < 50) then
		get_xstg_book()
		return
	end
	
	-- 55¼¶µÄ½±Àø
	if (nCurLevel >= 55 and nHaveGetLevel < 55) then
		get_xstg_suit(10, 55)
		ModifyReputation(500, 0)
		Msg2Player("B¹n nhËn ®­îc 500 ®iÓm danh väng!")
		return
	end
	
	-- 58¼¶µÄ½±Àø
	if (nCurLevel >= 58 and nHaveGetLevel < 58) then
		get_xstg_suit(10, 58)
		return
	end
	
	-- 60¼¶µÄ½±Àø
	if (nCurLevel >= 60 and nHaveGetLevel < 60) then
		get_xstg_suit(10, 60)
		return
	end
	
	Say("Lµm ng­êi, tr­íc khi nh¾m m¾t xu«i tay, cã thÓ cèng hiÕn cho Quèc gia còng lµ viÖc nªn lµm!", 0)
end;

-- »ñµÃÃØ¼®Ò»±¾£¬ºÜÉÙ¸ÅÂÊ»ñµÃÊ¦ÃÅÃØ¼®
function get_xstg_book()
	local nCurRoute = GetPlayerRoute()
	local nRandomIndex = random(100)
	
	if (nCurRoute == 0 or nCurRoute == 1 or nCurRoute == 5 or 
		nCurRoute == 7 or nCurRoute == 10 or nCurRoute == 13 or 
		nCurRoute == 16 or nCurRoute == 19) then
		Say("Mau gia nhËp m«n ph¸i vµ b¸i s­ häc nghÖ ®Ó nhËn mËt tŞch!", 0)
		return
	end
	
	if (nRandomIndex <= 10) then
		AddItem(0, 107, 57, 1)
	elseif (nRandomIndex <= 20) then
		AddItem(0, 107, 58, 1)
	elseif (nRandomIndex <= 30) then
		AddItem(0, 107, 59, 1)
	elseif (nRandomIndex <= 40) then
		AddItem(0, 107, 60, 1)
	elseif (nRandomIndex <= 50) then
		AddItem(0, 107, 61, 1)
	elseif (nRandomIndex <= 60) then
		AddItem(0, 107, 62, 1)
	elseif (nRandomIndex <= 70) then
		AddItem(0, 107, 63, 1)
	elseif (nRandomIndex <= 78) then
		AddItem(0, 107, 64, 1)
	elseif (nRandomIndex <= 86) then
		AddItem(0, 107, 65, 1)		
	elseif (nRandomIndex <= 92) then
		AddItem(0, 107, 66, 1)
	else
		local nPlus = random(0, 1)
		if (nCurRoute == 2) then
			AddItem(0, 107, 1 + nPlus, 1)
		elseif (nCurRoute == 3) then
			AddItem(0, 107, 5 + nPlus, 1)
		elseif (nCurRoute == 4) then
			AddItem(0, 107, 3 + nPlus, 1)
		elseif (nCurRoute == 6) then
			AddItem(0, 107, 7 + nPlus, 1)
		elseif (nCurRoute == 8) then
			AddItem(0, 107, 9 + nPlus, 1)
		elseif (nCurRoute == 9) then
			AddItem(0, 107, 11 + nPlus, 1)
		elseif (nCurRoute == 11) then
			AddItem(0, 107, 13 + nPlus, 1)
		elseif (nCurRoute == 12) then
			AddItem(0, 107, 15 + nPlus, 1)
		elseif (nCurRoute == 14) then
			AddItem(0, 107, 17 + nPlus, 1)
		elseif (nCurRoute == 15) then
			AddItem(0, 107, 19 + nPlus, 1)
		elseif (nCurRoute == 17) then
			AddItem(0, 107, 21 + nPlus, 1)
		elseif (nCurRoute == 18) then
			AddItem(0, 107, 23 + nPlus, 1)
		elseif (nCurRoute == 20) then
			AddItem(0, 107, 25 + nPlus, 1)
		elseif (nCurRoute == 21) then
			AddItem(0, 107, 27 + nPlus, 1)
		end
	end

	Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tŞch!")
	SetTask(95, 50)
end;

-- »ñµÃÒ»Ì×Ê¦ÃÅ³õ¼¶Ì××°
function get_xstg_suit(nPlus, nLevel)
	local nCurRoute = GetPlayerRoute()
	local nCurBody = GetBody()
	local nParticular = nCurRoute * 100 + nPlus + nCurBody
	-- ¶ëáÒÌåĞÍĞŞÕı
	if (nCurRoute == 8 or nCurRoute == 9) then
		nParticular = nParticular - 2
	end
	
	local nDetail = {0, 	-- ÉÙÁÖ1
					 3, 	-- ÉÙÁÖË×¼Ò2
					 8, 	-- ÉÙÁÖìø×Ú3
					 0,		-- ÉÙÁÖÎä×Ú4
					 0,		-- ÌÆÃÅ5
					 1,		-- ÌÆÃÅ6
					 0,		-- ¶ëáÒ7
					 2,		-- ¶ëáÒ·ğ¼Ò8
					 10,	-- ¶ëáÒË×¼Ò9
					 0,		-- Ø¤°ï10
					 0,		-- Ø¤°ï¾»ÒÂ11
					 5,		-- Ø¤°ïÎÛÒÂ12
					 0,		-- Îäµ±13
					 2,		-- Îäµ±µÀ¼Ò14
					 9,		-- Îäµ±Ë×¼Ò15
					 0,		-- ÑîÃÅ16
					 6,		-- ÑîÃÅÇ¹Æï17
					 4,		-- ÑîÃÅ¹­Æï18
					 0,		-- Îå¶¾19
					 7,		-- Îå¶¾Ğ°ÏÀ20
					 11}	-- Îå¶¾¹ÆÊ¦21

	-- Ã»ÓĞÈëÃÅÅÉ»òÕßÁ÷ÅÉµÄÍæ¼Ò£¬²»¸ø¶«Î÷
	if (nCurRoute == 0 or nCurRoute == 1 or nCurRoute == 5 or
		nCurRoute == 7 or nCurRoute == 10 or nCurRoute == 13 or
		nCurRoute == 16 or nCurRoute == 19) then
		Say("Mau gia nhËp m«n ph¸i vµ b¸i s­ häc nghÖ ®Ó nhËn bé trang bŞ s­ m«n!", 0)
		return
	end

	if (nLevel == 30) then
		AddItem(0, 103, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- Ã±×Ó
		AddItem(0, 100, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- ÒÂ·ş
		AddItem(0, 101, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- ¿ã×Ó
		AddItem(0, nDetail[nCurRoute], nParticular, 1, 1, -1, -1, -1, -1, -1, -1)	-- ÎäÆ÷
	elseif (nLevel == 55) then
		AddItem(0, nDetail[nCurRoute], nParticular, 1, 1, -1, -1, -1, -1, -1, -1)	-- ÎäÆ÷
	elseif (nLevel == 58) then
		AddItem(0, 100, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- ÒÂ·ş
	elseif (nLevel == 60) then
		AddItem(0, 102, nParticular, 1, 1, -1, -1, -1, -1, -1, -1)		-- Ê×ÊÎ
	end
	
	
	if (nPlus == 0) then
		Msg2Player("B¹n nhËn ®­îc 1 bé trang bŞ s­ m«n s¬ cÊp!")
	else
		Msg2Player("B¹n nhËn ®­îc 1 bé trang bŞ s­ m«n trung cÊp!")
	end
	SetTask(95, nLevel)
end;