--=============================================
--create by xiongyizhi 2010.11.2
--describe:Ô½ÄÏ°æ2010Äê12ÔÂ»î¶¯1 ×Ö·û´®ÎÄ¼þ
--=============================================

VET_201012_04_STR_LOG_TITLE = "Hoat dong trong cay giang sinh thang 12 nam 2010";--±¾´Î»î¶¯ÈÕÖ¾±êÌâ

VET_201012_04_TB_LOG_ACTION_LIST = {
    [1] = "§æi phÇn th­ëng Qu¶ Tø Linh",
    [2] = "Trång c©y Tø Linh",
    [3] = "Trång c©y Tø Linh nhËn ®­îc phÇn th­ëng",
    [4] = "Trém c©y Tø Linh nhËn ®­îc phÇn th­ëng",
    [5] = "C©y Tø Linh bÞ trém nhËn ®­îc phÇn th­ëng",
    [6] = "Mua ®¹o cô C©y Tø Linh"
};

VET_201012_04_NPC_TB = {
    [1] = {"NguyÖt L·o", "B¸ch Th¶o Tiªn"},
    [2] = {"C©y Tø Linh 1", "C©y Tø Linh"}; --TODO Ìæ»»³ÉÏàÓ¦Ä£ÐÍ
};

VET_201012_04_NPC_TALK_TITLE = "<color=yellow>B¸ch Th¶o Tiªn<color>: ".."C¸c h¹ cÇn g×?";

VET_201012_04_NPC_TALK_STRINGS = {
    [1] = "§æi c¸c lo¹i Tr¸i C©y Tø Linh nhËn th­ëng/ExChange_4_soul_award",
    [2] = "Mua c¸c lo¹i ®¹o cô trång vµ thu thËp c©y Tø Linh/buy_item_for_plant_4_soul",
    [3] = "KÕt thóc ®èi tho¹i/gf_DoNothing",
    [4] = "Giao nép %s ®æi phÇn th­ëng",
    [5] = "KÕt thóc ®èi tho¹i",
    [6] = "Sè l­îng Qu¶ Tø Linh kh«ng ®ñ",
    [7] = "C©y nµy ®· bÞ trém qua råi, h·y ®Ó l¹i cho chñ nh©n th«i",
    [8] = "C¸c h¹ cÇn g×",
    [9] = "%s  cÇn  %s",
    [10] = "HiÖn trong giai ®o¹n %s, c¸ch giai ®o¹n kÕ tiÕp cßn %d gi©y",
    [11] = "Nguyªn liÖu ch¨m sãc kh«ng ®ñ",
    [12] = "C©y ®· tr­ëng thµnh, c¸c h¹ muèn thu thËp kh«ng?",
    [13] = "Thu thËp c©y",
    [14] = "§Þa ®iÓm trång c©y: T©y Thµnh §«, T©y BiÖn Kinh, B¾c TuyÒn Ch©u",
    [15] = "Nh©n vËt cÇn ®¹t trªn cÊp 73",	--®· gia nhËp m«n ph¸i, , danh väng = 3000, ®iÓm s­ m«n = 4000
    [16] = "Cßn %d gi©y n÷a míi cã thÓ thu thËp",
    [17] = " trång ",
    [18] = "ChØ ®­îc thu ho¹ch theo giai ®o¹n",
    [19] = "Sè l­îng c©y b¹n trån h«m nay ®· ®¹t giíi h¹n, h·y trång tiÕp vµo ngµy mai",
    [20] = "Sè l­îng tr¸i c©y c¸c h¹ giao nép h«m nay ®· ®¹t giíi h¹n, h·y quay l¹i vµo ngµy mai",
    [21] = "H·y x¸c ®Þnh l¹i kh«ng gian hµnh trang",
    [22] = "Mua C©y Tø Linh (15 xu)",
    [23] = "Mua B×nh Tiªn Lé (t­íi c©y Tø Linh) (20 b¹c)",
    [24] = "Mua B×nh Ph©n Bãn (bãn ph©n c©y Tø Linh) (20 b¹c)",
    [25] = "Mua Thuèc Trõ S©u (20 b¹c)",
    [26] = "C¸c h¹ cÇn mua bao nhiªu?",
    [27] = "Kh«ng ®ñ tiÒn",
    [28] = "C©y Tø Linh",
    [29] = "Ho¹t ®éng nµy chØ h­íng ®Õn nh÷ng ng­êi ch¬i ®· tham gia m«n ph¸i th«i, t¹i h¹ ph¶i gia nhËp mét m«n ph¸i bÊt kú råi tham gia ho¹t ®éng nhÐ!",
};

VET_201012_04_TB_ITEM = {
    [1] = {"Thanh Long Qu¶", {2, 1, 30270}},
    [2] = {"Háa Phông Hoa", {2, 1, 30271}},
    [3] = {"B¹ch Hæ DiÖp", {2, 1, 30272}},
    [4] = {"HuyÒn Vò C¨n", {2, 1, 30273}},
};

VET_201012_04_TB_AWARD = {
    [1] = {{15, 0, 0, 0}, 1500000},  --µÚÒ»¸ö±í±íÊ¾ÐèÒª15¸öµÚÒ»ÖÖË®¹û£¨ÇàÁú¹û£©£¬¶ÔÓ¦½±Àø¾­ÑéÊýÎª1500000
    [2] = {{0, 15, 0, 0}, 1500000},
    [3] = {{0, 0, 15, 0}, 1500000},
    [4] = {{0, 0, 0, 15}, 1500000},
    [5] = {{10, 10, 10, 10}, 6000000}, --ÐèÒª4ÖÖË®¹û¸÷15¸ö
};

--¶ÔÓ¦Ã¿¸ö³É³¤½×¶ÎµÄÌõ¼þ£¬
--ÒÔ³É³¤£¨1£©ÎªÀý£¬
--{"½×¶ÎÃû³Æ", "Ä£°åÃû", {ÏûºÄ×Ó±í}, ½×¶Î³ÖÐøÊ±¼ä}
--
--{ÏûºÄ×Ó±í},Ã¿¸öÔªËØµÚÒ»Î»ÊÇÏûºÄÎïÆ·ID{G, D, P}£¬ºóÒ»Î»ÊÇÊýÁ¿£¬¿ÉÒÔÌî¶à¸öÏûºÄÆ·£¬¿ÉÒÔÌî²»Í¬ÊýÁ¿,Îª¿ÕÔò²»ÏûºÄ
--ÓÉÓÚÏûºÄµÄ²ÄÁÏºÍ¶ÔÓ¦ÃèÊö¶¯×÷²»Í¬£¬Ó³Éä±íÔÚVET_201012_04_TREE_ITEM_TO_ACTION
VET_201012_04_TB_TREE_GROW = {
    [1] = {"C©y gièng", "C©y Tø Linh 1",nil, 60},
    [2] = {"Ph¸t triÓn (1)", "C©y Tø Linh 1", {
                                  {{2, 1, 30274}, 1}, 
                                  {{2, 1, 30275}, 1},
                                 }, 60},
    [3] = {"Ph¸t triÓn (2)", "C©y Tø Linh 2_1", {
                                    {{2, 1, 30275}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [4] = {"Ph¸t triÓn (3)", "C©y Tø Linh 2_2", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30276}, 1},
                                   }, 60},
    [5] = {"Ph¸t triÓn (4)", "C©y Tø Linh 3_1", {
                                    {{2, 1, 30274}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [6] = {"Ph¸t triÓn (5)", "C©y Tø Linh 3_2", {
                                    {{2, 1, 30276}, 1}, 
                                    {{2, 1, 30275}, 1},
                                   }, 60},
    [7] = {"Thu ho¹ch", "C©y Tø Linh 4", nil, 60},
};

--Ö»ÊÇ°ÑÏûºÄµÄµÀ¾ßºÍÏàÓ¦µÄ¶¯×÷Ãû³Æ¶ÔÓ¦Ò»ÏÂ,ÓÉITEM±íÀ©Õ¹£¬½áºÏÉÏ±í
VET_201012_04_TREE_ITEM_TO_ACTION = {
    [1] = {"B×nh tiªn lé", {2, 1, 30274}, "T­íi n­íc"},
    [2] = {"Binh ph©n bãn", {2, 1, 30275}, "Bãn ph©n"},
    [3] = {"Thuèc trõ s©u", {2, 1, 30276}, "Trõ s©u"},
};

