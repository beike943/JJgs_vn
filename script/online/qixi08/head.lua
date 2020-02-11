
DEBUG_VERSION = 0;	--1±íÊ¾µ÷ÊÔ°æ±¾£¬0±íÊ¾ÍâÍø·¢²¼°æ±¾
IB_VERSION = 1		--1±íÊ¾ÊÇÃâ·ÑÇø£¬0±íÊ¾ÊÕ·ÑÇø
--============================================================================
g_szInfoHead = "<color=green>§Æc sø §¹i Héi Vâ l©m<color>:"
--============================================================================
GAME_ID_GUESS = 1;	--ÓÎÏ·ID
GAME_ID_BOX = 2;
GAME_ID_LIGHT = 3;
--============================================================================
g_tbGameName = 
{
	[GAME_ID_GUESS] = "Thiªn C¬ ThÇn To¸n",
	[GAME_ID_BOX] = "§o¹t B¶o Kú Binh",
	[GAME_ID_LIGHT] = "§iÓm §¨ng Héi",
}
--============================================================================
g_tbGameSchedule =
{
	[0] = {"§iÓm §¨ng Héi",GAME_ID_LIGHT},
	[1] = {"Thiªn C¬ ThÇn To¸n",GAME_ID_GUESS},
	[2] = {"§o¹t B¶o Kú Binh",GAME_ID_BOX},
	[3] = {"Thiªn C¬ ThÇn To¸n",GAME_ID_GUESS},
	[4] = {"§o¹t B¶o Kú Binh",GAME_ID_BOX},
	[5] = {"Thiªn C¬ ThÇn To¸n",GAME_ID_GUESS},
	[6] = {"§o¹t B¶o Kú Binh",GAME_ID_BOX},
}
--============================================================================
g_nGameBeginDate = 20081113;	--Èý´óÓÎÏ·¿ªÊ¼Ê±¼ä
g_nGameEndDate = 20090107;		--Èý´óÓÎÏ·½áÊøÊ±¼ä
g_nAwardEndDate = 20090114;		--»ý·Ö»»½±Àø½áÊøÊ±¼ä
g_nQiXiBeginDate = 20080807;	--ÆßÏ¦»î¶¯¿ªÊ¼Ê±¼ä
g_nQiXiEndDate = 20080809;		--ÆßÏ¦»î¶¯½áÊøÊ±¼ä
g_nEquipPoint = 20;				--25»ý·Ö»»Ò»¼þ×°±¸
g_nJifenMax = 200;        --×î¶àÀÛ»ý200»ý·Ö
g_nExpNum = 21;				--Ã¿ÖÜ»»È¡µÄ¾­Ñé´ÎÊý
g_nBoxNum = 100;      --±¦Ïä¾­ÑéÖ»ÄÜ»ñµÃÕâ¸ö´ÎÊý

g_nYearsBeginDate = 20081118;  --¶þÊ®ÖÜÄêÇì³ÆºÅÁìÈ¡¿ªÊ¼Ê±¼ä
g_nYearsEndDate = 20081124;    --³ÆºÅÁìÈ¡½áÊøÊ±¼ä
g_nYearsDays = 7;              --¾­Ñé³ÖÐøÊ±¼ä£ºÌì
g_nYearsExpNums = 60;          --Ã¿ÌìÆðÐ§¾­Ñé´ÎÊý£º´Î

--============================================================================
g_tbAward = 	--½±ÀøÐÅÏ¢
{--½±Àø¼¶±ð   ÊÕ·Ñ    	Ãâ·Ñ
--		½¡¿µ¾­Ñé,¾­Ñé 	¾­Ñé µ¥Î»£ºÍò  ±¦Ê¯°ü¹üÊýÁ¿ »ý·Ö
	[1] = {{400,200},	{500},			6,			5},
	[2] = {{400,100},	{420},			5,			4},
	[3] = {{350,100},	{380},			4,			3},
	[4] = {{300,100},	{350},			3,			2},
	[5] = {{250,100},	{300},			2,			1},
}
g_tbTitleName = 
{
	[GAME_ID_GUESS] = "Thiªn C¬ ThÇn To¸n",
	[GAME_ID_BOX] = "§o¹t B¶o Kú Binh",
	[GAME_ID_LIGHT] = "Hoa ®¨ng v­¬ng",
};
--ÈÎÎñ±äÁ¿1986-1987=====================================================================
TSK_WEAPON_TYPE = 1987;					--¸øÍò¶ñµÄÉÙÁÖË×¼ÒÓÃÁË¡£¼ÇÂ¼Ñ¡ÔñµÄÊÇµ¶»¹ÊÇ¹÷
TSK_AOYUN_GET_TICKET_DATE = 1989;		--¼ÇÂ¼ÁìÈ¡Ãâ·ÑÃÅÆ±µÄÈÕÆÚ
TSK_AOYUN_POINT = 1351;					--¼ÇÂ¼»î¶¯»ý·Ö
TSK_AOYUN_AWARD_WEEK = 1361;      --¼ÇÂ¼ÖÜµÄÐòÊý
TSK_AOYUN_EXP_NUM = 1353;         --»»È¡¾­ÑéµÄ´ÎÊý Ã¿ÖÜÒ»Çå
TSK_AOYUN_BOX_NUM = 1354;         --±¦Ïä¿ªÆô¾­Ñé´ÎÊý
TSK_AOYUN_YI_EXP = 1355;          --1ÒÚ¾­ÑéÃ¿ÖÜÖ»ÄÜ1´Î
TSK_YEARS_BEGIN_DATE = 1357;      --¶þÊ®ÖÜÄêÇì³ÆºÅÁìÈ¡¿ªÊ¼Ê±¼ä 
TSK_YEARS_END_DATE = 1358;        --¶þÊ®ÖÜÄêÇì³ÆºÅÁìÈ¡½áÊøÊ±¼ä
TSK_YEARS_EXP_DATE = 1359;        --µ±ÌìÊÇ·ñÁìÂúÁË¾­Ñé
TSK_YEARS_EXP_NUM = 1360;         --µ±Ìì¸øÁË¶àÉÙ´Î¾­Ñé

tJifenAward = {
	[10] = {"R­¬ng kû niÖm 20 n¨m",2,0,1085,1,2000000},
	[50] = {"R­¬ng kû niÖm 20 n¨m",2,0,1085,8,5000000},
	[200] = {"R­¬ng kû niÖm 20 n¨m",2,0,1085,35,10000000}
};

tMijiName = {
		{"Tø Linh ChiÕn ý Phæ",0,107,159},
		{"Tø Linh Thiªn ý Phæ",0,107,160},
		{"Tø Linh Tö ý Phæ",0,107,161}
};

tGaojiMiji = {
	[0] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"TiÒm Long TÞch DiÖt Kinh",0,107,167},{"Thiªn La Liªn Ch©u Lôc",0,107,169},{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170},{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171},{"Hçn §én TrÊn Nh¹c MËt TÞch",0,107,172},{"Quü Thiªn Du Long MËt TÞch",0,107,173},{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174},{"Qu©n Tö TiÖt Phong MËt TÞch",0,107,175},{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176},{"Xuyªn V©n L¹c Hång MËt TÞch",0,107,177},{"U Minh Phong Ma Lôc",0,107,178},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
	[1] = {{"Kim Cang B¸t Nh· Kinh",0,107,166},{"V« TrÇn Bå §Ò Kinh",0,107,168},{"TiÒm Long TÞch DiÖt Kinh",0,107,167}},
	[2] = {{"Kim Cang B¸t Nh· Kinh",0,107,166}},
	[3] = {{"V« TrÇn Bå §Ò Kinh",0,107,168}},
	[4] = {{"TiÒm Long TÞch DiÖt Kinh",0,107,167}},
	[5] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169}},
	[6] = {{"Thiªn La Liªn Ch©u Lôc",0,107,169}},
	[7] = {{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170},{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171}},
	[8] = {{"Nh­ ý Kim §Ønh MËt TÞch",0,107,170}},
	[9] = {{"BÝch H¶i TuyÖt ¢m Phæ",0,107,171}},
	[10] = {{"Hçn §én TrÊn Nh¹c MËt TÞch",0,107,172},{"Quü Thiªn Du Long MËt TÞch",0,107,173}},
	[11] = {{"Hçn §én TrÊn Nh¹c MËt TÞch",0,107,172}},
	[12] = {{"Quü Thiªn Du Long MËt TÞch",0,107,173}},
	[13] = {{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174},{"Qu©n Tö TiÖt Phong MËt TÞch",0,107,175}},
	[14] = {{"HuyÔn ¶nh Mª Tung MËt TÞch",0,107,174}},
	[15] = {{"Qu©n Tö TiÖt Phong MËt TÞch",0,107,175}},
	[16] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176},{"Xuyªn V©n L¹c Hång MËt TÞch",0,107,177}},
	[17] = {{"TrÊn Qu©n Phi Long Th­¬ng Phæ",0,107,176}},
	[18] = {{"Xuyªn V©n L¹c Hång MËt TÞch",0,107,177}},
	[19] = {{"U Minh Phong Ma Lôc",0,107,178},{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
	[20] = {{"U Minh Phong Ma Lôc",0,107,178}},
	[21] = {{"Linh Cæ HuyÔn Tµ Lôc",0,107,179}},
	[23] = {{"Cöu Thiªn Phong L«i QuyÕt",0,107,198}},	
	[29] = {{"Hång TrÇn Tóy Méng Phæ",0,107,202}},
	[30] = {{"Phong Hoa Thiªn DiÖp Phæ",0,107,203}},	
};

tItemName = {
	{"B¹ch NghÜa",0,105,49},
	{"HiÖp Dùc",0,105,50},
	{"ChiÕn M· Nguyªn So¸i cao cÊp (tr¾ng)",0,105,51},
	{"ChiÕn M· Nguyªn So¸i cao cÊp (®en)",0,105,52},
	{"Thiªn Qu¸i Th¹ch",2,0,1084},
	{"R­¬ng kû niÖm 20 n¨m",2,0,1085},
	{"Ch×a khãa ®ång kû niÖm",2,0,1086},
	{"Ch×a khãa b¹c kû niÖm",2,0,1087},
	{"Ch×a khãa vµng kû niÖm",2,0,1088},
	{"TÝch lòy bµi",2,0,1089},
	{"H­íng dÉn ho¹t ®«ng kû niÖm 20 n¨m",2,0,1090},
	{"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch",2,1,1067},
	{"Thiªn Th¹ch linh th¹ch",2,1,1068},
	{"M¶nh Thiªn th¹ch",2,2,7},
	{"Thiªn th¹ch",2,2,8},
	{"Huy Hoµng Chi Thñy",0,102,8840},
	{"Vinh Dù Chi Thñy",0,102,8841}
};

tAwardGailvIB = { --Ãâ·Ñ
	{12,120,30,12,30,6},
	{60,600,150,60,150,30},
	{1200,10000,3000,1200,3000,600}
};

tAwardGailv = { --ÊÕ·Ñ
	{12,120,30,12,60,6},
	{60,600,150,60,300,30},
	{1200,10000,3000,1200,6000,600}
};

tYearsExp = {--Ã¿´Î¸øÓèµÄ×î¶à¾­Ñé£¬´«ÈëIB_VERSIONÎªË÷Òý
	[0] = {1420226},
	[1] = {676188}
};
