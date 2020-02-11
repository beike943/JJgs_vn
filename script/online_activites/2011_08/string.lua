--=============================================
--create by liubo
--describe:Ô½ÄÏ°æ2011Äê8ÔÂ»î¶¯ ×Ö·û´®ÎÄ¼ş
--=============================================

VET_201108_CAKE_LOG_TITLE = "Hoat dong nuong Banh Trung Thu 2011"

VET_201108_TB_LOG_ACTION_LIST = {
	[1] = "Mua cñi",
     [2] = "Kİch ho¹t lß n­íng",
	[3] = "NhËn ®­îc 5 B¸nh Th­îng H¹ng",
}

VET_201108_STRING_LIST = {
	[1] = "Kİch ho¹t lß n­íng b¸nh",
	[2] = "Mua cñi  (gi¸ 30 vµng)",
	[3] = "Tæ ®éi trªn 2 ng­êi míi cã thÓ kİch ho¹t lß n­íng",
	[4] = "ChØ cã ®éi tr­ëng míi cã thÓ kİch ho¹t lß n­íng",
	[5] = "Kh«ng tháa ®iÒu kiÖn kİch ho¹t lß n­íng",
	[6] = "ChØ ®­îc kİch ho¹t t¹i Thµnh ThŞ (BiÖn Kinh, Thµnh §«, TuyÒn Ch©u, T­¬ng D­¬ng, §¹i Lı, Ph­îng T­êng)",
	[7] = "Nh©n vËt ®· gia nhËp m«n ph¸i, cÊp 77 trë lªn vµ ®· häc ®­îc kü n¨ng cÊp 55 míi cã thÓ kİch ho¹t lß n­íng.",
	[8] = "Tæ ®éi cã thµnh viªn mang kh«ng ®ñ 5 B¸nh Trung Thu",
	[9] = "Tæ ®éi cã thµnh viªn kh«ng mang theo Cñi",
	[10] = "Tæ ®éi cã thµnh viªn ®· tham gia ®ñ giíi h¹n %d lÇn n­íng b¸nh trong ngµy",
	[11] = "§éi tr­ëng chØ cã thÓ kİch ho¹t 1 Lß N­íng trong cïng lóc",
	[12] = "C¸c h¹ mang kh«ng ®ñ 30 vµng",
	[13] = "Sè l­îng mua",
	[14] = "Giíi thiÖu ho¹t ®éng n­íng b¸nh",
	[15] = "C¸c h¹ cã thÓ tæ ®éi cïng th©n h÷u hoÆc ®ång ®¹o hµo kiÖt tËp hîp l¹i cïng kİch ho¹t lß n­íng b¸nh trung thu. Sau khi kİch ho¹t lß n­íng lµ kho¶n thêi gian ®Ó cho mäi ng­êi sum häp quay quÇn vµ nhËn th­ëng ®iÓm kinh nghiÖm. Sau 5 phót, cßn cã thÓ nhËn ®­îc 5 B¸nh Th­îng H¹ng tõ Lß N­íng. L­u ı: chØ giíi h¹n tham gia mçi ngµy 4 lÇn th«i ®Êy!",
	[16] = "C¸c h¹ hiÖn t¹i kh«ng thÓ kİch ho¹t lß n­íng",
	[17] = "§éi viªn kh«ng ë bªn c¹nh",
}

VET_201108_TB_NPCS_LIST = {
	[1] = "B¸nh cña c¸c h¹ vÉn ch­a n­íng chİn, ®õng qu¸ n«n nãng!",
	[2] = "B¸nh ®· n­íng chİnh råi!",
	[3] = "H·y giµnh 1 « trèng trªn hµnh trang, x¸c nhËn muèn lÊy b¸nh chø?",
	[4] = "X¸c nhËn",
	[5] = "Quay l¹i sau!",
	[6] = "C¸c h¹ ®· nhËn B¸nh Trung Thu råi",
	[7] = "§©y kh«ng ph¶i lµ Lß N­íng cña c¸c h¹",
}

--³ÇÊĞID
VET_201108_TB_MAPID = {
    100,150,200,300,350,400,500,
}

--ÎïÆ·
VET_201108_ITEM_LIST = {
	[1] = {"B¸nh Trung Thu",2,1,30326},
	[2] = {"Bã cñi",2,1,30330},
	[3] = {"B¸nh Th­îng H¹ng",2,1,30329},
	[4] = {"§Ìn hoa Trung Thu",2,1,30327},
}
--¿¾Â¯
VET_201108_TB_NPCS = {
	[1] = {"Lß n­íng nhá","Lß n­íng nhá",43859},
	[2] = {"Lß n­íng lín","Lß n­íng lín",87719},
}

--describe:Ô½ÄÏ°æ8ÔÂ·İ»î¶¯3 **×Ö·û´®
VET_201108_NPCLAMP_LIST = {
	Title = "§ªm tr¨ng r»m, treo ®Ìn kÕt hoa mõng Trung Thu. H·y nhanh ch©n mang Lång §Ìn ®Õn treo lªn ®i, ®Ó cïng b¹n bÌ chia sÎ mét ®ªm héi hanh phóc vµ Êm ¸p nµy!", 
	Options = {
		[1] = {
			subTitle = "Giíi thiÖu ho¹t ®éng",
			subOptions = {
				[1] = {
					Process = "Quy tr×nh ho¹t ®éng",
					Content = "C¸c h¹ cã thÓ th«ng qua V­ît ¶i L­¬ng S¬n, hoµn thµnh nhiÖm vô Thu ThËp Tµi Nguyªn, nhiÖm vô Vâ L©m Sø Gi¶, hoÆc tr«ng c©y, më tói h¹t gièng, ®Ó nhËn ®­îc Lång §Ìn Trung Thu. Mang ®Ìn ®Õn treo t¹i c¸c thµnh thŞ lín t¹i NPC Cét Treo §Ìn ®Ó nhËn ®­îc phÇn th­ëng hÊp dÉn. Mçi c¸ch 10 phót cã thÓ treo ®Ìn 1 lÇn!",
				},
				[2] = {
					Process = "Giíi thiÖu phÇn th­ëng",
					Content = "Treo Lång §Ìn còng cÇn cã kü thuËt, cïng mét thµnh thŞ treo Lång §Ìn cµng nhiÒu th× cµng khã kh¨n, nÕu treo ®Ìn thÊt b¹i sÏ kh«ng nhËn ®­îc phÇn th­ëng mµ cßn ph¶i treo l¹i tõ ®Çu! §iÒu ®­¬ng nhiªn lµ sè l­îng Lång §Ìn treo cµng nhiÒu phÇn th­ëng nhËn ®­îc cµng hÊp dÉn! C¸c h¹ cã thÓ chän treo Lång §Ìn t¹i c¸c thµnh thŞ kh¸c nhau, lÇn treo ®Ìn thø nhÊt kh«ng bŞ thÊt b¹i nh­ng phÇn th­ëng còng kh«ng lín. Chó ı, mçi ngµy chØ ®­îc treo ®Ìn 7 lÇn!",
				},
			},
			backMenu = "Trë l¹i",
		},
		[2] = {
			subTitle = "Ta ®Õn treo Lång §Ìn",
			subOptions = {
				[1] = "C¸c h¹ cÇn mang theo 1 Lång §Ìn Trung Thu!",
				[2] = "CÇn chê ®îi 10 phót ®Ó treo Lång §Ìn tiÕp theo!",
				[3] = "H«m nay c¸c h¹ ®· dïng hÕt sè l­ît treo Lång §Ìn råi!",
				[4] = "Treo ®Ìn thÊt b¹i, h·y b¾t ®Çu l¹i nhĞ!",
				[5] = "C¸c h¹ treo ®Ìn thµnh c«ng lÇn thø %d! NhËn ®­îc %d ®iÓm kinh nghiÖm",
			}
		},
	},
	Exit = "Ta chØ tiÖn ®­êng ghĞ ngang",
	Other = "Ho¹t ®éng ®· qu¸ h¹n thêi gian råi",
}

VET_201108_TB_ODDS = {
	[1] = {100,500000},
	[2] = {85,600000},
	[3] = {65,700000},
	[4] = {50,1000000},
	[5] = {35,1500000},
	[6] = {15,2000000},
	[7] = {5,2500000},
}