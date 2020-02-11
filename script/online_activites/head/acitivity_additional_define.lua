--ÕâÀïÊÇ¸±»î¶¯Êı¾İ¶¨Òå

VET_ACITIVUTY_ADDITIONAL_TABLE = {
	[93] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 93,
		nActivityName = "Quèc TÕ ThiÕu Nhi",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {3, 9},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Ta mèn tÆng Quµ 1/6 cho c¸c em nhá (tiªu hao 66 Quµ 1/6 + 66 Vµng)",
			"Ta muèn tÆng KÑo B«ng cho c¸c em nhá (tiªu hao 66 KÑo B«ng + 66 Vµng)",
			"Ta muèn tÆng phÇn th­ëng cao quı cho c¸c em nhá (tiªu hao 160 Quµ 1/6 + 160 KÑo B«ng + 160 Vµng)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30547, 66 ,"Quµ 1/6"}, {66}},
			{{2, 1, 30548, 66 ,"KÑo B«ng"}, {66}},
			{{2, 1, 30547, 160 ,"Quµ 1/6"}, {2, 1, 30548, 160 ,"KÑo B«ng"}, {160}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {3, 3, 3},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"TÆng Quµ 1/6 %d/%d",
			"TÆng KÑo B«ng %d/%d",
			"TÆng phÇn th­ëng cao quı %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
			46000000,
			46000000,
			222222222,
		},
		tZhenQiAward = {
			46, 46, 222,
		},
		tXuAward = {
			0, 0, 22,
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{1, 2000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 6}, 0},
							{1, 1212, "Cæ Linh Ngäc", {2, 1, 30369, 6}, 0},
							{1, 1212, "Cæ Linh Th¹ch", {2, 1, 30368, 6}, 0},
							{1, 1212, "M¶nh Thiªn Cang", {2, 1, 30390, 6}, 0},
							{1, 1212, "M¶nh Thiªn M«n", {2, 1, 30410, 6}, 0},
							{3, 3060, 1660000, 1},
							{3, 92, 16160000, 1},
						},
			[2] = {
							{1, 2000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 6}, 0},
							{1, 1212, "Cæ Linh Ngäc", {2, 1, 30369, 6}, 0},
							{1, 1212, "Cæ Linh Th¹ch", {2, 1, 30368, 6}, 0},
							{1, 1212, "M¶nh Thiªn Cang", {2, 1, 30390, 6}, 0},
							{1, 1212, "M¶nh Thiªn M«n", {2, 1, 30410, 6}, 0},
							{3, 3060, 1660000, 1},
							{3, 92, 16160000, 1},
						},
			[3] = {
							{31, 39995, "give_30_fruits()", 0},
							{1, 20000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 10}, 0},
							{1, 10000, "Cæ Linh Ngäc", {2, 1, 30369, 10}, 0},
							{1, 10000, "Cæ Linh Th¹ch", {2, 1, 30368, 10}, 0},
							{1, 10000, "M¶nh Thiªn Cang", {2, 1, 30390, 10}, 0},
							{1, 10000, "M¶nh Thiªn M«n", {2, 1, 30410, 10}, 0},
							{3, 5, 66660000, 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 3 + 2,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 9, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn phÇn th­ëng VIP (hoµn thµnh %d trë lªn ®æi tÊt c¶)", 9),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveVipAward_201306",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 22, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[95] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 95,
		nActivityName = "Quèc TÕ ThiÕu Nhi",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {5, 6},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Ta muèn ®æi 'Sinh Tè ThËp CÈm' nhËn th­ëng ( tiªu hao 6 Sinh Tè ThËp CÈm + 6 Vµng)",
			"Ta muèn ®æi 'Tr¸i C©y DÇm' nhËn th­ëng ( tiªu hao 6 Tr¸i C©y DÇm + 6 Vµng)",
			"Ta muèn ®æi phÇn th­ëng cao quı ®Ó nhËn th­ëng (tiªu hao 16  'Sinh Tè ThËp CÈm' + 16 'Tr¸i C©y DÇm' + 16 Vµng)  ",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30552, 6 ,"Sinh Tè ThËp CÈm"}, {6}},
			{{2, 1, 30553, 6 ,"Tr¸i C©y DÇm"}, {6}},
			{{2, 1, 30552, 16 ,"Sinh Tè ThËp CÈm"}, {2, 1, 30553, 16 ,"Tr¸i C©y DÇm"}, {16}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {3, 3, 3},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"§æi Sinh Tè ThËp CÈm %d%d",
			"§æi Tr¸i C©y DÇm %d%d",
			"§æi phÇn th­ëng cao quı %d%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
			4000000,
			4000000,
			12000000,
		},
		tZhenQiAward = {
			40, 40, 120,
		},
		tXuAward = {
			0, 0, 0,
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{1, 2000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 1212, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 0},
							{1, 1212, "§¹i Nh©n s©m", {2, 0, 553, 1}, 0},
							{1, 1212, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 0},
							{1, 1212, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 0},
							{3, 3060, 160000, 1},
							{3, 92, 1600000, 1},
						},
			[2] = {
							{1, 2000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 1212, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 0},
							{1, 1212, "§¹i Nh©n s©m", {2, 0, 553, 1}, 0},
							{1, 1212, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 0},
							{1, 1212, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 0},
							{3, 3060, 160000, 1},
							{3, 92, 1600000, 1},
						},
			[3] = {
							{31, 39995, format("ahf_GetNFruits(%d)", 3), 0},
							{1, 20000, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 10}, 0},
							{1, 10000, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 2}, 0},
							{1, 10000, "§¹i Nh©n s©m", {2, 0, 553, 2}, 0},
							{1, 10000, "ThÇn N«ng §¬n", {2, 1, 343, 2}, 0},
							{1, 10000, "Tiªu KiÕp t¸n", {2, 0, 141, 2}, 0},
							{3, 5, 6660000, 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 9, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn phÇn th­ëng VIP (hoµn thµnh %d trë lªn ®æi tÊt c¶)", 9),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveVipAward_201307",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 22, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[97] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 97,
		nActivityName = "Ho¹t ®éng phô th¸ng 8",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {7, 6},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Ta muèn ®æi Bé Dông Cô Häc TËp ®Ó nhËn phÇn th­ëng (tiªu hao 5 Bé Dông Cô Häc TËp + 9 vµng)",
			"Ta muèn ®æi CÆp S¸ch ®Ó nhËn phÈn th­ëng (tiªu hao 5 CÆp S¸ch + 9 vµng)",
			"Ta muèn ®æi phÇn th­ëng cao quı ®Ó nhËn phÇn th­ëng (tiªu hao 9 Dông Cô Häc TËp + 9 CÆp S¸ch + 9 vµng)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30565, 5 ,"Bé Dông Cô Häc TËp"}, {9}},
			{{2, 1, 30566, 5 ,"CÆp S¸ch"}, {9}},
			{{2, 1, 30565, 9 ,"Bé Dông Cô Häc TËp"}, {2, 1, 30566, 9 ,"CÆp S¸ch"}, {9}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"§æi Bé Dông Cô Häc TËp %d/%d",
			"§æi CÆp S¸ch %d/%d",
			"§æi phÇn th­ëng cao quı %d%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
			5000000,
			5000000,
			10000000,
		},
		tZhenQiAward = {
			50, 50, 100,
		},
		tXuAward = {
			0, 0, 2,
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 20, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 2}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 20, "AwardGenuineQi(100)", 1},
							{2, 27, 500000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn phÇn th­ëng VIP (hoµn thµnh %d trë lªn ®æi tÊt c¶)", 18),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveVipAward_201308",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 3, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[99] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 99,
		nActivityName = "Ho¹t ®éng phô th¸ng 8",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {9, 6},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Ta muèn tÆng [B¸nh Trung Thu Cam] ®Ó nhËn phÇn th­ëng ( tiªu hao 09 [B¸nh Trung Thu Cam] + 09 vµng)",
			"Ta muèn tÆng [B¸nh Trung Thu D©u] ®Ó nhËn phÇn th­ëng ( tiªu hao 09 [B¸nh Trung Thu D©u] + 09 vµng) ",
			"Ta muèn tÆng [B¸nh Trung Thu Socola] ®Ó nhËn phÇn th­ëng ( tiªu hao 06 [B¸nh Trung Thu Socola] + 09 vµng) ",
			"Ta muèn tÆng phÇn th­ëng cao quı ®Ó nhËn phÇn th­ëng ( tiªu hao 09 [B¸nh Trung Thu Cam] + 09 [B¸nh Trung Thu D©u] + 06 [B¸nh Trung Thu Socola] + 29 vµng)"
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30569, 9 ,"B¸nh Trung Cam"}, {9}},
			{{2, 1, 30570, 9 ,"B¸nh Trung Thu ¤ Mai"}, {9}},
			{{2, 1, 30571, 6 ,"B¸nh Trung Thu Socola"}, {9}},
			{{2, 1, 30569, 9 ,"B¸nh Trung Cam"}, {2, 1, 30570, 9 ,"B¸nh Trung Thu ¤ Mai"}, {2, 1, 30571, 6 ,"B¸nh Trung Thu Socola"}, {29}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6, 6},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"TÆng [B¸nh Trung Thu Cam] %d/%d",
			"TÆng [B¸nh Trung Thu D©u] %d/%d",
			"TÆng [B¸nh Trung Thu Socola] %d/%d",
			"TÆng phÇn th­ëng cao quı %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
			6900000,
			6900000,
			6900000,
			19000000,
		},
		tZhenQiAward = {
			50, 50, 50, 100,
		},
		tXuAward = {
			0, 0, 0, 2,
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 32, 250000, 1},
							{32, 1, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[4] = {
							{1, 20, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 3}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 20, "AwardGenuineQi(100)", 1},
							{2, 27, 500000, 1},
							{32, 1, 100, 1},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 4 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 24, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn phÇn th­ëng VIP (hoµn thµnh %d trë lªn ®æi tÊt c¶)", 24),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveVipAward_201309",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 5, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[102] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 102,
		nActivityName = "Evnet phô th¸ng 10",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {3, 10},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Ta muèn tÆng [Tranh Gãi] ®Ó nhËn phÇn th­ëng ( tiªu hao 09 [ Tranh Gãi ] +09 vµng)",
			"Ta muèn tÆng [Tranh §ång Hå] ®Ó nhËn phÇn th­ëng ( tiªu hao 09 [ Tranh §ång Hå ] +09 vµng)",
			"Ta muèn tÆng [Tranh Th­ Ph¸p] ®Ó nhËn phÇn th­ëng ( tiªu hao 09 [ Tranh Th­ Ph¸p] +09 vµng)",
			"Ta muèn tÆng phÇn th­ëng cao quı ( tiªu hao 19 [ Tranh Gãi] + 19 [Tranh §ång Hå ] +19 [ Tranh Th­ Ph¸p] +39 vµng)"
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30580, 9 ,"Tranh Gèi"}, {9}},
			{{2, 1, 30581, 9 ,"Tranh §ång Hå"}, {9}},
			{{2, 1, 30582, 9 ,"Tranh Th­ Ph¸p"}, {9}},
			{{2, 1, 30580, 19 ,"Tranh Gèi"}, {2, 1, 30581, 19 ,"Tranh §ång Hå"}, {2, 1, 30582, 19 ,"Tranh Th­ Ph¸p"}, {39}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6, 6},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"TÆng [Tranh Gãi] %d/%d",
			"TÆng [Tranh §ång Hå] %d/%d",
			"TÆng [Tranh Th­ Ph¸p] %d/%d",
			"TÆng phÇn th­ëng cao quı %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
			6900000,
			6900000,
			6900000,
			39000000,
		},
		tZhenQiAward = {
			50, 50, 50, 100,
		},
		tXuAward = {
			0, 0, 0, 2,
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[2] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[3] = {
							{1, 10, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 1}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 1}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 1}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(1)", ""},
							{31, 3, "ahf_GetPetBook(2)", ""},
							{31, 25, "AwardGenuineQi(50)", 1},
							{2, 25, 250000, 1},
							{32, 2, 50, 1},
							{5, 6, 5, 1},
							{4, 6, 5, 1},
						},
			[4] = {
							{1, 20, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 3}, 0},
							{1, 5, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 3}, 7 * 24 * 3600},
							{1, 5, "§¹i Nh©n s©m", {2, 0, 553, 2}, 7 * 24 * 3600},
							{1, 5, "ThÇn N«ng §¬n", {2, 1, 343, 2}, 7 * 24 * 3600},
							{1, 5, "Tiªu KiÕp t¸n", {2, 0, 141, 2}, 7 * 24 * 3600},
							{31, 3, "ahf_GetPetBook(3)", ""},
							{31, 3, "ahf_GetPetBook(4)", ""},
							{31, 20, "AwardGenuineQi(150)", 1},
							{2, 20, 1000000, 1},
							{32, 2, 150, 1},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 4 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 24, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn phÇn th­ëng VIP (hoµn thµnh %d trë lªn ®æi tÊt c¶)", 24),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveVipAward_201310",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 7, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
		tPointAward = {
			szTitle = "Tİch lòy nhËn th­ëng phong phó",
			uFunc = {
				"Ta muèn xem ®iÓm tİch lòy cña b¶n th©n/#Ud_Check_Point(%d)",
				"Ta muèn sö dông ®iÓm tİch lòy ®Ó ®æi th­ëng/#Ud_Use_Exchange_Point(%d)",
			},
		},
	},
	[104] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 104,
		nActivityName = "Event phô th¸ng 11",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {5, 7},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Ta muèn tÆng Quµ 20/11 ®Ó nhËn th­ëng (tiªu hao 09 Quµ 20/11 + 09 Vµng)",
			"Ta muèn tÆng Hoa §iÓm 10 ®Ó nhËn th­ëng (tiªu hao 09 Hoa §iÓm 10 + 09 Vµng)",
			"Ta muèn tÆng B»ng Khen ®Ó nhËn th­ëng (tiªu hao 09 B»ng Khen + 09 Vµng )",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30606, 9, "Quµ 20/11"}, {9}},
			{{2, 1, 30607, 9, "Hoa §iÓm 10"}, {9}},
			{{2, 1, 30608, 9, "B»ng Khen"}, {9}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {4, 4, 4},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"TÆng ?Qïa 20/11? %d%d",
			"TÆng ?Hoa §iÓm 10? %d%d",
			"TÆng ?B»ng Khen? %d%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
			7800000,
			7800000,
			7800000,
		},
		tZhenQiAward = {
			50, 50, 50,
		},
		tXuAward = {
			0, 0, 0,
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "Cæ Linh Ngäc", {2, 1, 30369, 2}, 0},
							{1, 6, "Cæ Linh Th¹ch", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
			[2] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "Cæ Linh Ngäc", {2, 1, 30369, 2}, 0},
							{1, 6, "Cæ Linh Th¹ch", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
			[3] = {
							{2, 20, 2500000, 1},
							{1, 15, "Nh©n S©m V¹n N¨m", {2, 1, 30071, 1}, 7 * 24 * 3600},
							{1, 15, "Tu Ch©n YÕu QuyÕt", {2, 0, 554, 2}, 7 * 24 * 3600},
							{1, 10, "TiÓu Nh©n s©m qu¶", {2, 0, 552, 1}, 7 * 24 * 3600},
							{1, 10, "§¹i Nh©n s©m", {2, 0, 553, 1}, 7 * 24 * 3600},
							{1, 6, "Cæ Linh Ngäc", {2, 1, 30369, 2}, 0},
							{1, 6, "Cæ Linh Th¹ch", {2, 1, 30368, 2}, 0},
							{1, 6, "Ma Tinh", {2, 1, 30497, 1}, 0},
							{5, 6, 10, 1},
							{4, 6, 10, 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 12, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn phÇn th­ëng VIP (hoµn thµnh %d trë lªn ®æi tÊt c¶)", 12),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveVipAward_201311",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 7, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[106] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 106,
		nActivityName = "Event phô th¸ng12",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {7, 7},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"NhËn 1 bé ngo¹i trang Noel ( Tiªu hao 3 Hép Quµ Noel)",
			"NhËn 1 TuÇn Léc ( Tiªu hao 3 Hép Quµ Noel)",
			"NhËn 1 Xe TuÇn Léc (®á) ( Tiªu hao 4 Hép Quµ Noel)",
			"NhËn 1 Xe TuÇn Léc (xanh) ( Tiªu hao 4 Hép Quµ Noel)",
			"NhËn 1 Xe TuÇn Léc (vµng) (Tiªu hao 4 Hép Quµ Noel)",
			"NhËn 24122013 Kinh NghiÖm, 24 ®iÓm S­ M«n, 24 ®iÓm Danh Väng, 24 ®iÓm Ch©n Khİ, 24 ®iÓm Qu©n C«ng, 24 D©u (Tiªu hao 24 Hép Quµ Noel + 24 Tiªu Dao Ngäc)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30611, 3, "Hép quµ gi¸ng sinh"}, {0}},
			{{2, 1, 30611, 3, "Hép quµ gi¸ng sinh"}, {0}},
			{{2, 1, 30611, 4, "Hép quµ gi¸ng sinh"}, {0}},
			{{2, 1, 30611, 4, "Hép quµ gi¸ng sinh"}, {0}},
			{{2, 1, 30611, 4, "Hép quµ gi¸ng sinh"}, {0}},
			{{2, 1, 30611, 24, "Hép quµ gi¸ng sinh"}, {2, 1, 30603, 24, "Tiªu Dao Ngäc"}, {0}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {1, 1, 1, 1, 1, 1},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {3, 1, 1, 1, 1, 1},
		tFreeWeight = {100, 100, 100, 100, 100, 100},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1, 1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_106_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_106_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_106_3()", 1},
						},
			[4] = {
							{31, 100, "Ud_GiveAward_106_4()", 1},
						},
			[5] = {
							{31, 100, "Ud_GiveAward_106_5()", 1},
						},
			[6] = {
							{31, 100, "Ud_GiveAward_106_6()", 1},
						},
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 0,
		tUdAward = {
		},
	},
	[108] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 108,
		nActivityName = "Event phô 1 th¸ng 1 n¨m 2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {9, 7},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"NhËn 1 bé ngo¹i trang Xu©n ( tiªu hao 3 B¸nh Ch­ng + 3 B¸nh TĞt) ",
			"NhËn 1 Niªn Thó ( tiªu hao 3 B¸nh Ch­ng + 3 B¸nh TĞt + 3 Tiªu Dao Ngäc)",
			"NhËn 20142014Exp, 24 ®iÓm s­ m«n, 24 ®iÓm danh väng, 24 ®iÓm ch©n khİ, 24 ®iÓm qu©n c«ng, 24 Xoµi, 4 Tô NghÜa LÖnh, 4 Th«ng Thiªn LÖnh Bµi ( tiªu hao 19 B¸nh Ch­ng + 19 B¸nh TĞt + 19 Tiªu Dao Ngäc) ",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30621, 3, "B¸nh Ch­ng"}, {2, 1, 30622, 3, "B¸nh TĞt"}},
			{{2, 1, 30621, 3, "B¸nh Ch­ng"}, {2, 1, 30622, 3, "B¸nh TĞt"}, {2, 1, 30603, 3, "Tiªu Dao Ngäc"}},
			{{2, 1, 30621, 19, "B¸nh Ch­ng"}, {2, 1, 30622, 19, "B¸nh TĞt"}, {2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {1, 1, 1},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {1, 1, 3},
		tFreeWeight = {100, 100, 100},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_108_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_108_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_108_3()", 1}
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 0,
		tUdAward = {
		},
	},
	[113] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 113,
		nActivityName = "Ho¹t ®éng phô 1 th¸ng 2 n¨m 2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {5, 8},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"PhÇn th­ëng pha cµ phª (tiªu hao 500 bét ca cao nguyªn chÊt + 500 s÷a t­¬i vµ trøng + 50 vµng) ",
			"PhÇn th­ëng tÆng b¸nh (tiªu hao 25 Chocolare Chips Muffin + 250 vµng)",
			"PhÇn th­ëng tÆng b¸nh (tiªu hao 25 Dark Chocolate + 66 XU)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30628, 500, "Ca cao nguyªn chÊt"}, {2, 1, 30629, 500, "S÷a t­¬i vµ trøng"},{50}},
			{{2, 1, 30630, 25, "Chocolare Chips Muffin"}, {250}},
			{{2, 1, 30631, 25, "Dark Chocolate"}, {2, 1, 30230, 66, "XU"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {5, 5, 5},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {10, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"PhÇn th­ëng pha cµ phª %d/%d",
			"PhÇn th­ëng tÆng b¸nh %d/%d",
			"PhÇn th­ëng tÆng b¸nh %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_113_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_113_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_113_3()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 15, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("NhËn th­ëng cµ phª-b¸nh(sau khi nhËn th­ëng %d sè lÇn pha cµ phª vµ tÆng b¸nh mçi lo¹i)", 5),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201402",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 4, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[116] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 116,
		nActivityName = "event phô th¸ng 3 n¨m 2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {8, 8},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"gãi hoa nhËn th­ëng (tiªu hao 350 giÊy bãng kiÕng +350 b×a cøng +66 vµng )",
			"tÆng quµ nhËn th­ëng ( tiªu hao 25 phÇn quµ 8/3+268 vµng)",
			"tÆng quµ nhËn th­ëng(tiªu hao 25 b«ng hoa 8/3+68 ngäc tiªu dao)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30632, 350, "giÊy bãng kiÕng "}, {2, 1, 30633, 350, "b×a cøng"},{66}},
			{{2, 1, 30634, 25, "quµ 8/3"}, {268}},
			{{2, 1, 30635, 25, "hoa 8/3"}, {2, 1, 30603, 68, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"gãi quµ nhËn th­ëng %d/%d",
			"tÆng quµ nhËn th­ëng (quµ 8/3) %d/%d",
			"tÆng quµ nhËn th­ëng (hoa 8/3) %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_116_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_116_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_116_3()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("nhËn th­ëng tµi n¨ng ( sau khi nhËn ®­îc phÇn th­ëng gãi hoa vµ tÆng quµ mçi lo¹i%d lÇn)", 6),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201403",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 6, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[120] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 120,
		nActivityName = "event phô th¸ng 4 n¨m 2014 ",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {2, 15},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"giao nguyªn liÖu nhËn th­ëng ( tiªu hao 500 giÊy ngò s¾c + 500 hå keo + 50 vµng )",
			"giao chiÕn kú nhËn th­ëng (tiªu hao 25 b¹ch kú +250 vµng )",
			"Giao chiÕn kú nhËn th­ëng ( tiªu hao 25 h¾c kú + 66 tiªu dao ngäc)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30637, 500, "giÊy ngò s¾c "}, {2, 1, 30638, 500, "hå keo "},{50}},
			{{2, 1, 30639, 25, " b¹ch kú "}, {250}},
			{{2, 1, 30640, 25, " h¾c kú "}, {2, 1, 30603, 66, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"giao nguyªn liÖu nhËn th­ëng  %d/%d",
			"giao chiÕn kú nhËn th­ëng ( b¹ch kú ) %d/%d",
			"giao chiÕn kú nhËn th­ëng ( h¾c kú ) %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_120_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_120_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_120_3()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = format("chiÕn binh xuÊt s¾c (sau khi nép nguyªn liÖu vµ chiÕn kú mçi lo¹i %d nhËn th­ëng)", 6),  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201404",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 8, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[124] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 124,
		nActivityName = "Ho¹t ®éng phô event th¸ng 5 n¨m 2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {6, 9},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Giao tµi nguyªn nhËn th­ëng ( tiªu hao 499 d©u t­¬i +499 b¹c hµ +49 vµng)(6 lÇn/ngµy )",
			"Giao 25 sero d©u t­¬i +249 vµng nhËn ®­îc (6 lÇn/ngµy )",
			"Giao 25 sero b¹c hµ + 49Tiªu Dao Ngäc (6 lÇn/ngµy )",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30645, 499, "D©u t­¬i "}, {2, 1, 30646, 499, "B¹c hµ "},{49}},
			{{2, 1, 30647, 25, "Sero d©u t­¬i "}, {249}},
			{{2, 1, 30648, 25, "Sero b¹c hµ "}, {2, 1, 30603, 49, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Giao tµi nguyªn %d/%d",
			"Giao sero d©u t­¬i %d/%d",
			"Giao  sero b¹c hµ %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_124_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_124_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_124_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Giao tµi nguyªn vµ n­íc sero mçi lo¹i 6 lÇn )(tæng céng 18 lÇn )",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201405",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 7, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[127] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 127,
		nActivityName = "Ho¹t ®éng phô th¸ng 06/2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {9, 9},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Nép nguyªn liÖu (Tiªu hao 499 Tr¸i C©y + 499 MËt Ong + 49 Vµng) (Mçi ngµy 6 lÇn)",
			"Nép 25 KÑo DÎo Tr¸i C©y + 249 Vµng (Mçi ngµy 6 lÇn)",
			"Nép 25 KÑo DÎo Chip Chip + 49 Tiªu Dao Ngäc (Mçi ngµy 6 lÇn)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30660, 499, "MËt Ong"}, {2, 1, 30661, 499, "Tr¸i c©y"},{49}},
			{{2, 1, 30662, 25, "KÑo DÎo Tr¸i C©y"}, {249}},
			{{2, 1, 30663, 25, "KÑo DÎo Chip Chip"}, {2, 1, 30603, 49, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Nép nguyªn liÖu %d/%d",
			"Nép KÑo DÎo Tr¸i C©y %d/%d",
			"Nép KÑo DÎo Chip Chip %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_127_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_127_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_127_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Sau khi hoµn thµnh nép nguyªn liÖu vµ kÑo dÎo sÏ nhËn ®­îc phÇn th­ëng VIP) (Tæng c«ng 18 lÇn)",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201406",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 7, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[130] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 130,
		nActivityName = "Ho¹t ®éng phô 07/2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {3, 13},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Tiªu hao 299 GiÊy Gãi Quµ + 299 Hép Quµ + 69 Vµng (Mçi ngµy 6 lÇn) ",
			"Nép 06 Quµ Mõng Phiªn B¶n Míi + 119 Vµng nhËn ®­îc (Mçi ngµy 6 lÇn)",
			"Nép 06 Hoa Mõng Phiªn B¶n Míi + 19 Tiªu Dao Ngäc nhËn ®­îc (Mçi ngµy 6 lÇn)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30695, 299, "Hép Quµ"}, {2, 1, 30696, 299, "GiÊy Gãi Quµ"},{69}},
			{{2, 1, 30697, 6, "Quµ Mõng Phiªn B¶n Míi"}, {119}},
			{{2, 1, 30698, 6, "Hoa Mõng Phiªn B¶n Míi"}, {2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Nép nguyªn liÖu %d/%d",
			"Nép Quµ Mõng Phiªn B¶n Míi %d/%d",
			"Nép Hoa Mõng Phiªn B¶n Míi %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_130_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_130_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_130_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Hoµn thµnh nép nguyªn liÖu vµ quµ sÏ nhËn ®­îc phÇn th­ëng VIP, 3 dßng chän tæng céng ph¶i hoµn thµnh 18 lÇn)",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201407",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 5, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[132] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 132,
		nActivityName = "Ho¹t ®éng phô 08/2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {6, 10},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Tiªu hao 299 Hoa Sen + 299 H¹t Sen + 69 Vµng (Mçi ngµy 6 lÇn) ",
			"Giao nép 06 B¸nh MËt + 119 Vµng (Mçi ngµy 6 lÇn)",
			"Giao nép 06 B¸nh L¸ Sen + 19 Tiªu Dao Ngäc (Mçi ngµy 6 lÇn)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30705, 299, "Hoa sen"}, {2, 1, 30706, 299, "H¹t Sen"},{69}},
			{{2, 1, 30707, 6, "B¸nh MËt"}, {119}},
			{{2, 1, 30708, 6, "B¸nh L¸ Sen"}, {2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Nép nguyªn liÖu %d/%d",
			"Giao nép B¸nh MËt %d/%d",
			"Giao nép B¸nh L¸ Sen %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_132_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_132_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_132_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Hoµn thµnh nép nguyªn liÖu vµ quµ sÏ nhËn ®­îc phÇn th­ëng VIP, 3 dßng chän tæng céng ph¶i hoµn thµnh 18 lÇn)",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201408",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 5, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[134] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 134,
		nActivityName = "Ho¹t ®éng phô 09/2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {9, 10},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Tiªu hao 299 GiÊy KiÕng Mµu + 299 Dông Cô Lµm §Ìn + 69 vµng (Mçi ngµy 6 lÇn)",
			"Nép 06 Lång §Ìn Trung Thu §á + 119 vµng nhËn ®­îc (Mçi ngµy 6 lÇn)",
			"Nép 06 Lång §Ìn Trung Thu Tİm + 19 Tiªu Dao Ngäc (Mçi ngµy 6 lÇn)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30717, 299, "GiÊy KiÕng Mµu"}, {2, 1, 30718, 299, "Dông Cô Lµm §Ìn"},{69}},
			{{2, 1, 30719, 6, "Lång §Ìn Trung Thu §á"}, {119}},
			{{2, 1, 30720, 6, "Lång §Ìn Trung Thu Tİm"}, {2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Nép nguyªn liÖu %d/%d",
			"Nép Lång §Ìn Trung Thu §á %d/%d",
			"Nép Lång §Ìn Trung Thu Tİm %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_134_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_134_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_134_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Hoµn thµnh nép nguyªn liÖu vµ quµ sÏ nhËn ®­îc phÇn th­ëng VIP, 3 dßng chän tæng céng ph¶i hoµn thµnh 18 lÇn)",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201409",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 5, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[136] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 136,
		nActivityName = "Ho¹t ®éng phô th¸ng 10/2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {5, 11},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Tiªu hao 299 Dông Cô Gãi Hoa + 299 Hoa Hång + 69 Vµng (Mçi ngµy 6 lÇn)",
			"Nép 06 §ãa Hång §á + 119 Vµng (Mçi ngµy 6 lÇn)",
			"Nép 06 §ãa Hång Vµng + 19 Tiªu Dao Ngäc (Mçi ngµy 6 lÇn)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30735, 299, "Dông Cô Gãi Hoa"}, {2, 1, 30736, 299, "Hoa hång"},{69}},
			{{2, 1, 30737, 6, "Hoa hång ®á"}, {119}},
			{{2, 1, 30738, 6, "Hoa hång vµng"}, {2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 1, 1},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Nép nguyªn liÖu %d/%d",
			"Nép §ãa Hång §á %d/%d",
			"Nép §ãa Hång Vµng %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_136_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_136_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_136_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Hoµn thµnh c¶ 3 h¹ng môc tæng céng lµ 18 lÇn)",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201410",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 5, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
	[139] = {
		--¸±»î¶¯IDºÍË÷ÒıÒ»ÖÂ
		nActivityID = 139,
		nActivityName = "Ho¹t ®éng phô th¸ng 10/2014",
		--Ê¹ÓÃµÄÈÎÎñ±äÁ¿×é
		tTaskGroup = {8, 11},
		--ÒÔÏÂtable´óĞ¡Ğè¶ÔÓ¦--------------------
		--Êı×ÖÓëtCostÒ»Ò»¶ÔÓ¦
		tSayDialog = {
			"Tiªu hao 299 NÑp Tranh + 299 Nghiªn Mùc + 69 Vµng (6 lÇn/ngµy)",
			"Nép 06 Tranh Th­ Ph¸p + 119 Vµng (6 lÇn/ngµy)",
			"Nép 06 Tranh Th­ Ph¸p §Æc BiÖt + 19 Tiªu Dao Ngäc (6 lÇn/ngµy)",
		},
		--ÏûºÄµÀ¾ßºÍ½ğ±ÒÊıÁ¿J
		tCostTable = {
			{{2, 1, 30741, 299, "NÑp Tranh"}, {2, 1, 30742, 299, "Nghiªn Mùc"},{69}},
			{{2, 1, 30743, 6, "Tranh Th­ Ph¸p"}, {119}},
			{{2, 1, 30744, 6, "Tranh Th­ Ph¸p §Æc BiÖt"}, {2, 1, 30603, 19, "Tiªu Dao Ngäc"}},
		},
		--Ã¿Ò»Ïî×î´óÊ¹ÓÃ´ÎÊı/Ã¿Ìì
		tMaxUseCount = {6, 6, 6},
		--ĞèÇó±³°ü¿Õ¼ä
		tFreeRoom = {0, 3, 3},
		tFreeWeight = {0, 10, 10},
		--Ã¿Ò»ÏîµÄÈÕÖ¾
		tMsg2Player = {
			"Nép nguyªn liÖu %d/%d",
			"Nép Tranh Th­ Ph¸p %d/%d",
			"Nép Tranh Th­ Ph¸p §Æc BiÖt %d/%d",
		},
		-----------------------------------------
		--ÆÕÍ¨¾­Ñé½±Àø
		tNormalAward = {
		},
		tZhenQiAward = {
		},
		tXuAward = {
		},
		--×îÖÕ½±ÀøÎ´´òÍ¨ºÍ´òÍ¨¾­ÂöµÄ½±ÀøÖµ(ÌîĞ´Õâ±íÊ¾Çø±ğ¶Ô´ı×îºóÒ»´Î)
		tFinalAward = {},
		tZhenQiFinalAward = {},
		tXuFinalAward = {},
		-----------------------------------------
		--Ö÷»î¶¯Ìõ¼ş5,6
		tTaskCondition = {},
		--Ã¿´Î¶¼Ëæ»úÒ»´ÎµÀ¾ß±í(1)»¹ÊÇÖ»ÓĞ×îºóÒ»´ÎËæ»úµÀ¾ß±í(0)
		tConditionItemAward = {1, 1, 1},
		--Ö÷»î¶¯Î´ÉÏÏŞÎïÆ·½±Àø
		tItemFinalAward = {
			[1] = {
							{31, 100, "Ud_GiveAward_139_1()", 1},
						},
			[2] = {
							{31, 100, "Ud_GiveAward_139_2()", 1},
						},
			[3] = {
							{31, 100, "Ud_GiveAward_139_2()", 1},
						},		
		},
		--Ö÷»î¶¯ÒÑÉÏÏŞÎïÆ·½±Àø
		tItemFinalAwardOverLimit = {},
		------------------------------------------
		--×Ô¶¨Òå½±Àø
		bUdIsExist = 1,
		tUdAward = {
			nTaskSeq = 1 + 3 + 1,  --Ê¹ÓÃµÚ¼¸¸öÈÎÎñ±äÁ¿(µÚÒ»¸öÊÇ¿çÌì±ê¼Ç)
			nTimesLimit = 18, --ÒªÇó¶Ò»»¹ı¶àÉÙ´Î
			szTitle = "PhÇn th­ëng VIP (Hoµn thµnh c¶ 3 h¹ng môc tæng céng lµ 18 lÇn)",  --¶Ô»°ÎÄ×Ö
			uFunc = "Ud_GiveLastAward_201411",  --×Ô¶¨ÒåÖ´ĞĞº¯Êı
			nMaxCount = 1, --Ã¿Ìì×î´óÁìÈ¡´ÎÊı
			nFreeRoom = 3, --ĞèÒªµÄ±³°ü¿Õ¼ä¸öÊı
		},
	},
}