-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 13, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Chñ TiÖm vò khİ", "green")..":"
quest_title = cf_ox_SetColor("Thuéc tİnh vò khİ", "yellow").."\n"
quest_detail = cf_ox_SetColor("T×m 20 Tinh ThiÕt, 10 Trïng Méc, 1 Kim Cang Hæ Nha vÒ cho thî rÌn BiÖn Kinh.", "gray").."\n\n"
quest_description_1 = quest_giver.."NÕu t×m ®ñ c¸c nguyªn liÖu ta sÏ gióp ng­¬i chÕ t¹o vò khİ Phôc Ma. \n ThiÕu L©m Tù {Hæ} cã thÓ t×m ®­îc Kim Cang Hæ Nha, ngo¹i Thµnh §« {Heo rõng} cã thÓ t×m ®­îc Tinh ThiÕt, Nga My s¬n {Ong vµng} cã thÓ t×m ®­îc Trïng Méc."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_002()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(0, 4, 52)
	CreateTrigger(4, 14, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 16)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
		
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("T×m 20 Tinh ThiÕt, 10 Trïng Méc, 1 Kim Cang Hæ Nha vÒ cho thî rÌn BiÖn Kinh.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end