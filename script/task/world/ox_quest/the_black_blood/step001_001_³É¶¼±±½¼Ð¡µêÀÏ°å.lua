-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 101, 71

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Chñ tiÖm nhá", "green")..":"
quest_title = cf_ox_SetColor("Thanh Khª Lôc Minh", "yellow").."\n"
quest_detail = cf_ox_SetColor("Mang b×nh nµy ®Õn dßng suèi phİa t©y b¾c ®Ó lÊy n­íc.", "gray").."\n\n"
quest_description_1 = quest_giver.."Trµ cña ta ë ®©y cùc kú ngon, uèng vµo cã thÓ gi¶i ®éc, t¨ng c­êng sinh lùc l¹i hoµn toµn miÔn phİ. \n ChØ cÇn ng­¬i ®Õn suèi Thanh Khª ë t©y b¾c ®em vÒ cho ta b×nh n­íc, ta sÏ tÆng ng­¬i mét b×nh trµ ngon."
quest_confirm = ""
quest_cancel = ""

function wq_ox_tbb_001_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	SetTask(121, 2)
	--CreateTrigger(0, 102, 71)

	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	AddItem(2, 0, 15, 1)					-- »ñµÃÈÎÎñµÀ¾ß Ğ¡Æ¿×Ó
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("Mang b×nh nµy ®Õn dßng suèi phİa t©y b¾c ®Ó lÊy n­íc.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end