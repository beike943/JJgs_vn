-- =========================================
-- File : ÖĞÔ­¶şÇø£¬³É¶¼£¬ÍÚ¿óÑ§Ï°.lua
-- Name : ´ú¿ó¹¤
-- ID   : 0, 5
-- =========================================
Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

--*****************************************¶¨Òå³£Á¿¼°Ô¤´¦Àí***************************************
ID_LEARNLIFESKILL		= 1925		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LEVELTASKID49			= 517		-- ÍÌÁú±¦µ¶ÈÎÎñ
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
    
    
	----------------------------------76¼¶ÎäÆ÷Åä·½ÈÎÎñ----------------------------------
	local nSkillGenre, nSkillDetail = GetMainLifeSkill()
	local nSkillLevel = GetLifeSkillLevel(nSkillGenre, nSkillDetail)
	local nTaskState_heiwu = GetTask(TASK_MEDICINE_HEIWU)
	local nTaskState_chiwu = GetTask(TASK_JUJU_CHIWU)
	
	--ÖÆÒ©ÏµºÚÎÙ¾«Ê¯Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail == 6 and nSkillLevel >= 79) then
		--½»ÓèºÚÉ«·ÛÄ©
		if (nTaskState_heiwu == 2) then
			medicine_heiwu_005()
			return
		--Î´È¥ÕÒÄª´ó
		elseif (nTaskState_heiwu == 3) then
			medicine_heiwu_006()
			return
		--Î´½«ĞşÊ¯½»ÓèÓÎ·½Ò½Éú
		elseif (nTaskState_heiwu == 4) then
			medicine_heiwu_007()
			return
		end
	end
	
	--ÖÆ·ûÏµ³àÎÙÁé·ûÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail == 8 and nSkillLevel >= 79) then
		--½»ÓèÇıÄ§Áé·û
		if (nTaskState_chiwu == 1 and 
			GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) ~= 1) then
			juju_chiwu_005()
			return
		--Î´½«ºÚÎÙÊ¯½»ÓèÔÆÓÎµÀÈË
		elseif (nTaskState_chiwu == 2 or 
				GetBit(GetTask(TASK_JUJU_TALK),TASK_JUJU_TALK_02) == 1 and 
				nTaskState_chiwu ~= 3) then
			juju_chiwu_006()
			return
		end
	end
		
	--ÌáÊ¾Íæ¼Ò76¼¶ÎäÆ÷Åä·½ÈÎÎñ
	if (nSkillGenre == 1 and nSkillDetail <= 8 and nSkillLevel >= 79 and 
		GetTask(1600) == 0 and GetTask(1602) == 0 and 
		GetTask(1603) == 0 and GetTask(1604) == 0 and 
		GetTask(1605) == 0) then
		weapon_76_recipe_tip(nSkillDetail)
		return
	end	
	
---------------------------------------------Ö÷¶Ô»°-------------------------------------------
	Say(strTitle.."B¹n trÎ! ThÊy ng­¬i th©n thÓ tr¸ng kiÖn, tiÒn ph­¬ng ®ang cÇn nhiÒu binh khİ, hay lµ h·y theo ta cïng hîp søc b¸o quèc!",
		7,
		"Häc kü n¨ng ®µo kho¸ng/luaLearnLifeSkill",
		"Muèn häckü n¨ng cao cÊp h¬n/update_max_skill_level",
		"§Õn Th¹ch M«n ®éng (s¬ cÊp)/GotoWorld_Confirm1",
		"§Õn Linh Nham ®éng (trung cÊp)/GotoWorld_Confirm2",
		"§Õn HuyÒn Tinh ®éng (cao cÊp)/GotoWorld_Confirm3",
		--"ÒÅÍüÍÚ¿ó¼¼ÄÜ/forget_life_skill",
		"Ta muèn t×m hiÓu th«ng tin liªn quan ®µo kho¸ng/Info",
    	"Rêi khái/Main_Exit")
end;



-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 5) > 0) then
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
		Say(strTitle.."Ng­¬i ®· häc kü n¨ng ®µo kho¸ng? Ta kh«ng thÓ gióp ng­¬i.", 0)
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
	
	if (GetLifeSkillLevel(0, 5) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 5)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				SetTask(LEVELTASKID49, 0)
				Msg2Player("Kü n¨ng ®µo kho¸ng cña b¹n ®· hñy")				
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

	-- ÅĞ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ÍÚ¿ó
	if (GetLifeSkillLevel(0, 5) > 0) then
        Say (strTitle.."B¹n trÎ! Ng­¬i ®· häc ®­îc kü n¨ng ®µo kho¸n.", 0)
		return
	end
	
	if GetLifeSkillsNum(0)>=2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end

    Say(strTitle.."<color=yellow>§µo kho¸ng<color> sÏ lµ kü n¨ng thu thËp míi cña ng­¬i, ng­¬i x¸c nhËn muèn häc?",
    	2,
    	"Ta muèn häc/LearnYes",
    	"§Ó ta suy nghÜ l¹i/LearnNo")
end;
--Ñ§Ï°¼¼ÄÜ
function LearnYes()
	if (GetLifeSkillLevel(0, 5) > 0) then
		Say (strTitle.."B¹n ®· häc kü n¨ng ®µo kho¸ng!", 0)
	else
		if (LearnLifeSkill(0, 5, 1, 79, 0)) then
			AddItem(0, 200, 11, 1, 1)
        	Msg2Player("B¹n ®· häc ®­îc kü n¨ng thu thËp: §µo kho¸ng. NhËn ®­îc Cuèc chim.")
    	end
	end
end;
--È¡ÏûÑ§Ï°¼¼ÄÜ
function LearnNo()
    Say (strTitle.."NghÜ kü råi h·y ®Õn!", 0)
end



-- È·ÈÏÈ¥ÏàÓ¦¹Ò»úµØµã
function GotoWorld_Confirm1()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Th¹ch M«n §éng<color> ®µo kho¸ng ­? N¬i ®ã cã <color=yellow>Tinh ThiÕt<color>, <color=yellow>B¸ch luyÖn c­¬ng<color>, <color=yellow>¤ kim<color> vµ <color=yellow>Hµn thiÕt<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(711,1728,3383)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Linh Nham ®éng<color> ®µo kho¸ng ­? N¬i ®ã cã <color=yellow>Th¸i b¹ch tinh kim<color>, <color=yellow>HuyÒn thiÕt<color> vµ <color=yellow>Thiªn Thanh<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(716,1694,3032)",
		"Kh«ng ®i ®©u/Main_Exit")
end;
function GotoWorld_Confirm3()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>HuyÒn Tinh ®éng<color> ®µo kho¸ng ­? N¬i ®ã cã <color=yellow>H¾c « th¹ch<color>, <color=yellow>Xİch thiÕt<color> vµ <color=yellow>V©n mÉu<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!",
		2,
		"Ta muèn ®i/#GotoWorld(721,1688,3333)",
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
	Say(strTitle.."<color=yellow>§µo kho¸ng<color> lµ mét trong <color=yellow>6<color> kü n¨ng thu thËp, häc ®­îc kü n¨ng nµy míi cã ®­îc nguyªn liÖu <color=yellow>chÕ t¹o vò khİ<color>. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua c«ng cô ®µo kho¸ng <color=yellow>s¬ cÊp<color>, sau ®ã ra ngoµi ®µo kho¸ng. NÕu muèn vµo khu vùc khai kho¸ng nhí ®Õn <color=yellow>Ngù c¸c<color> mua <color=yellow>ThÇn N«ng §¬n<color> mang theo.", 0)
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
	local nSkillId = 5;
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

