-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀí50ÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2006/01/09 PM 15:24

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

--ÁìÈ¡ÈÎÎñ´òµ¹ÃçÁëÍÁË¾ÊÕ¼¯10°ÑÍÁË¾Ååµ¶
function task_000_00()
	
local strTalk = {
		"Xin hái, tiÒn bèi cã ph¶i lµ {TrÇn LËp Hoµnh}?",
		"Chİnh lµ ta. <sex> t×m ta cã viÖc g× kh«ng?",
		"Nghe nãi tiÒn bèi rÊt tinh th«ng ph­¬ng ng÷ ë {§¹i Lı}, cã thÓ gióp t¹i h¹ dŞch bøc th­ nµy kh«ng?",
		"Cã ph¶i TrŞnh Qu¸n Chi nãi, phiÒn <sex> ®iÒu tra xem mèi quan hÖ gi÷a Miªu LÜnh vµ Xi Háa Gi¸o?",
		"§óng vËy.",
		"Ta còng ®ang cã chuyÖn nµy muèn nhê <sex>.",
		"Xin tiÒn bèi cø nãi.",
		"Bän Thæ Ty ë Miªu LÜnh ngµy cµng t¸c lo¹n, chóng c­íp bãc, øc hiÕp th¶o d©n. MÊy huynh ®Ö cña ta còng bŞ chóng bøc chÕt. <sex> cã thÓ thay ta b¸o thï cho c¸c huynh ®Ö Êy ®­îc kh«ng?",
		"T¹i h¹ sÏ gióp tiÒn bèi b¸o thï.",
		"H·y ®Õn tÇng 2 YÕn Tö ®éng giÕt bän Thæ Ty ®em 10 Béi §ao vÒ ®©y.",
		"TiÒn bèi ®îi tin vui cña t¹i h¹.",
		}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV50_ID,2);
	CreateTrigger(0,257,KILL_DL_MLTS);
	GivePlayerExp(SkeyDali,"fanyixinjian")
	TaskTip("§Õn tÇng 2 YÕn Tö ®éng giÕt Miªu LÜnh Thæ Ty lÊy 10 Béi §ao");
	Msg2Player("§Õn tÇng 2 YÕn Tö ®éng giÕt Miªu LÜnh Thæ Ty lÊy 10 Béi §ao");
	return
end


--ÒÑ¾­ÁìÈ¡ÊÕ¼¯ÍÁË¾Ååµ¶ÈÎÎñ
function task_001_00()

local strTalk = {
	"§Õn tÇng 2 YÕn Tö ®éng giÕt Miªu LÜnh Thæ Ty ®em vÒ 10 Béi §ao.",
	}		

	if GetItemCount(2,0,368) >= 10 then		
		strTalk = {
			"<sex> lÊy ®­îc Béi §ao ch­a?",
			"T¹i h¹ ®· lÊy ®­îc {Béi §ao}! TiÒn bèi xin xem qua!",
			"§óng lµ Béi §ao, ®a t¹ <sex>.",
			"TiÒn bèi, vËy cßn bøc th­…",
			"§©y lµ th­ Téc tr­ëng Miªu LÜnh göi cho Xi Háa gi¸o, trong th­ nãi r»ng thÕ lùc cña Xi Háa gi¸o hiÖn giê rÊt m¹nh, ®· g©y sù chó ı ®Õn giíi nh©n sÜ Vâ L©m. Xi Háa gi¸o nhÊt cö nhÊt ®éng nªn thËn träng. <sex> nªn ®Õn {Miªu LÜnh} t×m {Téc tr­ëng}.",
			"§a t¹ tiÒn bèi!",
			}
		TalkEx("",strTalk);
		DelItem(2,0,368,10);
		RemoveTrigger(GetTrigger(KILL_DL_MLTS));
		SetTask(TASK_DL_LV50_ID,3);
		TaskTip("§Õn gÆp Téc tr­ëng Miªu LÜnh");
		Msg2Player("§Õn gÆp Téc tr­ëng Miªu LÜnh");
		GivePlayerAward("Level_50","xn_step_1");
		GivePlayerExp(SkeyDali,"baochou")
		return
	--²¹·¢ÍÁË¾ËÀÍö´¥·¢Æ÷
	elseif GetTrigger(KILL_DL_MLTS) == 0 then
		TalkEx("",strTalk);
		CreateTrigger(0,257,KILL_DL_MLTS);
		TaskTip("§Õn tÇng 2 YÕn Tö ®éng giÕt Miªu LÜnh Thæ Ty lÊy 10 Béi §ao");
  	Msg2Player("§Õn tÇng 2 YÕn Tö ®éng giÕt Miªu LÜnh Thæ Ty lÊy 10 Béi §ao");
  	return
  else
		TalkEx("",strTalk);
		return
	end
end

--ÒÑ¾­Íê³ÉÍÁË¾Ååµ¶ÈÎÎñ»¹Ã»ÓëÃçÁë×å³¤¶Ô»°
function task_002_00()

local strTalk = {
	"<sex> cø ®Õn Miªu LÜnh ¾t sÏ t×m thÊy Téc tr­ëng",
	}
	TalkEx("",strTalk);
	return
end