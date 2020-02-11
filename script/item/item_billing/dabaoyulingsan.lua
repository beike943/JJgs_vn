------------------------------------------------------------
-- ´ó°üÓñÁéÉ¢µÄ½Å±¾ dabaoyulingsan.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸öÓñÁéÉ¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,480
-- ÓñÁéÉ¢ID: 1,0,14
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 250 b×nh <color=yellow>Ngäc Linh t¸n<color> chø? Xin x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc trong hµnh trang kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_250_yulingsan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ª´ó°ü£¬»ñµÃ250¸öÓñÁéÉ¢
function open_250_yulingsan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1500) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>1500<color>, kh«ng më ®­îc <color=yellow>Ngäc Linh t¸n (®¹i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 480, 1) == 1) then
		if (AddItem(1, 0, 14, 250) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 480, 1)
		else
			Say("B¹n nhËn ®­îc 250 b×nh <color=yellow>Ngäc Linh t¸n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 250 b×nh Ngäc Linh t¸n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Ngäc Linh t¸n (®¹i)<color>!", 0)
	end
end;

