-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 10, 53

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Binh sÜ", "green")..":"
quest_title = cf_ox_SetColor("Qu¸i ®Ò kh¸ng", "yellow").."\n"
quest_detail = cf_ox_SetColor("GiÕt 1 Hñ Thi", "gray").."\n\n"
quest_description_1 = quest_giver.."§¸m qu¸i nµy kh«ng kh«ng ngõng léng hµnh, søc lùc chóng ta l¹i cã h¹n. Kh«ng biÕt Ng­¬icã d¸m khö trõ chóng kh«ng?"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_003()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 5, 53)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷¡¤É±¸¯Ê¬
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
		
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("GiÕt 1 Hñ Thi")
	Say(quest_title..quest_detail..quest_description_1, 0)
end