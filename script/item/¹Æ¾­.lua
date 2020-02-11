
function OnUse()
	Say("<color=green>Cæ Kinh<color> §Ö tö bæn m«n ®Òu ph¶i n»m lßng, nghiªm cÊm tiÕt lé ra ngoµi. Ai vi ph¹m sÏ bŞ truÊt phÕ vâ c«ng, trôc xuÊt khái s­ m«n._B¹ch DiÖn Lang Qu©n",5,"Ch­¬ng 1: Kh¸i luËn/gailun","Ch­¬ng 2: Cæ thuËt/gushu","Ch­¬ng 3: Cæ MÉu/gumu","Ch­¬ng 4: §éc/gu","§ãng/no")
end

function gailun()
	Say("<color>Tinh hoa vâ c«ng bæn ph¸i n»m trong cæ mÉu. ChØ cÇn chuyªn t©m nu«i d­ìng phèi hîp víi néi c«ng bµo chÕ sÏ t¹o ra lo¹i cæ mÉu cùc ®éc, khã ai b× kŞp. Dï ®èi ph­¬ng cã tr¨m n¨m c«ng lùc còng ®µnh bã tay!",5,"Ch­¬ng 2: Cæ thuËt/gushu","Ch­¬ng 3: Cæ MÉu/gumu","Ch­¬ng 4: §éc/gu","Tr­íc/OnUse","§ãng/no")
end

function gushu()
	Say("<color> Trõ Cuång Phong Tr¶o, vâ c«ng kh¸c cña bæn ph¸i ®Òu lµ Cæ thuËt, miªu t¶ chi tiÕt:",6,". Ph©n lo¹i Cæ thuËt/gushufenlei",". Nu«i cæ mÉu vµ chÕ ®éc/gumuweiyang",". Khèng chÕ ®éc/tunshi",". Kİch ®éc/jihuo","Tr­íc/OnUse","§ãng/no")
end

function gumu()
	Say("<color> Cæ mÉu lµ vâ c«ng së hÖ cña bæn ph¸i, lµ c¨n nguyªn cña v¹n ®éc, miªu t¶ chi tiÕt:",7,". Thøc ¨n/shiwu",". Tuæi thä/shouming",". §ãi/jie",". Bèn tİnh chÊt §éc, HuyÕt, Linh, Ma/duxuelingmo",". X­ng hiÖu/chenghao","Tr­íc/OnUse","§ãng/no")
end

function gu()
	Say("<color> Kh«ng cã ®éc th× kh«ng cã Cæ thuËt, miªu t¶ chi tiÕt:",4,". Ph©n lo¹i/gufenlei",". §iÒu kiÖn s¶n sinh s©u ®éc/shengchantiaojian","Tr­íc/OnUse","§ãng/no")
end

function gushufenlei()
	Say("<color> Nh×n chung Cæ thuËt chia lµm hai lo¹i: <color=gold>Nu«i Cæ mÉu vµ Cæ thuËt<color> Cæ thuËt chia theo hiÖu qu¶ lµ: <color=gold>TÊn c«ng, phßng ngù, tÊn c«ng ®Æc biÖt vµ phßng ngù ®Æc biÖt<color>Cæ thuËt chia theo tİnh chÊt: <color=green>§éc hÖ <color=red>HuyÕt hÖ <color=gray>Linh hÖ <color=gold>Ma hÖ<color>",5,". Nu«i cæ mÉu vµ chÕ ®éc/gumuweiyang",". Khèng chÕ ®éc/tunshi",". Kİch ®éc/jihuo","Tr­íc/gushu","§ãng/no")
end

function gumuweiyang()
	Say("<color>Nu«i cæ mÉu b»ng c¸c lo¹i vËt phÈm, thay ®æi n¨ng lùc cña cæ mÉu. <color=green>Tr­íc tiªn, ph¶i mang theo ng­êi 1 con cæ mÉu<color>: Sö dông kü n¨ng Nu«i cæ mÉu, nhÊp chuét lÊy vËt phÈm trong « vËt phÈm ra, cho cæ mÉu ¨n vËt phÈm khiÕn n¨ng lùc cæ mÉu biÕn chuyÓn. Sö dông kü n¨ng s¶n sinh s©u ®éc ®Ó s¶n sinh ra nh÷ng con s©u ®éc nhá. Mçi lÇn s¶n sinh, c¨n cø vµo s©u ®éc kh¸c nhau ®Ó c¶i thiÖn n¨ng lùc cña cæ mÉu. Kü n¨ng D­ìng cæ mËt thuËt cã thÓ ®iÒu chÕ c¸c lo¹i thøc ¨n ®Æc biÖt cho cæ mÉu, chuyÓn biÕn mét n¨ng lùc ®Æc biÖt nµo ®ã cña cæ mÉu.",5,". Ph©n lo¹i Cæ thuËt/gushufenlei",". Khèng chÕ ®éc/tunshi",". Kİch ®éc/jihuo","Tr­íc/gushu","§ãng/no")
end

function tunshi()
	Say("<color> Khèng chÕ ®éc lµ c«ng ®éc vµ phßng ®éc theo tİnh chÊt cña ®éc, hãa gi¶i t¸c dông ®éc lÉn nhau: C«ng ®éc: Khi kÎ ®Şch bŞ phun ®éc, chÊt ®éc trªn ng­êi sÏ ¨n dÇn vµo theo tuÇn tù tõ: §éc->HuyÕt->Linh->Ma->§éc. Vİ dô: Trªn ng­êi kÎ ®Şch ®· bŞ phun cæ mÉu, l¹i tiÕp tôc bŞ phun ®éc huyÕt. HiÖu qu¶ cña cæ mÉu sÏ bŞ ®éc huyÕt hãa gi¶i. Khèng chÕ ®éc cã thø tù tr­íc sau, nÕu phun ®éc huyÕt tr­íc råi phun cæ mÉu, ®éc huyÕt sÏ kh«ng thÓ khèng chÕ cæ mÉu. Phßng ®éc: Nh©n vËt chØ cã thÓ mang mét lo¹i phßng ®éc, phßng ®éc ®­îc thªm vµo sÏ khèng chÕ c¸i ®· cã. Khèng chÕ ®Æc thï: C«ng ®éc vµ phßng ®éc ®Æc thï kh«ng kh¾c chÕ nhau, cã thÓ cïng tån t¹i.",5,". Ph©n lo¹i Cæ thuËt/gushufenlei",". Nu«i cæ mÉu vµ chÕ ®éc/gumuweiyang",". Kİch ®éc/jihuo","Tr­íc/gushu","§ãng/no")
end

function jihuo()
	Say("<color> Kİch ®éc lµ khi <color=green>kÎ ®Şch bŞ phun 3 lo¹i c«ng ®éc<color>, cã thÓ kİch ho¹t hiÖu qu¶ cña c¸c lo¹i ®éc: C«ng ®éc ®Æc biÖt: Phun chÊt ®éc ®Æc thï cho kÎ ®Şch, sÏ kİch ho¹t thuéc tİnh tÊn c«ng cao cÊp cho kÎ ®Şch, ®ång thêi 3 lo¹i c«ng ®éc bŞ hñy bá. Phßng ®éc: Khi b¶n th©n ®· cã phßng ®éc, nÕu bŞ kÎ ®Şch tÊn c«ng sÏ tù kİch ho¹t thuéc tİnh phßng ngù cao cÊp, ®ång thêi 3 lo¹i c«ng ®éc bŞ hñy bá. Phßng ®éc ®Æc biÖt: Khi b¶n th©n cã phßng ®éc hoÆc phßng ®éc ®Æc biÖt, nÕu bŞ kÎ ®Şch tÊn c«ng, cµng kİch ho¹t m¹nh mÏ h¬n thuéc tİnh phßng ngù cña b¶n th©n, ®ång thêi 3 lo¹i c«ng ®éc bŞ hñy bá.",5,". Ph©n lo¹i Cæ thuËt/gushufenlei",". Nu«i cæ mÉu vµ chÕ ®éc/gumuweiyang",". Khèng chÕ ®éc/tunshi","Tr­íc/gushu","§ãng/no")
end

function shiwu()
	Say("<color=green>Thøc ¨n lµ nh÷ng vËt phÈm cã thÓ nu«i d­ìng cæ mÉu<color>: PhÇn lín vËt phÈm ®Òu lµm thøc ¨n nu«i cæ mÉu vµ chuyÓn biÕn n¨ng lùc cña nã. VËt phÈm cµng hiÕm cã cµng cao cÊp, cµng cã nhiÒu ¶nh h­ëng tèt ®Õn n¨ng lùc cña cæ mÉu. Kü n¨ng D­ìng cæ mËt thuËt cã thÓ chÕ biÕn nhiÒu lo¹i thøc ¨n ®Æc biÖt.",6,". Tuæi thä/shouming",". §ãi/jie",". Bèn tİnh chÊt §éc, HuyÕt, Linh, Ma/duxuelingmo",". X­ng hiÖu/chenghao","Tr­íc/gumu","§ãng/no")
end

function shouming()
	Say("<color=green>Tuæi thä lµ sinh lùc cña cæ mÉu<color>: Mçi lÇn s¶n sinh s©u ®éc, c¨n cø vµo chñng lo¹i cña s©u ®éc nhá ®Ó khÊu trõ tuæi thä nhÊt ®Şnh cña cæ mÉu. Khi trŞ tuæi thä cña cæ mÉu b»ng 0, cæ mÉu sÏ chÕt. Cho ¨n thøc ¨n ®Æc ®Şnh cã thÓ t¨ng thªm tuæi thä cho cæ mÉu. Kü n¨ng D­ìng cæ mËt thuËt cã thÓ chÕ biÕn thøc ¨n dïng ®Ó t¨ng thªm tuæi thä cho cæ mÉu. N¨ng lùc cña cæ mÉu cµng m¹nh ph¶i ¨n lo¹i thøc ¨n t­¬ng øng.",6,". Thøc ¨n/shiwu",". §ãi/jie",". Bèn tİnh chÊt §éc, HuyÕt, Linh, Ma/duxuelingmo",". X­ng hiÖu/chenghao","Tr­íc/gumu","§ãng/no")
end

function jie()
	Say("<color=green>§ãi lµ søc sèng cña cæ mÉu<color>: Mçi lÇn s¶n sinh s©u ®éc, c¨n cø vµo chñng lo¹i cña s©u ®éc nhá ®Ó khÊu trõ trŞ søc sèng nhÊt ®Şnh cña cæ mÉu. Qua mét thêi gian nhÊt ®Şnh còng sÏ khÊu trõ trŞ søc sèng nhÊt ®Şnh. Khi trŞ søc sèng gi¶m xuèng, dÉn ®Õn tèc ®é s¶n sinh s©u ®éc cña cæ mÉu chËm dÇn. Khi trŞ søc sèng qu¸ thÊp, tuæi thä còng gi¶m dÇn theo cho ®Õn khi cæ mÉu chÕt. PhÇn lín thøc ¨n ®Òu t¨ng thªm trŞ søc sèng cho cæ mÉu.",6,". Thøc ¨n/shiwu",". Tuæi thä/shouming",". Bèn tİnh chÊt §éc, HuyÕt, Linh, Ma/duxuelingmo",". X­ng hiÖu/chenghao","Tr­íc/gumu","§ãng/no")
end

function duxuelingmo()
	Say("<color>Bèn tİnh chÊt §éc huyÕt linh ma ph¶n ¸nh n¨ng lùc cña cæ mÉu. Chóng ®Òu cã trŞ tèi ®a vµ trŞ hiÖn t¹i. TrŞ tèi ®a cña §éc huyÕt linh ma: BiÓu thŞ n¨ng lùc s¶n sinh hiÖn t¹i cña cæ mÉu. TrŞ tèi ®a cµng lín sÏ sinh ra s©u ®éc nhá cµng tèt. TrŞ hiÖn t¹i cña §éc huyÕt linh ma nãi lªn sù kh¸c biÖt cña s©u ®éc do cæ mÉu s¶n sinh ra. TrŞ hiÖn t¹i lu«n ë møc 100, biÓu thŞ tæng x¸c suÊt khi cæ mÉu sinh s©u ®éc. TrŞ hiÖn t¹i cña mçi tİnh chÊt trong ®ã biÓu thŞ x¸c suÊt sinh ra s©u ®éc mang tİnh chÊt nµy.",6,". Thøc ¨n/shiwu",". Tuæi thä/shouming",". §ãi/jie",". X­ng hiÖu/chenghao","Tr­íc/gumu","§ãng/no")
end

function chenghao()
	Say("<color> X­ng hiÖu lµ tiªu chİ ®¸nh gi¸ cæ mÉu m¹nh yÕu vµ tr¹ng th¸i hiÖn t¹i. Cæ mÉu x­ng hiÖu kh¸c nhau h×nh d¹ng còng kh¸c nhau. X­ng hiÖu do tuæi thä quyÕt ®Şnh: Tuæi thä cña cæ mÉu quyÕt ®Şnh x­ng hiÖu, vİ nh­ søc kháe, m¹nh mÏ...ph¶n ¸nh ®­îc sinh lùc cña cæ mÉu. X­ng hiÖu do trŞ tèi ®a 4 tİnh chÊt quyÕt ®Şnh: TrŞ lín nhÊt cña 4 tİnh chÊt §éc, huyÕt, linh, ma quyÕt ®Şnh x­ng hiÖu, ph¶n ¸nh n¨ng lùc s¶n sinh hiÖn t¹i cña cæ mÉu.",6,". Thøc ¨n/shiwu",". Tuæi thä/shouming",". §ãi/jie",". Bèn tİnh chÊt §éc, HuyÕt, Linh, Ma/duxuelingmo","Tr­íc/gumu","§ãng/no")
end

function gufenlei()
	Say("<color> C¨n cø theo 4 tİnh chÊt cña cæ mÉu, s©u ®éc còng chia thµnh 4 lo¹i tİnh chÊt §éc huyÕt linh ma. Cã lo¹i s©u ®éc ®Æc biÖt kh«ng thuéc tİnh chÊt nµo ®Ó phun Cæ thuËt c¬ b¶n nh­ kü n¨ng Phong ®éc.",3,". §iÒu kiÖn s¶n sinh s©u ®éc/shengchantiaojian","Tr­íc/gu","§ãng/no")
end

function shengchantiaojian()
	Say("<color> §iÒu kiÖn s¶n sinh s©u ®éc cÇn yªu cÇu møc tèi thiÓu vÒ n¨ng lùc 4 tİnh chÊt cña cæ mÉu. Vİ dô: S©u ®éc m¹nh cÇn n¨ng lùc 4 tİnh chÊt cña cæ mÉu lµ: §éc tİnh 65, HuyÕt tİnh 35, Linh tİnh 35 vµ Ma tİnh 35. NÕu thÊp h¬n møc nµy, cæ mÉu kh«ng thÓ s¶n sinh ra s©u ®éc m¹nh.",3,". Ph©n lo¹i/gufenlei","Tr­íc/gu","§ãng/no")
end

function no()
end