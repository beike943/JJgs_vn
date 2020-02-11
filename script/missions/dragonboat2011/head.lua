--½Å±¾¹¦ÄÜ£ºº£ÉÏÁúÖÛÕ½Í·ÎÄ¼þ
--¹¦ÄÜÉè¼Æ£º´óÐÜ¡¢Ð¡ÓîÖæ
--¹¦ÄÜ¿ª·¢£ºÁõ²¨¡¢´å³¤
--¹¦ÄÜ²âÊÔ£ºÐ¡ÐÜ¡¢·¹½ã
--¿ª·¢Ê±¼ä£º2011-8-23
--ÐÞ¸Ä¼ÇÂ¼£º
Include("\\script\\missions\\dragonboat2011\\string.lua")
Include("\\script\\lib\\missionfunctions.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\task_values.lua")
Include("\\script\\lib\\npccmdhead.lua")

PLAYER_DEATH_SCRIPT = "\\script\\missions\\dragonboat2011\\npc\\death_palyer.lua"

LONGCHAU_LOG_TITLE = "Hai Chien Long Chau"

--===========»ù±¾ÅäÖÃ±íÐÅÏ¢=====================
MAPID = 6008 --µØÍ¼£É£Ä
MISSIONID = 56 --mission ID
TIMERID = 86 --Ê±¼ä´¥·¢Æ÷ £É£Ä
tMsLogInPos = {
	[1] = {1486,3294},
	[2] = {1627,3102},
} --½øÈëµã
tMsFightPos = {
	[1] = {1516,3275},
	[2] = {1610,3159},
}--Õ½¶·µã
tMsLogOutPos = {
	[1] = {150,1694,3140},--{300,1648,3534},
	[2] = {150,1694,3140},--{300,1648,3534},
} --µÇ³öµã
tMsOpenTime = {
	[1] = {1000,1100},
	[2] = {1600,1700},
	[3] = {2200,2300},
} --¿ª·ÅÊ±¼ä
tMsNpcPos = {
	[1] = {1478,3293},--¾üÐè¹Ù
	[2] = {1627,3095},
	[3] = {1499,3306},--Áìº½Ô±
	[4] = {1639,3117},
	[5] = {1541,3219},--ÑîÆßÐã
	[6] = {1589,3219},--ÏôÌ©
}
tMsPlayerRev = {
	[1] = {1526,3329},
	[2] = {1663,3134},
} --ÖØÉúµã
tMsFireBoat = {
	[1] = {1523,3283},
	[2] = {1603,3151},
} --»ð´¬³öÏÖµã
tMsBox = {
	[1] = {1580,3168},
	[2] = {1546,3188},
	[3] = {1511,3238},
	[4] = {1569,3186},
	[5] = {1605,3194},
	[6] = {1598,3239},
	[7] = {1552,3273},
	[8] = {1581,3249},
	[9] = {1556,3209},
	[10] = {1565,3246},
	[11] = {1525,3208},
	[12] = {1547,3239},
	[13] = {1583,3211},
	[14] = {1535,3242},
	[15] = {1537,3254},
	[16] = {1571,3233},
}--Æ¯Á÷Ïä×ø±ê
tMsBoxCopy = tMsBox ----Æ¯Á÷Ïä×ø±ê¿½±´

tMsSongBoat = {
	[1] = {1523,3283},
	[2] = {1619,3167},
}
tMsLiaoBoat = {
	[1] = {1603,3151},
	[2] = {1509,3270},
}
--==============È«¾Ö±äÁ¿=========================
PLAY_NEED_LV = 77   --²ÎÓë×îÐ¡µÈ¼¶
WIN_AWARD = 2000000 --Ê¤Àû»ñµÃµÄ¾­Ñé
FAIL_AWARD = 1000000 -- Ê§°Ü»ñµÃµÄ¾­Ñé
MAX_AWARD_DAY = 6000000 --Ò»Ìì»ñµÃµÄ¾­ÑéÉÏÏÞ
MAX_ROOM_COUNT = 40   --µØÍ¼×î´ó¿É¼ÓÔØÊý
PLAYER_MAX_NUM = 16 --µ¥·½×î¶àÈËÊý
PLAYER_NEED_NUM = 8   --¶ÔÕóË«·½ÐèÒªµÄ×îÉÙÈËÊý
OVER_GAME_POINT = 100 --·ÖÊýÉÏÏÞ
FIRE_BOAT_TIME_ONE = 10 --´¥·¢»ð´¬µÄ·ÖÊý
FIRE_BOAT_TIME_TWO = 60 --´¥·¢»ð´¬µÄ·ÖÊý
ERROR_ALLOW_POINT = 4 --ÔÊÐíÎó²îÖµ
INCREASE_POINT = 10 --×Ô¶¯Ôö³¤·ÖÖµ
REGIST_FEES = 60000  --±¨Ãû·ÑÓÃ
FIREBOAT_POINT = 30 --»ð´¬µ½´ï»ñµÃµÄ·ÖÊý
--================ÈÎÎñ±äÁ¿===============
PLAYER_STATUS = 1715;	--¼ÇÂ¼Íæ¼ÒÊÇ¹ÛÖÚ»¹ÊÇ²ÎÈüÑ¡ÊÖ¡£0Ê²Ã´¶¼²»ÊÇ£¬1Îª¹ÛÖÚ£¬2Îª²ÎÈüÑ¡ÊÖ
						--ÒýÓÃÁúÖÛÈü±äÁ¿£¬Îª2²»ÄÜÏÂÂí
--==========ÕóÓª========================================
ALL_ID = 0 
CampSong_ID = 1 --ËÎ
CampLiao_ID = 2 --ÁÉ
tCampName = {"Qu©n Tèng","Qu©n Liªu"}

CampSong_Type = "camp_player" --ÎäÁÖÁªÃËÕóÓªÀàÐÍ£¬°üÀ¨npc
CampLiao_Type = "camp_enemy"  --ÎäÁÖÅÑÍ½ÕóÓªÀàÐÍ£¬°üÀ¨npc
Neutral_Type = "camp_evil"		--ÖÐÁ¢npcÕóÓªÀàÐÍ

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",
}

--=====================´¥·¢Æ÷¶¨Òå=================
LOG_ID = 3300 					--µÇÂ½´¥·¢Æ÷±íID
LOG_TRIGGER_ID = 3040 			--µÇÂ½´¥·¢Æ÷×Ô¶¨ÒåID

--==============³£Á¿£ºÕ½³¡µÄ×´Ì¬===================
MS_STATE_PEACE = 0				--µÈ´ýÈËÊý½×¶Î
MS_STATE_READY = 1   			--×¼±¸×´Ì¬£¬ÈËÊýÆëµÈ´ý¿ªÕ½½×¶Î
MS_STATE_FIGHT = 2				--¿ªÕ½×´Ì¬
MS_STATE_COMPLETE = 3		    --Õ½Õù½áÊø×´Ì¬

--==============¹«ÓÃmissionV±äÁ¿===================
MV_LZZ_LOAD = 1    --ÊÇ·ñÒÑ¾­¼ÓÔØ¿ªÆô
MV_LZZ_STATE = 2   --¼ÇÂ¼Õ½³¡µÄ×´Ì¬
MV_LZZ_MAP_ID = 3         --±¾³¡µÄMAPID
MV_LZZ_MAP_INDEX = 4     --±¾³¡µÄMAPË÷Òý
MV_LZZ_CAMPONE_POINT = 7  --¼ÇÂ¼µ±Ç°ÕóÓªÒ»µÄÕ½ÕóÊ±¼ä£¨»ý·Ö£©
MV_LZZ_CAMPTWO_POINT = 8  --¼ÇÂ¼µ±Ç°ÕóÓª¶þµÄÕ½ÕóÊ±¼ä£¨»ý·Ö£©
MV_LZZ_WINNER_CAMP = 10    --¼ÇÂ¼Ë­Ó®ÁË
MV_TIMER_LOOP = 12 				--¼ÇÂ¼TIMERµÄ±¨Ê±´ÎÊý
MV_LZZ_LOG_TIME = 13      --¼ÇÂ¼¿ªÆôµÄÊ±¼ä ¸ñÊ½£º%m%d%H%M%S
MV_LZZ_GAME_LOOP = 14     --¼ÇÂ¼GetGameLoop()
MV_LZZ_ERROR_NUM = 15     --¼ÇÂ¼ÖØÐÂ´´½¨´¥·¢Æ÷µÄ´ÎÊý£¬´ïµ½Ò»¶¨´ÎÊý½«È¥³ý³¡µØ
MV_LZZ_SONGBOAT_IDX = 16 --ËÎ»ð´¬Ë÷Òý
MV_LZZ_LIAOBOAT_IDX = 17 --ËÎ»ð´¬Ë÷Òý
MV_LZZ_SONGFIREBOAT_TAG1 =18 --ËÎ»ð´¬µÚÒ»´ÎË¢³ö
MV_LZZ_SONGFIREBOAT_TAG2 =19 --ËÎ»ð´¬µÚ¶þ´ÎË¢³ö
MV_LZZ_LIAOFIREBOAT_TAG1 =20 --ÁÉ»ð´¬µÚÒ»´ÎË¢³ö
MV_LZZ_LIAOFIREBOAT_TAG2 =21 --ÁÉ»ð´¬µÚ¶þ´ÎË¢³ö

--====================TimerÏà¹ØµÄ±äÁ¿=========================
PEACE_TIME_ATOM = 5 --5min
READY_TIME_ATOM = 1 --1min
FIGHT_TIME_ATOM = 40 --40min
WAITOUT_TIME_ATOM = 0.5 --0.5min
------------------------------------------------------------
FRAME_PER_SECOND = 18  --Ò»ÃëÄÚµÄÖ¡ÊýÎª18Ö¡£¬¹Ì¶¨²ÎÊý
FRAME_PER_MIN = 60*FRAME_PER_SECOND 

PEACE_TIME = 5*FRAME_PER_SECOND --time.lua´¥·¢¼ä¸ô£¬µÈ´ýÍæ¼ÒÈËÊý¿ªÆô¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
PEACE_TIMER_LOOP = (PEACE_TIME_ATOM*FRAME_PER_MIN/PEACE_TIME)-1 --µÈ´ýÍæ¼ÒÈËÊý¿ªÆô¼ÆÊ±Æ÷±¨Ê±´ÎÊý£¨5·ÖÖÓ£©
READY_TIME = 5*FRAME_PER_SECOND --time.lua´¥·¢¼ä¸ô£¬¿ªÕ½×¼±¸Ê±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
READY_TIMER_LOOP = (READY_TIME_ATOM*FRAME_PER_MIN/READY_TIME)-1 --¿ªÕ½×¼±¸Ê±¼ä¼ÆÊ±Æ÷±¨Ê±´ÎÊý£¨1·ÖÖÓ£©
FIGHT_TIME = 15*FRAME_PER_SECOND --time.lua´¥·¢¼ä¸ô£¬´òÕÌÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
FIGHT_TIMER_LOOP = (FIGHT_TIME_ATOM*FRAME_PER_MIN/FIGHT_TIME)-1 	--´òÕÌÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý£¨40·ÖÖÓ£©
WAITOUT_TIME = 5*FRAME_PER_SECOND 	--time.lua´¥·¢¼ä¸ô£¬µÈ´ý½áÊøÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±¼ä¸ô£¬5Ãë
WAITOUT_TIMER_LOOP = (WAITOUT_TIME_ATOM*FRAME_PER_MIN/WAITOUT_TIME)-1  --µÈ´ý½áÊøÊ±¼ä¼ÆÊ±Æ÷µÄ±¨Ê±´ÎÊý£¨°ë·ÖÖÓ£©
JOIN_TIMER_ALLOW = (0.2*(FIGHT_TIMER_LOOP+1)) --ÈÝÐí¼ÓÈëÊ±¼äÖµ80%Õ½¶·Ê±¼ä
FIGHT_TIMER_YQX = FIGHT_TIMER_LOOP-(2*FRAME_PER_MIN/FIGHT_TIME)  --ËÎ·½ÑîÆßÐãË¢³öÀ´µÄÊ±¼äµÄloop´ÎÊý
FIGHT_TIMER_XT = FIGHT_TIMER_LOOP-(2*FRAME_PER_MIN/FIGHT_TIME) --ÁÉ·½ÏôÌ©Êä³öÀ´µÄÊ±¼äµÄloop´ÎÊý


--=====================Ä§·¨ÊôÐÔ¼Ó³É================================
CONTINUE_TIME = 45*60*60 --Ä§·¨ÊôÐÔ³ÖÐøÊ±¼ä45min
QINGLONG_LIFE = 75000 --ÇàÁúÁúÖÛÉúÃüÖµ
XUANWU_LFTE = 125000  --ÐþÎäÁúÖÛÉúÃüÖµ
BAIHU_LFTE = 50000  --°×»¢ÁúÖÛÉúÃüÖµ
ZHUQUE_LFTE = 50000 --ÖìÈ¸ÁúÖÛÉúÃüÖµ

tbQuanCong =
{
	[0] = {250,100},
	[1] = {500,200},
	[2] = {1250,500},
	[3] = {2500,1000},
}

tAwardItemNeed = 
{
	[0] = {},
	[1] = {"Qu©n C«ng Ch­¬ng",2,1,9999,1},
	[2] = {"Qu©n C«ng §¹i",2,1,9998,1},
	[3] = {"Qu©n C«ng Huy Hoµng",2,1,9977,1},
};

tAwardAll = 
{
	{3, 49490, 30000, 1},
	{3, 14940, 180000, 1},
	{1, 3990, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1, 1}, 0 },
	{31, 10910, "vaf_GiveFactionBook45()", ""},
	{31, 5559, "vaf_GiveFactionBook70()", ""},
	{31, 110, "vaf_GiveSpecialBook70()", ""},
	{1, 5000, "B¸nh Ýt Ng·i H­¬ng", {2, 1, 1123, 1, 4}, 0 },
	{1, 5000, "B¸nh Ýt Ch©n Gµ", {2, 1, 1124, 1, 4}, 0 },
	{1, 5000, "B¸nh Ýt B¸t B¶o", {2, 1, 1125, 1, 4}, 0 },
	{1, 1, "§«ng Ph­¬ng Long Ch©u", {0, 102, 24, 1, 1, -1, -1, -1, -1, -1, -1}, 0 },
}

-- ch­a add tØ lÖ
tFactionBook45 = 
{
	{1, 357, "Kim Cang Phôc Ma kinh",{0,107,1, 1}, 0},	
	{1, 357, "Kim Cang Phôc Ma T©m Ph¸p",{0,107,2, 1}, 0},
	{1, 357, "TiÒm Long MËt tÞch",{0,107,3, 1},	0},
	{1, 357, "TiÒm Long T©m Ph¸p",{0,107,4, 1}, 0},
	{1, 357, "V« TrÇn MËt tÞch",{0,107,5, 1}, 0},	
	{1, 357, "V« TrÇn T©m Ph¸p",{0,107,6, 1},	 0},
	{1, 357, "Thiªn La MËt TÞch",{0,107,7, 1}, 0},
	{1, 357, "Thiªn La T©m Ph¸p",{0,107,8, 1}, 0},	
	{1, 357, "Nh­ ý MËt TÞch",{0,107,9, 1}, 0},	
	{1, 357, "Nh­ ý T©m Ph¸p",{0,107,10, 1}, 0},
	{1, 357, "BÝch H¶i Phæ",{0,107,11, 1}, 0},
	{1, 357, "BÝch H¶i T©m Ph¸p",{0,107,12, 1}, 0},
	{1, 357, "Hçn §én MËt tÞch",{0,107,13, 1}, 0},
	{1, 357, "Hçn §én T©m Ph¸p",{0,107,14, 1}, 0},
	{1, 357, "Quý Thiªn MËt tÞch",{0,107,15, 1}, 0},
	{1, 357, "Quý Thiªn T©m Ph¸p",{0,107,16, 1}, 0},
	{1, 357, "HuyÒn ¶nh MËt tÞch",{0,107,17, 1}, 0},
	{1, 357, "HuyÒn ¶nh T©m Ph¸p",{0,107,18, 1}, 0},
	{1, 357, "Qu©n Tö MËt tÞch",{0,107,19, 1}, 0},
	{1, 357, "Qu©n Tö T©m Ph¸p",{0,107,20, 1}, 0},
	{1, 357, "TrÊn Qu©n MËt tÞch",{0,107,21, 1}, 0},
	{1, 357, "TrÊn Qu©n T©m Ph¸p",{0,107,22, 1}, 0},
	{1, 357, "Xuyªn V©n MËt tÞch",{0,107,23, 1}, 0},
	{1, 357, "Xuyªn V©n T©m Ph¸p",{0,107,24, 1}, 0},
	{1, 357, "U Minh Quû Lôc",{0,107,25, 1}, 0},
	{1, 357, "U Minh T©m Ph¸p",{0,107,26, 1}, 0},
	{1, 359, "Linh Cæ MËt tÞch",{0,107,27, 1}, 0},
	{1, 359, "Linh Cæ T©m Ph¸p",{0,107,28, 1}, 0},
}

tFactionBook70 = {
	{1, 714, "Kim Cang B¸t Nh· Kinh",{0,107,166, 1}, 0},
	{1, 714, "TiÒm Long TÞch DiÖt Kinh",{0,107,167, 1}, 0},
	{1, 714, "V« TrÇn Bå §Ò Kinh",{0,107,168, 1}, 0},
	{1, 714, "Thiªn La Liªn Ch©u Lôc",{0,107,169, 1}, 0},
	{1, 714, "Nh­ ý Kim §Ønh MËt TÞch",{0,107,170, 1}, 0},
	{1, 714, "BÝch H¶i TuyÖt ¢m Phæ",{0,107,171, 1}, 0},
	{1, 714, "Hçn §én TrÊn Nh¹c MËt TÞch",{0,107,172, 1}, 0},
	{1, 714, "Quü Thiªn Du Long MËt TÞch",{0,107,173, 1}, 0},
	{1, 714, "HuyÔn ¶nh Mª Tung MËt TÞch",{0,107,174, 1}, 0},
	{1, 714, "Qu©n Tö TiÖt Phong MËt TÞch",{0,107,175, 1}, 0},
	{1, 714, "TrÊn Qu©n Phi Long Th­¬ng Phæ",{0,107,176, 1}, 0},
	{1, 714, "Xuyªn V©n L¹c Hång MËt TÞch",{0,107,177, 1}, 0},
	{1, 716, "U Minh Phong Ma Lôc",{0,107,178, 1}, 0},
	{1, 716, "Linh Cæ HuyÔn Tµ Lôc",{0,107,179, 1}, 0},
	{1, 0, "Cöu Thiªn Phong L«i QuyÕt",{0,107,198, 1}, 0},
	{1, 0, "Hång TrÇn Tóy Méng Phæ",{0,107,202, 1}, 0},
	{1, 0, "Phong Hoa Thiªn DiÖp Phæ",{0,107,203, 1}, 0},
};

tSpecialBook70 = {
	{1, 888, "Kim Cang B¸t Nh· Ch©n QuyÓn",{0,107,204, 1}, 0},
	{1, 568, "TiÒm Long Tóc DiÖt Ch©n QuyÓn",{0,107,205, 1}, 0},
	{1, 714, "V« TrÇn Bå §Ò Ch©n QuyÓn",{0,107,206, 1}, 0},
	{1, 888, "Thiªn La Liªn Ch©u Ch©n QuyÓn",{0,107,207, 1}, 0},
	{1, 568, "Nh­ ý Kim §Ønh Ch©n QuyÓn",{0,107,208, 1}, 0},
	{1, 568, "BÝch H¶i TuyÖt ¢m Ch©n QuyÓn",{0,107,209, 1}, 0},
	{1, 888, "Hçn §én TrÊn Nh¹c Ch©n QuyÓn",{0,107,210, 1}, 0},
	{1, 668, "Quü Thiªn Du Long Ch©n QuyÓn",{0,107,211, 1}, 0},
	{1, 668, "HuyÔn ¶nh Mª T«ng Ch©n QuyÓn",{0,107,212, 1}, 0},
	{1, 714, "Qu©n Tö §íi Phong Ch©n QuyÓn",{0,107,213, 1}, 0},
	{1, 668, "TrÊn Qu©n Phi Long Th­¬ng Ch©n QuyÓn",{0,107,214, 1}, 0},
	{1, 668, "Xuyªn V©n L¹c Hång Ch©n QuyÓn",{0,107,215, 1}, 0},
	{1, 888, "HuyÒn Minh Phong Ma Ch©n QuyÓn",{0,107,216, 1}, 0},
	{1, 644, "Linh Cæ HuyÔn Tµ Ch©n QuyÓn",{0,107,217, 1}, 0},
	{1, 0, "Cöu Thiªn Phong L«i Ch©n QuyÓn", {0, 107, 218, 1}, 0},
	{1, 0, "Hång TrÇn Tóy Méng Ch©n QuyÓn", {0, 107, 222, 1}, 0},
	{1, 0, "Phong Hoa Thiªn DiÖp Ch©n QuyÓn", {0, 107, 223, 1}, 0},
};


function vaf_GiveFactionBook45()
	gf_EventGiveRandAward(tFactionBook45,10000,1)
end

function vaf_GiveFactionBook70()
	gf_EventGiveRandAward(tFactionBook70,10000,1)
end

function vaf_GiveSpecialBook70()
	gf_EventGiveRandAward(tSpecialBook70,10000,1)
end