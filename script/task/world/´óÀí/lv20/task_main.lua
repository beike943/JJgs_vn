-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí20,35,55ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2005/12/30 PM 13:54

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

--ÁìÈ¡´óÀí¹ú¹«¸ßÉıÈªÈÎÎñ1
function task_000_00()
	
local strTalk = {
	"Cã ph¶i Cao quèc c«ng {Cao Th¨ng TuyÒn}?",
	"Chİnh lµ ta. <sex> cã cÇn ta gióp g× kh«ng?",
	"MÊy h«m tr­íc nh×n thÊy th­¬ng nh©n bŞ gi¸o ®å cña Xi Háa gi¸o tÊn c«ng, ta muèn biÕt vÒ {Xi Háa gi¸o}.",
	"Xi Háa gi¸o vèn lµ mét gi¸o ph¸i nhá ë §¹i Lı sau ®ã ngµy cµng lín m¹nh, gÇn ®©y l¹i ngang nhiªn t¸c lo¹n.",
	"Tr­íc khi {Xi Háa gi¸o} t¸c lo¹n cã ph¸t sinh ®¹i sù g× kh«ng?",
	"ChuyÖn lµ khi hoµng ®Õ lªn kÕ vŞ ®­îc mÊy ngµy th× Xi Háa gi¸o b¾t ®Çu n¸o lo¹n c¶ §¹i Lı.",
	}
	TalkEx("task_000_01",strTalk);
	return

end;

--ÁìÈ¡´óÀí¹ú¹«¸ßÉıÈªÈÎÎñ2
function task_000_01()

local strTalk = {
	"Cã ph¶i liªn quan ®Õn vŞ Hoµng ®Õ míi nµy?",
	"Còng cã thÓ! §¹i Lı cã mét sè thµnh phÇn ph¶n lo¹n ®· cÊu kÕt víi Xi Háa gi¸o nh­ng rÊt cã thÓ lµ Ngò §éc gi¸o, bëi gi¸o ph¸i nµy c¸ch §¹i Lı kh«ng xa, gi¸o ®å cña hä l¹i tinh th«ng ®éc thuËt.",
	"NÕu vËy th× ta sÏ ®Õn {Ngò §éc} xem t×nh h×nh ë ®ã thÕ nµo.",
	"<sex> nh©n tiÖn trõ lu«n 20 con rÕt ®éc nhĞ!",
	"§Ö tö tu©n lÖnh!"
	}
	TalkEx("",strTalk);
	CreateTrigger(0,251,KILL_DL_POINSONSCO);
	TaskTip("Vµo Ngò §éc gi¸o giÕt 20 rÕt ®éc");
	Msg2Player("Vµo Ngò §éc gi¸o giÕt 20 rÕt ®éc");
	SetTask(TASK_DL_LV10_ID,5);
	SetTask(TASK_DL_LV20_ID,1);
end

--»¹Ã»Íê³É¸ßÉıÈªÈÎÎñ
function task_001_00()
	
	--²¹·¢´¥·¢Æ÷
	if GetTrigger(KILL_DL_POINSONSCO) == 0 then
		CreateTrigger(0,251,KILL_DL_POINSONSCO);
		TaskTip("Gióp TrŞnh Qu¸n Chi t×m d­îc liÖu.");
		Msg2Player("Gióp TrŞnh Qu¸n Chi t×m d­îc liÖu.");
		return
	end;
	return
end;

--ÒÑ¾­ÏûÃğ20¸ö¶¾òÚò¼
function task_002_00()

local strTalk = {
			"<sex> vÒ råi ­? Cã ph¸t hiÖn g× kh«ng?",
			"ë ®ã ®éc trïng rÊt nhiÒu, nh­ng kh«ng thÓ dùa vµo ®ã cho r»ng {Xi Háa gi¸o} vµ {Ngò §éc gi¸o} cã liªn quan víi nhau.",
			"GÇn Ngò §éc gi¸o gÇn ®©y xuÊt hiÖn HuyÕt L©n §éc M·ng, qu¸i vËt nµy ®· lµm tæn h¹i biÕt bao nhiªu ng­êi. <sex> h·y mang theo D­îc HuyÕt nµy ®Õn ®ã ®Ó tiªu trõ nã!",
			"Ta sÏ cè g¾ng."
		}
	TalkEx("",strTalk);
	AddItem(2,0,365,1,1);--ÈÎÎñµÀ¾ßÒ©Ñª
	TaskTip("§Õn Ngò §éc gi¸o dïng d­îc huyÕt ®Ó diÖt HuyÕt L©n §éc M·ng.");
	Msg2Player("§Õn Ngò §éc gi¸o dïng d­îc huyÕt ®Ó diÖt HuyÕt L©n §éc M·ng.");
	SetTask(TASK_DL_LV20_ID,3);--ÒÑ¾­´¥·¢É±¶¾òşµÄÈÎÎñ
	GivePlayerAward("Level_20","xn_step_1");
	GivePlayerExp(SkeyDali,"tanchawudujiao")
	return
end


--ÒÑ¾­ÁìÈ¡ÁËÉ±¶¾òşÈÎÎñ
function task_003_00()

local strTalk = {
	"VÊt v¶ cho <sex> råi."
	}
	
	--ÈÎÎñµÀ¾ßÒ©Ñª¶ªÊ§²¹·¢
	if BigGetItemCount(2,0,365) <= 0 then
		if GetFreeItemRoom() >= 1 and GetMaxItemWeight() - GetCurItemWeight() > 1 then
			AddItem(2,0,365,1,1);--ÈÎÎñµÀ¾ßÒ©Ñª
			TalkEx("",strTalk);
			TaskTip("§Õn Ngò §éc gi¸o dïng d­îc huyÕt ®Ó diÖt HuyÕt L©n §éc M·ng.");
			Msg2Player("§Õn Ngò §éc gi¸o dïng d­îc huyÕt ®Ó diÖt HuyÕt L©n §éc M·ng.");	
		else
			strTalk = {
				"Xin kiÓm tra l¹i hµnh trang tr­íc khi nhËn D­îc HuyÕt",
					}
			TalkEx("",strTalk)
		end
	else
		TalkEx("",strTalk);
	end
end;
		

--ÒÑ¾­É±ËÀ¶¾òş£¬ÕÒ¸ßÉıÈª¶Ô»°
function task_004_00()

local strTalk = {
	"<sex> vÊt v¶ qu¸! Chót thµnh ı xin <sex> nhËn cho!",
	"Nh­ng vÉn ch­a biÕt ®­îc Xi Háa gi¸o vµ Ngò §éc gi¸o cã liªn quan víi nhau hay kh«ng!",
	"§Ó ta nhí l¹i xem…"
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV20_ID,5);--ÒÑ¾­½»ÁËÉ±¶¾òşÈÎÎñ
	GivePlayerAward("Level_20", "xn_step_2", "weapon", "Level_22");
	GivePlayerExp(SkeyDali,"xuelingdumang")
	return
end


--ÒÑ¾­½»ÁËÉ±¶¾òşÈÎÎñ
function task_005_00()

local strTalk = {};

	--´óÓÚ50¼¶·½¿É¼ÌĞø½ÓÏÂÀ´µÄÈÎÎñ
	if GetLevel() < 50 then
		local strTalk = {
			"Cã viÖc ta sÏ l¹i nhê ®Õn ng­¬i!"
			}
		TalkEx("",strTalk);
		return
	elseif GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
		strTalk = {
			"Cao Quèc c«ng cã kÕ s¸ch g× ch­a?",
			"Ngò §éc gi¸o lµ m«n ph¸i thÇn bİ nh­ng ®· cã tiÕng trong giíi vâ l©m, ta nghÜ gi¸o ph¸i nµy kh«ng liªn quan ®Õn viÖc chİnh sù ë §¹i Lı. Nh­ng còng PhiÒn b»ng h÷u ®Õn Ngò §éc gi¸o gÆp B¹ch Doanh Doanh hái cho râ rµng viÖc nµy",
			"Ta lËp tøc ®i ngay!",
			"§a t¹ <sex>"
			}
	else
		strTalk = {
			"Cao Quèc c«ng cã kÕ s¸ch g× ch­a?",
			"Ngò §éc gi¸o tuy thuéc tµ ph¸i nh­ng x­a nay cã tiÕng trong giíi Vâ L©m, ta nghÜ viÖc nµy kh«ng liªn quan ®Õn hä. <sex> thö ®Õn hái B¹ch Doanh Doanh xem sao?",
			"Ta lËp tøc ®i ngay!",
			"§a t¹ <sex>"
			}
	end
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV20_ID,6);
	SetTask(TASK_DL_LV30_ID,1);
	TaskTip("§Õn Ngò §éc gi¸o tham kiÕn B¹ch Doanh Doanh!");
	Msg2Player("§Õn Ngò §éc gi¸o tham kiÕn B¹ch Doanh Doanh!");
	return	
end

--ÉĞÎ´Óë°×Ó¨Ó¨¶Ô»°
function task_006_00()

local strTalk = {
	"§a t¹ <sex>"
	}
	TalkEx("",strTalk);
	return
end;

--Íê³ÉÎå¶¾½ÌÈÎÎñºó¶Ô»°
function task_007_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
		strTalk = {
			"T×nh h×nh thÕ nµo?",
			"T¹i h¹ ®· hái gi¸o chñ, hai gi¸o ph¸i nµy ch¼ng cã quan hÖ g× ng­îc l¹i hä cßn lµ ®èi thñ. {Xi Háa gi¸o} cßn trém c¸ch luyÖn ®éc cña Ngò §éc gi¸o.",
			"Kh«ng cã liªn quan g× víi nhau th× tèt råi. Ta ®· cho ng­êi ®i th¨m dß t×nh h×nh cña Xi Háa gi¸o, ch¾c còng s¾p vÒ råi."
			}
	else
		strTalk = {
			"<sex> hái th¨m ®­îc tin tøc g× råi?",
			"Ta ®· hái gi¸o chñ, hai gi¸o ph¸i nµy ch¼ng cã quan hÖ g× ng­îc l¹i hä cßn lµ ®èi thñ. Xi Háa gi¸o cßn trém c¸ch luyÖn ®éc cña Ngò §éc gi¸o.",
			"Kh«ng cã liªn quan g× víi nhau th× tèt råi. Ta ®· cho ng­êi ®i th¨m dß t×nh h×nh cña Xi Háa gi¸o, ch¾c còng s¾p vÒ råi."
			}
	end;
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,6);
	GivePlayerAward("Level_30", "xn_step_3");
	GivePlayerExp(SkeyDali,"cihuojiao")
	return
end


function task_008_00()
	
	--´óÓÚ51¼¶·½¿É¼ÌĞøÏÂÃæÈÎÎñ
	if GetLevel() > 51 then
		local strTalk = {
				"Cã chuyÖn gÊp l¹i nhê ®Õn <sex> ®©y! GÇn ®©y Xi Háa gi¸o l¹i ho¹t ®éng ë Vò L¨ng s¬n, chóng s¸t h¹i v« sè th¶o d©n. Nh­ng Vò L¨ng s¬n kh«ng thuéc §¹i Lı mµ thuéc quèc thæ cña §¹i Tèng, nÕu triÒu ®×nh biÕt ®­îc e r»ng sÏ kh«ng hay, chi b»ng <sex> ®Õn ®ã ®¸nh ®uæi bän chóng ®i!",
				"§­îc! VËy chóng ®ang ë ®©u?",
			}
		TalkEx("task_008_01",strTalk);		
	else
		local strTalk = {
			"VÉn ch­a cã tin tøc g×.",
			}
		TalkEx("",strTalk);
		return
	end
end

--·ÖÖ§:Ñ¡Ôñ1È¥ÎäÁêÉ½½Å2ÎäÁêÉ½
function task_008_01()

local strTalk = {
		"LÇn nµy Xi Háa gi¸o ®å l¹i chia thµnh 2 n¬i ®Ó ho¹t ®éng, mét ë trªn nói vµ mét ë ch©n nói. D­íi ch©n nói cã B¹ch Gi¸o §å vµ H¾c Gi¸o §å. Trªn nói cã Xİch Gi¸o §å vµ Xi Háa §ao kh¸ch. <sex> thêi gian kh«ng nhiÒu, xin chän mét n¬i, cßn nh÷ng n¬i kh¸c ta sÏ ph¸i ng­êi ®Õn sau."
		}
	TalkEx("task_008_02",strTalk)
end;

function task_008_02()
local strSelect = {
	"<sex> nÕu ®Õn ch©n Vò L¨ng s¬n th× ®¸nh 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 Xi Háa H¾c Gi¸o §å. §Õn Vò L¨ng s¬n th× ®¸nh 15 tªn Xi Háa Xİch Gi¸o §å lµ ®­îc!",
	"§Õn ch©n nói Vò L¨ng S¬n/task_009_00",
	"§Õn Vò L¨ng s¬n/task_009_10",
	"§Ó ta nghÜ l¹i/nothing"
	}
	SelectSay(strSelect); 
end


--ÁìÈ¡ÈÎÎñÇ°ÍùÎäÁêÉ½½Å´òµ¹10¸öò¿»ğºÚ/°×½ÌÍ½
function task_009_00()

local strTalk = {
	"§¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å."
	}
	TalkEx("",strTalk);
	CreateTrigger(0,253,KILL_DL_CHIHUO_WHITE);
	CreateTrigger(0,254,KILL_DL_CHIHUO_BLACK);
	SetTask(TASK_DL_LV30_ID,7);
	SetTask(TASK_DL_LV35_ID,1);
	SetTask(TASK_DL_LV35_01_ID,1);
	TaskTip("§Õn ch©n nói Vò L¨ng s¬n ®¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å.");
	Msg2Player("§Õn ch©n nói Vò L¨ng s¬n ®¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å.");
	
end;
	
--ÁìÈ¡ÈÎÎñÇ°ÍùÎäÁêÉ½½Å´òµ¹15¸öò¿»ğ³à½ÌÍ½
function task_009_10()

local strTalk = {
	"§¸nh b¹i 15 tªn Xi Háa Xİch Gi¸o §å."
	}
	
	TalkEx("",strTalk);
	CreateTrigger(0,255,KILL_DL_CHIHUO_RED);
	SetTask(TASK_DL_LV30_ID,7);
	--SetTask(TASK_DL_LV35_ID,1);
	SetTask(TASK_DL_LV35_01_ID,2);
	SetTask(TASK_DL_LV35_ID_ZX,1);
	TaskTip("§Õn Vò L¨ng s¬n ®¸nh b¹i 15 tªn Xi Háa Xİch Gi¸o §å.");
	Msg2Player("§Õn Vò L¨ng s¬n ®¸nh b¹i 15 tªn Xi Háa Xİch Gi¸o §å.");

end


--Î´´òµ¹10¸öò¿»ğºÚ/°×½ÌÍ½¶Ô»°
function task_010_00()

local strTalk = {
	"§¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å."
	}
	TalkEx("",strTalk);
	if GetTrigger(KILL_DL_CHIHUO_WHITE) == 0 then
		CreateTrigger(0,253,KILL_DL_CHIHUO_WHITE);
		TaskTip("§Õn ch©n nói Vò L¨ng s¬n ®¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å.");
		Msg2Player("§Õn ch©n nói Vò L¨ng s¬n ®¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å.");
	end;
	if GetTrigger(KILL_DL_CHIHUO_BLACK) == 0 then
		CreateTrigger(0,254,KILL_DL_CHIHUO_BLACK);
		TaskTip("§Õn ch©n nói Vò L¨ng s¬n ®¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å.");
		Msg2Player("§Õn ch©n nói Vò L¨ng s¬n ®¸nh b¹i 10 tªn Xi Háa B¹ch Gi¸o §å vµ 10 tªn Xi Háa H¾c Gi¸o §å.");
	end;
end

--Î´´òµ¹15¸öò¿»ğ³à½ÌÍ½¶Ô»°
function task_010_10()

local strTalk = {
	"§Õn Vò L¨ng s¬n ®¸nh b¹i 15 tªn Xİch Gi¸o §å."
	}
	TalkEx("",strTalk);
	if GetTrigger(KILL_DL_CHIHUO_RED) == 0 then
		CreateTrigger(0,255,KILL_DL_CHIHUO_RED);
		TaskTip("§Õn Vò L¨ng s¬n ®¸nh b¹i 15 tªn Xi Háa Xİch Gi¸o §å.");
		Msg2Player("§Õn Vò L¨ng s¬n ®¸nh b¹i 15 tªn Xi Háa Xİch Gi¸o §å.");
	end;
end

--Íê³ÉÎäÁêÉ½ÈÎÎñºóÓë¸ßÉıÈª¶Ô»°
function task_011_00()

local strTalk = {
	"Cao Quèc C«ng! T¹i h¹ ®· ®¸nh b¹i chóng råi!",
	"§a t¹ <sex>",
	"LÇn nµy Xi Háa gi¸o t¸c lo¹n ph¶i ch¨ng cã liªn quan ®Õn vŞ hoµng ®Õ míi kÕ tôc?",
	"Ta còng kh«ng râ l¾m!",
	"Ta nghe nãi §¹i Lı cã ®Õn lôc ®¹i gia téc, cô thÓ nh­ thÕ nµo?",
	"ViÖc nµy cã thÓ liªn quan ®Õn Xi Háa gi¸o nh­ng ta còng kh«ng râ l¾m! <sex> thö t×m hiÓu xem.",
	"Xem ra ph¶i hái {B¸ch HiÓu Sinh} råi.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV35_ID,3);
	SetTask(TASK_DL_LV35_ID_ZX,3);
	RemoveTrigger(KILL_DL_CHIHUO_WHITE)
	RemoveTrigger(KILL_DL_CHIHUO_BLACK)
	RemoveTrigger(KILL_DL_CHIHUO_RED)
	Msg2Player("§Õn BiÖn Kinh t×m B¸ch HiÓu Sinh.");
	TaskTip("§Õn BiÖn Kinh t×m B¸ch HiÓu Sinh.");
	GivePlayerAward("Level_35", "xn_step_1", "weapon", "Level_40");
	GivePlayerExp(SkeyDali,"wulingshanjiao")
end

--½áÊøÎäÁêÉ½ÈÎÎñºóÓë¸ßÉıÈª¶Ô»°
function task_012_00()

local strTalk = {
	"VÊt v¶ cho <sex> råi!",
	}
	TalkEx("",strTalk);
end


--´¥·¢55¼¶·ï»ËôáÈÎÎñ1
function task_013_00()

	if GetLevel()>= 54 and GetTask(TASK_DL_LV50_ID) == 7 then
		local strTalk = {
			"Cao Quèc C«ng, t¹i h¹ cã mét chót manh mèi vÒ {Xi Háa gi¸o} ®©y.",
			"§a t¹ <sex> v× b¸ t¸nh cña §¹i Lı mµ vÊt v¶ qu¸. Xin hái <sex> ®· thu thËp ®­îc nh÷ng g×?",
			"Lóc ®Çu t¹i h¹ nghÜ {Xi Háa gi¸o} v× ©n o¸n gi÷a ¤ Man vµ B¹ch Téc nªn míi t¸c lo¹n. Nh­ng kh«ng ph¶i vËy, hä v× muèn gióp quèc v­¬ng. Cao Quèc C«ng, chuyÖn nµy lµ thÕ nµo?",
			"Chóng chØ nãi hå ®å th«i. Th¸nh th­îng d©n chóng tin yªu, ®©u cÇn ®Õn sù t­¬ng trî cña tµ gi¸o? NÕu chóng cã h¶o ı th× kh«ng nªn t¸c lo¹n nh­ vËy.",
			"T©n hoµng ®Õ cã thËt ®­îc d©n chóng tin yªu? NÕu d©n chóng tin yªu sao lóc ®¨ng quang gÆp nhiÒu tr¾c trë ®Õn vËy?",
			"…",
			"VŞ Hoµng ®Õ tr­íc ®ã e r»ng kh«ng ph¶i tõ Hoµng tö kÕ vŞ?"
			}
		TalkEx("task_013_01",strTalk);
		GivePlayerExp(SkeyDali,"zhaogaoguogong")
		return
	else
		local strTalk = {
			"<sex> l©u qu¸ kh«ng gÆp, vâ c«ng ®· cã tiÕn bé g× ch­a?"
		}
		TalkEx("",strTalk);
	end;
end

--´¥·¢55¼¶·ï»ËôáÈÎÎñ2
function task_013_01()
local strTalk = {
			"Xem ra <sex> ®· biÕt hÕt c¶ råi. Lóc míi ®¨ng quang c¶ §¹i Lı ®· x¶y ra mét trËn hçn lo¹n. C¶ 3 vŞ Hoµng tö ch¼ng ai nh­êng ai, cuèi cïng Tam Hoµng Tö ®· lªn ng«i, nh­ng Xi Háa gi¸o muèn ®ßi ng«i vŞ l¹i cho NhŞ Hoµng Tö.",
			"ViÖc nµy tr­íc ®©y ch­a tõng nghe Quèc C«ng nh¾c tíi.",
			"§©y chØ lµ chuyÖn trong nhµ, ta còng võa th¨m dß mèi quan hÖ gi÷a NhŞ Hoµng Tö vµ Xi Háa gi¸o.",
			"VËy Quèc s­ quyÕt ®Şnh thÕ nµo?",
			"Muèn th¶o ph¹t Xi Háa gi¸o vµ NhŞ Hoµng Tö còng cÇn x©y dùng mét thÕ lùc v÷ng ch¾c ®·. Cã mét vµi viÖc ph¶i nhê <sex> gióp råi!"
			}
	TalkEx("task_013_02",strTalk);
	return
end

--´¥·¢55¼¶·ï»ËôáÈÎÎñ3
function task_013_02()

local strTalk = {	
			"ChuyÖn ®¹i sù t¹i h¹ kh«ng d¸m can thiÖp, nh­ng cÇn t¹i h¹ gióp g× xin Quèc s­ cø gäi.",
			"§a t¹ <sex>. Phông Hoµng_biÓu t­îng cña Xi Háa gi¸o ®· xuÊt hiÖn t¹i Phông Nh·n ®éng. Kh«ng ®Ó cho thÕ lùc cña gi¸o ph¸i nµy bµnh tr­íng! <sex> mau ®Õn ®ã tiªu trõ chóng!",
			"VËy ph¶i lµm sao?",
			"<sex> ®Õn Phông Nh·n ®éng thu thËp 10 nanh D¹ Hæ vµ 10 l«ng B¹ch §Çu §iªu.",
			"§Ö tö tu©n lÖnh!",
			}
		
	TalkEx("",strTalk);
	CreateTrigger(0,258,KILL_DL_MIDNIGHT_TIGER);
	CreateTrigger(0,259,KILL_DL_BALD_EAGLE);
	SetTask(TASK_DL_LV50_ID,8);
	SetTask(TASK_DL_LV55_ID,1);
	GivePlayerExp(SkeyDali,"weiyibanfa")
	Msg2Player("§Õn Phông Nh·n ®éng thu thËp 10 nanh D¹ Hæ vµ 10 l«ng B¹ch §Çu §iªu.");
	TaskTip("§Õn Phông Nh·n ®éng thu thËp 10 nanh D¹ Hæ vµ 10 l«ng B¹ch §Çu §iªu.");
end

--´¥·¢55¼¶·ï»ËôáÈÎÎñºó
function task_014_00()
	--Íê³ÉÊÕ¼¯»¢ÑÀºÍµñÓğÈÎÎñ
	if GetItemCount(2,0,371) >= 10 and GetItemCount(2,0,372) >= 10 then
		local strTalk = {
			"VËt phÈm thu thËp ®· ®ñ.",
			"PhiÒn <sex> ®em vËt phÈm nµy ®Õn T­¬ng D­¬ng t×m M¹c Tam ®Ó nhê chÕ t¹o Phông Hoµng Linh.",
			"{Phông Hoµng Linh} cã t¸c dông g×?",
			"<sex> dïng Phông Hoµng Linh ®Ó gäi Phông Hoµng",
			"Th× ra lµ vËy! Ta ®Õn chç {M¹c Tam} ®©y.",
			"Ng­¬i nªn dïng bå c©u ®­a th­ th«ng b¸o cho «ng Êy tr­íc.",
			"§­îc! T¹i h¹ lËp tøc lµm ngay!"
			}
		
		TalkEx("",strTalk);
		DelItem(2,0,371,10);
		DelItem(2,0,372,10);
		RemoveTrigger(GetTrigger(KILL_DL_MIDNIGHT_TIGER));
		RemoveTrigger(GetTrigger(KILL_DL_BALD_EAGLE));
		CreateTrigger(4,201,TALK_DL_MOSAN);
		SetTask(TASK_DL_LV55_ID,2);
		Msg2Player("§Õn T­¬ng D­¬ng t×m M¹c Tam chÕ t¹o Phông Hoµng Linh .");
		TaskTip("§Õn T­¬ng D­¬ng t×m M¹c Tam chÕ t¹o Phông Hoµng Linh .");
		GivePlayerAward("Level_55", "xn_step_1");
		GivePlayerExp(SkeyDali,"jialouluo")
		return
	end
	--²¹·¢×ÓÒ¹»¢ºÍ°×Í·µñËÀÍö´¥·¢Æ÷
	if GetTrigger(KILL_DL_MIDNIGHT_TIGER) == 0 or GetTrigger(KILL_DL_BALD_EAGLE) == 0 then
		if GetTrigger(KILL_DL_MIDNIGHT_TIGER) == 0 then
			CreateTrigger(0,258,KILL_DL_MIDNIGHT_TIGER);
		end
		if GetTrigger(KILL_DL_BALD_EAGLE) == 0 then
			CreateTrigger(0,259,KILL_DL_BALD_EAGLE);
		end
		Msg2Player("§Õn Phông Nh·n ®éng thu thËp 10 nanh D¹ Hæ vµ 10 l«ng B¹ch §Çu §iªu.");
		TaskTip("§Õn Phông Nh·n ®éng thu thËp 10 nanh D¹ Hæ vµ 10 l«ng B¹ch §Çu §iªu.");
	end
	--Î´Íê³ÉÈÎÎñ
	local strTalk = {
		"PhiÒn b»ng h÷u ®Õn Phông Nh·n ®éng thu thËp 10 nanh D¹ Hæ vµ 10 l«ng B¹ch §Çu §iªu.",
		}
	TalkEx("",strTalk)
end

--Î´ÓëÄªÈı¶Ô»°
function task_015_00()

local strTalk = {
	"M¹c Tam më tiÖm thî rÌn ë T­¬ng D­¬ng, rÊt dÔ t×m.",
	}

	if GetTrigger(TALK_DL_MOSAN) == 0 then
		CreateTrigger(4,201,TALK_DL_MOSAN);
		Msg2Player("§Õn T­¬ng D­¬ng t×m M¹c Tam chÕ t¹o Phông Hoµng Linh .");
		TaskTip("§Õn T­¬ng D­¬ng t×m M¹c Tam chÕ t¹o Phông Hoµng Linh .");
	end;
	
	TalkEx("",strTalk);
	
end;

--´òµ¹·ï»Ëºó
function task_016_00()

local strTalk = {
	"<sex> qu¶ lµ tuæi trÎ tµi cao, l¹i thªm mét nh©n tµi n÷a.",
	"§a t¹ qu¸ khen!",
	"Quèc s­ §æng Giµ La ë §¹i Lı l¹i gÆp chuyÖn. <sex> mau ®Õn ®ã ®i!",
	"T¹i h¹ ®i ngay!",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV55_ID,5);
	GivePlayerAward("Level_55", "xn_step_2");
	GivePlayerEquipment("head", "Level_55",1);
	GivePlayerExp(SkeyDali,"jibaojialouluo")
end

--Íê³É55¼¶·ï»ËÈÎÎñºó
function task_017_00()

local strTalk = {
	"§æng Giµ La hiÖn ë phİa b¾c thµnh §¹i Lı, phiÒn <sex> ®Õn ®ã mét chuyÕn.",
	}

	TalkEx("",strTalk);
	
end


--Íê³ÉÖ£¹áÖ®µÄ»õ¿îÈÎÎñºóÁìÈ¡70¼¶ÈÎÎñò¿»ğ½ÌµÄÌôÕ½Êé
function task_018_00()

local strTalk = {
	"Quèc C«ng cho gäi t¹i h¹ cã viÖc g× kh«ng?",
	"<sex> h·y ®Õn tÇng 2 Long Nh·n ®éng tû vâ víi A Tu La (Xi Háa gi¸o)",
	"LÇn nµy xem nh­ bän chóng chñ ®éng, ®­îc ta ®i ngay ®©y.",
	"<sex> dÉn theo bao nhiªu ®ång ®éi ®Òu ®­îc nh­ng <sex> nhÊt cö nhÊt ®éng ph¶i thËn träng!",
	"Ta biÕt råi!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_0_ID,3);--É¾È¥Í·ÉÏµÄÈÎÎñÊé
	SetTask(TASK_DL_LV70_ID,1);
	GivePlayerExp(SkeyDali,"tiaozhanshu")
	Msg2Player("§Õn tÇng 2 Long Nh·n ®éng diÖt A Tu La");
	TaskTip("§Õn tÇng 2 Long Nh·n ®éng diÖt A Tu La");
	return
end


--Î´´ò°Ü°¢ĞŞÂŞ
function task_019_00()

local strTalk = {
	"A Tu La t¹i tÇng 2 Long Nh·n ®éng.",
	}
	TalkEx("",strTalk);
	return
end

--´ò°Ü°¢ĞŞÂŞ²¢ÇÒÔÄ¶ÁĞÅ¼şÄÚÈİ
function task_020_00()

local strTalk = {
	"<sex> ®· chiÕn th¾ng trë vÒ!",
	"T¹i h¹ ph¸t hiÖn mét viÖc rÊt quan träng, Quèc c«ng xem th­ nµy ®i.",
	"…",
	"NhŞ Hoµng Tö hiÖn ®ang Èn n¸u ë T©y Song B¶n N¹p, l¹i cÊu kÕt víi Xi Háa gi¸o. ChuyÖn nµy kh«ng ®¬n gi¶n. <sex> mau ®Õn chç §æng Quèc S­ cÇu kiÕn.",
	"§Ö tö tu©n lÖnh!",
	}
	DelItem(2,0,380,1);--É¾È¥ò¿»ğ½ÌµÄÃÜº¯
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV70_ID,4);
	GivePlayerAward("Level_70", "xn_step_1",nil ,nil,"YunTie",1);
	GivePlayerWeapon("Level_70",1);
	GivePlayerExp(SkeyDali,"datanxiangqing")
	return
end

function nothing()

end