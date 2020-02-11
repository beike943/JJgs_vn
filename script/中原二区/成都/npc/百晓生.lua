
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ĞÂÊÖÎÊ´ğ¹¦ÄÜÊµÌå´¦ÀíÎÄ¼ş_Â·ÈË°ÙÏşÉú
-- Edited by peres
-- 2005/04/14 PM 13:59

-- ¿´¼ûµÄ  Ï¨ÃğÁË
-- ÏûÊ§µÄ  ¼Ç×¡ÁË
-- ÎÒÕ¾ÔÚ  º£½ÅÌìÑÄ
-- Ìı¼û    ÍÁÈÀÃÈÑ¿
-- µÈ´ı    ê¼»¨ÔÙ¿ª
-- °Ñ·Ò·¼  Áô¸øÄê»ª
-- ±Ë°¶    Ã»ÓĞµÆËş
-- ÎÒÒÀÈ»  ÕÅÍû×Å
-- ÌìºÚ    Ë¢°×ÁËÍ··¢
-- ½ôÎÕ×Å  ÎÒ»ğ°Ñ
-- ËûÀ´    ÎÒ¶Ô×Ô¼ºËµ
-- ÎÒ²»º¦ÅÂ
-- ÎÒºÜ°®Ëû

-- lyrics : ±Ë°¶»¨

-- ======================================================

Include("\\script\\task\\question\\question_head.lua");
Include("\\script\\task\\teach\\teach_main.lua");

Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_head.lua");

-- ´Ó±í¸ñÎÄ¼şÖĞ¶ÁÈ¡Ã¿¸öÈÎÎñµÄÈ¨ÖØĞÎ³ÉÒ»¸öÊı×é
CreateRateArry();

-- ËµÃ÷TASK_TWOµÄÈÎÎñ×´Ì¬£¬20000±íÊ¾step2£¬ºóÃæµÄ4Î»·Ö±ğ´ú±íÊÇ·ñÍê³ÉÁË4¸öÏëÁË½âµÄÄÚÈİ
-- Íê³ÉÒ»¸öÁË½âµÄÄÚÈİ£¬ºóÃæ4Î»ÖĞµÄ¶ÔÓ¦Î»¾ÍÖÃÎª1

function task_002_00()
    local szSay = {
        "Ta chİnh lµ kÎ tóc trİ ®a m­u B¸ch HiÓu Sinh! Ng­¬i t×m ta cã g× kh«ng?",
        "T¹i h¹ muèn thØnh gi¸o kiÕn thøc vâ l©m!/wl_story",
        --"ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion"
    };
    SetTask(TASK_TWO, 2);
    SelectSay(szSay);
end;

function wl_story()
    local szSay = {
        "Thêi vâ l©m lo¹n thÕ, anh hïng xuÊt hiÖn! Ng­¬i muèn hiÓu chuyÖn chi?",
        "Muèn biÕt vÒ lai lŞch Tr­êng Ca m«n./say1",
        "Muèn biÕt vÒ kÕt cÊu tæ chøc cña Tr­êng Ca m«n./say2",
        "Muèn hiÓu chuyÖn cña Thiªn ¢m gi¸o Liªu Quèc./say3",
        "Muèn hiÓu chuyÖn cña Xi Háa gi¸o §¹i Lı./say4",
        "Muèn hiÓu chuyÖn T©y H¹ NhÊt PhÈm §­êng./say5"
    };
    SelectSay(szSay);
end;

function say1()
    local szTalk = {
        "Sau khi Th¸i Tæ ®êi tr­íc b×nh ®Şnh giang s¬n B«i Töu Thİch Binh QuyÒn, c¸c t­íng lÜnh Th¹ch Thñ Tİn, Cao Hoµi §øc, Tr­¬ng LÖnh Phong, TriÖu Ng¹n Huy ®Òu c¸o l·o håi h­¬ng. TriÖu Ng¹n Huy ®¹i nh©n kh«ng cam c¶nh c« ®¬n, ®· liªn l¹c vµi b»ng h÷u giang hå, th­êng cïng nhau ng©m th¬ ®èi x­íng hoÆc tû thİ vâ c«ng.",
        "Sau nµy c¸c b»ng h÷u cïng kÕt nghÜa, thµnh lËp nªn mét m«n ph¸i. Khi Êy, ng­êi trong ph¸i hÇu hÕt ®Òu lµ c¸c sÜ phu nho nh·, lÊy s¸ng t¸c thi ca lµm thó vui nªn mäi ng­êi ®Òu tù x­ng lµ Tr­êng Ca M«n. Tuy Tr­êng Ca M«n th©n t¹i giang hå nh­ng tr­íc sau rÊt quan t©m Quèc kÕ d©n sinh, hµnh hiÖp tr­îng nghÜa kh¾p n¬i theo t«n chØ lu«n t¹o phóc cho thiªn h¹ b¸ t¸nh.",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    };
    TalkEx("", szTalk);
end;

function say2()
    local szNotFinished = {
        "Tr­êng Ca M«n hÇu hÕt lµ nh÷ng v¨n nh©n mÆc kh¸ch næi danh. ChØ ®¸ng tiÕc lÇn tr­íc khi ta ë L­¬ng S¬n, quyÓn s¸ch ghi chĞp vÒ c©u chuyÖn cña hä ®· bŞ thÊt l¹c gÇn D· Tr­ L©m. H·y gióp ta t×m Tr­êng M«n s¸ch, ta sÏ kÓ thªm cho nghe!",
	    "Tr­êng M«n S¸ch gåm 9 trang. Thu thËp ®ñ, ta sÏ nãi râ cho ng­¬i biÕt!"
    };
    local szFinished = {
        "Tr­êng Ca M«n hÇu hÕt lµ nh÷ng v¨n nh©n mÆc kh¸ch dung rñi kh¾p n¬i, næi tiÕng trªn giang hå vÒ Ngò hiÖp Nh©n NghÜa LÔ Trİ Tİn vµ Tø h÷u CÇm Kú Thi Häa.",
        "Tİnh c¸ch kiªn c­êng Chuyªn lµm viÖc nghÜa nh©n. Hµn ThÕ M¹nh, lu«n tiªn phong ra tay hµnh hiÖp tr­îng nghÜa. X¶ th©n v× nghÜa. C¶nh V©n Phi lu«n coi träng nghÜa khİ, víi b»ng h÷u lu«n v÷ng d¹ s¾c son. LÔ Th­îng v·ng lai. T©n Thanh NhiÔm lµ néi gia quyÒn cao nh©n, m­în lùc ®¸nh lùc lµ tuyÖt kü næi danh cña ng­êi nµy.",
        "Tóc trİ ®a m­u, tİnh t×nh ®iÒm ®¹m, ngo¹i trõ kiÕn thøc réng còng kh«ng cã g× næi bËt. H¹ bót thµnh v¨n. L­¬ng Th­îng Ngäc lµ së tr­êng, c«ng phu xuÊt thÇn nhËp hãa, cã thÓ s¸nh ngang víi C¶nh V©n Phi, nh­ng tiÕc thay ¶ l¹i lµ mét nghÜa ®¹o c­íp cña ng­êi giµu chia cho ng­êi nghÌo.",
        "Tø h÷u CÇm Kú Thi Häa. ¢u D­¬ng Häa lµ bËc thÇy vÒ mµu s¾c. H¹ HÇu CÇm x­ng lµ ®Ö nhÊt danh cÇm ë D­¬ng Ch©u. Gia C¸t Kú ®Ö nhÊt danh cê ®ang tró t¹i Nam Thµnh §« phñ. C«ng T«n Th­ ë T­¬ng D­¬ng giái c¶ vÒ th­ ph¸p lÉn ®¸nh b¹c .",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    }
    local nStep = GetTask(TASK_TWO_ONE);
    if nStep == 0 or nStep == 1 then
        -- ³¤¸èÃÅÈËÎïÆ×
        if GetItemCount(2,0,51) >= 9 then
            DelItem(2,0,51,9);
            SetTask(TASK_TWO_ONE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(92));
            if GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_ONE, 1);
            Msg2Player("§Õn D· Tr­ L©m t×m Tr­êng M«n S¸ch thÊt l¹c.");
            TaskTip("§Õn D· Tr­ L©m t×m Tr­êng M«n S¸ch thÊt l¹c.");
            CreateTrigger(0, 502, 92);  --ÍÀÉ±Ò°ÖíÁÖ
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say3()
    local szNotFinished = {
	    "Thiªn ¢m gi¸o nguån gèc ë Liªu C­¬ng. Ta ®· tõng lªn ph­¬ng B¾c dß la t×nh h×nh cña chóng vµ ghi chĞp l¹i Thiªn ¢m gi¸o t¹p th­. Nµo ngê trªn ®­êng quay vÒ Trung Nguyªn bŞ ng­êi cña Linh B¶o s¬n c­íp mÊt. H·y thay ta ®Õn ®ã lÊy vÒ, ta sÏ kÓ râ cho ng­¬i chuyÖn vÒ Thiªn ¢m gi¸o!",
	    "Thiªn ¢m gi¸o t¹p th­ gåm 9 trang. Thu thËp ®ñ, ta sÏ kÓ râ cho ng­¬i!"
    };
    local szFinished = {
    	"Thiªn ¢m gi¸o cã nguån gèc tõ mét t«n gi¸o thÇn bİ ë Liªu C­¬ng, gi¸o nghÜa lµ tin t­ëng vµo v¹n vËt ®Òu cã linh hån, th­êng dïng nghi thøc ca vò ®Ó tÕ b¸i trêi ®Êt. Thiªn ¢m gi¸o nhiÒu vâ l©m cao thñ nªn mÊy n¨m nay cã thÕ lùc ngµy cµng m¹nh ë Liªu Quèc, nhiÒu quı téc ë Liªu Quèc lµ tİn ®å cña Thiªn ¢m gi¸o.",
    	"Thèng so¸i tèi cao cña Thiªn ¢m gi¸o, d­íi cã T¶ H÷u hé ph¸p gióp gi¸o chñ thi hµnh quyÕt s¸ch. Trong gi¸o cã tam ®­êng Phong- Háa- L«i ®¶m tr¸ch c¸c viÖc dä th¸m t×nh b¸o, nghiªn cøu vâ nghÖ vµ th­ëng ph¹t c¸c gi¸o ®å. NhËt NguyÖt Tinh ChÊn tø ®µn dïng tÕ lÔ trêi ®Êt v¹n vËt. Ng­êi trùc tiÕp thèng lÜnh mÊy v¹n bang chóng lµ Hång H¾c Lam Hoµng B¹ch Ngò Kú Chñ.",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    }
    local nStep = GetTask(TASK_TWO_TWO);
    if nStep == 0 or nStep == 1 then
        --ÌìÒõ½ÌÔÓÊé
        if GetItemCount(2,0,52) >= 9 then
            DelItem(2,0,52,9);
            SetTask(TASK_TWO_TWO, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(93));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_THREE) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_TWO, 1);
            Msg2Player("§Õn Linh B¶o s¬n ®o¹t vÒ Thiªn ¢m gi¸o t¹p th­!");
            TaskTip("§Õn Linh B¶o s¬n ®o¹t vÒ Thiªn ¢m gi¸o t¹p th­!");
            CreateTrigger(0, 503, 93);  --ÍÀÉ±Áé±¦É½
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say4()
    local szNotFinished = {
    	"Xi Háa gi¸o khëi nguån tõ phİa Nam §¹i Lı, cã tËp tôc l¹ th­êng. Gi¸o nghÜa Xi Háa gi¸o còng rÊt kú l¹. Ta ®· ®Õn ¤ M«ng Bé ë Nam C­¬ng dß la tin tøc cña Xi Háa gi¸o, ghi chĞp trong Xi Háa gi¸o d©n tôc nh­ng ng­êi ¤ M«ng Bé sî tiÕt lé ra ngoµi sÏ g©y bÊt lîi cho hä, kh«ng cho phĞp ta mang s¸ch ra khái Nam C­¬ng. H·y gióp ta lÊy nã vÒ, ta sÏ nãi râ chuyÖn Xi Háa gi¸o cho ng­¬i biÕt!",
    	"Xi Háa gi¸o d©n tôc gåm 9 trang. Thu thËp ®ñ, ta sÏ nãi râ cho ng­¬i biÕt!"
    };
    local szFinished = {
    	"Xi Háa gi¸o khëi nguån tõ phİa Nam §¹i Lı, cã tËp tôc l¹ th­êng. Gi¸o nghÜa Xi Háa gi¸o còng rÊt kú l¹. Xi V­u lµ vŞ thÇn ®­îc t«n kİnh nhÊt cña Xi Háa gi¸o. V× thÕ, Xi Háa gi¸o cã th©m thï s©u s¾c víi con ch¸u Huúnh §Õ ta.",
    	"Xi Háa gi¸o gi¸o chñ tù x­ng lµ Xi V­u chñ tÕ, lµ l·nh tô tinh thÇn tuyÖt ®èi cña Xi Háa gi¸o. D­íi gi¸o chñ cã Chóc Dung tÕ s­ vµ Céng C«ng tÕ s­ ®¶m tr¸ch tÕ b¸i Háa ThÇn vµ Thñy ThÇn, cÇu Thñy Háa t­¬ng tÕ. Ngoµi ra cßn cã Ngò Hµnh ph¸p s­, n¾m vÒ ngò hµnh t­¬ng sinh t­¬ng kh¾c, v¹n vËt ®­îc sinh s«i n¶y në. HiÖn ë §¹i Lı cã nhiÒu ho¹t ®éng cña Xi Háa gi¸o gi¸o ®å, d­êng nh­ ngÇm lËt ®æ ngai vŞ TiÒn V­¬ng Tö §¹i Lı.",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    };
    local nStep = GetTask(TASK_TWO_THREE);
    if nStep == 0 or nStep == 1 then
        --ò¿»ğ½ÌÃñË×
        if GetItemCount(2,0,53) >= 9 then
            DelItem(2,0,53,9);
            SetTask(TASK_TWO_THREE, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(94));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_FOUR) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_THREE, 1);
            Msg2Player("§Õn ¤ M«ng Bé ®o¹t vÒ s¸ch Xi Háa gi¸o d©n tôc!");
            TaskTip("§Õn ¤ M«ng Bé ®o¹t vÒ s¸ch Xi Háa gi¸o d©n tôc!");
            CreateTrigger(0, 504, 94);  --ÍÀÉ±ÎÚÃË²¿
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

function say5()
    local szNotFinished = {
	    "NhÊt PhÈm §­êng lµ tæ chøc thÇn bİ ë T©y H¹. Trong m«n ph¸i cã nhiÒu cao thñ. Khi ta tró t¹i Mé TuyÕt s¬n trang tõng cïng trang chñ bµn vÒ chuyÖn cña NhÊt PhÈm §­êng vµ ®· ghi chĞp l¹i trong NhÊt PhÈm §­êng bİ sù. Nµo ngê Mé TuyÕt s¬n trang cÊu kÕt víi ng­êi T©y H¹, thu gi÷ th­ tŞch cña ta trong s¬n trang. H·y gióp ta lÊy th­ tŞch vÒ, ta sÏ kÓ râ chuyÖn NhÊt PhÈm §­êng cho ng­¬i biÕt!",
	    "NhÊt PhÈm §­êng bİ sù gåm 9 trang. Thu thËp ®ñ, ta sÏ nãi râ cho ng­¬i nghe!"
    };
    local szFinished = {
        "NhÊt PhÈm §­êng do T©y h¹ chinh §«ng §¹i t­íng qu©n Xİch Liªn ThiÕt Thô s¸ng lËp. §Ó t¨ng c­êng qu©n lùc cho T©y H¹, Xİch Liªn ThiÕt Thô ®· chiªu mé nhiÒu vâ l©m dŞ sÜ gia nhËp NhÊt PhÈm §­êng, kh«ng ph©n biÖt xuÊt th©n chØ xem vâ nghÖ m¹nh yÕu, nªn ®· thu phôc ®­îc lßng ng­êi. Nh­ng còng v× thÕ, NhÊt PhÈm §­êng ®· thu nhËn nhiÒu nh©n sÜ vâ l©m vâ nghÖ cao c­êng nh­ng nh©n phÈm bÊt h¶o. Tõ ®ã, vâ l©m chİnh ®¹o lu«n xem th­êng NhÊt PhÈm §­êng!",
        "Xİch Liªn ThiÕt Thô lµ ®­êng chñ cña NhÊt PhÈm §­êng. Thµnh viªn hÇu hÕt lµ qu©n ®éi cña T©y H¹. NhÊt PhÈm §­êng hiÖn cã 4 vŞ ®­îc x­ng lµ Tø §¹i Thiªn V­¬ng, vâ c«ng cao c­êng nh­ng ra tay ¸c ®éc. Ngoµi ra cßn cã ThËp §¹i Kim Cang, mçi ng­êi thèng so¸i mét ®éi qu©n, g©y uy hiÕp nhiÒu cho biªn phßng cña §¹i Tèng. B»ng h÷u hµnh hiÖp giang hå, gÆp bän ng­êi nµy nhÊt mùc ph¶i cÈn thËn!",
        "Ra lµ vËy! §a t¹ tiÒn bèi chØ gi¸o!"
    };
    local nStep = GetTask(TASK_TWO_FOUR);
    if nStep == 0 or nStep == 1 then
        --Ò»Æ·ÌÃÒİÊÂ
        if GetItemCount(2,0,54) >= 9 then
            DelItem(2,0,54,9);
            SetTask(TASK_TWO_FOUR, 2);
            GivePlayerAward("Level_20", "hard");
            TalkEx("", szFinished);
            RemoveTrigger(GetTrigger(95));
            if GetTask(TASK_TWO_ONE) == 2 and GetTask(TASK_TWO_TWO) == 2 and GetTask(TASK_TWO_THREE) == 2 then
                GivePlayerAward("Level_20", "hard", "weapon", "Level_22");
            end;
        else
            TalkEx("", szNotFinished);
            SetTask(TASK_TWO_FOUR, 1);
            Msg2Player("§Õn Mé TuyÕt s¬n trang ®o¹t vÒ NhÊt PhÈm §­êng bİ sù!");
            TaskTip("§Õn Mé TuyÕt s¬n trang ®o¹t vÒ NhÊt PhÈm §­êng bİ sù!");
            CreateTrigger(0, 505, 95);  --ÍÀÉ±ÄºÑ©É½×¯
        end;
    elseif nStep == 2 then
        TalkEx("", szFinished);
    end;
end;

-- Èë¿Ú´¦Àíº¯Êı
function main()
--³¤¸èÃÅÈÎÎñµÄ´¦Àí
    
    local nStep = 0;
    local szTalk = {
        "Ng­¬i l¹i quay l¹i µ? Cã chuyÖn g× kh«ng?",
        "V·n bèi gÆp ph¶i vµi chuyÖn vÒ {Tr­êng Ca M«n} nªn ®Õn thØnh gi¸o tiªn sinh!",
        "Ng­¬i còng biÕt chuyÖn Tr­êng Ca M«n sao? G· TriÖu Diªn Niªn qu¶ thËt nhiÒu chuyÖn nh­ng xem nh­ ng­¬i cã duyªn víi chuyÖn Tr­êng Ca M«n. MÊy n¨m nay ta l¨n lén chèn giang hå, biÕt ®­îc nhiÒu th­ tŞch quı hiÕm thÊt l¹c ë kh¾p n¬i nh­ng ta kh«ng biÕt chİnh x¸c ë n¬i nµo. Xin ®õng o¸n hËn ta!"
    };
    local szSay = {
        "Ta chİnh lµ kÎ tóc trİ ®a m­u B¸ch HiÓu Sinh! Ng­¬i t×m ta cã g× kh«ng?",
        "Muèn thØnh gi¸o chuyÖn vÒ vâ l©m truyÒn thuyÕt!/wl_story",
        --"ÎÒÏëºÍÄú±ÈÊÔÒ»ÏÂÓĞ¹ØÎäÁÖµÄÑ§Ê¶¡£/ConfirmQuestion"
    };

    nStep = GetTask(TASK_TWO);
    
    if nStep == 1 then
        TalkEx("task_002_00", szTalk);
        return
    elseif nStep == 2 then
        SelectSay(szSay);
        return
    end;
    
-- ½ÌÓıÈÎÎñµÄ´¦Àí
local nState = TE_GetTeachState();

if (nState==18) then
	task_018_00();
	return
end;

	Say("Ta lµ ®Ønh ®Ønh ®¹i danh trªn giang hå V¹n Sù Th«ng B¸ch HiÓu Sinh, thùc lùc cña Tµng KiÕm s¬n trang nµo lät khái m¾t ta!",0);

end;

-- È·¶¨½ÓÊÜÈÎÎñ£¬¿ªÊ¼»Ø´ğÎÊÌâ
function ConfirmQuestion()

	if GetStamina()<=QA_MINSTAMINA + 1 then
		Say(QA_TitleText.."VŞ "..GetPlayerSex().."tr«ng cã vÎ mÖt mái? Chi b»ng nghØ ng¬i <color=yellow>bæ sung chót thÓ lùc<color> råi ®Õn!",0);
		return
	end;

	SetTask(QA_STATE, 1); -- ÈÎÎñ×´Ì¬ÎªÒÑ¾­¿ªÊ¼»Ø´ğÈÎÎñ
--	SetTask(QA_RANDOMSEED, tonumber(date("%y%m%d%H%M%S"))); -- ¼ÇÂ¼Ëæ»úÖÖ×Ó
	CreateQuestion();
	return
end;

-- µ±Ò»¸öÎÊÌâ»Ø´ğµÃÕıÈ·Ê±
function AnswerRight()

--	SetTask(QA_RANDOMSEED, tonumber(date("%y%m%d%H%M%S"))); -- ¼ÇÂ¼Ëæ»úÖÖ×Ó

	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- Á¬Ğø»Ø´ğÕıÈ·µÄ´ÎÊı¼Ó 1
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- Á¬Ğø»Ø´ğµÄ´ÎÊı¼Ó 1
		SetTask(QA_RIGHTSTATE, GetTask(QA_RIGHTSTATE) + 1); -- Á¬Ğø»Ø´ğÕıÈ·µÄ´ÎÊı¼Ó 1
		AnswerNext(1);
	end;
	
end;

-- µ±Ò»¸öÎÊÌâ»Ø´ğµÃ´íÎóÊ±
function AnswerError()

	if GetTask(QA_FINISHNUM)+ 1 >= 10 then
		FinishQuestion();
	else
		SetTask(QA_FINISHNUM, GetTask(QA_FINISHNUM) + 1); -- Á¬Ğø»Ø´ğµÄ´ÎÊı¼Ó 1
		AnswerNext(2);
	end;
	
end;


-- Ñ¡Ôñ½øĞĞÏÂÒ»²½µÄ¹ı³Ì£¬²¢ÇÒ¸æËßÍæ¼Ò»Ø´ğÕıÈ·»òÕß´íÎó
function AnswerNext(nCheck)
	
	if nCheck==1 then
		Talk(1, "CreateQuestion", QA_TitleText.."Hay l¾m! Ng­¬i ®· tr¶ lêi ®óng! H·y tr¶ lêi c©u hái tiÕp theo!");
	elseif nCheck==2 then
		Talk(1, "CreateQuestion", QA_TitleText.."Ha ha!…Sai råi! H·y cè g¾ng häc hái thªm! Nh­ng kh«ng sao! H·y nghe c©u hái tiÕp theo!");
	end;
end;


-- È«²¿ÕıÈ·»Ø´ğÍê 10 ¸öÎÊÌâÊ±µÄ´¦Àíº¯Êı
function FinishQuestion()

local nPay, nTimes = GiveAward(); -- ÅÉ·¢½±Àø
	
	if nPay ~= 0 then
		Say(QA_TitleText.."Ng­¬i ®· ®¸p ®óng "..nTimes.."  c©u hái cña ta, ®©y lµ phÇn th­ëng  "..nPay.." tiÒn ®ång cña ng­¬i. Hy väng sau nµy ng­¬i cã thÓ hiÓu biÕt thªm vÒ thÕ giíi xung quanh!",0);
	else
		Say(QA_TitleText.."Ng­¬i ch­a ®¸p ®óng c©u hái nµo cña ta! H·y cè g¾ng trau dåi kiÕn thøc!",0);
	end;
	
	SetTask(QA_FINISHNUM, 0); -- ½«Á¬Ğø»Ø´ğµÄ´ÎÊıÇå¿Õ
	SetTask(QA_RIGHTSTATE, 0); -- ½«ÕıÈ·»Ø´ğÎÊÌâµÄ´ÎÊıÇå¿Õ
	SetTask(QA_STATE, 0); -- ÈÎÎñ×´Ì¬Îª»¹Ã»¿ªÊ¼»Ø´ğÈÎÎñ
end;

-- ¸øÍæ¼Ò·¢Óè½±Àø
function GiveAward()

local nTimes = GetTask(QA_RIGHTSTATE);
local nPay = 0;

	PayStamina(QA_PAYSTAMINA); -- ¿Û³ıÍæ¼ÒµÄÌåÁ¦Öµ

	if nTimes>=10 then -- Èç¹û 10 ¸öÈ«²¿»Ø´ğÕıÈ·µÄ»°Ôò·¢È«¶î½±Àø
		nPay = 130;
		Earn(nPay);
		return nPay, nTimes;
	else
		nPay = nTimes * 10; -- Ã¿»Ø´ğÕıÈ·Ò»¸öÎÊÌâ¸ø 10 ¿éÇ®
		Earn(nPay);
		return nPay, nTimes;
	end;
	
end;

-- ¼ì²âÍæ¼ÒÌåÁ¦ÖµÊÇ·ñ×ã¹»
function CheckStamina()

	
end;

-- Ê²Ã´Ò²²»´¦ÀíµÄÍË³öº¯Êı
function MainExit()

end;