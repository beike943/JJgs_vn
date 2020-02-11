--File name:3festival_head.lua 
--Describe:Èý½ÚÁ¬¹ýÍ·ÎÄ¼þ½Å±¾
--Create Date:2006-8-22
--Author:yanjun
--2369ÖÁ2500ÈÎÎñ±äÁ¿¿ÉÓÃ
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");

IB_VERSION = 1;		--1±íÊ¾ÊÇÃâ·ÑÇø£¬0±íÊ¾ÊÕ·ÑÇø

--============================================================================
TASK_MAIN_RES = 2369;			--¼ÇÂ¼Ëù¼ÓµÄÖ÷ÁÏ
TASK_SUB_RES = 2370;			--¼ÇÂ¼Ëù¼ÓµÄ¸±ÁÏ
TASK_FIREUP_TIME = 2371;		--¼ÇÂ¼Éú»ðµÄÊ±¼ä
TASK_ADD_FUEL_TIME = 2372;		--¼ÇÂ¼ÉÏ´ÎÌí¼Ó²ÄÁÏÊ±¼ä
TASK_TEMPERATURE_CHECKED = 2373	--¼ÇÂ¼ÊÇ·ñ²é¿´¹ýÎÂ¶È
TASK_TEMPERATURE = 2374			--¼ÇÂ¼¼ÓÍêÈ¼ÁÏºóµÄÂ¯×ÓÎÂ¶È
TASK_GOT_ITEM_TIME = 2375;		--¼ÇÂ¼Íæ¼ÒÉÏ´ÎÄÃµ½Ð¡BOSSÎïÆ·µÄÊ±¼ä
TASK_GOT_RESOURCE = 2376;		--¼ÇÂ¼Íæ¼ÒÁìÈ¡×öÔÂ±ý²ÄÁÏµÄÈÕÆÚ
TASK_GOT_MOONCATE = 2377;		--¼ÇÂ¼Íæ¼ÒÁìÈ¡ÔÂ±ýµÄÈÕÆÚ
TASK_HEALTHYEXP = 2378;			--¼ÇÂ¼Íæ¼ÒÄ³Ìì×Ü¹²µÃµ½¹ý¶àÉÙ½¡¿µ¾­Ñé
TASK_HEALTHYEXP_DATE = 2379;	--¼ÇÂ¼Íæ¼Ò»ñµÃ½¡¿µ¾­ÑéÊ±µÄÈÕÆÚ
--=========================08ÄêµÄ===========================================
ABLUEMOON_LUCK_DATE = 617; --ËãÃüµÄÈÕÆÚ ¸ñÊ½£º%y%m%d
ABLUEMOON_LUCK = 618; --Ã¿ÌìµÄÐÒÔËÖµ 1¡«7±íÊ¾ÔËÊÆ 1±íÊ¾´óÐ×£¬7±íÊ¾´ó¼ª
TASK_CHANGE_YUEBING = 929;    --¼ÇÂ¼Íæ¼Ò¶Ò»»ÔÂ±ý´ÎÊý£¬4×Ö½Ú£¬·Ö±ð±íÊ¾Ê¢ÊÀ½ðÃ·º®ÏãÔÂ¡¢Ê¢ÊÀ°×ÓñË«»ÆÔÂ¡¢Ê¢ÊÀÆæÏãÎåÈÊÔÂ¡¢Ê¢ÊÀ°Ù»¨Ê²½õÔÂ
TASK_CHANGE_EXCHANGE = 930;		--¼ÇÂ¼Íæ¼ÒÓÃ½­É½æÏ¶ðË®¾§ÔÂ»»È¡½±ÀøµÄ´ÎÊý
TASK_GOT_ANNIVERSARY_REWARD = 931;	--¼ÇÂ¼Íæ¼ÒÊÇ·ñÁìÈ¡ÁËÖÜÄê½±Àø
TASK_WULIN_IS_AWARD = 932; 		--¼ÇÂ¼µ±ÌìÊÇ·ñÒÑ¾­Áì¹ýÎäÁÖÃË½±Àø£¬´æ´¢µ±ÌìÊ±¼ä
TASK_WULIN_AWARD_NUM = 933; 		--¼ÇÂ¼Áì½±´ÎÊý
TASK_WULIN_SHUANGBEI = 934;			--µ±ÌìÊÇ·ñÁìÈ¡ÁËË«±¶Ê±¼ä½±Àø
TASK_BAIJU_SB_TIME = 935;			--°×¾ÔÍèË«±¶Ê±¼ä£¬µ¥Î»£º·ÖÖÓ
TASK_GENSUI_TOTAL = 936; 			--»ñµÃ½±ÀøµÄ´ÎÊý
TASK_GENSUI_DATE = 937; 			--»ñµÃ½±Àøºó¼ÇÂ¼ÈÕÆÚ
TASK_GOT_MOONCANT_COUNT = 938;		--¼ÇÂ¼ÁìÈ¡ÔÂ±ýµÄ´ÎÊý
TASK_USE_HHDYB = 939;				--Ê¹ÓÃHHDYB´ÎÊý
TASK_USE_JSHTYB = 940;				--Ê¹ÓÃJSHTYB´ÎÊý
TASK_USE_JSJHYB= 941;				--Ê¹ÓÃJSJHYB´ÎÊý
TASK_USE_JSMWYB = 942;				--Ê¹ÓÃJSMWYB´ÎÊý
TASK_USE_JSYB = 943;				--Ê¹ÓÃJSYB´ÎÊý
TASK_USE_CARD_20 = 944;			--Ê¹ÓÃ2£°ÕÅ¿¨»»½±ÀøµÄ´ÎÊý
TASK_USE_CARD_40 = 945;			--Ê¹ÓÃ4£°ÕÅ¿¨»»½±ÀøµÄ´ÎÊý
TASK_USE_TIE_BOX = 946;     --Íæ¼Ò¿ªÆôÌúÏä×ÓµÄ´ÎÊý ÓÃÓÚÌá¸ß¼«Æ·¸ÅÂÊ
TASK_USE_TONG_BOX = 947;     --Íæ¼Ò¿ªÆôÍ­Ïä×ÓµÄ´ÎÊý ÓÃÓÚÌá¸ß¼«Æ·¸ÅÂÊ
TASK_USE_YIN_BOX = 948;     --Íæ¼Ò¿ªÆôÒøÏä×ÓµÄ´ÎÊý ÓÃÓÚÌá¸ß¼«Æ·¸ÅÂÊ
TASK_USE_JIN_BOX = 949;     --Íæ¼Ò¿ªÆô½ðÏä×ÓµÄ´ÎÊý ÓÃÓÚÌá¸ß¼«Æ·¸ÅÂÊ
TASK_QIXING_EXCHANGE = 950;		--¼ÇÂ¼Íæ¼ÒÓÃ½­É½ÆßÐÇ°é¾ýÔÂ»»È¡½±ÀøµÄ´ÎÊý
--==============µØÍ¼ÈÎÎñ±äÁ¿===============================================	
MAP_NPC_INDEX = 1;
MAP_ACTION_INDEX = 2;
MAP_NPC_CHAT_TIME = 3;
--===============ÁÙÊ±±äÁ¿===================================================
TT_MAIN_RES = 70;				--¼ÇÂ¼ËùÌí¼ÓµÄÖ÷ÁÏ
TT_SUB_RES = 71;				--¼ÇÂ¼ËùÌí¼ÓµÄ¸±ÁÏ
TT_FIRE_SEED = 72;				--¼ÇÂ¼ËùÌí¼ÓµÄÈ¼ÁÏ
TT_AWARD_STATE = 73;			--¼ÇÂ¼Íæ¼ÒÉèÖÃ½±ÀøµÄÇé¿ö
TT_TIMER_LOOP = 74;				--¼ÇÂ¼Íæ¼Ò´¥·¢Æ÷µ±Ç°Ñ­»·Ê£Óà´ÎÊý
TT_FIREWORKS_MAPID = 75;		--¼ÇÂ¼Íæ¼Ò·ÅµÄÑÌ»ðµÄÎ»ÖÃµÄµØÍ¼ID	
TT_FIREWORKS_MAPX = 76;			--¼ÇÂ¼Íæ¼Ò·ÅµÄÑÌ»ðµÄÎ»ÖÃµÄµØÍ¼X×ø±ê
TT_FIREWORKS_MAPY = 77;			--¼ÇÂ¼Íæ¼Ò·ÅµÄÑÌ»ðµÄÎ»ÖÃµÄµØÍ¼Y×ø±ê
TT_FIREWORKS_TIME = 78;			--¼ÇÂ¼Íæ¼Ò·ÅÑÌ»ðÊ±µÄÊ±¼ä
TT_FIREWORKS_INDEX = 79;		--¼ÇÂ¼Íæ¼Ò·ÅµÄÑÌ»ðµÄNPCË÷Òý

--==========================================================================
CUTE_BOSS_COUNT = 50;			--´óBOSSËÀºóÕÐµÄÐ¡BOSSÊýÄ¿
BEST_TEMP = 180;				--È¡³öÔÂ±ýµÄ×î¼ÑÎÂ¶È
COOKING_TIME = 5*60;			--ÕôºÃÔÂ±ýËùÐèµÄÊ±¼ä

TIMER_LOOP = 9;				--Ê±¼ä´¥·¢Æ÷Ö´ÐÐ´ÎÊý£¬Ö´ÐÐ9´Î²Å»á¸ø10´Î½±Àø

GOOD_AWARD = 100;					--½±Àø1ËùÐèÌìÊý
BETTER_AWARD = 300;				--½±Àø2ËùÐèÌìÊý
BEST_AWARD = 600;				--½±Àø3ËùÐèÌìÊý

DISTANCE = 20;					--Òª»ñµÃ½¡¿µ¾­Ñé£¬ÄÇÃ´ÓëÑÌ»ðµÄ¾àÀë²»ÄÜ´óÓÚÕâ¸ö£¬µ¥Î»ÊÇNewWorldÖÐËùÊ¹ÓÃµÄµ¥Î»

MAX_MOONCAKE_COUNT = 50;		--Ò»¸ö³ÇÊÐ×î¶à¿É·¢·ÅµÄÔÂ±ýÊýÁ¿

BOX_PROB_INCREASE = 0.05;   --¿ªÏä×Ó¼«Æ·¸ÅÂÊµÄÌá¸ßÁ¿
--===========================================================================
TRIGGER_TIMER = 3;				--Ê±¼ä´¥·¢Æ÷ID			
TRIGGER_LOGOUT = 402;			--µÇ³ö´¥·¢Æ÷ID
TRIGGER_LOGIN = 403;			--µÇÂ½´¥·¢Æ÷ID
TRIGGER_TIMER_CID = 54;			--Ê±¼ä´¥·¢Æ÷×Ô¶¨ÒåID
TRIGGER_LOGOUT_CID = 55;		--µÇ³ö´¥·¢Æ÷×Ô¶¨ÒåID
TRIGGER_LOGIN_CID = 56;			--µÇÂ½´¥·¢Æ÷×Ô¶¨ÒåID
--============================================================================
NEW_CEHUA_LIFETIME = 600;--ÐÂ²ß»®´æÔÚÊ±¼ä£¬10·ÖÖÓ

--ÎäÁÖÃË´¦½±Àø	 
tWuLinAward = {
		 --½±ÀøÒ»(¾­Ñé£ºÍò)  ¶þ£¨Ïä×Ó£©  Èý£¨Ô¿³×£©    ½±ÀøËÄid,¸öÊý,¸ÅÂÊ    ½±ÀøÎå......
	[1]={100,{"Hép Ngäc Bµi Huy Hoµng",2,0,1076,3,100},{"Ch×a Khãa Ngäc Huy Hoµng",2,0,1072,1,3},{"Hép §ång Bµi Huy Hoµng",2,0,1077,3,7500},{"Ch×a Khãa §ång Huy Hoµng",2,0,1073,1,889},{"Hép Ng©n Bµi Vinh Dù",2,0,1078,1,1500},{"Ch×a Khãa B¹c Vinh Dù",2,0,1074,1,10},{"Hép Kim Bµi Vinh Dù",2,0,1079,1,100},{"Ch×a Khãa Vµng Vinh Dù",2,0,1075,1,1}}, 
	[2]={150,{"Hép Ngäc Bµi Huy Hoµng",2,0,1076,4,100},{"Ch×a Khãa Ngäc Huy Hoµng",2,0,1072,2,4},{"Hép §ång Bµi Huy Hoµng",2,0,1077,4,7500},{"Ch×a Khãa §ång Huy Hoµng",2,0,1073,1,889},{"Hép Ng©n Bµi Vinh Dù",2,0,1078,1,1500},{"Ch×a Khãa B¹c Vinh Dù",2,0,1074,1,10},{"Hép Kim Bµi Vinh Dù",2,0,1079,1,100},{"Ch×a Khãa Vµng Vinh Dù",2,0,1075,1,1}},
	[3]={200,{"Hép Ngäc Bµi Huy Hoµng",2,0,1076,6,100},{"Ch×a Khãa Ngäc Huy Hoµng",2,0,1072,3,6},{"Hép §ång Bµi Huy Hoµng",2,0,1077,5,7500},{"Ch×a Khãa §ång Huy Hoµng",2,0,1073,2,889},{"Hép Ng©n Bµi Vinh Dù",2,0,1078,1,1500},{"Ch×a Khãa B¹c Vinh Dù",2,0,1074,1,10},{"Hép Kim Bµi Vinh Dù",2,0,1079,1,100},{"Ch×a Khãa Vµng Vinh Dù",2,0,1075,1,1}}	 
	}

--±¦Ïä½±Àø
tAboutBoxIB = {--Ç°ÃæÎª±ØÈ»»ñµÃ£¬ºóÃæÎª¸ÅÂÊ»ñµÃ
	{{"<color=yellow>1<color> thÎ kû niÖm JX2 trßn 3 n¨m","CÊp 1-5 ngÉu nhiªn <color=yellow>1<color> Linh th¹ch"},{"C¶i ®á","Hép §ång Bµi Huy Hoµng","Thiªn Thêi Chó Gi¶i ","Ngò Hµnh MËt tÞch","1 Tµng KiÕm B¶o R­¬ng","Viªm Hoµng ThiÕt Hån"}},
	{{"<color=yellow>2<color> thÎ kû niÖm JX2 trßn 3 n¨m","CÊp 1-6 ngÉu nhiªn <color=yellow>1<color> Linh th¹ch"},{"MËt hµm s­ m«n","Hép Ng©n Bµi Vinh Dù","Thiªn Thêi Chó Gi¶i ","Ngò Hµnh MËt tÞch","1 Tµng KiÕm B¶o R­¬ng","Hiªn Viªn ChiÕn","Viªm Hoµng ThiÕt Hån"}},
	{{"<color=yellow>50<color> thÎ kû niÖm JX2 trßn 3 n¨m"},{"CÊp 6-7 ngÉu nhiªn <color=yellow>1<color> Linh th¹ch","MËt tÞch L¨ng Ba Vi Bé","§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","Hép Kim Bµi Vinh Dù","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu","Viªm Hoµng ThiÕt Hån"}},
	{{"<color=yellow>300<color> thÎ kû niÖm JX2 trßn 3 n¨m"},{"CÊp 7 ngÉu nhiªn <color=yellow>3<color> Linh th¹ch","§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","Nguyªn cuèn mËt tÞch L¨ng Ba Vi Bé","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu","Hoµng §Õ vò khÝ","Viªm Hoµng ThiÕt Hån"}}
	}
	
--±¦Ïä½±Àø£¨ÊÕ·ÑÇø£©
tAboutBox = {--Ç°ÃæÎª±ØÈ»»ñµÃ£¬ºóÃæÎª¸ÅÂÊ»ñµÃ
	{{"<color=yellow>1<color> thÎ kû niÖm JX2 trßn 3 n¨m","CÊp 1-5 ngÉu nhiªn <color=yellow>1<color> Linh th¹ch"},{"C¶i ®á","Hép §ång Bµi Huy Hoµng","Thiªn Thêi Chó Gi¶i ","Ngò Hµnh MËt tÞch","1 Tµng KiÕm B¶o R­¬ng","Viªm Hoµng ThiÕt Hån"}},
	{{"<color=yellow>2<color> thÎ kû niÖm JX2 trßn 3 n¨m","CÊp 1-6 ngÉu nhiªn <color=yellow>1<color> Linh th¹ch"},{"MËt hµm s­ m«n","Hép Ng©n Bµi Vinh Dù","Thiªn Thêi Chó Gi¶i ","Ngò Hµnh MËt tÞch","1 Tµng KiÕm B¶o R­¬ng","Hiªn Viªn ChiÕn","Viªm Hoµng ThiÕt Hån"}},
	{{"<color=yellow>50<color> thÎ kû niÖm JX2 trßn 3 n¨m"},{"CÊp 6-7 ngÉu nhiªn <color=yellow>1<color> Linh th¹ch","MËt tÞch L¨ng Ba Vi Bé","§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","Hép Kim Bµi Vinh Dù","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu","Viªm Hoµng ThiÕt Hån"}},
	{{"<color=yellow>300<color> thÎ kû niÖm JX2 trßn 3 n¨m"},{"CÊp 7 ngÉu nhiªn <color=yellow>3<color> Linh th¹ch","§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch","Nguyªn cuèn mËt tÞch L¨ng Ba Vi Bé","Hiªn Viªn ChiÕn","Hiªn Viªn §Êu","Hoµng §Õ vò khÝ","Viªm Hoµng ThiÕt Hån"}}
	}	

tNewCehua = {--Ä£°åÃû npcÃû µØ·½ id 
	{"Vò n÷ Ba T­","Viªn L­u L­u","Thóy Yªn",404,{1550,1630,1648},{2746,2736,2947}},
	{"Chñ cÇm ®å Trung Nguyªn","TiÓu C­¬ng","C«n L«n",509,{1452,1551,1576},{3363,3243,3107}},
	{"Th­ sinh","Vò c«ng tö","Quang Minh ®Ønh",508,{1631,1558,1641},{3031,3157,3236}}
	}

--===========================================================================================
tSex = {"ThiÕu hiÖp","N÷ hiÖp "};
--tBossInfoÓëtItemInfoÓëtBossPos±ØÐë¶ÔÓ¦,Ë³Ðò²»ÄÜÂÒ
tBossInfo = {	--BOSSÄ£°åÃû,Ð¡BOSSÄ£°åÃû,	Ë¢¹ÖÊ±¼ä
		[1] = {"ThiÕt D­¬ng","TiÓu ThiÕt D­¬ng","ThiÕt D­¬ng","Thuéc h¹ cña ThiÕt D­¬ng",21},
		[2] = {"¢m Minh","TiÓu ¢m Minh","TiÓu BiÖn Nhi","Thuéc h¹ cña TiÓu BiÖn Nhi",19},
		[3] = {"HÇu ThuÉn","TiÓu HÇu ThuÉn","KhØ mËp","Thuéc h¹ cña KhØ mËp",16},
		[4] = {"B¸t Hïng","TiÓu B¸t Hïng","B¸t Hïng","Thuéc h¹ cña B¸t Hïng",21},
		[5] = {"H¹ Thiªn","TiÓu H¹ Thiªn","TiÓu Thiªn Thiªn","Thuéc h¹ cña TiÓu Thiªn Thiªn",19},
		[6] = {"Quang V« Cùc","TiÓu Quang V« Cùc","Cöu TuyÖt KiÕm KhÝ","Thuéc h¹ cña Cöu TuyÖt KiÕm KhÝ",21},
		[7] = {"A Vi","TiÓu A Vi","TrÇn C«ng tö","Thuéc h¹ cña TrÇn C«ng tö",16},
		}
		
tItemInfo = {
		[1] = {"D­¬ng Häa PhiÕn",2,0,506},
		[2] = {"Yªn §¹i",2,0,509},
		[3] = {"Háa ChiÕt Tö",2,0,508},
		[4] = {"Tróc M·",2,0,511},
		[5] = {"Méc hµi",2,0,510},
		[6] = {"ThuËt Cöu Ch­¬ng",2,0,513},
		[7] = {"Loan Phông Ngäc Béi",2,0,512},
		[8] = {"D­¬ng Häa C¬",2,0,507},	--07ÄêÈý½Ú²»ÓÃÁË
		[9] = {"Thiªn Th¹ch Chïy",2,0,514},	--07ÄêÈý½Ú²»ÓÃÁË
		[10] = {"Kh¸nh §iÓn diÖm háa",2,0,515},
		[11] = {"H­íng dÉn",2,0,1030},
		[12] = {"Bao thuèc cña NguyÖt L­îng Thè",0,102,41},
		[13] = {"H»ng Nga NguyÖt Vò §¸i",0,102,42},
		[14] = {"HËu NghÖ L¹c NhËt Hoµn",0,102,43},
		[15] = {"Hép Ngäc Bµi Huy Hoµng",2,0,1076},
		[16] = {"Hép §ång Bµi Huy Hoµng",2,0,1077},
		[17] = {"Hép Ng©n Bµi Vinh Dù",2,0,1078},
		[18] = {"Hép Kim Bµi Vinh Dù",2,0,1079},
		[19] = {"ThÎ kû niÖm mõng Vâ L©m trßn 2 n¨m",2,0,1081},
		[20] = {"Ch×a Khãa Ngäc Huy Hoµng",2,0,1072},
		[21] = {"Ch×a Khãa §ång Huy Hoµng",2,0,1073},
		[22] = {"Ch×a Khãa B¹c Vinh Dù",2,0,1074},
		[23] = {"Ch×a Khãa Vµng Vinh Dù",2,0,1075},
		[24] = {"Bång Lai Tiªn Lé",2,0,109},
		[25] = {"Viªm Hoµng ThiÕt Hån",2,1,1146},
		[26] = {"C¶i ®á",2,1,1090},
		[27] = {"Thiªn Thêi Chó Gi¶i ",2,1,3210},
		[28] = {"Ngò Hµnh MËt tÞch",0,107,155},
		[29] = {"MËt tÞch ngò hµnh toµn tËp",0,107,157},
		[30] = {"L¨ng Ba Vi Bé",0,112,78},
		[31] = {"L¨ng Ba Vi Bé toµn tËp",0,112,158},
		[32] = {"MËt hµm s­ m«n",2,1,1020},
		[33] = {"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n",2,1,1059},
		[34] = {"B¶o r­¬ng Tµng KiÕm y gi¸p",2,1,1060},
		[35] = {"B¶o r­¬ng Tµng KiÕm hoa khè",2,1,1061},
		[36] = {"B¶o r­¬ng Tµng KiÕm trang søc",2,1,1062},
		[37] = {"B¶o r­¬ng Tµng KiÕm vò khÝ",2,1,1063},
		[38] = {"§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch",2,1,1067},
		[39] = {"Thiªn Th¹ch linh th¹ch",2,1,1068}
		}

tMaterial = {
		[1] = {"Ng.liÖu chÝnh 1",2,0,518},
		[2] = {"Ng.liÖu chÝnh 2",2,0,519},
		[3] = {"Ng.liÖu chÝnh 3",2,0,520},
		[4] = {"Ng.liÖu phô 1",2,0,521},
		[5] = {"Ng.liÖu phô 2",2,0,522},
		[6] = {"Ng.liÖu phô 3",2,0,523},
		[7] = {"Than nhiÖt ®é cao",2,0,524},
		[8] = {"Cñi nhiÖt ®é thÊp",2,0,525},
		[9] = {"Lß n­íng b¸nh Trung Thu",2,0,517},
		}

tBossPos = {
		[1] = {"B¾c Thµnh §«",308,1461,3156},
		[2] = {"Nam Thµnh §«",304,1494,2986},
		[3] = {"B¾c TuyÒn Ch©u",108,1521,3060},	
		[4] = {"T©y TuyÒn Ch©u",105,1545,3008},	
		[5] = {"B¾c Phông T­êng",504,1487,3006},
		[6] = {"Long M«n trÊn",507,1682,3360},
		[7] = {"Phông T­êng phñ Nam ",501,1436,2952},
		}

tMoonCake = {
		[1] = {"B¸nh Trung Thu Giang S¬n",2,0,1000},
		[2] = {"B¸nh Trung Thu ch©n gµ Giang S¬n",2,0,1002},
		[3] = {"B¸nh Trung Thu thÞt mÆn Giang S¬n",2,0,1003},
		[4] = {"B¸nh Trung Thu Kim Hoa Giang S¬n",2,0,1004},
		[5] = {"B¸nh Trung Thu Liªn Dung Giang S¬n",1,0,231},
		[6] = {"B¸nh Trung Thu Nh©n T¸o Giang S¬n",1,0,232},
		[7] = {"B¸nh Trung Thu Nh©n §Ëu Giang S¬n",1,0,233},
		[8] = {"B¸nh Trung Thu Xoµi Giang S¬n",2,0,1005},
		[9] = {"B¸nh Trung Thu SÇu Riªng Giang S¬n",2,0,1006},
		[10] = {"B¸nh Trung Thu Xoµi Giang S¬n",2,0,1007},	
		[11] = {"ThÞnh ThÕ Mai Hµn H­¬ng NguyÖt",2,0,1008},	
		[12] = {"ThÞnh ThÕ B¹ch Ngäc Song NguyÖt",2,0,1009},	
		[13] = {"ThÞnh ThÕ Kú H­¬ng Ngò Nh©n NguyÖt",2,0,1010},	
		[14] = {"ThÞnh ThÕ B¸ch Hoa ThËp CÈm NguyÖt",2,0,1011},	
		[15] = {"ThÞnh ThÕ ThÊt Tinh B¹n Qu©n NguyÖt",2,0,1012},	
		[16] = {"ThÞnh ThÕ H»ng Nga Thñy Tinh NguyÖt",2,0,1013},
		[17] = {"B¸nh Trung Thu Giang S¬n Mü VÞ ",2,0,1001},		
		[18] = {"B¸nh trung thu n­íng",2,0,1014},	
		[19] = {"B¸nh trung thu khÐt",2,0,1015},	
		}

tMappingTemp = {	--ÎÂ¶ÈÇø¼ä
		[1] = 1,
		[2] = 31,
		[3] = 61,
		[4] = 121,
		[5] = 151,
		[6] = 176,
		[7] = 180,
		[8] = 181,
		[9] = 186,
		[10] = 211,
		[11] = 241,
		[12] = 301,
		[13] = 361,
		[14] = 451,
		}

--ÏÂÃæÊÇÒ»¸öÈýÎ¬Êý×é£¬µÚÒ»Î¬ÎªÖ÷ÁÏÀàÐÍ£¬µÚ¶þÎ¬Îª¸¨ÁÏÀàÐÍ£¬µÚÈýÎ¬ÎªÔÂ±ý»úÂÊ
tMappingMoonCake = {	
	[1] = {
		[1] = {	--ÆæÊýÏîÊÇÔÂ±ýË÷Òý£¬Å¼ÊýÏîÊÇµÃµ½Ä³¸öÔÂ±ýµÄ»úÂÊ£¬Èç{17,75,2,100}±íÊ¾ÓÐ75£¥»úÂÊµÃµ½ÔÂ±ý17,ÓÐ£¨100£­75£©£¥µÄ»úÂÊµÃµ½ÔÂ±ý2
				{1,100},{17,50,1,100},{17,100},{17,75,2,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{17,25,2,100},{2,40,12,90,15,100},{12,50,15,80,16,100},{2,40,12,90,15,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{17,25,2,100},{17,75,2,100},{17,100},{17,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{18,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		[2] = {
				{1,100},{17,50,1,100},{17,100},{17,75,3,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{17,25,3,100},{3,40,12,90,15,100},{12,50,15,80,16,100},{3,40,12,90,15,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{17,25,3,100},{17,75,3,100},{17,100},{17,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{18,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		[3] = {
				{1,100},{17,50,1,100},{17,100},{17,75,4,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{17,25,4,100},{4,40,12,90,15,100},{12,50,15,80,16,100},{4,40,12,90,15,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{17,25,4,100},{17,75,4,100},{17,100},{17,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{18,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		},
	[2] = {
		[1] = {
				{1,100},{1,100},{1,100},{1,75,5,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{1,25,5,100},{5,50,13,100},{13,100},{5,50,13,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{1,25,5,100},{1,75,5,100},{1,100},{1,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{19,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		[2] = {
				{1,100},{1,100},{1,100},{1,75,6,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{1,25,6,100},{6,50,13,100},{13,100},{6,50,13,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{1,25,6,100},{1,75,6,100},{1,100},{1,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{19,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		[3] = {
				{1,100},{1,100},{1,100},{1,75,7,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{1,25,7,100},{7,50,13,100},{13,100},{7,50,13,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{1,25,7,100},{1,75,7,100},{1,100},{1,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{19,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				}
		},
	[3] = {
		[1] = {
				{1,100},{1,100},{1,100},{1,75,8,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{1,25,8,100},{8,50,14,100},{14,100},{8,50,14,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{1,25,8,100},{1,75,8,100},{1,100},{1,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{19,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		[2] = {
				{1,100},{1,100},{1,100},{1,75,9,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{1,25,9,100},{9,50,14,100},{14,100},{9,50,14,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{1,25,9,100},{1,75,9,100},{1,100},{1,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{19,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		[3] = {
				{1,100},{1,100},{1,100},{1,75,10,100},	--ÎÂ¶ÈÇø¼ä1£­4
				{1,25,10,100},{10,50,14,100},{14,100},{10,50,14,100},	--ÎÂ¶ÈÇø¼ä5£­8
				{1,25,10,100},{1,75,10,100},{1,100},{1,33,18,100},	--ÎÂ¶ÈÇø¼ä9£­12
				{19,100},{19,100},	--ÎÂ¶ÈÇø¼ä13£­14
				},
		},
	}

tSexName = {"ThiÕu hiÖp","N÷ hiÖp "};

tWeapon = {
	{"V¹n NhÉn ch­a gi¸m ®Þnh",2,1,375},
	{"Háa Tinh ch­a gi¸m ®Þnh",2,1,376},
	{"LiÖt DiÖm ch­a gi¸m ®Þnh",2,1,377},
	{"M·n Thiªn Hoa Vò ch­a gi¸m ®Þnh",2,1,378},
	{"Cæ §Ýnh ch­a gi¸m ®Þnh",2,1,379},
	{"Hi Nh©n CÇm ch­a gi¸m ®Þnh",2,1,380},
	{"ThÇn Hµnh ch­a gi¸m ®Þnh",2,1,381},
	{"A La H¸n Tr­îng ch­a gi¸m ®Þnh",2,1,382},
	{"§¹i Hµo L«i Th­¬ng ch­a gi¸m ®Þnh",2,1,383},
	{"ThÇn Cung ch­a gi¸m ®Þnh",2,1,384},
	{"M·nh Hæ ch­a gi¸m ®Þnh",2,1,385},
	{"L¨ng Phong ch­a gi¸m ®Þnh",2,1,386},
}

tHuangDiWeapon = 
{
	[0] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802},{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804},{"Hiªn Viªn Giíi Tö Kim",0,1,8805},{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807},{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809},{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},{"Hiªn Viªn Sinh Tö Bót",0,9,8811},{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},{"Hiªn Viªn Khai Thiªn Cung",0,4,8813},{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
	[1] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802},{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803},{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804}},
	[2] = {{"Hiªn Viªn To¸i Vò §ao",0,3,8801},{"Hiªn Viªn To¸i Vò C«n",0,5,8802}},
	[3] = {{"Hiªn Viªn Cöu Nh­ Tr­îng",0,8,8803}},
	[4] = {{"Hiªn Viªn H¹o Nhiªn Thñ",0,0,8804}},
	[5] = {{"Hiªn Viªn Giíi Tö Kim",0,1,8805}},
	[6] = {{"Hiªn Viªn Giíi Tö Kim",0,1,8805}},
	[7] = {{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806},{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807}},
	[8] = {{"Hiªn Viªn Tö Tinh KiÕm",0,2,8806}},
	[9] = {{"Hiªn Viªn Phông Hoµng CÇm",0,10,8807}},
	[10] = {{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808},{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809}},
	[11] = {{"Hiªn Viªn Ngò Nh¹c Thñ",0,0,8808}},
	[12] = {{"Hiªn Viªn Ph¸ Thiªn C«n",0,5,8809}},
	[13] = {{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810},{"Hiªn Viªn Sinh Tö Bót",0,9,8811}},
	[14] = {{"Hiªn Viªn Hång Qu©n KiÕm",0,2,8810}},
	[15] = {{"Hiªn Viªn Sinh Tö Bót",0,9,8811}},
	[16] = {{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812},{"Hiªn Viªn Khai Thiªn Cung",0,4,8813}},
	[17] = {{"Hiªn Viªn Ph¸ Qu©n Th­¬ng",0,6,8812}},
	[18] = {{"Hiªn Viªn Khai Thiªn Cung",0,4,8813}},
	[19] = {{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814},{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
	[20] = {{"Hiªn Viªn ¢m D­¬ng NhÉn",0,7,8814}},
	[21] = {{"Hiªn Viªn U Minh Tr¶o",0,11,8815}},
}

tbHuangDiRing1 = 
{
	[0] = {{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn ChiÕn",0,102,8805},{"Hiªn Viªn ChiÕn",0,102,8807},{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn ChiÕn",0,102,8811},{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn ChiÕn",0,102,8815},{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn ChiÕn",0,102,8819},{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn ChiÕn",0,102,8823},{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn ChiÕn",0,102,8827}},
	[1] = {{"Hiªn Viªn ChiÕn",0,102,8801},{"Hiªn Viªn ChiÕn",0,102,8803},{"Hiªn Viªn ChiÕn",0,102,8805}},
	[2] = {{"Hiªn Viªn ChiÕn",0,102,8801}},
	[3] = {{"Hiªn Viªn ChiÕn",0,102,8803}},
	[4] = {{"Hiªn Viªn ChiÕn",0,102,8805}},
	[5] = {{"Hiªn Viªn ChiÕn",0,102,8807}},
	[6] = {{"Hiªn Viªn ChiÕn",0,102,8807}},
	[7] = {{"Hiªn Viªn ChiÕn",0,102,8809},{"Hiªn Viªn ChiÕn",0,102,8811}},
	[8] = {{"Hiªn Viªn ChiÕn",0,102,8809}},
	[9] = {{"Hiªn Viªn ChiÕn",0,102,8811}},
	[10] = {{"Hiªn Viªn ChiÕn",0,102,8813},{"Hiªn Viªn ChiÕn",0,102,8815}},
	[11] = {{"Hiªn Viªn ChiÕn",0,102,8813}},
	[12] = {{"Hiªn Viªn ChiÕn",0,102,8815}},
	[13] = {{"Hiªn Viªn ChiÕn",0,102,8817},{"Hiªn Viªn ChiÕn",0,102,8819}},
	[14] = {{"Hiªn Viªn ChiÕn",0,102,8817}},
	[15] = {{"Hiªn Viªn ChiÕn",0,102,8819}},
	[16] = {{"Hiªn Viªn ChiÕn",0,102,8821},{"Hiªn Viªn ChiÕn",0,102,8823}},
	[17] = {{"Hiªn Viªn ChiÕn",0,102,8821}},
	[18] = {{"Hiªn Viªn ChiÕn",0,102,8823}},
	[19] = {{"Hiªn Viªn ChiÕn",0,102,8825},{"Hiªn Viªn ChiÕn",0,102,8827}},
	[20] = {{"Hiªn Viªn ChiÕn",0,102,8825}},
	[21] = {{"Hiªn Viªn ChiÕn",0,102,8827}},
}

tbHuangDiRing2 = 
{
	[0] = {{"Hiªn Viªn §Êu",0,102,8802},{"Hiªn Viªn §Êu",0,102,8804},{"Hiªn Viªn §Êu",0,102,8806},{"Hiªn Viªn §Êu",0,102,8808},{"Hiªn Viªn §Êu",0,102,8810},{"Hiªn Viªn §Êu",0,102,8812},{"Hiªn Viªn §Êu",0,102,8814},{"Hiªn Viªn §Êu",0,102,8816},{"Hiªn Viªn §Êu",0,102,8818},{"Hiªn Viªn §Êu",0,102,8820},{"Hiªn Viªn §Êu",0,102,8822},{"Hiªn Viªn §Êu",0,102,8824},{"Hiªn Viªn §Êu",0,102,8826},{"Hiªn Viªn §Êu",0,102,8828}},
	[1] = {{"Hiªn Viªn §Êu",0,102,8802},{"Hiªn Viªn §Êu",0,102,8804},{"Hiªn Viªn §Êu",0,102,8806}},
	[2] = {{"Hiªn Viªn §Êu",0,102,8802}},
	[3] = {{"Hiªn Viªn §Êu",0,102,8804}},
	[4] = {{"Hiªn Viªn §Êu",0,102,8806}},
	[5] = {{"Hiªn Viªn §Êu",0,102,8808}},
	[6] = {{"Hiªn Viªn §Êu",0,102,8808}},
	[7] = {{"Hiªn Viªn §Êu",0,102,8810},{"Hiªn Viªn §Êu",0,102,8812}},
	[8] = {{"Hiªn Viªn §Êu",0,102,8810}},
	[9] = {{"Hiªn Viªn §Êu",0,102,8812}},
	[10] = {{"Hiªn Viªn §Êu",0,102,8814},{"Hiªn Viªn §Êu",0,102,8816}},
	[11] = {{"Hiªn Viªn §Êu",0,102,8814}},
	[12] = {{"Hiªn Viªn §Êu",0,102,8816}},
	[13] = {{"Hiªn Viªn §Êu",0,102,8818},{"Hiªn Viªn §Êu",0,102,8820}},
	[14] = {{"Hiªn Viªn §Êu",0,102,8818}},
	[15] = {{"Hiªn Viªn §Êu",0,102,8820}},
	[16] = {{"Hiªn Viªn §Êu",0,102,8822},{"Hiªn Viªn §Êu",0,102,8824}},
	[17] = {{"Hiªn Viªn §Êu",0,102,8822}},
	[18] = {{"Hiªn Viªn §Êu",0,102,8824}},
	[19] = {{"Hiªn Viªn §Êu",0,102,8826},{"Hiªn Viªn §Êu",0,102,8828}},
	[20] = {{"Hiªn Viªn §Êu",0,102,8826}},
	[21] = {{"Hiªn Viªn §Êu",0,102,8828}},
}

--´ò¿ªËÄ¸öÏä×ÓµÄ½±Àø
tBoxAward = {
	{{"ThÎ kû niÖm Vâ L©m 2 trßn 2 n¨m",2,0,1081,1},{1,4,70,1,4,100},{"NguyÖt Hoa ",2,1,2002,1,10},{"Hép §ång Bµi Huy Hoµng",2,0,1077,1,1000},{"Hiªn Viªn ChiÕn",5}},
	{{"ThÎ kû niÖm Vâ L©m 2 trßn 2 n¨m",2,0,1081,5},{1,5,70,1,5,100},{"NguyÖt Hoa ",2,1,2002,1,50},{"Hép Ng©n Bµi Vinh Dù",2,0,1078,1,500},{"Hiªn Viªn ChiÕn",10}},
	{{"ThÎ kû niÖm Vâ L©m 2 trßn 2 n¨m",2,0,1081,50},{3,5,70,3,6,100},{"NguyÖt Hoa ",2,1,2002,2,200},{"Hép Kim Bµi Vinh Dù",2,0,1079,1,500},{"Hiªn Viªn ChiÕn",100,"Hiªn Viªn §Êu",200}},
	{{"ThÎ kû niÖm Vâ L©m 2 trßn 2 n¨m",2,0,1081,100},{4,5,70,4,7,100},{"NguyÖt Hoa ",2,1,2002,3,500},{"Hiªn Viªn ChiÕn",1000,"Hiªn Viªn §Êu",2000,"Hoµng §Õ vò khÝ",3000}}
	}

--Ïä×Ó¼«Æ·¸ÅÂÊÓë³£¹æ¸ÅÂÊ
tBoxProb = {{20,950000},{100,950000},{10000,950000},{150000,1000000}};

--Ïä×Ó³£¹æ¸ÅÂÊ·Ö²¼ ËÄÖÖÏä×Ó
tBoxChangGui = {{800,990,991,1000},{800,990,995,1000},{960,980,1000},{700,850,1000}};

--ÌúÏä×Ó ¶ÔÓ¦ÉÏ±í¸ÅÂÊ
tBoxTie = {{{"C¶i ®á",2,1,1090}},{{"Thiªn Thêi Chó Gi¶i ",2,1,3210}},{{"Ngò Hµnh MËt tÞch",0,107,155}},{{"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n",2,1,1059},{"B¶o r­¬ng Tµng KiÕm y gi¸p",2,1,1060},{"B¶o r­¬ng Tµng KiÕm hoa khè",2,1,1061},{"B¶o r­¬ng Tµng KiÕm trang søc",2,1,1062},{"B¶o r­¬ng Tµng KiÕm vò khÝ",2,1,1063}}};

--Í­Ïä×Ó
tBoxTong = {{{"MËt hµm s­ m«n",2,1,1020}},{{"Thiªn Thêi Chó Gi¶i ",2,1,3210}},{{"Ngò Hµnh MËt tÞch",0,107,155}},{{"B¶o r­¬ng Tµng KiÕm ®Çu qu¸n",2,1,1059},{"B¶o r­¬ng Tµng KiÕm y gi¸p",2,1,1060},{"B¶o r­¬ng Tµng KiÕm hoa khè",2,1,1061},{"B¶o r­¬ng Tµng KiÕm trang søc",2,1,1062},{"B¶o r­¬ng Tµng KiÕm vò khÝ",2,1,1063}}};

function Get_3festival_State()
	local nDate = tonumber(date("%y%m%d"));
	if nDate >= 080911 and nDate <= 081007 then	--9ÔÂ11ÖÁ10ÔÂ7ÈÕ
		return 1;
	else
		return 0;
	end;
end;
--ÅÐ¶ÏÔÚÄÄÌ¨·þÎñÆ÷ÉÏ£¬ÔÚÈªÖÝµÄ»°¾Í·µ»Ø1£¬ÔÚãê¾©µÄ»°¾Í·µ»Ø2£¬ÔÚ³É¶¼µÄ»°¾Í·µ»Ø3£¬ÔÚÆäËü·þÎñÆ÷Ôò·µ»Ø100
function Get_Server_Index()
	if SubWorldID2Idx(100) >= 0 then
		return 1;
	elseif SubWorldID2Idx(200) >= 0 then
		return 2;
	elseif SubWorldID2Idx(300) >= 0 then
		return 3;
	else
		return 100;
	end;
end;
--µÃµ½Íæ¼ÒÓëÄ³Ò»×ø±êµÄ¾àÀë
function Get_Distance(nX,nY)
	local _,nPosX,nPosY = GetWorldPos();
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--µÃµ½Íæ¼ÒÉèÖÃ½±ÀøµÄÇé¿ö£¬ÏÂÃæÊÇ·µ»ØÖµËù¶ÔÓ¦µÄÇé¿ö£º
--  0:±íÊ¾»¹Ã»½øÐÐ¹ý½±ÀøÉèÖÃ
--  1:±íÊ¾ÉèÖÃ½±ÀøÀàÐÍÎª1
-- 10:±íÊ¾ÉèÖÃ½±ÀøÀàÐÍÎª2
-- 11:±íÊ¾ÉèÖÃ½±ÀøÀàÐÍÎª3
--100:±íÊ¾ÒÑÁìÈ¡¹ý½±Àø
function Get_Award_State()
	local nExtPoint0 = GetExtPoint(0);
	local nResult = 0;
	for i=3,5 do 
		nResult = nResult + GetBit(nExtPoint0,i)*(10^(i-3));
	end;
	return nResult;
end;
--¸ù¾ÝÖ÷ÁÏ¡¢¸¨ÁÏºÍÎÂ¶È¸øÒ»¸öÔÂ±ýÍæ¼Ò
function Give_MoonCake(nMainRes,nSubRes,nCurTemp)
	if nCurTemp <= 0 or nMainRes > 3 or nMainRes < 1 or nSubRes > 3 or nSubRes < 1 then
		WriteLog("[Lçi Tam tiÕt liªn th«ng]: Lçi tham sè nhËp vµo trong hµm sè Give_MoonCake, tham sè nhËp vµo lµ:"..nMainRes..","..nSubRes..","..nCurTemp);
		return 0;
	end;
	local nCakeIndex = 0;
	local nRand = random(1,100);
	local nTempIndex = 0;
	local nRetCode = 0;
	for i=getn(tMappingTemp),1,-1 do
		if nCurTemp >= tMappingTemp[i] then
			nTempIndex = i;	--µÃµ½ÎÂ¶ÈÇø¼ä
			break;
		end;
	end;
	local nTabSize = getn(tMappingMoonCake[nMainRes][nSubRes][nTempIndex]);
	if mod(nTabSize,2) ~= 0 then
		WriteLog("[Lçi Tam tiÕt liªn th«ng]: Lo¹i b¸nh lín nhá table lµ sè lÎ");
		nCakeIndex = 1;
	else
		for i=1,nTabSize/2 do
			if nRand <= tMappingMoonCake[nMainRes][nSubRes][nTempIndex][i*2] then
				nCakeIndex = tMappingMoonCake[nMainRes][nSubRes][nTempIndex][i*2-1];
				break;
			end;
		end;
	end;
	nRetCode = AddItem(tMoonCake[nCakeIndex][2],tMoonCake[nCakeIndex][3],tMoonCake[nCakeIndex][4],1);
	if nRetCode == 1 then
		Say("Khi nhiÖt ®é bÕp cña b¹n ®¹t <color=yellow>"..nCurTemp.."<color> ®é më bÕp, b¹n nhËn ®­îc 1 <color=yellow>"..tMoonCake[nCakeIndex][1].."<color>!",0);
		WriteLog("[Tam tiÕt liªn th«ng]:"..GetName().."NhËn ®­îc 1 c¸i b¸nh Trung Thu, m· sè b¸nh Trung Thu:"..nCakeIndex);
	else
		WriteLog("[Lçi Tam tiÕt liªn th«ng]:"..GetName().."Lçi trÞ quay l¹i AddItem khi nhËn b¸nh Trung Thu, trÞ sè lçi:"..nRetCode);
	end;
end;

function Msg2_LeiTai(szItemName)
	Msg2MSAll(4,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(23,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(29,GetName().."Sö dông 1	"..szItemName);
	Msg2MSAll(30,GetName().."Sö dông 1	"..szItemName);
end;

--º¯ÊýÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êý
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕý³£Ìí¼ÓÎïÆ·½øÐÐ¼ì²â
--´å³¤ 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Talk (1,"","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅÐ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
		Talk (1,"","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
		return 0
	else 
		return 1
	end
end

function nothing()

end;

