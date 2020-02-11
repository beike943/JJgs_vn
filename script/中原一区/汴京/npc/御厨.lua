-- =========================================
-- File : ÖĞÔ­Ò»Çø£¬ãê¾©£¬Óù³ø.lua
-- Name : Óù³ø
-- ID   : 1, 7
-- =========================================
Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua")

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEVELTASKID49			= 516		-- µ±¹éìÀÉßÌÀ
TASKID_LIFESKILL_FLG	= 1932		-- 49ÈÎÎñ×é¶ÓËæ»úÊı
TASK_GATHER_FLAG		= 1931 		-- ÈÎÎñÎïÆ·²É¼¯±êÊ¾
FORGETMAIN_NUM			= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
FORGETOHTER_NUM			= 1941		-- ÒÅÍü¸¨¼¼ÄÜ´ÎÊı
strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*****************************************
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
	
	-----------------------------------------ĞÂÊÖÈÎÎñ-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
		Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
		TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")      
        return 
    end
    
 ---------------------------------------------Ö÷¶Ô»°-------------------------------------------
	Say (strTitle.."Ta lµ ®Çu bÕp næi tiÕng trong thiªn h¹, ng­êi b¹n trÎ cÇn gióp g× kh«ng?",
	4,
	"Häc kü n¨ng nÊu n­íng/luaLearnLifeSkill",
	"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
	"Bá kü n¨ng nÊu n­íng/forget_life_skill",
	"Rêi khái/SayHello11")
end;


-- ËùÓĞÅä·½Ïà¹ØµÄÊÂÇé
function learn_all_recipe()
	Say(strTitle.."Ng­¬i muèn häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ?",
		6,
		"Häc c¸ch phèi chÕ míi/luaLearnRecipe",
		"Häc c¸ch phèi chÕ dµnh cho ho¹t ®éng cuèi tuÇn/Weekend",
		"Xem nhËn ®­îc nhiÖm vô vò khİ cÊp 76 kh«ng/get_76_task",
		"Häc c¸ch phèi chÕ cÊp 76/relearn_76_recipe",
		"Häc söa phèi chÕ/Reset_Learn",
		"Rêi khái/SayHello11")
end;


-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
	----------------------------------76¼¶ÎäÆ÷Åä·½ÌúÉÈ¾«Ä¾ÈÎÎñ----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail);
	local nTaskState_tieshan = GetTask(TASK_COOKING_TIESHAN)
		
	if nSkillGenre == 1 and nSkillDetail == 7 and nSkillLevel >= 79 then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_tieshan == 0 then
			cooking_tieshan_001()
			return
		--ÉÏ½»¾Æ²Ë
		elseif nTaskState_tieshan == 1 then
			cooking_tieshan_002()
			return
		--Î´ÓëÁõÒ»¸«¶Ô»°
		elseif nTaskState_tieshan == 2 then
			cooking_tieshan_004()
			return
		--ÉÏ½»ÂÊÈ»Ô­Æ¤ºÍÌúÉÈÄ¾Ñ§»áÌúÉÈ¾«Ä¾Åä·½
		elseif nTaskState_tieshan == 4 then
			cooking_tieshan_008()
			return
		end 
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail ~= 7 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
	end	
	
	Say("B¹n ch­a ®ñ ®iÒu kiÖn nhËn nhiÖm vô phèi chÕ cÊp 76.", 0)
end;



-- ²¹Ñ§76¼¶Åä·½
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 7)
	if (nGene == 1 and nSkillID == 7) then
		if (GetTask(1603) == 5 and nLevel >= 79) then
			AddRecipe(806)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt PhiÕn Tinh Méc")
		else
			Say("B¹n ch­a lµm nhiÖm vô phèi chÕ nÊu n­íng cÊp 76!", 0)
		end
	else
		Say("B¹n ch­a häc kü n¨ng <color=yellow>NÊu n­íng<color>!", 0)
	end
end;

-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	local nGene, nSkillID = GetMainLifeSkill()
	if (nGene == 1 and nSkillID == 7) then
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
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng nÊu n­íng? Ta kh«ng thÓ gióp ng­¬i!", 0)
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
	if (nGene == 1 and nSkillID == 7) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 7)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
        		SetTask(RESET_ERROR,0)
        		SetTask(1603,0);					--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				Msg2Player("B¹n ®· bá kü n¨ng nÊu n­íng")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;

------------------------------------------Ê±¼äÅĞ¶¨½Å±¾----------------------------------------
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
	end;
end;   


--**********************************************´òÌıÏûÏ¢****************************************
function Dating()
    Say (strTitle.."B¹n trÎ! NÊu n­íng kh«ng dÔ chót nµo ®©u!",0)
end


--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
--¼¼ÄÜÑ§Ï°Ñ¡Ôñ
function luaLearnLifeSkill()
	local nGene,nSKIllId = GetMainLifeSkill()
	if (GetLevel() < 10) then
		Say (strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
		return
	end

    if (GetLifeSkillsNum(1) == 2) then
		Say (strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
    end
   
	Say(strTitle.."B»ng h÷u muèn häc kü n¨ng <color=yellow>NÊu n­íng<color> chø?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
		if LearnLifeSkill(1, 7, 1, 79, 1) then
			Msg2Player("B¹n häc ®­îc kü n¨ng nÊu n­íng, nhËn ®­îc nguyªn liÖu s¬ cÊp.")
			AddItem(1, 3, 19, 9)
			AddItem(1, 3, 9, 6)
	    end
	    
	    AddRecipe(18)
	    Msg2Player("B¹n häc ®­îc phèi chÕ: C¬m n¾m")
	    AddRecipe(25)
	    Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªu §ao tö")
	    SetTask(LEV_LEARNRECIPE, 10)
	    
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."H·y suy nghÜ kü råi quay l¹i ®©y nhĞ!",0)
end



--**********************************************Åä·½Ñ§Ï°²¿·Ö***************************************
--Ñ§Ï°ĞÂµÄÅä·½
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 7)
	if (nLevel >= 1) then 
		if (GetTask(LEV_LEARNRECIPE) >= 20 and HaveLearnRecipe(215) == 0) then
			AddRecipe(215)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: M¨ng xµo")
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
        	AddRecipe(18)
	    	Msg2Player("B¹n häc ®­îc phèi chÕ: C¬m n¾m")
	    	AddRecipe(25)
	    	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªu §ao tö")
	    	SetTask(LEV_LEARNRECIPE, 10)
    	elseif (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
        	AddRecipe(19)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Mµn thÇu")
        	AddRecipe(26)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: N÷ Nhi hång")
        	AddRecipe(215)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: M¨ng xµo")
        	SetTask(LEV_LEARNRECIPE, 20)
    	elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
        	AddRecipe(22)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tø Quı ®Ëu")
        	SetTask(LEV_LEARNRECIPE, 30)
    	elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
        	AddRecipe(20)
        	Msg2Player("B¹n häc ®­îc ph­¬ng ph¸p lµm B¸nh xÕp")
        	AddRecipe(27)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §¹o Hoa h­¬ng")
        	SetTask(LEV_LEARNRECIPE, 40)
    	elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
        	AddRecipe(23)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §Ëu xµo")
        	SetTask(LEV_LEARNRECIPE, 50)
    	elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
        	AddRecipe(21)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¸nh bao thŞt")
        	AddRecipe(28)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tóy Méng töu")
        	SetTask(LEV_LEARNRECIPE, 60)
        elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
        	AddRecipe(24)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¶i xµo tái")
        	SetTask(LEV_LEARNRECIPE, 70)
        elseif (nLevel >= 70 and GetTask(LEV_LEARNRECIPE) == 70) then
    	  	AddRecipe(218)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¬m chiªn trøng")
        	SetTask(LEV_LEARNRECIPE, 80)
        else 
        	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
    	end
    end
end;

--ĞŞ¸´Åä·½
function Reset_Learn()
	if (GetLifeSkillLevel(1, 7) >= 1) then
		SetTask(LEV_LEARNRECIPE, 0)
		Talk(1, "", strTitle.."Phèi chÕ cña ng­¬i ®· ®­îc tu söa, mçi 10 cÊp cã thÓ häc c¸ch phèi chÕ míi.")
		return	
	else
		Talk(1, "", strTitle.."§õng hßng g¹t ta!")
	end
end

--ÖÜÄ©»î¶¯
function Weekend()
	if (GetLifeSkillLevel(1,7) >= 1 and 
		(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Say(strTitle.."Dïng ph­¬ng ph¸p phèi chÕ ®Æc biÖt cña ta cã thÓ lµm ®­îc nhiÒu l­¬ng thùc cung cÊp cho tiÒn tuyÕn!", 0)
    	AddRecipe(233)
    	Msg2Player("B¹n häc ®­îc c¸ch phèi chÕ míi - L­¬ng thùc qu©n dông!")
    else
    	Say(strTitle.."Ng­¬i ch­a häc kü n¨ng nÊu n­íng hoÆc ch­a ®Õn giê, ta kh«ng thÓ truyÒn thô.", 0)
    end
end

--************************************************Í¨ÓÃ´¦Àí**************************************
--¿Õº¯Êı
function SayHello()	
end
