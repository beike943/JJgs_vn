-- =========================================
-- File : ÖĞÔ­¶şÇø£¬³É¶¼£¬³éË¿Ñ§Ï°.lua
-- Name : »Æ´óÉô
-- ID   : 0, 6
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- ĞÂÊÖÈÎÎñ±êÊ¾£¨±¾½Å±¾ÖĞ²»¸Ä¸ÃÖµ£©
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
	if random(1,30) == 1 then
		NpcChat(GetTargetNpc(),"Muèn lµm c«ng cô phßng vÖ cã linh khİ, nhÊt ®Şnh ph¶i dïng t¬ tèt míi ®­îc!");
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
    

 ----------------------------------76¼¶ÎäÆ÷Åä·½É½Ê¨¾«Æ¤ÈÎÎñ----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_shanshi = GetTask(TASK_WEAVE_SHANSHI)
		
	if (nSkillGenre == 1 and nSkillDetail == 5 and nSkillLevel >= 79) then
		--Óë»Æ´óÉô¶Ô»°
		if (nTaskState_shanshi == 4) then
			weave_shanshi_009()
			return
		--Î´»ØÈ¥»Ø¸´½õÄï
		elseif (nTaskState_shanshi == 5) then
			weave_shanshi_010()
			return
		end
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillDetail);
		return
	end		

---------------------------------------------Ö÷¶Ô»°-------------------------------------------
	Say(strTitle.."T×m ®­îc Thiªn Tµm Ti lµ lı t­ëng duy nhÊt cña cuéc ®êi ta, ®¸ng tiªc ta ®· giµ råi kh«ng thÓ trÌo ®Ìo v­ît suèi, chØ cã thÓ göi g¾m tr¸ch nhiÖm nµy cho bän trÎ c¸c ng­¬i, muèn häc c¸ch kĞo t¬ kh«ng?",
		7,
		"§ång ı/luaLearnLifeSkill",
		"Muèn häc kü n¨ng cao cÊp h¬n/update_max_skill_level",
		"§Õn Kh«ng Tang s¬n (s¬ cÊp)/GotoWorld_Confirm1",
		"§Õn C«n Ng« s¬n (trung cÊp)/GotoWorld_Confirm2",
		"§Õn Tö Tang s¬n (cao cÊp)/GotoWorld_Confirm3",
		--"ÒÅÍü³éË¿¼¼ÄÜ/forget_life_skill",
		"T×m hiÓu kĞo t¬/Info",
    	"Rêi khái/Main_Exit")
end;


-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 6) > 0) then
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
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng kĞo t¬? Ta kh«ng thÓ gióp ng­¬i!", 0)
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
	
	if (GetLifeSkillLevel(0, 6) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 6)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("Kü n¨ng kĞo t¬ cña ng­¬i ®· hñy")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;



------------------------------------------ Ñ§Ï°Éú»î¼¼ÄÜ--------------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."Hõm… Th©n thñ cña ng­¬i cßn kĞm l¾m. H·y ra ngoµi thµnh tu luyÖn ®Õn cÊp 10 h·y ®Õn t×m ta!", 0)
		return
	end

	-- ÅĞ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ³éË¿
	if (GetLifeSkillLevel(0, 6) > 0) then
        Say (strTitle.."B¹n trÎ! Ng­¬i ®· häc xong kü n¨ng kĞo t¬!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end

	Say(strTitle.."Ng­¬i muèn häc kü n¨ng <color=yellow>kĞo t¬<color>?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end;
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (GetLifeSkillLevel(0, 6) > 0) then
		Say (strTitle.."B¹n ®· häc kü n¨ng kĞo t¬!", 0)
	else
		if (LearnLifeSkill(0, 6, 1, 79, 0)) then
			AddItem(0, 200, 15, 1, 1)
        	Msg2Player("B¹n ®· häc kü n¨ng KĞo t¬ vµ nhËn ®­îc 1 Con thoi")
    	end
	end
end
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."NghÜ kü råi h·y ®Õn!", 0)
end


---------------------------------- È·ÈÏÈ¥ÏàÓ¦¹Ò»úµØµã----------------------------------------
function GotoWorld_Confirm1()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Kh«ng Tang S¬n<color> kĞo t¬ ­? N¬i ®ã cã nhiÒu <color=yellow>Thá <color>, <color=yellow>T»m<color>, <color=yellow>Ngò s¾c trïng<color> vµ <color=yellow>Lang Chu<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(712,1472,2918)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>C«n Ng« S¬n<color> kĞo t¬ ­? N¬i ®ã cã nhiÒu <color=yellow>HuyÕt tµm<color>, <color=yellow>Linh Chu<color> vµ <color=yellow>Kim t¬<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(717,1736,2906)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."B©y giê ng­¬i muèn ®Õn <color=yellow>Tö Tang s¬n<color> kĞo t¬ µ? ë ®ã cã rÊt nhiÒu <color=yellow>L·nh Trïng<color>, <color=yellow>Thiªn Tµm<color> vµ <color=yellow>ThÓ V©n<color>, ng­¬i ph¶i dïng <color=yellow>ThÇn N«ng ®¬n<color> míi cã thÓ kĞo t¬.",
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
	Say(strTitle.."<color=yellow>KĞo t¬<color> lµ mét trong <color=yellow>6<color> kü n¨ng thu thËp cña hÖ thèng kü n¨ng sèng, sau khi häc kü n¨ng nµy nhËn ®­îc nguyªn liÖu <color=yellow>chÕ ¸o<color>. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua dông cô thuéc da <color=yellow>s¬ cÊp<color> sau ®ã b¾t ®Çu kĞo t¬. NÕu muèn lªn nói kĞo t¬ ph¶i vµo <color=yellow>Ngù c¸c<color> mua <color=yellow>ThÇn N«ng §¬n<color> sö dông míi ®­îc.", 0)
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
	local nSkillId = 6;
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

