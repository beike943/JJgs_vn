------------------------------------------------------------
-- ´ó°üÉúÉúÔì»¯É¢µÄ½Å±¾ dabaoshengshengzaohuasan.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸öÉúÉúÔì»¯É¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,484
-- ÉúÉúÔì»¯É¢ID: 1,0,16
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 250 b×nh <color=yellow>Sinh Sinh Hãa T¸n<color> chø? Xin x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc trong hµnh trang kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_250_shengshengzaohuasan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ª´ó°ü£¬»ñµÃ250¸öÉúÉúÔì»¯É¢
function open_250_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1750) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>1750<color>, kh«ng më ®­îc <color=yellow>Sinh Sinh Hãa T¸n (®¹i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 484, 1) == 1) then
		if (AddItem(1, 0, 16, 250) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 484, 1)
		else
			Say("B¹n nhËn ®­îc 250 b×nh <color=yellow>Sinh Sinh Hãa T¸n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 250 b×nh Sinh Sinh Hãa T¸n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Sinh Sinh Hãa T¸n (®¹i)<color>!", 0)
	end
end;

