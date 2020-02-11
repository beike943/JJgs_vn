ZQ_MAP_ID = 6026; --µØÍ¼ID

ZQ_ITEM_IB = {2, 1, 30481, "Ma Th¹ch"} --ºËÐÄIBµÀ¾ß

--¼ÇÂ¼¾ü¹¦ÖµµÄÈÎÎñ±äÁ¿
ZQ_CONST_JG_TASK = 701;

--ÕóÓªindex
ALL_ID = 0;
SONG_ID = 1;
LIAO_ID = 2;

ZQ_tCampString = {
	[ALL_ID] = "camp_evil",
	[SONG_ID] = "camp_player",
	[LIAO_ID] = "camp_enemy",
}

ZQ_TICKET_CAST = 90000; --ÃÅÆ±

ZQ_ITEM_FLAG = {
	[SONG_ID] = {2, 1, 30478, "Tèng Qu©n TruyÒn LÖnh Kú"},
	[LIAO_ID] = {2, 1, 30479, "Liªu Qu©n TruyÒn LÖnh Kú"},
}

ZQ_EXIT_POS = {300, 1802, 3364}  --ÍË³öµã

--ÆµµÀ
ZQ_BATTLE_CHANNEL = {
	[ALL_ID] = {"Kªnh chiÕn tr­êng", 39},
	[SONG_ID] = {"Kªnh Tèng", 40},
	[LIAO_ID] = {"Kªnh Liªu", 41},
}

--²É¼¯µÀ¾ß
ZQ_CAIJI_ITEM = {
	{0, 200, 14, "ThiÕt phñ", 5000},
	{0, 200, 11, "Cuèc chim", 5000},
	{0, 200, 16, "Cuèc thuèc", 5000},
}

--log
ZQ_szLogTitle = "zhenqi_battle";

--===============ÕæÆøÕ½³¡Ê¹ÓÃµÄÈÎÎñ±äÁ¿============================================
ZQ_BATTLE_TASK1 = 3117 --µÚÒ»×Ö½Ú¼ÇÂ¼µ±Ç°µÄÕóÓª,9-30¼ÇÂ¼ÈÎÎñ£¬31¼ÇÂ¼ÕóÁé¼ÆÊýÉúÐ§
ZQ_BATTLE_TASK2 = 3118 --1-20¼ÇÂ¼ÈÎÎñ,21,22±íÊ¾µ±Ç°ÐÞ¸´ÕóÁéµÄ´ÎÊý£¬23¼ÇÂ¼ÊÇ·ñ²Î¼ÓÐ°Áé¶ÄÔ¼,24±íÊ¾ÊÇ·ñ²Î¼ÓÖØÆô·âÓ¡,25,26,27±íÊ¾ÐÞ¸´ËùÓÃµÄÄ§Ê¯ÊýÄ¿,28,29¼ÇÂ¼ÂòÄÄÒ»¸ö²É¼¯µÀ¾ß£¬30¼ÇÂ¼ÊÇ·ñ²Î¼ÓÊØÎÀÕóÁé£¬31¼ÇÂ¼ÊÇ·ñ²Î¼ÓÐÞ¸´ÕóÁé
ZQ_BATTLE_TASK3 = 3119 --1-3×Ö½Ú¼ÇÂ¼²É¼¯ÊÇµã»÷µÄµÀ¾ßµÄIndex,µÚ4×Ö½Ú¼ÇÂ¼´¥·¢Æ÷¼ÆÊý
ZQ_BATTLE_TASK4 = 3120 --µÚ1,2×Ö½Ú¼ÇÂ¼µ±Ç°²É¼¯µÄX×ø±ê£¬µÚ3,4×Ö½Ú¼ÇÂ¼X×ø±ê£¬
ZQ_BATTLE_TASK5 = 3121 --¼ÇÂ¼²É¼¯Ä¿±êµÄnpcË÷Òý
ZQ_BATTLE_TASK6 = 3122 --µÚ1×Ö½ÚÊØÎÀ·âÓ¡É±¹ÖÊý,9Î»¼ÇÂ¼ÊÇ·ñÊÇIBÄ£Ê½£¬10,15¼ÇÂ¼²ÎÓëÐ¡ÓÎÏ·µÄ´ÎÊý£¬16±íÊ¾µã»÷NPCÉúÐ§£¬3¡¢4¼ÇÂ¼µÚ1¸öÄ¿±êµÄtable index
ZQ_BATTLE_TASK7 = 3124 --1,2¼ÇÂ¼µÚ2¸öÄ¿±êµÄtable index£¬3,4¼ÇÂ¼µÚÈý¸öÄ¿±êtable index
ZQ_BATTLE_TASK8 = 3125 --µÚÒ»×Ö½Ú±íÊ¾µ±Ç°²ÂÈ­µÄ´ÎÊý,µÚ2¸ö×Ö½Ú±íÊ¾ÖØÆô·âÓ¡µÄ´ÎÊý,µÚÈý×Ö½Ú±íÊ¾µ±Ç°ÒªÖØÆôµÄtableidx£¬25-27±íÊ¾ÐÞ¸´½á¹û,29Î»±íÊ¾ÊÇ·ñÕýÔÚÖØÆôÒ»¸ö·âÓ¡£¬30Î»±íÊ¾ÊÇ·ñÖØÆôÔÚ¶ÁÌõ,31ÖØÆô·âÓ¡ÊÇ·ñÀÏ°åÄ£Ê½
ZQ_BATTLE_TASK9 = 3126 --µÚÒ»¶þ×Ö½Ú±íÊ¾ÊØÎÀ·âÓ¡Ê±¼ä¼ÆÊý£¬µÚÈýËÄ×Ö½Ú¼ÇÂ¼ÐÞ¸´ÕóÁéµÄtimer¼ÆÊý
ZQ_BATTLE_TASK10 = 3127 --¼ÇÂ¼½øÈëÐ¡¹Ø¿¨Ç°µÄÎ»ÖÃ
ZQ_BATTLE_TASK11 = 3128 --µÚÒ»¶þ×Ö½Ú±íÊ¾Ð¡¹Ø¿¨¼ÆÊ±Æ÷,17Îª±íÊ¾²Î¼Ó¹Ø¿¨µÄ±ê¼Ç

--ÈÎÎñ
ZQ_TASK_LIST = {
	[1] = {
		--{ÈÎÎñID£¬ÈÎÎñ±äÁ¿£¬ÊÇ·ñ¿ª·Å£¬ÊÇ·ñÒÑ½Ó}
		[1] = {111, ZQ_BATTLE_TASK1, 9, 10, "An Ninh"},
		[2] = {112, ZQ_BATTLE_TASK1, 11, 12, "Tiªu nh­îc qu©n Liªu"},
		[3] = {113, ZQ_BATTLE_TASK1, 13, 14, "GÆp ma"},
		[4] = {114, ZQ_BATTLE_TASK1, 15, 16, "Thanh trõ c¶n trë"},
		[5] = {115, ZQ_BATTLE_TASK1, 17, 18, "T«n nghiªm cña ng­êi chÕt"},
	},

	[2] = {
		[1] = {116, ZQ_BATTLE_TASK1, 19, 20, "QuÐt dän c¶n trë"},
		[2] = {117, ZQ_BATTLE_TASK1, 21, 22, "QuyÕt diÖt qu©n Tèng"},
		[3] = {118, ZQ_BATTLE_TASK1, 23, 24, "ThÊt thÕ"},
		[4] = {119, ZQ_BATTLE_TASK1, 25, 26, "NiÒm vinh dù cña thÞ téc"},
		[5] = {120, ZQ_BATTLE_TASK1, 27, 28, "SØ nhôc"},	
	},

	[3] = {
		[1] = {121, ZQ_BATTLE_TASK1, 29, 30, "Hån Quy Cè H­¬ng"},	
		[2] = {122, ZQ_BATTLE_TASK2, 1, 2, "L­¬ng d­îc phèi ph­¬ng 1"},
		[3] = {123, ZQ_BATTLE_TASK2, 3, 4, "L­¬ng d­îc phèi ph­¬ng 2"},
		[4] = {124, ZQ_BATTLE_TASK2, 5, 6, "Cøu trÞ th­¬ng binh"},
	},

	[4] = {
		[1] = {125, ZQ_BATTLE_TASK2, 7, 8, "Siªu ®é vong hån"},	
		[2] = {126, ZQ_BATTLE_TASK2, 9, 10, "Nguyªn liÖu ®¬n d­îc 1 "},
		[3] = {127, ZQ_BATTLE_TASK2, 11, 12, "Nguyªn liÖu ®¬n d­îc 2"},
		[4] = {128, ZQ_BATTLE_TASK2, 13, 14, "Dòng gi¶ bÊt tö"},
	},

	[5] = {
		[1] = {129, ZQ_BATTLE_TASK2, 15, 16, "ThÊt tinh hoa"},	
		[2] = {130, ZQ_BATTLE_TASK2, 17, 18, "Tö Kim Méc"},
		[3] = {131, ZQ_BATTLE_TASK2, 19, 20, "Kho¸n tinh thiÕt"},
	},
}

ZQ_TASK_TOTAL = 5;

--ÈÎÎñÊ¹ÓÃµÄÈÎÎñ±äÁ¿
ZQ_KILL_PLAYER_SONG = 3113;
ZQ_KILL_PLAYER_LIAO = 3114;
ZQ_CURE_SONG = 3115;
ZQ_CURE_LIAO = 3116;

--²É¼¯
ZQ_TASK_QXH = 3129;
ZQ_TASK_ZJM = 3130;
ZQ_TASK_JTK = 3131;

--×î´ó»÷É±ÊýÄ¿
ZQ_KILL_PLAYER_SONG_MAX_COUNT = 10;
ZQ_KILL_PLAYER_LIAO_MAX_COUNT = 10;
--×î´óÖÎÓúÊýÁ¿
ZQ_CURE_SONG_MAX_COUNT = 3;
ZQ_CURE_LIAO_MAX_COUNT = 3;

--Íæ¼ÒËÀÍö½Å±¾
ZQ_PLAYER_DEATH_SCRIPT = "\\script\\function\\zq_battles\\zq_player_death.lua";

--ÓÐÈÎÎñ»÷É±Íæ¼Ò»ñµÃÕæÆø
ZQ_TASK_KILLPLAYER_AWARD = 5;

--²É¼¯±í
ZQ_GATHER_LIST = {
		--{"¹¤¾ß", "ÈÎÎñ", "ÐèÏûºÄµÄÄÍ¾Ã", "»ñµÃµÄÎïÆ·", "ÏûºÄÄÍ¾ÃµÄµÀ¾ß", "²É¼¯ÌØÐ§"£¬"²É¼¯´ÎÊýÈÎÎñ±äÁ¿¼ÇÂ¼"}
		["Tö Kim Méc"] = {"ThiÕt phñ", 130, 10, {2, 1, 30461, 1}, {0, 200, 14}, 1, ZQ_TASK_ZJM},
		["Kho¸n tinh thiÕt"] = {"Cuèc chim", 131, 10, {2, 1, 30462, 1}, {0, 200, 11}, 3, ZQ_TASK_JTK},
		["ThÊt tinh hoa"] = {"Cuèc thuèc", 129, 10, {2, 1, 30463, 1}, {0, 200, 16}, 4, ZQ_TASK_QXH},	
}

--²É¼¯¶ÁÌõµÄÊ±¼äs
ZQ_GATHER_TIME = 3;

--¿ªÆô²¹¸ø°ü»¨·Ñ
ZQ_OPEN_PAK_COST_L1 = 0;
ZQ_OPEN_PAK_COST_L2 = 8;
ZQ_OPEN_PAK_COST_L3 = 25;

--ÌìÃÅÕó²¹¸øÏä½±Àø±í
ZQ_TMZ_PAK_AWARD = {
	--±ØµÃ½±Àø
	ConstAward = {
		[ZQ_OPEN_PAK_COST_L1] = {
			{2, 33, 150000, 1},
			{28, 33, 25, 1},
			{32, 34, 30, 1},
		},
		[ZQ_OPEN_PAK_COST_L2] = {
			{1, 25, "Ma Th¹ch", {2, 1, 30481, 1}, 0},
   		{2, 25, 400000, 1},
   		{28, 25, 100, 1},
   		{32, 25, 150, 1},
		},
		[ZQ_OPEN_PAK_COST_L3] = {
			{1, 25, "Ma Th¹ch", {2, 1, 30481, 2}, 0},
   		{2, 25, 800000, 1},
   		{28, 25, 200, 1},
   		{32, 25, 300, 1},
		},
	},
	--Ëæ»ú½±Àø
	RandomAward = {
		[ZQ_OPEN_PAK_COST_L1] = {
			{1, 20, "Ma Th¹ch", {2, 1, 30481, 1}, 0},
			{3, 5, 10000, 1},
			{3, 10, 20000, 1},
			{3, 5, 40000, 1},
			{27, 10, 150, 1},
			{27, 5, 300, 1},
			{27, 5, 450, 1},
			{4, 5, 1, 1},
			{4, 10, 2, 1},
			{4, 5, 3, 1},
			{5, 5, 2, 1},
			{5, 10, 4, 1},
			{5, 5, 6, 1},
		},
		[ZQ_OPEN_PAK_COST_L2] = {
			{1, 10, "Ma Th¹ch", {2, 1, 30481, 1}, 0},
			{3, 8, 20000, 1},
			{3, 4, 40000, 1},
			{3, 1, 80000, 1},
			{27, 20, 200, 1},
			{27, 8, 400, 1},
			{27, 2, 600, 1},
			{4, 18, 2, 1},
			{4, 8, 3, 1},
			{4, 2, 4, 1},
			{5, 10, 3, 1},
			{5, 7, 6, 1},
			{5, 2, 9, 1},
		},
		[ZQ_OPEN_PAK_COST_L3] = {
			{1, 10, "Ma Th¹ch", {2, 1, 30481, 1}, 0},
			{3, 8, 40000, 1},
			{3, 4, 80000, 1},
			{3, 1, 120000, 1},
			{27, 20, 300, 1},
			{27, 8, 600, 1},
			{27, 2, 900, 1},
			{4, 18, 3, 1},
			{4, 8, 4, 1},
			{4, 2, 5, 1},
			{5, 10, 4, 1},
			{5, 7, 8, 1},
			{5, 2, 12, 1},
		},
	},		
}

--ÐÞ¸´·âÓ¡NPC±í
ZQ_REPAIRREAL_NPC = {
	{"B¹ch Tª Gi¸c", "ZM_baixijiao",	1631, 3289},
	{"Kim V­¬ng Gi¸p", "ZM_jinwangjia",	1610, 3266},
	{"Th¸i S¬ MÖnh Th¹ch", "ZM_taichumingshi",	1578, 3290},
	{"Hång TrÇn T¬", "ZM_hongchensi",	1577, 3325},
	{"¢m TrÇm Méc", "ZM_chenyinmu",	1628, 3284},
	{"Lam BÝch Th¹ch", "ZM_lanbishi",	1606, 3271},
	{"Hæ Sa B×", "ZM_hushapi",	1574, 3294},
	{"Kª HuyÕt Th¹ch", "ZM_jixueshi",	1581, 3329},
	{"§¹i La Tinh Kim", "ZM_dalujinjin",	1629, 3279},
	{"TuyÕt Tinh", "ZM_xuejing",	1602, 3274},
	{"K×nh V­¬ng §an", "ZM_jingwangdan",	1570, 3298},
	{"H¾c V¨n Long Kim", "ZM_heiwenlongjin",	1584, 3333},
	{"B¨ng Tinh Th¹ch", "ZM_binjingshi",	1633, 3282},
	{"V« Cùc ThiÕt", "ZM_wujitie",	1607, 3276},
	{"Yªu Hãa Cèt", "ZM_yaohuagu",	1574, 3301},
	{"Tiªn Lôc LÖ Tinh", "ZM_xianlvleijing",	1585, 3323},
	{"Tö Linh Thñy Tinh", "ZM_zilingshuijin",	1635, 3285},
	{"Linh Cèt Ngäc", "ZM_lingguyu",	1611, 3273},
	{"V« C¨n §»ng", "ZM_wugenteng",	1578, 3296},
	{"V¹n Niªn Yªu §¬n", "ZM_wannianyaodan",	1582, 3321},
}

ZQ_JMZL_NPC_NAME = "<color=green>C¶nh M«n TrËn Linh:<color>"
ZQ_FIND_GOAL_TIME = 20 --Ñ°ÕÒÄ¿±êµÄÊ±¼äs
ZQ_SEAL_EX_TIME = 20 --Ê¹ÓÃÄ§Ê¯ÑÓ³¤µÄÊ±¼äs
ZQ_SEAL_USE_MAX = 5 --Ä§Ê¯Ê¹ÓÃµÄ×î´óÖµ
ZQ_SEAL_START_TIME = (ceil((ZQ_FIND_GOAL_TIME + ZQ_SEAL_EX_TIME*ZQ_SEAL_USE_MAX) / 10) + 1) * 10 --ÕóÁé¿ªÆôÊ±¼äs (ZQ_SEAL_START_TIME > ZQ_FIND_GOAL_TIME)
ZQ_REPAIRREAL_TIME_MAX = 30000; --Ê±¼ä´¥·¢Æ÷×î´ó¼ÆÊý

--¾°ÃÅ·âÓ¡½±Àø
ZQ_REPAIRREAL_AWARD = {
	--{ÕæÆø£¬ ¾­Ñé}
	[1] = {20, 100000, 1},
	[2] = {40, 200000, 1},
	[3] = {100, 500000, 1},
	--±£µ×½±Àø
	[4] = {10, 50000, 0},
};

ZQ_REPAIRREAL_COUNT_MAX = 3; --×î´óÐÞ¸´´ÎÊý


ZQ_OUTER_EXITPOS = {
	[SONG_ID] = {1582, 3792},
	[LIAO_ID] = {1905, 3288},
}

ZQ_JOIN_GAME_TIMES_MAX = 8; --Ò»Ìì×î´ó²Î¼ûÐ¡ÓÎÏ·µÄ´ÎÊý


--Ð°Áé¶ÄÔ¼½±Àø
ZQ_EVILBET_AWARD = {
	[1] = {40, 100000, 1},
	[2] = {80, 200000, 2},
	[3] = {160, 400000, 3},
	[4] = {320, 800000, 4},
	[5] = {640, 1600000, 5},
	[6] = {1280, 3200000, 6},	
	--±£µ×½±Àø
	[7] = {10, 50000, 0},
}

--ÖØÆô·âÓ¡
ZQ_RESTART_REAL_NPC = {
	--1
	[1] = {"Kh¶m", "ZM_fengyinkan", 1580, 3465},
	[2] = {"CÊn", "ZM_fengyinken", 1566, 3492},
	[3] = {"Kh«n", "ZM_fengyinshen", 1545, 3501},
	--2
	[4] = {"§oµi", "ZM_fengyindui", 1532, 3450},
	[5] = {"Cµn", "ZM_fengyinqian", 1551, 3434},
	[6] = {"Tèn", "ZM_fengyinyi", 1571, 3441},
	--3
	[7] = {"ChÊn", "ZM_fengyinzhen", 1523, 3494},
	[8] = {"Ly", "ZM_fengyinli", 1517, 3470},	
}

ZQ_RESTART_JIGUAN_NPC = {
	{"C¬ quan", "ZM_jiguan1", 1572, 3490},
	{"C¬ quan", "ZM_jiguan2", 1580, 3491},
	{"C¬ quan", "ZM_jiguan1", 1584, 3477},
	{"C¬ quan", "ZM_jiguan2", 1593, 3475},
	{"C¬ quan", "ZM_jiguan1", 1590, 3464},
	{"C¬ quan", "ZM_jiguan2", 1582, 3448},
	{"C¬ quan", "ZM_jiguan1", 1577, 3434},
	{"C¬ quan", "ZM_jiguan2", 1566, 3427},
	{"C¬ quan", "ZM_jiguan1", 1559, 3439},
	{"C¬ quan", "ZM_jiguan2", 1561, 3453},
	{"C¬ quan", "ZM_jiguan1", 1573, 3456},
	{"C¬ quan", "ZM_jiguan2", 1574, 3471},
	{"C¬ quan", "ZM_jiguan1", 1566, 3467},
	{"C¬ quan", "ZM_jiguan2", 1601, 3458},
	{"C¬ quan", "ZM_jiguan3", 1543, 3431},
	{"C¬ quan", "ZM_jiguan1", 1542, 3455},
	{"C¬ quan", "ZM_jiguan4", 1528, 3443},
	{"C¬ quan", "ZM_jiguan2", 1524, 3454},
	{"C¬ quan", "ZM_jiguan1", 1530, 3462},
	{"C¬ quan", "ZM_jiguan2", 1536, 3467},
	{"C¬ quan", "ZM_jiguan1", 1533, 3477},
	{"C¬ quan", "ZM_jiguan2", 1524, 3468},
	{"C¬ quan", "ZM_jiguan1", 1515, 3460},
	{"C¬ quan", "ZM_jiguan3", 1508, 3473},
	{"C¬ quan", "ZM_jiguan2", 1515, 3486},
	{"C¬ quan", "ZM_jiguan3", 1525, 3481},
	{"C¬ quan", "ZM_jiguan4", 1542, 3479},
	{"C¬ quan", "ZM_jiguan3", 1532, 3490},
	{"C¬ quan", "ZM_jiguan4", 1514, 3501},
	{"C¬ quan", "ZM_jiguan3", 1521, 3511},
	{"C¬ quan", "ZM_jiguan4", 1532, 3519},
	{"C¬ quan", "ZM_jiguan1", 1541, 3506},
	{"C¬ quan", "ZM_jiguan2", 1541, 3494},
	{"C¬ quan", "ZM_jiguan1", 1548, 3520},
	{"C¬ quan", "ZM_jiguan2", 1556, 3505},
	{"C¬ quan", "ZM_jiguan1", 1553, 3493},
	{"C¬ quan", "ZM_jiguan2", 1551, 3485},
	{"C¬ quan", "ZM_jiguan1", 1559, 3479},
}

ZQ_SMZL_NPC_NAME = "<color=green>Tö M«n TrËn Linh: <color>";

ZQ_RESTARTSEAL_DIS_MAX = 50; --Ó¦¸Ã±£³ÖµÄ×î´ó¾àÀë

ZQ_RESTARTSEAL_PROGRESS_TIME = 10 * 18;  --ÖØÆô·âÓ¡Ê±¼ä10s

ZQ_RESTARTSEAL_ITEM = {2, 1, 30496, "Tö Linh LÖnh"};

ZQ_RESTARTSEAL_COUNT_MAX = 3; --×î´óÖØÆôÊýÄ¿

ZQ_RESTARTSEAL_AWARD = {
	[1] = {20, 100000, 1},
	[2] = {40, 200000, 1},
	[3] = {100, 500000, 1},
	--ÕâÀïÊÇ±£µ×½±Àø
	[4] = {10, 50000, 0},
}

ZQ_MMZL_NPC_NAME = "<color=green>DiÖt M«n TrËn Linh: <color>";

ZQ_PROTECTSEAL_MAP_TASKTEMP = 1; --6026,1ºÅ±äÁ¿¼ÇÂ¼ÊØÎÀ·âÓ¡£¬ÊÇ·ñÓÐÈËÔÚ½øÐÐ

ZQ_PROTECTSEAL_TIME_TOTLE = 5 * 60; --Ò»³¡³ÖÐøÊ±¼äÉÏÏÞ

ZQ_MMZL_NPC_TABLE = {
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1913, 3574},
	{"Qu¸i vËt", "ZM_guaiwu2", 1898, 3588},
	{"Qu¸i vËt", "ZM_guaiwu3", 1886, 3562},
	{"Qu¸i vËt", "ZM_guaiwu4", 1901, 3544},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1913, 3574},
	{"Qu¸i vËt", "ZM_guaiwu2", 1898, 3588},
	{"Qu¸i vËt", "ZM_guaiwu3", 1886, 3562},
	{"Qu¸i vËt", "ZM_guaiwu4", 1901, 3544},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1913, 3574},
	{"Qu¸i vËt", "ZM_guaiwu2", 1898, 3588},
	{"Qu¸i vËt", "ZM_guaiwu3", 1886, 3562},
	{"Qu¸i vËt", "ZM_guaiwu4", 1901, 3544},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1913, 3574},
	{"Qu¸i vËt", "ZM_guaiwu2", 1898, 3588},
	{"Qu¸i vËt", "ZM_guaiwu3", 1886, 3562},
	{"Qu¸i vËt", "ZM_guaiwu4", 1901, 3544},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
	{"Qu¸i vËt", "ZM_guaiwu1", 1913, 3574},
	{"Qu¸i vËt", "ZM_guaiwu2", 1898, 3588},
	{"Qu¸i vËt", "ZM_guaiwu3", 1886, 3562},
	{"Qu¸i vËt", "ZM_guaiwu4", 1901, 3544},
	{"Qu¸i vËt", "ZM_guaiwu1", 1887, 3533},
	{"Qu¸i vËt", "ZM_guaiwu2", 1902, 3519},
	{"Qu¸i vËt", "ZM_guaiwu3", 1919, 3542},
	{"Qu¸i vËt", "ZM_guaiwu4", 1930, 3558},
}

ZQ_PROTECTSEAL_KILL_MIN = 10; --É±¹ÖÏÂÏÞ

ZQ_PROTECTSEAL_AWARD = {
	[1] = {ZQ_PROTECTSEAL_KILL_MIN, 20, 100000, 1},
	[2] = {20, 40, 200000, 2},
	[3] = {40, 100, 500000, 3},
	[4] = {100, 200, 1000000, 4},
		--±£µ×½±Àø
	[5] = {10000, 10, 50000, 0},
}

ZQ_PLAYER_DEATH_TAG = 9999; --Íæ¼ÒËÀÍö±ê¼Ç

ZQ_COPY_TIME_MAX = 10 * 60; --¹Ø¿¨³ÖÐøÊ±¼ä




