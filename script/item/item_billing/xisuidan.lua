------------------------------------------------------------
-- Ï´Ëèµ¤µÄ½Å±¾ xisuidan.lua
--
-- comment: Ï´ÈÎÒâ5µãÇ±ÄÜµã¡£
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,136
------------------------------------------------------------

CHANGE_POINTS = -5

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Sau khi dïng <color=yellow>TÈy Tñy ®¬n<color> cã thÓ söa ®æi 5 ®iÓm n¨ng lùc c¬ b¶n, b¹n muèn ®æi n¨ng lùc c¬ b¶n nµo?",
		6,
		"Søc m¹nh/change_strength_5_points",
		"Néi c«ng /change_energy_5_points",
		"G©n cèt/change_vitality_5_points",
		"Th©n ph¸p/change_dexterity_5_points",
		"Linh ho¹t/change_observe_5_points",
		"Ta kh«ng muèn söa ®æi--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;


-- ¸ü¸Ä5µãÁ¦Á¿
function change_strength_5_points()
	Say("B¹n x¸c nhËn muèn söa ®æi 5 ®iÓm <color=yellow>Søc m¹nh<color> chø?",
		2,
		"§­îc/confirm_strength_5",
		"Ta kh«ng muèn söa ®æi--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸Ä5µãÁ¦Á¿
function confirm_strength_5()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("HiÖn b¹n kh«ng cÇn dïng TÈy Tñy ®¬n!", 0)
		return
	end
	
	if (DelItem(2, 0, 136, 1) == 1) then
		SetStrength(CHANGE_POINTS)
		Say("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm <color=yellow>Søc m¹nh<color>!", 0)
		Msg2Player("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm Søc m¹nh!")
	else
		Say("B¹n kh«ng mang theo <color=yellow>TÈy Tñy ®¬n<color>!")
	end
end;


-- ¸ü¸Ä5µã¸ù¹Ç
function change_vitality_5_points()
	Say("B¹n x¸c nhËn muèn söa ®æi 5 ®iÓm <color=yellow>G©n cèt<color> chø?",
		2,
		"§­îc/confirm_vitality_5",
		"Ta kh«ng muèn söa ®æi--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸Ä5µã¸ù¹Ç
function confirm_vitality_5()
	
	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("HiÖn b¹n kh«ng cÇn dïng TÈy Tñy ®¬n!", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetVitality(CHANGE_POINTS)
		Say("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm <color=yellow>G©n cèt<color>!", 0)
		Msg2Player("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm G©n cèt!")
	else
		Say("B¹n kh«ng mang theo <color=yellow>TÈy Tñy ®¬n<color>!")
	end
end;


-- ¸ü¸Ä5µãÉí·¨
function change_dexterity_5_points()
	Say("B¹n x¸c nhËn muèn söa ®æi 5 ®iÓm <color=yellow>Th©n ph¸p<color> chø?",
		2,
		"§­îc/confirm_dexterity_5",
		"Ta kh«ng muèn söa ®æi--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸Ä5µãÉí·¨
function confirm_dexterity_5()
	
	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("HiÖn b¹n kh«ng cÇn dïng TÈy Tñy ®¬n!", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetDexterity(CHANGE_POINTS)
		Say("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm <color=yellow>Th©n ph¸p<color>!", 0)
		Msg2Player("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm Th©n ph¸p!")
	else
		Say("B¹n kh«ng mang theo <color=yellow>TÈy Tñy ®¬n<color>!")
	end
end;


-- ¸ü¸Ä5µãÄÚ¹¦
function change_energy_5_points()
	Say("B¹n x¸c nhËn muèn söa ®æi 5 ®iÓm <color=yellow>Néi c«ng<color> chø?",
		2,
		"§­îc/confirm_energy_5",
		"Ta kh«ng muèn söa ®æi--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸Ä5µãÄÚ¹¦
function confirm_energy_5()
	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("HiÖn b¹n kh«ng cÇn dïng TÈy Tñy ®¬n!", 0)
		return
	end

	if (DelItem(2, 0, 136, 1) == 1) then
		SetEnergy(CHANGE_POINTS)
		Say("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm <color=yellow>Néi c«ng<color>!", 0)
		Msg2Player("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm Néi c«ng!")
	else
		Say("B¹n kh«ng mang theo <color=yellow>TÈy Tñy ®¬n<color>!")
	end
end;


-- ¸ü¸Ä5µã¶´²ì
function change_observe_5_points()
	Say("B¹n x¸c nhËn muèn söa ®æi 5 ®iÓm <color=yellow>Linh ho¹t<color> chø?",
		2,
		"§­îc/confirm_observe_5",
		"Ta kh«ng muèn söa ®æi--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸Ä5µã¶´²ì
function confirm_observe_5()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("HiÖn b¹n kh«ng cÇn dïng TÈy Tñy ®¬n!", 0)
		return
	end
	
	if (DelItem(2, 0, 136, 1) == 1) then
		SetObserve(CHANGE_POINTS)
		Say("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm <color=yellow>Linh ho¹t<color>!", 0)
		Msg2Player("B¹n ®· thay ®æi thµnh c«ng 5 ®iÓm Linh ho¹t!")
	else
		Say("B¹n kh«ng mang theo <color=yellow>TÈy Tñy ®¬n<color>!")
	end
end;

