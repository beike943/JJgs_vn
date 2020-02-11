-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñNPC¸ßÉıÈªScript
-- By StarryNight
-- 2005/12/30 PM 15:26

--ÒÒÓÏÄê Îì×ÓÔÂ Îì×ÓÈÕ 
--ÒË: ºÏÕÊ ²ÃÒÂ ½ÌÅ£Âí âÅÊÂÎğÈ¡ 
--¼É: ÈëÕ¬ ¶¯ÍÁ ÆÆÍÁ ¼ŞÈ¢ ×÷Ôî Ôì´¬ 
--¼ªÉñÒËÇ÷: ¹ÙÈÕ ¾´°² ½ğØÑ  
--Ğ×ÉñÒË¼É: ÔÂ½¨ Ğ¡Ê± ÍÁ¸® ÔÂÑá µØ»ğ  
--ÎåĞĞ: Åùö¨»ğ  ½¨Ö´Î»  
--Åí×æ°Ù¼É: Îì²»ÊÜÌïÌïÖ÷²»Ïé ×Ó²»ÎÊ²·×ÔÈÇ»öÑê 

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv20\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nLevel = GetLevel();
local nTask_DL_State_10 = GetTask(TASK_DL_LV10_ID);
local nTask_DL_State_20 = GetTask(TASK_DL_LV20_ID);
local nTask_DL_State_30 = GetTask(TASK_DL_LV30_ID);
local nTask_DL_State_35 = GetTask(TASK_DL_LV35_ID);
local nTask_DL_State_35_01 = GetTask(TASK_DL_LV35_01_ID);
local nTask_DL_State_35_zx = GetTask(TASK_DL_LV35_ID_ZX);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
local nTask_DL_State_55 = GetTask(TASK_DL_LV55_ID);
local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID);
local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID);
local nTask_DL_State_70 = GetTask(TASK_DL_LV70_ID);
	
	--ÁìÈ¡´óÀí¹ú¹«ÈÎÎñ
	if nLevel >= 20 and nTask_DL_State_10 >= 4 and nTask_DL_State_20 == 0 then
		task_000_00();
		return
	end
	
	if nTask_DL_State_20 == 1 then
		local strTalk = {
			"<sex> cã c«ng ®i tiªu diÖt 20 con rÕt ®éc trõ h¹i cho l÷ kh¸ch!"
		}
		TalkEx("task_001_00",strTalk);
		return
	end;
	
	if nTask_DL_State_20 == 2 then
		task_002_00();
		return
	end;
	
	if nTask_DL_State_20 == 3 then
		task_003_00();
		return
	end;
		
	if nTask_DL_State_20 == 4 then
		task_004_00();
		return
	end;
	
	if nTask_DL_State_20 == 5 then
		task_005_00();
		return
	end;
	
	if nTask_DL_State_30 >= 1 and nTask_DL_State_30 <= 4 then
		task_006_00();
		return
	end;
	
	if nTask_DL_State_30 == 5 then
		task_007_00();
		return
	end;
	
	if nTask_DL_State_30 == 6 then
		task_008_00();
		return
	end;
	
	--ÒÑÁìÈ¡ÎäÁêÉ½ÈÎÎñ,Î´Íê³É
	if nTask_DL_State_35 == 1 or nTask_DL_State_35_zx == 1 then
		if nTask_DL_State_35_01 == 1 or nTask_DL_State_35_01 == 10 then
			task_010_00();
			return
		end;
		if nTask_DL_State_35_01 == 2 then
			task_010_10();
			return
		end;
		return
	end;
	
	--ÒÑÍê³É´òµ¹ò¿»ğ½ÌÍ½ÈÎÎñ
	if nTask_DL_State_35 == 2 then
		task_011_00();
		return
	end
	
	--ÒÑ½áÊøÎäÁêÉ½ÈÎÎñ
	if nTask_DL_State_35 == 3 then
		task_012_00();
		return
	end
	
	--Î´´¥·¢55¼¶·ï»ËôáÈÎÎñ
	if nTask_DL_State_50 == 7 then
		task_013_00();
		return
	end
	
	--ÒÑ¾­´¥·¢55¼¶·ï»ËôáÈÎÎñ
	if nTask_DL_State_55 == 1 then
		task_014_00();
		return
	end
	
	--Î´È¥ÕÒÄªÈı¶Ô»°£¬Î´´òµ¹·ï»Ë
	if nTask_DL_State_55 >= 2 and nTask_DL_State_55 <= 3 then
		task_015_00();
		return
	end
	
	--´òµ¹·ï»Ëºó
	if nTask_DL_State_55 == 4 then
		task_016_00();
		return
	end
	
		--Íê³É·ï»ËÈÎÎñºó
	if nTask_DL_State_55 == 5 then
		task_017_00();
		return
	end
	
	--Íê³ÉÖ£¹áÖ®µÄ»õ¿îÈÎÎñºóÁìÈ¡70¼¶ÈÎÎñò¿»ğ½ÌµÄÌôÕ½Êé
	if nTask_DL_State_60_1 == 6 and nTask_DL_State_60_2 == 5 and nTask_DL_State_70 == 0 then
		task_018_00()
		return
	end
	
	--Î´´ò°Ü°¢ĞŞÂŞÖ®Ç°/´ò°Ü°¢ĞŞÂŞÎ´´ò¿ªĞÅ¼şÔÄ¶Á
	if nTask_DL_State_70 >= 1 and nTask_DL_State_70 <= 2 then
		task_019_00()
		return
	end
	
	--´ò°Ü°¢ĞŞÂŞÇÒÒÑ¾­´ò¿ªĞÅ¼şÔÄ¶Á
	if nTask_DL_State_70 == 3 then
		task_020_00()
		return
	end
	
	--Íê³Éò¿»ğ½ÌµÄÌôÕ½ÊéÈÎÎñºó
	if nTask_DL_State_70 >= 4 then
		local strTalk = {
			"Th©n lµ Quèc c«ng §¹i Lı ph¶i chŞu träng tr¸ch nÆng nÒ....."
			}	
		TalkEx("",strTalk);
		return
	end
	
	local strTalk = {
		"Th©n lµ Quèc c«ng §¹i Lı ph¶i chŞu träng tr¸ch nÆng nÒ....."
	}	
	TalkEx("",strTalk);
	return
end
