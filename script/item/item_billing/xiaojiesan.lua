------------------------------------------------------------
-- Ïû½ÙÉ¢µÄ½Å±¾ xiaojiesan.lua
--
-- comment: Ï´1µãPKÖµ
-- creator: Tony(Jizheng)
-- Date   : Jul 14th, 2006
--
-- Item ID: 2,0,141
------------------------------------------------------------

CHANGE_PK_VALUE = -1

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("Sau khi dïng <color=yellow>Tiªu KiÕp t¸n<color> cã thÓ gi¶m ®i 1 ®iÓm PK, dïng chø?",
		2,
		"§­îc/decrease_1_PK_points",
		"Ta kh«ng muèn dïng--Hñy bá/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

-- È·ÈÏ¼õÉÙÒ»µãPKÖµ
function decrease_1_PK_points()
	local nCurPKValue = GetPKValue()
	if (nCurPKValue <= 0) then
		Say("<color=yellow>TrŞ PK<color> cña b¹n lµ 0, kh«ng cÇn dïng Tiªu KiÕp t¸n!", 0)
		return
	end

	if (DelItem(2, 0, 141, 1) == 1) then
		AddPKValue(CHANGE_PK_VALUE)
		Say("<color=yellow>TrŞ PK<color> cña b¹n gi¶m 1 ®iÓm.", 0)
		Msg2Player("B¹n ®· gi¶m 1 ®iÓm PK!")
	else
		Say("B¹n kh«ng mang theo <color=yellow>Tiªu KiÕp t¸n<color>!", 0)
	end
end;
