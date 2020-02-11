Include("\\script\\newbattles\\functions.lua");

tBattleEquip = 
{
	[SONG_ID] = 
			{--×°±¸ÐÅÏ¢,ÐèÒª¾üÏÎ
			[1] =   {{"Tèng §« thèng chiÕn kh«i",0,103,2231},3},
			[2] =   {{"Tèng §« thèng chiÕn bµo",0,100,2231},3},
			[3] =   {{"Tèng §« thèng chiÕn phôc",0,101,2231},3},
			[4] =   {{"Tèng tiªn phong hiÖu kú",0,102,2261},4},
			[5] =   {{"Tèng tiªn phong hiÖu phï",0,102,2265},4},	
			[6] =   {{"Tèng t­íng qu©n ®Çu kh«i",0,103,2241},5},
			[7] =   {{"Tèng t­íng qu©n chiÕn bµo",0,100,2241},5},
			[8] =   {{"Tèng t­íng qu©n chiÕn phôc",0,101,2241},5},
			[9] =   {{"Tèng t­íng qu©n lÖnh bµi",0,102,2281},5},
			[10] = {{"Tèng t­íng qu©n cê lÖnh",0,102,2285},5},
			[11] = {{"Tèng lÖnh phï",0,102,2521},5},
			[12] = {{"Thiªn Chi Tèng T­íng Qu©n ChiÕn Kh«i",0,103,3016},5},
			[13] = {{"Thiªn Chi Tèng T­íng Qu©n ChiÕn Bµo",0,100,3016},5},
			[14] = {{"Thiªn Chi Tèng T­íng Qu©n ChiÕn Trang",0,101,3016},5},
			[15] = {{"Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi",0,102,3032},5},
			[16] = {{"Thiªn Chi Tèng T­íng Qu©n Cê LÖnh",0,102,3036},5},
			[17] = {{"Thiªn Chi Tèng T­íng Qu©n LÖnh Phï",0,102,3040},5},	
			[18] = {{"Tèng nguyªn so¸i ®Çu kh«i",0,103,2251},6},
			[19] = {{"Tèng nguyªn so¸i chiÕn bµo",0,100,2251},6},
			[20] = {{"Tèng nguyªn so¸i chiÕn phôc",0,101,2251},6},
			[21] = {{"Tèng nguyªn so¸i hæ phï",0,102,2301},6},
			[22] = {{"Tèng nguyªn so¸i lÖnh kú",0,102,2305},6},
			[23] = {{"Tèng so¸i phï",0,102,2501},6},
			[24] = {{"Tèng so¸i kú",0,102,2505},6},
			[25] = {{"Tèng qu©n phôc",0,109,992},3},
			[26] = {{"Tèng-VÜnh Cöu Nguyªn so¸i ®Çu kh«i",0,103,3000},6},
			[27] = {{"Tèng -VÜnh Cöu Nguyªn so¸i ChiÕn Gi¸p ",0,100,3000},6},
			[28] = {{"Tèng-VÜnh Cöu Nguyªn so¸i ChiÕn phôc",0,101,3000},6},
			[29] = {{"Tèng-VÜnh Cöu Nguyªn so¸i hiÖu kú",0,102,3012},6},
			[30] = {{"Tèng-VÜnh Cöu Nguyªn so¸i hiÖu phï",0,102,3008},6},
			[31] = {{"Tèng-VÜnh Cöu Nguyªn so¸i lÖnh kú",0,102,3004},6},
			[32] = {{"Tèng-VÜnh Cöu Nguyªn so¸i hæ phï",0,102,3000},6},
			[33] = {{"Ngù Long Nguyªn So¸i ChiÕn Gi¸p",0,100,3008},6},
			[34] = {{"§¹i Tèng Nguyªn So¸i ChiÕn Bµo",0,100,3024},6},
			[35] = {{"§¹i Tèng Nguyªn So¸i Hæ Phï",0,102,3056},6},
			[36] = {{"§¹i Tèng Nguyªn So¸i LÖnh Kú",0,102,3060},6},
			[37] = {{"§¹i Tèng Nguyªn So¸i HiÖu Phï",0,102,3064},6},
			[38] = {{"§¹i Tèng Nguyªn So¸i HiÖu Kú",0,102,3068},6},
			[39] = {{"Tèng T­íng Qu©n ChiÕn Bµo",0,100,3016},5},
			[40] = {{"Tèng T­íng Qu©n ChiÕn Trang",0,101,3016},5},
			[41] = {{"Tèng T­íng Qu©n ChiÕn Kh«i",0,103,3016},5},
			[42] = {{"Thiªn Chi Tèng T­íng Qu©n LÖnh Bµi",0,102,3032},5},
			[43] = {{"Thiªn Chi Tèng T­íng Qu©n LÖnh Kú",0,102,3036},5},
			[44] = {{"Thiªn Chi Tèng T­íng Qu©n LÖnhPhï",0,102,3040},5},
			[45] = {{"Ngù Long Nguyªn So¸i ChiÕn Kh«i",0,103,3008},6},
			[46] = {{"Ngù Long Nguyªn So¸i ChiÕn Trang",0,101,3008},6},
			[47] = {{"§¹i Tèng Nguyªn So¸i ChiÕn Kh«i",0,103,3024},6},
			[48] = {{"§¹i Tèng Nguyªn So¸i ChiÕn Trang",0,101,3024},6},
			[49] = {{"Ngù Long Nguyªn So¸i Hæ Phï",0,102,3088},6},
			[50] = {{"Ngù Long Nguyªn So¸i LÖnh Kú",0,102,3092},6},
			[51] = {{"Ngù Long Nguyªn So¸i HiÖu Phï",0,102,3096},6},
			[52] = {{"Ngù Long Nguyªn So¸i HiÖu Kú",0,102,3100},6},
			[53] = 	{{"Tèng Ngù Long T­íng Qu©n Kh«i ",0,103,30017},5},
			[54] = 	{{"Tèng Ngù Long T­íng Qu©n Kh«i ",0,103,30018},5},
			[55] = 	{{"Tèng Ngù Long T­íng Qu©n Kh«i ",0,103,30019},5},
			[56] = 	{{"Tèng Ngù Long T­íng Qu©n Kh«i ",0,103,30020},5},
			[57] = 	{{"Tèng Ngù Long T­íng Qu©n Bµo ",0,100,30017},5},
			[58] = 	{{"Tèng Ngù Long T­íng Qu©n Bµo ",0,100,30018},5},
			[59] = 	{{"Tèng Ngù Long T­íng Qu©n Bµo ",0,100,30019},5},
			[60] = 	{{"Tèng Ngù Long T­íng Qu©n Bµo ",0,100,30020},5},
			[61] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30013},5},
			[62] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30014},5},
			[63] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30015},5},
			[64] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30016},5},
			[65] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30017},5},
			[66] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30018},5},
			[67] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30019},5},
			[68] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30020},5},
			[69] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Phï",0,102,30021},5},
			[70] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Phï",0,102,30022},5},
			[71] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Phï",0,102,30023},5},
			[72] = 	{{"Tèng Ngù Long T­íng Qu©n LÖnh Phï",0,102,30024},5},
			[73] = 	{{"Tèng Ngù Long T­íng Qu©n Trang",0,101,30017},5},
			[74] = 	{{"Tèng Ngù Long T­íng Qu©n Trang",0,101,30018},5},
			[75] = 	{{"Tèng Ngù Long T­íng Qu©n Trang",0,101,30019},5},
			[76] = 	{{"Tèng Ngù Long T­íng Qu©n Trang",0,101,30020},5},	
			[77] =   {{"Tèng Th­¬ng ¦ng §« Thèng kh«i",0,103,30029},3},
            [78] =   {{"Tèng Th­¬ng ¦ng T­íng Qu©n kh«i",0,103,30033},5},
            [79] =   {{"Tèng Th­¬ng ¦ng So¸i kh«i",0,103,30037},6},
            [80] =   {{"Tèng Th­¬ng ¦ng §« Thèng bµo",0,100,30029},3},
            [81] =   {{"Tèng Th­¬ng ¦ng T­íng Qu©n bµo",0,100,30033},5},
            [82] =   {{"Tèng Th­¬ng ¦ng So¸i bµo",0,100,30037},6},
            [83] =   {{"Tèng Th­¬ng ¦ng §« Thèng trang ",0,101,30029},3},
            [84] =   {{"Tèng Th­¬ng ¦ng T­íng Qu©n trang",0,101,30033},5},
            [85] =   {{"Tèng Th­¬ng ¦ng So¸i trang ",0,101,30037},6},
            [86] =   {{"Tèng Th­¬ng ¦ng Tiªn Phong kú",0,102,30044},4},
            [87] =   {{"Tèng Th­¬ng ¦ng Tiªn Phong phï",0,102,30048},4},
            [88] =   {{"Tèng Th­¬ng ¦ng T­íng Qu©n lÖnh",0,102,30052},5},
            [89] =   {{"Tèng Th­¬ng ¦ng T­íng Qu©n kú",0,102,30056},5},
            [90] =   {{"Tèng Th­¬ng ¦ng T­íng Qu©n phï",0,102,30060},5},
            [91] =   {{"Tèng Th­¬ng ¦ng So¸i Hæ",0,102,30064},6},
            [92] =   {{"Tèng Th­¬ng ¦ng So¸i lÖnh",0,102,30068},6},
            [93] =   {{"Tèng Th­¬ng ¦ng So¸i phï",0,102,30072},6},
            [94] =   {{"Tèng Th­¬ng ¦ng So¸i kú ",0,102,30076},6},
            [95] =   {{"Huy Ch­¬ng Tèng T­íng Qu©n",0,153,10},5},
            [96] =   {{"¸o Choµng Tèng T­íng Qu©n",0,152,10},5},
            [97] =   {{"ChiÕn Hµi Tèng T­íng Qu©n",0,154,10},5},
            [98] =   {{"Huy Ch­¬ng Tèng Nguyªn So¸i",0,153,14},6},
            [99] =   {{"¸o Choµng Tèng Nguyªn So¸i",0,152,14},6},
            [100] =   {{"ChiÕn Hµi Tèng Nguyªn So¸i",0,154,14},6},
            
            [101] =   {{"Tèng L«i Hæ T­íng Kh«i",0,103,30215},5},
            [102] =   {{"Tèng L«i Hæ T­íng Kh«i",0,103,30216},5},
            [103] =   {{"Tèng L«i Hæ T­íng Kh«i",0,103,30217},5},
            [104] =   {{"Tèng L«i Hæ T­íng Kh«i",0,103,30218},5},
            [105] =   {{"Tèng L«i Hæ So¸i Kh«i",0,103,30219},6},
            [106] =   {{"Tèng L«i Hæ So¸i Kh«i",0,103,30220},6},
            [107] =   {{"Tèng L«i Hæ So¸i Kh«i",0,103,30221},6},
            [108] =   {{"Tèng L«i Hæ So¸i Kh«i",0,103,30222},6},
            [109] =   {{"Tèng L«i Hæ T­íng Bµo",0,100,30215},5},
            [110] =   {{"Tèng L«i Hæ T­íng Bµo",0,100,30216},5},
            [111] =   {{"Tèng L«i Hæ T­íng Bµo",0,100,30217},5},
            [112] =   {{"Tèng L«i Hæ T­íng Bµo",0,100,30218},5},
            [113] =   {{"Tèng L«i Hæ So¸i Bµo",0,100,30219},6},
            [114] =   {{"Tèng L«i Hæ So¸i Bµo",0,100,30220},6},
            [115] =   {{"Tèng L«i Hæ So¸i Bµo",0,100,30221},6},
            [116] =   {{"Tèng L«i Hæ So¸i Bµo",0,100,30222},6},
            [117] =   {{"Tèng L«i Hæ T­íng Trang",0,101,30215},5},
            [118] =   {{"Tèng L«i Hæ T­íng Trang",0,101,30216},5},
            [119] =   {{"Tèng L«i Hæ T­íng Trang",0,101,30217},5},
            [120] =   {{"Tèng L«i Hæ T­íng Trang",0,101,30218},5},
            [121] =   {{"Tèng L«i Hæ So¸i Trang",0,101,30219},6},
            [122] =   {{"Tèng L«i Hæ So¸i Trang",0,101,30220},6},
            [123] =   {{"Tèng L«i Hæ So¸i Trang",0,101,30221},6},
            [124] =   {{"Tèng L«i Hæ So¸i Trang",0,101,30222},6},
            [125] =   {{"Tèng L«i Hæ T­íng Bµi",0,102,30157},5},
            [126] =   {{"Tèng L«i Hæ T­íng Bµi",0,102,30158},5},
            [127] =   {{"Tèng L«i Hæ T­íng Bµi",0,102,30159},5},
            [128] =   {{"Tèng L«i Hæ T­íng Bµi",0,102,30160},5},
            [129] =   {{"Tèng L«i Hæ T­íng Kú",0,102,30161},5},
            [130] =   {{"Tèng L«i Hæ T­íng Kú",0,102,30162},5},
            [131] =   {{"Tèng L«i Hæ T­íng Kú",0,102,30163},5},
            [132] =   {{"Tèng L«i Hæ T­íng Kú",0,102,30164},5},
            [133] =   {{"Tèng L«i Hæ T­íng Phï",0,102,30165},5},
            [134] =   {{"Tèng L«i Hæ T­íng Phï",0,102,30166},5},
            [135] =   {{"Tèng L«i Hæ T­íng Phï",0,102,30167},5},
            [136] =   {{"Tèng L«i Hæ T­íng Phï",0,102,30168},5},
            [137] =   {{"Tèng L«i Hæ So¸i Phï",0,102,30169},6},
            [138] =   {{"Tèng L«i Hæ So¸i Phï",0,102,30170},6},
            [139] =   {{"Tèng L«i Hæ So¸i Phï",0,102,30171},6},
            [140] =   {{"Tèng L«i Hæ So¸i Phï",0,102,30172},6},
            [141] =   {{"Tèng L«i Hæ So¸i Hæ Phï",0,102,30173},6},
            [142] =   {{"Tèng L«i Hæ So¸i Hæ Phï",0,102,30174},6},
            [143] =   {{"Tèng L«i Hæ So¸i Hæ Phï",0,102,30175},6},
            [144] =   {{"Tèng L«i Hæ So¸i Hæ Phï",0,102,30176},6},
            [145] =   {{"Tèng L«i Hæ So¸i Kú",0,102,30177},6},
            [146] =   {{"Tèng L«i Hæ So¸i Kú",0,102,30178},6},
            [147] =   {{"Tèng L«i Hæ So¸i Kú",0,102,30179},6},
            [148] =   {{"Tèng L«i Hæ So¸i Kú",0,102,30180},6},
            [149] =   {{"Tèng L«i Hæ So¸i HiÖu Kú",0,102,30181},6},
            [150] =   {{"Tèng L«i Hæ So¸i HiÖu Kú",0,102,30182},6},
            [151] =   {{"Tèng L«i Hæ So¸i HiÖu Kú",0,102,30183},6},
            [152] =   {{"Tèng L«i Hæ So¸i HiÖu Kú",0,102,30184},6},
		},
	[LIAO_ID] = 
			{--×°±¸ÐÅÏ¢,ÐèÒª¾üÏÎ
			[1] =   {{"Liªu §« thèng chiÕn kh«i",0,103,2235},3},
			[2] =   {{"Liªu §« thèng chiÕn bµo",0,100,2235},3},
			[3] =   {{"Liªu §« thèng chiÕn phôc",0,101,2235},3},
			[4] =   {{"Liªu tiªn phong hiÖu kú",0,102,2271},4},
			[5] =   {{"Liªu tiªn phong hiÖu phï",0,102,2275},4},	
			[6] =   {{"Liªu t­íng qu©n ®Çu kh«i",0,103,2245},5},
			[7] =   {{"Liªu t­íng qu©n chiÕn bµo",0,100,2245},5},
			[8] =   {{"Liªu t­íng qu©n chiÕn phôc",0,101,2245},5},
			[9] =   {{"Liªu t­íng qu©n lÖnh bµi",0,102,2291},5},
			[10] = {{"Liªu t­íng qu©n cê lÖnh",0,102,2295},5},
			[11] = {{"Liªu lÖnh phï",0,102,2531},5},
			[12] = {{"Thiªn Chi Liªu T­íng Qu©n ChiÕn Kh«i",0,103,3020},5},
			[13] = {{"Thiªn Chi Liªu T­íng Qu©n ChiÕn Bµo",0,100,3020},5},
			[14] = {{"Thiªn Chi Liªu T­íng Qu©n ChiÕn Trang",0,101,3020},5},
			[15] = {{"Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi",0,102,3044},5},
			[16] = {{"Thiªn Chi Liªu T­íng Qu©n Cê LÖnh",0,102,3048},5},
			[17] = {{"Thiªn Chi Liªu T­íng Qu©n LÖnh Phï",0,102,3052},5},
			[18] = {{"Liªu nguyªn so¸i ®Çu kh«i",0,103,2255},6},
			[19] = {{"Liªu nguyªn so¸i chiÕn bµo",0,100,2255},6},
			[20] = {{"Liªu nguyªn so¸i chiÕn phôc",0,101,2255},6},
			[21] = {{"Liªu nguyªn so¸i hæ phï",0,102,2311},6},
			[22] = {{"Liªu nguyªn so¸i lÖnh kú",0,102,2315},6},
			[23] = {{"Liªu so¸i phï",0,102,2511},6},
			[24] = {{"Liªu so¸i kú",0,102,2515},6},
			[25] = {{"Liªu qu©n phôc",0,109,996},3},
			[26] = {{"Liªu-VÜnh Cöu nguyªn so¸i ®Çu kh«i",0,103,3004},6},
			[27] = {{"Liªu-VÜnh Cöu nguyªn so¸i ChiÕn Gi¸p ",0,100,3004},6},
			[28] = {{"Liªu-VÜnh Cöu nguyªn so¸i ChiÕn phôc",0,101,3004},6},
			[29] = {{"Liªu-VÜnh Cöu Nguyªn so¸i hiÖu kú",0,102,3028},6},
			[30] = {{"Liªu-VÜnh Cöu Nguyªn so¸i hiÖu phï",0,102,3024},6},
			[31] = {{"Liªu-VÜnh Cöu nguyªn so¸i lÖnh kú",0,102,3020},6},
			[32] = {{"Liªu-VÜnh Cöu nguyªn so¸i hæ phï",0,102,3016},6},
			[33] = {{"Chiªu Th¸nh Nguyªn So¸i ChiÕn Gi¸p",0,100,3012},6},
			[34] = {{"§¹i Liªu Nguyªn So¸i ChiÕn Bµo",0,100,3028},6},
			[35] = {{"§¹i Liªu Nguyªn So¸i Hæ Phï",0,102,3072},6},
			[36] = {{"§¹i Liªu Nguyªn So¸i LÖnh Kú",0,102,3076},6},
			[37] = {{"§¹i Liªu Nguyªn So¸i HiÖu Phï",0,102,3080},6},
			[38] = {{"§¹i Liªu Nguyªn So¸i HiÖu Kú",0,102,3084},6},
			[39] = {{"Liªu T­íng Qu©n ChiÕn Bµo",0,100,3020},5},
			[40] = {{"Liªu T­íng Qu©n ChiÕn Trang",0,101,3020},5},
			[41] = {{"Liªu T­íng Qu©n ChiÕn Kh«i",0,103,3020},5},
			[42] = {{"Thiªn Chi Liªu T­íng Qu©n LÖnh Bµi",0,102,3044},5},
			[43] = {{"Thiªn Chi Liªu T­íng Qu©n LÖnh Kú",0,102,3048},5},
			[44] = {{"Thiªn Chi Liªu T­íng Qu©n LÖnh Phï",0,102,3052},5},
			[45] = {{"Chiªu Th¸nh Nguyªn So¸i Kh«i",0,103,3012},6},
			[46] = {{"Chiªu Th¸nh Nguyªn So¸i ChiÕnTrang",0,101,3012},6},
			[47] = {{"§¹i Liªu Nguyªn So¸i ChiÕn Kh«i",0,103,3028},6},
			[48] = {{"§¹i Liªu Nguyªn So¸i ChiÕn Trang",0,101,3028},6},
			[49] = {{"Chiªu Th¸nh Nguyªn So¸i Hæ Phï",0,102,3104},6},
			[50] = {{"Chiªu Th¸nh Nguyªn So¸i LÖnh Kú",0,102,3108},6},
			[51] = {{"Chiªu Th¸nh Nguyªn So¸i HiÖu Phï",0,102,3112},6},
			[52] = {{"Chiªu Th¸nh Nguyªn So¸i HiÖu Kú",0,102,3116},6},
			[53] = 	{{"Liªu Ngù Long T­íng Qu©n Kh«i ",0,103,30021},5},
			[54] = 	{{"Liªu Ngù Long T­íng Qu©n Kh«i ",0,103,30022},5},
			[55] = 	{{"Liªu Ngù Long T­íng Qu©n Kh«i ",0,103,30023},5},
			[56] = 	{{"Liªu Ngù Long T­íng Qu©n Kh«i ",0,103,30024},5},
			[57] = 	{{"LiªuNgù Long T­íng Qu©n Bµo ",0,100,30021},5},
			[58] = 	{{"LiªuNgù Long T­íng Qu©n Bµo ",0,100,30022},5},
			[59] = 	{{"LiªuNgù Long T­íng Qu©n Bµo ",0,100,30023},5},
			[60] = 	{{"LiªuNgù Long T­íng Qu©n Bµo ",0,100,30024},5},
			[61] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30025},5},
			[62] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30026},5},
			[63] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30027},5},
			[64] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Bµi ",0,102,30028},5},
			[65] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30029},5},
			[66] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30030},5},
			[67] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30031},5},
			[68] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Kú ",0,102,30032},5},
			[69] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Phï",0,102,30033},5},
			[70] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Phï",0,102,30034},5},
			[71] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Phï",0,102,30035},5},
			[72] = 	{{"Liªu Ngù Long T­íng Qu©n LÖnh Phï",0,102,30036},5},
			[73] = 	{{"Liªu Ngù Long T­íng Qu©n Trang",0,101,30021},5},
			[74] = 	{{"Liªu Ngù Long T­íng Qu©n Trang",0,101,30022},5},
			[75] = 	{{"Liªu Ngù Long T­íng Qu©n Trang",0,101,30023},5},
			[76] = 	{{"Liªu Ngù Long T­íng Qu©n Trang",0,101,30024},5},
            [77] =   {{"Liªu Th­¬ng ¦ng §« Thèng kh«i",0,103,30041},3},
            [78] =   {{"Liªu Th­¬ng ¦ng T­íng Qu©n kh«i",0,103,30045},5},
            [79] =   {{"Liªu Th­¬ng ¦ng So¸i kh«i",0,103,30049},6},
            [80] =   {{"Liªu Th­¬ng ¦ng §« Thèng bµo",0,100,30041},3},
            [81] =   {{"Liªu Th­¬ng ¦ng T­íng Qu©n bµo",0,100,30045},5},
            [82] =   {{"Liªu Th­¬ng ¦ng So¸i bµo",0,100,30049},6},
            [83] =   {{"Liªu Th­¬ng ¦ng §« Thèng trang",0,101,30041},3},
            [84] =   {{"Liªu Th­¬ng ¦ng T­íng Qu©n trang ",0,101,30045},5},
            [85] =   {{"Liªu Th­¬ng ¦ng So¸i trang",0,101,30049},6},
            [86] =   {{"Liªu Th­¬ng ¦ng Tiªn Phong kú",0,102,30080},4},
            [87] =   {{"Liªu Th­¬ng ¦ng Tiªn Phong phï",0,102,30084},4},
            [88] =   {{"Liªu Th­¬ng ¦ng T­íng Qu©n lÖnh",0,102,30088},5},
            [89] =   {{"Liªu Th­¬ng ¦ng T­íng Qu©n kú",0,102,30092},5},
            [90] =   {{"Liªu Th­¬ng ¦ng T­íng Qu©n phï",0,102,30096},5},
            [91] =   {{"Liªu Th­¬ng ¦ng So¸i Hæ",0,102,30100},6},
            [92] =   {{"Liªu Th­¬ng ¦ng So¸i lÖnh",0,102,30104},6},
            [93] =   {{"Liªu Th­¬ng ¦ng So¸i phï ",0,102,30108},6},
            [94] =   {{"Liªu Th­¬ng ¦ng So¸i kú ",0,102,30112},6},
            [95] =   {{"Huy Ch­¬ng Liªu T­íng Qu©n",0,153,18},5},
            [96] =   {{"¸o Choµng Liªu T­íng Qu©n",0,152,18},5},
            [97] =   {{"ChiÕn Hµi Liªu T­íng Qu©n",0,154,18},5},
            [98] =   {{"Huy Ch­¬ng Liªu Nguyªn So¸i",0,153,22},6},
            [99] =   {{"¸o Choµng Liªu Nguyªn So¸i",0,152,22},6},
            [100] =   {{"ChiÕn Hµi Liªu Nguyªn So¸i",0,154,22},6},
            
            [101] =   {{"Liªu L«i Hæ T­íng Kh«i",0,103,30227},5},
            [102] =   {{"Liªu L«i Hæ T­íng Kh«i",0,103,30228},5},
            [103] =   {{"Liªu L«i Hæ T­íng Kh«i",0,103,30229},5},
            [104] =   {{"Liªu L«i Hæ T­íng Kh«i",0,103,30230},5},
            [105] =   {{"Liªu L«i Hæ So¸i Kh«i",0,103,30231},6},
            [106] =   {{"Liªu L«i Hæ So¸i Kh«i",0,103,30232},6},
            [107] =   {{"Liªu L«i Hæ So¸i Kh«i",0,103,30233},6},
            [108] =   {{"Liªu L«i Hæ So¸i Kh«i",0,103,30234},6},
            [109] =   {{"Liªu L«i Hæ T­íng Bµo",0,100,30227},5},
            [110] =   {{"Liªu L«i Hæ T­íng Bµo",0,100,30228},5},
            [111] =   {{"Liªu L«i Hæ T­íng Bµo",0,100,30229},5},
            [112] =   {{"Liªu L«i Hæ T­íng Bµo",0,100,30230},5},
            [113] =   {{"Liªu L«i Hæ So¸i Bµo",0,100,30231},6},
            [114] =   {{"Liªu L«i Hæ So¸i Bµo",0,100,30232},6},
            [115] =   {{"Liªu L«i Hæ So¸i Bµo",0,100,30233},6},
            [116] =   {{"Liªu L«i Hæ So¸i Bµo",0,100,30234},6},
            [117] =   {{"Liªu L«i Hæ T­íng Trang",0,101,30227},5},
            [118] =   {{"Liªu L«i Hæ T­íng Trang",0,101,30228},5},
            [119] =   {{"Liªu L«i Hæ T­íng Trang",0,101,30229},5},
            [120] =   {{"Liªu L«i Hæ T­íng Trang",0,101,30230},5},
            [121] =   {{"Liªu L«i Hæ So¸i Trang",0,101,30231},6},
            [122] =   {{"Liªu L«i Hæ So¸i Trang",0,101,30232},6},
            [123] =   {{"Liªu L«i Hæ So¸i Trang",0,101,30233},6},
            [124] =   {{"Liªu L«i Hæ So¸i Trang",0,101,30234},6},
            [125] =   {{"Liªu L«i Hæ T­íng Bµi",0,102,30193},5},
            [126] =   {{"Liªu L«i Hæ T­íng Bµi",0,102,30194},5},
            [127] =   {{"Liªu L«i Hæ T­íng Bµi",0,102,30195},5},
            [128] =   {{"Liªu L«i Hæ T­íng Bµi",0,102,30196},5},
            [129] =   {{"Liªu L«i Hæ T­íng Kú",0,102,30197},5},
            [130] =   {{"Liªu L«i Hæ T­íng Kú",0,102,30198},5},
            [131] =   {{"Liªu L«i Hæ T­íng Kú",0,102,30199},5},
            [132] =   {{"Liªu L«i Hæ T­íng Kú",0,102,30200},5},
            [133] =   {{"Liªu L«i Hæ T­íng Phï",0,102,30201},5},
            [134] =   {{"Liªu L«i Hæ T­íng Phï",0,102,30202},5},
            [135] =   {{"Liªu L«i Hæ T­íng Phï",0,102,30203},5},
            [136] =   {{"Liªu L«i Hæ T­íng Phï",0,102,30204},5},
            [137] =   {{"Liªu L«i Hæ So¸i Phï",0,102,30205},6},
            [138] =   {{"Liªu L«i Hæ So¸i Phï",0,102,30206},6},
            [139] =   {{"Liªu L«i Hæ So¸i Phï",0,102,30207},6},
            [140] =   {{"Liªu L«i Hæ So¸i Phï",0,102,30208},6},
            [141] =   {{"Liªu L«i Hæ So¸i Hæ Phï",0,102,30209},6},
            [142] =   {{"Liªu L«i Hæ So¸i Hæ Phï",0,102,30210},6},
            [143] =   {{"Liªu L«i Hæ So¸i Hæ Phï",0,102,30211},6},
            [144] =   {{"Liªu L«i Hæ So¸i Hæ Phï",0,102,30212},6},
            [145] =   {{"Liªu L«i Hæ So¸i Kú",0,102,30213},6},
            [146] =   {{"Liªu L«i Hæ So¸i Kú",0,102,30214},6},
            [147] =   {{"Liªu L«i Hæ So¸i Kú",0,102,30215},6},
            [148] =   {{"Liªu L«i Hæ So¸i Kú",0,102,30216},6},
            [149] =   {{"Liªu L«i Hæ So¸i HiÖu Kú",0,102,30217},6},
            [150] =   {{"Liªu L«i Hæ So¸i HiÖu Kú",0,102,30218},6},
            [151] =   {{"Liªu L«i Hæ So¸i HiÖu Kú",0,102,30219},6},
            [152] =   {{"Liªu L«i Hæ So¸i HiÖu Kú",0,102,30220},6},
		},
}

function CanEquip(nItemIdx)
	if check_palyer_state(nItemIdx) == 0 then
		return 1;	--²»ÄÜ´©
	end;
	return 0;
end;

function OnUse(nItemIdx)
	return 0;
end;

function OnEquip()
	return 0;
end

function OnUnEquip()
	return 0;
end
--»ñµÃ×°±¸µÄÕóÓª¼°ÔÚtableÖÐµÄË÷Òý
function get_equip_index(nItemIdx)
	local nGenre = GetItemGenre(nItemIdx);
	local nDetail = GetItemDetail(nItemIdx);
	local nParticular = GetItemParticular(nItemIdx);
	local nBody = GetBody();
	for i=1,getn(tBattleEquip) do 
		for j=1,getn(tBattleEquip[i]) do
			local tEquipInfo = tBattleEquip[i][j][1];
			if tEquipInfo[2] == nGenre and tEquipInfo[3] == nDetail and tEquipInfo[4]+nBody-1 == nParticular then
				return i,j;	--ÕóÓª£¬ÔÚtableÖÐµÄË÷Òý
			end;
		end;
	end;
	return 0,0;
end;

function check_palyer_state(nItemIdx)
	local nEquipCamp,nEquipIdx = get_equip_index(nItemIdx);
	if nEquipCamp == 0 then
		Msg2Player("§©y kh«ng ph¶i lµ trang bÞ chiÕn trËn ");
		return 0;
	end;
	local nCurRank = BT_GetData(PT_CURRANK);
	local nPlayerCamp = 0;
	local sEquipName = tBattleEquip[nEquipCamp][nEquipIdx][1][1];
	if nCurRank < 0 then
		nPlayerCamp = LIAO_ID;
	elseif nCurRank > 0 then
		nPlayerCamp = SONG_ID;
	end;
	if nPlayerCamp == ALL_ID then
		Msg2Player("Qu©n hµm cña b¹n hiÖn míi lµ Binh sÜ, kh«ng thÓ nhËn trang bÞ"..sEquipName)
		return 0;	
	end;
	local nNeedRank = tBattleEquip[nEquipCamp][nEquipIdx][2];
	if (nEquipCamp ~= nPlayerCamp) then
		if nPlayerCamp == SONG_ID then
			Msg2Player("Ng­¬i lµ phe Tèng, kh«ng thÓ mÆc trang bÞ phe Liªu");
		else
			Msg2Player("Ng­¬i lµ phe Liªu, kh«ng thÓ mÆc trang bÞ phe Tèng");
		end;
		return 0;
	end;
	nCurRank = abs(nCurRank);
	if nCurRank < nNeedRank then
		Msg2Player("Qu©n hµm cña b¹n qu¸ thÊp, kh«ng thÓ trang bÞ"..sEquipName);
		return 0;
	end;
	return 1;
end;
