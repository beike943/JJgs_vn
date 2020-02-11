-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí58¼¶ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2006/01/10 PM 17:02

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--ËÎ³¯ÊÖĞÅ
GiftData = {
	[1] = {2,0,374,"C¸ sÊy kh«"},
	[2] = {2,0,375,"VŞt quay"},
	[3] = {2,0,376,"Ngçng hÊp ®Ëu xanh"},
	[4] = {2,0,377,"B¸nh tæ"},
	[5] = {2,0,378,"B¸nh İt mÆn"},
}

--ÁìÈ¡½Óº¢×ÓÈÎÎñ
function task_000_00()

local strTalk = {
	"Nghe nãi <sex> ë §¹i Lı ®· gióp rÊt nhiÒu ®¹i sù! Quèc s­ ta còng v« cïng c¶m kİch <sex>.",
	"Quèc s­ qu¸ khen, cã g× chØ b¶o t¹i h¹ kh«ng?",
	"Kh«ng d¸m! Cã thÓ thay l·o phu ®Õn Thiªn Ba D­¬ng Phñ mét chuyÕn kh«ng?",
	"Cã chuyÖn g× sao?",
	"Nhi tö §æng Ca Minh ®Õn D­¬ng M«n häc vâ, muèn vÒ th¨m phô th©n, nh­ng ch­a quen ®­êng thuéc lèi, phiÒn <sex> ®Õn D­¬ng M«n ®ãn vÒ.",
	"T¹i h¹ ®i ngay!",
	"§a t¹ <sex>. PhiÒn <sex> ®Õn D­¬ng M«n b¸o l¹i cho Xa Th¸i Qu©n biÕt viÖc nµy!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV55_ID,6);
	GivePlayerExp(SkeyDali,"daliguoshi")
	CreateTrigger(4,202,TALK_DL_SHETAIJUN);
	Msg2Player("§Õn D­¬ng M«n t×m Xa Th¸i Qu©n ®­a §æng c«ng tö vÒ §¹i Lı.");
	TaskTip("§Õn D­¬ng M«n t×m Xa Th¸i Qu©n ®­a §æng c«ng tö vÒ §¹i Lı.");
	return
	
end

--Î´µ½ÙÜÌ«¾ı´¦½Óº¢×Ó
function task_001_00()

local strTalk = {
	"PhiÒn <sex> ®Õn D­¬ng M«n t×m Xa Th¸i Qu©n",
	}

	TalkEx("",strTalk);
	--²¹ÁìÙÜÌ«¾ı¶Ô»°´¥·¢Æ÷
	if GetTrigger(SheTaiJun_Talk) == 0 then
		CreateTrigger(4,202,TALK_DL_SHETAIJUN);
		Msg2Player("§Õn D­¬ng M«n t×m Xa Th¸i Qu©n ®­a §æng c«ng tö vÒ §¹i Lı.");
		TaskTip("§Õn D­¬ng M«n t×m Xa Th¸i Qu©n ®­a §æng c«ng tö vÒ §¹i Lı.");
	end;
	return
end

--´øº¢×Óµ½´ïÄ¿µÄµØ
function task_002_00()

local nItemOk = buy_all_gift()

	if nItemOk == 1 then
		strTalk = {
			"§æng Quèc s­, {c«ng tö} b×nh an trë vÒ cßn ®em vÒ {v« sè vËt phÈm} tõ {§¹i Tèng}.",
			"Nh÷ng mãn ®Æc s¶n nµy ®Òu do vŞ <sex> nµy mua gióp. Cha mau th­ëng cho <sex> ®i!",
			}
  	
		KillFollower();--È¥µô¸úËæµÄĞ¡º¢
		SetTask(TASK_DL_LV55_ID,8);
		--UseScrollEnable(1);--¿ÉÒÔÊ¹ÓÃ»Ø³Ì·û
		--SetDeathScript("");--³·ÏúÍæ¼ÒËÀÍö½Å±¾
		RemoveTrigger(GetTrigger(TALK_DL_SHETAIJUN));
		TalkEx("task_002_01",strTalk);

	else
		strTalk = {
			"Cha! Con cã viÖc gÊp, sÏ quay l¹i sau!",
			}
		TalkEx("",strTalk);
	end
end

--»¤ËÍ¶­åÈÃ÷»Ø¼ÒºóÁìÈ¡½±ÀøÑ¡Ôñ
function task_002_01()

local strSay = {
	"Cã chót thµnh ı, xin nhËn cho!",
	"§a t¹!/#reward(1)",
	"ChØ lµ viÖc män, sè ng©n l­îng nµy t¹i h¹ kh«ng d¸m nhËn!/#reward(2)",
	}
	
	SelectSay(strSay);
	GivePlayerAward("Level_58", "xn_step_2");
	GivePlayerExp(SkeyDali,"teshecai")
end

function reward(nkind)

local strTalk = {
	"ThËt sù c¶m ¬n <sex>! Xin <sex>h·y nghØ ng¬i! Sau nµy cßn sÏ nhê ®Õn <sex>.",
	}
	TalkEx("",strTalk);
	
	if nkind == 1 then -- ¸øÍæ¼Ò½ğÇ®
		Earn(250000);
	else -- ¸øÍæ¼ÒÉùÍû
		ModifyReputation(10,0);
	end;
end


--ÒÑ¾­Íê³É´óËÍÃû²ËÈÎÎñ    
function task_003_00()

local strTalk = {};

	if GetLevel() >= 55 then
		strTalk = {
			"<sex> cã tin vui g× kh«ng?",
			"Tai h¹ cã thÓ gióp g× cho Quèc s­ kh«ng?",
			"Cã viÖc nµy muèn nhê <sex> gióp ®ì, nh­ng do mÊy h«m tr­íc thÊy <sex> vÊt v¶ nªn kh«ng d¸m nhê!",
			"T¹i h¹ lµ ng­êi häc vâ chØ bá chót c«ng søc ®©u cã ®¸ng g×, xin Quèc s­ cø nãi!",
			"B¹ch Thñy ®éng ë Vò L¨ng s¬n cã rÊt nhiÒu D¬i ®éc. <sex> cã thÓ gióp ta b¾t 20 con kh«ng?",
			"§­îc! T¹i h¹ ®i ngay!",
			}
		
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV55_ID,9);
		SetTask(TASK_DL_LV60_ID,1);
		CreateTrigger(0,260,KILL_DL_POISONBAT);
		Msg2Player("§Õn B¹ch Thñy ®éng giÕt 20 D¬i ®éc.");
		TaskTip("§Õn B¹ch Thñy ®éng giÕt 20 D¬i ®éc.");
			
	else	
		strTalk = {
			"Xin <sex> h·y nghØ ng¬i mét thêi gian!",
			}
		TalkEx("",strTalk); 

	end
end


--¸ú¾ÆÂ¥ÀÏ°åÂòÊÖĞÅ¶Ô»°
function buy_gift_talk(index)

local strSay = {
	"Kh¸ch quan muèn dïng g×? "..GiftData[index][4].." kh¸ch quan cã muèn mua kh«ng?",
	"Mua 1 phÇn/#buy_gift("..index..")",
	"Kh«ng mua/no"
	}
	SelectSay(strSay)
	return
end

--¹ºÂòÊÖĞÅ
function buy_gift(index)

local strTalk = {};
	
	if Pay(50000) == 1 then
		AddItem(GiftData[index][1],GiftData[index][2],GiftData[index][3],1,1)
		strTalk = {"§a t¹, ®a t¹!"};
		TalkEx("",strTalk);
	else
		strTalk = {"Kh«ng cã ng©n l­îng µ?"};
		TalkEx("",strTalk);
	end
end

--ÅĞ¶ÏÊÇ·ñÂòµ½5ÑùÊÖĞÅ
--·µ»ØÖµ£º1 È«²¿Âòµ½£»0 Ã»ÓĞÂòÈ«
function buy_all_gift()

local	i = 0;
	
	for i = 1,5 do
		if GetItemCount(GiftData[i][1],GiftData[i][2],GiftData[i][3]) <= 0 then
			return 0
		end;
	end
	
	for i=1,5 do
		DelItem(GiftData[i][1],GiftData[i][2],GiftData[i][3],1);
	end
	return 1
end 

--ÁìÈ¡ÁËÉ±ËÀ20¸ö¶¾òğÈÎÎñºó
function task_009_00()

local strTalk = {
	"§Õn tÇng 1 B¹ch Thñy ®éng (Vò L¨ng s¬n) giÕt 20 D¬i ®éc tr­íc ®·!.",
	}
	
	if	GetTrigger(KILL_DL_POISONBAT) == 0 then
		CreateTrigger(0,260,KILL_DL_POISONBAT);
		Msg2Player("§Õn B¹ch Thñy ®éng giÕt 20 D¬i ®éc.");
		TaskTip("§Õn B¹ch Thñy ®éng giÕt 20 D¬i ®éc.");
	end;
	
	TalkEx("",strTalk);
	return
end

--ÒÑ¾­É±ËÀ20¶¾òğºó
function task_010_00()

local strTalk = {
		"VÒ råi ­? Cßn viÖc g× t¹i h¹ cã thÓ gióp ®­îc kh«ng?",
		"Xi Háa gi¸o ®å gÇn ®©y l¹i xuÊt hiÖn ë B¹ch Thñy ®éng, thñ lÜnh cña chóng lµ tªn Xi Háa ¸c T¨ng v« cïng lîi h¹i, §¹i Tèng ®· cö bao nhiªu binh sÜ ®Õn tiªu trõ bän chóng ®Òu kh«ng thÊy trë vÒ.",
		"{Xi Háa ¸c T¨ng}? ¸c T¨ng nghÜa lµ g×?",
		"Ta còng kh«ng râ, cã lÏ bän chóng ®äc s¸ch kh«ng nhiÒu nªn dïng sai ch÷.",
		"Quèc s­ cã muèn tiªu trõ tªn {Xi Háa ¸c T¨ng} ®ã kh«ng?",
		"<sex> hiÖn ch­a håi phôc, sî <sex> ch­a ph¶i lµ ®èi thñ cña Xi Háa ¸c t¨ng",
		"Quèc s­ yªn t©m, cø chê tin vui cña h¹i h¹.",
		"NÕu vËy th× tr«ng nhê vµo <sex>. Xi Háa ¸c T¨ng ë tÇng 1 B¹ch Thñy ®éng.",
		}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,3);
	Msg2Player("§Õn B¹ch Thñy ®éng tÇng 1 diÖt Xi Háa ¸c T¨ng.");
	TaskTip("§Õn B¹ch Thñy ®éng tÇng 1 diÖt Xi Háa ¸c T¨ng.");
	GivePlayerAward("Level_60", "xn_step_1");
	GivePlayerExp(SkeyDali,"baishuidong")
	return
	
end

--Î´É±ËÀò¿»ğÉ®¶ñ¶Ô»°
function task_011_00()

local strTalk = {
	"Xi Háa ¸c T¨ng ë tÇng 1 B¹ch Thñy ®éng. <sex> nhí b¶o träng!",
	}

	TalkEx("",strTalk);	
	return
	
end

--ÒÑ¾­É±ËÀò¿»ğÉ®¶ñ¶Ô»°
function task_112_00()

local strTalk = {
		"<sex> vÊt v¶ qu¸!",
		"Kh«ng sao, t¹i h¹ d­ søc ®Ó giÕt h¾n.",
		"Sau nµy cßn nhiÒu viÖc nhê ®Õn <sex>, b©y giê h·y nghØ ng¬i ®·!",
		}

	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,5);
	GivePlayerAward("Level_60", "xn_step_2","chest","Level_61");
	GivePlayerExp(SkeyDali,"cihuoesheng")
	return
end

--ÁìÈ¡°×Ë®¶´ÈÎÎñ
function task_013_00()

local strTalk = {
	"Quèc s­ cßn cã g× chØ b¶o?",
	"Xi Háa Gi¸o ®å ®ang tô tËp ë Vò L¨ng s¬n. <sex> biÕt chuyÖn nµy ch­a?",
	"Tr­íc ®©y mÊy ngµy {Cao Quèc C«ng Cao Th¨ng TuyÒn} cã sai t¹i h¹ ®Õn ®ã.",
	"C¸ch ®©y kh«ng l©u B¹ch Thñy ®éng l¹i xuÊt hiÖn D¹ Xoa, h¾n ®· s¸t h¹i bao nhiªu ng­êi ®i qua ®ã. LÇn nµy phiÒn b»ng h÷u ®Õn ®ã mét chuyÕn!",
	"BÊt luËn chóng lîi h¹i thÕ nµo, t¹i h¹ còng kh«ng chèi tõ.",
	"<sex> qu¶ lµ hµo hiÖp, nh­ng nÕu <sex> cã ®ång ®éi hç trî sÏ tèt h¬n!",
	"T¹i h¹ biÕt råi, lËp tøc ®Õn {B¹ch Thñy ®éng} ®©y.",
	"Xin <sex> b¶o träng!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,6);
	Msg2Player("§Õn B¹ch Thñy ®éng tÇng 2 ®¸nh b¹i D¹ Xoa (227.212).");
	TaskTip("§Õn B¹ch Thñy ®éng tÇng 2 ®¸nh b¹i D¹ Xoa (227.212).");
	
	return
	
end

--ÒÑ¾­ÁìÈ¡ÁË°×Ë®¶´ÈÎÎñ
function task_014_00()

local strTalk = {
	"D¹ Xoa ë tÇng 2 B¹ch Thñy ®éng. <sex> nhí b¶o träng!",
	}

	TalkEx("",strTalk);	
	return
end

--ÒÑ¾­É±ËÀÒ¹²æ¶Ô»°
function task_015_00()

local strTalk = {
	"VÒ råi µ?",
	"T¹i h¹ ®· ®¸nh b¹i {D¹ Xoa}! MÖt chÕt ®i ®­îc!",
	"§a t¹ <sex>, lÇn nµy may mµ nhê cã <sex> gióp ®ì. LÇn tr­íc ta cßn nî TrŞnh c« n­¬ng 10 l­îng. <sex> cã thÓ gióp ta ®em ®Õn ®ã ®­îc kh«ng?",
	"§­¬ng nhiªn lµ ®­îc råi!",
	"§a t¹ <sex>, xin ®em 10 l­îng nµy ®Õn cho TrŞnh Qu¸n Chi!",
	}
	Earn(100000);
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV60_ID,8);
	Msg2Player("§em ng©n l­îng ®Õn §¹i Lı cho TrŞnh Qu¸n Chi.");
	TaskTip("§em ng©n l­îng ®Õn §¹i Lı cho TrŞnh Qu¸n Chi.");
	GivePlayerAward("Level_61", "xn_step_1",nil,nil,"YunTie",1);
	GivePlayerExp(SkeyDali,"cihuoyecha")
	GivePlayerEquipment("head","Level_64",1);
	GivePlayerEquipment("legs", "Level_66",1);
	return
	
end

--ÒÑ¾­Íê³ÉÒ¹²æÈÎÎñ
function task_016_00()

local strTalk = {
	"Ng­êi §¹i Tèng thËt biÕt lµm ¨n!",
	}
	
	TalkEx("",strTalk);
	return
end

--ÒÑ¾­Íê³Éò¿»ğ½ÌµÄÌôÕ½ÊéÈÎÎñ
function task_017_00()

local strTalk = {};
	
	--80¼¶·½ÄÜ½ÓÈÎÎñ
	if GetLevel() >= 80 then
		strTalk = {
			"Sù viÖc cña NhŞ Hoµng Tö v« cïng cÊp b¸ch, phiÒn <sex> ®Õn §¹i Lı tiªu trõ qu©n ph¶n lo¹n.",
			"T¹i h¹ ®i ngay!",
			"§Çu lÜnh qu©n ph¶n lo¹n còng lµ ®éi tr­ëng hé vÖ cña NhŞ Hoµng Tö tªn §oµn Thõa ¢n, tªn nµy lµ mét cao thñ cã tiÕng ë §¹i Lı.",
			"HiÖn giê hä ë ®©u?",
			"NhÊt ®Şnh ph¶i ®¸nh b¹i §oµn Thõa ¢n!",
			} 	           
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV80_ID,1);
		SetTask(TASK_DL_LV70_ID,5);
		Msg2Player("§Õn phİa nam T©y Song B¶n N¹p ®¸nh b¹i §oµn Thõa ¢n.");
		TaskTip("§Õn phİa nam T©y Song B¶n N¹p ®¸nh b¹i §oµn Thõa ¢n.");
	else
		strTalk = {
			"ThÕ lùc cña NhŞ Hoµng Tö ®ang rÊt m¹nh, hiÖn giê ta kh«ng ph¶i lµ ®èi thñ cña chóng. <sex> cÇn ph¶i rÌn luyÖn thªm n÷a!",
			}
		TalkEx("",strTalk);
	end
end

--Î´´òµ¹¶Î³Ğ¶÷Ö®Ç°¶Ô»°
function task_018_00()

local strTalk = {
	"§oµn Thõa ¢n ë phİa §«ng nam T©y Song B¶n N¹p.",
	}
	
	TalkEx("",strTalk);
	return
end

--Óë¶ş»Ê×Ó¶Ô»°ºó
function task_019_00()
                      
local nTime = GetTime();                      
local strTalk = {
	"<sex> vÒ råi µ? Mäi viÖc thÕ nµo?",
	"T¹i h¹ ®· gÆp {NhŞ Hoµng Tö} nghe nãi lµ bŞ oan, trong {chiÕu ch­ cña Tiªn ®Õ §¹i Lı} vÉn muèn h¾n tiÕp tôc kÕ vŞ.",
	"Cã chuyÖn nµy ­? ThËt buån c­êi, h¾n cã g× ®Ó chøng minh?",
	"H¾n ®­a cho t¹i h¹ {chiÕu th­ cña Tiªn ®Õ}, kh«ng biÕt thËt hay gi¶.",
	"Ng­¬i ®­a ta xem!",
	"…",
	"§óng lµ bót tİch cña Tiªn ®Õ.",
	"VËy ph¶i lµm sao?",
	"Ta thÊy Tam Hoµng Tö míi xøng ®¸ng lµ ng­êi kÕ vŞ, nh­ng ı tiªn ®Õ ®· nh­ vËy chi b»ng ph¶i xem l¹i. Cã tin g× ta sÏ b¸o l¹i ng­¬i sau.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,4);
	DelItem(2,0,381,1);--É¾È¥¶ş»Ê×ÓµÄĞÅÎï
	SetTask(TASK_DL_LV80_TIME_ID,nTime);
	Msg2Player("§îi tin cña §æng Quèc S­");
	TaskTip("§îi tin cña §æng Quèc S­");
	GivePlayerAward("Level_76", "xn_step_2",nil,nil,"YunTie",1);
	GivePlayerEquipment("head","Level_72",1);
	GivePlayerEquipment("chest","Level_70",1);
	GivePlayerEquipment("legs","Level_74",1);
	return
end

--Óë¶­åÈÂŞ¶Ô»°£¬ÁìÈ¡´ò°ÜÇ¬´ïÆÅÈÎÎñ1
function task_019_01()

local strTalk = {};
local nTime = GetTime() - GetTask(TASK_DL_LV80_TIME_ID);

	--ÔÚÏßÊ±¼ä20·ÖÖÓÖ®ºó
	if nTime >= 1200 then
		strTalk = {
			"{§æng Quèc S­}, sù viÖc thÕ nµo råi?",
			"Kh«ng xong råi, Tam Hoµng Tö kh«ng chŞu tho¸i vŞ. Ta ®Şnh dïng uy lùc ®Ó bøc h¾n tho¸i vŞ. Kh«ng ngê h¾n l¹i ®­îc ng­êi cña Thiªn TÇm Th¸p hç trî ®­a vµo Thiªn TÇm Th¸p råi, kh«ng cßn c¸ch nµo kh¸c.",
			"VËy giê ph¶i lµm sao?",
			"<sex>, §¹i Lı nµy chØ cã m×nh <sex> lµ vâ c«ng cao c­êng. Mau truy b¾t Tam Hoµng Tö!",
			"§­îc th«i!",
			}
		TalkEx("task_019_02",strTalk);
	else
		strTalk = {
			"T¹m thêi ch­a cã tin tøc g×! Quay l¹i sau nhĞ!",
			}
		TalkEx("",strTalk);
	end
end

--Óë¶­åÈÂŞ¶Ô»°£¬ÁìÈ¡´ò°ÜÇ¬´ïÆÅÈÎÎñ2
function task_019_02()

local strTalk = {};
strTalk = {
		"Tam Hoµng Tö rÊt thİch ph¸o, h¾n hiÖn ë tÇng cuèi cïng cña Thiªn TÇm Th¸p. Ng­¬i ph¶i ®¸nh b¹i Cµn §¹t Bµ hé vÖ cña h¾n lÊy ®­îc ph¸o. Sau ®ã ®èt ph¸o lµm tİn hiÖu gäi h¾n ra.",
		"{Cµn §¹t Bµ} ë ®©u?",
		"H¾n hiÖn ë tÇng 1 Thiªn TÇm Th¸p.",
	}		
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_TIME_ID,1);--ÒÑ¾­µÈºò20·ÖÖÓ±êÖ¾
	Msg2Player("§Õn tÇng 1 Thiªn TÇm Th¸p ®¸nh b¹i Cµn §¹t Bµ");
	TaskTip("§Õn tÇng 1 Thiªn TÇm Th¸p ®¸nh b¹i Cµn §¹t Bµ");
end	

--Î´´òµ¹Ç¬´ïÆÅÇ°Óë¶­åÈÂŞ¶Ô»°
function task_020_00()

local strTalk = {
	"Cµn §¹t Bµ ë tÇng 1 Thiªn TÇm Th¸p.",
	}
	
	TalkEx("",strTalk);
	return
end

--´òµ¹Ç¬´ïÆÅºóÓë¶­åÈÂŞ¶Ô»°£¬ÁìÈ¡É±ËÀ½ôÄÇÂŞÈÎÎñ
function task_021_00()

local strTalk = {
	"§· lÊy ®­îc {ph¸o hiÖu}, nh­ng ch­a cã {ngßi næ}.",
	"Ngßi næ ®ang ë chç KhÈn Na La, ng­¬i ph¶i ®¸nh b¹i h¾n míi lÊy ®­îc.",
	"{KhÈn Na La} ë ®©u?",
	"H¾n ë tÇng 2 Thiªn TÇm Th¸p.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,6);
	DelItem(2,0,382,1);--É¾È¥Ç¬´ïÆÅĞÅÎï
	Msg2Player("§Õn tÇng 2 Thiªn TÇm Th¸p ®¸nh b¹i KhÈn Na La.");
	TaskTip("§Õn tÇng 2 Thiªn TÇm Th¸p ®¸nh b¹i KhÈn Na La.");
	GivePlayerAward("Level_81","xn_step_1");		
	GivePlayerExp(SkeyDali,"qiandapo")
	return
end

--Î´´òµ¹½ôÄÇÂŞÇ°Óë¶­åÈÂŞ¶Ô»°
function task_022_00()

local strTalk = {
	"KhÈn Na La ë tÇng 2 Thiªn TÇm Th¸p.",
	}
	
	TalkEx("",strTalk);
	return
end

--´òµ¹½ôÄÇÂŞºóÓë¶­åÈÂŞ¶Ô»°£¬ÁìÈ¡Ç°Íù´ò°ÜÈı»Ê×ÓÈÎÎñ
function task_023_00()

local strTalk = {
	"T¹i h¹ ®· lÊy ®­îc {ngßi næ}.",
	"B©y giê ng­¬i cã thÓ ®Õn tÇng 3 Thiªn TÇm Th¸p t×m Ph¸o hiÖu ®­îc råi!",
	"§Ö tö tu©n lÖnh!",
	"<sex> ph¶i cÈn thËn, cËn vÖ cña Tam Hoµng Tö ®Òu lµ nh÷ng cao thñ!",
	"Ta biÕt råi!",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,8);
	DelItem(2,0,383,1);--É¾È¥ÒıÏß
	AddItem(2,0,384,1,1);--µÃµ½ÕÙ»½Èı»Ê×ÓÎï¼ş
	Msg2Player("§Õn tÇng 3 Thiªn TÇm Th¸p dïng ph¸o hiÖu ®Ó gäi Tam Hoµng Tö");
	TaskTip("§Õn tÇng 3 Thiªn TÇm Th¸p dïng ph¸o hiÖu ®Ó gäi Tam Hoµng Tö");
	GivePlayerAward("Level_81","xn_step_2");
		GivePlayerExp(SkeyDali,"jinnaluo")
	return
end

--Î´´òµ¹Èı»Ê×ÓÇ°Óë¶­åÈÂŞ¶Ô»°£¨²¹ÁìÕÙ»½Èı»Ê×ÓÎïÆ·£©
function task_024_00()

local strTalk = {
	"<sex> ®Õn tÇng 3 Thiªn TÇm Th¸p dïng Ph¸o HiÖu gäi Tam Hoµng Tö, nh­ng bªn c¹nh h¾n lu«n cã nh÷ng cËn vÖ ®¾c lùc. Ph¶i b¶o träng!",
	}
	
	TalkEx("",strTalk);
	if GetItemCount(2,0,384) <= 0 then
		AddItem(2,0,384,1,1);--µÃµ½ÕÙ»½Èı»Ê×ÓÎï¼ş
		Msg2Player("§Õn tÇng 3 Thiªn TÇm Th¸p dïng ph¸o hiÖu ®Ó gäi Tam Hoµng Tö");
		TaskTip("§Õn tÇng 3 Thiªn TÇm Th¸p dïng ph¸o hiÖu ®Ó gäi Tam Hoµng Tö");
	end
	return
end
	
--´òµ¹Èı»Ê×ÓºóÓë¶­åÈÂŞ¶Ô»°1
function task_025_00()

local strTalk = {
	"§· ®¸nh b¹i {tam Hoµng Tö}.",
	"CËn vÖ cña h¾n còng ®· bŞ khèng chÕ.",
	"VËy cßn {Xi Háa gi¸o}?",
	"Tam Hoµng Tö tr­íc khi rêi khái §¹i Lı trong tay ®· cã b¶n S¬n Hµ X· T¾c v× vËy ®­îc Xi Háa Gi¸o vµ Thiªn TÇm Th¸p kÕt lµm ®ång minh, Xi Háa Gi¸o v× thÕ ngµy cµng t¸c lo¹n.",
	}
	TalkEx("task_025_01",strTalk);
end

--´òµ¹Èı»Ê×ÓºóÓë¶­åÈÂŞ¶Ô»°2
function task_025_01()

local strTalk = {	
	"Qu©n ph¶n lo¹n cña {Xi Háa gi¸o} ®· dÑp ®­îc ch­a?",
	"NhŞ Hoµng Tö s¾p lªn ng«i nh­ng Tiªn §Õ vµ §¹i Hoµng Tö hiÖn giê kh«ng biÕt ë ®©u! Dï sao còng ®a t¹ <sex> ®· qu¸ vÊt v¶!",
	"ChØ gãp chót c«ng søc, kh«ng ®¸ng lµ bao.",
	}
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV80_ID,10);
	GivePlayerAward("Level_81","xn_step_3",nil,nil,"YunTie",1);
	GivePlayerEquipment("chest","Level_71",1);
	GivePlayerEquipment("head","Level_73",1);
	GivePlayerEquipment("legs","Level_75",1);
	GivePlayerExp(SkeyDali,"dalisanhuangzi")
end
