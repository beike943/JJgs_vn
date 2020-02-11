-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ¹íÃÅ»ØÀÈNPCÊÜÉËµÄÀ¥ÂØµÜ×ÓScript
-- By StarryNight
-- 2007/08/07 PM 09:58

-- ··ÂôÄãµÄ¸ĞÇé°É£¬µ«ËüÒ»ÎÄ²»Öµ¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- Î÷±±Çø24·ÖÖ§2_1¹íÃÅÔ©»ê----------------------------------
	
	--Óë¹íÃÅ»ØÀÈÖĞÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°
	if nStep_XBTask_02 == 1 then
		task_024_02_0();
		return
	end
	
	--ÉĞÎ´½«Ëø»êé×ËÍ·µÀ¥ÂØÓëÊÜÉËÀ¥ÂØµÜ×Ó¶Ô»°
	if nStep_XBTask_02 == 2 then
		task_024_02_1();
		return
	end
	
	--½«ÏÉµ¤½»¸øÊÜÉËµÄÀ¥ÂØµÜ×Ó
	if nStep_XBTask_02 == 3 then
		task_024_04_0();
		return
	end
	
	--Î´ÏûÃğÔ¹»êÖ®ÍõÓëÊÜÉËµÄµÜ×Ó¶Ô»°
	if nStep_XBTask_02 == 4 then
		task_024_04_1();
		return
	end
	
	--ÏûÃğÔ¹»êÖ®ÍõºÍÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°
	if nStep_XBTask_02 == 5 then
		task_024_05_0();
		return
	end
	
	--»¹Î´¸æËßÒ¶×ÓÇïÔ¹»êÖ®ÍõÒ»ÊÂ
		if nStep_XBTask_02 == 6 then
		task_024_05_1();
		return
	end
	
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"§au qu¸~~!? (*^_^*) hihi…..",
		}
	
	TalkEx("",strTalk);
	return
	
end;
