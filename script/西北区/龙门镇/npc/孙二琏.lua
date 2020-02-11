-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCËï¶şçöScript
-- By StarryNight
-- 2007/06/07 PM 2:47

-- ÏëÄîÊÇÒ»É²ÄÇ£¬Ë¼ÄîÊÇºÜ¶à¸öÒ»É²ÄÇ

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);

	---------------------------------- Î÷±±ÈÎÎñ02ÇéÀ§¿ÍÕ»----------------------------------
	
	--¿ªÊ¼ÈÎÎñ
	if nStep_XBTask == 5 then
		task_002_01_0();
		return
	end
	
	--Î´ÓëµêĞ¡¶şÈ¡µÃĞÑ¾ÆÒ©
	if nStep_XBTask >= 6 and nStep_XBTask <= 7 then
		task_002_01_1();
		return
	end
	
	--ËÍ·şĞÑ¾ÆÒ©ºó¶Ô»°
	if nStep_XBTask == 8 then
		task_002_04_0();
		return
	end
	
	--Î´È¡µÃ¶Ç¶µÖ®Ç°¶Ô»°
	if nStep_XBTask >= 9 and nStep_XBTask <= 12 then
		task_002_04_1();
		return
	end
	
	---------------------------------- Î÷±±ÈÎÎñ04ÕĞ±øÂòÂí----------------------------------
	--È¡µÃ¶Ç¶µºó½«¶Ç¶µ½»ÓëËï¶şçö
	if nStep_XBTask == 13 then
		task_004_01_0();
		return
	end
	
	--»¹Ã»È¡µÃ»òÈ¡µÃÒ»Æ·ÌÃÑûÇëº¯
	if nStep_XBTask == 14 then
		task_004_02_0();
		return
	end
	
	--»¹Ã»ÓëÅ·Ñô»­»ã±¨Çé¿ö
	if nStep_XBTask == 15 then
		task_004_02_1();
		return
	end
	
	--ÔùËÍÎåĞĞÕóÃÅÆ±
	if GetBit(GetTask(GIVE_TICKET_STATE),6) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"ThËp Tam N­¬ng… Mü KiÒu N­¬ng…"},
		{"Cßn rÊt nhiÒu tin tøc cÇn thu thËp, thùc ra tin tøc còng cã thÓ mua ®­îc b»ng tiÒn vËy."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--ÔùËÍÃÅÆ±½Å±¾
function give_ticket_01()

local strTalk = {
	"T«n NhŞ LiÖm: <sex> chóng ta l¹i gÆp nhau råi, vÉn kháe chø? Nghe ¢u D­¬ng tiªn sinh nãi ng­¬i ®· ph¸ ®­îc ©m m­u cña NhÊt PhÈm §­êng, viÖc nµy khiÕn ta rÊt kh©m phôc. ChuyÖn NhÊt PhÈm §­êng ®óng ra ®· ®Õn håi kÕt thóc, kh«ng ngê thiªn tai l¹i ®æ xuèng, ng­¬i cã thÊy ®¸m m©y ®en ®»ng xa kh«ng? Nã ®· tô ë ®©y h¬n m­êi mÊy ngµy råi vÉn ch­a tan!",
	"Ng­êi ch¬i: T«n tiªn sinh kh¸ch s¸o qu¸! T¹i h¹ khi vµo Long M«n trÊn thÊy h×nh nh­ n¬i ®©y bŞ tµn ph¸ rÊt nhiÒu, nhiÒu nhµ ®· bŞ giã c¸t vïi lÊp, Long M«n trÊn ®· x¶y ra chuyÖn g×? §¸m m©y ®en nµy dù b¸o ®iÒu g×?",
	"T«n NhŞ LiÖm: §óng nh­ <sex> ®· thÊy, mÊy ngµy nay Long M«n trÊn bŞ b·o c¸t tµn ph¸, cuång phong tr«i qua ch¼ng ai giËn d÷ chØ cã vµi hé ®· dän ®i råi, chØ cã qu¸n trä Long M«n, dï ta cã khuyªn ThËp Tam N­¬ng c¸ch mÊy bµ ta còng kh«ng chŞu dän ®i n¬i kh¸c, kh«ng biÕt v× sao n÷a...ng­¬i nãi xem, qu¸n trä nhá nµy lµm sao chèng ®ì ®­îc nÕu b·o c¸t l¹i xuÊt hiÖn?",
	"Ng­êi ch¬i: Th× ra tiªn sinh lo l¾ng qu¸n trä lµ cña ThËp Tam N­¬ng? Theo lêi tiªn sinh nãi trÊn nµy chØ cßn duy nhÊt qu¸n trä nµy, b·o c¸t rèt côc lµ chuyÖn g× vËy?",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"T«n NhŞ LiÖm: Kh«ng sai! Ta lµ ng­êi ë gÇn sa m¹c biÕt chuyÖn b·o c¸t, cã lÏ «ng trêi ®ang næi giËn vµ muèn trõng ph¹t nh©n gian! b¾t ®Çu tõ tËn cïng sa m¹c b·o c¸t bay ngang th× ®Õn cá c©y còng kh«ng sèng næi, cã lÏ «ng trêi kh«ng muèn gi÷ m¶nh ®Êt nµy n÷a. Qu¸n trä cña ThËp Tam N­¬ng bŞ giã c¸t che phñ bµ ta míi an t©m sao?",
	"Ng­êi ch¬i: TËn cïng sa m¹c? Bãng r©m cña ®¸m mÊy ®en ®ã cã thÓ lµ mª cung sa m¹c?",
	"T«n NhŞ LiÖm: §óng vËy! Chİnh lµ mª cung sa m¹c. <sex> ®Õn mª cung sa m¹c ch­a? H×nh nh­ nã cã mét n¬i gäi lµ tËn cïng sa m¹c, t­¬ng truyÒn th­êng cã nhiÒu ®iÒu kú bİ. b·o c¸t tõ tËn cïng sa m¹c thæi qua c¶ sa m¹c, ch¼ng lÏ chóng cã quan hÖ víi nh÷ng ®iÒu kú bİ ë tËn cïng sa m¹c?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Ng­êi ch¬i: ¶o gi¸c sa m¹c ®· bŞ ta dïng C«n L«n ph¸p khİ phong Ên, cã ®iÒu nã cã thÓ trïng sinh, NhÊt PhÈm §­êng tõng muèn khèng chÕ ¶o gi¸c ®Ó m­în nã ®Ó phôc vô cho chiÕn tranh? B·o c¸t qu¶ thËt cã søc m¹nh vËy sao? Xem ra ph¶i ®i tËn cïng sa m¹c mét chuyÕn, cã ®iÒu lÇn nµy xem ra kh«ng dÔ dµng g×.",
	"T«n NhŞ LiÖm: Th× ra lµ nguyªn nh©n nµy, cã ®iÒu <sex> muèn ®Õn tËn cïng sa m¹c th× ta kh«ng cã c¸ch nµo gióp, ph­¬ng h­íng sa m¹c rÊt khã ®o¸n, ta tõng ®Õn sa m¹c t×m t×nh b¸o, dïng {La Bµn} cã thÓ dÉn ®­êng ®Õn tËn cïng sa m¹c, mµ kh«ng sî lät vµo mª cung sa m¹c, nh­ng khi ®Õn tËn cïng sa m¹c th× tõ tr­êng sÏ mÊt ®i nÕu muèn ®i tiÕp th× ph¶i t×m thªm 1 {La Bµn}. <sex> qu¸n trä cña ThËp Tam N­¬ng cã thÓ gi÷ ®­îc hay kh«ng ®Òu nhê vµo ng­êi ®ã!",
	"Ng­êi ch¬i: Tiªn sinh qu¸ lêi råi, chuyÖn b·o c¸t cã liªn quan b¸ t¸nh xung quanh sa m¹c, lÏ nµo kh«ng tËn lùc?",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1036,1,1);--µÃµ½´ÅÉ³ÂŞÅÌ
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),6,1));
	
end
