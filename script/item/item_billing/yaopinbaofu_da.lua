------------------------------------------------------------
-- Ò©Æ·°ü¸¤£¨´ó£©µÄ½Å±¾ yaopinbaofu_da.lua
--
-- comment: ½«ÈÎÒâ250Æ¿¸ß¼¶Ò©Æ·´ò°ü¡£
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,1,478
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("B¹n muèn ®ãng gãi lo¹i bao d­îc phÈm nµo?",
		4,
		"Sinh lùc d­îc/pack_life_bottles",
		"Néi lùc d­îc/pack_energy_bottles",
		"Song bæ d­îc/pack_both_bottles",
		"T¹m thêi kh«ng ®ãng gãi--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò°üÉúÃüÒ©Ë®
function pack_life_bottles()
		
	local bHaveBaiyunsan = GetItemCount(1, 0, 4)			-- °×ÔÆÉ¢
	local bHaveTianxiangyunjingxu = GetItemCount(1, 0, 5)	-- ÌìÏãÔÆ½õÐø
	local bHaveHeiyuduanxugao = GetItemCount(1, 0, 6)		-- ºÚÓñ¶ÏÐø¸à

	-- ¶¼²»¹»250Æ¿
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say("Bao sinh lùc d­îc cã: <color=yellow>B¹ch V©n t¸n, Thiªn H­¬ng CÈm Tôc, H¾c Ngäc §o¹n Tôc Cao<color>, 3 lo¹i mang theo kh«ng ®ñ 250 b×nh, kh«ng thÓ ®ãng gãi!", 0)
		return
	end
	
	strTab = {"Bao sinh lùc d­îc cã: <color=yellow>B¹ch V©n t¸n, Thiªn H­¬ng CÈm Tôc, H¾c Ngäc §o¹n Tôc Cao<color>, b¹n muèn ®ãng gãi lo¹i nµo?",
			  "Ta muèn ®ãng gãi 250 b×nh B¹ch V©n t¸n!/pack_250_baiyunsan",
			  "Ta muèn ®ãng gãi 250 b×nh Thiªn H­¬ng CÈm Tôc!/pack_250_tianxiangyunjingxu",
			  "Ta muèn ®ãng gãi 250 b×nh H¾c Ngäc §o¹n Tôc Cao!/pack_250_heiyuduanxugao",
			  "T¹m thêi kh«ng ®ãng gãi--Hñy bá/cancel_dialog"}
			  
	-- ÈýÖÖ¶¼ÓÐ
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- È±°×ÔÆÉ¢
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- È±ÌìÏãÔÆ½õÐø
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- È±ºÚÓñ¶ÏÐø¸à
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- Ö»ÓÐ°×ÔÆÉ¢
	if ((bHaveBaiyunsan >= 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- Ö»ÓÐÌìÏãÔÆ½õÐø
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu >= 250) and 
		(bHaveHeiyuduanxugao < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- Ö»ÓÐºÚÓñ¶ÏÐø¸à
	if ((bHaveBaiyunsan < 250) and 
		(bHaveTianxiangyunjingxu < 250) and 
		(bHaveHeiyuduanxugao >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- È·ÈÏ´ò°ü250Æ¿°×ÔÆÉ¢
function pack_250_baiyunsan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 4, 250) == 1) then
			AddItem(2, 1, 486, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>B¹ch V©n t¸n<color>, nhËn ®­îc 1 <color=yellow>B¹ch V©n t¸n (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh B¹ch V©n t¸n, nhËn ®­îc 1 B¹ch V©n t¸n (®¹i)!")
		else
			Say("<color=yellow>B¹ch V©n t¸n<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;
-- È·ÈÏ´ò°ü250Æ¿ÌìÏãÔÆ½õÐø
function pack_250_tianxiangyunjingxu()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 5, 250) == 1) then
			AddItem(2, 1, 488, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>Thiªn H­¬ng CÈm Tôc<color>, nhËn ®­îc 1 <color=yellow>Thiªn H­¬ng CÈm Tôc (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh Thiªn H­¬ng CÈm Tôc, nhËn ®­îc 1 Thiªn H­¬ng CÈm Tôc (®¹i)!")
		else
			Say("<color=yellow>Thiªn H­¬ng CÈm Tôc<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;
-- È·ÈÏ´ò°ü250Æ¿ºÚÓñ¶ÏÐø¸à
function pack_250_heiyuduanxugao()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 6, 250) == 1) then
			AddItem(2, 1, 490, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color>, nhËn ®­îc 1 <color=yellow>H¾c Ngäc §o¹n Tôc Cao (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh H¾c Ngäc §o¹n Tôc Cao, nhËn ®­îc 1 H¾c Ngäc §o¹n Tôc Cao (®¹i)!")
		else
			Say("<color=yellow>H¾c Ngäc §o¹n Tôc Cao<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;



-- ´ò°üÄÚÁ¦Ò©Ë®
function pack_energy_bottles()
	local bHavedahuandan = GetItemCount(1, 0, 9)			-- ´ó»¹µ¤
	local bHaveyiyuanfushidan = GetItemCount(1, 0, 10)		-- Ò»Ôª¸´Ê¼µ¤
	local bHavewanwuguiyuandan = GetItemCount(1, 0, 11)		-- ÍòÎï¹éÔªµ¤

	-- ¶¼²»¹»250Æ¿
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say("Bao néi lùc d­îc cã: <color=yellow>§¹i Hoµn ®¬n, NhÊt Nguyªn Phôc Thñy §¬n, V¹n VËt Quy Nguyªn §¬n<color>, 3 lo¹i mang theo kh«ng ®ñ 250 b×nh, kh«ng thÓ ®ãng gãi!", 0)
		return
	end
	
	strTab = {"Bao néi lùc d­îc cã: <color=yellow>§¹i Hoµn ®¬n, NhÊt Nguyªn Phôc Thñy §¬n, V¹n VËt Quy Nguyªn §¬n<color>, b¹n muèn ®ãng gãi lo¹i nµo?",
			  "Ta muèn ®ãng gãi 250 b×nh §¹i Hoµn ®¬n!/pack_250_dahuandan",
			  "Ta muèn ®ãng gãi 250 b×nh NhÊt Nguyªn Phôc Thñy §¬n!/pack_250_yiyuanfushidan",
			  "Ta muèn ®ãng gãi 250 b×nh V¹n VËt Quy Nguyªn §¬n!/pack_250_wanwuguiyuandan",
			  "T¹m thêi kh«ng ®ãng gãi--Hñy bá/cancel_dialog"}
			  
	-- ÈýÖÖ¶¼ÓÐ
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- È±´ó»¹µ¤
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- È±Ò»Ôª¸´Ê¼µ¤
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- È±ÍòÎï¹éÔªµ¤
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- Ö»ÓÐ´ó»¹µ¤
	if ((bHavedahuandan >= 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- Ö»ÓÐÒ»Ôª¸´Ê¼µ¤
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan >= 250) and 
		(bHavewanwuguiyuandan < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- Ö»ÓÐÍòÎï¹éÔªµ¤
	if ((bHavedahuandan < 250) and 
		(bHaveyiyuanfushidan < 250) and 
		(bHavewanwuguiyuandan >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- È·ÈÏ´ò°ü250Æ¿´ó»¹µ¤
function pack_250_dahuandan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 9, 250) == 1) then
			AddItem(2, 1, 492, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>§¹i Hoµn ®¬n<color>, nhËn ®­îc 1 <color=yellow>§¹i Hoµn ®¬n (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh §¹i Hoµn ®¬n, nhËn ®­îc 1 §¹i Hoµn ®¬n (®¹i)!")
		else
			Say("<color=yellow>§¹i Hoµn ®¬n<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;
-- È·ÈÏ´ò°ü250Æ¿Ò»Ôª¸´Ê¼µ¤
function pack_250_yiyuanfushidan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 10, 250) == 1) then
			AddItem(2, 1, 494, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n<color>, nhËn ®­îc 1 <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh NhÊt Nguyªn Phôc Thñy §¬n, nhËn ®­îc 1 NhÊt Nguyªn Phôc Thñy §¬n (®¹i)!")
		else
			Say("<color=yellow>NhÊt Nguyªn Phôc Thñy §¬n<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;
-- È·ÈÏ´ò°ü250Æ¿ÍòÎï¹éÔªµ¤
function pack_250_wanwuguiyuandan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 11, 250) == 1) then
			AddItem(2, 1, 496, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>V¹n VËt Quy Nguyªn §¬n<color>, nhËn ®­îc 1 <color=yellow>V¹n VËt Quy Nguyªn §¬n (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh V¹n VËt Quy Nguyªn §¬n, nhËn ®­îc 1 V¹n VËt Quy Nguyªn §¬n (®¹i)!")
		else
			Say("<color=yellow>V¹n VËt Quy Nguyªn §¬n<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;



-- ´ò°üË«²¹Ò©Ë®
function pack_both_bottles()
	local bHaveyulingsan = GetItemCount(1, 0, 14)			-- ÓñÁéÉ¢
	local bHavewuhuayuluwan = GetItemCount(1, 0, 15)		-- Îå»¨ÓñÂ¶Íè
	local bHaveshengshengzaohuasan = GetItemCount(1, 0, 16)	-- ÉúÉúÔì»¯É¢

	-- ¶¼²»¹»100Æ¿
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say("Bao song bæ d­îc cã: <color=yellow>Ngäc Linh t¸n, Ngò Hoa Ngäc Lé Hoµn, Sinh Sinh Hãa T¸n<color>, 3 lo¹i mang theo kh«ng ®ñ 250 b×nh, kh«ng thÓ ®ãng gãi!", 0)
		return
	end
	
	strTab = {"Bao song bæ d­îc cã: <color=yellow>Ngäc Linh t¸n, Ngò Hoa Ngäc Lé Hoµn, Sinh Sinh Hãa T¸n<color>, b¹n Muèn ®ãng gãi lo¹i nµo?",
			  "Ta muèn ®ãng gãi 250 b×nh Ngäc Linh t¸n!/pack_250_yulingsan",
			  "Ta muèn ®ãng gãi 250 b×nh Ngò Hoa Ngäc Lé Hoµn!/pack_250_wuhuayuluwan",
			  "Ta muèn ®ãng gãi 250 b×nh Sinh Sinh Hãa T¸n!/pack_250_shengshengzaohuasan",
			  "T¹m thêi kh«ng ®ãng gãi--Hñy bá/cancel_dialog"}
			  
	-- ÈýÖÖ¶¼ÓÐ
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 4, strTab[2], strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- È±ÓñÁéÉ¢
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 3, strTab[3], strTab[4], strTab[5])
		return
	end
	
	-- È±Îå»¨ÓñÂ¶Íè
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 3, strTab[2], strTab[4], strTab[5])
		return
	end
	
	-- È±ÉúÉúÔì»¯É¢
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 3, strTab[2], strTab[3], strTab[5])
		return
	end
	
	-- Ö»ÓÐÓñÁéÉ¢
	if ((bHaveyulingsan >= 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 2, strTab[2], strTab[5])
		return
	end
	
	-- Ö»ÓÐÎå»¨ÓñÂ¶Íè
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan >= 250) and 
		(bHaveshengshengzaohuasan < 250)) then
		Say(strTab[1], 2, strTab[3], strTab[5])
		return
	end
	
	-- Ö»ÓÐÉúÉúÔì»¯É¢
	if ((bHaveyulingsan < 250) and 
		(bHavewuhuayuluwan < 250) and 
		(bHaveshengshengzaohuasan >= 250)) then
		Say(strTab[1], 2, strTab[4], strTab[5])
		return
	end
	
end;
-- È·ÈÏ´ò°ü250Æ¿ÓñÁéÉ¢
function pack_250_yulingsan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 14, 250) == 1) then
			AddItem(2, 1, 480, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>Ngäc Linh t¸n<color>, nhËn ®­îc 1 <color=yellow>Ngäc Linh t¸n (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh Ngäc Linh t¸n, nhËn ®­îc 1 Ngäc Linh t¸n (®¹i)!")
		else
			Say("<color=yellow>Ngäc Linh t¸n<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;
-- È·ÈÏ´ò°ü250Æ¿Îå»¨ÓñÂ¶Íè
function pack_250_wuhuayuluwan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 15, 250) == 1) then
			AddItem(2, 1, 482, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>Ngò Hoa Ngäc Lé Hoµn<color>, nhËn ®­îc 1 <color=yellow>Ngò Hoa Ngäc Lé Hoµn (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh Ngò Hoa Ngäc Lé Hoµn, nhËn ®­îc 1 Ngò Hoa Ngäc Lé Hoµn (®¹i)!")
		else
			Say("<color=yellow>Ngò Hoa Ngäc Lé Hoµn<color> mang theo kh«ng ®ñ 250 b×nh!!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;
-- È·ÈÏ´ò°ü250Æ¿ÉúÉúÔì»¯É¢
function pack_250_shengshengzaohuasan()
	if (DelItem(2, 1, 478, 1) == 1) then
		if (DelItem(1, 0, 16, 250) == 1) then
			AddItem(2, 1, 484, 1)
			Say("B¹n ®ãng gãi 250 b×nh <color=yellow>Sinh Sinh Hãa T¸n<color>, nhËn ®­îc 1 <color=yellow>Sinh Sinh Hãa T¸n (®¹i)<color>!", 0)
			Msg2Player("B¹n ®ãng gãi 250 b×nh Sinh Sinh Hãa T¸n, nhËn ®­îc 1 Sinh Sinh Hãa T¸n (®¹i)!")
		else
			Say("<color=yellow>Sinh Sinh Hãa T¸n<color> mang theo kh«ng ®ñ 250 b×nh!", 0)
		end
	else
		Say("B¹n kh«ng mang theo tói d­îc phÈm lín!", 0)
	end
end;


