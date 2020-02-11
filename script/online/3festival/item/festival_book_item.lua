--File name:festival_book_item.lua 
--Describe:Èı½ÚÁ¬¹ı£¬»î¶¯Ö¸ÄÏ
--Create Date:2006-8-31
--Author:yanjun
Include("\\script\\online\\3festival\\3festival_head.lua")

function OnUse()
	local selTab = {
			"NhËn ®­îc b¸nh Trung Thu Mü VŞ/detail_1",
			"NhËn th­ëng Vâ L©m Minh/detail_6",
--			"ÁìÈ¡Á½ÖÜÄê½±Àø/detail_2",
			"B¸nh Trung Thu, lÊy ®¹o cô ®æi phÇn th­ëng /detail_3",
			"Lµm c¸c lo¹i b¸nh Trung Thu/detail_4",
			"§æi thÎ kû niÖm nhËn phÇn th­ëng/detail_5",
			"[-§ãng h­íng dÉn-]/nothing",
			}
	Say("<color=green>H­íng dÉn<color>: B¹n muèn t×m hiÓu ph­¬ng diÖn nµo? §Ó biÕt tØ mØ c¬ cÊu gi¶i th­ëng mêi ®Õn tra hái ng­êi qu¶n lı t­¬ng øng.",getn(selTab),selTab);
end;

function detail_1()
	Talk(1,"OnUse","<color=green>H­íng dÉn<color>: NhËn b¸nh Trung Thu Mü VŞ: <enter>Thêi gian ho¹t ®éng, <color=yellow>11:30, 14:30, 21:00, 23:00 mçi ngµy<color>, ng­êi ch¬i ®Õn gÆp Niªn sø nhËn b¸nh Trung Thu, sè luîng cã h¹n, ai ®Õn tr­íc sÏ nhËn tr­íc, <color=yellow>mçi ngµy chØ cã thÓ nhËn 1 lÇn<color>, nÕu lì thêi gian cã thÓ mua <color=yellow>Danh s¸ch ng­êi ch¬i cò<color> ë Ngù C¸c ®Ó nhËn bæ sung.");
end;

function detail_2()
	Talk(1,"OnUse","<color=green>H­íng dÉn <color>: Chóng t«i ®· chuÈn bŞ rÊt nhiÒu phÇn th­ëng cho ng­êi ch¬i cò, b¹n nµo tham gia Vâ L©m 2 vµo 3 thêi ®iÓm kh¸c nhau sÏ cã phÇn th­ëng t­¬ng øng. \nQuy t¾c phÇn th­ëng: \n1, x©y dùng nh©n vËt nhiÒu h¬n 600 ngµy ®­îc tÆng 20 r­¬ng s¾t hoÆc 5 r­¬ng ®ång hoÆc 1 r­¬ng b¹c\n2, x©y dùng nh©n vËt trªn 300 ngµy ®­îc tÆng 10 r­¬ng s¾t hoÆc 2 r­¬ng ®ång \n3, x©y dùng nh©n vËt İt h¬n 100 ngµy ®­îc tÆng 5 r­¬ng s¾t hoÆc 1 r­¬ng ®ång.");
end;

function detail_3()
	Talk(1,"detail_3_ex","<color=green>H­íng dÉn<color>: Mçi ngµy vµo <color=yellow>16:30, 19:30, 21:45<color> c¸c Boss sÏ xuÊt hiÖn bªn ngoµi <color=yellow>Phông T­êng, TuyÒn Ch©u, Thµnh §«<color>, ®¸nh b¹i c¸c BOSS nµy cã thÓ gäi ra TiÓu qu¸i, nhÊn vµo TiÓu qu¸i nhËn ®­îc c¸c B¶o hép (mçi ng­êi mçi giê chØ cã thÓ nhÊn 1 lÇn), mäi ng­êi ph¶i cã ch×a khãa t­¬ng øng më c¸c b¶o hép ®Ó nhËn phÇn th­ëng");
end;

function detail_3_ex()
	Talk(1,"OnUse","<color=green>H­íng dÉn<color>: TÕt Trung Thu l¹i ®Õn, n¨m nay ngoµi viÖc lµm c¸c b¸nh trung thu ®Ó th­ëng thøc cßn cã thÓ ®Õn chç ta §æi c¸c lo¹i b¶o hép cña Vâ l©m minh chñ ph¸t. Muèn biÕt b¶o hép cã c«ng dông g× h·y ®Õn gÆp <color=yellow>§Æc sø Vâ L©m<color>. Ngoµi ra nÕu b¹n nhËn ®­îc thÎ kû niÖm JX2 trßn 3 n¨m cã thÓ ®Õn gÆp Niªn sø ®æi th­ëng.");
end;

function detail_4()
	Talk(1,"detail_4_ex","<color=green>H­íng dÉn<color>: <enter>C¸ch lµm b¸nh trung thu: <enter>Mçi ngµy ®Õn gÆp Niªn sø nhËn nguyªn liÖu vµ c«ng cô lµm b¸nh, ¨n c¸c b¸nh trung thu sÏ nhËn ®­îc c¸c hiÖu qu¶ ®Æc biÖt.<enter><color=yellow>1. NhËn nguyªn liÖu<color>: Trong thêi gian ho¹t ®éng, mçi ngµy online ®Õn gÆp Niªn sø ®Ó nhËn nguyªn liÖu, ngoµi ra cã thÓ mua thªm c¸c nguyªn liÖu lµm b¸nh t¹i ®©y.<enter><color=yellow>2. NÊu b¸nh<color>: §Çu tiªn, nhÊn chän c«ng cô, sau ®ã bá nguyªn liÖu vµo theo h­íng dÉn, cã thÓ chän bá 1 trong 3 nguyªn liÖu chİnh vµo, sau ®ã chän than hay cñi ®Ó nÊu.");
end;

function detail_4_ex()
	Talk(1,"OnUse","<color=green>H­íng dÉn<color>: Chó ı: <enter>1)NÕu chän than gç th× nhiÖt ®é ban ®Çu lµ 600 ®é, chän cñi th× nhiÖt ®é ban ®Çu lµ 300 ®é. <enter>2)NhiÖt ®é lß sÏ gi¶m kh«ng ngõng gi¶m xuèng. <enter>3)BÊt cø lóc nµo còng cã thÓ thªm nhiªn liÖu vµo lß nh­ng nhiÖt ®é v­ît qu¸ 900 ®é b¸nh sÏ bŞ ch¸y. <enter>4 NhiÖt ®é trong lß n­íng kh«ng thÓ biÕt ®­îc nªn sau khi b¾t ®Çu n­íng b¸nh 3 phót sÏ cã 1 lÇn ®o nhiÖt ®é hiÖn t¹i, nÕu qu¸ 3 phót sau sÏ kh«ng thÓ ®o nhiÖt ®é. <enter><color=yellow>3, lÊy b¸nh<color><enter>1) Thêi gian n­íng b¸nh lµ 5 phót. 5 phót sau nhÊn chuét ph¶i vµo lß n­íng b¸nh ®Ó lÊy b¸nh. <enter>2) Sau khi nhiÖt ®é lß n­íng b¸nh cßn 0 ®é kh«ng thÓ tiÕp tôc thªm nhiªn liÖu vµo.");
end;

function detail_5()
	Talk(2,"OnUse","<color=green>Niªn sø<color>: Më b¶o hép cã thÓ nhËn ®­îc thÎ kû niÖm JX2 trßn 3 n¨m\n  10 thÎ kû niÖm ®æi ®­îc 1 Bång Lai tiªn lé\n  20 thÎ kû niÖm ®æi ®­îc phÇn th­ëng ®iÓm kinh nghiÖm\n  40 thÎ kû niÖm ®æi ®­îc phÇn th­ëng ®iÓm kinh nghiÖm\n  100 kû niÖm cã thÓ ®æi 1 Hép Ng©n Bµi Vinh Dù\n  500 thÎ kû niÖm ®æi 1 Ch×a Khãa B¹c Vinh Dù","<color=green>Niªn sø<color>:\n1000 thÎ kû niÖm ®æi 1 Hép Kim Bµi Vinh Dù\n2000 thÎ kû niÖm ®æi trang søc Huy Hoµng Chi Thñy\n3000 thÎ kû niÖm ®æi trang søc Vinh Dù\n6000 thÎ kû niÖm ®æi 1 trong 3 trang bŞ Hoµng §Õ.");
end;

function detail_6()
	Talk(1,"OnUse","<color=green>Niªn sø<color>:\nTrong thêi gian ho¹t ®éng, mçi ngµy ®Õn gÆp Vâ l©m truyÒn nh©n ®Ó nhËn th­ëng cña Vâ l©m minh chñ, phÇn th­ëng nµy sÏ thay ®æi tïy theo vËn may cña b¹n. Muèn biÕt vËn may h·y ®Õn t×m Thè TiÓu Nha. NÕu lì thêi gian cã thÓ mua <color=yellow>Danh s¸ch ng­êi ch¬i cò<color> ë Ngù C¸c ®Ó nhËn bæ sung.");
end;
