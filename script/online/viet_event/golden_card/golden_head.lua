-- Hoµng Kim LÖnh Bµi ver 2.0
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\viet_event\\vng_task_control.lua");

NEEDED_EXP = 200e6				
NEEDED_LEVEL = 73

-- Control HKLB
EXT_POINT_HKLB = 3		
-- §Õm sè lÇn n¹p HKLB		
BYTE_HKLB_COUNT = 1
-- Ph©n Lo¹i HKLB
BYTE_HKLB_TYPE = 2

-- Task nhËn th­ëng Vâ L©m TiÒn Bèi
TASK_FRIENDLY_AWARD = 2282
BYTE_FRIENDLY_AWARD_DAY= 1
BYTE_FRIENDLY_AWARD_MONTH = 2
BYTE_FRIENDLY_AWARD_COUNT = 3

TASK_DIG_TIME = 2283
TASK_DIG_DATE = 2284
-- Sö dông 31 bit ®Ó l­u l¹i index r­¬ng ®· më (1 r­¬ng chØ më 1 lÇn)
TASK_DIG_COUNT_1 = 2285 
-- Sö dông 31 bit ®Ó l­u l¹i index r­¬ng ®· më (1 r­¬ng chØ më 1 lÇn)
TASK_DIG_COUNT_2 = 2188 
-- Ghi l¹i tæng sè lÇn ®µo
TASK_DIG_COUNT_ALL = 2189 

szHKLBLogHeader = "Thien Mon Tran Hoang Kim Lenh Bai"
szHKLBLogAction = "nhËn th­ëng"

tb_golden_faction =
{
	"ThiÕu L©m",
	"Vâ §ang",
	"Nga My",
	"C¸i Bang",
	"§­êng M«n",
	"D­¬ng Gia",
	"Ngò §éc",
}

tb_main_city =
{
	100, 150, 200, 300, 350, 400, 500,
}

tb_golden_faction_tree =
{
		[2] =  {"ThiÕu L©m tôc gia", 0, 20, 21, 23, "Kim Cang Phôc Ma T©m Ph¸p", {0,107,2,1}, "Kim Cang Phôc Ma kinh", {0,107,1,1}, "Kim Cang B¸t Nh· Kinh", {0,107,166,1}}, 
		[3] =  {"ThiÕu L©m thiÒn t¨ng", 2, 45, 46, 0, "V« TrÇn T©m Ph¸p", {0,107,6,1}, "V« TrÇn MËt tÞch", {0,107,5,1}, "V« TrÇn Bå §Ò Kinh", {0,107,168,1}}, 
		[4] =  {"ThiÕu L©m vâ t«ng", 1, 33, 34, 0, "TiÒm Long T©m Ph¸p", {0,107,4,1}, "TiÒm Long MËt tÞch", {0,107,3,1}, "TiÒm Long TÞch DiÖt Kinh", {0,107,167,1}}, 
		[14] =  {"Vâ §ang ®¹o gia", 8, 125, 126, 0, "HuyÒn ¶nh T©m Ph¸p", {0,107,18,1}, "HuyÒn ¶nh MËt tÞch", {0,107,17,1}, "HuyÔn ¶nh Mª Tung MËt TÞch", {0,107,174,1}}, 
		[15] =  {"Vâ §ang tôc gia", 9, 147, 148, 0, "Qu©n Tö T©m Ph¸p", {0,107,20,1}, "Qu©n Tö MËt tÞch", {0,107,19,1}, "Qu©n Tö TiÖt Phong MËt TÞch", {0,107,175,1}}, 
		[8] =  {"Nga My phËt gia", 4, 75, 76, 0, "Nh­ ý T©m Ph¸p", {0,107,10,1}, "Nh­ ý MËt TÞch", {0,107,9,1}, "Nh­ ý Kim §Ønh MËt TÞch", {0,107,170,1}}, 
		[9] =  {"Nga My tôc gia", 5, 90, 91, 0, "BÝch H¶i T©m Ph¸p", {0,107,12,1}, "BÝch H¶i Phæ", {0,107,11,1}, "BÝch H¶i TuyÖt ¢m Phæ", {0,107,171,1}}, 
		[11] =  {"C¸i Bang tÜnh y", 6, 103, 104, 0, "Hçn §én T©m Ph¸p", {0,107,14,1}, "Hçn §én MËt tÞch", {0,107,13,1}, "Hçn §én TrÊn Nh¹c MËt TÞch", {0,107,172,1}}, 
		[12] =  {"C¸i Bang « y", 7, 114, 115, 0, "Quý Thiªn T©m Ph¸p", {0,107,16,1}, "Quý Thiªn MËt tÞch", {0,107,15,1}, "Quü Thiªn Du Long MËt TÞch", {0,107,173,1}}, 
		[6] =  {"§­êng M«n", 3, 58, 60, 0, "Thiªn La T©m Ph¸p", {0,107,8,1}, "Thiªn La MËt TÞch", {0,107,7,1}, "Thiªn La Liªn Ch©u Lôc", {0,107,169,1}}, 
		[17] =  {"D­¬ng Gia th­¬ng", 10, 720, 0, 0, "TrÊn Qu©n T©m Ph¸p", {0,107,22,1}, "TrÊn Qu©n MËt tÞch", {0,107,21,1}, "TrÊn Qu©n Phi Long Th­¬ng Phæ", {0,107,176,1}}, 
		[18] =  {"D­¬ng Gia cung", 11, 733, 0, 0, "Xuyªn V©n T©m Ph¸p", {0,107,24,1}, "Xuyªn V©n MËt tÞch", {0,107,23,1}, "Xuyªn V©n L¹c Hång MËt TÞch", {0,107,177,1}}, 
		[20] = {"Ngò §éc hiÖp ®éc", 12, 13, 364, 365, "U Minh T©m Ph¸p", {0,107,26,1}, "U Minh Quû Lôc", {0,107,25,1}, "U Minh Phong Ma Lôc", {0,107,178,1}}, 
		[21] = {"Ngò §éc tµ ®éc", 13, 14, 347, 351, "Linh Cæ T©m Ph¸p", {0,107,28,1}, "Linh Cæ MËt tÞch", {0,107,27,1}, "Linh Cæ HuyÔn Tµ Lôc", {0,107,179,1}}, 

}

tb_golden_award = 
{
				[74] = {	3000, 	4000, 	50000, 1},
				[75] = {	3000, 	4000, 	50000, 2},
				[76] = {	3000, 	4000, 	50000, 3},
				[77] = {	3000, 	4000, 	50000, 4},
				[78] = {	4000, 	5000, 	55000, 5},
				[79] = {	5000, 	5000, 	55000, 6},
				[80] = {	6000, 	6000, 	60000, 7},
				[81] = {	7000, 	7000, 	65000, 8},
				[82] = {	8000, 	8000, 	70000, 9},
				[83] = {	9000, 	9000, 	75000, 10},
				[84] = {	10000, 	10000, 	80000, 11},
				[85] = {	10000, 	10000, 	80000, 12},
				[86] = {	10500, 	10500, 	81000, 13},
				[87] = {	11000, 	11000, 	82000, 14},
				[88] = {	11500, 	11500, 	83000, 15},
				[89] = {	12000, 	12000, 	84000, 16, 25000000},
				[90] = {	12500, 	12500, 	86000, 17, 25000000},
				[91] = {	13000, 	13000, 	88000, 18, 25000000},
				[92] = {	13500, 	13500, 	90000, 19, 50000000},
				[93] = {	14000, 	14000, 	92000, 20, 50000000},
				[94] = {	14500, 	14500, 	94000, 21, 50000000},
				[95] = {	15000, 	15000, 	96000, 22, 50000000},
				[96] = {	16000, 	16000, 	98000, 23, 50000000},
}

tb_golden_digging =
{
				[1] = {3000, 	5000, 	50000},
				[2] = {5000, 	7000, 	60000},
				[3] = {7500, 	8500, 	70000},
				[4] = {10000, 	10000, 	80000},
}

tb_hunting_treasure =
{
				[1] = {50000,		3000,	5000,	73,  79,	1},
				[2] = {60000,		5000,	7000,	80,  84,	8},
				[3] = {70000,		7500,	8500,	85,  89,	12},
				[4] = {80000,		10000,	10000,	90,  99,	16},
}

tb_golden_jew_chien = {
				[2]  = {"Tö Viªn ChiÕn",{0,102,8851,1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"Tö Viªn ChiÕn",{0,102,8853,1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"Tö Viªn ChiÕn",{0,102,8855,1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"Tö Viªn ChiÕn",{0,102,8857,1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"Tö Viªn ChiÕn",{0,102,8859,1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"Tö Viªn ChiÕn",{0,102,8861,1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"Tö Viªn ChiÕn",{0,102,8863,1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"Tö Viªn ChiÕn",{0,102,8865,1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"Tö Viªn ChiÕn",{0,102,8867,1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"Tö Viªn ChiÕn",{0,102,8869,1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"Tö Viªn ChiÕn",{0,102,8871,1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"Tö Viªn ChiÕn",{0,102,8873,1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"Tö Viªn ChiÕn",{0,102,8875,1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"Tö Viªn ChiÕn",{0,102,8877,1,1,-1,-1,-1,-1,-1,-1}},
}

tb_golden_jew_dau = {
				[2]  = {"Tö Viªn §Êu",{0,102,8852,1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"Tö Viªn §Êu",{0,102,8854,1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"Tö Viªn §Êu",{0,102,8856,1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"Tö Viªn §Êu",{0,102,8858,1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"Tö Viªn §Êu",{0,102,8860,1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"Tö Viªn §Êu",{0,102,8862,1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"Tö Viªn §Êu",{0,102,8864,1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"Tö Viªn §Êu",{0,102,8866,1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"Tö Viªn §Êu",{0,102,8868,1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"Tö Viªn §Êu",{0,102,8870,1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"Tö Viªn §Êu",{0,102,8872,1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"Tö Viªn §Êu",{0,102,8874,1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"Tö Viªn §Êu",{0,102,8876,1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"Tö Viªn §Êu",{0,102,8878,1,1,-1,-1,-1,-1,-1,-1}},
}

-- golden weekday award
tb_golden_material_goldenday = {
				[1] = {"Gç Qu©n Dông", {2,0,308,480,1}, 1, 1, 7},
				[2] = {"Gç Qu©n Dông", {2,0,308,480,1}, 1, 2, 8},
				[3] = {"Kho¸ng Th¹ch Qu©n Dông", {2,0,307,480,1}, 1, 2, 8},
				[4] = {"Lóa M¹ch Qu©n Dông", {2,0,309,480,1}, 1, 2, 8},
				[5] = {"Thuéc Da Qu©n Dông", {2,0,310,480,1}, 1, 2, 8},
				[6] = {"T¬ T»m Qu©n Dông", {2,0,311,480,1}, 1, 2, 8},
				[7] = {"D­îc Th¶o Qu©n Dông", {2,0,312,480,1}, 1, 2, 8},
				[8] = {"Linh HuyÕt Qu©n Dông", {2,0,313,480,1}, 1, 2, 8},
				[9] = {"Gç Qu©n Dông", {2,0,308,480,1}, 1, 3, 9},
				[10] = {"Kho¸ng Th¹ch Qu©n Dông", {2,0,307,480,1}, 1, 3, 9},
				[11] = {"Lóa M¹ch Qu©n Dông", {2,0,309,480,1}, 1, 3, 9},
				[12] = {"Thuéc Da Qu©n Dông", {2,0,310,480,1}, 1, 3, 9},
				[13] = {"T¬ T»m Qu©n Dông", {2,0,311,480,1}, 1, 3, 9},
				[14] = {"D­îc Th¶o Qu©n Dông", {2,0,312,480,1}, 1, 3, 9},
				[15] = {"Linh HuyÕt Qu©n Dông", {2,0,313,480,1}, 1, 3, 9},
}

-- 1 item, 2 table
-- must identify main table below the sub table
tb_golden_jew = {
				[1] = {1, "Tµng KiÕm Kim Ên", 2, {0, 102, 40,1,1,-1,-1,-1,-1,-1,-1}},
				[2] = {1, "Tµng KiÕm Kú Th¹ch", 2, {0, 102, 39,1,1,-1,-1,-1,-1,-1,-1}},				
				[3] = {1, "Tµng KiÕm B¶o Ch©u", 2, {0, 102, 38,1,1,-1,-1,-1,-1,-1,-1}},
				[4] = {1, "§«ng Ph­¬ng Long Ch©u", 2, {0, 102, 24,1,1,-1,-1,-1,-1,-1,-1}},			
				[5] = {2, tb_golden_jew_chien, 2, {0, 102, 8851,1,1,-1,-1,-1,-1,-1,-1}},		
				[6] = {2, tb_golden_jew_dau, 2, {0, 102, 8852,1,1,-1,-1,-1,-1,-1,-1}},		
				[7] = {1, "Hång PhØ Thóy Hé Phï", 494, {0,102,15,1,1,2,24,3,14,0,0}},		
				[8] = {1, "Toµn Th¹ch Giíi ChØ", 494, {0,102,20,1,1,2,24,3,14,0,0}},
}
--------------------------------------------------------------------------------------

tb_golden_weapon_bpy_low = {
				[2]  = {"Ph¸ Yªn ®ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"Phï Yªn tr­îng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"Hµm Yªn thñ",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"Tµng Yªn ch©m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"Phi Yªn kiÕm",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"VËn Yªn cÇm",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"V©n Yªn thñ",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"L­u Yªn c«n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"HuyÒn Yªn kiÕm",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"Vò Yªn bót",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"Hµ Tiªm Th­¬ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"Hµnh Yªn Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"Träc Yªn nhÉn",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"Yªu Yªn tr¶o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
};

tb_golden_weapon_bpy_med = {
				[2]  = {"Ph¸ Yªn ®ao", {0, 3, 6001, 1,1,6,85,7,263,7,264}},
				[3]  = {"Phï Yªn tr­îng",{0,8,6003, 1,1,6,86,7,267,7,263}},
				[4]  = {"Hµm Yªn thñ",{0,0,6004, 1,1,6,86,7,267,7,263}},
				[6]  = {"Tµng Yªn ch©m",{0,1,6005, 1,1,4,281,7,265,7,264}},
				[8]  = {"Phi Yªn kiÕm",{0,2,6006, 1,1,6,86,4,292,4,293}},
				[9]  = {"VËn Yªn cÇm",{0,10,6007, 1,1,2,27,7,266,7,265}},
				[11] = {"V©n Yªn thñ",{0,0,6008, 1,1,6,85,7,264,7,263}},
				[12] = {"L­u Yªn c«n",{0,5,6009, 1,1,3,268,7,265,7,266}},
				[14] = {"HuyÒn Yªn kiÕm",{0,2,6010, 1,1,6,86,7,267,7,266}},
				[15] = {"Vò Yªn bót",{0,9,6011, 1,1,3,268,7,266,7,265}},
				[17] = {"Hµ Tiªm Th­¬ng",{0,6,6012, 1,1,6,85,7,264,7,263}},
				[18] = {"Hµnh Yªn Cung",{0,4,6013, 1,1,3,268,7,265,7,264}},
				[20] = {"Träc Yªn nhÉn",{0,7,6014, 1,1,4,281,7,265,7,264}},
				[21] = {"Yªu Yªn tr¶o",{0,11,6015, 1,1,5,285,7,266,7,267}},
};

tb_golden_weapon_tq_med = {
				[2]  = {"Tö Quang To¸i Vò §ao",{0,3,8851, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {"Tö Quang Cöu Nh­ Tr­îng",{0,8,8853, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {"Tö Quang H¹o Nhiªn Thñ",{0,0,8854, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {"Tö Quang V« H×nh Ch©m",{0,1,8855, 1,1,-1,-1,-1,-1,-1,-1}},
				[8]  = {"Tö Quang Tö Tinh KiÕm",{0,2,8856, 1,1,-1,-1,-1,-1,-1,-1}},
				[9]  = {"Tö Quang Phông Hoµng CÇm",{0,10,8857, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {"Tö Quang Ngò Nh¹c Thñ",{0,0,8858, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {"Tö Quang Ph¸ Thiªn C«n",{0,5,8859, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {"Tö Quang Hång Qu©n KiÕm",{0,2,8860, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {"Tö Quang Sinh Tö Bót",{0,9,8861, 1,1,-1,-1,-1,-1,-1,-1}},
				[17] = {"Tö Quang Ph¸ Qu©n Th­¬ng",{0,6,8862, 1,1,-1,-1,-1,-1,-1,-1}},
				[18] = {"Tö Quang Khai Thiªn Cung",{0,4,8863, 1,1,-1,-1,-1,-1,-1,-1}},
				[20] = {"Tö Quang ¢m D­¬ng NhÉn",{0,7,8864, 1,1,-1,-1,-1,-1,-1,-1}},
				[21] = {"Tö Quang U Minh Tr¶o",{0,11,8865, 1,1,-1,-1,-1,-1,-1,-1}},
};

-- tªn item thu thËp, item ID, h¹t gièng, vµng, mÆt n¹ s¸t thñ ®­êng, tr¸i c©y
tb_everyday_award = {
	[1] = {
				[7] = {"Phï Ên",{2,1,302,200,1},2,15,1, "Dõa", {2,1,30167,2}},	
				[8] = {"Tµn KiÕm",{2,1,299,200,1},4,35,1, "Dõa", {2,1,30167,3}},	
				[9] = {"Linh t¶n",{2,1,185,200,1},6,50,1, "Dõa", {2,1,30167,5}},
	},
	[2] = {
				[7] = {"Phï Ên",{2,1,302,200,1},1,15,1, "M·ng cÇu", {2,1,30179,1}},	
				[8] = {"Tµn KiÕm",{2,1,299,200,1},2,20,1, "M·ng cÇu", {2,1,30179,2}},	
				[9] = {"Linh t¶n",{2,1,185,200,1},3,25,1, "M·ng cÇu", {2,1,30179,3}},
	},
}

-- Thªm b¶ng tu ch©n yÕu quyÕt 
tb_everyday_award_TCYQ = {
	[1] = {
				[7] = {2,0,554,2,4},	
				[8] = {2,0,554,4,4},
				[9] = {2,0,554,6,4},
	},
	
	[2] = {
				[7] = {2,0,554,1,4},	
				[8] = {2,0,554,2,4},
				[9] = {2,0,554,3,4},
	},
}

tb_golden_skillbag = {
				[2] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[3] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[4] = {"Tói bÝ kiÕp ThiÕu L©m", {2, 0, 607, 1, 4}},
				[6] = {"Tói bÝ kiÕp §­êng M«n", {2, 0, 608, 1, 4}},
				[8] = {"Tói bÝ kiÕp Nga My", {2, 0, 609, 1, 4}},
				[9] = {"Tói bÝ kiÕp Nga My", {2, 0, 609, 1, 4}},
				[11] = {"Tói bÝ kiÕp C¸i Bang", {2, 0, 610, 1, 4}},
				[12] = {"Tói bÝ kiÕp C¸i Bang", {2, 0, 610, 1, 4}},
				[14] = {"Tói bÝ kiÕp Vâ §ang", {2, 0, 611, 1, 4}},
				[15] = {"Tói bÝ kiÕp Vâ §ang", {2, 0, 611, 1, 4}},
				[17] = {"Tói bÝ kiÕp D­¬ng M«n", {2, 0, 612, 1, 4}},
				[18] = {"Tói bÝ kiÕp D­¬ng M«n", {2, 0, 612, 1, 4}},
				[20] = {"Tói bÝ kiÕp Ngò §éc", {2, 0, 613, 1, 4}},
				[21] = {"Tói bÝ kiÕp Ngò §éc", {2, 0, 613, 1, 4}}
}

tb_golden_book_high = {
				[2] = {"DÞch C©n Kinh-th­îng", {2, 1, 916, 1}},
				[4] = {"Nh­ Lai ThÇn Ch­ëng-th­îng", {2, 1, 919, 1}},
				[3] = {"TÈy Tñy Kinh-th­îng", {2, 1, 922, 1}},
				[6] = {"HÊp Tinh TrËn-th­îng", {2, 1, 925, 1}},
				[8] = {"V¹n T­íng ThÇn C«ng-th­îng", {2, 1, 928, 1}},
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-th­îng", {2, 1, 931, 1}},
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-th­îng", {2, 1, 934, 1}},
				[12] = {"§¶ CÈu C«n TrËn-th­îng", {2, 1, 937, 1}},
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-th­îng", {2, 1, 940, 1}},
				[15] = {"Th¸i Cùc ThÇn C«ng-th­îng", {2, 1, 943, 1}},
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-th­îng", {2, 1, 946, 1}},
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-th­îng", {2, 1, 949, 1}},
				[20] = {"V« Thiªn Ma C«ng-th­îng", {2, 1, 955, 1}},
				[21] = {"V« ¶nh Ma Cæ-th­îng", {2, 1, 952, 1}},
}

tb_golden_book_med = {
				[2] = {"DÞch C©n Kinh-trung", {2, 1, 917, 1}},			
				[4] = {"Nh­ Lai ThÇn Ch­ëng-trung", {2, 1, 920, 1}},			
				[3] = {"TÈy Tñy Kinh-trung", {2, 1, 923, 1}},			
				[6] = {"HÊp Tinh TrËn-trung", {2, 1, 926, 1}},			
				[8] = {"V¹n T­íng ThÇn C«ng-trung", {2, 1, 929, 1}},			
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-trung", {2, 1, 932, 1}},			
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-trung", {2, 1, 935, 1}},			
				[12] = {"§¶ CÈu C«n TrËn-trung", {2, 1, 938, 1}},			
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-trung", {2, 1, 941, 1}},			
				[15] = {"Th¸i Cùc ThÇn C«ng-trung", {2, 1, 944, 1}},			
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-trung", {2, 1, 947, 1}},			
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-trung", {2, 1, 950, 1}},			
				[20] = {"V« Thiªn Ma C«ng-trung", {2, 1, 956, 1}}, 
				[21] = {"V« ¶nh Ma Cæ-trung", {2, 1, 953, 1}},
}

tb_golden_book_low = {
				[2] = {"DÞch C©n Kinh-h¹ ", {2, 1, 918, 1}},		
				[4] = {"Nh­ Lai ThÇn Ch­ëng-h¹ ", {2, 1, 921, 1}},		
				[3] = {"TÈy Tñy Kinh-h¹ ", {2, 1, 924, 1}},		
				[6] = {"HÊp Tinh TrËn-h¹ ", {2, 1, 927, 1}},		
				[8] = {"V¹n T­íng ThÇn C«ng-h¹ ", {2, 1, 930, 1}},		
				[9] = {"Thiªn ¢m TrÊn Hån Khóc-h¹ ", {2, 1, 933, 1}},		
				[11] = {"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ", {2, 1, 936, 1}},		
				[12] = {"§¶ CÈu C«n TrËn-h¹ ", {2, 1, 939, 1}},		
				[14] = {"V« Th­îng Th¸i Cùc KiÕm-h¹ ", {2, 1, 942, 1}},		
				[15] = {"Th¸i Cùc ThÇn C«ng-h¹ ", {2, 1, 945, 1}},		
				[17] = {"Liªn Hoµn Toµn Long Th­¬ng-h¹ ", {2, 1, 948, 1}},		
				[18] = {"B¸ V­¬ng T­êng Phông TiÔn-h¹ ", {2, 1, 951, 1}},		
				[20] = {"V« Thiªn Ma C«ng-h¹ ", {2, 1, 957, 1}},
				[21] = {"V« ¶nh Ma Cæ-h¹ ", {2, 1, 954, 1}},
}


-- Vò KhÝ ViÖt Yªn 
tb_golden_vy_weapon = 
{
	[2] = {"ViÖt Yªn Phi Tinh §ao",{0,3,30001,1,1,-1,-1,-1,-1,-1,-1}},-- ThiÕu l©m tôc gia
	[3] = {"ViÖt Yªn Phi Tinh Tr­îng",{0,8,30003,1,1,-1,-1,-1,-1,-1,-1}},--ThiÕu l©m thiÒn t«ng
	[4] = {"ViÖt Yªn Phi Tinh Thñ",{0,0,30004,1,1,-1,-1,-1,-1,-1,-1}},--ThiÕu l©m vâ t«ng
	[6] = {"ViÖt Yªn Phi Tinh Ch©m",{0,1,30005,1,1,-1,-1,-1,-1,-1,-1}},-- §­êng m«n
	[8] = {"ViÖt Yªn Phi Tinh KiÕm",{0,2,30006,1,1,-1,-1,-1,-1,-1,-1}},--Nga My PhËt gia
	[9] = {"ViÖt Yªn Phi Tinh CÇm",{0,10,30007,1,1,-1,-1,-1,-1,-1,-1}},--Nga My tôc gia
	[11] = {"ViÖt Yªn Phi Tinh Thñ",{0,0,30008,1,1,-1,-1,-1,-1,-1,-1}},-- C¸i Bang TÜnh Y
	[12] = {"ViÖt Yªn Tr¶m NguyÖt C«n",{0,5,30009,1,1,-1,-1,-1,-1,-1,-1}},--C¸i Bang ¤ Y
	[14] = {"ViÖt Yªn Tr¶m NguyÖt KiÕm",{0,2,30010,1,1,-1,-1,-1,-1,-1,-1}},-- Vâ §ang §¹o Gia
	[15] = {"ViÖt Yªn Tr¶m NguyÖt Bót",{0,9,30011,1,1,-1,-1,-1,-1,-1,-1}},-- Vâ ®ang tôc gia
	[17] = {"ViÖt Yªn Tr¶m NguyÖt Th­¬ng",{0,6,30012,1,1,-1,-1,-1,-1,-1,-1}},--D­¬ng Gia Th­¬ng
	[18] = {"ViÖt Yªn Tr¶m NguyÖt Cung",{0,4,30013,1,1,-1,-1,-1,-1,-1,-1}},-- D­¬ng m«n cung
	[20] = {"ViÖt Yªn Tr¶m NguyÖt NhÉn",{0,7,30014,1,1,-1,-1,-1,-1,-1,-1}},-- HiÖp §éc
	[21] = {"ViÖt Yªn Tr¶m NguyÖt Tr¶o",{0,11,30015,1,1,-1,-1,-1,-1,-1,-1}},-- Ta §éc
}


-- Vò KhÝ §¹i ViÖt Yªn 
tb_golden_dvy_weapon = 
{
	[2] = {"§¹i ViÖt Yªn Phi Tinh §ao",{0,3,30016,1,1,-1,-1,-1,-1,-1,-1}},--ThiÕu l©m tôc gia 
	[3] = {"§¹i ViÖt Yªn Phi Tinh Tr­îng",{0,8,30018,1,1,-1,-1,-1,-1,-1,-1}},-- ThiÕu l©m thiÒn t«ng
	[4] = {"§¹i ViÖt Yªn Phi Tinh Thñ",{0,0,30019,1,1,-1,-1,-1,-1,-1,-1}},-- ThiÕu l©m vâ t«ng
	[6] = {"§¹i ViÖt Yªn Phi Tinh Ch©m",{0,1,30020,1,1,-1,-1,-1,-1,-1,-1}},-- §­êng m«n
	[8] = {"§¹i ViÖt Yªn Phi Tinh KiÕm",{0,2,30021,1,1,-1,-1,-1,-1,-1,-1}},--Nga My PhËt Gia
	[9] = {"§¹i ViÖt Yªn Phi Tinh CÇm",{0,10,30022,1,1,-1,-1,-1,-1,-1,-1}},--Nga My tôc gia
	[11] = {"§¹i ViÖt Yªn Phi Tinh Thñ",{0,0,30023,1,1,-1,-1,-1,-1,-1,-1}},--- C¸i bang  tÜnh y
	[12] = {"§¹i ViÖt Yªn Tr¶m NguyÖt C«n",{0,5,30024,1,1,-1,-1,-1,-1,-1,-1}},-- C¸i Bang è y
	[14] = {"§¹i ViÖt Yªn Tr¶m NguyÖt KiÕm ",{0,2,30025,1,1,-1,-1,-1,-1,-1,-1}},-- Vâ ®ang ®¹o gia
	[15] = {"§¹i ViÖt Yªn Tr¶m NguyÖt Bót",{0,9,30026,1,1,-1,-1,-1,-1,-1,-1}},-- Vâ ®ang tôc gia
	[17] = {"§¹i ViÖt Yªn Tr¶m NguyÖt Th­¬ng",{0,6,30027,1,1,-1,-1,-1,-1,-1,-1}},-- D­êng m«n th­¬ng
	[18] = {"§¹i ViÖt Yªn Tr¶m NguyÖt Cung",{0,4,30028,1,1,-1,-1,-1,-1,-1,-1}},-- §­êng m«n cung
	[20] = {"§¹i ViÖt Yªn Tr¶m NguyÖt NhÉn",{0,7,30029,1,1,-1,-1,-1,-1,-1,-1}},-- HiÖp ®éc
	[21] = {"§¹i ViÖt Yªn Tr¶m NguyÖt Tr¶o",{0,11,30030,1,1,-1,-1,-1,-1,-1,-1}},--Tµ §éc
}

--- Vò khÝ s­ m«n 4
tb_golden_Faction4_weapon = 
{
	[2] = {"B¸t Bé Thiªn Long Thiªn Chóng §ao",3,230},
	[3] = {"V« L­îng Ph¸p T«n ThiÒn Tr­îng",8,330},
	[4] = {"B¸t B¶o La H¸n §¹i Thõa Thñ",0,430}, 
	[6] = {"Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m",1,630}, 
	[8] = {"B¹ch Liªn Tiªn Tö B¶o UÈn KiÕm",2,828},
	[9] = {"Ngäc VËn Tiªn Tö HuyÒn Hån CÇm",10,928},
	[11] = {"Long §Çu ThÇn C¸i §»ng V©n Thñ",0,1130},
	[12] = {"KhÊt Thiªn ThÇn C¸i V©n Du C«n",5,1230},
	[14] = {"Ch­ëng Kinh Thanh Quang KiÕm",2,1430},
	[15] = {"Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót",9,1530},
	[17] = {"Long T­¬ng T­íng Qu©n Th­¬ng",6,1730,},
	[18] = {"Hæ Dùc T­íng Qu©n Cung",4,1830},
	[20] = {"U Minh Quû S¸t Tu La NhÉn",7,2030},
	[21] = {"V« §éng La S¸t TrÈm HuyÕt Tr¶o",11,2130},
}

-- L­u  max sè lÇn ®µo r­¬ng trong ngµy
tbOpenBoxTimes = {1,8,12,16}

-- Table nµy l­u c¸c vËt phÈm b¹n cÇn ®æi  b»ng ®iÓm tÝch lòy
tbChangeAccumulateVLTB = 
{
	[1] = {130,"§Þnh Hån Thiªn Th¹ch",{2,1,1067,1,4},7*24*3600 },
	[2] = { 130,"L¨ng Ba Vi Bé",{0,112,78,1,4}},
	[3] = {90,"N÷ Oa Tinh Th¹ch",{2,1,504,8,4},7*24*3600},
	[4] = {50,"Nãn S­ m«n bé 4"},
	[5] = {50,"Aã S­ m«n bé 4"},
	[6] = { 50,"QuÇn S­ m«n bé 4"},
	[7] = {50,"Trang søc 1 S­ m«n bé 4"},
	[8] = {50,"Trang søc 1 S­ m«n bé 4"},
	[9] = {40,"Thiªn Qu¸i Th¹ch",{2,0,1084,3}},
	[10] = {40,"Thiªn Th¹ch Linh Th¹ch",{2,1,1068,1,4},7*24*3600 },
	[11] = {30,"Phi Yªn Th¹ch",{2,1,30130,5,4}},
}

function CheckAwardLevel()
	return gf_GetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_LEVELAWARD)
end

function CheckLevel()
	local nAwardLevel = 0;
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	
	for i = 96, 74, -1 do
		if nLevel >= i and nRep >= tb_golden_award[i][1] and nFaction >= tb_golden_award[i][2] and nHor >= tb_golden_award[i][3] and CheckAwardLevel() >=  tb_golden_award[i][4] then
			nAwardLevel = i;
			break;
		end
	end
	return nAwardLevel;
end

function CheckDigLevel()
	local nType = 0	
	local nLevel = GetLevel();
	local nRep = GetReputation();
	local nFaction = GetTask(336);
	local nHor = abs(GetTask(701));
	
	if nLevel >= 73 and nLevel <= 79 then
		nType =  1
	elseif nLevel >= 80 and nLevel <= 84 then
		nType = 2
	elseif nLevel >= 85 and nLevel <=89 then
		nType = 3
	elseif nLevel >= 90 then
		nType = 4
	else
		return nType
	end
	if nRep >= tb_golden_digging[nType][1] and nFaction >= tb_golden_digging[nType][2] and nHor >= tb_golden_digging[nType][3] and CheckActivated() == 2 then
		return nType	
	end	
	return 0
end

function CheckAccount()
	return gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE)
end 

function CheckActivated()
	if gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE) == 3 and gf_GetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS) == 3 then
		-- ThiÕu Niªn Anh Hïng
		return 1
	elseif gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_TYPE) == 4 and gf_GetTaskByte(TSK_HKLB_FLAG, BYTE_HKLB_STATUS) == 4 then
		-- Vâ L©m TiÒn Bèi
		return 2
	else
		-- Ch­a kÝch ho¹t
		return 0
	end
end

function GoldenGiveJewel()
	local nPos = 0
	local nRand = random(1, 1000)
	for i = 1, getn(tb_golden_jew) do
		if nRand > nPos and nRand <= nPos + tb_golden_jew[i][3] then
			ConfirmGetJewel(tb_golden_jew, i)
		end
		nPos = nPos + tb_golden_jew[i][3]
	end
end

function ConfirmGetJewel(tTable, nNum)
	local nType = tb_golden_jew[nNum][1]
	local nRoute = GetPlayerRoute()
	if nType == 1 then
		gf_AddItemEx2(tb_golden_jew[nNum][4], tb_golden_jew[nNum][2], szHKLBLogHeader, "nhËn ®­îc")
	elseif nType == 2 then
		gf_AddItemEx2(tb_golden_jew[nNum][2][nRoute][2], tb_golden_jew[nNum][2][nRoute][1], szHKLBLogHeader, "nhËn ®­îc")
	end
end

function CheckCharged()
	return gf_GetExtPointByte(EXT_POINT_HKLB, BYTE_HKLB_COUNT)
end

function GetTQVD()
	local nRand = random(1,100)
	local nBody = GetBody()
	if nRand <= 49 then
		gf_AddItemEx2({0,103,8050 + nBody,1,1,-1,-1,-1,-1,-1,-1}, "Tö Quang Viªm §Õ Kh«i", szHKLBLogHeader, "nhËn ®­îc")
	elseif nRand <= 98 then
		gf_AddItemEx2({0,101,8050 + nBody,1,1,-1,-1,-1,-1,-1,-1}, "Tö Quang Viªm §Õ Trang", szHKLBLogHeader, "nhËn ®­îc")
	else
		gf_AddItemEx2({0,100,8050 + nBody,1,1,-1,-1,-1,-1,-1,-1}, "Tö Quang Viªm §Õ Gi¸p", szHKLBLogHeader, "nhËn ®­îc")
	end
end

-- Ph¶i ®æi l¹i thµnh TaskID
function get_friendly_award()
	if CheckActivated() ~= 2 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kÝch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i Vâ L©m TiÒn Bèi!")
		return
	end
	
	local nWeek = tonumber(date("%w"))
	if nWeek ~= 5 and nWeek ~= 6 and nWeek ~= 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ nhËn phÇn th­ëng nµy vµo thø s¸u, thø b¶y vµ chñ nhËt.");
		return
	end
	
	local nCity = GetWorldPos()
	local nCheckCity = 0
	for i = 1, getn(tb_main_city) do
		if nCity == tb_main_city[i] then
			nCheckCity = 1
			break
		end
	end
	if nCheckCity == 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã thÓ kÝch ho¹t nhËn th­ëng trong thÊt ®¹i thµnh thÞ.");
		return
	end
	
	local nTeamSize = GetTeamSize()
	local nOldPlayerIdx = PlayerIndex;	
	
	if GetName() ~= GetCaptainName() then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: ChØ cã ®éi tr­ëng míi cã thÓ kÝch ho¹t nhËn th­ëng!")
		return
	end
	if nTeamSize < 2 then
		Talk(1,"","Tæ ®éi ph¶i cã 2 ng­êi trë lªn míi kick ho¹t ®­îc !")
		return
	end
	
	local nActivatedDate = floor(GetTask(TSK_HKLB_VLCH) / 100)
	local nDate = tonumber(date("%y%m%d"))
	if nActivatedDate ~= nDate then
		SetTask(TSK_HKLB_VLCH, nDate * 100 )
	end
	
	local nActivatedTime = mod(GetTask(TSK_HKLB_VLCH), 100)
	if nActivatedTime > 0 then
		Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: C¸c h¹ ®· kÝch ho¹t nhËn th­ëng h«m nay, ngµy mai h·y kÝch ho¹t tiÕp.");
		return
	end
	
	local szFailMember = ""
	local nDay = tonumber(date("%d"))
	local nMonth = tonumber(date("%m"))
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nCity2 = GetWorldPos()
		if gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_DAY) ~= nDay or gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_MONTH) ~= nMonth then
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_DAY, nDay)
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_MONTH, nMonth)
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT, 0)
		end
		
		if CheckActivated() ~= 2 then
			Talk(1, "", "<color=green>Chñ Phßng M¸y<color>: Tµi kho¶n cña c¸c h¹ ch­a kÝch ho¹t nhËn th­ëng hoÆc kh«ng ph¶i Vâ L©m TiÒn Bèi!")
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh«ng cã kh«ng ph¶i Vâ L©m TiÒn Bèi, kh«ng thÓ nhËn th­ëng.", szFailMember))	
			return
		end
		
		if GetPlayerRoute() == 0 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ch­a gia nhËp hÖ ph¸i, kh«ng thÓ nhËn th­ëng.", szFailMember))
			return
		end				
		if GetLevel() < 80 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ch­a ®¹t cÊp 80, kh«ng thÓ nhËn th­ëng.", szFailMember))
			return
		end
		if gf_Check55HaveSkill() == 0 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ch­a häc ®ñ vâ c«ng, kh«ng thÓ nhËn th­ëng.", szFailMember))
			return
		end
		if gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT) >= 8 then
			szFailMember = GetName()
			gf_Msg2Team(format("%s ®· nhËn th­ëng ®ñ 8 lÇn trong h«m nay, kh«ng thÓ nhËn th­ëng.", szFailMember))
			return
		end
		if nCity2 ~= nCity then
			szFailMember = GetName()
			gf_Msg2Team(format("%s kh«ng cïng b¶n ®å víi ®éi tr­ëng, kh«ng thÓ nhËn th­ëng.", szFailMember))
			return
		end
	end
	PlayerIndex = nOldPlayerIdx
	
	SetTask(TSK_HKLB_VLCH, GetTask(TSK_HKLB_VLCH) + 1)
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if GetName() ~= GetCaptainName() then
			gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT, gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT) + 1)
			ModifyExp(1000000)
			Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ nhËn ®­îc phÇn th­ëng Vâ L©m ChiÕn H÷u!",0)		
			WriteLogEx(szLogTitle,"nhËn phÇn th­ëng Vâ L©m ChiÕn H÷u")
		end
	end
	PlayerIndex = nOldPlayerIdx
	gf_SetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT, gf_GetTaskByte(TASK_FRIENDLY_AWARD, BYTE_FRIENDLY_AWARD_COUNT) + 1)
	ModifyExp(3000000)
	Say("<color=green>Chñ Phßng M¸y<color>: Chóc mõng c¸c h¹ kÝch ho¹t ®­îc phÇn th­ëng Vâ L©m ChiÕn H÷u!",0)		
	WriteLogEx(szLogTitle,"kÝch ho¹t nhËn phÇn th­ëng Vâ L©m ChiÕn H÷u")
end

--- Hµm tÆng pet cÊp 1
function GivePet1Award()
	local nCurLevel = mod(GetTask(TASK_VNG_PET), 100)
	-- KiÓm tra xem ®· luyÖn b¹n ®«ng hµnh hay ch­a
	if nCurLevel >= 1 then
		Talk(1, "", "C¸c h¹ ®· luyÖn B¾c §Èu Ngù Linh ThÇn ThuËt råi, kh«ng cÇn ph¶i kÝch ho¹t l¹i n÷a!")
		return
	end
	-- Tháa ®iÒu kiÖn kÝch ho¹t pet
	SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + 1)
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_SEX,  random(1,2))
	gf_SetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE,  1)
	Msg2Player("B¹n ®· kÝch ho¹t thµnh c«ng B¾c §Èu Ngù Linh ThÇn ThuËt!")
end

function Confirm_make_shimen_tier4HKLB(nUpgradeType)
	
	if gf_CheckPlayerRoute() == 0 then
		Talk(1, "", g_szNpcName.."Ph¶i gia nhËp hÖ ph¸i ta míi gióp ng­¬i ®­îc!");
		return 0;
	end
	
	-- ChØ sè base cña c¸c trang bÞ theo m«n ph¸i
	local tbShimen4Equip =
	{
		[2] =  {"ThiÕu L©m tôc gia", 230}, 
		[3] =  {"ThiÕu L©m thiÒn t¨ng", 330}, 
		[4] =  {"ThiÕu L©m vâ t«ng", 430}, 
		[14] =  {"Vâ §ang ®¹o gia", 1430}, 
		[15] =  {"Vâ §ang tôc gia", 1530}, 
		[8] =  {"Nga My phËt gia", 830}, 
		[9] =  {"Nga My tôc gia", 930}, 
		[11] =  {"C¸i Bang tÜnh y", 1130}, 
		[12] =  {"C¸i Bang « y", 1230}, 
		[6] =  {"§­êng M«n", 630}, 
		[17] =  {"D­¬ng Gia th­¬ng", 1730}, 
		[18] =  {"D­¬ng Gia cung", 1830}, 
		[20] = {"Ngò §éc hiÖp ®éc", 2030}, 
		[21] = {"Ngò §éc tµ ®éc", 2130}, 
	}
	
	local tbUpgradeTypes =
	{
		[1] = {"Mò", 103},
		[2] = {"Th­îng Y", 100},
		[3] = {"H¹ Y", 101},
		[4] = {"Trang Søc 1", 102},
		[5] = {"Trang Søc 2", 102},
	}
	
	-- X¸c ®Þnh sè G, D, P ®Ó add item
	local nPRoute = GetPlayerRoute()
	local nG = 0
	local nD = tbUpgradeTypes[nUpgradeType][2]
	local nP = tbShimen4Equip[nPRoute][2] + GetBody()
	if nUpgradeType == 5 then
		nP = nP + 4
	end
	if nPRoute == 8 or nPRoute == 9 then
		nP = nP - 2
	end
	
	local szEquipmentName = tbUpgradeTypes[nUpgradeType][1].." s­ m«n cÊp 4 m«n ph¸i "..tbShimen4Equip[nPRoute][1]
	--SetTask(336, GetTask(336) - 2000)
	local nRec = gf_AddItemEx2({nG, nD, nP, 1, 1, -1, -1, -1, -1, -1, -1}, szEquipmentName, szHKLBLogHeader, "chÕ t¹o thµnh c«ng")
	Msg2Player("B¹n ®· nhËn ®­îc "..szEquipmentName)
	if  nRec~= 0  then
		return 1
	end
	return 0
end

-- Add trang bÞ s­ m«n level 90
function AddTrangBiSuMon4()
	local nTemp = random(1,100)
	local nNum 
	if  nTemp <= 20 then
		nNum =  1
	elseif  nTemp <= 40 then
		nNum =  2
	elseif   nTemp <= 60 then
		nNum =  3
	elseif    nTemp <= 80 then
		nNum =  4
	else
		nNum =  5
	end
	Confirm_make_shimen_tier4HKLB(nNum) -- random(1, 5)
end

--  NhËn vò khÝ bé Phi Yªn - ViÖt Yªn - §¹i ViÖt Yªn
function AddweaponFYVYDV94()
	local nPRoute = GetPlayerRoute()
	local nRand = random(1,10000)
	if nRand <=  8799 then
		gf_AddItemEx2(tb_golden_weapon_bpy_low[nPRoute][2],tb_golden_weapon_bpy_low[nPRoute][1],szHKLBLogHeader,"NhËn Thµnh C«ng")
		Msg2Player("B¹n ®· nhËn ®­îc "..tb_golden_weapon_bpy_low[nPRoute][1])
	elseif  nRand <= 9799 then
		gf_AddItemEx2(tb_golden_vy_weapon[nPRoute][2],tb_golden_vy_weapon[nPRoute][1],szHKLBLogHeader,"NhËn Thµnh C«ng")
		Msg2Player("B¹n ®· nhËn ®­îc "..tb_golden_vy_weapon[nPRoute][1])
	elseif  nRand <= 9899 then
		AddFaction4_weapon()
	else
		gf_AddItemEx2(tb_golden_dvy_weapon[nPRoute][2],tb_golden_dvy_weapon[nPRoute][1],szHKLBLogHeader,"NhËn Thµnh C«ng")
		Msg2Player("B¹n ®· nhËn ®­îc "..tb_golden_dvy_weapon[nPRoute][1])
	end
end

-- Vò khÝ s­ m«n 4
function AddFaction4_weapon()
	local nPRoute = GetPlayerRoute()
	local nzType = GetBody()
	gf_AddItemEx2({0,tb_golden_Faction4_weapon[nPRoute][2],tb_golden_Faction4_weapon[nPRoute][3]+nzType, 1, 1, -1, -1, -1, -1, -1, -1},tb_golden_Faction4_weapon[nPRoute][1],szHKLBLogHeader,"NhËn Thµnh C«ng")
	Msg2Player("B¹n ®· nhËn ®­îc "..tb_golden_Faction4_weapon[nPRoute][1])
end
