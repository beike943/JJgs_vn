--½Å±¾¹¦ÄÜ£ºº£ÉÏÁúÖÛÕ½×Ö·û´®¼¯ºÏ
--¹¦ÄÜÉè¼Æ£º´óĞÜ¡¢Ğ¡ÓîÖæ
--¹¦ÄÜ¿ª·¢£º²¨²¨¡¢´å³¤
--¹¦ÄÜ²âÊÔ£ºĞ¡ĞÜ¡¢·¹½ã
--¿ª·¢Ê±¼ä£º2011-8-23
--ĞŞ¸Ä¼ÇÂ¼£º
sNpcNameEntrance="<color=green>TiÕp DÉn Sø<color>:"
sNpcNameNeeder="<color=green>Qu©n Nhu Quan<color>:"
sNpcNamePilot="<color=green>H­íng dÉn viªn<color>: "
tSTRING_NPC_SAY = {
	--½ÓÒıNPC¶Ô»°
	[1] = {
		[1] = {
			sNpcNameEntrance.."L·o phu ®· thiÕt kÕ mét vâ ®µi tû vâ trªn biÓn, kh«ng biÕt c¸c h¹ cã nh· ı tham gia hay kh«ng?",
			{
				"B¸o danh H¶i ChiÕn Long Ch©u (Phİ b¸o danh 6 vµng)/join_mission",
				"NhËn phÇn th­ëng H¶i ChiÕn Long Ch©u trËn tr­íc/get_award_infor",				
				"Giíi thiÖu H¶i ChiÕn Long Ch©u/mision_info",
				"Kh«ng cã g×!/nothing",
			},
		},
		[2] = {
			sNpcNameEntrance.."L·o phu rÊt t©m huyÕt trËn H¶i ChiÕn Long Ch©u nµy, hy väng c¸c vŞ ®¹i hiÖp cã thÓ thi triÓn tµi nghÖ siªu viÖt cña m×nh",
			{
				"§iÒu kiÖn tham gia/mission_condition",
				"Thêi gian më/mission_open_time",
				"Quy t¾c H¶i ChiÕn Long Ch©u/mission_rule",
				"PhÇn th­ëng H¶i ChiÕn Long Ch©u/mission_prize",
				"Trë l¹i/main",
				"Rêi khái/nothing",
			},
		},
		
	},

}
--============½éÉÜĞÅÏ¢
tSTRING_INTRODUCE = {
	[1] = "ThiÕu hiÖp cã thÓ c¸ nh©n b¸o danh tham gia, phİ b¸o danh lµ 3 vµng",
	[2] = "Thêi gian më: 10:00 - 11:00, 16:00 - 17:00,  22:00 - 23:00",
	[3] = "\n\t<color=green>1.<color> ThiÕu hiÖp sÏ ®­îc chuyÓn ngÉu nhiªn ®Õn phe qu©n Tèng hoÆc Liªu. Khi 2 bªn ®ñ 8 ng­êi, cuéc chiÕn sÏ b¾t ®Çu; \n\t<color=green>2.<color> Mçi bªn ®Òu cã 100 ®iÓm chiÕn ®Êu, ®iÓm sè sÏ ®­îc gi¶m dÇn theo diÔn tiÕn trËn chiÕn, bªn cã ®iÓm sè bŞ trõ vÒ 0 tr­íc sÏ bŞ xö thua, phe ®èi ph­¬ng chiÕn th¾ng; \n\t<color=green>3.<color> Thêi gian trËn chiÕn kĞo dµi 40 phót, hÕt giê hÖ thèng tù ®éng kÕt thóc trËn ®Êu, phe cã ®iÓm sè cao h¬n sÏ giµnh chiÕn th¾ng; \n\t<color=green>4.<color> NÕu nh­ ®iÓm sè 2 bªn b»ng nhau, bªn nµo cã Thèng LÜnh bŞ tiªu diÖt sÏ bŞ xö thua. nÕu thèng lÜnh 2 bªn kh«ng bŞ ®¸nh b¹i trËn chiÕn xö hßa.\n",
	[4] = "\n\t<color=green>1.<color> Bªn chiÕn th¾ng sÏ nhËn ®­îc 200 v¹n ®iÓm kinh nghiÖm, bªn thua cuéc 100 v¹n kinh nghiÖm; \n\t<color=green>2.<color> Mçi ngµy mçi nh©n vËt nhËn ®­îc nhiÒu nhÊt 600 v¹n kinh nghiÖm.",
}
--====TALK¶Ô»°
tSTRING_NPC_TALK = {
	[1] = "Long Ch©u chiÕn vÉn trong thêi gian chuÈn bŞ, thiÕu hiÖp h·y quay l¹i vµo lóc 10:00-11:00, 16:00-17:00, hoÆc 22:00-23:00.",
	[2] = "H¶i ChiÕn Long Ch©u v« cïng nguy hiÓm, thiÕu hiÖp ®¹t ®ñ %d cÊp h·y quay l¹i tham gia!",
	[3] = "ThiÕu hiÖp vÉn ch­a gia nhËp m«n ph¸i!",
	[4] = "ThiÕu hiÖp cÇn trang bŞ cho m×nh kü n¨ng m«n ph¸i cÊp 55 h·y quay l¹i tham gia!",
	[5] = "ThiÕu hiÖp vÉn ch­a nhËn phÇn th­ëng H¶i ChiÕn Long Ch©u lÇn tr­íc, h·y nhËn th­ëng tr­íc ®i!",
	[6] = "ThiÕu hiÖp vÉn ë trong tæ ®éi, h·y rêi ®éi tr­íc khi b¸o danh tham gia c¸ nh©n.",
	[7] = "ThiÕu hiÖp ch­a tõng tham gia H¶i ChiÕn Long Ch©u sao, h·y nhanh chãng ®i b¸o danh ®i!",
	[8] = "Mçi ngµy chØ nhËn ®­îc nhiÒu nhÊt 600 v¹n kinh nghiÖm, thiÕu hiÖp kh«ng thÓ nhËn tiÕp.",
	[9] = "TrËn H¶i ChiÕn Long Ch©u ®· giµnh th¾ng lîi, thiÕu hiÖp nhËn ®­îc phÇn th­ëng %d kinh nghiÖm! ",
	[10] = "TrËn H¶i ChiÕn Long Ch©u tr­íc ®· thÊt b¹i, thiÕu hiÖp chØ cã thÓ nhËn ®­îc %d kinh nghiÖm!",
	[11] = "TÊt c¶ c¸c b¶n ®å ®· ®Çy, h·y quay l¹i sau.",
	[12] = "Giíi h¹n nhËn ®iÓm kinh nghiÖm ngµy h«m nay ®· ®Çy",
	[13] = "TrËn H¶i ChiÕn Long Ch©u tr­íc ®· hßa nhau, thiÕu hiÖp cã thÓ nhËn ®­îc phÇn th­ëng %d kinh nghiÖm!",
	[14] = "C¸c h¹ mang kh«ng ®ñ 3 vµng, kh«ng thÓ tham gia H¶i ChiÕn Long Ch©u.",
}
--===ÏµÍ³ÏûÏ¢
tSRING_SYS_MSG = {
	[1] = "%s ®· gia nhËp H¶i ChiÕn Long Ch©u!",
	[2] = "ThiÕu hiÖp h·y t×m Qu©n Nhu Quan nhËn thuyÒn rång, trËn h¶i chiÕn s¾p b¾t ®Çu råi.",
	[3] = "ThiÕu hiÖp ®· lÜnh héi ®­îc 3 <Kü n¨ng Long Ch©u chuyªn dïng>, xem trang danh s¸ch kü n¨ng vµ thiÕt lËp phİm t¾t.",
	[4] = "Giai ®o¹n %s: \n%s\n qu©n sè: \nTèng %d vs Liªu %d\n §iÓm chiÕn ®Êu: \nTèng %d vs Liªu %d",
}

--====¾üĞè¹Ù¶Ô»°
tSTRING_NEEDER_DLG = {
	[1] = "Giíi thiÖu c¸ch ch¬i Long Ch©u ChiÕn/introduce",
	[2] = "Giíi thiÖu ®Æc ®iÓm Long Ch©u/drag_specialty",
	[3] = "NhËn thuyÒn rång/get_drag",
	[4] = "Rêi khái chiÕn tr­êng/exit_battle",
	[5] = "Ta chØ ®Õn xem thö/do_nothing",
}
--======ÁúÖÛÖÖÀà
tSTRING_DRAG_KIND = {
	[1] = "ThuyÒn Thanh Long (tèc ®é trung, gi¸p trung, s¸t th­¬ng trung)/qing_long",
	[2] = "ThuyÒn HuyÒn Vò (tèc ®é thÊp, gi¸p cao, s¸t th­¬ng thÊp)/xuan_wu",
	[3] = "ThuyÒn B¹ch Hæ (Tèc ®é cao, gi¸p thÊp, s¸t th­¬ng trung)/bai_hu",
	[4] = "THuyÒn Chu T­íc (tèc ®é thÊp, gi¸p thÊp, s¸t th­¬ng cao)/zhu_que",
	[5] = "Trë l¹i/main",
}

--=======ÁìÈ¡ÁúÖÛNPC¶Ô»°
tSTRING_DRAG_NPC = {
	[1] = "ThiÕu hiÖp ®· nhËn ThuyÒn Rång råi",
	[2] = "§¹i qu©n s¾p h¹ thñy, thiÕu hiÖp h·y nhanh chãng chuÈn bŞ hµnh trang, chiÕn ®Êu cho quèc gia nµo!",
	[3] = "ThiÕu hiÖp cã thÓ dùa trªn së thİch cña m×nh ®Ó chän thuyÒn rång!",
	[4] = "ThiÕu hiÖp muèn biÕt thªm g× kh«ng?",
	[5] = "ThiÕu hiÖp x¸c ®Şnh muèn rêi khái chiÕn tr­êng?",
	[6] = "Rêi khái chiÕn tr­êng/exit_ensure",
	[7] = "Cã viÖc g× kh«ng?",
	[8] = "HiÖn t¹i vÉn ch­a khai chiÕn, thiÕu hiÖp kh«ng thÓ vµo.",
	[9] = "ThiÕu hiÖp cÇn c­ìi trªn ThuyÒn R«ng míi cã thÓ vµo chiÕn tr­êng.",
	[10] = "ThiÕu hiÖp cÇn h¹ vò khİ míi cã thÓ tiÕn vµo chiÕn tr­êng",
	[11] = "Kh«ng gian hµnh trang thiÕu hiÖp kh«ng ®ñ",
	[12] = "ThiÕu hiÖp cÇn t×m Qu©n Nhu Quan ®Ó nhËn ThuyÒn Rång",
	[13] = "ThiÕu hiÖp cÇn gì bá thó c­ìi trªn ng­êi tr­íc khi tiÕn vµo chiÕn tr­êng",
}
--========Õ½³¡¹æÔò
tSTRING_BATTLE_RULE = {
	[1] = "Quy t¾c chiÕn ®Êu/fight_rule",
	[2] = "Quy t¾c háa thuyÒn/firedrag_rule",
	[3] = "Quy t¾c chiÕn th¾ng/sf_rule",
	[4] = "Trë l¹i/main",
}
--=====¹æÔò
tSTRING_RULE_DETAIL = {
	[1] = "Nh»m ®¸nh b¹i kÎ thï, cÇn sù hç trî nhiÖt t×nh tõ c¸c vŞ qu©n sÜ tham gia, thiÕu hiÖp h·y t×m ®Õn Qu©n Nhu Quan chän vµ tiÕp nhËn c¸c lo¹i thuyÒn rång ®­îc chuÈn bŞ s½n ®Ó c«ng ph¸ kÎ thï.",
	[2] = "TrËn chiÕn diÔn ra ®Õn kho¶n thêi gian gian nhÊt ®Şnh, ChØ huy qu©n sÏ ph¸i háa thuyÒn ra c«ng ph¸ kÎ thï, v× háa thuyÒn mang ®Çy háa d­îc, nªn cÇn c¸c vŞ hiÖp sÜ hé tèng ®Õn doanh tr¹i cña ®Şch. Khi háa thuyÒn ®­îc chuyÓn ®Õn doanh tr¹i kÎ ®Şch thµnh c«ng sÏ g©y s¸t th­¬ng lín khiÕn kÎ thï nhanh chãng mÊt ®iÓm.",
	[3] = "C¸c vŞ hiÖp sÜ cã thÓ ®¸nh b¹i thuyÒn rång cña kÎ ®Şch hoÆc hé tèng Háa ThuyÒn ®Õn doanh tr¹i ®Şch lµm gi¶m ®iÓm chiÕn ®Êu cña kÎ thï, khi ®iÓm chiÕn ®Êu cña kÎ thï gi¶m vÒ 0 th× phe ta giµnh ®­îc chiÕn th¾ng, nÕu nh­ phe ta gi¶m vÒ 0 tr­íc sÏ bŞ xö thua.",
}
--======ÁúÖÛÌØµã
tSTRING_DRAG_SPECAIL = {
	[1] = "<color=green>ThuyÒn Thanh Long:<color>Tèc ®é trung b×nh, gi¸p trung, c«ng kİch trung, liªn kİch nhanh, cã kü n¨ng xung kİch, kh«ng thÓ tù hñy khi bŞ ®¸nh b¹i.",
	[2] = "<color=green>ThuyÒn HuyÒn Vò:<color>Tèc ®é thÊp, gi¸p cao, c«ng kİch thÊp, c«ng kİch khèng chÕ, kü n¨ng g©y h«n mª, cã thÓ håi phôc sinh lùc ®ång ®éi.",
	[3] = "<color=green>ThuyÒn B¹ch Hæ:<color>Tèc ®é cao, gi¸p thÊp, c«ng kİch trung, c«ng kİch ®­êng th¼ng, kü n¨ng ®Èy lui kÎ thï, t¨ng tèc ®é ®ång ®éi.",
	[4] = "<color=green>ThuyÒn Chu T­íc:<color>Tèc ®é thÊp, gi¸p thÊp, c«ng kİch cao, c«ng kİch tËp thÓ, cã thÓ kh¸ng s¸t th­¬ng chİ m¹ng, cßn cã thÓ nhËp tr¹ng th¸i cuång b¹o.",
}
--=======¼ÆÊ±Æ÷½Å±¾ÄÚµÄ×Ö·û´®
tSTRING_MISSION = {
	[1] = "H¶i ChiÕn Long Ch©u 2 bªn kh«ng ®ñ %d chiÕn binh, kh«ng thÓ khai chiÕn.",
	[2] = "H¶i ChiÕn Long Ch©u sÏ b¾t ®Çu trong %d phót, Háa ThuyÒn chİnh lµ ®iÓm mÊu chèt ®Ó giµnh chiÕn th¾ng, c¸c vŞ anh hïng h·y chuÈn bŞ s½n sµng.",
	[3] = "%s vµ %s H¶i ChiÕn Long Ch©u trong %d phót bÊt ph©n th¾ng b¹i.",
	[4] = "Thñy §èc Qu©n: cuéc chiÕn ®Çu b¾t ®Çu råi, mäi ng­êi h·y nhanh chãng vµo chiÕn tr­êng nµo.",
	[5] = "%s ®· giµnh chiÕn th¾ng trËn H¶i ChiÕn lÇn nµy.",
	[6] = "Sè ng­êi 2 bªn hiÖn t¹i lµ: %s[%d]: [%d]%s",
	[7] = "D­¬ng ThÊt Tó: Hõ, lÇn sau bæn c« n­¬ng sÏ khiÕn c¸c ng­¬i thÊt b¹i th¶m h¹i.",
	[8] = "Tiªu TÇn: ai da, ta sî run ng­êi ®©y nµy, l·o ®©y s½n sµng chê c¸c ng­¬i v¸c x¸c ®Õn ®©y.",
	[9] = "H¶i ChiÕn Long Ch©u ®· kÕt thóc, %s ®· giµnh chiÕn th¾ng. Ch­ vŞ anh hïng ®Òu biÓu hiÖn rÊt xuÊt s¾c, cã thÓ ®Õn t×m <color=yellow>H¶i ChiÕn TiÕp DÉn Sø<color>®Ó nhËn phÇn th­ëng.",
	[10] = "H¶i ChiÕn Long Ch©u ®· kÕt thóc, %s ®· giµnh chiÕn th¾ng. Ch­ vŞ anh hïng ®Òu biÓu hiÖn rÊt xuÊt s¾c, cã thÓ ®Õn t×m <color=yellow>H¶i ChiÕn TiÕp DÉn Sø<color>®Ó nhËn phÇn th­ëng.",
	[11] = "H¶i ChiÕn Long Ch©u ®· kÕt thóc, qu©n ®Şch vµ ta bÊt ph©n th¾ng b¹i. Ch­ vŞ anh hïng ®Òu biÓu hiÖn rÊt xuÊt s¾c, cã thÓ ®Õn t×m <color=yellow>H¶i ChiÕn TiÕp DÉn Sø<color>®Ó nhËn phÇn th­ëng.",
	[12] = "KÎ thï tr­íc mÆt vËy mµ d¸m ngñ gËt, ng­êi ®©u l«i ra cho ta!",
	[13] = "D­¬ng ThÊt Tó: Tiªu TÇn, h·y mau ra ®©y øng chiÕn.",
	[14] = "D­¬ng ThÊt Tó: tiÓu tö, ®· sî ta ch­a, b¶n c« n­¬ng cã ph¶i dÔ hiÕp ®¸p.",
	[15] = "Tiªu TÇn: hahaha, tiÓu nha ®Çu ®¸nh víi ta, cßn sím vµi n¨m, h·y vÒ luyÖn thªm ®i.",
	[16] = "Tiªu TÇn: haha, h«m nay ®¹i th¾ng, quay vÒ ¨n mõng nµo!",
	[17] = "Liªu qu©n ®· ph¸i Háa ThuyÒn ra trËn",
	[18] = "Tiªu TÇn: tiÓu nha ®Çu, h·y xem sù lîi h¹i cña ta, ®èt ch¸y chóng!",
	[19] = "Tèng qu©n ®· ph¸i Háa ThuyÒn xuÊt trËn",
	[20] = "D­¬ng ThÊt Tó: tiÓu tö h·y xem ta ®èt s¹ch doanh tr¹i cña ng­¬i ®©y.",
	[21] = "R­¬ng hç trî ®· xuÊt hiÖn",
	[22] = "Háa thuyÒn phe Tèng ®· thµnh c«ng ®ét nhËp doanh trai Liªu, ®iÓm chiÕn ®Êu cña Liªu qu©n gi¶m m¹nh.",
	[23] = "Háa thuyÒn phe Liªu ®· thµnh c«ng ®ét nhËp doanh trai Tèng, ®iÓm chiÕn ®Êu cña Tèng qu©n gi¶m m¹nh.",
	[24] = "Háa thuyÒn phe Tèng ®· bŞ ph¸ hñy, ®iÓm chiÕn ®Êu cña Tèng qu©n bŞ gi¶m thiÓu",
	[25] = "Háa thuyÒn phe Liªu ®· bŞ ph¸ hñy, ®iÓm chiÕn ®Êu cña Liªu qu©n bŞ gi¶m thiÓu",
	[26] = "D­¬ng ThÊt Tó ®· bŞ ®¸nh b¹i, ®iÓm chiÕn ®Êu Tèng qu©n gi¶m 15",
	[27] = "Tiªu TÇn ®· bŞ ®¸nh b¹i, ®iÓm chiÕn ®Êu Liªu qu©n gi¶m 15",
}
--=========Òì³£×Ö·û´®
tSTRING_MISSION_LOG = {
	[1] = "[H¶i ChiÕn Long Ch©u]: b¾t ®Çu lçi kh«ng x¸c ®Şnh",
	[2] = "[H¶i ChiÕn Long Ch©u]: FreeDynamicMap lçi, nRetCode:",
	[3] = "[H¶i ChiÕn Long Ch©u]: LZZ_GetMSPlayerIndex hµm sè gÆp sù cè sè ng­êi trong trËn doanh so víi getn(tIndex) sè l­îng kh«ng gièng nhau. Sè ng­êi trong trËn doanh lµ:",
	[4] = "[H¶i ChiÕn Long Ch©u]: LZZ_OperateAllPlayer(), tiÕp dÉn cña ng­êi ch¬i trong IDTab nhá h¬n hoÆc b»ng 0",
	[5] = "[H¶i ChiÕn Long Ch©u]: khëi ®éng ®¨ng nhËp thÊt b¹i",
	[6] = "[H¶i ChiÕn Long Ch©u]: kü n¨ng ID: %d xãa thÊt b¹i",
	[7] = "[H¶i ChiÕn Long Ch©u]: xãa thuyÒn rång thÊt b¹i",
}
--============Áìº½Ô±Ïà¹Ø
tSTRING_PILOT_NPC = {
	[1] = "Ta muèn vµo chiÕn tr­êng/begin_fight",
	[2] = "Ta chØ tiÖn ®­êng ghĞ ngang/do_nothing",
}

--==========Æ¯Á÷ÏäÏà¹Ø
tSTRING_FLOAT_BOX = {
	[1] = "NhËn ®­îc hiÖu øng: t¨ng s¸t th­¬ng, duy tr× trong 30 gi©y, hiÖu qu¶ kh«ng céng dån.",
	[2] = "NhËn ®­îc hiÖu øng: t¨ng phßng ngù,  duy tr× 30 gi©y, hiÖu qu¶ kh«ng c«ng dån",
	[3] = "NhËn ®­îc hiÖu øng: t¨ng tèc ®é di chuyÓn, duy tr× 30 gi©y, hiÖu qu¶ kh«ng c«ng dån.",
	[4] = "NhËn ®­îc hiÖu øng: tr¹ng th¸i Èn th©n, duy tr× 30 gi©y, nÕu chuyÓn sang chiÕn ®Êu tr¹ng th¸i Èn th©n sÏ biÕn mÊt, hiÖu qu¶ kh«ng c«ng dån.",
}