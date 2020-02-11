------------------------------------------------------------
-- Ð¡´üºÚÓñ¶ÏÐø¸àµÄ½Å±¾ xiaodaiheiyu.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸öºÚÓñ¶ÏÐø¸à
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1032
-- ºÚÓñ¶ÏÐø¸àID: 1,0,6
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Më gãi hµng nµy b¹n cã thÓ nhËn ®­îc 10 <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color>, më chø?",
		2,
		"§­îc/open_10_heiyuduanxugao",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ10¸öºÚÓñ¶ÏÐø¸à
function open_10_heiyuduanxugao()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 70) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>70<color>, ch­a thÓ më <color=yellow>H¾c Ngäc §o¹n Tôc Cao-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1032, 1) == 1) then
		if (AddItem(1, 0, 6, 10,5) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1032, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>H¾c Ngäc §o¹n Tôc Cao<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 H¾c Ngäc §o¹n Tôc Cao!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>H¾c Ngäc §o¹n Tôc Cao-bao nhá<color>!", 0)
	end
end;

