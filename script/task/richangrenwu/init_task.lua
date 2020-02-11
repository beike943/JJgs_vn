--=============================================
--create by baiyun 2009.12.14
--describe:Ô½ÄÏ°æÎäÁÖÊ¹ÕßÈÕ³£ÈÎÎñ ³õÊ¼»¯ÈÎÎñÎÄ¼ş
--=============================================
--×¢Òâ´ËÎÄ¼şÖĞµÄ¶¨ÒåÈç¹ûÓĞĞŞ¸Ä£¬Ò»¶¨ÒªÍ¬Ê±ĞŞ¸Ä\·şÎñ¶ËÅäÖÃÎÄ¼ş\Relay\RelaySetting\Task\daliytask.luaÏÂÏàÍ¬µÄ¶¨Òå

Include("\\script\\lib\\globalfunctions.lua");

DAILY_TASK_0912_SWITCH = 1; --ÈÕ³£»î¶¯¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª

DAILY_TASK_0912_PERSONAL_TASK = 1027;--·şÎñÆ÷È«¾Ö±äÁ¿£¬±íÊ¾½ñÌìÊÇÄÄ¸ö¸öÈËÈÎÎñ
DAILY_TASK_0912_TEAM_TASK = 1028;--·şÎñÆ÷È«¾Ö±äÁ¿£¬±íÊ¾½ñÌìÊÇÄÄ¸öÍÅ¶ÓÈÎÎñ


--¸öÈËÈÕ³£ÈÎÎñÁĞ±í
DALIY_TASK_0912_PERSONAL_TASK_LIST = {
    {"Thu phôc  Ph­îng Hoµng t¹i Th¸i H­ ¶o c¶nh", 10, {"Kinh nghiÖm Phông hoµng", "LuyÖn Phông Hoµng", "Trang bŞ Phông hoµng"}},
    {"Thu phôc Thùc Nh©n Th¶o t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm Thùc nh©n th¶o", "LuyÖn Thùc Nh©n Hoa",  "Trang bŞ Thùc nh©n th¶o"}},
    {"Thu phôc Thá t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm Thá", "LuyÖn Thè tö", "Trang bŞ Thá"}},
    {"Thu phôc Háa Kú L©n t¹i Th¸i H­ ¶o c¶nh", 10, {"Kinh nghiÖm Háa Kú L©n", "LuyÖn Háa Kú L©n", "Trang bŞ Háa Kú L©n"}},
    {"Thu phôc Bß T©y T¹ng t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm Bß T©y T¹ng", "LuyÖn Mao Ng­u", "Trang bŞ Bß T©y T¹ng"}},
    {"Thu phôc CÇm Tiªn Tö t¹i Th¸i H­ ¶o c¶nh", 20, {"Kinh nghiÖm CÇm Tiªn Tö", "LuyÖn CÇm Tiªn Tö", "Trang bŞ CÇm Tiªn Tö"}},
}

--ÍÅ¶ÓÈÕ³£ÈÎÎñÁĞ±í
DALIY_TASK_0912_TEAM_TASK_LIST = {
    {"Truy t×m B¾c Lôc L©m LÖnh", 10, "B¾c Lôc L©m lÖnh"},
    {"Truy t×m Trôc ¶nh th­¬ng", 20, "Trôc ¶nh Th­¬ng"},
    {"Truy t×m TuyÖt T×nh Th¹ch", 20, "TuyÖt T×nh Th¹ch"},
    {"Truy t×m LÖnh Bµi Tæng Qu¶n ngo¹i viÖn", 5, "LÖnh bµi tæng qu¶n ngo¹i viÖn"},
    {"Truy t×m LÖnh Bµi Tæng qu¶n néi viÖn", 5, "LÖnh bµi tæng qu¶n néi viÖn"},
    {"Truy t×m ViÖt N÷ KiÕm", 5, "ViÖt N÷ kiÕm"},
    {"Truy t×m Trang Chñ Kim Ên", 15, "Trang chñ kim Ên"},
    {"Truy t×m Tr­ëng L·o chØ hoµn", 20, "Tr­ëng L·o ChØ Hoµn"},
}

--function main()
--    if DAILY_TASK_0912_SWITCH == 1 then
--        SetGlbValue(DAILY_TASK_0912_PERSONAL_TASK, gf_GetRandItemByTable(DALIY_TASK_0912_PERSONAL_TASK_LIST, 100, 2));
--        SetGlbValue(DAILY_TASK_0912_TEAM_TASK, gf_GetRandItemByTable(DALIY_TASK_0912_TEAM_TASK_LIST, 100, 2));
--    end
--end


