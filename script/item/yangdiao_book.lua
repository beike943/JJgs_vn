--ÑødiaoÖ¸ÄÏ
--by vivi
--2009-04-09

g_NpcName = "<color=green>D­ìng §iªu ChØ Nam<color>: "

function OnUse()
	local strtab = {
		"Bİ quyÕt cho TiÓu §iªu ¨n no/yangdiao_talk_1",
		"HuÊn luyÖn 1 TiÓu §iªu th«ng minh/yangdiao_talk_2",
		"Cho TiÓu §iªu häc mét kü n¨ng ®Æc biÖt/yangdiao_talk_3",
		"Dõng/nothing"
	};
	Say(g_NpcName.."§©y lµ th­ tŞch ghi chĞp c¸ch nu«i §iªu cña ®Ö tö Thóy Yªn M«n, rÊt cã İch.",
		getn(strtab),
		strtab)
end

function yangdiao_talk_1()
	Talk(1,"OnUse",g_NpcName.."§é ®ãi kh¸t sÏ ¶nh h­ëng lùc c«ng cña §iªu, cµng ®ãi lùc c«ng cµng thÊp, khi ®ã lùc c«ng cña chñ nh©n còng gi¶m. Cho TiÓu §iªu ¨n nh­ sau:\n    1. §Õn Th­¬ng Nh©n Thóy Yªn mua Hång S¬n Qu¶ hoÆc QuÕ Hoa Ng­\n    2. Sö dông vâ c«ng “Nu«i TiÓu §iªu”\n    3. NhÊp chuét ph¶i vµo TiÓu §iªu råi chän Hång S¬n Qu¶ hoÆc QuÕ Hoa Ng­ trong tói\n    4. LÆp l¹i b­íc 2 vµ 3 cho ®Õn khi ¨n no");
end

function yangdiao_talk_2()
	Talk(1,"OnUse",g_NpcName.."Linh tİnh cña §iªu sÏ t¨ng mét tû lÖ nhÊt ®Şnh theo cÊp huÊn luyÖn cña §iªu. Linh tİnh cã thÓ t¨ng tèc ®é vµ lùc c«ng cña §iªu. HuÊn luyÖn TiÓu §iªu cÇn cã HuÊn LuyÖn Tiªu vµ MËt Qu¶. Mçi khi t¨ng 1 ®iÓm huÊn luyÖn ph¶i th­ëng cho TiÓu §iªu 1 MËt Qu¶, MËt Qu¶ kh«ng thÓ t¨ng ®é no cña §iªu. NÕu §iªu qu¸ ®ãi sÏ dõng huÊn luyÖn. HuÊn luyÖn TiÓu §iªu nh­ sau:\n    1. §Õn Th­¬ng Nh©n Thóy Yªn mua 1 HuÊn LuyÖn Tiªu vµ MËt Qu¶\n    2. Dïng HuÊn LuyÖn Tiªu b¾t ®Çu huÊn luyÖn\n    3. NÕu huÊn luyÖn bŞ dõng th× cã thÓ do hÕt MËt Qu¶ hoÆc TiÓu §iªu bŞ ®ãi");	
end

function yangdiao_talk_3()
	Talk(1,"OnUse",g_NpcName.."§iªu cã thÓ ¨n thùc vËt chØ ®Şnh ®Ó häc kü n¨ng ®Æc biÖt, kü n¨ng nµy th«ng qua “B¸ch Hoa T©m Kinh” cña chñ nh©n ®Ó thi triÓn. Kü n¨ng häc sau sÏ thay thÕ cho kü n¨ng tr­íc. §iªu häc kü n¨ng nh­ sau:\n    1. §Õn Th­¬ng Nh©n Thóy Yªn mua mét trong c¸c lo¹i TriÒu Thiªn Tiªu, Thanh L­îng Th¶o, Thiªn H­¬ng Hoa\n    NhÊp chuét ph¶i sö dông\n    TiÓu §iªu sÏ häc ®­îc kü n¨ng ®Æc biÖt t­¬ng øng\n    Chñ nh©n khi chiÕn ®Êu dïng B¸ch Hoa T©m Kinh ®Ó lÖnh cho TiÓu §iªu sö dông kü n¨ng nµy");
end

function nothing()

end