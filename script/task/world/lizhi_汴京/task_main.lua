
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ãê¾©ÈÎÎñÖ÷Ìå½Å±¾
-- Edited by lizhi
-- 2005-8-8 10:27
-- ======================================================

-- ¾çÇéÈÎÎñÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function task_000_00()

local strMain = {
	"Kh«ng ®­îc……Lµm sao b©y giê?",
	"TiÒn bèi cã ph¶i KhÊu ChuÈn ®¹i nh©n kh«ng? TriÖu Diªn Niªn vµ D· TÈu nhê ta mang bøc th­ tíi, mêi tiÒn bèi xem qua!",
	"§­a ta xem nµo!",
	"[KhÊu ChuÈn ®äc bøc th­]",
	"<sex> ®Õn thËt ®óng lóc, ta còng kh«ng giÊu! HiÖn Liªu binh ®ang tiÕp cËn biªn giíi, qu©n t×nh khÈn cÊp tõ Nh¹n M«n quan, h¬n n÷a gÇn ®©y BiÖn Kinh l¹i x¶y ra chuyÖn…",
	"ChuyÖn nµy vèn do quan sai phô tr¸ch! Nh­ng nh©n lùc ®a sè bŞ ®iÒu ®i n¬i kh¸c, hiÖn chØ cßn l¹i mét sè giµ nua yÕu ít. Ta thÊy <sex> vâ c«ng phi phµm, nhÊt ®Şnh kh«ng tõ chèi gióp l·o phu ®i gi¶i v©y!",
	"TiÒn bèi cø dÆn dß!",
	"Tèt qu¸! Nãi chuyÖn víi <sex> thËt s¶ng kho¸i! Giê phiÒn <sex> ®Õn Thiªn Ba D­¬ng phñ gÆp Xa Th¸i Qu©n, bµ Êy ®ang cã chuyÖn bùc m×nh!",
}

TalkEx("task_000_01", strMain);

end;


function task_000_01()
    DelItem(2,0,49,1);
	Msg2Player("KhÊu ChuÈn b¶o b¹n ®Õn Thiªn Ba D­¬ng phñ t×m Xa Th¸i Qu©n");
	TaskTip("KhÊu ChuÈn b¶o b¹n ®Õn Thiªn Ba D­¬ng phñ t×m Xa Th¸i Qu©n");
	SetTask(TASK_BJ_ID, 1);
end;


function task_001_00()

    local strMain = {
        "Hõ! D­íi ch©n thiªn tö mµ chóng d¸m ng«ng cuång vËy µ!",
    	"BÈm th¸i qu©n t¹i h¹ ®­îc KhÊu ChuÈn ®¹i nh©n ph¸i ®Õn chê ng­êi sai b¶o!",
    	"Th× ra <sex> lµ ng­êi cña KhÊu ChuÈn ph¸i ®Õn. BiÖn Kinh d¹o nµy kh«ng yªn æn, ta ®iÒu tra ®­îc lµ do mét ®¸m L­u manh g©y ra, hiÖn ng­êi trong phñ ®Òu ra trËn giÕt giÆc, mong <sex> gióp ta trõng trŞ bän chóng!",
    	"VËy ®Õn ®©u míi t×m ®­îc mÊy tªn L­u manh ®ã?",
    	"§¸m l­u manh th­êng xuÊt hiÖn ë phñ ®«ng BiÖn Kinh, T©y BiÖn Kinh, Nam BiÖn Kinh. NÕu cã thÓ <sex> gióp ta lÊy 10 b×nh Thiªu töu trªn ng­êi chóng ®­îc kh«ng!"
    };
    
    TalkEx("task_001_01", strMain);

end;


function task_001_01()
	Msg2Player("Xa Th¸i Qu©n b¶o b¹n trõng trŞ 20 tªn L­u manh vµ t×m 10 b×nh Thiªu töu");
	TaskTip("Xa Th¸i Qu©n b¶o b¹n trõng trŞ 20 tªn L­u manh vµ t×m 10 b×nh Thiªu töu");
	CreateTrigger(0, 200, KILL_BJ_LM);  --É±ËÀ20¸öÁ÷Ã¥
	SetTask(TASK_BJ_ID, 2);
end;

function task_002_00()
    Talk(1,"","Ng­¬i gióp ta trõng trŞ 20 tªn l­u manh vµ ®em 10 b×nh Thiªu Töu vÒ ®©y!");
    if GetTrigger(KILL_BJ_LM) == 0 then
        CreateTrigger(0, 200, KILL_BJ_LM);
    end;
end;

function task_003_00()

    local strMain = {
    	"Xem ra ta ph¸i ®İch th©n ra tay míi ®­îc!",
    	"BÈm Th¸i qu©n! T¹i h¹ ®· trõng trŞ ®¸m L­u manh vµ mang Thiªu töu vÒ ®©y!",
    	"Nhanh vËy? <sex> qu¶ nhiªn vâ c«ng cao c­êng! NÕu ng­êi cña Thiªn Ba D­¬ng phñ ë ®©y th× ®¸m C«n ®å kh«ng d¸m léng hµnh.",
    	"C«n ®å? Cã ng­êi kh¸c g©y sù n÷a sao?",
    	"Kh«ng giÊu <sex> võa lóc n·y qu©n sÜ ®Õn b¸o ngoµi thµnh cã mét ®¸m C«n ®å lai lŞch kh«ng râ ®ang g©y sù, ta ph¸i mét sè gia ®inh ®Õn ®ã ng¨n c¶n kh«ng ngê bŞ chóng ®¸nh cho träng th­¬ng.",
    	"Ta thÊy mÊy tªn C«n ®å nµy thËt kh«ng ®¬n gi¶n. <sex> gióp ta ®Õn ®ã xem thËt h­ thÕ nµo ®­îc kh«ng?",
    };


	if GetItemCount(2, 1, 12) >= 10 then
		TalkEx("task_004_00", strMain);
	else
		Talk(1,"","Ng­¬i gióp ta trõng trŞ 20 tªn l­u manh vµ ®em 10 b×nh Thiªu Töu vÒ ®©y!");
	end;

end;


function task_004_00()
	Msg2Player("Xa Th¸i Qu©n b¶o b¹n trõng trŞ 10 tªn C«n ®å");
	TaskTip("Xa Th¸i Qu©n b¶o b¹n trõng trŞ 10 tªn C«n ®å");
	
	GivePlayerAward("Level_10", "hell");    	--½±Àø
	GivePlayerExp(SkeyBJShuxin,"liumang")		--Á÷Ã¥¾­Ñé½±Àø
	-- É¾³ı 10 ¸öÉÕ¾Æ
	DelItem(2, 1, 12, 10);
	
	CreateTrigger(0, 198, KILL_BJ_WL);  --É±ËÀ10¸öÎŞÀµ
	SetTask(TASK_BJ_ID, 4);
end;

function task_004_01()
    Talk(1,"","Mau ®i trõng ph¹t 10 tªn C«n ®å!");
    if GetTrigger(KILL_BJ_WL) == 0 then
        CreateTrigger(0, 198, KILL_BJ_WL);
    end;
end;

function task_005_00()
    local strMain = {
    	"VÒ råi µ! <sex> ®· thu thËp ®­îc tin tøc g× råi?",
    	"§¸m C«n ®å nµy qu¶ nhiªn vâ nghÖ cao c­êng!",
    	"Ch¾c ch¾n sau l­ng chóng cã ng­êi ®øng chØ ®iÓm. <sex> ®i b¾t 1 vµi tªn C«n ®å ®ã vÒ ®iÒu tra thö xem sao!",
    	"ChuyÖn nhá th«i! Xin ®îi tin vui cña t¹i h¹!",
    };
    TalkEx("task_005_01", strMain);
end;


function task_005_01()
	
	GivePlayerAward("Level_10", "easy");    	--½±Àø
	GivePlayerExp(SkeyBJShuxin,"wulai1")		--ÎŞÀµ1
	Msg2Player("Xa Th¸i Qu©n sai b¹n ®i b¾t 5 tªn C«n ®å vÒ ®Ó ®iÒu tra");
	TaskTip("Xa Th¸i Qu©n sai b¹n ®i b¾t 5 tªn C«n ®å vÒ ®Ó ®iÒu tra");
	CreateTrigger(0, 199, KILL_BJ_WL);
	SetTask(TASK_BJ_ID, 6);
end;

function task_006_00()

    local strMain = {
        "VÒ råi µ? §iÒu tra ®­îc g× råi?",
        "§óng nh­ ng­êi dù ®o¸n. Bän nµy bŞ 1 ng­êi tªn lµ {Tiªu Hµn} xói giôc. Chóng vèn lµ du d©n ngoµi quan ¶i! HÇy! Còng chØ v× 2 ch÷ Phó quı mµ th«i!",
        "Nghe nãi tªn Tiªu Hµn nµy lµ ng­êi Liªu quèc. LÇn nµy may nhê cã <sex>, hõm….",
        "L·o Th¸i qu©n! T¹i h¹ cßn chuyÖn nµy muèn hái ng­êi!",
        "Lµ chuyÖn g×?",
        "T¹i h¹ nghe 1 tªn C«n ®å nãi: {Tiªu Hµn} ®ang muèn t×m 1 ng­êi tªn {B¸ch Th¶o ¤ng}! Th¸i Qu©n cã nghe qua ng­êi nµy ch­a?",
        "B¸ch Th¶o ¤ng? Ng­êi nµy lµ 1 thÇn y ë BiÖn Kinh. Kh«ng biÕt tªn Tiªu Hµn kia t×m «ng ta ®Ó lµm g×? Ng­¬i h·y mau ®Õn H¹nh Hoa th«n ®Ó b¶o vÖ cho B¸ch Th¶o ¤ng! Nh©n tiÖn ®iÒu tra manh mèi!",
        "Tu©n lÖnh! T¹i h¹ ®i ngay!"
    };

    ---ÎŞÀµ¿Ú¹©
	if GetItemCount(2,0,46) >= 5 then
		TalkEx("task_006_02", strMain);
	else
		Talk(1,"task_006_01","Ng­¬i vÉn ch­a lÊy ®­îc khÈu cung tªn C«n ®å nµo sao?");
	end;
end;

function task_006_01()
    if GetTrigger(KILL_BJ_WL) == 0 then
        CreateTrigger(0, 199, KILL_BJ_WL);
    end;
end;

function task_006_02()
	Msg2Player("§Õn H¹nh Hoa th«n b¶o vÖ B¸ch Th¶o ¤ng");
	TaskTip("§Õn H¹nh Hoa th«n b¶o vÖ B¸ch Th¶o ¤ng");
	
	GivePlayerAward("Level_10", "hard", "legs", "Level_15");    --½±Àø
	GivePlayerExp(SkeyBJShuxin,"wulai2")		--ÎŞÀµ2
	RemoveTrigger(GetTrigger(KILL_BJ_WL));
	DelItem(2,0,46,5);
	SetTask(TASK_BJ_ID, 7);
end;


function task_007_00()
    local strMain = {
    	"….",
    	"VŞ c« n­¬ng nµy! T¹i h¹ ®Õn th¨m B¸ch Th¶o ¤ng tiÒn bèi! Xin hái…",
    	"[C« g¸i mÊp m¸y m«i nh­ng kh«ng ph¸t ra tiÕng]",
    	"Ta cã thÓ gióp g× c« n­¬ng kh«ng?",
    	"[§­a b¹n 1 tê giÊy]",
    	"{Tæ Ong 5 c¸i}, t×m ë {H¹nh Hoa th«n}; {C¸t C¸nh 5 c¸i} t×m ë ngoµi thµnh {Nam BiÖn Kinh}…§©y lµ bµi thuèc?",
    	"[C« g¸i gËt ®Çu]",
    	"§­îc! Xin ®îi t¹i h¹ ®i lÊy chóng vÒ!"
    }
    TalkEx("task_007_01", strMain);
end;

function task_007_01()
	Msg2Player("B¸ch Thóy B×nh nhê b¹n ®i t×m 5 Tæ Ong vµ ®Õn phİa Nam BiÖn Kinh t×m 5 C¸t C¸nh");
	TaskTip("B¸ch Thóy B×nh nhê b¹n ®i t×m 5 Tæ Ong vµ ®Õn phİa Nam BiÖn Kinh t×m 5 C¸t C¸nh");
	SetTask(TASK_BJ_ID, 8);
end;


function task_008_00()

local strMain = {
	"[C« g¸i cã vÎ rÊt c¨ng th¼ng]",
	"C« n­¬ng! Ta ®· mang d­îc liÖu vÒ ®©y!",
	"[C« g¸i lËp tøc phèi thuèc, sau ®ã uèng ngay]",
	"<sex>! ¥n cøu m¹ng nµy tiÓu n÷ xin t¹c d¹ ghi ©n! <sex>! Xin hái ng­êi t×m gia phô cña tiÓu n÷ cã viÖc g×?",
	"Ta phông mÖnh Xa Th¸i Qu©n ®Õn b¶o vÖ cho B¸ch l·o b¸!",
	"¤i!...Ng­êi ®Õn chËm 1 b­íc råi! Gia phô mÊy ngµy tr­íc ®· bŞ 1 ®¸m cao thñ ®Õn b¾t ®i ®©u kh«ng biÕt n÷a!",
	"ThËt ®¸ng tr¸ch! Giê cã c¸ch nµo t×m ®­îc t«ng tİch cña lÖnh «ng kh«ng?",
	"ViÖc nµy còng kh«ng khã g×! Giê h·y ra ngoµi b¾t 1 İt ThiÕt Gi¸p trïng. Lo¹i nµy rÊt thİch mïi thuèc trªn ng­êi gia phô! NhÊt ®Şnh chóng sÏ bay ®i dÉn ®­êng chóng ta. <sex>! Xin h·y ®i ra th«n t×m 10 No·n trïng vÒ cho tiÓu n÷ luyÖn thuèc tr­íc ®·!",
	"ChuyÖn nhá! Xin ®îi tin t¹i h¹!",
}

    -- ·ä³² 2£¬1£¬13  ½Û¹£ 1£¬2£¬2
	if GetItemCount(2, 1, 13) >= 5 and GetItemCount(1, 2, 2) >= 5 then
		TalkEx("task_008_01", strMain);
	else
		Talk(1,"","….");
	end;
	
end;

function task_008_01()
	Msg2Player("B¸ch Thóy B×nh nhê b¹n ®i t×m 10 No·n trïng");
	TaskTip("B¸ch Thóy B×nh nhê b¹n ®i t×m 10 No·n trïng");
	
	GivePlayerAward("Level_14", "easy");    --½±Àø
	GivePlayerExp(SkeyBJShuxin,"yaoshimizong")		--Ò©ÊÒÃÔ×Ù
	--É¾³ı 5 ¸ö·ä³²£¬5¸ö½Û¹£
	DelItem(2, 1, 13, 5);
	DelItem(1, 2, 2, 5);
	SetTask(TASK_BJ_ID, 9);
end;


function task_009_00()

local strMain = {
	"<sex> No·n trïng ®· t×m ®­îc ch­a?",
	"Cã ph¶i lµ 10 No·n trïng nµy kh«ng?",
	"[B¸ch Thóy B×nh bá No·n trïng vµo 1 b×nh sø]",
	"§©y lµ MŞch T«ng Cæ. <sex>! Bän ThiÕt Gi¸p trïng nµy sÏ dÉn ng­êi ®Õn n¬i cña gia phô. <sex>! Giê xin tr«ng cËy vµo tµi nghÖ cña ng­êi! Mong <sex> vµ gia phô b×nh yªn trë vÒ!",
	"C« n­¬ng yªn t©m! §©y còng lµ chuyÖn cña t¹i h¹!",
}

	if (GetItemCount(2, 1, 6) >= 10) then
		TalkEx("task_009_01", strMain);
	else
		Talk(1,"","§· t×m ®­îc 10 No·n trïng ch­a?");
	end;

end;

function task_009_01()
	
	-- ¸øÓèÍæ¼ÒÃÙ×Ù½ğ¼×¹Æ
	AddItem(2,0,47,1);
	Msg2Player("B¹n mang theo MŞch T«ng Cæ ®i t×m tung tİch B¸ch Th¶o ¤ng!");
	TaskTip("B¹n mang theo MŞch T«ng Cæ ®i t×m tung tİch B¸ch Th¶o ¤ng!");
	
	GivePlayerAward("Level_14", "hard", "legs", "Level_16");    --½±Àø
	GivePlayerExp(SkeyBJShuxin,"shimiliaoren")		--ÉñÃØÁÉÈË
	
	-- É¾³ı³æÂÑ
	DelItem(2, 1, 6, 10);
	SetTask(TASK_BJ_ID, 10);
end;

function task_010_00()
    Talk(1,"","Xin mang theo MŞch T«ng Cæ nµy ®i t×m Gia phô!");
    if GetItemCount(2,0,47) == 0 then
        AddItem(2,0,47,1);
    end;
end;

function task_013_00()
    local szTalk = {
    	"<sex> ®· vÒ råi µ? Mäi viÖc thuËn lîi chø?",
        "KhÊu ®¹i nh©n! §©y cã 1 bøc th­ cña {Thiªn ¢m gi¸o}! Xin ng­êi ®äc qua!",
        "[KhÊu ChuÈn ®äc nhanh]",
        "Ra lµ vËy!...Ta nghe nãi Thiªn ¢m gi¸o lµ mét t«ng gi¸o thÇn bİ rÊt cã ¶nh h­ëng víi giíi quı téc Liªu quèc. Liªn quan ®Õn Tr­êng ca m«n, tèt nhÊt nªn ®i hái TriÖu Diªn Niªn!",
        "VËy t¹i h¹ ®i b¸i kiÕn TriÖu tiÒn bèi ®©y!",
        "Ng­êi ®· v× ta mµ vÊt v¶ nhiÒu qu¸! Cã chót t×nh ı, xin <sex> nhËn lÊy!"
    };
    TalkEx("task_013_01", szTalk);
end;

function task_013_01()
    SetTask(TASK_BJ_ID, 14);
    
    GivePlayerAward("Level_18", "hell", "chest", "Level_18");    --½±Àø
    GivePlayerExp(SkeyBJShuxin,"shitaijinji1")		--ÊÂÌ¬½ô¼±1
    SetTask(111, 101) --ÕÒÕÔÑÓÄêµÄÈÎÎñ
end;

function task_014_00()
    local szTalk = {
        "Thiªn ¢m gi¸o lµ 1 t«ng gi¸o thÇn bİ rÊt cã ¶nh h­ëng víi giíi quı téc Liªu quèc. Liªn quan ®Õn Tr­êng ca m«n, ng­¬i tèt nhÊt nªn ®i hái TriÖu Diªn Niªn!"
    };
end;