
-- ½£ÏÀÇéÔµ II Ê¦ÃÅÈÎÎñ
-- 2005/03/14  PM 16:09
-- Edited by peres

Include("\\script\\task\\faction\\faction_head.lua");

      ------------ Å®ĞÔÍæ¼Ò


-- ¿ªÊ¼ÓëÙÜÌ«¾ı¶Ô»°

function task_001()

local strMain = {
	"Ng­¬i µ? N¬i ®©y lµ qu©n doanh, c« n­¬ng cã chŞu ®­îc khæ cùc?",
	"D­¬ng M«n n÷ t­íng vang danh thiªn h¹, Xa Th¸i Qu©n sao l¹i coi th­êng t¹i h¹?",
	"Ha ha! Th«i ®­îc! Ng­¬i h·y ®i t×m Méc QuÕ Anh, mäi viÖc cña D­¬ng M«n ®Òu do c« ta qu¶n lı.",
	"§a t¹ Xa Th¸i Qu©n!",
	}

TE_Talk(getn(strMain), "task_002", strMain);

TaskTip("§i t×m Méc QuÕ Anh xin gia nhËp D­¬ng m«n!");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º1
function task_002()

	SetTask(1032,1);

end

-- ÓëÄÂ¹ğÓ¢¶Ô»°1
function task_003()

local strMain = {
  "Méc t­íng qu©n! Ta muèn gia nhËp D­¬ng M«n, Xa Th¸i Qu©n b¶o ta ®Õn t×m ng­êi.",
	"Gia nhËp D­¬ng M«n? Hay l¾m! MÆc dï n÷ tèt kh«ng thuéc Khu MËt viÖn cai qu¶n nh­ng ph¶i ®­îc sù ®ång ı cña triÒu ®×nh.",
	"H·y ®Õn BiÖn Kinh t×m Thõa t­íng <color=yellow>TriÖu Phæ<color> ghi tªn vµo sæ råi quay l¹i ®©y!",
  "§a t¹ Méc t­íng qu©n!",
	}

TE_Talk(getn(strMain), "task_004", strMain);

TaskTip("Méc QuÕ Anh b¶o b¹n ®i BiÖn Kinh t×m TriÖu Phæ");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º2
function task_004()

	SetTask(1032,2);

end


-- ÓëÕÔÆÕ¶Ô»°1
function task_005()

local strMain = {
  "TriÖu ®¹i nh©n! T¹i h¹ lµ t©n binh cña D­¬ng M«n, Méc QuÕ Anh b¶o t¹i h¹ ®Õn ®©y ®Ó ghi danh vµo sæ.",
	"Tr­íc ®©y th× ®óng lµ ®Õn chç ta ®Ó ghi tªn vµo danh s¸ch nh­ng gÇn ®©y viÖc nµy ®­îc chuyÓn cho CÊm qu©n lµm.",
	"H·y ®Õn cæng chİnh Hoµng cung t×m <color=yellow>CÊm qu©n<color> hái t×nh h×nh cô thÓ.",
	}

TE_Talk(getn(strMain), "task_006", strMain);

TaskTip("TriÖu Phæ b¶o b¹n ®Õn cæng Hoµng cung t×m CÊm qu©n");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º3
function task_006()

	SetTask(1032,3);

end

-- ÓëÀñ¹Ù¶Ô»°
function task_007()

local strMain = {
  "D­¬ng M«n n÷ binh!?",
	"MÆc dï D­¬ng M«n n÷ tèt thuéc qu¶n lı cña CÊm qu©n nh­ng chØ lµ trªn danh nghÜa ®Ó tiÖn söa ch÷a tªn danh s¸ch.",
	"Nh­ng thËt sù D­¬ng M«n vÉn thuéc Thiªn Ba phñ, ng­¬i cø bÈm b¸o thÕ víi TriÖu ®¹i nh©n.",
	}

TE_Talk(getn(strMain), "task_008", strMain);

TaskTip("CÊm qu©n b¶o b¹n ®i t×m TriÖu Phæ");

end;

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º4
function task_008()

	SetTask(1032,4);

end;


-- ÓëÕÔÆÕ¶Ô»°2
function task_009()

local strMain = {
  "Th× ra lµ vËy! Nh­ng muèn CÊm qu©n nhËp sæ ph¶i ®Õn Khu MËt viÖn t×m Tµo B©n ®¹i nh©n.",
	"ThÕ nµy vËy! Ta sÏ nãi víi Tµo ®¹i nh©n viÖc nµy, ng­¬i h·y vÒ bÈm b¸o <color=yellow>Méc QuÕ Anh<color> t­íng qu©n ®i!",
	"PhiÒn TriÖu ®¹i nh©n vËy!",
	}

TE_Talk(getn(strMain), "task_010", strMain);

TaskTip("TriÖu Phæ b¶o b¹n ®i t×m Méc QuÕ Anh");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º5
function task_010()

	SetTask(1032,5);

end

-- ÓëÄÂ¹ğÓ¢¶Ô»°2
function task_011()

local strMain = {
  "§· xong viÖc råi µ?",
	"§óng vËy! Nh­ng sao lóc th× do CÊm qu©n qu¶n lı lóc th× Khu MËt viÖn lµ thÕ nµo? ThËt phiÒn phøc!",
	"ViÖc nµy ta còng kh«ng râ l¾m! Ta chØ lo viÖc qu©n t×nh cßn viÖc quan tr­êng ta kh«ng muèn nghÜ tíi!",
  "Cho nªn ta lu«n ë trong phñ hiÕm khi gÆp bän hä.", 
  "T¹i h¹ cã thÓ mua ngùa cña D­¬ng M«n ë ®©u?",
	"Trong phñ cã xa m· phßng, qu©n sÜ trong phñ lo luyÖn chiÕn m·, ng­¬i cã thÓ trùc tiÕp t×m <color=green>D­¬ng Bµi Phong<color>.",
  "Trªn chiÕn tr­êng nÕu bŞ th­¬ng còng lµ chuyÖn th­êng t×nh cho nªn nhÊt ®Şnh ph¶i biÕt c¸ch trŞ th­¬ng c¬ b¶n. Ng­¬i ®em <color=yellow>5 cuén b¨ng<color> ®Õn ®©y cho ta.", 
  "B¨ng? Ta kh«ng biÕt!",
  "RÊt ®¬n gi¶n! §©y lµ <color=yellow>kü n¨ng giang hå<color> ai còng ph¶i biÕt. H·y xem trong giao diÖn <color=yellow>kü n¨ng sèng<color>.", 
	}

TE_Talk(getn(strMain), "task_012", strMain);

RestoreStamina()
TaskTip("Méc QuÕ Anh b¶o b¹n lµm 5 cuén b¨ng");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º6
function task_012()

	SetTask(1032,6);

end

-- Íæ¼ÒÓĞ±Á´øÀ´½»ÈÎÎñÊ±
function task_013()

local strMain = {
		"T¹i h¹ ®· lµm xong 5 cuén b¨ng.",
		"Tay ch©n còng nhanh nhÑn! Giê h·y ®Õn gÆp <color=yellow>Xa Th¸i Qu©n<color>."
	}

	if (GetItemCount(1,0,1)>=5) then
		TE_Talk(getn(strMain), "task_014", strMain);		
	else
		Say("NhÊn <color=yellow>F5<color> chän <color=yellow>Sèng<color> ®Ó xem <color=yellow>kü n¨ng sèng<color>.",0);
		return
	end;

end;

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º7
-- É¾³ı±Á´ø
function task_014()
	TaskTip("B©y giê cã thÓ gÆp Xa Th¸i Qu©n");
	DelItem(1,0,1,5);
	SetTask(1032,7);
end;


-- »ØÈ¥ÓëÙÜÌ«¾ıµÄ¶Ô»°

function task_015()

local strMain = {
		"Tõ nay trë ®i ng­¬i ®· trë thµnh ng­êi cña D­¬ng Gia T­íng, sau nµy h·y cè g¾ng rÌn luyÖn kh«ng ®­îc l­êi biÕng.",
		"D­¬ng Gia T­íng ta tinh th«ng cung m·, D­¬ng Gia Th­¬ng næi tiÕng thiªn h¹. NÕu ng­¬i muèn häc <color=yellow>Th­¬ng ph¸p<color> ®Õn t×m <color=yellow>D­¬ng T«n B¶o<color>; nÕu muèn häc <color=yellow>Cung thuËt<color> ®Õn t×m <color=yellow>Méc QuÕ Anh<color>."
	}
	
TE_Talk(getn(strMain), "task_016", strMain);

end


-- ÓëÕÆÃÅ¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿£º8
function task_016()

	SetTask(1032,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈëÑîÃÅ£¡")
	TaskTip("B¹n ®· gia nhËp D­¬ng M«n. T×m Gi¸o ®Çu häc vâ c«ng")
	
	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end



      ------------ ÄĞĞÔÍæ¼Ò


-- ¿ªÊ¼ÓëÙÜÌ«¾ı¶Ô»°


function task_101()

local strMain = {
	"Ng­¬i muèn gia nhËp D­¬ng M«n? §©y lµ qu©n doanh kû luËt rÊt nghiªm, kh«ng nh­ c¸c m«n ph¸i trªn giang hå. Ng­¬i nªn suy nghÜ kü.",
	"T¹i h¹ ®· nghÜ kü, quèc gia cã n¹n, ta còng ph¶i cã chót tr¸ch nhiÖm",
	"Hay l¾m! D­¬ng M«n nam tèt do <color=yellow>D­¬ng T«n B¶o<color> qu¶n lı, h·y ®i t×m y.",
	}

TE_Talk(getn(strMain), "task_102", strMain);

TaskTip("§i t×m D­¬ng T«n B¶o xin gia nhËp D­¬ng m«n!");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º1
function task_102()

	SetTask(1031,1);

end

-- ÓëÑî×Ú±£¶Ô»°1
function task_103()

local strMain = {
  "D­¬ng t­íng qu©n! T¹i h¹ muèn gia nhËp D­¬ng M«n, Xa Th¸i Qu©n b¶o t¹i h¹ ®Õn t×m ng­êi",
	"Cã chİ khİ! Tßng qu©n b¸o quèc lµ viÖc nam nh©n ®¹i tr­îng phu nªn lµm!",
  "VËy xem nh­ t¹i h¹ ®· gia nhËp D­¬ng M«n råi µ?",
	"Muèn tßng qu©n ph¶i ®­îc triÒu ®×nh cho phĞp, h·y ®Õn BiÖn Kinh t×m Khu MËt Sø <color=yellow>Tµo B©n<color>, «ng ta qu¶n lı danh s¸ch qu©n sÜ.",
  "Tu©n lÖnh t­íng qu©n!",
	}

TE_Talk(getn(strMain), "task_104", strMain);

TaskTip("D­¬ng T«n B¶o b¶o b¹n ®i BiÖn Kinh t×m Tµo B©n");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º2
function task_104()

	SetTask(1031,2);

end


-- Óë²Ü±ò¶Ô»°1
function task_105()

local strMain = {
  "Ngµi lµ Tµo B©n ®¹i nh©n? T¹i h¹ muèn tßng qu©n, D­¬ng T«n B¶o t­íng qu©n b¶o t¹i h¹ ®Õn gÆp ngµi.",
	"NÕu nh­ D­¬ng t­íng qu©n tiÕn cö th× kh«ng cã vÊn ®Ò g×. Nh­ng tiÓu huynh ®Ö cã thÓ gióp ta mét chuyÖn?",
  "Xin Tµo ®¹i nh©n cø nãi!",
	"GÇn ®©y triÒu ®×nh cã mua mét ®µn ngùa nh­ng ®Õn giê vÉn ch­a chuyÓn ®Õn. Ng­¬i gióp ta hái ng­êi <color=yellow>B¸n ngùa<color> xem bao l©u sÏ chuyÓn ®Õn.",
  "Th«i ®­îc!",
	}

TE_Talk(getn(strMain), "task_106", strMain);

TaskTip("Tµo B©n b¶o b¹n ®i BiÖn Kinh t×m B¸n ngùa");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º3
function task_106()

	SetTask(1031,3);

end

-- Óëãê¾©Âí··¶Ô»°
function task_107()

local strMain = {
  "¤ng chñ! Tµo ®¹i nh©n nhê t«i hái «ng sè ngùa lÇn tr­íc ®Æt bao giê chuyÓn ®Õn.",
	"Ngùa cña Tµo ®¹i nh©n? Ta sÏ lËp tøc chuyÓn qua.",
  "Xin ®a t¹!",
	}

TE_Talk(getn(strMain), "task_108", strMain);

TaskTip("Quay vÒ gÆp Tµo B©n");

end;

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º4
function task_108()

	SetTask(1031,4);

end;


-- Óë²Ü±ò¶Ô»°2
function task_109()

local strMain = {
  "ThÕ nµo?",
	"B¸n ngùa nãi sÏ lËp tøc chuyÓn ®Õn.",
  "Hay l¾m! §¹i Tèng vµ KhiÕt §an ®ang giao chiÕn, chiÕn m· rÊt quan träng ®èi víi c¸c kş binh ngoµi chiÕn tr­êng.",
  "Cho nªn nhÊt ®Şnh mua nhiÒu chiÕn m·.",
  "Ng­¬i muèn gia nhËp D­¬ng M«n, chİnh lµ lÊy kş binh lµm chñ, sau nµy ph¶i cè g¾ng rÌn luyÖn.",
	"Ng­êi trong D­¬ng M«n còng ®Õn BiÖn Kinh mua ngùa?",
  "Còng ®­îc! Nh­ng trong D­¬ng M«n cã m· phßng do mét a hoµn qu¶n lı, D­¬ng Gia qu©n cã thÓ ®Õn ®ã lÊy chiÕn m·.",
	"T¹i h¹ hiÓu râ!",
  "§­îc råi! Giê ng­¬i cã thÓ vÒ gÆp <color=yellow>D­¬ng T«n B¶o<color>, ta sÏ ®iÒn tªn ng­¬i vµo danh s¸ch.",
	"§a t¹ ®¹i nh©n!",
	}

TE_Talk(getn(strMain), "task_110", strMain);

TaskTip("Tµo B©n b¶o b¹n ®i t×m D­¬ng T«n B¶o");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º5
function task_110()

	SetTask(1031,5);

end

-- ÓëÑî×Ú±£¶Ô»°2
function task_111()

local strMain = {
  "Mäi viÖc thÕ nµo råi?",
	"§· ®iÒn tªn vµo sæ!",
	"Tèt l¾m!",
  "Binh sÜ nhiÒu nªn l­¬ng thùc còng lµ viÖc rÊt cÊp b¸ch. NhiÒu khi lóc hµnh qu©n, binh sÜ ph¶i tù lo l­¬ng thùc.", 
  "H·y ®i ®¸nh bän <color=yellow> C«n ®å<color> lÊy <color=yellow> 2 phÇn thŞt gµ <color> vÒ ®©y tr­íc ®·!", 
	}

TE_Talk(getn(strMain), "task_112", strMain);

TaskTip("D­¬ng T«n B¶o b¶o b¹n t×m 2 phÇn thŞt Gµ");

end

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º6
function task_112()

	SetTask(1031,6);

end

-- Íæ¼ÒÓĞ¼¦ÈâÀ´½»ÈÎÎñÊ±
function task_113()

local strMain = {
		"§· lµm xong råi!",
	  "Nhanh vËy! Qu¶ lµ cã tiÒm chÊt ®Ó tßng qu©n!",
		"B©y giê ng­¬i cã thÓ ®Õn gÆp <color=yellow>Xa Th¸i Qu©n<color>.",
	}

	if (GetItemCount(1,3,2)>=2) then
		TE_Talk(getn(strMain), "task_114", strMain);		
	else
		Say("Ch­a lµm xong µ?",0);
		return
	end;

end;

-- ¶Ô»°½áÊø£¬¸Ä±ä±äÁ¿£º7
-- É¾³ıÍÃÈâ
function task_114()
	TaskTip("B©y giê cã thÓ gÆp Xa Th¸i Qu©n");
	DelItem(1,3,2,2);
	SetTask(1031,7);
end;


-- »ØÈ¥ÓëÙÜÌ«¾ıµÄ¶Ô»°

function task_115()

local strMain = {
		"D­¬ng T«n B¶o ®· ®ång ı? Hay l¾m! Tõ giê ng­¬i ®· lµ mét thµnh viªn cña D­¬ng Gia T­íng. Bæn doanh qu©n luËt rÊt nghiªm. Ph¶i lu«n tu©n thñ nhĞ!",
    "D­¬ng Gia T­íng ta tinh th«ng cung m·, D­¬ng Gia Th­¬ng næi tiÕng thiªn h¹. NÕu ng­¬i muèn häc <color=yellow>Th­¬ng ph¸p<color> ®Õn t×m <color=yellow>D­¬ng T«n B¶o<color>; nÕu muèn häc <color=yellow>Cung thuËt<color> ®Õn t×m <color=yellow>Méc QuÕ Anh<color>.",
	}
	
TE_Talk(getn(strMain), "task_116", strMain);

end


-- ÓëÕÆÃÅ¶Ô»°½áÊø£¬¸Ä±äÈÎÎñ±äÁ¿£º8
function task_116()

	SetTask(1031,8);
	
	SetPlayerFaction(6)
	SetPlayerRoute(16)
	i=GetBody()
	if i==1 then 
		AddItem(0,109,105,1)
		AddItem(0,108,105,1)
	elseif i==2 then
		AddItem(0,109,106,1)
		AddItem(0,108,106,1)
	elseif i==3 then
		AddItem(0,109,107,1)
		AddItem(0,108,107,1)
	else
		AddItem(0,109,108,1)
		AddItem(0,108,108,1)
	end
	ModifyReputation(10,0);
	--AddGlobalNews("½­ºş´«ÑÔÍæ¼Ò"..GetName().."ÒÑÓÚ½üÈÕ¼ÓÈëÑîÃÅ£¡")
	TaskTip("B¹n ®· gia nhËp D­¬ng M«n. T×m Gi¸o ®Çu häc vâ c«ng")
	
	-- Çå¿ÕÆäËüÃÅÅÉÈÎÎñµÄ×´Ì¬
	FN_SetTaskState(FN_SL, 0);
	FN_SetTaskState(FN_EM, 0);
	FN_SetTaskState(FN_GB, 0);
	FN_SetTaskState(FN_TM, 0);
	FN_SetTaskState(FN_WD, 0);
	
end








function task_exit()

end;


function fix_ym()
FN_SetTaskState(FN_TM, 0);
Say("Cã chót vÊn ®Ò x¶y ra nh­ng ®· ®­îc kh¾c phôc, giê ng­¬i cã thÓ nhËp m«n l¹i.",0);
end;


