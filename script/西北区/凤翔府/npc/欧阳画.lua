-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÅ·Ñô»­Script
-- By StarryNight
-- 2007/06/06 PM 4:47

-- ¸ĞĞ»Ö÷°¡£¬¿ÉÒÔÈÃÎÒ·ÅÆ¨

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);
local strTalk = {};

	---------------------------------- Î÷±±ÈÎÎñ01Î÷ÏÄ°µÓ¿----------------------------------
	
	--Óë°ÙÏşÉú¶Ô»°ºóÎ´ÓëÅ·Ñô»­¶Ô»°
	if nStep_XBTask == 2 and XBTaskSwitch == 1 then
		task_001_03_0();
		return
	end
	
	--´ø»Ø»òÎ´´ø»ØÅ®Ê½×°Êø
	if nStep_XBTask == 3 then
		task_001_04_0();
		return
	end
	
	--´ø»Ø»òÎ´´ø»ØÒ»Æ·ÌÃÁîÅÆ
	if nStep_XBTask == 4 then
		task_001_05_0();
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ02ÇéÀ§¿ÍÕ»----------------------------------

	--Ëï¶şçöÉĞÎ´ÇåĞÑ¶Ô»°
	if nStep_XBTask >= 5 and nStep_XBTask <= 9 then
		task_001_05_1();
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ03´ºÊ®ÈıÄï----------------------------------
	
	--Ñ¯ÎÊÈçºÎÖÎÓúËï¶şçöµÄÏàË¼²¡
	if nStep_XBTask == 10 then
		task_003_01_0();
		return
	end
	
	--Ëï¶şçöÎ´ÇåĞÑÇ°¶Ô»°
	if nStep_XBTask >= 11 and nStep_XBTask <= 12 then
		task_003_01_1();
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ04ÕĞ±øÂòÂí----------------------------------
	--Ëï¶şçö¾ÆĞÑÆÚ¼ä¶Ô»°
	if nStep_XBTask >= 13 and nStep_XBTask <= 14 then
		task_001_05_1();
		return
	end
	
	--È¡µÃÒ»Æ·ÌÃÑûÇëº¯ºó¶Ô»°
	if nStep_XBTask == 15 then
		task_004_03_0();
		return
	end
	
	--»¹Ã»Óë³µÂÖ°ÔÍõ¶Ô»°ÉêÇë¼ÓÈëÒ»Æ·ÌÃ
	if nStep_XBTask == 16 then
		task_004_03_1();
		return
	end
	
	--ÓëÅ·Ñô»­¶Ô»°Ñ¯ÎÊ¼àÀÎÎ»ÖÃ
	if nStep_XBTask == 17 then
		task_005_02_0();
		return
	end
	
	--Î´Óë°ÙÏşÉú¶Ô»°ÇëÇó¹ØÓÚ½ÙÇôµÄ°ïÖú
	if nStep_XBTask == 18 then
		task_005_02_1();
		return
	end
	
	--¹ı¶È¶Ô»°£¬Îª¼ÓÈëÒ»Æ·ÌÃĞèĞ¡ĞÄµÄÄÚÈİ
	if nStep_XBTask >= 19 and nStep_XBTask <= 39 then
		strTalk = {
			"<sex> gia nhËp NhÊt PhÈm ®­êng mäi viÖc ®Òu ph¶i thËn träng.",
			}
		TalkEx("",strTalk)
		return
	end
	
	--²¹·¢Ö§ÏßÅ·Ñô»­´¥·¢Æ÷
	if nStep_XBTask >= 39 and nStep_XBTask_02 == 0 and GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
	end
	
	---------------------------------- Î÷±±Çø11·ÖÖ§1_3µÛÍõÖ®Ä¹----------------------------------
	--ÓëÅ·Ñô»­¶Ô»°£¬Ã»È¡µÃ½ğË¿ÃæÕÖÖ®Ç°£¬Ç°Íù½ØÉ±Ò»Æ·ÌÃ°µÉ±Ê¹
	if nStep_XBTask_01 == 9 then
		task_011_03_0();
		return
	end
	
	--»¹Î´³É¹¦Ç°Íù½ØÉ±Ò»Æ·ÌÃ°µÉ±Ê¹and²¹·¢´¥·¢Æ÷
	if nStep_XBTask_01 == 10 then
		task_011_03_1();
		return
	end
	
	--ÒÑ¾­É±ËÀÒ»Æ·ÌÃ°µÉ±Ê¹
	if nStep_XBTask_01 == 11 then
		task_011_04_0();
		return
	end
	
	--»¹Ã»È¡µÃ10¸ö½ğË¿ÃæÕÖÓëÅ·Ñô»­¶Ô»°and²¹·¢´¥·¢Æ÷
	if nStep_XBTask_01 == 12 then
		task_011_04_1();
		return
	end
	
	---------------------------------- Î÷±±Çø13·ÖÖ§1_5Òô¾ø¹ÅÄ¹----------------------------------
	--Ñ¯ÎÊÅ·Ñô»­ÈëÄ¹Çé¿ö
	if nStep_XBTask_01 == 17 then
		task_013_03_0();
		return
	end
	
	--Î´Ñ¯ÎÊÁø×İÔÆÈëÄ¹Çé¿ö
	if nStep_XBTask_01 == 18 then
		task_013_03_1();
		return
	end
	
	---------------------------------- Î÷±±Çø13·ÖÖ§1_7Ò©ÈË¾ªÏÖ----------------------------------
	--ÓëÅ·Ñô»­»ã±¨¹ØÓÚÒ©ÈËÒ»ÊÂ
	if nStep_XBTask_01 == 31 then
		task_016_03_0();
		return
	end
	
	--»¹Î´É±ËÀ30Ò©ÈË
	if nStep_XBTask_01 == 32 then
		task_016_03_1();
		return
	end
	
	--ÏûÃğ30Ò©ÈËºóÏòÅ·Ñô»­»ã±¨Çé¿ö
	if nStep_XBTask_01 == 33 then
		task_016_04_0();
		return
	end
	
	--»¹Î´ÏòÁõÈıÑ¯ÎÊÒ©ÈË¶´ÄÚÇé¿ö
	if nStep_XBTask_01 == 34 then
		task_016_04_1();
		return
	end

	---------------------------------- Î÷±±Çø18·ÖÖ§1_9ÜÆº®ÁÒÑô----------------------------------
	--¸æËßÅ·Ñô»­Ò©ÈË²İÄÑÒÔÏûÃğÒ»ÊÂ
	if nStep_XBTask_01 == 37 then
		task_018_01_0();
		return
	end
	
	--»¹Ã»ÕÒµ½Ëï·½ÈÊÇë½ÌÒ©ÈË²İÒ»ÊÂ
	if nStep_XBTask_01 == 38 then
		task_018_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø19·ÖÖ§1_10¸¶Öî¶«Á÷----------------------------------
	--³É¹¦ÏûÃğÎåÖêÒ©ÈË²İ£¬»ØÈ¥ÓëÅ·Ñô¶Ô»°
	if nStep_XBTask_01 == 42 then
		task_019_01_0();
		return
	end
	
	--ÉĞÎ´ÓëÁõÈı¶Ô»°
	if nStep_XBTask_01 == 43 then
		task_019_01_1();
		return
	end
	
	--ÏòÅ·Ñô»­ÃèÊöÒ©ÍõÒÂ×ÅÈİÃ²
	if nStep_XBTask_01 == 44 then
		task_019_03_0();
		return
	end
	
	--Î´ÓëÌÆÜ·Ü·¶Ô»°ÇëÇóÖÆ×÷Ò×Èİ×°
	if nStep_XBTask_01 == 45 then
		task_019_03_1();
		return
	end
	
	--ÒÑ¾­É±ËÀÒ©Íõ»ØÀ´
	if nStep_XBTask_01 == 48 then
		task_019_07_0();
		return
	end
	
	
	--»¹Î´ÓëËï·½ÈÊ¶Ô»°
	if nStep_XBTask_01 == 49 then
		task_019_07_1();
		return
	end
	
	--»ã±¨Å·Ñô»­É³Ä®»ÃÏóÒ»ÊÂ
	if nStep_XBTask_01 == 61 then
		task_022_02_0();
		return
	end

	--»¹Î´Ñ¯ÎÊÒ¶×ÓÇï¹ØÓÚÉ³Ä®»ÃÏóÒ»ÊÂ
	if nStep_XBTask_01 == 62 then
		task_022_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø23·ÖÖ§1_14»ÆÉ³ÂäÄ»----------------------------------
	--½«ÊÂÇé¸æÖªÅ·Ñô»­
	if nStep_XBTask_01 == 67 then
		task_023_05_0();
		return
	end
	
	---------------------------------- Î÷±±Çø29èÉĞÛÖ®Ñç------------------------------------------

	--ÔÚÅ·Ñô»­´¦ÁìÈ¡èÉĞÛÖ®ÑçÈÎÎñ
	if nStep_XBTask_01 == 68 then
		task_029_01_0();
		return
	end
	
	--ÉĞÎ´Óë¿Ü×¼¶Ô»°
	if nStep_XBTask_01 == 69 then
		task_029_01_1();
		return
	end

	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Bøc tranh cña ng­êi häa sÜ ph¶i cã ı vŞ míi lµ tranh hiÕm."},
		{"Tranh vÏ mü nh©n qu¶ lµ tuyÖt t¸c."},
		{"Tuy ta cã bu«n b¸n ë Phông T­êng nh­ng kh«ng b¸n tranh, nÕu ng­¬i biÕt th­ëng thøc th× ta tÆng ng­¬i cã sao ®©u."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
