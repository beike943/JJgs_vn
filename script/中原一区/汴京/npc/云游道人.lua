-- =========================================
-- File : ÖĞÔ­Ò»Çø£¬ãê¾©£¬ÔÆÓÎµÀÈË.lua
-- Name : ÔÆÓÎµÀÈË
-- ID   : 1, 8
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

ID_LEARNLIFESKILL		= 1925		-- ĞÂÊÖÈÎÎñ±äÁ¿
TASK49_BEGGING			= 1933		-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
FORGETMAIN_NUM			= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
FORGETOHTER_NUM			= 1941		-- ÒÅÍü¸¨¼¼ÄÜ´ÎÊı
strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	strName = GetTargetNpcName()
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	-------------------------------------------ĞÂÊÖÈÎÎñ-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 2) then
		Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
    	TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")        
		return    
    elseif (GetTask(ID_LEARNLIFESKILL) >= 2 and GetTask(ID_LEARNLIFESKILL) < 15) then
		Talk(3, 
			 "",
			 strTitle.."Ta sÏ gi¶i thİch ®«i nĞt vÒ kü n¨ng thu thËp cho b»ng h÷u râ.",
			 strTitle.."Kü n¨ng thu thËp gåm: <color=yellow>§èn c©y, §µo kho¸ng, Canh t¸c, Thuéc da, TËp linh, H¸i thuèc vµ KĞo t¬<color>. Kü n¨ng thu thËp cÇn cã khu vùc vµ c«ng cô t­¬ng øng míi cã thÓ sö dông. <color=yellow>§èn c©y cÇn cã ThiÕt phñ; §µo kho¸ng cÇn cã Cuèc chim; Canh t¸c cÇn cã Cuèc; Thuéc da cÇn ChÕ b× ®ao; TËp linh cÇn Ph¸p khİ; H¸i thuèc cÇn Cuèc thuèc; KĞo t¬ cÇn Con thoi<color>.",
			 strTitle.."Chó ı mçi c«ng cô ®Òu cã ®é bÒn nhÊt ®Şnh. Giê b»ng h÷u cã thÓ vÒ <color=yellow>BiÖn Kinh<color> gi¶i thİch cho <color=yellow>L­u NhÊt Phñ<color>.")
		if (GetTask(ID_LEARNLIFESKILL) == 2) then
			SetTask(ID_LEARNLIFESKILL, 3)
			TaskTip("T×m L­u NhÊt Phñ ë BiÖn Kinh")
		end
		return
    end
	
 ---------------------------------------------Ö÷¶Ô»°-------------------------------------------
	Say(strTitle.."Ta lµ V©n Du §¹o Nh©n, tinh th«ng kú thuËt ng­¬i cÇn ta gióp g× kh«ng? Nghe nãi c¸c ®¹o sÜ ë TuyÒn Ch©u ph¸t hiÖn mét lo¹i phï th¹ch míi tèt h¬n cña ta rÊt nhiÒu. Ng­¬i thö ®Õn ®ã xem.",
		4,
		"Häc kü n¨ng luyÖn bïa/luaLearnLifeSkill",
		"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
		"Bá kü n¨ng luyÖn bïa/forget_life_skill",
		"Rêi khái/SayHello")
end;

-- ËùÓĞÅä·½Ïà¹ØµÄÊÂÇé
function learn_all_recipe()
	Say(strTitle.."Ng­¬i muèn häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ?",
		7,
		"Häc c¸ch phèi chÕ míi/luaLearnRecipe",
		"Häc c¸ch phèi chÕ dµnh cho ho¹t ®éng cuèi tuÇn/Weekend",
		"Ph­¬ng ph¸p phèi chÕ míi/luaResLearnRecipe",
		"Xem nhËn ®­îc nhiÖm vô vò khİ cÊp 76 kh«ng/get_76_task",
		"Häc c¸ch phèi chÕ cÊp 76/relearn_76_recipe",
		"Häc söa phèi chÕ/Reset_Learn",
		"Rêi khái/SayHello")
end;

-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
 ----------------------------------76¼¶ÎäÆ÷Åä·½³àÎÙÁé·ûÈÎÎñ----------------------------------
	local nSkillGenre,nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre,nSkillDetail);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_chiwu == 0 then
			juju_chiwu_001()
			return
		--ÉĞËÍÈ¥ÇıÄ§Áé·ûµÄ¶Ô»°
		elseif nTaskState_chiwu == 1 then
			juju_chiwu_002()
			return
		--ËÍ»ØºÚÎÙÊ¯ÓëÆĞÌáÄ¾²¢Ñ§»áÅä·½
		elseif nTaskState_chiwu == 2 then
			juju_chiwu_007()
			return			
		end 
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if nSkillGenre == 1 and nSkillDetail ~= 8 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B¹n ch­a ®ñ ®iÒu kiÖn nhËn nhiÖm vô phèi chÕ cÊp 76.", 0)
end;


-- ²¹Ñ§76¼¶Åä·½
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (nGene == 1 and nSkillID == 8) then
		if (GetTask(1605) == 3 and nLevel >= 79) then
			AddRecipe(808)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch ¤ Linh Phï")
		else
			Say("B¹n ch­a lµm nhiÖm vô phèi chÕ cÊp 76", 0)
		end
	else
		Say("B¹n ch­a häc kü n¨ng: <color=yellow>LuyÖn bïa<color>!", 0)
	end
end;

-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- Ö÷¼¼ÄÜ
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."§©y lµ lÇn thø "..(nForgetTimes + 1).." lÇn bá kü n¨ng s¶n xuÊt, mÊt "..nShouldPay.." l­îng, ng­¬i suy nghÜ kü ch­a?",
			2,
			"Ta ®· quyÕt ®Şnh råi!/forget_now",
			"Khoan ®·! Chê ta suy nghÜ l¹i!/SayHello")
	else
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng luyÖn bïa? Ta kh«ng thÓ gióp ng­¬i!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- Ö÷¼¼ÄÜ
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 8) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 8)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(515, 0)
				SetTask(1601, 0);--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				SetTask(1605, 0);--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				Msg2Player("B¹n ®· bá kü n¨ng luyÖn bïa")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;

----------------------------------------Ê±¼äÅĞ¶¨½Å±¾----------------------------------------
--·µ»ØĞÇÆÚ¼¸£¬0´ú±íĞÇÆÚÌì
function GetWeekDay()
	return tonumber(date("%w"))
end;
--·µ»Øµ±Ç°Ğ¡Ê±ºÍ·ÖÖÓ
function GetLocalTime()
	nHour = date("%H")
	nMin = date("%M")
	return tonumber(nHour), tonumber(nMin)
end;
--19 - 23µã59·Ö
function CheckTime(day)
	if (WEEKEND_SWITCH == 0) then
		return 0
	end
	if (day ~= GetWeekDay()) then
		return 0
	end
	--»»Ëã19:00 - 24:00ÊÇÊ²Ã´Çø¼ä
	local nBegin = 19 * 60
	local nEnd = 24 * 60
	local nHour, nMin = GetLocalTime()
	local nValue = nHour * 60 + nMin
	if (nValue >= nBegin and nValue <= nEnd) then
		return 1
	else
		return 0
	end
end;


----------------------------¼¼ÄÜÑ§Ï°Ñ¡Ôñ--------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
    	Say (strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
    	return
	end
	
    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
    end
    
	Say(strTitle.."B»ng h÷u muèn häc kü n¨ng <color=yellow>luyÖn bïa<color>?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end;
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if LearnLifeSkill(1, 8, 1, 79, 1) then
        	AddItem(2, 1, 901, 30)
        	Msg2Player("Häc ®­îc kü n¨ng sèng: ChÕ phï vµ nhËn ®­îc 30 BiÖn kinh th¹ch.")
	    end
    
    		AddRecipe(36)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï BiÖn Kinh")
    		AddRecipe(37)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï Thµnh §«")
    		AddRecipe(38)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï TuyÒn Ch©u")
    	SetTask(LEV_LEARNRECIPE, 10)
    	
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."H·y suy nghÜ kü råi quay l¹i ®©y nhĞ!", 0)
end

--Ñ§Ï°ĞÂµÄÅä·½
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
    		AddRecipe(36)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï BiÖn Kinh")
    		AddRecipe(37)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï Thµnh §«")
    		AddRecipe(38)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï TuyÒn Ch©u")
    		SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
	    	AddRecipe(29)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 1)")
    		AddRecipe(39)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï T­¬ng D­¬ng")    		
    		AddRecipe(226)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Håi phï D­¬ng Ch©u")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(30)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 2)")
        	AddRecipe(41)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Lı Håi phï")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(31)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 3)")
        	AddRecipe(947)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ §ang Håi phï")
        	AddRecipe(948)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¸i Bang Håi phï")
        	AddRecipe(949)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕu L©m Håi phï")
        	AddRecipe(950)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nga My Håi phï")
        	AddRecipe(952)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §­êng M«n Håi phï")
        	AddRecipe(953)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò §éc Håi phï")
        	AddRecipe(954)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng M«n Håi phï")          	 
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(32)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 3)")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(33)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 5)")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(34)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 6)")
        	AddRecipe(951)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TËp linh phï")
        	SetTask(LEV_LEARNRECIPE,70)
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(35)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¸m ®Şnh phï (cÊp 7)")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
    	end
    end
end;

--¶Ô¼¼ÄÜµÄËµÃ÷ĞÅÏ¢
function Weekend()
    if (GetLifeSkillLevel(1, 8) >= 1 and 
    	(CheckTime(0) == 1 or CheckTime(5) == 1 or CheckTime(6) == 1)) then
    	Say(strTitle.."TuÇn lÔ hoµng kim ®· ®Õn, ta ®©y cã ph­¬ng ph¸p phèi chÕ ®Æc biÖt lµm ®­îc giÊy bïa qu©n dông rÊt cã İch cho tiÒn tuyÕn!", 0)
    	AddRecipe(231)
    	Msg2Player("B¹n häc ®­îc c¸ch phèi chÕ míi - GiÊy bïa qu©n dông!")
    else
    	Say(strTitle.."Ng­¬i ch­a häc luyÖn bïa hoÆc ch­a ®óng lóc nªn ta kh«ng thÓ truyÒn thô.", 0)
    end
end

--È¡Ïûº¯Êı
function SayHello()
end

--ĞŞ¸´Åä·½
function Reset_Learn()
	if (GetLifeSkillLevel(1, 8) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Phèi chÕ cña ng­¬i ®· ®­îc tu söa, mçi 10 cÊp cã thÓ häc c¸ch phèi chÕ míi.")
		return	
	else
		Talk(1, "", strTitle.."§õng hßng g¹t ta!")
	end
end

--²¹ĞÂµÄÅä·½
function luaResLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(947)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ §ang Håi phï")
        	AddRecipe(948)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¸i Bang Håi phï")
        	AddRecipe(949)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕu L©m Håi phï")
        	AddRecipe(950)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nga My Håi phï")
        	AddRecipe(952)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §­êng M«n Håi phï")
        	AddRecipe(953)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò §éc Håi phï")
        	AddRecipe(954)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng M«n Håi phï") 
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(947)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ §ang Håi phï")
        	AddRecipe(948)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¸i Bang Håi phï")
        	AddRecipe(949)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕu L©m Håi phï")
        	AddRecipe(950)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nga My Håi phï")
        	AddRecipe(952)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §­êng M«n Håi phï")
        	AddRecipe(953)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò §éc Håi phï")
        	AddRecipe(954)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng M«n Håi phï") 
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(947)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ §ang Håi phï")
        	AddRecipe(948)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¸i Bang Håi phï")
        	AddRecipe(949)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕu L©m Håi phï")
        	AddRecipe(950)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nga My Håi phï")
        	AddRecipe(952)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §­êng M«n Håi phï")
        	AddRecipe(953)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò §éc Håi phï")
        	AddRecipe(954)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng M«n Håi phï") 
        	AddRecipe(951)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TËp linh phï")        	
    	elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 70) then
        	AddRecipe(947)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ §ang Håi phï")
        	AddRecipe(948)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¸i Bang Håi phï")
        	AddRecipe(949)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕu L©m Håi phï")
        	AddRecipe(950)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nga My Håi phï")
        	AddRecipe(952)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §­êng M«n Håi phï")
        	AddRecipe(953)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò §éc Håi phï")
        	AddRecipe(954)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng M«n Håi phï") 
        	AddRecipe(951)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TËp linh phï")
    	elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 80) then
        	AddRecipe(947)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ §ang Håi phï")
        	AddRecipe(948)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¸i Bang Håi phï")
        	AddRecipe(949)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕu L©m Håi phï")
        	AddRecipe(950)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nga My Håi phï")
        	AddRecipe(952)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §­êng M«n Håi phï")
        	AddRecipe(953)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò §éc Håi phï")
        	AddRecipe(954)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng M«n Håi phï") 
        	AddRecipe(951)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TËp linh phï")
    	else
        	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
    	end
    end
end;

function Huan_Fushi()
	if GetItemCount(0,200,29)>0 then 
		Say("Ng­¬i cã muèn ®æi BiÖn Kinh Th¹ch kh«ng?",
		2,
		"§óng vËy, ta muèn ®æi /Bianjingzhuanhuan",
		"§Ó ta suy nghÜ l¹i!/SayHello"
		)
	elseif GetItemCount(0,200,30)>0 then 
		Say("Ng­¬i cã muèn ®æi Thµnh §« Th¹ch kh«ng?",
		2,
		"§óng vËy, ta muèn ®æi /Chengduzhuanhuan",
		"§Ó ta suy nghÜ l¹i!/SayHello"
		)
	elseif GetItemCount(0,200,31)>0 then 
		Say("Ng­¬i cã muèn ®æi TuyÒn Ch©u Th¹ch kh«ng?",
		2,
		"§óng vËy, ta muèn ®æi /Quanzhouzhuanhuan",
		"§Ó ta suy nghÜ l¹i!/SayHello"
		)
	elseif GetItemCount(0,200,32)>0 then 
		Say("Ng­¬i cã muèn ®æi T­¬ng D­¬ng Th¹ch kh«ng?",
		2,
		"§óng vËy, ta muèn ®æi /Xiangyangzhuanhuan",
		"§Ó ta suy nghÜ l¹i!/SayHello"
		)
	elseif GetItemCount(0,200,34)>0 then 
		Say("Ng­¬i cã muèn ®æi §¹i Lı Th¹ch kh«ng?",
		2,
		"§óng vËy, ta muèn ®æi /Dalizhuanhuan",
		"§Ó ta suy nghÜ l¹i!/SayHello"
		)
	elseif GetItemCount(0,200,35)>0 then 
		Say("Ng­¬i cã muèn ®æi D­¬ng Ch©u Th¹ch kh«ng?",
		2,
		"§óng vËy, ta muèn ®æi /Yangzhouzhuanhuan",
		"§Ó ta suy nghÜ l¹i!/SayHello"
		)
	else Say("Ng­¬i kh«ng mang theo tÊm Phï Th¹ch cò µ? Hay lµ bá quªn chç thñ khè råi.",
		1,
		"§Ó ta ®i lÊy!/SayHello"
		)		
	end;
end;

function Bianjingzhuanhuan()
		DelItem(0,200,29,1)
		AddItem(2,1,901,20)
end;

function Chengduzhuanhuan()
		DelItem(0,200,30,1)
		AddItem(2,1,902,20)
end;

function Quanzhouzhuanhuan()
		DelItem(0,200,31,1)
		AddItem(2,1,903,20)
end;

function Xiangyangzhuanhuan()
		DelItem(0,200,32,1)
		AddItem(2,1,904,20)
end;

function Dalizhuanhuan()
		DelItem(0,200,34,1)
		AddItem(2,1,906,20)
end;

function Yangzhouzhuanhuan()
		DelItem(0,200,35,1)
		AddItem(2,1,907,20)
end;