--==================================================
--create by zhangming 2010.03.18
--describe: Ô½ÄÏ°æ ÍÅÌåÈÎÎñBOSS Í·ÎÄ¼þ
--related files:
--==================================================
Include ("\\Script\\lib\\globalfunctions.lua")
VET_201003_STR_LOG_TITLE = "NhiÖm vô chuyÓn sinh tæ ®éi"
VET_201003_STR_LOG_ACTION = "PhÇn th­ëng cho giÕt boss m«n héi nhiÖm vô tæ ®éi"

VET_201003_TB_BOSS_APPEAR_MAPID = {
    { --Áú×Ó ÈªÖÝ¸®±±
        {108,1420,3079,"B¾c TuyÒn Ch©u"},
        {108,1420,3041,"B¾c TuyÒn Ch©u"},
        {108,1393,2979,"B¾c TuyÒn Ch©u"},
        {108,1493,2911,"B¾c TuyÒn Ch©u"},
        {108,1491,2971,"B¾c TuyÒn Ch©u"},
        {108,1567,3048,"B¾c TuyÒn Ch©u"},
    },
    { --·ï×Ó ³É¶¼¸®Î÷
        {301,1491,3191,"T©y Thµnh §«"},
        {301,1422,3142,"T©y Thµnh §«"},
        {301,1427,3047,"T©y Thµnh §«"},
        {301,1450,2898,"T©y Thµnh §«"},
        {301,1562,2849,"T©y Thµnh §«"},
        {301,1574,2937,"T©y Thµnh §«"},
    },
    { --»¢×Ó ÈªÖÝ¸®±±
        {108,1601,3064,"B¾c TuyÒn Ch©u"},
        {108,1576,2898,"B¾c TuyÒn Ch©u"},
        {108,1513,2930,"B¾c TuyÒn Ch©u"},
        {108,1438,2914,"B¾c TuyÒn Ch©u"},
        {108,1443,2999,"B¾c TuyÒn Ch©u"},
        {108,1520,3172,"B¾c TuyÒn Ch©u"},
    },
    { --Ó¥×Ó ³É¶¼¸®Î÷
        {301,1394,3109,"T©y Thµnh §«"},
        {301,1391,2962,"T©y Thµnh §«"},
        {301,1430,2950,"T©y Thµnh §«"},
        {301,1523,2893,"T©y Thµnh §«"},
        {301,1487,2796,"T©y Thµnh §«"},
        {301,1537,3100,"T©y Thµnh §«"},
    },
}


VET_201003_TB_BOSS_INF = {
    {"Long Tö","Long Tö","\\script\\online_activites\\reborn\\task\\boss\\boss_longzi.lua"},
    {"Phông Tö","Phông Tö","\\script\\online_activites\\reborn\\task\\boss\\boss_fengzi.lua"},
    {"Hæ Tö","Hæ Tö","\\script\\online_activites\\reborn\\task\\boss\\boss_huzi.lua"},
    {"¦ng Tö","¦ng Tö","\\script\\online_activites\\reborn\\task\\boss\\boss_yingzi.lua"},

}

VET_201003_TB_BOSS_AWARD = {
    {1,8000000,"Nh©n S©m V¹n N¨m",{2,1,30071,1},0,0},
    {1,125,"Long Tö Béi",{2,1,30155,1},0,0},
    {1,125,"Phông Tö Béi",{2,1,30156,1},0,0},
    {1,125,"Hæ Tö Béi",{2,1,30157,1},0,0},
    {1,125,"¦ng Tö Béi",{2,1,30158,1},0,0},
    {1,500000,"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch",{2,1,1067,1},0,0},
    {1,1000000,"Thiªn th¹ch",{2, 2, 8, 1},0,0},
    {1,499500,"M¶nh Thiªn th¹ch",{2, 2, 7, 1},0,0},
}


function VET_201003_GIVE_BOSS_AWARD()
    gf_EventGiveRandAward(VET_201003_TB_BOSS_AWARD,10000000,1,VET_201003_STR_LOG_TITLE,VET_201003_STR_LOG_ACTION)
end
