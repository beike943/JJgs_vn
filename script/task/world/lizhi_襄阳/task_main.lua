--ÏåÑô¡¤Ì½ÓªÈÎÎñÖ÷Ìâ½Å±¾
--created by lizhi
--2005-8-18 16:43

--ÏÖÔÚÓëNPCµÄ¶Ô»°´¥·¢Æ÷µÄ´¦Àí»úÖÆÊÇ£¬Íê³É¶Ô»°ºóÁ¢¿ÌĞ¶ÔØ¶Ô»°´¥·¢Æ÷
--ÕâÑù×ö¿ÉÒÔ±ÜÃâÆäËûÈÎÎñ²»ÄÜ¼ÌĞøÏÂÈ¥µÄÇé¿ö£¬µ«ÊÇÃ»ÓĞÁËÈÎÎñÌáÊ¾
--ÒÔºóÈç¹ûÊµÏÖÁËNPC¶Ô»°Ê±¿ÉÒÔÑ¡ÔñÈÎÎñÁĞ±í£¬¾Í¿ÉÒÔ½â¾öÏÖÔÚÕâÖÖÇé¿ö


Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

-----------------------------------ÏåÑôÌ½Óª-------------------------------------

function task_01_00()
    local szTalk = {
        "ChuyÖn nãi ra dµi dßng, võa råi t¹i BiÖn Kinh v·n bèi ®o¹t ®­îc bøc th­ cña Thiªn ¢m gi¸o Liªu quèc, tiÒn bèi xem qua!",
    	"[C«ng T«n Th­ ®äc bøc th­]",
    	"§a t¹ <sex>, ta sÏ ®Ò phßng! Vâ c«ng tÇm th­êng kh«ng thÓ ®¶ th­¬ng ®­îc l·o phu! Ha! Ha! Ha!",
    	"TiÒn bèi vâ c«ng c¸i thÕ, cã dŞp t¹i h¹ còng muèn thØnh gi¸o vµi chiªu.",
    	"Ha! Ha! <sex> rÊt cã chİ khİ nh­ng hiÖn ta ®ang cã viÖc hÑn <sex> vµo dŞp kh¸c.",
    	"ChuyÖn g×? T¹i h¹ gióp ®­îc kh«ng?",
    	"Nguy hiÕm l¾m, ta kh«ng d¸m phiÒn <sex>! Ta cã bøc th­ muèn göi cho Tö H¹c Ch©n Nh©n ë Vâ §ang, cã thÓ gióp ta ®­îc kh«ng?",
        "§­îc th«i!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_XYTY, 2);
    DelItem(2,0,50,1);
    Msg2Player("§Õn Vâ §ang s¬n t×m Tö H¹c Ch©n Nh©n");
    TaskTip("§Õn Vâ §ang s¬n t×m Tö H¹c Ch©n Nh©n");
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan1")		--Áé±¦É½1
end;

function task_02_00()
    local szTalk = {
        "Xuèng nói l©u nh­ vËy mµ kh«ng cã tin tøc g× sao?",
    	"Tham kiÕn tiÒn bèi!",
    	"MiÔn lÔ! MiÔn lÔ! Kh«ng biÕt t×m bÇn ®¹o cã chuyÖn g×?",
    	"C«ng T«n Th­ tiÒn bèi nhiÒu ngµy kh«ng nhËn ®­îc tin tøc nªn ph¸i t¹i h¹ ®Õn hái th¨m.",
    	"MÊy h«m nay trong ph¸i gÆp mét sè chuyÖn bÇn ®¹o ch­a liªn l¹c kŞp. HiÖn bÇn ®¹o muèn nhê ng­êi ®Õn ThiÕu L©m t×m nhŞ ®ång.",
    	"§Ó v·n bèi ®Õn ®ã mét chuyÕn!",
        "Tèt qu¸! §i ®­êng cÈn thËn!"
    };
    TalkEx("task_02_01", szTalk);
end;

function task_02_01()
    SetTask(TASK_XYTY, 3);
    Msg2Player("T×m th­ kiÕm nhŞ ®ång");
    TaskTip("T×m th­ kiÕm nhŞ ®ång");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan2")		--Áé±¦É½2
end;

function task_03_00()
    local szTalk = {
    	"Lµ l¸ la..",
    	"Cho hái ®©y cã ph¶i {th­ kiÕm nhŞ ®ång} kh«ng?",
    	"§óng råi! T¹i h¹ Lôc Th¸i Thanh, huynh ®Ö hay gäi KiÕm ®ång, kÕ bªn lµ s­ ®Ö Lôc TrŞ B×nh hay cßn gäi Th­ ®ång. Chóng Ta phông mÖnh s­ phô lªn ThiÕu L©m, gi÷a ®­êng gÆp LiÖp hé Linh B¶o s¬n, hai bªn x¶y ra tranh chÊp chóng ®¸nh s­ ®Ö bŞ th­¬ng, ta kh«ng d¸m vÒ gÆp s­ phô v× ®· ph¹m giíi nh­ng l¹i sî th­¬ng tİch cña s­ ®Ö...",
    	"Th«i ®Ó ta gióp hai ng­¬i vÒ nãi víi s­ phô.",
        "§a t¹ <sex>."
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_XYTY, 4);
    Msg2Player("VÒ bÈm b¸o Tö H¹c Ch©n Nh©n");
    TaskTip("VÒ bÈm b¸o Tö H¹c Ch©n Nh©n");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan3")		--Áé±¦É½3
end;

function task_04_00()
    local szTalk = {
        "T×m ®­îc hai ®Ö tö cña ta kh«ng?",
    	"§Ö tö cña quı ph¸i gi÷a ®­êng kh«ng may gÆp bän xÊu ®¶ th­¬ng, hiÖn ®i ®øng bÊt tiÖn v·n bèi vÒ th«ng b¸o tr­íc cho tiÒn bèi!",
    	"Bän chóng kh«ng nghe lêi bÇn ®¹o, l¹i dïng vâ víi ng­êi kh¸c, lÇn nµy vÒ nhÊt ®Şnh ph¶i d¹y dç cho thËt tèt.",
    	"TiÒn bèi khoan nãng véi, tr­íc tiªn trŞ th­¬ng tİch cho Lôc ®Ö ®·, ®îi hä vÒ hái ®Çu ®u«i c©u chuyÖn xö ph¹t còng ch­a muén.",
    	"Th«i ®­îc! §Ó chóng tŞnh d­ìng thªm vµi ngµy, ë ®©y cã mÊy viªn D©n S¬n ®¬n chuyªn trŞ néi th­¬ng nh­ng ta cÇn thªm Hæ Cèt töu lµm måi thuèc, ng­¬i gióp ta t×m ®­îc kh«ng?",
    	"ViÖc nµy ®Ó v·n bèi lo!",
        "PhiÒn b»ng h÷u ®Õn Linh B¶o s¬n lÊy gióp ta 10 bé Hæ cèt vÒ ®©y!"
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    SetTask(TASK_XYTY, 5);
    CreateTrigger(0, 518, KILL_XY_LAOHU); --É±ÀÏ»¢
    Msg2Player("GiÕt hæ d÷ ë Linh B¶o s¬n lÊy 10 c¸i hæ cèt");
    TaskTip("GiÕt hæ d÷ ë Linh B¶o s¬n lÊy 10 c¸i hæ cèt");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan4")		--Áé±¦É½4
end;

function task_05_00()
	local szTalk = {
		"PhiÒn b»ng h÷u ®Õn Linh B¶o s¬n lÊy gióp ta 10 bé Hæ cèt vÒ ®©y!"
	};
	TalkEx("task_06_02", szTalk);
end;

function task_06_00()
    local szTalk = {
        "T×m ®­îc hæ cèt ch­a?",
	    "T×m ®­îc råi!",
        "PhiÒn b»ng h÷u ®em Hæ Cèt M©n s¬n ®¬n cho hai ®Ö tö ta."
    };
    local szNot = {
        "Hæ cèt vÉn ch­a t×m ®ñ µ?",
	    "V·n bèi ®i ngay!"
	};
    if GetItemCount(2,0,55) >= 10 then
        TalkEx("task_06_01", szTalk);
    else
        TalkEx("task_06_02", szNot);
    end;
end;

function task_06_01()
    SetTask(TASK_XYTY, 7);
    RemoveTrigger(GetTrigger(KILL_XY_LAOHU));
    DelItem(2,0,55,10);
    AddItem(2,0,204,1);   --»¢¹ÇXXµ¤£¬ÔİÊ±ÓÃ±Á´ø
    Msg2Player("§em Hæ Cèt M©n s¬n ®¬n cho th­ kiÕm nhŞ ®ång");
    TaskTip("§em Hæ Cèt M©n s¬n ®¬n cho th­ kiÕm nhŞ ®ång");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan5")		--Áé±¦É½5
end;

function task_06_02()
    if GetTrigger(KILL_XY_LAOHU) == 0 then
        CreateTrigger(0, 518, KILL_XY_LAOHU); --É±ÀÏ»¢
    end;
end;

function task_07_00()
    local szTalk = {
        "Ta mong tin qu¸! Ch­ëng m«n nãi sao?",
    	"Tö H¹c Ch©n Nh©n b¶o hai ng­êi trŞ th­¬ng tr­íc, ®©y lµ linh d­îc.",
    	"§a t¹ cøu m¹ng!",
    	"[KiÕm ®ång ®­a thuèc cho th­ ®ång]",
    	"Thùc ra kh«ng ph¶i bän ta v« cí ra tay mµ v« t×nh nghe ®­îc bän LiÖp hé nãi vô c­íp s¬n trang, hä ®Şnh giÕt bän ta diÖt khÈu.",
    	"Xem ra hai ng­êi còng cã ı tèt ®Ó ta vÒ bÈm b¸o víi ®¹i nh©n.",
        "§a t¹ <sex>……"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    DelItem(2,0,204,1); --»¢¹Çxxµ¤
    SetTask(TASK_XYTY, 8);
    Msg2Player("§em chuyÖn bÈm b¸o l¹i víi Tö H¹c Ch©n Nh©n");
    TaskTip("§em chuyÖn bÈm b¸o l¹i víi Tö H¹c Ch©n Nh©n");
    GivePlayerAward("Level_21", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan6")		--Áé±¦É½6
end;

function task_08_00()
    local szTalk = {
        "Ng­¬i cã dÉn hai ®Ö tö cña ta vÒ kh«ng?",
    	"T¹i h¹ thÊy hä ch­a khái nªn vÒ ®©y b¸o tin tr­íc nghe nãi hä bŞ hµm oan do can ng¨n ®¸m LiÖp hé c­íp s¬n trang.",
    	"Hõm! Vâ nghÖ häc ch­a tíi ®©u mµ muèn hµnh hiÖp tr­îng nghÜa.",
    	"TiÒn bèi nãi ®óng.",
    	"Kh«ng d¸m! Kh«ng d¸m! Mµ ®óng råi nghe ng­¬i nãi s¬n trang kh«ng lÏ Mé TuyÕt s¬n trang, ng­¬i mau vÒ bÈm b¸o víi C«ng T«n Th­, h×nh nh­ h¾n cã qua l¹i trang chñ n¬i ®ã.",
    	"V·n bèi ®i ngay!",
        "Ng­¬i gióp Vâ §ang rÊt nhiÒu, ë ®©y cã chót quµ xem nh­ b¸o ®¸p."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_XYTY, 9);
    Msg2Player("Th«ng b¸o cho C«ng T«n Th­");
    TaskTip("Th«ng b¸o cho C«ng T«n Th­");
    GivePlayerAward("Level_21", "hard", "legs", "Level_23");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshan7")		--Áé±¦É½7
end;

function task_09_00()
    local szTalk = {
        "ChuyÖn lín råi!",
    	"<sex> ®õng nªn hèt ho¶ng, nãi cho ta nghe chuyÖn g× nµo?",
    	"Trong lóc ®Õn Vâ §ang v« t×nh nghe tin bän ng­êi Linh B¶o s¬n cã ı ®å c­íp {Mé TuyÕt s¬n trang} nªn ®Õn ®©y th«ng b¸o.",
    	"Ra lµ vËy! MÊy h«m nay ta cã nghe ®ån chuyÕn hµng cña Mé TuyÕt s¬n trang nhê Tiªu côc chuyÓn ®i bŞ mÊt tİch, ch¾c cã liªn quan ®Õn chuyÖn. <sex> gióp ta ®Õn Linh B¶o s¬n hái nh÷ng {Thî s¨n} trªn ®ã thö xem!",
        "TiÒn bèi yªn t©m, t¹i h¹ ®i ®©y!"
    };
    TalkEx("task_09_01", szTalk);
end;

function task_09_01()
    CreateTrigger(0,519,KILL_XY_LIEHU);
    SetTask(TASK_XYTY, 10);
    Msg2Player("T×m LiÖp hé Linh B¶o s¬n dß la tin tøc");
    TaskTip("T×m LiÖp hé Linh B¶o s¬n dß la tin tøc");
    GivePlayerAward("Level_22", "easy");
	GivePlayerExp(SkeyBJKouzhun,"gongsunshu")		--Ñ°ÕÒ¹«ËïÊé
end;

function task_10_00()
    local szTalk = {
        "<sex> gióp ta ®Õn Linh B¶o dß la tin tøc bän ng­êi LiÖp hé ®­îc kh«ng?"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    if GetTrigger(KILL_XY_LIEHU) == 0 then
        CreateTrigger(0,519,KILL_XY_LIEHU);
    end;
end;

function task_11_00()
    local szTalk = {
        "ChuyÕn ®i lÇn nµy <sex> thu thËp ®­îc g×?",
	    "Ta ph¸t hiÖn trªn ng­êi LiÖp hé cã cê cña tiªu côc, cã thÓ tiªu s­ ®· bŞ h·m h¹i. ViÖc nµy xö lı ra sao, xin tiÒn bèi chØ gi¸o.",
	    "ChuyÖn giÕt ng­êi ®Ó cho quan phñ gi¶i quyÕt. Tr­íc m¾t <sex> gióp ta ®Õn Linh B¶o s¬n t×m hµng hãa bŞ thÊt l¹c.",
        "§­îc th«i!"
    };
    local szNot = {
        "ChuyÕn ®i lÇn nµy <sex> thu thËp ®­îc g×?",
	    "Ta ph¸t hiÖn trªn ng­êi LiÖp hé cã cê cña tiªu côc, do gÊp g¸p nªn ch­a kŞp mang vÒ.",
	    "Sù viÖc hÖ träng <sex> ph¶i mang cê cho ta xem míi ®­îc."
	};
    if GetItemCount(2,0,56) >= 1 then
        TalkEx("task_11_01", szTalk);
    else
        TalkEx("task_10_01", szNot);
    end;
end;

function task_11_01()
    DelItem(2,0,56,1);
    SetTask(TASK_XYTY, 12);
    Msg2Player("§Õn Linh B¶o s¬n ®¸nh LiÖp hé mang 20 kiÖn hµng vÒ");
    TaskTip("§Õn Linh B¶o s¬n ®¸nh LiÖp hé mang 20 kiÖn hµng vÒ");
    GivePlayerAward("Level_22", "easy");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshanduobiao1")		--Áé±¦É½¶áïÚ1
end;

function task_12_00()
    local szTalk = {
        "Mé TuyÕt s¬n trang mÊt nhiÒu hµng hãa, phiÒn <sex> t×m vÒ.",
        "V·n bèi ®i ngay!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_13_00()
    local szTalk = {
        "Xem <sex> vui mõng vËy ch¾c lÊy ®­îc hµng hãa vÒ råi!",
    	"TiÒn bèi ®õng c­êi, ®©y lµ tang vËt chê tiÒn bèi gi¶i quyÕt.",
    	"§Ó ta xem! Sao cã bøc th­ Mé TuyÕt s¬n trang göi cho T©y H¹?",
    	"[C«ng T«n Th­ xem kü néi dung trong th­]",
    	"Trong th­ ghi chuyÕn hµng nµy Mé TuyÕt s¬n trang c­íp ®­îc tõ Vâ §ang ph¸i. ChuyÖn nµy cã vÎ kh¶ nghi, ng­¬i mau t×m Tö H¹c Ch©n Nh©n x¸c minh thö xem!",
        "V·n bèi ®Õn Vâ §ang ®©y!"
    };
    local szNot = {
        "Mé TuyÕt s¬n trang mÊt nhiÒu hµng hãa, phiÒn <sex> t×m vÒ.",
        "V·n bèi ®i ngay!"
    };
    if GetItemCount(2,0,57) >= 20 then
        TalkEx("task_13_01", szTalk);
    else
        TalkEx("task_10_01", szNot);
    end;
end;

function task_13_01()
    RemoveTrigger(GetTrigger(KILL_XY_LIEHU));
    SetTask(TASK_XYTY, 14);
    Msg2Player("§em hµng hãa ®Õn Vâ §ang cho Tö H¹c Ch©n Nh©n kiÓm chøng");
    TaskTip("§em hµng hãa ®Õn Vâ §ang cho Tö H¹c Ch©n Nh©n kiÓm chøng");
    GivePlayerAward("Level_22", "hard");
	GivePlayerExp(SkeyBJKouzhun,"lingbaoshanduobiao2")		--Áé±¦É½¶áïÚ2
end;

function task_14_00()
    local szTalk = {
        "Ngän giã nµo ®­a ng­¬i ®Õn ®©y?",
    	"C«ng T«n Th­ tiÒn bèi nhËn ®­îc tin Vâ §ang bŞ mÊt mét sè vËt phÈm quı nªn ph¸i t¹i h¹ ®Õn hái thö!",
    	"Trong ph¸i chØ cã mÊy ng­êi chøc vŞ cao míi biÕt. C«ng T«n Th­ lÊy tin tøc tõ ®©u?",
    	"Kh«ng giÊu g× t¹i Linh B¶o s¬n v·n bèi ph¸t hiÖn chuyÕn hµng Mé TuyÕt s¬n trang, biÕt ®­îc bªn trong cã vËt phÈm quı ph¸i nªn ®em ®Õn tr¶.",
    	"Mau ®­a bÇn ®¹o xem!"
	};
	TalkEx("task_14_00_0", szTalk);
end;

function task_14_00_0()
    local szTalk = {
    	"[Tö H¹c Ch©n Nh©n kiÓm tra hµng hãa]",
    	"Ng­¬i biÕt ®©y lµ b¶o vËt g× kh«ng?",
    	"V·n bèi kh«ng biÕt.",
    	"§©y chİnh lµ HuyÒn thiÕt B¸t Qu¸i kİnh b¶o vËt chÊn ph¸i cña Vâ §ang do bªn trong Èn chøa m¶nh S¬n Hµ X· T¾c v× vËy míi bŞ lÊy trém."
	};
	TalkEx("task_14_00_1", szTalk);
end;

function task_14_00_1()
    local szTalk = {
    	"V·n bèi tõng nghe D· TÈu l·o nh©n nãi m¶nh S¬n Hµ X· T¾c cã uy lùc v« biªn nh­ng sao Mé TuyÕt s¬n trang l¹i dÔ dµng ®­a cho ng­êi kh¸c?",
    	"Ta ®©y còng kh«ng râ. Nh­ng bÇn ®¹o cã mét kÕ kh«ng chõng h÷u dông.",
    	"Xin ®¹o tr­ëng chØ gi¸o!",
    	"Ng­¬i thö gi¶ d¹ng ng­êi tiªu côc cßn sèng ®Õn Mé TuyÕt s¬n trang dß la. Nh­ng ph¶i hÕt søc cÈn thËn!",
        "Muèn vµo trong ch¾c ph¶i cã ¸m hiÖu. §Ó v·n bèi t×m mét sè ng­êi hái xem!"
    };
    TalkEx("task_14_01", szTalk);
end;

function task_14_01()
    DelItem(2,0,57,20);
    CreateTrigger(0,520,KILL_XY_MXSZ);
    SetTask(TASK_XYTY, 15);
    Msg2Player("Buéc th­¬ng kh¸ch, kiÕm kh¸ch Mé TuyÕt s¬n trang nãi ra ¸m hiÖu");
    TaskTip("Buéc th­¬ng kh¸ch, kiÕm kh¸ch Mé TuyÕt s¬n trang nãi ra ¸m hiÖu");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang1")		--ÄºÑ©É½×¯1
end;

function task_15_00()
    local szTalk = {
        "Mé TuyÕt s¬n trang phßng thñ nghiªm ngÆt, khã mµ lät vµo bªn trong.",
        "Muèn vµo trong ch¾c ph¶i cã ¸m hiÖu. §Ó v·n bèi t×m mét sè ng­êi hái xem!"
    };
    TalkEx("task_15_01", szTalk);
end;
    
function task_15_01()
    if GetTrigger(KILL_XY_MXSZ) == 0 then
        CreateTrigger(0, 520, KILL_XY_MXSZ);
    end;
end;

function task_16_00()
    local szTalk = {
        "Ng­¬i lµ ai?",
    	"Ta...chİnh lµ ng­êi cña ChÊn Uy tiªu côc. Tiªu xa bŞ c­íp chØ mét m×nh ta tho¸t chÕt, mau cho ta vµo bÈm b¸o víi trang chñ.",
    	"Ng­êi tiªu côc µ? Sao ta kh«ng biÕt vËy? Cã ¸m hiÖu kh«ng?",
    	"{Mé} ai trÇm trÇm, {TuyÕt} d¹ h«n h«n, {S¬n} léc trïng trïng, {Trang} x¸ th©m th©m, ®óng kh«ng?",
    	"§óng lµ ng­êi nhµ! H·y ®i bÈm b¸o víi Cöu §Çu Kim Phông! Nhí ®em theo lÖnh bµi nãi cã viÖc cÇu kiÕn.",
        "[T×m lÖnh bµi tiÕn hµnh b­íc tiÕp theo]"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_XYTY, 17);
    CreateTrigger(0,520,KILL_XY_MXSZ);
    Msg2Player("§¸nh Th­¬ng kh¸ch, KiÕm kh¸ch lÊy 1 LÖnh bµi!");
    TaskTip("§¸nh Th­¬ng kh¸ch, KiÕm kh¸ch lÊy 1 LÖnh bµi!");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang2")		--ÄºÑ©É½×¯2
end;

function task_17_00()
    local szTalk = {
        "T×m Cöu §Çu Kim Phông. Nhí mang theo LÖnh bµi!"
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    if GetTrigger(KILL_XY_MXSZ) == 0 then
        CreateTrigger(0,520,KILL_XY_MXSZ);
    end;
end;

function task_18_00()
    local szTalk = {
        "Ng­¬i lµ ai? Kh«ng thÊy ta ®ang th­ëng thøc r­îu sao?",
    	"T¹i h¹ lµ ng­êi cña ChÊn Uy tiªu côc, tiªu xa bŞ c­íp ë Linh B¶o s¬n, t¹i h¹ may m¾n tho¸t khái, xin ®¹i tû s¾p xÕp.",
    	"Ai mµ to gan d¸m ®éng ®Õn Mé TuyÕt S¬n Trang?",
    	"Lµ ®¸m ng­êi LiÖp hé ë Linh B¶o s¬n.",
    	"ChuyÖn nµy ®Ó ta lo liÖu, xem ra viÖc lÊy c¾p b¸u vËt Vâ §ang ®· bŞ b¹i lé! Ng­¬i h·y vµo ThÊt Tinh ®éng b¸o tin cho Ng©n Hå tr­íc!",
        "Thuéc h¹ tu©n lÖnh."
    };
    local szNot = {
        "Ng­¬i lµ ai? Kh«ng thÊy ta ®ang th­ëng thøc r­îu sao? §õng quÊy rÇy!",
        "[Xem ra ph¶i ®eo lÖnh bµi míi ®­îc]",
        "Thuéc h¹ lËp tøc c¸o lui."
    };
    if GetItemCount(2,0,58) >= 1 then
        TalkEx("task_18_01", szTalk);
    else
        TalkEx("task_17_01", szNot);
    end;
end;

function task_18_01()
    DelItem(2,0,58,1);
    RemoveTrigger(GetTrigger(KILL_XY_MXSZ));
    SetTask(TASK_XYTY, 19);
    Msg2Player("VÒ bÈm b¸o Tö H¹c Ch©n Nh©n");
    TaskTip("VÒ bÈm b¸o Tö H¹c Ch©n Nh©n");
    GivePlayerAward("Level_24", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang3")		--ÄºÑ©É½×¯3
end;

function task_19_00()
    local szTalk = {
        "Ng­¬i ®iÒu tra ®­îc g× råi?",
        "BÈm ®¹o tr­ëng ®İch thùc lµ Mé TuyÕt s¬n trang lÊy c¾p HuyÒn thiÕt B¸t Qu¸i kİnh, hiÖn hung thñ ®ang Èn nÊp ë {ThÊt Tinh ®éng}.",
        "Cã chuyÖn nµy n÷a sao? ThÊt Tinh ®éng lµ n¬i nguy hiÓm, kÎ ®Şch d¸m ®ét nhËp vµo trong xem ra bÇn ®¹o ph¶i triÖu tËp ®Ö tö ®Õn ®ã råi.",
        "T¹i h¹ t×nh nguyÖn vµo trong b¾t kÎ ®Şch.",
        "Ng­¬i thËt gan d¹ nh­ng kh«ng nªn xem th­êng kÎ ®Şch ph¶i hÕt søc cÈn thËn."
    };
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    SetTask(TASK_XYTY, 20);
    Msg2Player("§¸nh b¹i Ng©n Hå");
    TaskTip("§¸nh b¹i Ng©n Hå");
    GivePlayerAward("Level_31", "easy");
	GivePlayerExp(SkeyBJKouzhun,"muxueshanzhuang4")		--ÄºÑ©É½×¯4
end;

function task_21_00()
    local szTalk = {
        "Ng­¬i ®¸nh b¹i tªn ®¹o tÆc ch­a?",
        "Tªn giÆc ®ã thµ chÕt còng kh«ng chŞu khuÊt phôc, v·n bèi chØ t×m ®­îc mét tÊm Danh bµi!",
        "Danh bµi? §­a ta xem!",
        "[Tö H¹c Ch©n Nh©n cÇm xem rÊt l©u…]",
        "Ng­¬i thö mang cho C«ng T«n Th­ xem, ë ®©y cã chót quµ män xem nh­ bÇn ®¹o t¹ ¬n ng­¬i."
    };
    TalkEx("task_21_01", szTalk);
end;

function task_21_01()
    SetTask(TASK_XYTY, 22);
    GivePlayerAward("Level_31", "hell", "chest", "Level_28");
	GivePlayerExp(SkeyBJKouzhun,"qixingdong")		--ÄºÑ©É½×¯1
end;

-------------------------------------ÏåÑô½£ÃÅ--------------------------------------

function task_22_00()
    local szTalk = {
        "ChuyÕn ®i Vâ §ang lÇn nµy <sex> cã thu ho¹ch g× kh«ng?",
    	"B¸u vËt ®ã ®İch thùc cña Vâ §ang nghe nãi bªn trong chøa m¶nh S¬n Hµ X· T¾c. T¹i h¹ cßn ph¸t hiÖn mãn ®å trªn ng­êi kÎ trém.",
    	"[§­a Danh bµi cho C«ng T«n Th­ xem]",
    	"§©y lµ qu©n hiÖu T©y H¹, kh«ng lÏ tªn trém ®ã lµ lİnh T©y H¹. Xem ra mèi quan hÖ gi÷a Mé TuyÕt s¬n trang vµ T©y H¹ thËt kh«ng ®¬n gi¶n. <sex> ®Õn s¬n trang mét chuyÕn ®iÒu tra xem sao.",
        "§Ó t¹i h¹ ®i hái {Cöu §Çu Kim Phông}."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    SetTask(TASK_XYTY, 23);
    DelItem(2,0,59,1);
end;

function task_23_00()
    local szTalk = {
        "Ng­¬i vÒ råi µ? Ng©n Hå ®©u?",
    	"T¹i h¹ cã khuyªn mµ c« n­¬ng Êy kh«ng chŞu vÒ, ®©y lµ qu©n hiÖu c« ta ®Ó l¹i.",
    	"Hõm! D¸m g¹t ta ­? §©y lµ Qu©n hiÖu, vËt bÊt ly th©n cña qu©n nh©n T©y H¹, ng­¬i chİnh lµ ng­êi cña Vâ §ang! Ch¼ng lÏ Ng©n Hå ®· chÕt d­íi tay ng­¬i? Ta ph¶i b¸o thï!",
        "[B¹i lé råi, xem ra trËn chiÕn kh«ng thÓ tr¸nh khái]"
    };
    TalkEx("task_23_01", szTalk);
    SetTask(TASK_XY_TEMP, GetTargetNpc());
end;

function task_23_01()
    ChangeNpcToFight(GetTask(TASK_XY_TEMP));

--    SetTask(TASK_XYTY, 24);
--    --log´¥·¢Æ÷
--    CreateTrigger(3, 204, LEAVE_GAME_XY);
--    SetLogType(GetTrigger(LEAVE_GAME_XY), 1); --ÉèÖÃÎªµÅ³öÀàĞÍ
--    
--    --rect ´¥·¢Æ÷
--    CreateTrigger(2,1301,LEAVE_RECT_XY);
--    
--    SetDeathScript("\\script\\task\\world\\lizhi_ÏåÑô\\task_Death.lua");
    Msg2Player("§¸nh b¹i Cöu §Çu Kim Phông");
    TaskTip("§¸nh b¹i Cöu §Çu Kim Phông");
end;

function task_25_00()
    local szTalk = {
        "Ng­¬i lµ ng­êi Mé TuyÕt s¬n trang ­? Sao kh«ng thÊy Cöu §Çu Kim Phông?",
    	"§¹i tû dÆn ta ®Õn ®©y ®­a mËt hµm.",
    	"[Th¸c B¹t Kú nhËn mËt hµm]",
    	"Qu©n ®éi ®· chuÈn bŞ s½n sµng ë {KiÕm M«n Quan} chê hiÖu lÖnh {tËp kİch thµnh T­¬ng D­¬ng}, ng­¬i mau vÒ bÈm b¸o víi trang chñ chuÈn bŞ phèi hîp t¸c chiÕn.",
    	"[Kh«ng xong råi qu©n ®éi T©y H¹ ®· tiÕn vµo KiÕm M«n Quan, cÇn ph¶i tiªu diÖt ®éi qu©n tiªn phong tr­íc]"
    };
    TalkEx("task_25_01", szTalk);
end;

function task_25_01()
    DelItem(2,0,60,1);
    CreateTrigger(0,521,KILL_XY_DB);
    CreateTrigger(0,522,KILL_XY_QB);
    Msg2Player("§¸nh b¹i ®éi qu©n tiªn phong cña T©y H¹");
    TaskTip("§¸nh b¹i ®éi qu©n tiªn phong cña T©y H¹");
    SetTask(TASK_XYTY, 26);
    SetTask(TASK_XY_TEMP, 0);
    SetTask(TASK_XY_TEMP1, 0);
    GivePlayerAward("Level_26", "normal");
	GivePlayerExp(SkeyBJKouzhun,"jianmenweiji")		--½£ÃÅÎ£»ú
end;

function task_26_00()
    local szTalk = {
        "Qu©n ®éi ®· chuÈn bŞ s½n sµng ë {KiÕm M«n Quan} chê hiÖu lÖnh {tËp kİch thµnh T­¬ng D­¬ng}, ng­¬i mau vÒ bÈm b¸o víi trang chñ chuÈn bŞ phèi hîp t¸c chiÕn."
    };
    TalkEx("task_26_01", szTalk);
end;

function task_26_01()
    if GetTrigger(KILL_XY_DB) == 0 and GetTask(TASK_XY_TEMP) == 0 then
        CreateTrigger(0,521,KILL_XY_DB);
    end;
    if GetTrigger(KILL_XY_QB) == 0 and GetTask(TASK_XY_TEMP1) == 0 then
        CreateTrigger(0,522,KILL_XY_QB);
    end;
end;

function task_28_00()
    local szTalk = {
        "ChuyÖn kh«ng hay råi!",
    	"Kh«ng nªn hèt ho¶ng, tõ tõ nãi.",
    	"V·n bèi ph¸t hiÖn qu©n ®éi T©y H¹ ®· tiÕn vµo KiÕm M«n Quan, ®ang chuÈn bŞ tËp kİch thµnh T­¬ng D­¬ng.",
    	"T­¬ng D­¬ng thµnh lµ yÕu ®iÓm nÕu bŞ c«ng ph¸ th× hËu qu¶ kh«ng thÓ l­êng ®­îc.",
    	"TiÒn bèi kh«ng nªn lo l¾ng t¹i h¹ ®· ®¸nh b¹i ®éi qu©n tiªn phong T©y H¹, thiÕt nghÜ chóng kh«ng d¸m manh ®éng.",
    	"Kh¸ l¾m! ViÖc ®¸nh giÆc tr­íc giê ®Òu qua bè trËn nÕu chóng ta cã ®­îc b¶n ®å bµy binh bè trËn cña ®Şch th× phÇn th¾ng sÏ cao h¬n. <sex> ®ång ı ®Õn KiÕm M«n Quan t×m Bè TrËn ®å cña ng­êi T©y H¹ kh«ng?",
        "TiÒn bèi yªn t©m t¹i h¹ nhÊt ®Şnh t×m ®­îc."
    };
    TalkEx("task_28_01", szTalk);
end;

function task_28_01()
    SetTask(TASK_XYTY, 29);
    CreateTrigger(0,523,KILL_XY_JMG);
    Msg2Player("T×m Bè TrËn ®å T©y H¹");
    TaskTip("T×m Bè TrËn ®å T©y H¹");
    GivePlayerAward("Level_26", "hard");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying1")		--½£ÃÅÎ£»ú1
end;

function task_29_00()
    local szTalk = {
        "ViÖc ®¸nh giÆc tr­íc giê ®Òu qua bè trËn nÕu chóng ta cã ®­îc b¶n ®å bµy binh bè trËn cña ®Şch th× phÇn th¾ng sÏ cao h¬n. <sex> ®ång ı ®Õn KiÕm M«n Quan t×m Bè TrËn ®å cña ng­êi T©y H¹ kh«ng?"
    };
    TalkEx("task_29_01", szTalk);
end;

function task_29_01()
    if GetTrigger(KILL_XY_JMG) == 0 then
        CreateTrigger(0,523,KILL_XY_JMG);
    end;
end;

function task_30_00()
    local szTalk = {
        "<sex> t×m ®­îc råi µ?",
    	"TiÒn bèi xem qua!",
    	"[C«ng T«n Th­ nghiªn cøu kü Bè TrËn ®å]",
    	"QuËn ®éi T©y H¹ chñ yÕu lµ bé binh, dïng thuËt hãa trang ®Ó dÔ trµ trén nh­ng tèc ®é di chuyÓn h¬i chËm, bªn trong Bè TrËn ®å vÏ ra 3 ®¹i doanh lín trong KiÕm M«n Quan, mçi ®¹i doanh ®Òu cã t­íng lÜnh thèng so¸i. NÕu cã thÓ tËp kİch giÕt chÕt t­íng lÜnh qu©n ®éi, T©y H¹ lËp tøc ®¹i lo¹n.",
        "Qu¶ lµ cao kiÕn! §Ó t¹i h¹ ®i giÕt 3 tªn t­íng lÜnh T©y H¹."
    };
    local szNot = {
        "<sex> t×m ®­îc råi µ?",
    	"Qu©n ®éi T©y H¹ canh g¸c nghiªm ngÆt, kh«ng dÔ th©m nhËp ®îi v·n bèi t×m l¹i."
    };
    if GetItemCount(2,0,61) >= 1 then
        TalkEx("task_30_01", szTalk);
    else
        TalkEx("task_29_01", szNot);
    end;
end;

function task_30_01()
    DelItem(2,0,61,1);
    RemoveTrigger(GetTrigger(KILL_XY_JMG));
    --CreateTrigger(0,524,KILL_XY_JL);
    SetTask(TASK_XYTY, 31);
    SetTask(TASK_XY_TEMP, 0);
    Msg2Player("§¸nh b¹i 3 tªn t­íng lÜnh T©y H¹");
    TaskTip("§¸nh b¹i 3 tªn t­íng lÜnh T©y H¹");
    GivePlayerAward("Level_28", "easy");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying2")		--½£ÃÅÎ£»ú2
end;

function task_32_00()
    local szTalk = {
        "Ta thÊy <sex> ®i h¬i l©u cã chót lo l¾ng nh­ng <sex> b×nh an trë vÒ lµ tèt råi.",
    	"T¹i h¹ t×m ®­îc mÊy bøc th­ trªn ng­êi t­íng lÜnh tiÒn bèi xem qua.",
    	"§­a ta xem!",
    	"[C«ng T«n Th­ ®äc th­]"
	};
	TalkEx("task_32_00_01", szTalk);
end;

function task_32_00_01()
	local szTalk = {
	    "Kh«ng xong råi ng­êi T©y H¹ ®· huy ®éng c¶ NhÊt PhÈm ®­êng.",
    	"Ph¶i tæ chøc quy tô nhiÒu cao thñ vâ l©m kh«ng? Nh­ng ë KiÕm M«n Quan t¹i h¹ chØ ph¸t hiÖn mÊy tªn lİnh quÌn, kh«ng thÊy cao thñ nµo hÕt.",
    	"Trong th­ ghi bän NhÊt PhÈm ®­êng tËp kÕt ë KiÕm C¸c thôc ®¹o, c«ng viÖc hä chuyªn ¸m s¸t t­íng lÜnh, trém c¾p v¨n th­.",
    	"§Ó v·n bèi ®Õn {KiÕm C¸c thôc ®¹o} mét chuyÕn.",
        "<sex> nhí ®Ó ı xem cã tİn vËt cña bän chóng kh«ng."
	};
    TalkEx("task_32_01", szTalk);
end;

function task_32_01()
    DelItem(2,0,62,3);
    SetTask(TASK_XYTY, 33);
    CreateTrigger(0,525,KILL_XY_SD);
    Msg2Player("T×m 10 NhÊt PhÈm bµi");
    TaskTip("T×m 10 NhÊt PhÈm bµi");
    GivePlayerAward("Level_28", "hell", "trinket", "Level_30");
	GivePlayerExp(SkeyBJKouzhun,"jianmenduoying3")		--½£ÃÅÎ£»ú3
end;

function task_33_00()
    local szTalk = {
        "Trong th­ ghi bän NhÊt PhÈm ®­êng tËp kÕt ë KiÕm C¸c thôc ®¹o, c«ng viÖc hä chuyªn ¸m s¸t t­íng lÜnh, trém c¾p v¨n th­.<sex> ®¸nh b¹i bän chóng lÊy ®­îc tİn vËt sÏ cã lóc h÷u dông."
    };
    TalkEx("task_33_01", szTalk);
end;

function task_33_01()
    if GetTrigger(KILL_XY_SD) == 0 then
        CreateTrigger(0,525,KILL_XY_SD);
    end;
end;

function task_34_00()
    local szTalk = {
        "<sex> vÒ råi µ? Cã thu ®­îc g× kh«ng?",
    	"Kh«ng lµm tiÒn bèi thÊt vän! §©y lµ Danh bµi thµnh viªn cña chóng.",
    	"Kh¸ l¾m! Ng­¬i tiÕp tôc ®i KiÕm M«n Quan t×m Th¸c B¹t Kú xem h¾n cã ph¶n øng g× kh«ng?",
        "Tu©n lÖnh."
    };
    local szNot = {
        "<sex> cã ®em tİn vËt cña bän chóng kh«ng?",
        "T¹m thêi ch­a ®ñ."
    };
    if GetItemCount(2,0,63) >= 10 then
        TalkEx("task_34_01", szTalk);
    else
        TalkEx("task_33_01", szNot);
    end;
end;

function task_34_01()
    RemoveTrigger(GetTrigger(KILL_XY_SD))
    DelItem(2,0,63,10);
    SetTask(TASK_XYTY, 35);
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"xixiajianrui1")		--Î÷ÏÄ¼âÈñ1
end;

function task_35_00()
    local szTalk = {
        "Ng­¬i ®Õn lµm g× n÷a, ch¼ng ph¶i b¶o ta t×m Mé……",
    	"Th«i ®i! KiÕm M«n Quan bŞ ng­êi ta tËp kİch, ®õng t­ëng ta kh«ng biÕt!",
    	"A! Tªn v« danh tiÓu tèt còng d¸m d¹y ®êi ta h¶?",
    	"Lêi cña ®¹i nh©n ng­¬i quªn råi sao? Xem ®©y lµ g×!",
    	"Lµ...®¹i nh©n ®ã sao, tiÓu nh©n kh«ng biÕt xin thø téi!",
    	"Th«i ®i! KiÕm M«n Quan bŞ ng­êi ngoµi tËp kİch, ng­¬i tİnh sao? Hay ®Ó ta ra tay?",
    	"§¹i nh©n tha m¹ng! TiÓu nh©n sÏ cho ng­êi ®iÒu tra vô nµy, giê ®¹i nh©n vÒ {KiÕm C¸c thôc ®¹o} nãi gióp víi {Gia LuËt B¸ Nham} gia h¹n thªm vµi ngµy."
	};
	TalkEx("task_35_00_00", szTalk);
end;

function task_35_00_00()
    local szTalk = {
    	"[Kh«ng biÕt Gia LuËt B¸ Nham cã lai lŞch nh­ thÕ nao ®Ó ta thö h¾n]",
    	"V« lÔ! Tªn cña ®¹i nh©n ng­¬i ®­îc phĞp gäi sao?",
    	"TiÓu nh©n biÕt lçi! Mong tiÒn bèi nãi gióp vµi c©u tr­íc {Gia LuËt Kim Cang} ®¹i nh©n.",
    	"[Th× ra lµ mét trong ThËp ®¹i kim cang cña NhÊt phÈm ®­êng ®ang lµm ®èc qu©n ë KiÕm C¸c thôc ®¹o]",
        "T¹m thêi tha cho ng­¬i, ®õng ®Ó x¶y ra chuyÖn nµy n÷a nhĞ!"
    };
    TalkEx("task_35_01", szTalk);
end;

function task_35_01()
    SetTask(TASK_XYTY, 36);
    Msg2Player("§¸nh b¹i Gia LuËt B¸ Nham");
    TaskTip("§¸nh b¹i Gia LuËt B¸ Nham");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"xixiajianrui2")		--Î÷ÏÄ¼âÈñ2
end;

function task_37_00()
    local szTalk = {
        "Ta thÊy khİ s¾c <sex> kh«ng ®­îc tèt, cã ph¶i bŞ ng­êi NhÊt PhÈm ®­êng ®¶ th­¬ng?",
    	"T¹i h¹ kh«ng sao, nay ®Õn b¸o tin mõng cho tiÒn bèi ®· h¹ ®­îc Gia LuËt B¸ Nham cña NhÊt PhÈm ®­êng, t¹m thêi chóng kh«ng d¸m hµnh ®éng.",
    	"Lµ ta ph¶i chóc mõng <sex> míi ®óng v× ®· lËp ®­îc c«ng lín.",
    	"§óng råi! Trªn ng­êi Gia LuËt B¸ Nham cã chiÕc b×nh sø, v·n bèi kh«ng biÕt vËt g× muèn nhê tiÒn bèi xem.",
    	"[C«ng T«n Th­ xem qua chiÕc b×nh sø]",
        "Bªn trong b×nh chøa mét sè d­îc liÖu, nhÊt thêi ta kh«ng biÕt chóng lµ g×, ng­¬i thö ®Õn §­êng M«n hái §éc Si xem."
    };
    TalkEx("task_37_01", szTalk);
end;

function task_37_01()
    SetTask(TASK_XYTY, 38);
    Msg2Player("§Õn §­êng M«n t×m §éc Si");
    TaskTip("§Õn §­êng M«n t×m §éc Si");
    GivePlayerAward("Level_30", "hell");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao1")		--ÉñÃØ¶¾Ò©1
end;

function task_38_00()
    local szTalk = {
        "Ng­¬i lµ ai?",
    	"§©y cã ph¶i lµ §éc Si tiÒn bèi? ë ®©y cã chiÕc b×nh sø chøa d­îc liÖu muèn nhê tiÒn bèi xem gióp.",
    	"§éc d­îc g× n÷a ®©y? §­a ta xem!",
    	"[§éc Si xem ngöi xong liÒn lÊy nót chai ®Ëy l¹i]",
    	"§©y lµ Bi T« Thanh Phong, lo¹i ®éc v« s¾c v« vŞ cña NhÊt PhÈm ®­êng, ai tróng ph¶i trong 12 canh giê kh«ng thÓ cö ®éng. Ta cã c¸ch gi¶i! H·y vµo Tróc Ty ®éng t×m N÷ KiÕm kh¸ch lÊy 10 Mª Hån h­¬ng, t×m thªm, 10 Hoµng liªn, 5 phÇn NhiÔu minh ®Ëu."
    };
    TalkEx("task_38_00_00", szTalk);
end;

function task_38_00_00()
    local szTalk = {
    	"[§éc Si më b×nh ra hİt m¹nh mét c¸i]",
    	"§éc Si tiÒn bèi!",
    	"….",
        "[Xem ra h¾n ta bŞ ®iªn råi, mau gióp t×m thuèc gi¶i th«i]"
    };
    TalkEx("task_38_01", szTalk);
end;

function task_38_01()
    SetTask(TASK_XYTY, 39);
    DelItem(2,0,64,1);
    CreateTrigger(0,526,KILL_XY_NJX);
    Msg2Player("T×m cho §éc Si 10 Mª hån h­¬ng, 10 Hoµng liªn, 5 NhiÔu minh ®Ëu ®Ó chÕ thuèc gi¶i");
    TaskTip("T×m cho §éc Si 10 Mª hån h­¬ng, 10 Hoµng liªn, 5 NhiÔu minh ®Ëu ®Ó chÕ thuèc gi¶i");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao2")		--ÉñÃØ¶¾Ò©2
end;

function task_39_00()
    local szTalk = {
        "….",
        "[Xem ra h¾n ta bŞ ®iªn råi, mau gióp t×m thuèc gi¶i th«i]"
    };
    TalkEx("task_39_01", szTalk);
end;

function task_39_01()
    if GetTrigger(KILL_XY_NJX) == 0 then
        CreateTrigger(0,526,KILL_XY_NJX);
    end;
end;

function task_40_00()
    local szTalk = {
        "….",
    	"§éc Si tiÒn bèi, thuèc gi¶i ®©y!",
    	"[§éc Si dïng sè thuèc b¹n mang ®Õn]",
        "Khô…Khô! Bi T« Thanh Phong qu¶ nhiªn lîi h¹i tay ch©n ta ph¶i qua 12 canh giê míi cã thÓ cö ®éng. LÇn nµy l·o phu s¬ ı ®¸nh gi¸ thÊp lo¹i ®éc d­îc nµy hy väng sÏ t×m ra ph­¬ng thuèc gi¶i ®éc. Ng­¬i thö ®Õn NhÊt PhÈm ®­êng xem ng­êi bá ®éc cã mang thuèc gi¶i kh«ng?"
    };
    local szNot = {
        "….",
    	"§éc Si tiÒn bèi, thuèc gi¶i ®©y!",
    	"[§éc Si dïng sè thuèc b¹n mang ®Õn]",
    	"….",
    	"Xem ra l­îng thuèc gi¶i kh«ng ®ñ."
    };
    if GetItemCount(2,0,65) >= 10 and GetItemCount(1,2,3) >= 10 and GetItemCount(1,3,11) >= 5 then
        TalkEx("task_40_01", szTalk);
    else
        TalkEx("task_39_01", szNot);
    end;
end;

function task_40_01()
    SetTask(TASK_XYTY, 41);
    DelItem(2,0,65,10);
    DelItem(1,2,3,10);
    DelItem(1,3,11,5);
    RemoveTrigger(GetTrigger(KILL_XY_NJX));
    CreateTrigger(0,525,KILL_XY_SD);
    Msg2Player("LÊy ®­îc 5 phÇn thuèc gi¶i tõ Thİch kh¸ch NhÊt PhÈm ®­êng");
    TaskTip("LÊy ®­îc 5 phÇn thuèc gi¶i tõ Thİch kh¸ch NhÊt PhÈm ®­êng");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao3")		--ÉñÃØ¶¾Ò©3
end;

function task_41_00()
    local szTalk = {
        "Ng­êi bá ®éc nhÊt ®Şnh mang theo thuèc gi¶i, ng­¬i thö ®Õn NhÊt PhÈm ®­êng mét chuyÕn xem!"
    };
    TalkEx("task_41_01", szTalk);
end;

function task_41_01()
    if GetTrigger(KILL_XY_SD) == 0 then
        CreateTrigger(0,525,KILL_XY_SD);
    end;
end;

function task_42_00()
    local szTalk = {
        "<sex> t×m ®­îc thuèc gi¶i ch­a?",
    	"§éc Si tiÒn bèi nãi lo¹i ®éc {Bi T« Thanh Phong} v« s¾c v« vŞ, ng­êi nµo tróng ph¶i 12 canh giê sau míi cö ®éng ®­îc. Ngay c¶ tiÒn bèi còng kh«ng cã thuèc gi¶i, t¹i h¹ chØ cã thÓ ®Õn NhÊt PhÈm ®­êng ®¸nh Thİch kh¸ch mang thuèc gi¶i vÒ.",
    	"Lo¹i ®éc lîi h¹i nh­ vËy, nÕu ng­êi T©y H¹ dïng chóng lµm vò khİ th× thËt nguy hiÓm, xem ra ng­¬i ph¶i mau chãng t×m ra thuèc gi¶i.",
        "NÕu dïng ®éc lµm vò khİ th× cÇn ph¶i tİch tr÷ nhiÒu! §Ó t¹i h¹ ®Õn {KiÕm C¸c thôc ®¹o} ph¸ kho tİch tr÷ cña chóng."
    };
    local szNot = {
        "<sex> t×m ®­îc thuèc gi¶i ch­a?",
        "{Bi T« Thanh Phong} lµ lo¹i ®éc bİ truyÒn cña NhÊt PhÈm ®­êng, ngay c¶ §éc Si tiÒn bèi còng kh«ng thÓ gi¶i, t¹i h¹ chØ cã thÓ ®Õn NhÊt PhÈm ®­êng ®¸nh Thİch kh¸ch mang thuèc gi¶i vÒ."
    };
    if GetItemCount(2,0,66) >= 5 then
        TalkEx("task_42_01", szTalk);
    else
        TalkEx("task_41_01", szNot);
    end;
end;

function task_42_01()
    RemoveTrigger(GetTrigger(KILL_XY_SD));
    CreateTrigger(0,527,KILL_XY_DYX);
    SetTask(TASK_XYTY, 43);
    DelItem(2,0,66,5);
    Msg2Player("Ph¸ hñy 5 r­¬ng ®éc d­îc ë KiÕm C¸c thôc ®¹o");
    TaskTip("Ph¸ hñy 5 r­¬ng ®éc d­îc ë KiÕm C¸c thôc ®¹o");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyBJKouzhun,"shenmiduyao4")		--ÉñÃØ¶¾Ò©4
end;

function task_43_00()
    local szTalk = {
        "<sex> ®Õn KiÕm C¸c thôc ®¹o t×m n¬i cÊt giÊu ®éc d­îc ph¸ hñy chóng!"
    };
    TalkEx("task_43_01", szTalk);
end;

function task_43_01()
    if GetTrigger(KILL_XY_DYX) == 0 then
        CreateTrigger(0,527,KILL_XY_DYX);
    end;
end;

function task_44_00()
    local szTalk = {
        "<sex> ®· hãa gi¶i ®­îc cuéc tÊn c«ng cña T©y H¹, Tr­êng Ca M«n chóng ta kh«ng biÕt c¶m kİch ra sao.",
        "Tiªn sinh ®õng véi vui mõng, chuyÖn nµy kh«ng ®¬n gi¶n ®©y lµ vËt t×m ®­îc trong th­¬ng khè T©y H¹.",
        "[Mang c«ng v¨n Liªu Quèc giao cho C«ng T«n Th­]",
        "§óng nh­ <sex> dù ®o¸n cuéc tÊn c«ng lÇn nµy do n­íc Liªu khiªu khİch, hä dïng thñ ®o¹n khuyªn phôc T©y H¹ bao quanh KiÕm C¸c víi ı ®å c«ng ®¸nh thµnh T­¬ng D­¬ng. <sex> gióp ta ®Õn Phôc Ng­u s¬n dß la ®­îc kh«ng?",
        "V·n bèi ®i ngay!"
    };
    TalkEx("task_44_01", szTalk);
end;

function task_44_01()
    SetTask(TASK_XYTY, 45);
    DelItem(2,0,67,1);
    Msg2Player("§Õn Phôc Ng­u s¬n dß la tin tøc");
    TaskTip("§Õn Phôc Ng­u s¬n dß la tin tøc");
    GivePlayerAward("Level_30", "easy", "legs", "Level_33");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan1")		--·üÅ£É½Õ½ÂÒ1
end;

function task_45_00()
    local szTalk = {
        "Xin tha m¹ng!",
    	"Ng­¬i lµ ai? Sao thÊy ta l¹i la to¸ng lªn?",
    	"Kh«ng ph¶i ng­¬i ®Şnh truy giÕt ta µ?",
    	"Ng­¬i vµ ta kh«ng thï kh«ng o¸n, giÕt ng­¬i lµm g×?",
    	"<sex>! TiÓu nh©n vèn lµ n«ng d©n do thu ho¹ch ko tèt nªn cïng mét sè huynh ®Ö lªn Phôc Ng­u s¬n lµm giÆc cá. C«ng viÖc chØ gióp quĞt dän nµo ngê cã ®¸m qu©n sÜ n­íc Liªu Ëp ®Õn, c¸c anh em kh¸c ®· chÕt trong trËn lo¹n chiÕn ®ã riªng tiÓu nh©n may m¾n tho¸t chÕt."
	};
	TalkEx("task_45_00_00", szTalk);
end;

function task_45_00_00()
    local szTalk = {
    	"Qu¶ nhiªn Liªu binh ®· ®Õn. Ng­¬icã thÓ nãi s¬ vÒ t×nh h×nh ë Phôc Ng­u s¬n ®­îc kh«ng?",
    	"ChØ cÇn <sex> gióp tiÓu nh©n giÕt mÊy tªn Liªu binh tr¶ thï cho c¸c huynh ®Ö ta sÏ kh«ng giÊu diÕm bÊt cø chuyÖn g×.",
        "§­îc! §Ó ta gióp mét tay!"
    };
    TalkEx("task_45_01", szTalk);
end;

function task_45_01()
    SetTask(TASK_XYTY, 46);
    CreateTrigger(0,528,KILL_XY_LDB);
    CreateTrigger(0,529,KILL_XY_LQB);
    CreateTrigger(0,530,KILL_XY_LNB);
    SetTask(TASK_XY_TEMP, 0);
    SetTask(TASK_XY_TEMP1, 0);
    SetTask(TASK_XY_TEMP2, 0);
    Msg2Player("GiÕt 15 Liªu ®ao binh, 15 Liªu th­¬ng qu©n, 15 Liªu TiÔn binh");
    TaskTip("GiÕt 15 Liªu ®ao binh, 15 Liªu th­¬ng qu©n, 15 Liªu TiÔn binh");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan2")		--·üÅ£É½Õ½ÂÒ2
end;

function task_46_00()
    local szTalk = {
        "<sex> gióp tiÓu nh©n giÕt mÊy tªn Liªu binh tr¶ thï cho c¸c huynh ®Ö ta sÏ kh«ng giÊu diÕm bÊt cø chuyÖn g×."
    };
    TalkEx("task_46_01", szTalk);
end;

function task_46_01()
    if GetTrigger(KILL_XY_LDB) == 0 and GetTask(TASK_XY_TEMP) == 0 then
        CreateTrigger(0,528,KILL_XY_LDB);
    end;
    if GetTrigger(KILL_XY_LQB) == 0 and GetTask(TASK_XY_TEMP1) == 0 then
        CreateTrigger(0,529,KILL_XY_LQB);
    end;
    if GetTrigger(KILL_XY_LNB) == 0 and GetTask(TASK_XY_TEMP2) == 0 then
        CreateTrigger(0,530,KILL_XY_LNB);
    end;
end;

function task_49_00()
    local szTalk = {
    	"<sex> giÕt ®­îc tªn nµo ch­a?",
    	"Ta ®· gióp ng­êi giÕt mÊy tªn Liªu binh.",
    	"§a t¹ <sex> ®· gióp ®ì! Xin hái <sex> ®· gÆp qua ®¸m cao thñ Tµ t¨ng ch­a?",
    	"Tµ t¨ng nµo?",
    	"Xem c¸ch ¨n mÆc cña hä gièng Tµ t¨ng cña Hoµng gi¸o, cã lÏ tõ bªn T©y H¹ qua. Võa n·y hä niÖm chó lªn ng­êi mÊy huynh ®Ö. <sex> ra tay cøu hä ®­îc kh«ng?",
        "T¨ng nh©n T©y H¹ ®Õn quÊy rèi n÷a µ? ë ®©y c¸ch {Vâ §ang} kh«ng xa ®Ó ta t×m {Tö H¹c Ch©n Nh©n} xem cã kÕ s¸ch g× kh«ng?"
    };
    TalkEx("task_49_01", szTalk);
end;

function task_49_01()
    SetTask(TASK_XYTY, 50);
    Msg2Player("T×m Tö H¹c Ch©n Nh©n nghÜ c¸ch");
    TaskTip("T×m Tö H¹c Ch©n Nh©n nghÜ c¸ch");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan3")		--·üÅ£É½Õ½ÂÒ3
end;

function task_50_00()
    local szTalk = {
        "Sao ng­¬i u sÇu vËy?",
    	"Kh«ng giÊu ch©n nh©n Liªu binh ®ang tËp kÕt ë Phôc Ng­u s¬n ı ®å c«ng ®¸nh KiÕm M«n Quan ®o¹t lÊy T­¬ng D­¬ng, bªn ®ã cã nhiÒu Tµ t¨ng trî gióp, hä dïng bïa chó h¹i ng­êi, t¹i h¹ ®Õn xem ng­êi cã c¸ch ph¸ gi¶i kh«ng?",
        "Thiªn Nh·n Chu mµu tr¾ng t­¬ng øng víi Tøc ph¸p, Thiªn Nh·n Chu mµu ®en t­¬ng øng víi Chu ph¸p, Thiªn Nh·n Chu mµu vµng t­¬ng øng víi T¨ng ph¸p, Thiªn Nh·n Chu mµu ®á t­¬ng øng víi Hoµi ph¸p, T¨ng nh©n T©y H¹ dïng Chu ph¸p tÊt nhiªn hä sÏ mang theo Thiªn Nh·n Chu, ng­¬i t×m mét İt vÒ nhí thu thËp thªm H¾c KhuyÓn Linh huyÕt, ta sÏ cã c¸ch."
    };
    TalkEx("task_50_01", szTalk);
end;

function task_50_01()
    SetTask(TASK_XYTY, 51);
    CreateTrigger(0,531,KILL_XY_XS);
    Msg2Player("T×m 10 Thiªn Nh·n Chu, 5 H¾c KhuyÓn Linh huyÕt");
    TaskTip("T×m 10 Thiªn Nh·n Chu, 5 H¾c KhuyÓn Linh huyÕt");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan4")		--·üÅ£É½Õ½ÂÒ4
end;

function task_51_00()
    local szTalk = {
        "Thiªn Nh·n Chu mµu tr¾ng t­¬ng øng víi Tøc ph¸p, Thiªn Nh·n Chu mµu ®en t­¬ng øng víi Chu ph¸p, Thiªn Nh·n Chu mµu vµng t­¬ng øng víi T¨ng ph¸p, Thiªn Nh·n Chu mµu ®á t­¬ng øng víi Hoµi ph¸p, T¨ng nh©n T©y H¹ dïng Chu ph¸p tÊt nhiªn hä sÏ mang theo Thiªn Nh·n Chu, ng­¬i t×m mét İt vÒ nhí thu thËp thªm H¾c KhuyÓn Linh huyÕt, ta sÏ cã c¸ch."
    }
    TalkEx("task_51_01", szTalk);
end;

function task_51_01()
    if GetTrigger(KILL_XY_XS) == 0 then
        CreateTrigger(0,531,KILL_XY_XS);
    end;
end;

function task_52_00()
    local szTalk = {
        "T×m ®­îc kh«ng?",
    	"TiÒn bèi xem qua!",
    	"Ng­¬i ®îi ta mét l¸t.",
    	"[Tö H¹c Ch©n Nh©n cÇm vËt phÈm trong tay niÖm chó]",
    	"§©y lµ Thiªn Linh Ph¸ Tµ Chu, ng­¬i ®em cho h¾n uèng lµ cã thÓ gi¶i trõ tµ ma.",
        "§a t¹ ch©n nh©n ®Ó t¹i h¹ mang vÒ cho h¾n."
    };
    local szNot = {
        "T×m ®­îc kh«ng?",
    	"V·n bèi cÇn chót thêi gian!"
    };
    if GetItemCount(2,0,68) >= 10 and GetItemCount(2,2,33) >= 5 then
        TalkEx("task_52_01", szTalk);
    else
        TalkEx("task_51_01",szNot);
    end;
end;

function task_52_01()
    RemoveTrigger(GetTrigger(KILL_XY_XS));
    DelItem(2,0,68,10);
    DelItem(2,2,33,5);
    AddItem(2,0,211,1);   --ÌìÁéÆÆĞ°Öé
    SetTask(TASK_XYTY, 53);
    Msg2Player("§em Thiªn Linh Ph¸ Tµ Ch©u cho L¹c Ph¸ch S¬n tÆc");
    TaskTip("§em Thiªn Linh Ph¸ Tµ Ch©u cho L¹c Ph¸ch S¬n tÆc");
    GivePlayerAward("Level_32", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushanzhanluan5")		--·üÅ£É½Õ½ÂÒ5
end;

function task_53_00()
    local szTalk = {
        "<sex> vÒ råi ­? Huynh ®Ö cña ta xem nh­ ®­îc cøu råi.",
    	"Tiªn ®¬n ®©y mau ®­a cho huynh ®Ö ng­¬i.",
    	"[L¹c Ph¸ch S¬n tÆc uèng thuèc]",
    	"§¹i ¬n ®¹i ®øc cña <sex> kh«ng biÕt lÊy g× ®Òn ®¸p, lóc n·y tiÓu nh©n nghe ®¸m Tµ t¨ng cã nh¾c bµy bè trËn ph¸p trong KiÕm M«n Quan, ®¹i nh©n nhí thËn träng! §©y cã tÊm b¶n ®å Phôc Ng­u s¬n vµ t×nh h×nh binh lùc qu©n Liªu tÆng ®¹i nh©n xem nh­ ®Òn ¬n cøu m¹ng.",
        "§a t¹ ng­¬i! HÑn ngµy gÆp l¹i!"
    };
    TalkEx("task_53_01", szTalk);
end;

function task_53_01()
    SetTask(TASK_XYTY, 54);
    DelItem(2,0,211,1);   --ÌìÁéÆÆĞ°Öé
    AddItem(2,0,69,1);
    Msg2Player("Mang b¶n ®å cho C«ng T«n Th­");
    TaskTip("Mang b¶n ®å cho C«ng T«n Th­");
    GivePlayerAward("Level_32", "hard", "trinket", "Level_35");
	GivePlayerExp(SkeyBJKouzhun,"bingfenlianglu")		--±ø·ÖÁ½Â·
end;

function task_54_00()
    local szTalk = {
        "<sex> dß la ®­îc g× kh«ng?",
    	"Binh lùc qu©n Liªu ®Òu ph©n bè trªn tÊm b¶n ®å, tiÓn bèi xem qua! Ngoµi ra cßn mét sè Tµ t¨ng dïng trËn ph¸p ı ®å c«ng ®¸nh KiÕm M«n Quan.",
    	"[C«ng T«n Th­ xem qua b¶n ®å]",
    	"Xem ra n­íc Liªu vµ T©y H¹ ®· chuÈn bŞ s½n nh­ng tr­íc giê tµ kh«ng thÓ th¾ng ch¸nh, theo ı ta nÕu ®Ó mèi quan hÖ hä v÷ng ch¾c th× khã mµ c«ng ph¸.",
    	"Ta ph¶i lµm sao ®©y?",
    	"ChØ cßn c¸ch chia binh hai ®­êng cïng tiÕn ®¸nh. ChuyÖn nµy cÇn ph¶i bµn b¹c kü! Ng­¬i mau t×m Tæng binh T­¬ng D­¬ng th­¬ng thuyÕt tiÕn ®¸nh doanh tr¹i Liªu qu©n tr­íc. Cßn vÒ trËn ph¸p ph¶i nhê Tö H¹c Ch©n Nh©n chØ c¸ch ph¸ gi¶i. <sex> xin h·y lËp tøc lªn ®­êng!",
        "T¹i h¹ ®i ngay!"
    };
    TalkEx("task_54_01", szTalk);
end;

function task_54_01()
    DelItem(2,0,69,1);
    SetTask(TASK_XY_ONE, 1);    --ÏåÑôÈÎÎñ·ÖÖ§Ò»£¬´ú±íÕÒ¿¤ÊØ
    SetTask(TASK_XY_TWO, 1);    --ÏåÑôÈÎÎñ·ÖÖ§¶ş£¬´ú±íÕÒ×Ïº×ÕæÈË
    SetTask(TASK_XYTY, 55);
end;

-------------------------------ÏåÑôÈÎÎñ·ÖÖ§ÈÎÎñ--------------------

function two_01_00()
    local szTalk = {
        "Ng­¬i ph¸ gi¶i bïa chó ch­a?",
        "May nhê tiÒn bèi chØ gi¸o, bïa chó ®· hãa gi¶i nh­ng Tµ t¨ng T©y H¹ l¹i dïng trËn ph¸p c«ng ®¸nh KiÕm M«n Quan, xin tiÒn bèi nghÜ c¸ch.",
        "Hõm! Bän chóng d¸m dïng ph¸p thuËt ®å s¸t sinh linh, ng­¬i mau gióp ta t×m 10 HuyÒn H¹c linh huyÕt, 10 Bİch HuyÕt sa ta sÏ cã c¸ch ph¸ gi¶i."
    };
    TalkEx("two_01_01", szTalk);
end;

function two_01_01()
    SetTask(TASK_XY_TWO, 2);
    Msg2Player("T×m 10 HuyÒn H¹c Linh huyÕt, 10 Bİch HuyÕt sa cho Tö H¹c Ch©n Nh©n");
    TaskTip("T×m 10 HuyÒn H¹c Linh huyÕt, 10 Bİch HuyÕt sa cho Tö H¹c Ch©n Nh©n");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushandoufa1")		--·üÅ£É½¶··¨1
end;

function two_02_00()
    local szTalk = {
        "T×m ®­îc råi ­?",
        "§· chuÈn bŞ ®ñ!",
        "[Tö H¹c Ch©n Nh©n lÊy mét chiÕc b×nh b»ng ®ång bá thuèc vµo trong niÖm chó]",
        "Ta ®· chuÈn bŞ Ph¸ Chó thñy chØ cÇn ng­¬i dïng chóng t­íi vµo ng­êi chñ tr× trËn ph¸p lµ ®­îc.",
        "Cã c¸ch hãa gi¶i råi!",
        "TrËn ph¸p bè trİ xong sÏ cã Vâ t¨ng hé gi¸, ng­¬i ph¶i hÕt søc cÈn thËn!"
    };
    local szNot = {
        "T×m ®­îc råi ­?",
        "V·n bèi vÉn ch­a t×m ®ñ!"
    };
    if GetItemCount(2,2,35) >= 10 and GetItemCount(2,2,32) >= 10 then
        TalkEx("two_02_01", szTalk);
    else
        TalkEx("", szNot);
    end;
end;

function two_02_01()
    SetTask(TASK_XY_TWO, 3);
    AddItem(2,0,210,3);
    DelItem(2,2,35,10);
    DelItem(2,2,32,10);
    --CreateTrigger(0,532,KILL_XY_ZS);
    Msg2Player("Mang Ph¸ Chó thñy tiªu diÖt 3 Ph¸p S­ T©y H¹");
    TaskTip("Mang Ph¸ Chó thñy tiªu diÖt 3 Ph¸p S­ T©y H¹");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyBJKouzhun,"funiushandoufa2")		--·üÅ£É½¶··¨2
end;

function two_03_00()
	if GetTask(TASK_XY_TWO_ONE) < 0 or GetTask(TASK_XY_TWO_ONE) > 3 then
		SetTask(TASK_XY_TWO_ONE, 0)
	end
	
    local szTalk = {
        "Xem khİ s¾c <sex> kh«ng ®­îc tèt, cã ph¶i bŞ Ph¸p S­ T©y H¹ ®¶ th­¬ng?",
        "T¹i h¹ kh«ng sao nh­ng ph¶i cÇn thªm Ph¸ Chó thñy míi cã thÓ hãa gi¶i trËn ph¸p.",
        "ë ®©y cßn mÊy b×nh, ng­¬i cÇm lÊy ®i!"
    };
    local szNormal = {
        "<sex> chØ cÇn ®¸nh ng­êi chñ tr× trËn ph¸p dïng Ph¸ Chó thñy t­íi lªn ng­êi hä lµ ®­îc."
    };
    if GetItemCount(2,0,210) < 3 then
        TalkEx("two_03_01", szTalk);
    else
        TalkEx("", szNormal);
    end;
end;

function two_03_01()
    AddItem(2,0,210,3);
end;
-------------------------------------------ÏåÑôÖ÷Ïß------------------------------------

function task_56_00()
    local szTalk = {
        "<sex> ®· ®Èy lui ®­îc binh lİnh n­íc Liªu vµ T©y H¹ ®óng lµ phóc cña mu«n d©n.",
        "Tiªn sinh qu¸ lêi, trõ gian diÖt b¹o lµ bæn phËn cña t¹i h¹.",
        "Kh¸ l¾m! <sex> qu¶ cã khİ ph¸ch hiÖp kh¸ch, mç ®©y rÊt muèn kÕt giao mét ng­êi nh­ vËy. <sex> cßn ph¸t hiÖn g× thªm ë Phôc Ng­u s¬n kh«ng?",
        "T¹i h¹ ph¸t hiÖn mËt hµm b¸o cho tiÒn tuyÕn {NhÊt PhÈm ®­êng} vµ {Thiªn ¢m gi¸o}, bän hä v× chuyÖn {m¶nh S¬n Hµ X· T¾c} ®Õn Phôc Ng­u s¬n.",
        "NÕu ®· vËy <sex> ®ång ı ®Õn Phôc Ng­u s¬n dß la thªm mét lÇn kh«ng? Kh«ng chõng biÕt ®­îc tung tİch cña b¶n ®å S¬n Hµ X· T¾c."
    };
    TalkEx("task_56_01", szTalk);
end;

function task_56_01()
    DelItem(2,0,71,1);
    DelItem(2,0,72,1);
    SetTask(TASK_XYTY, 57);
    Msg2Player("§Õn Phôc Ng­u s¬n t×m L¹c Ph¸ch S¬n tÆc hái th¨m");
    TaskTip("§Õn Phôc Ng­u s¬n t×m L¹c Ph¸ch S¬n tÆc hái th¨m");
    GivePlayerAward("Level_32", "hell", "trinket", "Level_40");
    GivePlayerAward("Level_36", "hell", "legs", "Level_41");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe11")		--Áú»¢ÍÌÉ½ºÓ11
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe12")		--Áú»¢ÍÌÉ½ºÓ12
end;

function task_57_00()
    local szTalk = {
        "¢n nh©n t×m ta cã chuyÖn g×?",
        "Ng­¬i cã nghe qua m¶nh b¶n ®å S¬n Hµ X· T¾c ch­a?",
        "(Suy nghÜ), nhí ra råi ®ã lµ mãn b¶o bèi cña tr¹i chñ ta. Tõ lóc cã nã «ng ta tá th¸i ®é nãng n¶y víi c¸c huynh ®Ö, th­êng la m¾ng ®¸nh ®Ëp. H¬n n÷a b¶n ®å xuÊt hiÖn Liªu binh vµ T¨ng nh©n T©y H¹ còng kĞo ®Õn, xem ra ®©y kh«ng ph¶i vËt c¸t t­êng.",
        "Tr¹i chñ cña ng­¬i hiÖn giê ë ®©u?",
        "Nghe nãi tr¹i chñ ®ang trèn trong Long Hæ ®éng, ®¹i nh©n thö ®Õn ®ã t×m xem!"
    };
    TalkEx("task_57_01", szTalk);
end;

function task_57_01()
    SetTask(TASK_XYTY, 58);
    GivePlayerAward("Level_40", "easy");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe2")		--Áú»¢ÍÌÉ½ºÓ2
end;

function task_59_00()
    local szTalk = {
        "<sex> t×m ra tung tİch m¶nh S¬n Hµ X· T¾c ch­a?",
        "M¶nh S¬n Hµ X· T¾c ban ®Çu do §Çu lÜnh S¬n tÆc n¾m gi÷. T¹i h¹ t×m ®­îc trªn ng­êi h¾n bøc mËt hµm cña {L­¬ng S¬n}!",
        "[C«ng T«n Th­ xem qua bøc mËt hµm]",
        --"¹«ËïÊé£ºÆæ¹ÖÁË£¬´ÓÕâĞÅÉÏ¿´£¬ËÆºõÊÇÁºÉ½µÄ{ËÎ½­}ÇëËûÀ´Ñ°ÕÒÉ½ºÓÉçğ¢Í¼ËéÆ¬¡£ÎÒËØÎÅÕâËÎ½­ÌåĞô°ÙĞÕ¡¢ÈÊÒåÎªÏÈ£¬ÊÇ¸ö·Ç³£ÕıÖ±µÄÈË¡£¶øË®²´ÁºÉ½°Ë°ÙÀï£¬±ø¶à½«ÓÂ£¬Îï²úÒ²ÆÄÎª·áºñ¡£ËûÎªºÎÒ²ÒªÌ°Í¼ÕâÉ½ºÓÉçğ¢Í¼ÄØ£¿ÎÒ¿´<sex>²»·ÁÕÒÈË´òÌ½´òÌ½ÏûÏ¢£¬Èç¹ûÓĞºÎ½øÕ¹£¬»¹ÇëÀ´Í¨ÖªÀÏ·ò¡£"
        "Ta t¹m thêi gi÷ l¹i bøc th­. <sex> cè g¾ng thªm."
    };
    TalkEx("task_59_01", szTalk);
end;

function task_59_01()
    --SetTask(TASK_XYTY, 60);
    SetTask(TASK_XYTY, 61); --ÔİÊ±Ïû³ıÈÎÎñÃæ°å£¬Ã»ÓĞºóĞøÈÎÎñ
    DelItem(2,0,73,1);
    GivePlayerAward("Level_40", "hell", "chest", "Level_45");
	GivePlayerExp(SkeyBJKouzhun,"hutunshanhe3")		--Áú»¢ÍÌÉ½ºÓ3
end;

function task_61_00()
    local szTalk = {
        "<sex> cè g¾ng thªm."
    };
    TalkEx("", szTalk);
end;
