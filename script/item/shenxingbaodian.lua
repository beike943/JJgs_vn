-- =========================================================
-- File: ÉñÐÐ±¦µäµÄ½Å±¾
-- Name: shenxingbaodian.lua
-- ID:   0, 200, 39
-- Desc: Ê¹ÓÃºóÈ¥µ½Ö¸¶¨µØµã£¬Í¬Ê±ÏûºÄÒ»¶¨µÄÄÍ¾Ã¶È
-- Creator: Tony(Jizheng)
-- Date: Nov 30th, 2006
-- =========================================================


--ÕâÊÇÒ»¸öÃèÊöÉñÐÐ±¦µäËùÄÜµ½´ïµÄµØµãµÄÊý¾Ý½á¹¹
--¿ÉÒÔºÜ·½±ãµØ¸ù¾ÝÕâ¸ö½á¹¹À´Ëã³öµ½´ïÄ³Ò»Ä¿µÄËùÒª½øÐÐµÄÉñÐÐ±¦µä²Ù×÷Ë³Ðò£¬ÈçµÚÒ»Ò³¶Ô»°Ñ¡µÚ¼¸Ïî£¬µÚ¶þÒ³¶Ô»°Ñ¡µÚ¼¸Ïî£¬etc
TB_DES_INFO = 
--Ä¿µÄµØ£¬Ä¿µÄµØÃèÊö£¬ÏûºÄÄÍ¾Ã£¬µ½Ä¿µÄµØºóµØÕ½¶·×´Ì¬
{
	[1] = 	--ÎÒÏëÈ¥Á·¼¶µØÍ¼
	{
		[0] = "Khu vùc luyÖn cÊp",
		[1] = {21,"NhÞ Long s¬n",3,1},
		[2] = {22,"KiÕm M«n quan",3,1},
		[3] = {24,"Miªu LÜnh",3,1},
		[4] = {30,"H¹nh Hoa th«n",3,1},
		[5] = {31,"Ngò §éc mª cung tÇng 1",3,1},
		[6] = {32,"Ngò §éc cung tÇng 2",3,1},
		[7] = {33,"D· Tr­ l©m",3,1},
		[8] = {34,"Long TuyÒn Th«n",3,1},
		[9] = {35,"Mé TuyÕt s¬n trang",3,1},
		[10] = {36,"¤ M«ng Bé",3,1},
		[11] = {37,"V©n Méng Tr¹ch",3,1},
		[12] = {38,"Linh B¶o s¬n",3,1},
		[13] = {39,"Giang T©n Th«n",4,1},
		[14] = {40,"Vò L¨ng s¬n",3,1},
		[15] = {41,"Ch©n nói Vò L¨ng",3,1},
		[16] = {42,"Thanh Khª ®éng",3,1},
		[17] = {43,"ThiÕu L©m mËt thÊt-1",3,1},
		[18] = {44,"ThiÕu L©m mËt thÊt-2",3,1},
		[19] = {45,"T­êng V©n ®éng",3,1},
		[20] = {46,"D­¬ng Trung ®éng-1",3,1},
		[21] = {47,"D­¬ng Trung ®éng-2",4,1},
		[22] = {48,"D­¬ng Trung ®éng-3",5,1},
		[23] = {49,"B¨ng T©m ®éng_1",4,1},
		[24] = {50,"B¨ng T©m ®éng_2",5,1},
		[25] = {51,"Tróc Ty ®éng_1",3,1},
		[26] = {52,"Tróc Ty ®éng-2",4,1},
		[27] = {53,"ThÊt Tinh ®éng-1",3,1},
		[28] = {54,"ThÊt Tinh ®éng-2",4,1},
		[29] = {55,"Nh¹n M«n quan",3,1},
		[30] = {56,"KiÕm C¸c Thôc ®¹o",3,1},
		[31] = {57,"§iÓm Th­¬ng s¬n",3,1},
		[32] = {58,"Vò Di s¬n",3,1},
		[33] = {59,"Phôc Ng­u s¬n",3,1},
		[34] = {60,"L­¬ng S¬n B¹c",3,1},
		[35] = {61,"L­ìng Thñy ®éng_1",4,1},
		[36] = {62,"L­ìng Thñy ®éng_2",5,1},
		[37] = {63,"Kim Quang ®éng",3,1},
		[38] = {64,"Thanh Thµnh s¬n",3,1},
		[39] = {65,"Phong Ma ®éng-1",4,1},
		[40] = {66,"Phong Ma ®éng-2",5,1},
		[41] = {67,"YÕn Tö ®éng-1",3,1},
		[42] = {68,"YÕn Tö ®éng-2",4,1},
		[43] = {69,"H¾c Phong ®éng",3,1},
		[44] = {70,"Long Hæ ®éng-1",3,1},
		[45] = {71,"Long Hæ ®éng-2",4,1},
		[46] = {72,"Phông Nh·n ®éng",3,1},
		[47] = {73,"B¹ch Thñy ®éng-1",3,1},
		[48] = {74,"B¹ch Thñy ®éng-2",4,1},
		[49] = {75,"§«ng H¶i H¶i T©n 1",3,1},
		[50] = {76,"§«ng H¶i H¶i T©n 2",4,1},
		[51] = {77,"Long Nh·n ®éng-1",6,1},
		[52] = {78,"Long Nh·n ®éng-2",7,1},
		[53] = {79,"Thiªn S­ ®éng-1",5,1},
		[54] = {80,"Thiªn S­ ®éng-2",6,1},
		[55] = {81,"Phong §«",6,1},
		[56] = {82,"§¹i Th¶o Nguyªn 1",3,1},
		[57] = {83,"§¹i Th¶o Nguyªn 2",4,1},
		[58] = {84,"Bé l¹c V­¬ng Kú",4,1},
		[59] = {85,"§µo Hoa ®¶o",5,1},
		[60] = {86,"Quû M«n Håi Lang",7,1},
		[61] = {87,"Thanh ¢m ®éng_1",5,1},
		[62] = {88,"Thanh ¢m ®éng_2",6,1},
		[63] = {89,"T©y Song B¶n N¹p B¾c ",5,1},
		[64] = {90,"T©y Song B¶n N¹p Nam ",6,1},
		[65] = {91,"Thiªn TÇm th¸p_1",6,1},
		[66] = {92,"Thiªn TÇm th¸p_2",7,1},
		[67] = {93,"Thiªn TÇm th¸p_3",8,1},
		[68] = {94,"V­¬ng MÉu ®éng_1",6,1},
		[69] = {95,"V­¬ng MÉu ®éng_2",7,1},
		[70] = {96,"V­¬ng MÉu ®éng-3",8,1},
		[71] = {98,"Thiªn s­ bÝ c¶nh",8,1},
		[72] = {99,"B¾c Phông T­êng",4,1},
		[73] = {100,"Nam Phông T­êng",4,1},
		[74] = {101,"Long M«n trÊn",5,1},
		[75] = {102,"Quang Minh ®Ønh",7,1},
		[76] = {103,"TÇn L¨ng",8,1},
		[77] = {104,"Hoµng L¨ng mé thÊt tÇng 1",9,1},
		[78] = {105,"Hoµng L¨ng mé thÊt tÇng 2",10,1},
		[79] = {106,"Cæ D­¬ng ®éng_1",8,1},
		[80] = {107,"Cæ D­¬ng ®éng_2",9,1},
		[81] = {108,"D­îc V­¬ng cèc",9,1},
		[82] = {109,"D­îc V­¬ng ®éng",10,1},
		[83] = {110,"Mª cung sa m¹c",10,1},
		[84] = {111,"Dao Tiªn ®éng",4,1},
	},
	[2] = 	--ÎÒÏëÈ¥ÃÅÅÉµØÍ¼
	{
		[0] = "Khu vùc m«n ph¸i",
		[1] = {"NewWorld(204,1599,3182)","ThiÕu L©m",5,0,1},
		[2] = {"NewWorld(312,1825,3323)","Vâ §ang",5,0,1},
		[3] = {"NewWorld(209,1547,3183)","C¸i Bang",5,0,1},
		[4] = {"NewWorld(303,1645,3159)","Nga My",5,0,1},
		[5] = {"NewWorld(305,1598,2824)","§­êng M«n",5,0,1},
		[6] = {"NewWorld(219,1538,3151)","D­¬ng M«n",5,0,1},
		[7] = {"NewWorld(407,1609,3193)","Ngò §éc",5,0,1},
		[8] = {"NewWorld(509,1424,3444)","C«n L«n",5,0,1},
		[9] = {"NewWorld(404,1484,2828)","Thóy Yªn",5,0,1},
	},
	[3] = 	--ÎÒÏëÈ¥¹¦ÄÜNPC´¦
	{
		[0] = "Chç NPC thµnh thÞ",
		[1] = 
		{
			[0] = "BiÖn Kinh",
			[1] = {"NewWorld(200,1488,2953)","Thñ khè (§«ng)",5,0},
			[2] = {"NewWorld(200,1296,2990)","Thñ khè (Nam)",5,0},
			[3] = {"NewWorld(200,1272,2774)","Thñ khè (T©y)",5,0},
			[4] = {"NewWorld(200,1183,2826)","D· TÈu",5,0},
			[5] = {"NewWorld(200,1169,2845)","Thè TiÓu Nha",5,0},
			[6] = {"NewWorld(200,1360,2925)","Chñ th­¬ng héi",5,0},
			[7] = {"NewWorld(200,1439,2956)","Th­¬ng nh©n T©y Vùc",5,0},
			[8] = {"NewWorld(200,1482,2764)","LÔ quan",5,0},
			[9] = {"NewWorld(200,1392,2659)","Bé ®Çu",5,0},
			[10] = {"NewWorld(200,1150,2850)","ThÇn Du Ch©n Nh©n",5,0},
			[11] = {"NewWorld(200,1228,2761)","Sø gi¶ Tµng KiÕm",5,0},
			[12] = {"NewWorld(200,1379,2870)","§¹i sø ho¹t ®éng cuèi tuÇn",5,0},
			[13] = {"NewWorld(200,1401,2663)","TriÖu Phæ",5,0},
			[14] = {"NewWorld(200,1392,2817)","Ch©n Tö §¬n",5,0},
		},
		[2] = 
		{
			[0] = "Thµnh §«",
			[1] = {"NewWorld(300,1682,3652)","Thñ khè (Nam)",5,0},
			[2] = {"NewWorld(300,1693,3460)","Thñ khè (T©y)",5,0},
			[3] = {"NewWorld(300,1925,3473)","Thñ khè (B¾c)",5,0},
			[4] = {"NewWorld(300,1634,3549)","D· TÈu",5,0},
			[5] = {"NewWorld(300,1653,3559)","Thè TiÓu Nha",5,0},
			[6] = {"NewWorld(300,1897,3492)","Chñ th­¬ng héi",5,0},
			[7] = {"NewWorld(300,1794,3608)","Th­¬ng nh©n T©y Vùc",5,0},
			[8] = {"NewWorld(300,1787,3497)","LÔ quan",5,0},
			[9] = {"NewWorld(300,1779,3473)","Bé ®Çu",5,0},
			[10] = {"NewWorld(300,1974,3552)","ThÇn Du Ch©n Nh©n",5,0},
			[11] = {"NewWorld(300,1776,3701)","Sø gi¶ Tµng KiÕm",5,0},
			[12] = {"NewWorld(300,1742,3549)","§¹i sø c«ng thµnh",5,0},
			[13] = {"NewWorld(300,1728,3536)","Qu¶n thµnh sø",5,0},
			[14] = {"NewWorld(300,1822,3378)","Tiªu s­",5,0},
			[15] = {"NewWorld(300,1840,3570)","Chñ l«i ®µi",5,0},
			[16] = {"NewWorld(300,1959,3545)","Chu ThiÖn Nh©n",5,0},
		},
		[3] = 
		{
			[0] = "TuyÒn Ch©u",
			[1] = {"NewWorld(100,1554,3075)","Thñ khè (§«ng)",5,0},
			[2] = {"NewWorld(100,1387,2902)","Thñ khè (T©y)",5,0},
			[3] = {"NewWorld(100,1518,2869)","Thñ khè (B¾c)",5,0},
			[4] = {"NewWorld(100,1447,2800)","D· TÈu",5,0},
			[5] = {"NewWorld(100,1459,2811)","Thè TiÓu Nha",5,0},
			[6] = {"NewWorld(100,1537,2933)","Chñ th­¬ng héi",5,0},
			[7] = {"NewWorld(100,1499,3059)","Th­¬ng nh©n T©y Vùc",5,0},
			[8] = {"NewWorld(100,1512,2990)","LÔ quan",5,0},
			[9] = {"NewWorld(100,1519,2988)","Bé ®Çu",5,0},
			[10] = {"NewWorld(100,1381,2857)","ThÇn Du Ch©n Nh©n",5,0},
			[11] = {"NewWorld(100,1509,3107)","Sø gi¶ Tµng KiÕm",5,0},
		},
		[4] = 
		{
			[0] = "D­¬ng Ch©u",
			[1] = {"NewWorld(150,1757,3178)","Thñ khè (§«ng)",5,0},
			[2] = {"NewWorld(150,1614,3173)","Thñ khè (Nam)",5,0},
			[3] = {"NewWorld(150,1633,3052)","Thñ khè (T©y)",5,0},
			[4] = {"NewWorld(150,1727,3073)","Thñ khè (B¾c)",5,0},
			[5] = {"NewWorld(150,1680,3118)","Thè TiÓu Nha",5,0},
			[6] = {"NewWorld(150,1635,3139)","Chñ th­¬ng héi",5,0},
			[7] = {"NewWorld(150,1653,3109)","Th­¬ng nh©n T©y Vùc",5,0},
			[8] = {"NewWorld(150,1738,3158)","Bé ®Çu",5,0},
			[9] = {"NewWorld(150,1744,3121)","Sø gi¶ Tµng KiÕm",5,0},
			[10] = {"NewWorld(150,1713,3137)","§¹i sø ho¹t ®éng cuèi tuÇn",5,0},
			[11] = {"NewWorld(150,1680,3161)","ChØ huy sø",5,0},
			[12] = {"NewWorld(150,1650,3174)","Tö Quang C¸c L·o Nh©n",5,0},
			[13] = {"NewWorld(150,1600,3136)","Bµ mai",5,0},
			[14] = {"NewWorld(150,1588,3143)","X¶o n÷",5,0},
			[15] = {"NewWorld(150,1711,3046)","Sø gi¶ h«n lÔ",5,0},
			[16] = {"NewWorld(150,1701,3170)","§Æc sø Vâ L©m",5,0},
		},
		[5] = 
		{
			[0] = "T­¬ng D­¬ng",
			[1] = {"NewWorld(350,1387,3065)","Thñ khè (Nam)",5,0},
			[2] = {"NewWorld(350,1359,2869)","Thñ khè (T©y)",5,0},
			[3] = {"NewWorld(350,1532,2861)","Thñ khè (B¾c)",5,0},
			[4] = {"NewWorld(350,1436,2808)","Thè TiÓu Nha",5,0},
			[5] = {"NewWorld(350,1455,2924)","Chñ th­¬ng héi",5,0},
			[6] = {"NewWorld(350,1497,2882)","Th­¬ng nh©n T©y Vùc",5,0},
			[7] = {"NewWorld(350,1506,2997)","Bé ®Çu",5,0},
			[8] = {"NewWorld(350,1394,2850)","Sø gi¶ Tµng KiÕm",5,0},
			[9] = {"NewWorld(350,1452,2968)","§¹i sø ho¹t ®éng cuèi tuÇn",5,0},
			[10] = {"NewWorld(350,1503,3023)","ChØ huy sø",5,0},
			[11] = {"NewWorld(350,1415,2930)","Thî rÌn L­u",5,0},
			[12] = {"NewWorld(350,1345,2924)","M¹c Tam",5,0},
			[13] = {"NewWorld(350,1433,2769)","Minh Chñ Kim S¬n",5,0},
		},
		[6] = 
		{
			[0] = "§¹i Lý",
			[1] = {"NewWorld(400,1528,3111)","Thñ khè (§«ng)",5,0},
			[2] = {"NewWorld(400,1455,3070)","Thñ khè (Nam)",5,0},
			[3] = {"NewWorld(400,1553,2912)","Thñ khè (B¾c)",5,0},
			[4] = {"NewWorld(400,1485,3018)","Thè TiÓu Nha",5,0},
			[5] = {"NewWorld(400,1486,2924)","Chñ th­¬ng héi",5,0},
			[6] = {"NewWorld(400,1428,3005)","Th­¬ng nh©n T©y Vùc",5,0},
			[7] = {"NewWorld(400,1506,2847)","LÔ quan",5,0},
		},
		[7] = 
		{
			[0] = "Phông T­êng",
			[1] = {"NewWorld(500,1795,3216)","Thñ khè (§«ng)",5,0},		
			[2] = {"NewWorld(500,1656,3215)","Thñ khè (Nam)",5,0},
			[3] = {"NewWorld(500,1677,3095)","Thñ khè (T©y)",5,0},
			[4] = {"NewWorld(500,1827,3049)","Thñ khè (B¾c)",5,0},
			[5] = {"NewWorld(500,1771,3186)","Chñ th­¬ng héi",5,0},
			[6] = {"NewWorld(500,1893,3113)","Bé ®Çu",5,0},
			[7] = {"NewWorld(500,1762,3127)","Thè tæng qu¶n",5,0},
			[8] = {"NewWorld(500,1640,3183)","Long Quang Ch©n Nh©n",5,0},
		},		
	},
	[4] = 	--ÎÒÏëÈ¥Éú»î²É¼¯¼¼ÄÜÊ¦¸µ´¦
	{
		[0] = "Kü n¨ng thu thËp n¬i s­ phô",
		[1] = {"NewWorld(300,1836,3430)","Thµnh §« §¹i Kho¸ng C«ng (®µo kho¸ng)",3,0},
		[2] = {"NewWorld(300,1848,3493)","Thµnh §« Hoµng §¹i ThÈm (KÐo t¬)",3,0},
		[3] = {"NewWorld(200,1220,2909)","BiÖn Kinh L­u NhÊt Phñ (§èn gç)",3,0},
		[4] = {"NewWorld(200,1347,3029)","BiÖn Kinh thî s¨n Tr­¬ng (Thuéc da)",3,0},
		[5] = {"NewWorld(100,1393,2969)","TuyÒn Ch©u M¹c Qu©n §¹o tr­ëng (TËp linh)",3,0},
		[6] = {"NewWorld(100,1555,2961)","TuyÒn Ch©u L©m D­îc S­ (H¸i thuèc)",3,0},
		[7] = {"NewWorld(100,1603,2968)","TuyÒn Ch©u Lý Phong Thu (Canh t¸c)",3,0},
	},
	[5] = 	--ÎÒÏëÓÎÏ·¹¦ÄÜµØÍ¼
	{
		[0] = "Chç b¸o danh chøc n¨ng game",
		[1] = 
			{
				[0] = "Khu vùc ho¹t ®éng cña S¸t Thñ §­êng",
				[1] = {97,"Ph©n ®µ s¸t thñ ®­êng",10,1},
			},
		[2] = 
			{
				[0] = "MËt thÊt s­ m«n",
				[1] = {"NewWorld(204,1644,3270)","ThiÕu L©m HuyÒn Kh«ng",5,0},
				[2] = {"NewWorld(305,1674,2936)","§­êng M«n §­êng T« M¹c",5,0},
				[3] = {"NewWorld(303,1715,3059)","Nga My TuÖ V©n S­ Th¸i",5,0},
				[4] = {"NewWorld(209,1530,3209)","C¸i Bang Bµng L· Väng",5,0},
				[5] = {"NewWorld(312,1871,3276)","Vâ §ang TiÕt V©n Tranh",5,0},
				[6] = {"NewWorld(219,1542,2939)","D­¬ng M«n D­¬ng Diªn Chiªu",5,0},
				[7] = {"NewWorld(407,1572,3160)","Ngò §éc C©u S¸ch",5,0},
				[8] = {"NewWorld(509,1539,3230)","C«n L«n  TrÇn BÊt Vi",5,0},
				[9] = {"NewWorld(404,1539,2698)","Thóy Yªn  L­u Thanh Mi",5,0},
		},
		[3] = 
			{
				[0] = "ChiÕn tr­êng Tèng Liªu",
				[1] = {"NewWorld(200,1291,2873)","TriÖu Diªn Niªn (b¸o danh Nh¹n M«n quan-Tèng) ",5,0},
				[2] = {"NewWorld(200,1301,2793)","Tiªu ViÔn L©u (b¸o danh Nh¹n M«n quan-Liªu)",5,0},
				[3] = {"NewWorld(500,1830,3144)","D­¬ng HiÖt (Ngäc M«n quan b¸o danh_Tèng)",5,0},
				[4] = {"NewWorld(500,1710,3238)","TÇn Thiªn T«n (b¸o danh Ngäc m«n quan-Liªu)",5,0},
				[5] = {"NewWorld(808,1645,3180)","Chiªu mé sø-Liªu",5,0},
				[6] = {"NewWorld(808,1735,3074)","Chiªu mé sø-Tèng",5,0},
				[7] = {"NewWorld(806,1643,3180)","Chiªu mé sø-Liªu",5,0},
				[8] = {"NewWorld(806,1733,3073)","Chiªu mé sø-Tèng",5,0},
			},
		[4] =
			{ 
				[0] = "Dß th¸m T©y Vùc",
				[1] = {"NewWorld(500,1762,3147)","MËt th¸m §¹i Tèng T©y Vùc (mËt th¸m T©y Vùc)",5,0},
				[2] = {"NewWorld(512,2052,3416)","§Ö tö C«n L«n (mËt ®éng Cæ D­¬ng)",10,1},
				[3] = {"NewWorld(513,1595,3190)","Thñ Mé Nh©n (mËt ®¹o Hoµng l¨ng)",10,1},
				[4] = {"NewWorld(510,1574,2867)","D­îc thÊt thñ vÖ (LuyÖn ®¬n ®éng)",10,1},
				[5] = {"NewWorld(514,1725,2873)","Thñ Mé T­íng Qu©n (mËt thÊt Hoµng l¨ng)",10,1},
				[6] = {"NewWorld(506,1316,2726)","Ngò Hµnh TrËn Sø (Ngò Hµnh TrËn)",10,1},
				[7] = {"NewWorld(506,1544,2668)","B¹ch Thiªn Thµnh (TËn cïng sa m¹c)",10,1},
				[8] = {"NewWorld(507,1651,3304)","TiÓu NhÞ (yÕn tiÖc Long M«n)",5,1},
			},
		[5] = 
			{
				[0] = "B¶n ®å nhiÖm vô",
				[1] = {"NewWorld(502,1637,3237)","Hoa S¬n",4,0},
				[2] = {"NewWorld(6016,1499,3094)","Mai Trang",4,1},
				[3] = {"NewWorld(6024,1652,3093)","ThiÕt Ch­ëng S¬n Trang",4,1},
				[4] = {"NewWorld(6025,1699,3397)","ThÇn ®iÖn",4,1},
			},
	},
}

FLIGHTPOSTASKID_BEGIN = 90
FLIGHTPOSTASKID_1 = 90
FLIGHTPOSTASKID_2 = 91
FLIGHTPOSTASKID_3 = 92
FLIGHTPOSTASKID_4 = 93
FLIGHTPOSTASKID_5 = 94
FLIGHTPOSTASKID_END = 94

Tb_map_caiji = {704,705,706,707,710,711,712,713,714,715,716,717,718,719,720,721,722,723,724,6024,6025}
-- Ê¹ÓÃÎïÆ·µÄÊ±ºò£¬Ä¬ÈÏµÄÈë¿Úº¯Êý
function OnUse(nIdx)
--	if GetFightState() == 1 and GetPKFlag() ~= 0 then	--Õ½¶·×´Ì¬ÏÂPKÄ£Ê½²»¿ÉÒÔÊ¹ÓÃ
--		Talk(1,"","ÔÚÕ½¶·×´Ì¬ÏÂ£¬ÒªÏÈÉèÖÃÎªÁ·¹¦Ä£Ê½²ÅÄÜÊ¹ÓÃÉñÐÐ±¦µä¡£");
--		return 0;
--	end;
	local nMapID = GetWorldPos()
	local caji_map_chk_flag = 0
	for i = 1, getn(Tb_map_caiji) do
		if nMapID == Tb_map_caiji[i] then
			caji_map_chk_flag = 1
			break
		end
	end
	if nMapID == 606 or nMapID == 101 or (nMapID >= 700 and caji_map_chk_flag == 0) then
		Talk(1,"","Khu vùc nµy kh«ng thÓ dïng ThÇn Hµnh b¶o ®iÓn.");
		return 0;
	end;
	local nScrollIndex = tonumber(nIdx)		-- ±»Ê¹ÓÃµÄÉñÐÐ±¦µäµÄIndex
	
	local nleft = AbradeItem(nScrollIndex, 0)
	if (nleft == 0) then
		Say("§é bÒn ThÇn Hµnh b¶o ®iÓn cña b¹n lµ 0, tan r· thµnh tõng m¶nh!", 0)
		DelItemByIndex(nScrollIndex, 0)					-- ÄÍ¾ÃÎª0ÒªÉ¾³ýµôÎïÆ·
	end
	local selTab = {};
	tinsert(selTab,"Ta muèn tíi 1 vµi n¬i mµ ta ®i gÇn ®©y/#flight_recently("..nScrollIndex..")");
	for i=1,getn(TB_DES_INFO) do
		tinsert(selTab,"Ta muèn ®i"..format(TB_DES_INFO[i][0].."/#list_destination(%d,%d)",nScrollIndex,i));
	end;
	tinsert(selTab,"T¹m thêi ch­a sö dông!/cancel_dialog");
	Say("B¹n muèn dïng ThÇn Hµnh b¶o ®iÓn ®Õn ®©u?",getn(selTab),selTab);
end;

function list_destination(nScrollIndex,...)
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	if type(tbDes[1][1]) == "table" then	--»¹µÃÉîÈëÒ»²ã
		local selTab = {};
		for i=1,getn(tbDes) do
			arg[nArgSize+1] = i;
			arg.n = nArgSize+1;
			szCmdStr = tbDes[i][0]..get_cmd_string("list_destination",nScrollIndex,gf_UnPack(arg));
			tinsert(selTab,szCmdStr);
		end;
		tinsert(selTab,"Quay vÒ trang trang ®èi tho¹i/#OnUse("..nScrollIndex..")")
		tinsert(selTab,"T¹m thêi ch­a sö dông!/cancel_dialog");
		Say("Ng­¬i muèn ®i ®©u?",getn(selTab),selTab);
	else
		list_page(1,nScrollIndex,gf_UnPack(arg))
	end;
end;

function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

MAX_SEL_PER_PAGE = 7;	--Ò»Ò³×î¶à¿ÉÏÔÊ¾ÊýÁ¿

function list_page(nPageNum,nScrollIndex,...)
	local tbDesTab = get_destination_list(nScrollIndex,gf_UnPack(arg));
	local nRecordCount = getn(tbDesTab);
	local GetMaxItemCountPerPage = function(nPN,nRC)	--Õâ¸öº¯ÊýÊÇÓÃÀ´»ñµÃµ±Ç°Ò³ÊýµÄ×î´óÏÔÊ¾ÏîÄ¿ÊýµÄ
		local nCount = nRC-(nPN-1)*MAX_SEL_PER_PAGE;
		if nCount >= MAX_SEL_PER_PAGE then
			return MAX_SEL_PER_PAGE
		else
			return mod(nCount,MAX_SEL_PER_PAGE);
		end;
	end;
	local nMaxIndex = GetMaxItemCountPerPage(nPageNum,nRecordCount);
	local nCurStartIndex = (nPageNum-1)*MAX_SEL_PER_PAGE+1;
	local selTab = {};
	for i=nCurStartIndex,nCurStartIndex+nMaxIndex-1 do
		tinsert(selTab,tbDesTab[i]);
	end;
	local szCmdStr = "";
	if nPageNum ~= 1 then
		szCmdStr = "Trang tr­íc"..get_cmd_string("list_page",nPageNum-1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);
	end;
	if nPageNum ~= ceil(nRecordCount/MAX_SEL_PER_PAGE) then
		szCmdStr = "Trang kÕ"..get_cmd_string("list_page",nPageNum+1,nScrollIndex,gf_UnPack(arg));
		tinsert(selTab,szCmdStr);	
	end;
	tinsert(selTab,"Quay vÒ trang trang ®èi tho¹i/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"T¹m thêi ch­a sö dông!/cancel_dialog");
	local nMaxPage = ceil(getn(tbDesTab)/MAX_SEL_PER_PAGE);
	Say("Ng­¬i muèn ®Õn n¬i nµo? HiÖn lµ trang <color=yellow>"..nPageNum.."<color>, tæng céng <color=yellow>"..nMaxPage.."<color> trang.",getn(selTab),selTab);
end;

function get_destination_list(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ sö dông thÇn hµnh.")
		return 0
	end
	local tSelTab = {};
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nArgSize = arg.n;
	local szCmdStr = "";
	for i=1,getn(tbDes) do
		arg[nArgSize+1] = i;
		arg.n = nArgSize+1;
		szCmdStr = tbDes[i][2].."(tiªu hao ®é bÒn "..tbDes[i][3].." ®iÓm)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(arg));
		tinsert(tSelTab,szCmdStr);
	end;
	return tSelTab;
end;

function go_to_destination(nScrollIndex,...)
	if IsPlayerDeath() == 1 or IsStalling() == 1 then
		Talk(1,"","Tr¹ng th¸i hiÖn t¹i kh«ng thÓ sö dông thÇn hµnh.")
		return 0
	end
	local tbDes = TB_DES_INFO;
	for i=1,getn(arg) do
		tbDes = tbDes[arg[i]];
	end;
	local nCost = tbDes[3];
	local nFightState = tbDes[4];
	CleanInteractive();
	if type(tbDes[1]) == "string" then
		dostring(tbDes[1]);
		AbradeItem(nScrollIndex, nCost);
		SetFightState(nFightState);
	elseif type(tbDes[1]) == "number" then
		AbradeItem(nScrollIndex, nCost);
		UseFlightList(tbDes[1],nScrollIndex,nCost);
	end;
	set_recently_pos(arg)
	Msg2Player("Tiªu hao ®é bÒn"..nCost.." ®iÓm");
end;

-- È¥×î½üµÄÒ»Ð©µØ·½
function flight_recently(nScrollIndex)
	local tbPosInfo = {};
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do
		tinsert(tbPosInfo,GetTask(i));
	end;
	if GetTask(FLIGHTPOSTASKID_BEGIN) == 0 then
		Talk(1,"#OnUse("..nScrollIndex..")","GÇn ®©y ng­¬i kh«ng dïng ThÇn hµnh b¶o ®iÓn sao.");
		return 0;
	end;
	local selTab = {};
	local tbDes = {};
	local tbIndex = {};
	for i=1,getn(tbPosInfo) do
		tbIndex = get_pos_index(tbPosInfo[i]);
		local szPlaceHeader = "";
		if getn(tbIndex) >= 2 then	--¾ÉµÄÉñÐÐgetn(tbIndex) == 1
			tbDes = TB_DES_INFO;
			for j=1,getn(tbIndex) do
				tbDes = tbDes[tbIndex[j]];
				--Èç¹ûtbDesÊÇnil£¬ÄÇÃ´¾ÍÓÐ¿ÉÄÜÊÇÈÎÎñ±äÁ¿µÄÖµ³ö´íÁË
				if tbDes ~= nil and tbDes[0] ~= nil then
					szPlaceHeader = szPlaceHeader..tbDes[0].."--";
				end;
			end;
			if tbDes ~= nil then	--Èç¹ûÊÇnilÖµ¾ÍÌø¹ý
				szCmdStr = szPlaceHeader..tbDes[2].."(tiªu hao ®é bÒn "..tbDes[3].." ®iÓm)"..get_cmd_string("go_to_destination",nScrollIndex,gf_UnPack(tbIndex));
				tinsert(selTab,szCmdStr);
			end;
		end;
	end;
	tinsert(selTab,"\nTrë vÒ khung ®èi tho¹i chÝnh/#OnUse("..nScrollIndex..")")
	tinsert(selTab,"T¹m thêi ch­a sö dông!/cancel_dialog");
	Say("Xin chän ®Þa ®iÓm muèn ®Õn:",getn(selTab),selTab);
end;
--¸ù¾ÝÈÎÎñ±äÁ¿Ëã³öÎ»ÖÃµÄË÷Òý
function get_pos_index(nTaskValue)
	local tbRet = {};
	local nIndex1 = mod(nTaskValue,1000);
	local nIndex2 = floor(mod(nTaskValue,100000)/1000);
	local nIndex3 = floor(nTaskValue/100000);
	local tb = {nIndex3,nIndex2,nIndex1};
	for i=1,getn(tb) do
		if tb[i] ~= 0 then
			tinsert(tbRet,tb[i]);
		end;
	end;
	return tbRet;
end;
--¼ÆËãÎ»ÖÃÐÅÏ¢Öµ
function generate_pos_index_value(tbPos)
	local nRetValue = 0;
	if getn(tbPos) == 2 then
		nRetValue = tbPos[1]*1000+tbPos[2];
	else
		nRetValue = tbPos[1]*100000+tbPos[2]*1000+tbPos[3];
	end;
	return nRetValue;
end;
-- ÉèÖÃ×î½üÈ¥¹ýµÄµØ·½
function set_recently_pos(tbPos)
	local nPosTskValue = generate_pos_index_value(tbPos);
	for i=FLIGHTPOSTASKID_BEGIN,FLIGHTPOSTASKID_END do	--Ïòºó±éÀú´¦Àí
		if GetTask(i) == nPosTskValue then
			for j=i,FLIGHTPOSTASKID_BEGIN+1,-1 do	--ÏòÇ°±éÀú´¦Àí
				SetTask(j,GetTask(j-1));
			end;
			SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
			return 1;
		end;
	end;
	for i=FLIGHTPOSTASKID_END,FLIGHTPOSTASKID_BEGIN+1,-1 do	--´ÓºóÏòÇ°±éÀú
		SetTask(i,GetTask(i-1));
	end;
	SetTask(FLIGHTPOSTASKID_BEGIN,nPosTskValue);
	return 1;
end;

function get_cmd_string(szCallBackFunc,...)
	local szCmdStr = "";
	szCmdStr = "/#"..szCallBackFunc.."(";
	for i=1,getn(arg) do
		szCmdStr = szCmdStr.."%d,"
	end;
	szCmdStr = strsub(szCmdStr,1,strlen(szCmdStr)-1);
	szCmdStr = szCmdStr..")";	--°Ñ×îºóÃæÄÇ¸ö¶ººÅ»»³ÉÓÒÀ¨ºÅ
	szCmdStr = format(szCmdStr,gf_UnPack(arg));
	return szCmdStr;
end;

function cancel_dialog()
end;


