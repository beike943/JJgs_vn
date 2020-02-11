------------------------------------------------------------
-- ÃØÖÆÏ´ËèÁéµ¤µÄ½Å±¾ xisuilingdan.lua
--
-- comment: Ï´ÈÎÒâÈ«²¿µÄÒ»ÖÖÇ±ÄÜµã£¨Ö»ÁôÒ»µã£©¡£
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,137
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Sau khi dïng <color=yellow>mËt chÕ TÈy Tñy Linh §¬n<color> cã thÓ t¹o l¹i mét n¨nng lùc bÊt kú, b¹n muèn t¹o l¹i n¨ng lùc nµo?",
		6,
		"Søc m¹nh/change_strength_all_points",
		"Néi c«ng /change_energy_all_points",
		"G©n cèt/change_vitality_all_points",
		"Th©n ph¸p/change_dexterity_all_points",
		"Linh ho¹t/change_observe_all_points",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;


-- ¸ü¸ÄËùÓĞÁ¦Á¿
function change_strength_all_points()
	Say("B¹n x¸c nhËn muèn kh«i phôc <color=yellow>Søc m¹nh<color>?",
		2,
		"§­îc/confirm_strength_all",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸ÄËùÓĞÁ¦Á¿
function confirm_strength_all()

	local nCurStrength = GetStrength()
	if (nCurStrength <= 1) then
		Say("Giê b¹n kh«ng cÇn sö dông mËt chÕ TÈy Tñy Linh §¬n", 0)
		return
	end
	
	if (DelItem(2, 0, 1045, 1) == 1) then
		SetStrength(1 - nCurStrength)
		Say("B¹n ®· thµnh c«ng kh«i phôc <color=yellow>Søc m¹nh<color>!", 0)
		Msg2Player("B¹n ®· thµnh c«ng kh«i phôc Søc m¹nh!")
	else
		Say("B¹n kh«ng hÒ cã<color=yellow>mËt chÕ TÈy Tñy Linh §¬n<color>!", 0)
	end
end;


-- ¸ü¸ÄËùÓĞ¸ù¹Ç
function change_vitality_all_points()
	Say("B¹n x¸c nhËn muèn kh«i phôc <color=yellow>G©n cèt<color> chø?",
		2,
		"§­îc/confirm_vitality_all",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸ÄËùÓĞ¸ù¹Ç
function confirm_vitality_all()

	local nCurVitality = GetVitality()
	if (nCurVitality <= 1) then
		Say("Giê b¹n kh«ng cÇn sö dông mËt chÕ TÈy Tñy Linh §¬n", 0)
		return
	end
	
	if (DelItem(2, 0, 1045, 1) == 1) then
		SetVitality(1 - nCurVitality)
		Say("B¹n ®· thµnh c«ng kh«i phôc <color=yellow>G©n cèt<color>!", 0)
		Msg2Player("B¹n ®· thµnh c«ng kh«i phôc G©n cèt!")
	else
		Say("B¹n kh«ng hÒ cã<color=yellow>mËt chÕ TÈy Tñy Linh §¬n<color>!", 0)
	end
end;


-- ¸ü¸ÄËùÓĞÉí·¨
function change_dexterity_all_points()
	Say("B¹n x¸c nhËn muèn kh«i phôc <color=yellow>Th©n ph¸p<color> chø?",
		2,
		"§­îc/confirm_dexterity_all",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸ÄËùÓĞÉí·¨
function confirm_dexterity_all()

	local nCurDexterity = GetDexterity()
	if (nCurDexterity <= 1) then
		Say("Giê b¹n kh«ng cÇn sö dông mËt chÕ TÈy Tñy Linh §¬n", 0)
		return
	end
	
	if (DelItem(2, 0, 1045, 1) == 1) then
		SetDexterity(1 - nCurDexterity)
		Say("B¹n ®· thµnh c«ng kh«i phôc <color=yellow>Th©n ph¸p<color>!", 0)
		Msg2Player("B¹n ®· thµnh c«ng kh«i phôc Th©n ph¸p!")
	else
		Say("B¹n kh«ng hÒ cã<color=yellow>mËt chÕ TÈy Tñy Linh §¬n<color>!", 0)
	end
end;


-- ¸ü¸ÄËùÓĞÄÚ¹¦
function change_energy_all_points()
	Say("B¹n x¸c nhËn muèn kh«i phôc <color=yellow>Néi c«ng<color> chø?",
		2,
		"§­îc/confirm_energy_all",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸ÄËùÓĞÄÚ¹¦
function confirm_energy_all()

	local nCurEnergy = GetEnergy()
	if (nCurEnergy <= 1) then
		Say("Giê b¹n kh«ng cÇn sö dông mËt chÕ TÈy Tñy Linh §¬n", 0)
		return
	end
	
	if (DelItem(2, 0, 1045, 1) == 1) then
		SetEnergy(1 - nCurEnergy)
		Say("B¹n ®· thµnh c«ng kh«i phôc <color=yellow>Néi c«ng<color>!", 0)
		Msg2Player("B¹n ®· thµnh c«ng kh«i phôc Néi c«ng!")
	else
		Say("B¹n kh«ng hÒ cã<color=yellow>mËt chÕ TÈy Tñy Linh §¬n<color>!", 0)
	end
end;


-- ¸ü¸ÄËùÓĞ¶´²ì
function change_observe_all_points()
	Say("B¹n x¸c nhËn muèn kh«i phôc <color=yellow>Linh ho¹t<color> chø?",
		2,
		"§­îc/confirm_observe_all",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;
-- È·ÈÏ¸ü¸ÄËùÓĞ¶´²ì
function confirm_observe_all()

	local nCurObserve = GetObserve()
	if (nCurObserve <= 1) then
		Say("Giê b¹n kh«ng cÇn sö dông mËt chÕ TÈy Tñy Linh §¬n", 0)
		return
	end
	
	if (DelItem(2, 0, 1045, 1) == 1) then
		SetObserve(1 - nCurObserve)
		Say("B¹n ®· thµnh c«ng kh«i phôc <color=yellow>Linh ho¹t<color>!", 0)
		Msg2Player("B¹n ®· thµnh c«ng kh«i phôc Linh ho¹t!")
	else
		Say("B¹n kh«ng hÒ cã<color=yellow>mËt chÕ TÈy Tñy Linh §¬n<color>!", 0)
	end
end;

