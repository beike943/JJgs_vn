-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí40,50ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2006/01/06 PM 17:37

--ÒÒÓÏÄê Îì×ÓÔÂ Îì×ÓÈÕ 
--ÒË: ºÏÕÊ ²ÃÒÂ ½ÌÅ£Âí âÅÊÂÎğÈ¡ 
--¼É: ÈëÕ¬ ¶¯ÍÁ ÆÆÍÁ ¼ŞÈ¢ ×÷Ôî Ôì´¬ 
--¼ªÉñÒËÇ÷: ¹ÙÈÕ ¾´°² ½ğØÑ  
--Ğ×ÉñÒË¼É: ÔÂ½¨ Ğ¡Ê± ÍÁ¸® ÔÂÑá µØ»ğ  
--ÎåĞĞ: Åùö¨»ğ  ½¨Ö´Î»  
--Åí×æ°Ù¼É: Îì²»ÊÜÌïÌïÖ÷²»Ïé ×Ó²»ÎÊ²·×ÔÈÇ»öÑê 

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--ÁìÈ¡ÈÎÎñÇ°ÍùÕ¯×Ó¸½½ü´òµ¹ÃçÁëÓÂÊ¿
function task_000_00()
	
local strTalk = {
	"Ng­¬i lµ ai? T×m ta cã viÖc g×?",
	"Cao Quèc C«ng ph¸i thuéc h¹ ®Õn hái th¨m vÒ t×nh h×nh cña {Xi Háa gi¸o}.",
	"Ta biÕt rÊt râ vÒ gi¸o ph¸i nµy! Nh­ng xem ng­¬i cã b¶n lÜnh g× ®·! NÕu th¾ng ®­îc Miªu LÜnh ®Ö nhÊt dòng sÜ ë ®©y ta sÏ nãi cho ng­¬i nghe!",
	"T¹i h¹ ®i ngay!",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,3);
	TaskTip("§Õn Miªu LÜnh tr¹i ®¸nh b¹i Miªu LÜnh Dòng sÜ (165.187)!");
	Msg2Player("§Õn Miªu LÜnh tr¹i ®¸nh b¹i Miªu LÜnh Dòng sÜ (165.187)!");
	GivePlayerExp(SkeyDali,"miaolingzuren")
	return
end

--Î´´òµ¹ÃçÁëÓÂÊ¿
function task_001_00()

local strTalk = {
	"Miªu LÜnh Dòng SÜ ë gÇn Miªu LÜnh tr¹i.",
	}
	TalkEx("",strTalk);
	return
end

--ÒÑ´òµ¹ÃçÁëÓÂÊ¿
function task_002_00()

local strTalk = {
	"Qu¶ lµ cã b¶n lÜnh. Ng­¬i cÇn g×, nãi mau lªn!",
	"{Xi Háa gi¸o} rèt cuéc lµ gi¸o ph¸i nµo? T¹i sao l¹i ph¶n lo¹n nh­ vËy?",
	"Ph¶n lo¹n? Ta kh«ng nghÜ vËy. Xi Háa gi¸o t«n thê ®¹i thÇn Xi V­u nªn con ch¸u Viªm _Hoµng nh­ c¸c ng­¬i ®Òu kh«ng mÊy thiÖn c¶m, song nguyªn t¾c cña Xi Háa gi¸o còng rÊt nghiªm kh¾c. LÇn nµy Xi Háa gi¸o ph¶n lo¹n lµ muèn lËt ®æ hoµng ®Õ, lËp l¹i mét ®Õ chÕ.",
	"…………",
	"Ng­¬i cßn g× ®Ó hái n÷a kh«ng?",
	"(Hay lµ quay l¹i t×m {TriÖu Diªn Niªn}) (NghÜ thÇm)",
	}
	TalkEx("",strTalk);
	CreateTrigger(4,200,TALK_DL_ZHAOYANNIAN);--ÕÔÑÓÄêÎ÷ÄÏÇøÈÎÎñ¶Ô»°´¥·¢Æ÷
	Msg2Player("Quay vÒ BiÖn Kinh gÆp TriÖu Diªn Niªn");
	TaskTip("Quay vÒ BiÖn Kinh gÆp TriÖu Diªn Niªn");
	SetTask(TASK_DL_LV40_ID,5);
	GivePlayerAward("Level_40","xn_step_3");
	GivePlayerExp(SkeyDali,"miaolingyongshi")
	return
end

--ÉĞÎ´ÏòÕÔÑÓÄê»ã±¨
function task_003_00()

local strTalk = {
	"Ng­¬i cßn g× ®Ó hái n÷a kh«ng?",
	"(Hay lµ quay l¹i t×m {TriÖu Diªn Niªn}) (NghÜ thÇm)"
	}
	TalkEx("",strTalk);
	if GetTrigger(Talk_DL_ZHAOYANNIAN) == 0 then
		CreateTrigger(4,200,TALK_DL_ZHAOYANNIAN);--ÕÔÑÓÄêÎ÷ÄÏÇøÈÎÎñ¶Ô»°´¥·¢Æ÷
		Msg2Player("Quay vÒ BiÖn Kinh gÆp TriÖu Diªn Niªn");
		TaskTip("Quay vÒ BiÖn Kinh gÆp TriÖu Diªn Niªn");
	end;
	return
end


--ºÍ³ÂÁ¢ºâ¶Ô»°ºóºÍÃçÁë×å³¤¶Ô»°
function task_004_00()

local strTalk = {
	"Ch¼ng ph¶i lÇn tr­íc ng­¬i ®· ®¸nh b¹i Miªu LÜnh Dòng SÜ råi ®ã sao, sao cßn quay l¹i?",
	"LÇn tr­íc do véi qu¸ nªn cã nhiÒu viÖc ch­a kŞp hái téc tr­ëng, lÇn nµy quay l¹i muèn nghe téc tr­ëng nãi râ h¬n vÒ t×nh h×nh cña {Xi Háa gi¸o}.",
	"L¹i hái vÒ Xi Háa gi¸o? §­îc th«i, nh­ng tr­íc tiªn ng­¬i ph¶i gióp ta vµi viÖc ®·.",
	"Thuéc h¹ s½n sµng!",
	"Tr­íc ®©y mÊy ngµy bän Thæ Ty ®Õn ®©y lµm lo¹n, chóng ®· c­íp mÊt Miªu LÜnh lÖnh bµi cña ta. Ng­¬i mau ®Õn YÕn Tö ®éng tÇng 2 ®¸nh b¹i tªn ®Çu lÜnh ®em lÖnh bµi vÒ ®©y.",
	"Thuéc h¹ ®i ngay!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,4);
	Msg2Player("§Õn YÒn Tö ®éng tÇng 2 ®¸nh bµi tªn ®Çu lÜnh lÊy Miªu LÜnh lÖnh bµi");
	TaskTip("§Õn YÒn Tö ®éng tÇng 2 ®¸nh bµi tªn ®Çu lÜnh lÊy Miªu LÜnh lÖnh bµi");
	GivePlayerAward("Level_50","xn_step_2");
	GivePlayerExp(SkeyDali,"chihuojiao")
end

--Î´´òµ¹ÃçÁëÊ×ÁìºÍÃçÁë×å³¤¶Ô»°
function task_005_00()

local strTalk = {
	"§Õn YÕn Tö ®éng tÇng 2 ®¸nh b¹i tªn ®Çu lÜnh lÊy lÖnh bµi.",
	}

	TalkEx("",strTalk);
	return
end

--´òµ¹ÃçÁëÊ×ÁìºÍÃçÁë×å³¤¶Ô»°1
function task_006_00()

local strTalk = {
	"§©y cã ph¶i lµ {lÖnh bµi}?",
	"Ng­¬i qu¶ lµ rÊt cã b¶n lÜnh, cã viÖc g× mau hái ®i!",
	"LÇn tr­íc téc tr­ëng cã nh¾c ®Õn {Xi Háa gi¸o} muèn lËt ®æ {hoµng ®Õ}. Cã ph¶i v× {Xi Háa gi¸o} lµ {¤ Man} cßn hoµng ®Õ thuéc {B¹ch Téc} kh«ng?",
	"Cã nh÷ng chuyÖn ng­¬i kh«ng nªn t×m hiÓu kü l¾m.",
	"Bëi thuéc h¹ nghe nãi {¤ Man} vµ {B¹ch Téc} ®èi lËp nhau, mµ hoµng ®Õ l¹i thuéc B¹ch Téc.",
	"§¹i Lı do B¹ch Téc kiÕn lËp nªn, nh­ng §oµn T­ B×nh vŞ hoµng ®Õ khai quèc l¹i mang dßng m¸u cña c¶ hai bé téc. V× vËy Xi Háa gi¸o kh«ng v× chuyÖn ®èi lËp nµy mµ t¸c lo¹n ®­îc.",
	}
	TalkEx("task_006_01",strTalk);
end

--´òµ¹ÃçÁëÊ×ÁìºÍÃçÁë×å³¤¶Ô»°2
function task_006_01()

local strTalk = {	
	"Cã chuyÖn nµy ­? VËy sao {Xi Háa gi¸o} cø muèn lËt ®æ hoµng ®Õ?",
	"Kh«ng ph¶i lµ lËt ®æ mµ ng­îc l¹i cßn ñng hé.",
	"ChuyÖn nµy lµ sao?",
	"Ng­¬i ®Õn §¹i Lı t×m Cao qu¶n hái th× kh¾c biÕt.",
	"§a t¹ téc tr­ëng.",
	"(NghÜ thÇm) (Xem ra l·o còng ch¼ng biÕt thªm g× n÷a råi, ph¶i vÒ hái {TrŞnh c« n­¬ng th«i}).",
	}
	TalkEx("",strTalk);
	DelItem(2,0,370,1);
	SetTask(TASK_DL_LV50_ID,6);
	Msg2Player("Quay vÒ §¹i Lı t×m TrŞnh Qu¸n Chi.");
	TaskTip("Quay vÒ §¹i Lı t×m TrŞnh Qu¸n Chi.");
	GivePlayerAward("Level_50","xn_step_3");
	GivePlayerExp(SkeyDali,"miaolinglingpai")
	return
end

--Î´ÓëÖ£¹áÖ®¶Ô»°
function task_007_00()

local strTalk = {
	"Ta chØ biÕt cã bÊy nhiªu ®ã th«i, ng­¬i ®i t×m ng­êi kh¸c hái ®i.",
	}

	TalkEx("",strTalk);
	return
end

--·ÖÖ§ÈÎÎñ£º²»ÏéÈË
function task_100_00()

local strSay = {
	"Méng ca ¬i lµ Méng ca, sao huynh nì g¹t muéi nh­ vËy. A Ch©u nµy cã lµm g× ®¸ng téi chí.",
	"ChuyÖn g× x¶y ra víi c« n­¬ng vËy?/task_101_00",
	"Hic, hic… Ta sinh ra trªn ®êi nµy ®Ó lµm g× chø?/task_exit"
	}
	SelectSay(strSay);
end
	
--ÁìÈ¡²»ÏéÈËÈÎÎñ1
function task_101_00()

local strTalk = {
	"Ta vèn kh«ng ph¶i ng­êi vïng nµy, do lo¹n l¹c nªn míi l­u l¹c ®Õn ®©y. Kh«ng may lóc ®ã trong lµng cã trËn ®¹i dŞch, mäi ng­êi cho ta lµ mÇm mèng g©y nªn ®¹i häa…",
	"VËy cßn Méng ca?",
	"Trong lµng ai còng xa l¸nh, chØ cã Méng ca lµ ng­êi hiÓu vµ an ñi ta. ThÕ råi gi÷a ta vµ huynh Êy n¶y sinh t×nh c¶m, nh­ng th©n phô huynh Êy ph¶n ®èi kŞch liÖt, kh«ng cßn c¸ch nµo h¬n, ta vµ huynh ©y dù ®Şnh bá trèn.",
	"Sau ®ã thÕ nµo?",
	"Tr­íc ®ã 3 ngµy huynh Êy hÑn ta d­íi ch©n nói Vò L¨ng s¬n ®Ó cïng trèn ®i, nh­ng ta ®îi m·i, ®îi m·i… còng kh«ng thÊy ®Õn. Ta nghÜ huynh Êy ®· thay ®æi chñ ı råi."
}
	TalkEx("task_101_01",strTalk);
end

--ÁìÈ¡²»ÏéÈËÈÎÎñ2
function task_101_01()

local strTalk = {
	"A Ch©u ta thËt lµ bÊt h¹nh…!",
	"C« n­¬ng ®õng qu¸ ®au lßng, ®Ó ta ®Õn gÆp Méng ca hái nguyªn nh©n ra sao.",
	"Méng ca ë phñ ®«ng §¹i Lı, mÉu th©n huynh Êy lµ TriÖu N­¬ng.",
	"C« n­¬ng ®õng qu¸ ®au lßng, ®Ó ta ®Õn §¹i Lı gÆp TriÖu N­¬ng hái xem."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,1);
	Msg2Player("§Õn §¹i Lı gÆp TriÖu N­¬ng.");
	TaskTip("§Õn §¹i Lı gÆp TriÖu N­¬ng.");
end	

--Î´ÓëÕÔÄï¶Ô»°
function task_102_00()

local strTalk = {
	"Méng ca ë phñ ®«ng §¹i Lı, v« cïng c¶m ¬n <sex>."
}
	TalkEx("",strTalk);
end

--ÓëÕÔÄï¶Ô»°Ñ¯ÎÊÃÉ¸çÏÂÂä
function task_103_00()

local strTalk = {
	"C¸i ¶ a ®Çu ®ã ®· lµm cho A Méng nhµ ta dë dë ®iªn ®iªn, hiÖn giê nã ë ®©u ta còng kh«ng biÕt n÷a.",
	"Cã ph¶i mÉu th©n cña Méng ca?",
	"<sex> cã tin tøc cña Méng ca µ?",
	"LÏ nµo Méng ca ch­a vÒ nhµ?",
	"Cã lÏ nã ®· ®i theo a ®Çu ®ã råi…®¸ng th­¬ng cho Méng ca…!",
	"(Ph¶i lËp tøc quay l¹i b¸o cho A Ch©u)"
}
  TalkEx("",strTalk);
  SetTask(TASK_DL_LV40_ZX_ID,2);
	Msg2Player("B¸o cho A Ch©u Méng ca vÉn ch­a vÒ nhµ.");
	TaskTip("B¸o cho A Ch©u Méng ca vÉn ch­a vÒ nhµ.");
end

--Î´»Ø±¨°¢ÖìÊ±ÓëÕÔÄï¶Ô»°
function task_104_00()

local strTalk = {
	"(Ph¶i lËp tøc quay l¹i b¸o cho A Ch©u)"
}
	TalkEx("",strTalk);
end

--ÓëÕÔÄï¶Ô»°ºó»Ø±¨°¢Öì
function task_105_00()

local strTalk = {
	"<sex> vÒ råi ­? Ta ®· quyÕt ®inh rêi khái n¬i nµy…",
	"Ta tõ chç TriÖu N­¬ng vÒ ®©y, Méng ca kh«ng thÊy vÒ nhµ.",
	"Sao? Huynh Êy vÉn kh«ng vÒ nhµ? Ta ph¶i lµm sao ®©y?",
	"C« n­¬ng ®õng qu¸ xóc ®éng, h·y kÓ l¹i buæi hÑn h«m ®ã ta sÏ cã c¸ch gióp c« n­¬ng.",
	"Tr­íc ®ã 3 ngµy, huynh Êy hÑn ta ®Õn ch©n nói Vò L¨ng ®îi trêi tèi råi cïng bá trèn.",
	"§Ó ta ®Õn {ch©n nói Vò L¨ng} hái t×nh h×nh cña Méng ca.",
	"§a t¹ <sex>, nÕu Méng ca ®· thay ®æi ı ®Şnh bá trèn còng kh«ng sao, ta chØ mong cho huynh Êy b×nh an.",
	"C« n­¬ng yªn t©m, ta sÏ mau ®i chãng vÒ."
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,3);
	Msg2Player("§Õn ch©n nói Vò L¨ng hái th¨m tin tøc Méng ca.");
	TaskTip("§Õn ch©n nói Vò L¨ng hái th¨m tin tøc Méng ca.");
end

--Î´µ½ÎäÁëÉ½½Å²éÌ½ÃÉ¸çÏÂÂäÇ°
function task_106_00()

local strTalk = {
	"Lµ A Ch©u kh«ng tèt…hu hu…"
}
	TalkEx("",strTalk);
end

--ÓëÎäÁêÉ½½Å²ÉÒ©ÈË¶Ô»°
function task_107_00()

local strTalk = {
	"Bän gi¸o ®å cña xi Háa gi¸o ngµy cµng t¸c lo¹n, ngay c¶ ®Õn c©y cá còng ph¶i khiÕp sî.",
	",§¹i thóc cho hái 3 ngµy tr­íc cã thÊy ng­êi thiÕu niªn nµo kho¶ng 25, 26 tuæi, d¸ng cao qua ®©y kh«ng?",
	"3 ngµy tr­íc? Kho¶ng 25, 26 tuæi?",
	"Tr­íc ®©y mÊy ngµy ta cã thÊy mét ng­êi bŞ gi¸o ®å cña Xi Háa gi¸o b¾t ®i. Bän chóng qu¸ hung d÷ ta còng kh«ng d¸m nh×n râ n÷a.",
	"VËy hiÖn giê bän chóng ë ®©u?",
	"Bän chóng ë trªn nói, nh­ng nÕu kh«ng cã g× th× tèt nhÊt ®õng va vµo chóng.",
	"§a t¹ ®¹i thóc.",
	"§õng kh¸ch s¸o!"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,4);
	Msg2Player("§Õn vò L¨ng s¬n t×m tung tİch cña Méng ca.");
	TaskTip("§Õn vò L¨ng s¬n t×m tung tİch cña Méng ca.");
end

--ÓëÎäÁêÉ½ò¿»ğ½ÌÍ½¶Ô»°
function task_108_00()

local strTalk = {
	"Lêi cña tiÓu tö nµy nãi kh«ng biÕt cã ®¸ng tin kh«ng, h¾n nãi ®Õn ®©y ®Ó ®îi mét ng­êi.",
	"VËy µ?",
	"TiÓu tö cã ph¶i chóng muèn nh¾c ®Õn Méng ca?",
	"Trêi! L¹i thªm mét tªn n÷a ®Õn! Ta chÕt mÊt th«i!!",
	"Huynh ®Ö, x«ng lªn!"
	}
local nMapID,nXpos,nYpos = GetWorldPos();
	
	TalkEx("",strTalk);
	CreateNpc("Xi Háa §ao Kh¸ch","Xi Háa §ao Kh¸ch",nMapID,nXpos,nYpos,-1,30,2);
	CreateTrigger(0,265,KILL_DL_CHIHUO_DAOKE);
	Msg2Player("§¸nh b¹i 10 tªn Xi Háa ®ao kh¸ch");
	TaskTip("§¸nh b¹i 10 tªn Xi Háa ®ao kh¸ch");
end

--Î´´ò°Ü10¸öò¿»ğµ¶¿Í,²¹Áìò¿»ğµ¶¿ÍËÀÍö´¥·¢Æ÷
function task_109_00()

local strTalk = {
	"Tªn kia lµ ai?",
	"Huynh ®Ö, x«ng lªn!"
	};

	if GetTrigger(KILL_DL_CHIHUO_DAOKE) == 0 then
		CreateTrigger(0,265,KILL_DL_CHIHUO_DAOKE);
		Msg2Player("§¸nh b¹i 10 tªn Xi Háa ®ao kh¸ch");
		TaskTip("§¸nh b¹i 10 tªn Xi Háa ®ao kh¸ch");
	else
		TalkEx("",strTalk);
	end
end	




function task_exit()

end	