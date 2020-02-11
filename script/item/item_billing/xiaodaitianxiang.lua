------------------------------------------------------------
-- Ğ¡´üÌìÏãÔÆ½õĞøµÄ½Å±¾ xiaodaitianxiang.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸öÌìÏãÔÆ½õĞø
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1031
-- ÌìÏãÔÆ½õĞøID: 1,0,5
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Trong nµy cã thÓ chøa 10 <color=yellow>Thiªn H­¬ng CÈm Tôc<color>, më chø?",
		2,
		"§­îc/open_10_tianxiangyunjinxu",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªĞ¡´ü£¬»ñµÃ10¸öÌìÏãÔÆ½õĞø
function open_10_tianxiangyunjinxu()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 60) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>60<color>, ch­a thÓ më <color=yellow>Thiªn H­¬ng CÈm Tôc-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1031, 1) == 1) then
		if (AddItem(1, 0, 5, 10,5) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1031, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>Thiªn H­¬ng CÈm Tôc<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 Thiªn H­¬ng CÈm Tôc!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Thiªn H­¬ng CÈm Tôc-bao nhá<color>!", 0)
	end
end;

