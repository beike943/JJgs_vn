-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- Index : 28

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_005_003()
	if (random(1,100) <= 5) then
		-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
		RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
		SetTask(101, 17)
	
		-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
		AddItem(2, 0, 12, 1)					-- ¸øÓèÍæ¼ÒÈÎÎñµÀ¾ß¡¤½ğ¸Õ»¢ÑÀ
		
		-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
		TaskTip("B¹n nhËn ®­îc Kim Cang Hæ Nha.")
	else
		Msg2Player("B¹n ®· h¹ s¸t ®­îc 1 m·nh hæ, nh­ng ch­a lÊy ®­îc Kim Cang Hæ Nha.")
	end
end