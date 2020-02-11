------------------------------------------------------------
-- ´ó°üÍòÎï¹éÔªµ¤µÄ½Å±¾ dabaowanwuguiyuandan.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸öÍòÎï¹éÔªµ¤
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,496
-- ÍòÎï¹éÔªµ¤ID: 1,0,11
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 250 b×nh <color=yellow>V¹n VËt Quy Nguyªn §¬n<color> chø? Xin x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc trong hµnh trang kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_250_wanwuguiyuandan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ª´ó°ü£¬»ñµÃ250¸öÍòÎï¹éÔªµ¤
function open_250_wanwuguiyuandan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1750) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>1750<color>, kh«ng më ®­îc <color=yellow>V¹n VËt Quy Nguyªn §¬n (®¹i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 496, 1) == 1) then
		if (AddItem(1, 0, 11, 250) == 0) then	-- Èç¹ûÓĞ´íÎóÃ»ÓĞ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 496, 1)
		else
			Say("B¹n nhËn ®­îc 250 b×nh <color=yellow>V¹n VËt Quy Nguyªn §¬n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 250 b×nh V¹n VËt Quy Nguyªn §¬n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>V¹n VËt Quy Nguyªn §¬n (®¹i)<color>!", 0)
	end
end;

