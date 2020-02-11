-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 54, 61

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Th«n d©n", "green")..":"
quest_title = cf_ox_SetColor("T©m bÊt an", "yellow").."\n"
quest_detail = cf_ox_SetColor("Gióp th«n d©n diÖt xong Heo rõng, nhËn ®­îc nguyªn liÖu häa phï", "gray").."\n\n"
quest_description_1 = quest_giver.."Lò Heo rõng nµy cø lµm ta bÊt an, may mµ lÇn nµy cã ng­¬i ra tay gióp ®ì. \n Ta cã 1 quyÓn bïa chó gi÷ l¹i còng kh«ng dïng, nay tÆng ng­¬i. NÕu ng­¬i cã høng thó vÒ vÊn ®Ò nµy cã thÓ ®Õn Phï s­ trong c¸c thµnh thŞ ®Ó häc."
quest_confirm = ""
quest_cancel = ""

function wq_ox_obt_001_007()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	SetTask(111, 8)
	--CreateTrigger(0, 53, 61)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- »ñµÃÈÎÎñ¾­Ñé½±Àø
	AddItem(2, 2, 29, 1)					-- »ñµÃÈÎÎñµÀ¾ß½±Àø ¶İ¼×Êé
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("Gióp th«n d©n diÖt xong Heo rõng, nhËn ®­îc nguyªn liÖu häa phï")
	Say(quest_title..quest_detail..quest_description_1, 0)
end