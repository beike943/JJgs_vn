------------------------------------------------------------
-- Ð¡°üºÚÓñ¶ÏÐø¸àµÄ½Å±¾ xiaobaoheiyuduanxugao.lua
--
-- comment: ´ò¿ªºó»ñµÃ100¸öºÚÓñ¶ÏÐø¸à
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,489
-- ºÚÓñ¶ÏÐø¸àID: 1,0,6
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 100 b×nh <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color> chø? Xin kiÓm tra søc lùc vµ hµnh trang tr­íc, kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_100_heiyuduanxugao",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ100¸öºÚÓñ¶ÏÐø¸à
function open_100_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 700) then
		Say("Søc lùc kh«ng ®ñ <color=yellow>700<color>, kh«ng më ®­îc <color=yellow>H¾c Ngäc §o¹n Tôc Cao (tiÓu)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 489, 1) == 1) then
		if (AddItem(1, 0, 6, 100,5) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 489, 1)
		else
			Say("B¹n nhËn ®­îc 100 b×nh <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 100 b×nh H¾c Ngäc §o¹n Tôc Cao!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>H¾c Ngäc §o¹n Tôc Cao (tiÓu)<color>!", 0)
	end
end;

