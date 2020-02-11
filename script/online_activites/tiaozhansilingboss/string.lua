--=============================================
--create by zhangming 2010.7.28
--describe:Ô½ÄÏ°æ2010ÄêÌôÕ½ËÄÁé ×Ö·û´®ÎÄ¼þ
--=============================================

VET_201008_02_STR_LOG_TITLE = "Ho¹t ®éng khiªu chiÕn tø linh";--±¾´Î»î¶¯ÈÕÖ¾±êÌâ

VET_201008_02_TB_LOG_ACTION_LIST = {
    [1] = "Nép ®µn h­¬ng méc ®Ó nhËn th­ëng",
    [2] = "NhËn ®µn h­¬ng méc",
    [3] = "NhËn phÇn th­ëng tiÖc mõng c«ng",
    [4] = "Sö dông tø linh lÖnh nhËn ®­îc phÇn th­ëng",
    [5] = "§¸nh b¹i boss nhËn ®­îc tø linh lÖnh",
};

VET_201008_02_TB_ITEM_LIST = {
    [1] = {"§µn H­¬ng Méc",2,1,30231},
    [2] = {"Tø Linh LÖnh",2,1,30232},
};


VET_201008_02_TB_NPC_LIST = {
    [1] = {"Lß n­íng b¸nh","Tø Linh §Ønh","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_silingding.lua"},
    [2] = {"R­¬ng tiÒn","§µn H­¬ng R­¬ng","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_tanmuxiang.lua"},
    [3] = {"M©m cç","TiÖc mõng c«ng cña %s","\\script\\online_activites\\tiaozhansilingboss\\npc\\npc_qinggongyan.lua"},
};

VET_201008_02_TB_BOSS_LIST = {
    [1] = {"Long Tö","Long ThÇn Hãa Th©n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [2] = {"Phông Tö","Phông ThÇn Hãa Th©n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [3] = {"Hæ Tö","Hæ ThÇn Hãa Th©n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
    [4] = {"¦ng Tö","¦ng ThÇn Hãa Th©n","\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua"},
};



VET_201008_02_TB_STR_LIST = {
    [1] = "Tø linh ®Ønh ®· xuÊt hiÖn t¹i %s, ch­ vÞ ®¹i hiÖp h·y chuÈn bÞ khiªu chiÕn BOSS tø linh",
    [2] = "Nép sè l­îng ®µn h­¬ng méc kh«ng ®ñ 200 c¸i, v× vËy kh«ng thÓ kÝch ho¹t ®­îc BOSS tø linh. Xin h·y cè g¾ng lÇn sau",
    [3] = "Cuèi cïng còng nép ®ñ 200 ®µn h­¬ng méc, BOSS tø linh ®· bÞ kÝch ho¹t. Mäi ng­êi h·y chuÈn bÞ nghªnh chiÕn nhÐ.",
    [4] = "Ta muèn nép ®µn h­¬ng méc",
    [5] = "KÕt thóc ®èi tho¹i",
    [6] = "§· nép <color=red>%d/200<color> ®µn h­¬ng méc.",
    [7] = "Mçi ngµy mçi ng­êi chØ cã thÓ nép 80 ®µn h­¬ng méc. c¸c h¹ ®· nép ®ñ 80 c¸i råi v× vËy kh«ng thÓ nép thªm ®­îc n÷a.",
    [8] = "§· nép ®ñ 200 ®µn h­¬ng méc, kh«ng cÇn ph¶i nép thªm n÷a. Xin h·y ®îi boss xuÊt hiÖn!!!",
    [9] = "Trªn hµnh trang cña c¸c h¹ ®· cã 1 ®µn h­¬ng méc råi, kh«ng thÓ mang thªm ®µn h­¬ng méc n÷a.",
    [10] = "CÊp 77 trë lªn vµ ®· tham gia m«n ph¸i míi cã thÓ më r­¬ng ®µn méc",
    [11] = "%s ®¶ b¹i %s, nhËn ®­îc tø linh lÖnh.",
    [12] = "CÊp 77 trë lªn vµ ®· tham gia m«n ph¸i míi cã thÓ sö dông tiÖc mõng c«ng",
    [13] = "H«m nay c¸c h¹ ®· sö dông 9 lÇn tiÖc mõng c«ng, v× vËy kh«ng thÓ tiÕp tôc sö dông.",
    [14] = "CÇn thªm %d gi©y míi cã thÓ sö dông tiÕp tiÖc mõng c«ng",
    [15] = "Trong tø linh lÖnh Èn ch­a huyÒn c¬, x¸c nhËn muèn sö dông tø linh lÖnh??",
    [16] = "§óng vËy!",
    [17] = "Hµnh trang kh«ng ®ñ ®µn h­¬ng méc",
    [18] = "CÊp 77 trë lªn vµ ®· tham gia m«n ph¸i míi cã thÓ sö dông tø linh ®Ønh",
    [19] = "R­¬ng ®µn méc xuÊt hiÖn råi.",
    [20] = "Tø linh ®Ønh cã chøa %d ®µn h­¬ng méc",
    [21] = "ThÇn thó tø linh xuÊt hiÖn, xin h·y nhanh chãng b¾t lÊy.",
    [22] = "Chóc mõng ch­ vÞ ®· ®¶ b¹i thÇn thó tø linh, xin h·y nhanh chãng chuÈn bÞ",
};

VET_201008_02_TB_GIVE_QINGGONGYAN_AWARD = {
    {1, 1514, "C¬m chiªn trøng", {1, 1, 14, 1}, 0},
    {1, 518, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
    {1, 500, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
    {1, 140, "B¨ng th¹ch", {2, 1, 149, 1}, 0},
    {1, 10, "TÈy Tñy linh ®¬n", {2, 0, 137, 1}, 15 * 24 * 3600},
    {1, 50, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 30 * 24 * 3600},
    {1, 50, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
    {1, 200, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 15 * 24 * 3600},
    {1, 6, "R­¬ng TrÊn Ph¸i", {2, 1, 30113, 1}, 30 * 24 * 3600},
    {1, 12, "Tö Quang Bµi", {2, 0, 762, 1}, 15 * 24 * 3600},
    {1, 1400, "B¸nh Bét vµng", {1, 1, 15, 1}, 15 * 24 * 3600},
    {1, 1400, "Méc Lan Xu©n", {1, 1, 18, 1}, 0},
    {1, 1400, "T©y B¾c Väng", {1, 1, 19, 1}, 0},
    {1, 1400, "L¹c Mai", {1, 1, 16, 1}, 0},
    {1, 1400, "Minh NguyÖt D¹", {1, 1, 17, 1}, 0},
};

VET_201008_02_TB_GIVE_SILINGLING_AWARD = {
    {2, 73, 500000, 1},
    {1, 6, "TÈy Tñy ®¬n", {2, 0, 136, 1}, 15 * 24 * 3600},
    {1, 6, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 30 * 24 * 3600},
    {1, 1, "R­¬ng YÕu QuyÕt_Cao CÊp", {2, 1, 30112, 1}, 30 * 24 * 3600},
    {1, 6, "R­¬ng TrÊn Ph¸i", {2, 1, 30113, 1}, 30 * 24 * 3600},
    {1, 6, "NguyÖt Hoa Chi Tinh", {2, 1, 3219, 1}, 0},
    {1, 1, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 15 * 24 * 3600},
    {3, 1, 10000000, 1},
};



--ÉÏ½»Ì´ÏãÄ¾½±Àø
VET_201008_02_TB_GIVE_TANXIANGMU_AWARD = {
    {2, 70, 50000, 1},
    {5, 30, 5, 1},
};

VET_201008_02_STR_CITY_NAME = {
    [1] = "Long TuyÒn Th«n",
    [2] = "V©n Méng Tr¹ch",
    [3] = "§«ng BiÖn Kinh",
    [4] = "T©y TuyÒn Ch©u",
    [5] = "B¾c TuyÒn Ch©u",
};



