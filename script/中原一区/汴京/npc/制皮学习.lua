-- =========================================
-- File : ÖĞÔ­Ò»Çø£¬ãê¾©£¬ÖÆÆ¤Ñ§Ï°.lua
-- Name : ÕÅÁÔ»§
-- ID   : 0, 2
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEVELTASKID49			= 518		-- »¨Áı°ÙÄñÈ¹
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

	
 ------------------------------------------ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ-------------------------
 	local nGene, nSKIllId = GetMainLifeSkill()
 	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nSKIllId <= 8 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId)
		return
	end
	
---------------------------------------------Ö÷¶Ô»°-------------------------------------------
	Say(strTitle.."NghÒ nµy cÇn giao tiÕp víi mu«n thó, sèng giã tuy lín nh­ng phÇn th­ëng b¸o ®¸p còng kh«ng nhá. Muèn häc thuéc da kh«ng?",
		7,
		"Häc kü n¨ng thuéc da/luaLearnLifeSkill",
		"Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level",
		"§Õn Kh«ng Tang s¬n (s¬ cÊp)/GotoWorld_Confirm1",
		"§Õn C«n Ng« s¬n (trung cÊp)/GotoWorld_Confirm2",
		"§Õn Tö Tang s¬n (cao cÊp)/GotoWorld_Confirm3",
		--"ÒÅÍüÖÆÆ¤¼¼ÄÜ/forget_life_skill",
		"T×m hiÓu thuéc da/Info",
		"Rêi khái/Main_Exit")
end;



-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 2) > 0) then
		local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ¸¨¼¼ÄÜ
		local nShouldPay = 5000
		if (nForgetTimes == 0) then
			nShouldPay = 5
		elseif (nForgetTimes == 1) then
			nShouldPay = 50
		elseif (nForgetTimes == 2) then
			nShouldPay = 500
		end
	
		Say(strTitle.."§©y lµ lÇn thø "..(nForgetTimes + 1)..", ng­¬i hñy kü n¨ng thu thËp, ta ph¶i thu"..nShouldPay.." l­îng, ng­¬i suy nghÜ kü ch­a?",
			2,
			"Ta ®· quyÕt ®Şnh råi!/forget_now",
			"Khoan ®·! Chê ta suy nghÜ l¹i!/SayHello")
	else
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng thuéc da, ta kh«ng thÓ gióp ng­¬i!", 0)
	end
end;
function forget_now()
	local nForgetTimes = GetTask(FORGETOHTER_NUM)	-- ¸¨¼¼ÄÜ
	local nShouldPay = 5000
	if (nForgetTimes == 0) then
		nShouldPay = 5
	elseif (nForgetTimes == 1) then
		nShouldPay = 50
	elseif (nForgetTimes == 2) then
		nShouldPay = 500
	end
	local nShouldPayMoney = nShouldPay * 100
	
	if (GetLifeSkillLevel(0, 2) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 2)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("B¹n ®· bá kü n¨ng thuéc da")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;



--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
-- Ñ§Ï°Éú»î¼¼ÄÜ
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."Hõm… Th©n thñ cña ng­¬i cßn kĞm l¾m. H·y ra ngoµi thµnh tu luyÖn ®Õn cÊp 10 h·y ®Õn t×m ta!", 0)
		return
	end

	-- ÅĞ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ÖÆÆ¤
	if (GetLifeSkillLevel(0, 2) > 0) then
        Say (strTitle.."Ng­¬i häc ®­îc kü n¨ng thuéc da!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end

	Say(strTitle.."B»ng h÷u muèn häc kü n¨ng <color=yellow>thuéc da<color> chø?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end;
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (GetLifeSkillLevel(0, 2) > 0) then
		Say (strTitle.."B¹n häc ®­îc kü n¨ng thuéc da!", 0)
	else
		if (LearnLifeSkill(0, 2, 1, 79, 0)) then
			AddItem(0, 200, 12, 1, 1)
        	Msg2Player("B¹n häc ®­îc kü n¨ng thuéc da, nhËn ®­îc ChÕ B× ®ao.")
    	end
	end
end
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."H·y suy nghÜ kü råi quay l¹i ®©y nhĞ!",0)
end



-- È¥ÏàÓ¦¹Ò»úµØµã
function GotoWorld_Confirm1()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Kh«ng Tang S¬n<color> thuéc da kh«ng? N¬i ®ã cã nhiÒu nhiÒu <color=yellow>Sãi<color>, <color=yellow>Hæ<color>, <color=yellow>R¾n<color> vµ <color=yellow>C¸o<color>, ng­¬i nªn sö dông <color=yellow>ThÇn N«ng §¬n<color> míi cã thÓ thuéc da.",
		2,
		"Ta muèn ®i/#GotoWorld(712,1472,2918)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>C«n Ng« S¬n<color> thuéc da kh«ng? N¬i ®ã cã nhiÒu nhiÒu <color=yellow>B¹ch hæ<color>, <color=yellow>GÊu<color> vµ <color=yellow>Loan §iÓu<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(717,1736,2906)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng­¬i muèn ®i <color=yellow>Tö Tang s¬n<color> thuéc da ph¶i kh«ng? ë ®ã cã rÊt nhiÒu <color=yellow>s­ tö<color>, <color=yellow>Chu T­íc<color> vµ <color=yellow>Linh Ngao<color> xuÊt hiÖn, nhí kü ng­¬i ph¶i sö dông <color=yellow>ThÇn N«ng ®¬n<color> míi cã thÓ thuéc da.",
		2,
		"Ta muèn ®i/#GotoWorld(722,1748,3420)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
-- È¥ÏàÓ¦µÄ¹Ò»úµØµã
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;



-- ½éÉÜÏà¹ØĞÅÏ¢
function Info()
	Say(strTitle.."<color=yellow>Thuéc da<color> lµ mét trong <color=yellow>6<color> kü n¨ng thu thËp. Häc ®­îc kü n¨ng nµy míi cã ®­îc nguyªn liÖu <color=yellow>chÕ y<color>. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua c«ng cô thuéc da <color=yellow>s¬ cÊp<color> sau ®ã ra ngoµi ®¸nh thó. Muèn vµo c¸c khu vùc quy ®Şnh cÇn ®Õn <color=yellow>Ngù c¸c<color> mua <color=yellow>ThÇn N«ng §¬n<color>.", 0)
end;
-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function Main_Exit()
end;

function update_max_skill_level()
	Say(strTitle..format("Më réng cÊp kü n¨ng s¶n xuÊt cÇn kü n¨ng thu thËp ®¹t cÊp 79 ®ång thêi tiªu hao %d Vµng", 1000), 
		2, "§ång ı/update_max_skill_level_ensure", "T¹i h¹ chØ xem qua th«i/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 2;
	local nMaxLevel = GetLifeSkillMaxLevel(nGen, nSkillId);
	if nMaxLevel > 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng thu thËp ®· ®¹t giíi h¹n cÊp %d", nMaxLevel))
		return 0;
	end
	if GetLifeSkillLevel(nGen, nSkillId) < 79 then
		Talk(1,"",format("HiÖn t¹i cÊp kü n¨ng thu thËp ch­a ®¹t cÊp %d, kh«ng thÓ më réng cÊp giíi h¹n kü n¨ng", 79));
		return 0;
	end
	if Pay(1000 * 10000) ~= 1 then
		Say(strTitle..format("Ng©n l­îng kh«ng ®ñ %d vµng", 1000), 0);
		return 0;
	end
	SetLifeSkillMaxLevel(nGen, nSkillId, 99);
	Msg2Player("Chóc mõng cÊp giíi h¹n kü n¨ng thu thËp ®· ®¹t cÊp 99");
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0);
end
