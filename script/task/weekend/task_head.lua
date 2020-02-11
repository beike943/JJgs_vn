--ÖÜÄ©»î¶¯Í·ÎÄ¼ş
--created by lizhi
--2005-9-9 11:22

Include("\\script\\task\\WeekEnd\\weekend_switch.lua");

TASK_IB_BOOK1 = 1737			-- ³ö¶«Î÷¸ÅÂÊµÄÊé
TASK_IB_BOOK2 = 1738			-- ±£Áô¾ü¹¦µ½ÏÂÖÜ£¬¼ÇÂ¼ÓĞĞ§ÆğÊ¼Ê±¼äºÍ³ÖĞøÊ±¼ä
TASK_WK_ISDISCONNECT = 1741;		--ÅĞ¶ÏÉ±ÙÁ¿ÜÊ±ÊÇ·ñµôÏß
TASK_WHICH_MAP = 1742;			--ÅĞ¶Ï½øÈëÁËÄÇ¸öµØÍ¼
TASK_GQ_DELIVER = 1750;         --ËÍ»õÎïµÄÈÎÎñ±äÁ¿
TASK_GQ_KILLWK_START = 1751;    --¼ÇÂ¼ÊÇ·ñ¿ÉÒÔ½ÓÉ±ÙÁ¿ÜÈÎÎñ
TASK_GQ_KILLWK = 1752;          --É±ÙÁ¿ÜÈÎÎñ£¬ÓÃÓÚ¼ÆÊı
TASK_GQ_KILLWK_TIMES = 1753;	--¼ÇÂ¼É±ÁË¼¸ÂÖÙÁ¿Ü£¬É±Ò»ÂÖ¿ÉÒÔ»»Ò»¸öbossÕÙ»½ÅÆ
TASK_NPC_INDEX = 1754;          --ÓÃÓÚ¼ÇÂ¼call³öÀ´µÄNPC index
TASK_POINT = 1755;              --ÓÃÓÚ¼ÇÂ¼Íæ¼Òµ±Ç°µÄ"¹±Ï×¶È"
TASK_BOSS_INDEX = 1756;			--¼ÇÂ¼µ±Ç°ÕÙ»½µÄÊÇµÚ¼¸¸öboss
TASK_POINT_TIME = 1757;			--¼ÇÂ¼×î½üÒ»¸ö»ñµÃ"¹±Ï×¶È"µÄÊ±¼ä£¬ÊıÖµÊÇÒ»ÄêÖĞµÄµÚ¼¸Ìì
TASK_COOLDOWN = 1758;			--¼ÇÂ¼É±ËÀÙÁ¿ÜÒÔºóÒª¶àÉÙÊ±¼ä²ÅÄÜ½øÈëÏÂÒ»´Î
TASK_240_TIMES = 1759;			--¼ÇÂ¼Ò»ÌìÖ®ÄÚ»»È¡½±ÀøµÄ´ÎÊı
TASK_240_DAYS = 1760;			--¼ÇÂ¼ÉÏ´Î»»È¡½±ÀøÊÇÄÄÌì
TASK_POSITION = 1761;           --ÓÃÓÚ¼ÇÂ¼Íæ¼Ò×ø±ê£¬ÓÃÁË1761,1762,1763
TASK_GET_ITEM_FLAG = 1770;		--ÓÃÓÚ¼ÇÂ¼Íæ¼ÒÊÇ·ñÁìÈ¡ÁË½±Àø
TASK_ITEM = 1771;				--ÓÃÓÚ¼ÇÂ¼¸øÍæ¼ÒµÄ¶«Î÷£¬´ÓTASK_ITEMµ½TASK_ITEM + 6

--------------------------------------------------------
--¼ÇÂ¼ËÍ»õµÄÂ·Ïß
PATH_BJ2QZ = 1;
PATH_XY2YZ = 2;
PATH_YZ2XY = 3;
--------------------------------------------------------

MAXNUM_KILLWK = 50;
POINT_PER_MATERIALS = 1;	--Ã¿ÉÏ½»Ò»¸ö²ÄÁÏ»ı1·Ö
POINT_PER_ONCE_DELIVER = 25;	--ÔËËÍÒ»´Î
--------------------------------------------------------
szNpcScript = "\\script\\task\\WeekEnd\\boss_script.lua";
ErrorMsg = "Xin lçi! Ng­¬i kh«ng ®i ®óng tuyÕn ®­êng, gióp §¹i Tèng chuyÓn hµng thÊt b¹i."

--É±ËùÓĞ¹Ö¶¼Ëæ»úµôÂäµÄ²ÄÁÏÁĞ±í
material_table = {
    {2,0,307,"Kho¸ng th¹ch qu©n dông"},
    {2,0,308,"Gç qu©n dông"},
    {2,0,309,"Lóa m¹ch qu©n dông"},
    {2,0,310,"Thuéc da qu©n dông"},
    {2,0,311,"T¬ t»m qu©n dông"},
    {2,0,312,"D­îc th¶o qu©n dông"},
    {2,0,313,"Linh huyÕt qu©n dông"}
};

--³ÉÆ·ÏµÁĞµÀ¾ßÁĞ±í
finished_product_table = {
    {2,0,314,"Gi¸o qu©n dông"},
    {2,0,315,"KiÕm dµi qu©n dông"},
    {2,0,316,"Tói tªn qu©n dông"},
    {2,0,317,"Kh«i gi¸p qu©n dông"},
    {2,0,318,"GiÊy bïa qu©n dông"},
    {2,0,319,"Y d­îc qu©n dông"},
    {2,0,320,"L­¬ng thùc qu©n dông"}
};

boss_drop_table = {
    {2,0,321},      --µÚÒ»¸öµôÂäµÄ°ËØÔÍ¼ºÍµÚ¶ş¸öÒ»Ñù
    {2,0,321},
    {2,0,322},
    {2,0,323},
    {2,0,324},
    {2,0,325},
    {2,0,326},
    {2,0,327},
    {2,0,328}
};

--¾ü±¸±í
armament_table = {
    {2,0,329},  --¾üÓÃÖÃÎïÏä
    {2,0,330},  --¾üÓÃÒ½Ò©Ïä
    {2,0,331},  --¾üÓÃ×°±¸Ïä
    {2,0,332}   --¾üÓÃ²ØÊéÏä
};

life_item_table = {
	{"Cuèc Céng C«ng", 0, 200, 23},
	{"L«i ThÇn ®ao", 0, 200, 24},
	{"Cuèc Viªm §Õ", 0, 200, 25},
	{"Bµn Cæ phñ", 0, 200, 26},
	{"Chøc N÷ thoa", 0, 200, 27},
	{"Cuèc ThÇn N«ng", 0, 200, 28}
};

--ÔËËÍÎï×ÊÊ±±ØĞë¾­¹ıµÄµØÍ¼ID±í
--ãê¾©µ½ÈªÖİ
--ãê¾©¸®ÄÏ£¬ĞÓ»¨´å£¬ÑïÖİ£¬ÁúÈª´å£¬ÈªÖİ¸®±±£¬ÈªÖİ
--µØÍ¼ID´ú±íµÄtableÏîÀï¶ÔÓ¦Îª¼ÇÂ¼×ß¹ıµØÍ¼µÄÈÎÎñ±äÁ¿
path_table_index = {201, 202, 150, 106, 108, 100};
path_table = {1730, 1731, 1732, 1733, 1734, 1735};

--½øÈëµØÍ¼µÄÌáÊ¾
map_message = {
	[1] = {},
	[2] = {},
	[3] = {}
}
map_message[1][201] = "§· vµo Nam BiÖn Kinh, xin chuyÓn vËt t­ ®Õn H¹nh Hoa Th«n!";
map_message[1][202] = "§· vµo H¹nh Hoa Th«n, xin chuyÓn vËt t­ ®Õn D­¬ng Ch©u!";
map_message[1][150] = "§· vµo D­¬ng Ch©u, xin chuyÓn vËt t­ ®Õn Long TuyÒn Th«n!";
map_message[1][106] = "§· vµo Long TuyÒn Th«n, xin chuyÓn vËt t­ ®Õn B¾c TuyÒn Ch©u!";
map_message[1][108] = "§· vµo B¾c TuyÒn Ch©u, xin chuyÓn vËt t­ ®Õn TuyÒn Ch©u!";
map_message[1][100] = "§· vµo TuyÒn Ch©u, xin chuyÓn vËt t­ ®Õn ChØ huy sø!";

map_message[2][218] = "§· vµo Linh B¶o s¬n, xin chuyÓn vËt t­ ®Õn ThiÕu L©m!";
map_message[2][204] = "§· vµo ThiÕu L©m, xin chuyÓn vËt t­ ®Õn T©y BiÖn Kinh!";
map_message[2][203] = "§· vµo T©y BiÖn Kinh, xin chuyÓn vËt t­ ®Õn BiÖn Kinh!";
map_message[2][200] = "§· vµo BiÖn Kinh, xin chuyÓn vËt t­ ®Õn Nam BiÖn Kinh!";
map_message[2][201] = "§· vµo Nam BiÖn Kinh, xin chuyÓn vËt t­ ®Õn H¹nh Hoa Th«n!";
map_message[2][202] = "§· vµo H¹nh Hoa Th«n, xin chuyÓn vËt t­ ®Õn D­¬ng Ch©u!";
map_message[2][150] = "§· vµo D­¬ng Ch©u, xin chuyÓn vËt t­ ®Õn ChØ huy sø!";

map_message[3][218] = "§· vµo Linh B¶o s¬n, xin chuyÓn vËt t­ ®Õn T­¬ng D­¬ng!";
map_message[3][204] = "§· vµo ThiÕu L©m, xin chuyÓn vËt t­ ®Õn Linh B¶o s¬n!";
map_message[3][203] = "§· vµo T©y BiÖn Kinh, xin chuyÓn vËt t­ ®Õn ThiÕu L©m!";
map_message[3][200] = "§· vµo BiÖn Kinh, xin chuyÓn vËt t­ ®Õn T©y BiÖn Kinh!";
map_message[3][201] = "§· vµo Nam BiÖn Kinh, xin chuyÓn vËt t­ ®Õn BiÖn Kinh!";
map_message[3][202] = "§· vµo H¹nh Hoa Th«n, xin chuyÓn vËt t­ ®Õn Nam BiÖn Kinh!";
map_message[3][350] = "§· vµo T­¬ng D­¬ng, xin chuyÓn vËt t­ ®Õn ChØ huy sø!";

--ĞèÒª´´½¨µÄrectÀàĞÍ´¥·¢Æ÷ÁĞ±í
--±íÄÚµÄÊı¾İ½á¹¹£ºÇ°ÊÇÅäÖÃÎÄ¼şÀïµÄID£¬ºóÊÇ´¥·¢Æ÷µÄID
rect_trigger_table = {
    {1400, 2001},
    {1401, 2002},
    {1402, 2003},
    {1403, 2004},
    {1404, 2005},
    {1405, 2006}
};

--ÔËËÍÎï×ÊµÄÏåÑôµ½ÑïÖİ
--Áé±¦É½£¬ÉÙÁÖ£¬ãê¾©¸®Î÷£¬ãê¾©£¬ãê¾©¸®ÄÏ£¬ĞÓ»¨´å£¬ÑïÖİ
path_table_2_index = {218, 204, 203, 200, 201, 202, 150};
path_table_2 = {1730, 1731, 1732, 1733, 1734, 1735, 1736};

--ĞèÒª´´½¨µÄrectÀàĞÍ´¥·¢Æ÷ÁĞ±í
--±íÄÚµÄÊı¾İ½á¹¹£ºÇ°ÊÇÅäÖÃÎÄ¼şÀïµÄID£¬ºóÊÇ´¥·¢Æ÷µÄID
rect_trigger_table_2 = {
    {1430, 2001},
    {1431, 2002},
    {1432, 2003},
    {1433, 2004},
    {1434, 2005},
    {1435, 2006},
    {1436, 2007}
};

--ÔËËÍÎï×Ê´ÓÑïÖİµ½ÏåÑô
--ĞÓ»¨´å£¬ãê¾©¸®ÄÏ£¬ãê¾©£¬ãê¾©¸®Î÷£¬ÉÙÁÖ£¬Áé±¦É½£¬ÏåÑô
path_table_3_index = {202, 201, 200, 203, 204, 218, 350};
path_table_3 = {1730, 1731, 1732, 1733, 1734, 1735, 1736};

--ĞèÒª´´½¨µÄrectÀàĞÍ´¥·¢Æ÷ÁĞ±í
--±íÄÚµÄÊı¾İ½á¹¹£ºÇ°ÊÇÅäÖÃÎÄ¼şÀïµÄID£¬ºóÊÇ´¥·¢Æ÷µÄID
rect_trigger_table_3 = {
    {1430, 2001},
    {1431, 2002},
    {1432, 2003},
    {1433, 2004},
    {1434, 2005},
    {1435, 2006},
    {1437, 2007}
};

--wk
rect_wk_table = {
    ["wk_20"] = {1420, 2003},
    ["wk_30"] = {1421, 2003},
    ["wk_40"] = {1422, 2003},
    ["wk_41"] = {1425, 2003},
    ["wk_50"] = {1423, 2003},
    ["wk_51"] = {1427, 2003},
    ["wk_60"] = {1424, 2003},
    ["wk_61"] = {1428, 2003},
    ["wk_70"] = {1429, 2003},
    ["wk_80"] = {1438, 2003}
};

log_wk_table = {400, 2004};

--boss
rect_boss_table = {
    {1426, 2015}    --³öµØÍ¼
};

log_boss_table = {401, 2016};
time_boss_table = {1001, 2017}

--É±¹ÖĞÍ´¥·¢Æ÷ÁĞ±í
kill_trigger_table = {
    ["all"] = {1000, 2000}, --É±ËùÓĞ¹Ö¶¼µôÂäÄ³ÖÖÎïÆ·µÄ´¥·¢Æ÷
    ["wk_20"] = {1001, 2002},   --É±ÙÁ¿Ü
    ["wk_30"] = {1002, 2002},
    ["wk_40"] = {1003, 2002},
    ["wk_41"] = {1006, 2002},
    ["wk_50"] = {1004, 2002},
    ["wk_51"] = {1007, 2002},
    ["wk_60"] = {1005, 2002},
    ["wk_61"] = {1008, 2002},
    ["wk_70"] = {1009, 2002},
    ["wk_80"] = {1010, 2002}
};

--Ê±¼äĞÍ´¥·¢Æ÷ÁĞ±í
time_trigger_table = {
    ["wk"] = {1000, 2001}   --É±ÙÁ¿Ü¼ÆÊ±
};

--Íæ¼Ò´«ËÍÎ»ÖÃ
maps_table = {
    ["wk_20"] = {951, 1341, 2849},       --É±ÙÁ¿ÜµØÍ¼
    ["wk_30"] = {952, 1341, 2849},
    ["wk_40"] = {953, 1341, 2849},
    ["wk_41"] = {956, 1341, 2849},
    ["wk_50"] = {954, 1341, 2849},
    ["wk_51"] = {957, 1341, 2849},
    ["wk_60"] = {955, 1341, 2849},
    ["wk_61"] = {958, 1341, 2849},
    ["wk_70"] = {959, 1341, 2849},
    ["wk_80"] = {960, 1341, 2849},
};

--¼ÇÂ¼Ã»ÓĞbossË¢ĞÂµÄµØÍ¼
no_boss_map_list = 
{
	100, 150, 200, 300, 350, 400
};

--callbossµÄµÀ¾ßÓëboss¶ÔÓ¦±í
boss_item_table = {
	[1] = {2,	0,	340},
	[2] = {2,	0,	341},
	[3] = {2,	0,	342},
	[4] = {2,	0,	343},
	[5] = {2,	0,	344},
	[6] = {2,	0,	345},
	[7] = {2,	0,	346},
	[8] = {2,	0,	347},
	[9] = {2,	0,	348}
};

--bossÊı¾İÁĞ±í
boss_data_table = {
    [1] = {
        ["name"] = "Vâ s­ ¦ng Qua",  --boss Ãû×Ö
        ["template"] = "Vâ s­ ¦ng Qua",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [2] = {
        ["name"] = "Vâ s­ §øc Di",  --boss Ãû×Ö
        ["template"] = "Vâ s­ §øc Di",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [3] = {
        ["name"] = "Vâ s­ Y §¹t",  --boss Ãû×Ö
        ["template"] = "Vâ s­ Y §¹t",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [4] = {
        ["name"] = "Vâ s­ bé l¹c Ngao Hung",  --boss Ãû×Ö
        ["template"] = "Vâ s­ Ngao §Şch",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [5] = {
        ["name"] = "Vâ s­ Ng¹c La",  --boss Ãû×Ö
        ["template"] = "Vâ s­ Ng¹c La",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [6] = {
        ["name"] = "Vâ s­ Ph¸p Lam",  --boss Ãû×Ö
        ["template"] = "Vâ s­ Ph¸p Lam",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [7] = {
        ["name"] = "Vâ s­ Mai Lîi",  --boss Ãû×Ö
        ["template"] = "Vâ s­ Mai Lîi",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [8] = {
        ["name"] = "Vâ s­ Y B¶n",  --boss Ãû×Ö
        ["template"] = "Vâ s­ Y B¶n",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    [9] = {
        ["name"] = "T©y Ma",          --boss Ãû×Ö
        ["template"] = "T©y Ma",  --boss Ä£°å
        ["script"] = "",            --boss ½Å±¾
        ["index"] = 0,              --boss index
    },
    ["MAXCOUNT"] = 9
};

--³ÆºÅ¶ÔÓ¦±í
title_table = {
	{7200, 2, 10},		--¿¹ÙÁ×ÜÔªË§
	{6000, 2, 9},		--¿¹ÙÁ´ó½«¾ü
	{4800, 2, 8},		--¿¹ÙÁÖ¸»ÓÊ¹
	{3600, 2, 7},		--¿¹ÙÁÃû½«
	{2400, 2, 6},		--¿¹ÙÁÓ¢ĞÛ
	{1200, 2, 5},		--¿¹ÙÁ¾«Ó¢
	{600 , 2, 4},		--¿¹ÙÁÓÂÊ¿
	{400 , 2, 3},		--¿¹ÙÁÏÈ·æ
	{200 , 2, 2},		--¿¹ÙÁÅ®ÏÀ
	{200 , 2, 1}		--¿¹ÙÁÏÀÊ¿
};

--·µ»ØĞÇÆÚ¼¸£¬0´ú±íĞÇÆÚÌì
function GetWeekDay()
	return tonumber(date("%w"))
end;

--·µ»Øµ±Ç°Ğ¡Ê±ºÍ·ÖÖÓ
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--19 - 23µã59·Ö
function CheckTime(day)

	--»î¶¯¿ª¹Ø
	if WEEKEND_SWITCH == 0 then
		return 0
	end;

	if day ~= GetWeekDay() then
		return 0
	end;
	
	local nBegin;
	local nEnd;
	if day == 0 then	--ÖÜÈÕÊÇÏÂÎç2£º00 - ÍíÉÏ10£º00
		nBegin = 14 * 60;
		nEnd = 22 * 60;
	else
		nBegin = 19 * 60;	--ÆäËûÈÕ×ÓÊÇÍíÉÏ7£º00µ½ÍíÉÏ12£º00
		nEnd = 24 * 60;
	end;
	
	local nHour, nMin = GetLocalTime();
	local nValue = nHour * 60 + nMin;
	if nValue >= nBegin and nValue <= nEnd then
		return 1
	else
		return 0
	end;
end;

function InitBoss()
    --time trigger
    CreateTrigger(1, time_boss_table[1], time_boss_table[2]);
    ContinueTimer(GetTrigger(time_boss_table[2]));
    --³õÊ¼»¯bossµÄrect´¥·¢Æ÷
    CreateTrigger(2, rect_boss_table[1][1], rect_boss_table[1][2]);
    --logout
    CreateTrigger(3, log_boss_table[1], log_boss_table[2]);
    SetLogType(1);
end;

function CreateBoss(bossIndex, nMapId, nX, nY) --CreateBoss£¬·µ»Ø±»´´½¨³öÀ´µÄbossË÷Òı£¬Ê§°Ü·µ»Ø0
	InitBoss();
    local npcIndex = CreateNpc(
                        boss_data_table[bossIndex]["template"],
                        boss_data_table[bossIndex]["name"],
                        nMapId, nX, nY
                     );
    SetNpcScript(npcIndex, szNpcScript);
    SetNpcLifeTime(npcIndex, 600);		  --10·ÖÖÓ
    SetTask(TASK_NPC_INDEX, npcIndex);    --¼ÇÂ¼ÕÙ»½³öÀ´µÄbossË÷Òı
    SetTask(TASK_BOSS_INDEX, bossIndex);
    return npcIndex
end;


function CallBoss(bossIndex)
	
	if (CheckTime(0) == 0 and CheckTime(6) == 0) then	--²»ÊÇĞÇÆÚÌìÒ²²»ÊÇĞÇÆÚÁù 
		Msg2Player("Ho¹t ®éng chØ më thø 7 vµ Chñ NhËt");
		return
	end;

	if GetFightState() == 0 then
		Msg2Player("Vâ s­ ngo¹i téc kh«ng xuÊt hiÖn ë ®©y");
		return
	end;

    local nMapId, nX, nY = GetWorldPos();
    if nMapId >= 700 then
		Msg2Player("Vâ s­ ngo¹i téc kh«ng xuÊt hiÖn ë ®©y");
        return
    end;
    for index, value in no_boss_map_list do
        if nMapId == value then
        	Msg2Player("Vâ s­ ngo¹i téc kh«ng xuÊt hiÖn ë ®©y");
        	return
        end;
    end;
    
    --ĞŞ¸´´¥·¢Æ÷¶ªÊ§Ôì³ÉµÄ²»ÄÜÕÙ»½bossµÄÇé¿ö
    if GetTask(TASK_NPC_INDEX) ~= 0 and GetTrigger(time_boss_table[2]) == 0 then
    	SetTask(TASK_NPC_INDEX, 0);
    end;
   	--Í¬Ò»Ê±¼äÖ»ÄÜÕÙ»½Ò»¸ö
	if GetTask(TASK_NPC_INDEX) ~= 0 then
		Msg2Player("§¸nh b¹i vâ s­ ngo¹i téc ®i!");
		return
	end;
	
	local IsEixst = DelItem(boss_item_table[bossIndex][1], boss_item_table[bossIndex][2], boss_item_table[bossIndex][3], 1);
	if IsEixst ~= 1 then
		return
	end;
	CreateBoss(bossIndex, nMapId, nX, nY);
	--³É¹¦ÕÙ»½bossºóÉ¾³ıµÀ¾ß
	
	Msg2Player("Vâ sÜ ngo¹i téc ®· xuÊt hiÖn, mau ®i ®¸nh b¹i chóng!");
	TaskTip("Vâ sÜ ngo¹i téc ®· xuÊt hiÖn, mau ®i ®¸nh b¹i chóng!");
end;

--·µ»Øµ±Ç°ÊÇ¾àÀë2005Äê1ÔÂÒ»ºÅµÄµÚ¼¸Ìì
function GetDay()
	local nYear = date("%Y");
	local nDay = tonumber(date("%j"));
	return nDay + (nYear - 2005) * 365
end;

function AddPlayerPoint(nPoint)	--¸øÓëplayer°²°î¹¦ÀÍÖµ
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	
	if (nTime - nLastTime) > 2 then		--²»ÊÇÕâ¸öĞÇÆÚ±ä¶¯µÄ
		local nVv = GetTask(TASK_POINT)
		SetTask(TASK_POINT, 0)
		if GetTask(TASK_IB_BOOK2) == 1 then	-- Èç¹ûÊ¹ÓÃÁËÎ¯ÈÎÊé
			SetTask(TASK_POINT, nVv)
			SetTask(TASK_IB_BOOK2, 0)
		end
		
		if nPoint <= 0 then
			return
		end;
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_POINT, GetTask(TASK_POINT) + nPoint);
	
	--¸øÓëÍæ¼Ò³ÆºÅ
	n = GetTask(TASK_POINT);
	RemoveAllTitle();
	
	for index, value in title_table do
		if n >= value[1] then
			if value[1] == 200 and GetSex() == 1 then
				AddTitle(2, 1);
				SetCurTitle(2, 1);
			elseif value[1] == 200 and GetSex() == 2 then
				AddTitle(2, 2);
				SetCurTitle(2, 2);
			else
				AddTitle(value[2], value[3]);
				SetCurTitle(value[2], value[3]);
			end;
			break
		end;
	end;
end;

function RemoveAllTitle()
	for index, value in title_table do
		RemoveTitle(value[2], value[3]);
	end;
end;

function AddKillWkTimes(nTimes)
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	if (nTime - nLastTime) > 2 then		--²»ÊÇÕâ¸öĞÇÆÚ±ä¶¯µÄ
		SetTask(TASK_GQ_KILLWK_TIMES, 0);
		if nTimes <= 0 then
			return
		end;
	end;
	SetTask(TASK_POINT_TIME, nTime);
	SetTask(TASK_GQ_KILLWK_TIMES, GetTask(TASK_GQ_KILLWK_TIMES) + nTimes);
end;

function QueryTimes()
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	if (nTime - nLastTime) > 2 then		--²»ÊÇÕâ¸öĞÇÆÚ±ä¶¯µÄ
		SetTask(TASK_GQ_KILLWK_TIMES, 0);
	end;
	return GetTask(TASK_GQ_KILLWK_TIMES);
end;

function QueryPoint()
	local nLastTime = GetTask(TASK_POINT_TIME);
	local nTime = GetDay();
	local nVv = GetTask(TASK_POINT)
	if (nTime - nLastTime) > 2 then		--²»ÊÇÕâ¸öĞÇÆÚ±ä¶¯µÄ
		nVv = 0
		if GetTask(TASK_IB_BOOK2) == 1 then
			nVv = GetTask(TASK_POINT)
		end
	end
	--¸øÓëÍæ¼Ò³ÆºÅ
	n = nVv
	RemoveAllTitle();
	
	for index, value in title_table do
		if n >= value[1] then
			if value[1] == 200 and GetSex() == 1 then
				AddTitle(2, 1);
				SetCurTitle(2, 1);
			elseif value[1] == 200 and GetSex() == 2 then
				AddTitle(2, 2);
				SetCurTitle(2, 2);
			else
				AddTitle(value[2], value[3]);
				SetCurTitle(value[2], value[3]);
			end;
			break
		end;
	end;
	
	return nVv
end;

function SetLaskEnterTime()
	local nDay = GetDay();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));

	local nCoolDown = nDay * 24 * 3600 + nHour * 3600 + nMin * 60 + nSec;
	SetTask(TASK_COOLDOWN, nCoolDown);
end;

function GetCooldownTime(nCDTime)
	local nTime = GetTask(TASK_COOLDOWN);
	local nDay = GetDay();
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nSec = tonumber(date("%S"));

	return nCDTime - (nDay * 24 * 3600 + nHour * 3600 + nMin * 60 + nSec - nTime)
end;

function Add240Times()
	local nNow = GetDay();
	local nDay = GetTask(TASK_240_DAYS);
	if nNow ~= nDay then
		SetTask(TASK_240_TIMES, 0);		--²»ÊÇÍ¬Ò»Ìì£¬»Ø0
		SetTask(TASK_240_DAYS, nNow);
	end;
	if GetTask(TASK_240_TIMES) >= 3 then
		return 0
	else
		SetTask(TASK_240_TIMES, GetTask(TASK_240_TIMES) + 1);
		return 1
	end;
end;

function Check240Time()
	local nNow = GetDay();
	local nDay = GetTask(TASK_240_DAYS);
	if nNow ~= nDay then
		SetTask(TASK_240_TIMES, 0);		--²»ÊÇÍ¬Ò»Ìì£¬»Ø0
	end;
end;

function is_exist(t)
    local nExist = 0;
    for index, value in t do
        if GetItemCount(value[1], value[2], value[3]) >= 1 then
            nExist = 1;
            break
        end;
    end;
    return nExist
end;