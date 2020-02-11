--µØÍ¼×é
QHT_MAP_TABLE = {6021, 6022, 6023};
QHT_MISSION_ID = {59, 60, 61};
QHT_TIMER_ID = {89, 90, 91};

--NPCË¢ÐÂ¼ä¸ô30min
QHT_NPC_REFLASH = 30 * 60;

--»ñµÃÏà¹ØÊÕÒæÉÏÏÞÖµ
QHT_EXP_MAX = 1200000000;
QHT_ZHENQI_MAX = 10000;
QHT_XIUWEI_MAX = 10000;
QHT_SHENGWANG_MAX = 6000;
QHT_SHIMENGXD_MAX = 6000;

--½ðÎÆ»¢·ûÃ¿ÈÕÉÏÏÞÊýÁ¿
QHT_JWHF_MAX = 100;

--³öÈ¥µÄ×ø±êÎ»ÖÃ
QHT_OUT_POS = {
		[300] = {1727,3522},
		[350] = {1436,2947},
		[100] = {1433,2953},
		[200] = {1374,2845},
};

QHT_NPC_SCRIPT_LANGUAI = "\\script\\online\\qianhe_tower\\npc\\languai.lua";
QHT_NPC_SCRIPT_XIAOGUAI = "\\script\\online\\qianhe_tower\\npc\\xiaoguai.lua";
QHT_NPC_SCRIPT_ZHONGGUAI = "\\script\\online\\qianhe_tower\\npc\\zhongguai.lua";
QHT_NPC_SCRIPT_DAGUAI = "\\script\\online\\qianhe_tower\\npc\\daguai.lua";
QHT_NPC_SCRIPT_GOLDBOSS = "\\script\\online\\qianhe_tower\\npc\\goldboss.lua";

QHT_NPC_SCRIPT_DIJIBOX = "\\script\\online\\qianhe_tower\\npc\\diji_box.lua";
QHT_NPC_SCRIPT_ZHONGJIBOX = "\\script\\online\\qianhe_tower\\npc\\zhongji_box.lua";
QHT_NPC_SCRIPT_GAOJIBOX = "\\script\\online\\qianhe_tower\\npc\\gaoji_box.lua";


--ÉÏÏÞ¼ÇÂ¼MapTaskTemp 6021 6022 6023 G
QHT_MAPTEMPTASK_BOSS_MAX = 1;

--ÐÂÔö¹ÖÎïÉÏÏÞÊýÁ¿
QHT_BOSS_6021_MAX = 20;
QHT_BOSS_6022_MAX = 30;
QHT_BOSS_6023_MAX = 10;

--»Æ½ðBOSSÃ¿ÌìÉÏÏÞMapTaskTemp 6023	G
QHT_MAPTEMPTASK_GOLDBOSS_MAX = 2;

--»Æ½ðbossÉÏÏÞÊýÁ¿
QHT_GOLDBOSS_MAX = 3;

--Ììî¸ÁîÃ¿Ìì²ú³öÊýÁ¿¼ÇÂ¼MapTaskTemp 6023 G
QHT_MAPTEMPTASK_TIANGANG_MAX = 3;
--ÓÀ¾Ã×øÆïÃ¿Ìì²ú³öÊýÁ¿¼ÇÂ¼MapTaskTemp 6023 G
QHT_MAPTEMPTASK_YJZUOJI_MAX = 4;
--ÌìÃÅ½ðÁîÃ¿ÌìÊýÁ¿²ú³öÊýÁ¿¼ÇÂ¼MapTaskTemp 6023 G
QHT_MAPTEMPTASK_TIANMEN_MAX = 5;

--Ã¿ÈÕ²ú³öÉÏÏÞÖµ
QHT_TIANGANG_MAX = 4;
QHT_YJZUOJI_MAX = 4;
QHT_TIANMEN_MAX = 4;

--Í¶µã»Øµ÷Â·¾¶
QHT_THROWDICE_CBFILE = "\\script\\online\\qianhe_tower\\qht_head.lua";

--µÍ¼¶±¦Ïäµã»÷Ê±¼ä¼ä¸ô
QHT_DIJI_BOX_TIME = 3;
--ÖÐ¼¶±¦Ïäµã»÷Ê±¼ä¼ä¸ô
QHT_ZHONGJI_BOX_TIME = 6;
--¸ß¼¶¼¶±¦Ïäµã»÷Ê±¼ä¼ä¸ô
QHT_GAOJI_BOX_TIME = 9;

--Ä§·¨ÊôÐÔ±í
QHT_BUFF_6021 = {
	tInfo = {"C«ng chiÕn Thiªn TÇm Th¸p LV%d,%s",1},
	tState = {
		{9926, 50, "state_inc_exp_gain", 100, "GiÕt qu¸i kinh nghiÖm t¨ng %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 50, "§iÓm sinh lùc n©ng cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 50, "C«ng kÝch vò khÝ n©ng cao %d%%", 5},
	},
};

QHT_BUFF_6022 = {
	tInfo = {"C«ng chiÕn Thiªn TÇm Th¸p LV%d,%s",2},
	tState = {
		{9926, 50, "state_inc_exp_gain", 150, "GiÕt qu¸i kinh nghiÖm t¨ng %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 75, "§iÓm sinh lùc n©ng cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 75, "C«ng kÝch vò khÝ n©ng cao %d%%", 5},
	},
};

QHT_BUFF_6023 = {
	tInfo = {"C«ng chiÕn Thiªn TÇm Th¸p LV%d,%s",3},
	tState = {
		{9926, 50, "state_inc_exp_gain", 200, "GiÕt qu¸i kinh nghiÖm t¨ng %d%%", 10},
		{9927, 30, "state_life_max_percent_add", 100, "§iÓm sinh lùc n©ng cao %d%%", 5},
		{9928, 20, "state_weapondam_percent_add", 100, "C«ng kÝch vò khÝ n©ng cao %d%%", 5},
	},
};

--Ëæ»úµã
QHT_RANDOM_POINT_6021 = {
	{6021, 1650, 3412},
	{6021, 1576, 3573},
	{6021, 1750, 3478},
	{6021, 1690, 3680},
	{6021, 1785, 3688},
	{6021, 1864, 3607},
	{6021, 1860, 3497},
	{6021, 1999, 3495},
	{6021, 1917, 3462},
	{6021, 1937, 3387},
	{6021, 1872, 3268},
	{6021, 1712, 3351},
}

QHT_RANDOM_POINT_6022 = {
	{6022, 1320, 3100},
	{6022, 1439, 3021},
	{6022, 1579, 2968},
	{6022, 1631, 2770},
	{6022, 1674, 2870},
	{6022, 1749, 2937},
	{6022, 1939, 3070},
	{6022, 1795, 3094},
	{6022, 1755, 3246},
	{6022, 1617, 3339},
	{6022, 1602, 3225},
	{6022, 1543, 3181},
	{6022, 1624, 3057},
	{6022, 1639, 3085},
	{6022, 1498, 3136},
	{6022, 1638, 3136},
	{6022, 1687, 3034},
	{6022, 1646, 2974},
}

QHT_RANDOM_POINT_6023 = {
	{6023, 1580, 3356},
	{6023, 1429, 3390},
	{6023, 1492, 3391},
	{6023, 1589, 3539},
	{6023, 1783, 3512},
	{6023, 1460, 3543},
}

--Ë¢ÐÂµãÊýÉÏÏÞ
QHT_MAP_FLASH_POINT = {
	[6021] = {6,2,4},
	[6022] = {9,3,6},
	[6023] = {3,1,2},
}

QHT_MAP_NAME = {
	[200] = "BiÖn Kinh", 
	[300] = "Thµnh §«", 
	[350] = "T­¬ng D­¬ng", 
	[100] = "TuyÒn Ch©u", 
	[150] = "D­¬ng Ch©u",
	[500] = "Phông T­êng"
}

QHT_TONG_FLAG = {
	[1] = "Bang Héi §¹i Kú",
	[2] = "ThiÕt HuyÕt Bang Héi ChiÕn Kú",
}




