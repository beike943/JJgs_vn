--==================================================
--create by zhangming 2009.12.25
--describe: Ô½ÄÏ°æ ×ªÉúÈÎÎñ ÖĞÎÄ×Ö·û´®ÎÄ¼ş
--related files:
--==================================================
--
VET_200912_STR_EVENTNAME = "NhiÖm vô chuyÓn sinh"
VET_200912_STR_ACTIONS = {
    [1] = "Xãa thµnh c«ng giao vËt phÈm nhiÖm vô",
    [2] = "Xãa thÊt b¹i giao vËt phÈm nhiÖm vô",
    [3] = "Lóc chuyÓn sinh cã tr¹ng th¸i bÊt th­êng",
    [4] = "ChuyÓn sinh tÆng tö Ên thµnh c«ng",
}

VET_201003_STR_NPC_NAME = {
    [1] = {"Tèng T­íng Qu©n","Hæ Tö Sø"},
    [2] = {"Vâ L©m Minh Chñ1","Long Tö Sø"},
    [3] = {"Phu nh©n T©y D­¬ng","Phông Tö Sø"},
    [4] = {"TruyÒn gi¸o sÜ","¦ng Tö Sø"},
}
--4¸önpcµÄ¶Ô»°ÄÚÈİ
VET_200912_STR_TALK = {
    [1] = "Muèn gia nhËp long tö héi?",
    [2] = "Muèn gia nhËp phông tö héi?",
    [3] = "Muèn gia nhËp hæ tö héi?",
    [4] = "Muèn gia nhËp ­ng tö héi?",
    [5] = "§ång ı gia nhËp/#VET_201003_MaskSureAgain(%d)",
    [6] = "§Ó ta suy nghÜ l¹i/gf_DoNothing",
    [7] = "Muèn gia nhËp %s, tr­íc tiªn ph¶i hoµn thµnh nhiÖm vô chuyÓn sinh",
    [8] = "§ång ı gia nhËp/#VET_201003_JoinMenHui(%d)",
    [9] = "§Ó ta suy nghÜ l¹i/gf_DoNothing",
    [10] = "§¹i hiÖp ®· kİch ho¹t nhiÖm vô chuyÓn sinh %s råi",
    [11] = "Ta muèn t×m hiÓu %s/#menhui_detailse(%d)",
  --[12] = "ÄãÒÑ¾­¼¤»îÁË×ªÉúÈÎÎñ£¬Çëµ½ÃÅÅÉÕÆÃÅ´¦½ÓÊÜºóÃæµÄÈÎÎñ",
    [13] = "Mçi ngµy ®øng t¹i n¬i nµy ph¬i s­¬ng ph¬i n¾ng, thËt lµ mÖt qu¸ ®i",
    [14] = "Kİch ho¹t nhiÖm vô tæ ®éi/VET_201003_ShowTeamTask",
    [15] = "Ta muèn kİch ho¹t thuÇn m·/VET_201003_BAOMA",
    [16] = "Ta muèn kİch ho¹t b¹n ®ång hµnh/VET_201003_TONGBAN",
    [17] = "Ta muèn kİch ho¹t chÕ t¹o vò khİ ph¸t s¸ng/VET_201003_FAGUANGWUQI",
    [18] = "Ta muèn kİch ho¹t chÕ t¹o ngo¹i trang cã thuéc tİnh/VET_201003_SHUXINGWAIZHUANG",
    [19] = "Ta muèn kİch ho¹t chÕ t¹o n©ng cÊp trang bŞ vµ vò khİ/VET_201003_SHENGJIWUQI",
    [20] = "§· kİch ho¹t thµnh c«ng",
    [21] = "Ta muèn hñy nhiÖm vô chuyÓn sinh/VET_201003_Show_GiveUpTask",
    [22] = "Mét khi bá nhiÖm vô nµy lµ cã nghÜa c¸c h¹ phİ ph¹m c«ng lùc ®· bá ra",
    [23] = "§ång ı hñy nhiÖm vô/VET_201003_GiveUpTask",
    [24] = "§Ó ta nghÜ l¹i xem/gf_DoNothing",
    [25] = "§¹i hiÖp ®· nhËn thµnh c«ng nhiÖm vô hµnh hiÖp tr­îng nghÜa",
    [26] = "§¹i hiÖp ®· nhËn thµnh c«ng nhiÖm vô cøu n¹n",
    [27] = "§· hñy thµnh c«ng nhiÖm vô chuyÓn sinh",
}



VET_200912_STR_XIAXIANTISHI = {
    {"§· chuyÓn sinh thµnh c«ng vµ gia nhËp %s, sau khi tho¸t ra ®¨ng nhËp l¹i míi cã hiÖu lùc, <color=red> (Chó ı: sau khi rêi m¹ng xong sÏ trë vÒ cÊp 10, giíi h¹n trªn hµnh trang chØ ®­îc mang 1000000 ®ång.)<color>","Ta muèn ®¨ng nhËp l¹i/VET_201003_REBOOT_CLIENT","§Ó ta ®i göi tiÒn ®·/gf_DoNothing"},
}
VET_200912_STR_MENHUI_NAME = {
    "Long Tö M«n",
    "Phông Tö M«n",
    "Hæ Tö M«n",
    "¦ng Tö M«n",
}
VET_200912_STR_NPC_NAME = {
    "Long Tö Sø",
    "Phông Tö Sø",
    "Hæ Tö Sø",
    "¦ng Tö Sø",
}

VET_200912_TB_MENHUIYIN = {
    {"Long tö Ên",{2,0,30002,1,4},},
    {"Phông tö Ên",{2,0,30005,1,4},},
    {"Hæ tö Ên",{2,0,30003,1,4},},
    {"¦ng tö Ên",{2,0,30006,1,4},},
}

VET_200912_STR_SEX_ERROR = {
    "Xin lçi, phông tö héi chØ thu nhËn n÷ ®Ö tö",
    "Xin lçi, long tö héi chØ thu nhËn nam ®Ö tö",
}

VET_200912_STR_ZS_ERROR = {
    [1] = "C¸c h¹ ®· nhËn nhiÖm vô chuyÓn sinh %s råi, chØ ®­îc nép nhiÖm vô t¹i %s, muèn gia nhËp bæn m«n héi th× h·y hñy nhiÖm vô chuyÓn sinh hiÖn t¹i",
    [2] = "VÉn ch­a ®ñ cÊp 99, chuyÓn sinh cÇn cÊp 99 mµ. Cè lªn chµng trai trÎ",
    [3] = "VÉn ch­a ®ñ 2 tû kinh nghiÖm, chuyÓn sinh cÇn kinh nghiÖm ®¹t ®Õn 2 tû, cè lªn nµo!!!",
    [4] = "ChuyÓn sinh cÇn ®é cèng hiÕn s­ m«n lµ 10000 ®iÓm. §Õn chç s­ phô cèng hiÕn cho m«n ph¸i ®i",
    [5] = "ChuyÓn sinh cÇn danh väng ®¹t ®Õn 10000 ®iÓm",
    [6] = "ChuyÓn sinh cÇn qu©n c«ng ®¹t ®Õn 80000 ®iÓm",
    [7] = "Gi·n c¸ch hai lÇn chuyÓn sinh cÇn 6 th¸ng. LÇn chuyÓn sinh sau lµ n¨m %d th¸ng %d ngµy %d",
    [8] = "Ng­¬i ®· chuyÓn sinh thµnh c«ng t¹i %s. Ta gióp kh«ng ®­îc g× thªm n÷a råi.",
    [9] = "§¹i hiÖp vÉn ch­a gia nhËp m«n ph¸i, chØ cã nh©n vËt ®· gia nhËp m«n ph¸i míi cã thÓ chuyÓn sinh",
    [10] = "Kü n¨ng m«n ph¸i cña ®¹i hiÖp vÉn ch­a häc ®ñ, chØ cã häc ®ñ kü n¨ng m«n ph¸i míi ®­îc chuyÓn sinh (kh«ng bao gåm kü n¨ng m«n ph¸i)",
}

VET_200912_STR_ACCEPT_ZS_TASK = {
   "Ng­¬i ®· kİch ho¹t thµnh c«ng nhiÖm vô chuyÓn sinh, xin mêi ®Õn %s ®Ó hoµn thµnh nhiÖm vô tr­îng nghÜa giang hå",
   "Ng­¬i ®· hoµn thµnh nhiÖm vô tr­îng nghÜa hµnh hiÖp, xin mêi ®Õn %s ®Ó hoµn thµnh nhiÖm vô cøu n¹n",
   "§· hoµn thµnh tÊt c¶ nhiÖm vô chuyÓn sinh, xin mêi ®Õn %s ®Ó hoµn thµnh chuyÓn sinh",
}

VET_200912_STR_FOLLOW_UP_TASK_TALK = {
    {"ChØ cã hiÖp sü hµnh hµnh hiÖp tr­îng nghÜa míi cã thÓ chuyÓn sinh. Xin mêi hoµn thµnh nhiÖm vô trõng ¸c vµ thu thËp vËt phÈm nhiÖm vô: <color=red>B¾c Lôc L©m LÖnh, Trôc ¶nh Th­¬ng, TuyÖt T×nh Th¹ch, LÖnh bµi tæng qu¶n ngo¹i viÖn, LÖnh bµi tæng qu¶n néi viÖn, ViÖt N÷ KiÕm, Trang chñ kim Ên, Tr­ëng L·o ChØ Hoµn, ThiÖp dù tiÖc Long M«n mçi thø 1 c¸i<color>","Ta muèn nhËn nhiÖm vô hµnh hiÖp tr­îng nghÜa/get_poetical_justice_task",VET_200912_STR_TALK[21],"HiÖn t¹i cã tİ viÖc, l¸t n÷a quay l¹i/gf_DoNothing"},
    {"§· thu thËp nh÷ng vËt phÈm nh­ sau: <color=red>B¾c Lôc L©m LÖnh, Trôc ¶nh Th­¬ng, TuyÖt T×nh Th¹ch, LÖnh bµi tæng qu¶n ngo¹i viÖn, LÖnh bµi tæng qu¶n néi viÖn, ViÖt N÷ KiÕm, Trang chñ kim Ên, Tr­ëng L·o ChØ Hoµn, ThiÖp dù tiÖc Long M«n<color>",
    "Ta ®· thu thËp ®ñ vµ cã thÓ hoµn thµnh nhiÖm vô/poetical_justice_task",VET_200912_STR_TALK[21],"Hay lµ ®îi mét tİ n÷a/nothing"},
    {"§­¬ng nhiªn, ®· lµ mét ®¹i hiÖp cÇn ph¶i cã mét tr¸i tim l­¬ng thiÖn. Xin mêi hoµn thµnh nhiÖm vô cøu nan, thu thËp vËt phÈm: <color=red>%d %s<color>","Ta muèn nhËn nhiÖm vô/get_salvage_task",VET_200912_STR_TALK[21],"HiÖn t¹i cã tİ viÖc, l¸t n÷a quay l¹i/gf_DoNothing"},
    {"Ta ®· thu thËp vËt phÈm nh­ sau: <color=red>%d %s<color>","§· thu thËp ®ñ, cã thÓ hoµn thµnh nhiÖm vô ®­îc råi/salvage_task",VET_200912_STR_TALK[21],"Hay lµ ®îi mét tİ n÷a/nothing"},
    {"RÊt tèt, hiÖn t¹i ta cã thÓ gióp ng­¬i chuyÓn sinh, xin mêi h·y bá tÊt c¶ trang bŞ vµ tiÒn trªn ng­êi xuèng, nÕu kh«ng trong lóc lu©n håi rÊt dÔ bŞ mÊt ®ã<color=red>(Chó ı sau khi chuyÓn sinh th× cÊp sÏ trë vÒ 10 ®ång thêi chØ ®­îc mang trªn ng­êi lµ  1000000 ®ång)<color>","Ta muèn chuyÓn sinh ngay/Finish_ZS",VET_200912_STR_TALK[21],"Hay lµ ®îi mét tİ n÷a/nothing"},
}

VET_200912_STR_TEAM_TASK_DETAILSE = {
    "Tõ 8 giê ®Õn 14 giê ngµy thø 2-6-7-chñ nhËt, nh©n vËt ®· chuyÓn sinh cã thÓ tham gia nhiÖm vô tæ ®éi t­¬ng øng, mçi ngµy mçi nh©n vËt chØ ®­îc kİch ho¹t mét lÇn,\n Mçi ngµy mçi m«n héi cã sè l­îng kİch ho¹t t­¬ng øng víi sè l­îng xuÊt hiÖn cña boss hoµng kim, mçi boss hoµng kim sÏ xuÊt hiÖn tõng b¶n ®å riªng,\n Long Tö, Phông Tö, Hæ Tö, ¦ng Tö sÏ xuÊt hiÖn t¹i TuyÒn Ch©u b¾c, Thµnh §« t©y, TuyÒn Ch©u b¾c, THµnh §« t©y",
}

VET_200912_STR_MENHUI_DETAILSE = {
    {"Long Tö m«n thiªn h­íng chÕ t¹o ngo¹i trang c«ng kİch nh­ng chØ thu nhËn nam ®Ö tö",},
    {"Phông tö m«n chÕ t¹o ngo¹i trang thiªn h­íng hç trî phßng ngù vµ bæn m«n héi kh«ng nhËn n÷ ®Ö tö",},
    {"Hæ tö m«n chÕ t¹o ngo¹i trang thiªn h­íng phong ngù",},
    {"¦ng tö m«n chÕ t¹o ngo¹i trang thiªn h­íng hç trî tÊn c«ng",},
}

VET_200912_STR_POETICAL_JUSTICE_ITEM_NAME = {
    "B¾c Lôc L©m lÖnh",
    "Trôc ¶nh Th­¬ng",
    "TuyÖt T×nh Th¹ch",
    "LÖnh bµi tæng qu¶n ngo¹i viÖn",
    "LÖnh bµi tæng qu¶n néi viÖn",
    "ViÖt N÷ kiÕm",
    "Trang chñ kim Ên",
    "Tr­ëng L·o ChØ Hoµn",
    "ThiÖp dù tiÖc Long M«n",
}

VET_200912_STR_SALVAGE_ITEM_NAME = {
    "C¬m n¾m",
    "Mµn thÇu",
    "B¸nh xÕp",
    "B¸nh bao thŞt",
    "M¨ng xµo",
    "Tø Quı ®Ëu",
    "§Ëu xµo",
    "C¶i xµo tái",
}

VET_200912_STR_SCARCITY_ITEM_ERROR = {
    "§¹i hiÖp, lõa dèi lµ mét ®øc tİnh kh«ng tèt. Ta cÇn nh÷ng nguyªn liÖu mµ ng­¬i vÉn ch­a kiÕm ®ñ ®ã.",
}

VET_200912_STR_NPC_TYPE_ERROR = "Ng­¬i ®· lµ ng­êi cña %s, ta kh«ng thÓ gióp g× h¬n ®­îc n÷a"

VET_200912_STR_HAVE_ACTIVE_ERROR = {"Xin lçi, h«m nay c¸c h¹ ®· kİch ho¹t råi, kh«ng thÓ kİch ho¹t nhiÒu lÇn."}

VET_200912_STR_DAY_ERROR = {"Xin lçi, chØ cã mçi thø 2-6-7-CN míi cã thÓ kİch ho¹t"}

VET_200912_STR_RENOVATE_BOSS_NUM = "H«m nay sÏ xuÊt hiÖn <color=red>%d<color> boss long tö, <color=red>%d<color> boss phông tö,".."<color=red> %d<color> boss hæ tö, <color=red>%d<color> boss ­ng tö"

VET_201003_STR_ERROR = {
    "§¹i hiÖp ®· chuyÓn sinh thµnh c«ng 1 lÇn råi",
}

VET_201003_STR_TEAM_TASK_TALK = {
    [1] = "Nh÷ng nh©n vËt ®· chuyÓn sinh cã thÓ mçi tuÇn thø<color=red>2-6-7-CN tõ 8 giê ®Õn 14 giê<color> cã thÓ kİch ho¹t nhiÖm vô tæ ®éi t¹i ®©y, mçi lÇn kİch ho¹t cÇn cã 5 ng­êi trë lªn, tõ 16 giê ®Õn 22 giê 30 m«n chñ t¹i b¶n ®å bªn ngoµi triÖu håi boss m«n héi, sè ng­êi kİch ho¹t boss trªn 10 ng­êi sÏ kİch ho¹t ®­îc 2 boss m«n héi",
    [2] = "Ta muèn kİch ho¹t/VET_201003_ActiveTeamTask",
    [3] = "Tam thêi kh«ng kİch ho¹t/gf_DoNothing",
    [4] = "§· kİch ho¹t thµnh c«ng nhiÖm vô tæ ®éi",
    [5] = "C¸c h¹ ®· kİch ho¹t nhiÖm vô tæ ®éi råi, kh«ng thÓ kİch ho¹t l¹i",
    [6] = "B©y giê kh«ng ph¶i lµ thêi gian kİch ho¹t, xin mêi h·y kİch ho¹t nhiÖm vô trong thêi gian quy ®Şnh",
    [7] = "Ta muèn t×m hiÓu thªm/team_task_detailse",
}
VET_201003_STR_BAOMA_TALK = {
    "ChØ cã kİch ho¹t thuÇn b¶o m· míi cã thÓ sö dông chøc n¨ng nµy",
    "X¸c nhËn kİch ho¹t/VET_201003_ActiveBaoMa",
    "Tam thêi kh«ng kİch ho¹t/gf_DoNothing",
}
VET_201003_STR_TONGBAN_TALK = {
    "Ph¶i kİch ho¹t tİnh n¨ng b¹n ®ång hµnh míi cã thÓ sö dông tİnh n¨ng nµy",
    "X¸c nhËn kİch ho¹t/VET_201003_ActiveTONGBAN",
    "Tam thêi kh«ng kİch ho¹t/gf_DoNothing",
}
VET_201003_STR_FAGUANGWUQI_TALK = {
    "Ph¶i kİch ho¹t tİnh n¨ng chÕ t¹o vò khİ ph¸t s¸ng míi cã thÓ sö dông tİnh n¨ng nµy",
    "X¸c nhËn kİch ho¹t/VET_201003_ActiveFAGUANGWUQI",
    "Tam thêi kh«ng kİch ho¹t/gf_DoNothing",
}
VET_201003_STR_SHUXINGWAIZHUANG_TALK = {
    "Ph¶i kİch ho¹t chÕ t¹o ngo¹i trang cã thuéc tİnh míi cã thÓ thÓ sö dông tİnh n¨ng nµy",
    "X¸c nhËn kİch ho¹t/VET_201003_ActiveSHUXINGWAIZHUANG",
    "Tam thêi kh«ng kİch ho¹t/gf_DoNothing",
}
VET_201003_STR_SHENGJIWUQI_TALK = {
    "Ph¶i kİch ho¹t n©ng cÊp trang bŞ vµ vò khİ míi cã thÓ sö dông tİnh n¨ng nµy",
    "X¸c nhËn kİch ho¹t/VET_201003_ActiveSHENGJIWUQI",
    "Tam thêi kh«ng kİch ho¹t/gf_DoNothing",
}

VET_200912_STR_BOSS_BE_BIRTH_HINT = "%s xuÊt hiÖn t¹i %s tµn s¸t sinh linh v« téi. §¹i hiÖp h·y ®i ®Õn ®ã xem t×nh thÕ nµo."


