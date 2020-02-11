-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 3, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("VÖ binh thµnh m«n", "green")..":"
quest_title = cf_ox_SetColor("B¾t cãc", "yellow").."\n"
quest_detail = cf_ox_SetColor("T×m Bé §Çu ë Thµnh §« hái th¨m vÒ vô b¾t cãc.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ch©u ®¹i nh©n võa tr×nh b¸o, canh 3 ®ªm qua cã mét ng­êi bŞt mÆt ®ét nhËp b¾t cãc tiÓu th­, h¾n cßn lµm r¬i mét miÕng ngäc. NÕu thÊy ai ®¸ng nghi hoÆc cã tin tøc g× mau ®Õn gÆp sai nha håi b¸o."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 4, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 5)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("T×m Bé §Çu ë Thµnh §« hái th¨m vÒ vô b¾t cãc.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end