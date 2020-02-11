DebugOutput = nothing
SLT_CHANGE_PET = 1; --¿ªÆô±äÉí
SLT_EXP_ADD_PRB = 0; --¸±±¾ÏµÊýF
SLT_NPC_NAME = "B¾c §Èu L·o Nh©n"
SLT_LIMIT_LEVEL = 90; --ÏÞÖÆµÈ¼¶
SLT_LIMIT_PLAYER = 4; --×îµÍÒªÇóÈËÊý
SLT_COST_NUM_1 = 20;  --ÏûºÄ¾«Á¦ÊýÄ¿
SLT_COST_NUM_2 = 4;   --ÏûºÄÌì½¾ÁîÊýÄ¿
SLT_AERA_NUM = 9; --ÇøÓò¸öÊý
SLT_POINT_NUM = 3; --Ã¿¸öµã¹ÖÎïÊýÁ¿
SLT_GENBAN_NUM = 4; --¸ú°àÊýÁ¿

SLT_MISSION_TIME_MAX = 20; --20min¸±±¾×î³¤Ê±¼ä
SLT_MISSION_SETP = 5;      --5s²½½ø
SLT_MISSION_STEP_MAX = (SLT_MISSION_TIME_MAX * 60) / SLT_MISSION_SETP  --×î´ó²½½ø

SLT_SCRIPT = "\\script\\missions\\siling_trial\\slt_head.lua"
SLT_NPC_TEMP_DATA_1 = 1;
SLT_NPC_TEMP_DATA_2 = 2;
SLT_NEED_ROOM = 2;
SLT_OPEN_NEED = {"Thiªn Kiªu LÖnh", 2, 97, 236, 1};

--TASKIDÈÎÎñ±äÁ¿----------------
SLT_TASKID_1 = 3265  --1,2Î»¼ÇÂ¼MapSeq£¬AeraSeq,¹ÖÎïÂÖÊý,ÊÇ·ñµÈ´ý¿ªÏä
SLT_TASKID_2 = 3266  --¼ÆÊýÆ÷
SLT_TASKID_3 = 3267  --¼ÇÂ¼npcË÷Òý
--Ê±¼ä´¥·¢Æ÷--------------------
SLT_TRIGGER_ID = 1536; --5s´¥·¢Ò»´Î
SLT_LOGOUT_ID = 3011; --µÇ³ö´¥·¢Æ÷
--ÍË³öµã×ø±ê--------------------
SLT_EXIT_POS = {100, 1434, 2949};

SLT_MAP_ID = {
	6001, 
	6002, 
	6003, 
	6004, 
	6005,
};
SLT_AERA_POS = {
	{1546, 3141},
	{1579, 3218},
	{1682, 3175},
	{1704, 3312},
	{1655, 3431},
	{1670, 3514},
	{1531, 3405},
	{1558, 3494},
	{1633, 3338},
};
SLT_NPC_POS_1 = {
	{1541, 3160},
	{1579, 3180},
	{1695, 3170},
	{1684, 3307},
	{1634, 3444},
	{1688, 3506},
	{1542, 3394},
	{1536, 3507},
	{1613, 3346},
};
SLT_NPC_POS_2 = {
	{1529, 3189},
	{1594, 3200},
	{1675, 3189},
	{1679, 3286},
	{1628, 3473},
	{1677, 3476},
	{1527, 3359},
	{1528, 3475},
	{1603, 3327},	
};
SLT_NPC_POS_3 = {
	{1539, 3222},
	{1606, 3178},
	{1678, 3216},
	{1695, 3264},
	{1653, 3478},
	{1688, 3448},
	{1544, 3343},
	{1541, 3448},
	{1620, 3331},	
};
SLT_BOSS_POS = {
	{1553, 3188},
	{1590, 3155},
	{1699, 3199},
	{1703, 3283},
	{1634, 3502},
	{1702, 3484},
	{1557, 3365},
	{1561, 3461},
	{1615, 3331},	
};

SLT_NPC_TEMPLATE_1 = {
	{"sl_dujiacong", "§éc Gi¸p Trïng"},
	{"sl_bianfu", "D¬i"},
	{"sl_huli", "Hå Ly"},
};
SLT_NPC_TEMPLATE_2 = {
	{"sl_elang", "Sãi ®iªn"},
	{"sl_heiya", "Qu¹ §en"},
	{"sl_shirene", "C¸ sÊu"},
	{"sl_chanchu", "C¸p M«"},
	{"sl_xixuebianfu", "D¬i hót m¸u"},
	{"sl_tianxie", "Bß c¹p"},
	{"sl_yinhu", "Ng©n Hå"},
	{"sl_changyuan", "Th­¬ng Viªn"},
	{"sl_shuguai", "Thô Qu¸i"},
	{"sl_huixiong", "GÊu x¸m"},
	{"sl_dufeng", "Ong ®éc"},
	{"sl_jinjia", "Kim Gi¸p"},
};
SLT_NPC_TEMPLATE_3 = {
	{"sl_hongbaoshizhe", "Hång Bµo Sø Gi¶"},
	{"sl_xibeizhuanghan", "T©y B¾c Tr¸ng H¸n"},
	{"sl_yipingtangmishi", "NhÊt PhÈm §­êng MËt Sø"},
	{"sl_cihuozhanglao", "Xi Háa tr­ëng l·o"},
	{"sl_wokou", "Oa KhÊu"},
	{"sl_xiannv", "Tiªn N÷"},
	{"sl_nvxiaoxian", "N÷ Tiªu tiªn"},
	{"sl_chimaohuwei", "Tr× M©u Hé VÖ"},
};
SLT_BOSS_TEMPLATE = {
	{"sl_longling", "Long Linh"},
	{"sl_yingling", "¦ng Linh"},
	{"sl_huling", "Hæ Linh"},
	{"sl_fengling", "Ph­îng Linh"},
	{"sl_qitiandasheng", "TÒ Thiªn §¹i Th¸nh "},
};
SLT_PARTNER_TEMPLATE = {
	{"sl_huoqiling", "Háa Kú L©n"},
	{"sl_baitoudiao", "B¹ch §Çu §iªu"},
	{"sl_huwang", "Hæ V­¬ng"},
	{"sl_luanniao", "Loan §iÓu"},
	{"sl_juyuan", "V­în to"},
};

SLT_TONG_BOX = "R­¬ng §ång"
SLT_YING_BOX = "R­¬ng B¹c"
SLT_JING_BOX = "Kim R­¬ng"

SLT_AWARD = {
	[1] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[2] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[3] = {
		{"tongbaoxiang", SLT_TONG_BOX, 1, SLT_SCRIPT},
		{"yinbaoxiang", SLT_YING_BOX, 4, SLT_SCRIPT},
	},
	[4] = {
		{"jinbaoxiang", SLT_JING_BOX, 1, SLT_SCRIPT},
	},	
}

SLT_EXP = {
	[1] = 2000000,
	[2] = 2500000,
	[3] = 3000000,
	[4] = 3500000,
}

SLT_ROUTE_ADD = {
	[1] = 0,
	[2] =	0,
	[3] =	0,
	[4] =	0,
	[5] =	0.2,
	[6] =	0.4,
	[7] =	0.6,
	[8] =	1,
}
