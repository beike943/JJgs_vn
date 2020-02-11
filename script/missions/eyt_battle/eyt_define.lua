Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DebugOutput = nothing
EYT_MAP_ID = 6076;
EYT_MISSION_ID = 71;
EYT_TIMER_ID = 101;
EYT_JOIN_TIME_LIMIT = 4;
EYT_PLAYER_MAX = 8;
EYT_MISSION_MAX = 100;
EYT_KILL_PLAYER = 1;
EYT_OPEN_FLAG = 40;
EYT_COUNTDOWN_REVIVE = 2;
EYT_COUNTDOWN_TIME = 15;
EYT_SCROE_MAX = 150;
EYT_FLAG_REFLESH_TIME = 3 * 60;
EYT_PUNISH_TIME = 15 * 60;
EYT_AWARD_COEFFICIENT = VNG_CFG_EXTRA_EYT_ADD_RATE or 0;    --½±Àø¼Ó³ÉÏµÊı

--==============Ë«·½ÕóÓª========================
EYT_CAMP_RED = 1;
EYT_CAMP_BLUE = 2;
EYT_CAMP_STRING = {
	["camp_player"] = EYT_CAMP_RED,
	["camp_enemy"] = EYT_CAMP_BLUE,
}
EYT_CAMP_NAME = {
	[EYT_CAMP_RED] = "§éi ®á",
	[EYT_CAMP_BLUE] = "§éi xanh",
}
--==============³£Á¿£ºÕ½³¡µÄ×´Ì¬===================
EYT_STATE_PEACE = 1;				--µÈ´ıÈËÊı½×¶Î
EYT_STATE_FIGHT = 2;				--¿ªÕ½×´Ì¬
EYT_STATE_COMPLETE = 3;		  --Õ½Õù½áÊø×´Ì¬

EYT_REV_POS = {
	[EYT_CAMP_RED] = {
		{1644, 3178},
		{1640, 3175},
		{1635, 3169},
		{1632, 3163},
	},
	[EYT_CAMP_BLUE] = {
		{1587, 3253},
		{1583, 3251},
		{1579, 3244},
		{1579, 3251},
	},
}

EYT_NPC_FLAG = "ChiÕn Kú ¢n O¸n §µi";

--TASK-==========================
EYT_TASK_1 = 3271; --1,2byteÎ´Ê¹ÓÃ,3byteÊ¤³¡£¬4byte°Ü³¡
EYT_TASK_2 = 3272; --1byte²ÎÓë´ÎÊı£¬2byte»÷É±Êı£¬3byte±»É±Êı£¬4¸öÈË¹±Ï×»ı·Ö
EYT_TASK_3 = 3274; --²ÎÓëÊ±¼ä

--Ñ©ºŞBUFF
EYT_XUEHEN = {--²î¾àÊı ¹¥»÷Ìá¸ßÊıÖµ ÉúÃüÉÏÏŞÌá¸ßÊıÖµ ÃâÒß¸ºÃæ´ÎÊı
	{21,150,300,15,format("TuyÕt hËn cÊp %d", 11),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{19,150,300,14,format("TuyÕt hËn cÊp %d", 10),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{17,135,270,14,format("TuyÕt hËn cÊp %d", 9),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{15,120,240,13,format("TuyÕt hËn cÊp %d", 8),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{13,105,210,13,format("TuyÕt hËn cÊp %d", 7),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{11,90 ,180,12,format("TuyÕt hËn cÊp %d", 6),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{9 ,75 ,150,12,format("TuyÕt hËn cÊp %d", 5),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{7 ,60 ,120,10,format("TuyÕt hËn cÊp %d", 4),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{5 ,45 ,90 , 5,format("TuyÕt hËn cÊp %d", 3),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{3 ,30 ,60 , 3,format("TuyÕt hËn cÊp %d", 2),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
	{1 ,15 ,30 , 1,format("TuyÕt hËn cÊp %d", 1),"C«ng kİch t¨ng %d%%, giíi h¹n sinh lùc t¨ng %d%%, miÔn dŞch tr¹ng th¸i phô %d lÇn"},
};

--°Ë¸ö·ğµÄÎ»ÖÃ
EYT_FO_POS = {
	{"Nga Mi tiÓu s­ tû 1", "Nga Mi tiÓu s­ tû ", 1634, 3163, "camp_player"},
	{"Nga Mi tiÓu s­ tû 2", "Nga Mi tiÓu s­ tû ", 1630, 3167, "camp_player"},
	{"Nga Mi tiÓu s­ tû 3", "Nga Mi tiÓu s­ tû ", 1645, 3173, "camp_player"},
	{"Nga Mi tiÓu s­ tû 4", "Nga Mi tiÓu s­ tû ", 1642, 3180, "camp_player"},
	{"Nga Mi tiÓu s­ tû 1", "Nga Mi tiÓu s­ muéi", 1572, 3247, "camp_enemy"},
	{"Nga Mi tiÓu s­ tû 2", "Nga Mi tiÓu s­ muéi", 1575, 3243, "camp_enemy"},
	{"Nga Mi tiÓu s­ tû 3", "Nga Mi tiÓu s­ muéi", 1588, 3256, "camp_enemy"},
	{"Nga Mi tiÓu s­ tû 4", "Nga Mi tiÓu s­ muéi", 1590, 3252, "camp_enemy"},
}