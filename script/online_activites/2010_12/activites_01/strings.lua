--=============================================
--create by xiongyizhi 2010.11.2
--describe:Ô½ÄÏ°æ2010Äê12ÔÂ»î¶¯1 ×Ö·û´®ÎÄ¼þ
--=============================================

VET_201012_01_STR_LOG_TITLE = "Hoat dong thang 12 nam 2010";--±¾´Î»î¶¯ÈÕÖ¾±êÌâ

VET_201012_01_TB_LOG_ACTION_LIST = {
    [1] = "§æi Hép Quµ Gi¸ng Sinh",
    [2] = "§æi ®ång tiÒn vµng",
    [3] = "PhÇn th­ëng kinh nghiÖm t¨ng thªm tõ Hép Quµ Gi¸ng Sinh",
    [4] = "PhÇn th­ëng vËt phÈm tõ Hép Quµ Gi¸ng Sinh",
    [5] = "PhÇn th­ëng vËt phÈm ®Æc thï tõ Hép Quµ Gi¸ng Sinh",
    [6] = "NhËn ®­îc phÇn th­ëng max event",
    [7] = "NhËn ®­îc phÇn th­ëng ®iÓm kinh nghiÖm tõ Hép Quµ Gi¸ng Sinh",
};

VET_201012_01_TB_STRING_LIST = {
    [1] = "<color=yellow>Ho¹t ®éng mõng Gi¸ng Sinh<color> b¾t ®Çu tõ <color=red>ngµy 10/12/2010 ®Õn ngµy 09/01/2011<color>. Néi dung chi tiÕt vui lßng t×m hiÓu t¹i trang chñ <color=green>http://volam2.zing.vn<color>",
    [2] = "\n§æi Hép Quµ Gi¸ng Sinh (cÇn 5 chu«ng gi¸ng sinh + 2 vËt phÈm xu)",
    [3] = "NhËn phÇn th­ëng sö dông tèi ®a Quµ Gi¸ng Sinh",
    [4] = "Chän h×nh thøc nhËn th­ëng",
    [5] = "§æi 100 vËt phÈm xu (cÇn 1 §¹i Ng©n PhiÕu)",
    [6] = "KÝch ho¹t löa tr¹i s­ëi Êm",
    [7] = "Mua cñi (20 vµng)",
    [8] = "Nguyªn liÖu mang theo kh«ng ®ñ",
    [9] = "Sè l­îng Hép Quµ Gi¸ng Sinh ®· sö dông: <color=red>[%d/%d]<color>",
    [10] = "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi",
    [11] = "Vui lßng chän h×nh thøc nhËn th­ëng",
    [12] = "KÝch ho¹t nhËn th­ëng kh«ng nhËn vËt phÈm (t¨ng thªm 25% kinh nghiÖm)",
    [13] = "KÝch ho¹t nhËn th­ëng nhËn vËt phÈm",
    [14] = "KÕt thóc ®èi tho¹i",
    [15] = "HiÖn ®ang kÝch ho¹t nhËn th­ëng kh«ng vËt phÈm (t¨ng 25% kinh nghiÖm)",
    [16] = "HiÖn ®ang kÝch ho¹t KÝch ho¹t nhËn th­ëng nhËn vËt phÈm",
    [17] = "C¸c h¹ kh«ng mang theo §¹i Ng©n PhiÕu",
    [18] = "CÇn tæ ®éi trªn 2 ng­êi ®ång thêi mang theo cñi trªn ng­êi míi cã thÓ kÝch ho¹t",
    [19] = "L­îng tiÒn mang theo kh«ng ®ñ",
    [20] = "PhÇn th­ëng 20.000.000 Exp vµ vËt phÈm",
    [21] = "PhÇn th­ëng 20 ®iÓm n©ng cÊp b¹n ®ång hµnh vµ vËt phÈm",
    [22] = "PhÇn th­ëng 1 ®iÓm Linh Lùc b¹n ®ång hµnh vµ vËt phÈm ",
    [23] = "Chän 1 phÇn th­ëng",
    [24] = "C¸c h¹ ®· nhËn phÇn th­ëng nµy",
};

VET_201012_01_TB_ITEM_LIST = {
    [1] = {"Chu«ng Gi¸ng Sinh", 2, 1, 30265},
    [2] = {"Hép quµ gi¸ng sinh", 2, 1, 30266},
    [3] = {"H¹t Gièng B¹ch Kim", 2, 1, 30268},
    [4] = {"CÈm nang ho¹t ®éng", 2, 1, 30267},
    [5] = {"Xu", 2, 1, 30230},
    [6] = {"§¹i ng©n phiÕu", 2, 1, 199},
};

VET_201012_01_TB_ITEM_LOGINGIVE_LIST = {
    [1] = {"CÈm Nang §¹i Sù KiÖn", 2, 1, 30045},
};

-- Phan thuong tung hop qua giang sinh
VET_201012_TB_XMAS_BOX_NOMAL_AWARD = {
    {1, 100, "Thiªn th¹ch", {2, 2, 8, 1}, 0},
    {1, 60, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}, 0},
    {1, 5, "ThÕ Th©n phï", {2, 0, 556, 1}, 7 * 24 * 3600},
    {1, 20, "B¸t Nh· Chøng Th­", {2, 1, 30114, 1}, 7 * 24 * 3600},
    {1, 20, "C©y B¸t Nh· nhá", {2, 0, 504, 1}, 7 * 24 * 3600},
    {1, 10, "C©y B¸t Nh·", {2, 0, 398, 1}, 7 * 24 * 3600},
    {1, 5, "Thiªn Hµ MËt tÞch", {0, 107, 64, 1}, 0},
    {1, 5, "Tö Hµ MËt tÞch", {0, 107, 65, 1}, 0},
    {1, 5, "Chiªm Y Phæ", {0, 107, 66, 1}, 0},
    {1, 20, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},   -- xac xuat 2% - 7 ngµy
    {1, 10, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
    {1, 10, "§é NguyÖt ThÇn Sa", {2, 1, 3332, 1}, 0},
    {1, 130, "XÝch ThiÕt Tinh", {2, 1, 2652, 1}, 0},
    {3, 255, 10000, 1}, -- 1 vang 25.5%
    {4, 200, 10, 1},  -- diem danh vong 20%
    {5, 140, 10, 1},  -- diem su mon  14%
};

-- su dung hop qua giang sinh tai cac moc 20,40,60,80
VET_201012_TB_XMAS_BOX_SP_AWARD = {
    {1, 600, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
    {1, 300, "Sæ tay sèng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {1, 300, "C¬ quan nh©n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 500, "V« NgÊn Thñy", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "TÈy Tñy ®¬n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 100, "TÈy Tñy linh ®¬n", {2, 0, 137, 1}, 7 * 24 * 3600},
    {1, 2149, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},						-- 21.49%
    {1, 2000, "§ång tiÒn vµng", { 2, 1, 30094, 1 }, 0},				-- dong tien vang 20 %
    
    --{1, 1000, "Th¸i H­ §a MËt Qu¶ ", {2, 1, 387, 1}, 7 * 24 * 3600},
    --{1, 1009, "Tµng KiÕm anh hïng thiÕp", {2, 0, 31, 1}, 7 * 24 * 3600},
    --{1, 1000, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 7 * 24 * 3600},
    
    {1, 1, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 400, "NguyÖt Hoa Chi Tinh", {2, 1, 3219, 1}, 0},
    {8, 900, 60, 1},				-- 60 phut Uy thac bach cau tien don --> search trong globalfunction gf_EventGiveCustomAward
    {15, 900, 60, 1},			-- 60 phut Uy thac tam thanh tien don --> search trong globalfunction gf_EventGiveCustomAward
    {12, 900, 60, 1},			-- 60 phut Uy thach luc than tien don --> search trong globalfunction gf_EventGiveCustomAward
};

--²½·ÇÑÌÎäÆ÷,È«²¿Ëæ»ú,ËùÒÔÃ»°²ÅÅÁ÷ÅÉÅÐ¶Ï,Ö±½Ó¸´ÖÆÓÚÀúÊ·½Å±¾,ÒªÓÃµÄ»°ÐèÒªÌí¼ÓÊýÁ¿ºÍ6¸ö-1ÊôÐÔ²ÎÊý
VET_201012_01_BFY_WEAPON = {
				[1]  = {675, "Ph¸ Yªn ®ao", {0, 3, 6001, 1,1,-1,-1,-1,-1,-1,-1}},
				[2]  = {675, "Phï Yªn tr­îng",{0,8,6003, 1,1,-1,-1,-1,-1,-1,-1}},
				[3]  = {675, "Hµm Yªn thñ",{0,0,6004, 1,1,-1,-1,-1,-1,-1,-1}},
				[4]  = {675, "Tµng Yªn ch©m",{0,1,6005, 1,1,-1,-1,-1,-1,-1,-1}},
				[5]  = {675, "Phi Yªn kiÕm",{0,2,6006, 1,1,-1,-1,-1,-1,-1,-1}},
				[6]  = {675, "VËn Yªn cÇm",{0,10,6007, 1,1,-1,-1,-1,-1,-1,-1}},
				[7] = {675, "V©n Yªn thñ",{0,0,6008, 1,1,-1,-1,-1,-1,-1,-1}},
				[8] = {675, "L­u Yªn c«n",{0,5,6009, 1,1,-1,-1,-1,-1,-1,-1}},
				[9] = {675, "HuyÒn Yªn kiÕm",{0,2,6010, 1,1,-1,-1,-1,-1,-1,-1}},
				[10] = {675, "Vò Yªn bót",{0,9,6011, 1,1,-1,-1,-1,-1,-1,-1}},
				[11] = {675, "Hµ Tiªm Th­¬ng",{0,6,6012, 1,1,-1,-1,-1,-1,-1,-1}},
				[12] = {675, "Hµnh Yªn Cung",{0,4,6013, 1,1,-1,-1,-1,-1,-1,-1}},
				[13] = {625, "Träc Yªn nhÉn",{0,7,6014, 1,1,-1,-1,-1,-1,-1,-1}},
				[14] = {600, "Yªu Yªn tr¶o",{0,11,6015, 1,1,-1,-1,-1,-1,-1,-1}},
				[15] = {675, "Ph¸ Yªn C«n",{0, 5, 6002, 1,1,-1,-1,-1,-1,-1,-1}},
};

-- su dung hop qua giang sinh toi da (nhan 20 mil exp + 20 diem nang cap ban dong hanh + 1 diem linh luc )
VET_201012_TB_XMAS_BOX_FINAL_AWARD = { 	
    --{1, 300, "Ch«m Ch«m ", {2, 1, 30165, 50}, 0},
    -- {3, 50, 5000000, 1},								-- vang (type=3-1)    
    
    {1, 1, "Thiªn Qu¸i Th¹ch", {2, 0, 1084, 1}, 0},
    {1, 100, "ChiÕn ThÇn hoµn", {2, 1, 1005, 1}, 7 * 24 * 3600},
    {1, 10, "Phi Yªn Th¹ch", {2, 1, 30130, 1}, 0},
    {1, 10, "Tö Quang ThÇn Th¹ch", {2, 1, 30131, 1}, 0},
    {1, 5, "B¸ch Kim Hång Bao (trèng)", {2, 1, 30228, 1}, 7 * 24 * 3600},
    {1, 5, "Hoµng Kim §¹i Hång Bao (trèng)", {2, 1, 538, 1}, 7 * 24 * 3600},
    {1, 10, "Tö Kim Hång Bao (trèng)", {2, 1, 536, 1}, 7 * 24 * 3600},
    {1, 400, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},				-- 40%     - 2 item Nhan sam van niem
    {1, 1, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},    
    {1, 20, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}, 0},			-- 2%
    {1, 5, "Thiªn Th¹ch Linh Th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
    {1, 1, "L¨ng Ba Vi Bé", {0, 112, 78, 1}, 0},
    {1, 10, "R­¬ng YÕu QuyÕt Cao CÊp", {2,1,30112, 1}, 7 * 24 * 3600},        
    {32, 382, 7000, 1},	-- 7000 diem quan cong
    {1, 10, "Long Tö Bèi", { 2, 1, 30155, 1 }, 0 },
    {1, 10, "Phông Tö Bèi", { 2, 1, 30156, 1 }, 0 },
    {1, 10, "¦ng Tö Bèi", { 2, 1, 30158, 1 }, 0 },
    {31, 5, "get_bpy_weapon_201012()" },
    {31, 5, "get_faction_armor_201012()" },   -- lat xem lai
};

VET_201012_08_EQUIP  = {	
	{"B¹ch v« thuêng ngôy ®éc y", 2, {0, 100, 21219, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B¹ch v« thuêng ngôy ®éc y", 2, {0, 100, 21229, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"B¹ch v« thuêng ngôy ®éc y", 2, {0, 100, 21239, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B¹ch v« thuêng ngôy ®éc y", 2, {0, 100, 21249, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"Thiªn long b¸t bé kh¶i gi¸p", 2, {0, 100, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thiªn long b¸t bé kh¶i gi¸p", 2, {0, 100, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"V« l­îng ph¸p t«n thiÒn ®Þnh bµo", 2, {0, 100, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"V« l­îng ph¸p t«n thiÒn ®Þnh bµo", 2, {0, 100, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"B¸t b¶o la h¸n ®¹i thõa kh¶i gi¸p", 2, {0, 100, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B¸t b¶o la h¸n ®¹i thõa kh¶i gi¸p", 2, {0, 100, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"Thiªn c¬ sø gi¶ thÇn triÖu c©n", 2, {0, 100, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thiªn c¬ sø gi¶ thÇn triÖu c©n", 2, {0, 100, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thiªn c¬ sø gi¶ thÇn triÖu c©n", 2, {0, 100, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Thiªn c¬ sø gi¶ thÇn triÖu c©n", 2, {0, 100, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"B¹ch liªn tiªn tö b¶o Èn y", 2, {0, 100, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"B¹ch liªn tiªn tö b¶o Èn y", 2, {0, 100, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
	
	{"Ngäc vËn tiªn tö huyÒn hån y", 2, {0, 100, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
	{"Ngäc vËn tiªn tö huyÒn hån y", 2, {0, 100, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
		
	{"Long ®Çu thÇn c¸i ®»ng v©n y", 2, {0, 100, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long ®Çu thÇn c¸i ®»ng v©n y", 2, {0, 100, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long ®Çu thÇn c¸i ®»ng v©n y", 2, {0, 100, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long ®Çu thÇn c¸i ®»ng v©n y", 2, {0, 100, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"KhÊt thiªn thÇn c¸i v©n du y", 2, {0, 100, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"KhÊt thiªn thÇn c¸i v©n du y", 2, {0, 100, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"KhÊt thiªn thÇn c¸i v©n du y", 2, {0, 100, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"KhÊt thiªn thÇn c¸i v©n du y", 2, {0, 100, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Chuëng kinh thanh quang bµo", 2, {0, 100, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Chuëng kinh thanh quang bµo", 2, {0, 100, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Chuëng kinh thanh quang bµo", 2, {0, 100, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Chuëng kinh thanh quang bµo", 2, {0, 100, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Th¸i Êt t¶n nh©n h¹o nhiªn phôc", 2, {0, 100, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Th¸i Êt t¶n nh©n h¹o nhiªn phôc", 2, {0, 100, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Th¸i Êt t¶n nh©n h¹o nhiªn phôc", 2, {0, 100, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Th¸i Êt t¶n nh©n h¹o nhiªn phôc", 2, {0, 100, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Long t­¬ng ngao khÝ chiÕn kh¶i", 2, {0, 100, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long t­¬ng ngao khÝ chiÕn kh¶i", 2, {0, 100, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long t­¬ng ngao khÝ chiÕn kh¶i", 2, {0, 100, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{"Long t­¬ng ngao khÝ chiÕn kh¶i", 2, {0, 100, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},	
	
	{"Hæ dùc m·nh sü chiÕn kh¶i", 3, {0, 100, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"Hæ dùc m·nh sü chiÕn kh¶i", 3, {0, 100, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"Hæ dùc m·nh sü chiÕn kh¶i", 3, {0, 100, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"Hæ dùc m·nh sü chiÕn kh¶i", 3, {0, 100, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},			
	
	{"U minh quû s¸t tu la huyÕt y", 3, {0, 100, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"U minh quû s¸t tu la huyÕt y", 3, {0, 100, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"U minh quû s¸t tu la huyÕt y", 3, {0, 100, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},		
	{"U minh quû s¸t tu la huyÕt y", 3, {0, 100, 2034, 1, 1, -1, -1, -1, -1, -1, -1}},		
}
