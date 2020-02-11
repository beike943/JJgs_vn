------------------------------------------------------------
-- ÷è÷ëÍèµÄ½Å±¾ qilinwan.lua
--
-- comment: Ê¹ÓÃºóÖ±½Óµ½´ï3000ÉùÍû
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1003
------------------------------------------------------------

-- ½Å±¾±»³ÌÐòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êý
function OnUse()
	Say("B¹n muèn dïng <color=yellow>Kú L©n hoµn<color>? B¹n sÏ nhËn ®­îc 3000 ®iÓm danh väng.",
		2,
		"§­îc/use_qilin_wan",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function use_qilin_wan()
	local nCurRepu = GetReputation()
	if (nCurRepu >= 3000) then
		Say("Danh väng cña b¹n ®· ®¹t <color=yellow>3000<color> kh«ng cÇn dïng thªm Kú L©n hoµn!", 0)
		return
	end
	
	local nCurLevel = GetLevel()
	if (nCurLevel < 31) then
		Say("§¼ng cÊp b¹n ch­a ®¹t <color=yellow>31<color> kh«ng thÓ sö dông Kú L©n hoµn!", 0)
		return
	end
	
	if (DelItem(2, 1, 1003, 1) == 1) then
		ModifyReputation(3000 - nCurRepu, 0)
		Say("Danh väng cña b¹n ®· ®¹t <color=yellow>3000<color>!", 0)
		Msg2Player("Danh väng cña b¹n ®· ®¹t 3000!")
	end
end;

