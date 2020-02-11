-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíNPCÖ£¹áÖ®Script
-- By StarryNight
-- 2005/12/29 PM 16:05

--Ê®Ò»ÔÂØ¥¾Å ¶¡º¥ÍÁ¾®±ÕÈÕ  
--ÒË£º  ²ÃÒÂ¡¢ÖşµÌ¡¢ĞŞ²Ö¡¢ĞŞÔì¡¢¶¯ÍÁ¡¢ÉÏÁº¡¢²¹Èû¡¢×÷Ôî  
--¼É£º  Àí·¢¡¢¼ŞÈ¢  

-- ×òÍíĞ¡Íµ½øÎİ£¬ÊÒÓÑÉÔÓĞËğÊ§£¬Äê¹ØÄÑ¹ı°¡¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\lv10\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nLevel = GetLevel();
local nTask_DL_State_10 = GetTask(TASK_DL_LV10_ID);
local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);
local nTask_DL_State_45 = GetTask(TASK_DL_LV45_ID);
local nTask_DL_State_50 = GetTask(TASK_DL_LV50_ID);
local nTask_DL_State_60 = GetTask(TASK_DL_LV60_ID);
local nTask_DL_State_60_1 = GetTask(TASK_DL_LV60_1_ID);
local nTask_DL_State_60_2 = GetTask(TASK_DL_LV60_2_ID);
local nTask_DL_State_62 = GetTask(TASK_DL_LV62_ID);
local nTask_DL_State_75 = GetTask(TASK_DL_LV75_ID);
	
	--ÁìÈ¡Å®ÉÌÈËÈÎÎñ
	if nLevel >= 10 and nTask_DL_State_10 == 0 and XnTaskSwitch == 1 then
		task_000_00();
		return
	end
	
	if nTask_DL_State_10 == 1 then
		task_001_00();
		return
	end;
	
	if nTask_DL_State_10 == 2 then
		task_002_00();
		return
	end;
	
	if nTask_DL_State_10 == 3 then
		task_003_00();
		return
	end;
	
	if nTask_DL_State_10 == 4 then
		local strTalk = {
			"Ta lµ ng­êi H¸n, míi ®Õn §¹i Lı lµm ¨n nªn còng kh«ng hiÓu t×nh h×nh ë ®©y l¾m. Nh­ng nghe nãi nÕu cã g× liªn quan ®Õn Xi Háa gi¸o th× cã thÓ t×m Quèc c«ng Cao Th¨ng TuyÒn ®Ó hái.",
			"§­îc! §Ó ta ®i hái xem."
		}
		TalkEx("",strTalk);
		return
	end;
	
	--ÁìÈ¡ÃçÁëĞÅÊ¹ÈÎÎñ
	if nTask_DL_State_40 == 6 then
		task_004_00()
		return
	end
	
	--ÒÑ¾­ÊÕ¼¯ÁË10¸ö÷äÆ¤
	if nTask_DL_State_45 == 1 then
		task_005_00()
		return
	end
	
	--ÒÑ¾­ÁìÈ¡ÁËÉÚ×Ó
	if nTask_DL_State_45 == 2 then
		task_006_00()
		return
	end
	
	--ÒÑ¾­´ò°ÜÁ¦Ê¿È¡µÃĞÅ¼ş
	if nTask_DL_State_45 == 3 then
		task_007_00()
		return
	end
	
	--ÒÑ¾­½«ĞÅ¼ş½»ÓëÖ£¹áÖ®
	if nTask_DL_State_45 == 4 then
		task_008_00()
		return
	end
	
	--ÒÑ¾­ÁìÈ¡50¼¶ÈÎÎñ
	if nTask_DL_State_50 == 1 then
		task_009_00()
		return
	end
	
	--ÒÑ¾­´ò°ÜÃçÁëÊ×Áì²¢ºÍÃçÁë×å³¤¶Ô»°ºó
	if nTask_DL_State_50 == 6 then
		task_010_00()
		return
	end
	
	--Î´Óë¸ßÉıÈª¶Ô»°
	if nTask_DL_State_50 == 7 then
		task_011_00()
		return
	end
	
	--ÁìÈ¡Ö£¹áÖ®Õ®¿îÈÎÎñ
	if nTask_DL_State_60 == 8 then
		task_012_00()
		return
	end
	
	--Íê³ÉÁ½¸öÎèÄïÈÎÎñÇ°
	if nTask_DL_State_60_1 >= 1 and nTask_DL_State_60_1 <= 5 or nTask_DL_State_60_2 >= 1 and nTask_DL_State_60_2 <= 4 then
		task_013_00()
		return
	end
	
	--Íê³ÉÖ£¹áÖ®µÄ»õ¿îÈÎÎñºóÁìÈ¡62¼¶ÈÎÎñ¿şÀÜ¶¾ÈË
	if nTask_DL_State_60_1 == 6 and nTask_DL_State_60_2 == 5 and nTask_DL_State_62 == 0 then
		task_016_00()
		return
	end
	
	--Î´Ç°ÍùÁúÑÛ¶´²é¿´
	if nTask_DL_State_62 == 1 then
		task_017_00()
		return
	end
	
	--Ç°ÍùÁúÑÛ¶´²é¿´ºó»ØÀ´»ã±¨
	if nTask_DL_State_62 == 2 then
		task_018_00()
		return
	end	

	--Î´É±ËÀ¿şÀÜ¶¾ÈËºÍò¿»ğ³¤ÀÏÇ°
	if nTask_DL_State_62 == 3 then
		task_019_00()
		return
	end
	
	--ÒÑ¾­É±ËÀ¿şÀÜ¶¾ÈËºÍò¿»ğ³¤ÀÏ
	if nTask_DL_State_62 == 4 then
		task_020_00()
		return
	end
	
	--Î´È¥¼ûÎå¶¾½Ì½ÌÖ÷
	if nTask_DL_State_62 == 5 then
		task_021_00()
		return
	end
	
	--Íê³ÉÊÕ¼¯´óÀí¾ÉÖ¾ºóÕÒÖ£¹áÖ®¶Ô»°
	if nTask_DL_State_75 == 6 then
		task_022_00()
		return
	end
	
	--Î´´ò°ÜÄ¦ºôÂŞåÈ¶Ô»°
	if nTask_DL_State_75 == 7 then
		task_023_00()
		return
	end
	
	--´ò°ÜÄ¦ºôÂŞåÈºó¶Ô»°
	if nTask_DL_State_75 == 8 then
		task_024_00()
		return
	end
	
	--Íê³ÉÄ¦ºôÂŞåÈÈÎÎñºó¶Ô»°
	if nTask_DL_State_75 >= 9 then
		local strTalk = {
			"Ng­¬i qu¶ lµ h¶o h¸n, c¶ TrŞnh téc ta mang ¬n <sex>.",
			}
		TalkEx("",strTalk);
		return
	end

	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	local strTalk = {
		"MÊy n¨m nay bu«n b¸n khã kh¨n, nÕu kh«ng ta ch¼ng ph¶i vÊt v¶ tõ Trung Nguyªn lÆn léi ®Õn n¬i nµy kiÕm sèng!",
		"§éc g× ghª thÕ! ChØ nghÜ th«i còng ®· thÊy sî, nÕu nh­ tróng ph¶i ch¾c tiªu m¹ng!"	
		}
	
	TalkEx("",strTalk);
	return
	
end;
