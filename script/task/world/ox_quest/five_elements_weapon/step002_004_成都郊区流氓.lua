-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 0, 1, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("L­u Manh", "green")..":"
quest_title = cf_ox_SetColor("Th¨m dß", "yellow").."\n"
quest_detail = cf_ox_SetColor("Quay l¹i Bé §Çu ë Thµnh §« håi b¸o.", "gray").."\n\n"
quest_description_1 = quest_giver.."Xin tha m¹ng…B¾t cãc tiÓu th­ h«m ®ã còng chØ lµ lµm theo mÖnh lÖnh cña Bang chñ vµ L·o ®¹i, lo¹i nh·i nhĞp nh­ ta chØ biÕt lµm theo. µ \n h«m ®Õn chç Ch©u gia ta ta cßn ph¸t hiÖn…a..®au qu¸…cøu..."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_002_004()
	if (random(1,100) <= 10) then				-- É±ËÀÁ÷Ã¥ºóÓĞ 10% µÄ¼¸ÂÊÍê³ÉÈÎÎñ

		-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
		RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
		CreateTrigger(4, 6, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
		SetTask(101, 8)
	
		-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
		ModifyExp(100)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
	
		-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
		TaskTip("Quay l¹i Bé §Çu ë Thµnh §« håi b¸o.")
		Say(quest_title..quest_detail..quest_description_1, 0)

	else
		Msg2Player("B¹n kh«ng nhËn ®­îc tin tøc nµo")
	end
end