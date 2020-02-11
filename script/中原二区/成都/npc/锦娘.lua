-- =========================================
-- File : ÖĞÔ­¶şÇø£¬³É¶¼£¬½õÄï.lua
-- Name : ½õÄï
-- ID   : 1, 5
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")
--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°Çé¿ö¼ÇÂ¼
LEVELTASKID49			= 518		-- »¨Áı°ÙÄñÈ¹
RECIPE_SEX				= 1935		-- Åä·½Ñ§Ï°ÄĞÅ®Ñ¡Ôñ
RESET_ERROR				= 1938		-- ĞŞ¸´ÍâÍø´íÎó±êÊ¾
TASK49_BEGGING			= 1933		-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
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
		NpcChat(GetTargetNpc(),"Muèn lµm trang bŞ cã linh khİ cao, nhÊt ®Şnh ph¶i thªm vËt phÈm cã gi¸ trŞ cao vµo!");
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
		"Häc kü n¨ng chÕ t¹o hé gi¸p./luaLearnLifeSkill",
		"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
		"Hñy bá kü n¨ng chÕ t¹o hé gi¸p./forget_life_skill",
--		"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		"T×m hiÓu vËt phô gia/Dating"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 5) == 79 then
		tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
	end 
	tinsert(strtab,"Rêi khái/SayHello");
	Say(strTitle.."Ta chİnh lµ CÈm N­¬ng, tinh th«ng nghÒ may v¸, b»ng h÷u cÇn g× xin cø nãi?",
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
		"Häc c¸ch phèi chÕ y phôc cao cÊp s­ m«n nam kh«i ng« C¸i Bang « y./GB_Cloth",
		"Rêi khái/SayHello")
end;


-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
 ----------------------------------76¼¶ÎäÆ÷Åä·½É½Ê¨¾«Æ¤ÈÎÎñ----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI)
		
	if (nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79) then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_shanshi == 0 then
			weave_shanshi_001()
			return
		--ÉĞÎ´ÓëÅ®×°µêÀÏ°å¶Ô»°
		elseif nTaskState_shanshi == 1 or nTaskState_shanshi == 2 then
			weave_shanshi_002()
			return
		--´Ó´óÀí»ØÀ´»Ø¸´½õÄï
		elseif nTaskState_shanshi == 3 then
			weave_shanshi_007()
			return
		--»¹Î´Óë»Æ´óÉô¶Ô»°
		elseif nTaskState_shanshi == 4 then
			weave_shanshi_008()
			return
		--´ø»Ø5Æ¥ÎÚ²ÏË¿²¢Ñ§»áÉ½Ê¨¾«Æ¤Åä·½
		elseif nTaskState_shanshi == 5 then
			weave_shanshi_011()
			return			
		end 
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail ~= 5 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
	end
	Say("B¹n ch­a ®ñ ®iÒu kiÖn nhËn nhiÖm vô phèi chÕ cÊp 76.", 0)
end;


-- ²¹Ñ§76¼¶Åä·½
function relearn_76_recipe()
	local nGene, nSkillID = GetMainLifeSkill()
	local nLevel = GetLifeSkillLevel(1, 5)
	if (nGene == 1 and nSkillID == 5) then
		if (GetTask(1604) == 6 and nLevel >= 79) then
			AddRecipe(807)
			Msg2Player("B¹n häc ®­îc phèi chÕ: S¬n S­ Tinh B×")
		else
			Say("B¹n ch­a lµm nhiÖm vô chÕ t¹o hé gi¸p cÊp 76", 0)
		end
	else
		Say("B¹n ch­a häc kü n¨ng:<color=yellow>ChÕ t¹o hé gi¸p<color>!", 0)
	end
end;



-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(1, 5) > 0) then
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
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng chÕ t¹o hé gi¸p? Ta kh«ng thÓ gióp ng­¬i!", 0)
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
	
	if (GetLifeSkillLevel(1, 5) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 5)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(518, 0)
				SetTask(RECIPE_SEX, 0)
				SetTask(1604, 0);			--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ				
				Msg2Player("B¹n ®· bá kü n¨ng chÕ t¹o hé gi¸p.")				
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


--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
--¼¼ÄÜÑ§Ï°Ñ¡Ôñ
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
		Say(strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
	end

	Say(strTitle.."B»ng h÷u muèn häc kü n¨ng <color=yellow>ChÕ t¹o hé gi¸p<color> ­?",
    	2,
    	"Ta muèn häc/LearnAsMain",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end

function LearnAsMain()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."ChÕ t¹o hé gi¸p cã 2 lo¹i: <color=yellow>Nam y<color> vµ <color=yellow>N÷ y<color>, ng­¬i muèn häc lo¹i nµo?",
		3,
		"Nam y./ChooseMan",
		"N÷ y./ChooseWomen",
		"§Ó ta suy nghÜ./LearnNo")
	end
end

function RecipeMan()
  AddRecipe(145)
  Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kh©m Bè Y")
	AddRecipe(146)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Bµn Long Tó")
	AddRecipe(147)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Th­¬ng Lang Y")
	AddRecipe(148)
	Msg2Player("B¹n häc ®­îc phèi chÕ: YÓm T©m Gi¸p")
	AddRecipe(163)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Thó §Çu Hé Kiªn")
	AddRecipe(164)
	Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Ti C©n")
	AddRecipe(165)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Hµo HiÖp Y")
	AddRecipe(166)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Ngäc Trï Sam")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;

function RecipeWomen()
	AddRecipe(181)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Nhung Th­êng")
	AddRecipe(182)
	Msg2Player("B¹n häc ®­îc phèi chÕ: T©m Ên Th­êng")
	AddRecipe(183)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ LuyÖn Th­êng")
	AddRecipe(184)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Ma Th­êng")
	AddRecipe(199)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö K×nh Sam")
	AddRecipe(200)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Linh VËn Th­êng")
	AddRecipe(201)
	Msg2Player("B¹n häc ®­îc phèi chÕ: C©n Quèc Sam")
	AddRecipe(202)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Phong Vò Th­êng")
			
  SetTask(LEV_LEARNRECIPE, 10)
  SetTask(RECIPE_SEX, 2)
end;

--Ñ§Ï°¼¼ÄÜ
function ChooseMan()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 5, 1, 79, 1)) then
      Msg2Player("B¹n ®· häc kü n¨ng sèng: chÕ t¹o hé gi¸p, nhËn ®­îc 3 sîi sa tuyÕn.")
      AddItem(2, 2, 62, 3)
      		
      AddRecipe(145)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kh©m Bè Y")
			AddRecipe(146)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Bµn Long Tó")
			AddRecipe(147)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Th­¬ng Lang Y")
			AddRecipe(148)
			Msg2Player("B¹n häc ®­îc phèi chÕ: YÓm T©m Gi¸p")
			AddRecipe(163)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thó §Çu Hé Kiªn")
			AddRecipe(164)
			Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Ti C©n")
			AddRecipe(165)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hµo HiÖp Y")
			AddRecipe(166)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Ngäc Trï Sam")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;

function ChooseWomen()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 5, 1, 79, 1)) then
  		Msg2Player("B¹n ®· häc kü n¨ng sèng: chÕ t¹o hé gi¸p, nhËn ®­îc 3 sîi sa tuyÕn.")
  		AddItem(2, 2, 62, 3)
    		
  		AddRecipe(181)
  		Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Nhung Th­êng")
			AddRecipe(182)
			Msg2Player("B¹n häc ®­îc phèi chÕ: T©m Ên Th­êng")
			AddRecipe(183)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ LuyÖn Th­êng")
			AddRecipe(184)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Ma Th­êng")
			AddRecipe(199)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö K×nh Sam")
			AddRecipe(200)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Linh VËn Th­êng")
			AddRecipe(201)
			Msg2Player("B¹n häc ®­îc phèi chÕ: C©n Quèc Sam")
			AddRecipe(202)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phong Vò Th­êng")
			
	    SetTask(LEV_LEARNRECIPE, 10)
	    SetTask(RECIPE_SEX, 2)
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
--Ñ§Ï°ĞÂµÄÅä·½,·ÖÎªÄĞ×°Ñ§Ï°ÓëÅ®×°Ñ§Ï°
function luaLearnRecipe()
	local nLevel = GetLifeSkillLevel(1, 5)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."ChÕ t¹o hé gi¸p cã 2 lo¹i: <color=yellow>Nam y<color> vµ <color=yellow>N÷ y<color>, ng­¬i muèn häc lo¹i nµo?",
			3,
			"Nam y./RecipeMan",
			"N÷ y./RecipeWomen",
			"§Ó ta suy nghÜ./LearnNo")
		return
	end
	
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(167)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc L©m trang")
			AddRecipe(168)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hoµng Hæ b× y")
			AddRecipe(149)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Hµnh phôc")
			AddRecipe(150)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh S­¬ng bµo")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(169)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Ng­u hé gi¸p")
			AddRecipe(170)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Thanh S­¬ng Hoa sam")
			AddRecipe(151)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tham Lam y")
			AddRecipe(152)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch §ång trô")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(171)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Cï Nhiªm kh¸ch y")
			AddRecipe(172)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn NhÉn bİ trang")
			AddRecipe(153)
			Msg2Player("B¹n häc ®­îc phèi chÕ: NhuyÔn Kim y")
			AddRecipe(154)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Th­¬ng Lan y")
			SetTask(LEV_LEARNRECIPE,40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(173)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn S¸ch kim gi¸p")
			AddRecipe(174)
			Msg2Player("B¹n häc ®­îc phèi chÕ: L«i Ng©n Gi¸p")
			AddRecipe(155)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Lam K×nh bØ gi¸p")
			AddRecipe(156)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Long bµo")
			SetTask(LEV_LEARNRECIPE,50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(175)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang HuyÒn kim gi¸p")
			AddRecipe(176)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Thï Th¸nh sam")
			AddRecipe(158)
			Msg2Player("B¹n häc ®­îc phèi chÕ: B¨ng Tµm Trï sam")
			AddRecipe(157)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Lang y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(177)
			Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Hµ Quû V­¬ng kh¶i")
			AddRecipe(159)
			Msg2Player("B¹n häc ®­îc phèi chÕ: S¬n Quû HuyÕt y")
			AddRecipe(178)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Long B¸ ¤ kim y")
			AddRecipe(160)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Gi¸ng bµo")
			SetTask(LEV_LEARNRECIPE,70)
		else
		    Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
		end
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(185)
			Msg2Player("B¹n häc ®­îc phèi chÕ: LuyÖn Gi¸p th­êng")
			AddRecipe(186)
			Msg2Player("B¹n häc ®­îc phèi chÕ: C¸n Hoa th­êng")
			AddRecipe(203)
			Msg2Player("B¹n häc ®­îc phèi chÕ: MËt V©n sam")
			AddRecipe(204)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vò §Êu th­êng")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(187)
			Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Anh th­êng")
			AddRecipe(188)
			Msg2Player("B¹n häc ®­îc phèi chÕ: N÷ KiÖt th­êng")
			AddRecipe(205)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Tµm gi¸p y")
			AddRecipe(206)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Khëi La th­êng")
			SetTask(LEV_LEARNRECIPE,30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(189)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Linh th­êng")
			AddRecipe(190)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Nghª th­êng")
			AddRecipe(207)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn C«ng ®Êu y")
			AddRecipe(208)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Linh Lung th­êng")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(191)
			Msg2Player("B¹n häc ®­îc phèi chÕ: L©n Quang gi¸p y")
			AddRecipe(192)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hå C¬ vò y")
			AddRecipe(209)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thó V­¬ng ®Êu y")
			AddRecipe(210)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Th¸i Hoa th­êng")
			SetTask(LEV_LEARNRECIPE,50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(193)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Minh Quang gi¸p y")
			AddRecipe(194)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Nghª Th­êng vò y")
			AddRecipe(211)
			Msg2Player("B¹n häc ®­îc phèi chÕ: NghŞch V©n ®Êu y")
			AddRecipe(212)
			Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm V©n th­êng")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(195)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Y")
			AddRecipe(196)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Thiªn th¸i th­êng")
			AddRecipe(213)
			Msg2Player("B¹n häc ®­îc phèi chÕ: V« Song ®Êu y")
			AddRecipe(214)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Th¸i nghª th­êng")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 5)
	if nLevel >= 79 then
    	AddRecipe(1135)
    	AddRecipe(1136)
    	AddRecipe(1137)
    	AddRecipe(1138)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Y"))
	else
    	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
	end
end

--¶Ô¼¼ÄÜµÄËµÃ÷ĞÅÏ¢
function Weekend()
    if (GetLifeSkillLevel(1, 5) >= 1 and 
    	(CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1)) then
    	Talk(1,"",strTitle.."TiÒn tuyÕn chiÕn tranh ¸c liÖt, ta cã 1 c¸ch chÕ t¹o hé gi¸p rÊt ®éc ®¸o, muèn truyÒn thô cho ng­¬i, ng­¬i h·y chÕ t¹o chiÕn gi¸p chi viÖn cho tiÒn tuyÕn gióp ®ì triÒu ®×nh!")
    	AddRecipe(230)
    	Msg2Player("B¹n häc ®­îc phèi chÕ-- qu©n dông kh«i gi¸p!")
    else
    	Talk(1,"",strTitle.."Ng­¬i vÉn ch­a häc kü n¨ng chÕ t¹o hé gi¸p hoÆc ch­a ®ñ kinh nghiÖm, ta kh«ng thÓ truyÒn thô c¸ch phèi chÕ nµy.")
    end
end;

--È¡Ïûº¯Êı
function SayHello()
end

--Ìí¼ÓÎïĞÅÏ¢
function Dating()
	Talk(1, "", strTitle.."Muèn chÕ t¹o 1 binh khİ tuyÖt thÕ v« song, cÇn ph¶i bá thªm nhiÒu vËt phô gia, ng­¬i h·y thö bá thªm 1 sè vËt liÖu tèt, cã thÓ sÏ rÌn ®­îc nh÷ng vò khİ cã mét kh«ng hai.")
end

--²¹Ñ§Ø¤°ïÎÛÒÂÒÂ·şÅä·½
function GB_Cloth()
	if (HaveLearnRecipe(871) > 0 and HaveLearnRecipe(873) > 0 and 
		HaveLearnRecipe(874) > 0 and HaveLearnRecipe(872) == 0) then
		AddRecipe(872)
		Msg2Player("B¹n häc ®­îc c¸ch lµm: Tô NghÜa th­êng")
	end
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>Trang bŞ b¸t qu¸i<color> lµ ta cïng huynh ®Ö M¹c gia vµ l·o L­u ë T­¬ng D­¬ng, ®· toµn lùc cïng nhau nghiªn cøu ra t©m huyÕt. Lµm thÕ nµo nhËn ®­îc nh÷ng mãn cã linh th¹ch ng­¬i ®i hái truyÒn nh©n sÏ râ, nÕu ng­¬i muèn t×m hiÓu lµm thÕ nµo chÕ t¹o ®­îc <color=yellow>trang bŞ<color> kh¶m linh th¹ch, th× ®Õn chç ta t×m hiÓu nhĞ.",
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

function update_max_skill_level()
	Say(strTitle..format("Më réng cÊp kü n¨ng s¶n xuÊt cÇn kü n¨ng thu thËp ®¹t cÊp 79 ®ång thêi tiªu hao %d Vµng", 1000), 
		2, "§ång ı/update_max_skill_level_ensure", "T¹i h¹ chØ xem qua th«i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 5) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng s¶n xuÊt ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 5, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng s¶n xuÊt ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end