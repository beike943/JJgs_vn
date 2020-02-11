------------------------------------------------------------
-- Ð¡°ü7¼¶¼ø¶¨·ûµÄ½Å±¾ xiaobaojianding.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸ö7¼¶¼ø¶¨·û
-- creator: Tony(Jizheng)
-- Date   : Feb 9th, 2007
--
-- Item ID:  2,1,1057
-- 7¼¶¼ø¶¨·û: 2,5,7
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("B¹n muèn më gãi hµng lÊy 10 <color=yellow>gi¸m ®Þnh phï cÊp 7<color>? Xin chó ý kho¶ng trèng hµnh trang hoÆc søc lùc!",
		2,
		"§­îc/open_10_jianding",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ10¸ö7¼¶¼ø¶¨·û
function open_10_jianding()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 10) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>10<color>, ch­a thÓ më <color=yellow>gi¸m ®Þnh phï cÊp 7-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1057, 1) == 1) then
		if (AddItem(2, 5, 7, 10,5) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1057, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>gi¸p ®Þnh phï cÊp 7<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 gi¸m ®Þnh phï cÊp 7!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>gi¸m ®Þnh phï cÊp 7-bao nhá<color>!", 0)
	end
end;

