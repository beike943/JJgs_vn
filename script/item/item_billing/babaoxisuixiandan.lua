------------------------------------------------------------
-- °Ë±¦Ï´ËèÏÉµ¤µÄ½Å±¾ babaoxisuixiandan.lua
--
-- comment: Ï´È«²¿ÄÜÁ¦£¨ËùÓĞÄÜÁ¦ÊôĞÔ¿Ûµ½1µã£©¡£
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,138
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Sau khi dïng <color=yellow>B¸t B¶o TÈy Tñy Tiªn §¬n<color> cã thÓ t¹o l¹i toµn bé n¨ng lùc cña b¹n, b¹n x¸c nhËn muèn t¹o l¹i kh«ng?",
		2,
		"§­îc/change_all_points",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- È·ÈÏÒªÖØÔìÈ«²¿ÄÜÁ¦
function change_all_points()
	Say("Qu¸ tr×nh kh«i phôc nµy sÏ tiªu phİ 1 viªn <color=yellow>B¸t B¶o TÈy Tñy Tiªn §¬n<color> quı b¸u, b¹n x¸c nhËn muèn t¹o l¹i kh«ng?",
		2,
		"§­îc/confirm_change_all_points",
		"Ta kh«ng muèn kh«i phôc--Hñy bá/cancel_dialog")
end;

-- ×îºóÈ·ÈÏÒªÖØÔìÈ«²¿ÄÜÁ¦
function confirm_change_all_points()
	local nCurStrength = GetStrength()
	local nCurVitality = GetVitality()
	local nCurDexterity = GetDexterity()
	local nCurEnergy = GetEnergy()
	local nCurObserve = GetObserve()
	
	if ((nCurStrength <= 1) and 
		(nCurVitality <= 1) and 
		(nCurDexterity <= 1) and 
		(nCurEnergy <= 1) and 
		(nCurObserve <= 1)) then
		Say("HiÖn b¹n kh«ng cÇn dïng B¸t B¶o TÈy Tñy Tiªn §¬n!", 0)
		return
	end

	if (DelItem(2, 0, 138, 1) == 1) then
		SetStrength(1 - nCurStrength)
		SetVitality(1 - nCurVitality)
		SetDexterity(1 - nCurDexterity)
		SetEnergy(1 - nCurEnergy)
		SetObserve(1 - nCurObserve)
		
		Say("B¹n ®· kh«i phôc <color=yellow>toµn bé n¨ng lùc<color>!", 0)
		Msg2Player("B¹n ®· kh«i phôc toµn bé n¨ng lùc!")
	else
		Say("B¹n kh«ng cã <color=yellow>B¸t B¶o TÈy Tñy Tiªn §¬n<color>!", 0)
	end
end;

