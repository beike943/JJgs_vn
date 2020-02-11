-- =========================================
-- File : XXXÇø£¬XX£¬¼¯Áé¼¼ÄÜ.lua
-- Name : ¼¯ÁéÑ§Ï°
-- ID   : 0, 7
-- =========================================

Include("\\script\\task\\lifeskill\\lifeskill_task_head.lua");

-- == Ô¤¶¨ÒåµÄÒ»Ð©ÈÎÎñ±äÁ¿ID =======================
ID_LEARNLIFESKILL		= 1925		-- ÐÂÊÖÈÎÎñ±äÁ¿
FORGETOHTER_NUM			= 1941		-- ÒÅÍü¸±¼¼ÄÜ´ÎÊý
LEV_LEARNRECIPE			= 1926		-- Åä·½Ñ§Ï°ÈÎÎñ±äÁ¿
LIFESKILL_STATE			= 1623		-- Ñ§Ï°¼¯Áé¼¼ÄÜ±ê¼Ç

-- == È«¾ÖÊ¹ÓÃµÄÃû×Ö =======================
strName = ""
strTitle = ""


-- == Ä¬ÈÏÈë¿Úº¯Êý =========================
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
	
	    if (GetTask(ID_LEARNLIFESKILL) < 3) then
        Say(strTitle.."§Õn <color=yellow>CÊp 10<color> cã thÓ ®Õn <color=yellow>Thµnh §«<color> gÆp <color=yellow>Du Ph­¬ng ®¹i phu<color> t×m hiÓu <color=yellow>kü n¨ng sèng<color>!", 0)
        TaskTip("§Õn cÊp 10 cã thÓ ®Õn Thµnh §« t×m Du Ph­¬ng ®¹i phu.")
        return
    elseif (GetTask(ID_LEARNLIFESKILL) < 15) then
    	Say(strTitle.."Muèn häc TËp Linh ­? HiÖn giê ta ch­a thÓ d¹y ®­îc.", 0)
    	return
    end;
	
	Say(strTitle.."Ta ph¸t hiÖn ra nÕu dïng huyÕt dÞch vµ kho¸ng th¹ch cã thÓ tinh chÕ thµnh Linh HuyÕt vµ Linh Sa. ThÕ nµo, ng­¬i cã muèn thö kh«ng?",
		6,
		"Häc Kü n¨ng TËp Linh/learn_magic_skill",
		"§i H­ng An lÜnh (s¬ cÊp)/goto_world_1",
		"§i Héi Tiªn lÜnh (trung cÊp)/goto_world_2",
		"§i Th­¬ng Long lÜnh (cao cÊp)/goto_world_3",
		--"ÒÅÍü¼¯Áé¼¼ÄÜ/forget_life_skill",
		"Ta muèn t×m hiÓu nh÷ng g× liªn quan ®Õn TËp Linh/magic_info",
       	"Rêi khái/exit_dialog")
end;
	
-- == Ê²Ã´¶¼²»×öµÄÍË³ö¶Ô»° ===================
function exit_dialog()
end;


-- == ÎÒÏëÁË½â¼¯ÁéµÄÏà¹ØÐÅÏ¢ ===================
function magic_info()
	Say(strTitle.."TËp Linh lµ kü n¨ng lµm ra nguyªn liÖu. Chñ yÕu dïng huyÕt dÞch vµ kho¸ng th¹ch ®Ó tinh chÕ Linh HuyÕt vµ Linh Sa. Ng­¬i cã thÓ ®Õn <color=yellow>tiÖm t¹p hãa<color> mua c«ng cô TËp Linh <color=yellow>s¬ cÊp<color> sau ®ã ra ngoµi tinh luyÖn. NÕu muèn ®Õn s¬n LÜnh nhí ®Õn <color=yellow>Ngù c¸c<color> mua <color=yellow>ThÇn N«ng §¬n<color> mang theo.", 0)
end;


-- ÒÅÍüÉú»î¼¼ÄÜ
function forget_life_skill()
	if (GetLifeSkillLevel(0, 7) > 0) then
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
			"Khoan ®·! Chê ta suy nghÜ l¹i!/exit_dialog")
	else
		Say(strTitle.."Kü n¨ng TËp Linh ng­¬i vÉn ch­a häc, ta kh«ng thÓ gióp ®­îc ng­¬i.", 0)
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
	
	if (GetLifeSkillLevel(0, 7) > 0) then
		if (Pay(nShouldPayMoney) == 1) then
			local nRet = AbandonLifeSkill(0, 7)
			if (nRet == 0) then
				Earn(nShouldPayMoney)
			else
				SetTask(FORGETOHTER_NUM, nForgetTimes + 1)
				Msg2Player("Kü n¨ng TËp Linh ng­¬i ®· quªn råi")				
			end
		else
			Say(strTitle.."Ng­¬i kh«ng mang theo ®ñ tiÒn! LÊy tiÒn råi h·y ®Õn nhÐ!", 0)
		end
	end
end;

-- -------------------------------Ñ§Ï°Éú»î¼¼ÄÜ-------------------------------
function learn_magic_skill()
    if (GetLevel() < 10) then
        Say (strTitle.."Hõm… Th©n thñ cña ng­¬i cßn kÐm l¾m. H·y ra ngoµi thµnh tu luyÖn ®Õn cÊp 10 h·y ®Õn t×m ta!", 0)
		return
	end

	-- ÅÐ¶ÏÊÇ·ñÒÑ¾­Ñ§»áÁË²É¼¯¼¼ÄÜ - ÊÕ¸û
	if (GetLifeSkillLevel(0, 7) > 0) then
        Say (strTitle.."Ng­¬i ®· häc ®­îc kü n¨ng TËp Linh!", 0)
		return
	end

	if GetLifeSkillsNum(0) >= 2 then
        Say (strTitle.."B¹n ®· häc 2 Kü n¨ng thu thËp, kh«ng thÓ häc thªm n÷a!",0)
		return
	end

    Say(strTitle.."<color=yellow>Kü n¨ng TËp Linh<color> sÏ gióp ng­¬i cã thªm nguyªn liÖu, cã muèn häc kh«ng?",
    	2,
    	"Ta muèn häc/learn_yes",
    	"§Ó ta suy nghÜ l¹i/exit_dialog")
end;
--Ñ§Ï°¼¯Áé¼¼ÄÜ
function learn_yes()
	if (GetLifeSkillLevel(0, 7) > 0) then
		Say (strTitle.."B¹n ®· häc ®­îc kü n¨ng TËp Linh!", 0)
	else
		if (LearnLifeSkill(0, 7, 1, 79, 0)) then
        	Msg2Player("B¹n ®· häc ®­îc kü n¨ng thu thËp: TËp Linh.")
    	end
	end
end;


-- È·ÈÏÈ¥ÏàÓ¦¹Ò»úµØµã
function goto_world_1()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>H­ng An LÜnh<color> thu thËp kh«ng? N¬i ®ã cã nhiÒu <color=yellow>Chu Sa<color>, <color=yellow>H¾c KhuyÓn Linh HuyÕt<color>, <color=yellow>Phï th¹ch c¸c ®¹i m«n ph¸i<color>, <color=yellow>§én Gi¸p Th­<color> vµ <color=yellow>Phï th¹ch c¸c ®¹i thµnh thÞ<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>.",
		2,
		"Ta muèn ®i/#goto_world(710,1707,3385)",
		"Kh«ng ®i ®©u/exit_dialog")
end;
function goto_world_2()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Héi Tiªn LÜnh<color> thu thËp kh«ng? N¬i ®ã cã nhiÒu <color=yellow>BÝch HuyÕt Sa<color>, <color=yellow>Thanh ¤ Linh HuyÕt<color>, <color=yellow>Phï th¹ch c¸c ®¹i m«n ph¸i<color> vµ <color=yellow>§én Gi¸p Th­<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>.",
		2,
		"Ta muèn ®i/#goto_world(715,1496,2998)",
		"Kh«ng ®i ®©u/exit_dialog")
end;
function goto_world_3()
	Say(strTitle.."Ng­¬i muèn ®Õn <color=yellow>Th­¬ng Long LÜnh<color> thu thËp kh«ng? N¬i ®ã cã nhiÒu <color=yellow>HuyÒn H¹c Linh HuyÕt<color> vµ <color=yellow>Phï th¹ch c¸c ®¹i m«n ph¸i<color>. Nhí mang theo <color=yellow>ThÇn N«ng §¬n<color>!  ",
		2,
		"Ta muèn ®i/#goto_world(720,1705,3350)",
		"Kh«ng ®i ®©u/exit_dialog")
end;
-- È¥ÏàÓ¦µÄ¹Ò»úµØµã
function goto_world(MapID, x, y)
		CleanInteractive()
		LeaveTeam()
		SetFightState(0)
		
		NewWorld(MapID, x, y)
end;

-- ¸ù¾ÝÍæ¼ÒÖÆ·ûµÈ¼¶¸øÓèÆäÏàÓ¦µÄ¼¯Áé¼¼ÄÜµÈ¼¶
function Learn_life_skill()
	Say(strTitle.."Ng­¬i lµ ®Ö tö cñaV©n Du ®¹o nh©n µ? §Ó ta xem tµi nghÖ chÕ phï cña ng­¬i thÕ nµo tr­íc khi truyÒn kü n¨ng TËp Linh. Nh­ng nhí lµ ta chØ truyÒn mét lÇn th«i ®Êy.",
		2,
		"Xin kiÓm tra kü n¨ng TËp Linh cña t¹i h¹./Panduan_life_skill",
		"Kh«ng cÇn ®©u/exit_dialog")
end;


function Panduan_life_skill()

local nLifeLevel = GetLifeSkillLevel(1,8);

	if GetTask(LIFESKILL_STATE) == 1 then
		Say(strTitle.."Ng­¬i mau quªn qu¸! Ta ®· d¹y cho ng­¬i 1 lÇn råi, kh«ng ph¶i d¹y l¹i lÇn n÷a chí?", 0)
		return
	end

	local nLevel = GetLifeSkillLevel(1, 8)
	if (GetLifeSkillLevel(1, 8) >= 1) then
		if (nLevel >= 1) then
			LearnLifeSkill(0, 7, nLifeLevel, 79, 0)
    	Msg2Player("B¹n häc ®­îc phèi chÕ: TËp Linh")
    	SetTask(LIFESKILL_STATE,1);
    else
       Say(strTitle.."Ng­¬i kh«ng ph¶i lµ chÕ phï s­ ta kh«ng cßn c¸ch nµo kh¸c.", 0)
    end
   end
end