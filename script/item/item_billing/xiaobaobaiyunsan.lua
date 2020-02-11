------------------------------------------------------------
-- Ð¡°ü°×ÔÆÉ¢µÄ½Å±¾ xiaobaobaiyunsan.lua
--
-- comment: ´ò¿ªºó»ñµÃ100¸ö°×ÔÆÉ¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,485
-- °×ÔÆÉ¢ID: 1,0,4
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 100 b×nh <color=yellow>B¹ch V©n t¸n<color> chø? Xin kiÓm tra søc lùc vµ hµnh trang tr­íc, kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_100_baiyunsan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ100¸ö°×ÔÆÉ¢
function open_100_baiyunsan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 600) then
		Say("Søc lùc kh«ng ®ñ <color=yellow>600<color>, kh«ng më ®­îc <color=yellow>B¹ch V©n t¸n (tiÓu)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 485, 1) == 1) then
		if (AddItem(1, 0, 4, 100) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 485, 1)
		else
			Say("B¹n nhËn ®­îc 100 b×nh <color=yellow>B¹ch V©n t¸n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 100 b×nh B¹ch V©n t¸n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>B¹ch V©n t¸n (tiÓu)<color>!", 0)
	end
end;

