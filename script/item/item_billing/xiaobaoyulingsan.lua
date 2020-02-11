------------------------------------------------------------
-- Ğ¡°üÓñÁéÉ¢µÄ½Å±¾ xiaobaoyulingsan.lua
--
-- comment: ´ò¿ªºó»ñµÃ100¸öÓñÁéÉ¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,479
-- ÓñÁéÉ¢ID: 1,0,14
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 100 b×nh <color=yellow>Ngäc Linh t¸n<color> chø? Xin kiÓm tra søc lùc vµ hµnh trang tr­íc, kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_100_yulingsan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªĞ¡°ü£¬»ñµÃ100¸öÓñÁéÉ¢
function open_100_yulingsan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 600) then
		Say("Søc lùc kh«ng ®ñ <color=yellow>600<color>, kh«ng më ®­îc <color=yellow>Ngäc Linh t¸n (tiÓu)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 479, 1) == 1) then
		if (AddItem(1, 0, 14, 100) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 479, 1)
		else
			Say("B¹n nhËn ®­îc 100 b×nh <color=yellow>Ngäc Linh t¸n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 100 b×nh Ngäc Linh t¸n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Ngäc Linh t¸n (tiÓu)<color>!", 0)
	end
end;

