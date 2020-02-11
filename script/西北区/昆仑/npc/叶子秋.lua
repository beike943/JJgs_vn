-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÒ¶×ÓÇïScript
-- By StarryNight
-- 2007/06/13 AM 11:02

-- ĞÄÌ¬£¬ĞÄÌ¬ºÃÖØÒª£¬ÖÁÉÙ±ÈÅ®ÈËÖØÒª¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- Î÷±±ÈÎÎñ05³Â²Ö°µ¶È----------------------------------
	
	--´ø°ü¹ü¸øÒ¶×ÓÇï¶Ô»°
	if nStep_XBTask == 21 then
		task_005_06_0();
		return
	end
	
	--Î´»Ø»°¸øÒ¶ÀÏ
	if nStep_XBTask == 22 then
		task_005_06_1();
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ06²»ËÀ½ğµ¤----------------------------------
	
	--ÏòÒ¶×ÓÇïÑ¯ÎÊ³¤Éú²»ÀÏµ¤ÊÂÇé
	if nStep_XBTask == 26 then
		task_006_02_0();
		return
	end
	
	--Î´ÏòÕÔ×ÓÆ½Ñ¯ÎÊ³¤Éú²»ÀÏµ¤ÊÂÇé
	if nStep_XBTask == 27 then
		task_006_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø24·ÖÖ§2_1¹íÃÅÔ©»ê----------------------------------
	--ÓëÒ¶×ÓÇï¶Ô»°½»¸øËûËø»êé×
	if nStep_XBTask_02 == 2 then
		task_024_03_0();
		return
	end
	
	--Î´½«ÏÉµ¤´ø¸ø¹íÃÅ»ØÀÈ´¦µÄÀ¥ÂØµÜ×Ó
	if nStep_XBTask_02 == 3 then
		task_024_03_1();
		return
	end
	
	---------------------------------- Î÷±±Çø25·ÖÖ§2_2ÃØ¾³÷¼÷Ã----------------------------------
	
	--¸æËßÒ¶×ÓÇïÔ¹»êÖ®ÍõÒ»ÊÂ
	if nStep_XBTask_02 == 6 then
		task_025_01_0();
		return
	end

	--»¹Î´ÓëÌìÊ¦ÃØ¾³ÖĞÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°
	if nStep_XBTask_02 == 7 then
		task_025_01_1();
		return
	end
	
	--¸æÖªÒ¶×ÓÇï÷¼÷ÃÍõÒ»ÊÂ
	if nStep_XBTask_02 == 10 then
		task_025_04_0();
		return
	end
	
	--ÉĞÎ´¸æÖªÅ·Ñô»­À¥ÂØÈëÊÀÒ»ÊÂÒòÓÉ
	if nStep_XBTask_02 == 11 then
		task_025_04_1();
		return
	end

	---------------------------------- Î÷±±Çø26·ÖÖ§2_3·Ç³£µÀÈË----------------------------------
	--ÊÜÒ¶ÀÏËùÍĞÓëÒ¶×ÓÇï¶Ô»°
	if nStep_XBTask_02 == 13 then
		task_026_03_0();
		return
	end

	--Î´´òµ¹·Ç³£µÀÈË¶Ô»°
	if nStep_XBTask_02 == 14 then
		task_026_03_1();
		return
	end
	
	---------------------------------- Î÷±±Çø27·ÖÖ§2_4¹ÅÑôÒìÊŞ----------------------------------
	--´òµ¹·Ç³£µÀÈËºóÓëÒ¶×ÓÇï¶Ô»°
	if nStep_XBTask_02 == 15 then
		task_027_01_0();
		return
	end

	--ÊÕ¼¯»òÎ´ÊÕ¼¯µ½10¸ù»ğºüÎ²Óëó¤ÁúĞë
	if nStep_XBTask_02 == 16 then
		task_027_02_0();
		return
	end
	
	--Î´ÓëÀ¥ÂØµÜ×Ó¶Ô»°»ñÏ¤¹ÅÑôÊŞĞĞ×Ù
	if nStep_XBTask_02 == 17 then
		task_027_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø28·ÖÖ§2_5ÂÏÉúÓñ±Ú----------------------------------
	--É±ËÀ¹ÅÑôÊŞºóÓëÒ¶×ÓÇï¶Ô»°
	if nStep_XBTask_02 == 18 then
		task_028_01_0();
		return
	end
	
	--»¹Î´É±ËÀÑªÄ§ÈË£¨²¹·¢¾ÛÁéØ°Ê×£©
	if nStep_XBTask_02 == 19 then
		task_028_01_1();
		return
	end
	
	--ÒÑ¾­É±ËÀÑªÄ§ÈË
	if nStep_XBTask_02 == 20 then
		task_028_02_0();
		return
	end
	
	---------------------------------- Î÷±±Çø23·ÖÖ§1_14»ÆÉ³ÂäÄ»----------------------------------
	--Ñ¯ÎÊÒ¶×ÓÇï¹ØÓÚÉ³Ä®»ÃÏóµÄÊÂÇé
	if nStep_XBTask_01 == 62 then
		task_023_01_0();
		return
	end
	
	--»¹Ã»´òµ¹»ÃÏóÇ°ÌáÊ¾ÖäÓï
	if nStep_XBTask_01 == 63 then
		task_023_01_1();
		return
	end
	
	--»¹Ã»´òµ¹»ÃÏóÇ°ÓëÒ¶×ÓÇï¶Ô»°²¹Áì·âÑıËş
	if  nStep_XBTask_01 == 64 or nStep_XBTask_01 == 65 then
		task_023_01_2();
		return
	end
	
	--´òµ¹»ÃÏóºó½»»¹·âÑıËş
	if nStep_XBTask_01 == 66 then
		task_023_04_0();
		return
	end
	
	--»¹Î´»ã±¨Å·Ñô»­
	if nStep_XBTask_01 == 67 then
		task_023_04_1();
		return
	end
	
	--Íê³É·ÖÖ§2ºó
	if nStep_XBTask_02 == 21 then
		task_028_02_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Ta thÒ chuyªn t©m tu ®¹o, tiªu diÖt yªu ma ®Ó thiªn h¹ th¸i b×nh."},
		{"Ph¸i C«n L«n lÊy viÖc thu phôc ma quû lµm ®Çu. Nay Giang T©n th«n xuÊt hiÖn yªu ma h¹i ng­êi, ®Ö tö C«n L«n sao cã thÓ chóng lµm h¹i nh©n gian?"},
		{"Trung nguyªn lu«n nghi kş víi m«n ph¸i ë xa nh­ng giang hå hiÓm ¸c ta kh«ng nªn tr¸ch hä, mäi viÖc cÈn thËn vÉn tèt h¬n."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
