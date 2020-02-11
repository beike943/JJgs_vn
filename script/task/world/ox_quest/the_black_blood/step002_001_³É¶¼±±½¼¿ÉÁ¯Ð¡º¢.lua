-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 105, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("§øa bĞ ®¸ng th­¬ng", "green")..":"
quest_title = cf_ox_SetColor("M¸u ®en", "yellow").."\n"
quest_detail = cf_ox_SetColor("§Õn chç thî s¨n hái th¨m nguyªn nh©n ®øa bĞ khãc.", "gray").."\n\n"
quest_description_1 = quest_giver.."Hu hu hu… \n con kh«ng cè ı mµ. Hu hu gióp con víi ®­îc kh«ng…hu hu"
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 106, 72)
	SetTask(122, 2)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§Õn chç thî s¨n hái th¨m nguyªn nh©n ®øa bĞ khãc.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end