-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPCÔ¬·ÉÔÆScript
-- By StarryNight
-- 2007/08/04 AM 11:59

-- ºÃÈÈ°¡ºÃÈÈ°¡¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local	strTalk = {};

	---------------------------------- Î÷±±Çø20·ÖÖ§1_11±ø²»ÑáÕ©----------------------------------
	
	
	--ÒÑ¾­É±ËÀÁË¶ÀĞĞÀÏÍÓ
	if nStep_XBTask_01 == 54 then
		strTalk = {
			"S¸t Thñ Oa Oa thİch nhÊt KÑo Hå L« cña §­êng Hå L« trongPhông T­êng phñ, ng­¬i h·y mua vÒ cho İt Thuèc mª cña ta vµo, b¶o ®¶m kh«ng cã s¬ hë.",
			}
		TalkEx("",strTalk);	
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		"Lµm nghÒ cña chóng t«i ®· quen víi b¨ng gi¸ vµ sa m¹c råi. ChØ cÇn b¾t ®­îc ph¹m nh©n lµ ®­îc råi."
		}
	
	TalkEx("",strTalk);
	return
	
end;
