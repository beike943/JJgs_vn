-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 4, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Bé ®Çu", "green")..":"
quest_title = cf_ox_SetColor("B¾t cãc", "yellow").."\n"
quest_detail = cf_ox_SetColor("§èi tho¹i víi Bé §Çu ë Thµnh §«", "gray").."\n\n"
quest_description_1 = quest_giver.."Ng­¬i chİnh lµ vŞ Ng­¬itrong cuéc tû vâ chän hiÒn tÕ h«m ®ã? §¹i tiÓu th­ bŞ b¾t cãc ng­¬i ®· cã c¸ch g× ch­a? Ta nghÜ ng­êi b¾t cãc tiÓu th­ lµ mét trong ®¸m g©y rèi ®ã."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 5, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 6)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(100)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§èi tho¹i víi Bé §Çu ë Thµnh §«")
	Say(quest_title..quest_detail..quest_description_1, 0)
end