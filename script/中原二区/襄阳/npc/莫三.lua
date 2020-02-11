-- =========================================
-- File : ÖĞÔ­¶şÇø£¬ÏåÑô£¬ÄªÈı.lua
-- Name : ÄªÈı
-- ID   : 1, 4
--2007-02-28£ºÌ«ĞéÈÎÎñÔö¼Ó
--Ôö¼ÓÄÚÈİ£ºÌ«ĞéÈÎÎñÄªÈıµÄ¶Ô»°¡¢½±Àø
--²ß»®ÈË£ºÉòÑó
--´úÂë±àĞ´ÈË£º´å³¤
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lifeskill\\skill_lvlup.lua");
--Ì«ĞéÈÎÎñÔö¼Ó
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("\\script\\task\\lingshi_task.lua")
taixu_jwl_taskID = 998
taixu_jwl_iron_up_num = 996							--Ìá½»µÄÌúÊıÁ¿
taixu_jwl_list = {
	{"Th¸i H­ HuyÔn Ngäc",29,"Cöu Thiªn HuyÒn Ngäc",129},
	{"Th¸i H­ HuyÔn §¸i ",30,"Cöu Thiªn HuyÒn §¸i",130},
	{"Th¸i H­ HuyÔn Hoµn",31,"Cöu Thiªn HuyÒn Hoµn",131},
	{"Th¸i H­ HuyÔn Béi",32,"Cöu Thiªn HuyÒn Béi",132},
	{"Th¸i H­ HuyÔn Giíi",33,"Cöu Thiªn HuyÒn Giíi",133},
	{"Th¸i H­ HuyÔn §¹i",34,"Cöu Thiªn HuyÒn §¹i",134},
	{"Th¸i H­ HuyÔn Th¹ch",35,"Cöu Thiªn HuyÒn Th¹ch",135}
}
mystery_goods_list = {
	{"Ch©n thá",2,1,112},
	{"T¬ kh¸ng Thñy",2,1,114},
	{"Ph¸ Thiªn Cung",2,1,115},
	{"X­¬ng rång",2,1,116},
	{"Tóy Tiªn Cóc",2,1,117},
	{"Thi V­¬ng LÆc Cèt",2,1,118},
	{"Thi Khİ B×nh",2,1,119},
	{"Qu¶n Tö",2,1,120},
	{"Tói Phi Ng­",2,1,121},
	{"B×nh Song Tinh",2,1,122},
	{"X­¬ng sä",2,1,124},
	{"Tô Hån ®Ønh",2,1,125},
	{"L¹p Hoµn",2,1,126},
	{"D¬i ®éc",2,1,127},
	{"Quan m·o",2,1,128},
	{"MËt S¸t LÖnh",2,1,129},
	{"ChÊn Thiªn TuyÕt",2,1,130},
	{"DiÒu",2,1,132},
	{"Con rèi",2,1,133},
	{"Tµo Ng©n",2,1,134},
	{"Hoa Th¹ch C­¬ng",2,1,135},
	{"DÇu ®en",2,1,136},
	{"Tr­êng Thµnh Kİnh",2,1,137},
	{"B¶n ch÷ TÊt Th¨ng",2,1,138},
	{"Khª S¬n chİ",2,1,140},
	{"L«i Viªm Kim Sa",2,1,146},
	{"Thiªn Y V« Phong",2,1,147}
}
taixu_jwl_up_met_table = {
	{2,1,533,"Tinh luyÖn B¨ng Th¹ch",2500,1000,0,100,2,1,562,"C­êng hãa tinh kim"},
	{2,1,533,"Tinh luyÖn B¨ng Th¹ch",50,20,0,50,2,1,560,"C­êng hãa tinh kim s¬ cÊp"},
	{2,1,560,"C­êng hãa tinh kim s¬ cÊp",50,20,0,30,2,1,561,"C­êng hãa tinh kim trung cÊp"},
	{2,1,561,"C­êng hãa tinh kim trung cÊp",50,20,0,20,2,1,562,"C­êng hãa tinh kim"}
}
--½áÊø

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí*********************************
ID_LEARNLIFESKILL			= 1925
LEV_LEARNRECIPE				= 1926		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEVELTASKID49				= 517		-- ÍÌÁú±¦µ¶ÈÎÎñ
TASKID_LIFESKILL_FLG		= 1932		-- 49ÈÎÎñ×é¶ÓËæ»úÊı
TASK_GATHER_FLAG			= 1931		-- ÈÎÎñÎïÆ·²É¼¯±êÊ¾
TASK49_BEGGING				= 1933		-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
FORGETMAIN_NUM				= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
FORGETOHTER_NUM				= 1941		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
HaveWeekend					= 1938		-- ÖÜÄ©Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
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
		NpcChat(GetTargetNpc(),"Tuy ng­¬i cã thÓ theo ta häc c¸ch chÕ t¹o trang bŞ cã linh khİ, nh­ng muèn t×m hiÓu trang bŞ B¸t Qu¸i, ng­¬i nªn ®i t×m ng­êi cña C«ng D· ThÕ Gia!");
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
	--Ì«ĞéÈÎÎñÔö¼Ó
	local taixu_task_step = GetTask(taixu_jwl_taskID)
	local taixu_dia_mo3 = ""
	--½áÊø
	if taixu_task_step == nil or taixu_task_step == 0 then
	    local strtab = {
	    	"Häc kü n¨ng chÕ t¹o Kú M«n binh khİ/luaLearnLifeSkill",
	    	"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
	    	"Quªn kü n¨ng chÕ t¹o Kú M«n binh khİ/forget_life_skill",
--	    	"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
			"Häc c¸ch lµm vò khİ linh khİ cÊp 76/xinwuqi",
	    	"T×m hiÓu vËt phô gia/Dating"
	       	}
			if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
				tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
			end
			if GetLifeSkillMaxLevel(1, 4) == 79 then
				tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
			end 
			tinsert(strtab,"Rêi khái/SayHello");  		    	
	    Say(strTitle.."Dßng hä ta næi tiÕng bëi nghÒ ®óc kiÕm, ng­¬i cã cÇn ta gióp g× kh«ng?",
	    	getn(strtab),
	    	strtab)
	else 
		local qijin_get_flag = BigGetItemCount(2,1,563)
		local qianghua_jin_get_flag = BigGetItemCount(2,1,562)
		if taixu_task_step == 1 then
			taixu_dia_mo3 = "Ta cÇn t¨ng cÊp trang søc Th¸i H­/taixu_jwl_dia_step1"
		elseif qianghua_jin_get_flag == 0 then
			taixu_dia_mo3 = "Ta cÇn luyÖn c­êng hãa tinh kim/taixu_jwl_up_iron"
		elseif qianghua_jin_get_flag ~= 0 and qijin_get_flag == 0 then
			taixu_dia_mo3 = "Ta muèn nhËn ThiÕt chïy/mo3_hammer_add"
		elseif qianghua_jin_get_flag ~= 0 and qijin_get_flag ~= 0 then
			taixu_dia_mo3 = "Kú Kim ta ®· mang ®Õn råi, b¾t ®Çu luyÖn th«i./taixu_jwl_up_jwl"
		end
	  local strtab = {
	    	"Häc kü n¨ng chÕ t¹o Kú M«n binh khİ/luaLearnLifeSkill",
	    	"Häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ/learn_all_recipe",
	    	"Quªn kü n¨ng chÕ t¹o Kú M«n binh khİ/forget_life_skill",
	    	"T×m hiÓu vËt phô gia/Dating",
			"Häc c¸ch lµm vò khİ linh khİ cÊp 76/xinwuqi",
				taixu_dia_mo3
	       }
			if GetTask(TASK_LINGSHI_ID) == 2 then
				tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
			end
			if GetLifeSkillMaxLevel(1, 4) == 79 then
				tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
			end 
			tinsert(strtab,"Rêi khái/SayHello");  	    	  	  
	    Say(strTitle.."Dßng hä ta næi tiÕng bëi nghÒ ®óc kiÕm, ng­¬i cã cÇn ta gióp g× kh«ng?",
	    	getn(strtab),
	    	strtab);		
	end
end;


-- ËùÓĞÅä·½Ïà¹ØµÄÊÂÇé
function learn_all_recipe()
	Say(strTitle.."Ng­¬i muèn häc c¸ch phèi chÕ hoÆc lµm nhiÖm vô phèi chÕ?",
		8,
		"Häc c¸ch phèi chÕ míi/luaLearnRecipe",
		"Häc phèi chÕ trang bŞ Linh §å/learnLtEquip",
		"Häc phèi chÕ vò khİ Thóy Yªn/learnCyEquip",
		"Häc c¸ch phèi chÕ dµnh cho ho¹t ®éng cuèi tuÇn/Weekend",
		"Xem nhËn ®­îc nhiÖm vô vò khİ cÊp 76 kh«ng/get_76_task",
		"Häc c¸ch phèi chÕ cÊp 76/relearn_76_recipe",
		"Phèi ghĞp Bæ Häc Tr¶o/luaLearnRecipeZhua",
		"Rêi khái/SayHello")
end;


-- ½ÓÊÜ76¼¶Åä·½ÈÎÎñ
function get_76_task()
	----------------------------------------76¼¶ÎäÆ÷Åä·½ÈÎÎñ-------------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_76 = GetTask(TASK_76WEAPON)
		
	if (nSkillGenre == 1 and nSkillDetail == 4 and nSkillLevel >= 79) then
		--ÉĞÎ´´¥·¢Åä·½ÈÎÎñ
		if nTaskState_76 == 0 then
			weapon_76_001(3);
			return
		--ÉÏ½»ÎäÆ÷
		elseif nTaskState_76 == 1 then
			weapon_76_002(3);
			return
		--Î´ÓëÎåÎ»ÕÆÃÅ¶Ô»°
		elseif nTaskState_76 == 2 then
			weapon_76_004(3);
			return
		--ÒÑ¾­ÓëÎåÎ»ÕÆÃÅ¶Ô»°
		elseif nTaskState_76 == 3 then
			weapon_76_005(3);
			return
		--Ñ¡ÔñÑ§Ï°Éñ±øµÄ·½Ïò
		elseif nTaskState_76 == 4 then
			weapon_76_choice(3);
			return
		end 
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail ~= 4 and nSkillLevel >= 79 and 
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
	local nLevel = GetLifeSkillLevel(1, 4)
	if (nGene == 1 and nSkillID == 4) then
		if (GetTask(1600) == 5 and nLevel >= 79) then
			if (HaveLearnRecipe(796) == 0 and 
				HaveLearnRecipe(798) == 0 and 
				HaveLearnRecipe(799) == 0 and 
				HaveLearnRecipe(802) == 0 and 
				HaveLearnRecipe(803) == 0) then
				Say("H·y chän 1 lo¹i vò khİ b¹n muèn häc c¸ch chÕ t¹o:",
					6,
					"¸m khİ/learn_long_1",   
					"CÇm/learn_long_2",  
					"Bót/learn_long_3",    
					"Cung/learn_long_4",
					"Tr¶o/learn_long_5",
					"Ta suy nghÜ l¹i/SayHello")
			else
				Say("B¹n ®· häc ®­îc ph­¬ng ph¸p phèi chÕ míi!", 0)
			end
		else
			Say("B¹n vÉn ch­a hoµn thµnh nhiÖm vô chÕ t¹o Kú M«n binh khİ!", 0)
		end
	else
		Say("B¹n vÉn ch­a häc kü n¨ng sèng:<color=yellow>chÕ t¹o Kú M«n binh khİ<color>!", 0)
	end
end;
-- °µÆ÷
function learn_long_1()
	AddRecipe(796)
	Msg2Player("B¹n häc ®­îc phèi chÕ: M·n Thiªn Hoa Vò")
end;
-- ÇÙ
function learn_long_2()
	AddRecipe(798)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Hi Nh©n CÇm")
end;
-- ±Ê
function learn_long_3()
	AddRecipe(799)
	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Hµnh")
end;
-- ¹­
function learn_long_4()
	AddRecipe(802)
	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Cung")
end;
-- ×¦
function learn_long_5()
	AddRecipe(803)
	Msg2Player("B¹n häc ®­îc phèi chÕ: M·nh Hæ")
end;



-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(1, 4) > 0) then
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
		Say(strTitle.."Ng­¬i vÉn ch­a häc kü n¨ng chÕ t¹o Kú M«n binh khİ? Ta gióp ng­¬i nhĞ!", 0)
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
	
	if (GetLifeSkillLevel(1, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
			AbandonLifeSkill(1, 4)
			SetTask(LEV_LEARNRECIPE, 0)
			SetTask(LEVELTASKID49, 0)
			SetTask(1600, 0);				--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
			SetTask(1601, 0);				--Çå¿Õ79¼¶ÎäÆ÷Åä·½ÈÎÎñ
			Msg2Player("Kü n¨ng chÕ t¹o binh khİ kú m«n cña b¹n ®· quªn.")				
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
	end
end;
--**********************************************´òÌıÏûÏ¢****************************************
--ÖÜÄ©»î¶¯
function Weekend()
	if (GetLifeSkillLevel(1,4) >= 1) then
		if (GetTask(HaveWeekend) == 1) then
        	Say(strTitle.."Ng­¬i ®· häc hÕt c¸c kü n¨ng ë chç ta råi!", 0)
       	elseif (CheckTime(0)==1 or CheckTime(5)==1 or CheckTime(6)==1) then
    		Say(strTitle.."Thêi thÕ lo¹n l¹c, trang bŞ cho m×nh mét kü n¨ng còng kh«ng thõa ®©u, ta sÏ gióp ng­¬i!", 0)
   		  	AddRecipe(229)
   		  	Msg2Player("B¹n häc ®­îc kü n¨ng míi_Qu©n Dông TiÔn Nang")
   		  	SetTask(HaveWeekend,1)
		end
	else
    	Say(strTitle.."Ng­¬i vÉn ch­a häc chÕ t¹o Kú M«n binh khİ hoÆc thêi gian ch­a ®Õn, ta kh«ng thÓ truyÒn thô kü n¨ng nµy cho ng­¬i.", 0)
    end
end
--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
--¼¼ÄÜÑ§Ï°Ñ¡Ôñ
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
		Say(strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
  		return
	end
 	
    if (GetLifeSkillsNum(1) == 2) then
        Say(strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
	end
  
	Say(strTitle.."<color=yellow>chÕ t¹o Kú M«n binh khİ<color> lµ kü n¨ng s¶n xuÊt míi, ng­¬i cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 4, 1, 79, 1)) then
			Msg2Player("B¹n häc ®­îc kü n¨ng s¶n xuÊt: chÕ t¹o Kú M«n binh khİ vµ nhËn ®­îc 3 H¾c Kim PhÊn.")
			AddItem(2,2,59,3)
		    
		    AddRecipe(110)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp ®ao")
		    AddRecipe(111)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹n Tr­êng tiªu")
		    AddRecipe(121)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc VËn cÇm")
		    AddRecipe(122)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Kinh §µo cÇm")
		    AddRecipe(132)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸n Quan bót")
		    AddRecipe(133)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: ChiÕt Xung bót")
		    AddRecipe(760)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
		    AddRecipe(761)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
		    AddRecipe(771)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt tr¶o")
		    AddRecipe(772)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang tr¶o")
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
	local nLevel = GetLifeSkillLevel(1, 4)
	if (nLevel >= 1) then
		if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(760) == 0) then
			AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
		elseif GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        	AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        	AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        	AddRecipe(764)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        	AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        	AddRecipe(764)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        	AddRecipe(765)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        	AddRecipe(766)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
      	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
       		AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        	AddRecipe(764)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        	AddRecipe(765)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        	AddRecipe(766)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        	AddRecipe(767)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
      	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        	AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        	AddRecipe(764)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        	AddRecipe(765)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        	AddRecipe(766)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        	AddRecipe(767)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
        	AddRecipe(768)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Lùc")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(760)==0 then
        	AddRecipe(760)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
			AddRecipe(761)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
        	AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        	AddRecipe(764)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        	AddRecipe(765)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        	AddRecipe(766)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        	AddRecipe(767)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
        	AddRecipe(768)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Lùc")
        	AddRecipe(769)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xi Nha") 
        elseif (nLevel >= 1 and GetTask(LEV_LEARNRECIPE)== 0) then
			AddRecipe(110)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: LiÔu DiÖp ®ao")
		    AddRecipe(111)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹n Tr­êng tiªu")
		    AddRecipe(121)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc VËn cÇm")
		    AddRecipe(122)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Kinh §µo cÇm")
		    AddRecipe(132)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸n Quan bót")
		    AddRecipe(133)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: ChiÕt Xung bót")
		    AddRecipe(760)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Tróc Méc Cung")
		    AddRecipe(761)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §»ng Cung")
		    AddRecipe(771)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt tr¶o")
		    AddRecipe(772)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang tr¶o")
		    SetTask(LEV_LEARNRECIPE, 10)    			  
    	elseif nLevel>=10 and GetTask(LEV_LEARNRECIPE)==10 then
        	AddRecipe(112)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ DiÖt thÇn ch©m")
        	AddRecipe(113)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö MÉu Ly Hån tiÔn")
        	AddRecipe(123)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: B«n L«i cÇm")
        	AddRecipe(124)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Béc Liªn ch©u")
        	AddRecipe(134)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xu©n Phong bót")
        	AddRecipe(135)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Kinh L«i bót")
        	AddRecipe(762)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh ThiÕt Cung")
        	AddRecipe(763)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L¹c Nh¹n Cung")
        	AddRecipe(773)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan tr¶o")
        	AddRecipe(774)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng tr¶o")
        	SetTask(LEV_LEARNRECIPE, 20)
    	elseif nLevel>=20 and GetTask(LEV_LEARNRECIPE)==20 then
        	AddRecipe(114)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c HuyÕt thÇn ch©m")
        	AddRecipe(125)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: L«i §éng v¹n vËt")
        	AddRecipe(136)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: V« Håi bót")
        	AddRecipe(764)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xuyªn T©m Cung")
        	AddRecipe(775)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
        	SetTask(LEV_LEARNRECIPE, 30)
    	elseif nLevel>=30 and GetTask(LEV_LEARNRECIPE)==30 then
        	AddRecipe(115)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngäc Phong ch©m")
        	AddRecipe(116)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tô Lı cµn kh«n")
        	AddRecipe(126)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÒn Nhai phi béc")
        	AddRecipe(127)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: H¶i NguyÖt thanh huy")
        	AddRecipe(137)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt bót")
        	AddRecipe(138)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThŞ Hån bót")
        	AddRecipe(765)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Truy NguyÖt Cung")
        	AddRecipe(766)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: DiÖt DiÖm Cung")
        	AddRecipe(776)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
        	AddRecipe(777)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
        	SetTask(LEV_LEARNRECIPE, 40)
    	elseif nLevel>=40 and GetTask(LEV_LEARNRECIPE)==40 then
        	AddRecipe(117)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Hµm Sa X¹ ¶nh")
        	AddRecipe(118)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt Tinh ThÊu Cèt ch©m")
        	AddRecipe(128)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Cöu Tiªu Hoµn béi")
        	AddRecipe(129)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: HiÖu Chung")
        	AddRecipe(139)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Long ThiÖt")
        	AddRecipe(140)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
        	AddRecipe(767)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tö Kim")
        	AddRecipe(778)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n KiÕp")
        	SetTask(LEV_LEARNRECIPE, 50)
    	elseif nLevel>=50 and GetTask(LEV_LEARNRECIPE)==50 then
        	AddRecipe(119)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÊt S¸t Thiªn La")
        	AddRecipe(130)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Lôc Khëi")
        	AddRecipe(141)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ Qu©n")
        	AddRecipe(768)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Lùc")
        	AddRecipe(779)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng Qu©n")
        	SetTask(LEV_LEARNRECIPE, 60)
    	elseif nLevel>=60 and GetTask(LEV_LEARNRECIPE)==60 then
        	AddRecipe(120)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Ngo¹i Phi Tiªn")
        	AddRecipe(131)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Tiªu VÜ")
        	AddRecipe(142)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn C¬")
        	AddRecipe(769)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Xi Nha")
        	AddRecipe(780)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ng S­¬ng")
        	SetTask(LEV_LEARNRECIPE, 70)
    	elseif nLevel>=70 and GetTask(LEV_LEARNRECIPE)==70 then
    	  	AddRecipe(770)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Long KhÈu")
        	AddRecipe(781)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò T«n")
        	SetTask(LEV_LEARNRECIPE, 80)
    	else
        	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
    	end
    end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 4)
	if nLevel >= 79 then
    	AddRecipe(1117)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å §­êng M«n Ch©m"))
    	AddRecipe(1119)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Nga My §µn"))
    	AddRecipe(1123)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Vâ §ang Bót"))
    	AddRecipe(1125)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å D­¬ng M«n Cung"))
    	AddRecipe(1127)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Ngò §éc Tr¶o"))
    	AddRecipe(1129)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Thóy Yªn PhiÕn"))
    	AddRecipe(1130)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Thóy Yªn §Şch"))
	else
    	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
	end
end

function learnCyEquip()
	local nLevel = GetLifeSkillLevel(1, 4)
	if nLevel >= 1 then
		AddRecipe(1090)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "§o¶n Tiªu"))
    AddRecipe(1091)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Méc Tiªu"))
    AddRecipe(1102)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "B¹ch Vò"))
    AddRecipe(1103)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Nh¹n Vò"))	
  end
	if nLevel >= 10 then
		AddRecipe(1092)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Tróc Tiªu"))
    AddRecipe(1093)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Môc Tiªu"))
    AddRecipe(1104)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Bİch Ngäc"))
    AddRecipe(1105)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Hoa hång"))    
  end
	if nLevel >= 20 then
		AddRecipe(1094)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "TÊt Tiªu"))
    AddRecipe(1106)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "§µo Chi"))  
  end  
	if nLevel >= 30 then
		AddRecipe(1095)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "§ång Tiªu"))
    AddRecipe(1096)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Gi¸c Thİch"))
    AddRecipe(1107)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "T­íc Vò"))
    AddRecipe(1108)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Ng©n L¨ng")) 
  end   
	if nLevel >= 40 then
		AddRecipe(1097)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Lam Linh"))
    AddRecipe(1098)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "HuyÒn Hång"))
    AddRecipe(1109)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Kim Méng"))
    AddRecipe(1110)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Tiªu Hån"))  
  end  
	if nLevel >= 50 then
		AddRecipe(1099)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Thóy Ngäc"))
    AddRecipe(1111)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "TuyÕt Hån"))  
  end  
	if nLevel >= 60 then
		AddRecipe(1100)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Ng©n Ti"))
    AddRecipe(1112)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "§iÖp Thóy"))  
  end  
	if nLevel >= 79 then
		AddRecipe(1101)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Minh B¨ng"))
    AddRecipe(1113)
    Msg2Player(format("§· häc phèi chÕ míi: %s", "Ngäc Doanh"))    
	end
end

--²¹Ñ§×¦Åä·½
function luaLearnRecipeZhua()
	local nLevel = GetLifeSkillLevel(1, 4);
	if (GetLifeSkillLevel(1, 4) > 1) then
    	if (GetTask(LEV_LEARNRECIPE) == 10 and HaveLearnRecipe(771) == 0) then
    		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
    	elseif (GetTask(LEV_LEARNRECIPE)==20 and HaveLearnRecipe(771)==0) then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
    	elseif GetTask(LEV_LEARNRECIPE)==30 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
      		AddRecipe(775)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
      	elseif GetTask(LEV_LEARNRECIPE)==40 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
      		AddRecipe(775)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
      		AddRecipe(776)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
      		AddRecipe(777)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
      	elseif GetTask(LEV_LEARNRECIPE)==50 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
      		AddRecipe(775)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
      		AddRecipe(776)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
      		AddRecipe(777)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
      		AddRecipe(778)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n KiÕp")
      	elseif GetTask(LEV_LEARNRECIPE)==60 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
      		AddRecipe(775)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
      		AddRecipe(776)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
      		AddRecipe(777)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
      		AddRecipe(778)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n KiÕp")
      		AddRecipe(779)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng Du©n")
      	elseif GetTask(LEV_LEARNRECIPE)==70 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
      		AddRecipe(775)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
      		AddRecipe(776)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
      		AddRecipe(777)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
      		AddRecipe(778)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n KiÕp")
      		AddRecipe(779)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng Du©n")
      		AddRecipe(780)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ng S­¬ng")
      	elseif GetTask(LEV_LEARNRECIPE)==80 and HaveLearnRecipe(771)==0 then
      		AddRecipe(771)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c ThiÕt Tr¶o")
      		AddRecipe(772)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh Cang Tr¶o")
      		AddRecipe(773)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: C¬ Quan Tr¶o")
      		AddRecipe(774)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hoµng Tr¶o")
      		AddRecipe(775)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: ¸m Thİch")
      		AddRecipe(776)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: R¨ng sãi")
      		AddRecipe(777)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Né DiÖm")
      		AddRecipe(778)
		    Msg2Player("B¹n häc ®­îc phèi chÕ: V¹n KiÕp")
      		AddRecipe(779)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: D­¬ng Du©n")
      		AddRecipe(780)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­ng S­¬ng")
      		AddRecipe(781)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò T«n")
      	end
	end
end;
--Ìí¼ÓÎïĞÅÏ¢
function Dating()
	Talk(1, "", strTitle.."Muèn chÕ t¹o 1 binh khİ tuyÖt thÕ v« song, cÇn ph¶i bá thªm nhiÒu vËt phô gia, ng­¬i h·y thö bá thªm 1 sè vËt liÖu tèt, cã thÓ sÏ rÌn ®­îc nh÷ng vò khİ cã mét kh«ng hai.")
end
--************************************************Í¨ÓÃ´¦Àí**************************************
--¿Õº¯Êı
function SayHello()	
end
--=================================================Ì«ĞéÈÎÎñÔö¼Óº¯Êı======================================
--******************************Ì«ĞéÈÎÎñ¶Ô»°****************************
function taixu_jwl_dia_step1()
	Talk(	4,"taixu_jwl_goods_need",
			"Muèn t¨ng cÊp <color=yellow>Trang søc Th¸i H­<color> ­? …®Ó ta xem…",
			"…..",
			"Cã c¸ch nµy cã thÓ thö xem, nh­ng cÇn <color=yellow>1 m¶nh C­êng hãa tinh kim<color>. <color=yellow>C­êng hãa tinh kim<color> chØ cã ®­îc th«ng qua viÖc<color=yellow>tinh luyÖn B¨ng Th¹ch<color>, mçi lÇn tinh luyÖn nh­ vËy tiªu hao mét sè <color=yellow>tiÒn vµng<color> vµ <color=yellow>Thiªn th¹ch<color>",
			"Nh÷ng nguyªn liÖu sau ®©y kh«ng thÓ thiÕu trong viÖc t¨ng cÊp <color=yellow>Trang søc Th¸i H­<color>. <color=yellow>tiÒn vµng<color> tİch tô tinh khİ, <color=yellow>Thiªn th¹ch<color> t¨ng cÊp trang bŞ, <color=yellow>B¨ng Th¹ch<color> ®óc binh khİ thÇn binh"
		)
end
function taixu_jwl_goods_need()
	Talk(2,"taixu_jwl_up_inf_end",
		"Ng­¬i t×m <color=yellow>1 m¶nh B¨ng Th¹ch<color>, <color=yellow>"..taixu_jwl_up_met_table[1][5].."   hoµng kim <color>vµ<color=yellow> "..taixu_jwl_up_met_table[1][6].."   thiªn th¹ch <color>cïng tinh luyÖn sÏ thu ®­îc <color=yellow>c­êng hãa tinh kim<color>. NÕu nh­ b¹n kh«ng muèn mÊt nhiÒu tiÒn ®Ó mua nguyªn liÖu th× còng cã thÓ ph©n ra lµm <color=yellow>3 lÇn tinh luyÖn<color>, mçi lÇn cÇn <color=yellow>"..taixu_jwl_up_met_table[2][5].."   hoµng kim <color>vµ<color=yellow> "..taixu_jwl_up_met_table[2][6].."  thiªn th¹ch<color>. Tuy nhiªn c¸ch nµy sÏ gÆp rÊt nhiÒu nguy hiÓm, ®Æc biÖt lµ cã thÓ tinh luyÖn thÊt b¹i.",
		"Nh÷ng g× cÇn nãi ta ®· nãi hÕt råi, b©y giê chóng ta b¾t ®Çu luyÖn <color=yellow>C­êng hãa tinh kim<color>."
	)
end
function taixu_jwl_up_inf_end()
	SetTask(taixu_jwl_taskID,2)
	TaskTip("T×m ®ñ nguyªn liÖu C­êng hãa tinh kim (vµng, Thiªn th¹ch) sau ®ã ®Õn gÆp M¹c Tam")
end
--*****************************Ì«ĞéÈÎÎñÌáÁ¶Ç¿»¯¾«½ğ*******************************
function taixu_jwl_up_iron()
	Say("Ng­¬i muèn luyÖn 1 lÇn C­êng hãa tinh kim hay ph©n thµnh nhiÒu lÇn?",
	6,
	"Ta muèn dïng m¶nh B¨ng Th¹ch luyÖn thµnh C­êng hãa tinh kim s¬ cÊp (cã kh¶ n¨ng thÊt b¹i)/#taixu_jwl_up(2)",
	"Ta muèn dïng C­êng hãa tinh kim s¬ cÊp luyÖn thµnh C­êng hãa tinh kim trung cÊp (cã kh¶ n¨ng thÊt b¹i)/#taixu_jwl_up(3)",
	"Ta muèn C­êng hãa tinh kim trung cÊp luyÖn thµnh C­êng hãa tinh kim (cã kh¶ n¨ng thÊt b¹i)/#taixu_jwl_up(4)",
	"Ta muèn C­êng hãa tinh kim 1 lÇn (Thµnh c«ng 100%)/#taixu_jwl_up_one_time()",
	"Ta muèn t×m hiÓu nguyªn liÖu dïng ®Ó thİ luyÖn/taixu_jwl_up_needs",
	"§Ó suy nghÜ l¹i./end_dialog"
	)
end
--*************************************ÌáÁ¶È·ÈÏ½çÃæ*********************************
function taixu_jwl_up_dtm(up_diff)
	Say("Thİ luyÖn"..taixu_jwl_up_met_table[up_diff][12].."CÇn <color=yellow>1<color>B¨ng Th¹ch tinh luyÖn, <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> m¶nh Thiªn th¹ch vµ <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> hoµng kim, <color=yellow>vµ còng cã thÓ thÊt b¹i<color>, b¹n cã ch¾c muèn tinh luyÖn?",
	2,
	"Ta ®ång ı thİ luyÖn"..taixu_jwl_up_met_table[up_diff][12].."/#taixu_jwl_up("..up_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
function taixu_jwl_up_needs()
	Say("Ng­¬i cã thÓ chän thİ luyÖn 1 lÇn hoÆc chia lµm 3 lÇn. Thİ luyÖn 1 lÇn cÇn <color=yellow>"..taixu_jwl_up_met_table[1][5].."<color> hoµng kim vµ <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> m¶nh Thiªn th¹ch. Thİ luyÖn 3 lÇn cÇn <color=yellow>"..taixu_jwl_up_met_table[2][5].."<color> hoµng kim vµ <color=yellow>"..taixu_jwl_up_met_table[2][6].."<color> Thiªn th¹ch.",
	2,
	"Ta muèn thİ luyÖn/taixu_jwl_up_iron",
	"Tho¸t/end_dialog")
end
--******************************Ò»´ÎĞÔÌáÁ¶****************************
function taixu_jwl_up_one_time()
	local iron_num = GetTask(taixu_jwl_iron_up_num)
	if iron_num == nil then
		Talk(1,"","Thİ luyÖn C­êng hãa tinh kim 1 lÇn cÇn <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> m¶nh Thiªn th¹ch, nÕu ng­¬i kh«ng ®ñ Thiªn th¹ch còng kh«ng sao, khi nµo t×m ®ñ <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color> chóng ta tiÕp tôc thİ luyÖn nµo!")
		return
	elseif iron_num >= 0 and iron_num < taixu_jwl_up_met_table[1][6] then
		Say("HiÖn cÇn <color=yellow>"..(taixu_jwl_up_met_table[1][6]-iron_num).."<color>Thiªn th¹ch míi cã thÓ thİ luyÖn? Ng­¬i cã chø?",
		2,
		"Ta cã mang theo Thiªn th¹ch ®©y!/#up_iron("..(taixu_jwl_up_met_table[1][6]-iron_num)..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif iron_num >= taixu_jwl_up_met_table[1][6] then
		taixu_jwl_up(1)
	end
	
end
--******************************ÔÉÌúÌá½»*****************************
function up_iron(num_remain)
	local iron_num_take = GetItemCount(2,2,8)
	if iron_num_take == 0 then
		Talk(1,"","Thiªn th¹ch ng­¬i mang theo kh«ng ®ñ!")
		return
	end
	local del_flag = 0
	if iron_num_take > num_remain then
		del_flag = DelItem(2,2,8,num_remain)
		if del_flag ~= 1 then
			Talk(1,"","Thiªn th¹ch ng­¬i mang theo kh«ng ®ñ!")
			return
		else
			SetTask(taixu_jwl_iron_up_num,taixu_jwl_up_met_table[1][6])
			Say("Ng­¬i ®· cã ®ñ <color=yellow>"..num_remain.."<color>Thiªn th¹ch, ®ång ı thİ luyÖn chø?",
			2,
			"B¾t ®Çu thİ luyÖn/#taixu_jwl_up(1)",
			"Ta vÉn ch­a chuÈn bŞ/end_dialog")
		end
	else
		del_flag = DelItem(2,2,8,iron_num_take)
		if del_flag ~= 1 then
			Talk(1,"","Thiªn th¹ch ng­¬i mang theo kh«ng ®ñ!")
			return			
		else
			SetTask(taixu_jwl_iron_up_num,(taixu_jwl_up_met_table[1][6] - num_remain + iron_num_take))
			Talk(1,"","Ng­¬i ®· cã ®ñ <color=yellow>"..iron_num_take.."<color>Thiªn th¹ch, cßn thiÕu<color=yellow>"..(num_remain - iron_num_take).."<color>Thiªn th¹ch, cã thÓ C­êng hãa tinh kim!")
			return
		end
	end
end
function taixu_jwl_up(up_step)
	--°ü¹ü¿Õ¼ä¼ì²â
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kho¶ng trèng hµnh trang kh«ng ®ñ, xin xem l¹i!")
		return
	end
	--ËùĞèÒªµÄÎïÆ·ÒÔ¼°²ÄÁÏ¼ì²â
	if taixu_jwl_up_goods_chk(up_step) == 0 then
		return
	end
	--¼ì²â½áÊø£¬¿ªÊ¼É¾³ı
	if Pay(taixu_jwl_up_met_table[up_step][5]*10000) ~= 1 then
		Talk(1,"","<color=yellow>tiÒn vµng<color> ng­¬i mang theo kh«ng ®ñ!")
		return 0
	end
	if up_step == 1 and GetTask(taixu_jwl_iron_up_num) < taixu_jwl_up_met_table[1][6] then
		Talk(1,"","Thiªn th¹ch ng­¬i mang kh«ng ®ñ <color=yellow>"..taixu_jwl_up_met_table[1][6].."<color>, kh«ng thÓ thİ luyÖn C­êng hãa tinh kim 1 lÇn ®­îc!")
	end
	if DelItem(taixu_jwl_up_met_table[up_step][1],taixu_jwl_up_met_table[up_step][2],taixu_jwl_up_met_table[up_step][3],1) ~= 1 then
		Talk(1,"","X¸c nhËn cã mang theo "..taixu_jwl_up_met_table[up_step][4])
		return 0
	end
	if up_step~= 1 and DelItem(2,2,8,taixu_jwl_up_met_table[up_step][6]) ~= 1  then
		Talk(1,"","<color=yellow>Thiªn th¹ch<color> ng­¬i mang theo kh«ng ®ñ<color=yellow>"..taixu_jwl_up_met_table[up_step][6].."<color>!")
		return 0
	end
	if random(1,100) <= taixu_jwl_up_met_table[up_step][8] then
		local add_flag = AddItem(taixu_jwl_up_met_table[up_step][9],taixu_jwl_up_met_table[up_step][10],taixu_jwl_up_met_table[up_step][11],1)
		if add_flag == 1 then
			if up_step == 1 or up_step == 4 then
				SetTask(taixu_jwl_taskID,3)
				SetTask(taixu_jwl_iron_up_num,0)
				Talk(7,"kill_liu_dia_start",
				"Thµnh c«ng råi! <color=yellow>C­êng hãa tinh kim<color> ®· luyÖn thµnh!",
				"S­ phô ®· luyÖn thµnh c«ng <color=yellow>C­êng hãa tinh kim<color>, cho v·n bèi thö thö",
				"§­îc, nh­ng ®îi ta mét l¸t",
				"…..",
				"…, vÉn ch­a ®­îc. Ph­¬ng ph¸p th× ®óng råi nh­ng huyÒn khİ vÉn kh«ng tİch tô. Kh«ng thµnh råi…",
				"<color=yellow>Thî rÌn L­u<color> ë <color=yellow>T­¬ng D­¬ng <color>, ng­¬i biÕt chø?",
				"<color=yellow>Thî rÌn L­u<color>? Ng­êi nµy næi tiÕng nh­ vËy ai l¹i kh«ng biÕt chø."
				)
			else
				Talk(1,"","Thµnh c«ng råi!"..taixu_jwl_up_met_table[up_step][12].."§· luyÖn ®­îc råi!")
				return
			end
		else
			WriteLog("NhiÖm vô trang søc Th¸i H­_Ng­êi ch¬i:"..GetName().."NhËn ®­îc"..taixu_jwl_up_met_table[up_step][12].."ThÊt b¹i, thÊt b¹i ë:"..add_flag)
		end
	else
		Talk(1,"","§¸ng tiÕc, lÇn nµy luyÖn kh«ng thµnh,"..taixu_jwl_up_met_table[up_step][4].."ph¶i luyÖn l¹i th«i.")
		return
	end
end
--****************************ÌáÁ¶ËùĞèÒªµÄÎïÆ·¼ì²â*************************
function taixu_jwl_up_goods_chk(up_step)
	if GetItemCount(taixu_jwl_up_met_table[up_step][1],taixu_jwl_up_met_table[up_step][2],taixu_jwl_up_met_table[up_step][3]) == 0 then
		Talk(1,"","Ng­¬i cã mang theo <color=yellow>"..taixu_jwl_up_met_table[up_step][4].."<color>!")
		return 0
	elseif GetCash() < (taixu_jwl_up_met_table[up_step][5]*10000) then
		Talk(1,"","<color=yellow>tiÒn vµng<color> ng­¬i mang theo kh«ng ®ñ!")
		return 0
	elseif up_step~= 1 and GetItemCount(2,2,8) < taixu_jwl_up_met_table[up_step][6] then
		Talk(1,"","<color=yellow>Thiªn th¹ch<color> ng­¬i mang theo kh«ng ®ñ!")
		return 0
	end
	return 1
end
--*********************************É±ÁõÌú½³µÄ¶Ô»°**************************
function kill_liu_dia_start()
	Talk(4,"kill_liu_dia_1",
	"nãi vÒ tay nghÒ th× l·o <color=yellow>Thî rÌn L­u<color> nµy còng chØ ngang hµng cì ta. Nh­ng l·o Êy kh«ng hÒ nhËn ®Ö tö. L·o thİch s­u tÇm kú kim dŞ th¹ch, ta còng kh«ng cã c¶m t×nh víi l·o Êy.",
	"Nghe nãi tr­íc ®©y l·o dïng Thiªn th¹ch B¨ng Th¹ch tinh luyÖn nªn <color=yellow>Kú Kim<color>. Khi luyÖn trang søc cã ®­îc Kú Kim sÏ nhanh chãng tİch tô huyÒn khİ, møc ®é thµnh c«ng sÏ cao.",
	"…"..Zgc_pub_sex_name()..", ng­¬i t×m c¸ch tiÕp cËn <color=yellow>thî rÌn L­u<color>"..Zgc_pub_sex_name().."§o¹t ®­îc m¶nh Kú Kim cña l·o chóng ta sÏ luyÖn thµnh c«ng",
	"S­ phô nãi rÊt cã lı, ®Ó ta thö xem."
	)
end
function kill_liu_dia_1()
	Talk(4,"kill_liu_dia_2",
	"<color=yellow>Thî rÌn L­u<color> cã tİnh nghi ngê, v× vËy mµ Thiªn Th¹ch B¨ng Th¹ch l·o giÊu ë ngoµi thµnh, cô thÓ ë ®©u th× kh«ng ai biÕt ®­îc. Nh­ng ta biÕt mçi tèi tõ <color=yellow>21:00-21:30<color> l·o ®Òu ®i qua <color=yellow>Linh B¶o S¬n<color>."..Zgc_pub_sex_name().."Tr­íc <color=yellow>21 giê<color> mçi ngµy, ng­¬i cÇm <color=yellow>ThiÕt chïy<color> cña ta ®Õn <color=yellow>Linh B¶o S¬n<color> ®îi, nhÊt ®Şnh sÏ gÆp <color=yellow>Thî rÌn L­u<color>.",
	"Lµ sao, ta kh«ng hiÓu!",
	"<color=yellow>ThiÕt chïy<color> cña ta tr«ng b×nh th­êng nh­ng nã lµ mét dŞ b¶o. <color=yellow>Thî rÌn L­u<color> rÊt thİch, ®· nhiÒu lÇn mua l¹i nh­ng ta kh«ng b¸n. L·o t×m c¸ch ®o¹t nã nh­ng kh«ng ®­îc. LÇn nµy ®em ra dô, nhÊt ®Şnh l·o sÏ xuÊt hiÖn."..Zgc_pub_sex_name().."ChØ cÇn ®o¹t ®­îc <color=yellow>Kú Kim<color> cña l·o lµ ®­îc råi!",
	"Th× ra lµ vËy! §Ó ta thö xem."
	)
end
function kill_liu_dia_2()
	Talk(3,"mo3_hammer_add",
	"ChØ cÇn mang <color=yellow>ThiÕt chïy<color> cña ta ®Õn <color=yellow>B¶o Linh S¬n<color> dô l·o L­u. Nh­ng"..Zgc_pub_sex_name().."vâ c«ng cña <color=yellow>Thî rÌn L­u<color> rÊt lîi h¹i, ng­¬i ph¶i cÈn träng."..Zgc_pub_sex_name().."NÕu cã ®­îc ®ång ®éi hç trî th× qu¶ lµ th­îng s¸ch.",
	"Cßn n÷a, nÕu tr­íc ®ã ®· cã ng­êi ®¸nh b¹i <color=yellow>Thî rÌn L­u <color> råi ¾t h¼n <color=yellow>l·o<color> sÏ kh«ng xuÊt hiÖn ngay. Ng­¬i ph¶i <color=yellow>lui tíi nhiÒu lÇn<color>, mçi lÇn ph¶i <color=yellow>®îi mét lóc<color>, míi cã thÓ gÆp ®­îc<color=yellow>l·o L­u<color>.",
	"§a t¹ M¹c s­ phô ®· chØ gi¸o."
)
	TaskTip("Dïng ThiÕt Chïy cña M¹c Tam ®¸nh b¹i thî rÌn L­u ®o¹t Kú Kim.")
end
--****************************Ôö¼ÓÄªÈıµÄ´¸×Ó****************
function mo3_hammer_add()
	if BigGetItemCount(2,1,564) ~= 0 then
		Talk(1,"","ThiÕt chïy cña ta còng ch¼ng cã g× tèt l¾m"..Zgc_pub_sex_name()..", hay cø dïng chïy cña ng­¬i xem.")
		return
	end
	local add_flag = AddItem(2,1,564,1)
	Talk(1,"",Zgc_pub_sex_name().."Ng­¬i nhí mçi ngµy tr­íc <color=yellow>21:00-21:30<color> ®Õn Linh B¶o S¬n, nÕu kh«ng gÆp <color=yellow>Thî rÌn L­u<color>,"..Zgc_pub_sex_name().."Cã thÓ ®Õn chç ta nhËn")
	return
end
function taixu_jwl_up_jwl()
	local taixu_jwl_dia_list = {}
	for i = 1, getn(taixu_jwl_list) do
		taixu_jwl_dia_list[i] = "Ta muèn thİ luyÖn"..taixu_jwl_list[i][1].."*/#taixu_jwl_chk("..i..")"
	end
	taixu_jwl_dia_list[getn(taixu_jwl_list)+1] = "§Ó ta suy nghÜ l¹i/end_dialog"
	Say("Ng­¬i chän lo¹i <color=yellow>Trang søc Th¸i H­<color> nµo?",
	getn(taixu_jwl_dia_list),taixu_jwl_dia_list
	)
end
function taixu_jwl_chk(jwl_diff)
	--°ü¹ü¿Õ¼ä¼ì²â
	if GetFreeItemRoom() < 2 then
		Talk(1,"","Kho¶ng trèng hµnh trang kh«ng ®ñ, xin xem l¹i!")
		return
	end
	--Ì«ĞéÊ×ÊÎĞ¯´ø¼ì²â
	if GetItemCount(0,102,taixu_jwl_list[jwl_diff][2]) == 0 then
		Talk(1,"","Ng­¬i kh«ng mang theo <color=yellow>"..taixu_jwl_list[jwl_diff][1].."<color> µ!!")
		return
	end
	--Ç¿»¯¾«½ğĞ¯´ø¼ì²â
	if GetItemCount(2,1,562) == 0 then
		Talk(1,"","Ng­¬i kh«ng mang <color=yellow>C­êng hãa tinh kim<color> ­?")
		return
	end
	--Ææ½ğĞ¯´ø¼ì²â
	if GetItemCount(2,1,563) == 0 then
		Talk(1,"","Ng­¬i kh«ng cã <color=yellow>Kú Kim cña Thî rÌn L­u<color> µ?")
		return
	end
	--Ææ½ğÉ¾³ı¼ì²â
	local del_flag = DelItem(2,1,563,1)
	if del_flag ~= 1 then
		Talk(1,"","Ng­¬i kh«ng cã <color=yellow>Kú Kim cña Thî rÌn L­u<color> µ?")
		return		
	end
	--Ç¿»¯¾«½ğÉ¾³ı¼ì²â
	del_flag = DelItem(2,1,562,1)
	if del_flag ~= 1 then
		Talk(1,"","Ng­¬i kh«ng mang <color=yellow>C­êng hãa tinh kim<color> ­?")
		return
	end
	--Ì«ĞéÊ×ÊÎÉ¾³ı¼ì²â
	del_flag = DelItem(0,102,taixu_jwl_list[jwl_diff][2],1)
	if del_flag ~= 1 then
		Talk(1,"","Ng­¬i kh«ng mang theo <color=yellow>"..taixu_jwl_list[jwl_diff][1].."<color> µ!!")
		return	
	end
	--×°±¸Ôö¼Ó
	local add_flag = AddItem(0,102,taixu_jwl_list[jwl_diff][4],1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
		SetTask(taixu_jwl_taskID,0)
		Msg2SubWorld("Chóc mõng:"..GetName().." Hoµn thµnh nhiÖm vô Trang søc Th¸i H­, sÏ"..taixu_jwl_list[jwl_diff][1].."T¨ng cÊp thµnh "..taixu_jwl_list[jwl_diff][3].."!")
		Talk(4,"",
			"Thµnh c«ng råi!",
			"…"..Zgc_pub_sex_name()..", ®©y míi ®óng lµ <color=yellow>Trang søc Th¸i H­<color>! Qu¶ lµ tuyÖt diÖu!",
			"§a t¹ M¹c tiÒn bèi, lÇn nµy nÕu kh«ng cã tiÒn bèi gióp ®ì thËt kh«ng biÕt lµm sao.",
			"§Òu lµ mét nhµ"..Zgc_pub_sex_name().."kh¸ch khİ lµm g×. CÇm lÊy! Nhí ®õng lµm h­ ®ã!"
		)
		WriteLog("NhiÖm vô trang søc Th¸i H­_Ng­êi ch¬i:"..GetName().."NhËn ®­îc "..taixu_jwl_list[jwl_diff][2].."!")
	else
		WriteLog("NhiÖm vô trang søc Th¸i H­_Ng­êi ch¬i:"..GetName().."T¨ng"..taixu_jwl_list[jwl_diff][2].." thÊt b¹i, kı hiÖu:"..add_flag)
	end	
end
--======================================================½áÊø=============================================

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=red>trang bŞ b¸t qu¸i<color>lµ huynh ®Ö M¹c gia ta vµ l·o L­u ë T­¬ng D­¬ng, CÈm N­¬ng ®· toµn lùc cïng nhau nghiªn cøu ra t©m huyÕt. Lµm thÕ nµo nhËn ®­îc nh÷ng mãn cã linh th¹ch ng­¬i ®i hái truyÒn nh©n sÏ râ, nÕu ng­¬i muèn t×m hiÓu lµm thÕ nµo chÕ t¹o ®­îc <color=yellow>trang bŞ<color> kh¶m linh th¹ch, th× ®Õn chç ta t×m hiÓu nhĞ.",
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
	local nLevel = GetLifeSkillLevel(1, 4)
	if (GetLifeSkillLevel(1, 4) > 1) then
		if (GetTask(LEV_LEARNRECIPE) == 80 and HaveLearnRecipe(1013) == 0) then
        	AddRecipe(1006)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: M·n Thiªn Hoa Vò")
        	AddRecipe(1008)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: Hi Nh©n CÇm")
        	AddRecipe(1009)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Hµnh")
        	AddRecipe(1012)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Cung")        	
        	AddRecipe(1013)
        	Msg2Player("B¹n häc ®­îc phèi chÕ: M·nh Hæ")
    end
end
end

function update_max_skill_level()
	Say(strTitle..format("Më réng cÊp kü n¨ng s¶n xuÊt cÇn kü n¨ng thu thËp ®¹t cÊp 79 ®ång thêi tiªu hao %d Vµng", 1000), 
		2, "§ång ı/update_max_skill_level_ensure", "T¹i h¹ chØ xem qua th«i/SayHello")
end

function update_max_skill_level_ensure()
	if GetLifeSkillLevel(1, 4) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng s¶n xuÊt ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 4, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng s¶n xuÊt ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
