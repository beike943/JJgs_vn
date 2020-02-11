-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 0, 53, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_obt_001_006()
	if (random(1,100) <= 10) then
		-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
		RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
		CreateTrigger(4, 54, 61)
		--SetTask(111, 7)

		-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
		AddItem(2, 0, 14, 1)					-- »ñµÃÈÎÎñµÀ¾ß Ò°Öí¹íÑÀ
		
		-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
		TaskTip("NhiÖm vô diÖt Heo rõng hoµn thµnh quay vÒ gÆp Th«n D©n")
	else
		Msg2Player("Heo rõng ®· lµm cho d©n lµng ho¶ng sî.")
	end
end