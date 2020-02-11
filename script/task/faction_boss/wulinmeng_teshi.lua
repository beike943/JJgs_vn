-- =============================================================
-- FileName : wulinmeng_teshi.lua
-- Desc     : ÎäÁÖÃËÌØÊ¹µÄ½Å±¾,ÃÅÅÉbossµÄ¹¦ÄÜ
-- Date     : Dec 14 2006
-- Creator  : Tony(Jizheng)
-- =============================================================

Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\killer_hall\\killer_hall_head.lua");	--É±ÊÖÌÃÄÚÈİ
Include("\\script\\lib\\writelog.lua")

TASK_ID_LAST_GET_DATE = 88			-- ÉÏ´ÎÁìÈ¡ÈÎÎñµÄÊ±¼ä,ÈÎÎñ±äÁ¿ID
TASK_ID_HAVE_GOT_TODAY = 89			-- ½ñÌìÊÇ·ñÒÑ¾­ÁìÈ¡ÁËÈÎÎñ,ÈÎÎñ±äÁ¿ID

-- Ä¬ÈÏ¶Ô»°Èë¿Ú
--function main()
--	if GetPlayerFaction() == 0 then				--2007ÀÍ¶¯½ÚÔö¼ÓÊ¦ÃÅÀúÁ·»î¶¯
--		Say("<color=green>ÎäÁÖÃËÌØÊ¹<color>£ºÈç½ñ½­ºş·×ÂÒ£¬¸÷´óÃÅÅÉÅ×¿ªÃÅ»§Ö®¼û£¬Ñ¡³ö±¾ÃÅ¸ßÊÖÔÚÒ»ÆğÇĞ´èÎäÑ§£¬ÒÔÆÚÌô³ö×ÊÖÊÉÏ¼ÑµÄÎäÁÖµÜ×Ó´«ÊÚ±¾ÃÅ¾øÑ§ºÍÉñ±øÀûÆ÷£¬ÏÖÔÚÎ¯ÍĞÎÒÍÆ¾Ù¸÷´óÃÅÅÉµÄºóÆğÖ®Ğã£¬´«ÒÔ¾øÑ§£¬ÉÙÏÀÒª²»ÒªÁË½â¿´¿´¡£",
--			6,
--			"ÎÒÒª±¨ÃûÉêÇëÊÔÁ·/get_boss_task_now",
--			"²»ÖªµÀÊÇÄÄĞ©ÎäÁÖÇ°±²/get_boss_info",
--			"ÕâĞ©ÎäÁÖÇ°±²³öÏÖÔÚºÎ´¦/get_bossweizhi_info",		
--			"ÈçºÎ²ÅÄÜ»ñµÃ¾øÑ§ºÍÉñ±ø/get_prize_info",
--			"½­ºşÀúÁ·»î¶¯/#labor_07_dia_main(2)",
--			"ÓĞ¿ÕÔÙÀ´¿´¿´/cancel_dialog")
--			return
--	else
--		Say("<color=green>§Æc sø Vâ L©m<color>: £ºÈç½ñ½­ºş·×ÂÒ£¬¸÷´óÃÅÅÉÅ×¿ªÃÅ»§Ö®¼û£¬Ñ¡³ö±¾ÃÅ¸ßÊÖÔÚÒ»ÆğÇĞ´èÎäÑ§£¬ÒÔÆÚÌô³ö×ÊÖÊÉÏ¼ÑµÄÎäÁÖµÜ×Ó´«ÊÚ±¾ÃÅ¾øÑ§ºÍÉñ±øÀûÆ÷£¬ÏÖÔÚÎ¯ÍĞÎÒÍÆ¾Ù¸÷´óÃÅÅÉµÄºóÆğÖ®Ğã£¬´«ÒÔ¾øÑ§£¬ÉÙÏÀÒª²»ÒªÁË½â¿´¿´¡£",
--			5,
--			"ÎÒÒª±¨ÃûÉêÇëÊÔÁ·/get_boss_task_now",
--			"²»ÖªµÀÊÇÄÄĞ©ÎäÁÖÇ°±²/get_boss_info",
--			"ÕâĞ©ÎäÁÖÇ°±²³öÏÖÔÚºÎ´¦/get_bossweizhi_info",		
--			"ÈçºÎ²ÅÄÜ»ñµÃ¾øÑ§ºÍÉñ±ø/get_prize_info",
--			"ÓĞ¿ÕÔÙÀ´¿´¿´/cancel_dialog")
--			return		
--	end
--end;

function get_factionboss_task()
		Say("<color=green>§Æc sø Vâ L©m<color>: Vâ l©m giang hå ®¹i lo¹n, <color=yellow>c¸c ®¹i m«n ph¸i<color> ®ang chän trong bæn m«n mét cao thñ cã tè chÊt phi phµm ®Ó truyÒn thô tuyÖt häc vµ thÇn binh cña bæn m«n. <color=yellow>C¸c ®¹i m«n ph¸i<color> nhê ta tiÕn cö ng­êi ­u tó nhÊt cña c¸c m«n ph¸i, thiÕu hiÖp muèn t×m hiÓu kh«ng?",
			5,
			"Ta muèn b¸o danh tham gia thİ luyÖn/get_boss_task_now",
			"Kh«ng biÕt lµ vŞ vâ l©m tiÒn bèi nµo/get_boss_info",
			"VŞ tiÒn bèi nµy b©y giê ®ang ë ®©u/get_bossweizhi_info",		
			"Lµm thÕ nµo ®Ó cã ®­îc tuyÖt häc vµ thÇn binh/get_prize_info",
			"R¶nh th× quay l¹i nhĞ!/cancel_dialog")
			return	
end
function main()
	local selTab = {
				"Ta muèn dïng 2 lÖnh bµi s­ m«n ®æi mÆt n¹ S¸t Thñ §­êng/want_mask",
				"Ta muèn mua mÆt n¹ S¸t Thñ §­êng (60 vµng)/buy_mask",
				"Nghe nãi ®ang cã ho¹t ®éng thİ luyÖn S­ m«n/get_factionboss_task",
				"R¶nh th× quay l¹i nhĞ!/cancel_dialog",
				}
	Say("<color=green>§Æc sø Vâ L©m<color>: T¹i <color=yellow>Tróc Ty §éng tÇng 2<color>, S¸t thñ ®­êng do tø ®¹i ¸c nh©n <color=yellow>Nh©n ®å phñ - Lı §¹i Chñy<color> trÊn thñ vµo lóc <color=yellow>12:30-13:30<color> vµ <color=yellow>21:00-22:00<color> mçi ngµy sÏ triÖu håi mét sè s¸t thñ tõ bªn ngoµi. NÕu ng­¬i cã 2 lÖnh bµi s­ m«n, ta sÏ tÆng ng­¬i 1 mÆt n¹ S¸t Thñ §­êng ®Ó ®i vµo S¸t thñ ®­êng ®¸nh b¹i nh÷ng tªn b¹i ho¹i cña Vâ L©m. Tuy nhiªn ng­¬i cÇn ph¶i luyÖn thµnh <color=red>vâ c«ng cao cÊp bæn m«n<color>.",getn(selTab),selTab);
end;

function want_mask()
	local nFaction = GetPlayerFaction();
	if nFaction == 0 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ch­a gia nhËp m«n ph¸i, tèt h¬n ®õng b­íc ch©n vµo S¸t thñ ®­êng!");
		return 0;
	end;
	if KH_Check_Skill_Level() ~= 1 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: CÇn ph¶i häc thµnh thôc vâ c«ng cao cÊp råi míi ®Õn gÆp ta.");
		return 0;
	end;
	local nDate = tonumber(date("%y%m%d"));
	if GetTask(KH_TASK_GOT_MASK_DATE) >= nDate then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: MÆt n¹ S¸t thñ ®­êng nµy chÕ t¹o kh«ng ph¶i dÔ, ngµy mai h·y quay l¹i.");
		return 0;
	end;
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0;
	end;
	if DelItem(tFactionTokenRing[nFaction][1],tFactionTokenRing[nFaction][2],tFactionTokenRing[nFaction][3],2) == 1 then
		SetTask(KH_TASK_GOT_MASK_DATE,nDate);
		AddItem(tItemInfo[1][2],tItemInfo[1][3],tItemInfo[1][4],1)
		Msg2Player("NhËn ®­îc 1"..tItemInfo[1][1]);
	else
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Sè lÖnh bµi s­ m«n mang theo kh«ng ®ñ, cÇn ph¶i cã ®ñ <color=yellow>2 lÖnh bµi s­ m«n<color> ®Ó chøng minh n¨ng lùc!");
	end;
end;

function buy_mask()
	if gf_JudgeRoomWeight(1,20) ~= 1 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end
	if GetCash() < 600000 then
		Talk(1,"","<color=green>§Æc sø Vâ L©m<color>: Ng­¬i kh«ng cã ®ñ tiÒn mµ muèn mua µ!");
		return 0
	else
		if Pay(600000) == 1 then
			gf_AddItemEx2({2,1,1087,1}, "MÆt N¹ S¸t Thñ §­êng", "Hoat dong thang 5", "mua", 24*60*60)
		else
			return 0
		end
	end
end


-- ÍË³ö¶Ô»°µÄº¯Êı
function cancel_dialog()
end;

-- »ñµÃÎäÁÖÇ°±²µÄ½éÉÜ
function get_boss_info()
	Talk(3, "", 
		 "Giang hå ®¹i lo¹n kÓ tõ khi Bé Phi Yªn ®o¹t Sinh ThÇn C­¬ng.", 
		 "<color=yellow>C¸c ®¹i m«n ph¸i<color> ®ang chiªu mé anh hµo kiÖt xuÊt ®Ó truyÒn thô tuyÖt thÕ vâ c«ng vµ chÕ t¹o thÇn khİ.",
		 "C¸c vŞ cao thñ nµy gåm: Tr­ëng l·o <color=yellow>HuyÒn Ch©n_ThiÕu L©m <color>, ®¹i hiÖp <color=yellow>Thanh Th­_Vâ §ang<color>, s­ th¸i <color=yellow>TuÖ Minh_Nga My<color>, §µ chñ <color=yellow>Hoµng Chİnh NhÊt_C¸i Bang<color>, nghi tr­îng <color=yellow>§­êng Hû_§­êng M«n<color>, t­íng qu©n <color=yellow>D­¬ng Diªn §øc_Thiªn Ba D­¬ng Phñ <color>, vµ <color=yellow>Cæ MÆc tµ hiÖp_Ngò §éc <color>.")
end;

-- »ñµÃÉñ±øºÍ¾øÑ§µÄÈ¡µÃÍ¾¾¶½éÉÜ
function get_prize_info()
	Talk(3, "", 
		 "Mçi thø 6, 7 chñ nhÊt hµng tuÇn, lóc <color=yellow>21:00<color> c¸c vŞ cao thñ sÏ xuÊt hiÖn bªn ngoµi c¸c m«n ph¸i. Tr­íc tiªn h·y ®Õn chç ta b¸o danh ®Ó ta xem n¨ng lùc cña ng­¬i thÕ nµo.", 
		 "N¨ng lùc kh«ng ®ñ th× c¸c ng­¬i kh«ng thÓ nhËn <color=yellow>VËt phÈm<color>. NÕu nh­ ®¸nh b¹i c¸c vŞ cao thñ chøng minh ®­îc n¨ng lùc cña m×nh, th× c¸c ng­¬i sÏ nhËn ®­îc <color=yellow>tói b¶o bèi<color> trong ®ã ®ã mËt tŞch vâ häc vµ vËt phÈm bİ truyÒn cña s­ m«n.",
		 "Ngoµi mËt tŞch vâ häc vµ vËt phÈm bİ truyÒn cña s­ m«n ng­¬i cßn cã c¬ may nhËn ®­îc c¸c vËt phÈm kh¸c, chØ cÇn chiÕn th¾ng c¸c bËc cao thñ ®ã, h·y cè lªn !")
end;

-- ±¨ÃûÉêÇëÊÔÁ·
function get_boss_task_now()
	-- Íæ¼ÒµÈ¼¶ÒªÇó³¬¹ı75¼¶
	local nPlayerLevel = GetLevel()
	if (nPlayerLevel < 75) then
		Say("Xem ng­¬i t­ chÊt còng kh«ng tÖ, nh­ng kinh nghiÖm giang hå cßn non qu¸, ®Õn <color=yellow>cÊp 75<color> quay l¹i t×m ta!", 0)
		return
	end
	
	-- 55¼¶¼¼ÄÜĞèÒªÑ§Âú
	local bHaveLearnFullSkill = get_full_skill_level()
	if (bHaveLearnFullSkill == 0) then
		Say("<color=yellow>Vâ häc cña bæn m«n<color> ng­¬i h·y luyÖn cho tinh th«ng råi h·y ®Õn t×m ta.", 0)
		return	
	end
	
	local nLastGetTaskDate = GetTask(TASK_ID_LAST_GET_DATE)		-- ÉÏ´Î½ÓÈÎÎñÊÇÊ²Ã´Ê±ºò
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%H"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	local nCurHour = tonumber(nCurrTime[4])
	local nCurWeekDay = tonumber(nCurrTime[5])
	
	if ((nCurWeekDay == 0 or nCurWeekDay == 5 or nCurWeekDay == 6) and (nCurHour >= 0 and nCurHour < 20)) then
		if (nLastGetTaskDate < nCurDay) then
			nLastGetTaskDate = nCurDay
			SetTask(TASK_ID_LAST_GET_DATE, nLastGetTaskDate)
			SetTask(TASK_ID_HAVE_GOT_TODAY, 1)
		end
		Say("Ng­¬i chuÈn bŞ khiªu chiÕn víi c¸c bËc cao thñ chøng minh thùc lùc cña m×nh. Mçi  thø 6, 7 chñ nhËt lóc <color=yellow>21:00<color> c¸c vŞ cao thñ sÏ xuÊt hiÖn bªn ngoµi c¸c m«n ph¸i. Cè lªn!", 0)
		WriteLogEx("Boss su mon","nhËn nhiÖm vô")
	else
		Say("<color=yellow>Mçi thø 6, 7 vµ chñ nhËt hµng tuÇn tõ 0:00- 20:00<color>, cã thÓ ®Õn ®©y b¸o danh. HiÖn ®· qu¸ thêi gian, nÕu ng­¬i vÉn ch­a b¸o danh th× lÇn sau quay l¹i nhĞ! <color=yellow>21:00<color> c¸c tiÒn bèi Vâ l©m sÏ xuÊt hiÖn t¹i c¸c m«n ph¸i.", 0)
	end
end;

-- »ñµÃ55¼¶¼¼ÄÜÊÇ·ñÒÑ¾­Ñ§ÂúÁË
function get_full_skill_level()
	local nRet = 0
	
	local nPlayerRoute = GetPlayerRoute()
	
	if (nPlayerRoute == 2) then				-- ÉÙÁÖË×¼Ò
		if (GetSkillLevel(31) == 7) then	-- ´ïÄ¦Îä¾­
			nRet = 1
		end
	elseif (nPlayerRoute == 3) then			-- ÉÙÁÖìø×Ú
		if (GetSkillLevel(56) == 7) then	-- ´óÁ¦½ğ¸ÕÖ¸
			nRet = 1
		end
	elseif (nPlayerRoute == 4) then			-- ÉÙÁÖÎä×Ú
		if (GetSkillLevel(43) == 7) then	-- ÉÙÁÖÁú×¦ÊÖ
			nRet = 1
		end
	elseif (nPlayerRoute == 6) then			-- ÌÆÃÅ
		if (GetSkillLevel(73) == 7) then	-- ÂúÌì»¨Óê
			nRet = 1
		end
	elseif (nPlayerRoute == 8) then			-- ¶ëáÒ·ğ¼Ò
		if (GetSkillLevel(88) == 7) then	-- ´ó´È´ó±¯Öä
			nRet = 1
		end
	elseif (nPlayerRoute == 9) then			-- ¶ëáÒË×¼Ò
		if (GetSkillLevel(101) == 7) then	-- ÃÔĞÄÆ®ÏãÇú
			nRet = 1
		end
	elseif (nPlayerRoute == 11) then		-- Ø¤°ï¾»ÒÂ
		if (GetSkillLevel(112) == 7) then	-- ×íÈ­
			nRet = 1
		end
	elseif (nPlayerRoute == 12) then		-- Ø¤°ïÎÛÒÂ
		if (GetSkillLevel(123) == 7) then	-- ´ò¹·¹÷·¨
			nRet = 1
		end
	elseif (nPlayerRoute == 14) then		-- Îäµ±µÀ¼Ò
		if (GetSkillLevel(145) == 7) then	-- ÕæÎäÆß½Ø½£
			nRet = 1
		end
	elseif (nPlayerRoute == 15) then		-- Îäµ±Ë×¼Ò
		if (GetSkillLevel(158) == 7) then	-- ÉÏÇåÎŞ¼«¹¦
			nRet = 1
		end
	elseif (nPlayerRoute == 17) then		-- ÑîÃÅÇ¹Æï
		if (GetSkillLevel(731) == 7) then	-- ±ÌÔÂïwĞÇÇ¹
			nRet = 1
		end
	elseif (nPlayerRoute == 18) then		-- ÑîÃÅ¹­Æï
		if (GetSkillLevel(744) == 7) then	-- Á÷¹â¾øÓ°¼ı
			nRet = 1
		end
	elseif (nPlayerRoute == 20) then		-- Îå¶¾Ğ°ÏÀ
		if (GetSkillLevel(377) == 7) then	-- Ê¬ÁÑÉñ¹¦
			nRet = 1
		end
	elseif (nPlayerRoute == 21) then		-- Îå¶¾¹ÆÊ¦
		if (GetSkillLevel(363) == 7) then	-- ¹ÆÄ§
			nRet = 1
		end
	end
	
	return nRet
end;

-- »ñµÃÎäÁÖÇ°±²µÄÎ»ÖÃËµÃ÷
function get_bossweizhi_info()
	Talk(1, "", 
		 "\n Tr­ëng l·o ThiÕu L©m <color=yellow>HuyÒn Ch©n<color> ë <color=yellow>(172.202)<color>. \n §¹i hiÖp Vâ §ang <color=yellow>Thanh Th­<color> ë <color=yellow>(197.211)<color>. \n S­ th¸i Nga My <color=yellow>TuÖ Minh<color> ë <color=yellow>(209.211)<color>. \n §µ chñ C¸i Bang <color=yellow>Hoµng Chİnh NhÊt<color> ë <color=yellow>(185.202)<color>. \n Nghi Tr­îng §­êng M«n <color=yellow>§­êng Hû<color> ë <color=yellow>(196.187)<color>. \n T­íng Qu©n Thiªn Ba D­¬ng Phñ <color=yellow>D­¬ng Diªn §øc<color> ë <color=yellow>(209.206)<color>. \n Tµ HiÖp Ngò §éc <color=yellow>Cæ MÆc<color> ë <color=yellow>Ngò §éc (213.200)<color>.")
end;

