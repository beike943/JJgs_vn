--ÌìÃÅÕóÍ·ÎÄ¼þ
--by vivi
--2009-07-15

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\topscorelib.lua");
--Include("\\script\\lib\\xoyobi.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
THIENMON_LOG_TITLE = "Chien truong Thien Mon Tran"

CampOne_Name = "Qu©n Tèng";
CameTwo_Name = "Qu©n Liªu";

ALL_ID = 0;
CampOne_ID = 1;	--ÎäÁÖÁªÃËÔÚmissionÖÐÕóÓª
CampTwo_ID = 2;	--ÎäÁÖÅÑÍ½ÔÚmissionÖÐÕóÓª

tCampName = {"Qu©n Tèng","Qu©n Liªu"};

CampOne_Type = "camp_player"; --ÎäÁÖÁªÃËÕóÓªÀàÐÍ£¬°üÀ¨npc
CampTwo_Type = "camp_enemy";  --ÎäÁÖÅÑÍ½ÕóÓªÀàÐÍ£¬°üÀ¨npc
Neutral_Type = "camp_evil";		--ÖÐÁ¢npcÕóÓªÀàÐÍ

TMZ_EXP_EXT_RATE = min(VNG_CFG_TMZ_EXP_EXT_ADD_RATE or 0, 2)--¾­Ñé¼Ó³ÉÏµÊý
TMZ_JUNGONG_EXT_RATE = min(VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE or 0, 2)--¾ü¹¦¼Ó³ÉÏµÊý

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",};

--===============È«¾Ö±äÁ¿==========================
g_NpcName = "<color=green>phiªu kþ t­íng qu©n Qu¸ch Qu©n B»ng<color>: ";

MAP_ID = 6006;

PLAY_NEED_LV = 70;      --²ÎÓë×îÐ¡µÈ¼¶

PLAYER_NEED_NUM = 12;    --¶ÔÕóË«·½ÐèÒªµÄ×îÉÙÈËÊý
PLAYER_MAX_NUM = 16;    --¶ÔÕóË«·½¿É¼ÓÈëµÄ×î´óÈËÊý

MAX_ROOM_COUNT = 40;   --µØÍ¼×î´ó¿É¼ÓÔØÊý
--local nVersion,nCurGs = GetRealmType();
--if nCurGs == 1 then
--	MAX_ROOM_COUNT = 10;
--end

DEAD_BODY_TIME = 5;			--Ê¬Ìå´æÔÚÊ±¼ä

APPEAR_FLAG_POINT = 500; --500·ÖµÄÊ±ºò³öÏÖ´óÕóÆì
BROKEN_FLAG_POINT = 200; --»÷µ¹ÕóÆìµÃµ½200·Ö
BROKEN_EYE_POINT = 5; --»÷µ¹ÕóÑÛµÃµ½5·Ö
OVER_GAME_POINT = 1000;  --µ±Ò»·½µÄÕ½Õó´ïµ½1000·ÖÊ±£¬¶ÔÕ½½áÊø

GIVE_AWARD_MARK = 20; --²Î¼ÓÒ»´ÎµÄÈ«¶î»ý·Ö
MAX_MARK = 6000; --»ý·ÖÉÏÏÞ
MAX_HUFU = 8;  --Ãâ·Ñ»¢·ûÊý

CURE_ALL_PLAYER = 0;						--ÊÇ·ñÖÎÁÆËùÓÐºÍÆ½×´Ì¬µÄÍæ¼Ò
DRIVE_PLAYER_OUTOF_SHELTER = 1;	--ÊÇ·ñ´ò¿ªÇ¿ÖÆ´«ËÍºóÓªÍ£Áô¹ý¾ÃµÄÍæ¼ÒµÄ¹¦ÄÜ
INVINCIBILITY_TIME = 5;			--´«³öºóÓªµÄÎÞµÐÊ±¼ä£¬µ¥Î»Ãë

DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\playerdeath.lua";
NPC_DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\npc_death.lua";
TMZ_VM_SCRIPT = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
TMZ_TONG_RELAY_KEY_1 = "TMZ_TONG_SOCRE_RANK"; --ÔÚ¿ç·þÇøµÄÅÅÃû£¬Ã¿ÖÜÇå
TMZ_TONG_RELAY_KEY_2 = "TMZ_TONG_RANK_SHOW";  --ÏÔÊ¾ÔÚÃæ°åÉÏµÄ£¬¼´ÉÏÃæµÄ±¸·Ý
TMZ_TONG_RELAY_KEY_3 = "TMZ_TONG_RELAY_DATA"; --¼ÇÔÚ±¾·þµÄÊý¾Ý

--»îÔ¾¶ÈÏà¹Ø
TMZ_ACTIVE_PVP_DEATH_NUM = 6
TMZ_ACTIVE_PVP_LIMIT = 3
TMZ_ACTIVE_DAMAGE_LIMIT = 200000
TMZ_ACTIVE_HEAL_LIMIT = 100000
TMZ_ACTIVE_PVE_LIMIT = 6
TMZ_ACTIVE_EYE_LIMIT = 1
TMZ_ACTIVE_FLAG_LIMIT = 1

--Ã¿ÈÕ²Î¼ÓÏÞÖÆ
TMZ_DAILY_JOIN_LIMIT = 4

--Ã¿ÈÕÁì½±ÏÞÖÆ
TMZ_DAILY_AWARD_LIMIT = 4

--===============ÈÎÎñ±äÁ¿=========================
--ÔÚdefineÖÐ¶¨Òå

--=====================ÁÙÊ±±äÁ¿==================================
PTT_DIE_LOOP = 201;				--¼ÇÂ¼Íæ¼ÒÔÚÕ½³¡ËÀÍöµÄÊ±ºò£¬µ±Ç°¼ÆÊ±Æ÷µÄÑ­»·Êý
TASK_TEMP_DIE_TIME = 202; --¼ÇÂ¼Íæ¼ÒËÀÍöÊ±Ê±¼ä£¬´æÈëGetTime()£¬ÓÃÓÚËÀºó10sºó²ÅÄÜ³öÈ¥Õ½³¡

--===============missionÏà¹Ø======================
MISSION_ID = 54; --mission id
TIMER_ID = 84; --time id
LOG_ID = 404;					--µÇÂ½´¥·¢Æ÷±íID
LOG_TRIGGER_ID = 304;			--µÇÂ½´¥·¢Æ÷×Ô¶¨ÒåID

FRAME_PER_SECOND = 18;
FRAME_PER_MIN = 60*FRAME_PER_SECOND;

PEACE_TIME = 5*FRAME_PER_SECOND;--µÈ´ýÍæ¼ÒÈËÊý¿ªÆô¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
PEACE_TIMER_LOOP = (15*FRAME_PER_MIN/PEACE_TIME)-1;--µÈ´ýÍæ¼ÒÈËÊý¿ªÆô¼ÆÊ±Æ÷±¨Ê±´ÎÊý£¨15·ÖÖÓ£©
READY_TIME = 5*FRAME_PER_SECOND;--¿ªÕ½×¼±¸Ê±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
READY_TIMER_LOOP = (1*FRAME_PER_MIN/READY_TIME)-1;--¿ªÕ½×¼±¸Ê±¼ä¼ÆÊ±Æ÷±¨Ê±´ÎÊý£¨1·ÖÖÓ£©
FIGHT_TIME = 15*FRAME_PER_SECOND;			--´òÕÌÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬15Ãë
FIGHT_TIMER_LOOP = (40*FRAME_PER_MIN/FIGHT_TIME)-1;	--´òÕÌÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý£¨40·ÖÖÓ£©
WAITOUT_TIME = 15*FRAME_PER_SECOND;		--µÈ´ý½áÊøÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --µÈ´ý½áÊøÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý£¨°ë·ÖÖÓ£©

--==============¹«ÓÃmissionV±äÁ¿===================
MV_TMZ_LOAD = 1;   --ÊÇ·ñÒÑ¾­¼ÓÔØ¿ªÆô
MV_TMZ_STATE = 2;  --¼ÇÂ¼Õ½³¡µÄ×´Ì¬
MV_TMZ_MAP_ID = 3;        --±¾³¡ÌìÃÅÕóµÄMAPID
MV_TMZ_MAP_INDEX = 4;    --±¾³¡ÌìÃÅÕóµÄMAPË÷Òý
MV_TMZ_CAMPONE_EYE = 5; --¼ÇÂ¼µ±Ç°ÕóÓªÒ»µÄÕóÑÛÊý
MV_TMZ_CAMPTWO_EYE = 6; --¼ÇÂ¼µ±Ç°ÕóÓª¶þµÄÕóÑÛÊý
MV_TMZ_CAMPONE_POINT = 7; --¼ÇÂ¼µ±Ç°ÕóÓªÒ»µÄÕ½ÕóÊ±¼ä£¨»ý·Ö£©
MV_TMZ_CAMPTWO_POINT = 8; --¼ÇÂ¼µ±Ç°ÕóÓª¶þµÄÕ½ÕóÊ±¼ä£¨»ý·Ö£©
MV_TMZ_APPEAR_FLAG = 9;   --¼ÇÂ¼ÊÇ·ñÒÑ´´½¨´óÕ½Æì
MV_TMZ_WINNER_CAMP = 10;   --¼ÇÂ¼Ë­Ó®ÁË
MV_TMZ_SHOWDATA_IDX = 11;  --¼ÇÂ¼±¾´Î¶ÔÕóÔÚTMZ_ShowDataÖÐµÚ¼¸Ïî
MV_TIMER_LOOP = 12;				--¼ÇÂ¼TIMERµÄ±¨Ê±´ÎÊý
MV_TMZ_LOG_TIME = 13;     --¼ÇÂ¼¿ªÆôµÄÊ±¼ä ¸ñÊ½£º%m%d%H%M%S
MV_TMZ_GAME_LOOP = 14;    --¼ÇÂ¼GetGameLoop()
MV_TMZ_ERROR_NUM = 15;    --¼ÇÂ¼ÖØÐÂ´´½¨´¥·¢Æ÷µÄ´ÎÊý£¬´ïµ½Ò»¶¨´ÎÊý½«È¥³ý³¡µØ
MV_TMZ_TONG_CAMPONE_MAX = 16; --ÕóÓªÒ»°ï»á¿É½øÈ¥×î´óÈËÊý
MV_TMZ_TONG_CAMPTWO_MAX = 17; --ÕóÓª¶þ°ï»á¿É½øÈ¥×î´óÈËÊý
MV_TMZ_TONG_CAMPONE_USEFUL = 18; --ÕóÓªÒ»ÓÐÐ§²ÎÓë¶ÔÕóµÄÈËÊý
MV_TMZ_TONG_CAMPTWO_USEFUL = 19; --ÕóÓª¶þÓÐÐ§²ÎÓë¶ÔÕóµÄÈËÊý
MV_TMZ_TONG_CAMPONE_SCORE = 20;--ÕóÓªÒ»µ±Ç°¶ÔÕó»ý·Ö
MV_TMZ_TONG_CAMPTWO_SCORE = 21;--ÕóÓª¶þµ±Ç°¶ÔÕó»ý·Ö
MV_TMZ_TONG_CAMPONE_LV = 22;--ÕóÓªÒ»µ±Ç°¶ÔÕóµÈ¼¶
MV_TMZ_TONG_CAMPTWO_LV = 23;--ÕóÓª¶þµ±Ç°¶ÔÕóµÈ¼¶
MV_TMZ_TONG_CAMPONE_WEEK_WIN = 24;--ÕóÓªÒ»±¾ÖÜ¶ÔÕ½Ê¤³¡Êý
MV_TMZ_TONG_CAMPTWO_WEEK_WIN = 25;--ÕóÓª¶þ±¾ÖÜ¶ÔÕ½Ê¤³¡Êý
MV_TMZ_TONG_CAMPONE_WEEK_LOSE = 26;--ÕóÓªÒ»±¾ÖÜ¶ÔÕ½¸º³¡Êý
MV_TMZ_TONG_CAMPTWO_WEEK_LOSE = 27;--ÕóÓª¶þ±¾ÖÜ¶ÔÕ½¸º³¡Êý
MV_TMZ_TONG_CAMPONE_TOTAL_WIN = 28;--ÕóÓªÒ»×Ü¶ÔÕ½Ê¤³¡Êý
MV_TMZ_TONG_CAMPTWO_TOTAL_WIN = 29;--ÕóÓª¶þ×Ü¶ÔÕ½Ê¤³¡Êý
MV_TMZ_TONG_CAMPONE_TOTAL_LOSE = 30;--ÕóÓªÒ»×Ü¶ÔÕ½¸º³¡Êý
MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE = 31;--ÕóÓª¶þ×Ü¶ÔÕ½¸º³¡Êý
MV_TMZ_TONG_CAMPONE_LAST_WIN = 32;--ÕóÓªÒ»ÉÏ³¡Ê¤¸º
MV_TMZ_TONG_CAMPTWO_LAST_WIN = 33;--ÕóÓª¶þÉÏ³¡Ê¤¸º
MV_TMZ_TONG_CAMPONE_HUFU = 34;--ÕóÓªÒ»»¢·ûÊý
MV_TMZ_TONG_CAMPTWO_HUFU = 35;--ÕóÓª¶þ»¢·ûÊý

--==============¹«ÓÃmissionS±äÁ¿===================
MV_TMZ_TONG_CAMPONE_NAME = 1; --¼ÇÂ¼ÕóÓªÒ»°ï»áÃû×Ö
MV_TMZ_TONG_CAMPTWO_NAME = 2; --¼ÇÂ¼ÕóÓª¶þ°ï»áÃû×Ö

--==============³£Á¿£ºÕ½³¡µÄ×´Ì¬===================
MS_STATE_PEACE = 0;				--µÈ´ýÈËÊý½×¶Î
MS_STATE_READY = 1;				--×¼±¸×´Ì¬£¬ÈËÊýÆëµÈ´ý¿ªÕ½½×¶Î
MS_STATE_FIGHT = 2;				--¿ªÕ½×´Ì¬
MS_STATE_COMPLETE = 3;		--Õ½Õù½áÊø×´Ì¬

tPositionNpcA = {
--×îºóÎªÎïÆ·µôÂäÂÊ
	{"Hoa Nam Hæ","Hoa Nam Hæ",1792,3745},
	{"Hoa Nam tiÓu Êu","Hoa Nam tiÓu Êu",1791,3742},
	{"Hoa Nam tiÓu Êu","Hoa Nam tiÓu Êu",1785,3743},
	{"Sãi c¸i","Sãi c¸i",1780,3341},
	{"Sãi con","Sãi con",1786,3349},
	{"Sãi con","Sãi con",1781,3352},
	{"TiÓu tÆc ","TiÓu tÆc ",1770,3656},
	{"TiÓu tÆc ","TiÓu tÆc ",1765,3658},
	{"TiÓu tÆc ","TiÓu tÆc ",1772,3657},
	{"Lý Quû","Lý Quû",1767,3416},
	{"Th¸i TuÊn","Th¸i TuÊn",1768,3423},
	{"La Kinh","La Kinh",1759,3419},
	{{50,150,250,350},{"§Êu khÝ",2,1,3849},{"D©y buéc ngùa",2,1,3850},{"B×nh nhiªn liÖu",2,1,3849},{"Vá chuèi",2,1,3850}},
};

tPositionNpcB = {
	{"Ng­êi gç","Ng­êi gç",1863,3419},
	{"Ng­êi gç","Ng­êi gç",1691,3636},
	{{200,400,600,800},{"BÉy kÑp",2,1,3851},{"D©y buéc ngùa",2,1,3850},{"B×nh nhiªn liÖu",2,1,3849},{"Vá chuèi",2,1,3850}}	
};

tPositionNpcC = {
	{"T¹ Tam DÜnh","T¹ Tam DÜnh",1898,3557},
	{"L÷ NhÞ N­¬ng","L÷ NhÞ N­¬ng",1890,3559},
	{"M¹c Kinh Phong","M¹c Kinh Phong",1903,3598},
	{"Vong hån D­¬ng Diªn LiÖt","Vong hån D­¬ng Diªn LiÖt",1654,3325},
	{"Lý TuÇn S¬n","Lý TuÇn S¬n",1661,3519},
	{"§¹i v­¬ng Sµi Phong","§¹i v­¬ng Sµi Phong",1646,3487},
	{"NhÞ v­¬ng Vü N­¬ng","NhÞ v­¬ng Vü N­¬ng",1666,3488},
	{{200},{"M«n ph¸i ¸m tiªu",2,1,3852}}
};

tPositionNpcS = {
	{"C­êng ®¹o La La","C­êng ®¹o La La"},
	{{1844,3621},{1841,3633},{1834,3628},{1835,3619},{1839,3612},{1842,3614},{1716,3627},{1712,3635},{1704,3631},{1704,3619},{1709,3612},
	 {1714,3613},{1729,3446},{1726,3436},{1717,3442},{1718,3452},{1718,3452},{1729,3456},{1854,3430},{1850,3442},{1844,3439},{1843,3426},
	 {1848,3418},{1853,3421}},	
};

tPositionNpcBOSS = { -- ±ð³¬¹ýËÄ¸ö
	{{"Cuång t­íng Minh NhËt","Cuång t­íng Minh NhËt",1776,3528},{3,25,250},{150,TASKID_TMZ_BOSS}},
	{{"Ngôy t­íng ¸m NguyÖt","Ngôy t­íng ¸m NguyÖt",1776,3528},{0,10,0},{50,TASKID_TMZ_BOSS}},
};

--µÀ¾ßÐ§¹û
tPositionBox = {--Ä£°åÃû npcÃû ×´Ì¬Ãû³Æ Ð§¹ûÃèÊö Ä§·¨ÊôÐÔ×Ö·û´® ÊýÖµ ³ÖÐøÊ±¼ä
	{"Gi¸ vò khÝ","Gi¸ vò khÝ",1787,3508,"Dòng M·nh","t¨ng lùc c«ng kÝch 100%, duy tr× 30 gi©y","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi¸ vò khÝ","Gi¸ vò khÝ",1754,3543,"Dòng M·nh","t¨ng lùc c«ng kÝch 100%, duy tr× 30 gi©y","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi¸ khiªn","Gi¸ khiªn",1775,3411,"Hung h·n","T¨ng lùc phßng ngù 100%, duy tr× 30 gi©y","state_receive_half_damage",100,30},
	{"L¸ th¶o d­îc","L¸ th¶o d­îc",1775,3666,"TrÞ th­¬ng","Mçi gi©y håi phôc 10% sinh mÖnh, duy tr× 30 gi©y","state_life_per_per8f",500,30},
	{"Giµy giã","Giµy giã",1851,3527,"Ngôy bé","Èn th©n, duy tr× 30 gi©y","state_illusion_latent",0,30},
	{"Giµy giã","Giµy giã",1686,3528,"Ngôy bé","Èn th©n, duy tr× 30 gi©y","state_illusion_latent",0,30},
};

tPositionNpcEye = {--Ä£°åÃû¡¢npcÃû¡¢×ø±êµã
	[0] = {
		{"C¸n cê 1","Sinh M«n (ch­a chiÕm lÜnh)",1840,3622},
		{"C¸n cê 2","Tö M«n (ch­a chiÕm lÜnh)",1710,3626},
		{"C¸n cê 3","C¶nh M«n (ch­a chiÕm lÜnh)",1724,3447},
		{"C¸n cê 4","DiÖt M«n (ch­a chiÕm lÜnh)",1849,3431},		
	},
	[1] = {
		{"Sinh m«n tÝm","Sinh M«n ("..CampOne_Name..")",1840,3622},
		{"Tö m«n tÝm","Tö M«n ("..CampOne_Name..")",1710,3626},
		{"C¶nh m«n tÝm","C¶nh M«n ("..CampOne_Name..")",1724,3447},
		{"DiÖt m«n tÝm","DiÖt M«n ("..CampOne_Name..")",1849,3431},				
	},
	[2] = {
		{"Sinh m«n lam","Sinh M«n ("..CameTwo_Name..")",1840,3622},
		{"Tö m«n lam","Tö M«n ("..CameTwo_Name..")",1710,3626},
		{"C¶nh m«n lam","C¶nh M«n ("..CameTwo_Name..")",1724,3447},
		{"DiÖt m«n lam","DiÖt M«n ("..CameTwo_Name..")",1849,3431},				
	},	
};

tPositionNpcFlag = {--Ä£°åÃû¡¢npcÃû¡¢×ø±êµã 
	[1] = {
		{"TrËn kú tÝm","§¹i trËn kú ("..CampOne_Name..")",1820,3347},
		{"B¹i kú tÝm","TrËn Kú h­ tæn ("..CampOne_Name..")",1820,3347},		
	},
	[2] = {
		{"TrËn kú lam","§¹i trËn kú ("..CameTwo_Name..")",1737,3726},
		{"B¹i kú lam","TrËn Kú h­ tæn ("..CameTwo_Name..")",1737,3726},		
	},
};

--°Ë¸ö·ðµÄÎ»ÖÃ
tPositionFo = {
	{"Nga Mi tiÓu s­ tû 1","Nga Mi tiÓu s­ tû ",1907,3367,1645,3666},
	{"Nga Mi tiÓu s­ tû 2","Nga Mi tiÓu s­ tû ",1913,3367,1652,3665},
	{"Nga Mi tiÓu s­ tû 3","Nga Mi tiÓu s­ tû ",1908,3390,1652,3689},
	{"Nga Mi tiÓu s­ tû 4","Nga Mi tiÓu s­ tû ",1914,3389,1642,3687}
}

tPositionCamp = { --ºóÓª¸´»îµã Ç°ÓªÕ½³¡µã ²Ö¿â¹ÜÀíÔ± Àë¿ªnpc ÉÏÕónpc
	{{1912,3377},{{1855,3435},{1831,3335}},{1901,3356},{1891,3349},{1891,3361}},
	{{1643,3675},{{1703,3618},{1725,3737}},{1664,3715},{1657,3709},{1660,3689}},
};

--½çÃæÏÔÊ¾
--TMZ_ShowData = TMZ_ShowData or {
--	CurN = 0,
--	name = "ÌìÃÅÕó",
--	title = {"ÐÕÃû","ÕóÓª","Á÷ÅÉ","É±ÈËÊý","ËÀÍöÊý","ÕóÑÛ"},
--	szFormat = "%-17s%-9s%-9s%-7s%-7s%-6s",
--};
--TMZ_LoadData();

--¾­Ñé·­±¶µÄÎïÆ·
tAwardItem = 
{
	[0] = {},
	[1] = {"Qu©n C«ng Ch­¬ng",2,1,9999,1},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,1},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,1},
	[4] = {"qu©n c«ng ch­¬ng vinh dù ",2,1,30642,1},
};
tMocRuong = 
{
	[0] = {"Kh«ng", 1},
	[1] = {"Qu©n C«ng Ch­¬ng", 3},
	[2] = {"Qu©n C«ng §¹i", 6},
	[3] = {"Qu©n C«ng Huy Hoµng", 10},
	[4] = {"VIP", 0},	
};


g_tWinExtraAward =--Ê¤·½×¨Êô½±Àø
{
	{ {"ThiÕt Tinh cÊp 1", {2,1,30533,1}, nil,nil, {1, 100}}, 2400},
	{ {"ThiÕt Tinh cÊp 2", {2,1,30534,1}, nil,nil, {1, 100}}, 500},
	{ {"ThiÕt Tinh cÊp 3", {2,1,30535,1}, nil,nil, {1, 100}}, 100},
	{ {"Ma §ao Th¹ch cÊp 1", {2,1,30428,1}, nil,nil, {1, 100}}, 600},
	{ {"Ma §¹o Th¹ch cÊp 2", {2,1,30429,1}, nil,nil, {1, 100}}, 300},
	{ {"Ma §ao Th¹ch cÊp 3", {2,1,30430,1}, nil,nil, {1, 100}}, 100},
    {{MA_GiveMoney, {10000}}, 3000},
    {{MA_GiveMoney, {40000}}, 2000},
    {{MA_GiveMoney, {100000}}, 900},
    {{MA_GiveMoney, {1000000}}, 100},
};

--Qu©n C«ng
tbQuanCong_HP = {
	[0] = {400, 200},
	[1] = {800, 400},
	[2] = {2000, 900},
	[3] = {4000, 1800},
	[4] = {4800, 2400},
}

--±Ø¸ø½±Àø
g_tWinExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--¾ü¹¦
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,2},0,1},
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,1},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,800,1},--¾ü¹¦
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,3},0,1},
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,2000,1},--¾ü¹¦
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,4},0,1},
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,1},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,4000,1},--¾ü¹¦
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,5},0,1},
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,1},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,4800,1},--¾ü¹¦
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,6},0,1},
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,1},0,1},
		},
	},
};
g_tLoseExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,200,1},--¾ü¹¦
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,1},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--¾ü¹¦
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,2},0,1},
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,900,1},--¾ü¹¦
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,3},0,1},
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,2},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,1800,1},--¾ü¹¦
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,4},0,1},
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,3},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,2400,1},--¾ü¹¦
			--{1,"ÓÂÊ¿»ÕÕÂ",{2,1,30498,5},0,1},
			{1,"Hu©n ch­¬ng anh hïng",{2,1,30499,4},0,1},
		},
	},
};

tbNormalAward = 
{
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,2},0,1},
			--{1,"Ó¢ÐÛÑ«ÕÂ",{2,1,30499,0},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,1},0,1},
			--{1,"Ó¢ÐÛÑ«ÕÂ",{2,1,30499,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,9000000,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,2},0,1},
			--{1,"Ó¢ÐÛÑ«ÕÂ",{2,1,30499,2},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,12000000,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,4},0,1},
			--{1,"Ó¢ÐÛÑ«ÕÂ",{2,1,30499,3},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,18000000,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,4},0,1},
			--{1,"Ó¢ÐÛÑ«ÕÂ",{2,1,30499,3},0,1},
		},
	},
}
 tbAcvtiveDesc = 
{
	{"<color=green>CÊp thÊp<color>", "<color=green>TÇm th­êng<color>",},
	{"<color=green>CÊp h¹ trung<color>", "<color=green>B×nh th­êng<color>",},
	{"<color=yellow>CÊp trung<color>", "<color=yellow>T­¬ng ®èi tèt<color>",},
	{"<color=yellow>CÊp th­îng trung<color>", "<color=yellow>Dòng m·nh<color>",},
	{"<color=red>CÊp cao<color>", "<color=red>LÊy 1 chäi 10<color>",},
	{"<color=red>CÊp siªu cao<color>", "<color=red>LÊp l¸nh s¸ng ngêi<color>",},
}

tbAcvtiveWinAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{28,180,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,3},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,9000000,1},
			--{28,240,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,6},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,12000000,1},
			--{28,300,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,12},0,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,1},0,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,14400000,1},
			--{28,360,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,18},0,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,2},0,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,18000000,1},
			--{28,420,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,24},0,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,4},0,1},
		},
	},
}

tbAcvtiveLossAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2000000,1},
			--{28,60,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,1},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3000000,1},
			--{28,80,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,2},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
			--{28,100,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,4},0,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4800000,1},
			--{28,120,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,6},0,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{28,140,1},--ÕæÆø
			--{1,"ÐÇºÛËéÆ¬",{2,1,30299,8},0,1},
			--{1,"ÌìÍâÁ÷ÐÇ",{2,1,30321,1},0,1},
		},
	},
}

tAwardCloth = {
	--1ÎªµÚ1Ì× 2ÎªµÚ2Ì× 3ÎªµÚ3Ì× 4ÎªµÚ4Ì×
	--ÏÈ·Ö²¿Î»ÔÙ·ÖÌ××°£¨µÚ1Ì×ÓÐÁ½Ì×£©×îºó·ÖÌåÐÍ
	--Ãû×Ö id ¶Ò»»ËùÐèÒª»ý·Ö ×îºóÒ»ÁÐÊÇ¶Ò»»Áú·ï×°±¸ËùÐèÒªµÄ»ý·Ö
	[1] = {
		{{{"Cöu D­¬ng Qu¸n",0,103,3032,0,3200},{"Cöu D­¬ng Qu¸n",0,103,3038,0,3200},{"Cöu D­¬ng Qu¸n",0,103,3044,0,3200},{"Cöu D­¬ng Qu¸n",0,103,3050,0,3200}},{{"Cöu D­¬ng Qu¸n",0,103,3035,0,3200},{"Cöu D­¬ng Qu¸n",0,103,3041,0,3200},{"Cöu D­¬ng Qu¸n",0,103,3047,0,3200},{"Cöu D­¬ng Qu¸n",0,103,3053,0,3200}}},
		{{{"Cöu D­¬ng Y",0,100,3032,0,3200},{"Cöu D­¬ng Y",0,100,3038,0,3200},{"Cöu D­¬ng Y",0,100,3044,0,3200},{"Cöu D­¬ng Y",0,100,3050,0,3200}},{{"Cöu D­¬ng Y",0,100,3035,0,3200},{"Cöu D­¬ng Y",0,100,3041,0,3200},{"Cöu D­¬ng Y",0,100,3047,0,3200},{"Cöu D­¬ng Y",0,100,3053,0,3200}}},
		{{{"Cöu D­¬ng trang",0,101,3032,0,3200},{"Cöu D­¬ng trang",0,101,3038,0,3200},{"Cöu D­¬ng trang",0,101,3044,0,3200},{"Cöu D­¬ng trang",0,101,3050,0,3200}},{{"Cöu D­¬ng trang",0,101,3035,0,3200},{"Cöu D­¬ng trang",0,101,3041,0,3200},{"Cöu D­¬ng trang",0,101,3047,0,3200},{"Cöu D­¬ng trang",0,101,3053,0,3200}}},
	},
	[2] = {
		{{{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3033,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3039,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3045,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng NhËt Qu¸n",0,103,3051,1600,1600}},{{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3036,1600,1600},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3042,1600,1600},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3048,1600,1600},{"Tinh Kh¾c-Cöu ¢m NguyÖt Qu¸n",0,103,3054,1600,1600}}},
		{{{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3033,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3039,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3045,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng Háa Y",0,100,3051,1600,1600}},{{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3036,1600,1600},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3042,1600,1600},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3048,1600,1600},{"Tinh Kh¾c-Cöu ¢m Thñy Y",0,100,3054,1600,1600}}},
		{{{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3033,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3039,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3045,1600,1600},{"Tinh Kh¾c-Cöu D­¬ng Long Trang",0,101,3051,1600,1600}},{{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3036,1600,1600},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3042,1600,1600},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3048,1600,1600},{"Tinh Kh¾c-Cöu ¢m Phông Trang",0,101,3054,1600,1600}}},
	},
	[3] = {
		{{{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3034,1600,0},{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3040,1600,0},{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3046,1600,0},{"Thiªn NghÜa-Cöu D­¬ng NhËt Qu¸n",0,103,3052,1600,0},},{{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3037,1600,0},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3043,1600,0},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3049,1600,0},{"Thiªn NghÜa-Cöu ¢m NguyÖt Qu¸n",0,103,3055,1600,0}}},
		{{{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3034,1600,0},{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3040,1600,0},{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3046,1600,0},{"Thiªn NghÜa-Cöu D­¬ng Háa Y",0,100,3052,1600,0}},{{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3037,1600,0},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3043,1600,0},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3049,1600,0},{"Thiªn NghÜa-Cöu ¢m Thñy Y",0,100,3055,1600,0}}},
		{{{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3034,1600,0},{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3040,1600,0},{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3046,1600,0},{"Thiªn NghÜa-Cöu D­¬ng Long Trang",0,101,3052,1600,0}},{{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3037,1600,0},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3043,1600,0},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3049,1600,0},{"Thiªn NghÜa-Cöu ¢m Phông Trang",0,101,3055,1600,0}}},
	},
	[4] = {
		{{{"Long §»ng Tø H¶i Qu¸n",0,103,3056,0},{"Long §»ng Tø H¶i Qu¸n",0,103,3057,0},{"Long §»ng Tø H¶i Qu¸n",0,103,3058,0},{"Long §»ng Tø H¶i Qu¸n",0,103,3059,0}},{{"Phông Vò Cöu Thiªn Qu¸n",0,103,3060,0},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3061,0},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3062,0},{"Phông Vò Cöu Thiªn Qu¸n",0,103,3063,0}}},
		{{{"Long §»ng Tø H¶i Y",0,100,3056,0},{"Long §»ng Tø H¶i Y",0,100,3057,0},{"Long §»ng Tø H¶i Y",0,100,3058,0},{"Long §»ng Tø H¶i Y",0,100,3059,0}},{{"Phông Vò Cöu Thiªn Y",0,100,3060,0},{"Phông Vò Cöu Thiªn Y",0,100,3061,0},{"Phông Vò Cöu Thiªn Y",0,100,3062,0},{"Phông Vò Cöu Thiªn Y",0,100,3063,0}}},
		{{{"Long §»ng Tø H¶i Trang",0,101,3056,0},{"Long §»ng Tø H¶i Trang",0,101,3057,0},{"Long §»ng Tø H¶i Trang",0,101,3058,0},{"Long §»ng Tø H¶i Trang",0,101,3059,0}},{{"Phông Vò Cöu Thiªn Trang",0,101,3060,0},{"Phông Vò Cöu Thiªn Trang",0,101,3061,0},{"Phông Vò Cöu Thiªn Trang",0,101,3062,0},{"Phông Vò Cöu Thiªn Trang",0,101,3063,0}}},
	},
};

tAwardWeapon = {
	[2] = {{"L­u Ly Giíi §ao",0,3,8890,800,5200},{"Tinh Kh¾c-L­u Ly Giíi §ao",0,3,8892,2600,2600},{"Thiªn NghÜa-L­u Ly Giíi §ao",0,3,8894,2600,0},{"Cöu Ch©u-L­u Ly Giíi §ao",0,3,8932,0,670,1}},
	[3] = {{"Kinh L«i ThiÒn Tr­îng",0,8,8908,800,5200},{"Tinh Kh¾c-Kinh L«i ThiÒn Tr­îng",0,8,8909,2600,2600},{"Thiªn NghÜa-Kinh L«i ThiÒn Tr­îng",0,8,8910,2600,0},{"Cöu Ch©u-Kinh L«i ThiÒn Tr­îng",0,8,8934,0,672,1}},
	[4] = {{"L«i ¢m Nang Thñ",0,0,8872,800,5200},{"Tinh Kh¾c-L«i ¢m Nang Thñ",0,0,8874,2600,2600},{"Thiªn NghÜa-L«i ¢m Nang Thñ",0,0,8876,2600,0},{"Cöu Ch©u-L«i ¢m Nang Thñ",0,0,8933,0,672,1}},
	[6] = {{"¢m D­¬ng Xuyªn ¶nh",0,1,8878,800,5200},{"Tinh Kh¾c-¢m D­¬ng Xuyªn ¶nh",0,1,8879,2600,2600},{"Thiªn NghÜa-¢m D­¬ng Xuyªn ¶nh",0,1,8880,2600,0},{"Cöu Ch©u-¢m D­¬ng Xuyªn ¶nh",0,1,8935,0,671,1}},
	[8] = {{"Tõ Hµn ¢m KiÕm",0,2,8881,800,5200},{"Tinh Kh¾c-Tõ Hµn ¢m KiÕm",0,2,8884,2600,2600},{"Thiªn NghÜa-Tõ Hµn ¢m KiÕm",0,2,8887,2600,0},{"Cöu Ch©u-Tõ Hµn ¢m KiÕm",0,2,8936,0,672,1}},
	[9] = {{"Cöu Hoµn Bèi CÇm",0,10,8917,800,5200},{"Tinh Kh¾c-Cöu Hoµn Bèi CÇm",0,10,8918,2600,2600},{"Thiªn NghÜa-Cöu Hoµn Bèi CÇm",0,10,8919,2600,0},{"Cöu Ch©u-Cöu Hoµn Bèi CÇm",0,10,8937,0,672,1}},
	[11] = {{"Quy L©n Hé Thñ",0,0,8873,800,5200},{"Tinh Kh¾c-Quy L©n Hé Thñ",0,0,8875,2600,2600},{"Thiªn NghÜa-Quy L©n Hé Thñ",0,0,8877,2600,0},{"Cöu Ch©u-Quy L©n Hé Thñ",0,0,8938,0,670,1}},
	[12] = {{"TrÊn Ng¹o C«n",0,5,8899,800,5200},{"Tinh Kh¾c-TrÊn Ng¹o C«n",0,5,8900,2600,2600},{"Thiªn NghÜa-TrÊn Ng¹o C«n",0,5,8901,2600,0},{"Cöu Ch©u-TrÊn Ng¹o C«n",0,5,8939,0,671,1}},
	[14] = {{"ThuÇn Phong KiÕm",0,2,8882,800,5200},{"Tinh Kh¾c-ThuÇn Phong KiÕm",0,2,8885,2600,2600},{"Thiªn NghÜa-ThuÇn Phong KiÕm",0,2,8888,2600,0},{"Cöu Ch©u-ThuÇn Phong KiÕm",0,2,8940,0,672,1}},
	[15] = {{"Tinh §Èu ChuyÓn Bót",0,9,8911,800,5200},{"Tinh Kh¾c-Tinh §Èu ChuyÓn Bót",0,9,8913,2600,2600},{"Thiªn NghÜa-Tinh §Èu ChuyÓn Bót",0,9,8915,2600,0},{"Cöu Ch©u-Tinh §Èu ChuyÓn Bót",0,9,8941,0,673,1}},
	[17] = {{"Ph¸ Qu©n TrËn Th­¬ng",0,6,8902,800,5200},{"Tinh Kh¾c-Ph¸ Qu©n TrËn Th­¬ng",0,6,8903,2600,2600},{"Thiªn NghÜa-Ph¸ Qu©n TrËn Th­¬ng",0,6,8904,2600,0},{"Cöu Ch©u-Ph¸ Qu©n TrËn Th­¬ng",0,6,8942,0,670,1}},
	[18] = {{"Truy MÖnh Cung",0,4,8896,800,5200},{"Tinh Kh¾c-Truy MÖnh Cung",0,4,8897,2600,2600},{"Thiªn NghÜa-Truy MÖnh Cung",0,4,8898,2600,0},{"Cöu Ch©u-Truy MÖnh Cung",0,4,8943,0,671,1}},
	[20] = {{"ThiÖp Cèt HuyÕt §ao",0,7,8905,800,5200},{"Tinh Kh¾c-ThiÖp Cèt HuyÕt §ao",0,7,8906,2600,2600},{"Thiªn NghÜa-ThiÖp Cèt HuyÕt §ao",0,7,8907,2600,0},{"Cöu Ch©u-ThiÖp Cèt HuyÕt §ao",0,7,8944,0,671,1}},
	[21] = {{"LuyÖn Hån HuyÕt Tr¶o",0,11,8920,800,5200},{"Tinh Kh¾c-LuyÖn Hån HuyÕt Tr¶o",0,11,8922,2600,2600},{"Thiªn NghÜa-LuyÖn Hån HuyÕt Tr¶o",0,11,8924,2600,0},{"Cöu Ch©u-LuyÖn Hån HuyÕt Tr¶o",0,11,8945,0,673,1}},
	[23] = {{"Ngù Thiªn Phong KiÕm",0,2,8883,800,5200},{"Tinh Kh¾c-Ngù Thiªn Phong KiÕm",0,2,8886,2600,2600},{"Thiªn NghÜa-Ngù Thiªn Phong KiÕm",0,2,8889,2600,0},{"Cöu Ch©u-Ngù Thiªn Phong KiÕm",0,2,8946,0,672,1}},
	[25] = {{"ThÇn DiÖm Thiªn §ao",0,3,8891,800,5200},{"Tinh Kh¾c-ThÇn DiÖm Thiªn §ao",0,3,8893,2600,2600},{"Thiªn NghÜa-ThÇn DiÖm Thiªn §ao",0,3,8895,2600,0},{"Cöu Ch©u-ThÇn DiÖm Thiªn §ao",0,3,8947,0,670,1,1}},
	[26] = {{"ThÇn Phong Ph¸n Bót",0,9,8912,800,5200},{"Tinh Kh¾c-ThÇn Phong Ph¸n Bót",0,9,8914,2600,2600},{"Thiªn NghÜa-ThÇn Phong Ph¸n Bót",0,9,8916,2600,0},{"Cöu Ch©u-ThÇn Phong Ph¸n Bót",0,9,8948,0,673,1}},
	[27] = {{"ThÇn Linh Chó Tr¶o",0,11,8921,800,5200},{"Tinh Kh¾c-ThÇn Linh Chó Tr¶o",0,11,8923,2600,2600},{"Thiªn NghÜa-ThÇn Linh Chó Tr¶o",0,11,8925,2600,0},{"Cöu Ch©u-ThÇn Linh Chó Tr¶o",0,11,8949,0,671,1}},
	[29] = {{"Linh Lung Chi",0,13,8929,800,5200},{"Tinh Kh¾c-Linh Lung Chi",0,13,8930,2600,2600},{"Thiªn NghÜa-Linh Lung Chi",0,13,8931,2600,0},{"Cöu Ch©u-Linh Lung Chi",0,13,8950,0,671,1}},
	[30] = {{"Cöu Tiªu S¸o",0,12,8926,800,5200},{"Tinh Kh¾c-Cöu Tiªu S¸o",0,12,8927,2600,2600},{"Thiªn NghÜa-Cöu Tiªu S¸o",0,12,8928,2600,0},{"Cöu Ch©u-Cöu Tiªu S¸o",0,12,8951,0,673,1}},
};

tTongScoreLv = {
	{150,1,8},
	{190,2,12},
	{99999,3,16},
};

--- Add Qu©n C«ng -
tbQuanCongTMT =
{
	{300,100},
	{600,200},
	{1500,500},
	{3000,1000},
	{3600, 1200},
}
