--½Å±¾Ãû³Æ£ºÎåÒ»»î¶¯Ö¸ÄÏ½Å±¾
--½Å±¾¹¦ÄÜ£ºÎåÒ»»î¶¯Ö¸ÄÏ¶Ô»°½Å±¾
--²ß»®ÈË£ºÁõÌì
--´úÂë¿ª·¢ÈË£º´å³¤
--´úÂë¿ª·¢Ê±¼ä£º2007-04-20
--´úÂëĞŞ¸Ä¼ÇÂ¼£º2008-04-14 by Ä«ÏÉ

IS_SHOUFEI = false --ÅĞ¶ÏÊÇÊÕ·Ñ»¹ÊÇÃâ·Ñ
--****************************¶Ô»°Ö÷º¯Êı************************
function OnUse()
	Say("<color=green>H­íng dÉn<color>: L¹i ®Õn ho¹t ®éng 1-5, cuéc thi tranh b¸ 1-5 l¹i ®­îc khai m¹c, b¹n chuÈn bŞ ch­a?",
		6,
		"Ho¹t ®éng 1-5 bao gåm néi dung nµo/context",
		"NhËn bµi M¹t ch­îc?/get",
		"Bµi M¹t ch­îc cã thÓ ®æi phÇn th­ëng ®ã/prize",
		"Ngù C¸c cã b¸n nh÷ng g×?/buy",
		"TÊn c«ng lín nhÊt cña vò khİ Thiªn §Şa HuyÒn Hoµng/xuanhuang",
		"§ãng h­íng dÉn/nothing"
		)
end

function nothing()
	
end

function context()
	if IS_SHOUFEI == true then
		Say("<color=green>H­íng dÉn<color>: Ho¹t ®éng 1-5 cã 2 néi dung\n  Thø 1 <color=yellow>Mõng 1-5<color>, nh©n ®«i ®iÓm kinh nghiÖm. Trong thêi gian ho¹t ®éng, tõ <color=yellow>12:00-23:00<color> ®Õn gÆp B¹ch Hoa sø gi¶ ®Ó nhËn 4 giê nh©n ®«i ®iÓm kinh nghiÖm.\nThø 2 <color=yellow>Cuéc thi ThÇn bµi tranh b¸<color>, mäi ng­êi sÏ nhËn ®­îc c¸c qu©n bµi M¹t ch­îc, ghĞp nã thµnh c¸c hoa kh¸c nhau ®Ó nhËn c¸c phÇn th­ëng ®Æc biÖt.",1,"VÒ trang tr­íc/OnUse")
	else
		Say("<color=green>H­íng dÉn<color>: Ho¹t ®éng 1-5 cã 2 néi dung\n  Thø 1 <color=yellow>Mõng 1-5<color> mäi ng­êi ®­îc nh©n ®«i ®iÓm kinh nghiÖm. Trong thêi gian ho¹t ®éng, tõ <color=yellow>12:00-23:00<color> mäi ng­êi ®Õn gÆp B¸ch Hoa sø gi¶ ®Ó nhËn 4 giê nh©n ®«i ®iÓm kinh nghiÖm vµ nh©n ®«i ®iÓm cèng hiÕn s­ m«n trong ngµy h«m nay (kh«ng bao gåm ®¹i sù kiÖn s­ m«n).\n  Thø 2 <color=yellow>Cuéc thi ThÇn bµi tranh b¸<color>, mäi ng­êi nhËn ®­îc c¸c qu©n bµi M¹t ch­îc, ghĞp chóng thµnh hoa v¨n kh¸c nhau ®Ó ®æi c¸c phÇn th­ëng ®Æc biÖt.",1,"VÒ trang tr­íc/OnUse")
	end
end

function get()
	if IS_SHOUFEI == true then
		Say("<color=green>H­íng dÉn<color>: Ho¹t ®éng 1-5, c¸c b¹n cã thÓ nhËn ®­îc c¸c qu©n bµi M¹t ch­îc sau\n  <color=yellow>B¹ch C©u Hoµn<color>: Khi sö dông B¹ch C©u Hoµn treo m¸y cã tû lÖ rÊt thÊp nhËn ®­îc M¹t ch­îc\n  <color=yellow>Tµng KiÕm s¬n trang<color>: Trong b¶o r­¬ng cña 2 vŞ Tæng qu¶n, §¹i tiÓu th­, Trang chñ vµ Tr­ëng l·o cã sè qu©n bµi M¹t ch­îc nhÊt ®Şnh ®Ó gióp c¸c thiÕu hiÖp v­ît ¶i thµnh c«ng, nÕu ®¸nh b¹i 5 vŞ nµy cã thÓ nhËn ®­îc tæng céng 14 qu©n bµi M¹t ch­îc, chó ı, mçi boss mçi ngµy chØ cã thÓ r¬i <color=red>1<color> lÇn\n  ",1,"Trang kÕ/get_1")
	else
		Say("<color=green>H­íng dÉn<color>: Ho¹t ®éng 1-5, c¸c b¹n cã thÓ nhËn ®­îc c¸c qu©n bµi M¹t ch­îc sau\n  <color=yellow>B¹ch C©u Hoµn<color> treo m¸y: Khi sö dông B¹ch C©u Hoµn treo m¸y cã tû lÖ rÊt thÊp nhËn ®­îc M¹t ch­îc, chó ı B¹ch C©u Hoµn cµng tèt tû lÖ nhËn ®­îc qu©n bµi cµng cao\n  <color=yellow>Tµng KiÕm s¬n trang<color>: Trong b¶o r­¬ng cña 2 vŞ Tæng qu¶n, §¹i tiÓu th­, Trang chñ vµ Tr­ëng l·o cã sè qu©n bµi M¹t ch­îc nhÊt ®Şnh ®Ó gióp c¸c thiÕu hiÖp v­ît ¶i thµnh c«ng, nÕu ®¸nh b¹i 5 vŞ nµy cã thÓ nhËn ®­îc tæng céng 14 qu©n bµi M¹t ch­îc, chó ı, mçi boss mçi ngµy chØ cã thÓ r¬i <color=red>1<color> lÇn\n  ",1,"Trang kÕ/get_1")
	end
end

function get_1()
	if IS_SHOUFEI == true then
		Say("  <color=yellow>Th¸i H­ HuyÔn C¶nh<color>: Khi v­ît qua 8 ¶i Th¸i H­ cã thÓ nhËn ®­îc 5 qu©n bµi M¹t ch­îc, mçi ngµy chØ cã thÓ nhËn 1 lÇn\n  <color=yellow>§¹i héi tû vâ<color>: Tham gia Thiªn h¹ ®Ö nhÊt vµ cuéc thi T©n Tó, sau mçi trËn so tµi cã thÓ nhËn ®­îc <color=red>1<color> qu©n bµi M¹t ch­îc, mçi ngµy tèi ®a <color=red>15<color> qu©n bµi. Chó ı, hßa kh«ng nhËn ®­îc\n  TÊt c¶ M¹t ch­îc nhËn ®­îc ®Òu tù ®éng bá vµo trong b¶o r­¬ng, b¶o r­¬ng cã thÓ nhËn t¹i Sø gi¶ ho¹t ®éng, chó ı kh«ng ®em b¶o r­¬ng bªn m×nh qu©n bµi vÉn tù ®éng ®­îc ®Æt vµo trong b¶o r­¬ng, chØ cÇn lÊy ra hoÆc nhËn l¹i b¶o r­¬ng cã thÓ thÊy ®­îc sè qu©n bµi cña m×nh.",1,"trë l¹i/OnUse")
	else
		Say("  <color=yellow>Th¸i H­ HuyÔn C¶nh<color>: Khi v­ît qua 8 ¶i Th¸i H­ cã thÓ nhËn ®­îc 5 qu©n bµi M¹t ch­îc, mçi ngµy chØ cã thÓ nhËn 1 lÇn\n  <color=yellow>§¹i héi tû vâ<color>: Tham gia Thiªn h¹ ®Ö nhÊt vµ cuéc thi T©n Tó, sau mçi trËn so tµi cã thÓ nhËn ®­îc <color=red>1<color> qu©n bµi M¹t ch­îc, mçi ngµy tèi ®a <color=red>15<color> qu©n bµi. Chó ı, hßa kh«ng nhËn ®­îc\n  TÊt c¶ M¹t ch­îc nhËn ®­îc ®Òu tù ®éng bá vµo trong b¶o r­¬ng, b¶o r­¬ng cã thÓ nhËn t¹i Sø gi¶ ho¹t ®éng, chó ı kh«ng ®em b¶o r­¬ng bªn m×nh qu©n bµi vÉn tù ®éng ®­îc ®Æt vµo trong b¶o r­¬ng, chØ cÇn lÊy ra hoÆc nhËn l¹i b¶o r­¬ng cã thÓ thÊy ®­îc sè qu©n bµi cña m×nh.",1,"trë l¹i/OnUse")
	end
end

function prize()
	local tTemp = {"§¬n Tr­¬ng/prize_danzhang",
		"B×nh Hå/prize_pihu",
		"Thanh NhÊt S¾c (§ång)/prize_qingyise_tong",
		"Thanh NhÊt S¾c (§iÒu)/prize_qingyise_tiao",
		"Thanh NhÊt S¾c (V¹n)/prize_qingyise_wan",
		"§¹i Tø Hû/prize_dasixi",
		"ThÇn bµi/prize_paishen",
		"Ta muèn xem néi dung kh¸c/goback_to_main"
		}
		Say("<color=green>H­íng dÉn<color>: C¨n cø lo¹i bµi b¹n ®¸nh cã thÓ nhËn ®­îc c¸c lo¹i phÇn th­ëng kh¸c nhau. Sau ®©y lµ c¸c lo¹i bµi, nhÊn vµo ®Ó xem thuyÕt minh",getn(tTemp),tTemp)
end

function goback_to_main()
	OnUse()
end

function goback_to_prize()
	prize()
end

function prize_danzhang()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>§¬n Tr­¬ng<color>:\nNhÊn ph¶i vµo 1 qu©n bµi bÊt kú lµ cã thÓ nhËn, sè lÇn nhËn tèi ®a lµ <color=red>1000<color>\n  Cho ®¼ng cÊp b×nh ph­¬ng*10 ®iÓm kinh nghiÖm, cã thÓ nhËn ®­îc 1 viªn Linh th¹ch cÊp 1-7, ®Æt vµo Tô Linh ®Ønh. Ng­êi ch¬i cÊp 99 cã tû lÖ 100% nhËn ®­îc 1 viªn Linh th¹ch cÊp 1-7, ®Æt vµo Tô Linh ®Ønh, tû lÖ gièng tói b¶o th¹ch.",getn(tTemp),tTemp)
end

function prize_pihu()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>B×nh Hå<color>:\n  GÆp Sø gi¶ ho¹t ®éng nhËn ngÉu nhiªn 14 qu©n bµi M¹t ch­îc, sè lÇn nhËn tèi ®a lµ <color=red>42<color> lÇn\n Cho b×nh ph­¬ng ®¼ng cÊp *140 ®iÓm kinh nghiÖm, ngÉu nhiªn nhËn ®­îc 3 viªn Linh th¹ch cÊp 1-7, ®Æt vµo trong Tô Linh ®Ønh. Ng­êi ch¬i cÊp 99 cã tû lÖ 100% nhËn ®­îc 15 viªn Linh th¹ch cÊp 1-7, ®Æt vµo trong Tô Linh ®Ønh, tû lÖ cïng víi tói b¶o th¹ch.",getn(tTemp),tTemp)
end

function prize_qingyise_tong()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>Thanh NhÊt S¾c (§ång)<color>:\nTÊt c¶ qu©n bµi ®Òu cïng 1 hoa v¨n, 14 qu©n bµi liªn tiÕp tõ 1-9, nhËn ë chç Sø gi¶ ho¹t ®éng, sè lÇn nhËn tèi ®a lµ <color=red>21<color> lÇn\n  5 NhÊt ThiÓm Yªu Hoµng, 1 Linh th¹ch cÊp 5, cã thÓ nhËn ®­îc tói bİ kiÕp s­ m«n l­u ph¸i hiÖn t¹i vµ Thiªn §Şa HuyÒn Hoµng Trang",getn(tTemp),tTemp)
end

function prize_qingyise_tiao()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>Thanh NhÊt S¾c (§iÒu)<color>:\n  TÊt c¶ qu©n bµi ®Òu cïng 1 hoa v¨n, 14 qu©n bµi liªn tiÕp tõ 1-9, nhËn ë chç Sø gi¶ ho¹t ®éng, sè lÇn nhËn tèi ®a lµ <color=red>14<color> lÇn\n  10 NhÊt ThiÓm Yªu Hoµng, 2 Linh th¹ch cÊp 5, cã thÓ nhËn Ngò Hµnh mËt tŞch, Thiªn §Şa HuyÒn Hoµng Trang, Thiªn §Şa HuyÒn Hoµng Gi¸p",getn(tTemp),tTemp)
end

function prize_qingyise_wan()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>Thanh NhÊt S¾c (V¹n)<color>: \n  TÊt c¶ qu©n bµi ®Òu cïng 1 hoa v¨n, 14 qu©n bµi liªn tiÕp tõ 1-9, nhËn ë chç Sø gi¶ ho¹t ®éng, sè lÇn nhËn tèi ®a lµ <color=red>7<color> lÇn\n  5 Tam DiÖu Long Hi, 1 Linh th¹ch cÊp 6, cã thÓ nhËn ®­îc bİ kİp L¨ng Ba Vi Bé, Thiªn §Şa HuyÒn Hoµng Trang, Thiªn §Şa HuyÒn Hoµng Gi¸p, Thiªn §Şa HuyÒn Hoµng Kh«i",getn(tTemp),tTemp)
end

function prize_dasixi()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>§¹i Tø Hû<color>:\n  §«ng Phong, Nam Phong, T©y Phong, B¾c phong mçi lo¹i 3 con, chän ngÉu nhiªn 1 cÆp trong Trung Ph¸t B¹ch tæng céng 14 con, nhËn ë chç Sø gi¶ ho¹t ®éng, sè lÇn nhËn tèi ®a lµ <color=red>2<color> lÇn\n  15 Tam DiÖu Long Hi, 1 Linh th¹ch cÊp, cã thÓ nhËn ®­îc vò khİ Thiªn §Şa HuyÒn Hoµng, Thiªn §Şa HuyÒn Hoµng Trang, Thiªn §Şa HuyÒn Hoµng Gi¸p, Thiªn §Şa HuyÒn Hoµng Kh«i.",getn(tTemp),tTemp)
end

function prize_paishen()
	local tTemp = {"VÒ trang tr­íc/goback_to_prize","Rêi khái/nothing"}
	Say("<color=green>ThÇn bµi<color>:\n  NgÉu nhiªn 777 con bµi, nhËn ë Sø gi¶ ho¹t ®éng, kh«ng giíi h¹n sè lÇn nhËn\n  2 Linh th¹ch cÊp 7, 1 Thanh §ång §Ønh cÊp 1",getn(tTemp),tTemp)
end

function buy()
	Say("<color=green>H­íng dÉn<color>: B¹n mua 1 qu©n bµi M¹t ch­îc trong Ngù C¸c, nguyªn bé cã 14 con, 1 §ång, 1 §iÒu, 1 Tù, sau ®©y lµ thuyÕt minh c¸c vËt phÈm nµy.\n  <color=yellow>1 qu©n bµi M¹t ch­îc<color>, ngÉu nhiªn nhËn ®­îc 1 qu©n bµi M¹t ch­îc\n  <color=yellow>14 qu©n bµi M¹t ch­îc<color>, ngÉu nhiªn nhËn ®­îc 14 qu©n bµi\n  <color=yellow>1 §ång<color>, chØ qu©n bµi nhËn ®­îc cã hoa v¨n lµ §ång\n",1,"Trang kÕ/buy_1")
end

function buy_1()
	Say("  <color=yellow>1 §iÒu<color> chØ ®Şnh qu©n bµi M¹t ch­îc nhËn ®­îc cã hoa v¨n lµ §iÒu\n  <color=yellow>1 V¹n<color> chØ qu©n bµi M¹t ch­îc nhËn ®­îc cã hoa v¨n lµ V¹n\n  <color=yellow>1 Tù<color> chØ ®Şnh nhËn ®­îc 1 qu©n bµi ngÉu nhiªn trong 7 qu©n bµi §«ng Nam T©y B¾c Trung Ph¸t B¹ch",1,"trë l¹i/OnUse")
end

function xuanhuang()
	Say("<color=green>H­íng dÉn<color>: Sau ®©y lµ c¸c lo¹i vò khİ Thiªn §Şa HuyÒn Hoµng, mêi c¸c vŞ ®¹i hiÖp xem qua\n  Thiªn §Şa HuyÒn Hoµng Thñ, ®o¶n binh khİ hé thñ, thİch hîp ThiÕu L©m vâ t¨ng, C¸i Bang tŞnh y, c«ng kİch ngo¹i c«ng 314-529, c«ng kİch néi c«ng 273-454\n  Thiªn §Şa HuyÒn Hoµng KiÕm, ®o¶n kiÕm, thİch hîp Nga My PhËt Gia, Vâ §ang ®¹o gia, c«ng kİch ngo¹i c«ng 184-357, c«ng kİch néi c«ng 343-594\n  Thiªn §Şa HuyÒn Hoµng C«n, tr­êng c«n, thİch hîp ThiÕu L©m tôc gia, C¸i Bang « y, c«ng kİch ngo¹i c«ng 251-416\n  Thiªn §Şa HuyÒn Hoµng Khİ, Kú M«n ¸m khİ, thİch hîp §­êng M«n, c«ng kİch ngo¹i c«ng 194-307\n  Thiªn §Şa HuyÒn Hoµng §ao, ®o¶n ®ao, thİch hîp ThiÕu L©m tôc gia, c«ng kİch ngo¹i c«ng 306-510\n",1,"Trang kÕ/xuanhuang_1")
end

function xuanhuang_1()
	Say("  Thiªn §Şa HuyÒn Hoµng CÇm, Kú M«n CÇm, thİch hîp Nga My tôc gia, c«ng kİch ngo¹i c«ng 238-384, c«ng kİch néi c«ng 275-446\n  Thiªn §Şa HuyÒn Hoµng Bót, Kú M«n Bót, thİch hîp Vâ §ang tôc gia, c«ng kİch ngo¹i c«ng 21-7-343\n  Thiªn §Şa HuyÒn Hoµng Tr­îng, ThiÒn Tr­îng, thİch hîp ThiÕu L©m thiÒn t¨ng, c«ng kİch ngo¹i c«ng 207-403, c«ng kİch néi c«ng 316-515\n  Thiªn §Şa HuyÒn Hoµng Th­¬ng, Tr­êng Th­¬ng, thİch hîp D­¬ng M«n th­¬ng kş, c«ng kİch ngo¹i c«ng 182-406\n  Thiªn §Şa HuyÒn Hoµng Cung, Kú M«n Cung, thİch hîp D­¬ng M«n cung kş, c«ng kİch ngo¹i c«ng 226-347\n  Thiªn §Şa HuyÒn Hoµng Tr¶o, Kú M«n Tr¶o, thİch hîp Ngò §éc cæ s­, c«ng kİch ngo¹i c«ng 232-378, c«ng kİch néi c«ng 263-454\n  Thiªn §Şa HuyÒn Hoµng NhÉn, thİch hîp Ngò §éc tµ hiÖp, c«ng kİch ngo¹i c«ng 232-378, c«ng kİch néi c«ng 314-529",1,"trë l¹i/OnUse")
end