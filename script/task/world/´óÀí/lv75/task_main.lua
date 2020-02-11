-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí30,62ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2006/01/13 PM 10:34

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

--ÓëÁõµä¶Ô»°ÁìÈ¡ºÚĞÉĞÉÈÎÎñ
function task_000_00()

local strTalk = {
	"§¹i Lı Cùu Chİ ®· bŞ H¾c Tinh Tinh c­íp ®i, cã thÓ gióp ta t×m chóng vÒ kh«ng?",
	"{H¾c Tinh Tinh} ®ã ë ®©u?",
	"Chóng ë T©y Song B¶n N¹p, ng­¬i ®Õn ®ã t×m 10 tÊm §¹i Lı Cùu Chİ nhĞ!",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV75_ID,5);
	RemoveTrigger(GetTrigger(TALK_DL_BAIXIAOSHENG));--É¾µô°ÙÏşÉú¶Ô»°´¥·¢Æ÷
	CreateTrigger(0,264,KILL_DL_JOCKO);
	TaskTip("§Õn T©y Song B¶n N¹p thu thËp 10 tÊm §¹i Lı Cùu Chİ");
	Msg2Player("§Õn T©y Song B¶n N¹p thu thËp 10 tÊm §¹i Lı Cùu Chİ");
	GivePlayerAward("Level_75","xn_step_1");
	GivePlayerExp(SkeyDali,"dalirizi")
	return
end	
	
--ÁìÈ¡ºÚĞÉĞÉÈÎÎñºó1
function task_001_00()

local strTalk = {
	"H¾c Tinh Tinh ë T©y Song B¶n N¹p, ng­¬i ®Õn ®ã t×m 10 tÊm §¹i Lı Cùu Chİ.",
	}
	
	--ÅĞ¶Ï´óÀí¾ÉÖ¾²ĞÆ¬ÊıÄ¿
	if GetItemCount(2,0,379) >= 10 then
		DelItem(2,0,379,10);
		strTalk = {
			"VÒ råi ­, mau ®­a ta xem nµo.",
			"…",
			"Ta ®· x¸c ®Şnh ®­îc th©n thÕ cña TrŞnh Qu¸n Trinh.",
			"Rèt c­îc lµ ng­êi thÕ nµo?",
			"Vµo cuèi thêi §­êng, TrŞnh M·i Tù c­íp ng«i lËp nªn §¹i Tr­êng Hîp Quèc. M­êi mÊy n¨m sau TriÖu ThiÖn Chİnh vµ D­¬ng Can Trinh c­íp ng«i. D­¬ng Can Trinh cßn giÕt h¹i c¶ dßng téc hä TrŞnh, nh÷ng ng­êi cßn sãt l¹i rêi khái §¹i Lı sang l¸nh n¹n ë §¹i Tèng. Sau ®ã §oµn T­ B×nh kiÕn lËp l¹i §¹i Lı cho gäi TrŞnh gia quay vÒ vµ sÕp vµo mét trong 6 ®¹i gia téc ë §¹i Lı, nh­ng hä TrŞnh quyÕt kh«ng quay l¹i. TrŞnh Qu¸n Chi lµ mét trong nh÷ng hËu nh©n cña dßng téc hä TrŞnh.",
			}
		TalkEx("task_001_01",strTalk);	
		return
	end
	
	--²¹·¢ºÚĞÉĞÉËÀÍö´¥·¢Æ÷
	if GetTrigger(KILL_DL_JOCKO) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,264,KILL_DL_JOCKO);
		TaskTip("§Õn T©y Song B¶n N¹p thu thËp 10 tÊm §¹i Lı Cùu Chİ");
		Msg2Player("§Õn T©y Song B¶n N¹p thu thËp 10 tÊm §¹i Lı Cùu Chİ");
		return
	end
		
	TalkEx("",strTalk);
	return
end

--ÁìÈ¡ºÚĞÉĞÉÈÎÎñºó2
function task_001_01()

local strTalk = {	
	"Lµm sao biÕt c« ta lµ {hËu nh©n cña TrŞnh gia}?",
	"Dßng téc TrŞnh gia x­a nay cã c¸ch ®Æt tªn riªng, TrŞnh Qu¸n Chi còng kh«ng n»m ngo¹i lÖ.",
	"ViÖc nµy còng ch­a ch¾c ch¾n l¾m, ch¼ng qua lµ sù trïng hîp th«i.",
	"Cßn n÷a, TrŞnh Gia ®Æt tªn lu«n cã ch÷ Chi ®©y lµ ®Æt ®iÓm riªng cña B¹ch téc x­a nay. TrŞnh Qu¸n Chi ®İch thùc thuéc gia téc hä TrŞnh råi.",
	"C¸ch ®Æt tªn nµy t¹i h¹ cã nghe TriÖu Diªn Niªn nh¾c ®Õn. Nh­ng rèt cuéc c« ta ®Õn {§¹i Lı} ®Ó lµm g×?",
	"Ta còng kh«ng râ, ng­¬i nªn gÆp c« Êy hái xem sao.",
	"§­îc! T¹i h¹ sÏ ®i ngay!",
	}
	TalkEx("",strTalk);
	RemoveTrigger(GetTrigger(KILL_DL_JOCKO));
	SetTask(TASK_DL_LV75_ID,6);
	Msg2Player("§Õn §¹i Lı hái vÒ th©n thÕ cña TrŞnh Qu¸n Chi");
	TaskTip("§Õn §¹i Lı hái vÒ th©n thÕ cña TrŞnh Qu¸n Chi");
	GivePlayerAward("Level_75","xn_step_2","legs","Level_57");
	GivePlayerExp(SkeyDali,"heixingxing")
end

function task_002_00()
	local strTalk = {
		"GÆp TrŞnh Qu¸n Chi hái vÒ th©n thÕ cña c« ta."
		}
	TalkEx("",strTalk);
end