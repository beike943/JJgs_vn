--ÑïÖİÈÎÎñ·ÖÖ§
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------ÑïÖİ·ÖÖ§ËÄ-------------------------------------

function four_00_00()
    local szTalk = {
        "GÇn ®©y §«ng H¶i H¶i T©n xuÊt hiÖn nhiÒu ng­ qu¸i, nhiÒu ng­ d©n kh«ng d¸m ra biÓn ®¸nh b¾t, nghe nãi hä ®· ph¹m th­îng víi Long V­¬ng gia, míi bŞ trõng ph¹t nh­ vËy.",
        "ChuyÖn g× l¹ vËy?",
        "Phu qu©n ta mÊy ngµy tr­íc ra biÓn hiÖn ch­a trë vÒ, ta e ®· bŞ lò thñy téc giÕt h¹i. <sex> gióp tiÓu n÷ tr¶ thï ®­îc kh«ng?",
        "Tr¶ thï b»ng c¸ch nµo?",
        "Nghe nãi §«ng H¶i H¶i T©n cã loµi §Çu môc ng­ qu¸i, chØ cÇn giÕt chóng lµ cã thÓ tr¶ thï cho phu qu©n tiÓu n÷.",
        "§­îc! Ta ®ång ı!"
    };
    TalkEx("four_00_01", szTalk);
end;

function four_00_01()
    SetTask(TASK_YZ_FOUR, 1);
    Msg2Player("§Õn §«ng H¶i H¶i T©n giÕt §Çu môc ng­ qu¸i");
    TaskTip("§Õn §«ng H¶i H¶i T©n giÕt §Çu môc ng­ qu¸i");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai1")		--ÊÈÈËÓã¹Ö1
end;

function four_02_00()
    local szTalk = {
        "Ta ®· gióp c« n­¬ng h¹ §Çu môc ng­ qu¸i, ®©y lµ {Lang Nha ngäc béi}, cã thÓ lµ cña lÖnh c«ng...",
        "§a t¹ ©n nh©n! §óng lµ vËt ®Şnh t×nh cña chóng ta, chµng vÉn mang theo bªn m×nh, huhu…",
        "Ta muèn t×m hiÓu râ {§«ng H¶i h¶i téc}, c« n­¬ng cã thÓ gióp ta kh«ng?",
        "Thö t×m Lı TiÕn Dòng xem!",
        "LÇn sau sÏ ghĞ th¨m c« n­¬ng, xin c¸o tõ!"
    };
    TalkEx("four_02_01", szTalk);
end;

function four_02_01()
    SetTask(TASK_YZ_FOUR, 3);
    DelItem(2,0,304,1);   --ÀÅ«eÓñÅå
    Msg2Player("§Õn D­¬ng Ch©u t×m Lı TiÕn Dòng hái th¨m");
    TaskTip("§Õn D­¬ng Ch©u t×m Lı TiÕn Dòng hái th¨m");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai2")		--ÊÈÈËÓã¹Ö2
end;

function four_03_00()
    local szTalk = {
        "Lı tiªn sinh kháe kh«ng?",
        "T×m ta cã chuyÖn g×?",
        "Ch¾c tiÒn bèi cã nghe qua §«ng H¶i h¶i téc, t¹i h¹ nghÜ kh«ng ph¶i Long V­¬ng l·o gia lµm, ng­êi cã cao kiÕn g× kh«ng?",
        "Ta chØ nghe nãi trªn ng­êi chóng cã mang mét sè ®å, ng­¬i gióp ta thu thËp th­îng y vµ h¹ y cña d©n lµng mçi thø 5 c¸i ®­îc kh«ng?",
        "§­îc th«i!"
    };
    TalkEx("four_03_01", szTalk);
end;

function four_03_01()
    SetTask(TASK_YZ_FOUR, 4);
    CreateTrigger(0,544,KILL_YZ_SZ);
    CreateTrigger(0,545,KILL_YZ_SZSB);
    Msg2Player("§¸nh §«ng H¶i thñy téc vµ qu©n sÜ thñy téc lÊy th­îng y vµ h¹ y mçi thø 5 c¸i");
    TaskTip("§¸nh §«ng H¶i thñy téc vµ qu©n sÜ thñy téc lÊy th­îng y vµ h¹ y mçi thø 5 c¸i");
    GivePlayerAward("Level_50", "normal");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai3")		--ÊÈÈËÓã¹Ö3
end;

function four_04_00()
    local szTalk = {
        "§óng lµ quÇn ¸o cña d©n lµng bŞ mÊt. S¸ch cæ cã ghi chĞp, mçi khi thñy téc xuÊt hiÖn d©n lµng sÏ biÕn mÊt.",
        "NÕu nãi vËy th× d©n lµng ®· bŞ biÕn thµnh {§«ng H¶i thñy téc}.",
        "§óng råi!",
        "NÕu nãi vËy, thñy téc r¬i ra ngäc béi chİnh lµ {phu qu©n} cña ViÔn Tinh. Ta ph¶i ®i b¸o ngay cho c« Êy biÕt!",
        "T¹i h¹ xin c¸o tõ!"
    };
    local szMsg = {
        "Ta chØ nghe nãi trªn ng­êi chóng cã mang mét sè ®å, ng­¬i gióp ta thu thËp th­îng y vµ h¹ y cña d©n lµng mçi thø 5 c¸i ®­îc kh«ng?"
    };
    if GetItemCount(2,0,305) >= 5 and GetItemCount(2,0,306) >= 5 then
        TalkEx("four_04_01", szTalk);
    else
        TalkEx("four_04_02", szMsg);
    end;
end;

function four_04_02()
    if GetTrigger(KILL_YZ_SZ) == 0 then
        CreateTrigger(0,544,KILL_YZ_SZ);
    end;
    if GetTrigger(KILL_YZ_SZSB) == 0 then
        CreateTrigger(0,545,KILL_YZ_SZSB);
    end;
end;

function four_04_01()
    SetTask(TASK_YZ_FOUR, 5);
    DelItem(2,0,305,5);
    DelItem(2,0,306,5);
    RemoveTrigger(GetTrigger(KILL_YZ_SZ));
    RemoveTrigger(GetTrigger(KILL_YZ_SZSB));
    Msg2Player("Nãi sù thËt víi cho ViÔn Tinh");
    TaskTip("Nãi sù thËt víi cho ViÔn Tinh");
end;

function four_05_00()
    local szTalk = {
        "<sex> ®Õn ®©y cã chuyÖn g×?"
    };
    TalkEx("four_05_01", szTalk);
end;

function four_05_01()
    local szSay = {
        "Ta cã mét chuyÖn muèn nãi víi c« n­¬ng.",
        "Nãi sù thËt/tell_true",
        "G¹t c« ta/tell_false"
    };
    SelectSay(szSay);
end;

function tell_true()
    local szTalk = {
        "<sex> xin cø nãi!",
        "Theo ®iÒu tra d©n lµng kh«ng bŞ mÊt tİch mµ lµ biÕn thµnh §«ng H¶i thñy téc.",
        "V× vËy ng­êi ta giÕt chİnh lµ {phu qu©n} c«, xin thø lçi!",
        "Huhu…Ta ®· giÕt chµng råi!",
        "§©y cã ph¶i sù thËt kh«ng!",
        "Huhu……."
    };
    TalkEx("four_05_02", szTalk);
end;

function four_05_02()
    SetTask(TASK_YZ_FOUR, 6);
    GivePlayerAward("Level_50", "hell");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai4")		--ÊÈÈËÓã¹Ö4
    ModifyReputation(10, 0);
end;

function tell_false()
    local szTalk = {
        "<sex> xin cø nãi!",
        "Theo ®iÒu tra d©n lµng kh«ng bŞ mÊt tİch mµ lµ bŞ {§«ng H¶i thñy téc} b¾t ®Õn Long cung lµm lao dŞch, tu söa long cung.",
        "NÕu nãi vËy th× ngäc béi ®ã do mét ng­ qu¸i kh¸c nhÆt ®­îc, qua mét thêi gian phu qu©n c« n­¬ng sÏ trë vÒ.",
        "§a t¹ <sex>, hy väng chµng cßn sèng!"
    };
    TalkEx("four_05_03", szTalk);
end;

function four_05_03()
    SetTask(TASK_YZ_FOUR, 7);
    GivePlayerAward("Level_50", "hell", "chest", "Level_52");
	GivePlayerExp(SkeyYZxiahouqin,"shirenyuguai4")		--ÊÈÈËÓã¹Ö4
end;

function four_06_00()
    local szTalk = {
        "Lµ ng­¬i giÕt phu qu©n ta! Mau tr¶ phu qu©n cho ta, huhu!"
    };
    TalkEx("", szTalk);
end;

function four_07_00()
    local szTalk = {
        "<sex> biÕt ®­îc tin tøc g× vÒ phu qu©n kh«ng?"
    };
    TalkEx("", szTalk);
end;