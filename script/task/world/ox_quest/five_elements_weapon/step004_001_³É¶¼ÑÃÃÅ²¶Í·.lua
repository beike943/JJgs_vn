-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 8, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Bé ®Çu", "green")..":"
quest_title = cf_ox_SetColor("Th«ng b¸o tin tøc", "yellow").."\n"
quest_detail = cf_ox_SetColor("§Õn Giang T©n th«n ®èi tho¹i víi tr­ëng vÖ binh", "gray").."\n\n"
quest_description_1 = quest_giver.."§éc khİ ë Giang T©n th«n ngµy cµng nång nÆc, kh«ng ai cã thÓ chŞu ®ùng næi. \n Nhê b»ng h÷u ®Õn sai nha bÈm b¸o, ta nghÜ chuyÖn nµy cã liªn quan ®Õn mÊy tªn L­u manh ®ã."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_004_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 9, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 13)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	AddItem(2, 0, 17, 1)					-- ²¶Í·ÁîÅÆ
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§Õn Giang T©n th«n ®èi tho¹i víi tr­ëng vÖ binh")
	Say(quest_title..quest_detail..quest_description_1, 0)
end