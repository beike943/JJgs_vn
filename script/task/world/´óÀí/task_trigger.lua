-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ´óÀíÈÎÎñ´¥·¢Æ÷´¦Àí
-- By StarryNight
-- 2005/12/30 PM 10:48

--ÒÒÓÏÄê Îì×ÓÔÂ Îì×ÓÈÕ 
--ÒË: ºÏÕÊ ²ÃÒÂ ½ÌÅ£Âí âÅÊÂÎğÈ¡ 
--¼É: ÈëÕ¬ ¶¯ÍÁ ÆÆÍÁ ¼ŞÈ¢ ×÷Ôî Ôì´¬ 
--¼ªÉñÒËÇ÷: ¹ÙÈÕ ¾´°² ½ğØÑ  
--Ğ×ÉñÒË¼É: ÔÂ½¨ Ğ¡Ê± ÍÁ¸® ÔÂÑá µØ»ğ  
--ÎåĞĞ: Åùö¨»ğ  ½¨Ö´Î»  
--Åí×æ°Ù¼É: Îì²»ÊÜÌïÌïÖ÷²»Ïé ×Ó²»ÎÊ²·×ÔÈÇ»öÑê 

-- ======================================================
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\´óÀí\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\task\\world\\task_award.lua");

--É±ËÀ¶¾·åÊÕ¼¯Ò©²Ä
function PoisonBee_Killed_1()

	  if g_probability(50, 100) then
        AddItem(2,0,362,1,1);--µÃµ½Ò©²Ä
    		if GetItemCount(2,0,362) >= 15 then
      		TaskTip("§· thu thËp ®ñ 15 d­îc liÖu quay vÒ t×m TrŞnh Qu¸n Chi.");
      		Msg2Player("§· thu thËp ®ñ 15 d­îc liÖu quay vÒ t×m TrŞnh Qu¸n Chi.");
    		end;
		end;
end;

--É±ËÀ20¸ö¶¾òÚò¼
function PoisonSco_Killed_20()
	
	RemoveTrigger(GetRunningTrigger());
	SetTask(TASK_DL_LV20_ID,2);
	TaskTip("Hoµn thµnh nhiÖm vô quay vÒ gÆp Cao Th¨ng TuyÒn.");
	Msg2Player("Hoµn thµnh nhiÖm vô quay vÒ gÆp Cao Th¨ng TuyÒn.");
	
end;

--É±ËÀ¾ç¶¾Ê³ÈË²İÊÕ¼¯¶¾ÖÖ
function AnPlant_Killed_1()    
    
    if g_probability(50, 100) then
      AddItem(2,0,364,1,1);--µÃµ½Ò©²Ä
      if GetItemCount(2,0,364) >= 20 then
    		RemoveTrigger(GetRunningTrigger());
      	TaskTip("§· thu thËp ®ñ 20 h¹t, quay vÒ gÆp B¹ch Doanh Doanh.");
      	Msg2Player("§· thu thËp ®ñ 20 h¹t, quay vÒ gÆp B¹ch Doanh Doanh.");
    	end; 
		end;
end;

--É±ËÀ10¸öò¿»ğ°×½ÌÍ½
function ChiHuoWhite_Killed_10()

local nSate = GetTask(TASK_DL_LV35_01_ID);

	--Ö®Ç°ÒÑÉ±ËÀ10¸öò¿»ğºÚ½ÌÍ½
	if nSate == 10 then
		local strTalk = {
			"Cã chuyÖn g× vËy?",
			"Kh«ng liªn quan g× ®Õn ng­¬i!",
			"Cho dï lµ chuyÖn cña c¸c ng­¬i ®i ch¨ng n÷a th× còng kh«ng ®­îc n¸o lo¹n ®¹i Tèng cña ta!",
			"Ta c¶nh b¸o ng­¬i ®õng xen vµo viÖc cña Xi Háa gi¸o ta!",
			"ChuyÖn nµy cã liªn quan ®Õn viÖc lªn ng«i cña Hoµng tö ch¨ng!?",
			"Kh«ng liªn quan g× ®Õn ng­¬i",
			"…………",
			"{(NghÜ thÇm) Hay lµ quay vÒ gÆp {Cao Th¨ng TuyÒn}}",
			}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV35_ID,2);
    TaskTip("Quay vÒ gÆp Cao Th¨ng TuyÒn");
    Msg2Player("Quay vÒ gÆp Cao Th¨ng TuyÒn");
    	
	--Î´É±ËÀ10¸öò¿»ğºÚ½ÌÍ½
	else
		SetTask(TASK_DL_LV35_01_ID,10);
	end;
	RemoveTrigger(GetRunningTrigger());
end

--É±ËÀ10¸öò¿»ğºÚ½ÌÍ½
function ChiHuoBlack_Killed_10()

local nSate = GetTask(TASK_DL_LV35_01_ID);
	--Ö®Ç°ÒÑÉ±ËÀ10¸öò¿»ğ°×½ÌÍ½
	if nSate == 10 then
	local strTalk = {
		"Cã chuyÖn g× vËy?",
		"Kh«ng liªn quan g× ®Õn ng­¬i!",
		"Cho dï lµ chuyÖn cña c¸c ng­¬i ®i ch¨ng n÷a th× còng kh«ng ®­îc n¸o lo¹n ®¹i Tèng cña ta!",
		"Ta c¶nh b¸o ng­¬i ®õng xen vµo viÖc cña Xi Háa gi¸o ta!",
		"ChuyÖn nµy cã liªn quan ®Õn viÖc lªn ng«i cña Hoµng tö ch¨ng!?",
		"Kh«ng liªn quan g× ®Õn ng­¬i",
		"…………",
		"{(NghÜ thÇm) Hay lµ quay vÒ gÆp {Cao Th¨ng TuyÒn}}",
		}
		TalkEx("",strTalk);
		SetTask(TASK_DL_LV35_ID,2);
    TaskTip("Quay vÒ gÆp Cao Th¨ng TuyÒn");
    Msg2Player("Quay vÒ gÆp Cao Th¨ng TuyÒn");
    	
	--Î´É±ËÀ10¸öò¿»ğ°×½ÌÍ½
	else
		SetTask(TASK_DL_LV35_01_ID,10);
	end;
	RemoveTrigger(GetRunningTrigger());
end

--É±ËÀ15¸öò¿»ğ³à½ÌÍ½
function ChiHuoRed_Killed_15()
local strTalk = {
	"Cã chuyÖn g× vËy?",
	"Kh«ng liªn quan g× ®Õn ng­¬i!",
	"Cho dï lµ chuyÖn cña c¸c ng­¬i ®i ch¨ng n÷a th× còng kh«ng ®­îc n¸o lo¹n ®¹i Tèng cña ta!",
	"Ta c¶nh b¸o ng­¬i ®õng xen vµo viÖc cña Xi Háa gi¸o ta!",
	"ChuyÖn nµy cã liªn quan ®Õn viÖc lªn ng«i cña Hoµng tö ch¨ng!?",
	"Kh«ng liªn quan g× ®Õn ng­¬i",
	"…………",
	"(NghÜ thÇm) (Hay lµ quay vÒ gÆp {Cao Th¨ng TuyÒn})",
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV35_ID,2);
	SetTask(TASK_DL_LV35_ID_ZX,2);
  TaskTip("Quay vÒ gÆp Cao Th¨ng TuyÒn");
  Msg2Player("Quay vÒ gÆp Cao Th¨ng TuyÒn");
  RemoveTrigger(GetRunningTrigger());
end

--ÓëÕÔÑÓÄê¶Ô»°1
function Zhaoyannian_Talk()

local nTask_DL_State_40 = GetTask(TASK_DL_LV40_ID);

	if nTask_DL_State_40 == 1 then
		local strTalk = {
			"B¸ch HiÓu Sinh sai ng­¬i ®Õn µ?",
			"T¹i h¹ muèn biÕt vÒ viÖc lªn ng«i cña Hoµng Tö.",
			"Th× ra lµ chuyÖn nµy.",
			"TiÕng ®ån kh«ng sai",
			"§­¬ng triÒu Hoµng ®Õ {§¹i Lı} lµ {§oµn T­ Th«ng}",
			"Hoµng ®Õ khai quèc lËp nªn {§¹i Lı} ch¼ng ph¶i lµ {§oµn T­ B×nh} sao? {§oµn T­ Th«ng} lµ hoµng ®Ö µ?",
			"Thµnh phÇn quı téc ë {§¹i Lı} nµy ®Òu lµ {B¹ch Téc}, dßng hä §oµn còng thuéc B¹ch Téc, v× vËy mµ c¸ch ®Æt tªn còng gièng ng­êi H¸n chóng ta. Míi nghe qua {§oµn T­ B×nh} vµ {§oµn T­ Th«ng} gièng nh­ lµ huynh ®Ö nh­ng hoµn toµn kh«ng ph¶i, gi÷a hä c¸ch nhau ®Õn 3 ®êi!",
			"Th× ra lµ vËy!"
			}
			TalkEx("Zhaoyannian_Talk_01",strTalk);
			RemoveTrigger(GetRunningTrigger());
		  return
	end;
	
	if nTask_DL_State_40 == 5 then
		local strTalk = {
			"TriÖu tiÒn bèi, t¹i h¹ ®­îc biÕt {Xi Háa gi¸o} t¸c lo¹n lµ v× muèn truÊt ng«i ®­¬ng kim Hoµng th­îng, ngoµi ra cßn g× n÷a kh«ng?",
			"Ta còng kh«ng râ, ng­¬i ®Õn {§¹i Lı} hái nh÷ng ng­êi H¸n ë ®ã may ra cã chót manh mèi.",
			"§a t¹ tiÒn bèi chØ gi¸o!",
			"(Ng­êi H¸n ë {§¹i Lı}…Xem ra ph¶i t×m {TrŞnh Qu¸n Chi} råi!)",
			}
		  TalkEx("",strTalk);
			SetTask(TASK_DL_LV40_ID,6);
		  TaskTip("§Õn §¹i Lı t×m TrŞnh Qu¸n Chi");
		  Msg2Player("§Õn §¹i Lı t×m TrŞnh Qu¸n Chi");
		  GivePlayerAward("Level_40","xn_step_4","chest","Level_44");
		  GivePlayerExp(SkeyDali,"chihuojiaoyinmou")
		  RemoveTrigger(GetRunningTrigger());
		  return
	end
end;

--ÓëÕÔÑÓÄê¶Ô»°2
function Zhaoyannian_Talk_01()

local strTalk	= {
	"Hoµng ®Õ {§oµn T­ Th«ng} tr­íc khi b¨ng hµ cã ®Ó l¹i th¸nh chØ truyÒn ng«i cho mét trong {ba vŞ hoµng tö}, nh­ng c¶ ba vŞ ®Òu muèn tranh ng«i b¸u. Sau ®ã th× Hoµng tö c¶ mÊt tİch, nhŞ hoµng tö ph¶n lo¹n, cuèi cïng Tam Hoµng tö §oµn Tè Kh¸nh lªn ng«i.",
	"{Xi Háa gi¸o} t¸c lo¹n còng v× chuyÖn nµy? Sao t¹i h¹ kh«ng nghe {Cao Th¨ng TuyÒn} nãi g×?",
	"Sau khi {Tam Hoµng tö} lªn ng«i míi cã chuyÖn {Xi Háa gi¸o} ph¶n lo¹n, nh­ng cã liªn quan ®Õn chuyÖn nµy hay kh«ng ta còng kh«ng râ. §©y chØ lµ chuyÖn néi bé nªn Cao tiÒn bèi còng kh«ng tiÖn nãi ra.",
	}
	TalkEx("Zhaoyannian_Talk_02",strTalk);
end

--ÓëÕÔÑÓÄê¶Ô»°3
function Zhaoyannian_Talk_02()	

local strTalk	=	{
	"T¹i h¹ muèn ®iÒu tra mét chót manh mèi vÒ {Xi Háa gi¸o}, tiÒn bèi nãi xem t¹i h¹ ph¶i lµm thÕ nµo?",
	"Téc tr­ëng Miªu LÜnh tr­íc ®©y cã qua l¹i víi Xi Háa gi¸o ng­¬i thö ®Õn ®ã hái xem.",
	"§a t¹ tiÒn bèi chØ gi¸o!"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ID,2);
	TaskTip("§Õn gÆp Téc tr­ëng Miªu LÜnh");
	Msg2Player("§Õn gÆp Téc tr­ëng Miªu LÜnh");
	GivePlayerAward("Level_40","xn_step_2");
	GivePlayerExp(SkeyDali,"dalihuangzu")
	return
end

--É±ËÀÃçÁë»¤Ó¡
function MLHY_Killed_1()

  if g_probability(30, 100) then
  	AddItem(2,0,366,1,1);--µÃµ½÷äÆ¤
  	if GetItemCount(2,0,366) >= 10 then
  		TaskTip("§· t×m ®ñ 10 tÊm Da h­¬u, quay vÒ gÆp TrŞnh Qu¸n Chi");
  		Msg2Player("§· t×m ®ñ 10 tÊm Da h­¬u, quay vÒ gÆp TrŞnh Qu¸n Chi");
  	end;
	end;
end;

--É±ËÀÃçÁëÍÁË¾
function MLTS_Killed_1()

    if g_probability(30, 100) then
      AddItem(2,0,368,1,1);--µÃµ½ÍÁË¾Ååµ¶
      if GetItemCount(2,0,368) >= 10 then
      	TaskTip("§· lÊy ®­îc 10 Béi §ao quay vÒ gÆp TrÇn LËp Hoµnh");
      	Msg2Player("§· lÊy ®­îc 10 Béi §ao quay vÒ gÆp TrÇn LËp Hoµnh");
    	end;
		end;
end;

--É±ËÀ×ÓÒ¹»¢
function MidnightTiger_Killed_1()
   
    if g_probability(40, 100) then
      AddItem(2,0,371,1,1);--µÃµ½×ÓÒ¹»¢ÑÀ
      if GetItemCount(2,0,371) >= 10 then
      	TaskTip("§· t×m ®­îc 10 nanh D¹ Hæ!");
      	Msg2Player("§· t×m ®­îc 10 nanh D¹ Hæ!");
    	end;
		end;
end;

--É±ËÀ°×Í·µñ
function BaldEagle_Killed_1()
    
    if g_probability(40, 100) then
      AddItem(2,0,372,1);--µÃµ½°×Í·µñÓğ
      if GetItemCount(2,1,372) >= 10 then
      	TaskTip("§· t×m ®­îc 10 l«ng B¹ch §Çu §iªu");
      	Msg2Player("§· t×m ®­îc 10 l«ng B¹ch §Çu §iªu");
    	end;
		end;
end;

--ÓëÄªÈı¶Ô»°
function MoSan_Talk()

	--Î´ÁìÈ¡·ï»Ëôá
	if GetTask(TASK_DL_LV55_ID) == 2 then

		local strTalk = {};
		
		--ÄªÈıÍ½µÜ¶Ô»°
		if GetLifeSkillLevel(1,4) ~= 0 then
		
			strTalk = {
				"M¹c s­ b¸, t¹i h¹ cã viÖc muèn nhê ng­êi.",
				"Cao Th¨ng TuyÒn ph¸i ng­¬i ®Õn µ? Ta biÕt råi, t×m ®ñ vËt liÖu ta sÏ gióp cho.",
				"M¹c s­ b¸ biÕt hÕt råi ­?",
				"Ta vµ Cao huynh ¬n nghÜa s©u nÆng, lÇn nµy huynh Êy cã viÖc lÏ nµo ta l¹i tõ chèi?",
				"Th× ra lµ vËy!",
				"Kh«ng cÇn kh¸ch s¸o.",
				"uh!!",
				"…",
				"Xong råi! Nh­ng Phông Hoµng Linh nµy rÊt mau mÊt t¸c dông! H·y mau ®Õn Phông Nh·n ®éng gäi ra vµ ®¸nh b¹i Phông Hoµng!",
				"T¹i h¹ biÕt råi, ®a t¹ Tam s­ b¸.",
				}
		else
			strTalk = {
				"{M¹c s­ b¸}, t¹i h¹ ®­îc Cao Quèc C«ng sai ®Õn t×m ng­êi.",
				"§Õn nhê ta chÕ t¹o Phông Hoµng Linh µ? §îi mét l¸t nhĞ!",
				"Xin ®a t¹!",
				"…",
				"Xong råi! Nh­ng Phông Hoµng Linh nµy rÊt mau mÊt t¸c dông! H·y mau ®Õn Phông Nh·n ®éng gäi ra vµ ®¸nh b¹i Phông Hoµng!",
				"T¹i h¹ biÕt råi, ®a t¹ Tam s­ b¸.",
				}		
  	end;
  	
		TalkEx("",strTalk);
		DelItem(2,0,371,10);--É¾È¥10¸ö»¢ÑÀ
		DelItem(2,0,372,10);--É¾È¥10¸öµñÓğ
		AddItem(2,0,373,1,1)--µÃµ½ÕÙ»½åÈÂ¥ÂŞÎïÆ··ï»Ëôá
		SetTask(TASK_DL_LV55_ID,3);
		CreateTrigger(1,450,TIME_DL_PHENIX);
		ContinueTimer(GetTrigger(TIME_DL_PHENIX));
		local	nTime = GetTime();
		SetTask(TASK_DL_LV55_TIME,nTime);--¼ÇÂ¼µÃµ½·ï»ËôáÊ±¼ä
		Msg2Player("Dïng Phông Hoµng Linh gäi vµ ®¸nh b¹i Phông Hoµng (trong 30 phót)!");
		TaskTip("Dïng Phông Hoµng Linh gäi vµ ®¸nh b¹i Phông Hoµng (trong 30 phót)!");
		GivePlayerExp(SkeyDali,"tiejiangmoshan")
		return
	end
	
	--²¹ÁìµÀ¾ß·ï»ËôáºÍ¶Ô»°´¥·¢Æ÷
	if GetTask(TASK_DL_LV55_ID) == 3 then
		local nTime = GetTime();
		local nTaskTime = GetTask(TASK_DL_LV55_TIME);
		if GetItemCount(2,0,373) <= 0 and nTime - nTaskTime >= 1800 then
			CreateTrigger(4,201,TALK_DL_MOSAN);
			CreateTrigger(1,450,TIME_DL_PHENIX);
			ContinueTimer(GetTrigger(TIME_DL_PHENIX));
			nTime = GetTime();
			SetTask(TASK_DL_LV55_TIME,nTime);--¼ÇÂ¼µÃµ½·ï»ËôáÊ±¼ä
			AddItem(2,0,373,1,1)--µÃµ½ÕÙ»½åÈÂ¥ÂŞÎïÆ··ï»Ëôá
			Msg2Player("Dïng Phông Hoµng Linh gäi vµ ®¸nh b¹i Phông Hoµng (trong 30 phót)!");
			TaskTip("Dïng Phông Hoµng Linh gäi vµ ®¸nh b¹i Phông Hoµng (trong 30 phót)!");
		end;
		local strTalk = {
			"CÇm Ph­îng Hoµng Linh ®Õn Ph­îng Nh·n ®éng sö dông, nÕu thÊt b¹i hoÆc mÊt Ph­îng Hoµng Linh, th× ®Õn chç ta lÊy 1 c¸i míi, nh­ng mµ chÕ t¹o Ph­îng Hoµng Linh cßn cÇn mét İt thêi gian, cÇn 30 phót ®Ó lµm thªm mét c¸i kh¸c, <sex> ph¶i gi÷ g×n cÈn thËn. ",
			}
		
		TalkEx("",strTalk);
		return
	end
	
	--È·±£É¾µô¶Ô»°´¥·¢Æ÷
	if GetTask(TASK_DL_LV55_ID) >= 4 then
		RemoveTrigger(GetRunningTrigger());
	end
end

--·ï»ËôáÊ±¼ä³¬Ê±
function Phenix_TimeOut()

local strTalk = {
	"§· qu¸ 30 phót, Phông Hoµng Linh  ®· hÕt hiÖu lùc quay l¹i T­¬ng D­¬ng t×m M¹c Tam."
}

	TalkEx("",strTalk);
	if GetTrigger(TALK_DL_MOSAN) == 0 then
		CreateTrigger(4,201,TALK_DL_MOSAN);
	end;
	DelItem(2,0,373,1);--É¾È¥·ï»Ëôá
	RemoveTrigger(GetRunningTrigger());
	Msg2Player("Quay l¹i t×m M¹c tam nhËn Phông Hoµng Linh míi.");
	TaskTip("Quay l¹i t×m M¹c tam nhËn Phông Hoµng Linh míi.");

end

--58¼¶ÈÎÎñÙÜÌ«¾ı¶Ô»°´¥·¢Æ÷
function SheTaiJun_Talk()

local strTalk = {};
	
	--ÁìÈ¡Ğ¡º¢
	if GetTask(TASK_DL_LV55_ID) == 6 then
		if GetPlayerFaction() == 6 then
			strTalk = {
				"L·o Th¸i Qu©n, t¹i h¹ tu©n lÖnh {§æng Quèc S­} ®Õn ®ãn c«ng tö {§æng Ca Minh} vÒ {§¹i Lı}.",
				"§· nhËn nhiÖm vô th× lµm cho tèt, ®õng ®Ó mÊt mÆt ng­êi cña D­¬ng M«n.",
				"uh!!",
				"§æng Ca Minh ®Õn ®©y ch­a l©u, vâ c«ng häc ®­îc còng ch­a nhiÒu, ng­¬i ®­a thiÕu gia vÒ th¨m phô mÉu vµi h«m råi quay l¹i tiÕp tôc luyÖn vâ nhĞ!",
				"uh!!",
				"§æng Ca Minh, chuÈn bŞ xong ch­a? T­íng sÜ nµy sÏ ®­a con vÒ th¨m phô th©n, huynh Êy còng lµ ®Ö tö D­¬ng gia chóng ta.",
				"Ta muèn mua mét vµi mãn ®Æc s¶n ë §¹i Tèng vÒ cho phô mÉu nh­ng kh«ng biÕt chän mãn nµo, nªn ®· ®Æc toµn bé mãn ¨n ngon ë nh÷ng Löu lÇu trong c¸c thµnh thŞ!",
				"Cã hiÕu nh­ vËy thËt lµ tèt. PhiÒn b»ng h÷u gióp thiÕu gia nhĞ!"
				}
		else 
			strTalk = {
				"L·o Th¸i Qu©n t¹i h¹ tu©n lÖnh {§æng Quèc S­} ®Õn ®ãn c«ng tö {§æng Ca Minh} vÒ {§¹i Lı}.",
				"<sex> vÊt v¶ qu¸! LÇn nµy c«ng tö vÒ th¨m phô mÉu råi sím quay l¹i ®©y tiÕp tôc luyÖn vâ nhĞ!",
				"T¹i h¹ sÏ b¸o l¹i víi {§æng Quèc S­}.",
				"§æng Ca Minh chÈn bŞ xong hÕt ch­a? Theo <sex> vÒ §¹i Lı nhĞ!",
				"Ta muèn mua mét vµi mãn ®Æc s¶n ë §¹i Tèng vÒ cho phô mÉu nh­ng kh«ng biÕt chän mãn nµo, nªn ®· ®Æc toµn bé mãn ¨n ngon ë nh÷ng Löu lÇu trong c¸c thµnh thŞ!",
				"Cã hiÕu nh­ vËy thËt lµ tèt. PhiÒn b»ng h÷u gióp thiÕu gia nhĞ!",
				}
		end
	TalkEx("SheTaiJun_Talk_01",strTalk);
end
	
	--Î´½«Ğ¡º¢ËÍ»ØÈ¥
	if GetTask(TASK_DL_LV55_ID) == 7 then
		local strTalk = {
			"§­êng ®i rÊt nguy hiÓm, nhí b¶o träng nhĞ!",
			}
			
		TalkEx("",strTalk);
		--RemoveTrigger(GetRunningTrigger())
		return
	end;
end


function SheTaiJun_Talk_01()

local strTalk = {
				"Cã: Bµo Ng­ (BiÖn Kinh), VŞt quay (D­¬ng Ch©u), Long Ch©u (TuyÒn Ch©u), b¸nh tæ (T­¬ng D­¬ng), b¸nh İt (Thµnh §«)",
				"Còng ®­îc! Mau mua nhanh råi vÒ th¨m phô th©n nhĞ!",
				}
	TalkEx("",strTalk);
	SummonNpc("§æng Ca Minh","§æng Ca Minh");
	SetTask(TASK_DL_LV55_ID,7);
	--UseScrollEnable(0);--ÆÁ±Î»Ø³Ì·ûÊ¹ÓÃ
	--SetDeathScript("\\script\\task\\world\\´óÀí\\Lv58\\playerdeath.lua");--ÉèÖÃ´øĞ¡º¢¹ı³ÌÖĞµÄÍæ¼ÒËÀÍö½Å±¾
	Msg2Player("§­a §æng Ca Minh ®Õn c¸c thµnh thŞ ®Ó mua vËt phÈm");
	TaskTip("§­a §æng Ca Minh ®Õn c¸c thµnh thŞ ®Ó mua vËt phÈm");
	GivePlayerAward("Level_58", "xn_step_1");
	GivePlayerExp(SkeyDali,"yangmenxuexi")
	
end

--É±ËÀ20¸ö¶¾òğ
function PoisonBat_Killed_20()
	
	RemoveTrigger(GetRunningTrigger());
	SetTask(TASK_DL_LV60_ID,2);
	TaskTip("§· giÕt ®­îc 20 d¬i ®éc, quay vÒ gÆp §æng Giµ La");
	Msg2Player("§· giÕt ®­îc 20 d¬i ®éc, quay vÒ gÆp §æng Giµ La");
	
end

--Ò¹ÌäÑªÑ»ËÀÍö´¥·¢Æ÷
function BloodCrow_Killed_1()
  
    if g_probability(40, 100) then
      AddItem(2,0,197,1,1);--µÃµ½ÑªÑ»Óğ
    	if GetItemCount(2,0,197) >= 10 then
      	TaskTip("§· lÊy ®ñ 10 HuyÕt Nha Vò");
      	Msg2Player("§· lÊy ®ñ 10 HuyÕt Nha Vò");
    	end;
		end;
end

--É±ËÀ15¸ö¿şÀÜ¶¾ÈË
function CreatureMan_Killed_15()
	
	RemoveTrigger(GetRunningTrigger());
	if GetTask(TASK_DL_LV35_ID_ZX) == 100 and GetTask(TASK_DL_LV62_ID) == 3 then
		SetTask(TASK_DL_LV62_ID,4);
		TaskTip("GiÕt ®­îc 15 Kh«i Lçi §éc Nh©n vµ Xi Háa Tr­ëng l·o, quay vÒ gÆp TrŞnh Qu¸n Chi.");
		Msg2Player("GiÕt ®­îc 15 Kh«i Lçi §éc Nh©n vµ Xi Háa Tr­ëng l·o, quay vÒ gÆp TrŞnh Qu¸n Chi.");
	else
		SetTask(TASK_DL_LV35_ID_ZX,100);--½èÓÃ1304ºÅ±äÁ¿±ê¼Ç
		TaskTip("GiÕt ®­îc 15 Kh«i Lçi §éc Nh©n");
		Msg2Player("GiÕt ®­îc 15 Kh«i Lçi §éc Nh©n");
	end;
end

--É±ËÀ15¸öò¿»ğ³¤ÀÏ
function ChiHuoElder_Killed_15()
	
	RemoveTrigger(GetRunningTrigger());
	if GetTask(TASK_DL_LV35_ID_ZX) == 100 and GetTask(TASK_DL_LV62_ID) == 3 then
		SetTask(TASK_DL_LV62_ID,4);
		TaskTip("GiÕt ®­îc 15 Kh«i Lçi §éc Nh©n vµ Xi Háa Tr­ëng l·o, quay vÒ gÆp TrŞnh Qu¸n Chi.");
		Msg2Player("GiÕt ®­îc 15 Kh«i Lçi §éc Nh©n vµ Xi Háa Tr­ëng l·o, quay vÒ gÆp TrŞnh Qu¸n Chi.");
	else
		SetTask(TASK_DL_LV35_ID_ZX,100);--½èÓÃ1304ºÅ±äÁ¿±ê¼Ç
		TaskTip("GiÕt ®­îc 15 Xi Háa Tr­ëng L·o");
		Msg2Player("GiÕt ®­îc 15 Xi Háa Tr­ëng L·o");
	end;
end

--°ÙÏşÉú¶Ô»°´¥·¢Æ÷
function BaiXiaoSheng_Talk()

local strTalk = {};
	--Íê³ÉÎå¶¾½ÌµÄÅ­»ğÈÎÎñºó
	if GetTask(TASK_DL_LV75_ID) == 3 then
		strTalk = {
			"TiÒn bèi, cã viÖc nhê tiÒn bèi chØ gi¸o.",
			"Ch¶ ph¶i lÇn tr­íc ta ®· nãi råi, sao l¹i ®Õn n÷a?",
			"LÇn nµy lµ chuyÖn kh¸c…",
			"Nh÷ng ®iÒu ng­¬i quan t©m ®Òu cã hÕt trong tÊm §¹i Lı Cùu Chİ. HiÖn giê L­u §iÓn ®ang gi÷, mau ®Õn §¹i Lı t×m «ng Êy ®i.",
			"§a t¹ tiÒn bèi!",
			}
		
		TalkEx("",strTalk);
		CreateTrigger(4,203,TALK_DL_BAIXIAOSHENG);
		Msg2Player("§Õn §¹i Lı t×m L­u §iÓn");
		TaskTip("§Õn §¹i Lı t×m L­u §iÓn");
		SetTask(TASK_DL_LV75_ID,4);
		GivePlayerExp(SkeyDali,"qiyi")
		--RemoveTrigger(GetTrigger(TALK_DL_BAIXIAOSHENG));
		return
	end
	--Î´ÓëÁõµä¶Ô»°
	if GetTask(TASK_DL_LV75_ID) == 4 then
		strTalk = {
		"Ng­¬i cã thÓ ®Õn §¹i Lı t×m L­u §iÓn ®Ó hái vÒ tÊm §¹i Lı Cùu Chİ."
		}
		TalkEx("",strTalk);
		return
	end
end

--ºÚĞÉĞÉËÀÍö´¥·¢½Å±¾
function Jocko_Killed_1()

    if g_probability(40, 100) then
      AddItem(2,0,379,1,1);--µÃµ½´óÀí¾ÉÖ¾²ĞÆ¬
      if GetItemCount(2,0,379) >= 10 then
      	TaskTip("§· thu thËp ®­îc 10 tÊm §¹i Lı Cùu Chİ");
      	Msg2Player("§· thu thËp ®­îc 10 tÊm §¹i Lı Cùu Chİ");
    	end;
		end;
end

--ò¿»ğµ¶¿ÍËÀÍö´¥·¢½Å±¾
function DaoKe_Killer_10()

local strTalk = {
	"Cßn ®¸nh träng th­¬ng ng­êi cña bän ta, chuyÖn nµy lµ thÕ nµo?",
	"NhŞ vŞ chí hiÓu lÇm, ta kh«ng cßn c¸ch nµo kh¸c míi ph¶i lµm nh­ vËy.",
	"Ta ®Õn t×m tªn tiÓu tö mµ ng­¬i võa nh¾c ®Õn, h¾n hÑn hß víi t×nh nh©n bá trèn nh­ng bŞ c¸c ng­¬i b¾t gi÷.",
	"Hõm…hÑn hß gi÷a ®ªm h«m vÇy µ?",
	"(NghÜ thÇm) (Ta còng ch­a gÆp A Méng lÇn nµo, chi b»ng quay vÒ gÆp A Ch©u vËy)"
	}
	TalkEx("",strTalk);
	SetTask(TASK_DL_LV40_ZX_ID,5);
	TaskTip("Quay l¹i Miªu LÜnh b¸o l¹i t×nh h×nh cho A Ch©u");
	Msg2Player("Quay l¹i Miªu LÜnh b¸o l¹i t×nh h×nh cho A Ch©u");
end


	