TAB_YANMENGGUAN = {
	"Quy t¾c §¹i chiÕn/info_rule_yanmen",
	"Thêi gian tham chiÕn/info_open_time",
	"§iÒu kiÖn tham gia/info_join_requre",
	"Thµnh tİch chiÕn c«ng/info_point_gain",
	"T×m hiÓu Anh hïng lÖnh/info_lingpai_help",
	"Ta ®· hiÓu råi/OnCancel",
}

function info_rule_yanmen()
	Say("§¹i chiÕn Nh¹n M«n quan sö dông h×nh thøc quÇn chiÕn. Trong chiÕn trËn kh«ng cã c¸c NPC chiÕn ®Êu nh­ng ë tiÒn tuyÕn vµ ®¹i doanh cã xuÊt hiÖn c¸c NPC ®Æc thï. ChiÕn ®Êu theo h×nh thøc lËp chiÕn c«ng, mçi lÇn ng­êi ch¬i phe m×nh ®¸nh b¹i ng­êi ch¬i ®èi ph­¬ng sÏ nhËn ®­îc 2 ®iÓm chiÕn c«ng vµ ghi thªm 2 ®iÓm chiÕn c«ng cho phe m×nh, liªn tr¶m 3 lÇn nhËn ®­îc 10 ®iÓm chiÕn c«ng. ChiÕn c«ng ®­îc ®iÒu chØnh theo tû lÖ kh¸c nhau dùa vµo sè ng­êi cña hai bªn. Bªn cã sè ng­êi nhiÒu, ®iÓm chiÕn c«ng sÏ İt h¬n so víi bªn kia.", 3, "Trang kÕ/info_rule_next1", "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end

function info_rule_next1()
	Say("Khi träng th­¬ng sÏ ®­îc quay vÒ hËu doanh, 10 gi©y sau míi cã thÓ quay l¹i chiÕn tr­êng. Thêi gian l­u l¹i hËu doanh kh«ng v­ît qu¸ 2 phót. NÕu v­ît qu¸, sÏ ®­îc tù ®éng ®­a trë l¹i chiÕn tr­êng. Khi chiÕn ®Êu, ng­êi ch¬i chØ cã thÓ gia nhËp 1 trong 2 phe vµ kh«ng thÓ ®æi phe. ChØ ®­îc ®æi phe sau khi chiÕn ®Êu kÕt thóc.", 4, "Trang tr­íc/info_rule_yanmen", "Trang kÕ/info_rule_next2", "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end

function info_rule_next2()
	Say("Sè ng­êi khi khai chiÕn cña mçi bªn İt nhÊt lµ 10 ng­êi. B¸o danh kÕt thóc, bÊt kú phe nµo İt h¬n 10 ng­êi sÏ kh«ng thÓ khai chiÕn. Sau khi chiÕn ®Êu b¾t ®Çu, phe nµo cã sè ng­êi hiÖn tham chiÕn (bao gåm ë hËu doanh) İt h¬n 1 ng­êi sÏ bŞ xö thua. Thêi gian chiÕn ®Êu kÕt thóc, phe cã tæng chiÕn c«ng ®­îc tİnh nhiÒu h¬n sÏ giµnh chiÕn th¾ng. ChiÕn c«ng hai bªn b»ng nhau sÏ ®­îc xö hßa", 3, "Trang tr­íc/info_rule_next1", "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end
  
function OnCancel()
end

function info_lingpai_help()
	Say("Cã 2 lo¹i Anh hïng lÖnh: §¹i Tèng anh hïng lÖnh vµ §¹i Liªu anh hïng lÖnh. NhÊp chuét ph¶i vµo anh hïng lÖnh sÏ ®­îc chuyÓn ®Õn ®iÓm b¸o danh cña phe Tèng hoÆc phe Liªu t­¬ng øng. §¹i Tèng anh hïng lÖnh cã thÓ mua ë TriÖu Diªn Niªn (BiÖn Kinh). §¹i Liªu anh hïng lÖnh cã thÓ mua ë Tiªu Diªn Niªn (BiÖn Kinh).", 2, "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end

function bt_onbattleinfo()
	Say( "N¨m thø 4 Th¸i b×nh h­ng Quèc ®êi Tèng, Tèng Th¸i T«ng TriÖu Quang NghÜa th¶o ph¹t Liªu Quèc ®¹i b¹i trë vÒ lo gi÷ n­íc, tu d­ìng binh lùc. Liªu Quèc kh«ng tõ bá c¬ héi tèt nµy ®ang kĞo qu©n ®Õn Nh¹n M«n quan. Cuéc chiÕn Nh¹n M«n quan bïng næ.", getn(TAB_YANMENGGUAN), TAB_YANMENGGUAN )
end

function info_point_gain()
	Say("Trong chiÕn ®Êu, khi ng­êi ch¬i PK, liªn tr¶m, tham gia sù kiÖn ®Æc biÖt, giµnh ®­îc th¾ng lîi trong cuéc chiÕn...®Òu nhËn ®­îc ®iÓm chiÕn c«ng t­¬ng øng. <enter> Khi ch­a khai chiÕn, ng­êi ch¬i hai bªn Tèng Liªu cã thÓ mua vËt phÈm, ®æi ®iÓm kinh nghiÖm ë Qu©n Nhu Quan t¹i ®iÓm b¸o danh cña mçi bªn. Sau khi chİnh thøc khai chiÕn, Qu©n Nhu Quan sÏ ng­ng b¸n vËt phÈm chiÕn tr­êng cho ®Õn khi chiÕn ®Êu kÕt thóc.", 2, "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end

function info_join_requre()
	Say("Nh©n vËt lín h¬n hoÆc b»ng cÊp <color=yellow>40<color> míi cã thÓ b¸o danh tham gia chiÕn tr­êng s¬ cÊp. Lín h¬n hoÆc b»ng cÊp <color=yellow>70<color> b¸o danh chiÕn tr­êng cao cÊp. Sè ng­êi tèi ®a cña 2 bªn lµ <color=yellow>100<color> ng­êi. B¾t ®Çu khai chiÕn nÕu sè ng­êi tham chiÕn ch­a ®¹t tèi ®a th× cã thÓ tiÕp tôc b¸o danh, trõ tr­êng hîp khai chiÕn 10 phót míi kh«ng thÓ b¸o danh. Sè ng­êi tham chiÕn ®«i bªn İt nhÊt lµ 10, bÊt kú bªn nµo İt h¬n sè Êy th× kh«ng thÓ b¾t ®Çu khai chiÕn. §«i bªn b¸o danh h¬n nhau ®­îc 5 ng­êi, qu¸ sè ng­êi th× bªn nhiÒu kh«ng thÓ b¸o danh chØ ®­îc b¸o danh phe cßn l¹i.", 2, "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end

function info_open_time()
	Say("TrËn chiÕn Nh¹n M«n Quan mçi ngµy më 4 ®ît gåm: 13: 45; 15: 45; 19: 45; 21: 45, thêi gian b¸o danh lµ 15 phót, thêi gian chiÕn ®Êu lµ 30 phót.", 2, "trë l¹i/bt_onbattleinfo", "Tho¸t/OnCancel")
end

