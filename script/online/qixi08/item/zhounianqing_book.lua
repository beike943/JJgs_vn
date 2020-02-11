--¶şÊ®ÖÜÄêÇì»î¶¯ËµÃ÷
--by vivi
--2008/11/06

IB_VERSION = 1		--1±íÊ¾ÊÇÃâ·ÑÇø£¬0±íÊ¾ÊÕ·ÑÇø

g_nHeadInfo = "<color=green>H­íng dÉn ho¹t ®éng 20 n¨m<color>: "

function OnUse()
	local strtab = {
				"Thêi gian ho¹t ®éng/know_time",
				"§iÒu kiÖn tham gia /know_condition",
				"H­íng dÉn quy t¾c ho¹t ®éng/know_rule",
				"ThuyÕt minh phÇn th­ëng/know_award",
--				"ĞÂÎïÆ·ËµÃ÷/know_new",
				"H­íng dÉn ®ãng/nothing"
				};
	Say(g_nHeadInfo.."§©y lµ n¬i h­íng dÉn ho¹t ®éng Kû niÖm 20 n¨m thµnh lËp Kingsoft, ng­¬i muèn t×m hiÓu phÇn nµo?",getn(strtab),strtab);
end

function know_time()
	Talk(1,"OnUse",g_nHeadInfo.."Thêi gian më ho¹t ®éng lÇn nµy lµ 13/11/2008 sau khi b¶o tr×, ®Õn 23h 7/1/2009.\n    Thêi gian ®æi phÇn th­ëng lµ 13/11/2008 sau khi b¶o tr× ®Õn 23 giê 14/1/2009.");
end

function know_condition()
	Talk(1,"OnUse",g_nHeadInfo.."ChØ cÇn b¹n h¬n cÊp 30 lµ cã thÓ tham gia tÊt c¶ ho¹t ®éng (kh«ng bao gåm cÊp 30).");
end

function know_rule()
	Say(g_nHeadInfo.."Ho¹t ®éng cã hai phÇn, thi ®Êu vµ thu thËp vËt phÈm, ng­¬i muèn xem h­íng dÉn phÇn nµo?",
			3,
			"Thi ®Êu/know_rule_1",
			"Thu thËp vËt phÈm/know_rule_2",
			"Xem h­íng dÉn kh¸c/OnUse");
end

function know_rule_1()
	Talk(3,"know_rule",g_nHeadInfo.."Thi ®Êu cã 3 phÇn: \n    §o¸n sè, sau khi trß ch¬i b¾t ®Çu hÖ thèng sÏ tù ®éng ®­a ra ch÷ sè (ph¹m vi tõ 0-100). SÏ cã khung nhËp hiÖn ra, ®iÒn sè b¹n ®· ®o¸n vµo, sau khi x¸c nhËn, hÖ thèng sÏ th«ng b¸o cho b¹n biÕt sè cña b¹n ®­a ra cã khíp víi sè hÖ thèng kh«ng, nÕu ®o¸n tróng trong vßng 5 lÇn, xem nh­ th¾ng.",g_nHeadInfo.."§o¹t B¶o Kú Binh, sau khi trß ch¬i b¾t ®Çu, hÖ thèng sÏ refresh b¶o r­¬ng vµ c¬ quan theo thêi gian nhÊt ®Şnh, nhÊn vµo c¬ quan cã thÓ g©y c¶n trë cho ®èi thñ vµ t¨ng c­êng b¶n th©n. Khi refresh b¶o r­¬ng, nÕu b¹n kh«ng lÊy ®­îc b¶o r­¬ng, th× sÏ bŞ tho¸t ra, xem nh­ thÊt b¹i, ng­êi cßn l¹i sau cïng sÏ lµ ng­êi th¾ng cuéc.",g_nHeadInfo.."§iÓm §¨ng Héi, sau khi trß ch¬i b¾t ®Çu, Th¸nh Háa §µi sÏ lÇn l­ît ®­îc th¾p s¸ng trong mét thêi gian nhÊt ®Şnh, 1 kho¶ng thêi gian sau sÏ tù ®éng t¾t, sau khi Th¸nh Háa §µi t¾t , b¹n chØ cÇn nhãm löa theo tr×nh tù, ®Ó nã s¸ng trë l¹i, th× sÏ th¾ng.");
end

function know_rule_2()
	Talk(1,"know_rule",g_nHeadInfo.."Sø gi¶ Vâ L©m sÏ yªu cÇu ng­¬i thu thËp mét sè vËt phÈm cho hä, tïy vµo sè l­îng vËt phÈm ng­¬i thu thËp ®­îc nhiÒu hay İt mµ ng­¬i cã thÓ ®æi ®­îc phÈn th­ëng, nÕu ng­¬i muèn cã ®­îc nhiÒu phÇn th­ëng h¬n n÷a, th× ng­¬i cã thÓ tiÕp tôc thu thËp ®Ó ®æi. Chó ı, cã h¹n chÕ vÒ sè lÇn ®æi phÇn th­ëng mçi tuÇn.");
end

function know_award()
	if IB_VERSION == 1 then
		Talk(2,"OnUse",g_nHeadInfo.."NÕu tham gia trß ch¬i thi ®Êu b¹n cã thÓ nhËn ®­îc kinh nghiÖm vµ rÊt İt ®iÓm, tham gia ho¹t ®éng thu thËp nhËn ®­îc t­¬ng ®èi nhiÒu ®iÓm. Dïng ®iÓm cã thÓ ®æi kinh nghiÖm, R­¬ng kû niÖm 20 n¨m vµ MËt tŞch hîp thµnh. \n\nKhi më R­¬ng kû niÖm 20 n¨m cã thÓ nhËn ®­îc nh÷ng vËt phÈm sau: \nNgùa 120% di chuyÓn, ®é bÒn 200 ®iÓm (D­¬ng M«n lµ chiÕn m· 35% di chuyÓn, ®é bÒn 1000 ®iÓm)\nMËt tŞch cao cÊp S­ M«n (ch­a gia nhËp l­u ph¸i ngÉu nhiªn nhËn ®­îc 1 quyÓn mËt tŞch cña bÊt cø l­u ph¸i nµo) \n 100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)\nThiªn Qu¸i Th¹ch (dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i vµ ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)",g_nHeadInfo.."\n§Şnh Hån Thiªn Th¹ch ThÇn Th¹ch (c­êng hãa vËt phÈm, khi ®é c­êng hãa lµ 7 th× kh«ng thÓ c­êng hãa n÷a)\nM¶nh Thiªn Th¹ch (trang bŞ c­êng hãa cÊp 1-4 tiªu hao vËt phÈm)\nThiªn Th¹ch Tinh Th¹ch (trang bŞ c­êng hãa cÊp 8-15 tiªu hao vËt phÈm)\nKinh nghiÖm lËp ph­¬ng ®¼ng cÊp\nHuy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy\n    PhÇn th­ëng ë trªn, sÏ c¨n cø vµo ch×a khãa dïng ®Ó më b¶o r­¬ng mµ cã tû lÖ kh¸c nhau, tÊt c¶ nh÷ng vËt phÈm ë trªn, trõ <color=yellow>kinh nghiÖm, Thiªn Qu¸i Th¹ch, Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, ®Òu cã thÓ giao dŞch ®­îc, chóc b¹n may m¾n!");
	else
		Talk(2,"OnUse",g_nHeadInfo.."NÕu tham gia trß ch¬i thi ®Êu b¹n cã thÓ nhËn ®­îc kinh nghiÖm vµ rÊt İt ®iÓm, tham gia ho¹t ®éng thu thËp nhËn ®­îc t­¬ng ®èi nhiÒu ®iÓm. Dïng ®iÓm cã thÓ ®æi kinh nghiÖm, R­¬ng kû niÖm 20 n¨m vµ MËt tŞch hîp thµnh. \n\nKhi më R­¬ng kû niÖm 20 n¨m cã thÓ nhËn ®­îc nh÷ng vËt phÈm sau: \nNgùa 120% di chuyÓn, ®é bÒn 200 ®iÓm (D­¬ng M«n lµ chiÕn m· 35% di chuyÓn, ®é bÒn 1000 ®iÓm)\nMËt tŞch cao cÊp S­ M«n (ch­a gia nhËp l­u ph¸i ngÉu nhiªn nhËn ®­îc 1 quyÓn mËt tŞch cña bÊt cø l­u ph¸i nµo) \n 100 triÖu kinh nghiÖm (l­u ı, khi kinh nghiÖm cña b¹n ®¹t ®Õn 2 tû, th× phÇn d­ ra sÏ bŞ mÊt, mçi tuÇn chØ cã thÓ ®æi thµnh c«ng 1 lÇn)\nThiªn Qu¸i Th¹ch (dïng th¨ng cÊp trang bŞ Viªm §Õ, trang bŞ t­íng qu©n, trang bŞ nguyªn so¸i vµ ®æi trang bŞ Thiªn §Şa HuyÒn Hoµng thµnh trang bŞ Thiªn Qu¸i)",g_nHeadInfo.."\nThiªn Th¹ch Linh Th¹ch (c­êng hãa trang bŞ trùc tiÕp ®¹t ®Õn cÊp 7)\nNguyÖt Hoa hoÆc N÷ Oa Tinh Th¹ch\nKinh nghiÖm lËp ph­¬ng ®¼ng cÊp\nHuy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy\n    PhÇn th­ëng ë trªn, sÏ c¨n cø vµo ch×a khãa dïng ®Ó më b¶o r­¬ng mµ cã tû lÖ kh¸c nhau, tÊt c¶ nh÷ng vËt phÈm ë trªn, trõ <color=yellow>kinh nghiÖm, Thiªn Qu¸i Th¹ch, Huy Hoµng Chi Thñy vµ Vinh Dù Chi Thñy<color>, ®Òu cã thÓ giao dŞch ®­îc, chóc b¹n may m¾n!");
	end
end

function know_new()
	Talk(1,"OnUse",g_nHeadInfo.."Thªm Thiªn Qu¸i Th¹ch, sau khi nhÊn phİm ph¶i sö dông, cã thÓ chuyÓn trang bŞ Thiªn §¹i HuyÒn Hoµng ®İnh quÎ thµnh Thiªn Qu¸i.\n  Trang bŞ Thiªn Qu¸i cã thÓ kİch ho¹t cïng víi trang bŞ b¸t qu¸i cña ho¹t ®éng Kû niÖm 20 n¨m (trang bŞ b¸t qu¸i cã thÓ dïng l©u dµi, sau ho¹t ®éng cã thÓ kİch ho¹t), chó ı, thuéc tİnh kİch ho¹t trang bŞ b¸t qu¸i nµy kh«ng cÇn ®¼ng cÊp ®İnh quÎ, bÊt kú trang bŞ b¸t qu¸i ®¼ng cÊp nµo ®Òu kİch ho¹t thuéc tİnh t­¬ng ®ång.");
end

function nothing()

end
