CC_NPC = "<color=green>§¹i Sø ho¹t ®éng<color>:"

CC_LOG_TITLE = "Ho¹t ®éng thÎ bµi m«n ph¸i míi"

CC_PLAYER_LEVEL_MIN = 80

CC_ANSWER_TIMES = 3;

CC_BOX_MAX_LM_CARD = 4; --boxÁéÃ¨¿¨×î¶à»ñµÃÊýÁ¿

CC_ZLP_PARK_MAX = 10;

CC_CARD2_MAX = 1000;

CC_QUESTION_LIB = {
	--{title, {options},	answer}
	{"Thóy Yªn Vò Tiªn sö dông vò khÝ g×?", 							{"a Linh Chi", "b CÇm", "c Bót", "d S¸o"}, 									1},
	{"Thó nu«i cña Thóy Yªn Linh N÷ lµ g×?", 							{"A Sãc", "b C¸o", "c Chån Tr¾ng", "d Con NhÝm"}, 							3},
	{"M«n ph¸i Thóy Yªn chiªu mé nh÷ng ®Ö tö nµo?", 						{"a Nam ®Ö tö", "b N÷ ®Ö tö", "c Nam n÷ ®Òu chiªu mé"}, 								2},
	{"Thóy Yªn Linh N÷ sö dông vò khÝ g×?", 							{"a KiÕm", "b S¸o", "c Linh Chi", "d §ao"},	 									2},
	{"M«n ph¸i Thóy Yªn n»m vÞ trÝ nµo trªn b¶n ®å?", 				{"a H­íng ®«ng b¾c", "b H­íng t©y b¾c", "c H­íng t©y nam", "d H­íng ®«ng nam"},				3},
	{"Thóy Yªn Vò Tiªn cã lo¹i tÝnh n¨ng vâ c«ng nµo hç trî ®éi ngò chiÕn ®Êu?", 	{"a Méng Xµ", "b Thiªn Háa DiÔm D­¬ng", "c MÞ Hoa", "d Linh Miªu VËn"}, 				2},
	{"Vâ c«ng trÊn ph¸i cña Thóy Yªn Vò Tiªn lµ g×?", 					{"a §¹p V©n X¶o Bé", "b §iÖp O¸n", "c Thu NguyÖt Phó", "d Loan Ph­îng Cöu Thiªn"}, 		4},
	{"S­ phô cña Thóy Yªn Vò Tiªn lµ ai?", 								{"a Chu Tö V¨n", "b Hå Man Thµnh", "c Hµ Hµi", "d Sµi Phong Nhi"}, 				1},
	{"Vâ c«ng trÊn ph¸i cña Thóy Yªn Linh N÷ lµ g×?", 					{"a L¹c Hoa QuyÕt", "b Cöu VÜ Hoa Tiªn QuyÕt", "c Tiªn L« H­¬ng", "d Ngäc Long Xuyªn NguyÖt QuyÕt"}, 2},
	{"Thó nu«i cña Thóy Yªn Linh N÷ ¨n lo¹i l­¬ng thùc nµo d­íi ®©y sÏ kh«ng häc ®­îc kü n¨ng ®Æc thï?", {"a TriÒu Thiªn Tiªu", "b Thanh L­¬ng Th¶o", "c Thiªn H­¬ng Hoa", "d MËt Qu¶"}, 4},
	{"M«n ph¸i C«n L«n chiªu mé nh÷ng ®Ö tö nµo?", 							{"a Nam ®Ö tö", "b N÷ ®Ö tö", "c Nam n÷ ®Òu chiªu mé"}, 								1},
	{"C«n L«n Thiªn S­ L­u Ph¸i sö dông vò khÝ g×?", 					{"a §ao", "b KiÕm", "c C«n", "d S¸o"}, 										2},
	{"M«n ph¸i C«n L«n n»m vÞ trÝ nµo trªn b¶n ®å?", 				{"a H­íng ®«ng b¾c", "b H­íng t©y b¾c", "c H­íng t©y nam", "d H­íng ®«ng nam"}, 			2},
	{"Nh©n vËt cÇn ph¶i ë trong tr¹ng th¸i nµo míi cã thÓ ph¸t ®éng ®­îc vâ c«ng Thiªn L«i Phï?", {"a Phong TÕ", "b Cuång L«i Phï", "c B¹o L«i Phï", "d L«i TÕ"}, 			4},
	{"Nh©n vËt cÇn ph¶i ë trong tr¹ng th¸i nµo míi cã thÓ ph¸t ®éng ®­îc vâ c«ng B¨ng Phong QuyÕt?", {"a C­¬ng Phong", "b L«i TÕ", "c Phong TÕ", "d Ngù Phong QuyÕt"}, 					3},
	{"S­ phô cña C«n L«n Thiªn S­ L­u Ph¸i lµ ai?", 						{"a M· BÊt TiÒn", "b TrÇn BÊt Vi", "c TÇn BÊt TrÝ", "d DiÖp Tö Thu"}, 			3},
	{"Vâ c«ng trÊn ph¸i cña C«n L«n Thiªn S­ L­u Ph¸i lµ g×?", 			{"a Tiªn Phong L­u T¸n QuyÕt", "b V« Cùc Phong L«i QuyÕt", "c Ngò L«i ChÝnh Ph¸p Phï", "d Oanh L«i Phï"}, 2},
	{"Ch­ëng m«n cña m«n ph¸i C«n L«n lµ ai?", 								{"a Mai BÊt Dung", "b DiÖp Tö Thu", "c Chu BÊt HoÆc", "d M· BÊt TiÒn"}, 			3},
	{"M«n ph¸i C«n L«n lÊy g× lµm sø mÖnh?", 							{"a X­ng B¸ Vâ L©m", "b B¶o VÖ Quèc Gia", "c Gi¸ng Yªu Trõ Ma", "d KiÕp Phó TÕ BÇn"}, 3},
	{"MËt tÞch d­íi ®©y cuèn nµo lµ mËt tÞch cña C«n L«n?", 				{"a Hçn Thiªn MËt TÞch", "b Qu©n Tö MËt TÞch", "c Kinh Phong MËt TÞch", "d Tóy Méng MËt TÞch"}, 3},
}

CC_BOSS_INFO = {
	{"shixuemoren", "ThÞ HuyÕt Ma Nh©n"},
	{"jushihuoren", "Cù Th¹ch Háa Nh©n"},
	{"xuanzhuangunren", "Toµn ChuyÓn C«n Nh©n"},	
	{"qiannianhuoqilin", "Thiªn Niªn Háa Kú L©n"},
	{"dayuguai", "§¹i Ng­ Qu¸i"},
}

--µØÍ¼ÐÅÏ¢
CC_MAP_ID = {
	{201, "Nam BiÖn Kinh"},	
	{304, "Nam Thµnh §«"},
	{501, "Nam Phông T­êng"},
	{108, "B¾c TuyÒn Ch©u"},
	{406, "Vò L¨ng s¬n"},
};

--Ëæ»ú×ø±êµã
CC_RAND_POS = {
	[201] = {
		{1497, 2976},
		{1522, 3123},
		{1561, 3019},
	},
	[304] = {
		{1445, 2990},
		{1494, 3054},
		{1477, 3013},
	},
	[501] = {
		{1504, 2927},
		{1357, 2948},
		{1515, 3089},
	},
	[108] = {
		{1530, 3113},
		{1414, 2983},
		{1585, 3060},
	},
	[406] = {
		{1320, 3079},
		{1547, 2810},
		{1388, 2802},
	},	
};

--ÉÏ½»¿¨Æ¬½±Àø
CC_CARD_AWARD = {
	[2] = {
		{28, 10000, 20, 1},
		{27, 3000, 500, 1},
		{4, 3000, 1, 1},
		{5, 3000, 200, 1},
		{1, 2000, "M¶nh Tinh NgÊn", {2, 1, 30299, 3}, 0},
		{1, 5000, "Ngò Hµnh HuyÒn Th¹ch", {2, 1, 30302, 1}, 0},
		{1, 2000, "ThiªnNghÜa TinhThiÕt", {2, 1, 30300, 3}, 0},
		{1, 5000, "Ngò Hµnh HuyÒn ThiÕt", {2, 1, 30303, 1}, 0},
		{1, 3000, "H¹o NguyÖt HuyÒn Kim", {2, 1, 30301, 2}, 0},
		{1, 5000, "Ngò Hµnh HuyÒn Kim", {2, 1, 30304, 1}, 0},
		{1, 3000, "Thiªn Ngo¹i L­u TInh ", {2, 1, 30321, 2}, 0},
		{1, 4000, "Ngò hµnh b¶o r­¬ng ", {2, 1, 30320, 1}, 0},
		{1, 4000, "Tói tiÒn", {2, 1, 30367, 1}, 0},
		{1, 4008, "Cæ Linh Th¹ch", {2, 1, 30368, 2}, 0},
		{1, 1000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
		{1, 1000, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 30 * 24 * 3600},
		{1, 1000, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 30 * 24 * 3600},
		{1, 1000, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 30 * 24 * 3600},
		{1, 1000, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 0},
		{1, 1000, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 0},
		{1, 4890, "TiÓu B¹ch C©u hoµn", {2, 1, 30307, 1}, 0},
		{1, 4000, "TiÓu Tam Thanh Hoµn", {2, 1, 30308, 1}, 0},
		{1, 4000, "TiÓu Lôc ThÇn Hoµn", {2, 1, 30309, 1}, 0},
		{1, 4000, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 0},
		{31, 600, "gf_Rand2YunLing()", 1},
		{1, 1200, "TÈy T©m Th¹ch Kho¸ng", {2, 1, 30536, 1}, 0},
		{1, 1200, "LuyÖn L« ThiÕt Kho¸ng", {2, 1, 30537, 1}, 0},
		{1, 2500, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 1}, 0},
		{1, 600, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1}, 0},
		{1, 5000, "M¶nh Tu Ch©n YÕu QuyÕt", {2, 1, 30315, 1}, 0},
		{1, 5000, "Th¸nh VËt S­ M«n", {2, 1, 30311, 1}, 0},
		{1, 5000, "VÐ TiÕu Y §ång", {2, 1, 30493, 1}, 30 * 24 * 3600},
		{1, 1, "LÔ bao Thiªn Cang LÖnh", {2, 1, 30508, 1}, 0},
		{1, 1, "LÔ bao Thiªn M«n Kim LÖnh", {2, 1, 30509, 1}, 0},
	},	
	[3] = {
		{28, 7000, 100, 1},
		{27, 7000, 200, 1},
		{4, 7000, 2, 1},
		{5, 7000, 50, 1},
		{1, 6000, "H¾c Ngäc §o¹n Tôc Cao", {1, 0, 6, 1}, 0},
		{1, 4000, "Sinh Sinh Hãa T¸n", {1, 0, 16, 1}, 0},
		{1, 4000, "V¹n VËt Quy Nguyªn §¬n", {1, 0, 11, 1}, 0},
		{1, 5000, "Cöu chuyÓn håi hån ®¬n", {1, 0, 32, 1}, 0},
		{1, 700, "VÐ TiÕu Y Vµng", {2, 1, 30491, 1}, 30 * 24 * 3600},
		{1, 800, "VÐ TiÕu Y B¹c", {2, 1, 30492, 1}, 30 * 24 * 3600},
		{1, 2000, "VÐ TiÕu Y §ång", {2, 1, 30493, 1}, 30 * 24 * 3600},
		{1, 5000, "Linh Th¹ch Nguyªn Th¹ch cÊp 1", {2, 1, 30413, 1}, 0},
		{1, 4000, "Linh Th¹ch Nguyªn Th¹ch cÊp 2", {2, 1, 30414, 1}, 0},
		{1, 2953, "Linh Th¹ch Nguyªn Th¹ch cÊp 3", {2, 1, 30415, 1}, 0},
		{1, 4000, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
		{1, 4000, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
		{1, 4000, "Cæ Linh Th¹ch", {2, 1, 30368, 1}, 0},
		{1, 3000, "Linh Th¹ch Nguyªn Th¹ch cÊp 4", {2, 1, 30416, 1}, 0},
		{1, 2000, "Linh Th¹ch Nguyªn Th¹ch cÊp 5", {2, 1, 30417, 1}, 0},
		{1, 900, "M¶nh Thiªn Cang", {2, 1, 30390, 1}, 0},
		{1, 3000, "Ma §ao Th¹ch cÊp 1", {2, 1, 30428, 1}, 30 * 24 * 3600},
		{1, 4000, "M¶nh Thiªn Cang", {2, 1, 30390, 1}, 0},
		{1, 3000, "ThiÕt Tinh cÊp 1", {2, 1, 30533, 1}, 0},
		{1, 2000, "ThiÕt Tinh cÊp 2", {2, 1, 30534, 1}, 0},
		{1, 800, "ThiÕt Tinh cÊp 3", {2, 1, 30535, 1}, 0},
		{1, 500, "Linh Th¹ch Nguyªn Th¹ch cÊp 6", {2, 1, 30418, 1}, 0},
		{1, 500, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},
		{1, 500, "Ma §¹o Th¹ch cÊp 2", {2, 1, 30429, 1}, 30 * 24 * 3600},
		{1, 500, "Ma §ao Th¹ch cÊp 3", {2, 1, 30430, 1}, 30 * 24 * 3600},
		{1, 200, "H¹o NguyÖt HuyÒn Kim", {2, 1, 30301, 1}, 0},
		{1, 600, "Ngò Hµnh HuyÒn Kim", {2, 1, 30304, 1}, 0},
		{1, 2000, "Cæ Linh Ngäc", {2, 1, 30369, 1}, 0},
		{1, 400, "M¶nh Thiªn M«n", {2, 1, 30410, 1}, 0},
		{1, 100, "Linh Th¹ch Nguyªn Th¹ch cÊp 7", {2, 1, 30419, 1}, 0},
		{1, 500, "C­êng hãa quyÓn 12", {2, 1, 30424, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 500, "C­êng hãa quyÓn 13", {2, 1, 30425, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 10, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 10, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 10, "Thiªn Cang LÖnh", {2, 95, 204, 1}, 0, 0, 0, 1},
		{1, 10, "Thiªn M«n Kim LÖnh", {2, 1, 30370, 1}, 0, 0, 0, 1},
		{1, 500, "M¶nh B¹ch Kim", {2, 1, 30346, 1}, 0, 0, 0, 1},
		{1, 4, "C­êng hãa quyÓn 14", {2, 1, 30426, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 2, "C­êng hãa quyÓn 15", {2, 1, 30427, 1}, 30 * 24 * 3600, 0, 0, 1},
		{1, 1, "§¹i §Þnh Hån ", {2, 1, 1113, 1}, 30 * 24 * 3600, 0, 0, 1},
	},
}

CC_BOX_AWARD = {
	{28, 50, 20, 1},
	{27, 50, 200, 1},
	{4, 50, 6, 1},
	{5, 50, 6, 1},
	{1, 50, "Tói tiÒn", {2, 1, 30367, 3}, 0},
	{1, 20, "H¹o NguyÖt HuyÒn Kim", {2, 1, 30301, 1}, 0},
	{1, 80, "Ngò Hµnh HuyÒn Kim", {2, 1, 30304, 1}, 0},
	{1, 100, "H¹t gièng", {2, 1, 30086, 1}, 30 * 24 * 3600},
	{1, 6, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 30 * 24 * 3600},
	{1, 3, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 30 * 24 * 3600},
	{1, 1, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 30 * 24 * 3600},
	{1, 20, "Linh Th¹ch Nguyªn Th¹ch cÊp 3", {2, 1, 30415, 1}, 0},
	{1, 15, "Linh Th¹ch Nguyªn Th¹ch cÊp 4", {2, 1, 30416, 1}, 0},
	{1, 5, "Linh Th¹ch Nguyªn Th¹ch cÊp 5", {2, 1, 30417, 1}, 0},
	{1, 200, "L«i TÕ", {2, 1, 30505, 2}, 0},
	{1, 200, "L¹c Hoa QuyÕt", {2, 1, 30506, 2}, 0},
	{1, 100, "Linh Miªu VËn", {2, 1, 30507, 2}, 0},
}

CC_COPY_AWARD = {
	--Íò½£Ú£
	[1] = {
		[1] = {
			{1, 90, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 10, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 80, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 20, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[4] = {
			{1, 60, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 35, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Miªu VËn", {2, 1, 30507, 1}, 0},
		},	
	},	
	--Í¨Ìì
	[2] = {
		[1] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 80, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 20, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[4] = {
			{1, 80, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 20, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[5] = {
			{1, 70, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 30, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[6] = {
			{1, 70, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 30, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[7] = {
			{1, 45, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 50, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Miªu VËn", {2, 1, 30507, 1}, 0},
		},
	},
	--ÁºÉ½
	[3] = {
		[1] = {
			{1, 90, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 10, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[2] = {
			{1, 90, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 10, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},	
		[3] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[4] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[5] = {
			{1, 85, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
		},
		[6] = {
			{1, 80, "L«i TÕ", {2, 1, 30505, 1}, 0},
			{1, 15, "L¹c Hoa QuyÕt", {2, 1, 30506, 1}, 0},
			{1, 5, "Linh Miªu VËn", {2, 1, 30507, 1}, 0},
		},
	},
}

--Éý¼¶Ììî¸Áî£¬Éý¼¶ÌìÃÅ½ðÁî----------------------
CC_LEVEL_LIMIT = 80; --µÈ¼¶ÏÞÖÆ
CC_UPGRADE_DATE = 20130601; --ÈÝÐí¿ª°üÊ±¼ä(ÐÂÃÅÅÉ¿ª·ÅµÄÊ±¼ä)

CC_TGL_COST_NUM = 5; --ÏûºÄ5¸öÌìî¸Áî
CC_TGL_UPGRADE_NUM = 6; --Éý¼¶»ñµÃ6¸öÌìî¸Áî
CC_TGL_UPGRADE_EXP = 500000; --Éý¼¶»ñµÃµÄEXP
CC_TGL_UPGRADE_POP = 12000; --ÉùÍûÖµ

CC_TMGL_COST_NUM = 5; --ÏûºÄ5¸öÌìî¸Áî
CC_TMGL_UPGRADE_NUM = 6; --Éý¼¶»ñµÃ6¸öÌìî¸Áî
CC_TMGL_UPGRADE_EXP = 1000000; --Éý¼¶»ñµÃµÄEXP
CC_TMGL_UPGRADE_POP = 12000; --ÉùÍûÖµ

CC_ZLP_PARK_COST = 200; -- ÏûºÄ200½ðÉý¼¶×ÊÁÏÆ¬Àñ°ü

--Ê¦ÃÅÌ××°½±Àø
CC_SHIMEN_EQUIP = {
	[23] = {
		[1] = {
			{"Tö Vi §¹o Nh©n - Thiªn Quang B¶o KiÕm", {0,2,23131}}, 
			{"Tö Vi §¹o Nh©n - Thiªn Thanh §Çu C©n", {0,103,23131}},
			{"Tö Vi §¹o Nh©n - Thiªn Phong §¹o Bµo", {0,100,23131}},
			{"Tõ Vi §¹o Nh©n - Thiªn V©n Bè Trang", {0,101,23131}},
			{"Tö Vi §¹o Nh©n - Thiªn Nguyªn Ngäc Béi", {0,102,23131}}, 
			{"Tö Vi §¹o Nh©n - Thiªn Nguyªn B¶o Giíi", {0,102,23135}},
		},
		[2] = {
			{"Tö Vi §¹o Nh©n - Thiªn Quang B¶o KiÕm", {0,2,23132}},
			{"Tö Vi §¹o Nh©n - Thiªn Thanh §Çu C©n", {0,103,23132}},
			{"Tö Vi §¹o Nh©n - Thiªn Phong §¹o Bµo", {0,100,23132}}, 
			{"Tõ Vi §¹o Nh©n - Thiªn V©n Bè Trang", {0,101,23132}},  
			{"Tö Vi §¹o Nh©n - Thiªn Nguyªn Ngäc Béi", {0,102,23132}},  
			{"Tö Vi §¹o Nh©n - Thiªn Nguyªn B¶o Giíi", {0,102,23136}}, 
		},
	},
	[29] = {
		[3] = {
			{"Cöu Thiªn Th¸i Ph­îng - Ph­îng Hoµng Vò", {0,13,29131}},
			{"Cöu Thiªn Th¸i Ph­îng - Ng©n Ph­îng §Çu Søc", {0,103,29131}},
			{"Cöu Thiªn Th¸i Ph­îng - Loan Ph­îng Vò Y", {0,100,29131}},
			{"Cöu Thiªn Th¸i Ph­îng - Kim Ph­îng Tó QuÇn", {0,101,29131}},
			{"Cöu Thiªn Th¸i Ph­îng - Háa Vò Béi", {0,102,29131}},
			{"Cöu Thiªn Th¸i Ph­îng - B¨ng T©m Giíi", {0,102,29135}},
		},
		[4] = {
			{"Cöu Thiªn Th¸i Ph­îng - Ph­îng Hoµng Vò", {0,13,29132}}, 
			{"Cöu Thiªn Th¸i Ph­îng - Ng©n Ph­îng §Çu Søc", {0,103,29132}},
			{"Cöu Thiªn Th¸i Ph­îng - Loan Ph­îng Vò Y", {0,100,29132}},     
			{"Cöu Thiªn Th¸i Ph­îng - Kim Ph­îng Tó QuÇn", {0,101,29132}}, 
			{"Cöu Thiªn Th¸i Ph­îng - Háa Vò Béi", {0,102,29132}}, 
			{"Cöu Thiªn Th¸i Ph­îng - B¨ng T©m Giíi", {0,102,29136}}, 
		},
 	},
	[30] = {
		[3] = {
			{"B¨ng T©m Ngäc N÷ - Ng©n Linh Tr­êng §Þch", {0,12,30131}},
			{"B¨ng T©m Ngäc N÷ - Linh Long Ph¸t Tr©m", {0,103,30131}},
			{"B¨ng T©m Ngäc N÷ - ThÊt X¶o Vò Th­êng", {0,100,30131}},
			{"B¨ng T©m Ngäc N÷ - ThÊt B¶o Tó QuÇn", {0,101,30131}},
			{"B¨ng T©m Ngäc N÷ - Linh X¶o Ngäc Giíi", {0,102,30131}},
			{"B¨ng T©m Ngäc N÷ - Thanh Linh Toµn Giíi", {0,102,30135}}, 
 		},
 		[4] = {
			{"B¨ng T©m Ngäc N÷ - Ng©n Linh Tr­êng §Þch", {0,12,30132}}, 
			{"B¨ng T©m Ngäc N÷ - Linh Long Ph¸t Tr©m", {0,103,30132}},
			{"B¨ng T©m Ngäc N÷ - ThÊt X¶o Vò Th­êng", {0,100,30132}},
			{"B¨ng T©m Ngäc N÷ - ThÊt B¶o Tó QuÇn", {0,101,30132}}, 
			{"B¨ng T©m Ngäc N÷ - Linh X¶o Ngäc Giíi", {0,102,30132}}, 
			{"B¨ng T©m Ngäc N÷ - Thanh Linh Toµn Giíi", {0,102,30136}},
	  },    
	},	
}


--------------------------------------------------------------------
