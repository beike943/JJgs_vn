------------------------------------------------------------
-- Ğ¡´üÍòÎï¹éÔªµ¤µÄ½Å±¾ xiaodaiwanwu.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸öÍòÎï¹éÔªµ¤
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1034
-- ÍòÎï¹éÔªµ¤ID: 1,0,11
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Trong nµy cã thÓ chøa 10 <color=yellow>V¹n VËt Quy Nguyªn ®¬n<color>, më chø?",
		2,
		"§­îc/open_10_wanwuguiyuandan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªĞ¡°ü£¬»ñµÃ10¸öÒ»Ôª¸´Ê¼µ¤
function open_10_wanwuguiyuandan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>70<color>, ch­a thÓ më <color=yellow>V¹n VËt Quy Nguyªn ®¬n-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1034, 1) == 1) then
		if (AddItem(1, 0, 11, 10,5) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1034, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>V¹n VËt Quy Nguyªn ®¬n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 V¹n VËt Quy Nguyªn ®¬n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>V¹n VËt Quy Nguyªn ®¬n-bao nhá<color>!", 0)
	end
end;

