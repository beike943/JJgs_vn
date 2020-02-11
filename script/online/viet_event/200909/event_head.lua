--=============================================
--create by baiyun 2009.8.24
--describe:Ô½ÄÏ°æ9ÔÂ·ÝÖÐÇï»î¶¯Í·ÎÄ¼þ
--=============================================
Include("\\script\\lib\\globalfunctions.lua");
VIET_0909_TASK_SHANGXIAN_AWORD = 2263;	--ÁìÈ¡ÉÏÏß½±ÀøµÄÈÕÆÚ
VIET_0909_TASK_SHIMENG_DATE = 2264;			--Ê¦ÃÅÈÎÎñµÃµ½°×Ãæ°üµÄÈÕÆÚ
VIET_0909_TASK_SHIMENG_NUM = 2265;			--Ê¦ÃÅÈÎÎñµÃµ½°×Ãæ°üµÄÊýÁ¿
VIET_0909_TASK_ALREADY_GET_EXP = 2266;	--Ê¹ÓÃÂÌ¶¹±ýºÍÊ²½õ±ýÒÑ¾­»ñµÃµÄ¾­Ñé
VIET_0909_TASK_GET_BOX_DATE = 2267;			--ÁìÈ¡±¦ÏäµÄÈÕÆÚ
VIET_0909_TASK_OPEN_BOX_DATE = 2268;		--´ò¿ªÏä×ÓµÄÈÕÆÚ
VIET_0909_TASK_OPEN_BOX_COUNT = 2269;		--½ñÌìÒÑ¾­´ò¿ªµÄÏä×ÓµÄÊýÁ¿
VIET_0909_TASK_GET_FUZHU_DATE = 2270;		--½ÓÊÜ¸¨ÖúµÄÈÕÆÚ
VIET_0909_TASK_GET_FUZHU_TYPE = 2271;		--½ÓÊÜ¸¨ÖúµÄÀàÐÍ
VIET_0908_TASK_GET_SHAQI_DATE = 2087;					--»ñµÃÉ±ÆøÖµµÄÈÕÆÚ
VIET_0908_TASK_GET_SHAQI_COUNT = 2088;				--»ñµÃÉ±ÆøÖµµÄÊýÁ¿

--ÉÏÏß½±Àø
tbVIET_0909_SHANGXIAN_AWORD = {
	{3000, 3999, 200000},
	{4000, 4999, 300000},
	{5000, 5999, 400000},
	{6000, 6999, 500000},
	{7000, 7999, 600000},
	{8000, 8999, 700000},
	{9000, 9999, 800000},
	{10000, 10999, 900000},
	{11000, 14999, 1000000},
	{15000, 19999, 1100000},
	{20000, 24999, 1200000},
	{25000, 0, 1300000},
};
--ÉÏÏß½±Àø¸øµÄ°×Ãæ°üÊýÁ¿
tbVIET_0909_SHANGXIAN_AWARD2 = {
	[1] = 50,
	[2] = 50,
	[3] = 50,
	[4] = 100,
	[5] = 100,
	[6] = 100,
	[7] = 100,
	[8] = 150,
	[9] = 150,
	[10] = 150,
	[11] = 150,
	[12] = 150,
};

--Í¨¹ýÊ¦ÃÅÈÎÎñ»ñµÃµÄ°×Ãæ°üµÄÊýÁ¿
tVIET_SHIMEN_BAIMIANBAO = {
	[1] = 10,
	[2] = 10,
	[3] = 20,
	[4] = 30,
	[5] = 50,
	[6] = 50,
	[7] = 70,
	[8] = 70,
	[9] = 80,
};

tbViet_0908_SkillID = 
	{
		[0] = 0,
		[1] = 0,	
		[2] = 32,	--ÉÙÁÖË×¼Ò,Ò×½î¾­
		[3] = 57,	--ÉÙÁÖìøÉ®,Ï´Ëè¾­
		[4] = 44,	--ÉÙÁÖÎäÉ®,ÈçÀ´ÉñÕÆ
		[5] = 0,			--ÌÆÃÅ
		[6] = 74,	--ÌÆÃÅ,ÎüÐÇÕó
		[7] = 0,			--¶ëáÒ
		[8] = 89,	--¶ëáÒ·ð¼Ò,ÍòÏàÉñ¹¦
		[9] = 102,	--¶ëáÒË×¼Ò,ÌìÒôÕò»êÇú
		[10] = 0,			--Ø¤°ï
		[11] = 113,--Ø¤°ï¾»ÒÂ,½µÁúÊ®°ËÕÆ
		[12] = 124,--Ø¤°ïÎÛÒÂ,´ò¹·¹÷Õó
		[13] = 0,			--Îäµ±
		[14] = 146,--Îäµ±µÀ¼Ò,ÎÞÉÏÌ«¼«½£
		[15] = 159,--Îäµ±Ë×¼Ò,Ì«¼«Éñ¹¦
		[16] = 0,			--ÑîÃÅ
		[17] = 732,--ÑîÃÅÇ¹Æï,Á¬»·×êÁúÇ¹
		[18] = 745,--ÑîÃÅ¹­Æï,°ÔÍõÏè·ï¼ý
		[19] = 0,			--Îå¶¾
		[20] = 775,--Îå¶¾Ð°ÏÀ,ÎÞÌìÄ§¹¦
		[21] = 774,--Îå¶¾¹ÆÊ¦,ÎÞÓ°Ä§¹Æ
};

--ÄÚ¹¦¸¨Öú¹¦ÄÜ,ÊôÐÔ×Ö·û´®£¬³öÏÖ¸ÅÂÊ£¬ÒªÐÞ¸ÄµÄÊôÐÔÖµ£¬ËµÃ÷
viet_0909_tb_InBuff = {
					{"T¨ng 4000 sinh lùc", 20, {{"state_life_max_point_add", 4000}}},
					{"T¨ng 10% néi lùc", 20, {{"state_neili_max_percent_add", 10}}},
					{"T¨ng 15% s¸t th­¬ng néi c«ng", 20, {{"state_m_attack_percent_add", 15}}},
					{"T¨ng 15% phßng thñ néi c«ng", 20, {{"state_magic_parmor_poi_add", 15}}},
					{"Kh¸ng tÊt c¶ +20", 10, {{"state_add_dexterity", 20}, {"state_add_energy", 20}, {"state_add_observe", 20}, {"state_add_strength", 20}, {"state_add_vitality", 20}}},
					{"T¨ng 15 s¸t thñ vµ phßng thñ néi c«ng", 10, {{"state_m_attack_percent_add", 15}, {"state_magic_parmor_per_add", 15}}}
};

--Íâ¹¦¸¨Öú¹¦ÄÜ
viet_0909_tb_OutBuff = {
					{"T¨ng 4000 sinh lùc", 20, {{"state_life_max_point_add", 4000}}},
					{"T¨ng 10% néi lùc", 20, {{"state_neili_max_percent_add", 10}}},
					{"T¨ng 15%  s¸t th­¬ng ngo¹i c«ng", 20, {{"state_p_attack_percent_add", 15}}},
					{"T¨ng 15% phßng thñ ngo¹i c«ng", 20, {{"state_physical_parmor_poi_add", 15}}},
					{"Kh¸ng tÊt c¶ +20", 10, {{"state_add_dexterity", 20}, {"state_add_energy", 20}, {"state_add_observe", 20}, {"state_add_strength", 20}, {"state_add_vitality", 20}}},
					{"T¨ng 15% phßng thñ vµ s¸t th­¬ng ngo¹i c«ng", 10, {{"state_p_attack_percent_add", 15}, {"state_physical_parmor_per_add", 15}}}
};


--Ê²½õ±ýµÄ½±Àø¾­Ñé,¸ÅÂÊ»ùÊý1000
tbVIET_0909_SHIJINBING_EXP = {
	{100000, 590},
	{125000, 200},
	{150000, 160},
	{200000, 20},
	{250000, 10},
	{300000, 10},
	{500000, 5},
	{1000000, 5},
};

--Ê²½õ±ýºÍÂÌ¶¹±ýµÄÎïÆ·½±Àø£¬»ùÊý1000000
tbVIET_0909_SJLD_AWARD = {
	{"Bµn Long bÝch", 2500, {2, 1, 1000, 1}, 15 * 24 * 3600},
	{"M¶nh Thiªn th¹ch", 20000, {2, 2, 7, 1}, 0},
	{"Thiªn th¹ch", 20000, {2, 2, 8, 1}, 0},
	{"M¶nh B¨ng th¹ch", 30000, {2, 1, 148, 1},  0},
	{"B¨ng th¹ch", 20000, {2, 1, 149, 1}, 0},
	{"TÈy Tñy linh ®¬n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"§ång TiÒn Vµng", 1000, {2, 1, 30094, 1}, 0},
	{"Lé thñy", 500000, {2, 0, 351, 1}, 0},
	{"Tu Ch©n YÕu QuyÕt", 26879, {2, 0, 554, 1}, 15 * 24 * 3600},
	{"R­¬ng BÝ KÝp", 500, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"R­¬ng YÕu QuyÕt_Cao CÊp", 20, {2, 1, 30112, 1}, 30 * 24 * 3600},
	{"Phông HuyÕt hoµn", 100, {2, 1, 1004, 1}, 15 * 24 * 3600},
	{"Long HuyÕt hoµn", 100, {2, 1, 1002, 1}, 15 * 24 * 3600},
	{"Kú L©n hoµn", 100, {2, 1, 1003, 1}, 15 * 24 * 3600},
	{"ChiÕn ThÇn hoµn", 100, {2, 1, 1005, 1}, 15 * 24 * 3600},
	{"§Êu hån", 2000, {2, 1, 1157, 1}, 15 * 24 * 3600},
	{"ThÇn N«ng §¬n", 5000, {2, 1, 343, 1}, 15 * 24 * 3600},
	{"V¨n CÈm H¹p", 1000, {2, 1, 1100, 1}, 15 * 24 * 3600},
	{"Qu©n C«ng Ch­¬ng", 1000, {2, 1, 9999, 1}, 15 * 24 * 3600},
	{"Th¸i H­ §a MËt Qu¶ ", 10000, {2, 1, 387, 1}, 15 * 24 * 3600},
	{"S­ m«n t×nh nguyÖn th­", 2500, {2, 1, 1019, 1}, 15 * 24 * 3600},
	{"S­ m«n lÖnh th­", 2500, {2, 1, 1016, 1}, 15 * 24 * 3600},
	{"Tµng KiÕm anh hïng thiÕp", 5000, {2, 0, 31, 1}, 15 * 24 * 3600},
	{"ThÕ Th©n phï", 15000, {2, 0, 556, 1}, 15 * 24 * 3600},
	{"Tranh S¾c Yªn Hoa", 40000, {2, 1, 189, 1}, 0},
	{"Lam S¾c Yªn Hoa", 40000, {2, 1, 190, 1}, 0},
	{"èng B«ng GiÊy", 253100, {2, 1, 30092, 1}, 0},
	{"Nh©n S©m V¹n N¨m", 1000, {2, 1, 30071, 1}, 0},
	{"B¶o R­¬ng §Æc BiÖt", 1, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"R­¬ng TrÊn Ph¸i", 500, {2, 1, 30113, 1}, 30 * 24 * 3600},
};

--°Ù±¦Ïä_»ÆµÄ½±ÀøÁÐ±í£¬¸ÅÂÊ»ùÊýÎª1000000
tbVIET_0909_BAIBAOXIANG = {
	{"Tu ch©n yÕu quyÕt",10000,{2,0,554,1},15*24*3600},	
	{"C©y b¸t nh·",2400,{2,0,398,1},15*24*3600},	
	{"Tiªu KiÕp T¸n",2000,{2,0,141,1},15*24*3600},	
	{"TiÓu nh©n s©m qu¶",4000,{2,0,552,1},15*24*3600},	
	{"Bµn long bÝch",4000,{2,1,1000,1},15*24*3600},	
	{"NguyÖt Hoa",3800,{2,1,2002,1},0},	
	{"ThÕ th©n phï",2700,{2,0,556,1},15*24*3600},	
	{"MÆt n¹ s¸t thñ ®­êng",2700,{2,1,1087,1},15*24*3600},	
	{"Tµng kiÕm anh hïng thiÕp",2700,{2,0,31,1},15*24*3600},	
	{"S­ m«n lÖnh th­",2700,{2,1,1016,1},15*24*3600},	
	{"Gi¸n ®iÖp trang",2700,{2,1,9995,1},15*24*3600},	
	{"Th¸i h­ ®a mËt qu¶",2000,{2,1,387,1},15*24*3600},	
	{"S­ m«n t×nh nguyÖn th­",2000,{2,1,1019,1},15*24*3600},	
	{"Qu©n c«ng ch­¬ng",2000,{2,1,9999,1},15*24*3600},	
	{"Tinh luyÖn b¨ng th¹ch",1300,{2,1,533,1},15*24*3600},	
	{"§¹i nh©n s©m ",1300,{2,0,553,1},15*24*3600},	
	{"Qu©n c«ng bµi",1300,{2,1,997,1},15*24*3600},	
	{"XÝch thè",1300,{0,105,9,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"Tr¶o hoµng phi ®iÖn",1300,{0,105,11,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"TÈy Tñy §¬n",1100,{2,0,136,1},15*24*3600},	
	{"C¬ quan nh©n",800,{2,1,1011,1},15*24*3600},	
	{"Hèt l«i b¸c",800,{0,105,12,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"B¶o r­¬ng tµng kiÕm y gi¸p",800,{2,1,1060,1},15*24*3600},	
	{"Bé c¶nh",700,{0,105,13,1,1,-1,-1,-1,-1,-1,-1},30*24*3600},	
	{"Lôc l©m lang yªn",600,{2,1,1014,1},15*24*3600},	
	{"Thñy hoµng bÝ chiÕu",600,{2,1,1047,1},15*24*3600},	
	{"Uyªn ­¬ng kim ti b¹c",600,{2,1,1048,1},15*24*3600},	
	{"Cöu ChuyÓn Håi Hån §¬n (x100)",500,{1,0,32,100},0},	
	{"B¶o r­¬ng tµng kiÕm hoa khè",500,{2,1,1061,1},15*24*3600},	
	{"VÖ quèc y",400,{0,109,121,1},30*24*3600},	
	{"H¾c thiÕt y",400,{0,109,122,1},30*24*3600},	
	{"Tö vËn y",400,{0,109,124,1},30*24*3600},	
	{"Thóy nh©n y",400,{0,109,123,1},30*24*3600},	
	{"ChiÕn bµo cóp thÕ giíi",400,{2,1,505,1},15*24*3600},	
	{"Tr­êng kh«ng bao",400,{2,0,596,1},15*24*3600},	
	{"Huy hiÖu chiÕn c«ng ®¹i",400,{2,1,9998,1},15*24*3600},	
	{"NguyÖt Hoa chi tinh",400,{2,1,3219,1},15*24*3600},	
	{"ThÇn hµnh bÝ phæ",300,{0,200,39,1},15*24*3600},	
	{"V« ngÊn thñy",300,{2,1,503,1},15*24*3600},	
	{"B¶o r­¬ng tµng kiÕm ®Çu qu¸n",300,{2,1,1059,1},15*24*3600},	
	{"B¶o r­¬ng tµng kiÕm vò khÝ",300,{2,1,1063,1},15*24*3600},	
	{"B¶o r­¬ng tµng kiÕm trang søc",300,{2,1,1062,1},15*24*3600},	
	{"R­¬ng bÝ kÝp",200,{2,1,30093,1},15*24*3600},	
	{"TÈy Tñy Linh §¬n",100,{2,0,137,1},15*24*3600},	
	{"Bao m¶nh thiªn th¹ch",100,{2,1,1049,1},15*24*3600},	
	{"N÷ oa tinh th¹ch",100,{2,1,504,1},15*24*3600},	
	{"Hßa ThÞ BÝch",100,{2,1,1001,1},15*24*3600},		
	{"ThÇn hµnh b¶o ®iÓn",50,{0,200,40,1},15*24*3600},	
	{"Huy hiÖu chiÕn c«ng (huy hoµng)",50,{2,1,9977,1},15*24*3600},	
	{"20 vµng",20000,"Earn(%d)",200000},
	{"30 vµng",10000,"Earn(%d)",300000},
	{"40 vµng",5000,"Earn(%d)",400000},
	{"50 vµng ",4000,"Earn(%d)",500000},
	{"100 vµng",3400,"Earn(%d)",1000000},
	{"5h ñy th¸c b¹ch c©u hoµn",18300,"SetTask(2501, GetTask(2501) + %d)", 5*60},
	{"5h ñy th¸c lôc thÇn hoµn",24400,"EatLiushen(1, %d)", 5*60},
	{"5h ñy th¸c thÇn n«ng ®¬n",7300,"SetTask(2502, GetTask(2502) + %d)", 5*60},
	{"10h ñy th¸c b¹ch c©u hoµn",9100,"SetTask(2501, GetTask(2501) + %d)",10* 60},
	{"10h ñy th¸ch Lôc thÇn hoµn",12200,"EatLiushen(1, %d)", 10*60},
	{"10h ñy th¸c thÇn n«ng ®¬n",3700,"SetTask(2502, GetTask(2502) + %d)", 10*60},
	{"50000 exp",10000,"ModifyExp(%d)",50000},
	{"500000 exp",10000,"ModifyExp(%d)",500000},
	{"750000 exp",10000,"ModifyExp(%d)",750000},
	{"1000000 exp",20000,"ModifyExp(%d)",1000000},
	{"5000000 exp",20000,"ModifyExp(%d)",5000000},
	{"§ång tiÒn vµng",30000,{2,1,30094,1},0},	
	{"20 danh väng",40000,"ModifyReputation(%d,0)",20},	
	{"30 danh väng",30000,"ModifyReputation(%d,0)",30},
	{"50 danh väng",20000,"ModifyReputation(%d,0)",50},
	{"70 danh väng",10000,"ModifyReputation(%d,0)",70},
	{"100 danh väng",4000,"ModifyReputation(%d,0)",100},
	{"20 ®iÓm cèng hiÕn s­ m«n",40000,"SetTask(336, GetTask(336) + %d)", 20}	,
	{"30 ®iÓm cèng hiÕn s­ m«n",30000,"SetTask(336, GetTask(336) + %d)", 30},
	{"50 ®iÓm cèng hiÕn s­ m«n",20000,"SetTask(336, GetTask(336) + %d)", 50},
	{"70 ®iÓm cèng hiÕn s­ m«n",10000,"SetTask(336, GetTask(336) + %d)", 70},
	{"100 ®iÓm cèng hiÕn s­ m«n",4000,"SetTask(336, GetTask(336) + %d)", 100},
	{"100 Kho¸ng th¹ch qu©n dông",45000,{2,0,307,100},0},	
	{"150 Kho¸ng th¹ch qu©n dông",20000,{2,0,307,150},0},	
	{"200 Kho¸ng th¹ch qu©n dông",10000,{2,0,307,200},0},	
	{"100 D­îc th¶o qu©n dông",45000,{2,0,312,100},0},	
	{"150 D­îc th¶o qu©n dông",20000,{2,0,312,150},0},	
	{"200 D­îc th¶o qu©n dông",10000,{2,0,312,200},0},	
	{"100 Gç qu©n dông",45000,{2,0,308,100},0},	
	{"150 Gç qu©n dông",20000,{2,0,308,150},0},	
	{"200 Gç qu©n dông",10000,{2,0,308,200},0},	
	{"100 T¬ t»m qu©n dông",45000,{2,0,311,100},0},	
	{"150 T¬ t»m qu©n dông",20000,{2,0,311,150},0},	
	{"200 T¬ t»m qu©n dông",10000,{2,0,311,200},0},	
	{"100 Thuéc da qu©n dông",40000,{2,0,310,100},0},	
	{"150 Thuéc da qu©n dông",20000,{2,0,310,150},0},	
	{"200 Thuéc da qu©n dông",10000,{2,0,310,200},0},	
	{"100 Linh huyÕt qu©n dông",40000,{2,0,313,100},0},	
	{"150 Linh huyÕt qu©n dông",20000,{2,0,313,150},0},	
	{"200 Linh huyÕt qu©n dông",10000,{2,0,313,200},0},	
	{"100 Lóa m¹ch qu©n dông",40000,{2,0,309,100},0},	
	{"150 Lóa m¹ch qu©n dông",20000,{2,0,309,150},0},	
	{"200 Lóa m¹ch qu©n dông",10000,{2,0,309,200},0},	
};

--¸ß¼¶Òª¾÷ÏäÎïÆ·ÁÐ±í,¸ÅÂÊ»ùÊýÎª100
tbVIET_0909_GAOJIYAOJUE = {
	{"§¹t Ma Vò quyÕt", 7, {2, 6, 10, 1}},
	{"HuÖ Nh·n quyÕt", 7, {2, 6, 14, 1}},
	{"S­ Tö Hèng", 7, {2, 6, 29, 1}},
	{"M·n Thiªn Vò quyÕt", 7, {2, 6, 46, 1}},
	{"Thanh Ph¹n quyÕt", 7, {2, 6, 53, 1}},
	{"Phóc Thñy ph¸p", 7, {2, 6, 67, 1}},
	{"Tóy §iÖp", 7, {2, 6, 78, 1}},
	{"§¶ CÈu quyÕt", 7, {2, 6, 88, 1}},
	{"TÝch D­¬ng KiÕm quyÕt", 7, {2, 6, 99, 1}},
	{"ThiÕu D­¬ng quyÕt", 7, {2, 6, 114, 1}},
	{"Ngù M· quyÕt", 7, {2, 6, 129, 1}},
	{"L­u TuyÖt TiÔn quyÕt", 7, {2, 6, 141, 1}},
	{"BÝ kiÕp Th«i Thi Tµ KhÝ", 7, {2, 6, 151, 1}},
	{"BÝ kiÕp HuyÔn Cæ", 7, {2, 6, 167, 1}},
};

--ÕóÅÉÏä½Å±¾ÁÐ±í
tbVIET_0909_ZHENPAIXIANG = {
	{"DÞch C©n Kinh-th­îng", 2, {2, 1, 916, 1}},
	{"DÞch C©n Kinh-trung", 2, {2, 1, 917, 1}},
	{"DÞch C©n Kinh-h¹ ", 2, {2, 1, 918, 1}},
	{"Nh­ Lai ThÇn Ch­ëng-th­îng", 2, {2, 1, 919, 1}},
	{"Nh­ Lai ThÇn Ch­ëng-trung", 2, {2, 1, 920, 1}},
	{"Nh­ Lai ThÇn Ch­ëng-h¹ ", 2, {2, 1, 921, 1}},
	{"TÈy Tñy Kinh-th­îng", 2, {2, 1, 922, 1}},
	{"TÈy Tñy Kinh-trung", 2, {2, 1, 923, 1}},
	{"TÈy Tñy Kinh-h¹ ", 2, {2, 1, 924, 1}},
	{"HÊp Tinh TrËn-th­îng", 2, {2, 1, 925, 1}},
	{"HÊp Tinh TrËn-trung", 2, {2, 1, 926, 1}},
	{"HÊp Tinh TrËn-h¹ ", 2, {2, 1, 927, 1}},
	{"V¹n T­íng ThÇn C«ng-th­îng", 2, {2, 1, 928, 1}},
	{"V¹n T­íng ThÇn C«ng-trung", 2, {2, 1, 929, 1}},
	{"V¹n T­íng ThÇn C«ng-h¹ ", 2, {2, 1, 930, 1}},
	{"Thiªn ¢m TrÊn Hån Khóc-th­îng", 2, {2, 1, 931, 1}},
	{"Thiªn ¢m TrÊn Hån Khóc-trung", 2, {2, 1, 932, 1}},
	{"Thiªn ¢m TrÊn Hån Khóc-h¹ ", 2, {2, 1, 933, 1}},
	{"Gi¸ng Long ThËp B¸t Ch­ëng-th­îng", 2, {2, 1, 934, 1}},
	{"Gi¸ng Long ThËp B¸t Ch­ëng-trung", 2, {2, 1, 935, 1}},
	{"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ", 2, {2, 1, 936, 1}},
	{"§¶ CÈu C«n TrËn-th­îng", 2, {2, 1, 937, 1}},
	{"§¶ CÈu C«n TrËn-trung", 2, {2, 1, 938, 1}},
	{"§¶ CÈu C«n TrËn-h¹ ", 2, {2, 1, 939, 1}},
	{"V« Th­îng Th¸i Cùc KiÕm-th­îng", 2, {2, 1, 940, 1}},
	{"V« Th­îng Th¸i Cùc KiÕm-trung", 2, {2, 1, 941, 1}},
	{"V« Th­îng Th¸i Cùc KiÕm-h¹ ", 2, {2, 1, 942, 1}},
	{"Th¸i Cùc ThÇn C«ng-th­îng", 2, {2, 1, 943, 1}},
	{"Th¸i Cùc ThÇn C«ng-trung", 2, {2, 1, 944, 1}},
	{"Th¸i Cùc ThÇn C«ng-h¹ ", 2, {2, 1, 945, 1}},
	{"Liªn Hoµn Toµn Long Th­¬ng-th­îng", 2, {2, 1, 946, 1}},
	{"Liªn Hoµn Toµn Long Th­¬ng-trung", 2, {2, 1, 947, 1}},
	{"Liªn Hoµn Toµn Long Th­¬ng-h¹ ", 2, {2, 1, 948, 1}},
	{"B¸ V­¬ng T­êng Phông TiÔn-th­îng", 2, {2, 1, 949, 1}},
	{"B¸ V­¬ng T­êng Phông TiÔn-trung", 2, {2, 1, 950, 1}},
	{"B¸ V­¬ng T­êng Phông TiÔn-h¹ ", 2, {2, 1, 951, 1}},
	{"V« ¶nh Ma Cæ-th­îng", 2, {2, 1, 952, 1}},
	{"V« ¶nh Ma Cæ-trung", 2, {2, 1, 953, 1}},
	{"V« ¶nh Ma Cæ-h¹ ", 2, {2, 1, 954, 1}},
	{"V« Thiªn Ma C«ng-th­îng", 2, {2, 1, 955, 1}},
	{"V« Thiªn Ma C«ng-trung", 2, {2, 1, 956, 1}},
	{"V« Thiªn Ma C«ng-h¹ ", 2, {2, 1, 957, 1}},
	{"Kim Cang B¸t Nh· Kinh", 1, {0, 107, 166, 1}},
	{"TiÒm Long TÞch DiÖt Kinh", 1, {0, 107, 167, 1}},
	{"V« TrÇn Bå §Ò Kinh", 1, {0, 107, 168, 1}},
	{"Thiªn La Liªn Ch©u Lôc", 1, {0, 107, 169, 1}},
	{"Nh­ ý Kim §Ønh MËt TÞch", 1, {0, 107, 170, 1}},
	{"BÝch H¶i TuyÖt ¢m Phæ", 1, {0, 107, 171, 1}},
	{"Hçn §én TrÊn Nh¹c MËt TÞch", 1, {0, 107, 172, 1}},
	{"Quü Thiªn Du Long MËt TÞch", 1, {0, 107, 173, 1}},
	{"HuyÔn ¶nh Mª Tung MËt TÞch", 1, {0, 107, 174, 1}},
	{"Qu©n Tö TiÖt Phong MËt TÞch", 1, {0, 107, 175, 1}},
	{"TrÊn Qu©n Phi Long Th­¬ng", 1, {0, 107, 176, 1}},
	{"Xuyªn V©n L¹c Hång MËt TÞch", 1, {0, 107, 177, 1}},
	{"U Minh Phong Ma Lôc", 1, {0, 107, 178, 1}},
	{"Linh Cæ HuyÔn Tµ Lôc", 1, {0, 107, 179, 1}},
	{"B¸ch Th¶o mËt tÞch", 1, {0, 107, 156, 1}},
	{"Ngò Hµnh MËt tÞch", 1, {0, 107, 155, 1}},
}

--ÎÃ×Ó°ü½±Àø£¬¸ÅÂÊ»ùÊýÎª100
tb_VIET_0909_WENZIBAO = {
	{"Hßa ThÞ BÝch", 3, {2, 1, 1001, 1}, 15 * 24 * 3600},
	{"TÈy Tñy linh ®¬n", 3, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"R­¬ng BÝ KÝp", 3, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"R­¬ng YÕu QuyÕt_Cao CÊp", 1, {2, 1, 30112, 1}, 30 * 24 * 3600},
	{"R­¬ng TrÊn Ph¸i", 3, {2, 1, 30113, 1}, 30 * 24 * 3600},
	{"NguyÖt Hoa Chi Tinh", 5, {2, 1, 3219, 1}, 0},
	{"Thiªn Th¹ch linh th¹ch", 1, {2, 1, 1068, 1}, 15 * 24 * 3600},
	{"ThÇn hµnh b¶o ®iÓn", 4, {0, 200, 40, 1}, 30 * 24 * 3600},
	{"ThÕ Th©n phï", 20, {2, 0, 556, 1}, 15 * 24 * 3600},
	{"Tiªu KiÕp t¸n", 57, {2, 0, 141, 1}, 15 * 24 * 3600},
};

--ÓñÍÃÏä½±Àø£¬¸ÅÂÊ»ùÊýÎª100000
tb_VIET_0909_YUTUXIANG = {
	{"M¶nh Thiªn th¹ch", 5033, {2, 2, 7, 1}, 0},
	{"Thiªn th¹ch", 5000, {2, 2, 8, 1}, 0},
	{"B¨ng th¹ch", 1400, {2, 1, 149, 1}, 0},
	{"TÈy Tñy linh ®¬n", 100, {2, 0, 137, 1}, 15 * 24 * 3600},
	{"R­¬ng BÝ KÝp", 500, {2, 1, 30093, 1}, 30 * 24 * 3600},
	{"Siªu Quang", 100, {0, 105, 19, 1,1,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
	{"Nh©n S©m V¹n N¨m", 500, {2, 1, 30071, 1}, 0},
	{"Tiªu KiÕp t¸n", 2000, {2, 0, 141, 1}, 15 * 24 * 3600},
	{"Thiªn Th¹ch linh th¹ch", 10, {2, 1, 1068, 1}, 15 * 24 * 3600},	
	{"R­¬ng TrÊn Ph¸i", 60, {2, 1, 30113, 1}, 30 * 24 * 3600},
--	{"R­¬ng YÕu QuyÕt_Cao CÊp", 20, {2, 1, 30112, 1}, 30 * 24 * 3600},
--	{"B¶o R­¬ng §Æc BiÖt", 16, {2, 1, 30091, 1}, 30 * 24 * 3600},
	{"ThÇn hµnh b¶o ®iÓn", 40, {0, 200, 40, 1}, 30 * 24 * 3600},
	{"Tö Quang Bµi", 120, {2, 0, 762, 1}, 15 * 24 * 3600},
	{"C¬m chiªn trøng", 15137, {1, 1, 14, 1}, 0},
	{"B¸nh Bét vµng", 14000, {1, 1, 15, 1}, 0},
	{"L¹c Mai", 14000, {1, 1, 16, 1}, 0},
	{"Minh NguyÖt D¹", 14000, {1, 1, 17, 1}, 0},
	{"Méc Lan Xu©n", 14000, {1, 1, 18, 1}, 0},
	{"T©y B¾c Väng", 14000, {1, 1, 19, 1}, 0},
};

VIET_0909_LOG_TITLE = "[Hoat dong trung thu 2009]";

--ÁìÈ¡ÉÏÏß½±Àø
function Viet0909_Give_ShangXian_Aword()
	if tonumber(date("%y%m%d")) < 090918 or tonumber(date("%y%m%d")) >= 091026 then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "ChØ cã thø 2, 6, 7 chñ nhËt míi cã thÓ nhËn phÇn th­ëng lªn m¹ng");
		return 0;
	end
	if nHour < 16 then
		Talk(1, "", "Thêi gian nhËn online nhËn th­ëng vµo mçi ngµy tõ 16 ®Õn 24 giê");
		return 0;
	end
	if GetLevel() < 73 or GetPlayerRoute() == 0 then
		Talk(1, "", "ThÊp h¬n cÊp 73 vµ ch­a vµo m«n ph¸i th× kh«ng thÓ nhËn lo¹i phÇn th­ëng nµy");
		return 0;
	end
	if GetTask(VIET_0909_TASK_SHANGXIAN_AWORD) >= tonumber(date("%y%m%d")) then
		Talk(1, "", "H«m nay ®¹i hiÖp ®· nhËn phÇn th­ëng, xin h·y ®îi ngµy mai");
		return 0;
	end
	local nExp = 0;
	local nRep = GetReputation();
	local nFac = GetTask(336);
	local nRepLevel = viet0909_get_aword_level(nRep, tbVIET_0909_SHANGXIAN_AWORD);
	local nFacLevel = viet0909_get_aword_level(nFac, tbVIET_0909_SHANGXIAN_AWORD);
	if nRepLevel == 0 and nFacLevel == 0 then
		Talk(1, "", "§iÓm danh väng vµ cèng hiÕn s­ m«n kh«ng ®ñ nhËn phÇn th­ëng nµy.");
		return 0;
	end
	if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then 
		return 0;
	end
	if nRepLevel ~= 0 then
		ModifyExp(tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3]);
		Msg2Player("B¹n nhËn ®­îc "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3].." ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "NhËn ®­îc "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][3] .. "  ®iÓm kinh nghiÖm")
		gf_AddItemEx({2, 1, 30106, tbVIET_0909_SHANGXIAN_AWARD2[nRepLevel]}, "Bét M×");
		WriteLogEx("Hoat dong trung thu","nhËn Danh väng "..tbVIET_0909_SHANGXIAN_AWORD[nRepLevel][1])
	end
	if nFacLevel ~= 0 then
		ModifyExp(tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3]);
		Msg2Player("B¹n nhËn ®­îc "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3].." ®iÓm kinh nghiÖm");
		WriteLog(GetName() .. "NhËn ®­îc "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][3] .. "  ®iÓm kinh nghiÖm")
		gf_AddItemEx({2, 1, 30106, tbVIET_0909_SHANGXIAN_AWARD2[nFacLevel]}, "Bét M×");
		WriteLogEx("Hoat dong trung thu","nhËn S­ m«n "..tbVIET_0909_SHANGXIAN_AWORD[nFacLevel][1])
	end
	SetTask(VIET_0909_TASK_SHANGXIAN_AWORD, tonumber(date("%y%m%d")));
end

--ÅÐ¶ÏÏÖÔÚµÄÉùÍûºÍÊ¦ÃÅ¹±Ï×¶È¿ÉÒÔ»ñµÃµÚ¼¸¼¶½±Àø
function viet0909_get_aword_level(nValue, tAword)
	for i = getn(tAword), 1, -1 do
		if tAword[i][2] == 0 then
			if nValue >= tAword[i][1] then
				return i;
			end
		else
			if nValue >= tAword[i][1] and nValue <= tAword[i][2] then
				return i;
			end
		end
	end
	return 0;
end

function Viet0909_Add_ShaQi()
	if (tonumber(date("%y%m%d")) >= 091001) then
		Talk(1, "", "Ho¹t ®éng ®· qu¸ h¹n");
		return 0;
	end
	local nDayWeek = tonumber(date("%w"));
	if nDayWeek == 2 or nDayWeek == 3 or nDayWeek == 4 then
		Talk(1, "", "ChØ t¹i thø 2, 6, 7 chñ nhËt míi cã thÓ nhËn ®­îc trÞ s¸t khÝ");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	if tbViet_0908_SkillID[nRoute] == 0 or GetSkillLevel(tbViet_0908_SkillID[nRoute]) == 0 then
		Talk(1, "", "§¹i hiÖp vÉn ch­a häc kü n¨ng trÊn ph¸i, v× vËy kh«ng thÓ t¨ng trÞ s¸t khÝ ®­îc.");
		return 0;
	end
	if GetMomentum() >= 10 then
		Talk(1, "", "TrÞ s¸t khÝ hiÖn t¹i ®· ®Çy, kh«ng thÓ t¨ng thªm ®iÓm s¸t khÝ ®­îc.");
		return 0;
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_DATE) < tonumber(date("%y%m%d")) then
		SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, 0);
	end
	if GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) >= 10 then
		Talk(1, "", "H«m nay c¸c h¹ ®· nhËn trÞ s¸t khÝ 10 lÇn råi, kh«ng thÓ nhËn thªm ®­îc n÷a.");
		return 0;
	end
	SetMomentum(GetMomentum() + 5);
	SetTask(VIET_0908_TASK_GET_SHAQI_COUNT, GetTask(VIET_0908_TASK_GET_SHAQI_COUNT) + 1);
	SetTask(VIET_0908_TASK_GET_SHAQI_DATE, tonumber(date("%y%m%d")));
	Msg2Player("B¹n nhËn ®­îc 5 ®iÓm s¸t khÝ");
	WriteLogEx("Hoat dong thang 9", "Tran phai Than Khi");
end

function viet_0909_nothing()

end