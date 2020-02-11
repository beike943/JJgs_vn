-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- id : 4, 12, 51

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

quest_giver = cf_ox_SetColor("Chñ TiÖm vò khİ", "green")..":"
quest_title = cf_ox_SetColor("Thuéc tİnh vò khİ", "yellow").."\n"
quest_detail = cf_ox_SetColor("§èi tho¹i víi thî rÌn BiÖn Kinh.", "gray").."\n\n"
quest_description_1 = quest_giver.."Lóc ta cßn nhá trong th«n còng x¶y ra mét lÇn kinh hoµng, Phİa sau nói, n¬i th«n cÊt nh÷ng thi thÓ bçng nhiªn mäc lªn nh÷ng loµi c©y l¹ råi në hoa rÊt ®Ñp. Mét ngµy sau ®ã nh÷ng ®ãa hoa nµy tµn ®i vµ thi cèt b¾t ®Çu xuÊt hiÖn t¸c lo¹n kh¾p n¬i. Cha ta cã ®Õn ThiÕu L©m Tù cÇu cøu ®­îc c¸c vŞ s­ t¨ng chØ gi¸o dïng Kim Cang Hæ Nha kh¶m n¹m vµo vò khİ cã thÓ trõ ®­îc bän yªu qu¸i kia."
quest_confirm = ""
quest_cancel = ""

function wq_ox_few_005_001()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	CreateTrigger(4, 13, 51)					-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
	SetTask(101, 15)
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	ModifyExp(200)							-- ¸øÓèÍæ¼Ò¾­Ñé½±Àø
		
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("§èi tho¹i víi thî rÌn BiÖn Kinh.")
	Say(quest_title..quest_detail..quest_description_1, 0)
end