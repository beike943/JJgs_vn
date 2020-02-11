-- =========================================
-- File : ÖÐÔ­Ò»Çø£¬ãê¾©£¬²ÉÒ©Ñ§Ï°.lua
-- Name : ÁÖÒ©Ê¦
-- ID   : 0, 4
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL	= 1925		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEVELTASKID49		= 516		-- »ØÁú×ª·ï¸þ
TASK49_BEGGING		= 1933		-- 49¼¶½ú¼¶ÈÎÎñ¿ªÊ¼±êÊ¾
FORGETMAIN_NUM		= 1940		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊý
FORGETOHTER_NUM		= 1941		-- ÒÅÍüÖ÷¼¼ÄÜ´ÎÊý

strName = "";
strTitle = "";

--*****************************************MAINº¯Êý*****************************************
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
	
	-----------------------------------------ÐÂÊÖÈÎÎñ-----------------------------------------
    if (GetTask(ID_LEARNLIFESKILL) < 15) then
        Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
        TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")       
        return 
    end
    
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	local nGene,nSKIllId = GetMainLifeSkill()
	local nMainLevel = GetLifeSkillLevel(nGene, nSKIllId)
	if (nGene == 1 and nMainLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then 
		weapon_76_recipe_tip(nSKIllId);
		return
	end	

---------------------------------------------Ö÷¶Ô»°-------------------------------------------
    Say(strTitle.."N¨m nay chiÕn lo¹n liªn miªn, giang hå hiÓm ¸c. BiÕt chót y thuËt cã thÓ tù lo cho m×nh vµ gióp ®ì ng­êi kh¸c! ThËt lµ nhÊt cö l­ìng tiÖn!",
		6,
		"Häc kü n¨ng h¸i thuèc./luaLearnLifeSkill",
		"§Õn Nam Hße cèc (s¬ cÊp)/GotoWorld_Confirm1",
		"§Õn Hµm U cèc (trung cÊp)/GotoWorld_Confirm2",
		"§Õn Hiªn Viªn cèc (cao cÊp)/GotoWorld_Confirm3",
		--"ÒÅÍü²ÉÒ©¼¼ÄÜ/forget_life_skill",
		"Ta muèn t×m hiÓu tin tøc vÒ h¸i thuèc./Info",
		"Rêi khái/Main_Exit");
end;

-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 4) > 0) then
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
		Say(strTitle.."Ng­¬i ch­a häc kü n¨ng h¸i thuèc, ta kh«ng thÓ gióp ng­¬i!", 0)
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
	
	if (GetLifeSkillLevel(0, 4) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 4)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("Ng­¬i ®· hñy kü n¨ng h¸i thuèc.")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhÐ!", 0)
		end
	end
end;



--**********************************************¼¼ÄÜÑ§Ï°²¿·Ö***************************************
-- Ñ§Ï°Éú»î¼¼ÄÜ
function luaLearnLifeSkill()
    if (GetLevel() < 10) then
        Say (strTitle.."Hõm… Th©n thñ cña ng­¬i cßn kÐm l¾m. H·y ra ngoµi thµnh tu luyÖn ®Õn cÊp 10 h·y ®Õn t×m ta!", 0)
		return
	end

	-- ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ²ÉÒ©
	if (GetLifeSkillLevel(0, 4) > 0) then
        Say (strTitle.."B¹n trÎ! Ng­¬i ®· häc ®­îc tÊt c¶ kü n¨ng h¸i thuèc!", 0)
		return
	end

	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end
	
	Say(strTitle.."<color=yellow>H¸i thuèc<color> sÏ lµ kü n¨ng thu thËp míi cña ng­¬i! Ng­¬i cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end;
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (GetLifeSkillLevel(0, 4) > 0) then
		Say (strTitle.."Ng­¬i ®· häc ®­îc tÊt c¶ kü n¨ng h¸i thuèc!", 0)
	else
		if (LearnLifeSkill(0, 4, 1, 79, 0)) then
			AddItem(0, 200, 16, 1, 1)
        	Msg2Player("B¹n häc ®­îc kü n¨ng thu thËp: H¸i thuèc vµ nhËn ®­îc cuèc thuèc.")
    	end
	end
end;
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."NghÜ kü råi h·y ®Õn!", 0)
end;



-- È·ÈÏÈ¥ÏàÓ¦¹Ò»úµØµã=====================================================================
function GotoWorld_Confirm1()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Nam Hße cèc<color> h¸i thuèc kh«ng? N¬i ®ã cã nhiÒu <color=yellow>Ba ®Ëu<color>, <color=yellow>Tµng Hång Hoa<color>, <color=yellow>C¸t C¸nh<color> vµ <color=yellow>Hoµng liªn<color>. Nhí mang theo <color=yellow>Cuèc thuèc<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(714, 1511, 3004)",
		"Kh«ng ®i ®©u/Main_Exit");
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Hµm U cèc<color> h¸i thuèc kh«ng? N¬i ®ã cã nhiÒu <color=yellow>X¸c ve<color>, <color=yellow>§iÒn thÊt<color> vµ <color=yellow>Xuyªn s¬n gi¸p<color>. Nhí mang theo <color=yellow>Cuèc thuèc<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(719, 1708, 3396)",
		"Kh«ng ®i ®©u/Main_Exit");
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Hiªn Viªn cèc<color> h¸i thuèc kh«ng? N¬i ®ã cã nhiÒu <color=yellow>X¹ h­¬ng<color>, <color=yellow>gan gÊu<color> vµ <color=yellow>Nh©n s©m<color>. Nhí lÊy <color=yellow>cuèc thuèc<color> míi cã thÓ h¸i thuèc!",	2,
		"Ta muèn ®i/#GotoWorld(724, 1721, 3386)",
		"Kh«ng ®i ®©u/Main_Exit");
end;
-- È¥ÏàÓ¦µÄ¹Ò»úµØµã
function GotoWorld(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
				
		NewWorld(MapID,x,y)
end;


-- ½éÉÜÏà¹ØÐÅÏ¢
function Info()
	Say(strTitle.."<color=yellow>H¸i thuèc<color> lµ mét trong <color=yellow>6<color> kü n¨ng thu thËp trong hÖ thèng kü n¨ng sèng. Häc ®­îc kü n¨ng nµy cã thÓ nhËn ®­îc vËt liÖu <color=yellow>luyÖn ®¬n<color>. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua c«ng cô h¸i thuèc <color=yellow>s¬ cÊp<color> ®Ó lªn nói t×m thuèc!", 0);
end;

-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êý
function Main_Exit()
end;

