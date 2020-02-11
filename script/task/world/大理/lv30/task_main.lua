-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí30,62ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2006/01/04 PM 16:26

--ÒÒÓÏÄê Îì×ÓÔÂ ¹ïÒÑÈÕ 
--ÒË: ¼Àìë ËÜ»æ ¿ª¹â ²ÃÒÂ ¹ÚóÇ ¼ŞÈ¢ ÄÉ²É ²ğĞ¶ ĞŞÔì ¶¯ÍÁ ÊúÖù ÉÏÁº °²´² ÒÆáã ÈëÕ¬ °²Ïã ½áÍø ²¶×½ î±ÁÔ ·¥Ä¾ ½øÈË¿Ú ·ÅË® 
--¼É: ³öĞĞ °²Ôá ĞŞ·Ø ¿ªÊĞ 
--¼ªÉñÒËÇ÷: Îå¸» Òæáá  
--Ğ×ÉñÒË¼É: ½ÙÉ· Ğ¡ºÄ ¸´ÈÕ ÖØÈÕ ÔªÎä  
--Ã¿ÈÕÌ¥ÉñÕ¼·½: Õ¼·¿´²·¿ÄÚ±± 
--ÎåĞĞ: ³¤Á÷Ë® Ö´Ö´Î» 
--³å: ³åÖí(¶¡º¥)É·¶« 
--Åí×æ°Ù¼É: ¹ï²»´ÊËÏÀíÈõµĞÇ¿ ÒÑ²»Ô¶ĞĞ²ÆÎï·ü²Ø 

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--Óë°×Ó¨Ó¨¶Ô»°ÁìÈ¡¾ç¶¾Ê³ÈË²İÈÎÎñ
function task_001_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
		strTalk = {
			"Gi¸o chñ, thuéc h¹ vÒ råi.",
			"Cã thu thËp ®­îc tin tøc g× kh«ng?",
			"Thuéc h¹ ®­îc biÕt thÕ lùc cña Xi Háa gi¸o hiÖn nay rÊt m¹nh, Cao Th¨ng TuyÒn cßn nghi ngê Ngò §éc gi¸o vµ Xi Háa cã liªn quan víi nhau.",
			"Cao Th¨ng TuyÒn nghi ta cã liªn quan ®Õn Xi Háa gi¸o, cßn ng­¬i?",
			"Thuéc h¹ kh«ng d¸m, ChØ muèn gÆp gi¸o chñ t×m hiÓu vÒ t×nh h×nh cña Xi Háa gi¸o th«i.",
			"§­îc th«i! Nh­ng tr­íc tiªn h·y ®Õn tÇng 2 Mª Cung thu thËp 20 h¹t §éc chñng, ta ®ang cÇn gÊp ®Ó luyÖn ®éc d­îc.",
			"Tu©n lÖnh!"
			}
	else
		strTalk = {
			"TiÒn bèi cã ph¶i lµ gi¸o chñ Ngò §éc gi¸o?",
			"§õng gäi ta lµ tiÒn bèi l·o bèi nghe giµ l¾m. <sex> ®Õn t×m ta cã viÖc g× kh«ng? Hay lµ muèn gia nhËp gi¸o ph¸i?",
			"T¹i h¹ ®­îc Cao Quèc C«ng {Cao Th¨ng TuyÒn} ph¸i ®Õn gÆp gi¸o chñ ®Ó hái th¨m vÒ {Xi Háa Gi¸o}.",
			"Hái ta vÒ t×nh h×nh cña Xi Háa Gi¸o? Cao Th¨ng TuyÒn vÉn cßn nghi ngê ta? ¤ng ta ®­êng ®­êng lµ Quèc c«ng cña §¹i Lı ch¼ng lÏ viÖc cán con nµy còng qu¶n kh«ng næi?",
			"Xin hái gi¸o chñ, nh÷ng viÖc x¶y ra víi Xi Háa gi¸o ph¶i ch¨ng cã liªn quan ®Õn hoµng téc?",
			"BiÕt nãi thÕ nµo, vÇy ®i. Ta ®ang cÇn 20 h¹t Thùc Nh©n Th¶o ®Ó tinh luyÖn ®éc d­îc, ng­¬i cã thÓ ®Õn tÇng 2 Mª cung cña bæn gi¸o ®em vÒ ®©y ®­îc kh«ng?",
			"§­îc! Xong viÖc nµy hy väng gi¸o chñ sÏ nãi cho t¹i h¹ biÕt.",
			"NhÊt ®Şnh råi."
			}
	end;
	
	TalkEx("",strTalk);
	CreateTrigger(0,252,KILL_DL_ANPLANT);
	SetTask(TASK_DL_LV30_ID,2);
	TaskTip("§Õn tÇng 2 Mª cung lÊy 20 h¹t Thùc Nh©n Th¶o");
	Msg2Player("§Õn tÇng 2 Mª cung lÊy 20 h¹t Thùc Nh©n Th¶o");

end;

--ÁìÈ¡¶¾ÖÖÈÎÎñºó£¬»ò²¹·¢¾ç¶¾Ê³ÈË²İ´¥·¢Æ÷£¬»ò½øĞĞÏÂÒ»²½
function task_002_00()

local nItemNum = GetItemCount(2,0,364);
local strTalk = {
	"Gióp ta ®Õn tÇng 2 Mª cung lÊy 20 h¹t Thùc Nh©n Th¶o.",
}

	if nItemNum >= 20 then --ÒÑ¾­ÊÕ¼¯Íê20¸ö¶¾ÖÖ
		if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
			strTalk = {
				"Gi¸o chñ, vËt phÈm ng­êi cÇn ®· t×m ®ñ.",
				"ThËt tèt qu¸!",
				"VËy ng­êi nãi cho t¹i h¹ nghe vÒ Xi Háa gi¸o?",
				"Ta sÏ nãi! Nh­ng cã viÖc nµy cßn gÊp h¬n! Ng­ §éc ¢m C¬ ®· ®Õn tÇng 2 Mª Cung ®éng thu thËp ®éc vËt, h¾n cßn b¾t mét sè d©n lµng ®Õn ®Ó luyÖn ®éc. Ng­¬i h·y ®i tiªu trõ tªn nµy gióp ta.",
				"Tu©n lÖnh!"
				}
		else
			strTalk = {
				"Gi¸o chñ, vËt phÈm ng­êi cÇn ®· t×m ®ñ.",
				"ThËt tèt qu¸!",
				"VËy Xi Háa gi¸o cã liªn quan g× víi Ngò §éc gi¸o kh«ng?",
				"GÇn ®©y Ng­ §éc ¢m C¬ ®Õn tÇng hai cña Mª Cung ®éng thu thËp ®éc vËt, cßn b¾t mét sè d©n lµng ®Õn ®Ó luyÖn ®éc. <sex> h·y ®i tiªu trõ tªn nµy gióp ta!",
				"…………",
				"§õng lµm mÊt thêi gian. <sex> mau ®i ®i. Hoµn thµnh nhiÖm vô ta sÏ nãi cho ng­¬i nghe.",
				"T¹i h¹ ®i ngay!"
				}
		end;
		
		DelItem(2,0,364,20);
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV30_ID,3);
		RemoveTrigger(GetTrigger(KILL_DL_ANPLANT))
		TaskTip("§Õn Mª cung tÇng 2 tiªu trõ Ngù §éc ¢m C¬.");
		Msg2Player("§Õn Mª cung tÇng 2 tiªu trõ Ngù §éc ¢m C¬.");
		GivePlayerAward("Level_30","xn_step_1");
		GivePlayerExp(SkeyDali,"peiyao")
		return
	--²¹·¢¾ç¶¾Ê³ÈË²İ´¥·¢Æ÷	
	elseif GetTrigger(KILL_DL_ANPLANT) == 0 then
		CreateTrigger(0,252,KILL_DL_ANPLANT);
		TaskTip("§Õn tÇng 2 Mª cung lÊy 20 h¹t Thùc Nh©n Th¶o");
		Msg2Player("§Õn tÇng 2 Mª cung lÊy 20 h¹t Thùc Nh©n Th¶o");
		return
	end;
	
	TalkEx("",strTalk);

end;

--ÁìÈ¡Ô¦¶¾Òõ¼§ÈÎÎñºóÎ´É±ËÀÔ¦¶¾Òõ¼§Ö®Ç°
function task_003_00()

local strTalk = {
	"Muèn diÖt Ngù §éc ¢m C¬ ph¶i ®Õn tÇng 2 Mª cung. <sex> mau ®i ®i.",
}
		TalkEx("",strTalk);
end;


--É±ËÀÔ¦¶¾Òõ¼§ºó1
function task_004_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
		strTalk = {
			"Gi¸o chñ, t¹i h¹ ®· tiªu trõ {Ngù §éc ¢m C¬}.",
			"LÇn nµy ng­¬i vÊt v¶ qu¸!",
			"§a t¹ gi¸o chñ qu¸ khen.",
			"Ha! Ha! Võa råi ta sai ng­¬i ®i diÖt Ngù §éc ¢m C¬ chİnh lµ ng­êi cña Xi Háa gi¸o, nÕu ta vµ Xi Háa gi¸o cã liªn quan ®Õn nhau lÏ nµo ta l¹i ®i giÕt hä ­?",
			"Nãi vËy lµ gi÷a tiÒn bèi vµ Xi Háa gi¸o kh«ng liªn quan g× ®Õn nhau?",
			"§­¬ng nhiªn råi! Xi Háa gi¸o sao s¸nh b»ng Ngò §éc gi¸o cña ta!",
			"TiÒn bèi cã thÓ nãi râ h¬n ®­îc kh«ng?",
			"Xi Háa gi¸o ph¶n lo¹n lµ v× kh«ng muèn t©n hoµng ®Õ kÕ vŞ.",
			"T¹i h¹ cã nghe qua, Xi Háa gi¸o t¸c lo¹n còng v× chuyÖn nµy."
			}
		TalkEx("task_004_01",strTalk);
		return
	else
		strTalk = {
			"T¹i h¹ ®· diÖt ®­îc {Ngù §éc ¢m C¬}, gi¸o chñ nãi cho t¹i h¹ nghe ®­îc råi chø?",
			"<sex> tuæi trÎ tµi cao, lßng ®Çy nhiÖt huyÕt! Giang hå l¹i cã thªm mét nh©n tµi!",
			"…………",
			"Lóc n·y sai ng­¬i ®i giÕt §éc ¢m C¬ chİnh lµ ng­êi cña Xi Háa gi¸o. NÕu ta vµ Xi Háa gi¸o cã liªn quan ®Õn nhau, lÏ nµo ta l¹i sai ng­¬i ®i giÕt h¾n?",
			"Nãi vËy lµ gi÷a tiÒn bèi vµ Xi Háa gi¸o kh«ng liªn quan g× ®Õn nhau?",
			"§­¬ng nhiªn råi! Xi Háa gi¸o sao s¸nh b»ng Ngò §éc gi¸o cña ta!",
			"TiÒn bèi cã thÓ nãi râ h¬n ®­îc kh«ng?",
			"Xi Háa gi¸o ph¶n lo¹n lµ v× muèn ho¸n vŞ Hoµng ®Õ",
			"T¹i h¹ cã nghe qua, Xi Háa gi¸o t¸c lo¹n còng v× chuyÖn nµy."
			}
		TalkEx("task_004_02",strTalk);
		return
	end;
end;

--É±ËÀÔ¦¶¾Òõ¼§ºó2(Îå¶¾µÜ×Ó)
function task_004_01()

local strTalk = {
	"§¹i Lı cã ®Õn {Lôc ®¹i gia téc}? ChuyÖn nµy ng­¬i còng biÕt sao?",
	"T¹i h¹ kh«ng biÕt, mong gi¸o chñ nãi râ h¬n.",
	"Lôc ®¹i gia téc ë §¹i Lı trong ®ã cã Cao gia, Cao Th¨ng TuyÒn lµ téc tr­ëng. Tèt nhÊt ng­¬i ®Õn gÆp Cao Th¨ng TuyÒn ®Ó hái râ h¬n nhĞ!",
	"T¹i h¹ hiÓu råi.",
	"Cßn viÖc nµy n÷a, ph­¬ng ph¸p phèi chÕ ®éc d­îc cña Kh«i Lçi §éc Nh©n ®· bŞ Xi Háa gi¸o ®¸nh c¾p, ng­¬i b¸o l¹i víi Cao Th¨ng TuyÒn vËy nhĞ!",
	"T¹i h¹ biÕt råi."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,5);
	TaskTip("Quay l¹i §¹i Lı gÆp Cao Th¨ng TuyÒn!");
	Msg2Player("Quay l¹i §¹i Lı gÆp Cao Th¨ng TuyÒn!");
	GivePlayerAward("Level_30","xn_step_2","weapon","Level_34");
	GivePlayerExp(SkeyDali,"yuduyinji")
end

--É±ËÀÔ¦¶¾Òõ¼§ºó2
function task_004_02()

local strTalk = {
	"Sao? Cao Th¨ng TuyÒn kh«ng thõa nhËn µ?",
	"T¹i h¹ ch­a tõng nghe qua, mong gi¸o chñ nãi râ.",
	"Tèt nhÊt ng­¬i nªn ®Õn gÆp Cao Th¨ng TuyÒn ®Ó hái. Nãi víi «ng Êy lµ ta cßn rÊt nhiÒu viÖc kh«ng thÓ ®Õn §¹i Lı ®­îc.",
	"T¹i h¹ ®i ngay!",
	"Cßn viÖc nµy n÷a, ph­¬ng ph¸p phèi chÕ ®éc d­îc cña Kh«i Lçi §éc Nh©n ®· bŞ Xi Háa gi¸o ®¸nh c¾p, ng­¬i b¸o l¹i víi Cao Th¨ng TuyÒn vËy nhĞ!",
	"T¹i h¹ biÕt råi."
}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV30_ID,5);
	TaskTip("Quay l¹i §¹i Lı gÆp Cao Th¨ng TuyÒn!");
	Msg2Player("Quay l¹i §¹i Lı gÆp Cao Th¨ng TuyÒn!");
	GivePlayerAward("Level_30","xn_step_2","weapon","Level_34");
	GivePlayerExp(SkeyDali,"yuduyinji")
end

--É±ËÀÔ¦¶¾Òõ¼§¼û¸ßÉıÈªÖ®Ç°
function task_005_00()

local strTalk = {
	"H·y quay vÒ gÆp Cao Th¨ng TuyÒn ®i!",
}
		TalkEx("",strTalk);
		
end;

--ÁìÈ¡62¼¶ÈÎÎñÎå¶¾½ÌµÄÅ­»ğ
function task_006_00()

local strTalk = {};

	if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
		strTalk = {
			"Gi¸o chñ cho gäi t¹i h¹ cã viÖc g× kh«ng?",
			"Ng­¬i cã biÕt Kh«i Lçi §éc Nh©n ë Long Nh·n ®éng kh«ng?",
			"T¹i h¹ biÕt, ®· tõng ®i qua n¬i ®ã.",
			"Kh«i Lçi §éc Nh©n ®· bŞ ng­êi cña Xi Háa gi¸o Ğp buéc tiÕt lé ph­¬ng ph¸p phèi chÕ ®éc d­îc.HiÖn nay ng­êi cã thÓ theo ph­¬ng ph¸p nµy chÕ t¹o ra ®éc d­îc lµ §¹i Tr­ëng l·o Xi Háa gi¸o, ng­¬i mau gióp ta tiªu diÖt tªn nµy ®Ó b¶o toµn bİ mËt.",
			"Ng­êi nµy hiÖn ®ang ë ®©u?",
			"H¾n ë tÇng 1 Long Nh·n ®éng. Mét m×nh ng­¬i kh«ng thÓ ®èi phã víi h¾n, nªn cã ®ång ®éi hç trî.",
			}
	else
		strTalk = {
			"{B¹ch gi¸o chñ} cho t×m thuéc h¹?",
			"<sex>ChuyÖn cã liªn quan ®Õn Kh«i Lçi §éc Nh©n ë Long Nh·n ®éng, ng­¬i biÕt råi chø?",
			"Thuéc h¹ võa ®i qua n¬i ®ã.",
			"Kh«i Lçi §éc Nh©n ®· bŞ ng­êi cña Xi Háa gi¸o Ğp buéc tiÕt lé ph­¬ng ph¸p phèi chÕ ®éc d­îc.HiÖn nay ng­êi cã thÓ theo ph­¬ng ph¸p nµy chÕ t¹o ra ®éc d­îc lµ §¹i Tr­ëng l·o Xi Háa gi¸o. <sex> cã thÓ gióp ta tiªu trõ h¾n kh«ng?",
			"Tªn nµy thËt ®¸ng chÕt! Nh­ng sao {gi¸o chñ} kh«ng ®éng thñ?",
			"Ta ®ang cã viÖc kh«ng thÓ ra ngoµi ®­îc. <sex> lÇn tr­íc nhê ta cung cÊp mét sè tin tøc cho <sex> råi lÏ nµo lÇn nµy ng­¬i kh«ng gióp ta ®­îc ­?",
			"§­îc! Tªn {Tr­ëng l·o} nµy hiÖn ®ang ë ®©u?",
			"H¾n ®ang ë tÇng 1 Long Nh·n ®éng. <sex>mét m×nh ng­¬i khã th¾ng næi h¾n, nªn cã ®ång ®éi hç trî.",
			}
	end
	
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV62_ID,6);
	SetTask(TASK_DL_LV75_ID,1);
	GivePlayerExp(SkeyDali,"zaishangwudu")
	Msg2Player("§Õn tÇng 1 Long Nh·n ®éng diÖt Xi Háa ®¹i Tr­ëng l·o.");
	TaskTip("§Õn tÇng 1 Long Nh·n ®éng diÖt Xi Háa ®¹i Tr­ëng l·o.");
	return
end

--Î´´ò°Üò¿»ğ´ó½ÌÖ÷
function task_007_00()

local strTalk = {
	"Xi Háa ®¹i tr­ëng l·o ë tÇng 1 Long Nh·n ®éng.",
	}
	
	TalkEx("",strTalk);
	return
end

--ÒÑ¾­´ò°Üò¿»ğ´ó½ÌÖ÷1
function task_008_00()

local strTalk = {};
	
	if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°
		strTalk = {
			"VÒ råi ­? Sù viªc thÕ nµo?",
			"Thuéc h¹ ®· tiªu trõ ®­îc h¾n.",
			"Lµm tèt l¾m, kh«ng hæ danh lµ ®Ö tö ruét cña ta.",
			"§a t¹ gi¸o chñ qu¸ khen.",
			"Cßn viÖc nµy muèn hái ng­¬i, sao ng­¬i biÕt Kh«i Lçi §éc Nh©n ë Long Nh·n ®éng?",
			"Lµ {TrŞnh Qu¸n Chi} sai thuéc h¹ ®Õn th¨m dß {Long Nh·n ®éng} nªn míi ph¸t hiÖn ra.",
			"C« ta sai ng­¬i ®Õn Long Nh·n ®éng lµm g×?",
			"C« ta nghe nãi {Xi Háa tr­ëng l·o} ë Long Nh·n ®éng nªn ph¸i {§iÕm Háa KÕ} ®Õn ®ã nh­ng ®i råi kh«ng thÊy vÒ míi sai thuéc h¹ th¨m dß xem sao.",
			"C« ta chØ lµ ng­êi bu«n b¸n sao l¹i quan t©n ®Õn Xi Háa gi¸o ®Õn vËy? Ng­¬i cã thÊy kú l¹ kh«ng?",
			}		
	else
		strTalk = {
			"<sex>ThÊy ng­¬i vui vÎ nh­ vËy lµ biÕt thµnh c«ng råi.",
			"§óng vËy, tèn kh«ng İt søc.",
			"<sex> ®· ra tay lµ ph¶i th¾ng.",
			"{B¹ch gi¸o chñ} qu¸ khen.",
			"Sao ng­¬i biÕt Kh«i Lçi §éc Nh©n ë Long Nh·n ®éng?",
			"Lµ {TrŞnh Qu¸n Chi} sai thuéc h¹ ®Õn th¨m dß {Long Nh·n ®éng} nªn míi ph¸t hiÖn ra.",
			"C« ta sai ng­¬i ®Õn Long Nh·n ®éng lµm g×?",
			"C« ta nghe nãi {Xi Háa tr­ëng l·o} ë Long Nh·n ®éng nªn ph¸i {§iÕm Háa KÕ} ®Õn ®ã nh­ng ®i råi kh«ng thÊy vÒ míi sai thuéc h¹ th¨m dß xem sao.",
			"C« ta chØ lµ ng­êi bu«n b¸n sao l¹i quan t©n ®Õn Xi Háa gi¸o ®Õn vËy? <sex> cã thÊy kú l¹ kh«ng?",
			}
	end
	TalkEx("task_008_01",strTalk);		
end			

--ÒÑ¾­´ò°Üò¿»ğ´ó½ÌÖ÷2
function task_008_01()

local strTalk = {};
	
	if GetPlayerFaction() == 7 then --Îå¶¾µÜ×Ó×¨ÓĞ¶Ô»°			
		strTalk = {	
			"C« ta võa ®Õn {§¹i Lı} lµm ¨n ®· bŞ {Xi Háa gi¸o} lµm khã dÔ, v× vËy mµ g©y nªn o¸n thï.",
			"Lı do nµy kh«ng tháa ®¸ng. NÕu bŞ Xi Háa gi¸o g©y khã dÔ c« ta cã thÓ chuyÓn ®Õn n¬i kh¸c ®Ó lµm ¨n. Ng­îc l¹i c« ta cßn ë l¹i §¹i Lı liªn tôc nhê ng­¬i dß la tin tøc cña Xi Háa gi¸o. Ng­¬i kh«ng thÊy ®iÒu nµy lµ kh¸c th­êng sao?",
			"…………",
			"T×nh h×nh ë §¹i Lı ta còng kh«ng n¾m râ, ng­¬i t×m B¸ch HiÓu Sinh hái nhĞ!",
			"§a t¹ gi¸o chñ.",
			}	
	else					
		strTalk = {
			"C« ta võa ®Õn {§¹i Lı} lµm ¨n ®· bŞ {Xi Háa gi¸o} lµm khã dÔ, v× vËy mµ g©y nªn o¸n thï.",
			"Lı do nµy kh«ng tháa ®¸ng. NÕu bŞ Xi Háa gi¸o g©y khã dÔ c« ta cã thÓ chuyÓn ®Õn n¬i kh¸c ®Ó lµm ¨n. Ng­îc l¹i c« ta cßn ë l¹i §¹i Lı liªn tôc nhê b»ng h÷u dß la tin tøc cña Xi Háa gi¸o. <sex> kh«ng thÊy kh¸c th­êng sao?",
			"…………",
			"NÕu <sex> kh«ng tin nh÷ng lêi ta nãi. <sex> cã thÓ ®i hái ng­êi kh¸c vËy.",
			"Thuéc h¹ tin råi! C¶m ¬n {gi¸o chñ}.",
			"{Cã lÏ ®Õn {B¸ch HiÓu Sinh} hái xem, may ra biÕt thªm ®­îc g×.}",
			}
	end            
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,3);
	CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
	Msg2Player("§Õn t×m B¸ch HiÓu Sinh.");
	TaskTip("§Õn t×m B¸ch HiÓu Sinh.");
	GivePlayerAward("Level_65","xn_step_1","head","Level_65");
	GivePlayerExp(SkeyDali,"fangongcihuo")
	return
end

--Î´È¥ÕÒ°ÙÏşÉú´òÌıÏûÏ¢(²¹Áì¶Ô»°´¥·¢Æ÷)
function task_009_00()

local strTalk = {
	"§· gÆp B¸ch HiÓu Sinh ch­a? Ng­êi nµy hiÓu biÕt réng, may ra cã thÓ gióp ®­îc b»ng h÷u!"
	}
	
	if GetTrigger(TALK_DL_BAIXIAOSHENG) == 0 then
		CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
		Msg2Player("§Õn t×m B¸ch HiÓu Sinh.");
		TaskTip("§Õn t×m B¸ch HiÓu Sinh.");
	end;
	TalkEx("",strTalk);
end