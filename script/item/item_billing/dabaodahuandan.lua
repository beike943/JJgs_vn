------------------------------------------------------------
-- ´ó°ü´ó»¹µ¤µÄ½Å±¾ dabaodahuandan.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸ö´ó»¹µ¤
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,492
-- ´ó»¹µ¤ID: 1,0,9
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 250 b×nh <color=yellow>§¹i Hoµn ®¬n<color> chø? Xin x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc trong hµnh trang kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_250_dahuandan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ250¸ö´ó»¹µ¤
function open_250_dahuandan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1500) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>1500<color>, kh«ng më ®­îc <color=yellow>§¹i Hoµn ®¬n (®¹i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 492, 1) == 1) then
		if (AddItem(1, 0, 9, 250) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 492, 1)
		else
			Say("B¹n nhËn ®­îc 250 viªn <color=yellow>§¹i Hoµn ®¬n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 250 viªn §¹i Hoµn ®¬n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>§¹i Hoµn ®¬n (®¹i)<color>!", 0)
	end
end;

