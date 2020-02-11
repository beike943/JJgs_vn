-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆðÊ¼

-- wq : World Quest

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function OnUse()
	local mapid, mapx, mapy = GetWorldPos() 
	
	if ((mapid == 308) and (mapx > 1406) and (mapx < 1418) and (mapy > 2957) and (mapy < 2973)) then
		-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
		--RemoveTrigger(GetRunningTrigger())		-- É¾³ýµ±Ç°´¥·¢Æ÷
		CreateTrigger(4, 102, 71)
		SetTask(121, 3)

		-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	
		-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
		Msg2Player("§em n­íc ®Õn cho «ng chñ qu¸n trä")
		TaskTip("§em n­íc ®Õn cho «ng chñ qu¸n trä")
	else
		Msg2Player("Dïng c¸i b×nh nµy míi cã thÓ lÊy ®­îc n­íc ë suèi Thanh Khª")
	end
end