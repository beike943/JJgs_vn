------------------------------------------------------------
-- Ð¡´üÒ»Ôª¸´Ê¼µ¤µÄ½Å±¾ xiaodaiyiyuan.lua
--
-- comment: ´ò¿ªºó»ñµÃ10¸öÒ»Ôª¸´Ê¼µ¤
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1033
-- Ò»Ôª¸´Ê¼µ¤ID: 1,0,10
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("Trong nµy cã thÓ chøa 10 <color=yellow>NhÊt Nguyªn Phôc Thñy ®¬n<color>, më chø?",
		2,
		"§­îc/open_10_yiyuanfushidan",
		"T¹m thêi kh«ng më--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- ´ò¿ªÐ¡°ü£¬»ñµÃ10¸öÒ»Ôª¸´Ê¼µ¤
function open_10_yiyuanfushidan()
	local nCurWeight = GetCurItemWeight()
	local nMaxWeight = GetMaxItemWeight()
	if (nMaxWeight - nCurWeight < 60) then
		Say("Søc lùc cña b¹n kh«ng ®ñ <color=yellow>60<color>, ch­a thÓ më <color=yellow>NhÊt Nguyªn Phôc Thñy ®¬n-bao nhá<color>!", 0)
		return
	end

	if (DelItem(2, 1, 1033, 1) == 1) then
		if (AddItem(1, 0, 10, 10,5) == 0) then	-- Èç¹ûÓÐ´íÎóÃ»ÓÐ¸ø³öÀ´£¬²¹³¥Ò»¸ö°ü
			AddItem(2, 1, 1033, 1)
		else
			Say("B¹n nhËn ®­îc 10 <color=yellow>NhÊt Nguyªn Phôc Thñy ®¬n<color>!", 0)
			Msg2Player("B¹n nhËn ®­îc 10 NhÊt Nguyªn Phôc Thñy ®¬n!")
		end
	else
		Say("B¹n kh«ng mang theo <color=yellow>NhÊt Nguyªn Phôc Thñy ®¬n-bao nhá<color>!", 0)
	end
end;

