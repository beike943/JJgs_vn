------------------------------------------------------------
-- ÁúÑªÍèµÄ½Å±¾ longxuewan.lua
--
-- comment: Ê¹ÓÃºóÖ±½Óµ½´ï73¼¶
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1002
------------------------------------------------------------
Include("\\script\\lib\\writelog.lua")

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("B¹n muèn dïng <color=yellow>Long HuyÕt hoµn<color>? B¹n sÏ lËp tøc ®¹t cÊp 73.",
		2,
		"§­îc/use_longxue_wan",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function use_longxue_wan()
	local nCurLevel = GetLevel()
	if (nCurLevel >= 73) then
		Say("B¹n ®· ®¹t cÊp <color=yellow>73<color> kh«ng thÓ dïng Long HuyÕt hoµn!", 0)
		return
	end
	
	if (DelItem(2, 1, 1002, 1) == 1) then
		ResetProperty()
		SetLevel(73, 469)
		ModifyExp(20000000)
		Say("B¹n ®· ®¹t cÊp <color=yellow>73<color> vµ ®iÓm tiÒm n¨ng ®· ®­îc tÈy, xin ®¨ng nhËp l¹i!", 0)
		Msg2Player("B¹n ®· ®¹t cÊp 73 ®ång thêi nhËn ®­îc 2000 v¹n kinh nghiÖm. Xin ®¨ng nhËp l¹i!")
		WriteLogEx("Giang Sinh 2008","sö dông Long HuyÕt Hoµn")
	end
end;

