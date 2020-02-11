------------------------------------------------------------
-- Ğ¡´üÎå»¨ÓñÂ¶ÍèµÄ½Å±¾ xiaodaiwuhua.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸öÎå»¨ÓñÂ¶Íè
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1035
-- Îå»¨ÓñÂ¶ÍèID: 1,0,15
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Trong nµy cã thÓ chøa 10 <color=yellow>Ngò Hoa Ngäc Lé hoµn<color>, më chø?",
		2,
		"§­îc/open_10_wuhuayuluwan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªĞ¡°ü£¬»ñµÃ10¸öÎå»¨ÓñÂ¶Íè
function open_10_wuhuayuluwan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 60) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>60<color>, ch­a thÓ më <color=yellow>Ngò Hoa Ngäc Lé hoµn-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1035, 1) == 1) then
		if (AddItem(1, 0, 15, 10,5) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1035, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>Ngò Hoa Ngäc Lé hoµn<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 Ngò Hoa Ngäc Lé hoµn!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Ngò Hoa Ngäc Lé hoµn-bao nhá<color>!", 0)
	end
end;

