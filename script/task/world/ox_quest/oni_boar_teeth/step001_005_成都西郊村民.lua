-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 53, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th«n d©n", "green")..":"
quest_title = cf_ox_SetColor("T©m bÊt an", "yellow").."\n"
quest_detail = cf_ox_SetColor("TiÕp tôc diÖt Heo rõng", "gray").."\n\n"
quest_description_1 = quest_giver.."Ta vÉn cã c¶m gi¸c bÊt an, d­êng nh­ Heo rõng vÉn cßn quanh quÈn ®©u ®©y."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_005()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 53, 61)
	SetTask(111, 6)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- »ñµÃÈÎÎñ¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("TiÕp tôc diÖt Heo rõng")
	Say(quest_title..quest_detail..quest_description_1, 0)
end