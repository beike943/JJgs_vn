--08´º½Ú»î¶¯Ö¸ÄÏ½Å±¾
--by vivi
--2008/01/15

function OnUse()
	local strtab = {
				"Liªn quan ®Õn viÖc n©ng cÊp Linh Khİ trang bŞ B¸t Qu¸i/about_bagua",
				"Liªn quan ®Õn ho¹t ®éng chóc tÕt mïa xu©n/about_bainian",
				"Liªn quan ®Õn ho¹t ®éng hîp thµnh Thanh §ång/about_qingtongqi",
				"Liªn quan ®Õn ho¹t ®éng nhËn hång bao n¨m míi/about_hongbao",
				"Liªn quan ®Õn ho¹t ®éng §¹i C¶nh Kü ë TuyÒn Ch©u B¾c/about_pk",
				"Täa ®é nh©n vËt ho¹t ®éng/about_npc",
				"§ãng h­íng dÉn/nothing"
				};
	Say("C¸c h¹ muèn t×m hiÓu ph­¬ng diÖn nµo?",
			getn(strtab),
			strtab)
end

function about_bagua()
	Talk(1,"about_bagua2","ChØ cã thÓ n©ng cÊp linh khİ cho <color=green>trang bŞ ch­a kh¶m n¹m linh khİ<color>, <color=yellow> trang bŞ kh¸c cÇn ph¶i n©ng cÊp. Chó ı: <color>\n<color=green>bé trang bŞ B¸t Qu¸i<color> ph¶i ®­îc r· ra thµnh <color=green>trang bŞ B¸t Qu¸i<color>. Chó ı: ph¶i <color=green>cho vµo 10000 gi¸ trŞ míi ®ñ ®¶m b¶o th¸o rêi kh«ng g©y tæn thÊt cho trang bŞ<color>, nhí s¾p xÕp kho¶ng trèng vµ søc lùc trong hµnh trang, phİ th¸o rêi <color=green>bé trang bŞ B¸t Qu¸i<color> tr¶ cho ®Ö tö cña s­ phô L­u, mçi ng­êi chØ cã <color=green>3 lÇn<color> c¬ héi nhËn tiÒn båi th­êng.");
end

function about_bagua2()
	Talk(1,"about_bagua3","<color=green>Trang bŞ B¸t Qu¸i trªn 80 linh khİ<color> ®­îc <color=green>miÔn phİ t¸ch lÊy Linh th¹ch<color>, tr¶ l¹i <color=green>toµn bé linh th¹ch kh¶m trªn trang bŞ (thuéc tİnh Linh th¹ch vµ linh khİ ch½n lÎ kh«ng ®æi, trŞ linh khİ sÏ tõ tõ dao ®éng), trang bŞ linh khİ (ch­a kİch ho¹t, trŞ sè trang bŞ nh­ søc c«ng kİch vò khİ kh«ng ®æi), Th¸i H­ B¸t Qu¸i tiªu hao khi kİch ho¹t trang bŞ B¸t Qu¸i<color> tõ chç ®Ö tö cña thî rÌn L­u.");
end

function about_bagua3()
	Talk(1,"OnUse","Trang bŞ linh khİ <color=green>lín h¬n hoÆc b»ng 91<color> <color=green>miÔn phİ ngÉu nhiªn t¨ng giíi h¹n linh khİ 10, 12, 14, 16, 18, 20 ®iÓm<color>, cao nhÊt ®Õn 120 (vò khİ c«ng kİch kh«ng ®æi), nÕu tèn <color=green>2 V« NgÊn Thñy<color> sÏ t¨ng 20 ®iÓm trŞ linh khİ. Chó ı: trang bŞ cÊp 8, cÊp 9 cã ®­îc trong kü n¨ng sèng ë ho¹t ®éng mïa xu©n sÏ kh«ng thÓ t¨ng.")
end

function about_bainian()
	Talk(1,"about_bainian2","Mçi ngµy tõ 9 giê s¸ng sÏ b¾t ®Çu göi nhiÖm vô chóc tÕt, ng­êi ch¬i cÊp 10 trë lªn cã thÓ nhËn nhiÖm vô t¹i Niªn Sø. Sau khi hoµn thµnh nhiÖm vô chóc tÕt, trë vÒ ®Ó nhËn phÇn th­ëng thİch hîp. \n nöa tiÕng sÏ göi 1 lÇn nhiÖm vô, nÕu ch­a hoµn thµnh hoÆc bá nhiÖm vô cã thÓ hoµn thµnh vµo lÇn sau.")
end

function about_bainian2()
	Talk(1,"OnUse","Sau khi chóc tÕt xong, cã thÓ nhËn phÇn th­ëng cuèi cïng ë chç Niªn Sø. Chó ı: Ng­êi ®Çu tiªn hoµn thµnh nhiÖm vô chóc tÕt tÊt c¶ mäi ng­êi ®­îc gÊp ®«i phÇn th­ëng. Ng­êi thø nh× ®Õn ng­êi thø 5 hoµn thµnh nhiÖm vô ®­îc 1.6 phÇn th­ëng, ng­êi thø s¸u ®Õn ng­êi thø 10 ®­îc 1.2 phÇn th­ëng. Mäi ng­êi ph¶i nhanh chãng hoµn thµnh. \n NÕu kh«ng hµi lßng b¶ng xÕp h¹ng lÇn nµy, cã thÓ tham gia l¹i vµo lÇn sau. Nh­ng khi ®· nhËn phÇn th­ëng th× kh«ng ®­îc tham gia n÷a.")
end

function about_qingtongqi()
	Talk(1,"OnUse","Ho¹t ®éng n¨m míi: ®¸nh qu¸i sÏ cã c¬ héi nhËn ®­îc nguyªn liÖu hîp thµnh Thanh §ång ®Ønh. Chó ı: §¼ng cÊp qu¸i vËt cµng cao, b¹n míi cã thÓ nhËn ®­îc nguyªn liÖu cµng tèt. Nguyªn liÖu tèt nhÊt chØ cã ë chç minh chñ B¾c Lôc L©m, Th­¬ng ThÇn Doanh Thiªn vµ L·nh H­¬ng L¨ng. \n Ngù C¸c còng cã b¸n 1 sè nguyªn liÖu nh­ vò khİ Thanh §ång, cã thÓ nhËn ®­îc bÊt kú nguyªn liÖu nµo. \n Lóc nµy sö dông B¹ch C©u hoµn, cã thÓ nhËn ®­îc 1 vµi nguyªn liÖu ho¹t ®éng. \n mua Thanh §ång ë Ngù C¸c sÏ ngÉu nhiªn nhËn ®­îc m¶nh Thanh §ång, 2000 m¶nh thanh ®ång ®ã ®æi ®­îc phÇn th­ëng t¹i Niªn Sø.")
end

function about_hongbao()
	Talk(1,"OnUse","N¨m míi ®Õn, hÖ thèng chuÈn bŞ cho mäi ng­êi ®¹i hång bao: göi vµo lóc 9:00, 13:00, 19:30, 21: 30 mçi ngµy, ®Õn sím nhËn tr­íc. Chó ı: ng­êi nhËn ®¹i hång bao ph¶i tõ cÊp 70 trë lªn. Ngoµi thêi gian ®ã ra cã thÓ nhËn ®­îc tiÓu hång bao. Ai còng cã phÇn. Mçi ng­êi chØ nhËn ®­îc 1 hång bao mçi ngµy.")
end

function about_pk()
	Talk(1,"OnUse","Thêi gian ho¹t ®éng mïa xu©n, TuyÒn Ch©u phñ B¾c lµ khu vùc PK lı t­ëng, kh«ng cã trõng ph¹t PK, cã thÓ ®Õn bÊt kú n¬i nµo trong khu vùc nµy, tÊt c¶ ®æi sang tr¹ng th¸i ®å s¸t, kh«ng thÓ tæ ®éi.")
end

function about_npc()
	Talk(1,"OnUse","Niªn Sø xuÊt hiÖn ë BiÖn Kinh, Thµnh §«, TuyÒn Ch©u, T­¬ng D­¬ng, D­¬ng Ch©u, §¹i Lı, t¹o ®é: \nBiÖn Kinh 145, 178\nThµnh §« 206, 222\nTuyÒn Ch©u 180, 175\nT­¬ng D­¬ng 182, 185\nD­¬ng Ch©u 209, 196\n§¹i Lı 195, 185")
end


function nothing()

end