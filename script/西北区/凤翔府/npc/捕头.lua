-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPC²¶Í·Script
-- By StarryNight
-- 2007/06/20 AM 10:54

-- ËÀÁË¶¼Òª°®

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±Çø07ÄĞ¶ùï£¹Ç----------------------------------
	
	--Ñ¯ÎÊÔ¬·ÉÔÆÉËÊÆ
	if nStep_XBTask == 34 then
		task_007_03_0();
		return
	end
	
	--Î´¸øÔ¬·ÉÔÆËÍÈ¥ÉËÒ©
	if nStep_XBTask == 35 then
		task_007_03_1();
		return
	end
	
	---------------------------------- Î÷±±Çø20·ÖÖ§1_11±ø²»ÑáÕ©----------------------------------
	--Óë·ïÏè²¶¿ì¶Ô»°Ñ¯ÎÊÔ¬·ÉÔÆĞĞ×Ù
	if nStep_XBTask_01 == 52 then
		task_020_03_0();
		return
	end
	
	--»¹Î´É±ËÀ¶ÀĞĞÀÏÍÓºÍ²¶¿ì¶Ô»°
	if nStep_XBTask_01 == 53 then
		task_020_03_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Bé ®Çu: Lµm Bé ®Çu quan träng nhÊt lµ g×?",
		"Lµ g× nµo?",
		"§­¬ng nhiªn lµ 2 ch÷ trung nghÜa! Ta lu«n noi theo g­¬ng Viªn Phi V©n Bé ®Çu!"
		}
	
	TalkEx("",strTalk);
	return
	
end;
