-----------------------------------------------------------------------
-- ½£ÏÀÇéÔµ II Ê¦ÃÅÈÎÎñ
-- 2006/05/16
-- Created by Tony(Jizheng)
-----------------------------------------------------------------------

-- ±í¸ñÎÄ¼şÀàµÄÖ§³ÖÒÔ¼°µØÍ¼Ìø×ªµÄÖ§³Ö
Include("\\script\\task\\random\\task_gotoworld.lua");
-- »Ô»ÍÖ®Ò¹Í·ÎÄ¼ş
Include("\\script\\shinynight_head.lua");
Include("\\script\\lib\\lingshi_head.lua");
--2006ÄêÊ¥µ®½Ú»î¶¯½±ÀøÖ§³Ö
Include("\\script\\online\\zgc_temp_fun.lua")
--2007ÄêÊ¥µ®»î¶¯
Include("\\script\\online\\newyear08\\newyear08_head.lua");
--2009Äê6ÔÂ7ÔÂ»î¶¯
Include("\\script\\online\\viet_event\\200907\\event_head.lua");
--Ô½ÄÏ09Äê7ÔÂ»î¶¯¿ª¹ØÍ·ÎÄ¼ş
Include("\\script\\online\\viet_event\\200907\\eventopen.lua");
Include("\\script\\lib\\writelog.lua");
--2009Äê8ÔÂ»î¶¯
Include("\\script\\online\\viet_event\\200908\\viet0908_head.lua");
--2009Äê9ÔÂ»î¶¯
Include("\\script\\online\\viet_event\\200909\\event_head.lua");
--2009Äê11ÔÂ»î¶¯
Include("\\script\\online\\viet_event\\200911\\event_head.lua");
--2009Äê12ÔÂ»î¶¯
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

--´Ó2010Äê¿ªÊ¼Ô½ÄÏÊ¦ÃÅÈÎÎñµÃ½±ÀøÍ³Ò»ÔÚÏÂÃæ°üº¬Õâ¸öÎÄ¼şÀïÃæÊµÏÖ£¬È»ºóÔÚ±¾ÎÄ¼şÀïÃæµ÷ÓÃ£¬²»ÓÃÃ¿´Î¶¼ĞŞ¸ÄÕâ¸öÎÄ¼ş
Include("\\script\\online_activites\\award.lua");--for Give_Faction_Award()
Include("\\script\\online\\viet_event\\vng_task_control.lua")
Include("\\script\\vng\\award\\feature_award.lua");

--========================================================================

TT_COLLECT_ITEM = 1				-- ÊÕ¼¯Ò»¶¨ÎïÆ·²¢ÇÒÒªÇóÉÏ½»£¬À´Ô´ÊÇ´ò¹ÖµôÂä
TT_KILL_MONSTER = 2				-- É±ËÀÒ»¶¨ÊıÁ¿µÄÌØ¶¨¹ÖÎï
TT_UPGRAGE_ATTR = 3				-- Éı¼¶Ò»¶¨ÊıÖµµÄÌØ¶¨ÊôĞÔ£¨±ÈÈç¾­Ñé£¬ÉùÍû£¬µÈ¼¶£¬PKÖµµÈµÈ£©
TT_SHOWOFF_ITEM = 4				-- ÊÕ¼¯ÎïÆ·£¬µ«ÊÇÀ´Ô´¾ÍÊÇÉÌµê
TT_SEND_MAIL = 5				-- ÓëÄ³NPC¶Ô»°

-- ÈÎÎñ±äÁ¿¼ÇÂ¼±í -----------------------------------------------------------------------------
TASKVALUE_CUR_DATE_ID = 333			-- µ±Ç°Ê¦ÃÅÈÎÎñ´¦ÓÚµÄÊ±¼äÈÕÆÚ YYYYMMDD£¬ÓÃÓÚÇå³ı334±äÁ¿ÊıÖµ
TASKVALUE_FACTION_CONTRI_CUR_DAY_ID = 334	-- µ±Ìì»ñµÃµÄÊ¦ÃÅ¹±Ï×¶È´æ·ÅµÄÈÎÎñ±äÁ¿
TASKVALUE_DIFFICULT_LEVEL_ID = 335	-- µ±Ç°Ñ¡ÔñµÄÊ¦ÃÅÈÎÎñµÄÄÑ¶ÈµÈ¼¶
TASKVALUE_FACTION_CONTRI_ID = 336	-- Ê¦ÃÅ¹±Ï×¶È´æ·ÅµÄÈÎÎñ±äÁ¿

-- 337 - 340 Ê¦ÃÅÈÎÎñÁ´ÓÃµÄÈÎÎñ±äÁ¿
-- 341 - 344 ÉÌ»áÈÎÎñÁ´µÄÈÎÎñ±äÁ¿

LAST_USE_DATE = 85			-- Ê¦ÃÅÁîÊéÉÏ´ÎÊ¹ÓÃµÄÈÕÆÚ
MULTI_COUNT = 86			-- µ±Ç°¼Ó³É±¶Êı

TASKVALUE_FACTION_EVENT_ID = 345	-- Ê¦ÃÅÈÎÎñ´óÊÂ¼şµÄÈÎÎñID´æ·ÅµÄÈÎÎñ±äÁ¿
TASKVALUE_CUR_DAY_TIMES_ID = 346	-- ½ñÌì×öÁË¼¸´ÎÊ¦ÃÅÈÎÎñµÄ¼ÍÂ¼
-- 347 ÒÑ¾­±»ÓÃ£¬Ê¦ÃÅÈÎÎñĞèÒªÉ±¹ÖµÄÊıÁ¿

TASKVALUE_LAST_CARD_CONTRIBUTE_ID = 348			-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅÁîÅÆÊ±ºòµÄÊ¦ÃÅ¹±Ï×¶ÈÊıÖµ¼ÇÂ¼µÄÈÎÎñ±äÁ¿
TASKVALUE_LAST_GET_EVENT_DATE_ID = 349			-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅ´óÊÂ¼şµÄÊ±¼ä¶Î¿ªÊ¼ÈÕÆÚ
TASKVALUE_GET_EVENT_TIMES_ID = 350				-- ±¾Ê±¼ä¶ÎÄÚÒÑ¾­³¢ÊÔÁìÈ¡Ê¦ÃÅ´óÊÂ¼şµÄ´ÎÊı
TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID = 351	-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅ´óÊÂ¼ş½±ÀøµÄÊ±¼ä¶Î¿ªÊ¼ÈÕÆÚ
TASKVALUE_GET_EVENT_PRIZE_TIMES_ID = 352		-- ±¾Ê±¼ä¶ÎÄÚÒÑ¾­³¢ÊÔÁìÈ¡Ê¦ÃÅ´óÊÂ¼ş½±ÀøµÄ´ÎÊı

-- ÈÎÎñ±äÁ¿¼ÇÂ¼±í end--------------------------------------------------------------------------

TASK_ID_SHAOLIN_SUJIA = 1		-- ÉÙÁÖË×¼Ò£¬Èı¸öÄÑ¶È¾ÍÊÇ 1 2 3
TASK_ID_SHAOLIN_CHANSENG = 4	-- ÉÙÁÖìøÉ®£¬Èı¸öÄÑ¶È¾ÍÊÇ 4 5 6
TASK_ID_SHAOLIN_WUSENG = 7		-- ÉÙÁÖÎäÉ®£¬Èı¸öÄÑ¶È¾ÍÊÇ 7 8 9

TASK_ID_DEFAULT_ROUTE = 10		-- È¡ÏûÈÎÎñ»òÕßÆäËûµÄÖ»ĞèÒªºÍÉÌ»áÈÎÎñÇø±ğ¿ªÊ¹ÓÃµÄÈÎÎñÁ´ID

TASK_ID_WUDANG_DAOJIA = 12		-- Îäµ±µÀ¼Ò£¬Èı¸öÄÑ¶È¾ÍÊÇ 12 13 14
TASK_ID_WUDANG_SUJIA = 15		-- Îäµ±Ë×¼Ò£¬Èı¸öÄÑ¶È¾ÍÊÇ 15 16 17

TASK_ID_EMEI_FOJIA = 18			-- ¶ëáÒ·ğ¼Ò£¬Èı¸öÄÑ¶È¾ÍÊÇ 18 19 20
TASK_ID_EMEI_SUJIA = 21			-- ¶ëáÒË×¼Ò£¬Èı¸öÄÑ¶È¾ÍÊÇ 21 22 23

TASK_ID_TANGMEN = 24			-- ÌÆÃÅ,Èı¸öÄÑ¶È¾ÍÊÇ 24 25 26

TASK_ID_GAIBANG_JINGYI = 27		-- Ø¤°ï¾»ÒÂ, Èı¸öÄÑ¶È¾ÍÊÇ 27 28 29
TASK_ID_GAIBANG_WUYI = 30		-- Ø¤°ïÎÛÒÂ, Èı¸öÄÑ¶È¾ÍÊÇ 30 31 32

TASK_ID_YANGMEN_QIANGQI = 33	-- ÑîÃÅÇ¹Æï, Èı¸öÄÑ¶È¾ÍÊÇ 33 34 35
TASK_ID_YANGMEN_GONGQI = 36		-- ÑîÃÅ¹­Æï, Èı¸öÄÑ¶È¾ÍÊÇ 36 37 38

TASK_ID_WUDU_XIEXIA = 39		-- Îå¶¾Ğ°ÏÀ, Èı¸öÄÑ¶È¾ÍÊÇ 39 40 41
TASK_ID_WUDU_GUSHI = 42			-- Îå¶¾¹ÆÊ¦, Èı¸öÄÑ¶È¾ÍÊÇ 42 43 44

TASK_ID_KUNLUN_TIANSHI = 45		-- À¥ÂØÌìÊ¦, Èı¸öÄÑ¶È¾ÍÊÇ 45 46 47

TASK_ID_CUIYAN_WUXIAN = 48		-- ´äÑÌÎèÏÉ, Èı¸öÄÑ¶È¾ÍÊÇ 48 49 50
TASK_ID_CUIYAN_LINGNV = 51		-- ´äÑÌÁéÅ®, Èı¸öÄÑ¶È¾ÍÊÇ 51 52 53

TASK_ID_MINGJIAO_SHENGZHAN = 54		-- Ã÷½ÌÊ¥Õ½, Èı¸öÄÑ¶È¾ÍÊÇ 54 55 56
TASK_ID_MINGJIAO_XUEREN = 57		-- Ã÷½ÌÑªÈË, Èı¸öÄÑ¶È¾ÍÊÇ 57 58 59
TASK_ID_MINGJIAO_ZHENBING = 60		-- Ã÷½ÌÕó±ø, Èı¸öÄÑ¶È¾ÍÊÇ 60 61 62

--========================================================================


-- Ê¦ÃÅÈÎÎñµÄÈë¿Ú£¬nFactionRouteNo´ú±íÉÏÃæµÄÍæ¼ÒÁ÷ÅÉ£¬Ñ¡ÈÎÎñÓÃµÄ¡£
function task_main_entrance(nFactionRouteNo)
	if GetReputation() < 5 then
		Msg2Player("Ph¶i cã ®iÓm danh väng tõ 5 trë lªn míi cã thÓ nhËn nhiÖm vô S­ m«n!")
		return
	end
	local nTaskState = GetChainTaskStatus(nFactionRouteNo)
	-- µ±Ç°µÈ¼¶µÄÉùÍûÏŞÖÆ
	local nFactionReputationLimit = 0;
	local nLevel = GetLevel()
	local nCurContriEEE = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- µ±Ç°Ê¦ÃÅ¹±Ï×¶È
	local nCreateTime = GetCreateTime()
	
	-- 1150732800 ÊÇ2006Äê6ÔÂ20ÈÕ£¬Õâ¸öÊ±¼äÒÔÇ°½¨Á¢µÄ½ÇÉ«¶¼¿ÉÒÔÁìÈ¡²¹³¥
	if (nCreateTime < 1150732800) then
		if (nLevel < 60) then
			nFactionReputationLimit = 0
		elseif (nLevel < 70) then
			nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
			nFactionReputationLimit = floor(nFactionReputationLimit / 3)
		elseif (nLevel < 80) then
			nFactionReputationLimit = 1000
		else
			nFactionReputationLimit = 1500
		end
	end
	gf_WriteLogEx("Nhiem vu Su Mon", "tham gia")
	-- »¹Ã»ÓĞ½Ó¹ıÈÎÎñ
	if (nTaskState == 0) then		
		if ((nCurContriEEE == 0) and (nFactionReputationLimit > 0) and GetTask(TASKVALUE_DIFFICULT_LEVEL_ID) == 0) then	-- µÚÒ»´Î½ÓÈÎÎñ
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, nFactionReputationLimit)
			Msg2Player("C¨n cø theo ®¼ng cÊp, phÇn th­ëng ®é cèng hiÕn cho lÇn ®Çu lµm nhiÖm vô s­ m«n lµ"..nFactionReputationLimit.." ®iÓm")
		end
		get_new_task(nFactionRouteNo)
		
	-- ÒÑ¾­½Óµ½ÈÎÎñµ«ÊÇ»¹Ã»ÓĞÍê³É		
	elseif (nTaskState == 1) then	
		process_cur_task(nFactionRouteNo)
		
	-- ÒÑ¾­Íê³ÉÁËÉÏ´Î½Óµ½µÄÈÎÎñ
	elseif (nTaskState == 2) then	
		get_next_task(nFactionRouteNo)
	end
end;



-- Íæ¼ÒÑ¡ÔñÍË³ö¶Ô»°
function cancel_dialog()
end;



-- Ñ¡ÔñÁËÒ»¸öÈÎÎñ¸øÍæ¼Ò£¬ÒÑ¾­¼Óµ½ÉíÉÏÁË£¬Íæ¼Ò¿ÉÒÔÑ¡ÔñÊÇ×ö»¹ÊÇ²»×ö
function get_one_task(task_link_id)

	--		          Äê	       ÔÂ	       ÈÕ	       Ê±	       ·Ö	       Ãë
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- ÉÏ´Î½ÓÈÎÎñµÄÈÕÆÚ
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- ÉèÖÃĞÂµÄÈÕÆÚ
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- Çå¿Õµ±Ìì»ñµÃµÄÊ¦ÃÅ¹±Ï×¶È
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- Çå¿Õµ±Ìì×öÁËµÄÊ¦ÃÅÈÎÎñ´ÎÊı
	end
	-- Modify by Trungbt
	local tbCheckType = {3, 6, 9, 12, 14, 17, 20, 23, 26, 29, 32, 35, 38, 41, 44}
	--Msg2Player("Gia tri check ID:  "..task_link_id)
	for i = 1, getn(tbCheckType) do
		if task_link_id == tbCheckType[i] then
			SetTask(TSK_CSD_ALLOW, 1)
			break
		end

	end
	------------------------

	-- ¼ì²é½ñÌì´ÎÊı¹»ÁËÃ»ÓĞ£¬¹»5´Î¾Í²»ÈÃ¼ÌĞø×öÁË - Jeep tag ÏÖÔÚ²»¼ì²éÁË
	--local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)
	--if (nCurDayTimes >= 5) then
	--	Say("ÎªÊ¦¸Õ¸Õ²é¿´¹ıÁËÄã×ö¹ıµÄÈÎÎñ£¬½ñÈÕÄãÎªÊ¦ÃÅ·îÏ×µÄ¹±Ï×¶ÈÒÑ¾­×ã¹»¡£ÎªÊ¦¾Í²»ÔÙÅÉ¸øÄã¸ü¶àÈÎÎñÁË£¬Äã»¹ÊÇÃ÷ÈÕÔÙÀ´°É£¡", 0)
	--	return
	--end

	-- ·ñÔò...
	-- Ñ¡È¡Ò»¸ö±¾Á÷ÅÉµÄËæ»úÈÎÎñ£¬²¢ÇÒ·µ»ØÈÎÎñÀàĞÍ
	local nTaskType = SelectRandomTask(task_link_id)
	SetTask(TASKVALUE_DIFFICULT_LEVEL_ID, task_link_id)
	
	-- ÏÖÔÚÊ¦ÃÅÈÎÎñ¾ÍÊÇÉ±¹Ö
	if (nTaskType == TT_KILL_MONSTER) then
		strAnswer = {"§Ö tö ®ång ı!/confirm_accept_task",
					 "§Ö tö thùc lùc cßn kĞm, ®Ó luyÖn mét thêi gian ®·!/cancel_task"}

		-- Ëæ»úÑ¡ÔñÒ»¸ö·¢ÈÎÎñµÄ»°£¬¹ş¹ş£¬²ß»®Ìî±í»áÓĞÂùÍ´¿àÑ½£¡ Amen.	
		local nSel = random(1, 3)
		local strTaskInfo = GetInfo(task_link_id, nSel)
		local strAnswer = {
			"§Ö tö ®ång ı!/confirm_accept_task",
			"§Ö tö thùc lùc cßn kĞm, ®Ó luyÖn mét thêi gian ®·!/cancel_task",
		}
		Say(strTaskInfo, getn(strAnswer), strAnswer);
	end
end;



-- È·ÈÏ½ÓÊÜÊ¦¸µ·ÖÅäµÄÈÎÎñ£¬²¢ÇÒÑ¡ÔñÊÇ·ñÖ±½ÓÈ¥ÈÎÎñËùÔÚµØ
function confirm_accept_task()
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
	-- ÔÚµØÍ¼±íÖĞÄÜ¹»µÃµ½ÒªÈ¥µÄµØÍ¼
	if ((nMapIndex ~= 0) and (nMapIndex ~= nil)) then
		Say("Ng­¬i nhËn ®­îc 1 nhiÖm vô s­ m«n, muèn ®Õn ®ã kh«ng?",
			2,
			"PhiÒn s­ phô ®­a ®Ö tö ®Õn n¬i lµm nhiÖm vô!/#gotoWorld("..nMapIndex..")",
			"§a t¹ s­ phô! §Ö tö sÏ tù ®i!/cancel_dialog");
	else
		TaskTip("B¹n nhËn ®­îc 1 nhiÖm vô s­ m«n!");
	end
	Msg2Player("B¹n nhËn ®­îc 1 nhiÖm vô s­ m«n!");
end;



-- Íæ¼ÒÈ·ÈÏÒªÈ¡Ïû·ÖÅä¸ø×Ô¼ºµÄÈÎÎñ£¬½øĞĞ¿Û³ıÉùÍûºÍÇå³ıÈÎÎñµÄ²Ù×÷
function confirm_cancel_task()
	-- Ê¦ÃÅ¹±Ï×¶È×ã¹»¿Û¾ÍÈÃËûÈ¡Ïû
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if (nCurFactionContribute >= 5) then			
		-- ÒòÎªËùÓĞÊ¦ÃÅÈÎÎñ¶¼ÊÇ¹«ÓÃÒ»¶ÎÈÎÎñ±äÁ¿¼ÇÂ¼µÄ
		-- ËùÒÔÕâÀïÖ»Òª²»ÊÇÉÌ»áÈÎÎñµÄ11¾Í¿ÉÒÔÁË
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 5)
		Say("NhiÖm vô ®· hñy, b¹n cã thÓ nhËn nhiÖm vô míi.", 0);
		Msg2Player("B¹n bŞ tæn thÊt 5 ®iÓm cèng hiÕn do hñy nhiÖm vô!");
		TaskTip("B¹n bŞ tæn thÊt 5 ®iÓm cèng hiÕn do hñy nhiÖm vô!");
		SetTask(TSK_CSD_ALLOW,0)	-- Modify by Trungbt	
	-- Ê¦ÃÅ¹±Ï×¶È²»¹»¿Û
	else
		CleanTask(TASK_ID_DEFAULT_ROUTE)
		SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
		Say("NhiÖm vô ®· hñy, b¹n cã thÓ nhËn nhiÖm vô míi.", 0);
		Msg2Player("§é cèng hiÕn gi¶m xuèng 0 do b¹n ®· hñy nhiÖm vô!");
	end
end;



-- Íæ¼ÒÒªÇóÈ¡Ïû·ÖÅä¸ø×Ô¼ºµÄÈÎÎñ£¬Ê¦¸µ»á½ÌÓıËûÊÇ·ñÔ¸Òâ£¬ÒòÎª»áËğÊ§Ê¦ÃÅ¹±Ï×¶ÈµÄ
function cancel_task()
	Say("<color=yellow>Hñy bá nhiÖm vô<color> sÏ ¶nh h­ëng tíi <color=yellow>®é cèng hiÕn s­ m«n<color>, ng­¬i muèn hñy nhiÖm vô nµy kh«ng?",
		2,
		"NhiÖm vô nµy ta kh«ng muèn lµm!/confirm_cancel_task",
		"§Ó ta suy nghÜ l¹i!/cancel_dialog");
end;

-- Íæ¼ÒÔÚÖ´ĞĞÈÎÎñÖĞÒªÇóÈ¡ÏûÈÎÎñ£¬Ê¦¸µ»á¸øËûÔÙÈ·ÈÏÒ»´Î
function cancel_processing_task()
	Say("<color=yellow>Hñy bá nhiÖm vô<color> sÏ ¶nh h­ëng tíi <color=yellow>®é cèng hiÕn s­ m«n<color>. Ng­¬i muèn hñy bá thËt ­?",
		2,
		"NhiÖm vô nµy ta kh«ng muèn lµm!/confirm_cancel_task",
		"Cho ta thªm c¬ héi!/cancel_dialog");
end;

-- µÚÒ»´Î½ÓÈÎÎñ£¬Íæ¼ÒÑ¡ÔñÒª×öÊ²Ã´ÄÑ¶ÈµÄÈÎÎñ
function get_new_task(nFactionRouteNo)
	task_link_id_low = nFactionRouteNo;
	task_link_id_middle = nFactionRouteNo + 1;
	task_link_id_high = nFactionRouteNo + 2;
	
	strTalk = {"Kh¸ l¾m! §Ó xem ng­¬i gióp ®­îc g× cho s­ m«n!",
			   "\n NhiÖm vô s¬ cÊp (PhÇn th­ëng kinh nghiÖm vµ ®é cèng hiÕn)./#get_one_task("..task_link_id_low..")",
			   "\n NhiÖm vô trung cÊp (PhÇn th­ëng tu luyÖn vµ ®é cèng hiÕn)./#get_one_task("..task_link_id_middle..")",
			   "\n NhiÖm vô cao cÊp (PhÇn th­ëng ®é cèng hiÕn)./#get_one_task("..task_link_id_high..")",
			   "\n §Ö tö kh«ng thÓ ®¶m nhËn, cÇn ph¶i rÌn luyÖn thªm!/cancel_dialog"}
	
	-- °´Íæ¼ÒµÄµÈ¼¶£¬ÄÜ½Óµ½µÄÈÎÎñµÄÄÑ¶ÈµÈ¼¶Ò²ÓĞ²»Í¬
	local nCurPlayerLevel = GetLevel()
	if (nCurPlayerLevel < 30) then
		Say(strTalk[1], 2, strTalk[2], strTalk[5]);
	elseif (nCurPlayerLevel < 60) then
		Say(strTalk[1], 3, strTalk[2], strTalk[3], strTalk[5]);
	else
		Say(strTalk[1], 4, strTalk[2], strTalk[3], strTalk[4], strTalk[5]);
	end
end;



-- ÕıÔÚÖ´ĞĞÈÎÎñµÄÊ±ºòºÍÊ¦¸µ¶Ô»°
function process_cur_task(nFactionRouteNo)
		-- »ñÈ¡¸ÃÈÎÎñµÄµØÍ¼ ID
		local nMapIndex = tonumber(GetCurTaskLinkMapIndex(TASK_ID_DEFAULT_ROUTE));
		
		local strTalk = {"Ng­¬i lµm xong nhiÖm vô vi s­ giao ch­a?",
						 "Nh÷ng nhiÖm vô ta giao, ng­¬i lµm ®Õn ®©u råi?",
						 "Nhê s­ phô kiÓm tra sè nhiÖm vô ®Ö tö ®· lµm./faction_event_finish",
						 "NhiÖm vô lËp l¹i lÇn nµy ®· hoµn thµnh!/confirm_finish_task",
						 "§Ö tö kĞm cái kh«ng thÓ ®¶m nhËn, xin ®­îc hñy nhiÖm vô!/cancel_faction_event",
						 "§Ö tö kĞm cái kh«ng thÓ ®¶m nhËn, xin ®­îc hñy nhiÖm vô!/cancel_processing_task",
						 "Xin s­ phô cho thªm İt thêi gian, hiÖn ch­a hoµn thµnh/cancel_dialog"}
	
		if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
			Say(strTalk[1], 3, strTalk[4], strTalk[6], strTalk[7]);
		else
			Say(strTalk[2], 5, strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
		end
end;



-- Ê¦¸µËµÄãÊÇ·ñÍê³ÉÁËÈÎÎñ£¬Í½µÜ»Ø´ğËµÒÑ¾­Íê³ÉÁËµÄ
function confirm_finish_task()
	-- ²ì¿´ÊÇ·ñÒÑ¾­Íê³ÉÁËÈÎÎñ
	if GetReputation() < 5 then
		Msg2Player("Ph¶i cã ®iÓm danh väng tõ 5 trë lªn míi cã thÓ tr¶ nhiÖm vô S­ m«n!")
		return
	end
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurTaskLinkID = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)	-- µ±Ç°ÄÑ¶ÈµÈ¼¶
	local nTaskFinish = QueryTaskFinish(nCurTaskLinkID)
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()	-- µ±Ç°µÈ¼¶µÄÉùÍûÏŞÖÆ
	local nLevel = GetLevel();

	-- »Ô»ÍÖ®Ò¹½±Àø·­±¶µÄ±¶ÂÊ
	local multiple = get_reward_multiple(SYS_MASTER_REPEATTASK)
	local nPerCent = floor(100 * multiple)				-- ½±ÀøµÄ°Ù·Ö±È
	nBaseDayLimit = floor(nBaseDayLimit * multiple)
	nExtraDayLimit = floor(nExtraDayLimit * multiple)

	-- Modify by Trungbt
--	if GetTask(TSK_CSD_ALLOW) == 1 then
--		local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
--		if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
--			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + 1)
--		end
--		SetTask(TSK_CSD_ALLOW, 0)
--	end
	HoanThanhNhiemVuSuMon()
	------------------------------------

	local bExtra = 0;
	local nDayReputationLimit = nBaseDayLimit

	-- ¼ì²éÍæ¼ÒÊÇ·ñÊÇ¸ß¼¶ÈÎÎñÄÑ¶È	
	if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		(nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		(nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		(nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		(nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		(nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		(nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		(nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN + 2) or
		(nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN + 2) or
		(nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING + 2)) then
		
		bExtra = 1
		nDayReputationLimit = nExtraDayLimit
	end

	--¼ÇÂ¼½ñÌìµÄÊ±¼ä£¬ÓÃÀ´È·ÈÏ½ñÌìÊÇ·ñ»¹¿ÉÒÔÁìÈ¡Ê¦ÃÅ¹±Ï×¶È
	--		          Äê	       ÔÂ	       ÈÕ	       Ê±	       ·Ö	       Ãë
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- ÉÏ´Î½ÓÈÎÎñµÄÈÕÆÚ
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- ÉèÖÃĞÂµÄÈÕÆÚ
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- Çå¿Õµ±Ìì»ñµÃµÄÊ¦ÃÅ¹±Ï×¶È
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- Çå¿Õµ±Ìì×öÁËµÄÊ¦ÃÅÈÎÎñ´ÎÊı
	end

	if (nTaskFinish == 1) then
		local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID) + 1
		if nCurDayTimes == 5 then	--µÚ5´ÎÍê³É½±ÁéÊ¯Åä·½
			local nPFLevel = 0;
			if nLevel < 30 then
				nPFLevel = 1
			elseif nLevel < 40 then
				nPFLevel = random(1,2);
			elseif nLevel < 50 then
				nPFLevel = random(1,3);
			elseif nLevel < 60 then
				nPFLevel = random(1,4);
			elseif nLevel < 80 then
				nPFLevel = random(1,5);
			elseif nLevel <= 100 then
				nPFLevel = random(2,5);
			end;
            if GetAntiEnthrallmentStatus() == 0 then
    			if nPFLevel ~= 0 then
    				lspf_AddPeiFangInBottle(nPFLevel,1);
    				Msg2Player("B¹n nhËn ®­îc 1 "..nPFLevel.."Phèi chÕ linh th¹ch cÊp, ®· cho vµo Tô Linh ®Ønh");
                end;
			end;
		end;		
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- ¸üĞÂ½ñÌìÒÑ¾­×öÁËµÄÈÎÎñ´ÎÊı
		if get_chrims_state() == 1 then
			if nCurDayTimes == 1 or nCurDayTimes == 2 then
				local nRand1 = random(getn(tStrewTask)-9,getn(tStrewTask));
				local nRand2 = random(getn(tStrewTask)-9,getn(tStrewTask));
				AddItem(tStrewTask[nRand1][3],tStrewTask[nRand1][4],tStrewTask[nRand1][5],tStrewTask[nRand1][1]);
				AddItem(tStrewTask[nRand2][3],tStrewTask[nRand2][4],tStrewTask[nRand2][5],tStrewTask[nRand2][1]);
				Msg2Player("B¹n nhËn ®­îc "..tStrewTask[nRand1][2].."ThiÖp chóc mõng"..tStrewTask[nRand1][1].."Tr­¬ng");	
				Msg2Player("B¹n nhËn ®­îc "..tStrewTask[nRand2][2].."ThiÖp chóc mõng"..tStrewTask[nRand2][1].."Tr­¬ng");
			end
		end	
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, nCurDayTimes)	-- ¸üĞÂ½ñÌìÒÑ¾­×öÁËµÄÈÎÎñ´ÎÊı
	        local nFactionNum = GetTask(VET_201009_00_TASK_NUM_FACTION)
                if ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING )) then
                    if mod(nFactionNum,10) == 0 then
                        nFactionNum = nFactionNum + 1
                    end
		elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 1) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 1) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 1) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 1) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 1) or
		    		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+1) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+1 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+1 )) then
                    if mod(floor(nFactionNum/10),10) == 0 then
                        nFactionNum = nFactionNum + 10
                    end
                elseif ((nCurTaskLinkID == TASK_ID_SHAOLIN_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_CHANSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_SHAOLIN_WUSENG + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDANG_DAOJIA + 2) or
                    (nCurTaskLinkID == TASK_ID_WUDANG_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_FOJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_EMEI_SUJIA + 2) or
		    (nCurTaskLinkID == TASK_ID_TANGMEN + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_JINGYI + 2) or
		    (nCurTaskLinkID == TASK_ID_GAIBANG_WUYI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_QIANGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_YANGMEN_GONGQI + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_XIEXIA + 2) or
		    (nCurTaskLinkID == TASK_ID_WUDU_GUSHI + 2) or
		    (nCurTaskLinkID == TASK_ID_KUNLUN_TIANSHI+2) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_WUXIAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_CUIYAN_LINGNV+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_SHENGZHAN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_XUEREN+2 ) or
		    (nCurTaskLinkID == TASK_ID_MINGJIAO_ZHENBING+2 )) then
                    if mod(floor(nFactionNum/100),10) == 0 then
                        nFactionNum = nFactionNum + 100
                    end
	        end
                --Ã¿´Î»î¶¯¸ø½±Àø¶¼µ÷ÓÃ´Ëº¯Êı£¬²»ÔÙÏñÒÔÇ°Ò»ÑùÃ¿´Î»î¶¯¶¼Ğ´Ò»¸öº¯ÊıÀ´¸ø½±Àø
                SetTask(VET_201009_00_TASK_NUM_FACTION,nFactionNum)
                Give_Faction_Award();--from "\script\online_activites\award.lua"
		
		
        if GetAntiEnthrallmentStatus() == 0 then
            FinishTaskStep(nCurTaskLinkID, 0, nPerCent)			-- ½áÊøµ±Ç°ÈÎÎñ²¢ÇÒ·¢½±
        elseif GetAntiEnthrallmentStatus() == 1 then
            FinishTaskStep(nCurTaskLinkID, 0, floor(nPerCent/2))			-- 3Ğ¡Ê±·À³ÁÃÔ×´Ì¬¸øÒ»°ë½±Àø
        else
            --5Ğ¡Ê±·À³ÁÃÔ×´Ì¬²»¸ø½±Àø
        end
		-- Ê¦Í½ÈÎÎñ £¨Ê¦ÃÅ£©
		local nChance, nMaxChance = CustomDataRead("mp_shimen")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shimen", "dd", nChance, nMaxChance)
				Msg2Player("NhiÖm vô S­ ®å- t×nh h×nh hoµn thµnh S­ m«n-:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		-- Õë¶ÔÏŞÖÆÒª¶Ô»ñµÃµÄÉùÍû½øĞĞ´¦Àí
		-- Ôö¼ÓºóµÄÊ¦ÃÅ¹±Ï×¶È
		local nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		-- ½ñÌìÒÑ¾­»ñµÃµÄÊ¦ÃÅ¹±Ï×¶È
		local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
		
		-- Õâ´ÎÔö¼ÓµÄÊ¦ÃÅ¹±Ï×¶È
		local nAddedThisTimeContribute = nFactionContributeAfter - nCurFactionContribute
		
		-- ³¬¹ıÁËµ±ÌìÄÜ»ñµÃµÄÉùÍûµãÊı£¬¿Û»ØÈ¥
		if (nCurDayGainReputation > nDayReputationLimit) then
			local nShouldBeMinus = nCurDayGainReputation - nDayReputationLimit
			-- Èç¹ûÊÇ×öÁË¸ß¼¶ÈÎÎñÔÙ»ØÀ´×öµÍ¼¶ÈÎÎñ£¬ÄÇÃ´Ö»¼õÕâ´Î×öµÄÈÎÎñµÃµ½µÄÊ¦ÃÅ¹±Ï×¶È¡£
			if (nFactionContributeAfter - nShouldBeMinus < nCurFactionContribute) then
				nShouldBeMinus = nFactionContributeAfter - nCurFactionContribute
			end
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinus)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionContributeAfter - nShouldBeMinus)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinus
			if (bExtra == 1) then
				Msg2Player("H«m nay ng­¬i kh«ng thÓ nhËn thªm ®iÓm cèng hiÕn s­ m«n, mau ®i rÌn luyÖn thªm!")
			else
				Msg2Player("H«m nay ng­¬i kh«ng thÓ nhËn thªm ®iÓm cèng hiÕn s­ m«n nh­ng nÕu lµm thªm nh÷ng nhiÖm vô kh¸c còng ®­îc ®iÓm.")
			end
		end
		
		nFactionContributeAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)	-- ´¦ÀíºóµÄÊ¦ÃÅ¹±Ï×¶È
		if (nFactionContributeAfter < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_ID, 0)
			nFactionContributeAfter = 0
		end
		
		-- ³¬¹ıÁË±¾µÈ¼¶ÄÜ»ñµÃµÄ×î¶àÊ¦ÃÅ¹±Ï×¶È£¬¿Û»ØÈ¥
		if (nFactionContributeAfter > nFactionReputationLimit) then
			local nShouldBeMinuss = nFactionContributeAfter - nFactionReputationLimit
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation - nShouldBeMinuss)
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nFactionReputationLimit)
			nAddedThisTimeContribute = nAddedThisTimeContribute - nShouldBeMinuss
			Msg2Player("§¼ng cÊp hiÖn t¹i kh«ng thÓ nhËn thªm ®iÓm cèng hiÕn s­ m«n, lªn mét cÊp n÷a h·y quay l¹i.")
		end
		if GetReputation() >= 5 then
			ModifyReputation(-5, 0)
		else
			ModifyReputation(0 - GetReputation(), 0)
		end
		
		if (GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID) < 0) then
			SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)
		end
		
		-- Ê¦ÃÅÈÎÎñÆäËû½±Àø£º
		other_faction_prize();
		
		-- ÅĞ¶ÏÊÇ·ñ¿ÉÒÔ½Óµ½Ê¦ÃÅµÄÎäÁÖ´óÊÂ¼şÈÎÎñ£¬ÒªÃ»½Óµ½ÇÒÌõ¼şÂú×ã
		local bHaveOwnFactionEvent = GetTask(TASKVALUE_FACTION_EVENT_ID)
		if ((bHaveOwnFactionEvent == 0) and (check_faction_event_condition() == 1)) then
			if (StartFactionEvent() == 1) then
				local nSel = random(1, 4)
				local strTaskInfo = QueryFactionEventInfo(nSel)
				Say(strTaskInfo, 0);
			else
				Say("TiÕn bé nhanh l¾m! §Ó Vi S­ d¹y ng­¬i thªm chót vâ nghÖ!", 0)
			end
		else
			Say("TiÕn bé nhanh l¾m! §Ó Vi S­ d¹y ng­¬i thªm chót vâ nghÖ!", 0)
		end
		
		if (nAddedThisTimeContribute < 0) then
			nAddedThisTimeContribute = 0
		end

-- ===================Ê¦ÃÅÁîÊé¼Ó³É¼ÆËã===================================================		
		local nLastLingshuDate = GetTask(LAST_USE_DATE)			-- Ê¦ÃÅÁîÊéÉÏ´ÎÊ¹ÓÃµÄÈÕÆÚ
		local nMultiCount = GetTask(MULTI_COUNT)				-- µ±Ç°¼Ó³É±¶Êı
		if (nLastLingshuDate == nCurDate) then
			local nStillShouldPlus = nAddedThisTimeContribute * (nMultiCount - 1)
			local nNowFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
			nNowFactionContribute = nNowFactionContribute + nStillShouldPlus
			SetTask(TASKVALUE_FACTION_CONTRI_ID, nNowFactionContribute)
			nAddedThisTimeContribute = nAddedThisTimeContribute + nStillShouldPlus
		else
			SetTask(MULTI_COUNT, 1)
		end
-- ===================Ê¦ÃÅÁîÊé¼Ó³É¼ÆËã================================================end
		
		Msg2Player("NhiÖm vô lÇn nµy b¹n nhËn ®­îc  "..nAddedThisTimeContribute.." ®iÓm cèng hiÕn s­ m«n!")
	else
		Say("NhiÖm vô dÔ nh­ vËy mµ kh«ng lµm ®­îc! Ng­¬i qu¸ kĞm câi!", 0)
		--if (nCurFactionContribute > 0) then
		--	SetTask(TASKVALUE_FACTION_CONTRI_ID, nCurFactionContribute - 1)
		--end
	end
end;


-- ´¦ÓÚÍê³ÉÁËÉÏ¸öÈÎÎñµÄÇé¿öÏÂ£¬Ñ¯ÎÊÍæ¼ÒÊÇ·ñ¼ÌĞø×ö
function get_next_task(nFactionRouteNo)
	local nCurDifficulty = GetTask(TASKVALUE_DIFFICULT_LEVEL_ID)
	local strTalk = {"Kh¸ l¾m, cã muèn lµm thªm kh«ng? Hay muèn thö nhiÖm vô khã h¬n?",
					 "§Ö tö ®ång ı!/#get_one_task("..nCurDifficulty..")",
					 "NhiÖm vô nµy ®· hoµn thµnh, xin kiÓm tra l¹i/faction_event_finish",
					 "§Ö tö kĞm cái kh«ng thÓ ®¶m nhËn, xin ®­îc hñy nhiÖm vô!/cancel_faction_event",
					 "§Ö tö muèn nhËn nhiÖm vô khã h¬n/#get_new_task("..nFactionRouteNo..")",
					 "§Ö tö muèn xem §iÓm cèng hiÕn s­ m«n/query_faction_contribute",
					 "§Ö tö cßn kĞm cái muèn rÌn luyÖn thªm./cancel_dialog"}
	
	if (GetTask(TASKVALUE_FACTION_EVENT_ID) == 0) then
		Say(strTalk[1], 4, strTalk[2], strTalk[5], strTalk[6], strTalk[7])
	else
		Say(strTalk[1], 6, strTalk[2], strTalk[3], strTalk[4], strTalk[5], strTalk[6], strTalk[7]);
	end		 
end;

-- ²éÑ¯Íæ¼Òµ±Ç°µÄÊ¦ÃÅ¹±Ï×¶È
function query_faction_contribute()
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	-- µ±Ç°µÈ¼¶µÄÉùÍûÏŞÖÆ
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	Say("§é cèng hiÕn s­ m«n lµ <color=yellow>"..nCurFactionContribute.."<color>, ®¼ng cÊp hiÖn t¹i nhËn ®­îc ®iÓm cèng hiÕn tèi ®a lµ <color=yellow>"..nFactionReputationLimit.."<color>, cè lªn! Më giao diÖn F3 cã thÓ xem ®é cèng hiÕn s­ m«n.", 0)
end;

-- ¼ì²éÍæ¼ÒÊÇ·ñÒÑ¾­Íê³ÉÁËÎäÁÖ´óÊÂ¼şÈÎÎñ
function faction_event_finish()
	local bFinished = FinishFactionEvent()	-- ¼ì²éÊÇ·ñÍê³ÉÁËÊ¦ÃÅ´óÊÂ¼ş
	if (bFinished == 1) then
		--¼ÓÈë¿Õ¼ä¸ºÖØÅĞ¶Ï
		if get_free_room(1) ~= 1 then
			return 0;
		end
		local nBefore = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		faction_event_prize()
		local nAfter = GetTask(TASKVALUE_FACTION_CONTRI_ID)
		local nAdded = nAfter - nBefore
		
		Say("Lµm tèt l¾m! Cè lªn! Ng­¬i míi nhËn ®­îc <color=yellow>"..nAdded.."<color> ®iÓm c«ng hiÕn S­ M«n", 0)
	else
		Say("NhiÖm vô ta giao ng­¬i vÉn ch­a hoµn thµnh", 0)
	end
end;

-- ÅĞ¶ÏÊÇ·ñ¿ÉÒÔ½Óµ½ÎäÁÖ´óÊÂ¼ş
function check_faction_event_condition()
	--Íæ¼Ò´Ó50¼¶¿ÉÒÔ½Óµ½¸ÃÈÎÎñ
	local nLevel = GetLevel()
	if (nLevel < 50) then
		return 0
	end
	
	--¼ÇÂ¼½ñÌìµÄÊ±¼ä
	--		          Äê	       ÔÂ	       ÈÕ	       Ê±	       ·Ö	       Ãë
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅ´óÊÂ¼şµÄÊ±¼ä¶Î¿ªÊ¼ÈÕÆÚ
	local nLastGetEventDate = GetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID)
	-- ±¾Ê±¼ä¶ÎÄÚÒÑ¾­³¢ÊÔÁìÈ¡Ê¦ÃÅ´óÊÂ¼şµÄ´ÎÊı
	local nCurGetEventTimes = GetTask(TASKVALUE_GET_EVENT_TIMES_ID)
	
	if ((nCurDate - nLastGetEventDate) > 7) then
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_DATE_ID, nCurDate)
		if ((nCurGetEventTimes >= 10) and (nCurGetEventTimes < 40)) then	-- ÉÏ¸ö½×¶ÎÒÑ¾­×öÁË10´Î»¹Ã»ÓĞÁìµ½
			return 1
		end
	end
	
	-- ±¾ÖÜÒÑ¾­½Óµ½¹ıÁË
	if (nCurGetEventTimes >= 40) then
		return 0
	end
	
	--½ÓÊÜ´óÊÂ¼şÈÎÎñµÄ¸ÅÂÊÎªºã¶¨Öµ,¸ÅÂÊÎª3%,Ò»ÖÜÖ»ÄÜ½ÓÊÜÒ»´ÎÈÎÎñ.(²ÉÓÃÎ±Ëæ»ú)
	local nRate = random(0, 100)
	if (nRate < 3) then
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, 40)
		return 1
	else
		SetTask(TASKVALUE_GET_EVENT_TIMES_ID, nCurGetEventTimes + 1)
		return 0
	end
end;

-- Ê¦ÃÅÈÎÎñÍê³ÉÒÔºóµÄÆäËû½±Àø
function other_faction_prize()
-- Ã¿50µã¹±Ï×¶È Ê¦ÃÅÁîÅÆ Ò»¸ö

	-- ½ñÌì×öÁË¼¸´ÎÊ¦ÃÅÈÎÎñÁË
	local nCurDayTimes = GetTask(TASKVALUE_CUR_DAY_TIMES_ID)  
	-- ¾àÀëÉÏ´ÎÁìÊ¦ÃÅÁîÅÆÔö¼ÓÁË¶àÉÙÊ¦ÃÅ¹±Ï×¶È
	local nLastGetCard = GetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID)
	local nCurFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	if nCurFactionContribute < nLastGetCard then	--Èç¹ûµ±Ç°ÖµĞ¡ÓÚÉÏ´Î»ñµÃÁîÅÆÊ±µÄÖµ
		SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID,nCurFactionContribute);
		nLastGetCard = nCurFactionContribute;
	end;
	local nContributeAdded = nCurFactionContribute - nLastGetCard
	
	if (nContributeAdded >= 50) then
		if GetAntiEnthrallmentStatus() == 0 then
			send_a_faction_card()	-- ¸øÒ»¸öÊ¦ÃÅÁîÅÆ
			SetTask(TASKVALUE_LAST_CARD_CONTRIBUTE_ID, (nLastGetCard + 50))
			local nRoute = GetPlayerRoute();
			if nRoute >= 23 then
				Msg2Player("§iÓm cèng hiÕn s­ m«n cña ng­¬i ®­îc tİch lòy 50 ®iÓm");
			else
				Msg2Player("§é cèng hiÕn s­ m«n ®ñ 50 ®iÓm nhËn ®­îc lÖnh bµi s­ m«n!")
			end
		end
	end
	
	-- µ±ÌìµÚÒ»´ÎÍê³ÉÊ¦ÃÅÈÎÎñ
	if (nCurDayTimes == 1 or nCurDayTimes == 6) then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end		
		ModifyExp(nExpPrize)
		Msg2Player("Hoµn thµnh nhiÖm vô S­ m«n, nhËn ®­îc "..nExpPrize.." ®iÓm kinh nghiÖm!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s­ m«n lÇn thø "..nCurDayTimes)
	end
	
	--09Äê11ÔÂ»î¶¯¸ø¶îÍâ½±Àø
	
	if  nCurDayTimes == 10 then
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = nExpPrize + floor(nExpPrize/3)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("H«m nay lµ lÇn "..nCurDayTimes.." hoµn thµnh nhiÖm vô s­ m«n, nhËn ®­îc ®iÓm kinh nghiÖm céng thªm."..nExpPrize.." ®iÓm!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s­ m«n lÇn thø "..nCurDayTimes)
	else
		local nCurLevelOfExpPrize = GetLevel()
		local nExpPrize = 0
		if (nCurFactionContribute <= 3000) then
			nExpPrize = floor(nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize * 0.4)			
		else
			nExpPrize = nCurLevelOfExpPrize * nCurLevelOfExpPrize * nCurLevelOfExpPrize
		end
		nExpPrize = floor(nExpPrize/7)
		if GetAntiEnthrallmentStatus() == 1 then
			nExpPrize = floor(nExpPrize/2)
		elseif GetAntiEnthrallmentStatus() == 2 then
			nExpPrize = 0
		end	
		ModifyExp(nExpPrize)
		Msg2Player("H«m nay lµ lÇn "..nCurDayTimes.." hoµn thµnh nhiÖm vô s­ m«n, nhËn ®­îc ®iÓm kinh nghiÖm céng thªm."..nExpPrize.." ®iÓm!")
		WriteLogEx(VIET_0911_LOG_TITLE,"s­ m«n lÇn thø "..nCurDayTimes)
	end
	-------------Ê¥µ®½Ú»î¶¯½±ÀøÅÉ·¢-------------------
--		Xmas_prize_get(2)
	----------------------½áÊø-------------------------------
end;

-- Ê¦ÃÅ´óÊÂ¼şÍê³ÉÒÔºóµÄ½±Àø
function faction_event_prize()
	-- ¸øÍæ¼Ò¾­Ñé½±Àø£¬ÊıÖµÊÇÍæ¼ÒµÈ¼¶µÄÈı´Î·½
	local nPlayerLevelOfExp = GetLevel()
	local nShouldGiveExp = nPlayerLevelOfExp * nPlayerLevelOfExp * nPlayerLevelOfExp
	ModifyExp(nShouldGiveExp)
	Msg2Player("V× ®· cèng hiÕn cho S­ M«n, b¹n nhËn ®­îc"..nShouldGiveExp.." ®iÓm kinh nghiÖm!")
	
	-- ÊÇ·ñ»ñµÃÁËÃÅÅÉÃØ¼®
	local bGetSuperMisteryBook = 0

	--¼ÇÂ¼½ñÌìµÄÊ±¼ä
	--		          Äê	       ÔÂ	       ÈÕ	       Ê±	       ·Ö	       Ãë
	local nCurrTime = {date("%Y"), date("%m"), date("%d"), date("%H"), date("%M"), date("%S")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	local nLastTaskDate = GetTask(TASKVALUE_CUR_DATE_ID)					-- ÉÏ´Î½ÓÈÎÎñµÄÈÕÆÚ
	
	if (nLastTaskDate < nCurDate) then
		SetTask(TASKVALUE_CUR_DATE_ID, nCurDate)			-- ÉèÖÃĞÂµÄÈÕÆÚ
		SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, 0)		-- Çå¿Õµ±Ìì»ñµÃµÄÊ¦ÃÅ¹±Ï×¶È
		SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 0)				-- Çå¿Õµ±Ìì×öÁËµÄÊ¦ÃÅÈÎÎñ´ÎÊı
	end
	
	-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅ´óÊÂ¼ş½±ÀøµÄÊ±¼ä¶Î¿ªÊ¼ÈÕÆÚ
	local nLastGetSuperPrizeDate = GetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID)
	-- ±¾Ê±¼ä¶ÎÄÚÒÑ¾­³¢ÊÔÁìÈ¡Ê¦ÃÅ´óÊÂ¼ş½±ÀøµÄ´ÎÊı
	local nCurGetSuperPrizeTimes = GetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID)
		
	-- ÃÅÅÉ45¼¶ÃØ¼®,»ñµÃ¸ÅÂÊ12.5%,Á½¸öÔÂ(8ÖÜ,²»ÊÇÎïÀíÔÂ)Ò»¸öÈË¿ÉÒÔ»ñµÃ1±¾.(²ÉÓÃÎ±Ëæ»ú)
	if ((nCurDate - nLastGetSuperPrizeDate) >= 56) then	-- 28ÌìÒÔºóÁË
		SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 0)
		SetTask(TASKVALUE_LAST_GET_EVENT_PRIZE_DATE_ID, nCurDate)
	end
	
	local nLottos = random(0, 1000);
	if (nCurGetSuperPrizeTimes == 7) then		-- Ç°Æß´Î¶¼Ã»ÓĞÁìµ½£¬Õâ´ÎÒ»¶¨·¢
		really_get_a_super_mistery_book()
		bGetSuperMisteryBook = 1
	elseif (nCurGetSuperPrizeTimes < 7) then	-- Ëæ»ú12.5%µÄ¼¸ÂÊ¿ÉÄÜÄÃµ½Ê¦ÃÅÃØ¼®
		if (nLottos < 125) then
			really_get_a_super_mistery_book()
			bGetSuperMisteryBook = 1
		end
	end
	
	-- ÌìÏ¼,×ÏÏ¼,Õ³ÒÂ,ĞŞÂŞ,Îå¹í,²¹½ğ,²¹Ê¯¹²Îª87.5%,Ã¿´ÎÖ»¿ÉÄÜ»ñµÃÒ»±¾ÃØ¼®.
	-- ÒªÔÚÃ»ÓĞ»ñµÃÃÅÅÉÃØ¼®µÄÇé¿öÏÂÄÃµ½
	if (bGetSuperMisteryBook == 0) then
		if nLottos <= 800 then
			local nBookID = random(1, 7)
			if (nBookID == 1) then
				AddItem(0, 107, 64, 1)		-- ÌìÏ¼
			elseif (nBookID == 2) then
				AddItem(0, 107, 65, 1)		-- ×ÏÏ¼
			elseif (nBookID == 3) then
				AddItem(0, 107, 66, 1)		-- Õ³ÒÂ
			elseif (nBookID == 4) then
				AddItem(0, 107, 60, 1)		-- ĞŞÂŞ
			elseif (nBookID == 5) then
				AddItem(0, 107, 63, 1)		-- Îå¹í
			elseif (nBookID == 6) then
				AddItem(0, 107, 61, 1)		-- ²¹½ğ
			else
				AddItem(0, 107, 62, 1)		-- ²¹Ê¯
			end
		else
		 local	tMijiName = {
							{"Tø Linh ChiÕn ı Phæ",0,107,159},
							{"Tø Linh Thiªn ı Phæ",0,107,160},
							{"Tø Linh Tö ı Phæ",0,107,161}
						};	
		 local nRandtb = random(1,3);
		 AddItem(tMijiName[nRandtb][2],tMijiName[nRandtb][3],tMijiName[nRandtb][4],1);		
		end
	end
	
	-- Ê¦ÃÅÉùÍû½±Àø£¬½±Àø50µã
	-- µ±Ç°µÈ¼¶µÄÉùÍûÏŞÖÆ
	local nFactionReputationLimit, nBaseDayLimit, nExtraDayLimit = GetFactionRepuLimit()
	-- µ±Ç°µÄÊ¦ÃÅÉùÍû ºÍ ½ñÌìÒÑ¾­»ñµÃµÄÊ¦ÃÅÉùÍû
	local nFactionContribute = GetTask(TASKVALUE_FACTION_CONTRI_ID)
	local nCurDayGainReputation = GetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID)
	
	local nShouldAdd = 50
	nCurDayGainReputation = nShouldAdd + nCurDayGainReputation
	if (nCurDayGainReputation > nExtraDayLimit) then
		nShouldAdd = nShouldAdd - (nCurDayGainReputation - nExtraDayLimit)
		nCurDayGainReputation = nExtraDayLimit
	end
	
	SetTask(TASKVALUE_FACTION_CONTRI_ID, (nFactionContribute + nShouldAdd))
	SetTask(TASKVALUE_FACTION_CONTRI_CUR_DAY_ID, nCurDayGainReputation)
	--SetTask(TASKVALUE_CUR_DAY_TIMES_ID, 5)	-- ÉèÖÃ½ñÌì²»ÓÃ¼ÌĞø½ÓÊ¦ÃÅÈÎÎñÁË
	
	-- ¹ö¶¯¹«¸æ
	local strPlayerName = GetName()
	local strNews = "[NhiÖm vô s­ m«n]: Ng­êi ch¬i "..strPlayerName.."  Hoµn thµnh nhiÖm vô s­ m«n nhËn ®­îc quyÓn mËt tŞch."
--	AddGlobalNews(strNews)
end;

-- ÕæÕı¸ãµ½ÊÖÁËÒ»±¾Ê¦ÃÅ45¼¶ÃØ¼®
function really_get_a_super_mistery_book()
	SetTask(TASKVALUE_GET_EVENT_PRIZE_TIMES_ID, 4)
	
	local nFactionRoute = GetPlayerRoute()	-- »ñµÃÍæ¼ÒµÄÁ÷ÅÉÊı¾İ
	local nRate = random(0, 1)				-- ÄÄÒ»±¾ÃØ¼®
	
	if (nFactionRoute == 2) then			-- ÉÙÁÖË×¼Ò
		AddItem(0, 107, (1 + nRate), 1)		-- ½ğ¸Õ·üÄ§¾­ or ½ğ¸Õ·üÄ§ĞÄ·¨
	elseif (nFactionRoute == 3) then		-- ÉÙÁÖìø×Ú
		AddItem(0, 107, (5 + nRate), 1)		-- ÎŞ³¾ÃØ¼® or ÎŞ³¾ĞÄ·¨
	elseif (nFactionRoute == 4) then		-- ÉÙÁÖÎä×Ú
		AddItem(0, 107, (3 + nRate), 1)		-- Ç±ÁúÃØ¼® or Ç±ÁúĞÄ·¨
		
	elseif (nFactionRoute == 6) then		-- ÌÆÃÅ
		AddItem(0, 107, (7 + nRate), 1)		-- ÌìÂŞÃØ¼® or ÌìÂŞĞÄ·¨
		
	elseif (nFactionRoute == 8) then		-- ¶ëáÒ·ğ¼Ò
		AddItem(0, 107, (9 + nRate), 1)		-- ÈçÒâÃØ¼® or ÈçÒâĞÄ·¨
	elseif (nFactionRoute == 9) then		-- ¶ëáÒË×¼Ò
		AddItem(0, 107, (11 + nRate), 1)	-- ±Ìº£Æ× or ±Ìº£ĞÄ·¨
		
	elseif (nFactionRoute == 11) then		-- Ø¤°ï¾»ÒÂ
		AddItem(0, 107, (13 + nRate), 1)	-- »ìãçÃØ¼® or »ìãçĞÄ·¨
	elseif (nFactionRoute == 12) then		-- Ø¤°ïÎÛÒÂ
		AddItem(0, 107, (15 + nRate), 1)	-- ŞñÌìÃØ¼® or ŞñÌìĞÄ·¨
		
	elseif (nFactionRoute == 14) then		-- Îäµ±µÀ¼Ò
		AddItem(0, 107, (17 + nRate), 1)	-- »ÃÓ°ÃØ¼® or »ÃÓ°ĞÄ·¨
	elseif (nFactionRoute == 15) then		-- Îäµ±Ë×¼Ò
		AddItem(0, 107, (19 + nRate), 1)	-- ¾ı×ÓÃØ¼® or ¾ı×ÓĞÄ·¨
		
	elseif (nFactionRoute == 17) then		-- ÑîÃÅÇ¹Æï
		AddItem(0, 107, (21 + nRate), 1)	-- Õò¾üÃØ¼® or Õò¾üĞÄ·¨
	elseif (nFactionRoute == 18) then		-- ÑîÃÅ¹­Æï
		AddItem(0, 107, (23 + nRate), 1)	-- ´©ÔÆÃØ¼® or ´©ÔÆĞÄ·¨
		
	elseif (nFactionRoute == 20) then		-- Îå¶¾Ğ°ÏÀ
		AddItem(0, 107, (25 + nRate), 1)	-- ÓÄÚ¤¹íÂ¼ or ÓÄÚ¤ĞÄ·¨
	elseif (nFactionRoute == 21) then		-- Îå¶¾¹ÆÊ¦
		AddItem(0, 107, (27 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	elseif (nFactionRoute == 23) then		-- À¥ÂØÌìÊ¦
		AddItem(0, 107, (180 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	elseif (nFactionRoute == 25) then		-- Ã÷½ÌÊ¥Õ½
		AddItem(0, 107, (182 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	elseif (nFactionRoute == 26) then		-- Ã÷½ÌÕó±ø
		AddItem(0, 107, (184 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	elseif (nFactionRoute == 27) then		-- Ã÷½ÌÑªÈË
		AddItem(0, 107, (186 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	elseif (nFactionRoute == 29) then		-- ´äÑÌÎèÏÉ
		AddItem(0, 107, (188 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	elseif (nFactionRoute == 30) then		-- ´äÑÌÁéÅ®
		AddItem(0, 107, (190 + nRate), 1)	-- Áé¹ÆÃØ¼® or Áé¹ÆĞÄ·¨
	end
	
	Msg2Player("B¹n nhËn ®­îc 1 quyÓn mËt tŞch!")
end;

--¸øÓèÊ¦ÃÅ¸ß¼¶ÃØ¼®£¬ĞÂÃÅÅÉÒª¼Ó
function get_advanced_faction_book()
	local tGaojiMiji = {
				[0] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"TiÒm Long TŞch DiÖt Kinh",0,107,167},{"Thiªn La Liªn Ch©u Lôc",0,107,169},{"Nh­ ı Kim §Ønh MËt TŞch",0,107,170},{"Bİch H¶i TuyÖt ¢m Phæ",0,107,171},{"Hçn §én TrÊn Nh¹c MËt TŞch",0,107,172},{"Quü Thiªn Du Long MËt TŞch",0,107,173},{"HuyÔn ¶nh Mª Tung MËt TŞch",0,107,174},{"Qu©n Tö TiÖt Phong MËt TŞch",0,107,175},{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176},{"Xuyªn V©n L¹c Hång MËt TŞch",0,107,177},{"U Minh Phong Ma Lôc",0,107,178},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
				[1] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"TiÒm Long TŞch DiÖt Kinh",0,107,167}},
				[2] = {{"Kim Cang B¸t Nh· Kinh",0,107,166}},
				[3] = {{"V« TrÇn Bå §Ò Kinh",0,107,168}},
				[4] = {{"TiÒm Long TŞch DiÖt Kinh",0,107,167}},
				[5] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169}},
				[6] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169}},
				[7] = {{"Nh­ ı Kim §Ønh MËt TŞch",0,107,170},{"Bİch H¶i TuyÖt ¢m Phæ",0,107,171}},
				[8] = {{"Nh­ ı Kim §Ønh MËt TŞch",0,107,170}},
				[9] = {{"Bİch H¶i TuyÖt ¢m Phæ",0,107,171}},
				[10] = {{"Hçn §én TrÊn Nh¹c MËt TŞch",0,107,172},{"Quü Thiªn Du Long MËt TŞch",0,107,173}},
				[11] = {{"Hçn §én TrÊn Nh¹c MËt TŞch",0,107,172}},
				[12] = {{"Quü Thiªn Du Long MËt TŞch",0,107,173}},
				[13] = {{"HuyÔn ¶nh Mª Tung MËt TŞch",0,107,174},{"Qu©n Tö TiÖt Phong MËt TŞch",0,107,175}},
				[14] = {{"HuyÔn ¶nh Mª Tung MËt TŞch",0,107,174}},
				[15] = {{"Qu©n Tö TiÖt Phong MËt TŞch",0,107,175}},
				[16] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176},{"Xuyªn V©n L¹c Hång MËt TŞch",0,107,177}},
				[17] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176}},
				[18] = {{"Xuyªn V©n L¹c Hång MËt TŞch",0,107,177}},
				[19] = {{"U Minh Phong Ma Lôc",0,107,178},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
				[20] = {{"U Minh Phong Ma Lôc",0,107,178}},
				[21] = {{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
				[22] = {{"ThiÓm L«i MËt TŞch",0,107,198}},
				[23] = {{"ThiÓm L«i MËt TŞch",0,107,198}},
				[24] = {{"Tr¶m NhËt MËt TŞch",0,107,199},{"Hµnh TrËn MËt TŞch",0,107,200},{"Phong HuyÕt MËt TŞch",0,107,201}},
				[25] = {{"Tr¶m NhËt MËt TŞch",0,107,199}},
				[26] = {{"Hµnh TrËn MËt TŞch",0,107,200}},
				[27] = {{"Phong HuyÕt MËt TŞch",0,107,201}},
				[28] = {{"U Méng Phæ",0,107,202},{"B¸ch Hoa Phæ",0,107,203}},
				[29] = {{"U Méng Phæ",0,107,202}},
				[30] = {{"B¸ch Hoa Phæ",0,107,203}},
			};
	local nFactionRoute = GetPlayerRoute()	-- »ñµÃÍæ¼ÒµÄÁ÷ÅÉÊı¾İ
	local nRandom = random(1,getn(tGaojiMiji[nFactionRoute]));
	local nAdd_flag = AddItem(tGaojiMiji[nFactionRoute][nRandom][2],tGaojiMiji[nFactionRoute][nRandom][3],tGaojiMiji[nFactionRoute][nRandom][4],1);
	if nAdd_flag == 1 then
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn"..tGaojiMiji[nFactionRoute][nRandom][2]);
		WriteLog("[Sù kiÖn s­ m«n]: "..GetName().."Hoµn thµnh sù kiÖn s­ m«n ®­îc 1 "..tGaojiMiji[nFactionRoute][nRandom][1]);
	else
		WriteLog("[Sù kiÖn s­ m«n]: "..GetName().."Hoµn thµnh sù kiÖn s­ m«n ®­îc 1 "..tGaojiMiji[nFactionRoute][nRandom][1].."ThÊt b¹i: "..nAdd_flag);
	end	
end


-- ¸øÒ»¸öÊ¦ÃÅÁîÅÆ£¬°´ÃÅÅÉ¸øµÄ
function send_a_faction_card()
	local nFaction = GetPlayerFaction()		-- µÃµ½Íæ¼ÒÊÇÄÄ¸öÃÅÅÉµÄ

	if (nFaction == 1) then			-- ÉÙÁÖ
		AddItem(2, 0, 205, 1)		-- ÉÙÁÖÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 2) then		-- Îäµ±
		AddItem(2, 0, 206, 1)		-- Îäµ±Ê¦ÃÅÁîÅÆ
	elseif (nFaction == 3) then		-- ¶ëáÒ
		AddItem(2, 0, 207, 1)		-- ¶ëáÒÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 4) then		-- Ø¤°ï
		AddItem(2, 0, 208, 1)		-- Ø¤°ïÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 5) then		-- ÌÆÃÅ
		AddItem(2, 0, 209, 1)		-- ÌÆÃÅÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 6) then		-- ÑîÃÅ
		AddItem(2, 0, 350, 1)		-- ÑîÃÅÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 7) then		-- Îå¶¾
		AddItem(2, 0, 390, 1)		-- Îå¶¾Ê¦ÃÅÁîÅÆ
	elseif (nFaction == 8) then		-- À¥ÂØ
--		AddItem(2,0,787, 1)		-- À¥ÂØÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 9) then		-- Ã÷½Ì
--		AddItem(2,0,788, 1)		-- Ã÷½ÌÊ¦ÃÅÁîÅÆ
	elseif (nFaction == 10) then		-- ´äÑÌ
--		AddItem(2,0,789, 1)		-- ´äÑÌÊ¦ÃÅÁîÅÆ
	end
end;

function cancel_faction_event()
	Say("§Ó cã mËt tŞch m«n ph¸i cÇn hoµn thµnh nhiÖm vô s­ m«n. Ng­¬i cã muèn tiÕp tôc lµm kh«ng?",
		2,
		"Ta muèn hñy nhiÖm vô nµy/confirm_cancel_faction_event",
		"§Ó ta nghÜ l¹i!/cancel_dialog")
end;

function confirm_cancel_faction_event()
	SetTask(TASKVALUE_FACTION_EVENT_ID, 0)
	Say("Ta ®· hñy nhiÖm vô s­ m«n cña ng­¬i, nÕu muèn lµm l¹i th× ph¶i xem c¬ duyªn n÷a!", 0)
end;

function get_free_room(goods_num)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
		return 0
	else 
		return 1
	end
end
function add_0906and07_aword()
	if EventOpen0906() == 0 then
		return
	end
	if tonumber(date("%y%m%d%H")) >= 09061900 and tonumber(date("%y%m%d%H")) < 09071924 then
		local nCount = tb_shimen_aword[floor(GetLevel() / 10)][2];
		if GetTask(TASK_GET_MIBEN_DATE) < tonumber(date("%y%m%d")) then
			SetTask(TASK_GET_MIBEN_COUNT_TODAY, 0);
		end
		if GetTask(TASK_GET_MIBEN_COUNT_TODAY) < CONST_GET_MIBEN_MAX_COUNT then
			gf_SetLogCaption("Truy t×m tr­êng sinh phæ");
			local nRetCode = gf_AddItemEx({2, 1, 30088, nCount}, "Bİ Phæ Cò N¸t");
			WriteLogEx("Hoat dong thang 6","S­ m«n"..floor(GetLevel() / 10).."x",nCount,"Bİ Phæ Cò N¸t");
			if nRetCode == 1 then
				SetTask(TASK_GET_MIBEN_DATE, tonumber(date("%y%m%d")));
				SetTask(TASK_GET_MIBEN_COUNT_TODAY, GetTask(TASK_GET_MIBEN_COUNT_TODAY) + 1);
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0908_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090807 and nDate < 090907 then
		local nCount = tVIET_SHIMEN_PUTAO[floor(GetLevel() / 10)];
		if GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE) < nDate then
			SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT, 0);
		end
		if GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT) < VIET_0908_CONST_SHIMEN_GET_MAX then
			gf_SetLogCaption(str_VIET_0908_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30097, nCount}, "Tói Tr¸i C©y");
			if nRetCode == 1 then
				SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT, GetTask(VIET_0908_TASK_SHIMEN_GET_PUTAO_COUNT) + 1);
				levelGrade = floor(GetLevel() / 10);
				if levelGrade <= 2 then
					WriteLogEx("Hoat dong thang 8", "Nhan tui trai cay", nCount, "Su mon 1x2x");
				else
					WriteLogEx("Hoat dong thang 8", "Nhan tui trai cay", nCount, "Su mon "..levelGrade.."x");
				end
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0909_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 090918 and nDate < 091026 then
		local nCount = tVIET_SHIMEN_BAIMIANBAO[floor(GetLevel() / 10)];
		if GetTask(VIET_0909_TASK_SHIMENG_DATE) < nDate then
			SetTask(VIET_0909_TASK_SHIMENG_NUM, 0);
		end
		if GetTask(VIET_0909_TASK_SHIMENG_NUM) < 10 then
			gf_SetLogCaption(VIET_0909_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30106, nCount}, "Bét M×");
			if nRetCode == 1 then
				local nLevel = floor(GetLevel() / 10)
				WriteLogEx("Hoat dong trung thu","S­ M«n cÊp "..nLevel,nCount,"Bét M×")
				SetTask(VIET_0909_TASK_SHIMENG_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0909_TASK_SHIMENG_NUM, GetTask(VIET_0909_TASK_SHIMENG_NUM) + 1);
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0911_aword()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 091106 and nDate <= 091206 then
		local nCount = tVIET_0911_SHIMEN_JUHUA[floor(GetLevel() / 10)];
		if GetTask(VIET_0911_TASK_SHIMENG_DATE) < nDate then
			SetTask(VIET_0911_TASK_SHIMENG_NUM, 0);
		end
		if GetTask(VIET_0911_TASK_SHIMENG_NUM) < 10 then
			gf_SetLogCaption(VIET_0911_LOG_TITLE);
			local nRetCode = gf_AddItemEx({2, 1, 30118, nCount}, "Hoa Cóc");
			if nRetCode == 1 then
				SetTask(VIET_0911_TASK_SHIMENG_DATE, tonumber(date("%y%m%d")));
				SetTask(VIET_0911_TASK_SHIMENG_NUM, GetTask(VIET_0911_TASK_SHIMENG_NUM) + 1);
				WriteLogEx(VIET_0911_LOG_TITLE,"S­ m«n "..floor(GetLevel() / 10).."x",nCount,"Hoa Cóc")
			end
			gf_SetLogCaption("");
		end
	end
end

function add_0912_aword()
    local szFullLog = VIET_0912_STR_EVENT_LOG_TITLE.."- Lµm nhiÖm vô s­ m«n ®­îc kÑo gi¸ng sinh"
    gf_EventFactionAward({2, 1, 30138}, "C©y KÑo Gi¸ng Sinh", VIET_0912_SHIMEN_SHENGDANTANGGUO, VIET_0912_SHIMEN_AWARD_MAX_COUNT, VIET_0912_TASK_SHIMENG_DATE, VIET_0912_TASK_SHIMENG_NUM, szFullLog, 091218, 100117);
end
