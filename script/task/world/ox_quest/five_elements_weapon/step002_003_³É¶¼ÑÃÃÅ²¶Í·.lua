-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 5, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Bé ®Çu", "green")..":"
quest_title = cf_ox_SetColor("B¾t cãc", "yellow").."\n"
quest_detail = cf_ox_SetColor("§i t×m bän L­u manh ngoµi thµnh th¨m dß tin tøc.", "gray").."\n\n"
quest_description_1 = quest_giver.."Bän chóng cÇn chİnh lµ miÕng ngäc nµy, xem ra còng ®¸ng gi¸ ®ã, cã lÏ ta nhê quan phñ gi÷ hé th× tèt h¬n. HiÖn giê bän l­u manh bªn ngoµi Thµnh §« ®ang n¸o lo¹n. Chóng ta h·y ®i b¾t vµi tªn ®em vÒ lÊy khÈu cung ®Ó t×m ra manh mèi."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_003()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 1, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 7)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	DelItem(2, 0, 9, 1)						-- É¾³ıÍæ¼ÒÈÎÎñµÀ¾ß °ËØÔÓ¡¡¤Ç¬
	ModifyExp(100)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§i t×m bän L­u manh ngoµi thµnh th¨m dß tin tøc.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end