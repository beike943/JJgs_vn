-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 102, 71

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Chñ tiÖm nhá", "green")..":"
quest_title = cf_ox_SetColor("Thanh Khª Lôc Minh", "yellow").."\n"
quest_detail = cf_ox_SetColor("NhËn ®­îc phÇn th­ëng*2 ®iÓm kinh nghiÖm.", "gray").."\n\n"
quest_description_1 = quest_giver.."Lo¹i trµ nµy ®­îc lÊy tõ D­îc V­¬ng ®éng ®­îc pha chÕ víi n­íc tõ dßng suèi Méng V©n. Uèng vµo gióp t¨ng c­êng sinh lùc, tinh th«ng minh mÉn. NÕu t×m ®ñ nguyªn liÖu, ta cã thÓ gióp ng­¬i chÕ biÕn."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_001_003()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	SetTask(121, 4)
	--CreateTrigger(0, 101, 71)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	DelItem(2, 0, 15, 1)					-- É¾³ıÈÎÎñµÀ¾ß Ğ¡Æ¿×Ó
	ModifyExp(200)							-- ¾­Ñé½±Àø
	DoubleExpCount(GetLevel()*100)			-- Ë«±¶¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("NhËn ®­îc phÇn th­ëng*2 ®iÓm kinh nghiÖm.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end