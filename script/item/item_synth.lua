--½Å±¾¹¦ÄÜ£º½£Íø2Ô½ÄÏ-2011ÄêÁùÔÂ×ÊÁÏÆ¬-ºÏ³ÉµÀ¾ßµ÷ÓÃÍ³Ò»½çÃæ
--¹¦ÄÜÉè¼Æ£º´óÐÜ
--¹¦ÄÜ¿ª·¢£º´å³¤
--¹¦ÄÜ²âÊÔ£ºÐ¡ÐÜ
--¿ª·¢Ê±¼ä£º2011-5-5
--ÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
nTaskTempId_Item_HashCode = 249
SClew = "<color=green>Th«ng b¸o<color>:"
tEquipSeriesName = {
	"Tinh Kh¾c","Thiªn NghÜa","Cöu Ch©u","H¹o NguyÖt","DiÖu D­¬ng"
}
tEquipPosName = {
	"§Çu","Th­îng y","H¹ y","Vò khÝ","Trang søc"
}
--===×°±¸·¢·Å½ûÖ¹±í
tReleaseForbiddenList = {
	tMetiral = {
		["H¹o NguyÖt HuyÒn Kim"] = 1,
		["Ngò Hµnh HuyÒn Kim"] = 1,
		["DiÖu D­¬ng Cöu HuyÒn"] = 1,
	},
	tEquip = {
		--ð©ÔÂ£ºÈ«ÆÁ±Î
		[4] ={1,2,3,4,5},
		--Ò«Ñô£ºÈ«ÆÁ±Î
		[5] = {1,2,3,4,5},
	},
}
tMetiralInfo = {
	["M¶nh Tinh NgÊn"] = {
		{2,1,30299},
		"Tham gia diÔn vâ Thiªn M«n TrËn cã thÓ nhËn ®­îc ",
	},
	["Ngò Hµnh HuyÒn Th¹ch"] = {
		{2,1,30302},
		"Tham gia v­ît ¶i L­¬ng S¬n nhËn ®­îc ",
	},
	["ThiªnNghÜa TinhThiÕt"] = {
		{2,1,30300},
		"N©ng cÊp tõ  M¶nh Tinh Ng©n ",
	},
	["Ngò Hµnh HuyÒn ThiÕt"] = {
		{2,1,30303},
		"N©ng cÊp tõ Ngò Hµnh HuyÒn Th¹ch",
	},
	["Thiªn Cang LÖnh"] = {
		{2,95,204},
		"Nguån xuÊt hiÖn tõ v­ît ¶i L­¬ng S¬n ",
	},
	["H¹o NguyÖt HuyÒn Kim"] = {
		{2,1,30301},
		"N©ng cÊp tõ Thiªn NghÜa Tinh ThiÕt ",
	},
	["Ngò Hµnh HuyÒn Kim"] = {
		{2,1,30304},
		"N©ng cÊp tõ Ngò Hµnh HuyÒn ThiÕt ",
	},
	["DiÖu D­¬ng Cöu HuyÒn"] = {
		{2,1,30298},
		"GhÐp tõ Thiªn Cang LÖnh (v­ît ¶i L­¬ng S¬n), H¹o NguyÖt HuyÒn Kim, vµ Ngò hµnh HuyÒn Kim ",
	},
}
tItemSynthInfo = {
	["ThiªnNghÜa TinhThiÕt"] = {
		{
			{"M¶nh Tinh NgÊn",2},
			{" Kim ",2},
		},
		2
	},
	["Ngò Hµnh HuyÒn ThiÕt"] = {
		{
			{"Ngò Hµnh HuyÒn Th¹ch",2},
			{" Kim ",2},
		},
		2
	},
	["H¹o NguyÖt HuyÒn Kim"] = {
		{
			{"ThiªnNghÜa TinhThiÕt",3},
			{" Kim ",6},
		},
		6
	},
	["Ngò Hµnh HuyÒn Kim"] = {
		{
			{"Ngò Hµnh HuyÒn ThiÕt",3},
			{" Kim ",6},
		},
		6
	},
	["DiÖu D­¬ng Cöu HuyÒn"] = {
		{
			{"Thiªn Cang LÖnh",3},
			{"Ngò Hµnh HuyÒn Kim",99},
			{"H¹o NguyÖt HuyÒn Kim",99},
		},
		2
	},

}
tArmIdInfo = {
	[1] = {
		[1] = {
			{
				{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3033},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3036},
			},{
				{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3039},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3042},
			},{
				{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3045},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3048},
			},{
				{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3051},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3054},
			},
		},
		[2] = {
			{
				{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3034},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3037}
			},{
				{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3040},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3043}
			},{
				{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3046},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3049}
			},{
				{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3052},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3055}
			},
		},
		[3] = {
			{
				{"Long §»ng Tø H¶i Qu¸n",0,103,3056},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3060}
			},{
				{"Long §»ng Tø H¶i Qu¸n",0,103,3057},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3061}
			},{
				{"Long §»ng Tø H¶i Qu¸n",0,103,3058},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3062}
			},{
				{"Long §»ng Tø H¶i Qu¸n",0,103,3059},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3063}
			},
		},
		[4] = {
			[2] = 	{{"H¹o NguyÖt-§é N¹n T«n Gi¶ M·o",0,103,3064},	{"H¹o NguyÖt-§é N¹n T«n Gi¶ M·o",0,103,3065}},
			[3] = 	{{"H¹o NguyÖt-§é ¸ch T«n Gi¶ M·o",0,103,3068},	{"H¹o NguyÖt-§é ¸ch T«n Gi¶ M·o",0,103,3069}},
			[4] = 	{{"H¹o NguyÖt-§é KiÕp T«n Gi¶ M·o",0,103,3066},	{"H¹o NguyÖt-§é KiÕp T«n Gi¶ M·o",0,103,3067}},
			[6] = 	{{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3070},	{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3071},{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3072},{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3073}},
			[8] = 	{nil,								nil,							{"H¹o NguyÖt-PhËt V©n Th¸nh C« Tr©m",0,103,3074},{"H¹o NguyÖt-PhËt V©n Th¸nh C« Tr©m",0,103,3075}},
			[9] = 	{nil,								nil,							{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« Tr©m",0,103,3076},{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« Tr©m",0,103,3077}},
			[11] = 	{{"H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n",0,103,3078},	{"H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n",0,103,3079},{"H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n",0,103,3080},{"H¹o NguyÖt-Trôc Phông Thiªn C¸i C©n",0,103,3081}},
			[12] = 	{{"H¹o NguyÖt-Du Long §Þa KhÊt C©n",0,103,3082},	{"H¹o NguyÖt-Du Long §Þa KhÊt C©n",0,103,3083},{"H¹o NguyÖt-Du Long §Þa KhÊt C©n",0,103,3084},{"H¹o NguyÖt-Du Long §Þa KhÊt C©n",0,103,3085}},
			[14] = 	{{"H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n",0,103,3086},	{"H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n",0,103,3087},{"H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n",0,103,3088},{"H¹o NguyÖt-V« Cùc Thiªn T«n Qu¸n",0,103,3089}},
			[15] = 	{{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n",0,103,3090},	{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n",0,103,3091},{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n",0,103,3092},{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Qu¸n",0,103,3093}},
			[17] = 	{{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i",0,103,3094},	{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i",0,103,3095},{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i",0,103,3096},{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Kh«i",0,103,3097}},
			[18] = 	{{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3098},	{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3099},{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3100},{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3101}},
			[20] = 	{{"H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n",0,103,3102},	{"H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n",0,103,3103},{"H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n",0,103,3104},{"H¹o NguyÖt-Quû Xóc Tµ ThÇn C©n",0,103,3105}},
			[21] = 	{{"H¹o NguyÖt-Vu Cèt §éc V­¬ng C©n",0,103,3106},	{"H¹o NguyÖt-Vu Cèt §éc V­¬ng C©n",0,103,3107},{"H¹o NguyÖt-Vu Cèt §éc V­¬ng C©n",0,103,3108},{"H¹o NguyÖt-Vu Cèt §éc V­¬ng C©n",0,103,3109}},
			[23] =  {{"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Qu¸n",0,103,3110}, {"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Qu¸n",0,103,3111},nil,nil},
			[29] =  {nil,nil,{"H¹o NguyÖt-Tª V©n Tiªn Tö Tr©m",0,103,3124},{"H¹o NguyÖt-Tª V©n Tiªn Tö Tr©m",	0,103,3125}},
			[30] =  {nil,nil,{"H¹o NguyÖt-Phi H¹ Tiªn Tö Tr©m",0,103,3126},{"H¹o NguyÖt-Phi H¹ Tiªn Tö Tr©m",	0,103,3127}},
		},
		[5] = {
			[2] = 	{{"DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o",0,103,3128},	{"DiÖu D­¬ng-§é N¹n T«n Gi¶ M·o",0,103,3129}},
			[3] = 	{{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o",0,103,3132},	{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ M·o",0,103,3133}},
			[4] = 	{{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o",0,103,3130},	{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ M·o",0,103,3131}},
			[6] = 	{{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3134},	{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3135},{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3136},{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Qu¸n",0,103,3137}},
			[8] = 	{nil,								nil,							{"DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m",0,103,3138},{"DiÖu D­¬ng-PhËt V©n Th¸nh C« Tr©m",0,103,3139}},
			[9] = 	{nil,								nil,							{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m",0,103,3140},{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Tr©m",0,103,3141}},
			[11] = 	{{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n",0,103,3142},	{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n",0,103,3143},{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n",0,103,3144},{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i C©n",0,103,3145}},
			[12] = 	{{"DiÖu D­¬ng-Du Long §Þa KhÊt C©n",0,103,3146},	{"DiÖu D­¬ng-Du Long §Þa KhÊt C©n",0,103,3147},{"DiÖu D­¬ng-Du Long §Þa KhÊt C©n",0,103,3148},{"DiÖu D­¬ng-Du Long §Þa KhÊt C©n",0,103,3149}},
			[14] = 	{{"DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n",0,103,3150},	{"DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n",0,103,3151},{"DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n",0,103,3152},{"DiÖu D­¬ng-V« Cùc Thiªn T«n Qu¸n",0,103,3153}},
			[15] = 	{{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n",0,103,3154},	{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n",0,103,3155},{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n",0,103,3156},{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Qu¸n",0,103,3157}},
			[17] = 	{{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i",0,103,3158},	{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i",0,103,3159},{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i",0,103,3160},{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Kh«i",0,103,3161}},
			[18] = 	{{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3162},	{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3163},{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3164},{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Kh«i",0,103,3165}},
			[20] = 	{{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n",0,103,3166},	{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n",0,103,3167},{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n",0,103,3168},{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn C©n",0,103,3169}},
			[21] = 	{{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n",0,103,3170},	{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n",0,103,3171},{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n",0,103,3172},{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng C©n",0,103,3173}},
			[23] =  {{"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n",0,103,3174}, {"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Qu¸n",0,103,3175},nil,nil},
			[29] =  {nil,nil,{"DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m",0,103,3188},{"DiÖu D­¬ng-Tª V©n Tiªn Tö Tr©m",	0,103,3189}},
			[30] =  {nil,nil,{"DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m",0,103,3190},{"DiÖu D­¬ng-Phi H¹ Tiªn Tö Tr©m",	0,103,3191}},
		},
	},
	[2] ={
		[1] = {
			{
				{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3033},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3036}
			},{
				{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3039},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3042}
			},{
				{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3045},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3048}
			},{
				{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3051},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3054}
			},
		},
		[2] = {
			{
				{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3034},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3037}
			},{
				{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3040},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3043}
			},{
				{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3046},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3049}
			},{
				{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3052},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3055}
			},
		},
		[3] = {
			{
				{"Long §»ng Tø H¶i Y",0,100,3056},{"Phông Vò Cöu Thiªn Y",0,100,3060},
			},{
				{"Long §»ng Tø H¶i Y",0,100,3057},{"Phông Vò Cöu Thiªn Y",0,100,3061},
			},{
				{"Long §»ng Tø H¶i Y",0,100,3058},{"Phông Vò Cöu Thiªn Y",0,100,3062},
			},{
				{"Long §»ng Tø H¶i Y",0,100,3059},{"Phông Vò Cöu Thiªn Y",0,100,3063},
			},
		},
		[4] = {
			[2] = 	{{"H¹o NguyÖt-§é N¹n T«n Gi¶ Bµo",0,100,3064},	{"H¹o NguyÖt-§é N¹n T«n Gi¶ Bµo",0,100,3065}},
			[3] = 	{{"H¹o NguyÖt-§é ¸ch T«n Gi¶ Bµo",0,100,3068},	{"H¹o NguyÖt-§é ¸ch T«n Gi¶ Bµo",0,100,3069}},
			[4] = 	{{"H¹o NguyÖt-§é KiÕp T«n Gi¶ Bµo",0,100,3066},	{"H¹o NguyÖt-§é KiÕp T«n Gi¶ Bµo",0,100,3067}},
			[6] = 	{{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y",0,100,3070},	{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y",0,100,3071},{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y",0,100,3072},{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Y",0,100,3073}},
			[8] = 	{nil,								nil,							{"H¹o NguyÖt-PhËt V©n Th¸nh C« Y",0,100,3074},{"H¹o NguyÖt-PhËt V©n Th¸nh C« Y",0,100,3075}},
			[9] = 	{nil,								nil,							{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« Y",0,100,3076},{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« Y",0,100,3077}},
			[11] = 	{{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Y",0,100,3078},	{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Y",0,100,3079},{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Y",0,100,3080},{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Y",0,100,3081}},
			[12] = 	{{"H¹o NguyÖt-Du Long §Þa KhÊt Y",0,100,3082},	{"H¹o NguyÖt-Du Long §Þa KhÊt Y",0,100,3083},{"H¹o NguyÖt-Du Long §Þa KhÊt Y",0,100,3084},{"H¹o NguyÖt-Du Long §Þa KhÊt Y",0,100,3085}},
			[14] = 	{{"H¹o NguyÖt-V« Cùc Thiªn T«n Bµo",0,100,3086},	{"H¹o NguyÖt-V« Cùc Thiªn T«n Bµo",0,100,3087},{"H¹o NguyÖt-V« Cùc Thiªn T«n Bµo",0,100,3088},{"H¹o NguyÖt-V« Cùc Thiªn T«n Bµo",0,100,3089}},
			[15] = 	{{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo",0,100,3090},	{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo",0,100,3091},{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo",0,100,3092},{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bµo",0,100,3093}},
			[17] = 	{{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p",0,100,3094},	{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p",0,100,3095},{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p",0,100,3096},{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Gi¸p",0,100,3097}},
			[18] = 	{{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3098},	{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3099},{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3100},{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3101}},
			[20] = 	{{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Y",0,100,3102},	{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Y",0,100,3103},{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Y",0,100,3104},{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Y",0,100,3105}},
			[21] = 	{{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Y",0,100,3106},	{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Y",0,100,3107},{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Y",0,100,3108},{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Y",0,100,3109}},
			[23] =  {{"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Bµo",0,100,3110}, {"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Bµo",0,100,3111},nil,nil},
			[29] =  {nil,nil,{"H¹o NguyÖt-Tª V©n Tiªn Tö Y",0,100,3124},{"H¹o NguyÖt-Tª V©n Tiªn Tö Y",	0,100,3125}},
			[30] =  {nil,nil,{"H¹o NguyÖt-Phi H¹ Tiªn Tö Y",0,100,3126},{"H¹o NguyÖt-Phi H¹ Tiªn Tö Y",	0,100,3127}},
		},
		[5] = {
			[2] = 	{{"DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo",0,100,3128},	{"DiÖu D­¬ng-§é N¹n T«n Gi¶ Bµo",0,100,3129}},
			[3] = 	{{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo",0,100,3132},	{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ Bµo",0,100,3133}},
			[4] = 	{{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo",0,100,3130},	{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ Bµo",0,100,3131}},
			[6] = 	{{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y",0,100,3134},	{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y",0,100,3135},{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y",0,100,3136},{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Y",0,100,3137}},
			[8] = 	{nil,								nil,							{"DiÖu D­¬ng-PhËt V©n Th¸nh C« Y",0,100,3138},{"DiÖu D­¬ng-PhËt V©n Th¸nh C« Y",0,100,3139}},
			[9] = 	{nil,								nil,							{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y",0,100,3140},{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« Y",0,100,3141}},
			[11] = 	{{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y",0,100,3142},	{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y",0,100,3143},{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y",0,100,3144},{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Y",0,100,3145}},
			[12] = 	{{"DiÖu D­¬ng-Du Long §Þa KhÊt Y",0,100,3146},	{"DiÖu D­¬ng-Du Long §Þa KhÊt Y",0,100,3147},{"DiÖu D­¬ng-Du Long §Þa KhÊt Y",0,100,3148},{"DiÖu D­¬ng-Du Long §Þa KhÊt Y",0,100,3149}},
			[14] = 	{{"DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo",0,100,3150},	{"DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo",0,100,3151},{"DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo",0,100,3152},{"DiÖu D­¬ng-V« Cùc Thiªn T«n Bµo",0,100,3153}},
			[15] = 	{{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo",0,100,3154},	{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo",0,100,3155},{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo",0,100,3156},{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bµo",0,100,3157}},
			[17] = 	{{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p",0,100,3158},	{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p",0,100,3159},{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p",0,100,3160},{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Gi¸p",0,100,3161}},
			[18] = 	{{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3162},	{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3163},{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3164},{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Gi¸p",0,100,3165}},
			[20] = 	{{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y",0,100,3166},	{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y",0,100,3167},{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y",0,100,3168},{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Y",0,100,3169}},
			[21] = 	{{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y",0,100,3170},	{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y",0,100,3171},{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y",0,100,3172},{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Y",0,100,3173}},
			[23] =  {{"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo",0,100,3174}, {"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Bµo",0,100,3175},nil,nil},
			[29] =  {nil,nil,{"DiÖu D­¬ng-Tª V©n Tiªn Tö Y",0,100,3188},{"DiÖu D­¬ng-Tª V©n Tiªn Tö Y",	0,100,3189}},
			[30] =  {nil,nil,{"DiÖu D­¬ng-Phi H¹ Tiªn Tö Y",0,100,3190},{"DiÖu D­¬ng-Phi H¹ Tiªn Tö Y",	0,100,3191}},
		},
	},
	[3] ={
		[1] = {
			{
				{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3033},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3036},
			},{
				{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3039},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3042},
			},{
				{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3045},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3048},
			},{
				{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3051},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3054}
			},
		},
		[2] = {
			{
				{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3034},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3037},
			},{
				{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3040},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3043},
			},{
				{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3046},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3049},
			},{
				{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3052},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3055},
			},
		},
		[3] = {
			{
				{"Long §»ng Tø H¶i Trang",0,101,3056},{"Phông Vò Cöu Thiªn Trang",0,101,3060},
			},{
				{"Long §»ng Tø H¶i Trang",0,101,3057},{"Phông Vò Cöu Thiªn Trang",0,101,3061},
			},{
				{"Long §»ng Tø H¶i Trang",0,101,3058},{"Phông Vò Cöu Thiªn Trang",0,101,3062},
			},{
				{"Long §»ng Tø H¶i Trang",0,101,3059},{"Phông Vò Cöu Thiªn Trang",0,101,3063},
			},
		},
		[4] = {
			[2] = 	{{"H¹o NguyÖt-§é N¹n T«n Gi¶ Trang",0,101,3064},	{"H¹o NguyÖt-§é N¹n T«n Gi¶ Trang",0,101,3065}},
			[3] = 	{{"H¹o NguyÖt-§é ¸ch T«n Gi¶ Trang",0,101,3068},	{"H¹o NguyÖt-§é ¸ch T«n Gi¶ Trang",0,101,3069}},
			[4] = 	{{"H¹o NguyÖt-§é KiÕp T«n Gi¶ Trang",0,101,3066},	{"H¹o NguyÖt-§é KiÕp T«n Gi¶ Trang",0,101,3067}},
			[6] = 	{{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang",0,101,3070},	{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang",0,101,3071},{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang",0,101,3072},{"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Trang",0,101,3073}},
			[8] = 	{nil,								nil,							{"H¹o NguyÖt-PhËt V©n Th¸nh C« QuÇn",0,101,3074},{"H¹o NguyÖt-PhËt V©n Th¸nh C« QuÇn",0,101,3075}},
			[9] = 	{nil,								nil,							{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« QuÇn",0,101,3076},{"H¹o NguyÖt-PhËt TrÇn Th¸nh C« QuÇn",0,101,3077}},
			[11] = 	{{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang",0,101,3078},	{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang",0,101,3079},{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang",0,101,3080},{"H¹o NguyÖt-Trôc Phông Thiªn C¸i Trang",0,101,3081}},
			[12] = 	{{"H¹o NguyÖt-Du Long §Þa KhÊt Trang",0,101,3082},	{"H¹o NguyÖt-Du Long §Þa KhÊt Trang",0,101,3083},{"H¹o NguyÖt-Du Long §Þa KhÊt Trang",0,101,3084},{"H¹o NguyÖt-Du Long §Þa KhÊt Trang",0,101,3085}},
			[14] = 	{{"H¹o NguyÖt-V« Cùc Thiªn T«n Trang",0,101,3086},	{"H¹o NguyÖt-V« Cùc Thiªn T«n Trang",0,101,3087},{"H¹o NguyÖt-V« Cùc Thiªn T«n Trang",0,101,3088},{"H¹o NguyÖt-V« Cùc Thiªn T«n Trang",0,101,3089}},
			[15] = 	{{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang",0,101,3090},	{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang",0,101,3091},{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang",0,101,3092},{"H¹o NguyÖt-BÝch L¹c Thiªn T«n Trang",0,101,3093}},
			[17] = 	{{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang",0,101,3094},	{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang",0,101,3095},{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang",0,101,3096},{"H¹o NguyÖt-C¶m Thiªn §Êu Hån Trang",0,101,3097}},
			[18] = 	{{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3098},	{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3099},{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3100},{"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3101}},
			[20] = 	{{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang",0,101,3102},	{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang",0,101,3103},{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang",0,101,3104},{"H¹o NguyÖt-Quû Xóc Tµ ThÇn Trang",0,101,3105}},
			[21] = 	{{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Trang",0,101,3106},	{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Trang",0,101,3107},{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Trang",0,101,3108},{"H¹o NguyÖt-Vu Cèt §éc V­¬ng Trang",0,101,3109}},
			[23] =  {{"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Trang",0,101,3110}, {"H¹o NguyÖt-BÊt §éng Ch©n Tiªn Trang",0,101,3111},nil,nil},
			[29] =  {nil,nil,{"H¹o NguyÖt-Tª V©n Tiªn Tö QuÇn",0,101,3124},{"H¹o NguyÖt-Tª V©n Tiªn Tö QuÇn",	0,101,3125}},
			[30] =  {nil,nil,{"H¹o NguyÖt-Phi H¹ Tiªn Tö ",0,101,3126},{"H¹o NguyÖt-Phi H¹ Tiªn Tö ",	0,101,3127}},
		},
		[5] = {
			[2] = 	{{"DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang",0,101,3128},	{"DiÖu D­¬ng-§é N¹n T«n Gi¶ Trang",0,101,3129}},
			[3] = 	{{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang",0,101,3132},	{"DiÖu D­¬ng-§é ¸ch T«n Gi¶ Trang",0,101,3133}},
			[4] = 	{{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang",0,101,3130},	{"DiÖu D­¬ng-§é KiÕp T«n Gi¶ Trang",0,101,3131}},
			[6] = 	{{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang",0,101,3134},	{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang",0,101,3135},{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang",0,101,3136},{"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Trang",0,101,3137}},
			[8] = 	{nil,								nil,							{"DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn",0,101,3138},{"DiÖu D­¬ng-PhËt V©n Th¸nh C« QuÇn",0,101,3139}},
			[9] = 	{nil,								nil,							{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn",0,101,3140},{"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« QuÇn",0,101,3141}},
			[11] = 	{{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang",0,101,3142},	{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang",0,101,3143},{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang",0,101,3144},{"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Trang",0,101,3145}},
			[12] = 	{{"DiÖu D­¬ng-Du Long §Þa KhÊt Trang",0,101,3146},	{"DiÖu D­¬ng-Du Long §Þa KhÊt Trang",0,101,3147},{"DiÖu D­¬ng-Du Long §Þa KhÊt Trang",0,101,3148},{"DiÖu D­¬ng-Du Long §Þa KhÊt Trang",0,101,3149}},
			[14] = 	{{"DiÖu D­¬ng-V« Cùc Thiªn T«n Trang",0,101,3150},	{"DiÖu D­¬ng-V« Cùc Thiªn T«n Trang",0,101,3151},{"DiÖu D­¬ng-V« Cùc Thiªn T«n Trang",0,101,3152},{"DiÖu D­¬ng-V« Cùc Thiªn T«n Trang",0,101,3153}},
			[15] = 	{{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang",0,101,3154},	{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang",0,101,3155},{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang",0,101,3156},{"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Trang",0,101,3157}},
			[17] = 	{{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang",0,101,3158},	{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang",0,101,3159},{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang",0,101,3160},{"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Trang",0,101,3161}},
			[18] = 	{{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3162},	{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3163},{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3164},{"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Trang",0,101,3165}},
			[20] = 	{{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang",0,101,3166},	{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang",0,101,3167},{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang",0,101,3168},{"DiÖu D­¬ng-Quû Xóc Tµ ThÇn Trang",0,101,3169}},
			[21] = 	{{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang",0,101,3170},	{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang",0,101,3171},{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang",0,101,3172},{"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Trang",0,101,3173}},
			[23] =  {{"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang",0,101,3174}, {"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn Trang",0,101,3175},nil,nil},
			[29] =  {nil,nil,{"DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn",0,101,3188},{"DiÖu D­¬ng-Tª V©n Tiªn Tö QuÇn",	0,101,3189}},
			[30] =  {nil,nil,{"DiÖu D­¬ng-Phi H¹ Tiªn Tö",0,101,3190},{"DiÖu D­¬ng-Phi H¹ Tiªn Tö",	0,101,3191}},
		},
	},
}
tRingIdInfo = {
	[1] = {
		{"Tinh Kh¾c-HuyÒn Th¹ch Kim Ngäc (trang søc søc m¹nh)",0,102,3121},
		{"Tinh Kh¾c-PhØ Thóy Méc §íi (trang søc th©n ph¸p)",0,102,3124},
		{"Tinh Kh¾c-NguyÖt Hoa Thñy Béi (trang søc néi c«ng)",0,102,3127},
		{"Tinh Kh¾c-Cöu ¢m Háa Giíi (trang søc linh ho¹t)",0,102,3130},
		{"Tinh Kh¾c-Ng­ng Ngäc Thæ Hoµn (trang søc g©n cèt)",0,102,3133},
	},
	[2] = {
		{"Thiªn NghÜa-HuyÒn Th¹ch Kim Ngäc (trang søc søc m¹nh)",0,102,3122},
		{"Thiªn NghÜa- PhØ Thóy Méc §íi (trang søc th©n ph¸p)",0,102,3125},
		{"Thiªn NghÜa- NguyÖt Hoa Thñy Béi (trang søc néi c«ng)",0,102,3128},
		{"Thiªn NghÜa- Cöu ¢m Háa Giíi (trang søc linh ho¹t)",0,102,3131},
		{"Thiªn NghÜa- Ng­ng Ngäc Thæ Hoµn (trang søc g©n cèt)",0,102,3134},
	},
	[3] = {
		[2] = {
			{"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3135},
			{"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3136},
		},
		[3] = {
			{"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3137},
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3138},
		},
		[4] = {
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3139},
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3140},
		},
		[6] = {
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3141},
			{"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3142},
		},
		[8] = {
			{"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3143},
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3144},
		},
		[9] = {
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3145},
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3146},
		},
		[11] = {
			{"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3147},
			{"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3148},
		},
		[12] = {
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3149},
			{"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3150},
		},
		[14] = {
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3151},
			{"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3152},
		},
		[15] = {
			{"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3153},
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3154},
		},
		[17] = {
			{"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3155},
			{"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3156},
		},
		[18] = {
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3157},
			{"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3158},
		},
		[20] = {
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3159},
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3160},
		},
		[21] = {
			{"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3161},
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3162},
		},
		[23] = {
			{"Cöu Ch©u-NguyÖt Hoa Thñy Béi",0,102,3163},
			{"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3164},
		},
		[29] = {
			{"Cöu Ch©u-PhØ Thóy Méc §íi",0,102,3171},
			{"Cöu Ch©u-HuyÒn Th¹ch Kim Ngäc",0,102,3172},
		},
		[30] = {
			{"Cöu Ch©u-Ng­ng Ngäc Thæ Hoµn",0,102,3173},
			{"Cöu Ch©u-Cöu ¦u Háa Giíi",0,102,3174},
		},
	},
	[4] = {
		{"H¹o NguyÖt-¤ L©n B¶o Giíi (trang søc søc m¹nh)",0,102,3175},
		{"H¹o NguyÖt-Tö Giao Ngäc Béi (trang søc th©n ph¸p)",0,102,3177},
		{"H¹o NguyÖt-V©n Hæ LÖnh Bµi (trang søc néi c«ng)",0,102,3179},
		{"H¹o NguyÖt-XÝch T­íc ChØ Hoµn (trang søc linh ho¹t)",0,102,3181},
		{"H¹o NguyÖt-BÝch Quy H¹ng Liªn (trang søc g©n cèt)",0,102,3183},
	},
	[5] = {
		{"DiÖu D­¬ng- ¤ L©n B¶o Giíi (trang søc søc m¹nh)",0,102,3176},
		{"DiÖu D­¬ng- Tö Giao Ngäc Béi (trang søc th©n ph¸p)",0,102,3178},
		{"DiÖu D­¬ng- V©n Hæ LÖnh Bµi (trang søc néi c«ng)",0,102,3180},
		{"DiÖu D­¬ng- XÝch T­íc ChØ Hoµn (trang søc linh ho¹t)",0,102,3182},
		{"DiÖu D­¬ng- BÝch Quy H¹ng Liªn (trang søc g©n cèt)",0,102,3184},
	},
}
tWeaponIdInfo = {
	[1] = {
		[2]={"Tinh Kh¾c-L­u Ly Giíi §ao",0,3,8892},
		[3]={"Tinh Kh¾c-Kinh L«i ThiÒn Tr­îng",0,8,8909},
		[4]={"Tinh Kh¾c-L«i ¢m Nang Thñ",0,0,8874},
		[6]={"Tinh Kh¾c-¢m D­¬ng Xuyªn ¶nh",0,1,8879},
		[8]={"Tinh Kh¾c-Tõ Hµn ¢m KiÕm",0,2,8884},
		[9]={"Tinh Kh¾c-Cöu Hoµn Bèi CÇm",0,10,8918},
		[11]={"Tinh Kh¾c-Quy L©n Hé Thñ",0,0,8875},
		[12]={"Tinh Kh¾c-TrÊn Ng¹o C«n",0,5,8900},
		[14]={"Tinh Kh¾c-ThuÇn Phong KiÕm",0,2,8885},
		[15]={"Tinh Kh¾c-Tinh §Èu ChuyÓn Bót",0,9,8913},
		[17]={"Tinh Kh¾c-Ph¸ Qu©n TrËn Th­¬ng",0,6,8903},
		[18]={"Tinh Kh¾c-Truy MÖnh Cung",0,4,8897},
		[20]={"Tinh Kh¾c-ThiÖp Cèt HuyÕt §ao",0,7,8906},
		[21]={"Tinh Kh¾c-LuyÖn Hån HuyÕt Tr¶o",0,11,8922},
		[23]={"Tinh Kh¾c-Ngù Thiªn Phong KiÕm",	0,	2,	8886},
		[29]={"Tinh Kh¾c-Linh Lung Chi",	0,	13,	8930},
		[30]={"Tinh Kh¾c-Cöu Tiªu S¸o",	0,	12,	8927},
	},
	[2] = {
		[2]={"Thiªn NghÜa-L­u Ly Giíi §ao",0,3,8894},
		[3]={"Thiªn NghÜa-Kinh L«i ThiÒn Tr­îng",0,8,8910},
		[4]={"Thiªn NghÜa-L«i ¢m Nang Thñ",0,0,8876},
		[6]={"Thiªn NghÜa-¢m D­¬ng Xuyªn ¶nh",0,1,8880},
		[8]={"Thiªn NghÜa-Tõ Hµn ¢m KiÕm",0,2,8887},
		[9]={"Thiªn NghÜa-Cöu Hoµn Bèi CÇm",0,10,8919},
		[11]={"Thiªn NghÜa-Quy L©n Hé Thñ",0,0,8877},
		[12]={"Thiªn NghÜa-TrÊn Ng¹o C«n",0,5,8901},
		[14]={"Thiªn NghÜa-ThuÇn Phong KiÕm",0,2,8888},
		[15]={"Thiªn NghÜa-Tinh §Èu ChuyÓn Bót",0,9,8915},
		[17]={"Thiªn NghÜa-Ph¸ Qu©n TrËn Th­¬ng",0,6,8904},
		[18]={"Thiªn NghÜa-Truy MÖnh Cung",0,4,8898},
		[20]={"Thiªn NghÜa-ThiÖp Cèt HuyÕt §ao",0,7,8907},
		[21]={"Thiªn NghÜa-LuyÖn Hån HuyÕt Tr¶o",0,11,8924},
		[23]={"Thiªn NghÜa-Ngù Thiªn Phong KiÕm",	0,	2,	8889},
		[29]={"Thiªn NghÜa-Linh Lung Chi",	0,	13,	8931},
		[30]={"Thiªn NghÜa-Cöu Tiªu S¸o",	0,	12,	8928},
	},
	[3] = {
		[2]={"Cöu Ch©u-L­u Ly Giíi §ao",0,3,8932},
		[3]={"Cöu Ch©u-Kinh L«i ThiÒn Tr­îng",0,8,8934},
		[4]={"Cöu Ch©u-L«i ¢m Nang Thñ",0,0,8933},
		[6]={"Cöu Ch©u-¢m D­¬ng Xuyªn ¶nh",0,1,8935},
		[8]={"Cöu Ch©u-Tõ Hµn ¢m KiÕm",0,2,8936},
		[9]={"Cöu Ch©u-Cöu Hoµn Bèi CÇm",0,10,8937},
		[11]={"Cöu Ch©u-Quy L©n Hé Thñ",0,0,8938},
		[12]={"Cöu Ch©u-TrÊn Ng¹o C«n",0,5,8939},
		[14]={"Cöu Ch©u-ThuÇn Phong KiÕm",0,2,8940},
		[15]={"Cöu Ch©u-Tinh §Èu ChuyÓn Bót",0,9,8941},
		[17]={"Cöu Ch©u-Ph¸ Qu©n TrËn Th­¬ng",0,6,8942},
		[18]={"Cöu Ch©u-Truy MÖnh Cung",0,4,8943},
		[20]={"Cöu Ch©u-ThiÖp Cèt HuyÕt §ao",0,7,8944},
		[21]={"Cöu Ch©u-LuyÖn Hån HuyÕt Tr¶o",0,11,8945},
		[23]={"Cöu Ch©u-Ngù Thiªn Phong KiÕm",	0,	2,	8946},
		[29]={"Cöu Ch©u-Linh Lung Chi",	0,	13,	8950},
		[30]={"Cöu Ch©u-Cöu Tiªu S¸o",	0,	12,	8951},
	},
	[4] = {
		[2]={"H¹o NguyÖt-§é N¹n T«n Gi¶ PhËt §ao",0,3,8972,1},
		[3]={"H¹o NguyÖt-§é KiÕp T«n Gi¶ PhËt Thñ",0,0,8973,1},
		[4]={"H¹o NguyÖt-§é ¸ch T«n Gi¶ PhËt Tr­îng",0,8,8974,1},
		[6]={"H¹o NguyÖt-V¹n KiÕp Th¸nh Thñ Tr©m",0,1,8975,1},
		[8]={"H¹o NguyÖt-PhËt V©n Th¸nh C« Liªn KiÕm",0,2,8976,1},
		[9]={"H¹o NguyÖt-PhËt TrÇn Th¸nh C« CÇm",0,10,8977,1},
		[11]={"H¹o NguyÖt-Trôc Phông Thiªn C¸i Thñ",0,0,8978,1},
		[12]={"H¹o NguyÖt-Du Long §Þa KhÊt C«n",0,5,8979,1},
		[14]={"H¹o NguyÖt-V« Cùc Thiªn T«n Tóc KiÕm",0,2,8980,1},
		[15]={"H¹o NguyÖt-BÝch L¹c Thiªn T«n Bót",0,9,8981,1},
		[17]={"H¹o NguyÖt-C¶m Thiªn §Êu Hån Th­¬ng",0,6,8982,1},
		[18]={"H¹o NguyÖt-§Þnh Thiªn ThÇn NghÖ Cung",0,4,8983,1},
		[20]={"H¹o NguyÖt-Quû Xóc Tµ ThÇn §ao",0,7,8984,1},
		[21]={"H¹o NguyÖt-Vu Cèt §éc V­¬ng Tr¶o",0,11,8985,1},
		[23]={"H¹o NguyÖt-BÊt §éng Ch©n Tiªn KiÕm",	0,	2,	8986},
		[29]={"H¹o NguyÖt-Tª V©n Tiªn Tö PhiÕn",	0,	13,	8990},
		[30]={"H¹o NguyÖt-Phi H¹ Tiªn Tö ¦u Lan Tiªu",	0,	12,	8991},
	},
	[5] = {
		[2]={"DiÖu D­¬ng-§é N¹n T«n Gi¶ PhËt §ao",0,3,8992},
		[3]={"DiÖu D­¬ng-§é KiÕp T«n Gi¶ PhËt Thñ",0,0,8993},
		[4]={"DiÖu D­¬ng-§é ¸ch T«n Gi¶ PhËt Tr­îng",0,8,8994},
		[6]={"DiÖu D­¬ng-V¹n KiÕp Th¸nh Thñ Tr©m",0,1,8995},
		[8]={"DiÖu D­¬ng-PhËt V©n Th¸nh C« Liªn KiÕm",0,2,8996},
		[9]={"DiÖu D­¬ng-PhËt TrÇn Th¸nh C« CÇm",0,10,8997},
		[11]={"DiÖu D­¬ng-Trôc Phông Thiªn C¸i Thñ",0,0,8998},
		[12]={"DiÖu D­¬ng-Du Long §Þa KhÊt C«n",0,5,8999},
		[14]={"DiÖu D­¬ng-V« Cùc Thiªn T«n Tóc KiÕm",0,2,9000},
		[15]={"DiÖu D­¬ng-BÝch L¹c Thiªn T«n Bót",0,9,9001},
		[17]={"DiÖu D­¬ng-C¶m Thiªn §Êu Hån Th­¬ng",0,6,9002},
		[18]={"DiÖu D­¬ng-§Þnh Thiªn ThÇn NghÖ Cung",0,4,9003},
		[20]={"DiÖu D­¬ng-Quû Xóc Tµ ThÇn §ao",0,7,9004},
		[21]={"DiÖu D­¬ng-Vu Cèt §éc V­¬ng Tr¶o",0,11,9005},
		[23]={"DiÖu D­¬ng-BÊt §éng Ch©n Tiªn KiÕm",	0,	2,	9006},
		[29]={"DiÖu D­¬ng-Tª V©n Tiªn Tö PhiÕn",	0,	13,	9010},
		[30]={"DiÖu D­¬ng-Phi H¹ Tiªn Tö ¦u Lan Tiªu",	0,	12,	9011},
	},
}
--×°±¸×Ü±í
tQuipMainInfo = {
	tArmIdInfo[1],tArmIdInfo[2],tArmIdInfo[3],tWeaponIdInfo,tRingIdInfo
}
--¶Ò»»×°±¸¹æÔò±í
tEquipSynthInfo = {
	[1] = {		--ÐÇ¿Ì
		--Í·
		[1] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[1][1],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"M¶nh Tinh NgÊn",300},
				{" Kim ",300},
			}
		},
		--ÒÂ·þ
		[2] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[2][1],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"M¶nh Tinh NgÊn",360},
				{" Kim ",200},
			}
		},
		--ÏÂ×°
		[3] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[3][1],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"M¶nh Tinh NgÊn",180},
				{" Kim ",100},
			}
		},
		--ÎäÆ÷
		[4] = {
			--×°±¸±í
			tEquipInfo = tWeaponIdInfo[1],
			tTableStructure = {"Route"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"M¶nh Tinh NgÊn",420},
				{"Ngò Hµnh HuyÒn Th¹ch",420},
				{" Kim ",400},
			}
		},
		--Ê×ÊÎ
		[5] = {
			--×°±¸±í
			tEquipInfo = tRingIdInfo[1],
			--ÏûºÄ±í
			tEquipConsum = {
				{"Ngò Hµnh HuyÒn Th¹ch",420},
				{" Kim ",200},
			}
		},
	},
	[2] = {		--ÌìÒÇ
		--Í·
		[1] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[1][2],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"ThiªnNghÜa TinhThiÕt",480},
				{" Kim ",300},
			}
		},
		--ÒÂ·þ
		[2] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[2][2],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"ThiªnNghÜa TinhThiÕt",360},
				{" Kim ",200},
			}
		},
		--ÏÂ×°
		[3] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[3][2],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"ThiªnNghÜa TinhThiÕt",180},
				{" Kim ",100},
			}
		},
		--ÎäÆ÷
		[4] = {
			--×°±¸±í
			tEquipInfo = tWeaponIdInfo[2],
			tTableStructure = {"Route"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"Ngò Hµnh HuyÒn ThiÕt",420},
				{"ThiªnNghÜa TinhThiÕt",420},
				{" Kim ",400},
			}
		},
		--Ê×ÊÎ
		[5] = {
			--×°±¸±í
			tEquipInfo = tRingIdInfo[2],
			--ÏûºÄ±í
			tEquipConsum = {
				{"Ngò Hµnh HuyÒn ThiÕt",420},
				{" Kim ",200},
			}
		},
	},
	[3] = {		--¾ÅÖÝ
		--Í·
		[1] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[1][4],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"Thiªn Cang LÖnh",4},
				{" Kim ",200},
			},
		},
		--ÒÂ·þ
		[2] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[2][4],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"Thiªn Cang LÖnh",3},
				{" Kim ",150},
			},
		},
		--ÏÂ×°
		[3] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[3][4],
			--±í½á¹¹
			tTableStructure = {"Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"Thiªn Cang LÖnh",2},
				{" Kim ",100},
			},
		},
		--ÎäÆ÷
		[4] = {
			--×°±¸±í
			tEquipInfo = tWeaponIdInfo[4],
			tTableStructure = {"Route"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"Thiªn Cang LÖnh",6},
				{" Kim ",300},
			},
		},
		--Ê×ÊÎ
		[5] = {
			--×°±¸±í
			tEquipInfo = tRingIdInfo[4],
			--±í½á¹¹
			tTableStructure = {"Route"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"Thiªn Cang LÖnh",3},
				{" Kim ",150},
			},
		},
	},
	[4] = {		--ð©ÔÂ
		--Í·
		[1] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[1][3],
			--±í½á¹¹
			tTableStructure = {"Route","Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"H¹o NguyÖt HuyÒn Kim",480},
				{" Kim ",300},
			},
		},
		--ÒÂ·þ
		[2] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[2][3],
			--±í½á¹¹
			tTableStructure = {"Route","Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"H¹o NguyÖt HuyÒn Kim",360},
				{" Kim ",200},
			},
		},
		--ÏÂ×°
		[3] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[3][3],
			--±í½á¹¹
			tTableStructure = {"Route","Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"H¹o NguyÖt HuyÒn Kim",180},
				{" Kim ",100},
			},
		},
		--ÎäÆ÷
		[4] = {
			--×°±¸±í
			tEquipInfo = tWeaponIdInfo[3],
			tTableStructure = {"Route"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"H¹o NguyÖt HuyÒn Kim",420},
				{"Ngò Hµnh HuyÒn Kim",420},
				{" Kim ",400},
			},
		},
		--Ê×ÊÎ
		[5] = {
			--×°±¸±í
			tEquipInfo = tRingIdInfo[3],
			--ÏûºÄ±í
			tEquipConsum = {
				{"Ngò Hµnh HuyÒn Kim",420},
				{" Kim ",200},
			},
		},
	},
	[5] = {		--Ò«Ñô
		--Í·
		[1] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[1][5],
			--±í½á¹¹
			tTableStructure = {"Route","Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"DiÖu D­¬ng Cöu HuyÒn",4},
				{" Kim ",400},
			},
		},
		--ÒÂ·þ
		[2] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[2][5],
			--±í½á¹¹
			tTableStructure = {"Route","Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"DiÖu D­¬ng Cöu HuyÒn",3},
				{" Kim ",300},
			},
		},
		--ÏÂ×°
		[3] = {
			--×°±¸±í
			tEquipInfo = tArmIdInfo[3][5],
			--±í½á¹¹
			tTableStructure = {"Route","Body"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"DiÖu D­¬ng Cöu HuyÒn",2},
				{" Kim ",200},
			},
		},
		--ÎäÆ÷
		[4] = {
			--×°±¸±í
			tEquipInfo = tWeaponIdInfo[5],
			tTableStructure = {"Route"},
			--ÏûºÄ±í
			tEquipConsum = {
				{"DiÖu D­¬ng Cöu HuyÒn",6},
				{" Kim ",600},
			},
		},
		--Ê×ÊÎ
		[5] = {
			--×°±¸±í
			tEquipInfo = tRingIdInfo[5],
			--ÏûºÄ±í
			tEquipConsum = {
				{"DiÖu D­¬ng Cöu HuyÒn",3},
				{" Kim ",300},
			},
		},
	},
}
--=============¸ù¾Ý×°±¸·¢·Å½×¶ÎÅäÖÃµÄ²ÄÁÏºÍ×°±¸ÆÁ±Î±í
function release_fobidden()
	--×°±¸ÆÁ±Î
	for nEquipSeq,tEquipPosSeq in tReleaseForbiddenList["tEquip"] do
		tremove(tEquipSeriesName,nEquipSeq)
		tremove(tEquipSynthInfo,nEquipSeq)
		for _,nEquipPosSeq in tEquipPosSeq do
			tremove(tQuipMainInfo[nEquipSeq],nEquipPosSeq)
		end
	end
	--µÀ¾ßÆÁ±Î

end
release_fobidden()
--=================
function OnUse(nItemIndex)
	local sItemName= get_item_info(nItemIndex)
	Say(SClew.."<color=green>"..sItemName.."<color>"..tMetiralInfo[sItemName][2]..format(",§¹i hiÖp muèn dïng <color=green>%s<color> cho môc ®Ých g×?",sItemName),
		5,
		"Ta muèn ghÐp trang bÞ /#equip_chg_main("..nItemIndex..")",
		"Ta muèn xem phèi ph­¬ng ghÐp trang bÞ /equip_chg_rule",
		"Ta muèn n©ng cÊp ®¹o cô /#dia_metiral_chg_main("..nItemIndex..")",
		"Ta muèn xem phèi ph­¬ng n©ng cÊp /metiral_chg_rule",
		"Tho¸t/nothing"
	)
end
--×°±¸¶Ò»»×Ü±í
function equip_chg_main(nItemIndex)
	if gf_CheckPlayerRoute() ~= 1 then
		Talk(1,"",SClew.."Ng­êi ch­a gia nhËp m«n ph¸i kh«ng thÓ ®æi ®¹o cô!")
		return
	end
	local tSay = {SClew.."H·y chän hÖ trang bÞ c¸c h¹n muèn ®æi ."}
	--Ö±½ÓÁÐ³öÀ´
	for nEuiqpSerial = 1,getn(tEquipSynthInfo) do
		for nEuipPos = 1,getn(tEquipSynthInfo[nEuiqpSerial]) do
			local bChkFlag = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
			local bChkDetailFlag = 0
			for i = 1,getn(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum) do
				local sItemName= get_item_info(nItemIndex)
				if sItemName == tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum[i][1] then
					bChkDetailFlag = 1
					break
				end
			end
			if bChkFlag == 1 and bChkDetailFlag == 1 then
				local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
				if type(tEquipInfo[1]) =="string" then
					tinsert(tSay,"Ta muèn ®æi "..tEquipInfo[1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..")")
				else
					for i = 1,getn(tEquipInfo) do
						tinsert(tSay,"Ta muèn ®æi "..tEquipInfo[i][1].."/#equip_chg_dtm("..nEuiqpSerial..","..nEuipPos..","..i..")")
					end
				end
			end
		end
	end
	if getn(tSay) == 1 then
		tSay = {SClew.."Nguyªn liÖu hoÆc tiÒn vµng kh«ng ®ñ! "}
		tinsert(tSay,"Ta muèn xem phèi ph­¬ng ghÐp trang bÞ /equip_chg_rule")
	end
	tinsert(tSay,"Tho¸t/nothing")
	SelectSay(tSay)
end
function equip_chg_dtm(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	local tSay = {}
	tSay[1] = SClew..format("§æi <color=green>%s<color> cÇn nguyªn liÖu sao:",tEquipInfo[1])
	--²ÄÁÏÅÐ¶Ï
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	if nChkFlag ~= 1 then
		equip_chg_view(sItemName)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n X¸c ®Þnh muèn ®æi?"
		if  arg[3] then
			tinsert(tSay,"X¸c ®Þnh /#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..","..nDetailSeq..")")
		else
			tinsert(tSay,"X¸c ®Þnh /#equip_chg_deal("..nEuiqpSerial..","..nEuipPos..")")
		end
		tinsert(tSay,"Tho¸t/nothing")
		SelectSay(tSay)
	end
end
--×°±¸¶Ò»»×ª»»
function equip_chg_deal(...)
	local nEuiqpSerial,nEuipPos,nDetailSeq = arg[1],arg[2],arg[3]
	local tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)
	if nDetailSeq then
		tEquipInfo = get_equip_info(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipInfo,tEquipSynthInfo[nEuiqpSerial][nEuipPos].tTableStructure)[nDetailSeq]
	end
	item_chg_main(tEquipInfo[1],tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum,{tEquipInfo[2],tEquipInfo[3],tEquipInfo[4]})
end
--²é¿´×°±¸ºÏ³ÉÅä·½
function equip_chg_rule(...)
	local tSay = {SClew.."H·y chän hÖ trang bÞ cÇn xem ."}
	for i = 1,getn(tEquipSeriesName) do
		tinsert(tSay,format("Ta muèn xem hÖ %s /#equip_series_sel(%d)",tEquipSeriesName[i],i))
	end
	tinsert(tSay,"Tho¸t/nothing")
	SelectSay(tSay)
end
--¼ÌÐø²é¿´ºÏ³ÉÅä·½
function equip_series_sel(nEuiqpSerial)
	local tSay = {SClew..format("H·y chän mãn trang bÞ cña hÖ %s.",tEquipSeriesName[nEuiqpSerial])}
	for i = 1,getn(tEquipPosName) do
		tinsert(tSay,format("Ta muèn xem %s trang bÞ %s/#equip_chg_view(%d,%d)",tEquipSeriesName[nEuiqpSerial],tEquipPosName[i],nEuiqpSerial,i))
	end
	tinsert(tSay,"Tho¸t/nothing")
	SelectSay(tSay)
end
function equip_chg_view(nEuiqpSerial,nEuipPos)
	tSay = {SClew..format("Ta muèn xem %s trang bÞ %s cÇn nguyªn liÖu sau:",tEquipSeriesName[nEuiqpSerial],tEquipPosName[nEuipPos])}
	local nChkFlag,tChkResult = metiral_take_chk(tEquipSynthInfo[nEuiqpSerial][nEuipPos].tEquipConsum)
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
	end
	tinsert(tSay,"Tho¸t/nothing")
	SelectSay(tSay)
end
--»ñÈ¡×°±¸Ãû³Æ
function get_equip_info(tEquipInfo,tTableStructure,nStructureSeq)
	if tTableStructure == nil then
		return tEquipInfo
	end
	nStructureSeq = nStructureSeq or 1
	local sStructure = tTableStructure[nStructureSeq]
	if sStructure == "Route" then
		sStructure = GetPlayerRoute()
	elseif sStructure == "Sex" then
		sStructure = GetSex()
	elseif sStructure == "Body" then
		sStructure = GetBody()
	end
	if nStructureSeq == getn(tTableStructure) then
		return tEquipInfo[sStructure]
	else
		return get_equip_info(tEquipInfo[sStructure],tTableStructure,(nStructureSeq + 1))
	end
end
--===================µÀ¾ßÉý¼¶´¦Àí
--µÀ¾ßÉý¼¶´¦Àí
function dia_metiral_chg_main(nItemIndex)
	--±³°ü¿Õ¼äÅÐ¶Ï
	if gf_Judge_Room_Weight(3, 1) ~= 1 then
		return 0;
	end
	local tSay = {SClew.."H·y chän ®¹o cô cÇn n©ng cÊp ."}
	local sMetrialName= get_item_info(nItemIndex)
	for sItemName,tIntemInfo in tItemSynthInfo do
		for i = 1,getn(tIntemInfo[1]) do
			if sMetrialName == tIntemInfo[1][i][1] and (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 )then
				tinsert(tSay,format("Ta cÇn n©ng cÊp %s/#say_metiral_chg_sel(\"%s\")",sItemName,sItemName))
			end
		end
	end
	if sMetrialName == "M¶nh Tinh NgÊn" then
		tinsert(tSay,"Ta cÇn n©ng cÊp H¹o NguyÖt HuyÒn Kim/haonguyethk")
	elseif sMetrialName == "Ngò Hµnh HuyÒn Th¹ch" then
		tinsert(tSay,"Ta cÇn n©ng cÊp Ngò Hµnh HuyÒn Kim/nguhanhhk")
	end
	
	if getn(tSay) == 1 then
		Talk(1,"",SClew.."<color=green>"..sMetrialName.."<color> t¹m thêi kh«ng thÓ n©ng cÊp!")
		return
	else
		tinsert(tSay,"Tho¸t/nothing")
		SelectSay(tSay)
	end
end
function say_metiral_chg_sel(sItemName)
	--²ÄÁÏÅÐ¶Ï
	local nChgNum = metiral_chg_num(sItemName)
	if nChgNum == 1 then
		metiral_chg_dtm(sItemName,nChgNum)
	elseif nChgNum > 1 then
		SetTaskTemp(nTaskTempId_Item_HashCode,Hash(sItemName))
		AskClientForNumber("metiral_chg_num_enter",1,nChgNum,format("§æi %s sè l­îng",sItemName))
	else
		metiral_chg_view(sItemName)
	end
end
--²ÄÁÏÊýÁ¿ÊäÈë
function metiral_chg_num_enter(nChgNum)
	if nChgNum <= 0 then return end
	local sItemName = get_hash_itemname(tItemSynthInfo)
	if sItemName == nil then
		return
	else
		metiral_chg_dtm(sItemName,nChgNum)
	end
end
--²ÄÁÏÉý¼¶È·ÈÏÕ¹¿ª
function metiral_chg_dtm(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local tSay = {}
	if nChgNum == 1 then
		tSay[1] = SClew..format("N©ng cÊp <color=green>%s<color> cÇn nguyªn liÖu sau:",sItemName)
	else
		tSay[1] = SClew..format("N©ng cÊp <color=green>%s<color>x<color=green>%d<color> cÇn nguyªn liÖu sau:",sItemName,nChgNum)
	end
	--²ÄÁÏÅÐ¶Ï
	local nChgNumChk = metiral_chg_num(sItemName)
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChgNum > nChgNumChk or nChkFlag ~= 1 then
		metiral_chg_view(sItemName,nChgNum)
	else
		for i = 1,getn(tChkResult) do
			tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		end
		tSay[1] = tSay[1].."\n X¸c ®Þnh muèn ®æi?"
		tinsert(tSay,"X¸c ®Þnh /#metiral_chg_main(\""..sItemName.."\","..nChgNum..")")
		tinsert(tSay,"Tho¸t/nothing")
		SelectSay(tSay)
	end
end
--²ÄÁÏ¶Ò»»×ª»»
function metiral_chg_main(sItemName,nChgNum)
	item_chg_main(sItemName,tItemSynthInfo[sItemName][1],tMetiralInfo[sItemName][1],nChgNum)
end
--¶Ò»»È·ÈÏ´¦Àí
function item_chg_main(sItemName,tConsumInfo,tPrizeInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag,tChkResult = metiral_take_chk(tConsumInfo,nChgNum)
	if nChkFlag ~= 1 then
		return
	else
		--±³°ü¿Õ¼äÅÐ¶Ï
		if gf_Judge_Room_Weight(3, 1) ~= 1 then
			return 0;
		end
		--ÎïÆ·É¾³ýÅÐ¶Ï
		for i = 1,getn(tConsumInfo) do
			if tConsumInfo[i][1] == " Kim " then
				if Pay(tConsumInfo[i][2]*10000*nChgNum) ~= 1 then
					return
				end
			else
				if DelItem(tMetiralInfo[tConsumInfo[i][1]][1][1],tMetiralInfo[tConsumInfo[i][1]][1][2],tMetiralInfo[tConsumInfo[i][1]][1][3],(tConsumInfo[i][2]*nChgNum)) ~= 1 then
					return
				end
			end
		end
		--ÎïÆ·Ôö¼Ó´¦Àí
		if tPrizeInfo[1] == 2 then
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum)
		else
			local bAddFlag = AddItem(tPrizeInfo[1],tPrizeInfo[2],tPrizeInfo[3],nChgNum,1,-1,-1,-1,-1,-1,-1)
		end
	end
end
--===µÀ¾ßÉý¼¶¹æÔò
function metiral_chg_rule()
	local tSay = {SClew.."H·y chän ®¹o cô cÇn xem ."}
	for sItemName,tIntemInfo in tItemSynthInfo do
		if (tReleaseForbiddenList["tMetiral"][sItemName] ~= 1 ) then
			tinsert(tSay,format("Ta muèn xem nguyªn liÖu n©ng cÊp %s /#metiral_chg_view(\"%s\")",sItemName,sItemName))
		end
	end
	tinsert(tSay,"Tho¸t/nothing")
	SelectSay(tSay)
end
--µÀ¾ßÉý¼¶·½·¨²é¿´
function metiral_chg_view(sItemName,nChgNum)
	nChgNum = nChgNum or 1
	local sItemStory = SClew.."<color=green>"..sItemName.."<color>"
	if tMetiralInfo[sItemName][2] ~= nil and tMetiralInfo[sItemName][2] ~= "" then
		sItemStory = sItemStory..tMetiralInfo[sItemName][2]..","
	end
	local tSay = {sItemStory.."Mçi nguyªn liÖu n©ng cÊp cÇn nh­ sau:"}
	--²ÄÁÏ¼ì²â
	local nChkFlag,tChkResult = metiral_take_chk(tItemSynthInfo[sItemName][1],nChgNum)
	if nChkFlag == 1 then
		tinsert(tSay,"\n Ta muèn n©ng cÊp "..sItemName.."/#say_metiral_chg_sel(\""..sItemName.."\")")
	end
	for i = 1,getn(tChkResult) do
		tSay[1] = tSay[1].."\n    "..tChkResult[i][2]
		if tItemSynthInfo[sItemName][1][i][1] ~= nil and tItemSynthInfo[tItemSynthInfo[sItemName][1][i][1]] ~= nil then
			tinsert(tSay,"Ta muèn xem "..tItemSynthInfo[sItemName][1][i][1].."Ph­¬ng ph¸p n©ng cÊp /#metiral_chg_view(\""..tItemSynthInfo[sItemName][1][i][1].."\")")
		end
	end
	tinsert(tSay,"trë l¹i/metiral_chg_rule")
	tinsert(tSay,"Tho¸t/nothing")
	SelectSay(tSay)
end
--²ÄÁÏ×ã¹»¼ì²â
function metiral_take_chk(tConsumInfo,nChgNum)
	nChgNum = nChgNum or 1
	local nChkFlag = 1
	local tChkResult = {}
	for i = 1,getn(tConsumInfo) do
		local sMertiralName = tConsumInfo[i][1]
		if sMertiralName == " Kim " then
			if floor(GetCash()/10000) < (tConsumInfo[i][2] * nChgNum) then
				nChkFlag = 0
				tinsert(tChkResult,{0,"<color=red>"..(tConsumInfo[i][2]*nChgNum)..sMertiralName.."<color>"})
			else
				tinsert(tChkResult,{1,"<color=green>"..(tConsumInfo[i][2]*nChgNum)..sMertiralName.."<color>"})
			end
		else
			if GetItemCount(tMetiralInfo[sMertiralName][1][1],tMetiralInfo[sMertiralName][1][2],tMetiralInfo[sMertiralName][1][3]) < (tConsumInfo[i][2] * nChgNum) then
				nChkFlag = 0
				tinsert(tChkResult,{0,"<color=red>"..sMertiralName.."x"..(tConsumInfo[i][2] * nChgNum).."<color>"})
			else
				tinsert(tChkResult,{1,"<color=green>"..sMertiralName.."x"..(tConsumInfo[i][2] * nChgNum).."<color>"})
			end
		end
	end
	return nChkFlag,tChkResult
end
--²ÄÁÏ¿É¶Ò»»ÊýÁ¿¼ì²â
function metiral_chg_num(sItemName)
	local nChgNum = 999999
	for i = 1,getn(tItemSynthInfo[sItemName][1]) do
		local sMertiralName = tItemSynthInfo[sItemName][1][i][1]
		if sMertiralName == " Kim " then
			nChgNum = min(nChgNum,floor((GetCash()/10000)/tItemSynthInfo[sItemName][1][i][2]))
		else
			nChgNum = min(nChgNum,floor(GetItemCount(tMetiralInfo[sMertiralName][1][1],tMetiralInfo[sMertiralName][1][2],tMetiralInfo[sMertiralName][1][3]) /tItemSynthInfo[sItemName][1][i][2]))
		end
		if nChgNum == 0 then
			break
		end
	end
	return nChgNum
end
--»ñÈ¡hashÂë¶ÔÓ¦µÄÎïÆ·Ãû
function get_hash_itemname(tItemInfo)
	local nHashCode = GetTaskTemp(nTaskTempId_Item_HashCode)
	if nHashCode == 0 then
		return
	else
		for sItemName,_ in tItemInfo do
			if Hash(sItemName) == nHashCode then
				return sItemName
			end
		end
		return
	end
end
function get_item_info(nItemIndex)
	local nItemId1,nItemId2,nItemId3 = GetItemInfoByIndex(nItemIndex)
	local sItemName = GetItemName(nItemId1,nItemId2,nItemId3)
	return sItemName,nItemId1,nItemId2,nItemId3
end
function nothing()
end

-- §æi H¹o NguyÖt HuyÒn Kim
function haonguyethk()
		AskClientForNumber("ConfirmNumHNHK", 1, 100, "H¹o NguyÖt")
end

function ConfirmNumHNHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30300) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi "..nCount.." H¹o NguyÖt HuyÒn Kim");
        return 0;
   elseif  DelItem(2,1,30300, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30301, nCount}, "H¹o NguyÖt HuyÒn Kim", "NANG CAP ITEM", "®æi h¹o nguyÖt huyÒn kim thµnh c«ng", 0, 1)
    end
end

-- §æi Ngò Hµnh HuyÒn Kim
function nguhanhhk()
		AskClientForNumber("ConfirmNumNHHK", 1, 100, "Ngò Hµnh")
end

function ConfirmNumNHHK(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    local ntotal = 100000 * nCount
   if GetItemCount(2,1,30303) < (3 * nCount ) or GetCash() < ntotal then
        Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn ®æi "..nCount.." Ngò Hµnh HuyÒn Kim");
        return 0;
   elseif  DelItem(2,1,30303, 3 * nCount) == 1 and Pay(ntotal) == 1 then 
        gf_AddItemEx2({2,1,	30304, nCount}, "Ngò Hµnh HuyÒn Kim", "NANG CAP ITEM", "®æi ngò hµnh huyÒn kim thµnh c«ng", 0, 1)
    end
    
end