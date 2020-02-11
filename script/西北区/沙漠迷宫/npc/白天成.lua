-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII É³Ä®ÃÔ¹¬NPC°×Ìì³ÉScript
-- By StarryNight
-- 2007/08/07 PM 7:45

-- Éú²¡ÕæÄÑÊÜ£¬ÓÈÆä¼ÓÉÏ¼Ó°à~~~~

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\online_activites\\2014_02\\shazhongjin.lua")

function main()
	if VET_201402_TASK:GetTask(VET_201402_TASK.TASK) == 2 then
		VET_201402_TASK:SetTask(VET_201402_TASK.TASK, 3);
		Say("B¶o kiÕm l©u l¾m kh«ng sö dông, h·y gióp ta mµi kiÕm, cho ®Õn khi nµo Vµng trong KiÕm táa ¸nh hµo quang ngò.\n<color=gold> tiªu diÖt 333 Sa M¹c Hµnh Nh©n \n tiªu diÖt 555 TÇm B¶o Nh©n <color>", 0);
		TaskTip("Tiªu diÖt 333 Sa M¹c Hµnh Nh©n ");
		TaskTip("Tiªu diÖt 555 TÇm B¶o Nh©n");
		return 
	end

	local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±Çø23·ÖÖ§1_14»ÆÉ³ÂäÄ»----------------------------------
	
	--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃ·âÑıËşÓë°×Ìì³É¶Ô»°
	if nStep_XBTask_01 == 62 then
		task_023_02_1();
		return
	end
	
	--Ë¢³ö»ÃÏó
	if nStep_XBTask_01 == 64 then
		task_023_02_0();
		return
	end
	
	--½«·¨Æ÷ËÍ¸ø°×Ìì³É
	if nStep_XBTask_01 == 65 then
		task_023_03_0();
		return
	end
	
	--ÒÑ¾­É±ËÀ»ÃÏó£¬¹Ø¿¨½Ó¿Ú¿ªÆô
	if nStep_XBTask_01 == 66 then
		task_023_02_2();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"Ng­¬i lµ...ngän löa trong sa m¹c µ!",
		}
	
	TalkEx("",strTalk);
	return

end;
