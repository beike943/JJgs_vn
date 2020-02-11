-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPC¶­åÈÂŞScript
-- By StarryNight
-- 2006/01/04 PM 16:26

--ÒÒÓÏÄê Îì×ÓÔÂ ¹ïÒÑÈÕ 
--ÒË: ¼Àìë ËÜ»æ ¿ª¹â ²ÃÒÂ ¹ÚóÇ ¼ŞÈ¢ ÄÉ²É ²ğĞ¶ ĞŞÔì ¶¯ÍÁ ÊúÖù ÉÏÁº °²´² ÒÆáã ÈëÕ¬ °²Ïã ½áÍø ²¶×½ î±ÁÔ ·¥Ä¾ ½øÈË¿Ú ·ÅË® 
--¼É: ³öĞĞ °²Ôá ĞŞ·Ø ¿ªÊĞ 
--¼ªÉñÒËÇ÷: Îå¸» Òæáá  
--Ğ×ÉñÒË¼É: ½ÙÉ· Ğ¡ºÄ ¸´ÈÕ ÖØÈÕ ÔªÎä  
--Ã¿ÈÕÌ¥ÉñÕ¼·½: Õ¼·¿´²·¿ÄÚ±± 
--ÎåĞĞ: ³¤Á÷Ë® Ö´Ö´Î» 
--³å: ³åÖí(¶¡º¥)É·¶« 
--Åí×æ°Ù¼É: ¹ï²»´ÊËÏÀíÈõµĞÇ¿ ÒÑ²»Ô¶ĞĞ²ÆÎï·ü²Ø 

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv58\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nTask_DL_State_58 = GetTask(TASK_DL_LV55_ID);
local nTask_DL_State_60 = GetTask(TASK_DL_LV60_ID);
local nTask_DL_State_70	= GetTask(TASK_DL_LV70_ID);
local nTask_DL_State_80	= GetTask(TASK_DL_LV80_ID);

	--ÁìÈ¡´óËÎÃû²ËÈÎÎñ
	if nTask_DL_State_58 == 5 then
		task_000_00();
		return
	end
	--Î´ÓëÙÜÌ«¾ı¶Ô»°
	if nTask_DL_State_58 == 6 then
		task_001_00();
		return
	end
	
	--´øº¢×Óµ½´ïÄ¿µÄµØ
	if nTask_DL_State_58 == 7 then
		task_002_00();
		return
	end
	
	--Íê³É´óËÎÃû²ËÈÎÎñºó
	if nTask_DL_State_58 == 8 then
		task_003_00();
		return
	end
	
	--ÁìÈ¡ÁËÉ±20¶¾òğºó
	if nTask_DL_State_60 == 1 then
		task_009_00();
		return
	end
	
	--ÒÑ¾­É±20¶¾òğ
	if nTask_DL_State_60 == 2 then
		task_010_00();
		return
	end
	
	--Î´É±ËÀò¿»ğÉ®¶ñ¶Ô»°
	if nTask_DL_State_60 == 3 then
		task_011_00();
		return
	end
	
	--ÒÑ¾­É±ËÀò¿»ğÉ®¶ñ
	if nTask_DL_State_60 == 4 then
		task_112_00();
		return
	end
	
	--ÁìÈ¡°×Ë®¶´ÈÎÎñ
	if nTask_DL_State_60 == 5 then
		task_013_00();
		return
	end
	
	--ÒÑ¾­ÁìÈ¡ÁË°×Ë®¶´ÈÎÎñ
	if nTask_DL_State_60 == 6 then
		task_014_00();
		return
	end
	
	--ÒÑ¾­É±ËÀÒ¹²æ
	if nTask_DL_State_60 == 7 then
		task_015_00();
		return
	end
	
	--ÒÑ¾­Íê³É°×Ë®¶´ÈÎÎñ
	if nTask_DL_State_60 == 8 then
		task_016_00();
		return
	end
	
	--ÒÑ¾­Íê³Éò¿»ğ½ÌµÄÌôÕ½ÊéÈÎÎñ
	if nTask_DL_State_70 == 4 then
		task_017_00();
		return
	end
	
	--Î´´òµ¹¶Î³Ğ¶÷Ö®Ç°¶Ô»°
	if nTask_DL_State_80 >= 1 and nTask_DL_State_80 <= 2 then
		task_018_00();
		return
	end
	
	--Óë¶ş»Ê×Ó¶Ô»°ºóÓë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 3 then
		task_019_00();
		return
	end
	
	--Î´´òµ¹Ç¬´ïÆÅÇ°Óë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 4 and GetTask(TASK_DL_LV80_TIME_ID) == 1 then
		task_020_00();
		return
	end
	
	--µÈ´ı20·ÖÖÓºóÓë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 4 then
		task_019_01();
		return
	end
	
	--´òµ¹Ç¬´ïÆÅºóÓë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 5 then
		task_021_00();
		return
	end
	
	--Î´´òµ¹½ôÄÇÂŞÇ°Óë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 6 then
		task_022_00();
		return
	end
	
	--´òµ¹½ôÄÇÂŞºóÓë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 7 then
		task_023_00();
		return
	end
		
	--Î´´òµ¹Èı»Ê×ÓÇ°Óë¶­åÈÂŞ¶Ô»°£¨²¹ÁìÕÙ»½Èı»Ê×ÓÎïÆ·£©
	if nTask_DL_State_80 == 8 then
		task_024_00();
		return
	end
	
	--´òµ¹Èı»Ê×ÓºóÓë¶­åÈÂŞ¶Ô»°
	if nTask_DL_State_80 == 9 then
		task_025_00();
		return
	end
	
	--½áÊøÈı»Ê×ÓÈÎÎñºó¶Ô»°
	if nTask_DL_State_80 >= 10 then
		local strTalk = {
			"§a t¹ <sex> ®· lµm nhiÒu viÖc cho §¹i Lı!",
			}
		TalkEx("",strTalk);
		return
	end
	
	--Ò»°ã×´Ì¬ÏÂ¶Ô»°
	local strTalk = {
		"Xin <sex> h·y nghØ ng¬i mét thêi gian!",
	}
	
	TalkEx("",strTalk);
	return
end
