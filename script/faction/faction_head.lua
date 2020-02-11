--½Å±¾¹¦ÄÜ£ºÊ¦ÃÅÏà¹ØÐÅÏ¢ÕûÀí
--¹¦ÄÜ¿ª·¢£º´å³¤
--¿ª·¢Ê±¼ä£º2011-4-2
--ÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\lib\\globalfunctions.lua")
--ÃÅÅÉID
NFACTIONID_SL = 1
NFACTIONID_WD = 2
NFACTIONID_EM = 3
NFACTIONID_GB = 4
NFACTIONID_TM = 5
NFACTIONID_YM = 6
NFACTIONID_WDU = 7
NFACTIONID_KL = 8
NFACTIONID_MJ = 9
NFACTIONID_CY = 10
--Á÷ÅÉID
NROUTEID_SL = 1
NROUTEID_SLSJ = 2
NROUTEID_SLCS = 3
NROUTEID_SLWS = 4
NROUTEID_TM = 5
NROUTEID_TMRL = 6
NROUTEID_EM = 7
NROUTEID_EMFJ = 8
NROUTEID_EMSJ = 9
NROUTEID_GB = 10
NROUTEID_GBJY = 11
NROUTEID_GBWY = 12
NROUTEID_WD = 13
NROUTEID_WDDJ = 14
NROUTEID_WDSJ = 15
NROUTEID_YM = 16
NROUTEID_YMQQ = 17
NROUTEID_YMGQ = 18
NROUTEID_WDU = 19
NROUTEID_WDUXX = 20
NROUTEID_WDUGS = 21
NROUTEID_KL = 22
NROUTEID_KLTS = 23
NROUTEID_MJ = 24
NROUTEID_MJSZ = 25
NROUTEID_MJZB = 26
NROUTEID_MJXR = 27
NROUTEID_CY = 28
NROUTEID_CYWX = 29
NROUTEID_CYLN = 30
	--ÐÂÁ÷ÅÉÔÝÎ´Ìí¼Ó
NROUTEID_KL = 22
NROUTEID_MJ = 24
NROUTEID_CY = 28
--ÐÔ±ð¶ÔÓ¦³Æºô
TPLAYER_SEX_NAME = {"Huynh ®Ö","C« n­¬ng"}

--ÃÅÅÉÐÅÏ¢×Ü±í
TFACTION_INFO = {
	[NFACTIONID_SL] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "ThiÕu L©m",
		--ÉÌµêÐÅÏ¢
		tShopId = {44,66,67,68},
	},
	[NFACTIONID_WD] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "Vâ §ang",
		--ÉÌµêÐÅÏ¢
		tShopId = {46,78,79,80},
	},
	[NFACTIONID_EM] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "Nga My",
		--ÉÌµêÐÅÏ¢
		tShopId = {45,72,73,74},
	},
	[NFACTIONID_GB] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "C¸i Bang",
		--ÉÌµêÐÅÏ¢
		tShopId = {47,75,76,77},
	},
	[NFACTIONID_TM] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "§­êng M«n",
		--ÉÌµêÐÅÏ¢
		tShopId = {48,69,70,71},
	},
	[NFACTIONID_YM] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "D­¬ng M«n",
		--ÉÌµêÐÅÏ¢
		tShopId = {51,81,82,83},
	},
	[NFACTIONID_WDU] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "Ngò §éc",
		--ÉÌµêÐÅÏ¢
		tShopId = {55,84,85,86},
	},
	--Ò»ÏÂÔÝÎ´¿ª·Å
	[NFACTIONID_CY] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "Thóy Yªn",
		--ÉÌµêÐÅÏ¢
		tShopId = {120,121,122,123},
	},
	[NFACTIONID_KL] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "C«n L«n",
		--ÉÌµêÐÅÏ¢
		tShopId = {112,113,114,115},
	},
	[NFACTIONID_MJ] = {
		--ÃÅÅÉÃû³Æ
		sFactionName = "Minh gi¸o",
		--ÉÌµêÐÅÏ¢
		tShopId = {116,117,118,119},
	}
}
--ÈëÃÅÅÉÎ´ÈëÁ÷ÅÉ¶ÔÓ¦Á÷ÅÉ
TFACTION_ROUTE = {
	[NFACTIONID_SL]= NROUTEID_SL,
	[NFACTIONID_WD]= NROUTEID_WD,
	[NFACTIONID_EM]= NROUTEID_EM,
	[NFACTIONID_GB]= NROUTEID_GB,
	[NFACTIONID_TM]= NROUTEID_TM,
	[NFACTIONID_YM]= NROUTEID_YM,
	[NFACTIONID_WDU]= NROUTEID_WDU,
	[NFACTIONID_KL]= NROUTEID_KL,
	[NFACTIONID_MJ]= NROUTEID_MJ,
	[NFACTIONID_CY]= NROUTEID_CY,
}
--==========Ê¦ÃÅ×°±¸Ïà¹Ø
TFACTION_EQUIP_INFO = {
	--Ê¦ÃÅµÚÒ»Ì×
	[40] = {
		--ÉÙÁÖ
		[NROUTEID_SL] = {},
		--ÉÙÁÖË×¼Ò
		[NROUTEID_SLSJ] = {
			{
				{"Hµnh Gi¶ m·o",0,103,201},
				{"Hµnh Gi¶ phôc",0,100,201},
				{"Hµnh Gi¶ trang",0,101,201},
				{"Hµnh Gi¶ Giíi ®ao",0,3,201},
				{"Hµnh Gi¶ Giíi c«n",0,5,201},
			},
			{
				{"Hµnh Gi¶ m·o",0,103,202},
				{"Hµnh Gi¶ phôc",0,100,202},
				{"Hµnh Gi¶ trang",0,101,202},
				{"Hµnh Gi¶ Giíi ®ao",0,3,202},
				{"Hµnh Gi¶ Giíi c«n",0,5,202},
			},
		},
		--ÉÙÁÖìøÉ®
		[NROUTEID_SLCS] = {
			{
				{"Khæ Hµnh m·o",0,103,301},
				{"Khæ Hµnh bµo",0,100,301},
				{"Khæ Hµnh phôc",0,101,301},
				{"Khæ Hµnh Tr­îng",0,8,301},
			},
			{
				{"Khæ Hµnh m·o",0,103,302},
				{"Khæ Hµnh bµo",0,100,302},
				{"Khæ Hµnh phôc",0,101,302},
				{"Khæ Hµnh Tr­îng",0,8,302},
			},
		},
		--ÉÙÁÖÎäÉ®
		[NROUTEID_SLWS] = {
			{
				{"Sa Di m·o",0,103,401},
				{"Sa Di Phôc",0,100,401},
				{"Sa Di phôc",0,101,401},
				{"Sa Di Hé UyÓn",0,0,401},
			},
			{
				{"Sa Di m·o",0,103,402},
				{"Sa Di Phôc",0,100,402},
				{"Sa Di phôc",0,101,402},
				{"Sa Di Hé UyÓn",0,0,402},
			},
		},
		--ÌÆÃÅ
		[NROUTEID_TM] = {},
		--ÌÆÃÅ
		[NROUTEID_TMRL] = {
			{
				{"Trang Kh¸ch m·o",0,103,601},
				{"Trang kh¸ch phôc",0,100,601},
				{"Trang Kh¸ch phôc",0,101,601},
				{"Trang Kh¸ch Phi §ao",0,1,601},
			},
			{
				{"Trang Kh¸ch m·o",0,103,602},
				{"Trang kh¸ch phôc",0,100,602},
				{"Trang Kh¸ch phôc",0,101,602},
				{"Trang Kh¸ch Phi §ao",0,1,602},
			},
			{
				{"Trang Kh¸ch m·o",0,103,603},
				{"Trang kh¸ch phôc",0,100,603},
				{"Trang Kh¸ch phôc",0,101,603},
				{"Trang Kh¸ch Phi §ao",0,1,603},
			},
			{
				{"Trang Kh¸ch m·o",0,103,604},
				{"Trang kh¸ch phôc",0,100,604},
				{"Trang Kh¸ch phôc",0,101,604},
				{"Trang Kh¸ch Phi §ao",0,1,604},
			},
		},
		---¶ëáÒ
		[NROUTEID_EM] = {},
		--¶ëáÒ·ð¼Ò
		[NROUTEID_EMFJ] = {	{},{},
			{
				{"Thanh T©m",0,103,801},
				{"Thanh T©m tè y",0,100,801},
				{"Thanh T©m tó trang",0,101,801},
				{"Thanh T©m Tè KiÕm",0,2,801},
			},
			{
				{"Thanh T©m",0,103,802},
				{"Thanh T©m tè y",0,100,802},
				{"Thanh T©m tó trang",0,101,802},
				{"Thanh T©m Tè KiÕm",0,2,802},
			},
		},
		--¶ëáÒË×¼Ò
		[NROUTEID_EMSJ] = {	{},{},
			{
				{"T­ Khóc",0,103,901},
				{"T­ Khóc tè y",0,100,901},
				{"T­ Khóc phôc",0,101,901},
				{"T­ Khóc Tè CÇm",0,10,901},
			},
			{
				{"T­ Khóc",0,103,902},
				{"T­ Khóc tè y",0,100,902},
				{"T­ Khóc phôc",0,101,902},
				{"T­ Khóc Tè CÇm",0,10,902},
			},
		},
		--Ø¤°ï
		[NROUTEID_GB] = {},
		--Ø¤°ï¾»ÒÂ
		[NROUTEID_GBJY] = {
			{
				{"ChÊp B¸t c©n",0,103,1101},
				{"ChÊp B¸t Th­êng",0,100,1101},
				{"ChÊp B¸t phôc",0,101,1101},
				{"B¸t sø",0,0,1101},
			},
			{
				{"ChÊp B¸t c©n",0,103,1102},
				{"ChÊp B¸t Th­êng",0,100,1102},
				{"ChÊp B¸t phôc",0,101,1102},
				{"B¸t sø",0,0,1102},
			},
			{
				{"ChÊp B¸t c©n",0,103,1103},
				{"ChÊp B¸t Th­êng",0,100,1103},
				{"ChÊp B¸t phôc",0,101,1103},
				{"B¸t sø",0,0,1103},
			},
			{
				{"ChÊp B¸t c©n",0,103,1104},
				{"ChÊp B¸t Th­êng",0,100,1104},
				{"ChÊp B¸t phôc",0,101,1104},
				{"B¸t sø",0,0,1104},
			},
		},
		--Ø¤°ïÎÛÒÂ
		[NROUTEID_GBWY] = {
			{
				{"KhiÕu Hoa c©n",0,103,1201},
				{"KhiÕu Hoa y",0,100,1201},
				{"KhiÕu Hoa Khè",0,101,1201},
				{"KhiÕu Hoa Bæng",0,5,1201},
			},
			{
				{"KhiÕu Hoa c©n",0,103,1202},
				{"KhiÕu Hoa y",0,100,1202},
				{"KhiÕu Hoa Khè",0,101,1202},
				{"KhiÕu Hoa Bæng",0,5,1202},
			},
			{
				{"KhiÕu Hoa c©n",0,103,1203},
				{"KhiÕu Hoa y",0,100,1203},
				{"KhiÕu Hoa Khè",0,101,1203},
				{"KhiÕu Hoa Bæng",0,5,1203},
			},
			{
				{"KhiÕu Hoa c©n",0,103,1204},
				{"KhiÕu Hoa y",0,100,1204},
				{"KhiÕu Hoa Khè",0,101,1204},
				{"KhiÕu Hoa Bæng",0,5,1204},
			},
		},
		--Îäµ±
		[NROUTEID_WD] = {},
		--Îäµ±µÀ¼Ò
		[NROUTEID_WDDJ] = {
			{
				{"Thanh Tu c©n",0,103,1401},
				{"Thanh Tu bµo",0,100,1401},
				{"Thanh Tu phôc",0,101,1401},
				{"Thanh Tu KiÕm",0,2,1401},
			},
			{
				{"Thanh Tu c©n",0,103,1402},
				{"Thanh Tu bµo",0,100,1402},
				{"Thanh Tu phôc",0,101,1402},
				{"Thanh Tu KiÕm",0,2,1402},
			},
			{
				{"Thanh Tu c©n",0,103,1403},
				{"Thanh Tu bµo",0,100,1403},
				{"Thanh Tu phôc",0,101,1403},
				{"Thanh Tu KiÕm",0,2,1403},
			},
			{
				{"Thanh Tu c©n",0,103,1404},
				{"Thanh Tu bµo",0,100,1404},
				{"Thanh Tu phôc",0,101,1404},
				{"Thanh Tu KiÕm",0,2,1404},
			},
		},
		--Îäµ±Ë×¼Ò
		[NROUTEID_WDSJ] = {
			{
				{"Thanh Phong c©n",0,103,1501},
				{"Thanh Phong bµo",0,100,1501},
				{"Thanh Phong phôc",0,101,1501},
				{"Thanh Phong ThÝch",0,9,1501},
			},
			{
				{"Thanh Phong c©n",0,103,1502},
				{"Thanh Phong bµo",0,100,1502},
				{"Thanh Phong phôc",0,101,1502},
				{"Thanh Phong ThÝch",0,9,1502},
			},
			{
				{"Thanh Phong c©n",0,103,1503},
				{"Thanh Phong bµo",0,100,1503},
				{"Thanh Phong phôc",0,101,1503},
				{"Thanh Phong ThÝch",0,9,1503},
			},
			{
				{"Thanh Phong c©n",0,103,1504},
				{"Thanh Phong bµo",0,100,1504},
				{"Thanh Phong phôc",0,101,1504},
				{"Thanh Phong ThÝch",0,9,1504},
			},
		},
		--ÑîÃÅ
		[NROUTEID_YM] = {},
		--ÑîÃÅÇ¹Æï
		[NROUTEID_YMQQ] = {
			{
				{"Khinh Kþ kh«i",0,103,1701},
				{"Khinh Kþ gi¸p",0,100,1701},
				{"Khinh Kþ phôc",0,101,1701},
				{"Khinh Kþ Th­¬ng",0,6,1701},
			},
			{
				{"Khinh Kþ kh«i",0,103,1702},
				{"Khinh Kþ gi¸p",0,100,1702},
				{"Khinh Kþ phôc",0,101,1702},
				{"Khinh Kþ Th­¬ng",0,6,1702},
			},
			{
				{"Khinh Kþ kh«i",0,103,1703},
				{"Khinh Kþ gi¸p",0,100,1703},
				{"Khinh Kþ phôc",0,101,1703},
				{"Khinh Kþ Th­¬ng",0,6,1703},
			},
			{
				{"Khinh Kþ kh«i",0,103,1704},
				{"Khinh Kþ gi¸p",0,100,1704},
				{"Khinh Kþ phôc",0,101,1704},
				{"Khinh Kþ Th­¬ng",0,6,1704},
			},
		},
		--ÑîÃÅ¹­Æï
		[NROUTEID_YMGQ] = {
			{
				{"Nç Thñ kh«i",0,103,1801},
				{"Nâ thñ gi¸p",0,100,1801},
				{"Nâ Thñ phôc",0,101,1801},
				{"Nç Thñ Cung",0,4,1801},
			},
			{
				{"Nç Thñ kh«i",0,103,1802},
				{"Nâ thñ gi¸p",0,100,1802},
				{"Nâ Thñ phôc",0,101,1802},
				{"Nç Thñ Cung",0,4,1802},
			},
			{
				{"Nç Thñ kh«i",0,103,1803},
				{"Nâ thñ gi¸p",0,100,1803},
				{"Nâ Thñ phôc",0,101,1803},
				{"Nç Thñ Cung",0,4,1803},
			},
			{
				{"Nç Thñ kh«i",0,103,1804},
				{"Nâ thñ gi¸p",0,100,1804},
				{"Nâ Thñ phôc",0,101,1804},
				{"Nç Thñ Cung",0,4,1804},
			},
		},
		--Îå¶¾
		[NROUTEID_WDU] = {},
		--Îå¶¾Ð°ÏÀ
		[NROUTEID_WDUXX] = {
			{
				{"§o¹t Ph¸ch diÖn",0,103,2001},
				{"§o¹t Ph¸ch y",0,100,2001},
				{"§o¹t Ph¸ch phôc",0,101,2001},
				{"§o¹t Ph¸ch ®ao",0,7,2001},
			},
			{
				{"§o¹t Ph¸ch diÖn",0,103,2002},
				{"§o¹t Ph¸ch y",0,100,2002},
				{"§o¹t Ph¸ch phôc",0,101,2002},
				{"§o¹t Ph¸ch ®ao",0,7,2002},
			},
			{
				{"§o¹t Ph¸ch diÖn",0,103,2003},
				{"§o¹t Ph¸ch y",0,100,2003},
				{"§o¹t Ph¸ch phôc",0,101,2003},
				{"§o¹t Ph¸ch ®ao",0,7,2003},
			},
			{
				{"§o¹t Ph¸ch diÖn",0,103,2004},
				{"§o¹t Ph¸ch y",0,100,2004},
				{"§o¹t Ph¸ch phôc",0,101,2004},
				{"§o¹t Ph¸ch ®ao",0,7,2004},
			},
		},
		--Îå¶¾¹ÆÊ¦
		[NROUTEID_WDUGS] = {
			{
				{"§éc Tµm diÖn",0,103,2101},
				{"§éc Tµm Y",0,100,2101},
				{"§éc Tµm phôc",0,101,2101},
				{"§éc Tµm Tr¶o",0,11,2101},
			},
			{
				{"§éc Tµm diÖn",0,103,2102},
				{"§éc Tµm Y",0,100,2102},
				{"§éc Tµm phôc",0,101,2102},
				{"§éc Tµm Tr¶o",0,11,2102},
			},
			{
				{"§éc Tµm diÖn",0,103,2103},
				{"§éc Tµm Y",0,100,2103},
				{"§éc Tµm phôc",0,101,2103},
				{"§éc Tµm Tr¶o",0,11,2103},
			},
			{
				{"§éc Tµm diÖn",0,103,2104},
				{"§éc Tµm Y",0,100,2104},
				{"§éc Tµm phôc",0,101,2104},
				{"§éc Tµm Tr¶o",0,11,2104},
			},
		},
	},
	--Ê¦ÃÅµÚ¶þÌ×ÔÝÊ±Î´ÕûÀí
	--Ê¦ÃÅµÚÈýÌ×ÔÝÊ±Î´ÕûÀí

}
--Ê¦ÃÅ×°±¸Ôö¼Ó
--±¸×¢£º1¡¢player_way£ºÍæ¼ÒÂ·Ïß;2¡¢palyer_body£ºÍæ¼ÒÌåÐÍ;3¡¢att_num£º¸ø×°±¸µÄÊýÁ¿£º£¨40-45Îª40¼¶£©40Îª¸øÊ¦ÃÅÈ«Ì×£¬41ÎªÍ·£¬42ÎªÒÂ·þ£¬43ÎªÐ¬×Ó£¬44ÎªÎäÆ÷
--(60-65Îª60¼¶)60Îª¸øÊ¦ÃÅÈ«Ì×£¬61ÎªÍ·£¬62ÎªÒÂ·þ£¬63ÎªÐ¬×Ó£¬64ÎªÎäÆ÷£¬65ÎªÊ×ÊÎ;4¡¢knife_rung£ºÉÙÁÖË×¼Ò¸øµ¶»¹ÊÇ¹÷×Ó£º0ÎªÈ«¸ø£¬4Îªµ¶£¬5Îª¹÷×Ó
function Add_Faction_Equipment(player_way,palyer_body,att_num,knife_rung)
	knife_rung = knife_rung or 0
	local att_level = (floor(att_num/10)) * 10
	local att_seq = att_num - att_level
	local add_flag = 0						--Ôö¼Ó±êÖ¾
	if att_seq == 0 then					--¼ÓÈ«Ì×µÄ´¦Àí
		if player_way ~= 2 or (player_way == 2 and knife_rung == 0) then		--·ÇË×ÉÙ»òË×ÉÙ¼ÓÈ«Ì×
			for i = 1, getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body]) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 4 then						--¼Óµ¶
			for i = 1, (getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body])-1) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
		elseif player_way == 2 and knife_rung == 5 then						--¼Ó¹÷
			for i = 1, (getn(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body])-2) do
				add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][i][4],1,1,-1,-1,-1,-1,-1,-1)
			end
			add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][5][4],1,1,-1,-1,-1,-1,-1,-1)
		end
	else
		if player_way == 2 and att_seq == 4 then
			att_seq = knife_rung
		end
		add_flag = add_flag * AddItem(TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][2],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][3],TFACTION_EQUIP_INFO[att_level][player_way][palyer_body][att_seq][4],1,1,-1,-1,-1,-1,-1,-1)
	end
	return add_flag
end
--==========Ê¦ÃÅ¶Ô»°Ïà¹Ø
TFACTION_NPC_STRING = {}
TROUTE_MASTER_STRING = {
	[NROUTEID_SLSJ] = {
		MainDia = "",
	},
}
TROUTE_OTHER_STRING = {
	SkillLearn = {
		[1] = "",
		[2] = "",
		[3] = "",
		[4] = "",
		[5] = "",
		[6] = "",
	},
	MainDiaSel = {
		[1] = "",
		[2] = "",
		[3] = "",
		[4] = "",
	},
}
