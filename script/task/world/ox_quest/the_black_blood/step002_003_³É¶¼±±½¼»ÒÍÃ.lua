-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 0, 101, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_tbb_002_003()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 107, 72)
	SetTask(122, 4)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§· giÕt 30 Thá x¸m, quay vÒ gÆp thî s¨n.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end