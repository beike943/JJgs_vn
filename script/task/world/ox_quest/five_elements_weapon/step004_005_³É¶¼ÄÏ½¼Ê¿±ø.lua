-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 11, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Binh sÜ", "green")..":"
quest_title = cf_ox_SetColor("Qu¸i ®Ò kh¸ng", "yellow").."\n"
quest_detail = cf_ox_SetColor("GiÕt 1 Hñ Thi", "gray").."\n\n"
quest_description_1 = quest_giver.."May mµ lÇn nµy cã b»ng h÷u t­¬ng trî, chót th­¬ng d­îc nµy xin nhËn cho!"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_005()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	--CreateTrigger(4, 11, 53)				-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷¡¤Ñ­»·ÈÎÎñ¡¤Î´¿ª·Å
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	AddItem(1, 0, 2, 4)						-- ¸øÓèÍæ¼Ò 4 Æ¿½ğ´´É¢
	AddItem(1, 0, 3, 1)						-- ¸øÓèÍæ¼Ò 1 Æ¿Ö¹ÑªÉ¢
	AddItem(1, 0, 7, 4)						-- ¸øÓèÍæ¼Ò 4 Æ¿Ğ¡»¹µ¤
	AddItem(1, 0, 8, 1)						-- ¸øÓèÍæ¼Ò 4 Æ¿»¹Ñôµ¤
	ModifyExp(200)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
		
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
end