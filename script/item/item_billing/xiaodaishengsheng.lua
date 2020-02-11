------------------------------------------------------------
-- Ğ¡´üÉúÉúÔì»¯É¢µÄ½Å±¾ xiaodaishengsheng.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸öÉúÉúÔì»¯É¢
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1036
-- ÍòÎï¹éÔªµ¤ID: 1,0,16
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Trong nµy cã thÓ chøa 10 <color=yellow>Sinh Sinh Hãa T¸n<color>, më chø?",
		2,
		"§­îc/open_10_shengshengzaohuasan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªĞ¡°ü£¬»ñµÃ10¸öÉúÉúÔì»¯É¢
function open_10_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>70<color>, ch­a thÓ më <color=yellow>Sinh Sinh Hãa T¸n-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1036, 1) == 1) then
		if (AddItem(1, 0, 16, 10,5) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1036, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>Sinh Sinh Hãa T¸n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 Sinh Sinh Hãa T¸n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Sinh Sinh Hãa T¸n-bao nhá<color>!", 0)
	end
end;

