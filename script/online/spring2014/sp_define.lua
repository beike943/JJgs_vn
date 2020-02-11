DebugOutput = nothing;
SP_SWITCH = 1;
-----------------------------

--»î¶¯Ê±¼ä
--\script\misc\taskmanager.lua
SP_START_TIME = 2014013100;
SP_END_TIME = 2014021500;

SP_CITY_TABLE = {
	[1] = {
		[1] = 200,
		[2] = "BiÖn Kinh",
	},
	[2] = {
		[1] = 150,
		[2] = "D­¬ng Ch©u",
	},
	[3] = {
		[1] = 500,
		[2] = "Phông T­êng",
	},
	[4] = {
		[1] = 350,
		[2] = "T­¬ng D­¬ng",
	},
	[5] = {
		[1] = 300,
		[2] = "Thµnh §«",
	},
	[6] = {
		[1] = 100,
		[2] = "TuyÒn Ch©u",
	},
	[7] = {
		[1] = 400,
		[2] = "§¹i Lý",
	},
}

SP_TARGER_NPC_TABLE = {
	[1] = {
		"D· TÈu",
		"Tiªu s­",
		"KhÊu ChuÈn",
		"Vâ L©m Sø Gi¶",
		"V¹n Sù Th«ng",
	},
	[2] = {
		"L­u T­ Anh",
		"§Æc sø Vâ L©m",
		"Tö Quang C¸c L·o Nh©n",
		"Chñ th­¬ng héi",
		"Bµ mai",
	},
	[3] = {
		"Giang BiÖt H¹c",
		"ThÇn gi¸o H¾c Tæng Qu¶n",
		"Th¸nh N÷ NhËm Doanh Doanh",
		"C«n L«n Ph¸i V©n Hi Hßa",
		"Phông T­êng phñTh¸i thó ",
	},
	[4] = {
		"T­ M· TÊn Nguyªn",
		"Thiªn C¬ L·o Nh©n",
		"Thî rÌn L­u",
		"C«ng D· binh ",
		"Tæng binh",
	},
	[5] = {
		"Thµnh §« §¹i sø c«ng thµnh",
		"Ngò Hµnh T«n Gi¶",
		"Th¸i thó",
		"Tiªu s­",
		"Lien Dau Tiep Dan Quan",
	},
	[6] = {
		"ThÇn Du Ch©n Nh©n",
		"ThÇn Hµnh Th¸i B¶o §íi T«ng",
		"Sø gi¶ bang ph¸i",
		"Th¸i thó",
		"#Th­¬ng Nh©n B¶o R­¬ng",
	},
	[7] = {
		"LÔ quan",
		"§æng Giµ La",
		"TrÞnh Qu¸n Chi",
		"Cao Th¨ng TuyÒn",
		"Tö Quyªn",
	},
}

SP_NPC_TABLE = {
	[1]	= "Ha ha, ®a t¹ %s ®· ®Õn th¨m ta, chóc ng­¬i n¨m míi vâ c«ng cao c­êng, hµnh tÈu giang hå kÕt giao nhiÒu b»ng h÷u!",
	[2]	= "Chóc Mõng N¨m Míi! Nh×n thÊy ng­¬i lµ ta vui mõng l¾m l¾m! Hy väng %s mét n¨m míi An Khang ThÞnh V­îng, ThuËn Buåm Xu«i Giã! ",
	[3]	= "ThËt vui qu¸ ®i, ®· cã ng­êi ®Õn th¨m ta, chóc mäi viÖc may m¾n %s!",
	[4]	= "Ha ha, %s ng­¬i thËt cã lßng tèt, n¨m míi chóc ng­¬i sù sù thuËn t©m, ®¹i c¸t ®¹i lîi!",
	[5]	= "Cung Chóc Ph¸t Tµi, chóc %s n¨m míi vui vÎ, h¹nh phóc an khang!",
}

SP_NIANSHOU_POS = {
	{200, 1381, 2894, "BiÖn Kinh(172,180)"},
	{150, 1687, 3131, "D­¬ng Ch©u(210,195)"},
	{500, 1743, 3152, "Phông T­êng(218,196)"},
	{350, 1441, 3010, "T­¬ng D­¬ng(180,188)"},
	{300, 1764, 3554, "Thµnh §«(220,222)"},
	{100, 1416, 2996, "TuyÒn Ch©u(176,187)"},	
}

SP_NIANSHOU_AI_POS = {
	[200] = {{1380,2906},{1369,2893},{1380,2880},{1393,2893}},
	[150] = {{1686,3144},{1676,3130},{1686,3114},{1699,3130}},
	[500] = {{1743,3164},{1730,3152},{1741,3136},{1754,3152}},
	[350] = {{1440,3022},{1429,3009},{1440,2994},{1453,3009}},
	[300] = {{1763,3565},{1752,3554},{1763,3539},{1776,3553}},
	[100] = {{1416,3007},{1403,2995},{1416,2982},{1428,2995}},
}

SP_NIANSHOU_TALK  = {
	[1] = "Oa oa oa, ta sî nhÊt lµ ph¸o, ®õng ®¸nh ta n÷a, ta tÆng ng­¬i 1 §¹i B¶o R­¬ng, ®Ó ng­¬i ¨n TÕt, ng­¬i xem ta dÔ th­¬ng kh«ng chø!",
	[2] = "He he he, Xu©n ®Õn råi, h«m nay ta c¶m thÊy thËt vui vÎ, ng­¬i ®¸nh ta ta vÉn vui nh­ th­êng, tÆng ng­¬i 1 B¶o R­¬ng!",
	[3] = "A a a, xin ®¹i hiÖp tha m¹ng, tÆng ng­¬i 1 §¹i B¶o R­¬ng, ta dÔ th­¬ng nh­ thÕ nµy hay lµ th¶ ta ra ®i, chóc ng­¬i N¨m Míi Vui VÎ!",
	[4] = "Lµ l¸ la, N¨m míi vui vÎ nhÐ, ®¹i hiÖp thËt lµ may m¾n, ta giÊu b¶o r­¬ng kü nh­ thÕ, ng­¬i vÉn t×m ra ®­îc, thËt ®¸ng mÆt anh hïng hµo kiÖt!",
	[5] = "Ha ha ha, Cung chóc ph¸t tµi, ng­¬i thËt lµ ®Ñp m·, tÆng ng­¬i 1 b¶o r­¬ng, ®Ó ng­¬i ngµy nµo còng vui t­¬i, ngµy ngµy ng­¬i ®Õn ®©y t×m ch¬i víi ta chø?",
}

SP_NIANSHOU_EXTALK = {
	[1] = "Hi hi hi, ®¹i hiÖp ng­¬i thÝch ch¬i víi ta ®Õn thÕ sao, giê ta mÖt l¾m råi, ta ®i ngñ ®©y, ngµy mai l¹i ®Õn ®©y ch¬i víi ta nhÐ!",
	[2] = "Oa oa oa, cËu chñ nhá, ta ®· ®­a b¶o r­¬ng cho ng­¬i råi, ®õng ®¸nh ta n÷a, ngµy mai l¹i ®Õn ®©y t×m ta vui ch¬i tiÕp nhÐ!",
	[3] = "Ha ha ha, ta thËt vui qu¸ ®i, cã nhiÒu ng­êi ®Õn ch¬i víi ta qu¸, tÆng qu¸ nhiÒu b¶o r­¬ng cho hä råi, thËt ®¸ng tiÕc b©y giê kh«ng cã b¶o r­¬ng tÆng ng­¬i råi, ngµy mai l¹i ®Õn ®©y t×m ta nhÐ!",	
}
