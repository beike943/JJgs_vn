-- =========================================
-- File : ÖĞÔ­¶şÇø£¬³É¶¼£¬¶Ì±øÆ÷¶ÍÔì.lua
-- Name : Äª¶ş
-- ID   : 1, 3
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")
--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- ĞÂÊÖÈÎÎñ
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°Çé¿ö¼ÇÂ¼
LEVELTASKID49			= 517		-- ÍÌÁú±¦µ¶ÈÎÎñ
TASK49_BEGGING			= 1933		-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
RESET_ERROR				= 1938		-- ĞŞ¸´ÍâÍø´íÎó±êÊ¾
FORGETMAIN_NUM			= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
FORGETOHTER_NUM			= 1941		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*****************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Muèn lµm trang bŞ cã thuéc tİnh b¸t qu¸i, nhÊt ®Şnh cÇn trang bŞ cã 3 thuéc tİnh Èn!");
	end;
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
	local strtab = {
    "Häc kü n¨ng chÕ t¹o binh khİ ng¾n./luaLearnLifeSkill",
		"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
    "Hñy bá kü n¨ng chÕ t¹o binh khİ ng¾n/forget_life_skill",
--    "Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		"Häc c¸ch lµm vò khİ linh khİ cÊp 76/xinwuqi",
    "T×m hiÓu vËt phô gia/Dating"
    }		
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 3) == 79 then
		tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
	end 
	tinsert(strtab,"Rêi khái/SayHello");
	Say(strTitle.."Ta tªn M¹c Tam truyÒn nh©n ®êi thø 73 cña Can T­¬ng M¹c Tµ, së tr­êng ChÕ t¹o thÇn binh lîi khİ, nhÊt lµ nh÷ng binh khİ ng¾n nh­: §ao, KiÕm, bao tay. Ch¼ng hay ta cã thÓ gióp g× cho b»ng h÷u?",
    	getn(strtab),
    	strtab)
end;

-- ËùÓĞÅä·½Ïà¹ØµÄÊÂÇé
function learn_all_recipe()
	Say(strTitle.."Ng­¬i muèn häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ?",
		7,
    	"Häc c¸ch phèi chÕ míi/luaLearnRecipe",
    	"Häc phèi chÕ trang bŞ Linh §å/learnLtEquip",
    	"Häc c¸ch phèi chÕ dµnh cho ho¹t ®éng cuèi tuÇn/Weekend",
		"Xem nhËn ®­îc nhiÖm vô vò khİ cÊp 76 kh«ng/get_76_task",
		"Häc c¸ch phèi chÕ cÊp 76/relearn_76_recipe",
    	"Häc thªm c¸ch phèi chÕ song ®ao/luaLearnRecipeDdao",
    	"Rêi khái/SayHello")
end;


-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
	---------------------------------------76¼¶ÎäÆ÷Åä·½ÈÎÎñ--------------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_76 = GetTask(TASK_76WEAPON)
		
	if (nSkillGenre == 1 and nSkillDetail == 3 and nSkillLevel >= 79) then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_76 == 0 then
			weapon_76_001(2)
			return
		--ÉÏ½»ÎäÆ÷
		elseif nTaskState_76 == 1 then
			weapon_76_002(2)
			return
		--Î´ÓëÎåÎ»ÕÆÃÅ¶Ô»°
		elseif nTaskState_76 == 2 then
			weapon_76_004(2)
			return
		--ÒÑ¾­ÓëÎåÎ»ÕÆÃÅ¶Ô»°
		elseif nTaskState_76 == 3 then
			weapon_76_005(2)
			return
		--Ñ¡ÔñÑ§Ï°Éñ±øµÄ·½Ïò
		elseif nTaskState_76 == 4 then
			weapon_76_choice(2)
			return
		end 
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail ~= 3 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail)
	end
	
	Say("B¹n ch­a ®ñ ®iÒu kiÖn nhËn nhiÖm vô phèi chÕ cÊp 76.", 0)
end;



-- ²¹Ñ§76¼¶Åä·½
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 3)
	if (nGene == 1 and nSkillID == 3) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(793) == 0 and 
				HaveLearnRecipe(794) == 0 and 
				HaveLearnRecipe(797) == 0 and 
				HaveLearnRecipe(804) == 0) then
				Say("H·y chän 1 lo¹i vò khİ b¹n muèn häc c¸ch chÕ t¹o:",
					5,
					"Hé thñ/learn_long_1",   
					"KiÕm/learn_long_2",  
					"§ao/learn_long_3",    
					"Song ®ao/learn_long_4",    
					"Ta suy nghÜ l¹i/SayHello")
			else
				Say("B¹n ®· häc ®­îc ph­¬ng ph¸p phèi chÕ míi!", 0)
			end
		else
			Say("B¹n ch­a lµm nhiÖm vô phèi chÕ cÊp 76", 0)
		end
	else
		Say("B¹n ch­a häc kü n¨ng:<color=yellow>ChÕ t¹o binh khİ ng¾n<color>!", 0)
	end
end;
-- »¤ÊÖ
function learn_long_1()
	AddRecipe(793)
	Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n nhÉn")
end;
-- ½£
function learn_long_2()
	AddRecipe(794)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tinh")
end;
-- µ¶
function learn_long_3()
	AddRecipe(797)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Cæ §İnh")
end;
-- Ë«µ¶
function learn_long_4()
	AddRecipe(804)
	Msg2Player("B¹n häc ®­îc phèi chÕ: L¨ng Phong")
end;



-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(1, 3) > 0) then
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
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng ChÕ t¹o binh khİ ng¾n? Ta kh«ng thÓ gióp ng­¬i!", 0)
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
	
	if (GetLifeSkillLevel(1, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(LEVELTASKID49, 0)
				SetTask(1600, 0);			--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				SetTask(1601, 0);			--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
				Msg2Player("B¹n ®· bá kü n¨ng ChÕ t¹o binh khİ ng¾n")				
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
		Say (strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
  		return
	end

    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
	end
	
	Say(strTitle.."B»ng h÷u muèn häc kü n¨ng <color=yellow>ChÕ t¹o binh khİ ng¾n<color> ­?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end

--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
    	if (LearnLifeSkill(1, 3, 1, 79, 1)) then
        	Msg2Player("B¹n ®· häc kü n¨ng ChÕ t¹o binh khİ ng¾n, nhËn ®­îc 3 h¾c kim phÊn.")
        	AddItem(2, 2, 59, 3)

	    	AddRecipe(49)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Ng­ Thñ")
	   		AddRecipe(50)
	   		Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ma Thñ")
    		AddRecipe(62)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Linh Xµ KiÕm")
			AddRecipe(63)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Sa KiÕm")
    		AddRecipe(73)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Giíi §ao")
    		AddRecipe(74)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: ChiÕt ThiÕt §ao")
    		AddRecipe(782)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
    		AddRecipe(783)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
        	SetTask(LEV_LEARNRECIPE, 10)
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
	local nLevel = GetLifeSkillLevel(1, 3);
	if GetLifeSkillLevel(1, 3)>1 then
		if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
			AddRecipe(49)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Ng­ Thñ")
	   		AddRecipe(50)
	   		Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ma Thñ")
    		AddRecipe(62)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Linh Xµ KiÕm")
			AddRecipe(63)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Sa KiÕm")
    		AddRecipe(73)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: Giíi §ao")
    		AddRecipe(74)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: ChiÕt ThiÕt §ao")
    		AddRecipe(782)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
    		AddRecipe(783)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
        	SetTask(LEV_LEARNRECIPE, 10)
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(51)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn V©n Thñ")
        	AddRecipe(52)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tam D­¬ng Thñ")
        	AddRecipe(64)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Minh KiÕm")
        	AddRecipe(65)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt S¸t KiÕm")
        	AddRecipe(75)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: LiÖt DiÖm §ao")
        	AddRecipe(76)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Hæ §o¹n M«n §ao")
        	AddRecipe(784)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
        	AddRecipe(785)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
        	SetTask(LEV_LEARNRECIPE,20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(53)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Ng­u Thñ")
        	AddRecipe(66)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Hµm Quang KiÕm")
        	AddRecipe(77)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Cöu ¢m §ao")
        	AddRecipe(786)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
        	SetTask(LEV_LEARNRECIPE,30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(54)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch Xµ Thñ")
        	AddRecipe(55)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Kh¸ng Long Thñ")
        	AddRecipe(67)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c D­¬ng")
        	AddRecipe(68)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÒn §iÖn")
        	AddRecipe(78)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ S¬n §ao")
        	AddRecipe(79)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nh©n §å §ao")
        	AddRecipe(787)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
        	AddRecipe(788)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
        	SetTask(LEV_LEARNRECIPE,40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(56)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: T­êng Phông")
        	AddRecipe(57)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Né Long")
        	AddRecipe(69)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh S­¬ng")
        	AddRecipe(70)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Dao Quang")
        	AddRecipe(80)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Long L©n")
        	AddRecipe(81)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¸ch Bİch")
        	AddRecipe(789)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Uyªn ¦¬ng Liªn Hoµn")
        	SetTask(LEV_LEARNRECIPE,50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(58)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Ph­¬ng Quû Chóng")
        	AddRecipe(71)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch HuyÕt")
        	AddRecipe(82)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn S¸t")
        	AddRecipe(790)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Liªn Hoµn")
        	SetTask(LEV_LEARNRECIPE,60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(59)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Nª Lª §Şa Ngôc")
        	AddRecipe(72)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÒn thiÕt Träng KiÕm")
        	AddRecipe(83)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B¸ V­¬ng")
        	AddRecipe(791)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: T«i NguyÖt")
        	SetTask(LEV_LEARNRECIPE,70)
      	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
        	AddRecipe(792)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹n Tr­êng")
        	SetTask(LEV_LEARNRECIPE,80)
    	else
        	Say (strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
    	end
    end
end

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 3)
	if nLevel >= 79 then
    	AddRecipe(1114)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å ThiÕu L©m §ao"))
    	AddRecipe(1116)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å ThiÕu L©m Thñ"))
    	AddRecipe(1118)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Nga My KiÕm"))
    	AddRecipe(1120)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å C¸i Bang Thñ"))
    	AddRecipe(1122)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Vâ §ang KiÕm"))
    	AddRecipe(1126)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Ngò §éc §ao"))
    	AddRecipe(1128)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å C«n L«n KiÕm"))
	else
    	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
	end
end

--²¹Ñ§Ë«µ¶Åä·½
function luaLearnRecipeDdao()
		local nLevel = GetLifeSkillLevel(1, 3);
		if GetLifeSkillLevel(1, 3)>1 then
    if GetTask(LEV_LEARNRECIPE)==10 and HaveLearnRecipe(782)==0 then
    	AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
    elseif GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
    elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
      AddRecipe(786)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
      elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
      AddRecipe(786)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
      AddRecipe(787)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
      AddRecipe(788)
      Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
      elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
      AddRecipe(786)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
      AddRecipe(787)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
      AddRecipe(788)
      Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
      AddRecipe(789)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Uyªn ¦¬ng Liªn Hoµn")
      elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
      AddRecipe(786)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
      AddRecipe(787)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
      AddRecipe(788)
      Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
      AddRecipe(789)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Uyªn ¦¬ng Liªn Hoµn")
      AddRecipe(790)
      Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Liªn Hoµn")
      elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
      AddRecipe(786)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
      AddRecipe(787)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
      AddRecipe(788)
      Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
      AddRecipe(789)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Uyªn ¦¬ng Liªn Hoµn")
      AddRecipe(790)
      Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Liªn Hoµn")
      AddRecipe(791)
      Msg2Player("B¹n häc ®­îc phèi chÕ: T«i NguyÖt")
      elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(782)==0 then
      AddRecipe(782)
      Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp Song §ao")
      AddRecipe(783)
      Msg2Player("B¹n häc ®­îc phèi chÕ: NguyÖt Nha Thİch")
      AddRecipe(784)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §èi Phi Thİch")
      AddRecipe(785)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ên §ao")
      AddRecipe(786)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Biªn Bøc §ao")
      AddRecipe(787)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Né Hång")
      AddRecipe(788)
      Msg2Player("B¹n häc ®­îc phèi chÕ: B¸o Hoa")
      AddRecipe(789)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Uyªn ¦¬ng Liªn Hoµn")
      AddRecipe(790)
      Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Liªn Hoµn")
      AddRecipe(791)
      Msg2Player("B¹n häc ®­îc phèi chÕ: T«i NguyÖt")
      AddRecipe(792)
      Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹n Tr­êng")
      end
     end
    end
      
--¶Ô¼¼ÄÜµÄËµÃ÷ĞÅÏ¢
function Weekend()
    if (GetLifeSkillLevel(1, 3) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Say(strTitle.."TiÒn tuyÕn chiÕn tranh ¸c liÖt, ta cã 1 c¸ch chÕ t¹o vò khİ rÊt ®éc ®¸o, muèn truyÒn thô cho ng­¬i, ng­¬i h·y chÕ t¹o vò khİ chi viÖn cho tiÒn tuyÕn gióp ®ì triÒu ®×nh!", 0)
    	AddRecipe(228)
    	Msg2Player("B¹n häc ®­îc phèi chÕ-- Qu©n dông tr­êng kiÕm!")
    else
   		Say(strTitle.."Ng­¬i vÉn ch­a häc kü n¨ng ChÕ t¹o binh khİ ng¾n hoÆc ch­a ®ñ kinh nghiÖm, ta kh«ng thÓ truyÒn thô c¸ch phèi chÕ nµy.", 0)
    end
end


--Ìí¼ÓÎïĞÅÏ¢
function Dating()
	Talk(1,"",strTitle.."Muèn chÕ t¹o 1 binh khİ tuyÖt thÕ v« song, cÇn ph¶i bá thªm nhiÒu vËt phô gia, ng­¬i h·y thö bá thªm 1 sè vËt liÖu tèt, cã thÓ sÏ rÌn ®­îc nh÷ng vò khİ cã mét kh«ng hai.")
end

--È¡Ïûº¯Êı
function SayHello()
end

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang bŞ b¸t qu¸i<color>lµ huynh ®Ö M¹c gia ta vµ l·o L­u ë T­¬ng D­¬ng, CÈm N­¬ng ®· toµn lùc cïng nhau nghiªn cøu ra t©m huyÕt. Lµm thÕ nµo nhËn ®­îc nh÷ng mãn cã linh th¹ch ng­¬i ®i hái truyÒn nh©n sÏ râ, nÕu ng­¬i muèn t×m hiÓu lµm thÕ nµo chÕ t¹o ®­îc <color=yellow>trang bŞ<color> kh¶m linh th¹ch, th× ®Õn chç ta t×m hiÓu nhĞ.",
	4,
	"Lµm sao chÕ t¹o trang bŞ cã lç kh¶m n¹m/kongzhuangbeizhizuo",
	"VËt phÈm thªm vµo cã t¸c dông g×/tianjiawu",
	"Lµm sao trang bŞ ®­îc chÕ t¹o thµnh trang bŞ B¸t Qu¸i/xiangqianzhuyi",
	"§Õn hái th¨m th«i mµ!/SayHello"
	)
end

function kongzhuangbeizhizuo()
	Talk(1,"",strTitle.."RÊt ®¬n gi¶n, qua nghiªn cøu cña bän ta, c¶i tiÕn ph­¬ng ph¸p chÕ t¹o ta truyÒn thô cho c¸c ng­¬i, b©y giê ng­¬i ®ang thu thËp nguyªn liÖu ë khu vùc thu thËp, nh÷ng trang bŞ chÕ t¹o ra cã møc linh khİ tèi ®a vµ cã thÓ cã lç kh¶m n¹m, nh­ng mµ còng chİnh v× vËy, nh÷ng trang bŞ cã thuéc tİnh linh khİ kh«ng cßn chÕ t¹o ®­îc n÷a.")
end

function tianjiawu()
	Talk(1,"",strTitle.."V¹n vËt trªn thÕ gian ®Òu cã gi¸ trŞ riªng, gi¸ trŞ tïy vµo linh khİ İt hay nhiÒu, khi chÕ t¹o trang bŞ t¨ng vËt phÈm thªm vµo, cã thÓ t¨ng møc linh khİ tèi ®a vµ t¨ng sè lç kh¶m n¹m linh th¹ch trªn trang bŞ. Møc linh khİ tèi ®a cña trang bŞ quyÕt ®Şnh møc linh khİ ®Ó kh¶m n¹m linh th¹ch, vµ sè lç quyÕt ®Şnh nã cã thÓ kh¶m bao nhiªu linh th¹ch, cã thÓ thµnh thuéc tİnh b¸t qu¸i hay kh«ng, cho nªn nÕu ®­îc th× cè g¾ng thªm vµi vËt cã gi¸ trŞ.")
end

function xiangqianzhuyi()
	Talk(1,"",strTitle.."ë trªn ®· nh¾c ®Õn råi, trªn trang bŞ cã møc linh khİ tèi ®a vµ lç kh¶m n¹m, 1 trang bŞ kh¶m <color=yellow>3 viªn<color> linh th¹ch, khi møc linh khİ cña 3 viªn linh th¹ch b»ng víi møc linh khİ tèi ®a cña trang bŞ, sÏ h×nh thµnh trang bŞ thuéc tİnh b¸t qu¸i. Linh th¹ch lµ sè lÎ th× møc linh khİ ©m, Linh th¹ch lµ sè ch½n th× møc linh khİ d­¬ng, nÕu thø tù Linh Th¹ch ®­îc kh¶m kh«ng gièng nhau, th× trang bŞ cã thuéc tİnh b¸t qu¸i kh¸c nhau, trªn \'B¸t qu¸i B¶o §iÓn\' dµnh cho hËu duÖ cña C«ng D· ThÕ Gian cã ghi rÊt râ lµm thÕ nµo ®Ó chÕ t¹o 1 trang bŞ cã thuéc tİnh b¸t qu¸i mong muèn, cã thêi gian th× xem.")
end
function xinwuqi()
	local nLevel = GetLifeSkillLevel(1, 3)
	if (GetLifeSkillLevel(1, 3) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1007) == 0) then
        	AddRecipe(1003)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n nhÉn")
        	AddRecipe(1004)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Tinh")
        	AddRecipe(1014)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¨ng Phong")
        	AddRecipe(1007)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Cæ §İnh") 
       else
        	Say(strTitle.."Nµy, ng­êi thanh niªn, ®õng sèt ruét, tè chÊt cña ng­¬i b©y giê cßn kĞm l¾m, ®îi ng­¬i sö dông thµnh th¹o tÊt c¶ c¸c lo¹i binh khİ dµi th«ng th­êng, lóc ®ã ®Õn t×m ta.",0)
    end
end
end

function update_max_skill_level()
	Say(strTitle..format("Më réng cÊp kü n¨ng s¶n xuÊt cÇn kü n¨ng thu thËp ®¹t cÊp 79 ®ång thêi tiªu hao %d Vµng", 1000), 
		2, "§ång ı/update_max_skill_level_ensure", "T¹i h¹ chØ xem qua th«i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 3) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng s¶n xuÊt ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 3, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng s¶n xuÊt ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end

