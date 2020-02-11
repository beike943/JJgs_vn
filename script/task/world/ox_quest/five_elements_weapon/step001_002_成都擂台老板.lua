-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 2, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Chñ l«i ®µi", "green")..":"
quest_title = cf_ox_SetColor("B¸t Qu¸i Ên_Cµn", "yellow").."\n"
quest_detail = cf_ox_SetColor("NhËn ®­îc B¸t qu¸i Ên-Cµn.", "gray").."\n\n"
quest_description_1 = quest_giver.."Ng­¬i ®Õn t×m miÕng ngäc cã kh¾c ch÷ g× gièng ch÷ cµn ph¶i kh«ng? \nHö? Còng kh«ng ph¶i cña ng­¬i? Nh­ng th«i! Cña ai còng ®­îc. TÆng cho ng­¬i ®ã! Ta kh«ng quan t©m n÷a!"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_001_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	SetTask(101, 3)							-- ÈÎÎñÁ÷³Ì±ê¼ÇÎª 2 £¬±íÊ¾ÔÚÏÂÒ»´ÎµÇÂ½ºóÓÉ playerloginin.lua ´´½¨ĞÂµÄÈÎÎñ
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	AddItem(2, 0, 9, 1)						-- ¸øÓèÍæ¼ÒÈÎÎñµÀ¾ß °ËØÔÓ¡¡¤Ç¬
	ModifyExp(300)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("NhËn ®­îc B¸t qu¸i Ên-Cµn.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end