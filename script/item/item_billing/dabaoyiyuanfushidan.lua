------------------------------------------------------------
-- ´ó°üÒ»Ôª¸´Ê¼µ¤µÄ½Å±¾ dabaoyiyuanfushidan.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸öÒ»Ôª¸´Ê¼µ¤
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,494
-- Ò»Ôª¸´Ê¼µ¤ID: 1,0,10
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 250 b×nh <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n<color> chø? Xin x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc trong hµnh trang kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_250_yiyuanfushidan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ª´ó°ü£¬»ñµÃ250¸öÒ»Ôª¸´Ê¼µ¤
function open_250_yiyuanfushidan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1500) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>1500<color>, kh«ng më ®­îc <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n (®¹i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 494, 1) == 1) then
		if (AddItem(1, 0, 10, 250) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 494, 1)
		else
			Say("B¹n nhËn ®­îc 250 b×nh <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 250 b×nh NhÊt Nguyªn Phôc Thñy §¬n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>NhÊt Nguyªn Phôc Thñy §¬n (®¹i)<color>!", 0)
	end
end;

