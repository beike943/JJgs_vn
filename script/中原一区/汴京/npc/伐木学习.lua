-- =========================================
-- File : ÖÐÔ­Ò»Çø£¬ãê¾©£¬·¥Ä¾Ñ§Ï°.lua
-- Name : ÁõÒ»¸«
-- ID   : 0, 1
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL 	= 1925			-- ÐÂÊÖÈÎÎñ±äÁ¿
TASK49_BEGGING    	= 1933			-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
FORGETMAIN_NUM    	= 1940			-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊý
FORGETOHTER_NUM		= 1941			-- ÒÅÍü¸±¼¼ÄÜ´ÎÊý

strName = "";
strTitle = "";

--*****************************************MAINº¯Êý*******************************************
function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	if random(1,30) == 1 then
		NpcChat(GetTargetNpc(),"Muèn lµm vò khÝ tèt cã linh khÝ, ph¶i dïng nguyªn liÖu tèt!");
	end;
	strName = GetTargetNpcName();
	if (strName=="" or strName==nil) then 
		return 
	end
	strTitle = "<color=green>"..strName.."<color>: ";
	
	-------------------------------------------ÐÂÊÖÈÎÎñ-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
        TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 3) then
        Talk(1, "QUSTION",strTitle.."Ng­u TÞ Tö ph¸i ng­¬i tíi ph¶i kh«ng? Tèt qu¸! Mau gióp ta gi¶i ®¸p th¾c m¾c nµy!")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Muèn häc ®èn c©y ph¶i kh«ng? HiÖn ch­a ph¶i lóc, ta kh«ng thÓ d¹y ng­¬i.", 0)
    	return
    end;
    
	----------------------------------76¼¶ÎäÆ÷Åä·½ÈÎÎñ----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill();
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail);
	local nTaskState_tieshan = GetTask(TASK_COOKING_TIESHAN);
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU);
		
	--Åëâ¿ÏµÌúÉÈ¾«Ä¾ÈÎÎñ
	if nSkillGenre == 1 and nSkillDetail == 7 and nSkillLevel >= 79 then
		--ÉÐÎ´ÓëÁõÒ»¸«¶Ô»°
		if nTaskState_tieshan == 2 then
			cooking_tieshan_005()
			return
		--½»Óè²»Ñ°³£µÄÄ¾Ð¼ºÍ×íÉúÃÎËÀ
		elseif nTaskState_tieshan == 3 then
			cooking_tieshan_006()
			return
		--Î´µ½Óù³ø´¦»Ø¸´ÏûÏ¢
		elseif nTaskState_tieshan == 4 then
			cooking_tieshan_007()
			return
		end
	end
		
	--ÖÆ·ûÏµ³àÎÙÁé·ûÈÎÎñ
	if nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79 then
		--½»ÓèÇýÄ§Áé·û
		if nTaskState_chiwu == 1 and GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) ~= 1 then
			juju_chiwu_003()
			return
		--Î´½«ÆÐÌáÄ¾½»ÓèÔÆÓÎµÀÈË
		elseif nTaskState_chiwu == 2 or GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_01) == 1 and nTaskState_chiwu ~= 3 then
			juju_chiwu_004()
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
	Say(strTitle.."ChiÕn sù diÔn ra liªn miªn nguyªn liÖu gç cung øng kh«ng kÞp ®©y ®­îc xem lµ c¬ héi tèt cho chóng ta lµm giµu, thÝch kh«ng?",
		7,
		"Häc kü n¨ng ®èn c©y/luaLearnLifeSkill",
		"Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level",
		"§i H­ng An lÜnh (s¬ cÊp)/GotoWorld_Confirm1",
		"§i Héi Tiªn lÜnh (trung cÊp)/GotoWorld_Confirm2",
		"§i Th­¬ng Long lÜnh (cao cÊp)/GotoWorld_Confirm3",
		--"ÒÅÍü·¥Ä¾¼¼ÄÜ/forget_life_skill",
		"T×m hiÓu ®èn c©y/Info",
		"Rêi khái/Main_Exit")
end;


-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 1) > 0) then
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
			"Ta ®· quyÕt ®Þnh råi!/forget_now",
			"Khoan ®·! Chê ta suy nghÜ l¹i!/SayHello")
	else
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng ®èn c©y? Ta kh«ng thÓ gióp ng­¬i.", 0)
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
	
	if (GetLifeSkillLevel(0, 1) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 1)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(517, 0)
				Msg2Player("Kü n¨ng ®èn c©y cña b¹n ®· bá")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhÐ!", 0)
		end
	end
end;


-- Ñ§Ï°Éú»î¼¼ÄÜ============================================================================
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."Hõm… Th©n thñ cña ng­¬i cßn kÐm l¾m. H·y ra ngoµi thµnh tu luyÖn ®Õn cÊp 10 h·y ®Õn t×m ta!", 0)
		return
	end

	-- ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ·¥Ä¾
	if (GetLifeSkillLevel(0, 1) > 0) then
        Say (strTitle.."B¹n ®· häc kü n¨ng ®èn c©y!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end

    Say(strTitle.."Ng­¬i muèn häc kü n¨ng <color=yellow>®èn c©y<color> chø?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end

--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (GetLifeSkillLevel(0, 1) > 0) then
		Say (strTitle.."B¹n ®· häc kü n¨ng ®èn c©y!", 0)
	else
		if (LearnLifeSkill(0, 1, 1, 79, 0)) then
			AddItem(0, 200, 14, 1, 1)
        	Msg2Player("B¹n ®· häc kü n¨ng ®èn c©y, nhËn ®­îc ThiÕt phñ.")
    	end
	end
end
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."NghÜ kü råi h·y ®Õn!", 0)
end


-- È·ÈÏÈ¥ÏàÓ¦¹Ò»úµØµã=========================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."Ng­¬i muèn ®Õn<color=yellow>H­ng An LÜnh<color> ®èn c©y kh«ng? N¬i ®ã cã nhiÒu nhiÒu <color=yellow>Tïng méc<color>, <color=yellow>D­¬ng méc<color>, <color=yellow>Sam méc<color> vµ <color=yellow>ThiÕt méc<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(710,1707,3385)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Héi Tiªn LÜnh<color> ®èn c©y kh«ng? N¬i ®ã cã nhiÒu <color=yellow>Ng« §ång<color>, <color=yellow>Trïng Méc<color> vµ <color=yellow>Ch­¬ng méc<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(715,1496,2998)",
		"Kh«ng ®i ®©u/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Th­¬ng Long LÜnh<color> ®èn c©y kh«ng? N¬i ®ã cã nhiÒu <color=yellow>ThiÕt TuyÕn méc<color>, <color=yellow>Ba La méc<color> vµ <color=yellow>§µn méc<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!  ",
		2,
		"Ta muèn ®i/#GotoWorld(720,1705,3350)",
		"Kh«ng ®i ®©u/Main_Exit");
end;
-- È¥ÏàÓ¦µÄ¹Ò»úµØµã
function GotoWorld(MapID, x, y)
		CleanInteractive();
		LeaveTeam();
		SetFightState(0);
		
		NewWorld(MapID,x,y);
end;

-- ½éÉÜÏà¹ØÐÅÏ¢
function Info()
	Say(strTitle.."<color=yellow>§èn c©y<color> lµ mét trong <color=yellow>6<color> kü n¨ng thu thËp. Häc ®­îc kü n¨ng nµy míi nhËn ®­îc nguyªn liÖu <color=yellow>chÕ t¹o vò khÝ<color>. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua c«ng cô ®èn c©y <color=yellow>s¬ cÊp<color> sau ®ã ra ngoµi rõng ®èn c©y. NÕu ®i vµo nh÷ng khu vùc quy ®Þnh cÇn ®Õn <color=yellow>Ngù c¸c<color> mua <color=yellow>ThÇn N«ng §¬n<color>.", 0);
end;

-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êý
function Main_Exit()
end;

--******************************************ÐÂÊÖÈÎÎñ²¿·Ö*****************************************
function QUSTION()
		Say(strTitle.."C©u hái 1: Sö dông kü n¨ng thu thËp b»ng c¸ch nµo?",4,
		"1. Më giao diÖn sö dông kü n¨ng./QUS_ERROR",
		"2. T¹i ®iÓm thu thËp më giao diÖn kü n¨ng/QUS_ERROR",
		"3. Cã c«ng cô t­¬ng øng, t¹i ®iÓm thu thËp më giao diÖn kü n¨ng hoÆc dïng phÝm t¾t thu thËp bªn d­íi/QUS2_GOTO",
		"4. Xem nh­ ta ch­a ®Õn qua!/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."C©u hái 2: Kü n¨ng nµo sau ®©y ®­îc xem thu thËp?",4,
		"1. H¸i thuèc, Thuéc da, ChÕ t¹o binh khÝ dµi, NÊu n­íng, LuyÖn bïa, §èn c©y, Canh t¸c/QUS_ERROR",
		"2. §èn c©y, §µo kho¸ng, Canh t¸c, Thuéc da, H¸i thuèc, KÐo t¬/QUS3_GOTO",
		"3. ChÕ t¹o binh khÝ dµi, luyÖn bïa, chÕ t¹o Kú m«n binh khÝ, chÕ t¹o binh khÝ ng¾n, nÊu n­íng, chÕ d­îc, chÕ t¹o Hé gi¸p/QUS_ERROR",
		"4. ChÕ t¹o Kú m«n binh khÝ, chÕ t¹o binh khÝ ng¾n, nÊu n­íng, chÕ d­îc, Thuéc da, H¸i thuèc, KÐo t¬/QUS_ERROR")
end
function QUS3_GOTO()
		Say(strTitle.."C©u hái 3: Muèn cã nguyªn liÖu lµm ®Çu bÕp th× nªn lµm g×?",4,
		"1. Thuéc da/QUS_ERROR",
		"2. Canh t¸c/QUS4_GOTO",
		"3. H¸i thuèc/QUS_ERROR",
		"4. §èn c©y/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."C©u hái 4: ®èn c©y cÇn ®em theo g×?",4,
		"1. Håi thµnh phï/QUS_ERROR",
		"2. Håi huyÕt ®¬n/QUS_ERROR",
		"3. T¸n gÉu/QUS_ERROR",
		"4. ThiÕt phñ/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."C©u hái 5: Ta muèn ®èn mét Ýt gç, thö nãi xem ta ®èn trong bao l©u?",4,
		"1. 6 giê/QUS_ERROR",
		"2. 8 giê/QUS_ERROR",
		"3. 10 giê/QUS_ERROR",
		"4. Cã thÓ thu thËp thêi gian l©u h¬n/QUS_PASS")
end

function QUS_PASS()
		Say(strTitle.."Giái qu¸! §· hiÓu c¬ b¶n vÒ kü n¨ng sèng råi ®ã! Giê cã thÓ t×m c¸c s­ phô häc kü n¨ng kh¸c.",0)
		SetTask(ID_LEARNLIFESKILL,15)
		TaskTip("B¹n cã thÓ ®Õn gÆp c¸c NPC häc kü n¨ng sèng")
end

function QUS_ERROR()
		Say(strTitle.."Ng­¬i ch­a hiÓu l¾m th× ph¶i! VÒ t×m <color=yellow>V©n Du ®¹o nh©n<color> thö xem!",0)
end

function update_max_skill_level()
	Say(strTitle..format("Më réng cÊp kü n¨ng s¶n xuÊt cÇn kü n¨ng thu thËp ®¹t cÊp 79 ®ång thêi tiªu hao %d Vµng", 1000), 
		2, "§ång ý/update_max_skill_level_ensure", "T¹i h¹ chØ xem qua th«i/Main_Exit")
end

function update_max_skill_level_ensure()
	local nGen = 0;
	local nSkillId = 1;
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