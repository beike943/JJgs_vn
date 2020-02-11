Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\online_activites\\task_values.lua");

VET_201101_01_STR_LOG_TITLE = "Hoat dong thang 1 nam 2011"

PB_useThreshold = 2000;
PB_activityID = 25;

PB_modeTaskID = VET_201101_01_TASK_MODE;
PB_usedCountTaskID = VET_201101_01_TASK_USED_COUNT;
PB_usedCountMode1TaskID = VET_201101_01_TASK_USED_COUNT_MODE1;
PB_usedCountMode2TaskID = VET_201101_01_TASK_USED_COUNT_MODE2;
PB_ifGotRewardTaskID = VET_201101_01_IF_GET_REWARD;

VET_201101_01_TB_LOG_ACTION_LIST =
{
	[1] = "§æi M©m Ngò Qu¶ b»ng Xu",
	[2] = "NhËn th­ëng M©m Ngò Qu¶",
	[3] = "NhËn th­ëng ®iÓm Tö Quang C¸c",
	[4] = "§æi M©m Ngò Qu¶ b»ng Nh¸nh Hoa Mai",
	[5] = "PhÇn th­ëng sö dông M©m Ngò Qu¶ tèi ®a vËt phÈm",
	[6] = "PhÇn th­ëng sö dông M©m Ngò Qu¶ tèi ®a lo¹i ",
}

PB_expReward = 
{
	200000, 
	250000
}

PB_items = 
{
	{2, 1, 30277, "Nguyªn liÖu event TÕt"},
	{2, 1, 30230, " Xu "},
	{2, 1, 199, "§¹i ng©n phiÕu"},
	{2, 1, 30051, "Nh¸nh Hoa Mai"},
};

PB_exchangeTable1 = 
{
	{
		{"Nguyªn liÖu event TÕt", 2, 1, 30277, 5},
		{" Xu ", 2, 1, 30230, 2}
	},
	{
		{"M©m Ngò Qu¶", 100, {"M©m Ngò Qu¶", {2, 1, 30278, 1}}}
	}
};

PB_exchangeTable2 = 
{
	{
		{"§¹i ng©n phiÕu", 2, 1, 199, 1},
	},
	{
		{" Xu ", 100, {" Xu ", {2, 1, 30230, 100}}}
	}
};

-- base 1000
PB_itemReward =
{
	{3, 250, 10000, 1},
	{1, 100, "Thiªn th¹ch", {2, 2, 8, 1}},
	{1, 60, "M¶nh Thiªn th¹ch", {2, 2, 7, 1}},
 	{1, 5, "ThÕ Th©n phï", {2, 0, 556, 1}, 7 * 24 * 3600},
 	{1, 20, "B¸t Nh· Chøng Th­", {2, 1, 30114, 1}, 7 * 24 * 3600},
 	{1, 20, "C©y B¸t Nh· nhá", {2, 0, 504, 1}, 7 * 24 * 3600},
 	{1, 10, "C©y B¸t Nh·", {2, 0, 398, 1}, 7 * 24 * 3600},
  	{4, 200, 10, 1},
  	{5, 140, 10, 1},
	{1, 5, "Thiªn Hµ MËt tÞch", {0, 107, 64, 1}},
	{1, 5, "Tö Hµ MËt tÞch", {0, 107, 65, 1}},
	{1, 5, "Chiªm Y Phæ", {0, 107, 66, 1}},
	{1, 20, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
	{1, 10, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
	{1, 5, "§ång TiÒn Vµng", {2, 1, 30094,1}},
	{1, 10, "§é NguyÖt ThÇn Sa", {2, 1, 3332, 1}},
	{1, 100, "XÝch ThiÕt Tinh", {2, 1, 2652, 1}},
	{1, 35, "Th¸i DÞch Hçn Nguyªn C«ng §å", {2, 0, 1082, 1}}
};

PB_specialTimes = 20;

-- base 10000
PB_extraItemReward = {
    {8, 1800, 60, 1},
    {15, 1800, 60, 1},
    {12, 1800, 60, 1},
    {1, 300, "Sæ tay sèng", {2, 19, 1, 1}, 7 * 24 * 3600},
    {1, 300, "C¬ quan nh©n", {2, 1, 1011, 1}, 7 * 24 * 3600},
    {1, 500, "V« NgÊn Thñy", {2, 1, 503, 1}, 7 * 24 * 3600},
    {1, 500, "TÈy Tñy ®¬n", {2, 0, 136, 1}, 7 * 24 * 3600},
    {1, 100, "TÈy Tñy linh ®¬n", {2, 0, 137, 1}, 7 * 24 * 3600},
    {1, 1049, "§Êu hån", {2, 1, 1157, 1}, 7 * 24 * 3600},
    {1, 1000, "R­¬ng BÝ KÝp", {2, 1, 30093, 1}, 7 * 24 * 3600},
    {1, 1, "Qu©n C«ng Huy Hoµng", {2, 1, 9977, 1}, 7 * 24 * 3600},
    {1, 50, "Qu©n C«ng §¹i", {2, 1, 9998, 1}, 7 * 24 * 3600},
    {1, 400, "Qu©n C«ng Ch­¬ng", {2, 1, 9999, 1}, 7 * 24 * 3600},
    {1, 400, "NguyÖt Hoa Chi Tinh", {2, 1, 3219, 1}}
};

-- base 10000
PB_equipmentReward1 = {
	{1, 675, "Ph¸ Yªn ®ao", {0, 3, 6001, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Ph¸ Yªn c«n", {0, 5, 6002, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Phï Yªn tr­îng", {0, 8, 6003, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Hµm Yªn thñ", {0, 0, 6004, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Tµng Yªn ch©m", {0, 1, 6005, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Phi Yªn kiÕm", {0, 2, 6006, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "VËn Yªn cÇm", {0, 10, 6007, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "V©n Yªn thñ", {0, 0, 6008, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "L­u Yªn c«n", {0, 5, 6009, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "HuyÒn Yªn kiÕm", {0, 2, 6010, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Vò Yªn bót", {0, 9, 6011, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Hµ Tiªm Th­¬ng", {0, 6, 6012, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 675, "Hµnh Yªn Cung", {0, 4, 6013, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 625, "Träc Yªn nhÉn", {0, 7, 6014, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 600, "Yªu Yªn tr¶o", {0, 11, 6015, 1, 1, -1, -1, -1, -1, -1, -1}}
};

-- base 10000
PB_equipmentReward2 = {
	{1, 20, "B¹ch V« Th­êng Ngôy §éc Y", {0, 100, 21219, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch V« Th­êng Ngôy §éc Y", {0, 100, 21229, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch V« Th­êng Ngôy §éc Y", {0, 100, 21239, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "B¹ch V« Th­êng Ngôy §éc Y", {0, 100, 21249, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Thiªn Long B¸t Bé Kh¶i Gi¸p", {0, 100, 231, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Thiªn Long B¸t Bé Kh¶i Gi¸p", {0, 100, 232, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "V« L­îng Ph¸p T«n ThiÒn §Þnh Bµo", {0, 100, 331, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "V« L­îng Ph¸p T«n ThiÒn §Þnh Bµo", {0, 100, 332, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "B¸t B¶o La H¸n §¹i Thõa Kh¶i Gi¸p ", {0, 100, 431, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "B¸t B¶o La H¸n §¹i Thõa Kh¶i Gi¸p ", {0, 100, 432, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 631, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 632, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 633, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu C©n", {0, 100, 634, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "B¹ch Liªn Tiªn Tö B¶o Èn Y", {0, 100, 831, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "B¹ch Liªn Tiªn Tö B¶o Èn Y", {0, 100, 832, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån Y", {0, 100, 931, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån Y", {0, 100, 932, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Y", {0, 100, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du Y", {0, 100, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Ch­ëng Kinh Thanh Quang Bµo", {0, 100, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Phôc", {0, 100, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 20, "Long T­¬ng Ngao KhÝ ChiÕn kh¶i", {0, 100, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "Hæ Dùc M·nh Sü ChiÕn kh¶i", {0, 100, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},	
	{1, 30, "U Minh Quû S¸t Tu La HuyÕt Y", {0, 100, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}	
};

PB_equipmentReward3 = {
	{1, 20, "B¹ch V« Th­êng Quû §éc Tr¶o", {0, 11, 21219, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch V« Th­êng Quû §éc Tr¶o", {0, 11, 21229, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch V« Th­êng Quû §éc Tr¶o", {0, 11, 21239, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch V« Th­êng Quû §éc Tr¶o", {0, 11, 21249, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng §ao", {0, 3, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng §ao", {0, 3, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng C«n", {0, 5, 231, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¸t Bé Thiªn Long Thiªn Chóng C«n", {0, 5, 232, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "V« L­îng Ph¸p T«n ThiÒn Tr­îng", {0, 8, 331, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "V« L­îng Ph¸p T«n ThiÒn Tr­îng", {0, 8, 332, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¸t B¶o La H¸n §¹i Thõa Thñ", {0, 0, 431, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¸t B¶o La H¸n §¹i Thõa Thñ", {0, 0, 432, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 631, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 632, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 633, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Thiªn C¬ Sø Gi¶ ThÇn TriÖu Ch©m", {0, 1, 634, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch Liªn Tiªn Tö B¶o UÈn KiÕm", {0, 2, 831, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "B¹ch Liªn Tiªn Tö B¶o UÈn KiÕm", {0, 2, 832, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån CÇm", {0, 10, 931, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Ngäc VËn Tiªn Tö HuyÒn Hån CÇm", {0, 10, 932, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1131, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1132, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1133, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long §Çu ThÇn C¸i §»ng V©n Thñ", {0, 0, 1134, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1231, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1232, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1233, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "KhÊt Thiªn ThÇn C¸i V©n Du C«n", {0, 5, 1234, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1431, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1432, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1433, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Ch­ëng Kinh Thanh Quang KiÕm", {0, 2, 1434, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1531, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1532, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1533, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Th¸i Êt T¶n Nh©n H¹o Nhiªn Bót", {0, 9, 1534, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1731, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1732, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1733, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Long T­¬ng T­íng Qu©n Th­¬ng", {0, 6, 1734, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1831, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1832, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1833, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 20, "Hæ Dùc T­íng Qu©n Cung", {0, 4, 1834, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2031, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2032, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2033, 1, 1, -1, -1, -1, -1, -1, -1}},
	{1, 30, "U Minh Quû S¸t Tu La NhÉn", {0, 7, 2034, 1, 1, -1, -1, -1, -1, -1, -1}}
};


function PB_giveEuipment1()
	gf_EventGiveRandAward(PB_equipmentReward1, 10000, 1, VET_201101_01_STR_LOG_TITLE, "Vò khÝ bé Phi Yªn");
end

function PB_giveEuipment2()
	gf_EventGiveRandAward(PB_equipmentReward2, 1000, 1, VET_201101_01_STR_LOG_TITLE, "PhÇn th­ëng trang bÞ s­ m«n cÊp 9");
end

function PB_giveEuipment3()
	gf_EventGiveRandAward(PB_equipmentReward3, 1000, 1, VET_201101_01_STR_LOG_TITLE, "PhÇn th­ëng vò khÝ s­ m«n cÊp 9");
end

-- base 100
PB_maxCountNonItemReward1 = {
	{2, 100, 20000000}
};


-- base 1000
PB_maxCountItemReward = 
{
	{31, 5, "PB_giveEuipment1()", ""},
	{31, 5, "PB_giveEuipment2()", ""},
	{31, 5, "PB_giveEuipment3()", ""},
	{1, 1, "Thiªn Qu¸i Th¹ch", {2, 0, 1084, 1}},
	{1, 100, "ChiÕn ThÇn hoµn", {2, 1, 1005, 1}, 7 * 24 * 3600},
	{1, 10, "Phi Yªn Th¹ch", {2, 1, 30130, 1}},
	{1, 50, "Tö Quang ThÇn Th¹ch", {2, 1, 30131, 1}},
	{1, 10, "Long Tö Bèi", {2, 1, 30155, 1}},
	{1, 10, "Phông Tö Bèi", {2, 1, 30156, 1}},
	{1, 10, "¦ng Tö Bèi", {2, 1, 30158, 1}},
	{1, 300, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}},
	{1, 1, "§Þnh Hån Thiªn Th¹ch ThÇn Th¹ch", {2, 1, 1067, 1}, 7 * 24 * 3600},
	{1, 10, "Thiªn Th¹ch Tinh Th¹ch", {2, 1, 1009, 1}},	
	{1, 5, "Thiªn Th¹ch linh th¹ch", {2, 1, 1068, 1}, 7 * 24 * 3600},
	{1, 1, "L¨ng Ba Vi Bé", {0, 112, 78, 1}},
	{1, 50, "Hoµng Kim §¹i Hång Bao (trèng)", {2, 1, 538, 1}, 7 * 24 * 3600},
	{32, 422, 7000, 1}, 
	{1, 5, "Th¸i DÞch Hçn Nguyªn Phæ", {2, 0, 1083, 1}}
}

PB_title = "<color=yellow>Ho¹t ®éng ®ãn mõng TÕt Nguyªn §¸n<color> diÔn ra tõ <color=red>ngµy 14/1/2011 ®Õn hÕt ngµy 20/2/2011<color>. <color=green>Th«ng tin chi tiÕt xem t¹i trang chñ http://volam2.zing.vn<color>";

PB_menu = 
{
	"§æi M©m Ngò Qu¶ (cÇn 5 Hoa Mai + 2 Xu vËt phÈm)/PB_composite",
	"NhËn phÇn th­ëng sö dông tèi ®a M©m Ngò Qu¶/PB_getThresholdReward",
	"Chän h×nh thøc nhËn th­ëng/PB_chooseMode",
	"§æi 100 vËt phÈm xu (cÇn 1 §¹i Ng©n PhiÕu)/PB_exchange",
	"\n§æi M©m Ngò Qu¶ (cÇn 5 Hoa Mai + 1 Nh¸nh Hoa Mai)/PB_composite1",
	"NhËn T©n M·o §¹i Hång Bao/PB_give_dahongbao",
	"Nép 10 M©m Ngò Qu¶/PB_give_5fruit",
};

PB_title_2 = "H·y chän lo¹i phÇn th­ëng:";
PB_menu_2 = 
{
	"20.000.000 Exp vµ vËt phÈm /#PB_confirm_getThresholdReward(1)",
	"20 ®iÓm n©ng cÊp B¹n §ång Hµnh vµ vËt phÈm/#PB_confirm_getThresholdReward(2)",	-- TODO: finished by VinaGame
	"1 ®iÓm linh lùc B¹n §ång Hµnh vµ vËt phÈm/#PB_confirm_getThresholdReward(3)", -- TODO: finished by VinaGame
	"Rêi khái/gf_DoNothing"
}

PB_title_3 = "Vui lßng chän h×nh thøc nhËn th­ëng";
PB_menu_3 = 
{
	"KÝch ho¹t nhËn th­ëng nhËn vËt phÈm/PB_activateItemMode",
	"KÝch ho¹t nhËn th­ëng kh«ng nhËn vËt phÈm (t¨ng thªm 25% kinh nghiÖm)/PB_activateNonItemMode",
	"Rêi khái/gf_DoNothing"
};

PB_results = 
{
	"Nguyªn liÖu mang theo kh«ng ®ñ",
	"Rêi khái",
	"C¸c h¹ ®· nhËn th­ëng",
	"§· kÝch ho¹t nhËn th­ëng kÌm vËt phÈm",
	"§· kÝch ho¹t nhËn th­ëng kh«ng kÌm vËt phÈm, t¨ng thªm 25% kinh nghiÖm",
	"Sè l­îng M©m Ngò Qu¶ c¸c h¹ sö dông ®· ®¹t giíi h¹n!",
	"Xin chóc mõng, lÇn thø <color=green>%d<color> sö dông <color=yellow>%s<color> nhËn ®­îc <color=green>%d<color> ®iÓm Tö Quang C¸c",
}

function PB_setMode(mode)
	SetTask(PB_modeTaskID, mode);
end

function PB_getMode()
	local result = GetTask(PB_modeTaskID);
	return result;
end

function PB_getUsedCount()
	return GetTask(PB_usedCountTaskID);
end

function PB_getUsedCountMode1()
	return GetTask(PB_usedCountMode1TaskID);
end

function PB_getUsedCountMode2()
	return GetTask(PB_usedCountMode2TaskID)
end

function PB_addUsedCount()
	SetTask(PB_usedCountTaskID, GetTask(PB_usedCountTaskID)+1);
	if 1 == PB_getMode() then
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE1, GetTask(PB_usedCountMode1TaskID)+1);
	else
		SetTask(VET_201011_02_TASK_USED_COUNT_MODE2, GetTask(PB_usedCountMode2TaskID)+1);
	end
end

function PB_notEnoughMaterial()
	local title = PB_results[1];
	local menu = {PB_results[2]};
	Say(title, getn(menu), menu);
end

function PB_maxCount()
	--WriteLog("PB_maxCount::called");
	local title = PB_results[6];
	local menu = {PB_results[2]};
	Say(title, getn(menu), menu);
end

function PB_composite1()
    if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    if GetItemCount(2, 1, 30277) < 5 or GetItemCount(2, 1, 30051) < 1 then
        Talk(1, "", PB_results[1]);
        return 0;
    elseif DelItem(2, 1, 30277, 5) == 1 and DelItem(2, 1, 30051, 1) == 1 then 
        gf_AddItemEx2({2, 1, 30278, 1}, "M©m Ngò Qu¶",
                        VET_201101_01_STR_LOG_TITLE, 
                        VET_201101_01_TB_LOG_ACTION_LIST[4],
                        0,
                        1)
    end
    SelectSay()
end

function PB_composite()
	AskClientForNumber("PB_confirm_composite", 1, 999, "Sè M©m Ngò Qu¶?")
end

function PB_confirm_composite(nCount)
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
        return 0;
    end
    if GetItemCount(2, 1, 30277) < (5 * nCount ) or GetItemCount(2, 1, 30230) < (2 * nCount) then
        Talk(1, "", PB_results[1]);
        return 0;
    elseif DelItem(2, 1, 30277, 5 * nCount)  == 1 and DelItem(2, 1, 30230, 2 * nCount) == 1 then 
        gf_AddItemEx2({2, 1, 30278, nCount}, "M©m Ngò Qu¶",
                        VET_201101_01_STR_LOG_TITLE, 
                        VET_201101_01_TB_LOG_ACTION_LIST[1],
                        0,
                        1)
    end
    SelectSay()
end

function PB_showThresholdRewardList(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(PB_activityID) == 1 then
        szSayHead = PB_title;--½õÄÒ´óÊÂ¼þsayµÄ±êÌâ
    
        tinsert(tbSayDialog, PB_menu[1]);
        tinsert(tbSayDialog, PB_menu[2]);
        tinsert(tbSayDialog, PB_menu[3]);
        tinsert(tbSayDialog, PB_menu[4]);
        --¶Ô»°´¦
    end
    return tbSayDialog, szSayHead;
end

function PB_confirm_getThresholdReward(nType)
	local title;
	local menu = {PB_results[2]};
	local usedCount = PB_getUsedCount();
	local nDate = tonumber(date("%y%m%d"))
	local nCurPetLevel = mod(GetTask(TASK_VNG_PET), 100)
	local nMaxUsed201101 = PB_useThreshold
	if nDate >= 110131 and nDate < 110205 then
		nMaxUsed201101 = 4000
	elseif nDate >= 110205 then
		nMaxUsed201101 = 6000
	end
	if usedCount >= 2000 then
		if 0 == GetTask(PB_ifGotRewardTaskID) then
			if 1 == gf_Judge_Room_Weight(1, 100, "") then
				if nType == 1 then
					gf_EventGiveRandAward(PB_maxCountNonItemReward1, 100, 1, VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[6]..nType);
				elseif nType == 2 then
					 if nCurPetLevel < 1 then
						Talk(1,"","§¹i hiÖp ch­a cã B¹n §ång Hµnh, kh«ng thÓ nhËn phÇn th­ëng nµy!")			
						return
					 end
					 SetTask(TASK_VNG_PET, GetTask(TASK_VNG_PET) + (20 * 100))
					 Msg2Player("B¹n nhËn ®­îc 20 §iÓm N©ng CÊp B¹n §ång Hµnh")
					 gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[6]..nType)
				elseif nType == 3 then
					 if nCurPetLevel < 2 then
						Talk(1,"","B¹n §ång Hµnh ®¼ng cÊp 2 trë lªn míi cã thÓ nhËn phÇn th­ëng nµy!")
						return
					 end
					 Pet_AddGP(1)
					 Msg2Player("B¹n nhËn ®­îc 1 §iÓm Linh Lùc B¹n §ång Hµnh")
					 gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[6]..nType)
				end
				gf_EventGiveRandAward(PB_maxCountItemReward, 1000, 1, VET_201101_01_STR_LOG_TITLE, VET_201101_01_TB_LOG_ACTION_LIST[5]);
				SetTask(PB_ifGotRewardTaskID, GetTask(PB_ifGotRewardTaskID) + 1);
			end
		else
			title = "C¸c h¹ ®· nhËn th­ëng";
		end
	else
		title = "Sè l­îng M©m Ngò Qu¶ c¸c h¹ ®· sö dông lµ "..usedCount.."/"..nMaxUsed201101;
	end
	Say(title, getn(menu), menu);
end

function PB_onUse(itemIndex)
	local usedCount = PB_getUsedCount();
	local mode = PB_getMode();
	local nDate = tonumber(date("%y%m%d"))
	if nDate > 20110220 then
		Talk(1, "", "§· hÕt h¹n sö dông vËt phÈm nµy!")
		return
	end
	if gf_Judge_Room_Weight(2, 100, "") ~= 1 then
		return 0
	end

	local nMaxUsed201101 = PB_useThreshold
	if nDate >= 110131 and nDate < 110205 then
		nMaxUsed201101 = 4000
	elseif nDate >= 110205 then
		nMaxUsed201101 = 6000
	end
	if usedCount >= nMaxUsed201101 then
		PB_maxCount();
	elseif (mode == 0) then
		PB_chooseMode();
	elseif (mode ~= 1 or 1 == gf_Judge_Room_Weight(1, 100, "")) and (1 == DelItemByIndex(itemIndex, 1)) then
		gf_EventGiveCustomAward(1, PB_expReward[mode], 1, VET_201101_01_STR_LOG_TITLE, "NhËn th­ëng kinh nghiÖm");
		if 1 == mode then
			if 0 == mod(usedCount+1, PB_specialTimes) then
				gf_EventGiveRandAward(PB_extraItemReward, 10000, 1, VET_201101_01_STR_LOG_TITLE, "NhËn th­ëng mèc 20");	
			else
				gf_EventGiveRandAward(PB_itemReward, 1000, 1, VET_201101_01_STR_LOG_TITLE, "NhËn th­ëng vËt phÈm");
			end
			gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "chän nhËn th­ëng vËt phÈm", PB_getUsedCountMode1());					
		else
			gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "chän nhËn th­ëng ®iÓm kinh nghiÖm", PB_getUsedCountMode2());
		end
		PB_addUsedCount();
	end
end

function PB_give_dahongbao()
	local nUsedDate = floor(GetTask(TSK_DAHONGBAO_201101) / 1000)
	local nDate = tonumber(date("%y%m%d"))
	
	if GetLevel() < 77 then
		Talk(1, "", "§¼ng cÊp 77 trë lªn míi cã thÓ sö dông T©n M·o §¹i Hång Bao!")
		return
	end
	
	if gf_Check55HaveSkill() == 0 then
		Talk(1, "", "Ph¶i cã kü n¨ng cÊp 55 míi cã thÓ tham gia ho¹t ®éng nµy!")
		return
	end
	
	if nDate > 110220 then
		Talk(1,"","§· hÕt thêi h¹n sù kiÖn!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask ( TSK_DAHONGBAO_201101, nDate * 1000 )
		SetTask ( TSK_DAHONGBAO_201101_TIME, 0 )
	end
	
	local nCount = floor(mod(GetTask(TSK_DAHONGBAO_201101), 1000) / 100)
	if nCount >= 1 then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhËn T©n M·o §¹i Hång Bao 1 lÇn mµ th«i!")
		return
	end
	
	gf_AddItemEx2({2, 1, 30279, 40, 4}, "T©n M·o §¹i Hång Bao", VET_201101_01_STR_LOG_TITLE, "nhËn 40 T©n M·o §¹i Hång Bao")

	Msg2Player("NhËn ®­îc 40 T©n M·o §¹i Hång Bao!")
	SetTask(TSK_DAHONGBAO_201101, GetTask(TSK_DAHONGBAO_201101) + 100)
end

function PB_give_5fruit()
	local nUsedDate = floor(GetTask(TSK_GIVE_EVENT_ITEM) / 100)
	local nDate = tonumber(date("%y%m%d"))
	
	if nDate < 110121 or nDate > 110220 then
		Talk(1,"","§· hÕt thêi h¹n sù kiÖn!")
		return
	end
	
	if nUsedDate ~= nDate then
		SetTask(TSK_GIVE_EVENT_ITEM, nDate * 100)
	end
	
	local nCount = mod(GetTask(TSK_GIVE_EVENT_ITEM), 100)
	if nCount >= 4 then
		Talk(1,"","Mçi ngµy chØ cã thÓ tÆng M©m Ngò Qu¶ tèi ®a 4 lÇn mµ th«i!")
		return
	end
	if GetItemCount(2, 1, 30278) < 10 then
		Talk(1,"","§¹i hiÖp kh«ng mang ®ñ 10 M©m Ngò Qu¶ råi!")
		return
	end
	if DelItem(2, 1, 30278, 10) == 1 then
		ModifyExp(2500000)
		Msg2Player("NhËn ®­îc 2500000 ®iÓm kinh nghiÖm")
		gf_WriteLogEx(VET_201101_01_STR_LOG_TITLE, "nép M©m Ngò Qu¶ nhËn 2500000 exp")
		SetTask(TSK_GIVE_EVENT_ITEM, GetTask(TSK_GIVE_EVENT_ITEM) + 1)
	end
end

function PB_chooseMode()
	Say(PB_title_3, getn(PB_menu_3), PB_menu_3);	
end

function PB_getThresholdReward()
	Say(PB_title_2, getn(PB_menu_2), PB_menu_2);	
end

function PB_activateItemMode()
	local title = PB_results[4];
	local menu = {PB_results[2]};
	PB_setMode(1);
	Say(title, getn(menu), menu);	
end

function PB_activateNonItemMode()
	local title = PB_results[5];
	local menu = {PB_results[2]};
	PB_setMode(2);
	Say(title, getn(menu), menu);	
end

function PB_exchange()
	if 0 == gf_ExchangeItemEx(PB_exchangeTable2, "M©m Ngò Qu¶", "®æi b¸nh") then
		PB_notEnoughMaterial();
	end
end

function PB_dialog(menu, title)
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		title = PB_title
		for i=1, getn(PB_options) do
			tinsert(menu, PB_options[i]);
		end
	end
	return menu, title;
end

function PB_smallWisdomTreeReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GivePlantSmallTreeAward({2, 1, 30277, 50}, "Nguyªn liÖu event TÕt", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_bigWisdomTreeReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GivePlantBigTreeAward({2, 1, 30277, 60}, "Nguyªn liÖu event TÕt", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_seedBagReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GiveSeedBagAward({2, 1, 30277, 150}, "Nguyªn liÖu event TÕt", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_soloMessengerQuestReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GiveDailyTaskPersonalAward({2, 1, 30277, 30}, "Nguyªn liÖu event TÕt", VET_201101_01_STR_LOG_TITLE);
	end
end

function PB_partyMessengerQuestReward()
	if gf_CheckEventDateEx(PB_activityID) == 1 then
		gf_GiveDailyTaskTeamAward({2, 1, 30277, 30}, "Nguyªn liÖu event TÕt", VET_201101_01_STR_LOG_TITLE);
	end
end