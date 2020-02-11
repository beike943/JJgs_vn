-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 7, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Bé ®Çu", "green")..":"
quest_title = cf_ox_SetColor("Tiªu trõ", "yellow").."\n"
quest_detail = cf_ox_SetColor("Quay l¹i Thµnh §« gÆp Bé §Çu", "gray").."\n\n"
quest_description_1 = quest_giver.."Giang T©n th«n ngµy cµng xuÊt hiÖn nhiÒu C­¬ng Thi, lé tr×nh ®Õn ®ã ®Òu ®· bŞ bÕ quan."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_003_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 8, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 12)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	AddItem(2, 0, 10, 1)					-- ¸øÓèÍæ¼ÒµÀ¾ß½±Àø ôä´ä½äÖ¸
	ModifyExp(200)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("Quay l¹i Thµnh §« gÆp Bé §Çu")
	Say(quest_title..quest_detail..quest_description_1, 0)
end