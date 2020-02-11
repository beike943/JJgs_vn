function OnUse()
	local selTab = {
			"Online tÆng quµ/#spring_info(1)",
			"Phóc ThÇn ph¸t hång bao/#spring_info(2)",
			"Móa l©n/#spring_info(3)",
			"§o¹t b¶o r­¬ng/#spring_info(4)",
			"Heo vµng ®em ®Õn c¸t t­êng/#spring_info(5)",
			"Chóc tÕt/#spring_info(6)",
			"N¨m míi mÆc ®å míi./#spring_info(7)",
			"Niªn thó lµm thó c­ìi/#spring_info(8)",
			"Rêi khái/nothing"
			}
	
	Say("N¨m míi l¹i ®Õn, cã rÊt nhiÒu ho¹t ®éng cho mäi ng­êi tham gia. NhÊp chuét vµo tªn ho¹t ®éng ®Ó xem chi tiÕt.",getn(selTab),selTab);
end
function spring_info(nType)

local selTab = {
	{
	"    Ng­êi ch¬i cÊp 10 trë lªn, mçi ngµy cã thÓ ®Õn gÆp LÔ Quan ë BiÖn Kinh ®Ó nhËn tói TiÓu phóc Kim Tr­. Mçi ngµy chØ nhËn ®­îc 1 lÇn.",
		},
	
	{
	"    Ng­êi ch¬i tõ cÊp 10 trë lªn vµo lóc 10:00, 14:00, 20:00 ®Õn Phóc ThÇn ®Ó nhËn TiÓu Hång Bao. Mçi ngµy Phóc ThÇn chØ ph¸t 100 c¸i, ­u tiªn cho nh÷ng ng­êi ®Õn tr­íc (mçi ngµy chØ nhËn ®­îc 1 lÇn )",
		},
		
	{
	"    Trong kho¶ng thêi gian Móa l©n, Niªn Thó sÏ xuÊt hiÖn ë 3 thµnh thŞ chİnh. Ng­êi ch¬i ®¸nh b¹i tiÓu niªn thó, cã thÓ nhËn ®­îc Kim Tr­ ®¹i Hång Bao (cÊp 10 trë lªn míi cã thÓ tham gia)",
		},
		
	{
	"    Mçi ngµy tõ 18:00 trªn ®Ønh Hoa S¬n sÏ xuÊt hiÖn mét b¶o r­¬ng. Ng­êi ch¬i (®· gia nhËp m«n ph¸i) ®Õn gÆp Phóc ThÇn, sÏ ®­îc Phóc ThÇn ®­a vµo Hoa S¬n hoÆc cã thÓ mua Hoa S¬n ThÇn phï. Khi vµo Hoa S¬n trËn ®Şa, b¹n sÏ tù ®éng chuyÓn sang tr¹ng th¸i PK vµ ®å s¸t. Trong thêi gian 10 phót b¹n dïng hÕt kh¶ n¨ng h¹ ®èi ph­¬ng ®Ó ®o¹t b¶o r­¬ng.",
		},
		
	{
	"    Kim Tr­ mang ®Õn may m¾n: Trong phÇn th­ëng ho¹t ®éng t©n niªn, may m¾n b¹n còng cã thÓ nhËn ®­îc Tr­ b¶o b¶o. Sö dông b¹n sÏ gäi ®­îc mét chó heo xinh x¾n vµ mét quyÓn  B¶o §iÓn.",
		},
	
	{
	"    Chóc tÕt: Hai ng­êi ch¬i ®øng trong mét ph¹m vi nhÊt ®Şnh. Ng­êi cÊp nhá cung kİnh chóc tÕt ng­êi cÊp cao th× sÏ nhËn ®­îc mét trong 3 phÇn th­ëng sau: §iÓm søc kháe, ®iÓm kinh nghiÖm hoÆc tõ 10 ®Õn 20 ®iÓm danh väng. PhÇn th­ëng nµy phô thuéc vµo ®¼ng cÊp cña 2 bªn. Mçi ngµy ng­êi ch¬i cÊp nhá cã thÓ chóc tÕt ng­êi cÊp cao tèi ®a 3 lÇn, nh­ng ng­êi cÊp cao th× kh«ng bŞ giíi h¹n bëi sè lÇn ®­îc chóc tÕt. (Ho¹t ®éng nµy chØ dµnh cho ng­êi ch¬i tõ cÊp 10 trë lªn)",
		},
		
	{
	"    Khi më quµ Kim Tr­ ( Kim Tr­ tiÓu phóc, Kim Tr­ tiÓu hång bao, Kim Tr­ ®¹i hång bao), sÏ nhËn ®­îc phÇn th­ëng trang phôc Ngo¹i trang t­¬ng øng.",
		},
	{
	"    Khi më quµ Kim Tr­ (Kim Tr­ tiÓu phóc, Kim Tr­ tiÓu hång bao, Kim Tr­ ®¹i hång bao) sÏ cã c¬ may nhËn ®­îc niªn thó. [Chó ı: niªn thó chØ sö dông trong 1 ngµy ( kÓ tõ khi ngåi lªn). HÕt thêi gian niªn thó sÏ biÕn mÊt!]",
		},

	};

	Say("N¨m míi l¹i ®Õn, cã rÊt nhiÒu ho¹t ®éng cho mäi ng­êi tham gia. NhÊp chuét vµo tªn ho¹t ®éng t­¬ng øng ®Ó xem chi tiÕt!  \n"..selTab[nType][1],2,	"trë l¹i/OnUse",
	"Rêi khái/nothing");

end
function nothing()
end

