--½±Àø×°±¸ÊôĞÔÅäÖÃ
--×¢Òâ£º´Ë´¦ÌîĞ´¾¡Á¿Ö»ĞÂÔö²»ĞŞ¸Ä£¬ÒòÎªÍæ¼Ò¿ÉÄÜÒÑ¾­´æÔÚÁË¸ÃÊôĞÔµÄ×°±¸¡£
--ËµÃ÷£¬1£º¸±Àà£¨×°±¸´óÀà¶¼Îª0Ê¡ÂÔ£©£¬2£ºĞ¡Àà£¬3ÊÇ·ñ¼ø¶¨£º( ÊıÁ¿¶¼Îª1Ê¡ÂÔ£»0Î´¼ø¶¨ £¬1ÒÑ¼ø¶¨£¬ 2Ê°È¡°ó¶¨ £¬3×°±¸°ó¶¨£¬ 4ÒÑ¾­°ó¶¨)£¬4-9£¨1-3µÄÄ§·¨ÊôĞÔºÍµÈ¼¶£©10£ºÎåĞĞ£¨£©£¬11£ºÃû×Ö
Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
prize_att = {}
for i = 1,7 do
	prize_att[i] = {}
end
prize_att[1] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10, 	4,	357,	4,	358,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	10, 	4,	357,	4,	361,	4,	0, 	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	5,  	4,	357,	4,	358,	4,	0,  0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	5,  	4,	357,	4,	361,	4,	0,  0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{100,	14, 	4,	333,	4,	340,	5,	341,5,	0,	"Xİch Long Bµo (nam tiªu chuÈn)"},
	{100,	32, 	4,	333,	4,	340,	5,	341,5,	0,	"L«i Ng©n Gi¸p (nam kh«i ng«)"},
	{100,	50, 	4,	333,	4,	340,	5,	341,5,	0,	"Hå C¬ Vò Y (n÷ gîi c¶m)"},
	{100,	68, 	4,	333,	4,	340,	5,	341,5,	0,	"Th¸i Hoa Th­êng (KiÒu n÷)"},
	{0,  	12, 	4,	333,	4,	65, 	6,	43,	7,	0,	"Ngò Ph­¬ng Quû Chóng (bao tay)"},
	{1,  	51, 	4,	333,	4,	65, 	6,	43,	7,	0,	"ThÊt S¸t Thiªn La (¸m khİ)"},
	{4,  	117,	4,	333,	4,	65, 	6,	43,	7,	0,	"Xi Nha (cung)"},
}
prize_att[2] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	360,	4,	361,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	10,		4,	358,	4,	361,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	5,		4,	357,	4,	358,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	5,		4,	357,	4,	361,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{101,	14,		4,	333,	4,	340,	5,	341,5,	0,	"Phi Ng­ Trang (nam tiªu chuÈn)"},
	{101,	32,		4,	333,	4,	340,	5,	341,5,	0,	"Thiªn L«i Trang (nam kh«i ng«)"},
	{101,	50,		4,	333,	4,	340,	5,	341,5,	0,	"Thiªn M· (n÷ gîi c¶m)"},
	{101,	68,		4,	333,	4,	340,	5,	341,5,	0,	"ThÇn N÷ (KiÒu n÷)"},
	{0,		12,		4,	333,	4,	67,		6,	43,	7,	0,	"Ngò Ph­¬ng Quû Chóng (bao tay)"},
	{3,		62,		4,	333,	4,	65,		6,	43,	7,	0,	"Thiªn S¸t (®ao)"},
	{11,	10,		4,	333,	4,	65,		6,	43,	7,	0,	"Ng­ng S­¬ng (tr¶o)"},
}
prize_att[3] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	358,	4,	359,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	10,		4,	358,	4,	360,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	10,		4,	357,	4,	359,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	5,		4,	358,	4,	359,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	5,		4,	358,	4,	360,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	5,		4,	357,	4,	359,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{103,	14,		4,	333,	4,	340,	5,	341,5,	0,	"Xİch Thanh Nh·n Tr¸o (nam tiªu chuÈn)"},
	{103,	32,		4,	333,	4,	340,	5,	341,5,	0,	"Ngò Quû §Çu C©n (nam kh«i ng«)"},
	{103,	50,		4,	333,	4,	340,	5,	341,5,	0,	"§o¹t Hån (n÷ gîi c¶m)"},
	{103,	68,		4,	333,	4,	340,	5,	341,5,	0,	"Thiªn Nga (KiÒu n÷)"},
	{5,		38,		4,	333,	4,	65,		6,	43,	7,	0,	"Thiªn Xµ c«n (c«n)"},
	{10,	73,		4,	333,	4,	67,		6,	43,	7,	0,	"Lôc Khëi (cÇm)"},
	{9,		84,		4,	333,	4,	65,		6,	43,	7,	0,	"Ph¸ Qu©n (bót)"},
}
prize_att[4] = {
-----------1--------------2-------------3--------4------------5--------6------------7-------8------9-----10--------------11
	{102,	10,		4,	359,	4,	360,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	10,		4,	359,	4,	361,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	10,		4,	357,	4,	360,	4,	0,	0,	0,	"MÆt Ngäc Ngäc Béi (nam)"},
	{102,	5,		4,	359,	4,	360,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	5,		4,	359,	4,	361,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	5,		4,	357,	4,	360,	4,	0,	0,	0,	"Long Diªn H­¬ng Nang (n÷)"},
	{102,	8,		4,	333,	4,	340,	5,	341,5,	0,	"§µo Hoa Ngäc Béi (nam)"},
	{102,	3,		4,	333,	4,	340,	5,	341,5,	0,	"TrÇm §µn H­¬ng Nang (n÷)"},
	{2,		25,		4,	333,	4,	67,		6,	43,	7,	0,	"Bİch HuyÕt (kiÕm)"},
	{8,		95,		4,	333,	4,	67,		6,	43,	7,	0,	"§¹i B¸t Nh· tr­îng (tr­îng)"},
	{6,		106,	4,	333,	4,	65,		6,	43,	7,	0,	"Tr­îng B¸t Xµ m©u (th­¬ng)"},
	{7,		10,		4,	333,	4,	65,		6,	43,	7,	0,	"T«i NguyÖt (song ®ao)"},
}
--¶şµÈ×°±¸:1£º¸±Àà£¨×°±¸´óÀà¶¼Îª0Ê¡ÂÔ£©£¬2£ºĞ¡Àà£¬3ÊÇ·ñ¼ø¶¨£º( ÊıÁ¿¶¼Îª1Ê¡ÂÔ£»0Î´¼ø¶¨ £¬1ÒÑ¼ø¶¨£¬ 2Ê°È¡°ó¶¨ £¬3×°±¸°ó¶¨£¬ 4ÒÑ¾­°ó¶¨)£¬4¡¢¼¸ÏîÊôĞÔ£¬5¡¢Ãû×Ö
prize_att[5] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"Thiªn Gi¸ng Bµo (nam tiªu chuÈn)"},
	{100,	18,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	2,	0,	"Thiªn Gi¸ng Bµo (nam tiªu chuÈn)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Long B¸ ¤ kim Y (nam kh«i ng«)"},
	{100,	36,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Long B¸ ¤ kim Y (nam kh«i ng«)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Phi Thiªn Th¸i Th­êng (n÷ gîi c¶m)"},
	{100,	54,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Phi Thiªn Th¸i Th­êng (n÷ gîi c¶m)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Ngò Th¸i Nghª Th­êng (KiÒu n÷)"},
	{100,	72,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Ngò Th¸i Nghª Th­êng (KiÒu n÷)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"¤ Tµm Trang (nam tiªu chuÈn)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"¤ Tµm Trang (nam tiªu chuÈn)"},
	{101,	18,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"¤ Tµm Trang (nam tiªu chuÈn)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thiªn Canh Trang (nam kh«i ng«)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thiªn Canh Trang (nam kh«i ng«)"},
	{101,	36,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thiªn Canh Trang (nam kh«i ng«)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th¸i Thanh (n÷ gîi c¶m)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th¸i Thanh (n÷ gîi c¶m)"},
	{101,	54,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Th¸i Thanh (n÷ gîi c¶m)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"XuÊt V©n (KiÒu n÷)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"XuÊt V©n (KiÒu n÷)"},
	{101,	72,	4,	3,	357,	6,	360,	6,	361,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"XuÊt V©n (KiÒu n÷)"},
	{103,	18,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Bİ ThÇn Qu¸n (nam tiªu chuÈn)"},
	{103,	36,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Di ThÇn §Çu C©n (nam kh«i ng«)"},
	{103,	54,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Chu T­íc (n÷ gîi c¶m)"},
	{103,	72,	4,	2,	371,	6,	357,	3,	360,	3,	361,	3,	0,	0,	0,	0,	0,	0,	0,	"Tr­êng Sinh (KiÒu n÷)"},
}
prize_att[6] = {
-------------1------------2-----3------4-------5-------------6--------7------------8--------9------------10-------11-----------12-------13----14-----15-----16------17----18-----19---------20
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S¬n Quû HuyÕt y (nam tiªu chuÈn)"},
	{100,	17,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S¬n Quû HuyÕt y (nam tiªu chuÈn)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"HuyÕt Hµ Quû V­¬ng Kh¶i (nam kh«i ng«)"},
	{100,	35,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"HuyÕt Hµ Quû V­¬ng Kh¶i (nam kh«i ng«)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thiªn Y (n÷ gîi c¶m)"},
	{100,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Thiªn Y (n÷ gîi c¶m)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"V« Song §Êu y (KiÒu n÷)"},
	{100,	71,	4,	3,	18,		5,	19,		5,	372,	5,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"V« Song §Êu y (KiÒu n÷)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S¸t KiÕp Trang (nam tiªu chuÈn)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S¸t KiÕp Trang (nam tiªu chuÈn)"},
	{101,	17,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"S¸t KiÕp Trang (nam tiªu chuÈn)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"HuyÕt Hµ Trang (nam kh«i ng«)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"HuyÕt Hµ Trang (nam kh«i ng«)"},
	{101,	35,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"HuyÕt Hµ Trang (nam kh«i ng«)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Hæ TiÕu (n÷ gîi c¶m)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Hæ TiÕu (n÷ gîi c¶m)"},
	{101,	53,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Hæ TiÕu (n÷ gîi c¶m)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Hång Ngäc (KiÒu n÷)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Hång Ngäc (KiÒu n÷)"},
	{101,	71,	4,	3,	357,	6,	358,	6,	359,	6,	79,		2,	41,	4,	80,	2,	42,	4,	0,	"Hång Ngäc (KiÒu n÷)"},
	{103,	17,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"MÆt n¹ S¬n Quû (nam tiªu chuÈn)"},
	{103,	35,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"MÆt n¹ Chung Quú"},
	{103,	53,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"Tu La (n÷ gîi c¶m)"},
	{103,	71,	4,	2,	371,	6,	357,	3,	358,	3,	359,	3,	0,	0,	0,	0,	0,	0,	0,	"Vu Hµm (KiÒu n÷)"},
}
--»Æ½ğ×°±¸£ºĞèÒªÌîÈë1£º¸±Àà£¨×°±¸´óÀà¶¼Îª0Ê¡ÂÔ£©£¬2£ºĞ¡Àà£¬3ÊÇ·ñ¼ø¶¨£º( ÊıÁ¿¶¼Îª1Ê¡ÂÔ£»0Î´¼ø¶¨ £¬1ÒÑ¼ø¶¨£¬ 2Ê°È¡°ó¶¨ £¬3×°±¸°ó¶¨£¬ 4ÒÑ¾­°ó¶¨)£¬4£ºÃû³Æ£¬5£ºÊôĞÔ¡£
prize_att[7] = {
{3,		6001,	1,	0,	"Ph¸ Yªn ®ao"},
{5,		6002,	1,	0,	"Ph¸ Yªn c«n"},
{0,		6004,	1,	0,	"Hµm Yªn thñ"},
{8,		6003,	1,	0,	"Phï Yªn tr­îng"},
{1,		6005,	1,	0,	"Tµng Yªn ch©m"},
{2,		6006,	1,	0,	"Phi Yªn kiÕm"},
{10,	6007,	1,	0,	"VËn Yªn cÇm"},
{0,		6008,	1,	0,	"V©n Yªn thñ"},
{5,		6009,	1,	0,	"L­u Yªn c«n"},
{2,		6010,	1,	0,	"HuyÒn Yªn kiÕm"},
{9,		6011,	1,	0,	"Vò Yªn bót"},
{6,		6012,	1,	0,	"Hµ Tiªm Th­¬ng"},
{4,		6013,	1,	0,	"Hµnh Yªn Cung"},
{7,		6014,	1,	0,	"Träc Yªn nhÉn"},
{11,	6015,	1,	0,	"Yªu Yªn tr¶o"},
}
--×°±¸ÊôĞÔ¶ÔÓ¦½âÊÍ
prize_att_string = {
	"ThÓ lùc +",
	"Ph¶n ®ßn",
	"Ph¹m vi tÊn c«ng ¸m khİ +",
	"Hót néi miÔn dŞch",
	"Hót huyÕt miÔn dŞch",
	"Tû lÖ tÊn c«ng nhÊt ®Şnh",
	"Tû lÖ tÊn c«ng dÈy lïi ®èi ph­¬ng",
	"Khèng chÕ ®èi ph­¬ng phôc håi m¸u",
	"Tû lÖ mµi mßn vò khİ gi¶m",
	"Mçi 10 gi©y ¸m khİ t¨ng",
	"Sinh lùc +",
	"Néi lùc +",
	"Mçi 10 gi©y néi lùc håi phôc",
	"Mçi 10 gi©y sinh lùc håi phôc",
	"Hñy miÔn dŞch cña ®èi ph­¬ng",
	"10 gi©y sinh lùc gi¶m, ngo¹i c«ng t¨ng",
	" 10 gi©y néi lùc gi¶m, néi c«ng t¨ng ",
	"Ngo¹i phßng gi¶m, ngo¹i kİch t¨ng",
	"Néi phßng gi¶m, Néi c«ng t¨ng",
	"H¹ gôc ®èi ph­¬ng néi lùc håi phôc ",
	"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc ",
	"S¸t th­¬ng ¸m khİ gi¶m",
	"Chİnh x¸c t¨ng",
	"Tèc ®é thi triÓn vâ c«ng t¨ng",
	"Sau khi trïng sinh néi th­¬ng gi¶m nhÑ",
	"Sau khi trïng sinh ngo¹i th­¬ng gi¶m nhÑ",
	"Tû lÖ xuÊt chiªu t¨ng",
	"Vâ c«ng hao néi gi¶m",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Tû lÖ nhÊt ®Şnh tÊn c«ng m¹nh nhÊt",
	"H¹ gôc ®èi ph­¬ng søc m¹nh t¨ng ",
	"H¹ gôc ®èi ph­¬ng g©n cèt t¨ng",
	"H¹ gôc ®èi ph­¬ng th©n ph¸p t¨ng ",
	"H¹ gôc ®èi ph­¬ng Linh ho¹t t¨ng",
	"H¹ gôc ®èi ph­¬ng néi c«ng t¨ng ",
	"H¹ gôc ®èi ph­¬ng chİnh x¸c t¨ng ",
	"H¹ gôc ®èi ph­¬ng nĞ tr¸nh t¨ng ",
	"H¹ gôc ®èi ph­¬ng chİ m¹ng t¨ng",
	"D­îc hiÖu kĞo dµi",
	"Tû lÖ nhÊt ®Şnh gi¶m miÔn dŞch",
	"Hç trî tÊn c«ng  duy tr× ",
	"Hç trî phßng thñ duy tr× ",
	"600 gi©y ®é bÒn vò khİ håi phôc",
	"Néi phßng t¨ng ",
	"Phßng thñ ngo¹i c«ng t¨ng",
	"ChuyÓn hãa s¸t th­¬ng thµnh néi lùc",
	"Víi thuéc tİnh ©m s¸t th­¬ng t¨ng",
	"Víi thuéc tİnh ©m chİnh x¸c t¨ng",
	"TÊn c«ng lµm ®èi ph­¬ng hao tæn néi lùc",
	"Ph¸ phßng thñ ®èi ph­¬ng",
	"Hót néi lùc",
	"Hót sinh lùc",
	"Tû lÖ nhÊt ®Şnh lµm ®èi ph­¬ng khİ huyÕt hao tæn",
	"Tû lÖ nhÊt ®Şnh lµm ®èi ph­¬ng ch©n nguyªn hao tæn",
	"TÊn c«ng lµm søc m¹nh ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm g©n cèt ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm néi c«ng ®èi ph­¬ng gi¶m",
	"KhiÕn ®èi ph­¬ng gi¶m Linh ho¹t ",
	"TÊn c«ng lµm th©n ph¸p ®èi ph­¬ng gi¶m",
	"Tû lÖ nhÊt ®Şnh tÊn c«ng ph¹m vi",
	"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm gi¶m néi phßng ®èi ph­¬ng",
	"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",
	"KhiÕn ®èi ph­¬ng gi¶m Néi phßng",
	"Vò khİ ®¸nh ngo¹i lín nhÊt t¨ng ",
	"Vò khİ ®¸nh ngo¹i thÊp nhÊt t¨ng ",
	"Vò khİ ®¸nh néi lín nhÊt t¨ng",
	"Vò khİ ®¸nh néi thÊp nhÊt t¨ng ",
	"TÊn c«ng kÌm ®éc s¸t",
	"Lµm chËm ®èi ph­¬ng méi thêi gian",
	"Tª liÖt ®èi ph­¬ng mét thêi gian",
	"Lµm cho¸ng ®èi ph­¬ng mét thêi gian",
	"§Şnh th©n ®èi ph­¬ng mét thêi gian",
	"Hçn lo¹n ®èi ph­¬ng mét thêi gian",
	"Lµm ®èi ph­¬ng ngñ mét thêi gian",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"TÊn c«ng t¨ng ",
	"S¸t th­¬ng ¸m khİ t¨ng",
	"Sinh lùc tèi ®a t¨ng",
	"Néi lùc + ",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§éc s¸t gi¶m",
	"H¹ gôc ®èi ph­¬ng néi lùc håi phôc ",
	"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc ",
	"Ngo¹i kİch + ",
	"Néi kİch t¨ng ",
	"Ngo¹i phßng+",
	"Néi phßng + ",
	"Gi¶m thêi gian tróng th­¬ng",
	"Lµm gi¶m néi- ngo¹i phßng cña ®èi ph­¬ng",
	"Tèc ®é håi phôc ngo¹i th­¬ng t¨ng",
	"Tèc ®é håi phôc néi th­¬ng t¨ng ",
	"Tû lÖ ®¸nh chÆn xuÊt chiªu cña ®èi ph­¬ng",
	"G©n cèt t¨ng",
	"Søc m¹ng t¨ng",
	"Th©n ph¸p t¨ng",
	"Linh ho¹t t¨ng",
	"Néi c«ng t¨ng ",
	"Kinh nghiÖm nhËn ®­îc t¨ng",
	"Tû lÖ nhÊt ®Şnh kh¸ng ®éc",
	"Di chuyÓn t¨ng",
	"TÊt c¶ thuéc tİnh t¨ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"Tû lÖ nhÊt ®Şnh tr¸nh bÉy",
	"Tû lÖ nhÊt ®Şnh chŞu ®ßn gi¶m nöa",
	"NĞ tr¸nh + ",
	"yªu cÇu ®¼ng cÊp gi¶m ",
	"Søc lùc t¨ng",
	"§¸nh tËp trung t¨ng",
	"600 gi©y ®é bÒn th­îng y håi phôc ",
	"600 gi©y ®é bÒn nãn håi phôc ",
	"600 gi©y ®é bÒn h¹ y håi phôc ",
	"Kinh nghiÖm nhËn ®­îc t¨ng",
	"Chèng gi¶m tèc ®é ®¸nh t¨ng",
	"Chèng gi¶m tèc di chuyÓn t¨ng",
	"Tû lÖ ®¸nh ng· ®èi ph­¬ng",
	"§¸nh chÆn ®èi ph­¬ng xuÊt chiªu",
	"Tô khİ tèi ®a t¨ng 1 «",
	"MiÔn dŞch ®¸nh ng·",
	"Tû lÖ miÔn dŞch ®¸nh lui",
	"Tû lÖ miÔn dŞch tª liÖt",
	"Tû lÖ miÔn dŞch cho¸ng",
	"Tû lÖ miÔn dŞch ®Şnh th©n",
	"Tû lÖ miÔn dŞch hçn lo¹n",
	"Tû lÖ miÔn dŞch g©y ngñ",
	"Tû lÖ miÔn dŞch lµm chËm ",
	"Tû lÖ miÔn dŞch gi¶m tèc",
	"NĞ tr¸nh t¨ng",
	"Ngo¹i kİch + ",
	"Néi kİch t¨ng ",
	"Ngo¹i kİch + ",
	"Néi kİch t¨ng ",
	"Ngo¹i kİch + ",
	"Néi kİch t¨ng ",
	"Ngo¹i kİch + ",
	"Søc lùc t¨ng",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm tÕ liÖt ®èi ph­¬ng",
	"Lµm cho¸ng ®èi ph­¬ng",
	"§iÓm huyÖt ®èi ph­¬ng",
	"Lµm hçn lo¹n ®èi ph­¬ng",
	"G©y ngñ",
	"Kh¶ n¨ng ®¸nh b¹i ®èi ph­¬ng",
	"Kh¶ n¨ng ®Èy lïi ®èi ph­¬ng",
	"§¸nh néi-khãa vËt phÈm",
	"§¸nh néi-khãa kü n¨ng tÊn c«ng",
	"§¸nh néi-khãa kü n¨ng hç trî",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu néi th­¬ng cÊp 1",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu ngo¹i th­¬ng cÊp 1",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu néi th­¬ng cÊp 2",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu ngo¹i th­¬ng cÊp 2",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu néi th­¬ng cÊp 3",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu ngo¹i th­¬ng cÊp 3",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu néi th­¬ng cÊp 4",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu ngo¹i th­¬ng cÊp 4",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu néi th­¬ng cÊp 5",
	"Tû lÖ nhÊt ®Şnh khiÕn ®èi ph­¬ng chŞu ngo¹i th­¬ng cÊp 5",
	"G©n cèt t¨ng",
	"Søc m¹ng t¨ng",
	"Th©n ph¸p t¨ng",
	"Linh ho¹t t¨ng",
	"Néi c«ng t¨ng ",
	"Sinh lùc +",
	"TÊn c«ng kÌm ®éc s¸t",
	"Ph¸ phßng thñ ®èi ph­¬ng",
	"Sinh lùc tèi ®a t¨ng",
	"Néi lùc + ",
	"Vò khİ ®¸nh ngo¹i lín nhÊt t¨ng ",
	"Vò khİ ®¸nh néi lín nhÊt t¨ng",
	"Mçi 10 gi©y néi lùc håi phôc",
	"Mçi 10 gi©y sinh lùc håi phôc",
	"§éc s¸t t¨ng",
	"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc ",
	"Ngo¹i kİch + ",
	"Néi kİch t¨ng ",
	"G©n cèt t¨ng",
	"Søc m¹ng t¨ng",
	"Th©n ph¸p t¨ng",
	"Linh ho¹t t¨ng",
	"Néi c«ng t¨ng ",
	"S¸t th­¬ng t¨ng ",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"KhiÕn ®èi ph­¬ng gi¶m tèc",
	"Lµm chËm ®èi ph­¬ng",
	"Lµm gi¶m phßng thñ Néi-ngo¹i c«ng ®èi ph­¬ng",
	"Gi¶m lùc ®¸nh ®èi ph­¬ng",
	"TÊn c«ng kÌm ®éc s¸t",
	"Tèc ®é thi triÓn vâ c«ng t¨ng",
	"Sinh lùc tèi ®a t¨ng",
	"Néi lùc + ",
	"Néi phßng t¨ng ",
	"Ngo¹i phßng +",
	"TÊn c«ng kÌm ®éc s¸t",
	"NĞ tr¸nh t¨ng",
	"§¸nh chÆn ®èi ph­¬ng xuÊt chiªu",
	"§éc s¸t t¨ng",
	"§éc s¸t t¨ng",
	"Gi¶m thêi gian tróng th­¬ng",
	"Møc tô khİ lín nhÊt t¨ng",
	"Tû lÖ ®¸nh chÆn xuÊt chiªu cña ®èi ph­¬ng",
	"NĞ tr¸nh t¨ng",
	"Sinh lùc tèi ®a t¨ng",
	"Néi lùc + ",
	"Hç trî tÊn c«ng  duy tr× ",
	"Hç trî phßng thñ duy tr× ",
	"Ngo¹i phßng gi¶m, ngo¹i kİch t¨ng",
	"Ngo¹i phßng gi¶m, Néi kİch t¨ng",
	"Kh¾c nĞ",
	"TÊn c«ng lµm søc m¹nh ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm g©n cèt ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm néi c«ng ®èi ph­¬ng gi¶m",
	"KhiÕn ®èi ph­¬ng gi¶m Linh ho¹t ",
	"TÊn c«ng lµm th©n ph¸p ®èi ph­¬ng gi¶m",
	"Tû lÖ chŞu ®ßn gi¶m nöa",
	"Ph¸t huy c«ng kİch lín nhÊt",
	"Vâ c«ng hao néi gi¶m",
	"D­îc hiÖu kĞo dµi",
	"Chİnh x¸c t¨ng",
	"Chİnh x¸c t¨ng",
	"ChuyÓn hãa s¸t th­¬ng thµnh néi lùc",
	"Vò khİ ®¸nh ngo¹i lín nhÊt t¨ng ",
	"Vò khİ ®¸nh ngo¹i thÊp nhÊt t¨ng ",
	"Vò khİ ®¸nh néi lín nhÊt t¨ng",
	"Vò khİ ®¸nh néi thÊp nhÊt t¨ng ",
	"Thêi gian duy tr× Kim Chung Tr¸o kĞo dµi",
	"Thêi gian duy tr× Kim Cang BÊt Ho¹i kĞo dµi",
	"Thêi gian duy tr× HuÖ Nh·n Chó kĞo dµi",
	"Thêi gian duy tr× T©m Nh·n kĞo dµi",
	"Lùc ®¸nh Ngäc N÷ KiÕm ph¸p t¨ng",
	"Lùc ®¸nh Tïy ı Khóc t¨ng",
	"Lùc ®¸nh Th«ng Tı QuyÒn t¨ng ",
	"Lùc ®¸nh Khu Xµ c«n ph¸p t¨ng",
	"Thêi gian duy tr× V« Ng· T©m Ph¸p kĞo dµi",
	"Lùc ®¸nh Th¸i Êt Tiªu Diªu C«ng t¨ng",
	"Lùc ®¸nh D­¬ng Gia Ph¸ Phong Th­¬ng t¨ng",
	"Tû lÖ ®¸nh ®Èy lïi t¨ng",
	"Lùc ®¸nh D­¬ng Gia Liªn X¹ ThuËt t¨ng",
	"TÊn c«ng bá qua nĞ tr¸nh cña ®èi ph­¬ng",
	"Rót ng¾n gi·n c¸ch xuÊt chiªu Thi Béc §¹i Ph¸p",
	"Lùc ®¸nh Cuång Phong Tr¶o t¨ng",
	"TÊt c¶ thuéc tİnh t¨ng",
	"Trong 5 gi©y tèc ®é ch¹y t¨ng 100, c¸ch nhau 10 phót",
	"S¸t th­¬ng t¨ng ",
	"§éc s¸t t¨ng",
	"H¹ gôc ®èi ph­¬ng sinh lùc håi phôc ",
	"yªu cÇu ®¼ng cÊp gi¶m ",
	"Tû lÖ ®¸nh ph¹m vi",
	"ThÓ lùc tèi ®a t¨ng",
	"Chİnh x¸c t¨ng",
	"NĞ tr¸nh t¨ng",
	"Ph¶n ®ßn",
	"Mçi 10 gi©y néi lùc håi phôc",
	"Mçi 10 gi©y sinh lùc håi phôc",
	"§¸nh tËp trung t¨ng",
	"Néi phßng t¨ng ",
	"Phßng thñ ngo¹i c«ng t¨ng",
	"Vâ c«ng hao néi gi¶m",
	"Ph¸t huy c«ng kİch lín nhÊt",
	"§éc s¸t gi¶m",
	"TÊn c«ng lµm søc m¹nh ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm g©n cèt ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm néi c«ng ®èi ph­¬ng gi¶m",
	"KhiÕn ®èi ph­¬ng gi¶m Linh ho¹t ",
	"TÊn c«ng lµm th©n ph¸p ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",
	"TÊn c«ng lµm gi¶m néi phßng ®èi ph­¬ng",
	"Gi¶m thêi gian tróng th­¬ng",
	"Tû lÖ ®¸nh chÆn xuÊt chiªu cña ®èi ph­¬ng",
	"G©n cèt t¨ng",
	"Søc m¹ng t¨ng",
	"Th©n ph¸p t¨ng",
	"Linh ho¹t t¨ng",
	"Néi c«ng t¨ng ",
	"Ph¸ phßng thñ ®èi ph­¬ng",
	"TÊn c«ng kÌm ®éc s¸t",
	"Kh¾c nĞ",
	"Tû lÖ nhÊt ®Şnh chŞu ®ßn gi¶m nöa",
	"Kinh nghiÖm nhËn ®­îc t¨ng",
	"TÊt c¶ thuéc tİnh t¨ng",
	"Ngo¹i kİch + ",
	"Néi kİch t¨ng ",
	"Tû lÖ xuÊt chiªu t¨ng",
	"Tèc ®é thi triÓn vâ c«ng t¨ng",
	"S¸t th­¬ng t¨ng ",
	"Tû lÖ tr¸nh gi¶m tèc t¨ng",
	"Tû lÖ tr¸nh lµm chËm t¨ng ",
	"Tû lÖ tr¸nh ®¸nh lui t¨ng",
	"Tû lÖ tr¸nh ®¸nh ng· t¨ng",
	"Tû lÖ tr¸nh tª liÖt t¨ng",
	"Tû lÖ tr¸nh cho¸ng t¨ng",
	"Tû lÖ tr¸nh ®Şnh th©n t¨ng",
	"Tû lÖ tr¸nh hçn lo¹n t¨ng",
	"Tû lÖ tr¸nh ngñ t¨ng",
	"TÊn c«ng lµm phßng ngo¹i ®èi ph­¬ng gi¶m",
	"KhiÕn ®èi ph­¬ng gi¶m Néi phßng",
	"G©n cèt t¨ng",
	"Søc m¹ng t¨ng",
	"Th©n ph¸p t¨ng",
	"Linh ho¹t t¨ng",
	"Néi c«ng t¨ng ",
	"C«ng kİch + ",
	"Tû lÖ xuÊt chiªu t¨ng",
	"Dïng linh ®¬n NguyÖt L­îng Thè, c¸ch nhau 5 phót",
	"TriÖu gäi H»ng Nga tiªn tö gióp phe m×nh håi phôc. Gi·n c¸ch 5 phót",
	"TriÖu gäi HËu NghÖ b¾n mÆt trêi, c¸ch nhau 5 phót",
	"S¸t th­¬ng t¨ng ",
	"(Tr¹ng th¸i PK kh«ng thÓ sö dông)",										
}
prize_iron_num = {5,5,5,5,5,5,20}
prize_water_num = {3,3,3,3,5,5,10}
prize_zhuangbei_jilv = {220,220,260,240,24,24,30}
--======================================µã»÷±¦Ïä·ÖÅä×°±¸=============================
function OnUse(id)
	local box_diff = GetItemParticular(id)
	local PlayerIndex_save = PlayerIndex 											--±£´æ°ïÖ÷Ë÷Òı
	--ÎïÆ·³õÊ¼»¯´¦Àí¼°Ğ£Ñé--
	for i = 1,2 do
		if GetItemParam(id,i) > 10000 then
			SetItemParam(id,0,0)
			SetItemParam(id,1,0)
			SetItemParam(id,2,0)
		end
	end
	--´¦Àí½áÊø--
	local prize_level = box_diff - 525										--½±ÀøµÈ¼¶
	-----------------------------------ÔÉÌúÔö¼Ó-------------------------------------------
	if GetItemParam(id,1) == 0 then											--Ê×ÏÈÅĞ¶ÏÔÉÌúÊÇ·ñ»¹ÔÚ
		if zgc_conf_task_iron_add(prize_level) == 1 then
			if prize_level == 7 and random(1000) <= prize_zhuangbei_jilv[7] then
				local add_flag = AddItem(2,0,1082,50)
				if add_flag == 1 then
					AddGlobalNews("Ng­êi ch¬i"..GetName().."Dïng 'B¸ch B¶o r­¬ng Bé Phi Yªn' më 50 quyÓn 'Th¸i DŞch Hçn Nguyªn C«ng §å'!")
					SendTongMessage(GetName().."Dïng 'B¸ch B¶o r­¬ng Bé Phi Yªn' më 50 quyÓn 'Th¸i DŞch Hçn Nguyªn C«ng §å'!")
				else
					WriteLog("Bé Phi Yªn: Ng­êi ch¬i["..GetName().."]dïng 'B¸ch B¶o r­¬ng Bé Phi Yªn' thªm 50 quyÓn 'Th¸i DŞch Hçn Nguyªn C«ng §å' thÊt b¹i, ®¸nh dÊu:  "..add_flag)
				end
			end
			SetItemParam(id,1,1)
		else
			return
		end		
	end
	---------------------------------×°±¸ÊôĞÔĞ´Èë---------------------------------------
	if GetItemParam(id,0) == 0 then											--±¦ÏäµÚÒ»´Î·ÖÅä
		if random(1,1000) > prize_zhuangbei_jilv[prize_level] then			--ÎŞ×°±¸³öÏÖ
			local del_flag = DelItemByIndex(id,1)
			if del_flag ~= 1 then				
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "xãa b¶o r­¬ng thÊt b¹i, trŞ ph¶n håi:"..del_flag)				
			end
			return
		else																--ÓĞ×°±¸³öÏÖ
			local prize_seq = 0
			if prize_level <= 4 then										--1-4µÈÖ±½Ó±£´æË³ĞòºÃ
				prize_seq = random(1,getn(prize_att[prize_level]))
			elseif prize_level == 7 then									--7µÈÖ±½Ó±£´æÊı¾İºÅ
				prize_seq = random(1,getn(prize_att[7]))
			else															--¶şµÈ´¦Àí½ÏÎª¸´ÔÓ
				prize_seq = random(1,getn(prize_att[prize_level]))
				local att_1,att_2,att_3 = zgc_conf_task_att_return(prize_level,prize_seq)
				prize_seq = Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
			end
			SetItemParam(id,0,prize_seq)
		end
	end
	------------------------------------×°±¸ÊôĞÔ¶ÁÈ¡--------------------------------------
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""	
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = GetItemParam(id,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_3 = prize_att[prize_level][prize_seq][8]
		prize_jieshi_1 = " (thuéc tİnh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; khãa)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; khãa)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		prize_jieshi_1 = "Trang bŞ Hoµng Kim:"..prize_att[7][prize_seq][5]
		--°´ÍÃ×Ó½ã½ãÒªÇó¼ÓÉÏÊÀ½çÏûÏ¢
		AddGlobalNews("Ng­êi ch¬i"..GetName().."Sö dông \'B¸ch B¸u R­¬ng cña Bé Phi Yªn\' më Hoµng Kim Vò Khİ:"..prize_att[7][prize_seq][5])
	else
		prize_seq,att_seq_1,att_seq_2,att_seq_3 = Zgc_conf_task_att_dealout(prize_seq)				--ÊôĞÔ½âÎöÈ¡µ½ÊôĞÔĞòºÅ£¬¶ø²»ÊÇÊôĞÔ´úÂë
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_1 = prize_att[prize_level][prize_seq][5+(att_seq_1*2)]
			att_2 = prize_att[prize_level][prize_seq][11+(att_seq_2*2)]
			att_3 = prize_att[prize_level][prize_seq][15+(att_seq_3*2)]
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_1 = prize_att[prize_level][prize_seq][5]
			att_2 = prize_att[prize_level][prize_seq][7+(att_seq_2*2)]			
		end
		prize_jieshi_1 = " (thuéc tİnh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3].."; khãa)."
		else
			prize_jieshi_2 = prize_jieshi_2.."; khãa)."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	------------------------------------¶ÓÓÑ¶Ô»°×éºÏ-------------------------------------
		local teamer_dialog = {}											--¶ÓÓÑtable
		local player_name = ""
		if GetTeamSize() == 0 then
			player_name = GetName()
			player_name = replace(player_name,"/","-")
			player_name = replace(player_name,"|","-")
			player_name = replace(player_name,":","-")
			teamer_dialog[1]=player_name..": "..player_fini_cond().." (ChØ ph¸t cho bang chóng)./#Prize_add(0)"
			teamer_dialog[2]="§em trang bŞ cÊt gi÷ t¹m thêi/Zgc_end_dialog"
		else
			local conf_name_save = GetTongName()
			local team_number = GetTeamSize()
			local team_seq = 1
			for i = 1, team_number do
				PlayerIndex = GetTeamMember(i)									--ĞŞ¸Äµ±Ç°Íæ¼ÒË÷Òı
				if conf_name_save == GetTongName() then
					player_name = GetName()
					player_name = replace(player_name,"/","-")
					player_name = replace(player_name,"|","-")
					player_name = replace(player_name,":","-")
					local finish_condition = player_fini_cond()
					teamer_dialog[team_seq] = player_name.." Vßng 3:"..finish_condition.."/#Prize_add("..i..")"
					team_seq = team_seq + 1
				end
			end
			teamer_dialog[team_seq]="§em trang bŞ cÊt gi÷ t¹m thêi/Zgc_end_dialog"
			PlayerIndex = PlayerIndex_save
		end
	------------------------------------·ÖÅä¶Ô»°×éºÏ--------------------------------------
	SendTongMessage(GetName().." Më b¶o r­¬ng, ph¸t hiÖn "..prize_jieshi_1)
	if prize_level ~= 7 then
		SendTongMessage(prize_jieshi_2)
	end
	SetTaskTemp(155,id)
	prize_jieshi = prize_jieshi_1..prize_jieshi_2
	Say("B¹n ph¸t hiÖn bªn trong b¶o r­¬ng cã 1 "..prize_jieshi.." NhÊn vµo bªn mét h¶o h÷u trong danh s¸ch, sÏ kho¸t ®­îc trang bŞ lªn ng­êi ®ã. <color=red>(Kh«ng ph¶i trang bŞ Hoµng Kim sau khi mÆc lªn ng­êi sÏ bŞ khãa!)<color>.",
		getn(teamer_dialog),teamer_dialog
	)
end
--*****************************************ÎïÆ··ÖÅäº¯Êı*******************************
function Prize_add(player_seq)
	local PlayerIndex_save = PlayerIndex 											--±£´æ°ïÖ÷Ë÷Òı
	local box_index = GetTaskTemp(155)
	local box_diff = GetItemParticular(box_index)
	local prize_level = box_diff - 525												--½±ÀøµÈ¼¶
	local prize_seq = 0
	local att_1 = 0
	local att_level_1 = 0
	local att_2 = 0
	local att_level_2 = 0
	local att_3 = 0
	local att_level_3 = 0
	local prize_jieshi = ""
	local prize_jieshi_1 = ""
	local prize_jieshi_2 = ""
	prize_seq = GetItemParam(box_index,0)
	if prize_level <= 4 then
		att_1 = prize_att[prize_level][prize_seq][4]
		att_level_1 = prize_att[prize_level][prize_seq][5]
		att_2 = prize_att[prize_level][prize_seq][6]
		att_level_2 = prize_att[prize_level][prize_seq][7]
		att_3 = prize_att[prize_level][prize_seq][8]
		att_level_3 = prize_att[prize_level][prize_seq][9]
		prize_jieshi_1 = " (thuéc tİnh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][11]..prize_jieshi_1
	elseif prize_level == 7 then
		att_1 = -1
		att_level_1 = -1
		att_2 = -1
		att_level_2 = -1
		att_3 = -1
		att_level_3 = -1
		prize_jieshi_1 = "Trang bŞ Hoµng Kim:"..prize_att[7][prize_seq][5]
	else
		prize_seq,att_1,att_2,att_3 = Zgc_conf_task_att_dealout(prize_seq)				--ÊôĞÔ½âÎö
		if prize_att[prize_level][prize_seq][4] == 3 then
			att_level_1 = prize_att[prize_level][prize_seq][(att_1*2)+6]
			att_1 = prize_att[prize_level][prize_seq][(att_1*2)+5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+12]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+11]
			att_level_3 = prize_att[prize_level][prize_seq][(att_3*2)+16]
			att_3 = prize_att[prize_level][prize_seq][(att_3*2)+15]		
		elseif prize_att[prize_level][prize_seq][4] == 2 then
			att_level_1 = prize_att[prize_level][prize_seq][6]
			att_1 = prize_att[prize_level][prize_seq][5]
			att_level_2 = prize_att[prize_level][prize_seq][(att_2*2)+8]
			att_2 = prize_att[prize_level][prize_seq][(att_2*2)+7]		
		end
		prize_jieshi_1 = " (thuéc tİnh:"..prize_att_string[att_1]
		prize_jieshi_2 = ";"..prize_att_string[att_2]
		if att_3 ~= 0 then
			prize_jieshi_2 = prize_jieshi_2..";"..prize_att_string[att_3]..")."
		else
			prize_jieshi_2 = prize_jieshi_2..")."
		end
		prize_jieshi_1 = prize_att[prize_level][prize_seq][20]..prize_jieshi_1
	end
	if player_seq == 0 then
		if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä						--=========================ÔÚ´Ë¼ÓÈë¸ºÖØºÍ¿Õ¸ñÊıµÄÅĞ¶Ï
			Say ("Hµnh trang cña b¹n qu¸ ®Çy, s¾p xÕp råi quay l¹i!",
					1,
					"Ta biÕt råi!/Zgc_dialog_end"
				)
				return
		else
			local del_flag = DelItemByIndex(box_index,1)
			if del_flag == 1 then
				local add_flag = 0
				if prize_level <=4 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
				elseif prize_level == 7 then
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
				else
					add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
				end
				if add_flag ~= 0 then
					SendTongMessage(GetName().."§em 1:"..prize_jieshi_1..prize_jieshi_2)
					SendTongMessage(" mÆc lªn m×nh, nhiÖm vô vßng 3:"..player_fini_cond())
					if prize_level == 7 then												
						WriteLogEx(strLogCaption, "trang bŞ Hoµng Kim" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())				
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"thªm trang bŞ thÊt b¹i, trŞ ph¶n håi:"..add_flag)
				end
			else
				WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"xãa b¶o r­¬ng thÊt b¹i, trŞ ph¶n håi:"..del_flag)
			end
		end
	else
		-------------------------------------ÅĞ¶Ï¸ÃÍê¼ÒÊÇ·ñÔÚÔÚ¸Ã¶ÓÎéÖĞ-------------------------------------
		local player_belong_flag = 0
		PlayerIndex = GetTeamMember(player_seq)
		local player_name = GetName()
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i)
			if player_name == GetName() then
				player_belong_flag = 1
			end
		end
		PlayerIndex = PlayerIndex_save
		if player_belong_flag ~= 1 then			
			Say("Xin x¸c nhËn ng­êi ch¬i ®ã cã trong ®éi ngò, nÕu tæ ®éi thay ®æi ph¶i ph©n bè l¹i!",
				1,
				"Ta biÕt råi/Zgc_end_dialog"
			)
			return
		else
			PlayerIndex = GetTeamMember(player_seq)
			if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 250 then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä						--=========================ÔÚ´Ë¼ÓÈë¸ºÖØºÍ¿Õ¸ñÊıµÄÅĞ¶Ï
				PlayerIndex = PlayerIndex_save				
				Say ("Hµnh trang huynh ®Ö cña b¹n qu¸ ®Çy, s¾p xÕp råi quay l¹i!",
					1,
					"Ta biÕt råi!/Zgc_dialog_end"
				)
				return
			else
				PlayerIndex = PlayerIndex_save
				local del_flag = DelItemByIndex(box_index,1)
				PlayerIndex = GetTeamMember(player_seq)
				if del_flag == 1 then
					local add_flag = 0
					if prize_level <=4 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][10])
					elseif prize_level == 7 then
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][4])
					else
						add_flag = AddItem(0,prize_att[prize_level][prize_seq][1],prize_att[prize_level][prize_seq][2],1,prize_att[prize_level][prize_seq][3],att_level_1,att_1,att_level_2,att_2,att_level_3,att_3,prize_att[prize_level][prize_seq][19])
					end
					if add_flag ~= 0 then
						local name = GetName()
						local task_fini_cond = player_fini_cond()
						PlayerIndex = PlayerIndex_save
						SendTongMessage(GetName().."§em 1:"..prize_jieshi_1..prize_jieshi_2)
						SendTongMessage("ph©n bè cho "..name.." , nhiÖm vô vßng 3:"..task_fini_cond)
						WriteLog("NhiÖm v?B?Phi Yªn: Ng­êi ch¬i ["..GetName().."] T¹i b¶n ®å ID"..GetWorldPos().."LÊy 1 "..prize_jieshi_1..prize_jieshi_2.."Cho "..name)
						PlayerIndex = GetTeamMember(player_seq)
						if prize_level == 7 then														
							WriteLogEx(strLogCaption, "trang bŞ Hoµng Kim" ,"1", prize_att[prize_level][prize_seq][5], "", GetTongName())
						end
					else
						WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"thªm trang bŞ thÊt b¹i, trŞ ph¶n håi:"..add_flag)
					end
				else
					WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(),"xãa b¶o r­¬ng thÊt b¹i, trŞ ph¶n håi:"..del_flag)
				end
				PlayerIndex = PlayerIndex_save
			end
		end
	end
end
--===================================±¾½Å±¾¹«ÓÃº¯Êı===================================
--*********************************¶şµÈÏä×ÓÊôĞÔ¼ÆËãº¯Êı********************************
function zgc_conf_task_att_return(prize_level,prize_seq)
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	local random_num = 0
	if prize_att[prize_level][prize_seq][4] == 2 then
		random_num = random(0,2)
		att_2 = random_num
		return 0,att_2,0
	else
		random_num = random(0,2)
		att_1 = random_num
		random_num = random(0,1)
		att_2 = random_num
		random_num = random(0,1)
		att_3 = random_num
		return att_1,att_2,att_3
	end
end
--***********************************ÊôĞÔÕûºÏ*************************************
function Zgc_conf_task_att_dealin(prize_seq,att_1,att_2,att_3)
	local att_save_num = prize_seq*1000+att_1*100+att_2*10+att_3
	return att_save_num
end
--***********************************ÊôĞÔ·Ö½â*************************************
function Zgc_conf_task_att_dealout(att_save_num)
	local prize_seq = 0
	local att_1 = 0
	local att_2 = 0
	local att_3 = 0
	prize_seq = floor(att_save_num/1000)
	att_1 = floor((att_save_num - prize_seq*1000)/100)
	att_2 = floor((att_save_num - prize_seq*1000 - att_1*100)/10)
	att_3 = floor((att_save_num - prize_seq*1000 - att_1*100 - att_2*10)/10)
	return prize_seq,att_1,att_2,att_3
end
--***********************************ÔÉÌúÔö¼Óº¯Êı**********************************
function zgc_conf_task_iron_add(prize_level)
	if GetFreeItemRoom() < (prize_water_num[prize_level] + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < (prize_iron_num[prize_level] + 50) then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä					--=========================ÔÚ´Ë¼ÓÈë¸ºÖØºÍ¿Õ¸ñÊıµÄÅĞ¶Ï
		Say ("Hµnh trang cña b¹n qu¸ ®Çy, kh«ng thÓ lÊy Thiªn Th¹ch ra, xin kiÓm tra l¹i!",
			1,
			"Ta biÕt råi!/Zgc_dialog_end"
			)
		return 0
	else	
		local iron_name = "Thiªn th¹ch"
		local add_flag = 0
		if prize_level < 5 then
			add_flag = AddItem(2,2,7,prize_iron_num[prize_level])
			iron_name = "M¶nh Thiªn th¹ch"
		else
			add_flag = AddItem(2,2,8,prize_iron_num[prize_level])
		end
		add_flag = add_flag + AddItem(2,1,1052,prize_water_num[prize_level])
		if add_flag == 0 then
			WriteLogEx(strLogCaption, "" ,"", "", "", GetTongName(), "nhËn ®­îc "..iron_name.." thÊt b¹i, trŞ quay vÒ:"..add_flag)				
		else
			Msg2Player("B¹n ph¸t hiÖn bªn trong b¶o r­¬ng cã"..prize_iron_num[prize_level].."c¸i"..iron_name.."!")
			Msg2Player("B¹n ph¸t hiÖn bªn trong b¶o r­¬ng cã"..prize_water_num[prize_level].." Bång Lai Lé Thñy!")
			SendTongMessage(GetName().."Më b¶o r­¬ng thµnh c«ng, nhËn ®­îc"..prize_iron_num[prize_level].."c¸i"..iron_name.."!")
			SendTongMessage(GetName().."Më b¶o r­¬ng thµnh c«ng, nhËn ®­îc"..prize_water_num[prize_level].." Bång Lai Lé Thñy!")
			WriteLogEx(strLogCaption, "nhËn" ,prize_iron_num[prize_level], iron_name, "", GetTongName())
			WriteLogEx(strLogCaption, "nhËn" ,prize_water_num[prize_level], "Bång Lai Lé Thñy", "", GetTongName())			
		end
		return 1
	end
end
--***************************¼ÆËãÍæ¼Ò½üÈıÂÖµÄÊÕ¼¯Æ·½ÉÄÉÇé¿ö***********************
function player_fini_cond()
	local string_return = ""
	local goods_num_count = 0
	local turn_num_sum = 0
	for i = 956,958 do
		if (Zgc_conf_task_time_return() - Zgc_conf_task_cent_date(1,i)) <=2 then
			goods_num_count = goods_num_count + Zgc_conf_task_cent_date(0,i)
			turn_num_sum = turn_num_sum + 1
		end
	end
	string_return = "("..turn_num_sum.." vßng,"..goods_num_count.." ®iÓm tİch lòy)"
	return string_return
end
--**************************ÊıÁ¿ºÍÈÕÆÚ·Ö×°º¯Êı*************************
function Zgc_conf_task_cent_date(diff_flag,task_id)
	local cent_return = 0
	local date_return = 0
	local data_save = GetTask(task_id)
	if diff_flag == 0 then
		cent_return = floor (data_save/10000)
		return cent_return
	else
		date_return = data_save - ((floor (data_save/10000))*10000)
		return date_return
	end
end
--**************************ÂÖ´Î¼ÆËãº¯Êı*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 57600)/(172800))
	return time_return
end
--***********************************×Ö·ûÌæ»»º¯Êı*********************************
function replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--***********************************¶Ô»°½áÊø£¨¿Õ£©*******************************
function Zgc_end_dialog()

end