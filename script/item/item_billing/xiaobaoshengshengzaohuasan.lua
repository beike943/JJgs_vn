------------------------------------------------------------
-- Ğ¡°üÉúÉúÔì»¯É¢µÄ½Å±¾ xiaobaoshengshengzaohuasan.lua
--
-- comment: ´ò¿ªºó»ñµÃ100¸öÉúÉúÔì»¯É¢
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,483
-- ÉúÉúÔì»¯É¢ID: 1,0,16
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 100 b×nh <color=yellow>Sinh Sinh Hãa T¸n<color> chø? Xin kiÓm tra søc lùc vµ hµnh trang tr­íc, kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_100_shengshengzaohuasan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªĞ¡°ü£¬»ñµÃ100¸öÉúÉúÔì»¯É¢
function open_100_shengshengzaohuasan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 700) then
		Say("Søc lùc kh«ng ®ñ <color=yellow>700<color>, kh«ng më ®­îc <color=yellow>Sinh Sinh Hãa T¸n (tiÓu)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 483, 1) == 1) then
		if (AddItem(1, 0, 16, 100,5) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 483, 1)
		else
			Say("B¹n nhËn ®­îc 100 b×nh <color=yellow>Sinh Sinh Hãa T¸n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 100 b×nh Sinh Sinh Hãa T¸n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>Sinh Sinh Hãa T¸n (tiÓu)<color>!", 0)
	end
end;

