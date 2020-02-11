-- =========================================================
-- File: Éú»îÊÖÔıµÄ½Å±¾
-- Name: lifescroll.lua
-- ID:   2, 19, 1
-- Desc: ½«ÒÑ¾­Ñ§Ï°ÁËµÄÉú»î¼¼ÄÜ¼ÇÂ¼ÔÚÉú»îÊÖÔıÉÏÃæ£¬»òÕßÊ¹ÓÃÒÔºóÑ§»áÉú»îÊÖÔıÉÏÃæµÄÉú»î¼¼ÄÜ
-- Creator: Tony(Jizheng)
-- Date: Aug 28th, 2006
-- =========================================================

strTabMainSkill = {"Kü nghÖ gia truyÒn", "ChÕ t¹o binh khİ dµi", "ChÕ t¹o binh khİ ng¾n", "ChÕ t¹o kú m«n binh khİ", 
				   "Lµm hé gi¸p", "ChÕ thuèc", "NÊu n­íng", "ChÕ phï", "H¹ trang", "§Çu qu¸n"}
							 
strTabSubSkill = {"§èn c©y", "Lµm da", "Canh t¸c",	"H¸i thuèc", "§µo kho¸ng", "KĞo t¬", "TËp linh"}


-- Ê¹ÓÃÎïÆ·µÄÊ±ºò£¬Ä¬ÈÏµÄÈë¿Úº¯Êı
function OnUse(nIdx)
	local nScrollIndex = tonumber(nIdx)		-- ±»Ê¹ÓÃµÄÉú»îÊÖÔıµÄIndex
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollIndex)
	
	-- Èç¹ûÒÑ¾­´æÁËÉú»î¼¼ÄÜµÄ¾íÖá
	if (nLifeSkillID > 0) then
		local strSayPrefix = "B¹n ph¶i sö dông sæ tay sèng, häc kü n¨ng <color=yellow>"
		local strSaySuffix = "<color>, kü n¨ng ®¹t: <color=yellow>"..nLifeSkillLevel.."<color>, ®iÓm kinh nghiÖm hiÖn t¹i lµ: <color=yellow>"..nLifeSkillExp.."<color>. X¸c ®Şnh chø?"
		local strSay
		if (nLifeSkillType == 0) then
			strSay = strSayPrefix..strTabSubSkill[nLifeSkillID]..strSaySuffix
		else
			strSay = strSayPrefix..strTabMainSkill[nLifeSkillID]..strSaySuffix
		end
		
		Say(strSay,
			2,
			"Häc kü n¨ng/#learn_skill("..nScrollIndex..")",
			"Suy nghÜ l¹i/exit_dialog")
		
	-- Èç¹ûÊÇ¸ö¿ÕµÄ¾íÖá
	else
		EnterCatchLifeSkill(nScrollIndex)	-- Í¨Öª½çÃæ½øÈëÈ¡ÏÂÉú»î¼¼ÄÜµÄ×´Ì¬
	end
end;

-- ½«Éú»î¼¼ÄÜÈ¡ÏÂÀ´ÒÔºó£¬Ä¬ÈÏµÄ»Øµ÷º¯Êı
function OnCatchLifeSkill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	-- Èç¹ûÓĞĞèÒªÈ¡ÏÂµÄÉú»î¼¼ÄÜ
	if (nLifeSkillID > 0) then
		if (nLifeSkillType == 1 and nLifeSkillID == 1) then
			Say("<color=yellow>Kü n¨ng giang hå<color> kh«ng thÓ häc tïy tiÖn!", 0)
		end
		
		if (nLifeSkillType == 0) then
			Say("B¹n x¸c nhËn muèn häc kü n¨ng thu thËp: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> vµ sö dông sæ tay sèng kh«ng?",
				2,
				"X¸c nhËn/catch_life_skill",
				"T¹m thêi kh«ng muèn häc/exit_dialog")
		else
			Say("B¹n x¸c nhËn muèn häc kü n¨ng s¶n xuÊt: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color> vµ sö dông sæ tay sèng kh«ng?",
				2,
				"X¸c nhËn/catch_life_skill",
				"T¹m thêi kh«ng muèn häc/exit_dialog")
		end
	end
end;

-- ÕıÊ½½«Éú»î¼¼ÄÜ´æÈë¾íÖáÖĞ
function catch_life_skill()
	local nLifeSkillType, nLifeSkillID = QueryCatchLifeSkill()
	if (MakeALifeScroll() == 1) then
		if (nLifeSkillType == 1 and (nLifeSkillID == 5 or nLifeSkillID == 9 or nLifeSkillID == 10)) then	-- »¤¼×ÖÆÔì²¹³¥Í¼Ö½
			pay_back_blueprints()
		end
		if (nLifeSkillType == 1 and (nLifeSkillID == 2 or nLifeSkillID == 3 or nLifeSkillID == 4)) then		-- ÎäÆ÷²¹³¥
			pay_back_weaponprints()
		end
		clean_task_values(nLifeSkillType, nLifeSkillID)
		AbandonLifeSkill(nLifeSkillType, nLifeSkillID)
		if (nLifeSkillType == 0) then
			Say("B¹n ®· häc ®­îc kü n¨ng thu thËp: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color> vµ sö dông ®­îc sæ tay sèng.", 0)
		else
			Say("B¹n ®· häc ®­îc kü n¨ng s¶n xuÊt: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color> vµ sö dông ®­îc sæ tay sèng.", 0)
		end
	end
end;


-- Ê²Ã´¶¼²»×öµÄ¿Õº¯Êı
function exit_dialog()
end;

-- È·ÈÏÒªÑ§Ï°Éú»î¼¼ÄÜ
function learn_skill(nScrollIndex)
	local nScrollItemIdx = tonumber(nScrollIndex)
	local nLifeSkillType, nLifeSkillID, nLifeSkillLevel, nLifeSkillExp = GetLifeScrollInfo(nScrollItemIdx)

	-- ¼ì²éÊÇ·ñĞÂÊÖ
	if (GetLevel() < 10 or GetTask(1925) ~= 15) then
		Say("B¹n cÇn ph¶i ®¹t ®Õn cÊp 10 vµ hoµn thµnh nhiÖm vô t©n thñ míi cã thÓ häc kü n¨ng sèng!", 0)
		return
	end

	-- ¼ì²éÊÇ·ñÑ§¹ıÁË	
	if (nLifeSkillType ~= 0) then		-- ÊÇ¸¨¼¼ÄÜ£¬¼ì²éÓĞÃ»ÓĞÑ§¹ıÒ»ÑùµÄ¼¼ÄÜ
	--	if (GetLifeSkillLevel(nLifeSkillType, nLifeSkillID) > 0) then
	--		Say("ÄãÒÑ¾­Ñ§»áÁËÕâ¸ö²É¼¯¼¼ÄÜ£¬ÒªÖØĞÂÑ§Ï°£¬±ØĞëÒÅÍü»òÕßÈ¡ÏÂµ±Ç°Éú»î¼¼ÄÜ£º<color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>£¡", 0)
	--		return
	--	end
	--else								-- ÊÇÖ÷¼¼ÄÜ£¬¼ì²éÓĞÃ»ÓĞÑ§¹ıÈÎºÎÒ»¸öÖ÷¼¼ÄÜ
		if (GetLifeSkillsNum(1) >= 2) then
			Say("B¹n ®· häc kü n¨ng s¶n xuÊt! Muèn häc kü n¨ng s¶n xuÊt míi, ph¶i xãa ®i hoÆc häc l¹i kü n¨ng s¶n xuÊt vèn cã!", 0)
			return
		end
	end
	
	-- Èç¹û³É¹¦É¾³ıÁËÖ¸¶¨¾íÖá
	if (DelItemByIndex(nScrollItemIdx, 1) == 1) then
		if (nLifeSkillLevel <= 79) then
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 79, nLifeSkillType)
		else
			LearnLifeSkill(nLifeSkillType, nLifeSkillID, nLifeSkillLevel, 99, nLifeSkillType)
		end
		AddLifeSkillExp(nLifeSkillType, nLifeSkillID, nLifeSkillExp)
		
		if (nLifeSkillType == 0) then
			Say("B¹n ®· häc thµnh c«ng kü n¨ng sèng: <color=yellow>"..strTabSubSkill[nLifeSkillID].."<color>. Xin chóc mõng!", 0)
		else
			Say("B¹n ®· häc thµnh c«ng kü n¨ng sèng: <color=yellow>"..strTabMainSkill[nLifeSkillID].."<color>. Xin chóc mõng!", 0)
		end
	end
end;


-- Çå³ıÏà¹ØµÄÈÎÎñ±äÁ¿
function clean_task_values(nLifeSkillType, nLifeSkillID)
	if (nLifeSkillType == 1) then
		-- Åä·½µ±Ç°Ñ§µ½µÄµÈ¼¶ LEV_LEARNRECIPE
		SetTask(1926, 0)	
		
		-- ÖÆÒÂ¼¼ÄÜµÄĞÔ±ğÑ¡Ôñ RECIPE_SEX
		if (nLifeSkillID == 5 or nLifeSkillID == 9 or nLifeSkillID == 10) then
			SetTask(1935, 0)	
		end	
	end
end;

-- ÎäÆ÷ÖÆÔì²¹³¥Í¼Ö½
function pay_back_weaponprints()
	if (HaveLearnRecipe(955) > 0 or HaveLearnRecipe(956) > 0) then	-- ·üÄ§½ğ¸ÕÖ®Õ½Òâµ¶Æ×
		AddItem(2, 1, 1071, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ChiÕn ı ®ao phæ!")
	end
	if (HaveLearnRecipe(957) > 0 or HaveLearnRecipe(958) > 0) then	-- ·üÄ§½ğ¸ÕÖ®Õ½Òâ¹÷Æ×
		AddItem(2, 1, 1072, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ChiÕn ı c«n phæ!")
	end
	if (HaveLearnRecipe(959) > 0 or HaveLearnRecipe(960) > 0) then	-- ´«¾­·¨Ê¦Ö®ìø¾²ÕÈÆ×
		AddItem(2, 1, 1073, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThiÒn TŞnh tr­îng phæ!")
	end
	if (HaveLearnRecipe(961) > 0 or HaveLearnRecipe(962) > 0) then	-- »¤·¨ÂŞººÖ®¶·ÆøÊÖÆ×
		AddItem(2, 1, 1074, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §Êu Khİ thñ phæ!")
	end
	if (HaveLearnRecipe(963) > 0 or HaveLearnRecipe(964) > 0 or
		HaveLearnRecipe(965) > 0 or HaveLearnRecipe(966) > 0) then	-- ÃØ¶¾´Ì¿ÍÖ®ÒşÃØÕëÆ×
		AddItem(2, 1, 1075, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Bİ §éc ch©m phæ!")
	end
	
	if (HaveLearnRecipe(967) > 0 or HaveLearnRecipe(968) > 0) then	-- ×ÏÖñÊ¹Ö®·¨ÔÆ½£Æ×
		AddItem(2, 1, 1076, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ph¸p V©n kiÕm phæ!")
	end
	if (HaveLearnRecipe(969) > 0 or HaveLearnRecipe(970) > 0) then	-- º£ÔÂÊ¹Ö®·¨ÒôÇÙÆ×
		AddItem(2, 1, 1077, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ph¸p ¢m cÇm phæ!")
	end
	if (HaveLearnRecipe(971) > 0 or HaveLearnRecipe(972) > 0 or
		HaveLearnRecipe(973) > 0 or HaveLearnRecipe(974) > 0) then	-- ËÄº£ÏÀÖ®ºÀÆøÊÖÆ×
		AddItem(2, 1, 1078, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Hµo Khİ thñ phæ!")
	end
	if (HaveLearnRecipe(975) > 0 or HaveLearnRecipe(976) > 0 or
		HaveLearnRecipe(977) > 0 or HaveLearnRecipe(978) > 0) then	-- °Ë´üµÜ×ÓÖ®¾ÛÒå°ôÆ×
		AddItem(2, 1, 1079, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Tô NghÜa bæng phæ!")
	end
	
	if (HaveLearnRecipe(979) > 0 or HaveLearnRecipe(980) > 0 or
		HaveLearnRecipe(981) > 0 or HaveLearnRecipe(982) > 0) then	-- ÎŞÎÒµÀÈËÖ®ËÄÏó·¨½£Æ×
		AddItem(2, 1, 1080, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Tø T­îng ph¸p kiÕm phæ!")
	end
	if (HaveLearnRecipe(983) > 0 or HaveLearnRecipe(984) > 0 or
		HaveLearnRecipe(985) > 0 or HaveLearnRecipe(986) > 0) then	-- ÏĞÔÆÏÀµÀÖ®Áé·ç´ÌÆ×
		AddItem(2, 1, 1081, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Linh Phong thİch phæ!")
	end
	
	if (HaveLearnRecipe(987) > 0 or HaveLearnRecipe(988) > 0 or
		HaveLearnRecipe(989) > 0 or HaveLearnRecipe(990) > 0) then	-- ·ÜÎä½«¾üÖ®Í¸¼×Ç¹Æ×
		AddItem(2, 1, 1082, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThÊu Gi¸p th­¬ng phæ!")
	end
	if (HaveLearnRecipe(991) > 0 or HaveLearnRecipe(992) > 0 or
		HaveLearnRecipe(993) > 0 or HaveLearnRecipe(994) > 0) then	-- ·ÜÍş½«¾üÖ®´©¼×¹­Æ×
		AddItem(2, 1, 1083, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Xuyªn Gi¸p cung phæ!")
	end
	
	if (HaveLearnRecipe(995) > 0 or HaveLearnRecipe(996) > 0 or
		HaveLearnRecipe(997) > 0 or HaveLearnRecipe(998) > 0) then	-- ºÚÎŞ³£Ö®ÃÍ¶¾µ¶Æ×
		AddItem(2, 1, 1084, 1)
		Msg2Player("B¹n nhËn ®­îc 1 M·nh §éc ®ao phæ!")
	end
	if (HaveLearnRecipe(999) > 0 or HaveLearnRecipe(1000) > 0 or
		HaveLearnRecipe(1001) > 0 or HaveLearnRecipe(1002) > 0) then	-- °×ÎŞ³£Ö®¹î¶¾×¦Æ×
		AddItem(2, 1, 1085, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ngôy §éc tr¶o phæ!")
	end
	
	if (HaveLearnRecipe(1019) > 0) then
		AddItem(2, 1, 3017, 1)
		Msg2Player("B¹n nhËn ®­îc B¹n nhËn ®­îc 1 Ngäc Trô §å Phæ!")
	end
	if (HaveLearnRecipe(1020) > 0) then
		AddItem(2, 1, 3018, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThÇn Ch©m §å Phæ!")
	end
	if (HaveLearnRecipe(1029) > 0) then
		AddItem(2, 1, 3027, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Môc Kiªn Liªn Tr­îng §å Phæ!")
	end
	if (HaveLearnRecipe(1030) > 0) then
		AddItem(2, 1, 3028, 1)
		Msg2Player("B¹n nhËn ®­îc 1 D­îc S­ Tr­îng §å Phæ!")
	end
	if (HaveLearnRecipe(1031) > 0) then
		AddItem(2, 1, 3029, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Cöu Long Toµn Kİch §å Phæ!")
	end
	if (HaveLearnRecipe(1032) > 0) then
		AddItem(2, 1, 3030, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Th­¬ng N« §å Phæ!")
	end
	
	if (HaveLearnRecipe(1015) > 0) then
		AddItem(2, 1, 3013, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThÇn Quy §å Phæ!")
	end
	if (HaveLearnRecipe(1016) > 0) then
		AddItem(2, 1, 3014, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ¢m D­¬ng Ên §å Phæ!")
	end
	if (HaveLearnRecipe(1017) > 0) then
		AddItem(2, 1, 3015, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Häa ¶nh §å Phæ!")
	end
	if (HaveLearnRecipe(1018) > 0) then
		AddItem(2, 1, 3016, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Nha Cöu §å Phæ!")
	end
	if (HaveLearnRecipe(1023) > 0) then
		AddItem(2, 1, 3021, 1)
		Msg2Player("B¹n nhËn ®­îc 1 LËu C¶nh §å Phæ!")
	end
	if (HaveLearnRecipe(1024) > 0) then
		AddItem(2, 1, 3022, 1)
		Msg2Player("B¹n nhËn ®­îc 1 NghŞch L©n §å Phæ!")
	end
	if (HaveLearnRecipe(1037) > 0) then
		AddItem(2, 1, 3035, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Bİch Thñy §å Phæ!")
	end
	if (HaveLearnRecipe(1038) > 0) then
		AddItem(2, 1, 3036, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Thiªn T«n §å Phæ!")
	end
	
	if (HaveLearnRecipe(1021) > 0) then
		AddItem(2, 1, 3019, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Khoa Phï §å Phæ!")
	end
	if (HaveLearnRecipe(1022) > 0) then
		AddItem(2, 1, 3020, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Mét Vò §å Phæ!")
	end
	if (HaveLearnRecipe(1025) > 0) then
		AddItem(2, 1, 3023, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §¹i Th¸nh DŞ ¢m §å Phæ!")
	end
	if (HaveLearnRecipe(1026) > 0) then
		AddItem(2, 1, 3024, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Kh« Méc Long Ng©m §å Phæ!")
	end
	if (HaveLearnRecipe(1027) > 0) then
		AddItem(2, 1, 3025, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Toan Dù §å Phæ!")
	end
	if (HaveLearnRecipe(1028) > 0) then
		AddItem(2, 1, 3026, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Th¸i H­ §å Phæ!")
	end
	if (HaveLearnRecipe(1033) > 0) then
		AddItem(2, 1, 3031, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Viªn §Ò §å Phæ!")
	end
	if (HaveLearnRecipe(1034) > 0) then
		AddItem(2, 1, 3032, 1)
		Msg2Player("B¹n nhËn ®­îc 1 BÊt X¹ Chi X¹ §å Phæ!")
	end
	if (HaveLearnRecipe(1035) > 0) then
		AddItem(2, 1, 3033, 1)
		Msg2Player("B¹n nhËn ®­îc 1 V« Ng©n §å Phæ!")
	end
	if (HaveLearnRecipe(1036) > 0) then
		AddItem(2, 1, 3034, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Thanh Long §å Phæ!")
	end
end;

-- »¤¼×ÖÆÔì²¹³¥Í¼Ö½
function pay_back_blueprints()
	if (HaveLearnRecipe(809) > 0 or HaveLearnRecipe(810) > 0) then	-- ĞĞÕß·ş
		AddItem(2, 1, 425, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Hµnh Gi¶ Phôc Phæ!")
	end
	
	if (HaveLearnRecipe(811) > 0 or HaveLearnRecipe(812) > 0) then	-- »ìÔª·ş
		AddItem(2, 1, 426, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Hçn Nguyªn Phôc Phæ!")
	end
	
	if (HaveLearnRecipe(813) > 0 or HaveLearnRecipe(814) > 0) then	-- ·üÄ§½ğ¸ÕÖ®Õ½Òâîø¼×
		AddItem(2, 1, 427, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ChiÕn ı Kh¶i Gi¸p Phæ!")
	end
	
	if (HaveLearnRecipe(815) > 0 or HaveLearnRecipe(816) > 0) then	-- ¿àĞĞÅÛ
		AddItem(2, 1, 428, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Khæ Hµnh Bµo Phæ!")
	end
	
	if (HaveLearnRecipe(817) > 0 or HaveLearnRecipe(818) > 0) then	-- ìøĞŞÅÛ
		AddItem(2, 1, 429, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThiÒn Tu Bµo Phæ!")
	end
	
	if (HaveLearnRecipe(819) > 0 or HaveLearnRecipe(820) > 0) then	-- ´«¾­·¨Ê¦Ö®ìø¾²ÅÛÉ³ÃÖ·şÆ×
		AddItem(2, 1, 430, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThiÒn TŞnh Bµo Phæ!")
	end

	if (HaveLearnRecipe(821) > 0 or HaveLearnRecipe(822) > 0) then	-- É³ÃÖ·ş
		AddItem(2, 1, 431, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Sa Di Phôc Phæ!")
	end
	
	if (HaveLearnRecipe(823) > 0 or HaveLearnRecipe(824) > 0) then	-- ¶·É®·ş
		AddItem(2, 1, 432, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §Êu T¨ng Phôc Phæ!!")
	end
	
	if (HaveLearnRecipe(825) > 0 or HaveLearnRecipe(826) > 0) then	-- »¤·¨ÂŞººÖ®¶·ÆøÕ½ÒÂ
		AddItem(2, 1, 433, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §Êu Khİ ChiÕn Y Phæ!")
	end
	
	if (HaveLearnRecipe(827) > 0 or HaveLearnRecipe(828) > 0 or
		HaveLearnRecipe(829) > 0 or HaveLearnRecipe(830) > 0) then	-- ×¯¿Í·ş
		AddItem(2, 1, 434, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Trang Kh¸ch Phôc Phæ!")
	end
	
	if (HaveLearnRecipe(831) > 0 or HaveLearnRecipe(832) > 0 or
		HaveLearnRecipe(833) > 0 or HaveLearnRecipe(834) > 0) then	-- »¤ÎÀ·ş
		AddItem(2, 1, 435, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Hé VÖ Phôc Phæ!")
	end
	
	if (HaveLearnRecipe(835) > 0 or HaveLearnRecipe(836) > 0 or
		HaveLearnRecipe(837) > 0 or HaveLearnRecipe(838) > 0) then	-- ÃØ¶¾´Ì¿ÍÖ®ÒşÃØ·ş
		AddItem(2, 1, 436, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Bİ §éc phôc phæ")
	end
	
	if (HaveLearnRecipe(839) > 0 or HaveLearnRecipe(840) > 0) then	-- ÇåĞÄËØÒÂ
		AddItem(2, 1, 437, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Thanh T©m Tè Y Phæ!")
	end
	
	if (HaveLearnRecipe(841) > 0 or HaveLearnRecipe(842) > 0) then	-- ²ÊÓğËØÒÂ
		AddItem(2, 1, 438, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Th¸i Vò Tè Y Phæ!")
	end
	
	if (HaveLearnRecipe(843) > 0 or HaveLearnRecipe(844) > 0) then	-- ×ÏÖñÊ¹Ö®·¨ÔÆÒÂ
		AddItem(2, 1, 439, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ph¸p V©n Y Phæ!")
	end
	
	if (HaveLearnRecipe(845) > 0 or HaveLearnRecipe(846) > 0) then	-- Ë¼ÇúËØÒÂ
		AddItem(2, 1, 440, 1)
		Msg2Player("B¹n nhËn ®­îc 1 T­ Khóc Tè Y Phæ!")
	end
	
	if (HaveLearnRecipe(847) > 0 or HaveLearnRecipe(848) > 0) then	-- èóÒôËØÒÂ
		AddItem(2, 1, 441, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ph¹n ¢m Tè Y Phæ!")
	end
	
	if (HaveLearnRecipe(849) > 0 or HaveLearnRecipe(850) > 0) then	-- º£ÔÂÊ¹Ö®·¨ÒôÒÂ
		AddItem(2, 1, 442, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ph¸p ¢m Y Phæ!")
	end
	
	if (HaveLearnRecipe(851) > 0 or HaveLearnRecipe(852) > 0 or
		HaveLearnRecipe(853) > 0 or HaveLearnRecipe(854) > 0) then	-- Ö´²§ÉÑ
		AddItem(2, 1, 443, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ChÊp B¸t Th­êng Phæ!")
	end
	
	if (HaveLearnRecipe(855) > 0 or HaveLearnRecipe(856) > 0 or
		HaveLearnRecipe(857) > 0 or HaveLearnRecipe(858) > 0) then	-- ³ı¼éÉÑ
		AddItem(2, 1, 444, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Trõ Gian Th­êng Phæ!")
	end
	
	if (HaveLearnRecipe(859) > 0 or HaveLearnRecipe(860) > 0 or
		HaveLearnRecipe(861) > 0 or HaveLearnRecipe(862) > 0) then	-- ËÄº£ÏÀÖ®ºÀÆø·ş
		AddItem(2, 1, 445, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Hµo Khİ Phôc Phæ!")
	end
	
	if (HaveLearnRecipe(863) > 0 or HaveLearnRecipe(864) > 0 or
		HaveLearnRecipe(865) > 0 or HaveLearnRecipe(866) > 0) then	-- ½Ğ»¨ÒÂ
		AddItem(2, 1, 446, 1)
		Msg2Player("B¹n nhËn ®­îc 1 KhiÕu Hoa Y Phæ!")
	end
	
	if (HaveLearnRecipe(867) > 0 or HaveLearnRecipe(868) > 0 or
		HaveLearnRecipe(869) > 0 or HaveLearnRecipe(870) > 0) then	-- ³Í¶ñÉÑ
		AddItem(2, 1, 447, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Trõng ¸c Th­êng Phæ!")
	end
	
	if (HaveLearnRecipe(871) > 0 or HaveLearnRecipe(872) > 0 or
		HaveLearnRecipe(873) > 0 or HaveLearnRecipe(874) > 0) then	-- °Ë´üµÜ×ÓÖ®¾ÛÒåÉÑ
		AddItem(2, 1, 448, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Tô NghÜa Th­êng Phæ!")
	end

	if (HaveLearnRecipe(875) > 0 or HaveLearnRecipe(876) > 0 or
		HaveLearnRecipe(877) > 0 or HaveLearnRecipe(878) > 0) then	-- ÇåĞŞÅÛ
		AddItem(2, 1, 449, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Thanh Tu Bµo Phæ!")
	end
	
	if (HaveLearnRecipe(879) > 0 or HaveLearnRecipe(880) > 0 or
		HaveLearnRecipe(881) > 0 or HaveLearnRecipe(882) > 0) then	-- Èë¹Û·¨ÅÛ
		AddItem(2, 1, 450, 1)
		Msg2Player("B¹n nhËn ®­îc 1 NhËp Quan Ph¸p Bµo Phæ!")
	end
	
	if (HaveLearnRecipe(883) > 0 or HaveLearnRecipe(884) > 0 or
		HaveLearnRecipe(885) > 0 or HaveLearnRecipe(886) > 0) then	-- ÎŞÎÒµÀÈËÖ®ËÄÏó·¨ÅÛ
		AddItem(2, 1, 451, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Tø T­îng Ph¸p Bµo Phæ!")
	end
	
	if (HaveLearnRecipe(887) > 0 or HaveLearnRecipe(888) > 0 or
		HaveLearnRecipe(889) > 0 or HaveLearnRecipe(890) > 0) then	-- Çå·çÅÛ
		AddItem(2, 1, 452, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Thanh Phong Bµo Phæ!")
	end
	
	if (HaveLearnRecipe(891) > 0 or HaveLearnRecipe(892) > 0 or
		HaveLearnRecipe(893) > 0 or HaveLearnRecipe(894) > 0) then	-- ÉÙÑôÉÑ
		AddItem(2, 1, 453, 1)
		Msg2Player("B¹n nhËn ®­îc 1 ThiÕu D­¬ng Th­êng Phæ!")
	end
	
	if (HaveLearnRecipe(895) > 0 or HaveLearnRecipe(896) > 0 or
		HaveLearnRecipe(897) > 0 or HaveLearnRecipe(898) > 0) then	-- ÏĞÔÆÏÀµÀÖ®Áé·çÉÑ
		AddItem(2, 1, 454, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Linh Phong Th­êng Phæ!")
	end
	
	if (HaveLearnRecipe(899) > 0 or HaveLearnRecipe(900) > 0 or
		HaveLearnRecipe(901) > 0 or HaveLearnRecipe(902) > 0) then	-- ÇáÆï¼×
		AddItem(2, 1, 455, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Khinh Kş Gi¸p Phæ!")
	end
	
	if (HaveLearnRecipe(903) > 0 or HaveLearnRecipe(904) > 0 or
		HaveLearnRecipe(905) > 0 or HaveLearnRecipe(906) > 0) then	-- Ğ£Î¾Ìú¼×
		AddItem(2, 1, 456, 1)
		Msg2Player("B¹n nhËn ®­îc 1 HiÖu óy ThiÕt Gi¸p Phæ!")
	end
	
	if (HaveLearnRecipe(907) > 0 or HaveLearnRecipe(908) > 0 or
		HaveLearnRecipe(909) > 0 or HaveLearnRecipe(910) > 0) then	-- ·ÜÎä½«¾üÖ®¾«¼×îø
		AddItem(2, 1, 457, 1)
		Msg2Player("B¹n nhËn ®­îc 1 PhÊn Vâ Tinh Gi¸p Kh¶i Phæ!")
	end
	
	if (HaveLearnRecipe(911) > 0 or HaveLearnRecipe(912) > 0 or
		HaveLearnRecipe(913) > 0 or HaveLearnRecipe(914) > 0) then	-- åóÊÖ¼×
		AddItem(2, 1, 458, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Nâ Thñ Gi¸p Phæ!")
	end
	
	if (HaveLearnRecipe(915) > 0 or HaveLearnRecipe(916) > 0 or
		HaveLearnRecipe(917) > 0 or HaveLearnRecipe(918) > 0) then	-- ¶¼Î¾Ìú¼×
		AddItem(2, 1, 459, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §« óy ThiÕt Gi¸p Phæ!")
	end
	
	if (HaveLearnRecipe(919) > 0 or HaveLearnRecipe(920) > 0 or
		HaveLearnRecipe(921) > 0 or HaveLearnRecipe(922) > 0) then	-- ·ÜÍş½«¾üÖ®¾«¼×îø
		AddItem(2, 1, 460, 1)
		Msg2Player("B¹n nhËn ®­îc 1 PhÊn Uy Tinh Gi¸p Kh¶i Phæ!")
	end
	
	if (HaveLearnRecipe(923) > 0 or HaveLearnRecipe(924) > 0 or
		HaveLearnRecipe(925) > 0 or HaveLearnRecipe(926) > 0) then	-- ¶áÆÇÒÂ
		AddItem(2, 1, 461, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §o¹t Ph¸ch Y Phæ!")
	end
	
	if (HaveLearnRecipe(927) > 0 or HaveLearnRecipe(928) > 0 or
		HaveLearnRecipe(929) > 0 or HaveLearnRecipe(930) > 0) then	-- ´ßÃüÒÂ
		AddItem(2, 1, 462, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Th«i MÖnh Y Phæ!")
	end
	
	if (HaveLearnRecipe(931) > 0 or HaveLearnRecipe(932) > 0 or
		HaveLearnRecipe(933) > 0 or HaveLearnRecipe(934) > 0) then	-- ºÚÎŞ³£Ö®ÃÍ¶¾ÒÂ
		AddItem(2, 1, 463, 1)
		Msg2Player("B¹n nhËn ®­îc 1 M·nh §éc Y Phæ!")
	end
	
	if (HaveLearnRecipe(935) > 0 or HaveLearnRecipe(936) > 0 or
		HaveLearnRecipe(937) > 0 or HaveLearnRecipe(938) > 0) then	-- ¶¾²ÏÒÂ
		AddItem(2, 1, 464, 1)
		Msg2Player("B¹n nhËn ®­îc 1 §éc Tµm Y Phæ!")
	end
	
	if (HaveLearnRecipe(939) > 0 or HaveLearnRecipe(940) > 0 or
		HaveLearnRecipe(941) > 0 or HaveLearnRecipe(942) > 0) then	-- Ê´ĞÄÒÂ
		AddItem(2, 1, 465, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Thùc T©m Y Phæ!")
	end
	
	if (HaveLearnRecipe(943) > 0 or HaveLearnRecipe(944) > 0 or
		HaveLearnRecipe(945) > 0 or HaveLearnRecipe(946) > 0) then	-- °×ÎŞ³£Ö®¹î¶¾ÒÂ
		AddItem(2, 1, 466, 1)
		Msg2Player("B¹n nhËn ®­îc 1 Ngôy §éc Y Phæ!")
	end
	
	if (HaveLearnRecipe(1053) > 0 or HaveLearnRecipe(1054) > 0 or
		HaveLearnRecipe(1055) > 0 or HaveLearnRecipe(1056) > 0 or
		HaveLearnRecipe(1077) > 0 or HaveLearnRecipe(1078) > 0 or
		HaveLearnRecipe(1079) > 0 or HaveLearnRecipe(1080) > 0) then	-- °Ë¼¶Í·¹ÚÅä·½
		AddItem(2, 1, 3044, 1)
		Msg2Player("B¹n nhËn ®­îc 1 mò Phèi Ph­¬ng cÊp 8!")
	end
	if (HaveLearnRecipe(1057) > 0 or HaveLearnRecipe(1058) > 0 or
		HaveLearnRecipe(1059) > 0 or HaveLearnRecipe(1060) > 0 or
		HaveLearnRecipe(1081) > 0 or HaveLearnRecipe(1082) > 0 or
		HaveLearnRecipe(1083) > 0 or HaveLearnRecipe(1084) > 0) then	-- °Ë¼¶ÉÏÒÂÅä·½
		AddItem(2, 1, 3045, 1)
		Msg2Player("B¹n nhËn ®­îc 1 th­îng y Phèi Ph­¬ng cÊp 8!")
	end
	if (HaveLearnRecipe(1061) > 0 or HaveLearnRecipe(1062) > 0 or
		HaveLearnRecipe(1063) > 0 or HaveLearnRecipe(1064) > 0 or
		HaveLearnRecipe(1085) > 0 or HaveLearnRecipe(1086) > 0 or
		HaveLearnRecipe(1087) > 0 or HaveLearnRecipe(1088) > 0) then	-- °Ë¼¶ÏÂÒÂÅä·½
		AddItem(2, 1, 3046, 1)
		Msg2Player("B¹n nhËn ®­îc 1 h¹ y Phèi Ph­¬ng cÊp 8!")
	end
	if (HaveLearnRecipe(1065) > 0 or HaveLearnRecipe(1066) > 0 or
		HaveLearnRecipe(1067) > 0 or HaveLearnRecipe(1068) > 0) then	-- ¾Å¼¶Í·¹ÚÅä·½
		AddItem(2, 1, 3047, 1)
		Msg2Player("B¹n nhËn ®­îc 1 mò Phèi Ph­¬ng cÊp 9!")
	end
	if (HaveLearnRecipe(1069) > 0 or HaveLearnRecipe(1070) > 0 or
		HaveLearnRecipe(1071) > 0 or HaveLearnRecipe(1072) > 0) then	-- ¾Å¼¶ÉÏÒÂÅä·½
		AddItem(2, 1, 3048, 1)
		Msg2Player("B¹n nhËn ®­îc 1 th­îng y Phèi Ph­¬ng cÊp 9!")
	end
	if (HaveLearnRecipe(1073) > 0 or HaveLearnRecipe(1074) > 0 or
		HaveLearnRecipe(1075) > 0 or HaveLearnRecipe(1076) > 0) then	-- ¾Å¼¶ÏÂÒÂÅä·½
		AddItem(2, 1, 3049, 1)
		Msg2Player("B¹n nhËn ®­îc 1 h¹ y Phèi Ph­¬ng cÊp 9!")
	end
end;

