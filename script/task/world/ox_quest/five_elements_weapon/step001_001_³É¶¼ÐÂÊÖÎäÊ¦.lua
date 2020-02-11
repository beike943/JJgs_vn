-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 4, 1, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Vâ s­", "green")..":"
quest_title = cf_ox_SetColor("B¸t Qu¸i Ên_Cµn", "yellow").."\n"
quest_detail = cf_ox_SetColor("§i t×m Chñ L«i ®µi ë Thµnh §« ®Ó hái th¨m vÒ mãn vËt cã nh÷ng vÕt kh¾c thÇn bİ", "gray").."\n\n"
quest_description_1 = quest_giver.."Kh«ng biÕt bao giê ®¹i tiÓu th­ míi t×m ®­îc mét anh hïng c¸i thÕ ®Ó kÕt th©n ®©y! Thiªn h¹ sao b©y giê ai còng vâ c«ng kĞm thÕ kh«ng biÕt \n µ!H«m qua «ng chñ h×nh nh­ cã nãi lµ nhÆt ®­îc vËt g× cã kh¾c nh÷ng h×nh thï kú bİ, nh­ng hái ra kh«ng ai nhËn"
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_001_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 2, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 2)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§i t×m Chñ L«i ®µi ë Thµnh §« ®Ó hái th¨m vÒ mãn vËt cã nh÷ng vÕt kh¾c thÇn bİ")
	Say(quest_title..quest_detail..quest_description_1, 0)
end