------------------------------------------------------------
-- Ð¡°üÒ»Ôª¸´Ê¼µ¤µÄ½Å±¾ xiaobaoyiyuanfushidan.lua
--
-- comment: ´ò¿ªºó»ñµÃ100¸öÒ»Ôª¸´Ê¼µ¤
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,493
-- Ò»Ôª¸´Ê¼µ¤ID: 1,0,10
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 100 b×nh <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n<color> chø? Xin kiÓm tra søc lùc vµ hµnh trang tr­íc, kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_100_yiyuanfushidan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ100¸öÒ»Ôª¸´Ê¼µ¤
function open_100_yiyuanfushidan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 600) then
		Say("Søc lùc kh«ng ®ñ <color=yellow>600<color>, kh«ng më ®­îc <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n (tiÓu)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 493, 1) == 1) then
		if (AddItem(1, 0, 10, 100,5) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 493, 1)
		else
			Say("B¹n nhËn ®­îc 100 b×nh <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 100 b×nh NhÊt Nguyªn Phôc Thñy §¬n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n (tiÓu)<color>!", 0)
	end
end;

