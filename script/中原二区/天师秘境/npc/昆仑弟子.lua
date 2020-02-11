-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÌìÊ¦ÃØ¾³NPCÀ¥ÂØµÜ×ÓScript
-- By StarryNight
-- 2007/08/07 PM 11:46

-- ··ÂôÄãµÄ¸ĞÇé°É£¬µ«ËüÒ»ÎÄ²»Öµ¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	
	--»î¶¯
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk3()
		if nRet == 1 then
			return
		end
	end	
	
	--------------
	
	local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);

	---------------------------------- Î÷±±Çø25·ÖÖ§2_2ÃØ¾³÷¼÷Ã----------------------------------
	
	--ÓëÌìÊ¦ÃØ¾³ÖĞÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°»ñµÃ½â·âµÄÖäÓï
	if nStep_XBTask_02 == 7 then
		task_025_02_0();
		return
	end
	
	--ÉĞÎ´ÏûÃğ÷¼÷ÃÍõ
	if nStep_XBTask_02 == 8 then
		task_025_02_1();
		return
	end
	
	--ÏûÃğ÷¼÷ÃÍõºó
	if nStep_XBTask_02 == 9 then
		task_025_03_0();
		return
	end
	
	--ÉĞÎ´¸æÖªÒ¶×ÓÇï÷¼÷ÃÍõÒ»ÊÂ
	if nStep_XBTask_02 == 10 then
		task_025_03_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Thiªn S­ mËt c¶nh thËt vui, qu¶ nhiªn cã nhiÒu em nh­ vËy~~!? (*^_^*) hihi……",
		}
	
	TalkEx("",strTalk);
	return
	
end;
