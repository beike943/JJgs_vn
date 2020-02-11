Include("\\settings\\static_script\\kf_newbattles\\battleactivity_head.lua");
Include("\\settings\\static_script\\kf_newbattles\\battlepoint_head.lua");
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")

DEBUG_VERSION = 0;	--µ÷ÊÔ°æ±¾£¿
IB_VERSION = 1;		--IB°æ±¾£¿

BATTLE_JUNGONG_EXT_RATE = min(VNG_CFG_NB_JUNGONG_EXT_ADD_RATE or 0, 4)
BATTLE_EXP_EXT_RATE =  min(VNG_CFG_NB_EXP_EXT_ADD_RATE or 0, 6)
--========================================================================================
ALL_ID = 0
SONG_ID = 1						--ËÎ·½ÕóÓªÔÚmissionÖÐµÄID
LIAO_ID = 2						--ÁÉ·½ÕóÓªÔÚmissionÖÐµÄID
SONGLIAO_ID = SONG_ID+LIAO_ID;	--ËÎ·½ID£«ÁÉ·½ID£¬Õâ¸öÖ÷ÒªÊÇÓÃÀ´·½±ãÇóµÐ¶ÔÕóÓªµÄ£¬µÐ¶ÔÕóÓª£½SONGLIAO_ID£­µ±Ç°ÕóÓªID
--============Õ½³¡ÏµÍ³½Å±¾È«¾Ö±äÁ¿=========================================================
DRIVE_PLAYER_OUTOF_SHELTER = 0;	--ÊÇ·ñ´ò¿ªÇ¿ÖÆ´«ËÍºóÓªÍ£Áô¹ý¾ÃµÄÍæ¼ÒµÄ¹¦ÄÜ
CURE_ALL_PLAYER = 0;			--ÊÇ·ñÖÎÁÆËùÓÐºÍÆ½×´Ì¬µÄÍæ¼Ò
ALLOW_SIGNUP = 0;				--ÊÇ·ñÔÊÐíÍæ¼ÒÔÚÕ½³¡¿ªÊ¼ºóÈÔ¿É±¨Ãû£¨»¹ÓÐ±¨ÃûÃû¶îµÄÇé¿öÏÂ£©
FORBIDENT_CREATE_TEAM = 1;		--ÊÇ·ñ½ûÖ¹Õ½³¡ÄÚÍ¬ÕóÓª×é¶Ó£¬¶ÓÔ±¿É¹²Ïí»ý·Ö¡££±Îª½ûÖ¹£¬£°ÎªÔÊÐí
RANDOM_CAMP_PLACE = 0;			--ÊÇ·ñ´ò¿ªËæ»úºóÓª¹¦ÄÜ¡££±Îª´ò¿ª£¬£°Îª¹Ø±Õ¡£Ëæ»úºóÓªÖ¸µÄÊÇËÎÁÉË«·½¸÷×ÔµÄºóÓªºÍÕ½³¡½øÈëµãÊÇ²»¹Ì¶¨µÄ¡£
STATISTIC_OPEN = 1;				--ÊÇ·ñ´ò¿ªÕ½³¡Í³¼Æ¹¦ÄÜ
SERIES_KILL_OPEN = 1;			--ÊÇ·ñ´ò¿ªÁ¬Õ¶»ý·Ö¼Ó³É¹¦ÄÜ
--============·þÎñÆ÷È«¾Ö±äÁ¿=========================================================
GLB_FORBIDBATTLE = 31			--µ±¸ÃÖµ1Ê±±íÊ¾Í£Ö¹Õ½ÒÛµÄÆô¶¯
GLB_NEW_BATTLESTATE = 32		--ÐÂÕ½³¡µÄ×´Ì¬¡£¸öÎ»Îª1±íÊ¾¸±Õ½³¡±¨ÃûÖÐ£¬2Îª¸±Õ½³¡¿ªÕ½ÖÐ£¬3ÎªÖ÷Õ½³¡±¨ÃûÖÐ£¬4ÎªÖ÷Õ½³¡¿ªÕ½ÖÐ
GLB_VILLAGE =33;				--¼ÇÂ¼´åÂäÕ½µÄ½á¹û£¬0ÎªÆ½ÊÖ£¬1ÎªËÎÓ®£¬2ÎªÁÉÓ®£¬ÏÂÍ¬
GLB_RESOURCE = 34;				--¼ÇÂ¼×ÊÔ´Õ½µÄ½á¹û
GLB_EMPLACEMENT = 35;			--¼ÇÂ¼ÅÚÌ¨Õ½µÄ½á¹û
GLB_MAINBATTLE = 36;			--¼ÇÂ¼Ö÷Õ½³¡µÄ½á¹û
GLB_SIGN_UP_VILL_SONG = 37;		--¼ÇÂ¼¸÷¸öÕ½³¡Ë«·½±¨ÃûÈËÊý
GLB_SIGN_UP_VILL_LIAO = 38;
GLB_SIGN_UP_RESO_SONG = 39;
GLB_SIGN_UP_RESO_LIAO = 40;
GLB_SIGN_UP_EMPL_SONG = 41;
GLB_SIGN_UP_EMPL_LIAO = 42;
GLB_SIGN_UP_MAIN_SONG = 43;
GLB_SIGN_UP_MAIN_LIAO = 44;
GLB_RANDOM_PLACE_VILL = 45;		--±ê¼ÇËÎÁÉË«·½µÄËæ»úºóÓª¡££°±íÊ¾Ä¬ÈÏ£¨ËÎ×óÁÉÓÒ£©£¬£±±íÊ¾Ïà·´Î»ÖÃ
GLB_RANDOM_PLACE_RESO = 46;
GLB_RANDOM_PLACE_EMPL = 47;
GLB_RANDOM_PLACE_MAIN = 48;
--============Ò»Ð©Õ½³¡È«¾ÖÉèÖÃ=======================================================
VILLAGE_MAP_ID = 6029; --881;			--µØÍ¼ID
RESOURCE_MAP_ID = 6030; --882;
EMPLACEMENT_MAP_ID = 6031; --883;
MAIN_MAP_ID = 6032; --884;
--===================================================================================
SUB_BATTLE_MAX_PLAYER = 50		--¸±Õ½³¡µ¥·½ÈËÊýÉÏÏÞ
MAIN_BATTLE_MAX_PLAYER = 200	--Ö÷Õ½³¡µ¥·½ÈËÊýÉÏÏÞ
SUB_BATTLE_PLAYER_DIFF = 5		--¸±Õ½³¡×î´óÈËÊý²î
MAIN_BATTLE_PLAYER_DIFF = 5	--Ö÷Õ½³¡×î´óÈËÊý²î
SUB_BATTLE_SIGNUP_MAX_PLAYER = 120	--¸±Õ½³¡±¨Ãûµ¥·½ÈËÊýÉÏÏÞ
MAIN_BATTLE_SIGNUP_MAX_PLAYER = 200	--Ö÷Õ½³¡±¨Ãûµ¥·½ÈËÊýÉÏÏÞ
SUB_BATTLE_SIGNUP_PLAYER_DIFF = 5	--¸±Õ½³¡±¨Ãû×î´óÈËÊý²î
MAIN_BATTLE_SIGNUP_PLAYER_DIFF = 5	--Ö÷Õ½³¡±¨Ãû×î´óÈËÊý²î

TEAM_MEMBER_DISTANCE = 50;		--¶ÓÔ±Ö®¼ä»ñµÃ»ý·ÖµÄ×î´ó¾àÀë
TEAM_POINT_ATTENUATION = 0.6;	--¶ÓÎé»ý·ÖµÄË¥¼õ£¬£¶£°£¥

DEAD_BODY_TIME = 5;				--Ê¬Ìå´æÔÚÊ±¼ä

MAX_CHANGE_CAMP = 3;			--×î¶àÃâ·Ñ×ª»»ÕóÓª´ÎÊý

ACTIVITY_ADJUSTOR = 20;			--Õ½³¡»îÔ¾ÏµÍ³µ÷Õû²ÎÊý£¨¼´Íæ¼ÒÊ²Ã´¶¼²»×öµÄÄ¬ÈÏ»îÔ¾ÏµÊý£©

FRAME_PER_SECOND = 18;			--ÓÎÏ·ÔËÐÐËÙ¶È£ºÃ¿Ãë£±£¸Ö¡
FRAME_PER_MIN = 60*FRAME_PER_SECOND;--Ã¿·ÖÖÓÓÎÏ·Ö¡Êý

EMPEROR_AWARD_EXP = 100000;		--»ÊµÛ¼Î½±¾­Ñé
EMPEROR_AWARD_POINT = 10;		--»ÊµÛ¼Î½±»ý·Ö
BATTLE_STAR_AWARD_EXP = 200000;	--Õ½³¡Ö®ÐÇ½±Àø¾­Ñé
BATTLE_STAR_AWARD_POINT = 20;	--Õ½³¡Ö®ÐÇ½±Àø»ý·Ö
INVINCIBILITY_TIME = 5;			--´«³öºóÓªµÄÎÞµÐÊ±¼ä£¬µ¥Î»Ãë
--============Õ½³¡Mission ID=========================================================
VILLAGE_MISSION_ID = 72			--´åÂäÕù¶áÕ½£¨¸÷¸öÕ½³¡µÄMission ID£©
RESOURCE_MISSION_ID = 73		--²Ý¹ÈÕù¶áÕ½
EMPLACEMENT_MISSION_ID = 74		--ÅÚÌ¨Õù¶áÕ½
MAINBATTLE_MISSION_ID = 75		--Ö÷Õ½³¡
--============Õ½³¡ID=================================================================
VILLAGE_ID = 1					--´åÂäÕù¶áÕ½£¨¸÷¸öÕ½³¡µÄID£¬ÓÃÒÔ±êÊ¶Íæ¼ÒÔÚÄÄ¸öÕ½³¡ÀïÃæ£©
RESOURCE_ID = 2					--²Ý¹ÈÕù¶áÕ½
EMPLACEMENT_ID = 3				--ÅÚÌ¨Õù¶áÕ½
MAINBATTLE_ID = 4				--Ö÷Õ½³¡
--==================ÅÅÐÐ°ñID=========================================================
RANK_RESOURCE = 0; 				--Á¸²ÝÕ½Ó¢ÐÛ°ñ=0
RANK_VILLAGE = 1;				--´åÂäÕ½Ó¢ÐÛ°ñ=1
RANK_EMPLACEMENT = 2;			--ÅÚÌ¨Õ½Ó¢ÐÛ°ñ=2
RANK_MAIN = 3;					--ÑãÃÅ¹ØÓ¢ÐÛ°ñ=3
RANK_BATTLE_POINT = 4;			--»ý·ÖÅÅÃû=4
RANK_BATTLE_CONTRIBUTION = 5;	--¾ü¹¦ÅÅÃû=5
RANK_SINGLE_FIGHT = 6;			--µ¥ÌôÓ¢ÐÛ°ñ=6
RANK_BATTLE_STAR = 7;			--Õ½³¡Ö®ÐÇ=7
--===============Ò»Ð©table============================================================
tBTMSInfo = 					--Õ½³¡IDÓëMission IDºÍµØÍ¼IDµÄ¶ÔÓ¦¹ØÏµ
{
	[VILLAGE_ID] = {VILLAGE_MISSION_ID,VILLAGE_MAP_ID},
	[RESOURCE_ID] = {RESOURCE_MISSION_ID,RESOURCE_MAP_ID},
	[EMPLACEMENT_ID] = {EMPLACEMENT_MISSION_ID,EMPLACEMENT_MAP_ID},
	[MAINBATTLE_ID] = {MAINBATTLE_MISSION_ID,MAIN_MAP_ID},
}
tCampNameP = 					--ÕóÓªÃû×Ö£¨Æ´Òô£©£¬ÉèÖÃÕóÓªµÄÊ±ºòÓÃµÄ
{
	[ALL_ID] = "noaligned",
	[SONG_ID] = "dasong",
	[LIAO_ID] = "daliao",
}

tCampNameZ =					--ÕóÓªÃû×Ö£¨ÖÐÎÄ£©£¬ÏÔÊ¾¶Ô»°µÄÊ±ºòÓÃµÄ
{
	[ALL_ID] = "",
	[SONG_ID] = "Tèng",
	[LIAO_ID] = "Liªu",
}

tSexName = {"ThiÕu hiÖp","N÷ hiÖp "};
tRankName = {"Binh sÜ","HiÖu óy","§« thèng","Tiªn phong","§¹i T­íng","Nguyªn So¸i"};
tCampNickName = {"Ng­êi Tèng","Ng­êi Liªu"};

tBattleName =					--Õ½³¡Ãû×Ö
{
	[0]	= "",
	[VILLAGE_ID] = "Nh¹n M«n Quan-chiÕn dÞch Th«n trang",
	[RESOURCE_ID] = "Nh¹n M«n Quan-chiÕn dÞch th¶o cèc",
	[EMPLACEMENT_ID] = "Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi",
	[MAINBATTLE_ID] = "Nh¹n M«n Quan-chiÕn dÞch chÝnh",
}

tBattleChannel = 
{								--ÆµµÀÃû×ÖÓëID
	[VILLAGE_ID] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang",12},
	[RESOURCE_ID] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc",13},
	[EMPLACEMENT_ID] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi",14},
	[MAINBATTLE_ID] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh",15},
}
tCampChannel = 					--Õ½³¡ÉÏË«·½¸÷×ÔµÄÁÄÌìÆµµÀ
{
	[1] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang phe Tèng",16},
	[2] = {"Nh¹n M«n Quan-chiÕn dÞch Th«n trang phe Liªu",17},
	[3] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc phe Tèng",18},
	[4] = {"Nh¹n M«n Quan-chiÕn dÞch th¶o cèc phe Liªu",19},
	[5] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi phe Tèng",20},
	[6] = {"Nh¹n M«n Quan-chiÕn dÞch ph¸o ®µi phe Liªu",21},
	[7] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh phe Tèng",22},
	[8] = {"Nh¹n M«n Quan-chiÕn dÞch chÝnh phe Liªu",23},
}

tFaction = 						--ÃÅÅÉ
{
	[0] = "V« m«n ph¸i",
	[1] = "ThiÕu L©m",
	[2] = "Vâ §ang",
	[3] = "Nga My",
	[4] = "C¸i Bang",
	[5] = "§­êng M«n",
	[6] = "D­¬ng M«n",
	[7] = "Ngò §éc",
	[8] = "Thóy Yªn",
	[9] = "C«n L«n",
	[10] = "Minh gi¸o",
}

tRoute = 						--Â·Ïß
{
	[0] = "V« m«n ph¸i",
	[1] = "ThiÕu L©m",
	[2] = "Tôc gia",
	[3] = "ThiÒn t¨ng",
	[4] = "Vâ t¨ng",
	[5] = "§­êng M«n",
	[6] = "§­êng M«n",
	[7] = "Nga My",
	[8] = "Nga My phËt gia",
	[9] = "Nga My tôc gia",
	[10] = "C¸i Bang",
	[11] = "C¸i Bang TÜnh y",
	[12] = "C¸i Bang ¤ Y",
	[13] = "Vâ §ang",
	[14] = "Vâ §ang ®¹o gia",
	[15] = "Vâ §ang tôc gia",
	[16] = "D­¬ng M«n",
	[17] = "D­¬ng M«n th­¬ng Kþ",
	[18] = "D­¬ng M«n Cung Kþ",
	[19] = "Ngò §éc",
	[20] = "HiÖp §éc",
	[21] = "Tµ §éc",
	[22] = "C«n L«n",
	[23] = "C«n L«n Thiªn S­",
	[24] = "Minh gi¸o",
	[25] = "Minh Gi¸o Th¸nh ChiÕn",
	[26] = "Minh Gi¸o TrËn Binh",
	[27] = "Minh Gi¸o HuyÕt Nh©n",
	[28] = "Thóy Yªn",
	[29] = "Thóy Yªn Vò Tiªn",
	[30] = "Thóy Yªn Linh N÷",
	[31] = "§­êng M«n NhËm HiÖp",
	[32] = "C«n L«n KiÕm T«n",
}

tBattleItem = {					--Õ½³¡ÎïÆ·ÁÐ±í
--		ÎïÆ·Ãû¡¡´óÀà¡¡Ð¡Àà£±¡¡Ð¡Àà£²¡¡ÍË³öÕ½³¡ÊÇ·ñÉ¾³ý
	[1]  = {"L­¬ng th¶o-s¬ cÊp",2,0,588,1},
	[2]  = {"L­¬ng th¶o-trung cÊp",2,0,589,1},
	[3]  = {"L­¬ng th¶o-cao cÊp",2,0,590,1},
	[4]	 = {"Cuèc l­¬ng th¶o",2,0,591,1},
	[5]  = {"H­íng dÉn chiÕn tr­êng",2,0,595,0},
	[6]  = {"HuyÒn thiÕt kho¸ng th¹ch",2,0,594,1},
	[7]  = {"S¬n tÆc-binh kú",2,0,593,1},
	[8]  = {"S¬n tÆc-chiÕn cæ",2,0,592,1},
	[9]  = {"Sinh Sinh Hãa T¸n",1,0,205,1},
	[10] = {"Ngäc Cao t¸n",1,0,204,1},
	[11] = {"V¹n VËt Quy Nguyªn ®¬n",1,0,206,1}
}

tBattleMed = --Õ½³¡×¨ÓÃPKÒ©
{--            ÎïÆ·Ãû ´óÀà Ð¡Àà1 Ð¡Àà2 ËùÐè»ý·Ö     Ò©Ð§ËµÃ÷         ËùÐè¾üÏÎ
	[1]  = {"ChÝnh Nguyªn Håi T©m §¬n(c.tr­êng)",1,0,207,80,	"phôc håi tÊt c¶ nh÷ng kü n¨ng bÞ ®ãng b¨ng",	 0},
	[2]  = {"Ngò ChuyÓn Linh B¶o §¬n (c.tr­êng)",1,0,208,50,	"XuÊt chiªu+5, duy tr× trong 10 gi©y",	 	 0},
	[3]  = {"ThÇn Gi¸p §¬n (chiÕn tr­êng)",	 1,0,209,50,	"Ngo¹i phßng 100%, duy tr× trong 5 gi©y",	 0},
	[4]  = {"ThÇn Tr¸o §¬n (chiÕn tr­êng)",	 1,0,210,50,	"Néi phßng 100%, duy tr× 5 gi©y",	 0},
	[5]  = {"Th«ng C©n T¸n (chiÕn tr­êng)",	 1,0,211,50,	"MiÔn dÞch lµm chËm, duy tr× trong 10 gi©y",	 0},
	[6]  = {"Ho¹t HuyÕt T¸n (chiÕn tr­êng)",	 1,0,212,50,	"MiÔn dÞch gi¶m tèc, duy tr× trong 10 gi©y",	 0},
	[7]  = {"S­íng L¹c T¸n (chiÕn tr­êng)",	 1,0,213,50,	"MiÔn dÞch tª liÖt, duy tr× trong 10 gi©y",	 0},
--	[8]  = {"Õ½³¡×¨ÓÃÈÎ¶½É¢",	 1,0,214,50,	"ÃâÒß·âÕÐ£¬³ÖÐø10Ãë",	 0},
	[8]  = {"Cù Th¹ch T¸n (chiÕn tr­êng)",	 1,0,215,50,	"MiÔn dÞch ®Èy lui, duy tr× trong 10 gi©y",	 0},
	[9] = {"Kim Cang T¸n (chiÕn tr­êng)",	 1,0,216,50,	"MiÔn dÞch ®¸nh ng·, duy tr× trong 10 gi©y",	 0},
	[10] = {"§Ò ThÇn T¸n (chiÕn tr­êng)",	 1,0,217,50,	"MiÔn dÞch mª man, duy tr× trong 10 gi©y",	 0},
	[11] = {"Ng­ng Hån T¸n (chiÕn tr­êng)",	 1,0,218,50,	"MiÔn dÞch hçn lo¹n, duy tr× trong 10 gi©y",	 0},
	[12] = {"ThÇn Phong T¸n (chiÕn tr­êng)",	 1,0,219,50,	"MiÔn dÞch ®Þnh th©n, duy tr× trong 10 gi©y",	 0},
	[13] = {"V« óy T¸n (chiÕn tr­êng)",	 1,0,220,50,	"MiÔn cho¸ng, duy tr× trong 10 gi©y",	 0},
--	[15] = {"Õ½³¡×¨ÓÃ¶¨ÐÄÉ¢",	 1,0,221,50,	"ÃâÒßÃÔ»ó£¬³ÖÐø10Ãë",	 0},
--	[16] = {"Õ½³¡×¨ÓÃÁáççÕæÔªµ¤",1,0,222,120,	"ÃâÒßËùÓÐ¸ºÃæ£¬³ÖÐø10Ãë",0},
	[14] = {"ThÊt X¶o Linh §¬n (chiÕn tr­êng)",	 1,0,223,200,	"TiÓu v« ®Þch, duy tr× trong 3 gi©y",		 0},
	[15] = {"V« Cùc Tiªn §¬n (chiÕn tr­êng)",	 1,0,224,500,	"§¹i v« ®Þch, duy tr× trong 6 gi©y",		 0},
	[16] = {"Sinh Sinh Hãa T¸n",1,0,205,10,	"Nhanh chãng phôc håi sinh lùc vµ néi lùc",	 0},
	[17] = {"Ngäc Cao t¸n",1,0,204,10,	"Nhanh chãng phôc håi sinh lùc",			 0},
	[18] = {"V¹n VËt Quy Nguyªn ®¬n",1,0,206,8,		"Nhanh chãng phôc håi néi lùc",			 0},
	[19] = {"ThÊt KhiÕu Nguyªn B¶o §¬n(ctr­êng)",1,0,225,500,	"XuÊt chiªu+10, duy tr× trong 15 gi©y", 	 4},
--	[23] = {"Õ½³¡×¨ÓÃÎÞÉÏÉñÔªµ¤",1,0,226,500,	"ÃâÒßËùÓÐ¸ºÃæ£¬³ÖÐø20Ãë",4},
	[20] = {"Th«ng Thiªn V« Cùc §¬n (ctr­êng)",1,0,227,1000,	"V« ®Þch, duy tr× trong 9 gi©y",		 4},
}

tPKMed = --PKÒ©
{--         ÎïÆ·Ãû ´óÀà Ð¡Àà1 Ð¡Àà2 ËùÐè»ý·Ö Ò©Ð§ËµÃ÷        ËùÐè¾üÏÎ
	[1]  = {"ChÝnh Nguyªn Håi T©m ®¬n",1,0,50,1500,	"Lo¹i bá tÊt c¶ kü n¨ng CD",	 	 0},
	[2]  = {"Ngò ChuyÓn Linh B¶o ®¬n",1,0,53,1000,	"XuÊt chiªu+5",				 0},
	[3]  = {"ThÇn Gi¸p ®¬n",	 1,0,54,1000,	"Ngo¹i phßng 100%, duy tr× trong 5 gi©y",	 0},
	[4]  = {"ThÇn Tr¸o ®¬n",	 1,0,55,1000,	"Néi phßng 100%, duy tr× 5 gi©y",	 0},
	[5]  = {"Th«ng C©n t¸n",	 1,0,56,1000,	"MiÔn dÞch lµm chËm, duy tr× trong 10 gi©y",	 0},
	[6]  = {"Ho¹t HuyÕt t¸n",	 1,0,57,1000,	"MiÔn dÞch gi¶m tèc, duy tr× trong 10 gi©y",	 0},
	[7]  = {"S­íng L¹c t¸n",	 1,0,58,1000,	"MiÔn dÞch tª liÖt, duy tr× trong 10 gi©y",	 0},
--	[8]  = {"ÈÎ¶½É¢",	 1,0,59,1000,	"ÃâÒß·âÕÐ£¬³ÖÐø10Ãë",	 0},
	[8]  = {"Cù Th¹ch t¸n",	 1,0,60,1000,	"MiÔn dÞch ®Èy lui, duy tr× trong 10 gi©y",	 0},
	[9] = {"Kim Cang t¸n",	 1,0,61,1000,	"MiÔn dÞch ®¸nh ng·, duy tr× trong 10 gi©y",	 0},
	[10] = {"§Ò ThÇn t¸n",	 1,0,62,1000,	"MiÔn dÞch mª man, duy tr× trong 10 gi©y",	 0},
	[11] = {"Ng­ng Hån t¸n",	 1,0,63,1000,	"MiÔn dÞch hçn lo¹n, duy tr× trong 10 gi©y",	 0},
	[12] = {"ThÇn Phong t¸n",	 1,0,64,1000,	"MiÔn dÞch ®Þnh th©n, duy tr× trong 10 gi©y",	 0},
	[13] = {"V« óy t¸n",	 1,0,65,1000,	"MiÔn cho¸ng, duy tr× trong 10 gi©y",	 0},
--	[15] = {"¶¨ÐÄÉ¢",	 1,0,66,1000,	"ÃâÒßÃÔ»ó£¬³ÖÐø10Ãë",	 0},
--	[16] = {"ÁáççÕæÔªµ¤",1,0,67,1500,	"ÃâÒßËùÓÐ¸ºÃæ£¬³ÖÐø10Ãë",0},
	[14] = {"ThÊt X¶o Linh ®¬n",	 1,0,68,2000,	"TiÓu v« ®Þch, duy tr× trong 3 gi©y",		 0},
	[15] = {"V« Cùc Tiªn ®¬n",	 1,0,69,5000,	"§¹i v« ®Þch, duy tr× trong 6 gi©y",		 0},
	[16] = {"ThÊt KhiÕu Nguyªn B¶o §¬n",1,0,228,6000,	"XuÊt chiªu+10, duy tr× trong 15 gi©y",	 4},
--	[20] = {"ÎÞÉÏÉñÔªµ¤",1,0,229,8000,	"ÃâÒßËùÓÐ¸ºÃæ£¬³ÖÐø20Ãë",4},
	[17] = {"Th«ng Thiªn V« Cùc §¬n",1,0,230,10000,	"V« ®Þch, duy tr× trong 9 gi©y",		 4},
}

EXIT_POINT = 	--ÍË³öµã
{
	[ALL_ID] = {
		{428, 1310, 2693},
		{428, 1405, 2800},
		{428, 1490, 2743},
		{428, 1366, 2608},
	},
	[SONG_ID] = {
		{428, 1310, 2693},
		{428, 1405, 2800},
		{428, 1490, 2743},
		{428, 1366, 2608},
	},
	[LIAO_ID] = {
		{428, 1310, 2693},
		{428, 1405, 2800},
		{428, 1490, 2743},
		{428, 1366, 2608},
	},
}
--========================================================================================
RELAY_DATA_BATTLE = "battle_statistic";	--¹²ÏíÊý¾Ý¿âµÄ×Ö·û´®±êÊ¶
RELAY_CALLBACK_SCRIPT = "\\settings\\static_script\\kf_newbattles\\battlestatistic.lua";	--Relay¹²ÏíÊý¾Ý¿â»Øµ÷½Å±¾Â·¾¶
--========================================================================================
BATTLE_OFFSET = 700				--Õ½³¡ÈÎÎñ±äÁ¿µÄÆ«ÒÆÁ¿
--=========Õ½³¡ÈÎÎñ±äÁ¿===================================================================
PT_RANKPOINT = 1				--¼ÇÂ¼Íæ¼ÒµÄµ±Ç°¾ü¹¦£¬ËÎ·½ÊýÖµÎªÕý£¬ÁÉ·½ÊýÖµÎª¸º
PT_MAX_RANKPOINT_SONG = 2		--¼ÇÂ¼Íæ¼ÒµÄËÎ·½×î¸ß¾ü¹¦
PT_MAX_RANKPOINT_LIAO = 3		--¼ÇÂ¼Íæ¼ÒµÄÁÉ·½×î¸ß¾ü¹¦
PT_CURRANK = 4					--¼ÇÂ¼Íæ¼ÒµÄµ±Ç°¾üÏÎ£¬ËÎ·½ÎªÕý£¬ÁÉ·½Îª¸º
PT_BATTLE_TYPE = 5;				--¼ÇÂ¼Íæ¼ÒÏÖÔÚÔÚÄÄ¸öÕ½³¡£¬1Îª´åÂä£¬2Îª×ÊÔ´£¬3ÎªÅÚÌ¨£¬4ÎªÖ÷Õ½³¡£¬0²»ÔÚÈÎÒ»Õ½³¡
PT_MULTIPLE_JUNGONG = 6;		--N±¶¾ü¹¦±ê¼Ç
PT_TOTALPOINT = 7				--¼ÇÂ¼Íæ¼Ò×ÜµÄÕ½³¡»ý·Ö£¬ÓÃÒÔÏûºÄ£¬»á½µµÍ
PT_EMPEROR_AWARD_COUNT = 8		--»ÊµÛ¼Î½±´ÎÊý
PT_BATTLE_STAR_COUNT = 9		--³ÉÎªÕ½µØÖ®ÐÇ´ÎÊý
PT_LAST_RESULT = 2575--10;			--¼ÇÂ¼Íæ¼Ò²Î¼ÓµÄÉÏÒ»³¡Õ½³¡µÄ½á¹û
PT_SIGN_UP = 11					--¼ÇÂ¼Íæ¼Ò±¨Ãû²Î¼ÓÄÄ¸öÐ¡Õ½³¡ÄÄÒ»ÕóÓª£¬¸öÎ»¼ÇÂ¼ÕóÓª£¬Ê®Î»¼ÇÂ¼Õ½³¡
PT_BATTLE_DATE = 12				--¼ÇÂ¼Íæ¼ÒÉÏ´Î±¨Ãû²Î¼ÓÕ½³¡µÄÈÕÆÚ(format:yymmdd)
PT_VILLAGE_WIN = 13				--¼ÇÂ¼Íæ¼Ò²Î¼Ó´åÂäÕ½Ó®µÄ´ÎÊý£¨ÊäºÍÆ½ÊÖ²»¼ÇÂ¼£©
PT_RESOURCE_WIN = 14			--¼ÇÂ¼Íæ¼Ò²Î¼Ó×ÊÔ´Õ½Ó®µÄ´ÎÊý£¨ÊäºÍÆ½ÊÖ²»¼ÇÂ¼£©
PT_EMPLACEMENT_WIN = 15			--¼ÇÂ¼Íæ¼Ò²Î¼ÓÅÚÌ¨Õ½Ó®µÄ´ÎÊý£¨ÊäºÍÆ½ÊÖ²»¼ÇÂ¼£©
PT_MAIN_WIN = 16				--¼ÇÂ¼Íæ¼Ò²Î¼ÓÖ÷Õ½³¡Ó®µÄ´ÎÊý£¨ÊäºÍÆ½ÊÖ²»¼ÇÂ¼£©
PT_ATTEND_VILLAGE = 17			--²Î¼Ó´åÂäÕ½µÄ´ÎÊý£¨ÒÔÕ½³¡Õý³£½áÊøÎª²Î¼Ó±ê×¼£©
PT_ATTEND_RESOURCE = 18			--²Î¼Ó×ÊÔ´Õ½µÄ´ÎÊý£¨ÒÔÕ½³¡Õý³£½áÊøÎª²Î¼Ó±ê×¼£©
PT_ATTEND_EMPLACEMENT = 19		--²Î¼ÓÅÚÌ¨Õ½µÄ´ÎÊý£¨ÒÔÕ½³¡Õý³£½áÊøÎª²Î¼Ó±ê×¼£©
PT_ATTEND_MAIN = 20				--²Î¼ÓÖ÷Õ½³¡µÄ´ÎÊý£¨ÒÔÕ½³¡Õý³£½áÊøÎª²Î¼Ó±ê×¼£©
PT_VILL_POINT = 21				--Íæ¼ÒÔÚ´åÂäÕ½³¡ÉÏËù»ñµÃµÄ¸öÈË»ý·Ö
PT_RESO_POINT = 22				--Íæ¼ÒÔÚ×ÊÔ´Õ½³¡ÉÏËù»ñµÃµÄ¸öÈË»ý·Ö
PT_EMPL_POINT = 23				--Íæ¼ÒÔÚÅÚÌ¨Õ½³¡ÉÏËù»ñµÃµÄ¸öÈË»ý·Ö
PT_MAIN_POINT = 24				--Íæ¼ÒÔÚÖ÷Õ½³¡ÉÏËù»ñµÃµÄ¸öÈË»ý·Ö
PT_FIND_HEADER = 25				--ÕÒµ½Ê×Áì´ÎÊý
PT_HANDIN_RESOURCE = 26			--ÉÏ½»Á¸²ÝÊýÁ¿
PT_KILL_EMPLACEMENT = 27		--¶áÈ¡ÅÚÌ¨´ÎÊý
PT_HELP_REFUGEE = 28			--¾ÈÔ®ÄÑÃñÊýÁ¿
PT_KILL_PIONEER = 29			--É±µÐÏÈ·æÊýÁ¿
PT_KILL_GENERAL = 30			--É±µÐ´ó½«
PT_KILL_MARSHAL = 31			--É±µÐÔªË§
PT_KILL_SONG_PLAYER = 32		--É±ËÀËÎ·½Íæ¼Ò´ÎÊý
PT_KILL_LIAO_PLAYER = 33		--É±ËÀÁÉ·½Íæ¼Ò´ÎÊý
PT_LAST_CAMP = 34;				--ÉÏÒ»³¡Õ½³¡µÄÕóÓª
PT_BEST_SERIES_KILL = 35		--×î¸ßÁ¬Õ¶Êý
PT_KILL_BY_SONG = 36			--±»ËÎ·½Íæ¼ÒÉ±ËÀ´ÎÊý
PT_KILL_BY_LIAO = 37			--±»ÁÉ·½Íæ¼ÒÉ±ËÀ´ÎÊý
PT_SINGLE_WIN = 38				--µ¥ÌôÓ®´ÎÊý£¨µ¥Ìô»ý·ÖÓÉÕâÈý¸öÖµ¼ÆËã¶øµÃ£¬Ó®Ò»³¡£³·Ö£¬Æ½£±·Ö£¬¸º£°·Ö£©
PT_SINGLE_LOSE = 39				--µ¥ÌôÊä´ÎÊý
PT_SINGLE_DRAW = 40				--µ¥Ìô´òÆ½´ÎÊý
PT_HAVE_REFUGEE = 41			--ÏÂÏßÊ±ÊÇ·ñÓÐÄÑÃñ¸ú×Å
PT_SPYCLOTH_TIME = 42			--Ê¹ÓÃ¼äµý×°ÊøµÄÊ±¼ä
PT_MAX_KILL = 43;				--Ö÷Õ½³¡×î¸ßÉ±ÈË¼ÇÂ¼
PT_MAX_DEATH = 44;				--Ö÷Õ½³¡×î¸ßËÀÍö¼ÇÂ¼	
PT_MAX_CURRANK_SONG = 45;		--Íæ¼Ò×î¸ßËÎ·½¾üÏÎ
PT_MAX_CURRANK_LIAO = 46;		--Íæ¼Ò×î¸ßÁÉ·½¾üÏÎ
PT_OLD_BATTLE_POINT = 47;		--¾ÉÕ½³¡×Ü»ý·Ö
PT_1MIN2TYPE = 48;				--¼ÇÂ¼¿ªÊ¼Ê±¼ä£ºÒ»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇÖÐ¼¶Á¸²Ý
PT_1MIN3TYPE = 49;				--¼ÇÂ¼¿ªÊ¼Ê±¼ä£ºÒ»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ¸ß¼¶Á¸²Ý
PT_1MIN3TYPEDOUBLE = 50;		--¼ÇÂ¼¿ªÊ¼Ê±¼ä£ºÒ»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ2±¶¸ß¼¶Á¸²Ý
PT_1MINDOUBLE = 51;				--¼ÇÂ¼¿ªÊ¼Ê±¼ä£ºÒ»·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ2±¶Á¸²Ý
PT_3MINDOUBLE = 52;				--¼ÇÂ¼¿ªÊ¼Ê±¼ä£ºÈý·ÖÖÓÄÚ²ÉÈ¡µÄ¶¼ÊÇ2±¶Á¸²Ý
PT_EXP_AWARD = 53;				--¼ÇÂ¼Ëù»ñµÃµÄ¾­Ñé½±Àø
PT_POINT_AWARD = 2576--54;			--¼ÇÂ¼Ëù»ñµÃµÄ»ý·Ö½±Àø	
PT_JUNGONG_AWARD = 55;			--¼ÇÂ¼Ëù»ñµÃµÄ¾ü¹¦½±Àø
PT_GOLDENEXP_AWARD = 56;		--¼ÇÂ¼Ëù»ñµÃµÄ½¡¿µ¾­Ñé×ª¾­ÑéµÄ½±ÀøÊýÖµ
PT_EXCHANGE_EXP_COUNT = 57;		--¼ÇÂ¼µ±Ìì»»È¡³£¹æ¾­Ñé½±ÀøµÄ´ÎÊý
PT_EXCHANGE_EXP_DATE = 58;		--¼ÇÂ¼»»È¡³£¹æ¾­Ñé½±ÀøµÄÈÕÆÚ
PT_CHANGE_CAMP_COUNT = 59;		--¼ÇÂ¼Ãâ·Ñ×ª»»ÕóÓªµÄ´ÎÊý
PT_GET_EXP_AWARD_COUNT = 60;	--¼ÇÂ¼µ±ÌìÁìÈ¡´óÕ½³¡¾­Ñé½±ÀøµÄ´ÎÊý
PT_GET_EXP_AWARD_DATE = 61;		--¼ÇÂ¼ÁìÈ¡´óÕ½³¡¾­Ñé½±ÀøµÄÈÕÆÚ
PT_LAST_BATTLE = 62;			--¼ÇÂ¼ÉÏÒ»³¡²Î¼ÓµÄÊÇÄÄÒ»¸öÕ½³¡
--==================Íæ¼Ò±äÁ¿£¬Ö»ÔÚ½øÈë²»Í¬µÄÕ½³¡Ê±±»Çå³ý=======================================
PTNC_KILL = 80;					--µ¥³¡Õ½³¡É±ÈËÊýÄ¿
PTNC_DEATH = 81;				--µ¥³¡Õ½³¡±»É±ÊýÄ¿
PTNC_SERIES_KILL = 82			--µ¥³¡Õ½³¡µ±Ç°Á¬Õ¶Êý
PTNC_ACTIVITY = 83				--µ¥³¡Õ½³¡»îÔ¾ÏµÊý
PTNC_BATTLEPOINT = 2577--84			--µ¥³¡Õ½ÒÛµÄ»ý·Ö
PTNC_KILL_VILLAGER_POINT = 85	--Ö÷Õ½³¡É±ÍÁÃñËù»ñµÃµÄ»ý·Ö
PTNC_KILL_SOLDIER_POINT = 86	--Ö÷Õ½³¡É±Ê¿±øËù»ñµÃµÄ»ý·Ö
PTNC_GOT_MEDICINE= 87			--±ê¼ÇÊÇ·ñÁìÈ¡ÁËÕ½³¡Ãâ·ÑÒ©
PTNC_HELP_REFUGEE = 88			--µ¥³¡¾ÈÖúÄÑÃñÊýÁ¿
PTNC_USE_HOE_TIMES = 89			--²Ý¹È³¡Ê¹ÓÃ³úÍ·µÄ´ÎÊý

PT_TAG_CLEARED = 100			--±êÖ¾Õ½³¡±äÁ¿ÓÐÃ»ÓÐ±»Çå¹ý£¬0±íÊ¾Ã»Çå¹ý£¬1±íÊ¾Çå¹ý
--====================Õ½³¡ÀïÃæÓÃµ½µÄÁÙÊ±±äÁ¿===============================================
PTT_BEGIN = 20					--µÚÒ»¸öÁÙÊ±±äÁ¿
PTT_KILLERINDEX = 20			--¼ÇÂ¼É±ËÀÄãµÄÍæ¼ÒµÄINDEX
PTT_KILLERID = 21				--¼ÇÂ¼É±ËÀÄãµÄÍæ¼ÒµÄID
PTT_KILLEDINDEX = 22			--¼ÇÂ¼±»ÄãÉ±ËÀµÄÍæ¼ÒµÄINDEX
PTT_KILLEDID = 23				--¼ÇÂ¼±»ÄãÉ±ËÀµÄÍæ¼ÒµÄID
PTT_LOCK = 24					--¼ÇÂ¼ÊÇ·ñ³öÓÚËø¶¨×´Ì¬£¬(µ¥ÌõÇëÇóÖÐ»òÕßµ¥ÌõÖÐ)
PTT_ROOMINDEX = 25				--¼ÇÂ¼ÔÚÄÄ¸öµ¥Ìô³¡µØ£¬0±íÊ¾²»ÔÚµ¥Ìô³¡µØ
PTT_FOLLOWER = 26				--ÊÇ²»ÊÇ´ø×ÅÍÁÃñ£¬£±ÊÇ£°·ñ
PTT_FIGHT_STATE = 27			--ÔÚµ¥Ìô³¡µØµÄ×´Ì¬

PTT_PUBLIC_POINT = 29			--¹«¹²»ý·Ö£ºÓÃÀ´×÷×îºó±¨¸æ·ÖÊý
PTT_RESULT_POINT = 30			--Ê¤¸º»ý·Ö£ºÓÃÀ´×÷×îºó±¨¸æ·ÖÊý
PTT_SELECTED = 31				--±êÊ¶Íæ¼ÒÊÇ²»ÊÇ±»Ñ¡ÖÐµÄÈË
PTT_DIE_LOOP = 32				--¼ÇÂ¼Íæ¼ÒÔÚÕ½³¡ËÀÍöµÄÊ±ºò£¬µ±Ç°¼ÆÊ±Æ÷µÄÑ­»·Êý
PTT_OPERATE_TIME = 33			--ÓÃÀ´´¦ÀíÖ÷Õ½³¡µ¥Ìô²Ù×÷µÄÑÓ³Ù£¬µ¥Î»Ãë
PTT_TITLE = 34;					--Íæ¼ÒÁÙÊ±Õ½³¡³ÆºÅ
PTT_IN_TASK_AREA = 35;					--ÔÚ·À×÷±×Çø
PTT_END = 35;					--×îºóÒ»¸öÁÙÊ±±äÁ¿
--====================Õ½³¡ÍâÃæÓÃµ½µÄÁÙÊ±±äÁ¿===============================================
PTT_SNAPSHOOT = 49				--Ò»¸öÉú´æÊ±¼äºÜ¶ÌÔÝµÄÁÙÊ±±äÁ¿£¬ÓÃÓÚÁ½¸öº¯ÊýÖ®¼äµÄ²ÎÊý´«µÝ
--====================Custom Data==========================================================
tCustomDataString = 			--¼ÇÂ¼CustomDataµÄ×Ö·û´®£¬µÚÒ»¸öÔªËØÎª£±±íÊ¾ÍË³öÕ½³¡Ê±²»»áÇå³ý£¬£°±íÊ¾ÒªÇå³ý
{								--Õâ¸ö¶«Î÷ÔÝÊ±»¹Ã»ÓÐ±»Ê¹ÓÃ
	[1] = {0,"bt_yj_enemyname"},	--Ö÷Õ½³¡µ¥ÌôÊ±ÓÃÀ´¼ÇÂ¼¶Ô·½µÄÃû×ÖµÄ
	[2] = {1,"bts_village"},		--¸÷Õ½³¡µÄÍ³¼ÆÊý¾Ý
	[3] = {1,"bts_resource"},
	[4] = {1,"bts_emplacement"},
	[5] = {1,"bts_mainbattle"},
}
CD_ENEMY_NAME = tCustomDataString[1][2];
CD_BTS_VILLAGE = tCustomDataString[2][2];
CD_BTS_RESOURCE = tCustomDataString[3][2];
CD_BTS_EMPLACEMENT = tCustomDataString[4][2];
CD_BTS_MAINBATTLE = tCustomDataString[5][2];
--==========Õ½³¡¹«ÓÃMissionV±äÁ¿£¨£±£­£³£°£©========================================
MV_BATTLE_STATE = 1;			--¼ÇÂ¼Õ½³¡Ä¿Ç°×´Ì¬
MV_BATTLE_ID = 2;				--¼ÇÂ¼Õ½³¡µÄÎ¨Ò»ID
MV_BATTLE_POINT_SONG = 3;		--¼ÇÂ¼ËÎ·½µÄ¹«¹²»ý·Ö
MV_BATTLE_POINT_LIAO = 4;		--¼ÇÂ¼ÁÉ·½µÄ¹«¹²»ý·Ö
MV_WINNER = 5;					--¼ÇÂ¼Ê¤¸º£¬£±ÎªËÎ·½Ó®£¬£²ÎªÁÉ·½Ó®£¬£°Îª´òÆ½
MV_TIMER_LOOP = 6;				--¼ÇÂ¼TIMERµÄ±¨Ê±´ÎÊý
MV_SP_TIMER_STATE = 7;			--¼ÇÂ¼ÌØÊâ¼ÆÊ±Æ÷µÄ×´Ì¬¡£¸÷ÖÖ×´Ì¬ÔÚmission_head.lua¶¨Òå
MV_SP_TIMER_LOOP = 8;			--¼ÇÂ¼ÌØÊâ¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý
MV_DEATH_COUNT_SONG = 9			--ËÎ·½Íæ¼ÒËÀÍö´ÎÊý
MV_DEATH_COUNT_LIAO = 10		--ÁÉ·½Íæ¼ÒËÀÍö´ÎÊý
MV_FACTION_PLAYER_COUNT1 = 11;	--¼ÇÂ¼Õ½³¡ÀïÃæ¸÷ÃÅÅÉÈËÊý£¬¹²£±£±¸öÃÅÅÉ£¨°üÀ¨°×Ãû£©£¬Ã¿¸ö±äÁ¿¼ÇËÄ¸öÃÅÅÉ£¬ÐèÈý¸ö±äÁ¿
MV_FACTION_PLAYER_COUNT2 = 12;
MV_FACTION_PLAYER_COUNT3 = 13;
--==========³£Á¿£ºÕ½³¡µÄ×´Ì¬=======================================================
MS_STATE_PEACE = 0;				--ºÍÆ½×´Ì¬£¬¼´Õ½³¡»¹Ã»¿ªÊ¼±¨Ãû
MS_STATE_READY = 1;				--×¼±¸×´Ì¬
MS_STATE_FIGHT = 2;				--¿ªÕ½×´Ì¬
MS_STATE_COMPLETE = 3;			--Õ½Õù½áÊø×´Ì¬
--===========================================================================
LOG_ID = 1108;					--µÇÂ½´¥·¢Æ÷±íID
LOG_TRIGGER_ID = 3121;			--µÇÂ½´¥·¢Æ÷×Ô¶¨ÒåID 
--===========================================================================

--=========================ÒÔÏÂÊÇµÀ¾ßÏà¹Ø³£Á¿==========================================
ITEM_SPYCLOTH_TIME = 3*3600			--¼äµý×°ÊøÓÐÐ§Ê±¼ä£¬µ¥Î»Ãë