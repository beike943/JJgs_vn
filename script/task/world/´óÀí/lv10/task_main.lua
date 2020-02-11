-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí10£¬45£¬50¼¶ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2005/12/29 PM 16:02

--Ê®Ò»ÔÂØ¥¾Å ¶¡º¥ÍÁ¾®±ÕÈÕ  
--ÒË£º  ²ÃÒÂ¡¢ÖşµÌ¡¢ĞŞ²Ö¡¢ĞŞÔì¡¢¶¯ÍÁ¡¢ÉÏÁº¡¢²¹Èû¡¢×÷Ôî  
--¼É£º  Àí·¢¡¢¼ŞÈ¢  

-- ×òÍíĞ¡Íµ½øÎİ£¬ÊÒÓÑÉÔÓĞËğÊ§£¬Äê¹ØÄÑ¹ı°¡¡­¡­

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--ÁìÈ¡Å®ÉÌÈËÖ£¹áÖ®ÈÎÎñ
function task_000_00()
	
local strSelect = {
	"Ta thÊy <sex> th©n thñ kh«ng tÖ! Cã thÓ gióp tiÓu n÷ mét viÖc nhá kh«ng?",
	"Ta ®i l¹i trong giang hå còng ®· nhiÒu, c« n­¬ng cã viÖc g× cÇn gióp xin cø nãi nh­ng ph¶i tèn 15 Kim./Accept_Task_000",
	"ThËt ng¹i qu¸, b©y giê ta cã viÖc råi./Task_Exit"
	};

	SelectSay(strSelect)
	
end;

function Accept_Task_000()

local strTalk = {
	"NÕu vËy phiÒn b»ng h÷u mét chuyÕn nhĞ!",
	"TiÓu n÷ lµ TrŞnh Qu¸n Chi lÇn nµy ®Õn §¹i Lı bu«n b¸n, kh«ng may bŞ ng­êi cña Xi Háa gi¸o c­íp mÊt d­îc liÖu. Cã thÓ gióp ta ®Õn Thóy Yªn M«n ®em 15 d­îc liÖu vÒ kh«ng?",
	"ChuyÖn nhá th«i mµ!"
};
	if (GetCash() >= 150000) then
		Pay(150000)
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV10_ID,1);
		CreateTrigger(0,250,KILL_DL_POINSONBEE);
		TaskTip("Gióp TrŞnh Qu¸n Chi t×m d­îc liÖu.");
		Msg2Player("Gióp TrŞnh Qu¸n Chi t×m d­îc liÖu.");
	elseif ( GetCash() < 150000  ) then
			Talk(1,"","Trêi! Xem bé d¹ng ng­¬i mét xu dİnh tói còng kh«ng cã µ?")		
	end
end;

--ÒÑ¾­ÁìÈ¡ÁËÅ®ÉÌÈËÈÎÎñ	
function task_001_00()
	
local nNum = GetItemCount(2,0,362);
local strTalk_1 = {
	"§a t¹! PhiÒn <sex> gióp ta t×m 15 d­îc liÖu."
};
local strTalk_2 = {
	"Ta ®· t×m ®ñ {15 d­îc liÖu}",
	"Nhanh nh­ vËy ®· vÒ råi ­? Nh­ng ta võa ph¸t hiÖn hãa ®¬n mua hµng ®· bŞ Xi Háa Yªu N÷ lÊy ®i. <sex> cã thÓ gióp ta ®em vÒ ®­îc kh«ng?",
	"§Ö tö tu©n lÖnh!"
};

	if nNum >= 15 then
		SetTask(TASK_DL_LV10_ID,2);
		DelItem(2,0,362,15);
		RemoveTrigger(GetTrigger(KILL_DL_POINSONBEE));
		TalkEx("",strTalk_2);
		TaskTip("§Õn Thóy Yªn t×m Xi Háa Yªu N÷ (167.196) lÊy hãa ®¬n.");	
		Msg2Player("§Õn Thóy Yªn t×m Xi Háa Yªu N÷ (167.196) lÊy hãa ®¬n.");
		GivePlayerAward("Level_10","xn_step_1");
		GivePlayerExp(SkeyDali,"zhaohuiyaocai")
		return
	--²¹·¢´¥·¢Æ÷
	elseif GetTrigger(KILL_DL_POINSONBEE) == 0 then
		CreateTrigger(0,250,KILL_DL_POINSONBEE);
		TalkEx("",strTalk_1);
		TaskTip("Gióp TrŞnh Qu¸n Chi t×m d­îc liÖu.");
		Msg2Player("Gióp TrŞnh Qu¸n Chi t×m d­îc liÖu.");
		return
	else
		TalkEx("",strTalk_1);
	end;
	
end;

--°ïÖ£¹áÖ®ÕÒ»Ø¶ªÊ§µÄ»õµ¥
function task_002_00()

local strTalk = {
	"NÕu <sex> kh«ng t×m ®­îc hãa ®¬n th× xem nh­ lÇn nµy ta ®Õn §¹i Lı c«ng cèc råi."
} 	
	TalkEx("",strTalk);
	return
end;


--ÒÑ¾­ÕÒ»Ø¶ªÊ§µÄ»õµ¥
function task_003_00()

local strTalk = {
	"C« n­¬ng xem ®©y cã ph¶i lµ {hãa ®¬n} cña c« kh«ng?",
	"§óng råi. §a t¹ <sex>! Chót thµnh ı xin nhËn cho!",
	"NghÜ còng kú l¹, Xi Háa gi¸o c­íp d­îc liÖu cña ta ®Ó lµm g× chø?",
	"C« còng kh«ng biÕt nguyªn nh©n v× sao ­?",
	"Ta lµ ng­êi H¸n, míi ®Õn §¹i Lı lµm ¨n nªn còng kh«ng hiÓu t×nh h×nh ë ®©y l¾m. Nh­ng nghe nãi nÕu cã g× liªn quan ®Õn Xi Háa gi¸o th× cã thÓ t×m Quèc c«ng Cao Th¨ng TuyÒn ®Ó hái.",
	"§­îc! §Ó ta ®i hái xem."
};
	DelItem(2,0,363,1);
	SetTask(TASK_DL_LV10_ID,4);
	TalkEx("",strTalk);
	TaskTip("§Õn §¹i Lı t×m Quèc c«ng Cao Th¨ng TuyÒn");	
	Msg2Player("§Õn §¹i Lı t×m Quèc c«ng Cao Th¨ng TuyÒn");
	GivePlayerAward("Level_10","xn_step_2","weapon","Level_10");
	GivePlayerExp(SkeyDali,"zhaohuihuodan")
end;


--ÁìÈ¡ÃçÁëĞÅÊ¹ÈÎÎñ1
function task_004_00()
	--´óÓÚ45¼¶²ÅÄÜÁìÈ¡ÈÎÎñ
	if GetLevel() >= 45 then
		local strTalk = {
			"TrŞnh c« n­¬ng, l©u qu¸ kh«ng gÆp, bu«n b¸n thÕ nµo?",
			"<sex> cã gióp ta hái th¨m t×nh h×nh cña Xi Háa gi¸o kh«ng?",
			"C« n­¬ng gÇn ®©y cã nghe tin g× kh«ng?",
			"<sex> ®Õn thËt ®óng lóc! MÊy h«m tr­íc ta cã nghe mét th­¬ng nh©n nãi Xi Háa gi¸o thuéc ¤ man ®èi lËp víi B¹ch téc. Nh­ng §¹i Lı lµ do tæ tiªn cña B¹ch téc gÇy dùng nªn.",
			"Th× ra lµ vËy, th¶o nµo hä lu«n chèng l¹i hoµng téc. Ta míi tõ {Miªu LÜnh} vÒ, nh÷ng ng­êi ë ®ã h×nh nh­ còng cã quan hÖ víi {Xi Háa gi¸o}, hä muèn chèng l¹i Hoµng §Õ."
			}
			TalkEx("task_004_01",strTalk);
			return	
	else
		local strTalk = {
			"H«m nay ta bËn råi. <sex> h«m kh¸c l¹i ®Õn nhĞ!"
		}
		TalkEx("",strTalk);	
	end;
end;

--ÁìÈ¡ÃçÁëĞÅÊ¹ÈÎÎñ2
function task_004_01()

local strTalk = {
	"Nghe nãi Tİn sø cña Miªu LÜnh ë YÕn Tö ®éng tÇng 1, may ra cã thÓ t×m ®­îc chót manh mèi",
	"Kh«ng cã lı do g× ®Õn hái tin, e lµ kh«ng ®­îc råi!",
	"Muèn t×m hiÓu mèi quan hÖ gi÷a Miªu LÜnh vµ Xi Háa gi¸o chØ cßn c¸ch lµ c­íp th­, nh­ng nhí lµ ®õng lµm tæn h¹i ®Õn tİnh mÖnh chóng.",
	"VËy còng ®­îc! Nh­ng lµm sao ®Ó t×m chóng?",
	"Tr­íc tiªn h·y ®Õn YÕn Tö ®éng tÇng 1 t×m 10 tÊm Da h­¬u, ta sÏ gióp ng­¬i lµm tİn hiÖu cña Miªu LÜnh. Sau ®ã quay l¹i YÕn Tö ®éng tÇng 1, chØ cÇn ng­¬i thæi lªn th× Miªu LÜnh Lùc SÜ sÏ xuÊt hiÖn.",
	"Ta ®i ngay ®©y.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,7);
	SetTask(TASK_DL_LV45_ID,1);
	CreateTrigger(0,256,KILL_DL_MLHY);
	TaskTip("§Õn YÕn Tö ®éng tÇng 1 ®¸nh Miªu LÜnh Hé Ên thu thËp 10 Da h­¬u!");	
	Msg2Player("§Õn YÕn Tö ®éng tÇng 1 ®¸nh Miªu LÜnh Hé Ên thu thËp 10 Da h­¬u!");
	GivePlayerExp(SkeyDali,"dalihanren")
end

--ÒÑ¾­ÁìÈ¡ÃçÁëĞÅÊ¹ÈÎÎñ
function task_005_00()

local strTalk = {
			"§Õn YÕn Tö ®éng tÇng 1 thu thËp 10 tÊm da h­¬u",
				}
	if GetItemCount(2,0,366) >= 10 then
		strTalk = {
			"<sex> ®· t×m ®ñ råi ­?",
			"{10 tÊm Da h­¬u} ®©y!",
			"Tèt qu¸! Ta lËp tøc lµm Tİn tiªu ®©y. <sex> ®îi ta mét l¸t nhĞ!.",
			"…",
			"Xong råi. <sex> h·y ®Õn YÕn Tö ®éng dïng Tİn tiªu nµy thæi lªn lµm tİn hiÖu lËp tøc Tİn sø Miªu LÜnh sÏ xuÊt hiÖn. Nh­ng <sex> ph¶i cÈn thËn!",
			"Ta sÏ chó ı chuyÖn nµy.",
			}
		RemoveTrigger(GetTrigger(KILL_DL_MLHY));
		DelItem(2,0,366,10);--É¾È¥÷äÆ¤
		--µÃµ½ÕÙ»½ÃçÁëÁ¦Ê¿µÄÉÚ×Ó
		AddItem(2,0,367,1,1);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV45_ID,2);
		Msg2Player("§Õn YÕn Tö ®éng tÇng 1 dïng tiÕng s¸o lµm tİn hiÖu gäi sø gi¶.");
		TaskTip("§Õn YÕn Tö ®éng tÇng 1 dïng tiÕng s¸o lµm tİn hiÖu gäi sø gi¶.");
		GivePlayerAward("Level_45","xn_step_1");
		GivePlayerExp(SkeyDali,"nipixinshao")
		return
	elseif GetTrigger(KILL_DL_MLHY) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,256,KILL_DL_MLHY);--²¹·¢ÃçÁë»¤Ó¡ËÀÍö´¥·¢Æ÷
		TaskTip("§Õn YÕn Tö ®éng tÇng 1 ®¸nh Miªu LÜnh Hé Ên thu thËp 10 Da h­¬u!");	
		Msg2Player("§Õn YÕn Tö ®éng tÇng 1 ®¸nh Miªu LÜnh Hé Ên thu thËp 10 Da h­¬u!");
		return
	else
		TalkEx("",strTalk);
		return
	end
end

--ÒÑ¾­ÁìÈ¡ÉÚ×Ó
function task_006_00()

local strTalk = {
	"§Õn YÕn Tö ®éng tÇng 1 dïng tİn hiÖu, nÕu vÉn ch­a thÊy vËt phÈm xin kiÓm tra l¹i r­¬ng",
	}
	if BigGetItemCount(2,0,367) < 1 then
		if GetFreeItemRoom() >= 1 and GetMaxItemWeight() - GetCurItemWeight() > 1 then
			AddItem(2,0,367,1,1);
			TalkEx("",strTalk)
		else 
			strTalk = {
				"Xin kiÓm tra l¹i hµnh trang cßn ®ñ kho¶ng trèng, sau ®ã ®Õn nhËn vËt lµm tİn hiÖu",
					}
			TalkEx("",strTalk);
		end
	else
		TalkEx("",strTalk)
	end
	
	return
end

--ÒÑ¾­´ò°ÜÃçÁëÁ¦Ê¿È¡»ØĞÅ¼ş
function task_007_00()

local strTalk = {
	"<sex> vÒ råi ­?",
	"Ta ®· lÊy ®­îc bøc th­, nh­ng trong Êy viÕt g× ta kh«ng hiÓu.",
	"§­a ta xem! Ch¾c ta còng ph¶i ®Õn §¹i Lı ®Ó häc ch÷ nµy qu¸!",
	"…",
	"Qu¶ nhiªn lµ Miªu LÜnh vµ Xi Háa gi¸o cã quan hÖ víi nhau, nh­ng trong th­ nãi g× ta còng kh«ng hiÓu. <sex> ®Ó ta nhê ng­¬i phiªn dŞch ®·, cã g× sÏ th«ng b¸o <sex> sau.",
	"VÊt v¶ cho c« n­¬ng råi.",
	}
	DelItem(2,0,369,1);--É¾µôĞÅ¼ş
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV45_ID,4);
	GivePlayerAward("Level_45","xn_step_2","weapon","Level_46");
	GivePlayerExp(SkeyDali,"miaolinglishi")
	return
end


--ÒÑ¾­°ÑĞÅ¼ş½»¸øÖ£¹áÖ®ºó
function task_008_00()

	if GetLevel() >= 50 then
		local strTalk = {
			"TrŞnh c« n­¬ng, bøc th­ Êy thÕ nµo r«×?",
			"<sex> yªn t©m, tuy lµ xem kh«ng hiÓu, nh­ng ta cã biÕt mét ng­êi cã thÓ ®äc ®­îc th­ nµy.",
			"Lµ ai vËy?",
			"Lµ TrÇn LËp Hoµnh, gèc lµ ng­êi H¸n nh­ng do ®Õn §¹i Lı còng ®· l©u nªn hiÓu ®­îc ng«n ng÷ ë ®ã.",
			"Tèt qu¸, ta lËp tøc ®i t×m «ng Êy!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV45_ID,5);
		SetTask(TASK_DL_LV50_ID,1);
		TaskTip("§Õn phİa b¾c cña thµnh §¹i Lı t×m TrÇn LËp Hoµnh.");	
		Msg2Player("§Õn phİa b¾c cña thµnh §¹i Lı t×m TrÇn LËp Hoµnh.");
	else
		local strTalk = {
			"<sex> tranh thñ thêi gian nµy luyÖn c«ng ®i.",
			}
		TalkEx("",strTalk);
		return
	end
end

--ÒÑ¾­ÁìÈ¡50¼¶ÈÎÎñÖ®ºó
function task_009_00()

local strTalk = {
	"TrÇn LËp Thµnh ë phİa b¾c thµnh §¹i Lı.",
	}
	TalkEx("",strTalk);
	return
end

--ÒÑ¾­´ò°ÜÃçÁëÊ×Áì²¢ºÍÃçÁë×å³¤¶Ô»°ºó
function task_010_00()

local strTalk = {
	"<sex> vÒ råi ­?",
	"Ta nghÜ Xi Háa Gi¸o v× ©n o¸n cña bé téc mµ t¸c lo¹n, môc ®İch lµ ®Ó g©y ¸p lùc phÕ ng«i ®­¬ng kim Hoµng ®Õ. Ta nghe Téc tr­ëng Miªu LÜnh nãi §o¹n ThŞ chİnh lµ ¤ Man cã liªn quan huyÕt thèng víi B¹ch Téc. V× vËy Xi Háa gi¸o kh«ng nh÷ng ph¶n ®èi mµ cßn ñng hé §o¹n ThŞ.",
	"Hä cßn nãi g× n÷a?",
	"Hä b¶o ta ®Õn gÆp {Cao Qu¶n Quı Téc} ®Ó hái.",
	"VËy ng­¬i mau ®i hái ®i. Ng­êi mµ Miªu LÜnh nh¾c ®Õn ®ã ng­¬i cã quen kh«ng?",
	"Ph¶i hái {Cao Qu¶n Quı Téc} ®·, ta cßn ch­a biÕt {Quèc C«ng Cao Th¨ng TuyÒn} n÷a k×a.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,7);
	TaskTip("§Õn gÆp Cao Th¨ng TuyÒn");	
	Msg2Player("§Õn gÆp Cao Th¨ng TuyÒn");
	GivePlayerAward("Level_50","xn_step_4");
	GivePlayerWeapon("Level_52",1);
	GivePlayerExp(SkeyDali,"wujikeshi")
	return
end

--Î´Óë¸ßÉıÈª¶Ô»°
function task_011_00()

local strTalk = {
	"VËy ng­¬i mau ®i gÆp Quèc c«ng Cao Th¨ng TuyÒn, «ng Êy ë trong thµnh §¹i lı.",
	}
	TalkEx("",strTalk);
	return
end

--ÁìÈ¡Ö£¹áÖ®Õ®¿îÈÎÎñ
function task_012_00()

local strTalk = {};
 
	if Pay(100000) == 1 then
			
		strTalk = {
			"TrŞnh c« n­¬ng, {§æng Quèc S­} nhê ta chuyÓn {tiÒn hµng} cho c«.",
			"§¹ t¹ <sex>.",
			"Ng­¬i võa míi ®¸nh b¹i D¹ Xoa µ? VÊt v¶ cho ng­¬i qu¸!",
			"Sao c« n­¬ng biÕt chuyÖn nµy? Ta võa ®i gÆp {§æng Quèc S­}",
			"<sex> cã thÓ gióp ta ®­îc kh«ng?",
			"Xin cø nãi",
			"Vò n­¬ng ë Thµnh §« vµ BiÖn Kinh cßn nî ta mét mãn tiÒn, ng­¬i cã thÓ ®i lÊy vÒ gióp ta kh«ng?",
			"§­îc! Ta sÏ ®i ngay!",
			"Mçi ng­¬i cßn nî ta 10 l­îng, phiÒn b»ng h÷u nhĞ!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_ID,9);
		SetTask(TASK_DL_LV60_1_ID,1);
		SetTask(TASK_DL_LV60_2_ID,1);
		Msg2Player("Gióp TrŞnh Qu¸n Chi ®Õn BiÖn Kinh vµ Thµnh §« ®ßi nî.");
		TaskTip("Gióp TrŞnh Qu¸n Chi ®Õn BiÖn Kinh vµ Thµnh §« ®ßi nî.");
		GivePlayerExp(SkeyDali,"daikuanzhuanjiao")
	else
		strTalk = {
			"Sao? TiÒn bŞ mÊt råi?",
			}
		TalkEx("",strTalk);
	end;
end

--ÒÑ¾­ÁìÈ¡Ö£¹áÖ®Õ®¿îÈÎÎñºó
function task_013_00()

local strSay = {
		"Cã ®ßi ®­îc nî kh«ng?",
		"LÊy ®­îc råi!/task_015_00",
		"VÉn ch­a t×m ®­îc./Task_Exit"
	}

	SelectSay(strSay);
	return
end

--ÒÑ¾­ÁìÈ¡ÁËÖ£¹áÖ®µÄÕ®¿îÈÎÎñÓë³É¶¼ÎèÄï¶Ô»°
function task_014_11()

local strTalk = {
	"TiÒn nî cña {TrŞnh Qu¸n Chi µ}? Ng­¬i nãi lµ ta quªn råi.",
	"…………",
	"MÊy h«m tr­íc ®i ngang qua {§iÓm Th­¬ng s¬n} bŞ {Ngôc Háa Cuång Nh©n} ®¸nh lĞn! Cã thÓ gióp ta h¹ tªn nµy kh«ng?",
	"§­îc! §Ó ta gióp!",
	"{Ngôc Háa Cuång Nh©n} ë {§iÓm Th­¬ng S¬n}.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_1_ID,2);
	Msg2Player("§Õn §iÓm Th­¬ng S¬n ®¸nh b¹i Ngôc Háa Cuång Nh©n.");
	TaskTip("§Õn §iÓm Th­¬ng S¬n ®¸nh b¹i Ngôc Háa Cuång Nh©n.");
	return
end

--Î´É±ËÀÓü»ğ¿ñÈË
function task_014_21()

local strTalk = {
	"{Ngôc Háa Cuång Nh©n} ë {§iÓm Th­¬ng S¬n}.",
	}
	TalkEx("",strTalk);
	return
end

--ÒÑÉ±ËÀÓü»ğ¿ñÈËÈÎÎñ
function task_014_31()

local strTalk = {
	"Ta ®· ®¸nh b¹i h¾n råi.",
	"Tèt qu¸, {10 l­îng} ®©y. Xin nhËn lÊy!",
	}
	GivePlayerAward("Level_62","xn_step_1");
	GivePlayerExp(SkeyDali,"chengduwuniang")
--	Earn(100000);
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_1_ID,4);
		--Á½¸öÎèÄïÈÎÎñ¾ùÍê³Éºó
		if GetTask(TASK_DL_LV60_2_ID) == 3 then
			SetTask(TASK_DL_LV60_1_ID,5);
			SetTask(TASK_DL_LV60_2_ID,4);
			SetTask(TASK_DL_LV60_0_ID,1);
			Msg2Player("§· ®ßi ®­îc nî, quay l¹i t×m TrŞnh Qu¸n Chi.");
			TaskTip("§· ®ßi ®­îc nî, quay l¹i t×m TrŞnh Qu¸n Chi.");
		end	
	return
end

--ÒÑÍê³ÉÉ±ËÀÓü»ğ¿ñÈËÈÎÎñºóÎèÄï¶Ô»°
function task_014_41()

local strTalk = {
	"Ch¶ ph¶i ng­¬i ®· lÊy ®­îc nî råi sao, ta ch¼ng cßn nî nÇn g× víi hä TrŞnh Êy c¶.",
	}

	TalkEx("",strTalk);
	return
end

--ÁìÈ¡ÊÕ¼¯ÑªÑ»ÓğÈÎÎñ
function task_014_12()

local strTalk = {
	"Ng­¬i ®Õn gióp {TrŞnh Qu¸n Chi} ®ßi nî.",
	"§óng vËy, c« n­¬ng cã thÓ tr¶ nî chø?",
	"ThÕ nµy vËy, ta ®ang muèn may bé trang phôc míi nh­ng cßn thiÕu {10 HuyÕt Nha Vò}, cã thÓ gióp ta kh«ng?",
	"§­îc th«i.",
	"§Õn {B¹ch Thñy ®éng tÇng 2} ®¸nh {¸c lµ} cã thÓ t×m ®­îc {HuyÕt Nha Vò}.",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_2_ID,2)
	--CreateTrigger(0,261,KILL_DL_BLOODCROW);
	Msg2Player("§Õn B¹ch Thñy ®éng tÇng 2 ®¸nh ¸c lµ lÊy 10 HuyÕt Nha Vò.");
	TaskTip("§Õn B¹ch Thñy ®éng tÇng 2 ®¸nh ¸c lµ lÊy 10 HuyÕt Nha Vò.");
	return

end	

--Î´ÊÕ¼¯10¸öÑªÑ»Óğ
function task_014_22()

local strTalk = {
	"§Õn {B¹ch Thñy ®éng tÇng 2} ®¸nh {¸c lµ} cã thÓ t×m ®­îc {HuyÕt Nha Vò}.",
	}

	if GetItemCount(2,1,285) >= 10 then
		DelItem(2,1,285,10);
		strTalk = {
			"Ta ®· t×m ®ñ {10 HuyÕt Nha Vò}",
			"Tèt qu¸, 10 l­îng ®©y, xin nhËn lÊy!",
			}
--		Earn(100000);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_2_ID,3);
		GivePlayerAward("Level_62","xn_step_2");
		GivePlayerExp(SkeyDali,"bianjingwuniang")
		--Á½¸öÎèÄïÈÎÎñ¾ùÍê³Éºó
		if GetTask(TASK_DL_LV60_1_ID) == 4 then
			SetTask(TASK_DL_LV60_1_ID,5);
			SetTask(TASK_DL_LV60_2_ID,4);
			SetTask(TASK_DL_LV60_0_ID,1);
			Msg2Player("§· ®ßi ®­îc nî, quay l¹i t×m TrŞnh Qu¸n Chi.");
			TaskTip("§· ®ßi ®­îc nî, quay l¹i t×m TrŞnh Qu¸n Chi.");
		end
		return
	end
	--²¹·¢´¥·¢Æ÷
	--if GetTrigger(KILL_DL_BLOODCROW) == 0 then
		--CreateTrigger(0,261,KILL_DL_BLOODCROW);
		--Msg2Player("Ç°Íù°×Ë®¶´¶ş²ã´ÓÒ¹ÌäÑªÑ»ÉíÉÏÊÕ¼¯10¸öÑªÑ»Óğ");
		--TaskTip("Ç°Íù°×Ë®¶´¶ş²ã´ÓÒ¹ÌäÑªÑ»ÉíÉÏÊÕ¼¯10¸öÑªÑ»Óğ");
	--end
	TalkEx("",strTalk);
end

--ÒÑÍê³Éãê¾©ÎèÄïÈÎÎñ
function task_014_32()

local strTalk = {
	"Ch¶ ph¶i ng­¬i ®· lÊy ®­îc nî råi sao, ta ch¼ng cßn nî nÇn g× víi hä TrŞnh Êy c¶.",
	}
	TalkEx("",strTalk);
	return
end

--°ÑÇ·¿î»¹¸øÖ£¹áÖ®
function task_015_00()

local	strTalk = {};
	
	if Pay(200000) == 1 then
		strTalk = {
			"§a t¹! Ta ®· thu thËp ®­îc mét sè tin tøc cña Xi Háa gi¸o. Cao Quèc C«ng cÇn gÆp <sex>, h·y ®i t×m «ng Êy!",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV60_0_ID,2);
		SetTask(TASK_DL_LV60_1_ID,6);
		SetTask(TASK_DL_LV60_2_ID,5);
		GivePlayerAward("Level_62","xn_step_3");
		GivePlayerExp(SkeyDali,"shouhuidiaokuan")
	else
		strTalk = {
			"Hay lµ ®i ®­êng lµm rít råi",
		}
		TalkEx("",strTalk);
	end;
end


--Íê³ÉÖ£¹áÖ®µÄ»õ¿îÈÎÎñºóÁìÈ¡62¼¶ÈÎÎñÊ§×ÙµÄ»ï¼Æ
function task_016_00()

local strTalk = {
	"TrŞnh c« n­¬ng, cã tin tøc g× cña {Xi Háa gi¸o} kh«ng?",
	"MÊy h«m tr­íc ë Long Nh·n ®éng tÇng 1 cã tËp hîp mét sè Xi Háa Tr­ëng L·o, ®©y lµ nh÷ng nh©n vËt chñ yÕu cña Xi Háa gi¸o. Ta ®· cho ng­êi ®Õn ®ã dß la nh­ng kh«ng thÊy trë vÒ. LÇn nµy phiÒn b»ng h÷u nhĞ!",
	"{Long Nh·n ®éng} ë ®©u?",
	"Tõ §¹i Lı ®i vÒ phİa nam, ®Õn §iÓm Th­¬ng s¬n th× nh×n thÊy Long Nh·n ®éng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,1);
	Msg2Player("Vµo Long Nh·n ®éng th¨m dß");
	TaskTip("Vµo Long Nh·n ®éng th¨m dß");
	return
end

--Î´Ç°ÍùÁúÑÛ¶´²é¿´
function task_017_00()

local strTalk = {
	"Tõ §¹i Lı ®i vÒ phİa nam, ®Õn §iÓm Th­¬ng s¬n th× nh×n thÊy Long Nh·n ®éng.",
	}

	TalkEx("",strTalk);
	return
end

--Ç°ÍùÁúÑÛ¶´²é¿´ºó»ØÀ´»ã±¨
function task_018_00()

local strTalk = {
	"<sex> vÒ råi ­? T×nh h×nh ë ®ã thÕ nµo?",
	"{Long Nh·n ®éng tÇng 1} kh¾p n¬i ®Òu lµ {Kh«i Lçi §éc Nh©n}, trong ®éng cßn cã mét sè {Xi Háa Tr­ëng L·o}",
	"VËy ­?...<sex> cã thÓ gióp ta ®­îc kh«ng?",
	"TrŞnh c« n­¬ng cø nãi.",
	"<sex> cã thÓ gióp ta giÕt Kh«i Lçi §éc Nh©n vµ Xi Háa tr­ëng l·o ®­îc kh«ng?",
	"Ta nhÊt ®Şnh sÏ gióp c«.",
	"Xin <sex> gióp ta tiªu trõ15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o ë Long Nh·n ®éng tÇng 1.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,3);
	CreateTrigger(0,262,KILL_DL_CREATUREMAN);
	CreateTrigger(0,263,KILL_DL_CHIHUO_ELDER);
	Msg2Player("§Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.");
	TaskTip("§Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.");
	GivePlayerAward("Level_63","xn_step_1");
	GivePlayerExp(SkeyDali,"xunzhaohuoji")
	return

end

--²¹Áì¿şÀÜ¶¾ÈËºÍò¿»ğ³¤ÀÏ´¥·¢Æ÷
function task_019_00()

local strTalk = {
	"Nhê <sex>®Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.",
	}

	if GetTrigger(KILL_DL_CREATUREMAN) == 0 then
		CreateTrigger(0,262,KILL_DL_CREATUREMAN);
		Msg2Player("§Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.");
		TaskTip("§Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.");
	end;
	if GetTrigger(KILL_DL_CHIHUO_ELDER) == 0 then
		CreateTrigger(0,263,KILL_DL_CHIHUO_ELDER);
		Msg2Player("§Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.");
		TaskTip("§Õn Long Nh·n ®éng tÇng 1 giÕt 15 Kh«i Lçi §éc Nh©n vµ 15 Xi Háa Tr­ëng L·o.");
	end;
	
	TalkEx("",strTalk);
	return
end

--É±ËÀ¿şÀÜ¶¾ÈËºÍò¿»ğ³¤ÀÏºó
function task_020_00()

local strTalk = {
	"Ta ®· thay c« n­¬ng b¸o thï cho {§iÕm Háa KÕ} råi.",
	"§a t¹! B¹ch Doanh Doanh gi¸o chñ Ngò §éc gi¸o cho ng­êi ®Õn t×m. <sex> mau ®Õn ®ã mét chuyÕn!",
	"§Ö tö tu©n lÖnh!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,5);
	Msg2Player("B¹ch Doanh Doanh gi¸o chñ Ngò §éc gi¸o ph¸i ng­êi ®Õn t×m ng­¬i.");
	TaskTip("B¹ch Doanh Doanh gi¸o chñ Ngò §éc gi¸o ph¸i ng­êi ®Õn t×m ng­¬i.");
	GivePlayerAward("Level_63","xn_step_2","weapon","Level_64");
	GivePlayerExp(SkeyDali,"huojishizhong")
end

--Î´È¥¼ûÎå¶¾½Ì½ÌÖ÷
function task_021_00()

local strTalk = {
	"B¹ch Doanh Doanh gi¸o chñ Ngò §éc gi¸o cho ng­êi ®Õn t×m ng­¬i, ng­¬i mau ®Õn ®ã mét chuyÕn ®i.",
	}

	TalkEx("",strTalk);
	return
end

--ÊÕ¼¯Íê10ÕÅ´óÀí¾ÉÖ¾ºóÕÒÖ£¹áÖ®¶Ô»°1
function task_022_00()

local strTalk = {
	"<sex> vÊt v¶ qu¸!",
	"Kh«ng cÇn kh¸ch s¸o, ta cã vµi ®Òu muèn nãi víi c« n­¬ng.",
	"<sex> nãi ®i.",
	"Sao c« n­¬ng quan t©m ®Õn {Xi Háa gi¸o} ®Õn vËy?",
	"ê, ngay khi ta võa míi ®Õn §¹i Lı lµm ¨n ®· bŞ Xi Háa gi¸o g©y khã dÔ nªn mèi hËn nµy khã quªn.",
	"VËy sao c« n­¬ng kh«ng rêi khái ®©y. {§¹i Lı} nguy hiÓm nh­ vËy kh«ng ph¶i lµ n¬i lµm ¨n tèt.",
	"Ta thİch n¬i nµy, thiªn thêi ®Şa lîi ta kh«ng muèn rêi khái ®©y.",
	"Bëi vİ c« n­¬ng lµ ng­êi {§¹i Lı}, ®óng kh«ng?",
	"…"
	}
	TalkEx("task_022_01",strTalk);
end

--ÊÕ¼¯Íê10ÕÅ´óÀí¾ÉÖ¾ºóÕÒÖ£¹áÖ®¶Ô»°2
function task_022_01()

local strTalk = {
	"Th©n thÕ cña c« n­¬ng ta rÊt râ. C« n­¬ng thuéc {lôc ®¹i gia téc} ë {§¹i Lı} nµy. LÇn nµy {§¹i Lı} néi lo¹n c« n­¬ng ®Õn ®©y gi¶ lµm ng­êi bu«n b¸n ®Ó theo dâi nhÊt cö nhÊt ®éng cña {Xi Háa gi¸o}. Ta nãi vËy ®óng kh«ng?",
	"…",
	"<sex> kh«ng ngê l¹i hiÓu ta ®Õn vËy. Kh«ng sai, ta thuéc hä TrŞnh, trong mét trong lôc ®¹i gia téc ë ®©y.",
	"…………",
	"Ta lín lªn ë TuyÒn Ch©u, nh­ng gia téc ta tr­íc giê rÊt quan t©m ®Õn t×nh h×nh cña §¹i Lı. LÇn nµy §¹i Lı néi lo¹n míi ph¸i ta ®Õn ®©y ®Ó th¨m dß tin tøc cña Xi Háa gi¸o.",
	"Sao c¸c ng­êi l¹i quan t©m ®Õn {Xi Háa gi¸o} ®Õn vËy?",
	}
	TalkEx("task_022_02",strTalk);
end
	
--ÊÕ¼¯Íê10ÕÅ´óÀí¾ÉÖ¾ºóÕÒÖ£¹áÖ®¶Ô»°3
function task_022_02()

local strTalk = {
	"Vò Di s¬n thuéc B¾c TuyÒn Ch©u cã L­ìng Thñy ®éng. Xi Háa gi¸o ®å th­êng xuÊt hiÖn ë ®ã, hái ra míi biÕt chóng cã quan hÖ víi Ma H« La Ca.",
	"{Ma H« La Ca}?",	
	"Con ng­êi nµy h×nh d¸ng kú dŞ, ®Çu ng­êi th©n r¾n. Ma H« La Ca lµ tªn mäi ng­êi gäi ®Ó x­ng tông h¾n. Thùc chÊt h¾n lµ mét trong nh÷ng hung thñ giÕt gia téc hä TrŞnh ta.",
	"Ch¶ tr¸ch gia téc c« n­¬ng l¹i l­u t©m ®Õn hä nh­ vËy.",
	}
	TalkEx("task_022_03",strTalk);
end

--ÊÕ¼¯Íê10ÕÅ´óÀí¾ÉÖ¾ºóÕÒÖ£¹áÖ®¶Ô»°4
function task_022_03()
local strTalk = {
	"§óng vËy, môc ®İch cña ta ®Õn §¹i Lı lÇn nÇy ®Ó th«ng qua Xi Háa gi¸o t×m ra tung tİch cña Ma H« La Ca.",
	"VËy dßng hä c« n­¬ng kh«ng cßn o¸n h©n {D­¬ng Gia} n÷a chø, kh«ng muèn ®o¹t l¹i ng«i vŞ {hoµng téc tõ hä §oµn} µ?",	
	"N¨m ®ã D­¬ng Gia ®· nhê Ha M« La Ca giÕt s¹ch téc TrŞnh, may ta tho¸t ®­îc. Nh­ng chuyÖn nµy còng ®· l©u råi, hËu nh©n cña D­¬ng Gia kh«ng trùc tiÕp lµm chuyÖn ®ã ta kh«ng muèn b¸o thï hä. Nh­ng cßn tªn qu¸i vËt Ha M« La Ca th× suèt ®êi nµy ta kh«ng thÓ nµo tha cho h¾n.",
	"C« n­¬ng ®· t×m ra tung tİch g× cña {Ma H« La Ca} ch­a?",
	}
	TalkEx("task_022_04",strTalk);
end

--ÊÕ¼¯Íê10ÕÅ´óÀí¾ÉÖ¾ºóÕÒÖ£¹áÖ®¶Ô»°5
function task_022_04()

local strTalk = {
	"...Cã!",
	"Qu¸i vËt ®ã hiÖn giê ë ®©u?",
	"Ha M« La Ca rÊt cã kh¶ n¨ng h¾n ®ang ë phİa b¾c T©y Song B¶n N¹p. H¾n ®­îc Xi Háa gi¸o gäi ®Õn ®ã ®Ó phôc håi søc m¹nh. HiÖn giê søc lùc cña h¾n håi phôc ch­a ®­îc nhiÒu. <sex> h·y tranh thñ thêi gian ®Õn ®ã ®¸nh b¹i h¾n. Tiªu trõ ®­îc tªn qu¸i vËt nµy c¶ gia téc hä TrŞnh ta suèt ®êi ghi ¬n ng­¬i.",
	"Qu¸i vËt ®ã nguy hiÓm nh­ vËy, ta nhÊt ®Şnh ph¶i gióp c« n­¬ng råi.",
	"§a t¹ <sex>! Ma H« La Ca hiÖn ë phİa b¾c T©y Song B¶n N¹p. Tèt nhÊt nªn cã ®ång ®éi hç trî.",
	"Ta biÕt råi!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,7);
	GivePlayerExp(SkeyDali,"zhengshihouren")
	Msg2Player("§Õn t©y Song B¶n N¹p giÕt Ma H« La Ca.");
	TaskTip("§Õn t©y Song B¶n N¹p giÕt Ma H« La Ca.");
	return
end

--Î´´ò°ÜÄ¦ºôÂŞåÈ¶Ô»°
function task_023_00()

local strTalk = {
	". <sex> nªn cã sù hç trî cña ®ång ®éi!",
	}
	
	TalkEx("",strTalk);
	return
end

--´ò°ÜÄ¦ºôÂŞåÈºó¶Ô»°
function task_024_00()

local strTalk = {
	"Ng­¬i ®· diÖt ®­îc Ma H« La Ca råi ­?",
	"§óng vËy.",
	"Ng­¬i qu¶ lµ h¶o h¸n, c¶ TrŞnh téc ta mang ¬n <sex>.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,9);
	GivePlayerAward("Level_80","xn_step_1",nil,nil,"YunTie",2);
	GivePlayerWeapon("Level_76",1);
	GivePlayerExp(SkeyDali,"weizhengshifuchou")
	return
end


--¿Õº¯Êı£¬²»×öÈÎºÎÊÂÇé	
function Task_Exit()
end;