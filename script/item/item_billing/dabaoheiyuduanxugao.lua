------------------------------------------------------------
-- ´ó°üºÚÓñ¶ÏÐø¸àµÄ½Å±¾ dabaoheiyuduanxugao.lua
--
-- comment: ´ò¿ªºó»ñµÃ250¸öºÚÓñ¶ÏÐø¸à
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID:  2,1,490
-- ºÚÓñ¶ÏÐø¸àID: 1,0,6
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Ng­¬i muèn më tay n¶i lÊy 250 b×nh <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color> chø? Xin x¸c nhËn ®ñ kho¶ng trèng vµ søc lùc trong hµnh trang kÎo ®¸nh r¬i d­îc phÈm!",
		2,
		"§­îc/open_250_heiyuduanxugao",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ª´ó°ü£¬»ñµÃ250¸öºÚÓñ¶ÏÐø¸à
function open_250_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 1750) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>1750<color>, kh«ng më ®­îc <color=yellow>H¾c Ngäc §o¹n Tôc Cao (®¹i)<color>!", 0)
		return
	end

	if (DelItem(2, 1, 490, 1) == 1) then
		if (AddItem(1, 0, 6, 250) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 490, 1)
		else
			Say("B¹n nhËn ®­îc 250 b×nh <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 250 b×nh H¾c Ngäc §o¹n Tôc Cao!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>H¾c Ngäc §o¹n Tôc Cao (®¹i)<color>!", 0)
	end
end;

