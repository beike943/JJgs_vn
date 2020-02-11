-- =========================================
-- File : ÖĞÔ­¶şÇø£¬³É¶¼£¬ÊÕ¸ûÑ§Ï°.lua
-- Name : Àî·áÊÕ
-- ID   : 0, 3
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- ĞÂÊÖÈÎÎñ±äÁ¿
TASK49_BEGGING			= 1933		-- ½ú¼¶ÈÎÎñ¿ªÊ¼
FORGETMAIN_NUM			= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
FORGETOHTER_NUM			= 1941		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊı
strName = "";
strTitle = "";

--*****************************************MAINº¯Êı*******************************************
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
	
	-------------------------------------------ĞÂÊÖÈÎÎñ-----------------------------------------
	if (GetTask(ID_LEARNLIFESKILL) < 1) then
        Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
        TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) == 1) then
        Talk(1, "QUSTION",strTitle.."Ng­¬i ®· ®Õn råi, kh¶o nghiÖm th«i")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Muèn häc kü n¨ng canh t¸c µ? Ch­a ®Õn lóc d¹y cho ng­¬i ®©u!", 0)
    	return
    end
    
	----------------------------ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ--------------------------
	local nGene, nSkillID = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nGene, nSkillID)
	if (nGene == 1 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSkillID)
		return
	end
	
	---------------------------------------------Ö÷¶Ô»°------------------------------------------
	Say(strTitle.."GÇn ®©y hoµng th­îng ban th¸nh chØ, muèn gia t¨ng ph¸t triÓn canh t¸c! Sao? Ng­¬i cã muèn tham gia ®¹i qu©n canh n«ng?",
		6,
		"Häc kü n¨ng canh t¸c/luaLearnLifeSkill",
		"§Õn Thanh Thñy th«n (s¬ cÊp)/GotoWorld_Confirm1",
		"§Õn Doanh D©n th«n (trung cÊp)/GotoWorld_Confirm2",
		"§Õn Lam Nh¹c th«n (cao cÊp)/GotoWorld_Confirm3",
		--"ÒÅÍüÊÕ¸û¼¼ÄÜ/forget_life_skill",
		"Ta muèn t×m hiÓu th«ng tin canh t¸c/Info",
       	"Rêi khái/Main_Exit"
		);

end;


-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 3) > 0) then
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
		Say(strTitle.."Ng­¬i kh«ng häc kü n¨ng canh t¸c sao? Ta kh«ng thÓ gióp g× cho ng­¬i!", 0)
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
	
	if (GetLifeSkillLevel(0, 3) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 3)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(516, 0)
				Msg2Player("Kü n¨ng canh t¸c cña ng­¬i ®· bŞ hñy bá.")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhĞ!", 0)
		end
	end
end;


-- -------------------------------Ñ§Ï°Éú»î¼¼ÄÜ-------------------------------
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."Hõm… Th©n thñ cña ng­¬i cßn kĞm l¾m. H·y ra ngoµi thµnh tu luyÖn ®Õn cÊp 10 h·y ®Õn t×m ta!", 0)
		return
	end

	-- ÅĞ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ÊÕ¸û
	if (GetLifeSkillLevel(0, 3) > 0) then
        Say (strTitle.."B¹n trÎ! Ng­¬i ®· häc ®­îc tÊt c¶ kü n¨ng canh t¸c!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end

    Say(strTitle.."<color=yellow>Canh t¸c<color> sÏ lµ kü n¨ng thu thËp míi cña b¹n. B¹n cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end;
--Ñ§Ï°¼¼ÄÜ
function LearnYes(MaxLvl,nMain)
	if (GetLifeSkillLevel(0, 3) > 0) then
		Say (strTitle.."B¹n ®· häc tÊt c¶ kü n¨ng Canh t¸c!", 0)
	else
		if (LearnLifeSkill(0, 3, 1, 79, 0)) then
			AddItem(0, 200, 13, 1, 1)
        	Msg2Player("B¹n ®· häc ®­îc kü n¨ng thu thËp: Canh t¸c. NhËn ®­îc Cuèc")
    	end
	end
end;
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."NghÜ kü råi h·y ®Õn!",0)
end



-- È·ÈÏÈ¥ÏàÓ¦¹Ò»úµØµã
function GotoWorld_Confirm1()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Thanh Thñy th«n<color> canh t¸c kh«ng? N¬i ®ã cã nhiÒu <color=yellow>Quang Th«ng Ma<color>, <color=yellow>Méc nhÜ<color>, <color=yellow>Khuynh Ly ®Ëu<color>, <color=yellow>NÊm ®¸<color>, <color=yellow>NhiÔu minh ®Ëu<color>, <color=yellow>M¨ng tróc<color>, <color=yellow>Dung tr¹ch cèc<color> vµ <color=yellow>Hå tiªu<color>. Nhí mang theo <color=yellow>Cuèc<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(713,1477,2948)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Doanh D©n th«n<color> canh t¸c kh«ng? N¬i ®ã cã nhiÒu <color=yellow>Mİa<color>, <color=yellow>Diªn Tinh M¹ch<color> vµ <color=yellow>ThuÇn hßa m¹ch<color>. Nhí mang theo <color=yellow>Cuèc<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(718,1708,3405)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Lam Nh¹c th«n<color> canh t¸c kh«ng? N¬i ®ã cã nhiÒu <color=yellow>Du long tóc<color>, <color=yellow>Phông Qu¸n Tóc<color> vµ <color=yellow>Dao Chi Tóc<color>. Nhí mang theo <color=yellow>Cuèc<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(723,1700,3448)",
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
	Say(strTitle.."<color=yellow>Canh t¸c<color> lµ mét trong <color=yellow>6<color> kü n¨ng thu thËp trong hÖ thèng kü n¨ng sèng. Häc ®­îc kü n¨ng nµy cã thÓ nhËn ®­îc vËt liÖu <color=yellow>chÕ biÕn<color>. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua c«ng cô canh t¸c <color=yellow>s¬ cÊp<color> ®Ó ra ®ång lµm rÉy canh t¸c!", 0)
end;
-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function Main_Exit()
end;


--******************************************ĞÂÊÖÈÎÎñ²¿·Ö*****************************************
--ĞÂÊÖÈÎÎñÎÊÌâº¯Êı
function QUSTION()
		Say(strTitle.."C©u hái thø 1: Kh¶o nghiÖm n¾m b¾t vµ thuyÕt minh sö dông kü n¨ng s¶n xuÊt?",4,
		"1. Më giao diÖn sö dông kü n¨ng./QUS_ERROR",
		"2. Häc xong c¸ch phèi chÕ míi më giao diÖn sö dông kü n¨ng./QUS_ERROR",
		"3. Häc ®­îc c¸ch ghĞp, tËp hîp ®ñ vËt liÖu cÇn thiÕt, sau ®ã më giao diÖn sö dông kü n¨ng./QUS2_GOTO",
		"4. Ng­¬i ®ang xem th­êng trİ tuÖ cña ta µ?/QUS_ERROR")
end
function QUS2_GOTO()
		Say(strTitle.."C©u hái thø 2: Lo¹i nµo d­íi ®©y lµ kü n¨ng s¶n xuÊt?",4,
		"1. H¸i thuèc, Thuéc da, ChÕ t¹o binh khİ dµi, NÊu n­íng, LuyÖn bïa, §èn c©y, Canh t¸c/QUS_ERROR",
		"2. §èn c©y, §µo kho¸ng, Canh t¸c, Thuéc da, H¸i thuèc, KĞo t¬/QUS_ERROR",
		"3. ChÕ t¹o binh khİ dµi, luyÖn bïa, chÕ t¹o Kú m«n binh khİ, chÕ t¹o binh khİ ng¾n, nÊu n­íng, chÕ d­îc, chÕ t¹o Hé gi¸p/QUS3_GOTO",
		"4. ChÕ t¹o Kú m«n binh khİ, chÕ t¹o binh khİ ng¾n, nÊu n­íng, chÕ d­îc, Thuéc da, H¸i thuèc, KĞo t¬/QUS_ERROR")
end

function QUS3_GOTO()
		Say(strTitle.."C©u hái thø 3: Së tr­êng cña L­u NhÊt Phñ b»ng h÷u ta lµ ®èn c©y, vËy vËt liÖu h¾n lÊy ®­îc dïng lµm g×?",4,
		"1. ChÕ t¹o binh khİ dµi vµ Hé gi¸p/QUS_ERROR",
		"2. NÊu n­íng vµ ChÕ t¹o kú m«n binh khİ/QUS_ERROR",
		"3. ChÕ t¹o kú m«n binh khİ vµ binh khİ ng¾n/QUS4_GOTO",
		"4. ChÕ t¹o hé gi¸p vµ luyÖn bïa/QUS_ERROR")
end
function QUS4_GOTO()
		Say(strTitle.."VÊn ®Ò thø 4: Ta muèn häc chÕ phï, vËy xin hái cÇn ph¶i häc nh÷ng kü n¨ng nµo?",4,
		"1. ChÕ t¹o hé gi¸p/QUS_ERROR",
		"2. ChÕ d­îc/QUS_ERROR",
		"3. NÊu n­íng/QUS_ERROR",
		"4. TËp Linh/QUS5_GOTO")
end
function QUS5_GOTO()
		Say(strTitle.."C©u hái thø 5: Trong qu¸ tr×nh chÕ t¹o vò khİ cã thÓ thªm vµo c¸c vËt liÖu lµm m¹nh thªm tİnh n¨ng cña vò khİ. Xin hái cã thÓ thªm vµo tèi ®a bao nhiªu lo¹i vËt liÖu?",4,
		"1. 6 lo¹i/QUS_ERROR",
		"2. 8 lo¹i/QUS_ERROR",
		"3. 10 lo¹i/QUS_PASS",
		"4. 12 lo¹i/QUS_ERROR")
end
function QUS_PASS()
		Say(strTitle.."B»ng h÷u qu¶ nhiªn phi phµm. TiÕp theo, h·y ®Õn <color=yellow>BiÖn Kinh<color> t×m <color=yellow>V©n Du ®¹o nh©n<color> cã vµi vÊn ®Ò muèn thØnh gi¸o!",0)
		SetTask(ID_LEARNLIFESKILL,2)
		TaskTip("T×m V©n Du ®¹o nh©n ë BiÖn Kinh")
end
function QUS_ERROR()
		Say(strTitle.."Xem ra ng­¬i ch­a hiÓu g× vÒ kü n¨ng s¶n xuÊt. H·y ®Õn thØnh gi¸o <color=yellow>Du Ph­¬ng ®¹i phu<color> ®i!",0)
end

