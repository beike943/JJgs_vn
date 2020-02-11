-- =========================================
-- File : XXXÇø£¬XX£¬ÖÆ¿ã¼¼ÄÜ.lua
-- Name : ÖÆ¿ã¼¼ÄÜ
-- ID   : 1, 9
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
		NpcChat(GetTargetNpc(),"§õng quªn lµ trŞ linh khİ mµ trang bŞ cã thÓ dung n¹p lµ cã h¹n!");
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
    	Say(strTitle.."Muèn häc may h¹ y ­? Lóc nµy ta ch­a d¹y ®­îc", 0)
    	return
    end;
	
	local strtab = {
		"Häc kü n¨ng may h¹ y/learn_shoes_skill",
		"Häc c¸ch phèi chÕ míi/learn_new_recipe",
		"Häc phèi chÕ trang bŞ Linh §å/learnLtEquip",
		"Quªn kü n¨ng may h¹ y/forget_life_skill",
--		"Nh÷ng ®iÒu liªn quan vÒ trang bŞ B¸t Qu¸i/bagua",
		"T×m hiÓu vËt phô gia/dating"	
		}
	if GetTask(TASK_LINGSHI_ID) == 2 or GetTask(TASK_LINGSHI_ID) == 11 then
		tinsert(strtab,"tiÕp tôc nhiÖm vô häc tËp Linh Th¹ch B¸t Qu¸i/task_new3");
	end
	if GetLifeSkillMaxLevel(1, 9) == 79 then
		tinsert(strtab, "Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level");
	end 
	tinsert(strtab,"Rêi khái/exit_dialog");  		
	Say(strTitle.."Ta b×nh sinh rÊt thİch chÕ t¹o hé gi¸p, cã cÇn ta gióp g× kh«ng?",
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


-- == ÒÅÍüÖÆ¿ã¼¼ÄÜ ===========================
function forget_life_skill()
	if (GetLifeSkillLevel(1, 9) > 0) then
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
		Say(strTitle.."Ng­¬i vÉn ch­a häc kü n¨ng may h¹ y µ? Ta sÏ gióp ng­¬i", 0)
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
	
	if (GetLifeSkillLevel(1, 9) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(1, 9)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETMAIN_NUM, nForgetTimes + 1)
				SetTask(LEV_LEARNRECIPE, 0)
				SetTask(RECIPE_SEX, 0)
				Msg2Player("Kü n¨ng may h¹ y ng­¬i ®· quªn råi")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;

-- == Ñ§Ï°ÖÆ¿ã¼¼ÄÜ ===========================
function learn_shoes_skill()
	if (GetLevel() < 10) then
		Say(strTitle.."B¹n kh«ng ®ñ <color=yellow>cÊp 10<color> chø?thÓ häc kü n¨ng sèng.", 0)
		return
	end  
	
	if (GetLifeSkillsNum(1) >= 2) then
		Say(strTitle.."B»ng h÷u ®· häc kü n¨ng s¶n xuÊt, muèn häc kü n¨ng míi cÇn ph¶i bá kü n¨ng cò.", 0)
    	return
	end

	Say(strTitle.."<color=yellow>Kü n¨ng may h¹ y<color> sÏ lµ kü n¨ng s¶n xuÊt, ng­¬i cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/learn_as_main",
    	"§Ó ta suy nghÜ l¹i/exit_dialog")
end;
-- == Ñ¡ÔñÄĞ¿ã»¹ÊÇÅ®¿ã ====
function learn_as_main()
	if (2 > GetLifeSkillsNum(1)) then
		Say(strTitle.."Kü n¨ng may h¹ y gåm: <color=yellow>h¹ y nam<color> vµ <color=yellow>h¹ y n÷<color>, ng­¬i muèn häc lo¹i nµo?",
			3,
			"May h¹ y nam/choose_man",
			"May h¹ y n÷/choose_women",
			"§Ó ta suy nghÜ./exit_dialog")
	end
end;
-- == Ñ¡ÔñÄĞÒÂÏÂ×°Ö¯Ôì ====
function choose_man()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B¹n häc ®­îc phèi chÕ: kü n¨ng may h¹ y")
      		
      		AddRecipe(323)
      		Msg2Player("B¹n häc ®­îc phèi chÕ: Lang b× y")
			AddRecipe(324)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Trang phôc Nh­ ı")
			AddRecipe(325)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hæ b× y")
			AddRecipe(326)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Khinh Gi¸p y")
			AddRecipe(341)
			Msg2Player("B¹n häc ®­îc phèi chÕ: M·ng Ng­u y")
			AddRecipe(342)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Kim T¬ y")
			AddRecipe(343)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hµo Dòng Trang")
			AddRecipe(344)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Lò Trang")
			
			SetTask(LEV_LEARNRECIPE, 10)
			SetTask(RECIPE_SEX, 1)
		end
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;
-- == Ñ¡ÔñÅ®ÒÂÏÂ×°Ö¯Ôì ====
function choose_women()
	if (2 > GetLifeSkillsNum(1)) then
		if (LearnLifeSkill(1, 9, 1, 79, 1)) then
      		Msg2Player("B¹n häc ®­îc phèi chÕ: kü n¨ng may h¹ y")
    		
    		AddRecipe(359)
    		Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c Nhung Tó Trang")
			AddRecipe(360)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch V©n Tó Trang")
			AddRecipe(361)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ LuyÖn Tó Trang")
			AddRecipe(362)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Hoµn Tó Trang")
			AddRecipe(377)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phong TrÇn Tó Trang")
			AddRecipe(378)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Linh VËn Tó Trang")
			AddRecipe(379)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hång Tó Trang")
			AddRecipe(380)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phong Vò Tó Trang")
			
		    SetTask(LEV_LEARNRECIPE, 10)
		    SetTask(RECIPE_SEX, 2)
		end
	else
		Say(strTitle.."B¹n ®· häc kü n¨ng sèng, kh«ng thÓ häc thªm kü n¨ng kh¸c.", 0)
	end
end;



-- == Ñ§Ï°ĞÂµÄÅä·½ ===========================
function learn_new_recipe()
	local nLevel = GetLifeSkillLevel(1, 9)
	
	if (nLevel >= 1 and GetTask(LEV_LEARNRECIPE) == 0) then
		Say(strTitle.."Kü n¨ng may h¹ y gåm: <color=yellow>h¹ y nam<color> vµ <color=yellow>h¹ y n÷<color>, ng­¬i muèn häc lo¹i nµo?",
			3,
			"May h¹ y nam/recipe_man",
			"May h¹ y n÷/recipe_women",
			"§Ó ta suy nghÜ./exit_dialog")
		return
	end
	
	-- ÄĞ×°Åä·½Éı¼¶
	if (1 == GetTask(RECIPE_SEX)) then
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(327)
			Msg2Player("B¹n häc ®­îc phèi chÕ: D¹ Hµnh Trang")
			AddRecipe(328)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Háa T­êng Trang")
			AddRecipe(345)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Du HiÖp Trang")
			AddRecipe(346)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hæ B× K×nh Trang")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(329)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Xİch Lang Trang")
			AddRecipe(330)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Trang phôc Nh­ ı")
			AddRecipe(347)
			Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Lan y")
			AddRecipe(348)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh S­¬ng Trang")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(331)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Long B× y")
			AddRecipe(332)
			Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÔn ¶nh y")
			AddRecipe(349)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Phong Trang")
			AddRecipe(350)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Bİ Èn Trang")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(333)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn Lang y")
			AddRecipe(334)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Ng­ y")
			AddRecipe(351)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn S¸ch y")
			AddRecipe(352)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn L«i y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(335)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thanh V©n y")
			AddRecipe(336)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch L©n y")
			AddRecipe(353)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Nhu C­¬ng y")
			AddRecipe(354)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Cuång Viªm y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(337)
			Msg2Player("B¹n häc ®­îc phèi chÕ: S¸t KiÕp Trang")
			AddRecipe(338)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ¤ T»m y")
			AddRecipe(355)
			Msg2Player("B¹n häc ®­îc phèi chÕ: HuyÕt Hµ y")
			AddRecipe(356)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn C­¬ng y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!", 0)
		end
		
	-- Å®×°Åä·½Éı¼¶
	else
		if (nLevel >= 10 and GetTask(LEV_LEARNRECIPE) == 10) then
			AddRecipe(363)
			Msg2Player("B¹n häc ®­îc phèi chÕ: LuyÖn Gi¸p Tó y")
			AddRecipe(364)
			Msg2Player("B¹n häc ®­îc phèi chÕ: S­ Man Tó y")
			AddRecipe(381)
			Msg2Player("B¹n häc ®­îc phèi chÕ: H·m TrËn Tó y")
			AddRecipe(382)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch Hå Tó y")
			SetTask(LEV_LEARNRECIPE, 20)
		elseif (nLevel >= 20 and GetTask(LEV_LEARNRECIPE) == 20) then
			AddRecipe(365)
			Msg2Player("B¹n häc ®­îc phèi chÕ: CÈm Anh Tó y")
			AddRecipe(366)
			Msg2Player("B¹n häc ®­îc phèi chÕ: V©n Hµ Tó y")
			AddRecipe(383)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn T»m Tó y")
			AddRecipe(384)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Khëi La Tó y")
			SetTask(LEV_LEARNRECIPE, 30)
		elseif (nLevel >= 30 and GetTask(LEV_LEARNRECIPE) == 30) then
			AddRecipe(367)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Toµn Kim Gi¸p y")
			AddRecipe(368)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hång V©n Tó y")
			AddRecipe(385)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vò ThÇn Tó y")
			AddRecipe(386)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Linh Lung Tó y")
			SetTask(LEV_LEARNRECIPE, 40)
		elseif (nLevel >= 40 and GetTask(LEV_LEARNRECIPE) == 40) then
			AddRecipe(369)
			Msg2Player("B¹n häc ®­îc phèi chÕ: L«i ThÇn y")
			AddRecipe(370)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Thiªn M· y")
			AddRecipe(387)
			Msg2Player("B¹n häc ®­îc phèi chÕ: B¸ch ChiÕn y")
			AddRecipe(388)
			Msg2Player("B¹n häc ®­îc phèi chÕ: ThÇn N÷ y")
			SetTask(LEV_LEARNRECIPE, 50)
		elseif (nLevel >= 50 and GetTask(LEV_LEARNRECIPE) == 50) then
			AddRecipe(371)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Ph¸ TrËn y")
			AddRecipe(372)
			Msg2Player("B¹n häc ®­îc phèi chÕ: PhÊt V©n y")
			AddRecipe(389)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Vò Linh y")
			AddRecipe(390)
			Msg2Player("B¹n häc ®­îc phèi chÕ: T¶n Hoa y")
			SetTask(LEV_LEARNRECIPE, 60)
		elseif (nLevel >= 60 and GetTask(LEV_LEARNRECIPE) == 60) then
			AddRecipe(373)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hæ KhiÕu y")
			AddRecipe(374)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Th¸i Thanh y")
			AddRecipe(391)
			Msg2Player("B¹n häc ®­îc phèi chÕ: Hång Ngäc y")
			AddRecipe(392)
			Msg2Player("B¹n häc ®­îc phèi chÕ: XuÊt V©n y")
			SetTask(LEV_LEARNRECIPE, 70)
		else
		    Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
		end
	end
end;

function learnLtEquip()
	local nLevel = GetLifeSkillLevel(1, 9)
	if nLevel >= 79 then
    	AddRecipe(1139)
    	AddRecipe(1140)
    	AddRecipe(1141)
    	AddRecipe(1142)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Trang (S¸t th­¬ng)"))
    	AddRecipe(1143)
    	AddRecipe(1144)
    	AddRecipe(1145)
    	AddRecipe(1146)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Trang  (Ngo¹i c«ng)"))
    	AddRecipe(1147)
    	AddRecipe(1148)
    	AddRecipe(1149)
    	AddRecipe(1150)
    	Msg2Player(format("§· häc phèi chÕ míi: %s", "Linh §å Trang (Néi kİch)"))
	else
    	Say(strTitle..": §õng qu¸ n«n nãng, kinh nghiÖm giang hå ng­¬i cßn kĞm l¾m, cè g¾ng thªm nhĞ!",0)
	end
end

-- == Ñ¡Ôñ²¢ÇÒ²¹Ï°ÄĞ¿ãÖÆÔì¼¼ÄÜ ====
function recipe_man()
	AddRecipe(323)
    Msg2Player("B¹n häc ®­îc phèi chÕ: Lang b× y")
	AddRecipe(324)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Trang phôc Nh­ ı")
	AddRecipe(325)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Hæ b× y")
	AddRecipe(326)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Khinh Gi¸p y")
	AddRecipe(341)
	Msg2Player("B¹n häc ®­îc phèi chÕ: M·ng Ng­u y")
	AddRecipe(342)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim T¬ y")
	AddRecipe(343)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Hµo Dòng Trang")
	AddRecipe(344)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Kim Lò Trang")
			
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 1)
end;
-- == Ñ¡Ôñ²¢ÇÒ²¹Ï°Å®¿ãÖÆÔì¼¼ÄÜ ====
function recipe_women()
	AddRecipe(359)
    Msg2Player("B¹n häc ®­îc phèi chÕ: H¾c Nhung Tó Trang")
	AddRecipe(360)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Bİch V©n Tó Trang")
	AddRecipe(361)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Vâ LuyÖn Tó Trang")
	AddRecipe(362)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Háa Hoµn Tó Trang")
	AddRecipe(377)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Phong TrÇn Tó Trang")
	AddRecipe(378)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Linh VËn Tó Trang")
	AddRecipe(379)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Phi Hång Tó Trang")
	AddRecipe(380)
	Msg2Player("B¹n häc ®­îc phèi chÕ: Phong Vò Tó Trang")
		
	SetTask(LEV_LEARNRECIPE, 10)
	SetTask(RECIPE_SEX, 2)
end;

function task_new3()
	talk_IV();
end

function bagua()
	Say("<color=green>Tö Quyªn C« N­¬ng<color>: <color=red>Trang bŞ b¸t qu¸i<color> lµ së tr­êng cña ta + M¹c thŞ vµ l·o L­u ë T­¬ng D­¬ng, nh­ng tèt nhÊt nªn hái qua C«ng D· ThÕ gia tr­íc, cßn nÕu muèn biÕt chi tiÕt vÒ trang bŞ <color=yellow>kh¶m n¹m Linh th¹ch<color> th× gÆp ta lµ ®óng ng­êi råi!",
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
	if GetLifeSkillLevel(1, 9) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng s¶n xuÊt ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(1, 9, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng s¶n xuÊt ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end