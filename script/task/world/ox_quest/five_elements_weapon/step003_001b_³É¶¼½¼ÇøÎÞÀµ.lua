-- ÊÀ½çÈÎÎñ
-- ³É¶¼-¶ëáÒ Ö÷ÏßÈÎÎñ
-- ÈÎÎñÆğÊ¼

-- wq : World Quest
-- ID : 0, 2, 52

-- Danexx
-- 2005.5.30
------------------------------------------------------------
Include("\\script\\task\\world\\ox_common\\common.lua");

function wq_ox_few_003_001b()
	-- ÒÔÏÂÊÇ´¥·¢¿ØÖÆ²¿·Ö
	RemoveTrigger(GetRunningTrigger())		-- É¾³ıµ±Ç°´¥·¢Æ÷
	SetTask(101, GetTask(101)+1)			-- ÈÎÎñÁ÷³Ì±ê¼ÇÎª µ±Ç°+1 £¬Á½¸öÉ±¹ÖÄ¿±ê¶¼Íê³ÉºóÔòÖµÓ¦¸ÃÎª 5

	if (GetTask(101) == 11) then				-- Task(101) == 5 Ôò±íÊ¾Íê³ÉÁËÉ±¹ÖÈÎÎñ
		CreateTrigger(4, 7, 51)				-- ´´½¨ÏÂÒ»¸ö´¥·¢Æ÷
		AddItem(2, 0, 11, 1)				-- µÃµ½ Ø¤°ïÃÜº¯
		TaskTip("NhiÖm vô hoµn thµnh quay vÒ Thµnh §« gÆp Bé §Çu.")
	end
	
	-- ÒÔÏÂÊÇÈÎÎñ½±Àø²¿·Ö
	
	-- ÒÔÏÂÊÇÎÄ×ÖÏÔÊ¾²¿·Ö
	TaskTip("GiÕt 20 tªn C«n ®å, nhiÖm vô hoµn thµnh.")
end