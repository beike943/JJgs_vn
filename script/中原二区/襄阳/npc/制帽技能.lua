-- =========================================
-- File : XXXÇø£¬XX£¬Í·¹ÚÖ¯Ôì.lua
-- Name : Í·¹ÚÖ¯Ôì
-- ID   : 1, 10
-- =========================================

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");
Include("\\script\\task\\lingshi_task.lua")

-- == Ô¤¶¨ÒåµÄÒ»Ğ©ÈÎÎñ±äÁ¿ID =======================
ID_LEARNLIFESKILL		= 1925		-- ĞÂÊÖÈÎÎñ±äÁ¿
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°Çé¿ö¼ÇÂ¼
RECIPE_SEX				= 1935		-- Åä·½Ñ§Ï°ÄĞÅ®Ñ¡Ôñ
FORGETMAIN_NUM			= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı

-- == È«¾ÖÊ¹ÓÃµÄÃû×Ö =======================
strName = ""
strTitle = ""

-- == Ä¬ÈÏÈë¿Úº¯Êı =========================
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	strName = GetTargetNpcName()
	if random(1,15) == 1 then
		NpcChat(GetTargetNpc(),"Linh th¹ch ë vŞ trİ nµo th× kh¶m trªn trang bŞ cã vŞ trİ t­¬ng øng, kh«ng thÓ kh¶m lén!");
	end;
	if (strName == "" or strName == nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: "
	
	    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
        TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Muèn häc may nãn ­? Giê th× ch­a thÓ häc ®­îc!", 0)
    	return
    end;
	
	local strtab = {
		"Häc may nãn/learn_cap_skill",
		"Häc c¸ch phèi chÕ míi/learn_new_recipe",
		"Häc phèi chÕ trang bŞ Linh §å/learnLtEquip",
		"Quªn c¸ch may nãn råi/forget_life_skill",
--		"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		"T×m hiÓu vËt phô gia/dating"
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
--		tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 10) == 79 then
		tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
	end 
	tinsert(strtab,"Rêi khái/exit_dialog"); 			
	Say(strTitle.."NghÒ nµy ta häc tõ nhá nªn rÊt tinh th«ng, cã cÇn ta gióp g× kh«ng?",
		getn(strtab),
		strtab)
end;


-- == Ê²Ã´¶¼²»×öµÄÍË³ö¶Ô»° ===================
function exit_dialog()
end;


-- == ´òÌı¹ØÓÚÌí¼ÓÎïµÄĞÅÏ¢ ===================
function dating()
	Say(strTitle.."Ng­¬i ®Æt trang bŞ vµo sau ®ã thªm nguyªn liÖu, sÏ cã mãn ®å nh­ ı.", 0)
end;


-- == ÒÅÍüÍ·¹ÚÖ¯Ôì ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 10) > 0) then
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
			"Khoan ®·! Chê ta suy nghÜ l¹i!/exit_dialog")
	else
		Say(strTitle.."Ng­¬i ch­a häc may nãn µ?", 0)
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
	
	if (GetLifeSkillLevel(1, 10) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
			AbandonLifeSkill(1, 10)
			SetTask(LEV_LEARNRECIPE, 0)
			SetTask(RECIPE_SEX, 0)
			Msg2Player("Ng­¬i ®· quªn c¸ch may nãn råi")				
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;

-- == Ñ§Ï°Í·¹ÚÖ¯Ôì ===========================
function learn_cap_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>May nãn<color> còng lµ mét kü n¨ng chÕ t¹o míi, cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/learn_as_main",
    	"§Ó ta suy nghÜ l¹i/exit_dialog")
end;
-- == Ñ¡ÔñÄĞÃ±ÖÆÔì»¹ÊÇÅ®Ã±ÖÆÔì ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."May nãn cã<color=yellow>may nãn nam<color> vµ <color=yellow>may nãn n÷<color>, ng­¬i muèn häc lo¹i nµo?",
			3,
			"May nãn nam/choose_man",
			"May nãn n÷/choose_women",
			"§Ó ta suy nghÜ./exit_dialog")
	end
end;
-- == Ñ¡ÔñÄĞÃ±ÖÆÔì ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 10, 1, 79, 1)) then
      Msg2Player("B¹n häc ®­îc kü n¨ng: May nãn")
      		
      AddRecipe(251)
      Msg2Player("B¹n häc ®­îc phèi chÕ: Anh Hïng C©n")
			AddRecipe(252)
			Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Bè c©n")
			AddRecipe(253)
			Msg2Player("B¹n häc ®­îc phèi chÕ: M·n NguyÖt L¹p")
			AddRecipe(254)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Phong Qu¸n")
			AddRecipe(269)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­u B× §Çu C©n")
			AddRecipe(270)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Kim §iÒu c©n")
			AddRecipe(271)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vò Th¾ng Sa M·o")
			AddRecipe(272)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hoµng Trï Thóc C©n")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;
-- == Ñ¡ÔñÅ®Ã±ÖÆÔì ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 10, 1, 79, 1)) then
      Msg2Player("B¹n häc ®­îc kü n¨ng: May nãn")
    		
    	AddRecipe(287)
    	Msg2Player("B¹n häc ®­îc phèi chÕ: Phßng Phong L¹p")
			AddRecipe(288)
			Msg2Player("B¹n häc ®­îc phèi chÕ: TŞ Thñy L¹p")
			AddRecipe(289)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §ång KÕt")
			AddRecipe(290)
			Msg2Player("B¹n häc ®­îc phèi chÕ: San H« tr©m")
			AddRecipe(305)
			Msg2Player("B¹n häc ®­îc phèi chÕ: TrÇm Méc Thóc Tr©m")
			AddRecipe(306)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Linh Tr©m")
			AddRecipe(307)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Quû DiÖn Thóc c©n")
			AddRecipe(308)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Lam C©n")
			
		  SetTask(LEV_LEARNRECIPE, 10)
		  SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;



-- == Ñ§Ï°ĞÂµÄÅä·½ ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 10)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."May nãn cã<color=yellow>may nãn nam<color> vµ <color=yellow>may nãn n÷<color>, ng­¬i muèn häc lo¹i nµo?",
			3,
			"May nãn nam/recipe_man",
			"May nãn n÷/recipe_women",
			"§Ó ta suy nghÜ./exit_dialog")
		return
	end
	
	-- ÄĞ×°Åä·½Éı¼¶
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(255)
			Msg2Player("B¹n häc ®­îc phèi chÕ: M«ng DiÖn C©n")
			AddRecipe(256)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hoa D­¬ng C©n")
			AddRecipe(273)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn Méc C©n")
			AddRecipe(274)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Nh­îc Thñy L¹p")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(257)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThiÕt TuyÕn L¹p")
			AddRecipe(258)
			Msg2Player("B¹n häc ®­îc phèi chÕ: DËt Èn Qu¸n")
			AddRecipe(275)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Chu T­íc Thóc C©n")
			AddRecipe(276)
			Msg2Player("B¹n häc ®­îc phèi chÕ: H¶i ThÇn KÕt")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(259)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hång L¨ng C©n")
			AddRecipe(260)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hµng V©n Thóc §¸i")
			AddRecipe(277)
			Msg2Player("B¹n häc ®­îc phèi chÕ: §Şnh Quèc Tö C©n")
			AddRecipe(278)
			Msg2Player("B¹n häc ®­îc phèi chÕ: MËt NhÉn DiÖn Tr¸o")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(261)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Sa Nh·n Tr¸o")
			AddRecipe(262)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Tinh Nh·n Tr¸o")
			AddRecipe(279)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn S¸ch Kim Kh«i")
			AddRecipe(280)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Ngò Quû C©n")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(263)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi V©n L¹p")
			AddRecipe(264)
			Msg2Player("B¹n häc ®­îc phèi chÕ: TuyÖt B¶o Qu¸n")
			AddRecipe(281)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tinh cang ChiÕn Kh«i")
			AddRecipe(282)
			Msg2Player("B¹n häc ®­îc phèi chÕ: L«i Tr× DiÖn")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(265)
			Msg2Player("B¹n häc ®­îc phèi chÕ: S¬n Quû DiÖn")
			AddRecipe(266)
			Msg2Player("B¹n häc ®­îc phèi chÕ: MËt ThÇn Qu¸n")
			AddRecipe(283)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Chung Quú DiÖn")
			AddRecipe(284)
			Msg2Player("B¹n häc ®­îc phèi chÕ: DŞ ThÇn C©n")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		  Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
		end
		
	-- Å®×°Åä·½Éı¼¶
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(291)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Bµn Th¹ch KÕt")
			AddRecipe(292)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Khæng T­íc Tr©m")
			AddRecipe(309)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Lam §iÖp Thóc C©n")
			AddRecipe(310)
			Msg2Player("B¹n häc ®­îc phèi chÕ: B¹ch Hång Tr©m")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(293)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Chu T­íc Ph¸t KÕt")
			AddRecipe(294)
			Msg2Player("B¹n häc ®­îc phèi chÕ: §»ng Xµ Tr©m")
			AddRecipe(311)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn C¬ Thóc Tr©m")
			AddRecipe(312)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn La Thoa")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(295)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Minh §iÖp KÕt")
			AddRecipe(296)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Phông Tr©m")
			AddRecipe(313)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Phong Thóc Tr©m")
			AddRecipe(314)
			Msg2Player("B¹n häc ®­îc phèi chÕ: V©n Méng Thoa")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(297)
			Msg2Player("B¹n häc ®­îc phèi chÕ: §Şa KiÖt Qu¸n")
			AddRecipe(298)
			Msg2Player("B¹n häc ®­îc phèi chÕ: §o¹t Hån")
			AddRecipe(315)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi §iÓu")
			AddRecipe(316)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Cèc")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(299)
			Msg2Player("B¹n häc ®­îc phèi chÕ: NhËt MiÖn")
			AddRecipe(300)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn ¤")
			AddRecipe(317)
			Msg2Player("B¹n häc ®­îc phèi chÕ: B¶o T­îng")
			AddRecipe(318)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phong L«i")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(301)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Tu La Phæ")
			AddRecipe(302)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Chu T­íc")
			AddRecipe(319)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vu Hµm")
			AddRecipe(320)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Truêng Sinh")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 10)
	if nLevel >= 79 then
    	AddRecipe(1131)
    	AddRecipe(1132)
    	AddRecipe(1133)
    	AddRecipe(1134)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å M·o"))
	else
    	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
	end
end

-- == Ñ¡Ôñ²¢ÇÒ²¹Ï°ÄĞÃ±ÖÆÔì¼¼ÄÜ ====
function recipe_man()
	AddRecipe(251)
    Msg2Player("B¹n häc ®­îc phèi chÕ: Anh Hïng C©n")
	AddRecipe(252)
	Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Bè c©n")
	AddRecipe(253)
	Msg2Player("B¹n häc ®­îc phèi chÕ: M·n NguyÖt L¹p")
	AddRecipe(254)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Phong Qu¸n")
	AddRecipe(269)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng­u B× §Çu C©n")
	AddRecipe(270)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim §iÒu c©n")
	AddRecipe(271)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Vò Th¾ng Sa M·o")
	AddRecipe(272)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Hoµng Trï Thóc C©n")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == Ñ¡Ôñ²¢ÇÒ²¹Ï°Å®Ã±ÖÆÔì¼¼ÄÜ ====
function recipe_women()
    AddRecipe(287)
    Msg2Player("B¹n häc ®­îc phèi chÕ: Phßng Phong L¹p")
	AddRecipe(288)
	Msg2Player("B¹n häc ®­îc phèi chÕ: TŞ Thñy L¹p")
	AddRecipe(289)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh §ång KÕt")
	AddRecipe(290)
	Msg2Player("B¹n häc ®­îc phèi chÕ: San H« tr©m")
	AddRecipe(305)
	Msg2Player("B¹n häc ®­îc phèi chÕ: TrÇm Méc Thóc Tr©m")
	AddRecipe(306)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Ng©n Linh Tr©m")
	AddRecipe(307)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Quû DiÖn Thóc c©n")
	AddRecipe(308)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh Lam C©n")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>Minh S­ Phã<color>: <color=red>Trang bŞ b¸t qu¸i<color> lµ ta cïng huynh ®Ö M¹c gia vµ l·o L­u ë T­¬ng D­¬ng, ®· toµn lùc cïng nhau nghiªn cøu ra t©m huyÕt. Lµm thÕ nµo nhËn ®­îc nh÷ng mãn cã linh th¹ch ng­¬i ®i hái truyÒn nh©n sÏ râ, nÕu ng­¬i muèn t×m hiÓu lµm thÕ nµo chÕ t¹o ®­îc <color=yellow>trang bŞ<color> kh¶m linh th¹ch, th× ®Õn chç ta t×m hiÓu nhĞ.",
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
	if GetLifeSkillLevel(1, 10) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng s¶n xuÊt ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 10, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng s¶n xuÊt ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end