Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\tmp_task_id_def.lua")

--ÍË³öÓÎÏ·ºóµÄÖØÉúµãID,Ò²¾ÍÊÇ±¨ÃûµÄÄÇ¸öµØ·½°É
CS_RevId = 1842;
CS_RevData = 3571;

--»á³¡ÍâµÄÎ»ÖÃ
CS_OuterPos = {};
CS_OuterPos[1] = {801, 1600, 3238};

--¼ÓÈëË«·½ÕóÓªÊ±µÄÎ»ÖÃ
CS_CampPos0 = {};
CS_CampPos1 = {};
CS_CampPos2 = {};
CS_CampPos0[1] = {801, 1600, 3238};   --°×É«
CS_CampPos1[1] = {801, 1600, 3238};   --×ÏÉ«
CS_CampPos2[1] = {801, 1600, 3238};   --ÂÌÉ«
CS_CampPos0[2] = {805, 1637, 3166};   --°×É«
CS_CampPos1[2] = {805, 1637, 3166};   --×ÏÉ«
CS_CampPos2[2] = {805, 1637, 3166};   --ÂÌÉ«
CS_CampPos0[3] = {803, 1598, 3186};   --°×É«
CS_CampPos1[3] = {803, 1598, 3186};   --×ÏÉ«
CS_CampPos2[3] = {803, 1598, 3186};   --ÂÌÉ«
CS_CampPos0[4] = {810, 1607, 3227};   --°×É«
CS_CampPos1[4] = {810, 1607, 3227};   --×ÏÉ«
CS_CampPos2[4] = {810, 1607, 3227};   --ÂÌÉ«
CS_CampPos0[5] = {811, 1598, 3237};   --°×É«
CS_CampPos1[5] = {811, 1598, 3237};   --×ÏÉ«
CS_CampPos2[5] = {811, 1598, 3237};   --ÂÌÉ«
CS_CampPos0[6] = {802, 1600, 3238};   --°×É«
CS_CampPos1[6] = {802, 1600, 3238};   --×ÏÉ«
CS_CampPos2[6] = {802, 1600, 3238};   --ÂÌÉ«
CS_CampPos0[7] = {835, 1600, 3238};   --°×É«
CS_CampPos1[7] = {835, 1600, 3238};   --×ÏÉ«
CS_CampPos2[7] = {835, 1600, 3238};   --ÂÌÉ«
CS_CampPos0[8] = {836, 1600, 3238};   --°×É«
CS_CampPos1[8] = {836, 1600, 3238};   --×ÏÉ«
CS_CampPos2[8] = {836, 1600, 3238};   --ÂÌÉ«
CS_CampPos0[9] = {837, 1600, 3238};   --°×É«
CS_CampPos1[9] = {837, 1600, 3238};   --×ÏÉ«
CS_CampPos2[9] = {837, 1600, 3238};   --ÂÌÉ«
CS_CampPos0[10] = {838, 1600, 3238};   --°×É«
CS_CampPos1[10] = {838, 1600, 3238};   --×ÏÉ«
CS_CampPos2[10] = {838, 1600, 3238};   --ÂÌÉ«

--Í¨Ìì´óÀŞ 801 ³É¶¼
--ÏªÁ÷ÆÙ²¼ 810 ÈªÖİ
--ÌìÍâ·ÉÏÉ 811 ÈªÖİ
--½Åµê¿ÍÕ» 803 ³É¶¼
--É½¼äË÷ÇÅ 805 ³É¶¼
--ÀŞÕğ°Ë·½ 802 ÈªÖİ
--ÎäÁÖ´óÀŞ 835 ÏåÑô
--ÎŞË«´óÀŞ 836 ÏåÑô
--Ó¢ĞÛ´óÀŞ 837 ÑïÖİ
--Éñ±ø´óÀŞ 838 ÑïÖİ

MapTab = {};
MapTab[1]= {801, 300, "Th«ng Thiªn §¹i L«i"};
MapTab[2]= {805, 300, "S¬n gian s¸ch kiÒu"};
MapTab[3]= {803, 300, "C­íc ®iÕm kh¸ch s¹n"};
MapTab[4]= {810, 100, "Khª l­u béc bè"};
MapTab[5]= {811, 100, "Thiªn ngo¹i phi tiªn"};
MapTab[6]= {802, 100, "L«i ChÊn B¸t Ph­¬ng"};                    
MapTab[7]= {835, 350, "Vâ L©m ®¹i L«i ®µi"};
MapTab[8]= {836, 350, "V« Song ®¹i L«i ®µi"};
MapTab[9]= {837, 150, "Anh hïng ®¹i L«i ®µi"};
MapTab[10]= {838, 150, "ThÇn binh L«i ®µi"};

---------------------------Ò»°ã³£Á¿
FRAME2TIME = 18;
--ÓÎÏ·µÄ×î´óÈËÊı
MAX_MEMBER_COUNT = 100;

MAX_ROOM_COUNT = 6;     --Ã¿¸ö³ÇÊĞÄÜÓµÓĞµÄ×î´óÀŞÌ¨ÊıÁ¿

TIME_NO1 = 10; --¶¨Ê±´¥·¢Æ÷
TIME_NO2 = 11;

TIMER_1 = 20 * FRAME2TIME; -- 20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 33 * TIMER_1 ; -- 20 * 33 = 60 * 11 ½»Õ½×ÜÊ±¼äÎª11·ÖÖÓ
GO_TIME = 3 ; -- 180 ±¨ÃûÊ±¼äÎª1·ÖÖÓ

---------------------------³¡µØ³£Á¿
MS_STATE = 1;
BW_SIGN_MONEY = 2; --±¨Ãû·Ñ´æ·Å
BW_MONEY1 = 3; --Ë«·½¶Ä×¢×ÜºÏ
BW_MONEY2 = 4;
BW_TEMPMONEY = 5; --¶Ä×¢ÁÙÊ±´æ·Å
CITYID = 6; --³ÇÊĞID

BW_KEY = 7; -- 1-100000001µÄËæ»úÊı

MS_NEWSVALUE = 9; --ÈÎÎñÖĞ´æ·ÅĞÂÎÅ±äÁ¿µÄµØ·½

MS_PLAYER1ID = 10;-- Ë«·½ID
MS_PLAYER2ID = 11;

MS_ROOMINDEX = 12;

GLOBAL_NEWS_SHOW = 20;   --ÓÎÏ·¹«¸æÊÇ·ñÏÔÊ¾

--Ñº½ğÀŞÌ¨Ìí¼Ó-------------------missionv---------
MS_YAJING_NUM = 99;  --Ñº½ğÊıÄ¿¼ÇÂ¼
MS_WIN_CAMP = 98; --¼ÇÂ¼Ê¤ÀûµÄÒ»·½

MISSIONID = 4;

---------------------------ÈÎÎñ³£Á¿
MS_POS = 1900;--3¸ö

DUZHU = 1903;	--3¸öÈÎÎñ±äÁ¿£¬´æ·Å¶Ä×¢Ñ¡Ôñ£¬×¢¶î£¬KEY
SKILLENABLE = 1906;		--ÊÇ·ñÄÜ¹»Ê¹ÓÃÎä¹¦

---------------------------ÁÙÊ±ÈÎÎñ³£Á¿
JOINSTATE = 242;
JOINROOMINDEX = 243; --Ñ¡ÔñµÄ³¡µØ±àºÅ

----------------------------------------------¶àÈËÀŞÌ¨-------------------------------------------
--¶àÈËµØÍ¼ĞÅÏ¢
--µØÍ¼ID£¬ËùÔÚ³ÇÊĞµØÍ¼ID£¬µØÍ¼Ãû³Æ£¬´«ËÍ×ø±ê£¬´«ËÍNpc×ø±ê
MultiMapTab = {
	[1]= {821, 300, "B¸ch nh©n l«i ®µi",1604,3244,1600,3238,"QuÇn hïng chiÕn","Thµnh §«"},--¶àÈËÍ¨Ìì´óÀŞ
	[2]= {826, 300, "B¸ch nh©n l«i ®µi",1637,3166,1630,3174,"QuÇn hïng chiÕn","Thµnh §«"},--¶àÈËÉ½¼äË÷ÇÅ
	[3]= {823, 300, "B¸ch nh©n l«i ®µi",1602,3192,1598,3186,"QuÇn hïng chiÕn","Thµnh §«"},--¶àÈË½Åµê¿ÍÕ»
	[4]= {822, 100, "B¸ch nh©n l«i ®µi",1604,3244,1600,3238,"QuÇn hïng chiÕn","TuyÒn Ch©u"},--¶àÈËÀŞÕğ°Ë·½
	[5]= {825, 100, "B¸ch nh©n l«i ®µi",1598,3237,1591,3229,"QuÇn hïng chiÕn","TuyÒn Ch©u"},--¶àÈËÌìÍâ·ÉÏÉ
	[6]= {824, 100, "B¸ch nh©n l«i ®µi",1607,3227,1602,3222,"QuÇn hïng chiÕn","TuyÒn Ch©u"},--¶àÈËÏªÁ÷ÆÙ²¼
	}

--³£Á¿ĞÅÏ¢
MAX_MULTIMAP_NUM 						= 1;      --³ÇÊĞËù¿ª·Å¶àÈËÀŞÌ¨µÄÊıÁ¿(ÊıÁ¿±£Ö¤´óÓÚµÈÓÚMultiMapTabÖĞÍ¬Ò»µØÍ¼³¡µØÊıÁ¿£¬·ñÔò³ö´í)
MAX_MULTIMAP_FIGTHER_NUM 		= 100;    --²Î¼Ó±ÈÈüµÄ½ÇÉ«ÊıÁ¿ÉÏÏŞ
MAX_MULTIMAP_AUDIENCE_NUM 	= 50;     --²Î¼Ó¹ÛÈüµÄ½ÇÉ«ÈËÊıÉÏÏŞ
HUNDRED_MONEY 							= 20000;  --Èë³¡·ÑÎª2j
MULIT_MISSION_ID 						= 23;     --¶àÈËÀŞÌ¨MissionIDºÅ
MULIT_AUDIENCE_CAMP 				= 2;      --¹ÛÖÚÕóĞÍ´úºÅ
MULIT_FIGTHER_CAMP 					= 1;      --²ÎÈüÕßÕóĞÍ´úºÅ
READY_TIME 									= 9;      --Ò»°ã¶àÈËÀŞÌ¨×¼±¸Ê±¼äÎª3·ÖÖÓ 20(MULTI_TIMER_1)*3*3=180
GAME_TIME  									= 54;     --Ò»°ã¶àÈËÀŞÌ¨±ÈÈüÊ±¼äÎª15·ÖÖÓ 20(MULTI_TIMER_1)*3*(15+3)=1080
HUNDRED_READY_TIME 					= 30;     --°ÙÈË´óÀŞ±¨Ãû×¼±¸Ê±¼äÎª10·ÖÖÓ 20(MULTI_TIMER_1)*3*10=600
HUNDRED_GAME_TIME  					= 75;     --°ÙÈË´óÀŞ±ÈÈüÊ±¼äÎª15·ÖÖÓ 20(MULTI_TIMER_1)*3*(15+10)=1500
BONUS_RATE 									= 0.4;    --¹©°ÙÈËÓ¢ĞÛ´óÀŞµÄÊ¤·½·ÖÅä½±½ğµÄ±ÈÀı

--³¡µØ±äÁ¿
MULTIMAP_STATE 							= 1; 			--³¡µØÔ¤¶¨×´¿ö 1ÎªÒÑ¾­±»±ğµÄÍæ¼ÒÔ¤¶¨ 2ÎªÒÑ¾­¿ªÈü
MULTIMAP_NEWS_STATE   			= 2; 			--³¡µØĞÅÏ¢·¢²¼½ø³Ì¿ØÖÆ
TOP_KILLER_INDEX      			= 3; 			--¼ÇÂ¼µ±Ç°³¡µØÍæ¼ÒÉ±ÈË×î¶àµÄË÷Òı
MULTIMAP_NPC_INDEX    			= 4; 			--¼ÇÂ¼ÀŞÌ¨NpcµÄË÷Òı
MULTIMAP_BONUS   						= 5; 			--³¡µØ½±½ğ×Ü¶î
GAME_TYPE										= 6; 			--³¡µØÀàĞÍ±êÊ¶ 0£ºÒ»°ã¶àÈËÀŞÌ¨ 1£º°ÙÈË´óÀŞ
START_TIME									= 7;			--¼ÇÂ¼°ÙÈËÓ¢ĞÛ´óÀŞ¿ª·Å³¡µØµÄÊ±¼ä
OVER_TIME										= 8;			--¼ÇÂ¼°ÙÈËÓ¢ĞÛ´óÀŞ¹Ø±Õ³¡µØµÄÊ±¼ä
DECEDEND_NUM								= 9;			--¼ÇÂ¼±ÈÈüÖĞ½ÇÉ«ËÀÍöÈËÊı	

--ÁÙÊ±±äÁ¿
TOTAL_KILL_NUM 							= 150;		--´¢´æÉ±ËÀ¶ÔÊÖÊıÁ¿µÄ±äÁ¿
PLAYER_CAMP 								= 151;		--´¢´æÍæ¼Òµ±Ç°ÕóÓª

--¶¨Ê±´¥·¢Æ÷ID
MULTI_TIME_ID1 							= 46;			--Ò»°ã¶àÈËÀŞÌ¨¼ÆÊ±Æ÷
MULTI_TIME_ID2 							= 47;			--°ÙÈËÓ¢ĞÛ´óÀŞ¼ÆÊ±Æ÷ 

--¶¨Ê±´¥·¢Æ÷´¥·¢Ê±¼ä
MULTI_TIMER_1 							= 20 * FRAME2TIME; -- Ò»°ã¶àÈËÀŞÌ¨20Ãë¹«²¼Ò»ÏÂÕ½¿ö
MULTI_TIMER_2 							= 20 * FRAME2TIME; -- °ÙÈËÓ¢ĞÛ´óÀŞ20Ãë¹«²¼Ò»ÏÂÕ½¿ö  
                                                      
--Íæ¼Ò±äÁ¿
MULTIMAP_PLAYER_STATE 			= 1151;		--¼ÇÂ¼Íæ¼ÒÊÇ·ñ½øÈë¶àÈËÀŞÌ¨±êÖ¾£¬ÓÃÓÚÍæ¼ÒµÇÂ¼ÓÎÏ·Ê±Çå³ı×´Ì¬
AWARD_DATE_HUNDRED					= 1153;		--¼ÇÂ¼Íæ¼ÒÉÏÒ»´Î»ñÈ¡°ÙÈËÀŞÌ¨³£¹æ½±ÀøµÄÈÕÆÚ
AWARD_DATE_TEAM							= 1154;		--¼ÇÂ¼Íæ¼ÒÉÏÒ»´Î»ñÈ¡ÍÅ¶ÓÀŞÌ¨³£¹æ½±ÀøµÄÈÕÆÚ

----------------------------------------------¶àÈË×é¶ÓÀŞÌ¨-------------------------------------

--¶àÈËµØÍ¼ĞÅÏ¢
--µØÍ¼ID£¬ËùÔÚ³ÇÊĞµØÍ¼ID£¬µØÍ¼Ãû³Æ£¬´«ËÍ×ø±ê£¬´«ËÍNpc×ø±ê
SingleTeamMapTab = {
	[1]= {829, 300, "Th«ng Thiªn §¹i L«i",1604,3244,1600,3238,"Tæ ®éi ®Êu víi Th«ng Thiªn §¹i L«i","Thµnh §«"},--¶àÈË×é¶ÓÍ¨Ìì´óÀŞ
	[2]= {834, 300, "S¬n gian s¸ch kiÒu",1637,3166,1630,3174,"Tæ ®éi ®Êu víi S¬n Gian S¸ch KiÒu","Thµnh §«"},--¶àÈË×é¶ÓÉ½¼äË÷ÇÅ
	[3]= {831, 300, "C­íc ®iÕm kh¸ch s¹n",1602,3192,1598,3186,"Tæ ®éi ®Êu víi C­íc ®iÕm kh¸ch s¹n","Thµnh §«"},--¶àÈË×é¶Ó½Åµê¿ÍÕ»
	[4]= {830, 100, "L«i ChÊn B¸t Ph­¬ng",1604,3244,1600,3238,"Tæ ®éi ®Êu víi L«i ChÊn B¸t Ph­¬ng","TuyÒn Ch©u"},--¶àÈË×é¶ÓÀŞÕğ°Ë·½
	[5]= {833, 100, "Thiªn ngo¹i phi tiªn",1598,3237,1591,3229,"Tæ ®éi ®Êu víi Thiªn Ngo¹i Phi Tiªn","TuyÒn Ch©u"},--¶àÈË×é¶ÓÌìÍâ·ÉÏÉ
	[6]= {832, 100, "Khª l­u béc bè",1607,3227,1602,3222,"Tæ ®éi ®Êu víi Khª L­u Béc Bè","TuyÒn Ch©u"},--¶àÈË×é¶ÓÏªÁ÷ÆÙ²¼
	}

TeamMapTab = {
	[1]= {827, 300, "Tæ ®éi hçn chiÕn l«i ®µi",1604,3244,1600,3238,"§éi chiÕn","Thµnh §«"},--¶àÈË×é¶ÓÍ¨Ìì´óÀŞ
	[2]= {828, 100, "Tæ ®éi hçn chiÕn l«i ®µi",1604,3244,1600,3238,"§éi chiÕn","TuyÒn Ch©u"},--¶àÈË×é¶ÓÀŞÕğ°Ë·½
	}

--³£Á¿ĞÅÏ¢
TEAM_MISSION_ID 						= 29;     --×é¶Ó¶àÈËÀŞÌ¨MissionIDºÅ
SINGLE_TEAM_MISSION_ID      = 30;			--×é¶Óµ¥ÌôÀŞÌ¨MissionIDºÅ 
MAX_TEAM_NUM 								= 10;    	--²Î¼Ó±ÈÈüµÄ¶ÓÎéÊıÁ¿ÉÏÏŞ
MIN_TEAMER_NUM							= 2;			--²Î¼Ó±ÈÈüµÄ¶ÓÎé¶ÓÔ±ÊıÁ¿ÏÂÏŞ
TEAM_GAME_MONEY 						= 100000; --Èë³¡·ÑÎª10j
TEAM_READY_TIME 						= 9;      --Ò»°ã¶àÈË×é¶ÓÀŞÌ¨×¼±¸Ê±¼äÎª3·ÖÖÓ 20(MULTI_TIMER_1)*3*3=180
TEAM_GAME_TIME  						= 54;     --Ò»°ã¶àÈË×é¶ÓÀŞÌ¨±ÈÈüÊ±¼äÎª15·ÖÖÓ 20(MULTI_TIMER_1)*3*(15+3)=1080
TEAM_READY_TIME_AWARD 			= 30;     --½±Àø¶àÈË×é¶ÓÀŞÌ¨±¨Ãû×¼±¸Ê±¼äÎª10·ÖÖÓ 20(MULTI_TIMER_1)*3*10=600
TEAM_GAME_TIME_AWARD  			= 75;     --½±Àø¶àÈË×é¶ÓÀŞÌ¨±ÈÈüÊ±¼äÎª15·ÖÖÓ 20(MULTI_TIMER_1)*3*(15+10)=1500
TEAM_BONUS_RATE 						= 0.9;    --¹©ÍÅ¶ÓÓ¢ĞÛ´óÀŞµÄÊ¤·½·ÖÅä½±½ğµÄ±ÈÀı

--³¡µØ±äÁ¿
TEAM_GAME_STATE 						= 1; 			--³¡µØÔ¤¶¨×´¿ö 1ÎªÒÑ¾­±»±ğµÄÍæ¼ÒÔ¤¶¨ 2ÎªÒÑ¾­¿ªÈü 3Îª±ÈÈü½áÊø
TEAM_NEWS_STATE   					= 2; 			--³¡µØĞÅÏ¢·¢²¼½ø³Ì¿ØÖÆ
TOP_TEAM_INDEX      				= 3; 			--¼ÇÂ¼µ±Ç°³¡µØÍæ¼ÒÉ±ÈË×î¶àµÄË÷Òı
NPC_INDEX    								= 4; 			--¼ÇÂ¼ÀŞÌ¨NpcµÄË÷Òı
TEAM_GAME_BONUS   					= 5; 			--³¡µØ½±½ğ×Ü¶î
TEAM_GAME_TYPE							= 6; 			--³¡µØÀàĞÍ±êÊ¶ 0£ºÒ»°ã¶àÈË×é¶ÓÀŞÌ¨ 1£º½±Àø¶àÈË×é¶Ó´óÀŞ 3:×é¶Óµ¥ÌôÀŞÌ¨
CAPTAIN_STATE								= 7;			--±êÊ¶¶©ÏÂÈü³¡¶ÓÎéÊÇ·ñÔÚ³¡µØÄÚ
DECEDEND_NUM								= 9;			--¼ÇÂ¼±ÈÈüÖĞ½ÇÉ«ËÀÍöÈËÊı
CAPTAIN_ID									= 10;			--Ê¹ÓÃ10¸ö±äÁ¿·Ö±ğ¼ÇÂ¼10¸ö¶Ó³¤µÄPlayerIndex
DELAY_STATE 								= 21;			--×¼±¸Ê±¶ÎÑÓÊ±ÍË³ö±êÖ¾
READY_STATE 								= 22;			--¿ªÕ½Ê±¶ÎÑÓÊ±ÍË³ö±êÖ¾

--×Ö·û´®±äÁ¿
CAPTAIN_NAME								= 1;			--Ê¹ÓÃ10¸ö×Ö·û´®·Ö±ğ¼ÇÂ¼10¸ö¶Ó³¤ĞÕÃû

--¶¨Ê±´¥·¢Æ÷ID
TEAM_TIME_ID1 							= 54;			--Ò»°ã¶àÈË×é¶ÓÀŞÌ¨¼ÆÊ±Æ÷
TEAM_TIME_ID2 							= 55;			--½±Àø¶àÈË×é¶ÓÀŞÌ¨¼ÆÊ±Æ÷
SINGLE_TEAM_TIME_ID 				= 56;			--×é¶Óµ¥ÌôÀŞÌ¨¼ÆÊ±Æ÷

--¶¨Ê±´¥·¢Æ÷´¥·¢Ê±¼ä
TEAM_TIMER_1 								= 20 * FRAME2TIME; -- Ò»°ã¶àÈË×é¶ÓÀŞÌ¨20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TEAM_TIMER_2 								= 20 * FRAME2TIME; -- ½±Àø¶àÈË×é¶ÓÀŞÌ¨20Ãë¹«²¼Ò»ÏÂÕ½¿ö
SINGLE_TEAM_TIMER						= 20 * FRAME2TIME; -- ×é¶Óµ¥ÌôÀŞÌ¨20Ãë¹«²¼Ò»ÏÂÕ½¿ö					

---------------------------------------ÎåÒ»½Ú»î¶¯1v1ÀŞÌ¨±äÁ¿----------------------------------------------------------
PLAYERAWARD_DATE            = 1204;      --×÷ÎªÑ¡ÊÖÁìÈ¡½±ÀøÈÕÆÚ
PLAYERAWARD_TIMES           = 1205;      --×÷ÎªÑ¡ÊÖÁìÈ¡½±Àø´ÎÊı
AUDIENCEAWARD_DATE          = 1206;      --×÷Îª¹ÛÖÚÁìÈ¡½±ÀøÈÕÆÚ
AUDIENCEAWARD_TIMES         = 1207;      --×÷Îª¹ÛÖÚÁìÈ¡½±Àø´ÎÊı

function GetLeavePos()
	    if GetTask(MS_POS) == 300 then--³É¶¼
        return 300,1825,3588;
	elseif GetTask(MS_POS) == 350 then--ÏåÑô
        return 350,1582,2979;
	elseif GetTask(MS_POS) == 150 then--ÑïÖİ
        return 150,1753,3120;
    elseif GetTask(MS_POS) == 100 then--ÈªÖİ
        return 100,1324,2968;
	else
	    return GetTask(MS_POS), GetTask(MS_POS+1), GetTask(MS_POS+2);
	end;	
end;

function BW_SetRev()
    if (GetTask(MS_POS) == 300) then--³É¶¼
	    SetPlayerRevivalPos(CS_RevId, CS_RevData)
    --elseif (GetTask(MS_POS) == 78) then 
	--    SetPlayerRevivalPos(29);--xy
    --else
	--    SetPlayerRevivalPos(6);--cd
    end;
end;

-------------------------------------------------------------------------
--Íæ¼ÒÒªÇóÀë¿ªÓÎÏ·
function LeaveGame(leavetype)
--leavetype = 0±íÊ¾£¬½«Î»ÖÃÉèÔÚµØÍ¼µÄ³¡ÍâÇøÓò£¨·ÇÕ½¶·ÇøÓò£©
--leavetype = 1±íÊ¾£¬½«Î»ÖÃÉèÔÚÁíÒ»¸öµØÍ¼£¬¼´³¹µ×Àë¿ªÕ½³¡
	--camp = GetCamp();--»Ö¸´Ô­Ê¼ÕóÓª
--	SetRevPos(CS_RevId, CS_RevData)
	--BW_SetRev()
	
	RestorePKCamp();
	
	if (leavetype == 0) then 
		--SetCurCamp(camp)
		SetPKFlag(1,camp);
		SetPos(CS_OuterPos[GetTaskTemp(JOINROOMINDEX)][2], CS_OuterPos[GetTaskTemp(JOINROOMINDEX)][3]);
	else
		--SetCurCamp(camp);
		--SetLogoutRV(0);--ÉèÖÃÖØÉúµã
		NewWorld(GetLeavePos());
	end;
end;

function GameOver()
	PTab = {};
	idx = 0
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	if (PCount>0) then
	    for i  = 1, PCount do 
		    PlayerIndex = PTab[i]
		    LeaveGame(1)
	    end;
	end;
	PlayerIndex = OldPlayer;
	--Msg2Fighters("GameOver "..GetName());
end;
-------------------------------------------------------------------------
function SetPKCamp()
	
	LeaveTeam();
	
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);

	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);

	--ÎŞËÀÍö³Í·£
	SetDeathPunish(0);
	
	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetCreateTeam(1);
	
	ForbitTrade(1);
	
	SetTaskTemp(JOINSTATE, 1);
	
	SetFightState(0);

	--½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
    InteractiveEnable(0);
    
    --°ÚÌ¯¿ª¹Ø
    StallEnable(0);
    
    --¸´³ğ¿ª¹Ø
    if (GetName() == GetMissionS(1)) then
        ExercisePK(1,GetMissionV(MS_PLAYER1ID+1));
    end;
    if (GetName() == GetMissionS(2)) then
        ExercisePK(1,GetMissionV(MS_PLAYER1ID));
    end;
end;

function RestorePKCamp()

    SetLogoutRV(0);
    
	SetFightState(0);
	
	SetDeathPunish(1);--ÉèÖÃPK³Í·£
	
	ForbidChangePK(0);
	
	ForbitTrade(0);
	
	SetCreateTeam(0);
	
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	
	SetTaskTemp(JOINROOMINDEX,0);
	
	SetTaskTemp(JOINSTATE, 0);
	
	SetPKFlag(0,0)--¹Ø±ÕPK¿ª¹Ø
	
	DesaltPlayer(0);
	
	if GetTask(SKILLENABLE) == 0 then
		UseSkillEnable(1);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
	elseif GetTask(SKILLENABLE) == 1 then
		UseSkillEnable(0);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
		SetTask(SKILLENABLE, 0);
	end;

	--½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
    InteractiveEnable(1);
    
    --°ÚÌ¯¿ª¹Ø
    StallEnable(1);
    
    --¸´³ğ¿ª¹Ø
    ExercisePK(0,0);
end;

function JoinCamp(Camp)

	--ÅĞ¶Ï½ÇÉ«±¾ÉíÊÇ·ñÄÜ¹»Ê¹ÓÃÎä¹¦
	if GetUseSkillEnable() == -1 then		--player index ²»´æÔÚ
		print("bwhead.lua 247 line GetUseSkillEnable() get player index nil");
		return
	elseif GetUseSkillEnable() == 0 then	--²»ÄÜ¹»Ê¹ÓÃÎä¹¦
		SetTask(SKILLENABLE, 1);
	elseif GetUseSkillEnable() == 1 then	--ÄÜ¹»Ê¹ÓÃÎä¹¦
		SetTask(SKILLENABLE, 0);
	end;

	AddMSPlayer(MISSIONID, Camp);
	
    SetPKCamp();
    
	--´ò¿ªPK¿ª¹Ø ²»×¼½»Ò×
	if (Camp == 3) then
		SetPKFlag(0,0)
		DesaltPlayer(1);
		UseSkillEnable(0);--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
		--ChangeOwnFeature(0, 0, -1, -1, -1, -1, -1)
		--Msg2Player("ÏµÍ³ÏûÏ¢£ºÄãÔİÊ±±äÎªÒşÉí×´Ì¬¡£");
	else
	    SetDeathScript("\\script\\missions\\bw\\bwdeath.lua");
		SetPKFlag(1,Camp)
		DesaltPlayer(0);
	end;
	ForbidChangePK(1);
	
    CleanInteractive();
	if (Camp == 1) then
		NewWorld(CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos1[GetTaskTemp(JOINROOMINDEX)][3])
	elseif (Camp == 2) then
		NewWorld(CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos2[GetTaskTemp(JOINROOMINDEX)][3])
	else 
		NewWorld(CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][1], CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][2], CS_CampPos0[GetTaskTemp(JOINROOMINDEX)][3])
		CreateTrigger(2,2,556);--ÉèÖÃÀë¿ªµØÍ¼´¥·¢Æ÷
		CastState("state_dispear",1,18*60*15);--Îª¹ÛÖÚ¼ÓÉÏºöÂÔÈÎºÎ¼¼ÄÜĞ§¹ûµÄ×´Ì¬
	end;

--	str = GetName().."ÒÑ¾­½øÈëÁË±ÈÈüÈü³¡¡£ÏÖÔÚÍâÎ§Íæ¼ÒµÄ¶Ä×¢ÊÇ"..GetMissionV(BW_MONEY1)..":"..GetMissionV(BW_MONEY2);
	str = GetName().."®· vµo ®Êu tr­êng thi ®Êu."
	Msg2MSAll(MISSIONID, str);
end;


---------------------------------------------------------------------------
--
function WinBonus(camp)

	PTab = {};
	idx = 0
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]

		if (camp == 1) then
			if (GetName() == GetMissionS(1)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 5)
				Earn(V)
			elseif (GetName() ~= GetMissionS(2)) then
				if (GetTask(DUZHU) == camp) then
					V = floor(GetMissionV(BW_MONEY2) * GetTask(DUZHU + 1) * 4 / (GetMissionV(BW_MONEY1) * 5)) + GetTask(DUZHU + 1)
					Earn(V)
				end
			end
		elseif (camp == 2) then
			if (GetName() == GetMissionS(2)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 5)
				Earn(V)
			elseif (GetName() ~= GetMissionS(1)) then
				if (GetTask(DUZHU) == camp) then
					V = floor(GetMissionV(BW_MONEY1) * GetTask(DUZHU + 1) * 4 / (GetMissionV(BW_MONEY2) * 5)) + GetTask(DUZHU + 1)
					Earn(V)
				end
			end
		else
			if (GetName() == GetMissionS(1)) or (GetName() == GetMissionS(2)) then
				V = floor(GetMissionV(BW_SIGN_MONEY) * 9 / 10)
				Earn(V)
			else
				V = GetTask(DUZHU + 1)
				Earn(V)
			end;
		end;
		SetTask(DUZHU + 2, 0);
	end;
	PlayerIndex = OldPlayer;

end;

function RecordBWCount_Win(winidx, failidx)
	orgindex = PlayerIndex
	PlayerIndex = winidx
	AddSucess();
	--nt_setTask(1070, nt_getTask(1070) + 1)
	--Ladder_NewLadder(10117, GetName(), nt_getTask(1070), 1)
	PlayerIndex = failidx
	--nt_setTask(1071, nt_getTask(1071) + 1)
	AddFail();
	PlayerIndex = orgindex
end

-- ÉèÖÃÈÎÎñ×´Ì¬
function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	--SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function Msg2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		 local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
		    PlayerIndex = index;
            Msg2Player(str);
    	end
	end;
	PlayerIndex = OldPlayer;
end

function Talk2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		 local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
		    PlayerIndex = index;
            Talk(1,"",str);
        end
	end;
	PlayerIndex = OldPlayer;
end

function Tip2Fighters(str)
	OldPlayer = PlayerIndex;
	for i = 1, 2 do 
		local index = GetMissionV(MS_PLAYER1ID + i -1);
		 if (index > 0) then
		    PlayerIndex = index;
		    if (GetName() == GetMissionS(i)) then
                TaskTip(str);
            end
        end
	end;
	PlayerIndex = OldPlayer;
end

function GetPlayerInfo(player_index)
    playerinfo = "";
    
    if (player_index == 0) then
        playerinfo = "Tin tøc ch­a biÕt"
        return playerinfo
    end
    
	OldPlayer = PlayerIndex;
	PlayerIndex = player_index;
	playerinfo = playerinfo..GetLevel().." cÊp ";
	local route = GetPlayerRoute();
	if (route == 0) then
		playerinfo = playerinfo.."V« m«n ph¸i";
	elseif (route == 1) then
		playerinfo = playerinfo.."ThiÕu L©m";
	elseif (route == 2) then
		playerinfo = playerinfo.."ThiÕu L©m tôc gia";
	elseif (route == 3) then
		playerinfo = playerinfo.."ThiÕu L©m thiÒn t«ng";
	elseif (route == 4) then
		playerinfo = playerinfo.."ThiÕu L©m vâ t«ng";
	elseif (route == 5) then
		playerinfo = playerinfo.."§­êng M«n";
	elseif (route == 6) then
		playerinfo = playerinfo.."§­êng M«n";
	elseif (route == 7) then
		playerinfo = playerinfo.."Nga My";
	elseif (route == 8) then
		playerinfo = playerinfo.."Nga My PhËt gia";
	elseif (route == 9) then
		playerinfo = playerinfo.."Nga My tôc gia";
	elseif (route == 10) then
		playerinfo = playerinfo.."C¸i Bang";
	elseif (route == 11) then
		playerinfo = playerinfo.."C¸i Bang TÜnh y";
	elseif (route == 12) then
		playerinfo = playerinfo.."C¸i Bang ¤ Y";
	elseif (route == 13) then
		playerinfo = playerinfo.."Vâ §ang";
	elseif (route == 14) then
		playerinfo = playerinfo.."Vâ §ang ®¹o gia";
	elseif (route == 15) then
		playerinfo = playerinfo.."Vâ §ang tôc gia";
	elseif route == 16 then
		playerinfo = playerinfo.."D­¬ng M«n";
	elseif route == 17 then
		playerinfo = playerinfo.."D­¬ng M«n th­¬ng Kş";
	elseif route == 18 then
		playerinfo = playerinfo.."D­¬ng M«n Cung Kş";
	elseif route == 19 then
		playerinfo = playerinfo.."Ngò §éc"
	elseif route == 20  then
		playerinfo = playerinfo.."HiÖp §éc"
	elseif route == 21 then
		playerinfo = playerinfo.."Tµ §éc"
	end
	PlayerIndex = OldPlayer;
	return playerinfo
end

-----------------------------------------¶àÈËÀŞÌ¨²¿·Ö-------------------------------------

--ÉèÖÃÍæ¼Ò²»Í¬Ìõ¼şÏÂµÄ×´Ì¬
--²ÎÊı nType  1:×¼±¸½×¶Î  2£º¿ªÕ½½×¶Î  3£º½áÊø½×¶Î
--²ÎÊı nCamp  2£º¹ÛÖÚ     1£ºÑ¡ÊÖ
--²ÎÊı nTeam  ²»ÎªnilÔòÎª×é¶ÓÕ½¶· 2ÎªÕ½¶·ÕóÓª1 3ÎªÕ½¶·ÕóĞÍ2
function SetPlayerState(nType,nCamp,nTeam)

local i=0;
local news_str = "";
	
	--×¼±¸½×¶Î½ÇÉ«×´Ì¬´¦Àí
	if nType == 1 then
		if nTeam == nil then
			LeaveTeam();
		end
		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
		SetLogoutRV(1);
		--ÎŞËÀÍö³Í·£
		SetDeathPunish(0);
		--¹Ø±Õ×é¶Ó¹¦ÄÜ
		SetCreateTeam(1);
		ForbitTrade(1);
		SetFightState(0);
		--½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
  	InteractiveEnable(0);
  	CleanInteractive();
  	--°ÚÌ¯¿ª¹Ø
  	StallEnable(0);
  	--RemvoeTempEffect();
  	--¹ÛÖÚÕóĞÍ´¦Àí		
  	if nCamp == 2 then
  		SetPKFlag(0,0)
			DesaltPlayer(1);
			UseSkillEnable(0);--(1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
			CreateTrigger(2,2,556);--ÉèÖÃÀë¿ªµØÍ¼´¥·¢Æ÷
			CastState("state_dispear",1,18*60*15);--Îª¹ÛÖÚ¼ÓÉÏºöÂÔÈÎºÎ¼¼ÄÜĞ§¹ûµÄ×´Ì¬
		--Ñ¡ÊÖÕóĞÍ´¦Àí	 			  
		elseif nCamp == 1 then
			UseScrollEnable(0);--»Ø³Ì·û¿ª¹Ø			
			if nTeam == nil then
				SetPKFlag(2,0);
				SetDeathScript("\\script\\missions\\bw\\multi_death.lua");
			else
				if nTeam == 2 or nTeam == 3 then
					nTeam = nTeam - 2;
					SetPKFlag(1,nTeam);
					SetDeathScript("\\script\\missions\\bw\\single_team_death.lua");
				else
					SetPKFlag(2,0);
					SetDeathScript("\\script\\missions\\bw\\team_death.lua");
				end			
			end
		end
		ForbidChangePK(1);
	end
			
	--Õ½¶·½×¶Î½ÇÉ«×´Ì¬´¦Àí
	if nType == 2 then
		if nCamp == 1 then
			SetFightState(1);
		end
	end
	
	--±ÈÈü½áÊø½×¶Î½ÇÉ«×´Ì¬´¦Àí	
	if nType == 3 then
		SetLogoutRV(0);    
		SetFightState(0);			
		SetDeathPunish(1);
		ForbidChangePK(0);			
		ForbitTrade(0);			
		SetCreateTeam(0);			
		SetDeathScript("");
		SetPKFlag(0,0)--¹Ø±ÕPK¿ª¹Ø
		DesaltPlayer(0);
  	InteractiveEnable(1);
  	StallEnable(1);
  	UseScrollEnable(1);--»Ø³Ì·û¿ª¹Ø
  	UseSkillEnable(1);
		for i=1,10 do
			RemoveTitle(21,i);
		end
	end
end

--¹ÛÕ½
function View_Game(nMapIndex)

local nTotalAudicnceNum = 0;

	OldSubworld = SubWorld;
	SubWorld = SubWorldID2Idx(MultiMapTab[nMapIndex][1]);
	
	if SubWorld <= 0 then
		WriteLog("[QuÇn hïng chiÕn]Tham gia xem thi ®Êu ®äc SubWorld b¸o lçi, lçi nMapIndex lµ"..nMapIndex..", SubWorld lµ"..SubWorld..".");
		SubWorld = OldSubworld;
		return 0
	end 
	
	nTotalAudicnceNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP)
	
	if nTotalAudicnceNum < MAX_MULTIMAP_AUDIENCE_NUM then
		NewWorld(MultiMapTab[nMapIndex][1],MultiMapTab[nMapIndex][4],MultiMapTab[nMapIndex][5]);
		SetPlayerState(1,2);--ÉèÖÃ¹ÛÕ½×´Ì¬
		AddMSPlayer(MULIT_MISSION_ID,MULIT_AUDIENCE_CAMP);--¼ÓÈëÕóĞÍ
		SetTaskTemp(PLAYER_CAMP,MULIT_AUDIENCE_CAMP);--¼ÇÂ¼Íæ¼ÒÕóĞÍ
	else
		Say("Xin lçi! ChiÕn ®Şa sè ng­êi ®· ®ñ! LÇn sau h·y ®Õn sím!",0);
	end
	
	SubWorld = OldSubworld
	
end

--»ñÈ¡Ä¿Ç°É±ÈËÊı×î¶àµÄÇ°NÃûµÄ½ÇÉ«µÄPlayerIndex
--·µ»ØÖµ£ºtab{Player[1],Player[2]¡­¡­Player[N]}
function GetMurderIndexTab(nNum)

local nMurderNum = GetMSPlayerCount(MULIT_MISSION_ID,MULIT_FIGTHER_CAMP);
local PlayerMSIndex = 0;
local i,j,k,n = 0,0,0,0;
local MurderTab = {}
local PlayerIndexTab = {}
local MaxTab = {}
local nMaxPlace = {}
local nPlayerIndex = 0;
	
	--°ÑËùÓĞÍæ¼ÒµÄindex·Å½øPlayerIndexTab
	OldPlayer = PlayerIndex
	for i=1,nMurderNum do
		PlayerMSIndex,nPlayerIndex = GetNextPlayer(MULIT_MISSION_ID,PlayerMSIndex,MULIT_FIGTHER_CAMP);
		if nPlayerIndex > 0 then
			tinsert(PlayerIndexTab,nPlayerIndex)
		end
	end
	
	PlayerIndex = OldPlayer

	for k=1,nNum do
		MaxTab = {}
		nMaxPlace = {}
		for i=1,getn(PlayerIndexTab) do			
			if i==1 then
				tinsert(MaxTab,PlayerIndexTab[i])  
	  		tinsert(nMaxPlace,i)
			else
				OldPlayer = PlayerIndex
				PlayerIndex = MaxTab[1]
				nKillNum_1 = GetTaskTemp(TOTAL_KILL_NUM)
				PlayerIndex = PlayerIndexTab[i]
				nKillNum_2 = GetTaskTemp(TOTAL_KILL_NUM)
				PlayerIndex = OldPlayer
				 
			 	if nKillNum_1 < nKillNum_2 then
					MaxTab = {}
					nMaxPlace = {}
					tinsert(MaxTab,PlayerIndexTab[i])
					tinsert(nMaxPlace,i)
				elseif nKillNum_1 == nKillNum_2 then
					tinsert(MaxTab,PlayerIndexTab[i])
					tinsert(nMaxPlace,i)
				end
			end
		end
	
		n = getn(nMaxPlace)

		if n>1 then
			for i=1,n do
				tremove(PlayerIndexTab,nMaxPlace[i]-i+1)
			end
		end
			
		tinsert(MurderTab,MaxTab)
		
		if getn(PlayerIndexTab) == 0 then
			break
		end
		
	end

	return MurderTab

end


--ÏÔÊ¾É±ÈË×î¶àµÄÍæ¼Ò(ÒÔPKÕóÓª1ÏÔÊ¾)
function ShowTopKillNumPlayer()

local PlayerIndexTab = GetMurderIndexTab(1)
local news_str = "";	
	if GetMissionV(TOP_KILLER_INDEX) ~= PlayerIndexTab[1][1] then
		if GetMissionV(TOP_KILLER_INDEX) == 0 and PlayerIndexTab[1][1] > 0 then
			OldPlayer = PlayerIndex
			PlayerIndex = PlayerIndexTab[1][1]
			ForbidChangePK(0);
			SetPKFlag(1,0);
			ForbidChangePK(1);
			SetMissionV(TOP_KILLER_INDEX,PlayerIndexTab[1][1])
			PlayerIndex = OldPlayer
		else
			OldPlayer = PlayerIndex
			PlayerIndex = GetMissionV(TOP_KILLER_INDEX);
			ForbidChangePK(0);
			SetPKFlag(2,0);
			ForbidChangePK(1);
			PlayerIndex = PlayerIndexTab[1][1]
			ForbidChangePK(0);
			SetPKFlag(1,0);
			ForbidChangePK(1);
			SetMissionV(TOP_KILLER_INDEX,PlayerIndexTab[1][1])
			PlayerIndex = OldPlayer
		end
	end
end

--·µ»Øµ±Ç°Ğ¡Ê±ºÍ·ÖÖÓ
function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end;

--ÅĞ¶ÏÊÇ·ñÎª°ÙÈË´óÀŞ×´Ì¬
function IsHundredBattleState()
	do return 0 end
--	local nHour,nMin = GetLocalTime();
--	
--	if nHour == 11 or nHour == 17 or nHour == 21 then
--			return 1
--	end
--		
--	if nHour == 10 and nMin >= 30 and nMin <= 59 or nHour == 16 and nMin >= 30 and nMin <= 59 or nHour == 20 and nMin >= 30 and nMin <= 59 then	
--		return 1
--	end
--	
--	return 0
end

--×ª»»½ğÇ®¸ñÊ½
--²ÎÊı£ºÒÔÍ­Ç®Îªµ¥Î»µÄÊı×Ö
--·µ»ØÖµ£º×Ö·û´® XX½ğXXÒøXXÍ­
function TurnMoneyFormat(nMoney)

local nGold,nSilver,nCuprum = 0,0,0;
local nBonus = ""
	
	nCuprum 	= mod(nMoney,100);
	nSilver = mod(((nMoney - nCuprum)/100),100);
	nGold = (nMoney - nCuprum - nSilver*100)/10000;
	
	if nGold ~= 0 then
		nBonus = "<color=yellow>"..nGold.."<color> vµng";
	end
	
	if nSilver ~= 0 then
		nBonus = nBonus.."<color=yellow>"..nSilver.."<color> b¹c";
	end
	
	if nCuprum ~= 0 then
		nBonus = nBonus.."<color=yellow>"..nCuprum.."<color> ®ång";
	end
	
	return nBonus
	
end

------------------¶àÈË×é¶ÓÀŞÌ¨²¿·Öº¯Êı--------------------------
function GetGameTeamNum()

local nNum = 0;

	for i=1,10 do
		if GetMissionS(i) ~= "" then
			nNum = nNum + 1;
		end
	end

	return nNum	

end

function GetGameTeamNumByLife()

local i = 0;
local nNum = 0;
local OldPlayerIndex = 0;

	for i=1,10 do
		if GetMissionS(i) ~= "" then
			OldPlayer = PlayerIndex;
			PlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
			if PlayerIndex > 0 then
				for i=1,gf_GetTeamSize() do
					OldPlayerIndex = PlayerIndex;
					PlayerIndex = gf_GetTeamMember(i);
					if PlayerIndex > 0 then
						if IsPlayerDeath() == 0 then 
							nNum = nNum + 1;
							break;
						end
					end
					PlayerIndex = OldPlayerIndex;
				end
			end
			PlayerIndex = OldPlayer;
		end
	end
	
	return nNum

end

--ÅĞ¶ÏÖ¸¶¨ÕóÓªµÄ¶ÓÎé×´Ì¬
--²ÎÊı nCamp:ÕóÓªID
function GetTeamState(nCamp)

local i = 0;
local nPlayerMSIndex = 0;

	if GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,nCamp) <= 0 then
		return 0
	end
	
	OldPlayer = PlayerIndex;
	for i=1,GetMSPlayerCount(SINGLE_TEAM_MISSION_ID,nCamp) do
		nPlayerMSIndex,PlayerIndex = GetNextPlayer(SINGLE_TEAM_MISSION_ID,nPlayerMSIndex,nCamp);
		if PlayerIndex > 0 then
			if IsPlayerDeath() == 0 then	
				return 1
			end
		end
	end
	PlayerIndex = OldPlayer;
	
	return 0

end

--ÅĞ¶ÏÊÇ·ñ·ûºÏ×é¶Óµ¥Ìô±ÈÈü×Ê¸ñ
function HaveSingleTemaGameTitle()

	local nMapID, nX, nY = GetWorldPos();
	if gf_GetTeamSize() < MIN_TEAMER_NUM then
		TalkEx("",{"Sè ng­êi trong ®éi kh«ng ®ñ ("..MIN_TEAMER_NUM.."ng­êi trë lªn), kh«ng thÓ tham gia thi ®Êu nhiÒu ng­êi."});
		return 0
	elseif gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"Ng­¬i kh«ng ph¶i ®éi tr­ëng, kh«ng thÓ tham gia thi ®Êu!"});
		return 0
	else
		OldPlayer = PlayerIndex;
		for i=1,gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã t©n thñ, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã ®éi viªn ®ang bµy b¸n, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
				local nTempMaoID,nTempX, nTempY = GetWorldPos();
				if nTempMaoID ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã ®éi viªn kh«ng ë khu vùc hiÖn t¹i, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
			end	
		end
		PlayerIndex = OldPlayer;
	end
	
	return 1
	
end

--Ñº½ğÀŞÌ¨Ìõ¼şÅĞ¶Ï
function HaveSingleTemaGameTitleYJ()
	local nMapID = GetWorldPos();
	if gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"Chñ l«i ®µi: cÇn ®éi tr­ëng ®Õn khiªu chiÕn"});
		return 0
	end
	local OldPlayer = PlayerIndex;
	for i=1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if PlayerIndex > 0 then
			if GetPlayerRoute() == 0 then
				PlayerIndex = OldPlayer;
				TalkEx("",{"§éi ng­¬i cã t©n thñ, kh«ng thÓ tham gia thi ®Êu!"});
				return 0
			end
			if IsStalling() == 1 then
				PlayerIndex = OldPlayer;
				TalkEx("",{"§éi ng­¬i cã ®éi viªn ®ang bµy b¸n, kh«ng thÓ tham gia thi ®Êu!"});
				return 0
			end
			local nTempMaoID, nTempX, nTempY = GetWorldPos();
			if nTempMaoID ~= nMapID then
				PlayerIndex = OldPlayer;
				TalkEx("",{"§éi ng­¬i cã ®éi viªn kh«ng ë khu vùc hiÖn t¹i, kh«ng thÓ tham gia thi ®Êu!"});
				return 0
			end
		end	
	end	
	PlayerIndex = OldPlayer;
	
	return 1;
end
--ÅĞ¶ÏÊÇ·ñ·ûºÏ×é¶Ó±ÈÈü×Ê¸ñ

function HaveTemaGameTitle(nType)
local nMapID = GetWorldPos();

	if gf_GetTeamSize() < MIN_TEAMER_NUM then
		TalkEx("",{"Sè ng­êi trong ®éi kh«ng ®ñ ("..MIN_TEAMER_NUM.."ng­êi hoÆc nhiÒu h¬n }, kh«ng thÓ tham gia thi ®Êu."});
		return 0
	elseif gf_GetCaptainName() ~= GetName() then
		TalkEx("",{"Ng­¬i kh«ng ph¶i lµ ®éi tr­ëng, kh«ng thÓ tham gia thi ®Êu."});
		return 0
	end
	
	if IsTeamAwardTime() == 1 then
		for i=1,gf_GetTeamSize() do
			OldPlayer = PlayerIndex;
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetLevel() <60 or GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã t©n thñ hoÆc ®Êu thñ d­íi cÊp 60, kh«ng thÓ tham gia thi ®Êu!"});
					return 0 
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã ®éi viªn ®ang bµy b¸n, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
				if GetWorldPos() ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã ®éi viªn kh«ng ë khu vùc hiÖn t¹i, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
			end
			PlayerIndex = OldPlayer;
		end
		
		if nType == 4 then
			if Pay(TEAM_GAME_MONEY) ~= 1 then
				TalkEx("",{"Mçi ®éi tham gia trËn thø 2 §éi chiÕn ®Òu cÇn ®éi tr­ëng giao n¹p"..TurnMoneyFormat(TEAM_GAME_MONEY).."_míi cã thÓ x©m nhËp ®Êu tr­êng!"});
				return 0
			else
				SetMissionV(TEAM_GAME_BONUS,GetMissionV(TEAM_GAME_BONUS)+TEAM_GAME_MONEY);
			end
		end
		
	else
		for i=1,gf_GetTeamSize() do
			OldPlayer = PlayerIndex;
			PlayerIndex = gf_GetTeamMember(i);
			if PlayerIndex > 0 then
				if GetLevel() <10 or GetPlayerRoute() == 0 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã t©n thñ, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
				if IsStalling() == 1 then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã ®éi viªn ®ang bµy b¸n, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
				if GetWorldPos() ~= nMapID then
					PlayerIndex = OldPlayer;
					TalkEx("",{"§éi ng­¬i cã ®éi viªn kh«ng ë khu vùc hiÖn t¹i, kh«ng thÓ tham gia thi ®Êu!"});
					return 0
				end
			end
			PlayerIndex = OldPlayer;		
		end
		
	end
	
	return 1

end

--ÅĞ¶ÏÊÇ·ñÎª´ø½±Àø×é¶Ó±ÈÈüÊ±¼ä
function IsTeamAwardTime()
	do return 0 end
--	local nHour,nMin = GetLocalTime();
--	if nHour == 12 or nHour == 18 or nHour == 23 then
--			return 1
--	end
--	
--	if nHour == 11 and nMin >= 30 and nMin <= 59 or nHour == 17 and nMin >= 30 and nMin <= 59 or nHour == 22 and nMin >= 30 and nMin <= 59 then	
--		return 1
--	end
--	
--	return 0
end

--»ñÈ¡Ä¿Ç°É±ÈËÊı×î¶àµÄÇ°N¸ö¶ÓÎéµÄ¶Ó³¤µÄPlayerIndex
--·µ»ØÖµ£ºtab{Captain[1],Captain[2]¡­¡­Captain[N]}
function GetMurderCaptainIDTab(nNum)

local nTeamNum = GetGameTeamNumByLife();
local i,j,k,m,n = 0,0,0,0,0;
local nKillNum_1 = 0;
local nKillNum_2 = 0;
local CaptainTab = {}
local CaptainIndexTab = {}
local MaxTab = {}
local nMaxPlace = {}
local nPlayerIndex = 0;
	
	--°ÑËùÓĞ¶Ó³¤µÄindex·Å½øCaptainIndexTab
	OldPlayer = PlayerIndex
	
	for i=1,10 do
		nPlayerIndex = GetMissionV(CAPTAIN_ID+i-1);
		if nPlayerIndex > 0 then
			tinsert(CaptainIndexTab,nPlayerIndex)
		end
	end
	
	PlayerIndex = OldPlayer

	for k=1,nNum do
		MaxTab = {}
		nMaxPlace = {}
		for i=1,getn(CaptainIndexTab) do			
			if i==1 then
				tinsert(MaxTab,CaptainIndexTab[i])  
	  		tinsert(nMaxPlace,i)
			else
				OldPlayer = PlayerIndex;
				
				PlayerIndex = MaxTab[1];
				nKillNum_1 = 0;
				for m=1,gf_GetTeamSize() do
					if gf_GetTeamMember(m) > 0 then
						PlayerIndex = gf_GetTeamMember(m);
						nKillNum_1 = GetTaskTemp(TOTAL_KILL_NUM) + nKillNum_1;
					end
				end
				
				PlayerIndex = CaptainIndexTab[i];
				nKillNum_2 = 0;
				for m=1,gf_GetTeamSize() do
					if gf_GetTeamMember(m) > 0 then
						PlayerIndex = gf_GetTeamMember(m);
						nKillNum_2 = GetTaskTemp(TOTAL_KILL_NUM) + nKillNum_2;
					end
				end

				PlayerIndex = OldPlayer
				 
			 	if nKillNum_1 < nKillNum_2 then
					MaxTab = {}
					nMaxPlace = {}
					tinsert(MaxTab,CaptainIndexTab[i])
					tinsert(nMaxPlace,i)
				elseif nKillNum_1 == nKillNum_2 then
					tinsert(MaxTab,CaptainIndexTab[i])
					tinsert(nMaxPlace,i)
				end
			end
		end
	
		n = getn(nMaxPlace)

		if n>1 then
			for i=1,n do
				tremove(CaptainIndexTab,nMaxPlace[i]-i+1)
			end
		end
			
		tinsert(CaptainTab,MaxTab)
		
		if getn(CaptainIndexTab) == 0 then
			break
		end
		
	end

	return CaptainTab

end


--ÏÔÊ¾É±ÈË×î¶àµÄ¶ÓÎéµÄ½ÇÉ«(ÒÔPKÕóÓª1ÏÔÊ¾)
function ShowTopKillTeamPlayer()

local CaptainIndexTab = GetMurderCaptainIDTab(1)
local news_str = "";	
	if GetMissionV(TOP_KILLER_INDEX) ~= CaptainIndexTab[1][1] then
		if GetMissionV(TOP_KILLER_INDEX) == 0 and CaptainIndexTab[1][1] > 0 then
			OldPlayer = PlayerIndex;
			PlayerIndex = CaptainIndexTab[1][1];
			SetMissionV(TOP_KILLER_INDEX,PlayerIndex);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(1,0);
					ForbidChangePK(1);
				end
			end
			PlayerIndex = OldPlayer
		else
			OldPlayer = PlayerIndex
			
			PlayerIndex = GetMissionV(TOP_KILLER_INDEX);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(2,0);
					ForbidChangePK(1);
				end
			end
			
			PlayerIndex = CaptainIndexTab[1][1];
			SetMissionV(TOP_KILLER_INDEX,CaptainIndexTab[1][1]);
			for i=1,gf_GetTeamSize() do
				PlayerIndex = gf_GetTeamMember(i);
				if PlayerIndex > 0 then
					ForbidChangePK(0);
					SetPKFlag(1,0);
					ForbidChangePK(1);
				end
			end
			
			PlayerIndex = OldPlayer
			
		end
	end
end

function LeaveGameMap()
	
local i=0;
	
	if GetTrigger(556) ~= 0 then
		RemvoeTempEffect();
		for i=1,10 do
			RemoveTitle(21,i);
		end
		RemoveTrigger(GetTrigger(556));
	end
	
end

--·¢½±²ÎÊı£º1µ¥ÈË»ìÕ½Ê§°ÜÕß³£¹æ½±Àø£»2µ¥ÈË»ìÕ½Ê¤ÀûÕß³£¹æ½±Àø£»3×é¶Ó»ìÕ½Ê§°ÜÕß³£¹æ½±Àø£»4×é¶Ó»ìÕ½Ê¤ÀûÕß³£¹æ½±Àø¡£
function PayAward(nType)

local	nDate = date("%y")..date("%m")..date("%d");

	if nType == 1 or nType == 2 then
		if nDate ~= GetTask(AWARD_DATE_HUNDRED) then
			ModifyReputation(10,0);
			Earn(50000);
			if nType == 1 then	
				ModifyExp(25000);
				Msg2Player("B¹n nhËn ®­îc 25000 ®iÓm kinh nghiÖm.");
				if random(1,100) <= 5 then
					AddItem(2,0,504,1,1);
					Msg2Player("B¹n nhËn ®­îc 1 c©y B¸t Nh· nhá.");
				end
			elseif nType == 2 then	
				if random(1,100) <= 20 then
					ModifyExp(150000);
					Msg2Player("B¹n nhËn ®­îc 15 v¹n kinh nghiÖm.");
				else
					ModifyExp(50000);
					Msg2Player("B¹n nhËn ®­îc 5 v¹n kinh nghiÖm.");
				end 
				if random(1,100) <= 20 then
					AddItem(2,0,504,1,1);
					Msg2Player("B¹n nhËn ®­îc 1 c©y B¸t Nh· nhá.");
				end 
			end
			SetTask(AWARD_DATE_HUNDRED,nDate);
		else
			Msg2Player("B¹n ®· nhËn phÇn th­ëng QuÇn hïng chiÕn, kh«ng thÓ nhËn n÷a!");
		end
		return
	end
	
	if nType == 3 then
		if nDate ~= GetTask(AWARD_DATE_TEAM) then
			ModifyExp(40000);
			Msg2Player("B¹n nhËn ®­îc 4 v¹n kinh nghiÖm.")
			ModifyReputation(10,0);
			if random(1,100) <= 10 then
				AddItem(2,0,398,1,1);
				Msg2Player("B¹n nhËn ®­îc 1 mÇm c©y B¸t Nh·.");
			end
			SetTask(AWARD_DATE_TEAM,nDate);
		else
			Msg2Player("B¹n ®· nhËn phÇn th­ëng §éi chiÕn, kh«ng thÓ nhËn n÷a!");		
		end
		return
	end
			
	if nType == 4 then
		if nDate ~= GetTask(AWARD_DATE_TEAM) then
			ModifyExp(80000);
			Msg2Player("B¹n nhËn ®­îc 8 v¹n kinh nghiÖm.");
			ModifyReputation(10,0);
			if random(1,100) <= 30 then
				ModifyExp(300000);
				Msg2Player("B¹n nhËn ®­îc 300000 ®iÓm kinh nghiÖm.");
			end
			if random(1,100) <= 20 then
				AddItem(2,2,8,3,1);
				Msg2Player("B¹n nhËn ®­îc 3 miÕng Thiªn th¹ch.");
			end
			if random(1,100) <= 20 then
				AddItem(2,0,398,1,1);
				Msg2Player("B¹n nhËn ®­îc 1 mÇm c©y B¸t Nh·.");
			end
			if random(1,100) <= 10 then
				ModifyExp(500000);
				Msg2Player("B¹n nhËn ®­îc 50 v¹n kinh nghiÖm.");
			end
			SetTask(AWARD_DATE_TEAM,nDate);
		else
			Msg2Player("B¹n ®· nhËn phÇn th­ëng §éi chiÕn, kh«ng thÓ nhËn n÷a!");		
		end
	end
end

-------------------------------------------ÎåÒ»»î¶¯Ôö¼Ó²¿·Ö-----------------------------

--ÅĞ¶Ï1v1ÀŞÌ¨±ÈÎäË«·½ÊÇ·ñÔÚ75¼¶ÒÔÉÏ£¬²¢ÇÒµÈ¼¶²îÔÚ5¼¶Ö®ÄÚ
--·µ»ØÖµ£º1Îª·ûºÏÌõ¼ş£»0Îª²»·ûºÏÌõ¼ş

function Is2PlayerLevelOK()

local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);
local Player_1_Level = 0;
local Player_2_Level = 0;

	OldPlayer = PlayerIndex;
	PlayerIndex = PlayerIndex_1;
	if PlayerIndex_1 > 0 then
		Player_1_Level = GetLevel();
		if Player_1_Level < 75 then
			PlayerIndex = OldPlayer;
			return 0
		else
			PlayerIndex = PlayerIndex_2;
			if PlayerIndex_2 > 0 then
				Player_2_Level = GetLevel();
				--ÅĞ¶ÏË«·½µÈ¼¶²îÊÇ·ñÔÚ5¼¶Ö®ÄÚ
				if (Player_2_Level - Player_1_Level <= 5) and (Player_2_Level - Player_1_Level >= -5) and Player_2_Level >= 75 then 
					PlayerIndex = OldPlayer;
					return 1
				else
					PlayerIndex = OldPlayer;
					return 0
				end
			else
				--player2µÄindex²»ºÏ·¨»ò²»´æÔÚ
			end
		end
	else
		--player1µÄindex²»ºÏ·¨»ò²»´æÔÚ
	end
end

--ÅĞ¶Ï½ÇÉ«ÊÇ·ñÓĞ×Ê¸ñÁìÈ¡½±Àø
--²ÎÊınType 1ÎªÑ¡ÊÖ£»2Îª¹ÛÖÚ
function IsGetAward(nType)

	if nType == 1 then
		if GetTask(PLAYERAWARD_DATE) == GetDateNum() then
			if GetTask(PLAYERAWARD_TIMES) < 2 then
				return 1
			else
				Msg2Player("Thùc ChiÕn mËt kiÖp h«m nay ng­¬i ®· nhËn ®ñ, kh«ng thÓ nhËn thªm.");
				return 0
			end
		else
			SetTask(PLAYERAWARD_TIMES,0);
			return 1
		end

	elseif nType == 2 then
		if GetLevel() <= 10 then
			return 0
		end
		if GetTask(AUDIENCEAWARD_DATE) == GetDateNum() then
			if GetTask(AUDIENCEAWARD_TIMES) < 4 then
				return 1
			else
				Msg2Player("Quan chiÕn mËt kiÖp h«m nay ng­¬i ®· nhËn ®ñ, kh«ng thÓ nhËn thªm.");
				return 0
			end
		else
			SetTask(AUDIENCEAWARD_TIMES,0);
			return 1
		end
	end
end

--ÅĞ¶Ï½ÇÉ«±¾ÖÜÊÇ·ñÓĞ×Ê¸ñ»ñµÃ½±Àø
--²ÎÊınType 1ÎªÑ¡ÊÖ£»2Îª¹ÛÖÚ
function IsGetAwardWeek(nType)

local nThisWeekTimes = Zgc_pub_week_seq();

	if nType == 1 then
		if GetTask(PLAYERAWARD_DATE) == nThisWeekTimes then
			if GetTask(PLAYERAWARD_TIMES) < 20 then
				return 1
			else
				Msg2Player("Thùc chiÕn mËt kiÖp tuÇn nµy ng­¬i ®· nhËn ®ñ, kh«ng thÓ nhËn thªm.");
				return 0
			end
		else
			SetTask(PLAYERAWARD_TIMES,0);
			return 1
		end

	elseif nType == 2 then
		if GetLevel() <= 10 then
			return 0
		end
		if GetTask(AUDIENCEAWARD_DATE) == nThisWeekTimes then
			if GetTask(AUDIENCEAWARD_TIMES) < 40 then
				return 1
			else
				Msg2Player("Quan chiÕn mËt kiÖp tuÇn nµy ng­¬i ®· nhËn ®ñ, kh«ng thÓ nhËn thªm.");
				return 0
			end
		else
			SetTask(AUDIENCEAWARD_TIMES,0);
			return 1
		end
	end
	
end

-- Ê¦Í½ÈÎÎñ
function process_master_task()
	local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
	local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);

	local nOldPlayer
	if PlayerIndex_1 > 0 then
		nOldPlayer = PlayerIndex
		PlayerIndex = PlayerIndex_1
		local nChance, nMaxChance = CustomDataRead("mp_leitai")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_leitai", "dd", nChance, nMaxChance)
				Msg2Player("NhiÖm vô S­ ®å-t×nh h×nh hoµn thµnh L«i ®µi:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		PlayerIndex = nOldPlayer
	end
	
	if PlayerIndex_2 > 0 then
		nOldPlayer = PlayerIndex
		PlayerIndex = PlayerIndex_2
		local nChance, nMaxChance = CustomDataRead("mp_leitai")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_leitai", "dd", nChance, nMaxChance)
				Msg2Player("NhiÖm vô S­ ®å-t×nh h×nh hoµn thµnh L«i ®µi:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
		PlayerIndex = nOldPlayer
	end
end

--¸øÓë1v1ÀŞÌ¨½±Àø
function Award2Player()

local PlayerMSIndex = 0;
local nPlayerIndex = 0;
local PlayerIndexTab = {};
local PlayerIndex_1 = GetMissionV(MS_PLAYER1ID);
local PlayerIndex_2 = GetMissionV(MS_PLAYER2ID);
	--¿ª·Å±ÈÎä´ó»áºó£¬ÀŞÌ¨Ñ¡ÊÖ¾Í²»½±ÀøÊµÕ½ĞÄµÃÁË
	
	--¹ÛÖÚ²¿·Ö·¢½±
	--¹ÛÖÚÒ²²»¸ø¹ÛÕ½ĞÄµÃÁË
	
end

--51»î¶¯ÓĞĞ§ÈÕÆÚÅĞ¶Ï
--·µ»ØÖµ1Îª»î¶¯ÆÚ¼ä£¬0Îª·Ç»î¶¯ÆÚ¼ä
--Ä¿Ç°¸ÄÎª³£¹æ×´Ì¬£¬Ò»Ö±´ò¿ª
function Is51PartyTime()

--	if GetDateNum() >= 20070426 and GetDateNum() <= 20070507 then
		return 0
--	else
--		return 0
--	end

end

--»ñÈ¡ÄêÔÂÈÕÊı×Ö
function GetDateNum()

local nYear = date("%Y");
local nMonth = date("%m");
local nDay = date("%d");
local nDate = tonumber(nYear..nMonth..nDay);
	
	return nDate

end

------------------------------¼ÆËã±¾ÖÜÖÜ´Î----------------------------
--º¯ÊıÃû³Æ£ºÂÖ´Î·µ»Øº¯Êı
--º¯Êı¹¦ÄÜ£º·µ»Øµ±Ç°µÄÂÖ´Î
function zgc_pub_day_turn(day_num)
	local time_return = floor((GetTime()-57600)/(86400 * day_num))
	return time_return
end

--º¯ÊıÃû³Æ£ºÖÜĞòÊı¼ÆËãº¯Êı
--º¯Êı¹¦ÄÜ£º·µ»ØÖÜµÄĞòÊı
function Zgc_pub_week_seq()
	return floor((zgc_pub_day_turn(1) - 2)/7)
end

--Ñº½ğÀŞÌ¨¸øÍæ¼ÒÖ§¸¶Ñº½ğ
function yajin_leitai_pay(nNum)
	if nNum < 100 or nNum > 10000 then
		return 
	end
	--»ñµÃ½ğÇ®
	Earn(nNum * 10000);
	gf_WriteLogEx("L«i ®µi ®Æt c­îc","TiÒn c­îc tr¶ l¹i",nNum," Kim ","",GetTongName(),"","","","");
end