--ÔÚÑïÖİÈÎÎñÏÄºîÇÙ
--created by lizhi
--2005-8-24 10:34

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖİ\\task_main.lua");
Include("\\script\\task\\world\\lizhi_ÑïÖİ\\task_two_main.lua");
Include("\\script\\task\\world\\lizhi_³¤¸èÃÅ\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

szTaskThreeTalk = {
    "C« n­¬ng cã ph¶i lµ H¹ HÇu CÇm?",
    "Ta ngµy ngµy ngåi g·y ®µn, nµo ph¶i n÷ hiÖp g× ®©u?",
    "Ta võa ®¸nh b¹i Ch­¬ng VÜ C­¬ng, ®o¹t ®­îc mËt hµm bªn trong ghi chuyÕn hµng ®· ®­îc chuyÓn ®i n¬i kh¸c, ngoµi ra cßn ®Ò cËp c« chİnh lµ ng­êi liªn l¹c víi {Tr­êng Ca M«n}, cÇn ph¶i trõ khö!",
    "VËy µ? Ng­¬i cã ®em mËt hµm tíi kh«ng? ChuyÒn hµng ®ã rèt cuéc lµ g×?",
    "§©y! Mêi c« xem qua! Theo t¹i h¹ ®­îc biÕt chuyÕn hµng ®ã nghe ®©u cã liªn quan ®Õn m¶nh S¬n Hµ X· T¾c.",
    "Cã chuyÖn ®¹i sù thËt råi, ®a t¹ ®· <sex> th«ng b¸o. §©y chót t¹ lÔ, xin nhËn lÊy!"
};
szTaskFourTalk = {
    "Thùc ra ta chİnh lµ ng­êi liªn l¹c víi {Tr­êng Ca M«n}, chuyÖn nµy b¾t ®Çu tõ ngµy khai quèc. Lóc ®ã Th¸i Tæ {b×nh ®Şnh giang s¬n}, c¸c vŞ t­íng nh­ Th¹ch Thñ Tİn, Cao Hoµi §øc, Tr­¬ng LÖnh Phong, {TriÖu Ng¹n Huy} ®Òu c¸o l·o håi h­¬ng, an d­ìng tuæi giµ. §¸ng tiÕc TriÖu Ng¹n Huy ®¹i nh©n kh«ng chŞu næi sù c« ®¬n bÌn liªn l¹c mét sè b¹n bÌ giang hå, ng©m th¬, tû vâ nghÖ.",
    "VÒ sau nh÷ng vŞ b»ng h÷u nµy thµnh lËp thµnh mét m«n ph¸i. Lóc ®ã trong ph¸i nhiÒu ng­êi s¸ng t¸c nh¹c lµm th¬ cho nªn míi cã tªn {Tr­êng Ca M«n}.",
    "Ta cã thÓ gióp ®­îc g× cho c« n­¬ng ®©y."
};

szFinished = {
    "<sex> qu¶ nhiªn th©n thñ bÊt phµm! Chót quµ män xin nhËn lÊy!"
};
szTaskFiveTalk = {
    "Hy väng <sex> cã thÓ gióp ta th«ng b¸o cho nh÷ng ng­êi liªn l¹c kh¸c trong {Tr­êng Ca M«n}, lµ {C«ng T«n Th­} (T­¬ng D­¬ng), {TriÖu Diªn Niªn} (BiÖn Kinh), {Gia C¸t Kú} (Giang T©n Th«n).",
    "Ta sÏ ®i ngay!"
};
szTaskFiveFinished = {
    "Ta ®· hoµn thµnh nhiÖm vô c« n­¬ng yªu cÇu!",
    "§a t¹ <sex>, ®©y lµ chót quµ män, xin nhËn lÊy!"
};

function main()
    
    if GetTask(124) == 1 then
    	talk_one();
    	return
   	end;
    
    local nStep = GetTask(TASK_YZ_TWO);
    if nStep == 6 then
        two_06_00();
        return
    elseif nStep == 7 then
        two_07_00();
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 6 then
        task_06_00();
        return
    elseif nStep == 7 then
        task_07_xh_00();
        return
    elseif nStep == 11 then
        task_11_00();
        return
    elseif nStep == 12 then
        task_12_00();
        return
    elseif nStep == 18 then
        task_18_00();
        return
    elseif nStep == 19 then
        Talk(1,"","Ng­¬i ch­a mang <color=yellow>Thiªn ThiÒm Hãa §éc Cao<color> cho <color=yellow>H¹ HÇu Liªn<color> sao?");
        return
    elseif nStep == 20 then
        task_20_00();
        return
    elseif nStep == 21 then
        Talk(1,"","Mau ®Õn <color=yellow>Thanh Khª ®éng <color> ë <color=yellow>Long TuyÒn th«n<color> cøu <color=yellow>L«i Th¾ng<color> tho¸t n¹n!");
        return
    elseif nStep == 22 then
        task_22_00();
        return
    elseif nStep == 23 then
        task_23_00();
        return
    elseif nStep == 24 then
        task_24_00();
        return
    elseif nStep == 25 then
        task_25_00();
        return
    elseif nStep == 26 then
        task_26_00();
        return
    elseif nStep == 27 then
        Talk(1,"","H·y mang <color=yellow>b¶o vËt thÇn bİ<color> ®Õn tËn tay <color=yellow>§­êng Ninh<color> ë <color=yellow>Vò Di s¬n<color>!");
        return
    elseif nStep == 28 then
        task_28_00();
        return
    elseif nStep == 29 then
        local szTalk = {
            "HiÖn ch­a cã g× cÇn ng­¬i gióp. <sex> h·y ®i tu luyÖn thªm!"
        };
        TalkEx("", szTalk);
        return
    end;
    
    if GetTask(TASK_THREE) == 1 then
        TalkEx("task_four_00", szTaskThreeTalk);
        return
    end;
    
    local nStep = GetTask(TASK_FOUR);
    if nStep == 1 then
        TalkEx("task_four_01", szTaskFourTalk);
        return
    elseif nStep == 2 then
        Talk(1, "task_four_02_00", "PhiÒn b»ng h÷u ®Õn Long TuyÒn th«n giÕt 20 con hå ly.");
        return
    elseif nStep == 3 then
        TalkEx("task_four_03", szFinished);
        return
    end;
    
    nStep = GetTask(TASK_FIVE);
    if nStep == 1 then
        TalkEx("task_five_00", szTaskFiveTalk);
        return
    elseif nStep == 2 then
        Talk(1, "", "Mau b¸o râ t×nh h×nh n¬i nµy cho c¸c ng­êi liªn l¹c cña Tr­êng Ca M«n!");
        return
    elseif nStep == 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, 6);
        GivePlayerAward("Level_18", "hard", "head", "Level_21");
        TalkEx("", szTaskFiveFinished);
        return
    end;
    
    local szTalk = {
        "<sex> nÕu r¶nh rçi, h·y nghe ta tÊu khóc!"
    };
    TalkEx("", szTalk);
end;

function talk_one()
    local szTalk = {
        "Ta phông mÖnh TriÖu Diªn Niªn tiÒn bèi th«ng b¸o cho c« n­¬ng cÇn ®Ò phßng bän dŞ téc vâ sÜ",
        "§a t¹ <sex>, ta sÏ ®Ò phßng."
    };
    GivePlayerAward("Level_20", "hard");
    GivePlayerExp(SkeyBJShuxin,"shitaijinji2")		--ÊÂÌ¬½ô¼±1
    SetTask(124, 2);
    if GetTask(125) == 2 and GetTask(126) == 2 then
        SetTask(111, 111);
    end;
    TalkEx("", szTalk);
end;

function task_four_00()
    SetTask(TASK_THREE, 2);
    SetTask(TASK_FOUR, 1);
    DelItem(2, 0, 40, 1);
    GivePlayerAward("Level_18", "hard");
end;

function task_four_01()
    local szTalkFourTalk2 = {
        "Th©n phËn ta ®· bŞ ng­êi {Xi Háa gi¸o} ph¸t hiÖn, ng­¬i mau gióp ta ®Õn {Long TuyÒn Th«n} giÕt 20 con {hå ly} vÒ ®©y!",
        "§­îc! Ta ®i ngay!"
    };
    TalkEx("task_four_02", szTalkFourTalk2);
end;

function task_four_02()
    SetTask(TASK_FOUR, 2);
    CreateTrigger(0,506,99);	--É±ºüÀê
    Msg2Player("GiÕt 20 con hå ly ë Long TuyÒn Th«n");
    TaskTip("GiÕt 20 con hå ly ë Long TuyÒn Th«n");
end;

function task_four_02_00()
	if GetTrigger(99) == 0 then
		CreateTrigger(0,506,99);	--É±ºüÀê
	end;
end;

function task_four_03()
    SetTask(TASK_FOUR, 4);
    SetTask(TASK_FIVE, 1);
    GivePlayerAward("Level_18", "hard");
end;

function task_five_00()
    SetTask(127,1);
    SetTask(128,1);
    SetTask(129,1);
    
    AddItem(2, 0, 41, 1);   --Öî¸ğÆåµÄĞÅ
    AddItem(2, 0, 42, 1);   --¹«ËïÊéµÄĞÅ
    AddItem(2, 0, 43, 1);   --ÕÔÑÓÄêµÄĞÅ
    
    Msg2Player("Liªn l¹c 3 víi 3 ng­êi cßn l¹i trong Tr­êng Ca M«n");
    TaskTip("Liªn l¹c 3 víi 3 ng­êi cßn l¹i trong Tr­êng Ca M«n");
    
    SetTask(TASK_FIVE, 2);
end;