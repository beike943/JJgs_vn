-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 106, 72

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("§øa bĞ ®¸ng th­¬ng", "green")..":"
quest_title = cf_ox_SetColor("M¸u ®en", "yellow").."\n"
quest_detail = cf_ox_SetColor("GiÕt 30 Thá x¸m.", "gray").."\n\n"
quest_description_1 = quest_giver.."TiÓu tö nµy h«m qua b¾t vÒ mét con Thá x¸m, tû tû cña nã ®· bŞ thá c¾n. H«m nay vÉn cßn ®äng l¹i vµi vÕt m¸u ®en. PhiÒn b»ng h÷u ra ngoµi th«n giÕt mét sè Thá x¸m ®em vÒ trŞ th­¬ng."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_002_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 101, 72)
	SetTask(122, 3)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("GiÕt 30 Thá x¸m.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end