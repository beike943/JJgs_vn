--TEST Select------------
DebugOutput = nothing
TF_ISFORTEST = 0
-------------------------

TF_SWITH = 1;

TF_NPC_POS = {
	[1] = {
		[1] = {205, 1643, 2947, "§«ng BiÖn Kinh (229,188)"},
		[2] = {205, 1609, 2992, "§«ng BiÖn Kinh (201,18B¶y)"},
		[3] = {205, 1705, 2914, "§«ng BiÖn Kinh (213,181)"},	
	},                      
	[2] = {                 
		[1] = {201, 1587, 3015, "Nam BiÖn Kinh (198,188)"},
		[2] = {201, 1512, 3024, "Nam BiÖn Kinh (189,189)"},
		[3] = {201, 1535, 2934, "Nam BiÖn Kinh (191,183)"},	
	},                       
	[3] = {                 
		[1] = {203, 1520, 2945, "T©y BiÖn Kinh (190,184)"},
		[2] = {203, 1555, 2959, "T©y BiÖn Kinh (194,184)"},
		[3] = {203, 1497, 3054, "T©y BiÖn Kinh (18B¶y,190)"},	
	},                      
	[4] = {                 
		[1] = {105, 1560, 3108, "T©y TuyÒn Ch©u (183,18B¶y)"},
		[2] = {105, 1526, 3172, "T©y TuyÒn Ch©u (190,198)"},
		[3] = {105, 1496, 3088, "T©y TuyÒn Ch©u (18B¶y,193)"},	
	},                      
	[5] = {                 
		[1] = {108, 1456, 2960, "B¾c TuyÒn Ch©u (182,185)"},
		[2] = {108, 1511, 3024, "B¾c TuyÒn Ch©u (189,189)"},
		[3] = {108, 1454, 3100, "B¾c TuyÒn Ch©u (182,193)"},	
	},                      
	[6] = {                 
		[1] = {304, 1448, 2974, "Nam Thµnh §« (181,186)"},
		[2] = {304, 1496, 2912, "Nam Thµnh §« (18B¶y,182)"},
		[3] = {304, 1525, 2853, "Nam Thµnh §« (186,18B¶y)"},	
	},                      
	[7] = {                 
		[1] = {301, 1518, 3027, "T©y Thµnh §« (189,189)"},
		[2] = {301, 1574, 3015, "T©y Thµnh §« (196,188)"},
		[3] = {301, 1582, 3084, "T©y Thµnh §« (19B¶y,192)"},	
	},                      
	[8] = {                 
		[1] = {308, 1464, 3105, "B¾c Thµnh §« (183,194)"},
		[2] = {308, 1536, 3184, "B¾c Thµnh §« (192,199)"},
		[3] = {308, 1493, 3162, "B¾c Thµnh §« (196,195)"},	
	},
}

TF_NPC_POS_OFFSET = {
	[1] = {-4,4},
	[2] = {4,4},
	[3] = {4,-4},	
	[4] = {-4,-4},
	[5] = {-4,8},
	[6] = {4,8},
	[7] = {8,4},
	[8] = {8,-4},
	[9] = {4,-8},
	[10] = {-4,-8},
	[11] = {-8,-4},
	[12] = {-8,4},
	[13] = {-8,8},
	[14] = {8,8},
	[15] = {8,-8},
	[16] = {-8,-8},
}


TF_HANG_IN_FOOD_MAX = 1500;
TF_CHEF_NUM_MAX = 24;
TF_TOAST_USE_CD = 90;--s
TF_HAND_IN_MAX = 720;--µ¥ÀàÉÏ½»×î´óÊýÁ¿

--RelayShareData------------------------------
TF_FEAST_CHEF = "_TF_CHEF_";
-- 0, 0 [TongName] = x, y, timestramp, 0 or 1;npc×ø±ê£¬Ê±¼ä´Á£¬ÊÇ·ñ¿ª²Í 4
-- 0, 1 [TongName] = 0 or 1;µ±ÌìÊÇ·ñÒÑ²Î¼Ó¹ý 1,2ÖÆ×÷Ê§°Ü
-- 0, 2 [TongName] = npcIndex * 16£»×À×ÓµÄnpc index(RelayShare×î¶à16¸öÊý¾Ý) 16
-- 0, 3	[TongName] = nPig, nCow, nSheep, nBacon, nWine, nTc, nCooker, nTableware£»Ê³²Ä£¬ÃÀ¾Æ£¬×ÀÒÎ£¬´¶¾ß£¬²Í¾ß 8
-- 0, 4 [npcIndex] = PlayerIndex * 10 10
TF_SHAREDATA_STRING00 = "dddd";
TF_SHAREDATA_STRING01 = "d";
TF_SHAREDATA_STRING02 = "dddddddddddddddd";
TF_SHAREDATA_STRING03 = "dddddddd";
TF_SHAREDATA_STRING04 = "dddddddddd";

-----TASK------------------------------
TF_TASK_1 = 3189 --¼ÇÂ¼¸öÈËÉÏ½»ÐÅÏ¢
TF_TASK_2 = 3190 --Ê³²Ä£¬¾Æ£¬´¶¾ß£¬×ÀÒÎ
TF_TASK_3 = 3191 --¡¤¡¤¡¤¡¤¡¤
TF_TASK_4 = 3192 --¡¤¡¤¡¤¡¤¡¤3,4ByteÓÃ²Í×À×ÓµÄnpc index
--TF_TASK_5 = 3193 
TF_TASK_6 = 3193 --1ByteÄÄ¸öÌ×²Í2Byte½ñÌìÊ¹ÓÃÒÑÓÃ²Í3ByteÊ±¼ä¼ÆÊýÆ÷4ByteÊÇ·ñÊ¹ÓÃ¾«ÖÂµÄ²Í¾ß
--TF_TASK_7 = 3194 
TF_TASK_8 = 3194 --Ê¹ÓÃÃÀ¾ÆµÄCD
TF_TASK_9 = 3195 --»ñµÃBUFFµÄÊ±¼ä
---------------------------------------

------item-----------------------------
TF_ITEM_PIG = {2, 1, 30583, "Lîn C¾p N¸ch"};
TF_ITEM_COW = {2, 1, 30584, "Bß KoBe"};
TF_ITEM_SHEEP = {2, 1, 30585, "Dª B¶y Në"};
TF_ITEM_BACON = {2, 1, 30586, "ThÞt Nguéi"};
TF_ITEM_TC = {2, 1, 30590, "Bµn TiÖc"};
TF_ITEM_COOKER = {2, 1, 30591, "Bé NÊu BÕp"};
TF_ITEM_WINE = {2, 1, 30587, "Minh M¹ng Chi Töu"};
TF_ITEM_TABLEWARE = {2, 1, 30592, "Bé §å ¡n"};
TF_ITEM_TONG_TOKEN_CHIP = {2, 1, 30588, "M¶nh LÖnh Bµi Bang Héi"};
TF_ITEM_TONG_TOKEN = {2, 1, 30589, "LÖnh Bµi Bang Héi"};
---------------------------------------

------raiddrop-------------------------
TF_RAIDDROP_PB = {
	[1] = 50,
	[2] = 85,
	[3] = 90,
	[4] = 95,
	[5] = 100,
	[6] = 100,
	[7] = 100,
	[8] = 100,
}
---------------------------------------

--ÓÃ²Í½±Àø-----------------------------
TF_FEAST_AWARD = {
	[1] = {200000, 20, 40, 1},	
	[2] = {400000, 40, 80, 2},
	[3] = {600000, 60, 120, 3},
}

TF_AWARD_BUFF = {
	{"state_p_attack_percent_add", 5, 2*3600*18, 0, 9109, 1, 0},
	{"state_m_attack_percent_add", 5, 2*3600*18, 0, 9110, 1, 0},
	{"state_magic_parmor_per_add", 5, 2*3600*18, 0, 9111, 1, 0},
	{"state_physical_parmor_per_add", 5, 2*3600*18, 0, 9112, 1, 0},
	{"state_life_max_percent_add", 10, 2*3600*18, 0, 9113, 1, 0},
	{"state_move_speed_percent_add", 10, 2*3600*18, 0, 9114, 1, 0},
	{"state_burst_enhance_rate", 5, 2*3600*18, 0, 9115, 1, 0},
	{"state_inc_exp_gain", 300, 2*3600*18, 0, 9116, 1, 0},
}