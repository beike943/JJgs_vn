-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 6, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Bé ®Çu", "green")..":"
quest_title = cf_ox_SetColor("Tiªu trõ", "yellow").."\n"
quest_detail = cf_ox_SetColor("GiÕt 30 tªn l­u manh, 20 tªn C«n ®å sau ®ã vÒ Thµnh §« gÆp Bé §Çu.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ng­¬i ra ngoµi thµnh gi¸o huÊn bän l­u manh ®ã, nh©n tiÖn t×m thªm manh mèi."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_005()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 2, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷ É±µôÁ÷Ã¥
	CreateTrigger(0, 3, 52)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷ É±µôÎŞÀµ
	SetTask(101, 9)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(100)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("GiÕt 30 tªn l­u manh, 20 tªn C«n ®å sau ®ã vÒ Thµnh §« gÆp Bé §Çu.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end