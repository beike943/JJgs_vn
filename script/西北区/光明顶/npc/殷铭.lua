-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¹âÃ÷¶¥NPCÒóÃúScript
-- By StarryNight
-- 2007/06/26 PM 5:51

-- ¸øÄãµÄÉúÃüÁôÏÂ¶àÒ»µãµÄ×ğÑÏ°É£¬ÔÚÕâ¸ö²Ô°×ÎŞÁ¦µÄ³ÇÊĞ¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 1 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 2);
		Talk(1,"","Sa Trung Kim tøc vµng trong c¸t, h·y ®Õn Mª Cung Sa M¹c t×m B¹ch Thiªn Thµnh (194/166)");
		TaskTip("Sa Trung Kim tøc vµng trong c¸t, h·y ®Õn Mª Cung Sa M¹c t×m B¹ch Thiªn Thµnh (194/166)");
		return 
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±ÈÎÎñ·ÖÖ§1¡ª¡ª09¹âÃ÷×óÊ¹----------------------------------
	
	--ÊÜÍØ°ÎºëËùÍĞ´òÌ½¹âÃ÷¶¥ÊÂÇé
	if nStep_XBTask_01 == 1 then
		task_009_02_0();
		return
	end
	
	--»¹Ã»ºÍ²¨Ë¹ÉÌÈË¶Ô»°
	if nStep_XBTask_01 == 2 then
		task_009_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø10·ÖÖ§1_2Î´Óê³ñçÑ----------------------------------
	
	--È¡µÃ»òÎ´È¡µÃÆÏÌÑ¾Æ
	if nStep_XBTask_01 == 3 then
		task_010_01_0();
		return
	end
	
	--È¡µÃ»òÎ´È¡µÃò¿»ğ½ÌÁîÅÆ
	if nStep_XBTask_01 == 4 then
		task_010_02_0();
		return
	end
	
	--»¹Ã»É±ËÀ30ÅÑÍ½and²¹·¢´¥·¢Æ÷
	if nStep_XBTask_01 == 5 then
		task_010_02_1();
		return
	end
	
	--ÒÑ¾­É±ËÀ30ÅÑÍ½
	if nStep_XBTask_01 == 6 then
		task_010_03_0();
		return
	end
	
	--ÉĞÎ´ÓëÍØ°Îºë»Ø»°
	if nStep_XBTask_01 == 7 then
		task_010_03_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"GÇn ®©y cã nhiÒu ng­êi lĞn lót lªn Quang Minh ®Ønh, sao giÊu ®­îc ta?"},
		{"ë ®Êt Phông T­êng nµy, nÕu lÊy mü töu trung nguyªn víi R­îu Nho Ba T­ th× qu¶ lµ thua xa."},
		{" Kh¸i ®­¬ng dÜ khang, ­u t­ nan vong, hµ dÜ gi¶i ­u, duy h÷u ®ç khang. Thiªn h¹ anh hïng hµo khİ, thïy d­ céng Èm ®ång x­íng?"},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
