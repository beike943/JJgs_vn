------------------------------------------------------------
-- ·ïÑªÍèµÄ½Å±¾ fengxuewan.lua
--
-- comment: Ê¹ÓÃºóÖ±½Óµ½´ï4000Ê¦ÃÅÉùÍû
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1004
------------------------------------------------------------

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("B¹n muèn dïng <color=yellow>Phông HuyÕt hoµn<color>? Sau khi phôc dïng ®é cèng hiÕn s­ m«n sÏ ®¹t 4000 ®iÓm.",
		2,
		"§­îc/use_fengxue_wan",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function use_fengxue_wan()
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("Ch­a b¸i s­ häc nghÖ kh«ng thÓ dïng Phông HuyÕt hoµn!", 0)
		return
	end

	local nCurFactionRepu = GetTask(336)
	if (nCurFactionRepu >= 4000) then
		Say("§é cèng hiÕn s­ m«n cña b¹n trªn møc <color=yellow>4000<color>, kh«ng cÇn dïng thªm Phông HuyÕt hoµn!", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 72) then
		Say("B¹n ch­a ®¹t cÊp <color=yellow>72<color> kh«ng thÓ dïng Phông HuyÕt hoµn!", 0)
		return
	end
	
	if (DelItem(2, 1, 1004, 1) == 1) then
		SetTask(336, 4000)
		Say("§é cèng hiÕn s­ m«n cña b¹n ®· ®¹t <color=yellow>4000<color>!", 0)
		Msg2Player("§é cèng hiÕn s­ m«n cña b¹n ®· ®¹t 4000!")
	end
end;

