------------------------------------------------------------
-- Å©É£¼­ÒªµÄ½Å±¾ shenghuojineng.lua
--
-- comment: Ê¹ÓÃÑ§Ï°µ½Ò»¸ö²É¼¯¼¼ÄÜ
-- creator: Tony(Jizheng)
-- Date   : Feb 1st, 2007
--
-- Item ID:  2,1,1056
------------------------------------------------------------
DIG_SKILL_LEVEL = 70		-- Éú»î¼¼ÄÜµÄµÈ¼¶

-- Ê¹ÓÃÎïÆ·µÄÊ±ºò£¬Ä¬ÈÏµÄÈë¿Úº¯Êı
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- ±»Ê¹ÓÃµÄÉú»îÊÖÔıµÄIndex
	Say("B¹n muèn dïng <color=yellow>N«ng Tang phæ<color>? Nã cã thÓ gióp b¹n häc ®­îc 1 trong c¸c kü n¨ng thu thËp ®Õn cÊp <color=yellow>70<color>.",
		8,
		"Kü n¨ng ®èn c©y/#learn_dig_skill("..nScrollIndex..", 1)",
		"Kü n¨ng thuéc da/#learn_dig_skill("..nScrollIndex..", 2)",
		"Kü n¨ng canh t¸c/#learn_dig_skill("..nScrollIndex..", 3)",
		"Kü n¨ng h¸i thuèc/#learn_dig_skill("..nScrollIndex..", 4)",
		"Kü n¨ng khai kho¸ng/#learn_dig_skill("..nScrollIndex..", 5)",
		"Kü n¨ng kĞo t¬/#learn_dig_skill("..nScrollIndex..", 6)",
		"TËp linh/#learn_dig_skill("..nScrollIndex..", 7)",
		"T¹m thêi ch­a cÇn!/cancel_dialog")
end;

function cancel_dialog()
end;

-- Ñ§»áÖÆ¶¨µÄ¼¼ÄÜµ½ÖÆ¶¨¼¶±ğ
function learn_dig_skill(nScrollIndex, nSkillID)
	local nCurDigSkillLevel = GetLifeSkillLevel(0, nSkillID)
	if (nCurDigSkillLevel >= 70) then
		Say("B¹n ®· häc ®­îc kü n¨ng thu thËp nµy vµ v­ît qua cÊp 70, kh«ng cÇn sö dông N«ng Tang phæ! ", 0)
		return
	end
	
	if (DelItemByIndex(nScrollIndex, 1) == 1) then
		LearnLifeSkill(0, nSkillID, 70, 79, 0)
		SetTask(1925, 15)
	end
	
	Say("B¹n ®· häc ®­îc kü n¨ng thu thËp nµy!", 0)
end;

