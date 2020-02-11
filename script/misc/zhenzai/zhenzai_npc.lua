-- ÕğÔÖNPC

function main()
	Talk(2, "next_talk", "<color=green>§¹i sø CÇu Phóc<color>: <color=red>Ngµy 12 th¸ng 5 n¨m 2008<color>, lµ ngµy quèc tang nh÷ng n¹n nh©n bŞ chÕt trong trËn ®éng ®Êt t¹i Tø Xuyªn. Ng­êi ch¬i cña Vâ L©m TruyÒn Kú 2 ch¾c ch¾n còng rÊt ®au lßng. Cã thÓ còng sÏ rÊt yÕu ®uèi tr­íc tai n¹n ®e däa sinh m¹ng, nh­ng chØ cÇn chóng ta cã tÊm lßng hiÖp trî, th× sÏ cã dòng khİ v­ît qua. C«ng t¸c cøu trî ph¶i ®­îc triÓn khai tõng giê, chóng ta chØ cã thÓ ë hËu ph­¬ng vµ sù gióp ®ì rÊt İt, nh­ng h·y ®ång lßng cÇu phóc cho hä, ®Ó nh÷ng ng­êi bŞ n¹n ®­îc tiÕp thªm søc m¹nh cã thÓ v­ît qua khã kh¨n.", "<color=green>§¹i sø CÇu Phóc<color>: Chóng t«i mong r»ng khi b¹n ñy th¸c bµy b¸n, sÏ söa th­¬ng hiÖu bµy b¸n thµnh <color=yellow>'CÇu cho nh÷ng ng­êi bŞ n¹n'<color>, ®Ó kh«ng khİ trong thÕ giíi trß ch¬i cña chóng ta cµng thªm Êm ¸p t×nh ng­êi. §Ó c¶m ¬n mäi ng­êi ®· tham gia, sÏ cã 4 giê thêi gian B¹ch C©u ñy th¸c t¨ng cao hiÖu qu¶. (NÕu hiÖu qu¶ ñy th¸c hiÖn giê lµ x1, th× sÏ t¨ng thµnh x2, nÕu hiÖu qu¶ x2, th× sÏ t¨ng thµnh x3, cø nh­ thÕ tİnh)")
end

function next_talk()
	Say("<color=green>§¹i sø CÇu Phóc<color>: <color=yellow>Ng­êi ch¬i cÊp 70 trë lªn<color>, cã thÓ nhËn danh hiÖu <color=yellow>'§ång T©m V­ît Khã'<color> ë chç ta (më danh hiÖu, mçi mét phót sÏ nhËn ®­îc phÇn th­ëng kinh nghiÖm). Dïng hµnh ®éng ®Ó biÓu ®¹t t©m ı cña m×nh, hy väng cã thÓ g¸nh v¸c mét phÇn cïng víi ng­êi bŞ n¹n, chèng l¹i thiªn tai, v­ît qua khã kh¨n. <color=yellow>Sau 23: 00 ngµy 25 th¸ng 5, sÏ ngõng ph¸t th­ëng.<color>", 2, "NhËn danh hiÖu/get_title", "Rêi khái/no_say")
end

function get_title()
	if GetLevel() < 70 then
		Say("<color=green>§¹i sø CÇu Phóc<color>: <color=yellow>Ng­êi ch¬i cÊp 70 trë lªn<color>, cã thÓ nhËn danh hiÖu <color=yellow>'§ång T©m V­ît Khã'<color> ë chç ta (më danh hiÖu, mçi mét phót sÏ nhËn ®­îc phÇn th­ëng kinh nghiÖm). Dïng hµnh ®éng ®Ó biÓu ®¹t t©m ı cña m×nh, hy väng cã thÓ g¸nh v¸c mét phÇn cïng víi ng­êi bŞ n¹n, chèng l¹i thiªn tai, v­ît qua khã kh¨n.", 0)
		return
	end
	
	if IsTitleExist(3,4) > 0 then
		Say("<color=green>§¹i sø CÇu Phóc<color>: B¹n ®· nhËn danh hiÖu nµy.",0)
		return
	end
	
	if AddTitle(3, 4) > 0 then
		SetCurTitle(3, 4)
		Say("<color=green>§¹i sø CÇu Phóc<color>: B¹n nhËn ®­îc danh hiÖu <color=yellow>'§ång T©m V­ît Khã'<color>.", 0)
	end
end

function no_say()
end