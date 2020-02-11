------------------------------------------------------------
-- ÊÀ½ç±­Õ½ÅÛµÄ½Å±¾ shijiebeizhanpao.lua
--
-- comment: ´ò¿ªºó»ñµÃÒ»¸öÖ¸¶¨µÄÊÀ½ç±­Õ½ÅÛ
-- creator: Tony(Jizheng)
-- Date   : Jul 31st, 2006
--
-- Item ID:  2,1,505
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy <color=yellow>ThÕ Giíi chiÕn bµo<color> ra kh«ng? Xin hái ng­¬i cÇn lo¹i chiÕn bµo nµo?",
		5,
		"Ta cÇn Tiªu ChuÈn chiÕn bµo/need_normal_suit",
		"Ta cÇn Kh«i Ng« chiÕn bµo/need_strong_suit",
		"Ta cÇn Gîi C¶m chiÕn bµo/need_sexy_suit",
		"Ta cÇn KiÒu n÷ chiÕn bµo/need_amortta_suit",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ĞèÒª±ê×¼ÌåĞÍµÄÕ½ÅÛ
function need_normal_suit()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"T¹m thêi kh«ng cÇn/cancel_dialog",
		"§øc ı chiÕn bµo/need_normal_germany",
		"Tang Ba chiÕn bµo/need_normal_brazil",
		"A C¨n chiÕn bµo/need_normal_argentina",
		"BÊt DiÖt chiÕn bµo/need_normal_england",
		"TØ T¸t chiÕn bµo/need_normal_italy",
		"Cßn 5 bé, xin xem trang sau/need_normal_suit_page2")
end;
function need_normal_suit_page2()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"Cßn 5 bé, xin xem trang tr­íc/need_normal_suit",
		"¸i Phi chiÕn bµo/need_normal_france",
		"Phong Xa chiÕn bµo/need_normal_holland",
		"§Êu Ng­u chiÕn bµo/need_normal_spain",
		"Bå Quèc chiÕn bµo/need_normal_portugel",
		"TiÖp Kh¸ch chiÕn bµo/need_normal_szech",
		"T¹m thêi kh«ng cÇn/cancel_dialog")
end;
-- ±ê×¼ĞÍµÄ10¼şÒÂ·ş
function need_normal_germany()
	-- µÂÒâÕ½ÅÛ	0, 109, 133
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 133, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§øc ı chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §øc ı chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_brazil()
	-- É£°ÍÕ½ÅÛ	0, 109, 137
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 137, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Tang Ba chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Tang Ba chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_argentina()
	-- °¢¸ùÕ½ÅÛ	0, 109, 141
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 141, 1)
		Say("B¹n nhËn ®­îc <color=yellow>A C¨n chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc A C¨n chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_england()
	-- ²»ÁĞµßÕ½ÅÛ 0, 109, 145
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 145, 1)
		Say("B¹n nhËn ®­îc <color=yellow>BÊt DiÖt chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc BÊt DiÖt chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_italy()
	-- ±ÈÈøÕ½ÅÛ	0, 109, 149
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 149, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TØ T¸t chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TØ T¸t chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_france()
	-- °®·Æ¶ûÕ½ÅÛ 0, 109, 153
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 153, 1)
		Say("B¹n nhËn ®­îc <color=yellow>¸i Phi chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc ¸i Phi chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_holland()
	-- ·ç³µÕ½ÅÛ	0, 109, 157
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 157, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Phong Xa chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Phong Xa chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_spain()
	-- ¶·Å£Õ½ÅÛ	0, 109, 161
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 161, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§Êu Ng­u chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §Êu Ng­u chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_portugel()
	-- ÆÏ¹úÕ½ÅÛ	0, 109, 165
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 165, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Bå Quèc chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Bå Quèc chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_normal_szech()
	-- ½İ¿ÍÕ½ÅÛ	0, 109, 169
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 169, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TiÖp Kh¸ch chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TiÖp Kh¸ch chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;



-- ĞèÒª¿ıÎàÌåĞÍµÄÕ½ÅÛ
function need_strong_suit()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"T¹m thêi kh«ng cÇn/cancel_dialog",
		"§øc ı chiÕn bµo/need_strong_germany",
		"Tang Ba chiÕn bµo/need_strong_brazil",
		"A C¨n chiÕn bµo/need_strong_argentina",
		"BÊt DiÖt chiÕn bµo/need_strong_england",
		"TØ T¸t chiÕn bµo/need_strong_italy",
		"Cßn 5 bé, xin xem trang sau/need_strong_suit_page2")
end;
function need_strong_suit_page2()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"Cßn 5 bé, xin xem trang tr­íc/need_strong_suit",
		"¸i Phi chiÕn bµo/need_strong_france",
		"Phong Xa chiÕn bµo/need_strong_holland",
		"§Êu Ng­u chiÕn bµo/need_strong_spain",
		"Bå Quèc chiÕn bµo/need_strong_portugel",
		"TiÖp Kh¸ch chiÕn bµo/need_strong_szech",
		"T¹m thêi kh«ng cÇn/cancel_dialog")
end;
-- ¿ıÎàĞÍµÄ10¼şÒÂ·ş
function need_strong_germany()
	-- µÂÒâÕ½ÅÛ	0, 109, 134
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 134, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§øc ı chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §øc ı chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_brazil()
	-- É£°ÍÕ½ÅÛ	0, 109, 138
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 138, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Tang Ba chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Tang Ba chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_argentina()
	-- °¢¸ùÕ½ÅÛ	0, 109, 142
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 142, 1)
		Say("B¹n nhËn ®­îc <color=yellow>A C¨n chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc A C¨n chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_england()
	-- ²»ÁĞµßÕ½ÅÛ 0, 109, 146
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 146, 1)
		Say("B¹n nhËn ®­îc <color=yellow>BÊt DiÖt chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc BÊt DiÖt chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_italy()
	-- ±ÈÈøÕ½ÅÛ	0, 109, 150
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 150, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TØ T¸t chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TØ T¸t chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_france()
	-- °®·Æ¶ûÕ½ÅÛ 0, 109, 154
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 154, 1)
		Say("B¹n nhËn ®­îc <color=yellow>¸i Phi chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc ¸i Phi chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_holland()
	-- ·ç³µÕ½ÅÛ	0, 109, 158
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 158, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Phong Xa chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Phong Xa chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_spain()
	-- ¶·Å£Õ½ÅÛ	0, 109, 162
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 162, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§Êu Ng­u chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §Êu Ng­u chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_portugel()
	-- ÆÏ¹úÕ½ÅÛ	0, 109, 166
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 166, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Bå Quèc chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Bå Quèc chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_strong_szech()
	-- ½İ¿ÍÕ½ÅÛ	0, 109, 170
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 170, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TiÖp Kh¸ch chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TiÖp Kh¸ch chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;



-- ĞèÒªĞÔ¸ĞÌåĞÍµÄÕ½ÅÛ
function need_sexy_suit()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"T¹m thêi kh«ng cÇn/cancel_dialog",
		"§øc ı chiÕn bµo/need_sexy_germany",
		"Tang Ba chiÕn bµo/need_sexy_brazil",
		"A C¨n chiÕn bµo/need_sexy_argentina",
		"BÊt DiÖt chiÕn bµo/need_sexy_england",
		"TØ T¸t chiÕn bµo/need_sexy_italy",
		"Cßn 5 bé, xin xem trang sau/need_sexy_suit_page2")
end;
function need_sexy_suit_page2()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"Cßn 5 bé, xin xem trang tr­íc/need_sexy_suit",
		"¸i Phi chiÕn bµo/need_sexy_france",
		"Phong Xa chiÕn bµo/need_sexy_holland",
		"§Êu Ng­u chiÕn bµo/need_sexy_spain",
		"Bå Quèc chiÕn bµo/need_sexy_portugel",
		"TiÖp Kh¸ch chiÕn bµo/need_sexy_szech",
		"T¹m thêi kh«ng cÇn/cancel_dialog")
end;
-- ¿ıÎàĞÍµÄ10¼şÒÂ·ş
function need_sexy_germany()
	-- µÂÒâÕ½ÅÛ	0, 109, 135
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 135, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§øc ı chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §øc ı chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_brazil()
	-- É£°ÍÕ½ÅÛ	0, 109, 139
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 139, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Tang Ba chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Tang Ba chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_argentina()
	-- °¢¸ùÕ½ÅÛ	0, 109, 143
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 143, 1)
		Say("B¹n nhËn ®­îc <color=yellow>A C¨n chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc A C¨n chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_england()
	-- ²»ÁĞµßÕ½ÅÛ 0, 109, 147
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 147, 1)
		Say("B¹n nhËn ®­îc <color=yellow>BÊt DiÖt chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc BÊt DiÖt chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_italy()
	-- ±ÈÈøÕ½ÅÛ	0, 109, 151
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 151, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TØ T¸t chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TØ T¸t chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_france()
	-- °®·Æ¶ûÕ½ÅÛ 0, 109, 155
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 155, 1)
		Say("B¹n nhËn ®­îc <color=yellow>¸i Phi chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc ¸i Phi chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_holland()
	-- ·ç³µÕ½ÅÛ	0, 109, 159
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 159, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Phong Xa chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Phong Xa chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_spain()
	-- ¶·Å£Õ½ÅÛ	0, 109, 163
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 163, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§Êu Ng­u chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §Êu Ng­u chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_portugel()
	-- ÆÏ¹úÕ½ÅÛ	0, 109, 167
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 167, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Bå Quèc chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Bå Quèc chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_sexy_szech()
	-- ½İ¿ÍÕ½ÅÛ	0, 109, 171
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 171, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TiÖp Kh¸ch chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TiÖp Kh¸ch chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;



-- ĞèÒª½¿Ğ¡ÌåĞÍµÄÕ½ÅÛ
function need_amortta_suit()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"T¹m thêi kh«ng cÇn/cancel_dialog",
		"§øc ı chiÕn bµo/need_amortta_germany",
		"Tang Ba chiÕn bµo/need_amortta_brazil",
		"A C¨n chiÕn bµo/need_amortta_argentina",
		"BÊt DiÖt chiÕn bµo/need_amortta_england",
		"TØ T¸t chiÕn bµo/need_amortta_italy",
		"Cßn 5 bé, xin xem trang sau/need_amortta_suit_page2")
end;
function need_amortta_suit_page2()
	Say("Ng­¬i cÇn lo¹i chiÕn bµo nµo? TÊt c¶ cã 10 bé chiÕn bµo ®Ó chän:",
		7,
		"Cßn 5 bé, xin xem trang tr­íc/need_amortta_suit",
		"¸i Phi chiÕn bµo/need_amortta_france",
		"Phong Xa chiÕn bµo/need_amortta_holland",
		"§Êu Ng­u chiÕn bµo/need_amortta_spain",
		"Bå Quèc chiÕn bµo/need_amortta_portugel",
		"TiÖp Kh¸ch chiÕn bµo/need_amortta_szech",
		"T¹m thêi kh«ng cÇn/cancel_dialog")
end;
-- ¿ıÎàĞÍµÄ10¼şÒÂ·ş
function need_amortta_germany()
	-- µÂÒâÕ½ÅÛ	0, 109, 136
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 136, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§øc ı chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §øc ı chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_brazil()
	-- É£°ÍÕ½ÅÛ	0, 109, 140
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 140, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Tang Ba chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Tang Ba chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_argentina()
	-- °¢¸ùÕ½ÅÛ	0, 109, 144
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 144, 1)
		Say("B¹n nhËn ®­îc <color=yellow>A C¨n chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc A C¨n chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_england()
	-- ²»ÁĞµßÕ½ÅÛ 0, 109, 148
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 148, 1)
		Say("B¹n nhËn ®­îc <color=yellow>BÊt DiÖt chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc BÊt DiÖt chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_italy()
	-- ±ÈÈøÕ½ÅÛ	0, 109, 152
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 152, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TØ T¸t chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TØ T¸t chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_france()
	-- °®·Æ¶ûÕ½ÅÛ 0, 109, 156
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 156, 1)
		Say("B¹n nhËn ®­îc <color=yellow>¸i Phi chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc ¸i Phi chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_holland()
	-- ·ç³µÕ½ÅÛ	0, 109, 160
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 160, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Phong Xa chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Phong Xa chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_spain()
	-- ¶·Å£Õ½ÅÛ	0, 109, 164
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 164, 1)
		Say("B¹n nhËn ®­îc <color=yellow>§Êu Ng­u chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc §Êu Ng­u chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_portugel()
	-- ÆÏ¹úÕ½ÅÛ	0, 109, 168
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 168, 1)
		Say("B¹n nhËn ®­îc <color=yellow>Bå Quèc chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc Bå Quèc chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;
function need_amortta_szech()
	-- ½İ¿ÍÕ½ÅÛ	0, 109, 172
	if (DelItem(2, 1, 505, 1) == 1) then
		AddItem(0, 109, 172, 1)
		Say("B¹n nhËn ®­îc <color=yellow>TiÖp Kh¸ch chiÕn bµo<color>!", 0)
		Msg2Player("B¹n nhËn ®­îc TiÖp Kh¸ch chiÕn bµo!")
	else
		Say("B¹n kh«ng cã <color=yellow>Tay n¶i thÕ giíi chiÕn bµo<color>, kh«ng thÓ ®æi ®­îc!", 0)
	end
end;


