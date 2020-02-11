-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 52, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th«n d©n", "green")..":"
quest_title = cf_ox_SetColor("DiÖt Heo rõng", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gióp d©n lµng diÖt 20 Heo rõng", "gray").."\n\n"
quest_description_1 = quest_giver.."Vïng nµy Heo rõng nhiÒu qu¸. \n§¹i hiÖp cã c¸ch nµo tiªu trõ chóng kh«ng?"
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_003()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 52, 61)
	SetTask(111, 4)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	DelItem(2, 0, 13, 1)						-- É¾³ıÍæ¼ÒÈÎÎñµÀ¾ß ¶ªÊ§µÄ°ü¹ü
	ModifyExp(200)							-- »ñµÃÈÎÎñ¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("Gióp d©n lµng diÖt 20 Heo rõng")
	Say(quest_title..quest_detail..quest_description_1, 0)
end