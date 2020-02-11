-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPC²¨Ë¹ÉÌÈËScript
-- By StarryNight
-- 2007/06/27 AM 10:16

-- ··ÂôÄãµÄ¸ĞÇé°É£¬µ«ËüÒ»ÎÄ²»Öµ¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±ÈÎÎñ·ÖÖ§1¡ª¡ª09¹âÃ÷×óÊ¹----------------------------------
	
	--ÓëÌÆÜ·Ü·¶Ô»°ÇëÇó°ïÃ¦ÖÆ×÷Ò×Èİ×°
	if nStep_XBTask_01 == 45 then
		task_019_04_0();
		return
	end
	
	--´ø»Ø»òÃ»ÓĞ´ø»ØÀä³æË¿µÈÎïÆ·¸øÌÆÜ·Ü·
	if nStep_XBTask_01 == 46 then
		task_019_05_0();
		return
	end
	
	--ÒÑ¾­È¡µÃÒ×Èİ×°(²¹·¢Ò×Èİ×°)
	if nStep_XBTask_01 == 47 then
		task_019_05_1();
		return
	end
	
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Mäi vËt ®Òu cã thêi, ng­êi ®Ñp vµ thêi gian cµng khã gi÷."},
		{"xu©n méng tuú v©n t¸n, phi hoa trôc thuû l­u, tiªn khóc phµm ©m tù giao nhu…"},
		{"Mäi viÖc trªn ®êi ®Òu do trêi ®Şnh s½n."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
