Include("\\settings\\static_script\\missions\\base\\phasebase.lua");
Include("\\settings\\static_script\\missions\\base\\mission_head.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\message.lua");
Include("\\script\\missions\\taiyi\\box\\boxes.lua")

thisFile ="\\script\\missions\\taiyi\\mission.lua";

TYT_IB_ITEM = {"Thiªn Kiªu LÖnh",2, 97, 236};  --´ú±Ò

DebugOutput = nothing

TOTAL_STAGE = 6;	--¹Ø¼üstageÊýÁ¿[²ß»®Íæ·¨ÖÐµÄstageÊýÁ¿]
LEVEL_RANGE = TOTAL_STAGE + 3*3 + 3;	--µ±nStageId <= LEVEL_RANGEÊ±ÎªèóÌìÁÖ

--Difficulty Type
eDifType = {
	NORMAL = 1,
	HARD = 2,
};

eMSName = {
	FOREST = 1,
	TOWER = 2,
};

tGlbValue = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {GV_TY_FOREST_NORMAL_MAX_MAP, 30, "Ph¹n Thiªn L©m"},	--¿ª³¡¼ÆÊý£¬¿ª³¡ÉÏÏÞ
		[eDifType.HARD] = {GV_TY_FOREST_HARD_MAX_MAP, 30, "Ph¹n Thiªn L©m"},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {GV_TY_TOWER_NORMAL_MAX_MAP, 30, "Th¸i NhÊt Th¸p"},
		[eDifType.HARD] = {GV_TY_TOWER_HARD_MAX_MAP, 30, "Th¸i NhÊt Th¸p"},
	},
};

tOptions = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {
			["MemberNum"] = {1, 8},
			["MemberHaveRoute"] = 1,
			["MemberLevel"] = {90, 999},
			["PKValue"] = {0, 9},
		},
		[eDifType.HARD] = {
			["MemberNum"] = {4, 8},
			["MemberRouteNum"] = {4, 8},
			["MemberLevel"] = {90, 999},
			["MemberHaveRoute"] = 1,
			["RoomWeight"] = {1, 10},
			["PKValue"] = {0, 9},
		},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {
			["MemberNum"] = {1, 8},
			["MemberHaveRoute"] = 1,
			["MemberLevel"] = {90, 999},
			["PKValue"] = {0, 9},
		},
		[eDifType.HARD] = {
			["MemberNum"] = {4, 8},
			["MemberRouteNum"] = {4, 8},
			["MemberLevel"] = {90, 999},
			["MemberHaveRoute"] = 1,
			["RoomWeight"] = {1, 10},
			["PKValue"] = {0, 9},
		},
	},
};


--¾­Ñé±¶Êý
tExpMul = {
	[eDifType.NORMAL] = {
		[1] = 0.6,
		[2] = 0.8,
		[3] = 0.9,
		[4] = 1.0,
		[5] = 1.2,
		[6] = 1.4,
		[7] = 1.6,
		[8] = 2.0,
	},
	[eDifType.HARD] = {
		[4] = 1.0,
		[5] = 1.2,
		[6] = 1.4,
		[7] = 1.6,
		[8] = 2.0,
	},
};

tGodStates	= {
	tInfo	= {"Ch©n Thiªn ThÇn h¹ phµm", 5},
	tState	= {
		[1] = {9920, "state_life_max_percent_add",	1000,	"Sinh lùc t¨ng tèi ®a 10 lÇn"},
		[2] = {9921, "state_p_attack_percent_add",		100,	"TÊn c«ng ngo¹i c«ng +100%"},	
		[3] = {9922, "state_m_attack_percent_add",		100,	"TÊn c«ng néi c«ng +100%"},
		[4] = {9923, "state_immune",				100,	"Tr¹ng th¸i miÔn dÞch  "},
	},
}

--6¹Ø¶ÔÓ¦µÄnStageId
tMainLevelID = {
	[TOTAL_STAGE + 1*3 + 2] = 1,
	[TOTAL_STAGE + 2*3 + 2] = 2,
	[TOTAL_STAGE + 3*3 + 2] = 3,
	[TOTAL_STAGE + 4*3 + 2] = 4,
	[TOTAL_STAGE + 5*3 + 2] = 5,
	[TOTAL_STAGE + 6*3 + 2] = 6,
};

tTY = {
	name ="Th¸i NhÊt Th¸p",
	missionID = 66,
	realMapID = 6075,
	dynamicMap = 1,
	
	----------------------
	mv_01 = 1,	--1:èóÌìÁÖ 2:Ì«Ò»Ëþ
	mv_02 = 2,	--1:ÆÕÍ¨°æ 2:Ó¢ÐÛ°æ
	mv_03 = 3,	--1:×÷±×Ä£Ê½ 0:·Ç×÷±×
	mv_04 = 4,	--·­ÅÆÇ°µÄ¶Ó³¤Ë÷Òý
	
	mv_20 = 20,	--µ±Ç°ÊÇÄÄ¶Î¶Ô»°
	mv_21 = 21,	--µ±Ç°¶Î¶Ô»°µÄµÚ¼¸¾ä
	mv_22 = 22,
	mv_23 = 23,
	mv_24 = 24,
	mv_25 = 25,
	mv_26 = 26,
	mv_27 = 27,
	mv_28 = 28,
	mv_29 = 29,
	mv_30 = 30,
	mv_31 = 31,
	mv_32 = 32,
	mv_33 = 33,
	mv_34 = 34,
	mv_35 = 35,		--¼ÇÂ¼Ë­¿ªµÄÏä×Ó
	mv_36 = 36,		--¼ÇÂ¼½±Àøloot
	----------------------
	ms20 = 20,
};

tTY = gf_CopyInherit(missionHead, tTY);

tTY_msOption = {
	bSetPkFlag = 0, --Á·¹¦Ä£Ê½
	bSetPkCamp = 0,
	szInitDeahScript = thisFile,
}

--µØÍ¼ÉÏÒÑ¾­´´½¨³öµÄNPC»º´æ
tExistNpcList = {
--	[nMapIdx] = {
--		{szName, nNpcIdx},
--	},
};

--Ê±¼äÇý¶¯Æ÷
tPhaseDriver = {
	timerID = 96,
	maxsecond = 120*60,
};
tPhaseDriver = gf_CopyInherit(phaseBase, tPhaseDriver);

tNpcs = {
	mgy_1 = {"TYT_XianfengMGY","Méc QuÕ Anh", thisFile, CampPlayer},
	mgy_2 = {"TYT_TaiyiBSMGY","Méc QuÕ Anh", thisFile, CampPlayer},
	mgy_3 = {"TYT_HtaiyiMGY","Méc QuÕ Anh", thisFile, CampEnemy},
	mgy_3_1 = {"TYT_NtaiyiMGY", "Méc QuÕ Anh", thisFile, CampEnemy},
	
	yzb_1 = {"TYT_XianfengYZB","D­¬ng T«n B¶o", thisFile, CampPlayer},
	yzb_2 = {"TYT_TaiyiBSYZB","D­¬ng T«n B¶o", thisFile, CampPlayer},
	yzb_3 = {"TYT_HtaiyiYZB","D­¬ng T«n B¶o", thisFile, CampEnemy},
	yzb_3_1 = {"TYT_NtaiyiYZB", "D­¬ng T«n B¶o", thisFile, CampEnemy},
	xy = {"TYT_HyuxiuluoXY","Ngäc Tu La Tiªu DÞch", thisFile, CampEnemy},
	xy_1 = {"TYT_NyuxiuluoXY","Ngäc Tu La Tiªu DÞch", thisFile, CampEnemy},
	xlsy = {"TYT_HXYsuiying","Tu La To¸i ¶nh", thisFile, CampEnemy},
	xlsy_1 = {"TYT_NXYsuiying","Tu La To¸i ¶nh", thisFile, CampEnemy},
	jltys1 = {"TYT_HjingleiTYS","Cöu Long Th«n V©n Thó", thisFile, CampEnemy},
	jltys1_1 = {"TYT_NjingleiTYS","Cöu Long Th«n V©n Thó", thisFile, CampEnemy},
	jltys2 = {"TYT_HyehuoTYS","Cöu Long Th«n V©n Thó", thisFile, CampEnemy},
	jltys2_1 = {"TYT_NyehuoTYS","Cöu Long Th«n V©n Thó", thisFile, CampEnemy},
	bx = {"TYT_HBixie","ThÇn Thó TÞch Tµ", thisFile, CampEnemy},
	bx_1 = {"TYT_NBixie","ThÇn Thó TÞch Tµ", thisFile, CampEnemy},
	hhlj = {"TYT_HHHLJ","Hoang Háa L­u Kim", thisFile, CampEnemy},
	hhlj_1 = {"TYT_NHHLJ","Hoang Háa L­u Kim", thisFile, CampEnemy},
	ljfb = {"TYT_LJFB","L­u Kin Phong B¹o", thisFile, CampEnemy},
	ljfb_1 = {"TYT_LJFB","L­u Kin Phong B¹o", thisFile, CampEnemy},
	ylfh = {"TYT_HYLFH","Gia LuËt Phi Hång", thisFile, CampEnemy},
	ylfh_1 = {"TYT_NYLFH","Gia LuËt Phi Hång", thisFile, CampEnemy},
	jjg = {"TYT_Jingjing","Thanh Thanh C« N­¬ng", "\\script\\missions\\taiyi\\jjg_npc.lua", CampPlayer},
	tbjh = {"TYT_HSongsoul", "Thiªn Ba Tinh Ph¸ch", thisFile, CampEnemy},
	tbjh_1 = {"TYT_NSongsoul", "Thiªn Ba Tinh Ph¸ch", thisFile, CampEnemy},
	dsyh = {"TYT_HSongsoul", "§¹i Tèng Anh Hån", thisFile, CampEnemy},
	dsyh_1 = {"TYT_NSongsoul", "§¹i Tèng Anh Hån", thisFile, CampEnemy},
	yy = {"D­¬ng NghiÖp", "D­¬ng NghiÖp", thisFile, CampPlayer},
};

tNpcPos = {
	--ÄÂ¹ðÓ¢
	mgy = {
		[0] = {{1321, 2836},},	--èóÌìÁÖ×¼±¸Çø
		[1] = {{1453, 2908}, {1463, 2856}},	--µÚÒ»¹Ø ¿ªÊ¼Î»ÖÃ£¬½áÊøÎ»ÖÃ
		[2] = {{1611, 2915}, {1636, 2858}},
		[3] = {{1638, 3189}, {1639, 3187}},
		[4] = {{1212, 3491},},	--Ì«Ò»Ëþ×¼±¸Çø
		[5] = {{1224, 3472}, {1249, 3439}},
		[6] = {{1443, 3529}, {1443, 3466}},
		[7] = {{1649, 3495}, {1661, 3478}}, 
	},
	yzb = {
		[0] = {{1325, 2834},},
		[1] = {{1446, 2904}, {1469, 2861}},
		[2] = {{1618, 2919}, {1642, 2857}},
		[3] = {{1632, 3183}, {1634, 3182}},
		[4] = {{1208, 3505},},	--Ì«Ò»Ëþ×¼±¸Çø
		[5] = {{1229, 3478}, {1254, 3445}},
		[6] = {{1454, 3529}, {1456, 3468}},
		[7] = {{1654, 3502}, {1671, 3487}},
	},
	jjg = {
		[0] = {{1416, 3120},},
	},
	--ÏôÞÈ
	xy = {
		[1] = {{1456, 2880},},
	},
	xlsy = {
		[1] = {{1456, 2880},},
	},
	jltys1 = {
		[2] = {{1627, 2891},},
	},
	mm = {
		[3] = {
			{1591, 3187},{1597, 3192},{1593, 3198},{1597, 3199},
			{1598, 3207},{1602, 3205},{1605, 3202},{1609, 3205},
			{1607, 3206},{1601, 3212},{1601, 3219},{1604, 3219},
			{1607, 3215},{1609, 3213},{1612, 3209},{1616, 3208},
			{1617, 3212},{1614, 3216},{1612, 3218},{1615, 3226},
			{1618, 3231},{1621, 3226},{1622, 3223},{1625, 3221},
			{1628, 3224},{1628, 3229},{1626, 3237},{1632, 3236},
			{1637, 3235},{1639, 3240},{1642, 3238},{1635, 3236},
		},
	},
	bx = {
		[5] = {
			{1241, 3461},
		},
	},
	mashroom = {
		[5] = {
			{1245, 3495},{1237, 3422},{1280, 3465},{1209, 3460}, 
			{1211, 3492},{1259, 3440},{1261, 3487},{1213, 3444},
		},
	},
	hhlj = {
		[6] = {
			{1451, 3495},
		},
	},
	ylfh = {
		[7] = {
			{1663, 3487}, {1658, 3493},
		},
	},
	yy = {
		[7] = {
			{1675, 3468},
		},
	},
	tbjh = {
		[7] = {
			{1628, 3476}, {1605, 3497}, {1614, 3518}, {1627, 3531},
			{1650, 3544}, {1670, 3526}, {1687, 3510},
		},
	},
};

tMovePos = {
	mgy = {
		[1] = {{{1456, 2880}}},
	},
};

tExitPos = {
	[100] = {1440, 2800},
	[200] = {1383, 3069},
	[300] = {1805, 3362},
	[350] = {1407, 2860},
};

--Íæ¼Ò´³¹ØÊ§°ÜÎ»ÖÃ
tFailedPos = {
	{},
};

--Íæ¼Ò´³¹Ø³É¹¦Ë¢ÐÂÎ»ÖÃ
tResetPos = {
	[1] = {1456, 2880},
};

tDeathPos = {1420, 3137};

tPlayerPos = {
	[0] = {{1320, 2853}, },
	[1] = {{1452, 2909}, {1460, 2864}},
	[2] = {{1617, 2915}, {1640, 2871}},
	[3] = {{1629, 3191}, {1630, 3192}},
	[4] = {{1212, 3491}, {1248, 3450}},
	[5] = {{1449, 3538}, {1449, 3473}},
	[6] = {{1645, 3506}, {1663, 3487}},
};

tList = {
	[2 ] = "ThiÕu L©m tôc gia",
	[3 ] = "ThiÕu L©m thiÒn t¨ng",
	[4 ] = "ThiÕu L©m vâ t¨ng",
	[6 ] = "§­êng M«n",
	[8 ] = "Nga My PhËt gia",
	[9 ] = "Nga My tôc gia",
	[11] = "C¸i Bang TÜnh y",
	[12] = "C¸i Bang ¤ Y",
	[14] = "Vâ §ang ®¹o gia",
	[15] = "Vâ §ang tôc gia",
	[17] = "D­¬ng M«n th­¬ng Kþ",
	[18] = "D­¬ng M«n Cung Kþ",
	[20] = "HiÖp §éc",
	[21] = "Tµ §éc",
	[23] = "C«n L«n Thiªn S­",
	--[25] = "Ã÷½ÌÊ¥Õ½",
	--[26] = "Ã÷½ÌÕó±ø",
	--[27] = "Ã÷½ÌÑªÈË",
	[29] = "Thóy Yªn Vò Tiªn",
	[30] = "Thóy Yªn Linh N÷",
	--[31] = "ÌÆÃÅÈÎÏÀ",
	--[32] = "À¥ÂØ½£×ð",
};

tRouteList = {
	[2] = {0, {260, 260},},
	[3] = {1, {0  , 200},},
	[4] = {1, {170,	170},},
	[6] = {0, {210, 210},},
	[8] = {1, {260,	260},},
	[9] = {1, {260, 260},},
	[11] ={0, {195,	195},},
	[12] ={0, {260, 260},},
	[14] ={1, {0  ,	0  },},
	[15] ={0, {230, 230},},
	[17] ={0, {195,	195},},
	[18] ={0, {110, 110},},
	[20] ={1, {390,	390},},
	[21] ={1, {260, 260},},
	[23] ={1, {0  ,	0  },},
	--[25] ={0, {130, 130},},
	--[26] ={0, {195,	195},},
	--[27] ={1, {130, 130},},
	[29] ={0, {0  ,	0  },},
	[30] ={0, {110, 110},},
	--[31] ={0, {100, 100},},
	--[32] ={0, {100, 100},},
};

--Á÷ÅÉ¸öÊý¼Ó³É
TYT_EXP_ROUTE_COUNT_ADD = {
	[0] = 0,
	[1] = 0,
	[2] = 0,
	[3] = 0,
	[4] = 0,
	[5] = 0.2,
	[6] = 0.4,
	[7] = 0.6,
	[8] = 1,	
}

--¹ý¹Ø¾­Ñé±í
TYT_EXP_AWARD = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {
			[1] = 2000000,
			[2] = 2200000,
			[3] = 3000000,
		},
		[eDifType.HARD] 	= {
			[1] = 4000000,
			[2] = 6000000,
			[3] = 7000000,
		},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {
			[1] = 3300000,
			[2] = 3600000,
			[3] = 4000000,
		},
		[eDifType.HARD] 	= {
			[1] = 7000000,
			[2] = 8000000,
			[3] = 9000000,
		},
	},
}

--¹ý¹ØµôÏä×Ó
TYT_DROP_BOX_AWARD = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {
			[1] = {
				{"tongbaoxiang", "R­¬ng §ång", 1, "\\script\\missions\\taiyi\\box\\tong_box_1.lua"},
				{"yinbaoxiang", "R­¬ng B¹c", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
			},
			[2] = {
				{"tongbaoxiang", "R­¬ng §ång", 1, "\\script\\missions\\taiyi\\box\\tong_box_2.lua"},
				{"yinbaoxiang", "R­¬ng B¹c", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
			},
			[3] = {
				{"jinbaoxiang", "Kim R­¬ng", 1, "\\script\\missions\\taiyi\\box\\jin_box_1.lua"},
			},
		},
		[eDifType.HARD] 	= {
			[1] = {
				{1, 1}, --box_id,num
				{11, 4},
				},
			[2] = {
				{2, 1},
				{11, 4},
				},
			[3] = {
				{21, 1},
				},
		},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {
			[1] = {
				{"tongbaoxiang", "R­¬ng §ång", 1, "\\script\\missions\\taiyi\\box\\tong_box_3.lua"},
				{"yinbaoxiang", "R­¬ng B¹c", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
			},
			[2] = {
				{"tongbaoxiang", "R­¬ng §ång", 1, "\\script\\missions\\taiyi\\box\\tong_box_3.lua"},
				{"yinbaoxiang", "R­¬ng B¹c", 4, "\\script\\missions\\taiyi\\box\\yin_box_1.lua"},
			},
			[3] = {
				{"jinbaoxiang", "Kim R­¬ng", 1, "\\script\\missions\\taiyi\\box\\jin_box_2.lua"},
			},
		},
		[eDifType.HARD] 	= {
			[1] = {
				{3, 1},
				{11, 4},
				},
			[2] = {
				{3, 1},
				{11, 4},
				},
			[3] = {
				{22, 1},
				},
		},
	},
}

TYT_PRICE = {
	[1] = {	--èóÌìÁÖ
		[1] = {		--Ãâ·Ñ·­ÅÆ
			[1] = {	--NORMAL
				{"C©y B¸t Nh· nhá"			,{2,0,504,1,4},5000, 0, 7},
				{"C©y B¸t Nh·"				,{2,0,398,1,4},4000, 0, 7},
				{"C©y Tø Linh"					,{2,1,30269,1,4},5000, 0, 7},
				{"TruyÒn C«ng §¬n"					,{2,1,30313,1,4},5000, 0, 7},
				{"Tu Ch©n YÕu QuyÕt"				,{2,0,554,1,4},5000, 0, 7},
				{"Thiªn Lý TruyÒn ¢m Phï ChØ"		,{2,1,3508,1,4},3000},
				{"Tø Linh Quy Nguyªn §¬n"			,{2,1,30352,1,4},4000, 0, 7},
				{"Båi Nguyªn §¬n"					,{2,1,30351,1,4},4000, 0, 7},
				{"B¨ng Tinh Th¹ch"					,{2,1,30554,1,4},4000},
				{"B¹ch C©u Hoµn"					,{2,1,270,1,4},4000, 0, 7},
				{"TÈy T©m Th¹ch Kho¸ng"				,{2,1,30536,1},3000},
				{"LuyÖn L« ThiÕt Kho¸ng"				,{2,1,30537,1},3000},
				{"Vá G­¬m Cò"			,{2,1,30694,1,4},4000},
				{"ThiÕt Tinh cÊp 1"				,{2,1,30533,1,4},4000},
				{"ThiÕt Tinh cÊp 2"				,{2,1,30534,1,4},4000},
				{"ThiÕt Tinh cÊp 3"				,{2,1,30535,1,4},3000},
				{"Viªm Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da §Þa Long"					,{2,1,30673,1},10000},
				{"Nhãm ®Çu Linh §å (NgÉu nhiªn)"		,{gf_RandLingTu, 1, 0},2000},
				{"Nhãm ¸o Linh §å (NgÉu nhiªn)"		,{gf_RandLingTu, 2, 0},2000},
				{"Nhãm quÇn Linh §å (NgÉu nhiªn)"		,{gf_RandLingTu, 3, 0},2000},
			},
			[2] = {	--HARD
			},
		},
		[2] = {		--¸¶·Ñ·­ÅÆ
			[1] = {	--NORMAL
				{"C©y B¸t Nh· nhá"			,{2,0,504,1},5000, 0, 7},
				{"C©y B¸t Nh·"				,{2,0,398,1},5000, 0, 7},
				{"C©y Tø Linh"					,{2,1,30269,1},5000, 0, 7},
				{"B¹ch C©u Hoµn"					,{2,1,270,1},8000, 0, 7},
				{"§¹i B¹ch C©u hoµn"				,{2,1,1007,1},6000, 0, 7},
				{"B¹ch C©u Tiªn ®¬n"				,{2,1,1008,1},5000, 0, 7},
				{"§¹i Nh©n s©m"				,{2,0,553,1},5000, 0, 7},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,1,4},20000},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,2,4},7000},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,4,4},800},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,10,4},200},
				{"Th¸i NhÊt LÖnh"					,{2,1,30687,1,4},0, 1},
				{"Th¸i NhÊt LÖnh"					,{2,1,30687,2,4},0, 1},
				{"Th¸i NhÊt LÖnh"					,{2,1,30687,4,4},0, 1},
				{"Viªm Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da §Þa Long"					,{2,1,30673,1},10000},
				{"Nhãm ®Çu Linh §å (ChØ ®Þnh)"		,{gf_RandLingTu, 1, 1},1000},
				{"Nhãm ¸o Linh §å (ChØ ®Þnh)"		,{gf_RandLingTu, 2, 1},1000},
				{"Nhãm quÇn Linh §å (ChØ ®Þnh)"		,{gf_RandLingTu, 3, 1},1000},
			},
			[2] = {	--HARD
			},
		},
	},
	[2] = {	--Ì«Ò»Ëþ
		[1] = {		--Ãâ·Ñ·­ÅÆ
			[1] = {	--NORMAL
				{"C©y B¸t Nh· nhá"			,{2,0,504,1,4},5000, 0, 7},
				{"C©y B¸t Nh·"				,{2,0,398,1,4},4000, 0, 7},
				{"C©y Tø Linh"					,{2,1,30269,1,4},5000, 0, 7},
				{"TruyÒn C«ng §¬n"					,{2,1,30313,1,4},5000, 0, 7},
				{"Tu Ch©n YÕu QuyÕt"				,{2,0,554,1,4},5000, 0, 7},
				{"Thiªn Lý TruyÒn ¢m Phï ChØ"		,{2,1,3508,1,4},3000},
				{"Tø Linh Quy Nguyªn §¬n"			,{2,1,30352,1,4},4000, 0, 7},
				{"Båi Nguyªn §¬n"					,{2,1,30351,1,4},4000, 0, 7},
				{"B¨ng Tinh Th¹ch"					,{2,1,30554,1,4},4000},
				{"B¹ch C©u Hoµn"					,{2,1,270,1,4},4000, 0, 7},
				{"TÈy T©m Th¹ch Kho¸ng"				,{2,1,30536,1},3000},
				{"LuyÖn L« ThiÕt Kho¸ng"				,{2,1,30537,1},3000},
				{"Vá G­¬m Cò"			,{2,1,30694,1,4},4000},
				{"ThiÕt Tinh cÊp 1"				,{2,1,30533,1,4},4000},
				{"ThiÕt Tinh cÊp 2"				,{2,1,30534,1,4},4000},
				{"ThiÕt Tinh cÊp 3"				,{2,1,30535,1,4},3000},
				{"Viªm Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da §Þa Long"					,{2,1,30673,1},10000},
				{"Nhãm ®Çu Linh §å (NgÉu nhiªn)"		,{gf_RandLingTu, 1, 0},2000},
				{"Nhãm ¸o Linh §å (NgÉu nhiªn)"		,{gf_RandLingTu, 2, 0},2000},
				{"Nhãm quÇn Linh §å (NgÉu nhiªn)"		,{gf_RandLingTu, 3, 0},2000},
			},
			[2] = {	--HARD
			},
		},
		[2] = {		--¸¶·Ñ·­ÅÆ
			[1] = {	--NORMAL
				{"C©y B¸t Nh· nhá"			,{2,0,504,1},5000, 0, 7},
				{"C©y B¸t Nh·"				,{2,0,398,1},5000, 0, 7},
				{"C©y Tø Linh"					,{2,1,30269,1},5000, 0, 7},
				{"B¹ch C©u Hoµn"					,{2,1,270,1},8000, 0, 7},
				{"§¹i B¹ch C©u hoµn"				,{2,1,1007,1},6000, 0, 7},
				{"B¹ch C©u Tiªn ®¬n"				,{2,1,1008,1},5000, 0, 7},
				{"§¹i Nh©n s©m"				,{2,0,553,1},5000, 0, 7},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,1,4},20000},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,2,4},7000},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,4,4},800},
				{"Hu©n ch­¬ng anh hïng"				,{2,1,30499,10,4},200},
				{"Th¸i NhÊt LÖnh"					,{2,1,30687,1,4},0, 1},
				{"Th¸i NhÊt LÖnh"					,{2,1,30687,2,4},0, 1},
				{"Th¸i NhÊt LÖnh"					,{2,1,30687,4,4},0, 1},
				{"Viªm Linh Ti"					,{2,1,30671,1},10000},
				{"Da Ma Lang"					,{2,1,30672,1},10000},
				{"Da §Þa Long"					,{2,1,30673,1},10000},
				{"Nhãm ®Çu Linh §å (ChØ ®Þnh)"		,{gf_RandLingTu, 1, 1},1000},
				{"Nhãm ¸o Linh §å (ChØ ®Þnh)"		,{gf_RandLingTu, 2, 1},1000},
				{"Nhãm quÇn Linh §å (ChØ ®Þnh)"		,{gf_RandLingTu, 3, 1},1000},
			},
			[2] = {	--HARD
			},
		},
	},
};


tTaskID = {
	["ConsumeTaskID"] = {
		[eMSName.FOREST] = TASKID_TAIYI_FOREST_CONSUME,
		[eMSName.TOWER] = TASKID_TAIYI_TOWER_CONSUME,
	},
	["JoinInTime"] = {
		[eMSName.FOREST] = TASKID_TAIYI_FOREST_JOIN_IN_TIME,
		[eMSName.TOWER] = TASKID_TAIYI_TOWER_JOIN_IN_TIME,
	},
};

tFriendNpcPos = {
	[1] = {{1448, 2904}, {1448, 2895}, {1459, 2901}, {1459, 2907}, {1450, 2888}, {1457, 2888}, {1447, 2885}},
	[2] = {{1617, 2904}, {1612, 2898}, {1620, 2910}, {1621, 2912}, {1615, 2906}, {1611, 2920}, {1621, 2908}},
	[3] = {{1640, 3209}, {1637, 3194}, {1632, 3187}, {1627, 3190}, {1621, 3191}, {1627, 3195}, {1631, 3188}},
	[4] = {{1231, 3483}, {1227, 3475}, {1218, 3479}, {1225, 3479}, {1236, 3479}, {1227, 3478}, {1223, 3461}},
	[5] = {{1447, 3537}, {1442, 3534}, {1450, 3531}, {1455, 3534}, {1453, 3522}, {1448, 3525}, {1444, 3521}},
	[6] = {{1645, 3506}, {1641, 3500}, {1648, 3506}, {1643, 3506}, {1638, 3501}, {1645, 3508}, {1652, 3508}},
};

tFriendNpcList = {
	{"ThiÕu L©m Vâ T¨ng Thñ Täa", "ThiÕu L©m Vâ T¨ng Thñ Täa"},
	{"ThiÕu L©m ThiÒn T¨ng Thñ Täa", "ThiÕu L©m ThiÒn T¨ng Thñ Täa"},
	{"ThiÕu L©m Tôc Gia Thñ Täa", "ThiÕu L©m Tôc Gia Thñ Täa"},
	{"Vâ §ang §¹o Gia Thñ Täa", "Vâ §ang §¹o Gia Thñ Täa"},
	{"Vâ §ang Tôc Gia Thñ Täa", "Vâ §ang Tôc Gia Thñ Täa"},
	{"§­êng M«n Thñ Täa", "§­êng M«n Thñ Täa"},
	{"C¸i Bang TÞnh Y Thñ Täa", "C¸i Bang TÞnh Y Thñ Täa"},
	{"C¸i Bang ¤ Y Thñ Täa", "C¸i Bang ¤ Y Thñ Täa"},
	{"Nga My Tôc Gia Thñ Täa", "Nga My Tôc Gia Thñ Täa"},
	{"Ngò §éc Cæ S­ Thñ Täa", "Ngò §éc Cæ S­ Thñ Täa"},
	{"Minh Gi¸o HuyÕt Nh©n Thñ Täa", "Minh Gi¸o HuyÕt Nh©n Thñ Täa"},
	{"Minh Gi¸o TrËn Binh Thñ Täa", "Minh Gi¸o TrËn Binh Thñ Täa"},
	{"Minh Gi¸o Th¸nh ChiÕn Thñ Täa", "Minh Gi¸o Th¸nh ChiÕn Thñ Täa"},
	{"C«n L«n Thiªn S­ Thñ Täa", "C«n L«n Thiªn S­ Thñ Täa"},
	{"Thóy Yªn Vò Tiªn Thñ Täa", "Thóy Yªn Vò Tiªn Thñ Täa"},
};

--½øÈë¹Ø¿¨´ÎÊýÏÞÖÆ
TYT_JOIN_TIMES_FOREST_NOMARL	= 99999
TYT_JOIN_TIMES_FOREST_HARD		=	99999
TYT_JOIN_TIMES_TOWER_NOMARL		= 99999
TYT_JOIN_TIMES_TOWER_HARD			= 99999	

--½øÈë¹Ø¿¨ÐèÒªÏûºÄµÄ¾«Á¦
TYT_JOIN_COST_JINGLI = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = 20,
		[eDifType.HARD] 	= 40,
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = 100000,
		[eDifType.HARD] 	= 100000,
	},
};

--Ì«Ò»Ëþ½øÈëÒªÏûºÄµÄµÀ¾ß(ÊÕ·ÑÄ£Ê½)
TYT_JOIN_COST_ITEM = {
	[eMSName.FOREST] = {
		[eDifType.NORMAL] = {{2, 97, 236, 4},"Thiªn Kiªu LÖnh"},
		[eDifType.HARD] 	= {{2, 97, 236, 8},"Thiªn Kiªu LÖnh"},
	},
	[eMSName.TOWER] = {
		[eDifType.NORMAL] = {{2, 97, 236, 10000},"Thiªn Kiªu LÖnh"},
		[eDifType.HARD] 	= {{2, 97, 236, 10000},"Thiªn Kiªu LÖnh"},
	},	
}