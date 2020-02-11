-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÒ¶ÀÏScript
-- By StarryNight
-- 2007/06/13 AM 10:54

-- ÀíÏëÓëÏÖÊµµÄÆ½ºâ£¬²»ĞèÒªÈÎºÎ¼¼ÇÉ£¬ÄÇ¶¼ÊÇ·ÅÆ¨¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- Î÷±±ÈÎÎñ05³Â²Ö°µ¶È----------------------------------
	
	--ÓëÒ¶ÀÏ¶Ô»°´ø°ü¹ü¸øÒ¶×ÓÇï
	if nStep_XBTask == 20 then
		task_005_05_0();
		return
	end
	
	--Î´´ø°ü¹ü¸øÒ¶×ÓÇï
	if nStep_XBTask == 21 then
		task_005_05_1();
		return
	end
	
	--ÒÑ¾­´ø°ü¹ü¸øÒ¶×ÓÇï
	if nStep_XBTask == 22 then
		task_005_07_0();
		return
	end
	
	--Î´Íê³É½ÙÇôÓëÒ¶ÀÏ¶Ô»°
	if nStep_XBTask == 23 then
		task_005_07_1();
		return
	end
	
	---------------------------------- Î÷±±Çø26·ÖÖ§2_3·Ç³£µÀÈË----------------------------------
	--Î´ÓëÅ·Ñô»­¶Ô»°£¬²¹·¢´¥·¢Æ÷
	if nStep_XBTask_02 == 11 then
		task_025_04_2();
		return
	end
	
	--´úÒ¶×ÓÇïÏòÒ¶ÀÏ±¨Æ½°²
	if nStep_XBTask_02 == 12 then
		task_026_02_0();
		return
	end

	--Î´ÓëÒ¶×ÓÇï¶Ô»°ÓëÒ¶ÀÏ¶Ô»°
	if nStep_XBTask_02 == 13 then
		task_026_02_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"C«n L«n nói cao ®­êng dèc, thËt khã ®i!"},
		{"Th­¬ng nh©n ®Õn tõ T©y Vùc tuy vÊt v¶ nh­ng mçi lÇn ®Õn ®Òu chë ®Çy xe hµng, vµ tÆng ta İt ®å ch¬i kú l¹."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
