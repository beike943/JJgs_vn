--=============================================
--create by zhoulimei 2009-12-28
--describe:Ô½ÄÏ°æ×ªÉúÍ¬°éÏµÍ³×Ö·û´®ÎÄ¼ş
--Îª±ÜÃâÓëÆäËüÎÄ¼şÖĞµÄ±äÁ¿ÖØÃû£¬±¾ÎÄ¼şÖĞÒÔVET_201003_TONGBAN¿ªÍ·
--=============================================


VET_201003_TONGBAN_STR_LOGTITLE = "Ban Dong Hanh";

VET_201003_TONGBAN_STR_MODE_NAME =  --Í¬°éNPCÄ£°åÃû
{
    [1] = {"Thá tr¾ng", "Thá x¸m", "Thá ®en"},
    [2] = {"TiÓu D· tr­", "Ong vµng","§éc Gi¸p Trïng","D¬i","Hå Ly","Bß c¹p n­íc"},
    [3] = {"Sãi ®iªn","Qu¹ §en","C¸ sÊu1","Cãc1","D¬i hót m¸u","Bß c¹p","Ng©n Hå","Th­¬ng Viªn","Thô Qu¸i1","GÊu x¸m","Ong ®éc","Kim Gi¸p"},
    [4] = {"Sãi ®iªn","Qu¹ §en","C¸ sÊu1","Cãc1","D¬i hót m¸u","Bß c¹p","Ng©n Hå","Th­¬ng Viªn","Thô Qu¸i1","GÊu x¸m","Ong ®éc","Kim Gi¸p", "Hång Bµo Sø Gi¶3","T©y B¾c Tr¸ng H¸n","NhÊt PhÈm §­êng MËt Sø","Xi Háa Tr­ëng L·o","Oa KhÊu1","Tiªn N÷1","N÷ Tiªu Tiªn","Tr× M©u Hé VÖ"},
};

tPetInfo = {
	[1] 	= {"Thó",{"§ùc","C¸i"}},
	[2] 	= {"Thó",{"§ùc","C¸i"}},
	[3] 	= {"Thó",{"§ùc","C¸i"}},
	[4] 	= {"Ng­êi",{"Nam","N÷"}},
	[5] 	= {"Ng­êi",{"Nam","N÷"}},
	[6] 	= {"Ng­êi",{"Nam","N÷"}},
	[7] 	= {"Linh Thó",{"D­¬ng","¢m"}},
	[8] 	= {"Linh Thó",{"D­¬ng","¢m"}},
	[9] 	= {"Linh Thó",{"D­¬ng","¢m"}},
	[10] 	= {"Linh Thó",{"D­¬ng","¢m"}},	
}

tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[29] = 1176,
				[30] = 1229,
}

-- §iÓm n©ng cÊp, ®iÓm luyÖn, vµng, th¸i dŞch, ®iÓm linh lùc cÇn, ®iÓm linh lùc tèi ®a, sè lÇn luyÖn linh lùc 1 ngµy
tRequireElement =
{
				[1] = {0, 7000, 1000000, 10, 0, 0,0},
				[2] = {300, 7000, 1000000, 20, 0, 200, 5},
				[3] = {600, 7000, 1000000, 30, 200, 600, 5},
				[4] = {1200, 7000, 1000000, 40, 600, 1500, 5},
}

tGP_Daily = {4,4,3,2,2}

VET_201003_TONGBAN_STR_LOG_ACTION =            
{
    [1] = "nhËn ®­îc phÇn th­ëng b¹n ®ång hµnh th­êng ngµy - phÇn th­ëng qu©n c«ng:",
    [2] = "D¹ng tªn NPC b¹n ®ång hµnh lçi",
    [3] = "Lçi ®¼ng cÊp b¹n ®ång hµnh",
    [4] = "Kh¸ng tÊt c¶ +5",
    [5] = "Kh¸ng tÊt c¶ +10",
    [6] = "Kh¸ng tÊt c¶ +20",
    [7] = "Hoµn thµnh nhiÖm vô b¹n ®ång hµnh th­êng ngµy, giao nép",
    [8] = "Sö dông tói thùc phÈm",
}

VET_201003_TONGBAN_STR_SHOW_MASSAGE = 
{
    [1] = "NhËp tªn cña b¹n ®ång hµnh:",
    [2] = "Thêi gian tån t¹i cña b¹n ®ång hµnh lµ 24 giê (bao gåm thêi gian rêi m¹ng), sau 24 giê sÏ tù ®éng biÕn mÊt. NÕu nh­ kh«ng muèn nh×n thÊy nã cã thÓ triÖu håi b¹n ®ång hµnh míi.",
    [3] = "§¹i hiÖp ®· nhËn nhiÖm vô, h·y hoµn thµnh nhiÖm vô hiÖn t¹i råi míi nhËn nhiÖm vô míi",
    [4] = "B¹n ®ång hµnh cña c¸c h¹ cã cÊp %d.",
    [5] = "§iÓm søc kháe cña b¹n ®ång hµnh ®· ®¹t ®Õn <color=yellow>300<color> ®iÓm, kh«ng thÓ tiÕp tôc cho ¨n!",
    [6] = "Sö dông tói thøc ¨n thµnh c«ng, ®iÓm søc kháe cña b¹n ®ång hµnh hiÖn t¹i lµ %d.",
    [7] = "NhËn ®­îc tr¹ng th¸i kh¸ng tÊt c¶ t¨ng %d.",
    [8] = "Mçi ngµy ®¹i hiÖp cã thÓ nhËn ®­îc <color=yellow>4<color> lÇn nhiÖm vô b¹n ®ång hµnh, chØ cÇn trong vßng 1 ngµy hoµn thµnh <color=yellow>4<color> lÇn nhiÖm vô th× cã thÓ nhËn ®­îc phÇn th­ëng thËt phong phó. HiÖn t¹i cã thÓ nhËn ®­îc <color=yellow>%d<color> lÇn nhiÖm vô. Gi·n c¸ch 2 lÇn nhËn nhiÖm vô lµ <color=yellow>30<color> phót.",
    [9] = "Mau ®i t×m <color=yellow>%d<color> <color=yellow>%s<color>! Trong 1 ngµy hoµn thµnh <color=yellow>4<color> lÇn nhiÖm vô sÏ ®­îc phÇn th­ëng thËt phong phó. Tr­íc m¾t ®· hoµn thµnh <color=yellow>%d<color> lÇn nhiÖm vô!",
    [10] = "§· nhËn ®­îc tr¹ng th¸i hç trî!",
    [11] = "§iÓm søc kháe hiÖn t¹i cña b¹n ®ång hµnh lµ: <color=yellow>%d<color>. §iÓm n©ng cÊp lµ: <color=yellow>%d<color>.",
    [12] = "B¹n ®ång hµnh cÇn cã søc kháe thËt tèt ®Ó tr­ëng thµnh, ®iÓm søc kháe cao nhÊt lµ <color=yellow>300<color>, b¹n ®ång hµnh dùa vµo ®iÓm søc kháe ®Ó lªn cÊp. \n<color=yellow>C¸ch n©ng cÊp: <color> ®iÓm søc kháe cña b¹n ®ång hµnh sÏ tù ®éng gi¶m, mçi lÇn gi¶m <color=yellow>10<color> ®iÓm søc kháe vµ t¨ng <color=yellow>1<color> ®iÓm n©ng cÊp. B¹n ®ång hµnh dùa vµo ®iÓm n©ng cÊp ®Ó lªn cÊp. CÊp 1  lªn cÊp 2 cÇn <color=yellow>600<color> ®iÓm n©ng cÊp vµ <color=yellow>1<color> long huyÕt hoµn.",
    [13] = "H·y mau t×m <color=yellow>%d<color> <color=yellow>%s<color> !",
    [14] = "CÊp 2 lªn cÊp 3 cÇn <color=yellow>3600<color> ®iÓm n©ng cÊp vµ <color=yellow>1<color> long huyÕt hoµn, <color=yellow>1<color> phông huyÕt hoµng, <color=yellow>1<color> kú l©n hoµn, <color=yellow>1<color> chiÕn thÇn hoµn. Mçi lÇn n©ng cÊp xong hÖ thèng sÏ tù ®éng ®Æt ®iÓm n©ng cÊp thµnh <color=yellow>0<color>. \n<color=yellow>C¸ch n©ng cÊp: <color> cã thÓ sö dông <color=yellow>tói thùc phÈm <color> ®Ó t¨ng ®iÓm søc kháe. B¹n ®ång hµnh cã cÊp cµng cao sÏ nhËn ®­îc tr¹ng th¸i hç trî cµng cao ®ã!",
    [15] = "Trang kÕ",
    [16] = "Trang tr­íc",
    [17] = "trë l¹i",
    [18] = "Giao n¹p nhiÖm vô b¹n ®ång hµnh th­êng ngµy thµnh c«ng!",
    [19] = "N©ng cÊp thµnh c«ng, b¹n ®ång hµnh cã cÊp lµ <color=yellow>2<color>!",
    [20] = "N©ng cÊp thµnh c«ng, b¹n ®ång hµnh cã cÊp lµ <color=yellow>3<color>!",
    [21] = "HiÖn t¹i ®¼ng cÊp cña b¹n ®ång hµnh <color=yellow>%d<color>, ®iÓm søc kháe <color=yellow>%d<color>, ®iÓm n©ng cÊp <color=yellow>%d<color>.",
    [22] = "NhËn ®­îc %d ®iÓm qu©n c«ng",
    [23] = "H«m nay ®¹i hiÖp ®· hoµn thµnh <color=yellow>%d<color> nhiÖm vô, cßn cã thÓ hoµn thµnh <color=yellow>%d<color> nhiÖm vô.",
}

VET_201003_TONGBAN_STR_YIN_DIALOG =             --ÃÅ»áÓ¡Ê¹ÓÃ¶Ô»°
{
    "TriÖu håi b¹n ®ång hµnh" .. "/vet_201003_tongban_call_partner",
    "NhiÖm vô b¹n ®ång hµnh th­êng ngµy" .. "/vet_201003_tongban_daily_task",
    "N©ng cÊp b¹n ®ång hµnh" .. "/vet_201003_tongban_upgrade_partner",
    "NhËn tr¹ng th¸i hç trî" .. "/vet_201003_tongban_get_assist",
    "Rêi khái" .. "/vet_201003_tongban_end_dialog",
}



VET_201003_TONGBAN_STR_DAILY_TASK =             --Í¬°éÈÕ³£ÈÎÎñ½ÓÊÜ½»ÄÉ
{
    {"NhËn nhiÖm vô cÊp 1" .. "/vet_201003_tongban_get_task", "Néi nhiÖm vô cÊp 1" .. "/vet_201003_tongban_hand_task","HiÓn thŞ nhiÖm vô" .. "/vet_201003_tongban_show_task", "H­íng dÉn nhiÖm vô th­êng ngµy" .. "/vet_201003_tongban_task_explain", "Trë l¹i trang tr­íc" .. "/vet_201003_tongban_menghuiyin_in", "Rêi khái" .. "/vet_201003_tongban_end_dialog",},
    {"NhËn nhiÖm vô cÊp 2" .. "/vet_201003_tongban_get_task", "Nép nhiÖm vô cÊp 2" .. "/vet_201003_tongban_hand_task","HiÓn thŞ nhiÖm vô" .. "/vet_201003_tongban_show_task", "H­íng dÉn nhiÖm vô th­êng ngµy" .. "/vet_201003_tongban_task_explain", "Trë l¹i trang tr­íc" .. "/vet_201003_tongban_menghuiyin_in", "Rêi khái" .. "/vet_201003_tongban_end_dialog",},
    {"NhËn nhiÖm vô cÊp 3" .. "/vet_201003_tongban_get_task", "Nép nhiÖm vô cÊp 3" .. "/vet_201003_tongban_hand_task","HiÓn thŞ nhiÖm vô" .. "/vet_201003_tongban_show_task", "H­íng dÉn nhiÖm vô th­êng ngµy" .. "/vet_201003_tongban_task_explain", "Trë l¹i trang tr­íc" .. "/vet_201003_tongban_menghuiyin_in", "Rêi khái" .. "/vet_201003_tongban_end_dialog",},
}

VET_201003_TONGBAN_STR_UPGRADE_PARTNER = 
{
    [1] = "N©ng cÊp b¹n ®ång hµnh lªn cÊp 2" .. "/#vet_201003_tongban_upgrade_partner_to(2)",
    [2] = "N©ng cÊp b¹n ®ång hµnh lªn cÊp 3" .. "/#vet_201003_tongban_upgrade_partner_to(3)",
    [3] = "Xem ®iÓm n©ng cÊp vµ ®iÓm søc kháe b¹n ®ång hµnh" .. "/vet_201003_tongban_view_point",
    [4] = "§iÒu kiÖn n©ng cÊp" .. "/vet_201003_tongban_upgrade_condition",
    [5] = "Trë l¹i trang tr­íc" .. "/vet_201003_tongban_menghuiyin_in",
    [6] = "Rêi khái" .. "/vet_201003_tongban_end_dialog",
}

VET_201003_TONGBAN_STR_DAILY_TASK_ERROR =        --Í¬°éÈÕ³£ÈÎÎñ´íÎóÌáÊ¾
{
    [1] = "VÉn ch­a nhËn nhiÖm vô!",
    [2] = "VÉn ch­a hoµn thµnh nhiÖm vô, h·y ®i thu thËp vËt phÈm nhĞ!",
    [3] = "VÉn cßn thiÕu <color=yellow>%d<color> ®iÓm n©ng cÊp míi cã thÓ lªn cÊp <color=yellow>%d<color>!",
    [4] = "B¹n ®ång hµnh ®· lªn cÊp <color=yellow>2<color>!",
    [5] = "B¹n ®ång hµnh ®· lªn cÊp <color=yellow>3<color>!",
    [6] = "Tr­íc tiªn ph¶i n©ng cÊp lªn b¹n ®ång hµnh cÊp <color=yellow>2<color> ®·!",
    [7] = "H«m nay ®· nhËn <color=yellow>4<color> lÇn nhiÖm vô, ngµy mai l¹i tíi nhĞ!",
    [8] = "Gi·n c¸ch nhËn nhiÖm vô th­êng ngµy lµ <color=yellow>30<color> phót, cßn ph¶i ®îi thªm <color=yellow>%d<color> phót!",
    [9] = "VÉn ch­a hoµn thµnh nhiÖm vô mµ!",
    [10] = "Nép nhiÖm vô thµnh c«ng,",
    [11] = "C¸c h¹ kh«ng ph¶i lµ thµnh viªn cña long tö héi, kh«ng thÓ sö dông long tö Ên!",
    [12] = "C¸c h¹ kh«ng ph¶i lµ thµnh viªn cña phông tö héi, kh«ng thÓ sö dông phông tö Ên!",
    [13] = "C¸c h¹ kh«ng ph¶i lµ thµnh viªn cña hæ tö héi, kh«ng thÓ sö dông hæ tö Ên!",
    [14] = "C¸c h¹ kh«ng ph¶i lµ thµnh viªn cña ­ng tö héi, kh«ng thÓ sö dông ­ng tö Ên!",
    [15] = "C¸c h¹ vÉn ch­a chuyÓn sinh!",
    [16] = "Xin lçi, trªn hµnh trang c¸c h¹ kh«ng cã long huyÕt hoµn, nhanh chãng thu thËp vËt phÈm nhĞ!",
    [17] = "Trªn hµnh trang kh«ng ®ñ long huyÕt hoµn, phông huyÕt hoµn, kú l©n hoµn, chiÕn thÇn hoµn. Thu thËp råi h½ng lµm l¹i nhĞ!",
    [18] = "§¹i hiÖp vÉn ch­a kİch ho¹t tİnh n¨ng b¹n ®ång hµnh!",
    [19] = "§¹i hiÖp vÉn ch­a cã b¹n ®ång hµnh, h·y nhanh chãng kİch ho¹t nhĞ!",
}


                         
VET_201003_TONGBAN_TB_PARTNER_DAILY_TASK =        --Ô½ÄÏÍ¬°éÏµÍ³  ÈÕ³£ÈÎÎñ
{
    {"B¹ch C©u Hoµn",30, {2, 1, 270, 1}},
    {"Lôc ThÇn hoµn",30, {2, 1, 1064, 1}},
    {"Tam Thanh hoµn",30, {2, 1, 1097, 1}},
    {"Qu©n C«ng Ch­¬ng",10, {2, 1, 9999, 1}},
}

VET_201003_TONGBAN_TB_PARTNER_UPGRADE =           --Ô½ÄÏÍ¬°éÏµÍ³  Í¬°éÉı¼¶ÎïÆ·
{
    {"Long HuyÕt hoµn", {2, 1, 1002, 1}},
    {"Phông HuyÕt hoµn", {2, 1, 1004, 1}},
    {"Kú L©n hoµn", {2, 1, 1003, 1}},
    {"ChiÕn ThÇn hoµn", {2, 1, 1005, 1}},
}

PET_CHANGE_MALE_DLG =
{
	"Chµo cËu chñ! H«m nay m×nh lµm g× ®©y?",
	"Chµo cËu chñ! Nghe nãi ë BiÖn Kinh cã ®¸nh nhau k×a! ",
	"Chµo cËu chñ! MÊy ng­êi kia nh×n m×nh thÊy ghĞt qu¸!",
	"Chµo cËu chñ! M×nh bËt PK lªn chø ?",
	"Chµo cËu chñ! M×nh ra T©y Thµnh §« ch¬i ®i!",
	"Chµo cËu chñ! M×nh ®i trång B¸t Nh· ®i!",
	"Chµo cËu chñ! ChŞ kia dÔ th­¬ng qu¸ k×a!",
	"Chµo cËu chñ! M×nh ra B¾c TuyÒn Ch©u ch¬i ®i!",
	"Chµo cËu chñ! Ch¬i Game nhí gi÷ g×n søc kháe nha!",
	"Chµo cËu chñ! M×nh ®i thu thËp Tèng Liªu tµi nguyªn ®i!",
}

PET_CHANGE_FEMALE_DLG =
{
	"Chµo c« chñ! H«m nay m×nh lµm g× ®©y?",
	"Chµo c« chñ! Nghe nãi ë BiÖn Kinh cã ®¸nh nhau k×a! ",
	"Chµo c« chñ! MÊy ng­êi kia nh×n m×nh thÊy ghĞt qu¸!",
	"Chµo c« chñ! M×nh bËt PK lªn chø ?",
	"Chµo c« chñ! M×nh ra T©y Thµnh §« ch¬i ®i!",
	"Chµo c« chñ! M×nh ®i trång B¸t Nh· ®i!",
	"Chµo c« chñ! Anh kia ®Ñp trai qu¸ k×a!",
	"Chµo c« chñ! M×nh ra B¾c TuyÒn Ch©u ch¬i ®i!",
	"Chµo c« chñ! Ch¬i Game nhí gi÷ g×n søc kháe nha!",
	"Chµo c« chñ! M×nh ®i thu thËp Tèng Liªu tµi nguyªn ®i!",
}

PET_RANDOM_CHAT_DLG =
{
	"C¸i nµy th× cßn tïy! Mµ ch¾c còng s¾p råi.",
	"Cßn ch­a ®ñ tuæi ®Ó hái c©u nµy ®©u, ®õng liÒu!",
	"Nãi chung lµ ®óng råi! §õng nghÜ g× n÷a.",
	"§Ñp mµ sao hái khã qu¸ dzËy ?",
	"ThËt vËy sao? NghÜ kü còng ®óng ®ã.",
	"Còng ®­îc! nh­ng ®Õn mïa æi n¨m sau ch¾c míi ®­îc.",
	"T©m tr¹ng kh«ng vui, l¸t bĞ tr¶ lêi!",
	"Hái thÕ th× sao bĞ tr¶ lêi!",
	"ChuÈn kh«ng cÇn chØnh!",
	"BĞ cßn thİch n÷a nãi chi lµ ai!",
}

PET_BUFF_TYPE =
{
	[4] = {"Kh¸ng tÊt c¶ +3", 1, {"state_add_allability", 3}},
}