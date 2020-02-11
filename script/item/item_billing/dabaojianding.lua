------------------------------------------------------------
-- ´ó°ü7¼¶¼ø¶¨·ûµÄ½Å±¾ dabaojianding.lua
--
-- comment: ´ò¿ªºó»ñµÃ100¸ö7¼¶¼ø¶¨·û
-- creator: Tony(Jizheng)
-- Date   : Feb 9th, 2007
--
-- Item ID:  2,1,1058
-- 7¼¶¼ø¶¨·û: 2,5,7
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("B¹n muèn më gãi hµng lÊy 100 tÊm <color=yellow>gi¸m ®Þnh phï cÊp 7<color>? Xin kiÓm tra hµnh trang vµ søc lùc!",
		2,
		"§­îc/open_100_jianding",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ100¸ö7¼¶¼ø¶¨·û
function open_100_jianding()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 100) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>100<color> t¹m thêi kh«ng thÓ më <color=yellow>gi¸m ®Þnh phï cÊp 7-bao lín<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1058, 1) == 1) then
		if (AddItem(2, 5, 7, 100,5) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1058, 1)
		else
			Say("B¹n nhËn ®­îc 100 <color=yellow>gi¸m ®Þnh phï cÊp 7<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 100 gi¸m ®Þnh phï cÊp 7!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>gi¸m ®Þnh phï cÊp 7-bao lín<color>!", 0)
	end
end;

