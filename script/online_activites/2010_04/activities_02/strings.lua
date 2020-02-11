--=============================================
--create by TrojanPizza 2010.3.26
--describe:Ô½ÄÏ°æ2010Äê4ÔÂ»î¶¯3 ×Ö·û´®ÎÄ¼þ
--=============================================

VET_201004_02_STR_LOG_TITLE = "Hoat dong thang 4 nam 2010";                             --±¾´Î»î¶¯ÈÕÖ¾±êÌâ

VET_201004_02_TB_LOG_ACTION_LIST = {
    [1] = "Nép tr¸i c©y",
    [2] = "Trång c©y b¸t nh·",
    [3] = "Trång c©y b¸t nh· lín",

};

VET_201004_02_TB_RAND_AWARD_LIST = {
    [1] = {1, 5, "Nh·n"  , {2, 1, 30164, 1}, 0, 0},
    [2] = {1, 5, "Ch«m Ch«m", {2, 1, 30165, 1}, 0, 0},
    [3] = {1, 5, "Cam",   {2, 1, 30166, 1}, 0, 0},
    [4] = {1, 5, "Dõa",   {2, 1, 30167, 1}, 0, 0},
    [5] = {1, 5, "M¨ng côt",   {2, 1, 30168, 1}, 0, 0},
    [6] = {1, 5, "B­ëi",   {2, 1, 30169, 1}, 0, 0},
    [7] = {1, 5, "D©u",   {2, 1, 30170, 1}, 0, 0},
    [8] = {1, 5, "Chuèi",   {2, 1, 30171, 1}, 0, 0},
    [9] = {1, 5, "Xoµi",   {2, 1, 30172, 1}, 0, 0},
    [10]= {1, 5, "§µo",   {2, 1, 30173, 1}, 0, 0},
    [11]= {1, 5, "MËn",   {2, 1, 30174, 1}, 0, 0},
    [12]= {1, 5, "V¶i",   {2, 1, 30175, 1}, 0, 0},
    [13]= {1, 5, "T¸o",   {2, 1, 30176, 1}, 0, 0},
    [14]= {1, 5, "B¬",   {2, 1, 30177, 1}, 0, 0},
    [15]= {1, 5, "§u §ñ",   {2, 1, 30178, 1}, 0, 0},
    [16]= {1, 5, "M·ng CÇu", {2, 1, 30179, 1}, 0, 0},
    [17]= {1, 5, "Khãm",   {2, 1, 30180, 1}, 0, 0},
    [18]= {1, 5, "Lª",   {2, 1, 30181, 1}, 0, 0},
    [19]= {1, 5, "Bßn Bon",   {2, 1, 30182, 1}, 0, 0},
    [20]= {1, 5, "KhÕ",   {2, 1, 30183, 1}, 0, 0},
};

VET_201004_02_TB_SMALLTREE_RAND_AWARD_LIST = {
    [1] = {1, 45, "Nh·n", {2, 1, 30164, 2}, 0, 0},
    [2] = {1, 45, "T¸o", {2, 1, 30176, 2}, 0, 0},
    [3] = {1, 10, "MËn", {2, 1, 30174, 2}, 0, 0},
};

VET_201004_02_TB_BIGTREE_RAND_AWARD_LIST = {
    [1] = {1, 30, "Nh·n", {2, 1, 30164, 2}, 0, 0},
    [2] = {1, 30, "T¸o", {2, 1, 30176, 2}, 0, 0},
    [3] = {1, 30, "MËn", {2, 1, 30174, 2}, 0, 0},
    [4] = {1, 4 , "Chuèi", {2, 1, 30171, 2}, 0, 0},
    [5] = {1, 4 , "§µo", {2, 1, 30173, 2}, 0, 0},
    [6] = {1, 1 , "§u §ñ", {2, 1, 30178, 2}, 0, 0},
    [7] = {1, 1 , "Bßn Bon", {2, 1, 30182, 2}, 0, 0},
};

VET_201004_02_TB_ITEM_LIST = {
    [1] = {"Nh·n"  , 2, 1, 30164},
    [2] = {"Ch«m Ch«m", 2, 1, 30165},
    [3] = {"Cam",   2, 1, 30166},
    [4] = {"Dõa",   2, 1, 30167},
    [5] = {"M¨ng côt",   2, 1, 30168},
    [6] = {"B­ëi",   2, 1, 30169},
    [7] = {"D©u",   2, 1, 30170},
    [8] = {"Chuèi",   2, 1, 30171},
    [9] = {"Xoµi",   2, 1, 30172},
    [10]= {"§µo",   2, 1, 30173},
    [11]= {"MËn",   2, 1, 30174},
    [12]= {"V¶i",   2, 1, 30175},
    [13]= {"T¸o",   2, 1, 30176},
    [14]= {"B¬",   2, 1, 30177},
    [15]= {"§u §ñ",   2, 1, 30178},
    [16]= {"M·ng cÇu", 2, 1, 30179},
    [17]= {"Khãm",   2, 1, 30180},
    [18]= {"Lª",   2, 1, 30181},
    [19]= {"Bßn Bon",   2, 1, 30182},
    [20]= {"KhÕ",   2, 1, 30183},
};

VET_201004_02_TB_STRINGS = {
    --npcÐÅÏ¢
    [1] = {
        [1] = "L·o phó hé",
        [2] = "§­êng Minh Thµnh",
        [3] = "<color=green>§­êng Minh Thµnh: <color>",
    },
    --ÉñÃØÉÌÈË¶Ô»°×Ö·û´®
    [2] = {
        [1] = "Thu gom hµng hãa gi¸ cao ®©y, ai cã <color=yellow>MËn, B­ëi, §µo … Th¬m, D­a, Lª … T¸o, Bßn Bon, M¨ng Côt<color> mang nép cho ta kh«ng? Thï lao kh«ng nhá tÝ nµo ®©u nhÐ!!",
        [2] = "Ta muèn ®æi 1 Ýt tr¸i c©y.",
        [3] = "PhÇn th­ëng nép nhiÒu tr¸i c©y.",
        [4] = "Xem thuyÕt minh ho¹t ®éng",
        [5] = "N¬i ®©y cã vÎ ®«ng vui ghª.",
        [6] = "Ho¹t ®éng nép tr¸i c©y diÔn ra hµng ngµy, øng víi mçi lo¹i tr¸i, ng­êi ch¬i cã thÓ nép 1 lÇn trong 1 ngµy, mçi lÇn nép cÇn 10 tr¸i c©y cïng lo¹i. Mçi ngµy cã thÓ nép nhiÒu lo¹i tr¸i c©y kh¸c nhau, cµng nép nhiÒu lo¹i tr¸i c©y kh¸c nhau th× phÇn th­ëng sÏ cµng lín",
        [7] = "\n<color=red>Chó ý: \nNh©n vËt cÊp ®é 73 trë lªn vµ ®· vµo hÖ ph¸i míi cã thÓ tham gia nép tr¸i c©y\nNh©n vËt ph¶i nép Ýt nhÊt 2 lo¹i tr¸i c©y kh¸c nhau míi cã thÓ nhËn phÇn th­ëng “thu thËp nhiÒu lo¹i tr¸i c©y”\nSau 0 giê mçi ngµy cã thÓ nép tr¸i c©y cho ngµy tiÕp theo.<color>",
        [8] = "Ta muèn nép 10 %s",
        [9] = "C¸c h¹ muèn nép lo¹i tr¸i c©y nµo?",
        [10]= "§Ó ta suy nghÜ l¹i",
        [11]= "H«m nay ®¹i hiÖp ®· nép ®ñ 20 lo¹i tr¸i c©y råi, ®îi mai råi nép tiÕp nhÐ, tr¸i c©y qu¸ nhiÒu chç ta ®©y chøa kh«ng hÕt!",
        [12]= "H«m nay ®¹i hiÖp ®· nép <color=yellow>%s<color> råi, h·y nép lo¹i kh¸c ®i.",
        [13]= "Ng­êi ch¬i ph¶i cÊp <color=red>73<color> trë lªn míi cã thÓ tham gia ho¹t ®éng, cè lªn chµng trai trÎ!",
        [14]= "Ho¹t ®éng nµy chØ h­íng ®Õn nh÷ng ng­êi ch¬i ®· tham gia m«n ph¸i th«i, t¹i h¹ ph¶i gia nhËp mét m«n ph¸i bÊt kú råi tham gia ho¹t ®éng nhÐ!",
        [15]= "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng nép tr¸i c©y nhiÒu lÇn råi, kh«ng thÓ nhËn thªm ®­îc n÷a.",
        [16]= "Chóc mõng ®¹i hiÖp ®· nhËn ®­îc %d",
        [17]= "Trªn hµnh trang kh«ng ®ñ %s %d, hay lµ ®Ó quªn ë r­¬ng chøa ®å råi?",
    },
}