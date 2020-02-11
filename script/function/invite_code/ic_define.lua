Include("\\script\\lib\\globalfunctions.lua")
--²âÊÔ
DebugOutput = nothing

--»î¶¯¿ªÆôÊ±¼ä
IC_START_TIME = {2014,10,21,0,0,0};
IC_END_TIME = {2014,11,21,0,0,0};

--¼¤»îÂëÑÎ
IC_INVITE_CODE_SALT = "zpb0nBJXd6rhvK5PZQAbSYBHChNAVnhX"

--Ê¹ÓÃµÄÊý¾Ý¿â±íÃû³Æ
IC_MYSQL_TABLE_NAME = "invite_code_1410"

--Êý¾ÝÐÐÎªÀàÐÍ
IC_QUERY_TYPE_REG = 1; --×¢²á
IC_QUERY_TYPE_QRY	= 2; --²éÑ¯
IC_QUERY_TYPE_MDY = 3; --ÐÞ¸Ä

--»î¶¯ÈÎÎñ±äÁ¿×é
IC_TASK_GROUP = {3, 14};

--²Ù×÷¼ä¸ôÊ±¼äs
IC_CLICK_TIME = 15;

--ÊÜÑûÕß½±ÀøÀàÐÍ
IC_FINISH_INVITE_TYPE1 = 1; --5×ª90¼¶
IC_FINISH_INVITE_TYPE2 = 2; --6×ª90¼¶
IC_FINISH_INVITE_TYPE3 = 3; --¼¤»îÔÂ¿¨
IC_FINISH_INVITE_TYPE4 = 4; --Óù½ÖÏû·Ñ2000XU
IC_FINISH_INVITE_TYPE5 = 5; --Óù½ÖÏû·Ñ4000XU

IC_FINISH_INVITE_TYPE6 = 6; --Íê³ÉÈÎÒâ3¸öÈÎÎñ
IC_FINISH_INVITE_TYPE7 = 7; --Íê³ÉÈÎÒâ4¸öÈÎÎñ
IC_FINISH_INVITE_TYPE8 = 8; --Íê³ÉÈÎÒâ5¸öÈÎÎñ

function ck_GiveRandGem456()
	--Faction Cloth 9
	local VET_RandGem456 = {
        {1,20, "HuyÕtTrÝchTh¹ch Lv4", {2,22,104,1},nil,nil,nil,nil},
        {1,20, "NguyÖtB¹chTh¹ch Lv4", {2,22,204,1},nil,nil,nil,nil},
        {1,20, "Hæ Ph¸ch Th¹ch CÊp 4", {2,22,304,1},nil,nil,nil,nil},
        {1,20, "H¾c DiÖu Th¹ch CÊp 4", {2,22,404,1},nil,nil,nil,nil},
        {1,4, "HuyÕtTrÝchTh¹ch Lv5", {2,22,105,1},nil,nil,nil,1},
        {1,4, "NguyÖtB¹chTh¹ch Lv5", {2,22,205,1},nil,nil,nil,1},
        {1,4, "Hæ Ph¸ch Th¹ch CÊp 5", {2,22,305,1},nil,nil,nil,1},
        {1,4, "H¾c DiÖu Th¹ch CÊp 5", {2,22,405,1},nil,nil,nil,1},
        {1,1, "HuyÕtTrÝchTh¹ch Lv6", {2,22,106,1},nil,nil,nil,1},
        {1,1, "NguyÖtB¹chTh¹ch Lv6", {2,22,206,1},nil,nil,nil,1},
        {1,1, "Hæ Ph¸ch Th¹ch CÊp 6", {2,22,306,1},nil,nil,nil,1},
        {1,1, "H¾c DiÖu Th¹ch CÊp 6", {2,22,406,1},nil,nil,nil,1},
	} 
	gf_EventGiveRandAward(VET_RandGem456,100,1, "CDKEY", "CDKEY")
end

--ÑûÇëÕß½±Àø
IC_YAOQING_AWARD = {
	[1] = {"item",		1, 	"Hu©n ch­¬ng anh hïng", {2,1,30499,4}},
	[2] = {"item", 		6, 	"ThiÕt tinh cÊp 4", 	{2,1,30612,10,4}},
	[3] = {"item", 		12, "L«i Hæ Tinh Ph¸ch", {2,1,30614,2}},
	[4] = {"item", 		24, "Thiªn Th¹ch linh th¹ch", {2,1,1068,1,4}, 7 * 24 * 3600},
	[5] = {"func", 		36, "NgÉu nhiªn ®¸ quý cÊp 4~6", ck_GiveRandGem456},
	[6] = {"item", 		50, "Thiªn Cang LÖnh", {2,95,204,1}},
	[7] = {"item", 		60, "C«n H­ Ngäc Dao KiÕm", {0,105,10109,1,4,-1,-1,-1,-1,-1,-1}, 30 * 24 * 3600},
}

--½±Àø
IC_YAOYANG_JIEZI_1 = {
	{"DiÖu D­¬ng-¤ L©n B¶o Giíi", {0, 102, 3176, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-Tö Giao Ngäc Béi", {0, 102, 3178, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-V©n Hæ LÖnh", {0, 102, 3180, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-XÝch T­íc Hoµn", {0, 102, 3182, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng-BÝch Quy Liªn", {0, 102, 3184, 1, 4, -1, -1, -1, -1, -1, -1}},
}

IC_YAOYANG_JIEZI_2 = {
	{"DiÖu D­¬ng To¸i Hoµng-¤ L©n B¶o Giíi", {0, 102, 3185, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-Tö Giao Ngäc Béi", {0, 102, 3186, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-V©n Hæ LÖnh", {0, 102, 3187, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-XÝch T­íc Hoµn", {0, 102, 3188, 1, 4, -1, -1, -1, -1, -1, -1}},
	{"DiÖu D­¬ng To¸i Hoµng-BÝch Quy Liªn", {0, 102, 3189, 1, 4, -1, -1, -1, -1, -1, -1}},
}
