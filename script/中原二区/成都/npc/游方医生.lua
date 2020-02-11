-- =========================================
-- File : ÖĞÔ­¶şÇø£¬³É¶¼£¬ÓÎ·½Ò½Éú.lua
-- Name : ÓÎ·½Ò½Éú
-- ID   : 1, 6
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- ĞÂÊÖÈÎÎñ±äÁ¿
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
TASK49_BEGGING			= 1933		-- ½ú¼¶ÈÎÎñ¿ªÊ¼
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
    if (GetTask(ID_LEARNLIFESKILL) > 3 and GetTask(ID_LEARNLIFESKILL) < 15) then
		SetTask(ID_LEARNLIFESKILL, 0)
		TaskTip(" ®· gióp b¹n söa nhiÖm vô T©n Thñ-kü n¨ng sèng, xin h·y b¾t ®Çu l¹i.")
		return
	end
    if (GetLevel() < 10) then
		Say(strTitle.."B¹n trÎ! Muèn häc kü n¨ng sèng? Chê ng­¬i ®¹t ®Õn cÊp 10 h·y quay l¹i t×m ta!", 0)
		return
    elseif (GetTask(ID_LEARNLIFESKILL) >= 0 and GetTask(ID_LEARNLIFESKILL) < 15 and GetLevel() >= 10) then
		Talk(2, "NewLifeSkills", 
			 strTitle.."§Õn råi ­? Muèn ra giang hå cÇn ph¶i häc hái nhiÒu. Ta sÏ chØ cho ng­¬i nh÷ng kü n¨ng c¬ b¶n, tr­íc tiªn lµ kü n¨ng s¶n xuÊt gåm: <color=yellow>ChÕ t¹o binh khİ dµi, chÕ t¹o binh khİ ng¾n, chÕ t¹o kú m«n binh khİ, may hé gi¸p, may trang phôc, may nãn, nÊu n­íng, luyÖn ®¬n vµ chÕ phï<color>.",
			 strTitle.."ChÕ t¹o vËt phÈm cÇn ph¶i cã kü n¨ng vµ nguyªn liÖu. ChÕ t¹o 3 lo¹i <color=yellow>Binh khİ<color> cÇn kÕt hîp víi c¸c kü n¨ng<color=yellow>§èn c©y<color> vµ <color=yellow>§µo kho¸ng<color> ®Ó cung cÊp nguyªn liÖu. ChÕ t¹o <color=yellow>Hé gi¸p, Trang phôc vµ Nãn<color> cÇn kÕt hîp kü n¨ng <color=yellow>Thuéc da <color> vµ <color=yellow>KĞo t¬<color>. Muèn <color=yellow>NÊu n­íng<color> cÇn ph¶i biÕt <color=yellow>Canh t¸c<color> ®Ó lµm ra nguyªn liÖu. Muèn <color=yellow>LuyÖn ®¬n<color> cÇn kü n¨ng <color=yellow>H¸i thuèc<color>. <color=yellow>ChÕ phï<color> ph¶i biÕt <color=yellow>TËp Linh<color> ®Ó cung cÊp nguyªn liÖu.")
		if (GetTask(ID_LEARNLIFESKILL) == 0) then
			SetTask(ID_LEARNLIFESKILL, 1)
			TaskTip("B¹n h·y ®Õn TuyÒn Ch©u t×m Lı Phong Thu")
		end
		return
    end
    
--------------------------------------------Ö÷¶Ô»°-------------------------------------------
	Say(strTitle.."Ta chİnh lµ Du Ph­¬ng ®¹i phu næi danh thiªn h¹, tinh th«ng y thuËt, kh«ng biÕt ta cã thÓ gióp g×?",
		4,
		"Häc kü n¨ng ChÕ d­îc/luaLearnLifeSkill",
		"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
		"Hñy kü n¨ng ChÕ d­îc/forget_life_skill",
		"Rêi khái/SayHello")
end;


-- ËùÓĞÅä·½Ïà¹ØµÄÊÂÇé
function learn_all_recipe()
	Say(strTitle.."Ng­¬i muèn häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ?",
		5,
		"Häc c¸ch phèi chÕ míi/luaLearnRecipe",
		"Häc c¸ch phèi chÕ dµnh cho ho¹t ®éng cuèi tuÇn/Weekend",
		"Xem nhËn ®­îc nhiÖm vô vò khİ cÊp 76 kh«ng/get_76_task",
		"Häc c¸ch phèi chÕ cÊp 76/relearn_76_recipe",
		"Rêi khái/SayHello")
end;


-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
----------------------------------76¼¶ÎäÆ÷Åä·½ºÚÎÙ¾«Ê¯ÈÎÎñ----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
		
	if nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79 then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_heiwu == 0 then
			medicine_heiwu_001()
			return
		--ÉÏ½»Ò©Æ·
		elseif nTaskState_heiwu == 1 then
			medicine_heiwu_002()
			return
		--Î´Óë´ú¿ó¹¤¶Ô»°
		elseif nTaskState_heiwu == 2 then
			medicine_heiwu_004()
			return
		--Ñ§»áºÚÎÙ¾«Ê¯Åä·½
		elseif nTaskState_heiwu == 4 then
			medicine_heiwu_009()
			return
		end 
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if nSkillGenre == 1 and nSkillDetail ~= 6 and nSkillLevel >= 79 and GetTask(1600) == 0 and GetTask(1602) == 0 and GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0 then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	
	Say("B¹n ch­a ®ñ ®iÒu kiÖn nhËn nhiÖm vô phèi chÕ cÊp 76.", 0)
end;


-- ²¹Ñ§76¼¶Åä·½
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nGene == 1 and nSkillID == 6) then
		if (GetTask(1602) == 5 and nLevel >= 79) then
			AddRecipe(805)
			Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ¤ Tinh Th¹ch")
		else
			Say("B¹n ch­a hoµn thµnh nhiÖm vô phèi chÕ cÊp 76 cña kü n¨ng ChÕ d­îc!", 0)
		end
	else
		Say("B¹n ch­a häc kü n¨ng: <color=yellow>ChÕ d­îc<color>!", 0)
	end
end;


-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(1, 6) > 0) then
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
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng ChÕ d­îc! Ta kh«ng thÓ gióp ng­¬i.", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETMAIN_NUM)	-- ¸¨¼¼ÄÜ
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(1, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(RESET_ERROR, 0)
				SetTask(1602, 0);						--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				Msg2Player("Kü n¨ng ChÕ d­îc cña b¹n ®· hñy.")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;





 ------------------------------------------Ê±¼äÅĞ¶¨--------------------------------------------
 --·µ»ØĞÇÆÚ¼¸£¬0´ú±íĞÇÆÚÌì
function GetWeekDay()
	return tonumber(date("%w"))
end;

--·µ»Øµ±Ç°Ğ¡Ê±ºÍ·ÖÖÓ
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23µã59·Ö
function CheckTime(day)
	--»î¶¯¿ª¹Ø
	if WEEKEND_SWITCH == 0 then
		return 0
	end;
	if day ~= GetWeekDay() then
		return 0
	end;

	--»»Ëã19:00 - 24:00ÊÇÊ²Ã´Çø¼ä
	local nBegin = 19 * 60;
	local nEnd = 24 * 60;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end
end;


--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
--¼¼ÄÜÑ§Ï°Ñ¡Ôñ
function luaLearnLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.",0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
	end
    
	Say(strTitle.."<color=yellow>Lµm thuèc<color> lµ kü n¨ng sèng míi cña b¹n, b¹n x¸c nhËn muèn häc?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end

--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 6, 1, 79, 1)) then
        	Msg2Player("B¹n ®· häc kü n¨ng sèng: chÕ thuèc vµ nhËn ®­îc mét İt nguyªn liÖu s¬ cÊp.")
        	AddItem(1,2,8,9)
        	AddItem(1,2,1,3)
	   		
	   		AddRecipe(3)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim S¸ng t¸n")
        	AddRecipe(8)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TiÓu Hoµn ®¬n")
    	    SetTask(LEV_LEARNRECIPE,10)
		end
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say(strTitle.."H·y suy nghÜ kü råi quay l¹i ®©y nhĞ!", 0)
end

--**********************************************Åä·½Ñ§Ï°²¿·Ö***************************************
--Ñ§Ï°ĞÂµÄÅä·½
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 6)
	if (nLevel >= 1) then
		if GetTask(LEV_LEARNRECIPE)>=20 and HaveLearnRecipe(234)==0 then
			AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
		elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            AddRecipe(235)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            AddRecipe(245)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
        elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(234)==0 then
        	AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            AddRecipe(235)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            AddRecipe(245)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            AddRecipe(240)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            AddRecipe(246)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
		elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            AddRecipe(235)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            AddRecipe(245)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            AddRecipe(240)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            AddRecipe(246)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            AddRecipe(236)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            AddRecipe(241)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
        elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            AddRecipe(235)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            AddRecipe(245)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            AddRecipe(240)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            AddRecipe(246)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            AddRecipe(236)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            AddRecipe(241)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
            AddRecipe(237)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
            AddRecipe(247)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
        elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            AddRecipe(235)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            AddRecipe(245)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            AddRecipe(240)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            AddRecipe(246)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            AddRecipe(236)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            AddRecipe(241)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
            AddRecipe(237)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
            AddRecipe(247)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
            AddRecipe(242)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Trïng ThÊt Hoa t¸n")
        elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(234)==0 then
            AddRecipe(234)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
            AddRecipe(239)
            Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
            AddRecipe(244)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
            AddRecipe(235)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
            AddRecipe(245)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
            AddRecipe(240)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
            AddRecipe(246)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
            AddRecipe(236)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
            AddRecipe(241)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
            AddRecipe(237)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
            AddRecipe(247)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
            AddRecipe(242)
            Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Trïng ThÊt Hoa t¸n")
            AddRecipe(238)
            Msg2Player("B¹n häc ®­îc phèi chÕ: B«n Tinh NguyÖt §¬n")
            AddRecipe(243)
            Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i NhËt D­¬ng T¸n")
            AddRecipe(248)
            Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn V­¬ng Bæ T©m ®¬n")    
		elseif nLevel>=1 and GetTask(LEV_LEARNRECIPE)==0 then
       		AddRecipe(3)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim S¸ng t¸n")
        	AddRecipe(8)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: TiÓu Hoµn ®¬n")
    	    SetTask(LEV_LEARNRECIPE,10)
        elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(4)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ HuyÕt t¸n")
        	AddRecipe(13)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh T©m t¸n")
        	AddRecipe(234)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch NhËt ®¬n")
        	AddRecipe(239)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: İch D­¬ng t¸n")
        	AddRecipe(244)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Gi¶i §éc ®¬n")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(9)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Hoµn D­¬ng ®¬n")
        	AddRecipe(14)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: İch Khİ t¸n")
        	AddRecipe(235)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Sinh ®¬n")
        	AddRecipe(245)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ChØ Thñy ®¬n")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(5)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch V©n t¸n")
        	AddRecipe(240)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Kim t¸n")
        	AddRecipe(246)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµi V©n ®¬n")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(10)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i Hoµn ®¬n")
        	AddRecipe(15)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc Linh t¸n")
        	AddRecipe(236)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Chiªu Hån ®¬n")
        	AddRecipe(241)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Bæ Thiªn t¸n")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(6)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn H­¬ng CÈm Tôc")
        	AddRecipe(11)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: NhÊt Nguyªn Phôc Thñy ®¬n")
        	AddRecipe(237)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ DŞch ®¬n")
        	AddRecipe(247)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Cµn Nguyªn Chİnh Khİ ®¬n")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(16)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Hoa Ngäc Lé Hoµn")
        	AddRecipe(7)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c Ngäc §o¹n Tôc cao")
        	AddRecipe(12)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n VËt Quy Nguyªn ®¬n")
        	AddRecipe(242)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Trïng ThÊt Hoa t¸n")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
	    	AddRecipe(17)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Sinh Sinh Hãa T¸n")
        	AddRecipe(238)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B«n Tinh NguyÖt §¬n")
        	AddRecipe(243)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i NhËt D­¬ng T¸n")
        	AddRecipe(248)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn V­¬ng Bæ T©m ®¬n")
        	SetTask(LEV_LEARNRECIPE,80)
       	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(238)==0 then
        	AddRecipe(238)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B«n Tinh NguyÖt §¬n")
        	AddRecipe(243)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹i NhËt D­¬ng T¸n")
        	AddRecipe(248)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn V­¬ng Bæ T©m ®¬n")
    	else
        	Say (strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
      	end
    end
end;


--¶Ô¼¼ÄÜµÄËµÃ÷ĞÅÏ¢
function Weekend()
    if (GetLifeSkillLevel(1,6) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."Phİa tr­íc ®ang chiÕn tranh, ta sÏ truyÒn cho vµi c¸ch chÕ thuèc ®Ó ng­¬i lµm thuèc gióp c¸c binh sÜ trŞ th­¬ng!")
    	AddRecipe(232)
    	Msg2Player("B¹n ®· häc phèi ph­¬ng míi--Qu©n Dông Y D­îc!")
    else
    	Say(strTitle.."Ng­¬i ch­a häc kü n¨ng ChÕ d­îc hoÆc thêi gian ch­a ®Õn, ta kh«ng thÓ truyÒn thô ph­¬ng ph¸p phèi chÕ cho ng­¬i.", 0)
    end
end

--È¡Ïûº¯Êı
function SayHello()
end

function NewLifeSkills()
	Talk(2, "",
		 strTitle.."X­a cã Can T­¬ng M¹c Tµ x¸ th©n rÌn kiÕm. Ng­¬i muèn ®óc thµnh mét mãn kh¶i gi¸p tuyÖt thÕ hoÆc thÇn binh, cho dï ng­¬i cã phèi ph­¬ng ®éc nhÊt v« nhŞ chØ dùa vµo nguyªn liÖu phæ th«ng kh«ng thÓ lµm ra trang bŞ tèt. Trong qu¸ tr×nh lµm ng­¬i cÇn ph¶i cho vµo mét sè <color=yellow>vËt liÖu<color> víi chñng lo¹i vµ sè l­îng kh¸c nhau, nh­ thÕ míi cã thÓ lµm ra cùc phÈm. Ng­¬i h·y nhí tèi ®a chØ cã thÓ thªm vµo <color=yellow>10 lo¹i<color> vËt liÖu.",
		 "§­îc råi! L·o ®©y tin r»ng ng­¬i ®· hiÓu biÕt chót İt vÒ kü n¨ng s¶n xuÊt, mçi ng­êi <color=yellow>chØ cã thÓ häc mét kü n¨ng s¶n xuÊt<color>. Giê ng­¬i h·y ®Õn <color=yellow>TuyÒn Ch©u t×m Lı Phong Thu<color>, nguyªn nh©n th× ®Õn ®ã kh¾c biÕt.")
	return
end;

