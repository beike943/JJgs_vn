
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ïÚÊ¦½Å±¾
-- Edited by joker
-- 2005/02/22 PM 18:03
--Changed by joker(zhaoguichun)
--2006/09/04
--Changed point: add random boss

-- ======================================================

Include("\\script\\task\\teach\\teach_main.lua")
Include("\\script\\lib\\writelog.lua")
strLogCaption = "Nhiem vu Bang hoi"
File_name = "\\script\\ÖĞÔ­¶şÇø\\³É¶¼\\npc\\ïÚÊ¦.lua"
Tasktemp_task_return = 199
CONFTASKBOSSCREATE_RATE = 20

function main()

	local nState = TE_GetTeachState()
	local nLevel = GetLevel()
	
	if (nState==13) then
		task_013_00()
		return
	else
		if GetTask(956) == 0 then
			Zgc_conf_task_main_dialog()
		else							--·ÇµÚÒ»´Î¶Ô»°
			Zgc_conf_task_dialog_2()
		end
	end
	
end
---------------------------------------------¹«¹²±äÁ¿¶¨ÒåÇø-----------------------------------------
Zgc_conf_task_goos_num = {						--ÈÎÎñÊÕ¼¯µÈ¼¶Îª9¼¶
	{2000,1},{4000,2},{8000,4},{12000,7},{16000,10},{20000,15},{24000,16},{28000,17},{32000,18}
}
Zgc_conf_task_boss_jies = {
	"10 n¨m tr­íc giang hå xuÊt hiÖn mét cao thñ Bé Phi Yªn x­ng lµ Thóy Yªn Tiªn Tö, ng­êi nµy vâ nghÖ cao c­êng, th©n ph¸p uyÓn chuyÓn. Sau lÇn thİch s¸t chinh nam t­íng qu©n Liªu quèc kh«ng thµnh bçng nhiªn biÖt v« ©m tİn, nh­ng gÇn ®©y nghe nãi ®· xuÊt hiÖn l¹i lµ mét ng­êi hoµn toµn kh¸c kh«ng ai cã thÓ nhËn ra, ®iÒu nµy còng h¬i kú l¹. \n Ngµy mõng ®¹i thä thÊt thËp cña th¸i hËu ®Òu vÒ kinh thµnh nép Sinh ThÇn C­¬ng, c¸c tiªu s­ nh©n c¬ héi nµy dô h¾n cïng ®ång bän. ",
	"10 n¨m tr­íc lµ mét ®ao kh¸ch tung hoµnh ngang däc, sau l¹i ®Çu Liªu lµm t­íng lÜnh cho Liªu",
	"TiÓu nh©n chØ biÕt ng­êi nµy lµ m·nh t­íng cña Liªu quèc, ngoµi ra kh«ng biÕt g× n÷a.",
	"Thuéc h¹ Bé Phi yªn",
	"Thuéc h¹ Bé Phi yªn",
	"Thuéc h¹ Bé Phi yªn",
	"Thuéc h¹ Bé Phi yªn",
	
}
Zgc_conf_task_coll_goods = {					--ÊÕ¼¯Æ·ID£¬ÊÕ¼¯Æ·Ãû³Æ£¬ÊÕ¼¯Æ··ÖÊı±ÈÀı£¬ÊÕ¼¯Æ·Ñ¡ÖĞ±êÖ¾£¬ÊÕ¼¯Æ·Ñ¡ÖĞÊıÁ¿
	{"§u«i thá",2,0.2},
	{"R¨ng sãi",3,0.2},
	{"Thè Nhi Qu¶",4,0.2},
	{"L«ng sãi",5,0.2},
	{"No·n trïng",6,0.2},
	{"Nanh heo rõng",7,0.2},
	{"L«ng sãi th­îng ®¼ng",8,1},
	{"VÊn Lé th¹ch",9,0.2},
	{"ThiÕt Ban ChØ",10,0.2},
	{"Tó hoa hµi",11,0.2},
	{"Thiªu töu",12,0.2},
	{"Tæ ong",13,0.2},
	{"Nanh heo th­îng h¹ng",14,1},
	{"GÊm lam",15,0.2},
	{"HÇu Nhi Qu¶",16,0.2},
	{"Thanh Kim",17,0.2},
	{"C¸nh d¬i",18,0.2},
	{"Hæ vÜ",19,0.2},
	{"ThiÕt Th­¬ng §Çu",20,0.2},
	{"Bao ®ao",21,0.2},
	{"TuyÕt Tinh",22,0.2},
	{"Thèi Cèt",23,0.2},
	{"S­u ThÇn Kı",24,0.2},
	{"Gi¸p Méc Bµi",25,0.2},
	{"¸m Yªn",26,0.2},
	{"¢m Ph¸ch",27,0.2},
	{"Trøng chim",28,0.2},
	{"B¶o B×nh",29,0.2},
	{"§ång kiÕm",30,0.2},
	{"Méc Thñ",31,0.2},
	{"Hång Tinh",32,0.2},
	{"Êt Méc Bµi",33,0.2},
	{"Quan phôc",34,0.2},
	{"B¸nh n­íng",35,0.2},
	{"Gia Ph¸p bæng",36,0.2},
	{"Lang Hån",37,0.2},
	{"Hµng hãa",38,0.2},
	{"D¹ Minh Ch©u",39,0.2},
	{"Th­¬ng g·y",40,0.3},
	{"Kim Thoa",41,0.3},
	{"MiÕng ®ång",42,0.3},
	{"Th¶o hµi",43,0.3},
	{"Töu B«i",44,0.3},
	{"TuyÕt Ph¸ch",45,0.3},
	{"Bİnh Méc Bµi",46,0.3},
	{"ThiÕt Xoa",47,0.3},
	{"§u«i Hæ vµng",48,1},
	{"ThÇn Ma chİ",49,0.3},
	{"Thñ Cèt",50,0.3},
	{"U Hån",51,0.3},
	{"Tr·m Töu",52,0.3},
	{"Di T¾c Chung",53,0.3},
	{"GÊm vµng",54,0.3},
	{"B×nh trµ",55,0.3},
	{"C«ng V¨n",56,0.3},
	{"Hép trang søc",57,0.3},
	{"C¸nh d¬i",58,0.3},
	{"§inh Méc Bµi",59,0.3},
	{"BÇu r­îu da dª",60,0.3},
	{"D©y xİch",61,0.3},
	{"Lôc Ph¸ch",62,0.3},
	{"Mãc C©u",63,0.3},
	{"MËu Méc Bµi",64,0.3},
	{"BÇu r­îu da dª",65,0.3},
	{"Kû Méc Bµi",66,0.3},
	{"§¹i Tèng ®Şa chİ",67,0.3},
	{"Ch©m cøu ®ång nh©n",68,0.3},
	{"Hoµng Kim Ban ChØ",69,0.3},
	{"Canh Méc Bµi",70,0.3},
	{"ThiÕt B¸t Qu¸i",71,0.3},
	{"Ên Th¹ch",72,0.3},
	{"§inh Ba",73,0.3},
	{"Bao tay Da h­¬u",74,0.3},
	{"Môc L«i V¨n §ao",75,0.5},
	{"MÉu §¬n",76,0.5},
	{"T©n Méc Bµi",77,0.5},
	{"Hïng V¨n",78,0.5},
	{"Kim Xøng Xµ",79,0.5},
	{"KiÕm Hån",80,0.5},
	{"B¹ch V©n b«i",81,0.5},
	{"Quy Hoa Kİnh",82,0.5},
	{"Nh©m Méc Bµi",83,0.5},
	{"Hæ Ph¸ch",84,0.5},
	{"Quı Méc Bµi",85,0.5},
	{"Kim Cang",86,0.5},
	{"Ngäc Nh­ ı",87,0.5},
	{"B×nh Ngäc",88,0.5},
	{"Tª Ng­u Cung",89,0.6},
	{"NhÉn Hé PhËt",90,0.6},
	{"Lôc Trô",91,0.7},
	{"Quû Hån",92,1},
	{"Vßng B¹ch Ngäc",93,0.6},
	{"Tµ PhËt Ban ChØ",94,0.5},
	{"TuyÕt Hoa Giíi C¬",95,1},
	{"ChØ Nam Ng­",96,0.8},
	{"Th­¬ng Hµn luËn",97,1},
	{"Khª S¬n chİ",98,1},
	{"HuyÔn Quang",99,1},
	{"§«ng L¨ng",100,1},
	{"MÆt n¹ Thiªn V­¬ng",101,1},
	{"Nh©n §å Phñ",102,1},
	{"B×nh ¤n dŞch",103,1},
	{"Hæ phï",104,1},
	{"Vâ Kinh Tæng YÕu",105,1},
	{"V¶y Kú L©n",106,1},
	{"Hoµng §Õ Néi Kinh",107,1},
	{"Ngäc Khİ",154,0.3},
	{"L«ng c¸o",155,0.3},
	{"Trøng B¹ch §iªu",156,0.3},
	{"Cung",157,0.3},
	{"M¶nh b¶n ®å Thiªn ¢m gi¸o",158,0.3},
	{"Thiªn ¢m MËt Tİn",159,0.3},
	{"Qu¸i dŞ th¹ch",160,0.3},
	{"Ng¹c vÜ cèt",161,0.3},
	{"D·i cãc",162,0.3},
	{"H¹t Ch©m",163,0.3},
	{"DŞ Téc Qu¶i Liªn",164,0.5},
	{"DŞ Téc b× ngoa",165,0.5},
	{"da Th­¬ng Viªn",166,0.5},
	{"Ng©n Hå ®¬n",167,0.5},
	{"Ng©n th­¬ng háng",168,0.5},
	{"Xi Háa c«n",169,0.5},
	{"B¹ch Ng­ L©n",170,0.5},
	{"Hång ng­ l©n",171,0.5},
	{"D¹ §ao",172,1},
	{"Vâ sÜ ®ao",173,1},
	{"Vâ sÜ yªu ®¸i",174,1},
	{"MÆt n¹ Vâ sÜ",175,1},
	{"§éc Phong thİch",176,1},
	{"Gi¸p x¸c phiÕn",177,1},
	{"Háa ¶nh ThÇn ®ao",178,1},
	{"Quû §Çu Tr­îng",179,1},
	{"Ng¹c Ng­ Nh·n CÇu",180,1},
	{"ThÇn bİ phñ",181,1},
	{"KiÕm thÇn bİ",182,1},
	{"Linh Tiªu",183,1},
	{"Linh Qu¶",184,1},
	{"Linh T¶n",185,1},
	{"Linh CÇm",186,1},
	{"Linh §Şch",187,1},
	{"Näc ong ®éc",271,0.2},
	{"X¸c gi¸p trïng",272,0.2},
	{"Ch©n rÕt",273,0.2},
	{"C¸nh muçi",274,0.2},
	{"DŞch nhÖn ®éc",275,0.2},
	{"MÇm Thùc nh©n th¶o",276,0.2},
	{"§u«i §éc tİch",277,0.3},
	{"Ch×a khãa ®ång",278,0.3},
	{"Ch×a khãa s¾t",279,0.3},
	{"Ch×a khãa b¹c",280,0.3},
	{"D©y tua",281,0.3},
	{"Xi Háa MËt Tİn",282,0.5},
	{"Hé Ph¸p LÖnh Bµi",284,0.5},
	{"HuyÕt Nha vò",285,1},
	{"HuyÕt bao",286,0.5},
	{"Mao Ng­u b×",287,0.4},
	{"Tr­êng ®ao",288,0.5},
	{"Kh¨n tay",289,0.5},
	{"Tranh ch÷",290,0.5},
	{"Vò nhung",291,0.6},
	{"Da hæ",292,0.6},
	{"To¸i cèt",293,0.8},
	{"¢m d­¬ng kİnh",294,1},
	{"§¹i Cang ®ao",295,1},
	{"R¨ng Tinh Tinh",296,1},
	{"Da voi",297,1},
	{"Thuèc næ",298,1},
	{"Tµn kiÕm",299,1},
	{"Tö ®µn",300,1},
	{"Tµn th­¬ng",301,1},
	{"Phï Ên",302,1},
	{"G¨ng tay",303,1},
	{"PhËt Kinh",304,1},
	{"§µ La tr­îng",305,1},
	{"Hép trang ®iÓm",306,1},
	{"HuyÕt L©n",307,1},
	{"Hñ Cèt",308,1},
	{"TiÓu §éc Nang",309,1},
	{"Hoa Ban Hå §iÖp",310,1},
	{"Minh Háa Phï",311,1},
	{"§¹i ThiÕt Ba",312,1},
	{"Xi Háa Ên",313,1},
	{"B¹ch L©n",314,1},
	{"L­¬ng kh«",315,1},
	{"To¸i th¹ch",316,1},
	{"Th« bè Tr­êng Bµo",317,1},
	{"Cån",318,1},
	{"C¸nh Phông Hoµng",319,1},
	{"Xi Háa Tr­êng Ên",320,1},
	{"Xi Háa Th¸nh Ên",321,1},
	{"C¸nh A Tu La",322,1},
	{"§Çu l©u Ma H« La Ca",323,5},
	{"§oµn Thõa ¢n thñ th­",324,5},
	{"NhÊt D­¬ng ChØ Tµn ch­¬ng 1",325,5},
	{"Bİch Ngäc giíi chØ",326,5},
	{"D©y thĞp",327,1},
	{"Trµng h¹t",328,1},
	{"§Çu l©u KhÈn Na La",329,5},
	{"§¹i Tu Viªn Kİnh",330,1},
	{"NhÊt D­¬ng ChØ Tµn ch­¬ng 2",331,5},
	{"Tö cèt",1089,1},
	{"DiÖn Sa",1400,1},
	{"R­îu T©y Phông",1401,1},
	{"Ph­¬ng táa",1402,1},
	{"§­êng tam th¸i",1403,1},
	{"Da Háa Hå",1404,1},
	{"Ng©n ch©m",1405,1},
	{"Khãi mª",1406,1},
	{"Thanh Long V¨n Kİnh",1407,1},
	{"B¹ch Hæ v¨n kİnh",1408,1},
	{"L­¬ng kh«",1409,1},
	{"Ma phİ t¸n",1410,1},
	{"NhËt quü",1411,1},
	{"LiÖt n÷ ca",1412,1},
	{"Yªn th­¬ng",1413,1},
	{"R­îu hå l«",1414,1},
	{"Ngò th¹ch t¸n",1415,1},
	{"Ly Trïng L©n PhiÕn",1416,1},
	{"Xóc x¾c",1417,1},
	{"C©y nÕn",1418,1},
	{"HuyÒn Vâ v¨n kİnh",1419,1},
	{"Chu T­íc v¨n kİnh",1420,1},
	{"LÖnh bµi dòng sÜ",1421,1},
	{"RÔ c©y ngµn n¨m",1422,1},
	{"Nghiªn mùc",1423,1},
	{"B¹ch cèt phiÕn",1177,1},
	{"§Çu C« L©u",1178,1},
}
Zgc_conf_task_goods_need = {50,90,140,200,400}
-------------------------------------------------¹¦ÄÜº¯ÊıÇø----------------------------------------------
--***********************°ï»áÈÎÎñNPC¶Ô»°Ö÷º¯Êı***********************
function Zgc_conf_task_main_dialog()				
	Say("10 n¨m tr­íc giang hå xuÊt hiÖn mét cao thñ Bé Phi Yªn x­ng lµ Thóy Yªn Tiªn Tö, ng­êi nµy vâ nghÖ cao c­êng, th©n ph¸p uyÓn chuyÓn. Sau lÇn thİch s¸t chinh nam t­íng qu©n Liªu quèc kh«ng thµnh bçng nhiªn biÖt v« ©m tİn, nh­ng gÇn ®©y nghe nãi ®· xuÊt hiÖn l¹i lµ mét ng­êi hoµn toµn kh¸c kh«ng ai cã thÓ nhËn ra, ®iÒu nµy còng h¬i kú l¹. Quı bang v× Vâ L©m cã thÓ t×m ra ®­îc nguyªn nh©n thÕ nµo.",
		2,
		"Nh­ng ta ch­a tõng nghe qua ng­êi nµy, ph¶i lµm thÕ nµo ®©y?/Zgc_conf_task_dialog_1",
		"Ta còng kh«ng cã høng thó víi con ng­êi nµy, th«i bá ®i!/Zgc_end_dialog"
	)
	if GetTask(956) == 0 then
		SetTask(956,1)
	end
end
--*************************
function Zgc_conf_task_dialog_1()
	Say("Theo ta ®­îc biÕt, lÔ mõng ®¹i thä thÊt thËp cña th¸i hËu c¸c quËn, ch©u ®Òu ph¶i mang Sinh ThÇn C­¬ng vÒ kinh thµnh, ®­¬ng nhiªn lµ Bé Phi Yªn sÏ kh«ng bá lì c¬ héi nµy. Ta muèn lµm gi¶ Sinh ThÇn C­¬ng ®Ó dô h¾n vµ ®ång bän cña h¾n. Ng­¬i mau thu xÕp nhĞ!",
		1,	
		"Ta biÕt råi/Zgc_end_dialog"
	)
end
--***************************·ÇµÚÒ»´Î¶Ô»°º¯Êı************************
function Zgc_conf_task_dialog_2()
	Say("Bé l÷ khinh doanh thñ thËm khan, phi tiªn ®¾c kiÕn d· h·n nham. Yªn vi vô nhiÔu th©n bÊt hiÖn, hoa l¹c ng­ng huyÕt thŞ Phi Yªn. Bµi th¬ nµy 10 n¨m tr­íc do Bé Phi Yªn viÕt, nÕu kh«ng nhanh chãng tiªu trõ e r»ng thiªn h¹ sÏ ®¹i lo¹n!",
		7,
		"Ta muèn t×m hiÓu nhiÖm vô nµy/Zgc_conf_task_content",
		"Ta muèn t×m hiÓu con ng­êi Bé Phi Yªn/Zgc_conf_task_boss_con",
		"Ta muèn xem tiÕn ®é cña bang héi/Zgc_conf_task_step_inq",
		"Ta muèn nép vËt phÈm/Zgc_conf_taskgoods_turnin",
		--"ÎÒÏëÁË½âÆäËû°ïÅÉµÄ¶¯¾²/Zgc_conf_task_fini_list",
		"Bang ph¸i cña ta muèn nhËn nhiÖm vô nµy (bang chñ, phã bang chñ, tr­ëng l·o ®Òu cã thÓ tiÕp nhËn)/Zgc_conf_task_get",
		"Bang ph¸i cña ta muèn nhËn phÇn th­ëng nhiÖm vô (bang chñ nhËn)/Zgc_conf_task_pay",
		"Ta cã viÖc råi/Zgc_end_dialog"
	)
end
--***************************ÈÎÎñ½éÉÜ********************************
function Zgc_conf_task_content()
	Talk(2, "", 
		"NhiÖm vô nµy 2 ngµy 1 lÇn, do bang chñ, phã bang chñ hoÆc tr­ëng l·o ®Õn Thµnh §« gÆp tiªu s­ ®Ó nhËn nhiÖm vô bang héi <color=red>(NhiÖm vô ph©n thµnh 9 cÊp, cÊp cµng cao sÏ nhËn ®­îc cµng nhiÒu Sinh ThÇn Cang, ®­¬ng nhiªn vËt phÈm thu thËp còng ph¶i cµng nhiÒu)<color>, sau ®ã bang chóng ®Õn gÆp Tiªu s­ ë Thµnh §« ®Ó nhËn vËt phÈm.",
		"<color=red>Bang chóng cÊp 50 trë lªn giíi h¹n giao 400 lÇn cho mçi vßng (d­íi cÊp 50 sè lÇn sÏ gi¶m dÇn) <color>. Bang chñ, Phã bang chñ hoÆc Tr­ëng l·o cã thÓ ®Õn nhËn Sinh ThÇn Cang ®Ó dô Bé Phi Yªn vµ ®ång bän cña h¾n. Néi trong 2 ngµy tÊt c¶ bang ph¸i kh«ng nép ®ñ vËt phÈm thu thËp nhiÖm vô lËp tøc ph¶i dõng l¹i vµ lµm l¹i tõ ®Çu."
	)
end
--***************************ÈËÎï½éÉÜ*********************************
function Zgc_conf_task_boss_con()
	Say("Bé Phi Yªn con ng­êi nµy ta còng chØ biÕt cã vËy, c¸c ng­¬i t×m hiÓu thªm.",
		8,
		"Ta muèn t×m hiÓu: Bé Phi Yªn/#Zgc_conf_task_boss(1)",
		"Ta muèn t×m hiÓu: H¹ C¶nh Th¾ng/#Zgc_conf_task_boss(2)",
		"Ta muèn t×m hiÓu: NhiÕp §¹i Chïy/#Zgc_conf_task_boss(3)",
		"Ta muèn t×m hiÓu: C«n Lu©n N«/#Zgc_conf_task_boss(4)",
		"Ta muèn t×m hiÓu: Linh Hµng/#Zgc_conf_task_boss(5)",
		"Ta muèn t×m hiÓu: LiÔu NghŞ/#Zgc_conf_task_boss(6)",
		"Ta muèn t×m hiÓu: Hång TuyÕn/#Zgc_conf_task_boss(7)",
		"Ta biÕt råi/Zgc_end_dialog"
	)	
end
function Zgc_conf_task_boss(boss_seq)
	Say("<color=green>Tiªu S­<color>:"..Zgc_conf_task_boss_jies[boss_seq],
		3,
		" Thao t¸c kh¸c/Zgc_conf_task_dialog_2",
		"T×m hiÓu tin tøc BOSS kh¸c/Zgc_conf_task_boss_con",
		"Ta biÕt råi/Zgc_end_dialog"
	)
end
--****************************ÅÅĞĞ°ñ**********************************
function Zgc_conf_task_fini_list()
	
end
--***************************°ï»áÈÎÎñ½ø¶È²éÑ¯*************************
function Zgc_conf_task_step_inq()
	if IsTongMember() == 0 then
		Say("Ng­¬i vÉn ch­a gia nhËp bang héi µ?",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
		return
	end
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackStepInq")
end
--**************************°ï»áÈÎÎñ½ø¶È²éÑ¯»Øµ÷**********************
function CallBackStepInq(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--Êı¾İÕûÀíÅĞ¶Ï--
	if tong_level_max == nil or tong_level_max <= 0 then
		ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
		return
	end
	--½áÊø--
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	local dialog_date_now = ""					--±¾ÂÖÈÎÎñ½áÊøÊ±¼ä
	local dialog_date_next =""					--ÏÂÂÖÈÎÎñ¿ªÊ¼Ê±¼ä
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date_now = "24h tèi nay "
		dialog_date_next = "24h tèi mai "
	else
		dialog_date_now = "24h tèi mai "
		dialog_date_next = "24h tèi mèt "
	end
	if tong_state == 1 then
		Say("Quı bang vÉn ch­a nhËn chuçi nhiÖm vô nµy, chuçi nhiÖm vô nµy ®Õn <color=yellow>"..dialog_date_now.."<color> kÕt thóc.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)		
	elseif tong_state == 2 then
		Say("Quı bang ®· nhËn nhiÖm vô, t×nh h×nh thu thËp vµ giao nép vËt phÈm lµ:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..", chuçi nhiÖm vô nµy ®Õn"..dialog_date_now.."kÕt thóc",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	elseif tong_state == 3 then
		Say("NhiÖm vô lÇn nµy cña quı bang ®· hoµn thµnh, bang chñ cã thÓ ®Õn nhËn phÇn th­ëng.",
			2,
			"Ta muèn nhËn phÇn th­ëng/Zgc_conf_task_pay",
			"Ta biÕt råi/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("NhiÖm vô ®· hoµn thµnh vµ phÇn th­ëng còng ®· nhËn. Xin h·y lµm chuçi nhiÖm vô tiÕp theo, chuçi nhiÖm vô tiÕp theo ®Õn <color=yellow>"..dialog_date_now.."<color> b¾t ®Çu.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	end
end
--*************************°ï»áÈÎÎñ½ÓÊÜº¯Êı***************************
function Zgc_conf_task_get()
	if IsTongMember() == 0 then 																--ÅĞ¶ÏÊÇ·ñÈë°ï
		Say("Bé Phi Yªn kh«ng ph¶i lµ ng­êi b×nh th­êng. Ng­¬i mau gia nhËp bang héi, b¶o bang chñ ®Õn gÆp ta nghÜ c¸ch ®èi phã víi Bé Phi Yªn!",
			1,
			"Gia nhËp bang héi råi sau h·y nãi/Zgc_end_dialog"
		)
	elseif IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() ==3 then				--ÅĞ¶Ï°ï»áÖ°Îñ
		ApplyRelayShareData(GetTongName(),0,0,File_name,"ConfTaskGetCallBack")
	else
		Say("ChuyÖn nµy kh¸ quan träng! H·y gäi bang chñ, phã bang chñ hoÆc tr­ëng l·o ®Õn nhËn nhiÖm vô.",
			1,
			"Ta sÏ quay l¹i sau!/Zgc_end_dialog"
		)		
	end
end
--*****************************ÈÎÎñ½ÓÊÜÊı¾İ´æ´¢»Øµ÷************************
function ConfTaskGetCallBack(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--Êı¾İÕûÀíÅĞ¶Ï--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--½áÊø--
	local tong_ID_save = Zgc_conf_task_time_return()
	if tong_ID == tong_ID_save then
		Say("Quı bang ®· nhËn mét phÇn chuçi nhiÖm vô, xin kiÓm tra l¹i tiÕn ®é hoµn thµnh.",
			2,
			"Ta muèn xem tiÕn ®é cña bang héi/Zgc_conf_task_step_inq",
			"Ta biÕt råi/Zgc_end_dialog"
		)
	elseif tong_ID ~= tong_ID_save and tong_state == 3 then
		Say("Quı bang ®· hoµn thµnh nhiÖm vô nh­ng ch­a nhËn phÇn th­ëng, xin h·y nhËn phÇn th­ëng!",
			2,
			"Ta muèn nhËn Sinh ThÇn Cang/Zgc_conf_task_pay",
			"Ta biÕt råi/Zgc_end_dialog"
		)
	else
		if tong_state == 2 and tong_num < Zgc_conf_task_goos_num[tong_level][1] then
			if tong_level_max > 1 then
				tong_level_max = tong_level_max - 1
				SendTongMessage("Do ch­a hoµn thµnh nhiÖm vô Bé Phi Yªn lÇn tr­íc nªn ®¼ng cÊp nhiÖm vô sÏ bŞ gi¶m 1 cÊp")
			end
		end
		if tong_level_max == nil or tong_level_max <= 0 then
			tong_level_max = 1
		end
		local dialog = {}
		for i = 1, tong_level_max do
			dialog[i] = "thø"..i.." cÊp, cÇn "..Zgc_conf_task_goos_num[i][1].." thu thËp vËt phÈm, cã thÓ ®æi "..Zgc_conf_task_goos_num[i][2].." phÇn th­ëng/#Zgc_conf_task_accept("..i..","..tong_level_max..")"
		end
			dialog[tong_level_max + 1] = "Ta vÉn ch­a hiÓu/Zgc_end_dialog"
		Say("Xin chän ®¼ng cÊp nhiÖm vô muèn tiÕp nhËn!:",
			getn(dialog),dialog
		)		
	end
end
--******************************ÈÎÎñ½ÓÊÜ****************************
function Zgc_conf_task_accept(task_level,level_max)
	local tong_ID = Zgc_conf_task_time_return()
	local tong_level = task_level
	local tong_num = 0											--ĞÂ½ÓÈÎÎñ£¬½»ÄÉÊÕ¼¯Æ·Îª0
	local tong_state = 2
	local tong_level_max = level_max
	if tong_level_max > getn(Zgc_conf_task_goos_num) then
		tong_level_max = getn(Zgc_conf_task_goos_num)
	end	
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Msg2Player("Bang héi cña ng­¬i ®· nhËn nhiÖm vô cÊp"..task_level.."!")
	SendTongMessage(GetName().."§· nhËn "..task_level.." (cÊp) nhiÖm vô, thµnh viªn trong bang cã thÓ ®Õn tiªu s­ ®Ó giao vËt phÈm")
	WriteLogEx(strLogCaption, "nhËn nhiÖm vô Bang héi", "", "", "", GetTongName())
end
--*************************°ï»áÈÎÎñÎïÆ·ÊÕ¼¯º¯Êı***********************
function Zgc_conf_taskgoods_turnin()
	local cent_num_save = Zgc_conf_task_cent_date(0,956)
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	if GetLevel() < 77 then
		Say("Ng­¬i ch­a ®ñ n¨ng lùc, cè g¾ng luyÖn thªm n÷a nhĞ!",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	return
	end
	if IsTongMember() == 0 then
		Say("Bé Phi Yªn kh«ng ph¶i lµ ng­êi b×nh th­êng. Ng­¬i mau gia nhËp bang héi, b¶o bang chñ ®Õn gÆp ta nghÜ c¸ch ®èi phã víi Bé Phi Yªn!",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
		return
	elseif task_id_save == Zgc_conf_task_time_return() and (Zgc_conf_task_num_max() - cent_num_save)<=0 then
			local dialog = ""
			if Zgc_conf_task_dist_date() == 1 then
				dialog = "Ngµy mai"
			else
				dialog = "Ngµy mèt"
			end
			Say("§iÓm cèng hiÕn cña ng­¬i hiÖn lµ:"..Zgc_conf_task_num_max()..","..dialog.."Thö n÷a ®i!",
				1,
				"Ta biÕt råi/Zgc_end_dialog"
			)
			return
	else
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGoodsin")
	end
end
function CallBackGoodsin(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--Êı¾İÕûÀíÅĞ¶Ï--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--½áÊø--
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	if tong_ID ~= Zgc_conf_task_time_return() then
		tong_state = 1
	end
	if tong_state == 2 then																--¸Ã°ïÅÉÒÑ¾­ÁìÈ¡ÈÎÎñ£¬µ«ÊÇÊÕ¼¯ÎïÆ·ÊıÁ¿²»×ã
		local cent_remain = 0
		if task_id_save ~= Zgc_conf_task_time_return() then								--ÏÈÅĞ¶Ï¸öÈËµÄÊÕ¼¯Æ·½ÉÄÉÇé¿ö
			cent_remain = Zgc_conf_task_num_max()
		else
			cent_remain = Zgc_conf_task_num_max() - goods_num_save
		end
		Say("Quı bang ®· nhËn nhiÖm vô, ®iÓm tİch lòy hiÖn lµ:"..tong_num.."/"..Zgc_conf_task_goos_num[tong_level][1]..". §¼ng cÊp hiÖn t¹i cã thÓ thu thËp vËt phÈm cèng hiÕn cho bang héi."..Zgc_conf_task_num_max().."®iÓm tİch lòy, trŞ ®iÓm tİch lòy h«m nay:"..cent_remain..". \n <color=red>Ta còng kh«ng thÓ qu¶n ®­îc hµnh trang cña ng­¬i, vËt phÈm nµo dïng ®­îc ng­¬i tù cÊt vµo r­¬ng nhĞ!<color>",
				2,
				"Ta cÇn giao vËt phÈm/Zgc_task_goods_inconf",
				"Quay l¹i sau nhĞ/Zgc_end_dialog"
			)
	elseif tong_state == 3 then
		Say("NhiÖm vô nµy ®· hoµn thµnh. Bang chñ, phã bang chñ, tr­ëng l·o ®Òu cã thÓ ®Õn nhËn phÇn th­ëng.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	elseif tong_state == 4 then
		Say("Quı bang ®· hoµn thµnh nhiÖm vô vµ nhËn phÇn th­ëng, xin ®îi vßng nhiÖm vô sau.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	else
		Say("Quı bang vÉn ch­a nhËn nhiÖm vô lÇn nµy.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)			
	end
end
--*****************************ÎïÆ·ÊÕ¼¯È·ÈÏ***************************
function Zgc_task_goods_inconf()
	Say("Trong hµnh trang cña ng­¬i kh«ng cã vËt phÈm nµo quan trong ®ã chø!",
		2,
		"Ta muèn giao vËt phÈm/Zgc_task_goods_change",
		"§Ó ta s¾p xÕp l¹i hµnh trang/Zgc_end_dialog"
	)
end
--*****************************ÊÕ¼¯´¦Àíº¯Êı***************************
function Zgc_task_goods_change()															--ÊÕ¼¯Æ·µÄ¼ÆËãºÍ¿Û³ı
	if GetFreeItemRoom() < 2 or (GetMaxItemWeight() - GetCurItemWeight()) < 200 then
		Say("Hµnh trang kh«ng ®ñ « trèng hoÆc ®é nÆng, h·y s¾p xÕp l¹i.",0)
		return
	end
	local cent_count = 0
	local task_id_save = Zgc_conf_task_cent_date(1,956)
	local goods_num_save = Zgc_conf_task_cent_date(0,956)
	local cent_remain = 0
	if task_id_save ~= Zgc_conf_task_time_return() then								--ÏÈÅĞ¶Ï¸öÈËµÄÊÕ¼¯Æ·½ÉÄÉÇé¿ö
		cent_remain = Zgc_conf_task_num_max()
	else
		cent_remain = Zgc_conf_task_num_max() - goods_num_save
	end
	for i = 1,getn(Zgc_conf_task_coll_goods) do
		if cent_remain > 0 then
			local goods_num = GetItemCount(2,1,Zgc_conf_task_coll_goods[i][2])						--ÎïÆ·ÊıÁ¿
			local goods_cent = floor(goods_num * Zgc_conf_task_coll_goods[i][3])					--ÎïÆ·¿É¶Ò»»»ı·Ö
			if  goods_num > 0 and goods_cent > 0 then										
				if goods_cent >= cent_remain then													--ÎïÆ·ÊÕ¼¯ÊÇ·ñµ½´ï400ÉÏÏŞ
					local needs_num = floor(goods_num *cent_remain/goods_cent)
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],needs_num)		--É¾³ıÊÕ¼¯Æ·
					if remove_flag == 0 then														
						break																		--É¾³ıÊ§°ÜÍË³ö
					else
						cent_count = cent_count + cent_remain
						local nRnd = random(1,100)
						if nRnd <= CONFTASKBOSSCREATE_RATE and IsTongMember() >= 1 and IsTongMember() <= 5 and GetLevel() >= 50 then
							local add_flag = AddItem(2,0,545,1)
							if add_flag ~= 0 then
								Msg2Player("B¹n nhËn ®­îc 1 Sinh ThÇn Cang.")
								SendTongMessage(GetName().."NhËn phÇn th­ëng nhiÖm vô Bé Phi Yªn: 1 c¸i Sinh ThÇn Cang")
								WriteLogEx(strLogCaption, " nhËn 1 Sinh ThÇn Cang", "", GetTongName())
							end
						end												
					end
					local dialog_date = ""
					if Zgc_conf_task_dist_date() ==  1 then
						dialog_date = "Ngµy mai"
					else
						dialog_date = "Ngµy mèt"
					end
					Say("Chuçi nhiÖm vô nµy ng­¬i ®· giao ®ñ vËt phÈm,"..dialog_date.."Thö n÷a ®i!",
						1,
						"Ta biÕt råi/Zgc_end_dialog"
					)
					break
				else
					local remove_flag = DelItem(2,1,Zgc_conf_task_coll_goods[i][2],goods_num)		--É¾³ıÊÕ¼¯Æ·
					if remove_flag == 0 then
						break
					else
						cent_count = cent_count + goods_cent
						cent_remain = cent_remain - goods_cent										--½«¿ÉÌá½»µÄÊÕ¼¯Æ·»ı·Ö¼õÉÙ
					end
				end
			end
		end
	end																								--É¾³ıÍæ¼ÒÊÕ¼¯Æ·½áÊø
	if cent_count == 0 then
		Say("Ngay c¶ vËt phÈm nhiÖm vô mµ ng­¬i còng kh«ng cã, thËt mÊt thêi gian cña ta!",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	else
		Msg2Player("VËt phÈm cña ng­¬i ®· cèng hiÕn cho bang héi"..cent_count.."®iÓm tİch lòy!")
		SetTaskTemp(157,cent_count)																	--±¾´ÎÉÏ½»µÄĞÅÏ¢·ÅÈëÁÙÊ±±äÁ¿
		local goods_cent_total = 0
		if Zgc_conf_task_cent_date(1,956) == Zgc_conf_task_time_return() then						--±¾ÂÖÒÑ¾­Ìá½»¹ıµÄ´¦Àí
			goods_cent_total = Zgc_conf_task_cent_date(0,956) + cent_count
			goods_cent_total = (goods_cent_total * 10000) + Zgc_conf_task_time_return()
		else																						--½«½üÈıÂÖµÄĞÅÏ¢ÒÀ´ÎÑ¹Èë
			SetTask(958,GetTask(957))
			SetTask(957,GetTask(956))
			goods_cent_total = (cent_count * 10000) + Zgc_conf_task_time_return()
		end
		SetTask(956,goods_cent_total)
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackConfDeal")
	end
end
--*************************Íæ¼ÒÌá½»ÊÕ¼¯Æ·µÄ°ï»á´¦Àí********************
function CallBackConfDeal(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local player_goods_num = GetTaskTemp(157)
	local dialog_date = ""
	if Zgc_conf_task_dist_date() ==  1 then
		dialog_date = "24h tèi nay "
	else
		dialog_date = "24h tèi mai "
	end
	local need_num = ""
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) then
		need_num =" ®· hoµn thµnh."
	else
		need_num = "Cßn thiÕu "..(Zgc_conf_task_goos_num[tong_level][1] - tong_num - player_goods_num).."®iÓm tİch lòy."	
	end
	local money_prize = task_money_prize(player_goods_num)
	if money_prize ~= 0 then				---½ğÇ®Ôö¼Ó
		Earn(money_prize)
		WriteLogEx(strLogCaption, "nhËn", money_prize, "tiÒn vµng", "", GetTongName())
	end
	SendTongMessage(GetName().."Hoµn thµnh nhiÖm vô Bé Phi Yªn"..player_goods_num.."®iÓm tİch lòy!")
	SendTongMessage("Chuçi nhiÖm vô nµy ®Õn:"..dialog_date.." kÕt thóc, quı bang hiÖn ®· hoµn thµnh "..need_num)
	if player_goods_num >= (Zgc_conf_task_goos_num[tong_level][1] - tong_num ) and tong_state == 2 then
		SendTongMessage("Quı bang ®· hoµn thµnh thuËn lîi nhiÖm vô Sù mª hoÆc cña Bé Phi Yªn, bang chñ ®Õn gÆp Tiªu s­ ë Thµnh §« nhËn th­ëng!")
		if tong_level_max < getn(Zgc_conf_task_goos_num) then
			tong_level_max = tong_level_max + 1
			SendTongMessage("Quı bang ®· hoµn thµnh nhÖm vô Bé Phi Yªn, cã thÓ nhËn"..tong_level_max.."!!")
		end
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],3,tong_level_max)
	else
		tong_num = tong_num + player_goods_num
		AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	end
	SetTaskTemp(157,0)
	SaveNow()
end
--**************************°ï»áÈÎÎñÊı¾İ×ªÒÆ************************
function CallBackDataRepair(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,GetTongName())
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	if tong_level_max == nil or tong_level_max <= 0 then
		tong_ID = 0
		tong_level = 0
		tong_num = 0
		tong_state = 0
		tong_level_max = 6
	end
	if tong_level_max >= 3 then
		WriteLog("Phôc håi sè lÇn nhiÖm vô bang héi thµnh c«ng, tªn nh©n vËt:["..GetName().."] Tªn bang héi: ["..GetTongName().."]")
	end
	AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,tong_num,tong_state,tong_level_max)
	Say("Ng­¬i t×m ta cã viÖc g× kh«ng?",
		7,
		"Ta muèn t×m hiÓu nhiÖm vô nµy/Zgc_conf_task_content",
		"Ta muèn t×m hiÓu con ng­êi Bé Phi Yªn/Zgc_conf_task_boss_con",
		"Ta muèn xem tiÕn ®é cña bang héi/Zgc_conf_task_step_inq",
		"Ta muèn nép vËt phÈm/Zgc_conf_taskgoods_turnin",
		--"ÎÒÏëÁË½âÆäËû°ïÅÉµÄ¶¯¾²/Zgc_conf_task_fini_list",
		"Bang ph¸i cña ta muèn nhËn nhiÖm vô nµy (bang chñ, phã bang chñ, tr­ëng l·o ®Òu cã thÓ tiÕp nhËn)/Zgc_conf_task_get",
		"Bang ph¸i cña ta muèn nhËn phÇn th­ëng nhiÖm vô (bang chñ nhËn)/Zgc_conf_task_pay",
		"Ta cã viÖc råi/Zgc_end_dialog"
	)
end
--*****************************½ğÇ®¼ÆËã***************************
function task_money_prize(cent)
	local money_prize = {2000,4000,7500,12000}
	local player_level = GetLevel()
	local money_num = 0
	if player_level <= 30 then
		money_num = floor(sqrt(player_level) * money_prize[1] * cent/400)
	elseif player_level <= 50 then
		money_num = floor(sqrt(player_level) * money_prize[2] * cent/400)
	elseif player_level <= 70 then
		money_num = floor(sqrt(player_level) * money_prize[3] * cent/400)
	else
		money_num = floor(sqrt(player_level) * money_prize[4] * cent/400)
	end
	return money_num
end
--*************************°ï»á½±Àø¸øÓèº¯Êı****************************
function Zgc_conf_task_pay()
	--0Îª´ÓÎ´ÁìÈ¡ÈÎÎñ£¬1ÎªÁìÈ¡¹ıÈÎÎñ£¬2ÁìÈ¡ÁËÈÎÎñÉĞÎ´Íê³É£¬3ÎªÁìÈ¡ÈÎÎñÇÒÒÑ¾­Íê³Éµ«ÊÇÃ»ÓĞÁìÈ¡½±Àø£¬4ÎªÍê³ÉÇÒÒÑ¾­ÁìÈ¡½±Àø¡£
	if IsTongMember() == 0 then
		Say("Ng­¬i muèn gia nhËp m«n ph¸i.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
		return
	elseif IsTongMember() ~= 1 then
		Say("Ng­¬i kh«ng cã quyÒn nhËn phÇn th­ëng cña bang héi!",
			1,
			"Ta biÕt råi/Zgc_end_dialog")
	else
		SetTaskTemp(Tasktemp_task_return,Zgc_conf_task_time_return())
		ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackPrizeGet")
	end
end
--****************************°ï»á½±Àø¸øÓèµ÷ÓÃº¯Êı*********************
function CallBackPrizeGet(szKey, nKey1, nKey2, nCount)
	local tong_ID,tong_level,tong_num,tong_state,tong_level_max = GetRelayShareDataByKey(szKey, nKey1, nKey2,"0")	
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	--Êı¾İÕûÀíÅĞ¶Ï--
		if tong_level_max == nil or tong_level_max <= 0 then
			ApplyRelayShareData("yanni",0,0,File_name,"CallBackDataRepair")
			return
		end
	--½áÊø--
	if tong_state == 2 then																--¸Ã°ïÅÉÒÑ¾­ÁìÈ¡ÈÎÎñ£¬µ«ÊÇÊÕ¼¯ÎïÆ·ÊıÁ¿²»×ã
		if tong_ID == Zgc_conf_task_time_return() then
			Say("Quı bang ®· nhËn nhiÖm vô nh­ng ch­a hoµn thµnh kh«ng thÓ nhËn phÇn th­ëng. Xin kiÓm tra l¹i tiÕn ®é hoµn thµnh",
				2,
				"Ta muèn xem tiÕn ®é cña bang héi/Zgc_conf_task_step_inq",
				"Ta biÕt råi/Zgc_end_dialog"
			)
		else
			Say("Quı bang ch­a nhËn nhiÖm vô sao l¹i lÜnh th­ëng?",
				1,
				"Ta biÕt råi/Zgc_end_dialog"
			)
		end
	elseif tong_state == 1 or tong_state == 0 or tong_state == nil then
		Say("Quı bang vÉn ch­a nhËn nhiÖm vô lÇn nµy.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)			
	elseif tong_state == 3 then
		local box_num = Zgc_conf_task_goos_num[tong_level][2]
		if GetFreeItemRoom() < (floor(box_num/10) + 1) or (GetMaxItemWeight() - GetCurItemWeight()) < box_num then									--=========================ÔÚ´Ë¼ÓÈë¸ºÖØºÍ¿Õ¸ñÊıµÄÅĞ¶Ï
			Say ("Huynh ®Ö nµy, s¾p xÕp l¹i hµnh lı råi h·y quay l¹i nhĞ!",
				1,
				"Ta biÕt råi!/Zgc_dialog_end"
			)
		else
			if GetTaskTemp(Tasktemp_task_return) ~= Zgc_conf_task_time_return() then
				return
			else
				SetTaskTemp(Tasktemp_task_return,(GetTask(Tasktemp_task_return)-1))
				local add_flag = AddItem(2,0,545,box_num)				--test
				if add_flag ~= 0 then
					Msg2Player("NhiÖm vô lÇn nµy b¹n nhËn"..box_num..", Sinh ThÇn Cang.")
					SendTongMessage(GetName().."NhËn phÇn th­ëng nhiÖm vô Bé Phi Yªn: Sinh ThÇn Cang"..box_num.."c¸i")
				WriteLogEx(strLogCaption, "nhËn", box_num, "Sinh ThÇn Cang", "", GetTongName())
				else
				WriteLogEx(strLogCaption, "", "", "", "", GetTongName(), "®æi phÇn th­ëng: Sinh ThÇn Cang thÊt b¹i! TrŞ ph¶n håi:"..add_flag)
				end
				AddRelayShareData(GetTongName(), 0, 0, File_name, "cb", 0,"0", "ddddd", tong_ID,tong_level,Zgc_conf_task_goos_num[tong_level][1],4,tong_level_max)
			end
		end
	elseif tong_state == 4 then
		Say("Quı bang ®· hoµn thµnh nhiÖm vô vµ nhËn phÇn th­ëng, xin ®îi vßng nhiÖm vô sau.",
			1,
			"Ta biÕt råi/Zgc_end_dialog"
		)
	end
end
--***************************¶Ô»°½áÊø£¨Îª¿Õ£©**************************
function Zgc_end_dialog()
	
end
--***************************»Øµ÷£¨Îª¿Õ£©**************************
function cb()

end
--**************************ÂÖ´Î¼ÆËãº¯Êı*******************************
function Zgc_conf_task_time_return()
	local time_return = floor((GetTime() - 61200)/(172800))
	return time_return
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
--**************************ÏÂÒ»ÂÖÊ±¼ä¼ÆËã*****************************
function Zgc_conf_task_dist_date()
	local date_tomorrow = floor((GetTime() + 25200)/(172800))
	if Zgc_conf_task_time_return() == date_tomorrow then
		return 2
	else
		return 1
	end
end
--*************************¿ÉÊÕÈ¡ÊÕ¼¯Æ·ÉÏÏŞ¼ÆËãº¯Êı**********************
function Zgc_conf_task_num_max()
	local ruturn_num = 0
	if GetLevel() > 50 then
		ruturn_num = 400
	else
		local num_seq = floor(GetLevel()/10)
		ruturn_num = Zgc_conf_task_goods_need[num_seq]
	end
	return ruturn_num
end
