-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Ò©Íõ¹ÈNPCÁõÈıScript
-- By StarryNight
-- 2007/08/04 AM 10:52

-- ÎÒÖ»ÊÇÒ»¸ö¿³²ñÈË

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_03\\task_yinxin.lua")

function main()
	--»î¶¯
	if gf_CheckEventDateEx(WN_201403_ACTIVITY_ID) == 1 then
		local nRet = WN_201403_Talk2()
		if nRet == 1 then
			return
		end
	end	
	
	--------------


	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);


	---------------------------------- Î÷±±Çø17·ÖÖ§1_8ÆæÒìÖ®²İ----------------------------------
	
	
	--ÏòÁõÈıÑ¯ÎÊ¹ØÓÚÒ©Íõ¶´µÄÊÂÇé
	if nStep_XBTask_01 == 34 then
		task_017_01_0();
		return
	end
	
	--´ø»Ø»òÎ´´ø»Ø20Ç§ÄêÎÚÄ¾ÎïÆ·
	if nStep_XBTask_01 == 35 then
		task_017_02_0();
		return
	end
	
	--»¹Î´ÏûÃğÒ»ÖêÒ©ÈË²İ
	if nStep_XBTask_01 == 36 then
		task_017_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø19·ÖÖ§1_10¸¶Öî¶«Á÷----------------------------------
	--³É¹¦ÏûÃğÎåÖêÒ©ÈË²İ£¬»ØÈ¥ÓëÅ·Ñô¶Ô»°
	if nStep_XBTask_01 == 43 then
		task_019_02_0();
		return
	end
	
	--Î´»Ø±¨Å·Ñô»­Ò©ÍõµÄÈİÃ²
	if nStep_XBTask_01 == 44 then
		task_019_02_1();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Xung quanh Phông T­êng phñ giã c¸t rÊt m¹nh thæi ®Õn gç ®Òu óa vµng lµm sao b¸n ®­îc? §em ®i ®èt cã lı h¬n."},
		{"Xung quanh D­îc V­¬ng ®éng cã mét sè gç quı nh­ng bŞ ta chÆt hÕt råi."},
		{"Tin ta ®i D­îc V­¬ng ®éng rÊt nguy hiÓm kh«ng nªn ®Õn ®ã."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;
