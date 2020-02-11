--File name:laborday_head.lua
--Describe:ÀÍ¶¯½Ú»î¶¯½Å±¾Í·ÎÄ¼ş
--Create Date:2006-4-3
--Author:yanjun
Include("\\script\\lib\\string.lua");
--È«¾Ö³£Á¿
FALSE = 0;	--ÏàĞÅ¶¨ÒåÕâÑùµÄ³£Á¿»áÊ¹´úÂëÈİÒ×Àí½âÒ»µã°É
TRUE = 1;

tNpcName = {
		"Nhµ bu«n Tô B¶o Trai",
		"¤ng chñ Tô B¶o Trai",
		"S¸ch c«ng lao Tô B¶o Trai",
		};

tNumTab = {	--Òª²»ÒªÓÃ´óĞ´ÄØ£¿Ò¼·¡ÈşËÁÎéÂ½Æâ°ÆéN
		"ThËp",
		"chİn",
		"t¸m",
		"b¶y",
		"s¸u",
		"Ngò ",
		"bèn",
		"ba",
		"hai",
		"mét",
		};

ItemTab = {
	{2,1,322,1,"C¸nh A Tu La"},--1
	{2,1,26,20,"¸m Yªn"},--2
	{2,1,82,1,"Quy Hoa Kİnh"},--3
	{2,1,156,1,"Trøng B¹ch §iªu"},--4
	{2,1,314,1,"B¹ch L©n"},--5
	{2,1,170,20,"B¹ch Ng­ L©n"},--6
	{2,1,93,20,"Vßng B¹ch Ngäc"},--7
	{2,1,81,20,"B¹ch V©n b«i"},--8
	{2,1,40,20,"Th­¬ng g·y"},--9
	{2,1,29,20,"B¶o B×nh"},--10
	{2,1,326,1,"Bİch Ngäc giíi chØ"},--11
	{2,1,18,1,"C¸nh d¬i"},--12
	{2,1,46,20,"Bİnh Méc Bµi"},--13
	{2,1,303,20,"G¨ng tay"},--14
	{2,1,299,20,"Tµn kiÕm"},--15
	{2,1,301,20,"Tµn th­¬ng"},--16
	{2,1,166,20,"da Th­¬ng Viªn"},--17
	{2,1,43,20,"Th¶o hµi"},--18
	{2,1,55,20,"B×nh trµ"},--19
	{2,1,288,20,"Tr­êng ®ao"},--20
	{2,1,193,1,"Tranh M¹c Háa DiÖm"},--21
	{2,1,189,1,"Tranh S¾c Yªn Hoa"},--22
	{2,1,320,1,"Xi Háa Tr­êng Ên"},--23
	{2,1,169,20,"Xi Háa c«n"},--24
	{2,1,282,20,"Xi Háa MËt Tİn"},--25
	{2,1,321,1,"Xi Háa Th¸nh Ên"},--26
	{2,1,313,1,"Xi Háa Ên"},--27
	{2,1,191,1,"Xİch M¹c Háa DiÖm"},--28
	{2,1,6,20,"No·n trïng"},--29
	{2,1,317,1,"Th« bè Tr­êng Bµo"},--30
	{2,1,295,20,"§¹i Cang ®ao"},--31
	{2,1,67,20,"§¹i Tèng ®Şa chİ"},--32
	{2,1,312,1,"§¹i ThiÕt Ba"},--33
	{2,1,297,20,"Da voi"},--34
	{2,1,330,1,"§¹i Tu Viªn Kİnh"},--35
	{2,1,21,20,"Bao ®ao"},--36
	{2,1,59,20,"§inh Méc Bµi"},--37
	{2,1,73,20,"§inh Ba"},--38
	{2,1,100,1,"§«ng L¨ng"},--39
	{2,1,162,20,"D·i cãc"},--40
	{2,1,176,20,"§éc Phong thİch"},--41
	{2,1,324,1,"§oµn Thõa ¢n thñ th­"},--42
	{2,1,161,20,"Ng¹c vÜ cèt"},--43
	{2,1,180,1,"Ng¹c Ng­ Nh·n CÇu"},--44
	{2,1,13,20,"Tæ ong"},--45
	{2,1,304,20,"PhËt Kinh"},--46
	{2,1,302,20,"Phï Ên"},--47
	{2,1,308,1,"Hñ Cèt"},--48
	{2,1,315,1,"L­¬ng kh«"},--49
	{2,1,327,1,"D©y thĞp"},--50
	{2,1,70,20,"Canh Méc Bµi"},--51
	{2,1,56,10,"C«ng V¨n"},--52
	{2,1,63,20,"Mãc C©u"},--53
	{2,1,290,20,"Tranh ch÷"},--54
	{2,1,160,1,"Qu¸i dŞ th¹ch"},--55
	{2,1,34,20,"Quan phôc"},--56
	{2,1,92,20,"Quû Hån"},--57
	{2,1,179,1,"Quû §Çu Tr­îng"},--58
	{2,1,32,1,"Hång Tinh"},--59
	{2,1,300,20,"Tö ®µn"},--60
	{2,1,171,20,"Hång ng­ l©n"},--61
	{2,1,16,20,"HÇu Nhi Qu¶"},--62
	{2,1,155,20,"L«ng c¸o"},--63
	{2,1,104,1,"Hæ phï"},--64
	{2,1,292,20,"Da hæ"},--65
	{2,1,19,20,"Hæ vÜ"},--66
	{2,1,84,1,"Hæ Ph¸ch"},--67
	{2,1,284,20,"Hé Ph¸p LÖnh Bµi"},--68
	{2,1,90,1,"NhÉn Hé PhËt"},--69
	{2,1,310,1,"Hoa Ban Hå §iÖp"},--70
	{2,1,99,1,"HuyÔn Quang"},--71
	{2,1,107,1,"Hoµng §Õ Néi Kinh"},--72
	{2,1,48,1,"§u«i Hæ vµng"},--73
	{2,1,69,20,"Hoµng Kim Ban ChØ"},--74
	{2,1,318,1,"Cån"},--75
	{2,1,178,10,"Háa ¶nh ThÇn ®ao"},--76
	{2,1,319,1,"C¸nh Phông Hoµng"},--77
	{2,1,36,20,"Gia Ph¸p bæng"},--78
	{2,1,272,20,"X¸c gi¸p trïng"},--79
	{2,1,177,20,"Gi¸p x¸c phiÕn"},--80
	{2,1,25,20,"Gi¸p Méc Bµi"},--81
	{2,1,80,20,"KiÕm Hån"},--82
	{2,1,41,20,"Kim Thoa"},--83
	{2,1,79,1,"Kim Xøng Xµ"},--84
	{2,1,86,1,"Kim Cang"},--85
	{2,1,329,1,"§Çu l©u KhÈn Na La"},--86
	{2,1,44,20,"Töu B«i"},--87
	{2,1,85,20,"Quı Méc Bµi"},--88
	{2,1,192,1,"Lam M¹c Háa DiÖm"},--89
	{2,1,190,1,"Lam S¾c Yªn Hoa"},--90
	{2,1,37,1,"Lang Hån"},--91
	{2,1,5,20,"L«ng sãi"},--92
	{2,1,187,10,"Linh §Şch"},--93
	{2,1,184,10,"Linh Qu¶"},--94
	{2,1,186,10,"Linh CÇm"},--95
	{2,1,185,10,"Linh T¶n"},--96
	{2,1,183,10,"Linh Tiªu"},--97
	{2,1,74,1,"Bao tay Da h­¬u"},--98
	{2,1,62,20,"Lôc Ph¸ch"},--99
	{2,1,91,1,"Lôc Trô"},--100
	{2,1,287,20,"Mao Ng­u b×"},--101
	{2,1,311,1,"Minh Háa Phï"},--102
	{2,1,323,1,"§Çu l©u Ma H« La Ca"},--103
	{2,1,76,20,"MÉu §¬n"},--104
	{2,1,31,20,"Méc Thñ"},--105
	{2,1,75,20,"Môc L«i V¨n §ao"},--106
	{2,1,28,20,"Trøng chim"},--107
	{2,1,65,20,"BÇu r­îu da dª"},--108
	{2,1,279,20,"Ch×a khãa s¾t"},--109
	{2,1,278,20,"Ch×a khãa ®ång"},--110
	{2,1,280,20,"Ch×a khãa b¹c"},--111
	{2,1,172,1,"D¹ §ao"},--112
	{2,1,154,1,"Ngäc Khİ"},--113
	{2,1,157,20,"Cung"},--114
	{2,1,106,10,"V¶y Kú L©n"},--115
	{2,1,17,20,"Thanh Kim"},--116
	{2,1,102,1,"Nh©n §å Phñ"},--117
	{2,1,83,20,"Nh©m Méc Bµi"},--118
	{2,1,195,1,"S¸t Thñ LÖnh"},--119
	{2,1,97,20,"Th­¬ng Hµn luËn"},--120
	{2,1,38,20,"Hµng hãa"},--121
	{2,1,8,1,"L«ng sãi th­îng ®¼ng"},--122
	{2,1,14,1,"Nanh heo th­îng h¹ng"},--123
	{2,1,35,20,"B¸nh n­íng"},--124
	{2,1,12,20,"Thiªu töu"},--125
	{2,1,194,1,"ThÇn bİ Yªn Hoa"},--126
	{2,1,181,1,"ThÇn bİ phñ"},--127
	{2,1,182,1,"KiÕm thÇn bİ"},--128
	{2,1,49,20,"ThÇn Ma chİ"},--129
	{2,1,298,20,"Thuèc næ"},--130
	{2,1,276,20,"MÇm Thùc nh©n th¶o"},--131
	{2,1,50,20,"Thñ Cèt"},--132
	{2,1,57,20,"Hép trang søc"},--133
	{2,1,24,20,"S­u ThÇn Kı"},--134
	{2,1,293,20,"To¸i cèt"},--135
	{2,1,316,1,"To¸i th¹ch"},--136
	{2,1,168,20,"Ng©n th­¬ng háng"},--137
	{2,1,101,1,"MÆt n¹ Thiªn V­¬ng"},--138
	{2,1,158,20,"M¶nh b¶n ®å Thiªn ¢m gi¸o"},--139
	{2,1,159,20,"Thiªn ¢m MËt Tİn"},--140
	{2,1,71,20,"ThiÕt B¸t Qu¸i"},--141
	{2,1,10,20,"ThiÕt Ban ChØ"},--142
	{2,1,47,20,"ThiÕt Xoa"},--143
	{2,1,61,20,"D©y xİch"},--144
	{2,1,20,20,"ThiÕt Th­¬ng §Çu"},--145
	{2,1,30,20,"§ång kiÕm"},--146
	{2,1,42,20,"MiÕng ®ång"},--147
	{2,1,3,20,"R¨ng sãi"},--148
	{2,1,4,1,"Thè Nhi Qu¶"},--149
	{2,1,2,20,"§u«i thá"},--150
	{2,1,23,20,"Thèi Cèt"},--151
	{2,1,305,20,"§µ La tr­îng"},--152
	{2,1,103,1,"B×nh ¤n dŞch"},--153
	{2,1,274,20,"C¸nh muçi"},--154
	{2,1,9,20,"VÊn Lé th¹ch"},--155
	{2,1,273,20,"Ch©n rÕt"},--156
	{2,1,105,1,"Vâ Kinh Tæng YÕu"},--157
	{2,1,173,20,"Vâ sÜ ®ao"},--158
	{2,1,175,20,"MÆt n¹ Vâ sÜ"},--159
	{2,1,174,20,"Vâ sÜ yªu ®¸i"},--160
	{2,1,64,20,"MËu Méc Bµi"},--161
	{2,1,58,20,"C¸nh d¬i"},--162
	{2,1,89,20,"Tª Ng­u Cung"},--163
	{2,1,98,20,"Khª S¬n chİ"},--164
	{2,1,277,20,"§u«i §éc tİch"},--165
	{2,1,309,1,"TiÓu §éc Nang"},--166
	{2,1,289,20,"Kh¨n tay"},--167
	{2,1,163,20,"H¹t Ch©m"},--168
	{2,1,94,20,"Tµ PhËt Ban ChØ"},--169
	{2,1,77,20,"T©n Méc Bµi"},--170
	{2,1,296,20,"R¨ng Tinh Tinh"},--171
	{2,1,15,20,"GÊm lam"},--172
	{2,1,78,1,"Hïng V¨n"},--173
	{2,1,54,20,"GÊm vµng"},--174
	{2,1,11,20,"Tó hoa hµi"},--175
	{2,1,95,1,"TuyÕt Hoa Giíi C¬"},--176
	{2,1,22,20,"TuyÕt Tinh"},--177
	{2,1,45,20,"TuyÕt Ph¸ch"},--178
	{2,1,286,20,"HuyÕt bao"},--179
	{2,1,307,1,"HuyÕt L©n"},--180
	{2,1,285,20,"HuyÕt Nha vò"},--181
	{2,1,306,1,"Hép trang ®iÓm"},--182
	{2,1,60,20,"BÇu r­îu da dª"},--183
	{2,1,7,20,"Nanh heo rõng"},--184
	{2,1,39,1,"D¹ Minh Ch©u"},--185
	{2,1,328,1,"Trµng h¹t"},--186
	{2,1,331,1,"NhÊt D­¬ng ChØ Tµn ch­¬ng 2"},--187
	{2,1,53,20,"Di T¾c Chung"},--188
	{2,1,33,20,"Êt Méc Bµi"},--189
	{2,1,66,20,"DÜ Méc Bµi"},--190
	{2,1,164,20,"DŞ Téc Qu¶i Liªn"},--191
	{2,1,165,1,"DŞ Téc b× ngoa"},--192
	{2,1,27,20,"¢m Ph¸ch"},--193
	{2,1,294,20,"¢m d­¬ng kİnh"},--194
	{2,1,167,20,"Ng©n Hå ®¬n"},--195
	{2,1,72,1,"Ên Th¹ch"},--196
	{2,1,51,20,"U Hån"},--197
	{2,1,291,20,"Vò nhung"},--198
	{2,1,88,20,"B×nh Ngäc"},--199
	{2,1,87,20,"Ngäc Nh­ ı"},--200
	{2,1,68,20,"Ch©m cøu ®ång nh©n"},--201
	{2,1,52,20,"Tr·m Töu"},--202
	{2,1,96,20,"ChØ Nam Ng­"},--203
}
g_TotalItemNum = getn(ItemTab);

PrizeTab = {	--½±ÀøÄÚÈİ
	{"§iÓm kinh nghiÖm vµ danh väng.",5000,5},	--EXP5000	ÉùÍû5
	{"§iÓm kinh nghiÖm, danh väng vµ 1 QuyÓn mËt tŞch.",50000,10,{{1,50},{2,100}}},	--EXP50000	ÉùÍû10	Ëæ»úÒ»±¾ÃØ¼®
	{"§iÓm kinh nghiÖm, danh väng, 1 QuyÓn mËt tŞch vµ Thiªn th¹ch.",200000,10,{{1,40},{2,80},{3,100}},3},	--EXP200000	ÉùÍû20	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú3¸ö
	{"§iÓm kinh nghiÖm, danh väng, 1 QuyÓn mËt tŞch vµ Thiªn th¹ch.",1000000,30,{{1,15},{2,30},{3,60},{4,80},{5,100}},3},	--EXP1000000	ÉùÍû30	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú3¸ö
	{"§iÓm kinh nghiÖm, danh väng, 1 QuyÓn mËt tŞch vµ Thiªn th¹ch.",3000000,50,{{3,20},{4,40},{5,60},{6,80},{7,90},{8,100}},8},	--EXP3000000	ÉùÍû50	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú8¸ö
	{"§iÓm kinh nghiÖm, danh väng, 1 QuyÓn mËt tŞch vµ Thiªn th¹ch.",7000000,100,{{6,20},{7,50},{8,80},{9,100}},15},	--EXP7000000	ÉùÍû100	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú15¸ö
	{"§iÓm kinh nghiÖm, danh väng, 1 QuyÓn mËt tŞch vµ Thiªn th¹ch.",15000000,150,{{6,20},{7,50},{8,80},{9,100}},30},	--EXP15000000	ÉùÍû150	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú30¸ö
	{"§iÓm kinh nghiÖm, danh väng, Thiªn th¹ch, cùc phÈm mËt tŞch vµ nãn cùc phÈm.",20000000,200,{{6,20},{7,50},{8,80},{9,100}},40,1},	--EXP20000000	ÉùÍû200	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú40¸ö	¹Ì¶¨ÊôĞÔÃ±×Ó
	{"§iÓm kinh nghiÖm, danh väng, Thiªn th¹ch, cùc phÈm mËt tŞch vµ quÇn cùc phÈm.",30000000,300,{{7,35},{8,70},{9,100}},50,2},	--EXP30000000	ÉùÍû300	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú50¸ö	¹Ì¶¨ÊôĞÔ¿ã×Ó
	{"§iÓm kinh nghiÖm, danh väng, Thiªn th¹ch, cùc phÈm mËt tŞch vµ vò khİ cùc phÈm.",50000000,500,{{7,30},{8,60},{9,80},{10,100}},60,3},	--EXP50000000	ÉùÍû500	Ëæ»úÒ»±¾ÃØ¼®	ÔÉÌú60¸ö	¹Ì¶¨ÊôĞÔÎäÆ÷
	};

BookTab = {
	{0,107,57,"Tô NguyÖn C«ng Phæ"},--1
	{0,107,58,"HuyÒn Th¹ch C«ng Phæ"},--2
	{0,107,59,"Kim ThiÒn Phæ"},--3
	{0,107,61,"Bæ Kim MËt tŞch"},--4
	{0,107,62,"Bæ Th¹ch MËt tŞch"},--5
	{0,107,63,"Ngò Quû MËt tŞch"},--6
	{0,107,64,"Thiªn Hµ MËt tŞch"},--7
	{0,107,65,"Tö Hµ MËt tŞch"},--8
	{0,107,66,"Chiªm y phæ"},--9
	{0,107,155,"Ngò Hµnh MËt tŞch"},--10
	}

--ÈÎÎñ±äÁ¿ºÅ
LABORDAY_ITEM_BEGIN = 1877;	--¼ÇÂ¼ÉÏ½»¹ıµÄÎïÆ·
LABORDAY_ITEM2 		= 1878;
LABORDAY_ITEM3 		= 1879;
LABORDAY_ITEM4 		= 1880;
LABORDAY_ITEM5 		= 1881;
LABORDAY_ITEM6 		= 1882;
LABORDAY_ITEM_END  	= 1883;

ITEMNUM = 1884; --¼ÇÂ¼Íæ¼ÒÉÏ½»µÄ²ÄÁÏµÄÊıÁ¿
GET_PRIZE = 1885;	--¼ÇÂ¼Íæ¼ÒÁìÈ¡½±ÀøµÄÇé¿ö¡£1×Ö½Ú¼ÇÂ¼ÁìÈ¡ÈÕÆÚ£¬2×Ö½Ú¼ÇÂ¼ËÄ½±ÁìÈ¡´ÎÊı£¬3×Ö½Ú¼ÇÂ¼Îå½±ÁìÈ¡´ÎÊı£¬4×Ö½Ú¼ÇÂ¼Áù½±ÁìÈ¡´ÎÊı
GET_PRIZE2 = 1886 	--¼ÇÂ¼Íæ¼ÒÁìÈ¡½±ÀøµÄÇé¿ö¡£1×Ö½Ú¼ÇÂ¼Æß½±ÁìÈ¡´ÎÊı£¬2×Ö½Ú¼ÇÂ¼°Ë½±ÁìÈ¡´ÎÊı£¬3×Ö½Ú¼ÇÂ¼¾Å½±ÁìÈ¡´ÎÊı£¬4×Ö½Ú¼ÇÂ¼Ê®½±ÁìÈ¡´ÎÊı
BIG_PRIZE = 1887;	--¼ÇÂ¼Íæ¼ÒÁìÈ¡´ó½±µÄÇé¿ö¡£1×Ö½ÚÊÇÒ»½±£¬2×Ö½ÚÊÇ¶ş½±£¬3×Ö½ÚÊÇ3½±£¬4×Ö½ÚÊÇÃâ´òÈÅ±ê¼Ç
TSK_LABORDAY_WEEK = 1356; --¼ÇÂ¼ÖÜµÄĞòÊı È¡´úÉÏÃæ1885±äÁ¿µÄµÚÒ»×Ö½Ú

tPrizeMapByte = {	--½±ÀøÀàĞÍÓëÈÎÎñ±äÁ¿×Ö½ÚµÄ¶ÔÓ¦¹ØÏµ
			{GET_PRIZE2,4},	--ÀàĞÍ1¶ÔÓ¦GET_PRIZE2µÄµÚ4¸ö×Ö½Ú(Ê®½±)
			{GET_PRIZE2,3},	--ÀàĞÍ2¶ÔÓ¦GET_PRIZE2µÄµÚ3¸ö×Ö½Ú(¾Å½±)
			{GET_PRIZE2,2},	--ÀàĞÍ3¶ÔÓ¦GET_PRIZE2µÄµÚ2¸ö×Ö½Ú(°Ë½±)
			{GET_PRIZE2,1},	--ÀàĞÍ4¶ÔÓ¦GET_PRIZE2µÄµÚ1¸ö×Ö½Ú(Æß½±)
			{GET_PRIZE,4},	--ÀàĞÍ5¶ÔÓ¦GET_PRIZEµÄµÚ4¸ö×Ö½Ú(Áù½±)
			{GET_PRIZE,3},	--ÀàĞÍ6¶ÔÓ¦GET_PRIZEµÄµÚ3¸ö×Ö½Ú(Îå½±)
			{GET_PRIZE,2},	--ÀàĞÍ7¶ÔÓ¦GET_PRIZEµÄµÚ2¸ö×Ö½Ú(ËÄ½±)
			{BIG_PRIZE,3},	--ÀàĞÍ8¶ÔÓ¦BIG_PRIZEµÄµÚ3¸ö×Ö½Ú(Èı½±)
			{BIG_PRIZE,2},	--ÀàĞÍ9¶ÔÓ¦BIG_PRIZEµÄµÚ2¸ö×Ö½Ú(¶ş½±)
			{BIG_PRIZE,1},	--ÀàĞÍ10¶ÔÓ¦BIG_PRIZEµÄµÚ1¸ö×Ö½Ú(Ò»½±)
			};
			
tPrizeJifen = { --½±Àø¶ÔÓ¦µÄ´ÎÊı£¨Ã¿ÖÜ£©ºÍ»»È¡µÄ»ı·Ö
	{1,35},{1,30},{1,22},{1,20},{1,18},{1,15},{1,12},{1,10},{1,8},{1,5}
};			
--=============================================================================================
--==================================Ïà¹Øº¯Êı===================================================
--ÅĞ¶Ïµ±Ç°µÄ½ÚÈÕ×´Ì¬
function Get_Laborday_State()	
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < 20060428 then
		return 0;	--»î¶¯Î´¿ªÊ¼
	elseif nDate > 20060514 then
		return 3;	--Áì½±½ØÖ¹
	elseif nDate > 20060507 then
	 	return 2;	--½ØÖ¹²ÄÁÏÊÕ¼¯
	else 
		return 1;	--Õı´¦ÓÚ»î¶¯ÆÚ¼ä£¨¼ÈÄÜÉÏ½»ÎïÆ·Ò²ÄÜ»»È¡½±Àø£©
	end; 
end;
--µÃµ½Íæ¼ÒÉíÉÏÄ³ÑùÎïÆ·µÄÊıÁ¿
function Get_Item_Count(nItemNo)
	return GetItemCount(ItemTab[nItemNo][1],ItemTab[nItemNo][2],ItemTab[nItemNo][3]);
end;
--ÉÏ½»Ò»ÑùÎïÆ·¡£ÎïÆ·¶ÔÓ¦Î»ÖÃ1,ÉÏ½»ÎïÆ·¼ÆÊı¼Ó1
function Hand_In_Item(nItemNo)
	local nGroup = floor((nItemNo-1)/30);
	local nBit = mod((nItemNo-1),30)+1;
	if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == 1 then	--ÒÑ½»¹ıÕâÖÖ²ÄÁÏ
		return FALSE;
	end;
	if Get_Item_Count(nItemNo) < ItemTab[nItemNo][4] then	--ÊıÁ¿²»¹»
		return FALSE;
	end;
	if DelItem(ItemTab[nItemNo][1],ItemTab[nItemNo][2],ItemTab[nItemNo][3],ItemTab[nItemNo][4]) == 1 then
		SetTask(LABORDAY_ITEM_BEGIN+nGroup,SetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit,1));
		SetTask(ITEMNUM,GetTask(ITEMNUM)+1);
		return TRUE;
	else
		return FALSE;
	end;
end;
--ÁìÈ¡½±ÀøºóÇå³ıËùÓĞÉÏ½»Çé¿öµÄ×´Ì¬
function Clear_HandIn_State()
	for i=LABORDAY_ITEM_BEGIN,LABORDAY_ITEM_END do
		SetTask(i,0);
	end;
	SetTask(ITEMNUM,0);
end;
--µÃµ½ËùÉÏ½»µÄ²ÄÁÏµÄ×Ö·û´®Table
function Get_Info_Table(nType)
	local nGroup = 0;
	local nBit = 0;
	local sContent = "";
	local nTab = 0;
	for i=1,g_TotalItemNum do
		nGroup = floor((i-1)/30);
		nBit = mod(i-1,30)+1;
		if mod(i,31) ~=0 or mod(i,32) ~= 0 then
			if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == nType then
				nTab = nTab + 1;
				if mod(nTab,50) == 0 then
					sContent = sContent..ItemTab[i][5].."|";
				else
					sContent = sContent..ItemTab[i][5]..", ";
				end;
			end;
		end;
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	return split(sContent,"|");
end;

--×Ô¶¨ÒåĞ´ÈÕÖ¾º¯Êı¡£µÚÒ»¸ö²ÎÊıÎªÊÂ¼şÃû£¬µÚ¶ş¸ö²ÎÊıÎªÊÂ¼şÄÚÈİ
function Write_Log(Event,Content)	
	WriteLog("["..Event.."]:"..GetName()..Content);
end;

--µÃµ½Íæ¼ÒµÄĞÔ±ğ×Ö·û´®¡£´Ó\script\task\world\task_head.luaÀïÃæcopy¹ıÀ´µÄ¡£
--Copyright¡ò2005¡@peres
function GetPlayerSex()	
	local mySex -- ÓÃÒÔÏÔÊ¾ÈËÎïĞÔ±ğµÄ×Ö·û
	if (GetSex() == 1) then
		mySex = "ThiÕu hiÖp";
	elseif (GetSex() == 2) then
		mySex = "C« n­¬ng";
	end;
	return mySex;
end;

--ÉèÖÃÄ³ÈÎÎñ±äÁ¿µÄÄ³Ò»×Ö½ÚµÄÖµ
function Set_Task_Byte(TaskID,Byte,Value)	
	SetTask(TaskID,SetByte(GetTask(TaskID),Byte,Value));
	return GetTask(TaskID);
end;

--µÃµ½Ä³ÈÎÎñ±äÁ¿Ä³Ò»×Ö½ÚµÄÖµ
function Get_Task_Byte(TaskID,Byte)	
	return GetByte(GetTask(TaskID),Byte);
end;
--»î¶¯ÏêÏ¸ËµÃ÷¡£ÊäÈë²ÎÊıÖ¸Ã÷ÊÇÄÄÒ»¸öNPC
function knowdetail(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	Talk(1,sCmd,"<color=green>"..tNpcName[npcNo]..": <color>GÇn ®©y bæn tiÖm chuÈn bŞ thu thËp nh÷ng b¶o vËt trong giang hå, vËt thu thËp sÏ thu thËp theo nhãm víi sè l­îng kh«ng b»ng nhau. Sau khi giao nép ®ñ sè l­îng sÏ nhËn ®­îc phÇn th­ëng. Ngµi cã thÓ nhËn lÊy 1 quyÓn s¸ch c«ng lao Tô B¶o Trai, cã ghi râ danh môc vËt thu thËp, phÇn th­ëng cã thÓ nhËn lÊy. H·y ®Õn T­¬ng D­¬ng, D­¬ng Ch©u gÆp ¤ng chñ Tô B¶o Trai ®Ó ®æi phÇn th­ëng. ");
end;
--½éÉÜ»»È¡½±Àø¹æÔò¡£ÊäÈë²ÎÊıÍ¬ÉÏ
function knowrule(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	local selTab = {
			"Trang kÕ/#nextrule1("..npcNo..")",
			"Quay l¹i ®èi tho¹i chİnh./"..sCmd,
			"KÕt thóc ®èi tho¹i/nothing",
			};
	local sContent = "";
	local rule10 = "<color=green>PhÇn th­ëng 10<color>: Nép 7 lo¹i cã thÓ ®æi "..tPrizeJifen[10][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[10][1].." lÇn<enter>";
	local rule9 = "<color=green>PhÇn th­ëng 9<color>: Nép 1-7 lo¹i cã thÓ ®æi "..tPrizeJifen[9][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[9][1].." lÇn<enter>";
	local rule8 = "<color=green>PhÇn th­ëng 8<color>: Nép 31 lo¹i cã thÓ ®æi "..tPrizeJifen[8][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[8][1].." lÇn<enter>";
	local rule7 = "<color=green>PhÇn th­ëng 7<color>: Nép 60 lo¹i cã thÓ ®æi "..tPrizeJifen[7][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[7][1].." lÇn<enter>";
	local rule6 = "<color=green>PhÇn th­ëng 6<color>: Nép 90 lo¹i cã thÓ ®æi "..tPrizeJifen[6][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[6][1].." lÇn";
	sContent = rule10..rule9..rule8..rule7..rule6;
	Say(sContent,getn(selTab),selTab);
end;
function nextrule1(npcNo)
	local sCmd = "main";
	if npcNo == 3 then
		sCmd = "OnUse";
	end;
	local selTab = {
			"Trang tr­íc/#knowrule("..npcNo..")",
			"Quay l¹i ®èi tho¹i chİnh./"..sCmd,
			"KÕt thóc ®èi tho¹i/nothing",
			};
	local rule5 = "<color=green>PhÇn th­ëng 5<color>: Nép 106 lo¹i cã thÓ ®æi "..tPrizeJifen[5][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[5][1].." lÇn<enter>";
	local rule4 = "<color=green>PhÇn th­ëng 4<color>: Nép 125 lo¹i cã thÓ ®æi "..tPrizeJifen[4][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[4][1].." lÇn<enter>";
	local rule3 = "<color=green>PhÇn th­ëng 3<color>: Nép 144 lo¹i cã thÓ ®æi "..tPrizeJifen[3][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[3][1].." lÇn<enter>";
	local rule2 = "<color=green>PhÇn th­ëng 2<color>: Nép 185 lo¹i cã thÓ ®æi "..tPrizeJifen[2][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[2][1].." lÇn<enter>";
	local rule1 = "<color=green>PhÇn th­ëng 1<color>: Nép 203 lo¹i cã thÓ ®æi "..tPrizeJifen[1][2].." ®iÓm tİch lòy, mçi tuÇn cã thÓ ®æi "..tPrizeJifen[1][1].." lÇn";	
	sContent = rule5..rule4..rule3..rule2..rule1;
	Say(sContent,getn(selTab),selTab);
end;

--²éÑ¯ÉÏ½»ÊÕ¼¯Æ·Çé¿ö¡£ÊäÈë²ÎÊıÍ¬ÉÏ
function queryinfor(npcNo)
	local selTab = {
				"Tra xem vËt phÈm ®· giao./#seemoreinfo("..npcNo..",1)",
				"Tra xem nh÷ng vËt phÈm ch­a giao nép./#seemoreinfo("..npcNo..",0)",
				"Tra theo sè hiÖu vËt phÈm./requestno",
				"Trang tr­íc./main",
				"KÕt thóc ®èi tho¹i/nothing",
				}
	Say("<color=green>"..tNpcName[npcNo]..":<color> B¹n ®· giao nép"..g_TotalItemNum.."<color=yellow>"..GetTask(ITEMNUM).."<color> lo¹i vËt thu thËp.",getn(selTab),selTab);
end;

function seemoreinfo(npcNo,nType)
	local nItemNum = GetTask(ITEMNUM);
	local tInfoTab = {};
	if nType == 1 then
		if nItemNum == 0 then
			Talk(1,"main","<color=green>"..tNpcName[npcNo]..":<color> B¹n vÉn ch­a giao nép vËt phÈm.");
			return FALSE;
		end;
	end;
	tInfoTab = Get_Info_Table(nType);
	local nSize = getn(tInfoTab);
	nextpage(1,nSize,nType);
end;

function nextpage(nPageNo,nSize,nType)
	local nItemNum = GetTask(ITEMNUM);
	local tInfoTab = {};
	if nPageNo > nSize then
		main();
		return 1;
	end;
	nPageNo = nPageNo + 1;
	tInfoTab = Get_Info_Table(nType);
	Talk(1,"#nextpage("..nPageNo..","..nSize..","..nType..")",tInfoTab[nPageNo-1]);	--µİ¹é
end;
--ÒªÇóÊäÈëÊı×Ö
function requestno()
	AskClientForString("searchbyno","",1,3,"H·y nhËp sè hiÖu vËt phÈm:");
end;
--AskClientForStringµÄ»Øµ÷º¯Êı
function searchbyno(sItemNo)
	local nItemNo = tonumber(sItemNo);	
	if not nItemNo or nItemNo <= 0 or nItemNo > g_TotalItemNum then
		Talk(1,"main","<color=green>Gîi ı<color>: H·y nhËp sè <color=yellow>tõ 1 ®Õn"..g_TotalItemNum.."<color> (sè trung gian)");
		return FALSE;
	end;	
	nItemNo = nItemNo - 1;
	local nGroup = 0;
	local nBit = 0;
	nGroup = floor(nItemNo/30);
	nBit = mod(nItemNo,30)+1;
	if GetBit(GetTask(LABORDAY_ITEM_BEGIN+nGroup),nBit) == 1 then
		Talk(1,"main","VËt phÈm b¹n muèn xem lµ: <color=green>"..ItemTab[nGroup*30+nBit][5].."<color>. Tr¹ng th¸i: <color=yellow>§· giao nép<color>.");
		return 1;
	else
		Talk(1,"main","VËt phÈm b¹n muèn xem lµ: <color=green>"..ItemTab[nGroup*30+nBit][5].."<color>. Tr¹ng th¸i: <color=red>Ch­a giao nép<color>.");
		return 1;
	end;
end;
--ÁìÈ¡¡¶¾Û±¦Õ«¹¦ÀÍ²á¡·
function getbook(npcNo)
	if GetItemCount(2,0,391) >=1 then
		Talk(1,"","<color=green>"..tNpcName[npcNo]..":<color> VŞ "..GetPlayerSex().."cã s¸ch c«ng lao Tô B¶o Trai sao?");
		return FALSE;
	end;
	if AddItem(2,0,391,1) == 1 then
		Msg2Player("B¹n nhËn ®­îc s¸ch c«ng lao Tô B¶o Trai.");
	end;
end;
--°ä½±
function giveprize(nPrizeType)
	local sContent = "Ng­¬i ®æi ®­îc <color=yellow>";
	ModifyExp(PrizeTab[nPrizeType][2]);
	sContent = sContent..PrizeTab[nPrizeType][2].." ®iÓm kinh nghiÖm,";
	Msg2Player("B¹n nhËn ®­îc "..PrizeTab[nPrizeType][2].." ®iÓm kinh nghiÖm");
	ModifyReputation(PrizeTab[nPrizeType][3],0);
	sContent = sContent..PrizeTab[nPrizeType][3].." ®iÓm danh väng, ";
	Msg2Player("B¹n nhËn ®­îc "..PrizeTab[nPrizeType][3].." ®iÓm danh väng");
	if PrizeTab[nPrizeType][4] then
		local nBookID = giverandombook(PrizeTab[nPrizeType][4]);
		sContent = sContent..BookTab[nBookID][4]..", ";
		Msg2Player("B¹n nhËn ®­îc "..BookTab[nBookID][4]);
	end;
	if PrizeTab[nPrizeType][5] then
		AddItem(2,2,8,PrizeTab[nPrizeType][5]);
		sContent = sContent..PrizeTab[nPrizeType][5].."Thiªn th¹ch,";
		Msg2Player("B¹n nhËn ®­îc "..PrizeTab[nPrizeType][5].."Thiªn th¹ch");
	end;
	if PrizeTab[nPrizeType][6] then
		giverandomequipment(PrizeTab[nPrizeType][6]);
		sContent = sContent.."1 mãn trang bŞ.";
		Msg2Player("B¹n nhËn ®­îc 1 mãn trang bŞ.");
	end;
	sContent = strsub(sContent,1,strlen(sContent)-2);
	sContent = sContent.."<color>";
	Talk(1,"",sContent);
	if nPrizeType >= 1 and nPrizeType <= 7 then
		Talk(1,"","Chóc mõng, ng­¬i ®· nhËn ®­îc gi¶i"..tNumTab[nPrizeType]..". Chó ı, <color=red>Trong thêi gian diÔn ra ho¹t ®éng mçi ngµy, mçi nh©n vËt chØ cã thÓ nhËn 3 gi¶i th­ëng"..tNumTab[nPrizeType].."<color>. §©y lµ lÇn thø <color=yellow>"..Get_Task_Byte(tPrizeMapByte[nPrizeType][1],tPrizeMapByte[nPrizeType][2]).."<color> nhËn"..tNumTab[nPrizeType].."gi¶i th­ëng.");
	end
	if nPrizeType == 8 then
		Talk(1,"","Chóc mõng, b¹n nhËn ®­îc gi¶i ba. Chó ı, <color=red>trong thêi gian diÔn ra ho¹t ®éng mçi nh©n vËt tèi ®a cã thÓ nhËn ®­îc 3 gi¶i ba<color>, b¹n ®· nhËn <color=yellow>"..GetByte(GetTask(BIG_PRIZE),3).."<color> lÇn gi¶i ba.");
	elseif nPrizeType == 9 then
		Talk(1,"","Chóc mõng, b¹n nhËn ®­îc gi¶i hai!");
	elseif nPrizeType == 10 then
		Talk(1,"","Chóc mõng, b¹n nhËn ®­îc gi¶i nhÊt!");
		local sSex = "¶nh/chØ";
		if GetSex() == 1 then
			sSex = "Tha";
		elseif GetSex() == 2 then
			sSex = "Ng­êi ch¬i";
		end;
		AddGlobalNews(GetName().." ®· nhËn ®­îc gi¶i nhÊt, xin chóc mõng!"..sSex.."!");
		Msg2SubWorld(GetName().." ®· nhËn ®­îc gi¶i nhÊt, xin chóc mõng!"..sSex.."!");
	end;
	Write_Log("§æi phÇn th­ëng tÕt lao ®éng",". Lo¹i phÇn th­ëng:"..nPrizeType);
end;
--Ëæ»ú¸øÒ»±¾ÃØ¼®¡£ÃØ¼®ÀàĞÍºÍ¸ÅÂÊÓÉÊäÈë²ÎÊı¾ö¶¨
function giverandombook(tBookInfo)
	local nTabSize = getn(tBookInfo);
	local nRandomNum = random(1,100);
	if nRandomNum <= tBookInfo[1][2] then
		nResult = 1;
	elseif nRandomNum > tBookInfo[nTabSize-1][2] then
		nResult = nTabSize;
	else
		for i=1,nTabSize-1 do
			if nRandomNum > tBookInfo[i][2] and nRandomNum <= tBookInfo[i+1][2] then
				nResult = i+1;
			end;
		end;
	end;
	AddItem(BookTab[tBookInfo[nResult][1]][1],BookTab[tBookInfo[nResult][1]][2],BookTab[tBookInfo[nResult][1]][3],1,1);
	return tBookInfo[nResult][1];
end;
--¸ø×°±¸
function giverandomequipment(nType)
	if nType == 1 then
		giverandomhat();
	elseif nType == 2 then
		giverandomtrousers();
	elseif nType == 3 then
		giverandomweapon();
	end;
end;
--¸øËæ»úÃ±×Ó
function giverandomhat()
	local HatTab = {
		{0,103,17},	
		{0,103,18},
		{0,103,35},
		{0,103,36},
		{0,103,53},
		{0,103,54},
		{0,103,71},
		{0,103,72},
		};
	local nRandomNum = random(1,getn(HatTab));
	if AddItem(HatTab[nRandomNum][1],HatTab[nRandomNum][2],HatTab[nRandomNum][3],1,1,2,random(131,132),2,102,-1,-1) == 1 then
		Write_Log("§æi phÇn th­ëng tÕt lao ®éng","NhËn ®­îc nãn, ID lµ:"..nRandomNum);
	end;
end;
--¸øËæ»ú¿ã×Ó
function giverandomtrousers()
	local TrousersTab = {
		{0,101,17},
		{0,101,18},
		{0,101,35},
		{0,101,36},
		{0,101,53},
		{0,101,54},
		{0,101,71},
		{0,101,72},
		};
	local nRandomNum = random(1,getn(TrousersTab));
	if AddItem(TrousersTab[nRandomNum][1],TrousersTab[nRandomNum][2],TrousersTab[nRandomNum][3],1,1,3,random(131,132),2,102,-1,-1) == 1 then
		Write_Log("§æi phÇn th­ëng tÕt lao ®éng","NhËn ®­îc quÇn, ID lµ:"..nRandomNum);
	end;
end;
--¸øËæ»úÎäÆ÷
function giverandomweapon()
	local WeaponTab = {
		{0,0,13},	--1ÊÖ
		{0,2,26},	--2½£
		{0,5,39},	--3¹÷
		{0,1,52},	--4°µÆ÷
		{0,3,63},	--5µ¥µ¶
		{0,10,74},	--6ÇÙ
		{0,9,85},	--7±Ê
		{0,8,96},	--8ÕÈ
		{0,6,107},	--9Ç¹
		{0,4,118},	--10¹­
		{0,11,11},	--11×¦
		{0,7,11},	--12Ë«µ¶
		};
	local nRandomNum = random(1,getn(WeaponTab));
	local nAttribute;
	if nRandomNum == 3 or nRandomNum == 4 or nRandomNum == 5 or nRandomNum == 7 or nRandomNum == 9 or nRandomNum == 10 or nRandomNum == 12 then
		nAttribute = 131;	--¹÷,°µÆ÷,µ¥µ¶,±Ê,Ç¹,¹­,Ë«µ¶
	elseif nRandomNum == 2 or nRandomNum == 6 or nRandomNum == 8 or nRandomNum == 11 then
		nAttribute = 132	--½£,ÇÙ,ÕÈ,×¦
	else	--ÊÖ
		nAttribute = random(131,132);
	end;
	if AddItem(WeaponTab[nRandomNum][1],WeaponTab[nRandomNum][2],WeaponTab[nRandomNum][3],1,1,3,nAttribute,3,102,2,251) == 1 then
		Write_Log("§æi phÇn th­ëng tÕt lao ®éng","NhËn ®­îc vò khİ, ID lµ:"..nRandomNum);
	end;
end;
--do nothingº¯Êı
function nothing()

end;

--=====================¹«Ôª2008Äê10ÔÂ20ÈÕĞÂ¼Ó=========================
function GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--¼ÆËãÖÜµÄĞòÊı
function GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--´¦ÀíÊ±²î
	nCurTime = nCurTime - 4*24*3600;	--¶ÔÆëµ½1970Äê1ÔÂ1ÈÕ£¨ĞÇÆÚËÄ£©ºóµÄµÚÒ»¸öÖÜÒ»Áè³¿¡£
	local nWeekSecond = 7*24*3600;	--Ò»ÖÜ¶àÉÙÃë
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--¼ÆËãÆ«ÒÆÊ±¼ä
	local nTotalTime = nCurTime - nOffset;	--¼ÆËãºóµÄ×ÜÊ±¼ä
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--¼ÆËãÖÜµÄĞòÊı
	return nWeekSeq;
end;
