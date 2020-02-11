-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII Î÷±±ÇøÈÎÎñ¹ı³Ì´¦ÀíÎÄ¼ş
-- By StarryNight
-- 2007/06/06 AM 10:51

-- ÎÒÃÇÖ»ÓĞ³ÁÄ¬µÄ´æÔÚ£¬Ã»ÓĞ¿ÉÒÔ··ÂôµÄÎ´À´

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\xibei\\xibei_task_award.lua");

--½â³ı÷¼÷ÃÍõ·âÓ¡µÄÖäÓï
KULOUWANG_CURSE = {
	[1] = "NhÊt viÕt thiªn chi, nhŞ viÕt ®Şa chi, tam viÕt nh©n chi; tø ph­¬ng th­îng h¹, t¶ h÷u tiÒn hËu, xuÊt yÓu yÓu, nhËp minh minh, hµ thÇn bÊt phôc, hµ quû c¶m ®­¬ng.",
	[2] = "NhÊt viÕt tr­êng môc, nhŞ viÕt phi nhÜ, tam viÕt thô minh; thiªn lı chi ngo¹i, Èn vi chi trung, thiªn ®¹o tÊt, nhËt nguyÖt c©u, tiªn s¸t ¸c quû, hËu tr¶m d¹ quang.",
	[3] = "NhÊt viÕt môc minh, nhŞ viÕt nhÜ th«ng, tam viÕt t©m trİ; t¶ phï lôc gi¸p, h÷u vÖ lôc ®inh, th­îng thiªn quû, h¹ ®Şa s¸t, gian tµ hãa khİ, quû tÆc tiªu vong."
	}

--·âÓ¡»ÃÏóÔ­ĞÍµÄÖäÓï
HUANXIANG_CURSE = {
	[1] = "D­¬ng ®éng nhi hµnh, ©m chØ nhi tµng; dÜ d­¬ng ®éng gi¶, ®øc t­íng sinh d·. ¢m d­¬ng chi lùc ®·i khø, bÊt ®¾c cöu ®×nh.",
	[2] = "D­¬ng ®éng nhi xuÊt, ©m Èn nhi nhËp; dÜ ©m tŞnh gi¶, h×nh t­íng thµnh d·. DÜ ©m d­¬ng thİ chi, chÕ chi dÜ xuÊt nhËp.",
	[3] = "D­¬ng viÔn chung ©m, ©m cùc ph¶n d­¬ng; dÜ d­¬ng cÇu ©m, bµo dÜ ®øc d·. DÜ ©m kÕt d­¬ng, thi dÜ lùc thu chi."
	}

--Î÷±±ÈÎÎñ³ÆºÅ
--[¶ÔÓ¦µÄÅäÖÃ±í¸±Ààid] = {"³ÆºÅÃû³Æ",¶ÔÓ¦±äÁ¿,¶ÔÓ¦±äÁ¿Öµ
YIPINGTANG_TITLE = {
	[1] = {"NhÊt PhÈm §­êng-T©n BŞ",2030,17},
	[2] = {"NhÊt PhÈm §­êng-Thİch Kh¸ch",2030,34},
	[3] = {"NhÊt PhÈm §­êng-Phi Hé",2031,9},
	[4] = {"NhÊt PhÈm §­êng-Hæ Dùc",2031,23},
	[5] = {"NhÊt PhÈm §­êng-Vò VÖ",2031,52},
	[6] = {"NhÊt PhÈm §­êng-Gian TÕ",2031,61},
	[7] = {"§iÖp ¶nh kú hiÖp",2031,68},
	}

---------------------------------- Î÷±±Çø01Î÷ÏÄ°µÓ¿----------------------------------

--µ½¿Ü×¼´¦ÁìÈ¡¡°Î÷±±Çø01Î÷ÏÄ°µÓ¿¡±ÈÎÎñ
function task_001_01_0()

local strTalk = {
		"GÇn ®©y ta nhËn ®­îc tin b¸o, T©y H¹ ®ang liªn hÖ mËt thiÕt víi n­íc Liªu. T©y H¹ nhê s¸ch l­îc v¨n trŞ vâ c«ng cña Lı Nguyªn H¹o ngµy mét lín m¹nh, tuy ngoµi mÆt thÇn phôc ®¹i Tèng, nh­ng sù thËt ®· ba n­íc Tèng, Liªu, T©y H¹ ®· h×nh thµnh thÕ kiÒng ba ch©n. T©y H¹ tr­íc nay hµnh sù cÈn träng, lÇn nµy d¸m c«ng nhiªn liªn hÖ víi n­íc Liªu, e sÏ bÊt lîi cho ®¹i Tèng ta.",
		"T©y H¹ dßm ngã giang s¬n ®¹i Tèng chuyÖn ®ã ai còng biÕt, nh­ng ®ång thêi còng rÊt nghi ng¹i n­íc Liªu. NÕu b¾t tay nhau th× T©y H¹ ®­îc lîi g× chø?",
		"T©y H¹ còng hiÓu râ ®¹o lı m«i hë r¨ng l¹nh, nªn ®· ©m thÇm ®iÒu ®éng thµnh viªn NhÊt PhÈm §­êng ë Trung Nguyªn ®èi phã víi ®¹i Tèng. NÕu chiÕm ®­îc Trung Nguyªn lµm c¨n cø, T©y H¹ sÏ ®ñ søc ®èi kh¸ng víi n­íc Liªu.",
		"Nãi vËy, T©y H¹ muèn m­în tay n­íc Liªu ®Ó chiÕm l·nh thæ ®¹i Tèng?",
		}

	TalkEx("task_001_01_0_1",strTalk);

end;

--Ğø¶Ô»°
function task_001_01_0_1()

local strTalk = {
	"RÊt cã thÓ. ë T©y H¹ phİa t©y Hµ T©y TÈu Lang lµ vïng hoang m¹c réng lín, nªn chóng rÊt thÌm muèn c¸c m¶nh ®Êt mµu mì. Qu©n ®éi ®¹i Tèng hiÖn ®ang tËp trung chiÕn lùc ë Nh¹n M«n Quan ®¸nh qu©n Liªu, mai nµy ¾t sÏ r¬i vµo thÕ gäng k×m, hai mÆt gi¸p ®Şch.",
	"Hµnh ®éng cña T©y H¹ thËt hiÓm ¸c, T©y H¹ vèn quen hµnh ®éng ngÇm, nay l¹i ®Ó th«ng tin bŞ rß rØ th× thËt ®¸ng nghi. KhÊu ®¹i nh©n, kh«ng biÕt ta cã thÓ gióp ®­îc g× cho «ng?",
	"<sex> trung qu©n ¸i quèc, lµ r­êng cét cña ®¹i Tèng ta. Nh­ng chØ víi søc cña mét m×nh <sex>, e lµ kh«ng ®ñ vµ còng rÊt nguy hiÓm. Tr­êng Ca M«n ¾t ®· n¾m th«ng tin vÒ ®éng th¸i cña T©y H¹, ng­¬i h·y tíi gÆp B¸ch HiÓu Sinh ë BiÖn Kinh, hái xem Tr­êng Ca M«n cã ®ång ı gióp ®iÒu tra viÖc nµy. Sù viÖc liªn quan ®Õn an nguy cña ®¹i Tèng, ng­¬i h·y khëi hµnh ngay.",
	"Cã sù trî gióp cña Tr­êng Ca M«n, ta ¾t sÏ ®iÒu ra râ ngän ngµnh."
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,1);
	TaskTip("NhËn ñy th¸c cña KhÊu ChuÈn, ®Õn BiÖn Kinh t×m B¸ch HiÓu Sinh nhê gióp ®ì.");
	Msg2Player("NhËn ñy th¸c cña KhÊu ChuÈn, ®Õn BiÖn Kinh t×m B¸ch HiÓu Sinh nhê gióp ®ì.");

end

--ÕÒ°ÙÏşÉúÖ®Ç°Óë¿Ü×¼¶Ô»°
function task_001_01_1()

local strTalk = {
	"<sex> trung qu©n ¸i quèc, lµ r­êng cét cña ®¹i Tèng ta. Nh­ng chØ víi søc cña mét m×nh <sex>, e lµ kh«ng ®ñ vµ còng rÊt nguy hiÓm. Tr­êng Ca M«n ¾t ®· n¾m th«ng tin vÒ ®éng th¸i cña T©y H¹, ng­¬i h·y tíi gÆp B¸ch HiÓu Sinh ë BiÖn Kinh, hái xem Tr­êng Ca M«n cã ®ång ı gióp ®iÒu tra viÖc nµy. Sù viÖc liªn quan ®Õn an nguy cña ®¹i Tèng, ng­¬i h·y khëi hµnh ngay.",
	"Cã sù trî gióp cña Tr­êng Ca M«n, ta ¾t sÏ ®iÒu ra râ ngän ngµnh."
	}

	TalkEx("",strTalk);

end

--Óë°ÙÏşÉú¶Ô»°
function task_001_02_0()

local strTalk = {
	"<sex> ¸nh m¾t ho¶ng hèt... kh«ng biÕt cã chuyÖn g×?",
	"T¹i h¹ biÕt ®­îc th«ng tin tõ KhÊu ChuÈn, T©y H¹ gÇn ®©y nhiÒu lÇn bİ mËt liªn hÖ víi Liªu Quèc, h×nh nh­ dù ®Şnh liªn minh x©m l­îc Tèng, nÕu lµ thËt th× §¹i Tèng sÏ bŞ tÊn c«ng tõ hai phİa, giang s¬n sÏ gÆp nguy c¬ trong mét sím mét chiÒu.",
	"ChuyÖn nµy Tr­êng Ca M«n ta còng cã nghe qua, vµ ë Phông T­êng dß th¸m ®­îc cã ng­êi T©y H¹ ®ang Èn nÊp, T©y H¹ hµnh sù bİ mËt thËn träng, nh­ng ta còng kh«ng ®o¸n ®­îc chóng l¹i ©m m­u víi Liªu Quèc, cã ı ®å quÊy rèi.",
	"T©y H¹ lÇn nµy nghi ngê bè trİ, t¹i h¹ sî m×nh c« thÕ kh«ng thÓ øng phã. Kh«ng biÕt Tr­êng Ca M«n cã thÓ gióp ®ì ®iÒu tra kh«ng?",
	"§¹i Tèng gÆp n¹n, Tr­êng Ca M«n ta lÏ nµo l¹i ngåi yªn sao? <sex> lßng ®Çy nhiÖt huyÕt, anh hïng thiÕu nªn, b¸ch HiÓu Sinh ta rÊt ng­ìng mé, thiÕu hiÖp an t©m, Tr­êng Ca M«n ta nhÊt ®Şnh sÏ gióp. ¢u D­¬ng Häa ®ang ë Phông T­êng, <sex> mang chØ thŞ cña ta ®Õn chç «ng ta, ®Ó ¢u D­¬ng Häa lËp tøc b¾t ®Çu ®iÒu tra chuyÖn nµy, sÏ kh«ng cã sai sãt.",
	"§a t¹ B¸ch HiÓu Sinh tiÒn bèi, t¹i h¹ lªn ®­êng ®©y."
	}

	SetTask(TASK_XB_ID,2);
	TalkEx("",strTalk);
	TaskTip("B¸ch HiÓu Sinh nhê b¹n mang chØ thŞ cña Tr­êng Ca M«n ®Õn cho ¢u D­¬ng Häa ë Phông T­êng.");
	Msg2Player("B¸ch HiÓu Sinh nhê b¹n mang chØ thŞ cña Tr­êng Ca M«n ®Õn cho ¢u D­¬ng Häa ë Phông T­êng.");
	GivePlayerAward("Award_XB_01","Easy");
	GivePlayerExp(SkeyXibei,"xixiafengbo")
end

--ÓëÅ·Ñô»­¶Ô»°Ç°Óë°ÙÏşÉú¶Ô»°
function task_001_02_1()

local strTalk = {
	"¢u D­¬ng Häa ®ang ë Phông T­êng, mau ®i t×m «ng ta."
	}

	TalkEx("",strTalk);

end

--ÓëÅ·Ñô»­¶Ô»°°ïÃ¦È¡Å®×°ÒÂ·ş
function task_001_03_0()

local strTalk = {
	"Xem tranh mü n÷ cña ta. <sex> cã thÊy tuyÖt vêi kh«ng, cã thÓ lµ siªu phÈm kh«ng?",
	"Ph¶i…ph¶i…thËt lµ ®Ñp….",
	"Ha ha ha, tuyÖt tuyÖt, xem ra <sex> lµ ng­êi hiÓu tranh, ¢u D­¬ng Häa ta b×nh sinh ghĞt nhÊt lµ ng­êi kh«ng hiÓu tranh! Ta lu«n ®­a thiÕu n÷ Tèng vµo tranh, thiÕu n÷ §¹i Tèng nhá nh¾n dŞu dµng, vµo trong tranh l¹i cµng quyÕn rò",
	"¢u D­¬ng tiÒn bèi nãi cã lı.(Hãa ra «ng ta chİnh lµ ¢u D­¬ng Häa….) §óng råi tiÒn bèi….",
	"Kh«ng sai kh«ng sai, lÇn nµy ta ®Õn T©y Vùc, muèn t×m hiÓu vÒ phong t×nh cña mü n÷ T©y Vùc. Nghe nãi thiÕu n÷ T©y Vùc tİnh khİ nãng n¶y, nÕu ®­a hä vµo tranh, e r»ng còng kh«ng ®¹t ®­îc ı muèn. Nh­ng vÏ kh«ng thÓ hiÖn ®­îc, th× kh«ng ph¶i ®¸ng tiÕc sao?",
	"(¢u D­¬ng Häa….®óng lµ kú danh thİch vÏ) tiÒn bèi…..",
	}


	SetTask(TASK_XB_ID,3);
	TalkEx("task_001_03_0_1",strTalk);
	TaskTip("§Õn B¾c Phông T­êng lÊy mét bé y phôc tõ ng­êi ®µn bµ T©y Vùc vµ ng­êi ®Ñp Ba T­. ");
	Msg2Player("§Õn B¾c Phông T­êng lÊy mét bé y phôc tõ ng­êi ®µn bµ T©y Vùc vµ ng­êi ®Ñp Ba T­. ");
	CreateTrigger(0,1220,KILL_XB_BOSIYAOJI);
	CreateTrigger(0,1221,KILL_XB_XIYUHANFU);
	GivePlayerExp(SkeyXibei,"fengxiang")
end

-- Ğø¶Ô»°
function task_001_03_0_1()

local strTalk = {
	"µ, cã c¸ch råi. HiÖn giê tuy kh«ng cã ng­êi thËt, nh­ng phôc søc cña thiÕu n÷ T©y Vùc diªm dóa phong t×nh, mµu s¾c ®éc ®¸o, ®­îc xem mét lÇn th× phong c¸ch tù nhiªn sÏ ®­îc lång vµo tranh, vËy còng tháa lßng.",
	"Nh­ng tiÒn bèi…..",
	"<sex> lµ ng­êi hiÓu tranh, ph¶i biÕt r»ng c¶m xóc lu«n d©ng trµo. Chóng ta chia nhau lµm, ta ®i mµi mùc, ng­¬i ®Õn phİa B¾c thµnh lÊy bé y phôc cña ng­êi ®Ñp Ba T­ vµ ng­êi ®µn bµ T©y Vùc, ta sÏ vÏ nªn bøc tranh giai nh©n tuyÖt ®Ñp. ",
	"VËy……",
	"Mau ®i ®i, c¶m xóc sÏ tan biÕn mÊt, cã thÓ ®­a thiÕu n÷ T©y Vùc vµo tranh lµ mét niÒm vui ®èi víi ta.",
	"… (xem ra chØ cÇn tháa m·n niÒm ao ­íc cña «ng ta ®·, råi tİnh sau)",
	}

	TalkEx("",strTalk);

end

--´ø»Ø»òÎ´´ø»ØÅ®×°¸øÅ·Ñô»­
function task_001_04_0()

local strTalk = {};

	--´ø»ØÅ®×°
	if GetItemCount(2,0,686) >= 1 and GetItemCount(2,0,687) >= 1 then
		strTalk = {
			"¢u D­¬ng tiÒn bèi, ®©y lµ ®å «ng cÇn.",
			"TuyÖt, thiÕu n÷ T©y Vùc qu¶ nhiªn lµ kh¸c víi thiÕu n÷ Trung nguyªn, thÓ hiÖn ®­îc vÎ ®Ñp, cã ı nghÜa cã ı nghÜa. µ, ®óng råi, <sex> t×m ta cã viÖc g×?",
			"(Cuèi cïng còng nhí ®Õn ta) TiÒn bèi cã ph¶i lµ ng­êi cña Tr­êng Ca M«n? Cã ph¸t hiÖn hµnh tung gÇn ®©y cña T©y H¹ kh«ng?",
			"Kh«ng sai, ta lµ ¢u D­¬ng Häa mét trong nh÷ng cÇm, kú, thi, häa cña Tr­êng Ca M«n, <sex> lµm sao biÕt ®­îc? GÇn ®©y ta còng ph¸t hiÖn sù xuÊt hiÖn cña ng­êi T©y H¹ ë Long M«n trÊn ngµy cµng nhiÒu.",
			"Qu¶ nhiªn lµ vËy. T«i cßn biÕt T©y H¹ bİ mËt liªn hÖ víi Liªu Quèc, sî quÊy rèi ®Õn §¹i Tèng ta, B¸ch HiÓu Sinh tiÒn bèi nhê «ng ®iÒu tra chuyÖn nµy, ®©y lµ th­ chØ thŞ cña quı m«n ph¸i.",
			"(xem xong th­) ¸i dµ, chuyÖn ®¹i sù nµy liªn quan ®Õn giang s¬n x· t¾c cña §¹i Tèng, sao ng­¬i kh«ng nãi sím?",
			"….V·n bèi muèn nãi sím, nh­ng tiÒn bèi l¹i gÊp rót vÏ tranh.",
			}
		TalkEx("task_001_04_0_1",strTalk);

	--Ã»ÓĞ´ø»ØÅ®×°£»²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"Ng­êi ®Ñp Ba T­ vµ ng­êi ®µn bµ T©y Vùc ë B¾c Phông T­êng, gióp ta lÊy bé y phôc cña hä, ta ®i mµi mùc."
			}
		if	GetTrigger(KILL_XB_BOSIYAOJI) == 0 or GetTrigger(KILL_XB_XIYUHANFU) == 0 then
			CreateTrigger(0,1220,KILL_XB_BOSIYAOJI);
			CreateTrigger(0,1221,KILL_XB_XIYUHANFU);
			TaskTip("§Õn B¾c Phông T­êng lÊy mét bé y phôc tõ ng­êi ®µn bµ T©y Vùc vµ ng­êi ®Ñp Ba T­. ");
			Msg2Player("§Õn B¾c Phông T­êng lÊy mét bé y phôc tõ ng­êi ®µn bµ T©y Vùc vµ ng­êi ®Ñp Ba T­. ");
		end

		TalkEx("",strTalk);
	end
end

-- Ğø¶Ô»°
function task_001_04_0_1()

local strTalk = {
	"ChuyÖn gÊp vËy, cßn vÏ tranh µ? <sex> g¸c vÏ tranh qua mét bªn, ®îi lµm xong chuyÖn nµy ®·, ta sÏ cïng víi ng­¬i th­ëng l·m. ",
	"Ph¶i, ph¶i…theo lêi tiÒn bèi, h×nh nh­ ng­êi T©y H¹ tô tËp ë gÇn Long M«n trÊn?",
	"Kh«ng sai, gÇn Long M«n trÊn gÇn ®©y cã sù xuÊt hiÖn cña ng­êi T©y H¹, ta nghi ngê lµ NhÊt PhÈm §­êng MËt Sø ®ang ho¹t ®éng. T©y H¹ hµnh sù rÊt bİ mËt, NhÊt PhÈm §­êng cµng ®ª hÌn qu¸i ®¶n, bÊt ngê xuÊt hiÖn ë Long M«n trÊn, nhÊt ®Şnh lµ cã ©m m­u.",
	"Chİnh x¸c lµ vËy, tuy T©y H¹ lÇn nµy hµnh ®éng víi t¸c phong h¾c ®¹o, nh­ng ©m m­u liªn kÕt víi Liªu Quèc ®· bŞ lé, qu¶ thËt khiÕn ng­êi ta ph¶i lo nghÜ. T«i muèn ®i Long M«n trÊn th¨m dß mét chuyÕn. TiÒn bèi cã thÓ cho t«i biÕt Long M«n trÊn ë ®©u kh«ng?",
	"Lßng yªu n­íc cña <sex> vµ lßng yªu héi häa cña ta lµ nh­ nhau, tuyÖt l¾m. Long M«n trÊn lµ mét thŞ trÊn nhá ë phİa T©y, ra khái T©y thµnh lµ thÊy, ph¶i cÈn thËn, ta ®îi tin nhĞ!",
	}

	TalkEx("",strTalk);
	DelItem(2,0,686,1);
	DelItem(2,0,687,1);
	RemoveTrigger(GetTrigger(KILL_XB_BOSIYAOJI));
	RemoveTrigger(GetTrigger(KILL_XB_XIYUHANFU));
	SetTask(TASK_XB_ID,4);
	CreateTrigger(0,1222,KILL_XB_YIPINTANGMISHI);
	TaskTip("§Õn Long M«n trÊn ®iÒu tra xem cã hµnh tung cña nh©n sÜ NhÊt PhÈm §­êng kh«ng, xem cã thÓ thu ®­îc chøng cø nµo kh«ng.");
	Msg2Player("§Õn Long M«n trÊn ®iÒu tra xem cã hµnh tung cña nh©n sÜ NhÊt PhÈm §­êng kh«ng, xem cã thÓ thu ®­îc chøng cø nµo kh«ng.");
	GivePlayerAward("Award_XB_02","Easy");
	GivePlayerExp(SkeyXibei,"bosihua")
end

--´ø»Ø»òÎ´´ø»ØÒ»Æ·ÌÃÁîÅÆ¸øÅ·Ñô»­
function task_001_05_0()

local strTalk = {};

	--´ø»ØÒ»Æ·ÌÃÁîÅÆ
	if GetItemCount(2,0,688) >= 1 then
		strTalk = {
			"Hoµng Sa còng cã thÓ ®·i ®­îc vµng, tiÒn bèi, t¹i h¹ ®· t×m ®­îc NhÊt PhÈm §­êng lÖnh bµi trªn ng­êi hä.",
			"Kh«ng ngoµi dù kiÕn, qu¶ thùc lµ ng­êi cña T©y H¹ NhÊt PhÈm §­êng, NhÊt PhÈm §­êng MËt Sø chuyªn thu thËp t×nh b¸o trong ©m thÇm. T©y H¹ thñ ®o¹n gian x¶o, hµnh tung bİ Èn, lÇn nµy l¹i ®iÒu ®éng NhÊt PhÈm §­êng trµ trén Long M«n trÊn, ngoµi lĞn gÆp Liªu Quèc ra chØ e cßn cã Èn t×nh kh¸c.",
			"ı tiÒn bèi T©y H¹ lĞn gÆp Liªu Quèc chØ lµ c¸i cí? Trong ®ã cßn cã ©m m­u kh¸c?",
			"§ã chØ lµ dù ®o¸n ban ®Çu, NhÊt PhÈm §­êng vÉn lµ c¬ cÊu gi¸n ®iÖp ®Æc biÖt cña T©y H¹, tr­íc ®ã ®· trµ trén vµo §¹i Tèng ¸m s¸t nh©n sÜ vâ l©m vµ mua chuéc quan liªu §¹i Tèng, nguy h¹i kh«ng thÓ tİnh hÕt. LĞn gÆp Liªu Quèc e còng lµ sù thËt.",
			"T©y H¹ NhÊt PhÈm §­êng g©y häa vâ l©m, tõ l©u ®· lµ ®èi ®Şch cña vâ l©m. Ch¼ng hay NhÊt PhÈm §­êng MËt Sø ®· dä th¸m ®­îc g× ch­a?",
			"Ta còng muèn t×m hiÓu râ, rèt cuéc NhÊt PhÈm §­êng bµy nghi binh lµ cã ı g×. §óng råi, mËt th¸m T«n NhŞ LiÔn ta ph¸i ®i hiÖn ë Long M«n trÊn, kh«ng biÕt h¾n cã ph¸t hiÖn g× míi kh«ng?",
			"VËy ®Ó t¹i h¹ ®i Long M«n trÊn mét chuyÕn, hy väng cã thÓ thu thËp thªm tin tøc.",
			}
		TalkEx("",strTalk);
		DelItem(2,0,688,1);
		SetTask(TASK_XB_ID,5);
		TaskTip("¢u D­¬ng Häa nhê b¹n ®Õn Long M«n trÊn t×m mËt th¸m T«n NhŞ LiÔn t×m hiÓu hµnh ®éng NhÊt PhÈm §­êng.");
		Msg2Player("¢u D­¬ng Häa nhê b¹n ®Õn Long M«n trÊn t×m mËt th¸m T«n NhŞ LiÔn t×m hiÓu hµnh ®éng NhÊt PhÈm §­êng.");
	 	RemoveTrigger(GetTrigger(KILL_XB_YIPINTANGMISHI));
	 	GivePlayerAward("Award_XB_03","Easy");
	 	GivePlayerExp(SkeyXibei,"yipintang")
	--Ã»ÓĞ´ø»ØÒ»Æ·ÌÃÁîÅÆ£»²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"Ta ngê r»ng ho¹t ®éng gÇn ®©y ë Long M«n trÊn lµ NhÊt PhÈm §­êng MËt Sø, ng­¬i ®i thu thËp vµi chøng cø, ra khái T©y Vùc lµ cã thÓ thÊy Long M«n trÊn, <sex> h·y cÈn thËn."
			}
		if	GetTrigger(KILL_XB_YIPINTANGMISHI) == 0 then
			CreateTrigger(0,1222,KILL_XB_YIPINTANGMISHI);
			TaskTip("§Õn Long M«n trÊn ®iÒu tra xem cã hµnh tung cña nh©n sÜ NhÊt PhÈm §­êng kh«ng, xem cã thÓ thu ®­îc chøng cø nµo kh«ng.");
			Msg2Player("§Õn Long M«n trÊn ®iÒu tra xem cã hµnh tung cña nh©n sÜ NhÊt PhÈm §­êng kh«ng, xem cã thÓ thu ®­îc chøng cø nµo kh«ng.");
		end

		TalkEx("",strTalk);
	end

end

--Î´ÕÒËï¶şçöÓëÅ·Ñô»­¶Ô»°
function task_001_05_1()

local strTalk = {
	"T«n NhŞ LiÔn ®­îc ph¸i ®Õn qu¸n trä Long M«n ë Long M«n trÊn ®Ó thu thËp t×nh b¸o, h¾n nhÊt ®Şnh cã thªm th«ng tin."
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø02ÇéÀ§¿ÍÕ»----------------------------------

--ÓëËï¶şçö¶Ô»°¿ªÊ¼ÈÎÎñ
function task_002_01_0()

local strTalk = {
	"§©y cã ph¶i lµ T«n NhŞ Liªn tiªn sinh kh«ng?",
	"(H¬i r­îu nång nÆc) Nµy………T×nh lµ g× mµ khiÕn lßng ng­êi ®iªn ®¶o..., tiÓu nhŞ, mang thªm mét b×nh n÷ nhi hång…………",
	"Th­a tiªn sinh?",
	"(bÊt tØnh nh©n sù)…………",
	"…… (ph¶i t×m c¸ch ®¸nh thøc «ng ta dËy, kh¸ch s¹n lµ n¬i uèng r­îu, kh¸ch say xØn lµ chuyÖn b×nh th­êng, tiÓu nhŞ h·y ®­a Thuèc tØnh r­îu)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,6);
	TaskTip("T×m tiÓu nhŞ mua thuèc tØnh r­îu cho T«n NhŞ Liªn uèng ®Ó tØnh r­îu.");
	Msg2Player("T×m tiÓu nhŞ mua thuèc tØnh r­îu cho T«n NhŞ Liªn uèng ®Ó tØnh r­îu.");
	GivePlayerExp(SkeyXibei,"longmenkezhan")
end

--Î´ÓëµêĞ¡¶ş¶Ô»°
function task_002_01_1()

local strTalk = {
	"(say ®Õn bÊt tØnh nh©n sù)………",
	"(Kh¸ch s¹n lµ n¬i uèng r­îu, kh¸ch say xØn lµ chuyÖn b×nh th­êng, TiÓu nhŞ h·y ®­a Thuèc tØnh r­îu)"
	}

	TalkEx("",strTalk);

end

--ÓëµêĞ¡¶ş¶Ô»°Ë÷È¡ĞÑ¾ÆÒ©
function task_002_02_0()

local strTalk = {
	"Kh¸ch quan nghØ trä hay ¨n c¬m?",
	"Ta muèn hái ng­¬i cã Thuèc tØnh r­îu kh«ng?",
	"Cã, nh­ng thËt kh«ng may, mÊy h«m tr­íc ®· b¸n cho T©y B¾c tr¸ng sÜ råi, nãi r»ng muèn thi uèng r­îu.",
	"Cã chuyÖn nµy µ? Ng­¬i cã biÕt ng­êi say r­îu kia kh«ng? ¤ng ta say bao l©u råi?",
	"VŞ kh¸ch quan ®ã µ? DÜ nhiªn lµ biÕt, ë ®©y ®­îc mÊy ngµy råi, uèng råi ngñ, ngñ råi uèng, lÇn nµy võa míi say, B¹n mua Thuèc tØnh r­îu ®Ó lµm «ng ta tØnh µ? T«i thÊy Thuèc tØnh r­îu còng ph¶i t¨ng thªm l­îng, kho¶ng 10 ®iÓm.",
	"Nh­ng b©y giê ng­¬i kh«ng cã hµng, cã ®i t×m còng mÊt thêi gian. VŞ T©y B¾c tr¸ng sÜ kia ®i vÒ h­íng nµo?",
	"Nãi lµ tËp hîp t¹i nam Phông T­êng phñ. T«i thÊy nh÷ng tr¸ng sÜ ®ã th©n h×nh v¹m vì, s¾c khİ ®»ng ®»ng, nÕu kh¸ch quanh muèn mua thuèc, h·y ®Õn t×m ë n¬i kh¸c, ®õng chäc giËn hä.",
	"§a t¹ tiÓu nhŞ ca quan t©m, nh­ng ta ph¶i xin hä İt thuèc, kh«ng chäc hä giËn ®©u.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,7);
	CreateTrigger(0,1223,KILL_XB_XIBEIZHUANGHAN);
	TaskTip("§Õn phñ nam t×m T©y B¾c tr¸ng sÜ lÊy 10 ®iÓm thuèc tØnh r­îu ®­a cho tiÓu nhŞ, ®Ó anh ta lµm T«n NhŞ Liªn tØnh l¹i.");
	Msg2Player("§Õn phñ nam t×m T©y B¾c tr¸ng sÜ lÊy 10 ®iÓm thuèc tØnh r­îu ®­a cho tiÓu nhŞ, ®Ó anh ta lµm T«n NhŞ Liªn tØnh l¹i.");
	GivePlayerExp(SkeyXibei,"mizui")
end

--È¡µÃ»òÎ´È¡µÃĞÑ¾ÆÒ©ÓëµêĞ¡¶ş¶Ô»°
function task_002_03_0()

local strTalk = {};

	--´ø»ØĞÑ¾ÆÒ©
	if GetItemCount(2,0,689) >= 10 then
		strTalk = {
			"§óng lµ, cø ë ®©y say xØn, nÕu say ®Õn tr¨m n¨m nh­ ng­êi x­a, khi tØnh dËy ®· bá lë mäi chuyÖn! TiÓu nhŞ ca, h·y cho anh ta uèng thuèc ®i.",
			"§­îc, uèng bao nhiªu ®©y ch¾c sÏ tØnh.",
			"…………"
			}
		TalkEx("",strTalk);
		DelItem(2,0,689,10);
		SetTask(TASK_XB_ID,8);
		TaskTip("§· sai tiÓu nhŞ cho T«n NhŞ Liªn uèng thuèc tØnh r­îu, h·y xem anh ta tØnh ch­a.");
		Msg2Player("§· sai tiÓu nhŞ cho T«n NhŞ Liªn uèng thuèc tØnh r­îu, h·y xem anh ta tØnh ch­a.");
	 	RemoveTrigger(GetTrigger(KILL_XB_XIBEIZHUANGHAN));
	 	GivePlayerAward("Award_XB_04","Easy");
	 	GivePlayerExp(SkeyXibei,"xingjiuyao")
	--Ã»ÓĞ´ø»ØĞÑ¾ÆÒ©£»²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"T©y B¾c tr¸ng sÜ kia tËp hîp t¹i nam Phông T­êng phñ, kh¸ch quan gÆp hä ph¶i cÈn thËn."
			}
		if	GetTrigger(KILL_XB_XIBEIZHUANGHAN) == 0 then
			CreateTrigger(0,1223,KILL_XB_XIBEIZHUANGHAN);
			TaskTip("T×m tiÓu nhŞ mua thuèc tØnh r­îu cho T«n NhŞ Liªn uèng ®Ó tØnh r­îu.");
			Msg2Player("T×m tiÓu nhŞ mua thuèc tØnh r­îu cho T«n NhŞ Liªn uèng ®Ó tØnh r­îu.");
		end

		TalkEx("",strTalk);
	end

end

--ËÍ·şĞÑ¾ÆÒ©ºóÉĞÎ´ÓëËï¶şçö¶Ô»°
function task_002_03_1()

local strTalk = {
	"T¹i h¹ ®· cho T«n NhŞ gia uèng thuèc tØnh r­îu, ch¾c còng ®· tØnh l¹i råi, <sex> h·y ®i gÆp anh ta.",
	"VÊt v¶ cho tiÓu nhŞ ca qu¸.",
	}

	TalkEx("",strTalk);

end

--ËÍ·şĞÑ¾ÆÒ©ºóÓëËï¶şçö¶Ô»°
function task_002_04_0()

local strTalk = {
	"……¤i…… N÷ nhi hång, n÷ nhi ®Ñp, n÷ nhi dŞu dµng nh­ ThËp Tam Muéi…… ThËp Tam Muéi, ThËp Tam Muéi, sao l¹i tuyÖt t×nh, khiÕn ta ®au lßng……",
	"(cã vÎ tØnh dËy l¹i lÈn thÈn h¬n, ThËp Tam Muéi lµ ai?)",
	"ThËp Tam Muén……",
	"(Xem ra ®· m¾c bÖnh t­¬ng t­ råi, ®· vËy l¹i cßn uèng r­îu, cã uèng thuèc tØnh r­îu còng v« İch)",
	"ThËp Tam Muéi, nh×n ta ®i, cã ph¶i chÕt v× nµng ta còng cam lßng…… ThËp Tam Muéi …… N­íc ch¶y hoa tr«i, nµng bªn t©y ta bªn ®«ng……",
	"(Nãi c©u nµy kh«ng biÕt bao nhiªu lÇn, h·y hái TiÓu nhŞ xem sao)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,9);
	TaskTip("H·y hái tiÓu nhŞ xem T«n NhŞ Liªn bŞ g×.");
	Msg2Player("H·y hái tiÓu nhŞ xem T«n NhŞ Liªn bŞ g×.");
end

--ËÍ·şĞÑ¾ÆÒ©ºóÎ´È¡µÃ¶Ç¶µÇ°ÓëËï¶şçö¶Ô»°
function task_002_04_1()

local strTalk = {
	"ThËp Tam Muéi, tim ta……",
	"(Nãi c©u nµy kh«ng biÕt bao nhiªu lÇn, h·y hái TiÓu nhŞ xem sao)",
	}

	TalkEx("",strTalk);

end

--ÓëµêĞ¡¶ş¶Ô»°Ñ¯ÎÊÊ®ÈıÄïÒ»ÊÂ
function task_002_05_0()

local strTalk = {
	"VŞ T«n kh¸ch quan kia ®· tØnh råi µ?",
	"TØnh chót ®Ønh, nh­ng kh«ng tØnh h¼n, cø l¶m nh¶m kh«ng biÕt bao nhiªu lÇn, «i dµo, thuèc kia kh«ng cã t¸c dông råi. Ng­¬i nãi xem anh ta ®ê ng­êi ra l©u råi, suèt ngµy say xØn, lµ v× chuyÖn g×? ThËp Tam Muéi  anh ta nãi ®Õn lµ ai?",
	"Kh¸ch quan kh«ng biÕt råi. ThËp Tam Muéi anh ta nãi ®Õn lµ Xu©n ThËp Tam N­¬ng chñ qu¸n nµy, nµng Êy lµ ®¹i mü nh©n næi tiÕng t¹i Long M«n trÊn, rÊt xinh ®Ñp, bän ®µn «ng trong trÊn nh×n thÊy nµng kh«ng ai kh«ng hån siªu ph¸ch l¹c, ch¶y n­íc d·i rßng rßng.",
	"Ch¼ng tr¸ch anh hïng nhôt chİ, th× ra lµ gÆp mü nh©n.",
	"§óng vËy, T«n kh¸ch quan cßn khê h¬n, võa thÊy n÷ chñ qu¸n chóng t«i ®· mÊt hån, suèt ngµy l¶i nh¶i “ThËp Tam Muéi ” lu«n miÖng, tiÕc lµ nµng Êy kh«ng ®Ó m¾t ®Õn anh ta.",
	}

	TalkEx("task_002_05_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_002_05_0_1()

local strTalk = {
	"¤i, hång nhan g©y häa. Nh­ vËy xem ra anh ta ®· mª Xu©n ThËp Tam N­¬ng ®Õn mô ng­êi råi.",
	"§óng vËy, tõ khi gÆp n÷ chñ qu¸n cña chóng t«i, anh ta ngµy nµo còng ®Õn uèng r­îu, say råi ngñ, tØnh dËy l¹i uèng, miÖng lóc nµo còng l¶m nh¶m, kh«ng ng©m th¬ còng gäi tªn n÷ chñ qu¸n cña chóng t«i.",
	"¤i, r­îu t­¬ng t­ dÔ uèng kh«ng dÔ tØnh, tiÓu nhŞ ca, dïng thªm thuèc tØnh r­îu n÷a ®­îc kh«ng?",
	"Kh«ng ®­îc, kh«ng ®­îc, thuèc nµy kh«ng ®­îc uèng nhiÒu, tù anh tØnh l¹i míi ®­îc.",
	"…VËy th× th«i, ®a t¹ tiÓu nhŞ ca. ",
	"(Anh ta gäi tªn Xu©n ThËp Tam N­¬ng kh«ng th«i, xem ra lµ yªu ®¬n ph­¬ng råi, ch¾c ph¶i quay vÒ t×m ¢u D­¬ng tiÒn bèi th­¬ng l­îng)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,10);
	TaskTip("§i hái ¢u D­¬ng Häa, bÖnh t­¬ng t­ cña T«n NhŞ Liªn ph¶i ch÷a thÕ nµo.");
	Msg2Player("§i hái ¢u D­¬ng Häa, bÖnh t­¬ng t­ cña T«n NhŞ Liªn ph¶i ch÷a thÕ nµo.");
	GivePlayerAward("Award_XB_05","Easy");
	GivePlayerExp(SkeyXibei,"wujikeshi")
end

--Î´ÓëÅ·Ñô»­¶Ô»°Ç°ÓëµêĞ¡¶ş¶Ô»°
function task_002_05_1()

local strTalk = {
	"Thuèc nµy kh«ng ®­îc uèng nhiÒu, kh«ng ®­îc uèng n÷a, h·y ®Ó anh ta tù tØnh l¹i.",
	"(Anh ta gäi tªn Xu©n ThËp Tam N­¬ng kh«ng th«i, xem ra lµ yªu ®¬n ph­¬ng råi, ch¾c ph¶i quay vÒ t×m ¢u D­¬ng tiÒn bèi th­¬ng l­îng)",
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø03´ºÊ®ÈıÄï----------------------------------
--ÓëÅ·Ñô»­¶Ô»°Ñ¯ÎÊÈçºÎÒ½ÖÎËï¶şçöµÄÏàË¼²¡
function task_003_01_0()

local strTalk = {
	"<sex> vÒ råi, cã t×m ®­îc T«n NhŞ Liªn kh«ng?",
	"T×m ®­îc T«n NhŞ Liªn råi, nh­ng anh ta say r­îu ch­a tØnh l¹i, nghe nãi anh ta ®· mª Xu©n ThËp Tam N­¬ng ë qu¸n trä Long m«n, nh­ng ng­êi ta kh«ng ®Õm xØa g× ®Õn anh ta. Anh ta ®· m¾c bÖnh t­¬ng t­, suèt ngµy m­în r­îu gi¶i sÇu t¹i kh¸ch s¹n. Lóc ta t×m thÊy, anh ta ®· bÊt tØnh nh©n sù, uèng thuèc tØnh r­îu råi nh­ng còng v« İch.",
	"Ai da, tham töu s¾c, lµm sao kh«ng lì viÖc cho ®­îc! Víi mü nh©n, chØ ®­îc nh×n xa kh«ng ®­îc nh×n gÇn. T«n NhŞ Liªn nµy ®· r¬i vµo l­íi t×nh, r­îu kh«ng say mµ lµ say ng­êi, lµm g× cã thuèc lµm cho tØnh l¹i?",
	"§óng vËy, cã c¸ch nµo lµm anh ta tØnh l¹i kh«ng?",
	"TrŞ bÖnh ph¶i t×m ra gèc bÖnh, gèc bÖnh cña T«n NhŞ Liªn lµ Xu©n ThËp Tam N­¬ng, yªu mµ kh«ng ®­îc ®¸p l¹i. M¾c bÖnh t­¬ng t­ nµy lµm sao kh«ng hån siªu ph¸ch l¹c cho ®­îc! ChØ cã thÓ b¾t ®Çu tõ ng­êi ®­îc yªu, ng­¬i biÕt Xu©n ThËp Tam N­¬ng b©y giê ë ®©u kh«ng?",
	"TiÒn bèi nãi chİ ph¶i, nÕu t×m ®­îc ThËp Tam N­¬ng, nãi nµng ta gÆp T«n NhŞ Liªn cã ®­îc kh«ng?",
	}

	TalkEx("task_003_01_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_003_01_0_1()

local strTalk = {
	"Nh­ng nh­ lêi ng­¬i nãi, dï cã t×m ®­îc Xu©n ThËp Tam N­¬ng, e r»ng nµng ta còng kh«ng muèn gÆp T«n NhŞ Liªn, nµng ta vèn kh«ng ­a T«n NhŞ Liªn, t×m nµng ta còng ch¼ng İch g×.",
	"Kh«ng sai, chuyÖn t×nh c¶m kh«ng thÓ miÔn c­ìng. VËy nÕu cã c¸ch lµm cho T«n NhŞ Liªn c¶m thÊy Xu©n ThËp Tam N­¬ng quan t©m ®Õn anh ta, kh«ng chõng anh ta sÏ tØnh l¹i.",
	"§óng, ®óng, tuy kh«ng mêi ®­îc Xu©n ThËp Tam N­¬ng, nÕu lÊy ®­îc İt ®å cña nµng ta, råi ®­a cho T«n NhŞ Liªn, ch¾c ch¾n anh ta sÏ cho r»ng Xu©n ThËp Tam N­¬ng quan t©m ®Õn m×nh, anh ta sÏ phÊn chÊn, kh«ng cßn sÇu khæ n÷a, ch¾c sÏ tØnh r­îu.",
	"Nh­ng lÊy ®å cña con g¸i nhµ ng­êi ta liÖu cã thÊt lÔ kh«ng?",
	"Hõ, giang hå nhi n÷ kh«ng quan t©m chuyÖn nhá nhÆt, lµm sao ®Ó ı chuyÖn nµy? \'x­a nay hång nhan th­êng g©y häa, x­a nay anh hïng khèi ng­êi ph¶i lôy m×nh.” Nh­ng hång nhan ®Ñp nh­ tranh qu¶ lµ th­îng phÈm, ®¸ng tiÕc, ®¸ng tiÕc.",
	}

	SetTask(TASK_XB_ID,11);
	TaskTip("Quay l¹i Long M«n TrÊn t×m tiÓu nhŞ hái t«ng tİch cña bµ chñ qu¸n.");
	Msg2Player("Quay l¹i Long M«n TrÊn t×m tiÓu nhŞ hái t«ng tİch cña bµ chñ qu¸n.");
	TalkEx("",strTalk);
end

--Î´È¡µÃ¶Ç¶µÇ°ÓëÅ·Ñô»­¶Ô»°
function task_003_01_1()

local strTalk = {
	"H·y ®Õn Long M«n TrÊn hái TiÓu nhŞ n÷ chñ qu¸n ®i ®©u. T×m ®­îc Xu©n ThËp Tam N­¬ng, lÊy mét vËt trªn ng­êi nµng ta ®­a cho T«n NhŞ Liªn, cã lÏ anh ta sÏ tØnh l¹i.",
	}

	TalkEx("",strTalk);

end

--Ñ¯ÎÊµêĞ¡¶ş´ºÊ®ÈıÄïÈ¥Ïò
function task_003_02_0()

local strTalk = {
	"TiÓu nhŞ ca, chñ nh©n cña ng­¬i ®©u?",
	"N÷ chñ qu¸n ®· ®Õn phİa ®«n b¾c Long M«n TrÊn mua hµng, kh¸ch quan t×m nµng Êy lµm g×? NÕu lµ v× vŞ kh¸ch quan say r­îu kia, tiÓu nh©n sî r»ng B¹n ph¶i ®· uæng c«ng, v× chñ nh©n t«i rÊt ghĞt anh ta, ch¾c ch¾n sÏ kh«ng nghe B¹n ®©u.",
	"Ta còng nghÜ vËy, vËy ta cã thÓ xin ThËp Tam N­¬ng İt ®å cho anh ta ®Ó anh ta tØnh l¹i ®­îc kh«ng?",
	"Ai da, vËy kh¸ch quan ph¶i cÈn thËn, chñ nh©n chóng t«i võa ®Ñp l¹i cßn giái vâ, nh÷ng kÎ h¸o s¾c ë Long M«n TrÊn  nµy ®Òu kh«ng d¸m chäc giËn nµng. Nµng ta rÊt nãng tİnh, e r»ng kh¸ch quan muèn xin ®å sÏ ph¶i chŞu khæ.",
	"Hõ, mü nh©n ®áng ®¶nh lµ chuyÖn b×nh th­êng, khi nµo chñ nh©n ng­êi vÒ, h·y nãi gióp ta.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,12);
	TaskTip("§Õn phİa ®«ng b¾c Long M«n TrÊn t×m Xu©n ThËp Tam N­¬ng xin ®å.");
	Msg2Player("§Õn phİa ®«ng b¾c Long M«n TrÊn t×m Xu©n ThËp Tam N­¬ng xin ®å.");
	GivePlayerExp(SkeyXibei,"laobanniang")
end

--Î´È¡µÃ¶Ç¶µÇ°ÓëµêĞ¡¶ş¶Ô»°
function task_003_02_1()

local strTalk = {
	"Xu©n ThËp Tam N­¬ng®ang mua hµng t¹i phİa ®«ng b¾c Long M«n TrÊn, nµng ta rÊt nãng tİnh, vâ c«ng cao c­êng, ph¶i cÈn thËn kh«ng nªn ®¾c téi víi nµng Êy."
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø04ÕĞ±øÂòÂí----------------------------------

--È¡µÃ¶Ç¶µºóÓëËï¶şçö¶Ô»°
function task_004_01_0()

local strTalk = {
	"…¤i…trong m¬ ta vµ giai nh©n cña ta sÏ …¤i? ThËp Tam N­¬ng? §©y lµ mïi h­¬ng cña ThËp Tam N­¬ng!......ThËp Tam N­¬ng, nµng vÒ råi µ!? (thÇn chİ chît tØnh, nhæm dËy t×m xung quanh).",
	"Kh«ng ph¶i, ThËp Tam N­¬ng cßn ®ang lµm viÖc, nh­ng ng­¬i xem ®©y cã ph¶i lµ yÕm cña nµng Êy?",
	"C¸i g×? §­a ta xem nµo, mïi h­¬ng cña ThËp Tam N­¬ng! §©y lµ tói cña ThËp Tam N­¬ng! Nãi mau, ng­¬i ®· lµm g× víi ThËp Tam N­¬ng? C¸i ®å d©m tÆc nhµ ng­¬i kia! Nãi mau!? (thÇn chİ tØnh h¼n, tá vÎ hung h·n).",
	"Ai da, T«n tiªn sinh ng­¬i hiÓu lÇm råi! §©y lµ ®å ThËp Tam N­¬ng cho ta, b¶o ta chuyÓn cho ng­¬i, nµng Êy nãi ng­¬i si t×nh nh­ vËy, rÊt ®¸ng ®Ó lµm b¹n. L¹i nghe nãi ng­êi suèt ngµy uèng r­îu t¹i kh¸ch s¹n, m­în r­îu gi¶i sÇu, ®· dÆn ta ®em vËt nµy vÒ cho ng­¬i, mong ng­¬i ®õng lµm chuyÖn h¹i th©n n÷a. §å nµy ng­¬i cø gi÷ lÊy, khi nµo nµng Êy vÒ h·y tr¶ l¹i, tiÖn thÓ nãi râ víi ng­êi ta.",
	"¤i… Th× ra lµ vËy, thø lçi lóc n·y…… ThËt m¹o ph¹m, <sex> bá qua cho! Ph¶i råi, lóc n·y ng­¬i nãi ThËp Tam N­¬ng håi t©m chuyÓn ı råi ph¶i kh«ng? Ha ha ha, ta biÕt trêi kh«ng phô lßng ng­êi, kh«ng uæng c«ng ta, cuèi cïng ®· cã ®­îc mü nh©n! Tèt tèt. ph¶i råi, kh«ng biÕt <sex> t×m ta cã chuyÖn g×?",
	"(Ng­êi nµy d­êng nh­ ®· tØnh l¹i) gÇn ®©y T©y H¹ ®ang lµm m­a lµm giã, d­êng nh­ muèn g©y rèi §¹i Tèng, ta xin Tr­êng Ca M«n gióp ®iÒu tra chuyÖn nµy, ¢u D­¬ng tiÒn bèi ®· ph¸i ta ®Õn t×m ng­¬i.",
	}

	TalkEx("task_004_01_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_004_01_0_1()

local strTalk = {

	"å, th× ra ¢u D­¬ng tiªn sinh sai ng­¬i ®Õn.. <sex> yªn t©m, ng­¬i ®· mang cho ta tin tèt nh­ vËy, ta kh«ng biÕt th× th«i, biÕt th× ph¶i lµm ®Õn cïng. Hµnh ®éng cña T©y H¹ lÇn nµy rÊt lín, kh«ng cÇn ph¶i nãi, ©m m­u trong ®ã tuy che ®­îc m¾t cña nh©n sÜ vâ l©m b×nh th­êng, nh­ng Tr­êng Ca M«n ta ®· c¶nh gi¸c.",
	"T«n tiªn sinh d­êng nh­ biÕt chuyÖn, kh«ng biÕt ®· t×m ®­îc th«ng tin g×?? Long M«n TrÊn  gÇn ®©y cã g× kh¸c th­êng kh«ng?",
	"NhÊt cö nhÊt ®éng cña Long M«n TrÊn  lµm sau che ®­îc m¾t ta? Vïng Long M«n TrÊn  nµy c¸ch xa hoµng ®Õ, giµy quan phñ kh«ng ®Õn ®­îc, th­êng cã tï nh©n trèn ch¹y, t×nh c¶nh rèi ren, t­¬ng truyÒn cßn cã nhiÒu cao thñ vâ l©n Èn c­. Theo ta NhÊt phÈm ®­êng ®ang ®Ó ı ®Õn vïng ®Êt kh«ng ai coi qu¶n tËp trung nhiÒu kÎ vong m¹ng nµy, bè trİ néi øng, gië thñ ®o¹n chiªu binh m·i m·. ",
	"Nãi nh­ vËy T©y H¹ kh«ng nh÷ng m­u ®å tÊn c«ng Tèng, mµ cßn ®iÒu ®éng nh©n tµi cña NhÊt phÈm ®­êng t¹i Long M«n TrÊn ®Ó sai khiÕn, MËt sø NhÊt phÈm ®­êng ho¹t ®éng liªn tôc, th× ra ®ang thu thËp tin t×nh b¸o cña nh©n tµi.",
	"§óng vËy, MËt sø NhÊt phÈm ®­êng gÇn ®©y bËn t×m kiÕm nh©n tµi. Kh«ng mua chuéc vong mÖnh chi ®å ¸m s¸t trém c­íp, th× lµ giËt d©y, ®óng lµ ®å ®éc ¸c.",
	}

	TalkEx("task_004_01_0_2",strTalk);

end

-- Ğø¶Ô»°
function task_004_01_0_2()

local strTalk = {
	"Kh«ng sai, bän r¾n ®éc nµy kh«ng tõ thñ ®o¹n, ®óng lµ tai häa cña vâ l©m Trung Nguyªn ta, lÇn nµy nÕu NhÊt phÈm ®­êng thµnh c«ng, ch¾c sÏ h« m­a gäi giã, chóng ta ph¶i ra søc ng¨n c¶n.",
	"¤i, vÊn ®Ò lµ ta kh«ng biÕt ®­îc hµnh tung cña chóng. Muèn chÆt ®øt kÕ ho¹ch cña chóng, ph¶i t×m ra kÎ chñ m­u lµ ai",
	"Kh«ng cã ®Çu mèi µ? Coi nh­ kÎ chñ m­u mai danh Èn tİch, nh­ng lÇn nµy NhÊt phÈm ®­êng chiªu binh m·i m· quy m« lín, ch¾c sÏ kh«ng Èn n¸u qu¸ s©u. Sù qua l¹i cña chóng ch¾c cã thÓ lÇn ra dÊu vÕt.",
	"§óng ®óng, ng­¬i kh«ng nãi ta còng kh«ng nghÜ ra, gÇn ®©y Cao thñ quan ngo¹i qua l¹i t¹i Long M«n TrÊn  cã hµnh tung kh¶ nghi, d­êng nh­ cã tiÕp xóc bİ mËt víi NhÊt phÈm ®­êng, nh­ng ta vÉn n¸n l¹i kh¸ch s¹n ch­a thÓ truy t×m, qu¶ thùc rÊt xÊu hæ.",
	"Tiªn sinh chí xÊu hæ, ng­¬i ®· cung cÊp cho ta tin tøc quan träng, Cao thñ quan ngo¹i kia rÊt cã thÓ ®· gÆp kÎ chñ m­u, ta ph¶i ®i th¨m dß mét chuyÕn.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,690,1);--É¾È¥¶Ç¶µ
	CreateTrigger(0,1241,KILL_XB_GUANWAIGAOSHOU);--¹ØÍâ¸ßÊÖÉ±¹Ö´¥·¢Æ÷
	SetTask(TASK_XB_ID,14);
	TaskTip("§i ®Õn Long M«n TrÊn, ®iÒu tra cao thñ quan ngo¹i xem cã manh mèi vÒ NhÊt phÈm ®­êng kh«ng.");
	Msg2Player("§i ®Õn Long M«n TrÊn, ®iÒu tra cao thñ quan ngo¹i xem cã manh mèi vÒ NhÊt phÈm ®­êng kh«ng.");
	GivePlayerAward("Award_XB_06","Easy");
	GivePlayerExp(SkeyXibei,"dudou")
end


--´ø»Ø»òÎ´´ø»ØÒ»Æ·ÌÃÑûÇëº¯ÓëËï¶şçö¶Ô»°
function task_004_02_0()

local strTalk = {};

	--´ø»ØÒ»Æ·ÌÃÑûÇëº¯
	if GetItemCount(2,0,691) >= 1 then
		strTalk = {
			"Nh÷ng Cao thñ quan ngo¹i qu¶ nhiªn lîi h¹i, ta ®· lÊy ®­îc Th­ mêi cña NhÊt phÈm ®­êng trªn ng­êi chóng.",
			"(Xem th­ mêi) kh«ng ®­îc, ng­êi chŞu tr¸ch nhiÖm chİnh trong lÇn chiªu binh m·i m· nµy cña NhÊt phÈm ®­êng lµ Lı Nguyªn Kh¸nh! ChuyÖn nµy kh«ng gièng b×nh th­êng. Nh÷ng kÎ qua l¹i víi cao thñ ®Òu lµ nh÷ng kÎ xuÊt chóng, ®ång thêi NhÊt phÈm ®­êng thËp ®¹i kim cang còng ®· ra mÆt. §¹i sù, chuyÖn ®¹i sù s¾p x¶y ra.",
			"Tªn Lı Nguyªn Kh¸nh nµy lµ ai? ThËp ®¹i kim cang lµ nh÷ng kÎ nµo?",
			"Xa Lu©n B¸ V­¬ng nµy lµ kÎ chñ m­u cña hµnh ®éng lÇn nµy, lóc nµy ®ang ë Long M«n TrÊn. Th«ng tin vµ suy ®o¸n cña ta chØ cã thÕ, <sex> h·y ®i t×m ¢u D­¬ng tiªn sinh, «ng ta cã thÓ gi¶i táa nghi vÊn cho ng­¬i. Ha ha, cßn ph¶i ®a t¹ <sex> ®· mang tin tèt vÒ cho ta.",
			"§õng kh¸ch s¸o, ta xin c¸o tõ.",
			}

		RemoveTrigger(GetTrigger(KILL_XB_GUANWAIGAOSHOU));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID,15);
		TaskTip("BiÕt NhÊt phÈm ®­êng s¾p cã ©m m­u lín, h·y mau vÒ Phông T­êng b¸o cho ¢u D­¬ng Häa biÕt.");
		Msg2Player("BiÕt NhÊt phÈm ®­êng s¾p cã ©m m­u lín, h·y mau vÒ Phông T­êng b¸o cho ¢u D­¬ng Häa biÕt.");
		GivePlayerAward("Award_XB_07","Easy");
		GivePlayerExp(SkeyXibei,"yipintangzhuangda")
	--Ã»ÓĞ´ø»ØÒ»Æ·ÌÃÑûÇëº¯and²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"C¸c cao thñ quan ngo¹i qua l¹i Long M«n TrÊn  cã hµnh tung kh¶ nghi, d­êng nh­ cã tiÕp xóc bİ mËt víi NhÊt phÈm ®­êng. Nh­ng ta vÉn n¸n l¹i kh¸ch s¹n ch­a ®i ®iÒu tra, thËt xÊu hæ"
			}
		if	GetTrigger(KILL_XB_GUANWAIGAOSHOU) == 0 then
			CreateTrigger(0,1241,KILL_XB_GUANWAIGAOSHOU);
			TaskTip("§i ®Õn Long M«n TrÊn, ®iÒu tra cao thñ quan ngo¹i xem cã manh mèi vÒ NhÊt phÈm ®­êng kh«ng.");
			Msg2Player("§i ®Õn Long M«n TrÊn, ®iÒu tra cao thñ quan ngo¹i xem cã manh mèi vÒ NhÊt phÈm ®­êng kh«ng.");
		end

		TalkEx("",strTalk);
	end
end


--Î´ÓëÅ·Ñô»­¶Ô»°Ç°ÓëËï¶şçö¶Ô»°
function task_004_02_1()

local strTalk = {
	"Ng­¬i h·y ®Õn Phông T­êng t×m ¢u D­¬ng Häa tiªn sinh."
	}

	TalkEx("",strTalk);

end

--ÓëÅ·Ñô»­¶Ô»°×¼±¸¼ÓÈëÒ»Æ·ÌÃ×öÎÔµ×
function task_004_03_0()

local strTalk = {
	"<sex> ®· vÒ råi µ! T«n NhŞ Liªn ®· tØnh råi chø?",
	"T«n tiªn sinh ®· tØnh l¹i råi, «ng ta cßn th¸m thİnh ®­îc NhÊt PhÈm §­êng ®ang chiªu binh m·i m· ë Long M«n trÊn, MËt sø NhÊt PhÈm §­êng ®ang ë gÇn ®ã t×m kiÕm nh©n tµi. Cßn ®©y lµ Th­ mêi NhÊt PhÈm §­êng. Xin tiÒn bèi xem qua.",
	"(Xem xong th­ mêi) §· ®iÒu ®éng Lı Nguyªn Kh¸nh vµ ThËp §¹i Kim Cang, hµnh ®éng lÇn nµy cña NhÊt PhÈm §­êng qu¶ thËt kh«ng ph¶i chuyÖn nhá, xem ra chóng rÊt xem träng ®ît chiªu binh m·i m· lÇn nµy, Lı Nguyªn Kh¸nh còng xuÊt hiÖn, chØ sî bªn trong cßn cã ©m m­u g× lín h¬n.",
	"Lı Nguyªn Kh¸nh lµ ai?",
	"Lı Nguyªn Kh¸nh lµ cao thñ thø 3 cña T©y H¹ NhÊt PhÈm §­êng, ng­êi nµy trİ dòng song toµn vµ cã ®Şa vŞ rÊt cao trong NhÊt PhÈm §­êng. Kh«ng ph¶i viÖc hÖ träng y sÏ kh«ng xuÊt hiÖn, viÖc cña NhÊt PhÈm §­êng chØ cÇn y phô tr¸ch th× ch¾c ch¾n sÏ thµnh c«ng, tõ lóc trÎ y ®· cã thÓ ngåi vµo chøc vŞ cao thñ thø 3 cã thÓ thÊy tµi nghÖ cña y cao th©m khã l­êng.",
	"Th× ra lµ vËy! NhÊt PhÈm §­êng ®Ó Lı Nguyªn Kh¸nh phô tr¸ch viÖc chiªu binh m·i m· lÇn nµy nhÊt ®Şnh sÏ thµnh c«ng. Cßn ThËp §¹i Kim Cang?",
	"ThËp §¹i Kim Cang lµ tinh anh NhÊt PhÈm §­êng phô tr¸ch hµnh sù vµ truyÒn chØ lÖnh. M­êi ng­êi nµy cã ngo¹i h×nh kú l¹ nh­ng ®Òu lµ cao thñ, lÇn nµy ng­êi ®Õn Long M«n trÊn ®ãn Xa Lu©n B¸ V­¬ng  chİnh lµ mét trong m­êi ng­êi ®ã.",

	}

	TalkEx("task_004_03_0_1",strTalk);

end;

-- Ğø¶Ô»°
function task_004_03_0_1()

local strTalk = {
	"LÇn nµy c¸c cao thñ cña NhÊt PhÈm §­êng lÇn l­ît xuÊt hiÖn, kh«ng biÕt t¹i sao hä l¹i coi träng ®ît chiªu binh m·i m· nµy?",
	"Theo ta ®o¸n, T©y H¹ muèn x©m chiÕm l·nh thæ §¹i Tèng, muèn liªn kÕt víi n­íc Liªu ®Ó x©m chiÕm §¹i Tèng, lÇn hµnh ®éng nµy NhÊt PhÈm §­êng muèn më réng thÕ lùc ë Trung Nguyªn, lµm yÕu ®i søc m¹nh cña Trung Nguyªn. NhÊt PhÈm §­êng kh«ng chØ ¸m s¸t c¸c cao thñ vâ l©m mµ cßn mua chuéc c¸c qu©n thÇn trong triÒu ®Ó lÊy th«ng tin c¬ mËt cña §¹i Tèng.",
	"Ch¼ng tr¸ch NhÊt PhÈm §­êng coi träng hµnh ®éng lÇn nµy, chóng lµ mèi nguy h¹i víi vâ l©m Trung Nguyªn, ta ph¶i ng¨n chÆn hµnh ®éng lÇn nµy cña bän chóng.",
	"Kh«ng sai! Nh­ng muèn ph¸ ho¹i hµnh ®éng cña bän chóng th× ta ph¶i biÕt h­íng hµnh ®éng cña chóng. µ……<sex> ®¹i hiÖp, ta cã chuyÖn muèn nhê ng­¬i.",
	"Kh«ng d¸m! Gãp søc cho n­íc nhµ lµ tr¸ch nhiÖm cña v·n bèi. TiÒn bèi xin cø nãi!",
	"Hµnh ®éng lÇn nµy cña NhÊt PhÈm §­êng nÕu thµnh c«ng sÏ lµ ®¹i häa cho vâ l©m. Cho nªn ta muèn <sex> th©m nhËp NhÊt PhÈm §­êng ®iÒu tra ©m m­u cña chóng, ®Ó thõa c¬ ng¨n chÆn hµnh ®éng lÇn nµy.",
	}

	TalkEx("task_004_03_0_2",strTalk);

end

-- Ğø¶Ô»°
function task_004_03_0_2()

local strTalk = {
	"TiÒn bèi muèn t¹i h¹ trµ trén vµo NhÊt PhÈm §­êng?",
	"Víi c¬ trİ cña <sex>, viÖc nµy chØ cã thÓ tr«ng chê vµo <sex>. NhÊt PhÈm §­êng hµnh ®éng khã ®o¸n, <sex> lµ ng­êi cã thÓ tin cËy, ta míi d¸m më miÖng nhê v·.",
	"Xem ra ®©y còng lµ biÖn ph¸p tèt, muèn ph¸ ho¹i hµnh ®éng cña chóng ph¶i trµ trén vµo NhÊt PhÈm §­êng míi cã thÓ lÊy ®­îc tin tøc quan träng.",
	"<sex> ®¹i hiÖp, nÕu viÖc nµy thµnh c«ng, <sex> xem nh­ ®· t¹o phóc cho b¸ t¸nh, hµnh ®éng lÇn nµy v« cïng nguy hiÓm, ng­êi h·y tïy c¬ hµnh sù, nÕu gÆp khã kh¨n g× h·y ®Õn t×m ta, Tr­êng Ca M«n ta sÏ ñng hé ng­êi hÕt m×nh.",
	"V·n bèi xin ghi nhí! NhÊt ®Şnh sÏ kh«ng phô lßng ng­êi.",
	"Ng­êi ®øng ®Çu ®ît chiªu binh m·i m· lÇn nµy lµ Xa Lu©n B¸ V­¬ng , ng­¬i cã thÓ ®em Th­ mêi NhÊt PhÈm §­êng ®Õn Long M«n trÊn thö xem. Mäi chuyÖn h·y cÈn thËn.",
	}

	SetTask(TASK_XB_ID,16);
	TaskTip("¢u D­¬ng Häa b¶o b¹n ®i t×m Xa Lu©n B¸ V­¬ng!");
	Msg2Player("¢u D­¬ng Häa b¶o b¹n ®i t×m Xa Lu©n B¸ V­¬ng!");
	GivePlayerAward("Award_XB_08","Easy");
	GivePlayerExp(SkeyXibei,"qianru")
	TalkEx("",strTalk);
end

--ÉĞÎ´Óë³µÂÖ°ÔÍõ¶Ô»°Ç°ÓëÅ·Ñô»­¶Ô»°
function task_004_03_1()

local strTalk = {
	"<sex> v× n­íc kh«ng tiÕc th©n m×nh, thËt khiÕn ng­êi ng­êi kİnh phôc.",
	}

	TalkEx("",strTalk);

end


---------------------------------- Î÷±±Çø05³Â²Ö°µ¶È----------------------------------
--Óë³µÂÖ°ÔÍõ¶Ô»°¿ªÊ¼¡±Î÷±±Çø05³Â²Ö°µ¶È¡°ÈÎÎñ
function task_005_01_0()

local strTalk = {};

	--´óÓÚ67·½ÄÜ½ÓÈÎÎñ
	if GetLevel() >= 67 then
		strTalk = {
			"(Ta ph¶i gi¶ trang thµnh téi ph¹m cña §¹i Tèng ®Ó lÊy chiÕm ®­îc sù tİn nhiÖm cña Xa Lu©n B¸ V­¬ng)",
			"Ng­êi lµ Xa Lu©n B¸ V­¬ng ? Ta v× m­u s¸t kÎ thï ph¹m ph¶i téi tö. Lôc PhiÕn M«n truy ®uæi t«i ®Õn ®©y, thiÕt nghÜ §¹i Tèng ®· kh«ng cßn chç ®Ó t«i dung th©n, ®©y lµ Th­ mêi NhÊt PhÈm §­êng, kh«ng biÕt NhÊt PhÈm §­êng cã thÓ th©u nhËn ta kh«ng?",
			"Xem ra <sex> lµ nh©n tµi cña MËt sø NhÊt PhÈm §­êng. NhÊt PhÈm §­êng vèn träng anh hïng, kh«ng cÇn biÕt xuÊt xø, cho dï ng­¬i ph¹m ph¸p còng kh«ng sao, chØ cÇn lµ ng­êi cã n¨ng lùc lµ ®­îc.",
			"T¹i h¹ ®· nghe danh NhÊt PhÈm §­êng xem träng nh©n tµi tõ l©u, t¹i h¹ ®ang bŞ bän Lôc PhiÕn M«n ®¸ng ghĞt truy ®uæi r¸o riÕt, kh«ng biÕt NhÊt PhÈm §­êng cã thÓ th©u nhËn ta kh«ng?",
			"Ha ha! Ng­¬i yªn t©m, ë NhÊt PhÈm §­êng sî g× bän Lôc PhiÕn M«n? Cho dï Hoµng cung ®¹i néi bän ta cßn ch­a xem ra g×.",
			}

		TalkEx("task_005_01_0_1",strTalk);

	else
		strTalk = {
			"(Ta ph¶i gi¶ trang thµnh téi ph¹m cña §¹i Tèng ®Ó lÊy chiÕm ®­îc sù tİn nhiÖm cña Xa Lu©n B¸ V­¬ng)",
			"Ng­êi lµ Xa Lu©n B¸ V­¬ng ? Ta v× m­u s¸t kÎ thï ph¹m ph¶i téi tö. Lôc PhiÕn M«n truy ®uæi t«i ®Õn ®©y, thiÕt nghÜ §¹i Tèng ®· kh«ng cßn chç ®Ó t«i dung th©n, ®©y lµ Th­ mêi NhÊt PhÈm §­êng, kh«ng biÕt NhÊt PhÈm §­êng cã thÓ th©u nhËn ta kh«ng?",
			"Xem ra <sex> lµ nh©n tµi cña MËt sø NhÊt PhÈm §­êng. Nh­ng h«m nay xem ra <sex> vÉn ch­a ®ñ n¨ng lùc mµ bän ta yªu cÇu, chê ng­¬i ®¹t cÊp 80 h·y ®Õn t×m ta.",
			}
		TalkEx("",strTalk);
	end
end

-- Ğø¶Ô»°
function task_005_01_0_1()

local strTalk = {
				"ChØ cÇn NhÊt PhÈm §­êng gióp ta tho¸t khái kiÕp n¹n nµy, ta sÏ tËn lùc phông sù cho NhÊt PhÈm §­êng.",
				"NhÊt PhÈm §­êng ta coi anh hïng, kh«ng thİch th©u nhËn kÎ bÊt tµi, th­ mêi MËt sø cho ng­¬i chØ lµ b­íc sµng läc th«i, muèn vµo NhÊt PhÈm §­êng ph¶i qua sù thö th¸ch ®Ó chøng minh n¨ng lùc cña ng­¬i. NhËp m«n ph¶i qua 3 thö th¸ch.",
				"Vµng thËt kh«ng sî löa, ®¹i nh©n xin cø nãi!",
				"<sex> thËt s¶ng kho¸i. Ng­¬i bŞ Lôc PhiÕn M«n truy ®uæi ®Õn ®©y, thiÕt nghÜ ng­¬i còng c¨m thï Lôc PhiÕn M«n ®Õn tËn x­¬ng, gÇn ®©y mét trong ThËp §¹i Kim Cang lµ S¸t thñ Oa Oa ch¼ng may bŞ Lôc PhiÕn M«n b¾t gi÷, ta thÊy ng­¬i hµo khİ h¬n ng­êi, cã d¸m ®Õn Lôc PhiÕn M«n cøu ng­êi kh«ng?",
				}

	TalkEx("task_005_01_0_2",strTalk);

end

-- Ğø¶Ô»°
function task_005_01_0_2()

local strTalk = {
			"VËy ta kh«ng ph¶i tù chu«i ®Çu vµo l­íi sao? Ta ®ang bŞ Lôc PhiÕn M«n truy ®uæi, biÕt trªn nói cã hæ d÷ ch¼ng lÏ cø leo lªn sao?",
			"Kh«ng vµo hang cäp sao b¾t ®­îc cäp? NhÊt PhÈm §­êng kh«ng hoan nghªnh nh÷ng kÎ nh¸t gan, ph¶i v­ît qua khã kh¨n míi lµ bËc anh hïng. <sex> nÕu kh«ng ®ñ can ®¶m th× th«i vËy,, nh­ng ng­¬i ®· cã ı nhËp m«n, l¹i lµ T©n bŞ NhÊt PhÈm §­êng, sau nµy chØ cÇn ®­a ra kı hiÖu nµy víi ng­êi trong ®­êng ®Ó chøng nhËn th©n phËn.",
			"Ha ha! §¹i nh©n h·y chê tin cña t¹i h¹.",
			"(KÎ nµy kiªu c¨ng nh­ng l¹i cÈn träng, râ rµng ta ®· tù khai m×nh ®ang bŞ Lôc PhiÕn M«n truy n·, cßn b¾t ta m¹o hiÓm, thËt gi¶o ho¹t. Cã ®iÒu nhµ lao Lôc PhiÕn M«n ë ®©u míi ®­îc? Ch¾c ph¶i ®Õn hái ¢u D­¬ng Häa tiÒn bèi th«i.)",
	}

	DelItem(2,0,691,1);--É¾È¥ÑûÇëº¯
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,17);
	TaskTip("VÒ Phông T­êng t×m ¢u D­¬ng Häa hái vŞ trİ nhµ lao Lôc PhiÕn M«n.");
	Msg2Player("VÒ Phông T­êng t×m ¢u D­¬ng Häa hái vŞ trİ nhµ lao Lôc PhiÕn M«n.");
	add_xb_title(1);--³ÆºÅ£ºÒ»Æ·ÌÃĞÂ±¸
	GivePlayerExp(SkeyXibei,"jiaoruyipintang")
end

--ÉĞÎ´ÓëÅ·Ñô»­¶Ô»°
function task_005_01_1()

local strTalk = {
	"Thö th¸ch thø 1: ®Õn nhµ lao gi¶i cøu S¸t thñ Oa Oa ®Ó chøng tá lßng can ®¶m.",
	"(KÎ nµy kiªu c¨ng nh­ng l¹i cÈn träng, râ rµng ta ®· tù khai m×nh ®ang bŞ Lôc PhiÕn M«n truy n·, cßn b¾t ta m¹o hiÓm, thËt gi¶o ho¹t. Cã ®iÒu nhµ lao Lôc PhiÕn M«n ë ®©u míi ®­îc? Ch¾c ph¶i ®Õn hái ¢u D­¬ng Häa tiÒn bèi th«i.)",
	}

	TalkEx("",strTalk);

end

--ÉĞÎ´¾È³öÍŞÍŞÉ±ÊÖÇ°¶Ô»°
function task_005_01_2()

local strTalk = {
	"Thö th¸ch thø 1: ®Õn nhµ lao gi¶i cøu S¸t thñ Oa Oa ®Ó chøng tá lßng can ®¶m.",
	}

	TalkEx("",strTalk);

end

--ÓëÅ·Ñô»­¶Ô»°Ñ¯ÎÊ¼àÀÎÎ»ÖÃ
function task_005_02_0()

local strTalk = {
	"Sù viÖc ®Õn ®©u råi?",
	"Xa Lu©n B¸ V­¬ng  rÊt cÈn thËn, nãi lµ gia nhËp NhÊt PhÈm §­êng ph¶i th«ng qua 3 thö th¸ch. Ta b¶o giê m×nh ®ang lµ téi ph¹m bŞ truy n· ë §¹i Tèng, nh­ng h¾n l¹i buéc ta ph¶i tíi Lôc PhiÕn M«n cøu ng­êi, ch¾c lµ muèn th¨m dß ta ®©y.",
	"§óng lµ gian x¶o. Xem ra viÖc nµy ph¶i nhê ®Õn Lôc PhiÕn M«n råi. Ng­¬i h·y ®Õn BiÖn Kinh t×m B¸ch HiÓu Sinh, «ng ta quen biÕt víi Lôc PhiÕn M«n, ch¾c sÏ gióp ®­îc ng­¬i ®Êy. Ta sÏ dïng bå c©u ®­a th­ ®Ó kÓ râ sù t×nh.",
	"§­îc, ®a t¹ sù gióp ®ì cña tiÒn bèi.",
	}

	SetTask(TASK_XB_ID,18);
	TalkEx("",strTalk);
	TaskTip("§Õn BiÖn Kinh, t×m B¸ch HiÓu Sinh nhê gióp ®ì.");
	Msg2Player("§Õn BiÖn Kinh, t×m B¸ch HiÓu Sinh nhê gióp ®ì.");
	GivePlayerExp(SkeyXibei,"citanjimi")
end;

--ÉĞÎ´Óë°ÙÏşÉú¶Ô»°
function task_005_02_1()

local strTalk = {
	"Giê ng­¬i h·y ®Õn BiÖn Kinh t×m B¸ch HiÓu Sinh, ta ®· dïng bå c©u ®­a th­ nãi râ sù t×nh víi «ng ta råi.",
	"§­îc, v·n bèi sÏ ®i ngay."
	}

	TalkEx("",strTalk);

end

--Óë°ÙÏşÉú¶Ô»°»ñµÃÔ¬·ÉÔÆ×ø±ê
function task_005_03_0()

local nMapName,nXpos,nYpos = SelectMapData(1);
local strTalk = {
	"<sex> ®Õn råi µ, ta ®· nhËn ®­îc th­ cña ¢u D­¬ng Häa, chuyÖn cña Lôc PhiÕn M«n ng­¬i cø yªn t©m, ta ®· nhê Bé kho¸i Viªn V©n Phi gióp ®ì, h¾n lµ 1 trong lôc ®¹i danh bæ cña ®¹i Tèng, lµ trô cét cña Lôc PhiÕn M«n, cã sù gióp ®ì cña h¾n, viÖc sÏ ®©u vµo ®Êy c¶.",
	"Hµnh tung cña Bé kho¸i Lôc PhiÕn M«n lµ c¬ mËt, lµm sao ta t×m Viªn Phi V©n ®­îc chø?",
	"Ta ®· viÕt th­ cho Lôc PhiÕn M«n, giê h¾n ®ang ë "..nMapName..", ng­¬i chØ cÇn ®Õn "..(nXpos..", "..nYpos).." dïng Ph¸o hiÖu Lôc PhiÕn m«n nµy, Viªn Phi V©n tù kh¾c xuÊt hiÖn.",
	"§a t¹ tiÒn bèi, cã nhiÒu sù gióp ®ì nh­ vËy, ta nhÊt ®Şnh sÏ hoµn thµnh tèt nhiÖm vô.",
	"<sex> ®õng kh¸ch s¸o, cßn trÎ mµ ®· x¶ th©n v× giang s¬n ®¹i Tèng, hµnh ®éng Êy thËt vü ®¹i. <sex> ph¶i thËt cÈn träng, nÕu gÆp vÊn ®Ò g×, chØ cÇn trong ph¹m vi n¨ng lùc cña Tr­êng Ca M«n, ta ¾t dèc toµn lùc trî gióp.",
	}

	AddItem(2,0,692,1,1);--»ñµÃÁùÉÈÃÅÑÌ»ğ
	SetTask(TASK_XB_ID,19);
	TalkEx("",strTalk);
	TaskTip("§Õn "..nMapName.."("..nXpos..", "..nYpos..") dïng Ph¸o hiÖu Lôc PhiÕn m«n ®Ó gÆp Viªn Phi V©n.");
	Msg2Player("§Õn "..nMapName.."("..nXpos..", "..nYpos..") dïng Ph¸o hiÖu Lôc PhiÕn m«n ®Ó gÆp Viªn Phi V©n.");
	GivePlayerExp(SkeyXibei,"bukuaiyuanyunfei")
end

--Ñ¡È¡Ä¿±êµØÍ¼ºÍ×ø±êµã
--²ÎÊınType£º1,2,3ÎªÓëÔ¬·ÉÔÆ¶Ô»°ËùĞèËæ»úµØµã
function SelectMapData(nType)

local i = 0;
local Map_Data_Index = {};
local nMapName = "";
local nMapDataID,nMapID,nXpos,nYpos = 0,0,0,0;

	if nType == 1 or nType == 2 or nType == 3 then

		nMapDataID = random(1,getn(Map_Data));
		SetTask(YUANFEIYUN_MAP_DATA_ID,nMapDataID);
		nMapName = Map_Data[nMapDataID][1];
		nXpos = Map_Data[nMapDataID][5];
		nYpos = Map_Data[nMapDataID][6];

		return nMapName,nXpos,nYpos

	end

end

--ÉĞÎ´Ê¹ÓÃÑÌ»ğÓëÔ¬·ÉÔÆ»áÃæÊ±Óë°ÙÏşÉú¶Ô»°
function task_005_03_1()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName,nXpos,nYpos = Map_Data[nMapDataID][1],Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local strTalk = {
	"Ta ®· viÕt th­ cho Lôc PhiÕn M«n, giê h¾n ®ang ë "..nMapName..", ng­¬i chØ cÇn ®Õn "..(nXpos..", "..nYpos).." dïng Ph¸o hiÖu Lôc PhiÕn m«n nµy, Viªn Phi V©n tù kh¾c xuÊt hiÖn.",
	"§a t¹ tiÒn bèi, cã nhiÒu sù gióp ®ì nh­ vËy, ta nhÊt ®Şnh sÏ hoµn thµnh tèt nhiÖm vô.",
	"<sex> ®õng kh¸ch s¸o, cßn trÎ mµ ®· x¶ th©n v× giang s¬n ®¹i Tèng, hµnh ®éng Êy thËt vü ®¹i. <sex> ph¶i thËt cÈn träng, nÕu gÆp vÊn ®Ò g×, chØ cÇn trong ph¹m vi n¨ng lùc cña Tr­êng Ca M«n, ta ¾t dèc toµn lùc trî gióp.",
	}

	TalkEx("",strTalk);

	--²¹·¢ÑÌ»ğ
	if GetItemCount(2,0,692) <= 0 then
		AddItem(2,0,692,1,1);--»ñµÃÁùÉÈÃÅÑÌ»ğ
	end

end

--ÓëÔ¬·ÉÔÆ¶Ô»°È¡µÃÂ·ÏßÍ¼
function task_005_04_0()

local nMapName,nXpos,nYpos = SelectMapData(1);
local strTalk = {
	"Ta ®· ®­îc nghe B¸ch HiÓu Sinh nh¾c ®Õn <sex>. LÊy quèc gia x· t¾c lµm träng, g¹t bá lîi İch c¸ nh©n, ®óng lµ anh hïng xuÊt thiÕu niªn! ",
	"Ta chØ muèn lµm chót g× ®ã cho n­íc nhµ, Viªn Bé kho¸i trõ gian diÖt ¸c, danh chÊn vâ l©m, ®­îc Bé kho¸i trî gióp ta thÊy tù tin h¬n nhiÒu.",
	"<sex> ®õng kh¸ch s¸o, chuyÖn kh«ng thÓ chËm trÔ, ta h·y mau v¹ch kÕ ho¹ch øng phã. X«ng vµo nhµ lao Lôc PhiÕn M«n e lµ kh«ng æn l¾m, v× nhµ lao ®­îc canh phßng cÈn mËt, c¬ quan trïng trïng, cho dï <sex> c­íp ngôc thµnh c«ng, còng ph¶i g¸nh lÊy téi danh suèt ®êi.",
	"Xa Lu©n B¸ V­¬ng giao nhiÖm vô nµy, râ rµng lµ muèn ®Èy lµ vµo ngâ côt, giÕt ng­êi nay l¹i thªm téi c­íp ngôc ch¾c ch¾n ta sÏ kh«ng cßn c¬ héi lµm l¹i cuéc ®êi, nh­ng nÕu kh«ng cøu ®­îc S¸t thñ Oa Oa th× kh«ng thÓ cã ®­îc lßng tin cña h¾n. Ch¼ng lÏ kh«ng cßn c¸ch nµo kh¸c sao?",
	"§õng lo l¾ng qu¸, ta ®· suy nghÜ rÊt l©u, nÕu kh«ng thÓ c«ng khai c­íp ngôc, th× h·y cïng nhau ®ãng 1 vë kŞch qua m¾t thiªn h¹ vËy. S¾p tíi ta sÏ ¸p t¶i S¸t thñ Oa Oa ®i ngang "..nMapName.."("..nXpos..", "..nYpos..", ng­¬i h·y tíi c­íp ngôc, ta vê bŞ th­¬ng vµ ng­¬i nh©n c¬ héi cøu S¸t thñ Oa Oa. §©y lµ b¶n ®å lé tr×nh ¸p t¶i, ng­¬i chØ viÖc ®i theo h­íng dÉn trªn ®ã.",
	}

	TalkEx("task_005_04_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_005_04_0_1()

local strTalk = {
	"C¸ch nµy gióp gi¶m bít nhiÒu khã kh¨n trong lóc c­íp ngôc, ®óng lµ diÖu kÕ. Nh­ng kh«ng biÕt c¸ch nµy cã thÓ qua m¾t ®­îc c¸c nha dŞch cïng ®oµn vµ S¸t thñ Oa Oa kh«ng?",
	"Tíi lóc ®ã ta sÏ ®İch th©n ¸p t¶i S¸t thñ Oa Oa, ®Ó lõa ®­îc h¾n, ng­¬i vµ ta ®Òu ph¶i dèc hÕt søc cho cuéc chiÕn, kh«ng ®­îc mÒm lßng n­¬ng tay. Cßn n÷a, ng­¬i cã thÓ ®Õn Phông T­êng phñ t×m DiÖp l·o mua İt ®¹n khãi, nã sÏ gióp İch cho viÖc cøu ng­êi ®Êy.",
	"Nh­ vËy ch¼ng ph¶i Viªn Bé kho¸i ph¶i nhËn l·nh tr¸ch nhiÖm hay sao? Ng­êi hÕt søc gióp ®ì ta, nh­ng ta khiÕn ng­êi mang téi, l¹i cßn bŞ th­¬ng, ta kh«ng thÓ lµm vËy ®­îc.",
	"Ng­êi lµm ®¹i sù kh«ng c©u nÖ tiÓu tiÕt. V× ®¹i côc, chót lîi İch c¸ nh©n nµo cã ®¸ng g×! <sex> vµ ta bÌo n­íc t­¬ng phïng, nh­ng x­a cã c©u kÎ sÜ cã thÓ chÕt v× tri kû kia mµ. §õng ®¾n ®o n÷a, <sex> ®õng ®Ó Viªn mç ph¶i thÊt väng.",
	"KÎ sÜ cã thÓ chÕt v× tri kû, hay l¾m, nÕu ta cßn chÇn chõ, th× hãa ra m×nh qu¸ nhu nh­îc råi. ",
	"VËy míi ®óng lµ con d©n cña ®¹i Tèng chø. Ta ®i chuÈn bŞ mäi thø ®©y. Xin c¸o tõ.",
	}

	AddItem(2,0,693,1,1);--»ñµÃÑºËÍÂ·ÏßÂ·
	SetTask(TASK_XB_ID,20);
	TalkEx("task_005_04_1",strTalk);
	TaskTip("§Õn Phông T­êng t×m th­¬ng nh©n DiÖp l·o mua ®¹n khãi dïng cho viÖc c­íp ngôc.");
	Msg2Player("§Õn Phông T­êng t×m th­¬ng nh©n DiÖp l·o mua ®¹n khãi dïng cho viÖc c­íp ngôc.");
	GivePlayerAward("Award_XB_09","Easy");
	GivePlayerExp(SkeyXibei,"haoxi")
end

--ÓëÔ¬·ÉÔÆ¶Ô»°È¡µÃÂ·ÏßÍ¼ºóNpcÏûÊ§
function task_005_04_1()

	SetNpcLifeTime(GetTask(YUANFEIYUN_NPCINDEX),0);--ÈÃNpcÏûÊ§
	SetNpcScript(GetTask(YUANFEIYUN_NPCINDEX),"");--½Å±¾ÖÃ¿Õ
end

--Óë·ïÏèÒ¶ÀÏ¶Ô»°
function task_005_05_0()

local strTalk = {
	"Xin hái «ng cã ph¶i DiÖp L·o kh«ng? T«i muèn mua Yªn M¹c §¹n.",
	"§óng råi. Ta th­êng giao dŞch víi l¸i bu«n T©y Vùc, Yªn M¹c §¹n nµy lµ tÆng thªm, kh«ng ®¸ng bao nhiªu, nÕu <sex> muèn ta cã thÓ tÆng ng­¬i. Nh­ng ta cã viÖc muèn nhê <sex> gióp ®­îc kh«ng?",
	"¤ng cø nãi ®õng ng¹i, chØ cÇn t«i ®ñ søc, t¹i h¹ sÏ gióp «ng.",
	"Ha ha, <sex> thËt tèt bông, chØ lµ chuyÖn nhá th«i, con trai ta ®Õn C«n L«n ph¸i tu luyÖn, míi ®©y ®· ba n¨m kh«ng vÒ, ta rÊt nhí nã, kh«ng biÕt nã sèng ra sao, søc ta ®· giµ yÕu kh«ng thÓ lªn nói, ng­¬i cã thÓ gióp ta göi chót ®å cho nã kh«ng?",
	"§­îc th«i, kh«ng biÕt con trai «ng tªn g×?",
	"Nã tªn DiÖp Tö Thu, tu luyÖn ë C«n L«n ph¸i, phiÒn ng­¬i gióp ta göi bøc Th­ nhµ vµ Gãi ®å nµy cho nã, hy väng nã kháe. <sex> thËt tèt bông, c¸m ¬n nhiÒu.",
	"¤ng cø yªn t©m, t¹i h¹ sÏ chuyÕn ®Õn ®ã.",
	}

	AddItem(2,0,747,1,1);--µÃµ½´ø¸øÒ¶×ÓÇïµÄ°ü¹üºÍÊéĞÅ
	AddItem(2,0,748,1,1);
	SetTask(TASK_XB_ID,21);
	TalkEx("",strTalk);
	TaskTip("Mang th­ vµ gãi ®å cho DiÖp Tö Thu con trai DiÖp L·o ®ang tu luyÖn trªn C«n L«n ph¸i.");
	Msg2Player("Mang th­ vµ gãi ®å cho DiÖp Tö Thu con trai DiÖp L·o ®ang tu luyÖn trªn C«n L«n ph¸i.");

end

--ÉĞÎ´´øÈ¥¼ÒÊéºÍ°ü¹üÓëÒ¶ÀÏ¶Ô»°£¨²¹·¢ÈÎÎñÎïÆ·£©
function task_005_05_1()

local strTalk = {
	"Con trai ta tªn DiÖp Tö Thu lµ ®Ö tö C«n L«n ph¸i, phiÒn ng­¬i gióp ta chuyÓn ®Õn ®ã. C¸m ¬n <sex> nhiÒu."
	}

	if GetItemCount(2,0,747) <= 0 then
		AddItem(2,0,747,1,1);
	end

	if GetItemCount(2,0,748) <= 0 then
		AddItem(2,0,748,1,1);
	end

	TalkEx("",strTalk);

end

--¸øÒ¶×ÓÇï´øÈ¥¼ÒÊéºÍ°ü¹ü¶Ô»°
function task_005_06_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'NguyÖn hÕt lßng tu ®¹o thuËt ®Ó hµng ma diÖt yªu, cã nh­ vËy thiªn h¹ míi th¸i b×nh.\' S­ ®Ö t×m ta cã viÖc µ?",
			"T«i mang İt ®å cho ®¹i s­ huynh, DiÖp L·o göi cho huynh Th­ nhµ vµ Gãi ®å, «ng Êy rÊt nhí huynh, hy väng huynh cã thêi gian ®i th¨m «ng.",
			"PhiÒn s­ ®Ö råi. Ta ®· xa nhµ ®Õn C«n L«n tu luyÖn míi ®©y ®· ba n¨m, bá cha giµ c« ®¬n mét m×nh ë nhµ, «ng vÉn kháe chø?",
			}
	else
		strTalk = {
			"\'NguyÖn hÕt lßng tu ®¹o thuËt ®Ó hµng ma diÖt yªu, cã nh­ vËy thiªn h¹ míi th¸i b×nh.\' <sex> t×m ta cã viÖc µ?",
			"ThiÕu hiÖp cã ph¶i lµ con cña DiÖp L·o, DiÖp Tö Thu?",
			"§óng, sao ng­¬i biÕt gia phô? Ph¶i ch¨ng gia phô x¶y ra chuyÖn?",
			"Kh«ng ph¶i, DiÖp L·o ë Phông T­êng vÉn kháe, thiÕu hiÖp kh«ng cÇn lo l¾ng. Ta ®Õn ®­a ®å th«i, DiÖp L·o göi Th­ nhµ vµ Gãi ®å, «ng rÊt nhí ng­¬i, hy väng ng­¬i cã thêi gian ®i th¨m «ng.",
			}
	end

	TalkEx("task_005_06_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_005_06_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
	 	strTalk = {
			"Huynh tuy hÕt lßng tu hµnh trõ ma, nh­ng còng cÇn nhí ®Õn ng­êi th©n míi ph¶i. DiÖp L·o rÊt kháe, huynh yªn t©m. ¤ng c« ®¬n mét m×nh ë Phông T­êng , muèn lªn nói th¨m nh­ng tuæi giµ søc yÕu kh«ng thÓ ®i ®­îc. Tuy c¸ch xa ngµn dÆm nh­ng vÉn lo l¾ng cho huynh.",
			"S­ ®Ö nãi ph¶i, ta qu¶ bÊt hiÕu. S­ ®Ö cã thÓ gióp ta b¸o cho gia phô kh«ng? Ta rÊt kháe, chê lµm xong nhiÖm vô s­ phô giao cho sÏ vÒ th¨m «ng.",
			"§­îc, mong huynh mau chãng vÒ nhµ."
			}
	else
		strTalk = {
			"PhiÒn <sex> råi. Ta ®· rêi nhµ ®Õn C«n L«n tu luyÖn míi ®©y ®· ba n¨m, bá cha giµ c« ®¬n mét m×nh ë nhµ, «ng vÉn kháe chø?",
			"Ng­¬i tuy hÕt lßng tu hµnh trõ ma, nh­ng còng cÇn nhí ®Õn ng­êi th©n míi ph¶i. DiÖp L·o rÊt kháe, ng­¬i yªn t©m. ¤ng c« ®¬n mét m×nh ë Phông T­êng, muèn lªn nói th¨m nh­ng tuæi giµ søc yÕu kh«ng thÓ ®i ®­îc. Tuy c¸ch xa ngµn dÆm nh­ng vÉn lo l¾ng cho ng­¬i.",
			"Qu¶ thùc ta bÊt hiÕu. <sex> cã thÓ gióp ta b¸o cho gia phô kh«ng? Ta rÊt kháe, chê lµm xong nhiÖm vô s­ phô giao cho sÏ vÒ th¨m «ng.",
			"§­îc, mong huynh mau chãng vÒ nhµ.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,747,1);--É¾È¥°ü¹üºÍÊéĞÅ
	DelItem(2,0,748,1);
	SetTask(TASK_XB_ID,22);
	TaskTip("Gióp DiÖp Tö Thu b¸o cho DiÖp L·o, chê lµm xong viÖc sÏ vÒ nhµ mét chuyÕn.");
	Msg2Player("Gióp DiÖp Tö Thu b¸o cho DiÖp L·o, chê lµm xong viÖc sÏ vÒ nhµ mét chuyÕn.");
	GivePlayerAward("Award_XB_10","Easy");
	GivePlayerExp(SkeyXibei,"jiashu")
end

--Î´´ø»Ø»°¸øÒ¶ÀÏÓëÒ¶×ÓÇï¶Ô»°
function task_005_06_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§a t¹ s­ ®Ö gióp ®ì, phiÒn chuyÓn lêi cho gia phô, khi lµm xong viÖc sÏ vÒ th¨m «ng."
			}
	else
		strTalk = {
			"§a t¹ <sex>, phiÒn chuyÓn lêi cho gia phô, khi lµm xong viÖc sÏ vÒ th¨m «ng."
			}
	end

	TalkEx("",strTalk);

end

--´ø»°¸øÒ¶ÀÏÈ¡µÃÑÌÄ»µ¯¶Ô»°
function task_005_07_0()

SelectMapData(2);

local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"<sex> gÆp con trai ta kh«ng? Nã kháe kh«ng?",
	"DiÖp L·o yªn t©m, huynh Êy rÊt kháe, huynh Êy cßn nãi khi nµo lµm xong viÖc s­ phô giao sÏ vÒ th¨m «ng.",
	"å, vËy tèt råi, chØ cÇn nã kháe lµ ta yªn t©m. TÆng ng­¬i Yªn M¹c §¹n, c¶m ¬n <sex> ®· gióp ®ì.",
	"ChuyÖn nhá th«i.",
	}

	AddItem(2,0,694,1,1);--µÃµ½ÑÌÄ»µ¯
	--²¹·¢Â·ÏßÍ¼
	if GetItemCount(2,0,693) <= 0 then
		AddItem(2,0,693,1,1)
	end
	SetTask(TASK_XB_ID,23);
	TalkEx("",strTalk);
	CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
	TaskTip("§· nhËn Yªn M¹c §¹n, theo b¶n ®å mµ Viªn Bé §Çu giao cho ®i c­íp ngôc.");
	Msg2Player("§· nhËn Yªn M¹c §¹n, theo b¶n ®å mµ Viªn Bé §Çu giao cho ®i c­íp ngôc.");
	GivePlayerExp(SkeyXibei,"yanwudan")
end

--Î´Íê³É½ÙÇôÈÎÎñÓëÒ¶ÀÏ¶Ô»°£¨²¹·¢´¥·¢Æ÷ÓëÈÎÎñÎïÆ·£©
function task_005_07_1()

local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"C¸m ¬n <sex> gióp ®ì, <sex> qu¶ lµ tèt bông."
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,693) <= 0 or GetItemCount(2,0,693) <= 0 or GetTrigger(RECT_XB_YUANFEIYUN) == 0 then

		if GetItemCount(2,0,694) <= 0 then--²¹·¢ÑÌÎíµ¯
			AddItem(2,0,694,1,1)
		end

		if GetItemCount(2,0,693) <= 0 then--²¹·¢Â·ÏßÍ¼
			AddItem(2,0,693,1,1)
		end

		if GetTrigger(RECT_XB_YUANFEIYUN) == 0 then--²¹·¢´¥·¢Æ÷
			CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
		end

		TaskTip("§· nhËn Yªn M¹c §¹n, theo b¶n ®å mµ Viªn Bé §Çu giao cho ®i c­íp ngôc.");
		Msg2Player("§· nhËn Yªn M¹c §¹n, theo b¶n ®å mµ Viªn Bé §Çu giao cho ®i c­íp ngôc.");

	end

end

--ÓëÔ¬·ÉÔÆ¶Ô»°×¼±¸½ÙÇô
function task_005_08_0(nNpcIndex)

local strSay = {};
local strTalk = {};

	--ÅĞ¶ÏÊÇ·ñÎªµ±Ç°Íæ¼ÒÕÙ»½³öÀ´µÄNpc
	if GetTask(YUANFEIYUN_NPCINDEX) == nNpcIndex and GetTask(TASK_XB_ID) == 23 then
		if GetFollower() == 0 then
			strSay = {
				"Ai ®Êy? X­ng tªn ®i! D¸m ngang nhiªn c­íp ngôc, chèng ®èi quan phñ, xem Lôc PhiÕn M«n ta kh«ng ra g× µ? TiÕp chiªu!",
				"§õng nhiÒu lêi, h·y mau th¶ ng­êi cho ta!/#task_005_08_1("..nNpcIndex..")",
				"ChØ lµ qua ®­êng th«i./Task_Exit",
				}
		else
			strSay = {
				"Ai ®Êy? X­ng tªn ®i! D¸m ngang nhiªn c­íp ngôc, chèng ®èi quan phñ, xem Lôc PhiÕn M«n ta kh«ng ra g× µ? TiÕp chiªu!",
				"§õng nhiÒu lêi, h·y mau th¶ ng­êi cho ta!/#task_005_08_2("..nNpcIndex..")",
				"ChØ lµ qua ®­êng th«i./Task_Exit",
				}
		end
		SelectSay(strSay);
	elseif GetTask(TASK_XB_ID) == 23 then
		strTalk = {
			"D­êng nh­ t×m nh»m ng­êi råi, h·y ®Õn "..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][1].."("..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][5]..", "..Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][6].." t×m thö."
			}
		TalkEx("",strTalk);
	else
		strTalk = {
			"D­êng nh­ nhÇm ng­êi."
			}
		TalkEx("",strTalk);
	end

end

--ÌáÊ¾É¾µô³èÎï¸ú°à
function task_005_08_1(nNpcIndex)

local strSay = {
	"Nh¾c nhë: Khi c­íp S¸t Thñ Oa Oa thµnh c«ng, sÏ hñy bá thó c­ng hiÖn mang theo, tiÕp tôc c­íp ngôc kh«ng?",
	"§ång ı/#task_005_08_2("..nNpcIndex..")",
	"Hñy bá/Task_Exit"
	}

	SelectSay(strSay);

end

--Ñ¡Ôñ½ÙÇô
function task_005_08_2(nNpcIndex)

local strTalk = {};

	if GetItemCount(2,0,694) <= 0 then
		strTalk = {
			"... (®¹n khãi ch¶ lÏ mÊt råi, hay lµ t×m DiÖp L·o t×m l¹i.)",
			"Xin lçi, nhËn nh»m ng­êi.",
			"(Tªn nµy ®ang lµm trß g× vËy, cßn kh«ng mau dïng ®¹n khãi c­íp ngôc...)"
			}
		TalkEx("",strTalk)
	else
		--¼ÓÈëÑÌÄ»µ¯ÌØĞ§
		strTalk = {
			"A?! Lµ ®¹n khãi! Cã ng­êi c­íp ngôc!",
			"(Mau chãng ®¸nh b¹i Viªn Bé §Çu, cøu S¸t Thñ Oa Oa.)"
			}
		TalkEx("",strTalk)
		ChangeNpcToFight(nNpcIndex);
	end
end

--»÷°ÜÔ¬·ÉÔÆºó¶Ô»°
function task_005_08_3()

local strTalk = {
	"Ng­¬i lµ quû thÇn ph­¬ng nµo? Kh«ng quen kh«ng biÕt, sao l¹i cøu ta? B¸o cho ng­¬i biÕt lµ nÕu ta muèn rêi khái ®©y còng kh«ng cÇn ng­¬i gióp søc ®©u! §óng lµ phiÒn phøc!",
	}

	TalkEx("task_005_08_3_1",strTalk);

end

-- Ğø¶Ô»°
function task_005_08_3_1()

local strTalk = {
	"VËy..? (lÏ nµo ta cøu nhÇm ng­êi?) C¸c h¹ cã ph¶i lµ mét trong ThËp ®¹i kim cang NhÊt PhÈm §­êng, S¸t Thñ Oa Oa kh«ng? Ta phông mÖnh Xa Lu©n B¸ V­¬ng , gi¶i cøu c¸c h¹.",
	"å, th× ra l·o Xa Lu©n ph¸i ng­¬i ®Õn, kh«ng sai, ta chİnh lµ S¸t Thñ Oa Oa, ng­¬i lµ ng­êi cña NhÊt PhÈm §­êng? Lµm sao ng­êi biÕt ta sÏ qua lèi nµy? NÕu ta kh«ng bŞ b¾t th× lµm sao cøu ®­îc?",
	"T«i vÉn ch­a gia nhËp NhÊt PhÈm §­êng, cøu…µ kh«ng…®ãn c¸c h¹ vÒ lµ mét bµi thö th¸ch cña t«i. T«i Èn n¸u ë Lôc PhiÕn M«n nhiÒu ngµy, th¸m thİnh ®­îc Viªn Phi V©n sÏ ¸p gi¶i c¸c h¹ qua chç nµy, nªn ë ®©y chê ®îi.",
	"Kh¸ l¾m, vÒ b¸o víi Xa Lu©n r»ng, ta chØ muèn vµo Nhµ lao bÓ ®ã ®Ó ch¬i vµi ngµy th«i, chø kh«ng ph¶i ta kh«ng hoµn thµnh nhiÖm vô. Lôc PhiÕn M«n ta ®· xem lµ g× chø?",
	}

	SummonNpc("S¸t Thñ Oa Oa","S¸t Thñ Oa Oa");
	TalkEx("task_005_08_3_2",strTalk);
	SetTask(TASK_XB_ID,24);

end

-- Ğø¶Ô»°
function task_005_08_3_2()

local strTalk = {
	"(Ng­êi nµy ®óng lµ mét trong ThËp ®¹i kim cang NhÊt PhÈm §­êng kh«ng? ThËp ®¹i kim cang lµ nh÷ng nh©n vËt g× nhØ? Ng­êi nµy nh×n qu¸ trÎ con, râ rµng bŞ b¾t mµ cßn sÜ diÖn. Th«i, vÒ t×m Xa Lu©n B¸ V­¬ng  råi tİnh tiÕp.)",
	"Nãi vËy, c¸c h¹ cã rÊt nhiÒu bİ mËt t×nh b¸o? Chi b»ng chóng ta vÒ gÆp Xa Lu©n B¸ V­¬ng råi tİnh tiÕp.",
	"Ha ha, tiÓu tö kh¸ l¾m, sau nµy NhÊt PhÈm §­êng sÏ cã nhiÒu ®Êt dông vâ, cø theo lêi ng­¬i vËy. LÏ nµo lµ vËy, tªn hä Viªn d¸m c­íp KÑo Hå L« cña ta, thËt lµ phiÒn qu¸…",
	}

	TalkEx("",strTalk);
	TaskTip("§· cøu S¸t Thñ Oa Oa, t×m Xa Lu©n B¸ V­¬ng phôc mÖnh.");
	Msg2Player("§· cøu S¸t Thñ Oa Oa, t×m Xa Lu©n B¸ V­¬ng phôc mÖnh.");
end

--Óë³µÂÖ°ÔÍõ¶Ô»°Íê³É½»ÓèµÄµÚÒ»¸öÈÎÎñ£¬ÁìÈ¡µÚ¶ş¸öÈÎÎñ
--ÁìÈ¡ÈÎÎñ¶Ô»°
function task_005_09_0()

	if GetTask(TASK_GET_AWARD) == 1 then
		task_005_09_0_3()
		return 0;
	end

local strTalk = {
	"S¸t Thñ Oa Oa ®· vÒ.",
	"Ta chØ lµ ®Õn nhµ lao ®ã d¹o mét vßng, tiÖn thÓ th¸m thİnh t×nh h×nh, kh«ng ph¶i lµ bŞ b¾t. PhiÒn Xa Lu©n ph¸i tiÓu tö nµy ®Õn ®ãn ta råi. Th©n thñ tiÓu tö nµy rÊt kh¸, chØ lµ h¬i non tı th«i.",
	"Ha ha ha, <sex> kh«ng ph¶i tÇm th­êng. S¸t Thñ Oa Oa nãi ng­¬i kh¸ th× ch¾c ng­¬i kh«ng ®Õn nçi nµo. Nh­ng Lôc PhiÕn M«n sÏ kh«ng ®Ó yªn cho ng­¬i ®©u.",
	"Cã thÓ v× NhÊt PhÈm §­êng, th× tı chuyÖn phiÒn phøc cã ®¸ng lµ g× chø! Ngoµi Lôc PhiÕn M«n ra th× mäi chuyÖn ®Òu tèt ®Ñp. NhÊt PhÈm §­êng sÏ cho t«i n¬i n­¬ng nhê, kh«ng chê ®Õn chuyÖn Lôc PhiÕn M«n kh«ng bu«ng tha.",
	"(D­êng nh­ qua ¶i råi, may mµ kh«ng phô kú väng cña Viªn Bé Kho¸i.)",
	"TiÓu tö nµy lµm viÖc chu ®¸o, ®· ®¸nh b¹i Viªn Phi V©n. Thùc ra Viªn Phi V©n lµm sao cã thÓ lµ ®èi thñ cña ta, ta chØ lµ nh­êng cho tiÓu tö ®ã mét c¬ héi biÓu hiÖn.",
	}

	TalkEx("task_005_09_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_005_09_0_1()

local strTalk = {
	"Ha ha ha, qu¶ lµ anh hïng xuÊt thiÕu niªn, ta giµ ®Õn n¬i råi. TiÓu Oa lÇn sau ®õng ®Õn nhµ lao ®ã ch¬i n÷a, ta sÏ kh«ng ph¸i ng­êi ®ãn ng­¬i n÷a ®©u.",
	"Xa Lu©n bít dµi dßng, hä Viªn d¸m ®èi ®Çu víi NhÊt PhÈm §­êng chóng ta, ngay c¶ tiÓu tö nµy cßn ®èi phã kh«ng ®­îc, sao d¸m b¾t ta? Cßn c­íp KÑo Hå L«…ta muèn lét da rót g©n cña h¾n. TiÓu tö, lÇn sau chóng ta cïng nhau h¹ h¾n, xong chuyÖn ta mêi ng­¬i KÑo Hå L«.",
	"(S¸t Thñ Oa Oa qu¶ danh bÊt h­ truyÒn, h×nh d¸ng nh­ con nİt, t©m nh­ s¸t thñ, sau nµy ph¶i cÈn thËn ®èi phã.)",
	"Cã thÓ cøu ng­êi tõ tay Viªn Phi V©n cña Lôc PhiÕn M«n, <sex> qu¶ lµ khã l­êng! Ng­¬i còng mÖt råi, nghØ ng¬i ®i, lÇn kh¶o nghiÖm nµy míi g× lµ mãn khai vŞ th«i, mãn ngon cßn ë phİa sau ®ã.",
	"Kh«ng d¸m. Xin dÆn dß, t¹i h¹ sÏ hÕt søc mµ lµm.",
	}

	TalkEx("task_005_09_0_2",strTalk);

end

--·¢½±Àø
function task_005_09_0_2()

	give_wp_award(11);

end

--³É¹¦ÁìÈ¡½±ÀøºóÖ´ĞĞ
function task_005_09_0_3()

	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID,25);
	GivePlayerAward("Award_XB_11","Easy");
	GivePlayerExp(SkeyXibei,"jieqiu")
	TaskTip("Sau khi nghØ ng¬i, Xa Lu©n giao nhiÖm vô thø hai.");
	Msg2Player("Sau khi nghØ ng¬i, Xa Lu©n giao nhiÖm vô thø hai.");
	task_005_09_1()

end;

--É¾È¥ÍŞÍŞÉ±ÊÖ
function task_005_09_1()

local nFollowerName = GetNpcName(GetFollower());

	if nFollowerName == "S¸t Thñ Oa Oa" then
		KillFollower();
	end

end

---------------------------------- Î÷±±Çø06²»ËÀ½ğµ¤----------------------------------
--ÁìÈ¡µÚ¶ş¸ö¿¼Ñé
function task_006_01_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Nói C«n L«n lµ ngän nói trµn ®Çy tiªn khİ, t­¬ng truyÒn ng­êi C«n L«n ph¸i ngoµi tinh th«ng c¸ch hµng yªu diÖt ma, cßn n¾m gi÷ bİ thuËt luyÖn Tr­êng Sinh BÊt L·o ®¬n, nhiÒu n¨m tr­íc T©y H¹ V­¬ng Téc ta ®Õn cÇu c¸ch chÕ luyÖn, nh­ng bŞ ch­ëng m«n C«n L«n ph¸i Chu BÊt HoÆc tõ chèi.",
			"C«n L«n ph¸i cã bİ thuËt ®ã sao?? (Thuèc cña C«n L«n ph¸i ta biÕn thµnh Tr­êng Sinh BÊt L·o ®¬n khi nµo nhØ?)",
			"§©y lµ bİ mËt ®· ®­îc c«ng khai, chØ lµ ch­ëng m«n C«n L«n ph¸i kh«ng nhËn mµ th«i. T©y H¹ V­¬ng Téc ta dïng lÔ ®èi ®·i, kh«ng ngê C«n L«n ph¸i kh«ng thøc thêi nh­ vËy, sÏ cã mét ngµy NhÊt PhÈm §­êng ta lµm cá C«n L«n ph¸i.",
			"Tr­êng Sinh BÊt L·o ®¬n qu¶ lµm thiªn h¹ kinh hoµng, nÕu C«n L«n thõa nhËn hä cã c¸ch luyÖn ®¬n ®ã th× kh«ng ph¶i lµ tù chuèc häa vµo th©n sao?",
			}
	else
		strTalk = {
			"Nói C«n L«n lµ ngän nói trµn ®Çy tiªn khİ, t­¬ng truyÒn ng­êi C«n L«n ph¸i ngoµi tinh th«ng c¸ch hµng yªu diÖt ma, cßn n¾m gi÷ bİ thuËt luyÖn Tr­êng Sinh BÊt L·o ®¬n, nhiÒu n¨m tr­íc T©y H¹ V­¬ng Téc ta ®Õn cÇu c¸ch chÕ luyÖn, nh­ng bŞ ch­ëng m«n C«n L«n ph¸i Chu BÊt HoÆc tõ chèi.",
			"C«n L«n ph¸i cã bİ thuËt ®ã sao?",
			"§©y lµ bİ mËt ®· ®­îc c«ng khai, chØ lµ ch­ëng m«n C«n L«n ph¸i kh«ng nhËn mµ th«i. T©y H¹ V­¬ng Téc ta dïng lÔ ®èi ®·i, kh«ng ngê C«n L«n ph¸i kh«ng thøc thêi nh­ vËy, sÏ cã mét ngµy NhÊt PhÈm §­êng ta lµm cá C«n L«n ph¸i.",
			"Tr­êng Sinh BÊt L·o ®¬n qu¶ lµm thiªn h¹ kinh hoµng, nÕu C«n L«n thõa nhËn hä cã c¸ch luyÖn ®¬n ®ã th× kh«ng ph¶i lµ tù chuèc häa vµo th©n sao?",
			}
	end

	TalkEx("task_006_01_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_006_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i nãi còng cã lı, dï r»ng C«n L«n ph¸i thËt sù cã c¸ch luyÖn Tr­êng Sinh BÊt L·o ®¬n th× còng kh«ng dÔ dµng tiÕt lé. Lßng gan d¹ s¸ng suèt cña ng­¬i ta nhËn thÊy råi, nh­ng kh«ng biÕt kh¶ n¨ng dä th¸m t×nh h×nh thÕ nµo, mµ ®ã l¹i lµ mét kü n¨ng mµ ng­êi trong NhÊt PhÈm §­êng ai còng tinh th«ng, ng­¬i ®i C«n L«n dä th¸m mét chuyÕn, xong viÖc lµ qua kh¶o nghiÖm thø hai.",
			"ChuyÖn nµy ®©u cã g× khã! H·y chê tin cña t¹i h¹.",
			"(Tr­êng Sinh BÊt L·o ®¬n? ¡n nãi ví vÈn. Nghe ng÷ khİ cña h¾n d­êng nh­ cã ©m m­u víi C«n L«n ta, cÇn ph¶i l­u ı. S­ huynh DiÖp Tö Thu tinh th«ng thuËt luyÖn ®¬n, chi b»ng ®i hái huynh Êy)",
			}
	else
		strTalk = {
			"Ng­¬i nãi còng cã lı, dï r»ng C«n L«n ph¸i thËt sù cã c¸ch luyÖn Tr­êng Sinh BÊt L·o ®¬n th× còng kh«ng dÔ dµng tiÕt lé. Lßng gan d¹ s¸ng suèt cña ng­¬i ta nhËn thÊy råi, nh­ng kh«ng biÕt kh¶ n¨ng dä th¸m t×nh h×nh thÕ nµo, mµ ®ã l¹i lµ mét kü n¨ng mµ ng­êi trong NhÊt PhÈm §­êng ai còng tinh th«ng, ng­¬i ®i C«n L«n dä th¸m mét chuyÕn, xong viÖc lµ qua kh¶o nghiÖm thø hai.",
			"ChuyÖn nµy ®©u cã g× khã! H·y chê tin cña t¹i h¹.",
			"(Th¸i ®é ng­êi nµy ®èi víi ta cã vÎ «n hßa h¬n råi. Tr­êng Sinh BÊt L·o ®¬n? An nãi ví vÈn. Nh­ng thuËt luyÖn ®¬n C«n L«n ph¸i danh trÊn giang hå, ®óng råi ®Õn t×m DiÖp Tö Thu hái thö.)",
			}
	end

	SetTask(TASK_XB_ID,26);
	TalkEx("",strTalk);
	TaskTip("T×m DiÖp Tö Thu th¸m thİnh t×nh h×nh Tr­êng Sinh BÊt L·o ®¬n.");
	Msg2Player("T×m DiÖp Tö Thu th¸m thİnh t×nh h×nh Tr­êng Sinh BÊt L·o ®¬n.");

end

--Î´ÓëÒ¶×ÓÇï´òÌı³¤Éú²»ÀÏµ¤ÊÂÇé
function task_006_01_1()

local strTalk = {
	"Kho¶ng nghiÖm lÇn hai: ®Õn C«n L«n ph¸i dä th¸m bİ thuËt luyÖn Tr­êng Sinh BÊt L·o ®¬n ®Ó chøng minh n¨ng lùc dä th¸m."
	}

	TalkEx("",strTalk);

end

--ÏòÒ¶×ÓÇï´òÌı³¤Éú²»ÀÏµ¤
function task_006_02_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'B¸ t¸nh cã n¹n, thiªn h¹ rèi lo¹n. Ta dèc lßng tu luyÖn ®Ó trõ yªu ma, tr¶ l¹i sù thanh b×nh cho thiªn h¹.\' Sao s­ ®Ö l¹i quay vÒ ®©y? Ph¶i ch¨ng th©n phô ta cã viÖc g×?",
			"DiÖp l·o vÉn kháe, nghe nãi s­ huynh sÏ vÒ th¨m nhµ, l·o rÊt vui. NÕu DiÖp l·o biÕt s­ huynh quan t©m m×nh nh­ vËy, h¼n cßn vui h¬n.",
			"¥n d­ìng dôc cña th©n phô, ta nµo d¸m quªn? BiÕt ng­êi vÉn kháe m¹nh lµ ta yªn t©m råi. S­ ®Ö t×m ta cã viÖc g×?",
			}
	else
		strTalk = {
			"\'B¸ t¸nh cã n¹n, thiªn h¹ rèi lo¹n. Ta dèc lßng tu luyÖn ®Ó trõ yªu ma, tr¶ l¹i sù thanh b×nh cho thiªn h¹.\' Sao <sex> l¹i quay vÒ ®©y? Ph¶i ch¨ng th©n phô ta cã chuyÖn g×?",
			"Kh«ng, DiÖp l·o vÉn kháe, biÕt huynh sÏ vÒ th¨m, DiÖp l·o rÊt vui. NÕu biÕt huynh quan t©m m×nh nh­ thÕ, h¼n DiÖp l·o sÏ cßn vui h¬n.",
			"¥n d­ìng dôc cña th©n phô, ta nµo d¸m quªn? BiÕt ng­êi vÉn kháe m¹nh lµ ta yªn t©m råi. <sex> ®Õn ®©y cã viÖc g× kh«ng?",
			"Ta tõ nhá ®· l¾m bÖnh tËt, ph¶i sèng nhê ®¬n d­îc, nªn ®· lËp chİ theo häc LuyÖn ®¬n chi ph¸p, cøu nh©n ®é thÕ. Nghe ®ån thuËt luyÖn ®¬n cña C«n L«n ph¸i thiªn h¹ v« song, kh«ng biÕt ta cã thÓ nhËp m«n b¸i s­, häc kü n¨ng luyÖn ®¬n?",
			"<sex> kh«ng nh÷ng nhiÖt t×nh mµ cßn cã tÊm lßng hiÖp nghÜa, Tö Thu xin b¸i phôc. Ta cßn ®ang ph©n v©n kh«ng biÕt ph¶i lµm thÕ nµo b¸o ®¸p c«ng lao cña <sex>, nay ®­îc biÕt <sex> cã ı gia nhËp C«n L«n ph¸i, vËy th× cßn g× b»ng. Ta sÏ ®­a ng­êi ®Õn gÆp ch­ëng m«n.",
			}
	end

	TalkEx("task_006_02_0_1",strTalk);

end

-- Ğø¶Ô»°
function task_006_02_0_1()

local strTalk = {}

	if GetPlayerRoute() == 100 then
		strTalk = {
			"§­îc biÕt s­ huynh ®· ®­îc bİ thuËt luyÖn ®¬n ch©n truyÒn cña s­ phô, ®Ö cã vµi vÊn ®Ò muèn ®­îc thØnh gi¸o.",
			"Ta ®ang ph©n v©n kh«ng biÕt ph¶i b¸o ®¸p c«ng lao cña s­ ®Ö thÕ nµo, s­ ®Ö ham häc hái nh­ vËy, s­ huynh ta ®­¬ng nhiªn ph¶i gióp ®ì hÕt m×nh. Nh­ng giê ®©y ta cßn ph¶i ®i thùc hiÖn nhiÖm vô khÈn cÊp mµ s­ phô võa giao, e kh«ng thÓ gi¶i quyÕt ngay cho s­ ®Ö ®­îc. Hay lµ h·y ®îi ta vÒ råi bµn tiÕp vËy.",
			"DiÖp s­ huynh cø yªn t©m ®i lµm nhiÖm vô s­ phô giao phã, vÊn ®Ò cña ®Ö kh«ng quan träng, ®Ö t×m TriÖu s­ huşnh còng ®­îc mµ.",
			}
		TaskTip("T×m TriÖu Tö B×nh s­ huynh t×m hiÓu vÒ viÖc luyÖn chÕ ®¬n d­îc.");
		Msg2Player("T×m TriÖu Tö B×nh s­ huynh t×m hiÓu vÒ viÖc luyÖn chÕ ®¬n d­îc.");
	else
		strTalk = {
			"§a t¹ sù gióp ®ì cña thiÕu hiÖp, kh«ng biÕt hiÖn t¹i ta cã thÓ nhËp ph¸i ch­a?",
			"C«n L«n ph¸i lu«n chµo ®ãn hiÖp sÜ, nh­ng hiÖn giê ta ph¶i ®i lµm nhiÖm vô khÈn cho s­ phô, e lµ sù viÖc ph¶i ho·n l¹i. NÕu <sex> muèn nhËp m«n ngay b©y giê, cã thÓ ®Õn t×m s­ ®Ö cña ta TriÖu Tö B×nh, ®Ö Êy sÏ ng­êi ®Õn gÆp ch­ëng m«n. Cßn nÕu kh«ng véi, cã thÓ ®îi ta trë vÒ råi míi ®i, sao h¶?",
			"(NÕu ta ®îi huynh Êy trë vÒ, viÖc cña Xa Lu©n B¸ V­¬ng  biÕt gi¶i quyÕt sao ®©y? Hay cø ®i gÆp s­ ®Ö cña huynh Êy vËy.)",
			"ThiÕu hiÖp cø yªn t©m ®i lµm nhiÖm vô cho s­ phô, ®õng ®Ó viÖc cña ta lµm lì ®¹i sù, ta sÏ ®i t×m s­ ®Ö cña thiÕu hiÖp. ",
			"VËy còng ®­îc, ®îi ta trë vÒ th× chóng ta ®· lµ ®ång m«n, ¬n hiÖp nghÜa cña <sex> ta sÏ b¸o ®¸p sau.",
			"Chót viÖc nhá ®õng nªn bËn t©m, <sex> ph¶i cÈn thËn hµnh sù.",
			}
		TaskTip("T×m TriÖu Tö B×nh hái vÒ viÖc gia nhËp C«n L«n ph¸i vµ viÖc chÕ luyÖn ®¬n d­îc.");
		Msg2Player("T×m TriÖu Tö B×nh hái vÒ viÖc gia nhËp C«n L«n ph¸i vµ viÖc chÕ luyÖn ®¬n d­îc.");
	end
	GivePlayerExp(SkeyXibei,"diergekaoyan")
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,27);
end

--Î´ÓëÕÔ×ÓÆ½¶Ô»°
function task_006_02_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"TriÖu Tö B×nh s­ huynh sÏ gi¶i ®¸p ®­îc th¾c m¾c cña ng­¬i, h·y ®Õn hái huynh Êy."
			}
	else
		strTalk = {
			"S­ ®Ö TriÖu Tö B×nh sÏ thay ta giíi thiÖu ng­¬i víi ch­ëng m«n, ta xin c¸o tõ."
			}
	end

	TalkEx("",strTalk);

end

--ÓëÕÔ×ÓÆ½¶Ô»°ÁìÈ¡È¥¹ÅÑô¶´ÊÕ¼¯Áò»ÇµÄÈÎÎñ
function task_006_03_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"TriÖu s­ huynh, ®Ö cã khóc m¾c vÒ viÖc luyÖn ®¬n. Xin huynh chØ gi¸o.",
			"ThuËt luyÖn ®¬n? S­ ®Ö say mª nghiªn cøu kü n¨ng cña ph¸i ta nh­ vËy, s­ huynh ®­¬ng nhiªn kh«ng thÓ tõ chèi. Nh­ng giê ta ®ang phô tr¸ch canh gi÷ phßng luyÖn ®¬n, kh«ng thÓ gi¶i ®¸p th¾c m¾c cho s­ ®Ö ®­îc. S­ phô cã dÆn cÇn luyÖn Kim ®¬n, muèn luyÖn ®¬n d­îc, quan träng nhÊt lµ khèng chÕ háa hÇu, nÕu löa luyÖn ®¬n kh«ng ®óng th× ®¬n d­îc sÏ kh«ng thµnh, ta kh«ng g¸nh næi tr¸ch nhiÖm ®©u.",
			"Ra luyÖn ®¬n còng cÇn ®Õn háa hÇu. Kh«ng biÕt ®¬n d­îc bao giê míi hoµn thµnh, ®Ó s­ huynh gi¶i ®¸p cho ®Ö?",

			}
	else
		strTalk = {
			"Cã ph¶i TriÖu Tö B×nh thiÕu hiÖp kh«ng? Tõ l©u ®· nghe danh C«n L«n ph¸i cã thuËt luyÖn ®¬n cao siªu, muèn gia nhËp C«n L«n ph¸i häc nghÖ, DiÖp Tö Thu thiÕu hiÖp nãi ta cã thÓ nhê ng­êi ®­a ta tíi gÆp ch­ëng m«n. Xin thiÕu hiÖp gióp ®ì.",
			"Ng­êi ®­îc DiÖp s­ huynh tiÕn cö, h¼n lµ hiÖp sü chİnh nghÜa råi, ®i gÆp ch­ëng m«n lµ chuyÖn nhá, ta ®­¬ng nhiªn sÏ gióp.",
			"Hay qu¸, ®a t¹ TriÖu thiÕu hiÖp.",
			"Nh­ng giê ta ®ang phô tr¸ch canh gi÷ phßng luyÖn ®¬n, kh«ng thÓ tù ı rêi bá c­¬ng vŞ, s­ phô cã dÆn hiÖn giê cÇn ph¶i luyÖn Kim ®¬n, khi luyÖn ®¬n, quan träng nhÊt lµ ph¶i khèng chÕ háa hÇu, nÕu löa luyÖn ®¬n kh«ng ®óng th× ®¬n d­îc sÏ kh«ng thµnh, ta kh«ng g¸nh næi tr¸ch nhiÖm ®©u.",
			"Ra luyÖn ®¬n còng cÇn ®Õn háa hÇu. Kh«ng biÕt ®¬n d­îc bao giê míi hoµn thµnh, ®Ó thiÕu hiÖp gi¶i ®¸p th¾c m¾c cho ta?",

			}
	end

	TalkEx("task_006_03_0_1",strTalk);


end

-- Ğø¶Ô»°
function task_006_03_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Kh«ng nãi ch¾c ®­îc, cã thÓ chØ mÊy canh giê, còng cã thÓ mÊt mÊy ngµy mÊy ®ªm. NÕu s­ ®Ö muèn ®­îc gi¶i ®¸p nhanh, cã thÓ gióp ta t×m İt l­u huúnh vÒ lµm d­îc dÉn, l­u huúnh tİch tô d­îc khİ, gióp rót ng¾n thêi gian luyÖn ®¬n.",
			"§­îc, kh«ng thµnh vÊn ®Ò. Nh­ng kh«ng biÕt ë ®©u cã l­u huúnh?",
			"TÇng 1 Cæ D­¬ng ®éng ë bªn ngoµi Long M«n trÊn cã nhiÒu kim th¹ch, nh­ng bän ¢m NhËt Sø ®éc chiÕm viÖc khai th¸c l­u huúnh, nÕu s­ ®Ö muèn lÊy l­u huúnh, th× ph¶i nghÜ c¸ch ®èi phã víi chóng.",
			}
	else
		strTalk = {
			"Kh«ng nãi ch¾c ®­îc, cã thÓ chØ mÊt vµi canh giê, còng cã thÓ mÊt mÊy ngµy mÊy ®ªm. D­êng nh­ <sex> rÊt nãng lßng muèn gÆp ch­ëng m«n? Ta cã mét c¸ch rót ng¾n thêi gian luyÖn ®¬n, mét khi ®¬n d­îc luyÖn thµnh, ta cã thÓ ®­a ng­êi ®i gÆp ch­ëng m«n ngay. §ång ı kh«ng?",
			"(Tªn nµy thËt ®¸ng ghĞt, d¸m uy hiÕp c¶ ta. Mµ th«i, ng­êi lµm ®¹i sù kh«ng c©u nÖ tiÓu tiÕt.)",
			"LuyÖn ®¬n còng cã nhiÒu bİ kiÕp vËy sao? Cµng ngµy ta cµng thİch thó víi thuËt luyÖn ®¬n nµy ®Êy. Kh«ng biÕt ®ã lµ c¸ch g×?",
			"NÕu muèn t¨ng tèc ®é luyÖn ®¬n, cã thÓ dïng l­u huúnh lµm d­îc dÉn, l­u huúnh tİch tô d­îc khİ, gióp rót ng¾n thêi gian chÕ luyÖn, tiÕc lµ phßng luyÖn ®¬n ®· hÕt mãn nµy.",
			}
	end

	TalkEx("task_006_03_0_2",strTalk);

end

-- Ğø¶Ô»°
function task_006_03_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"ChuyÖn nµy cã g× khã? Cø ®Õn xin mét İt vÒ ®©y lµ ®­îc chø g×.",
			"(TiÓu tö nµy ngèc thËt, nÕu xin ®­îc ta ®· xin tõ l©u, ®©u cÇn ngåi ®©y phİ lêi víi h¾n.)",
			"§óng vËy ®óng vËy, h·y ®i xin mét İt vÒ ®©y, 10 phÇn lµ ®ñ. Nhí ®õng vµo qu¸ s©u trong ®éng, t­¬ng truyÒn Cæ D­¬ng ®éng cã Cæ D­¬ng thó trÊn gi÷, ®i vµo qu¸ s©u sÏ bŞ dŞ thó tÊn c«ng.",
			}
	else
		strTalk = {
			"Ra lµ vËy. Huynh cã thÓ cho ta biÕt ë ®©u cã l­u huúnh, ta sÏ mang vÒ cho huynh.",
			"<sex> thËt tèt bông. TÇng 1 Cæ D­¬ng ®éng ë bªn ngoµi Long M«n trÊn cã nhiÒu kim th¹ch, nh­ng bän ¢m NhËt Sø ®· ®éc chiÕm viÖc khai th¸c l­u huúnh, nÕu muèn cã ®­îc l­u huúnh, cÇn ph¶i t×m c¸ch ®èi phã víi chóng.",
			"Còng ®©u khã, ta cø ®Õn xin mét İt lµ ®­îc chø g×.",
			"(TiÓu tö nµy ngèc thËt, nÕu xin ®­îc ta ®· xin tõ l©u, ®©u cÇn ngåi ®©y phİ lêi víi h¾n.)",
			"§óng vËy ®óng vËy, h·y ®i xin mét İt vÒ ®©y, 10 phÇn lµ ®ñ. Nhí ®õng vµo qu¸ s©u trong ®éng, t­¬ng truyÒn Cæ D­¬ng ®éng cã Cæ D­¬ng thó trÊn gi÷, ®i vµo qu¸ s©u sÏ bŞ dŞ thó tÊn c«ng.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,28);
	CreateTrigger(0,1224,KILL_XB_ANRISHI);--É±¹Ö´¥·¢Æ÷
	TaskTip("§Õn TÇng 1 Cæ D­¬ng ®éng, lÊy 10 l­u huúnh tõ tay ¢m NhËt Sø.");
	Msg2Player("§Õn TÇng 1 Cæ D­¬ng ®éng, lÊy 10 l­u huúnh tõ tay ¢m NhËt Sø.");
	GivePlayerExp(SkeyXibei,"jiazhuangrumen")
end

--´ø»Ø»òÎ´´ø»Ø10·İÁò»Ç
function task_006_04_0()

local strTalk = {};

	--´ø»Ø10·İÁò»Ç
	if GetItemCount(2,0,695) >= 10 then

		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"10 l­u huúnh®· t×m ®ñ ch­a? Bän ¢m NhËt Sø ch¾c kh«ng dÔ ®èi phã h¶?",
				"§· t×m ®ñ råi, ¢m NhËt Sø ®óng lµ kh«ng dÔ ®èi phã. Ch¾c ch¼ng bao l©u ®¬n d­îc sÏ hoµn thµnh ph¶i kh«ng?",
				"(Ha ha, ta cã ®­îc l­u huúnh mµ ch¼ng mÊt chót c«ng søc. ¢m NhËt Sø û ng­êi ®«ng thÕ m¹nh, ®éc chiÕm l­u huúnh, xem ta tiÓu tö nµy còng cã chót b¶n lÜnh, viÖc thu thËp Tiªu th¹ch ch¾c còng giao cho h¾n lu«n vËy.)",
				"§· cã l­u huúnh lµm d­îc dÉn, qu¸ tr×nh luyÖn ®¬n sÏ rót ng¾n ®­îc vµi canh giê, nh­ng nÕu ng­¬i muèn nhanh h¬n n÷a, th× h·y t×m thªm İt Tiªu th¹ch vÒ ®©y.",
				}
		else
			strTalk = {
				"10 l­u huúnh®· t×m ®ñ ch­a? Bän ¢m NhËt Sø ch¾c kh«ng dÔ ®èi phã h¶?",
				"§· t×m ®ñ råi, ¢m NhËt Sø ®óng lµ kh«ng dÔ ®èi phã. Ch¾c ch¼ng bao l©u ®¬n d­îc sÏ hoµn thµnh ph¶i kh«ng?",
				"(Ta cã ®­îc l­u huúnh mµ ch¼ng mÊt chót c«ng søc. ¢m NhËt Sø û ng­êi ®«ng thÕ m¹nh, ®éc chiÕm l­u huúnh, xem ta tiÓu tö nµy còng cã chót b¶n lÜnh, viÖc thu thËp Tiªu th¹ch ch¾c còng giao cho h¾n lu«n vËy.)",
				}
		end

		TalkEx("task_006_04_0_1",strTalk);

	--Ã»ÓĞ´ø»ØÎïÆ·and²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"¢m NhËt Sø ë tÇng 1 Cæ D­¬ng ®éng ®éc chiÕm viÖc khai th¸c l­u huúnh, ng­¬i h·y ®i lÊy 10 phÇn vÒ ®©y, nh­ng nhí ®õng vµo s©u trong ®éng, ®Ó tr¸nh bŞ dŞ thó tÊn c«ng."
				}
		else
			strTalk = {
				"¢m NhËt Sø ë tÇng 1 Cæ D­¬ng ®éng ®éc chiÕm viÖc khai th¸c l­u huúnh, ng­¬i h·y ®i lÊy 10 phÇn vÒ ®©y, nh­ng nhí ®õng vµo s©u trong ®éng, ®Ó tr¸nh bŞ dŞ thó tÊn c«ng."
				}
		end

		if	GetTrigger(KILL_XB_ANRISHI) == 0 then
			CreateTrigger(0,1224,KILL_XB_ANRISHI);
			TaskTip("§Õn TÇng 1 Cæ D­¬ng ®éng, t×m Minh NguyÖt Sø lÊy 10 l­u huúnh.");
			Msg2Player("§Õn TÇng 1 Cæ D­¬ng ®éng, t×m Minh NguyÖt Sø lÊy 10 l­u huúnh.");
		end

		TalkEx("",strTalk);
	end
end

-- Ğø¶Ô»°
function task_006_04_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"ña? Tiªu th¹ch còng cã thÓ lµm d­îc dÉn ®­îc sao?",
			"Tiªu th¹ch tuy kh«ng thÓ lµm d­îc dÉn, nh­ng cã t¸c dông t¨ng háa thÕ. NÕu cho İt Tiªu th¹ch vµo ngän löa, löa sÏ m¹nh h¬n, tèc ®é luyÖn ®¬n còng sÏ ®­îc ®Èy nhanh.",
			"ra vËy. Tiªu th¹ch ph¶i ch¨ng còng ë tÇng 1 Cæ D­¬ng ®éng?",
			"S­ ®Ö thËt th«ng minh. Minh NguyÖt Sø vµ ¢m NhËt Sø ë tÇng 1 Cæ D­¬ng ®éng cÊu kÕt víi nhau, ®éc chiÕm hÕt viÖc khai th¸c kim th¹ch ë ®ã, Minh NguyÖt Sø n¾m gi÷ Tiªu th¹ch, nÕu <sex> ®· cã thÓ lÊy ®­îc l­u huúnh, Tiªu th¹ch ch¾c còng kh«ng thµnh vÊn ®Ò. T­¬ng tù chØ cÇn 10 phÇn lµ ®ñ.",
			}
	else
		strTalk = {
			"§· cã l­u huúnh lµm d­îc dÉn, qu¸ tr×nh luyÖn ®¬n sÏ rót ng¾n ®­îc vµi canh giê, nh­ng nÕu ng­¬i muèn nhanh h¬n n÷a, th× ta còng cã c¸ch. Kh«ng biÕt <sex> muèn tiÕp tôc ®îi, hay lµ nghe ı kiÕn cña ta?",
			"Cßn cã c¸ch nhanh h¬n n÷a ­? §­¬ng nhiªn lµ cµng nhanh cµng tèt råi. Xin cø nãi.",
			"Muèn t¨ng tèc ®é luyÖn ®¬n ngoµi viÖc sö dông d­îc dÉn, cßn cã thÓ t¨ng thªm háa thÕ. Tiªu th¹ch lµ mét trong c¸c lo¹i háa th¹ch, nÕu cho Tiªu th¹ch vµo löa, thÕ löa sÏ m¹nh lªn, viÖc luyÖn ®¬n sÏ nhanh h¬n.",
			"Ra vËy, ch¼ng lÏ Tiªu th¹ch còng ë tÇng 1 Cæ D­¬ng ®éng?",
			}
	end

	TalkEx("task_006_04_0_2",strTalk);

end

-- Ğø¶Ô»°
function task_006_04_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"(Qu¶ nhiªn l¹i ph¶i ®Õn Cæ D­¬ng ®éng, ¢m NhËt Sø ®· khã ®èi phã, e Minh NguyÖt Sø còng kh«ng dÔ xö. Ta nghi ngê h¾n muèn cã kim th¹ch nh­ng l¹i ng¹i ®èi phã bän kia, nªn b¾t ta lµm viÖc cho h¾n. Th«i th× ta cø gi¶ ng©y xem sao.)",
				"TriÖu ®¹i ca qu¶ nhiªn dµy d¹n kinh nghiÖm, ®Ö cßn ph¶i thØnh gi¸o nhiÒu.",
				"Qu¸ khen qu¸ khen. Nhí ®õng vµo s©u trong ®éng.",
				}
		else
			strTalk = {
				"<sex> th«ng minh l¾m. Minh NguyÖt Sø vµ ¢m NhËt Sø ë tÇng 1 Cæ D­¬ng ®éng cÊu kÕt víi nhau, ®éc chiÕm hÕt viÖc khai th¸c kim th¹ch ë ®ã, Minh NguyÖt Sø n¾m gi÷ Tiªu th¹ch, nÕu <sex> ®· cã thÓ lÊy ®­îc l­u huúnh, Tiªu th¹ch ®èi víi <sex> ch¾c còng kh«ng thµnh vÊn ®Ò. T­¬ng tù chØ cÇn 10 phÇn lµ ®ñ.",
				"(Tªn nµy ®­îc n­íc lµm tíi, ¢m NhËt Sø ®· khã ®èi phã, e Minh NguyÖt Sø còng kh«ng dÔ xö. Ta nghi ngê h¾n muèn cã kim th¹ch nh­ng l¹i ng¹i ®èi phã bän kia, nªn b¾t ta lµm viÖc cho h¾n. Th«i th× ta cø gi¶ ng©y xem sao.)",
				"Ta l¹ n­íc l¹ c¸i, ch¼ng biÕt g× c¶, còng may ®· cã TriÖu ®¹i ca h­íng dÉn, ta rÊt biÕt ¬n. TriÖu ®¹i ca dµy d¹n kinh nghiÖm nh­ vËy, sau nµy ta ph¶i thØnh gi¸o nhiÒu.",
				"Qu¸ khen qu¸ khen. Nhí ®õng vµo s©u trong ®éng.",
				}
		end

	TalkEx("",strTalk);
	DelItem(2,0,695,10);
	RemoveTrigger(GetTrigger(KILL_XB_ANRISHI));
	SetTask(TASK_XB_ID,29);
	CreateTrigger(0,1225,KILL_XB_MINGYUESHI);
	TaskTip("§Õn tÇng 1 Cæ D­¬ng ®éng, lÊy 10 Tiªu th¹ch tõ tay Minh NguyÖt Sø.");
	Msg2Player("§Õn tÇng 1 Cæ D­¬ng ®éng, lÊy 10 Tiªu th¹ch tõ tay Minh NguyÖt Sø.");
	GivePlayerAward("Award_XB_12","Easy");
	GivePlayerExp(SkeyXibei,"anrishi")
end

--´ø»Ø»òÎ´´ø»Ø10·İÏõÊ¯
function task_006_05_0()

local strTalk = {};

	--´ø»Ø10·İÏõÊ¯
	if GetItemCount(2,0,696) >= 10 then

		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"§©y lµ 10 Tiªu th¹ch, TriÖu s­ huynh cßn dÆn dß g× kh«ng?",
				"(Qu¶ nhiªn l¹i thµnh c«ng råi. §îi ta ®em l­u huúnh vµ Tiªu th¹ch chÕ luyÖn thªm, l¹i cã ®­îc nhiÒu ®¬n d­îc. Hõ, ¢m NhËt Sø vµ Minh NguyÖt Sø giµnh hÕt kim th¹ch cña ta, khiÕn ta kh«ng thÓ luyÖn Ngò Th¹ch t¸n ®em b¸n, ch¼ng kh¸c nµo chÆt ®øt nguån lîi cña ta. TiÓu tö nµy khê kh¹o, b¶o g× lµm nÊy, sau nµy cã thÓ sai b¶o ®­îc ®©y.)",
				"BÊy nhiªu lµ ®ñ råi, cã thÓ rót ng¾n ®­îc nhiÒu canh giê l¾m. Ch¼ng ph¶i ng­¬i cã th¾c m¾c g× sao? Hái ®i.",
				"TriÖu s­ huynh ®­îc giao canh gi÷ phßng luyÖn ®¬n, qu¶ nhiªn tinh th«ng ®¬n thuËt, kh«ng biÕt ph¸i ta cã nh÷ng ®¬n d­îc g× cã c«ng hiÖu kĞo dµi tuæi thä hay kh«ng?",
				"§­¬ng… ®­¬ng nhiªn lµ cã, hiÖn s­ phô ®ang cÇn chÕ luyÖn Hµnh V©n ®¬n, cÇn luyÖn 12 canh giê míi xong, nh­ng hiÖn nay ®· cã l­u huúnh lµm d­îc dÉn, cã Tiªu th¹ch t¨ng háa thÕ, h¬n 4 canh giê n÷a lµ hoµn thµnh råi. õm... ®¬n nµy còng cã c«ng hiÖu kĞo dµi tuæi thä ®ã.",
				}
		else
			strTalk = {
				"§©y lµ 10 Tiªu th¹ch, TriÖu ®¹i ca cßn dÆn dß g× kh«ng?",
				"(Qu¶ nhiªn l¹i thµnh c«ng råi. §îi ta ®em l­u huúnh vµ Tiªu th¹ch chÕ luyÖn thªm, l¹i cã ®­îc nhiÒu ®¬n d­îc. Hõ, ¢m NhËt Sø vµ Minh NguyÖt Sø giµnh hÕt kim th¹ch cña ta, khiÕn ta kh«ng thÓ luyÖn Ngò Th¹ch t¸n ®em b¸n, ch¼ng kh¸c nµo chÆt ®øt nguån lîi cña ta. TiÓu tö nµy khê kh¹o, b¶o g× lµm nÊy, mai nµy gia nhËp m«n ph¸i, ta l¹i cã thªm mét tay sai ®¾c lùc råi.)",
				"BÊy nhiªu lµ ®ñ råi, cã thÓ rót ng¾n ®­îc nhiÒu canh giê l¾m. Sau khi ®¬n d­îc hoµn thµnh, ta sÏ ®­a ng­¬i ®Õn gÆp ch­ëng m«n, kh«ng quªn nãi tèt cho ng­¬i mÊy lêi.",
				"Ta cã thÓ nhËp m«n råi sao? Tõ l©u ta ®· ng­ìng mé thuËt luyÖn ®¬n cña C«n L«n, d­êng nh­ TriÖu ®¹i ca rÊt cã kinh nghiÖm, sau nµy nhËp m«n, nhÊt ®Şnh ta sÏ cßn tíi thØnh gi¸o.",
				"ThuËt luyÖn ®¬n cña C«n L«n ph¸i næi tiÕng kh¾p thiªn h¹, vâ c«ng hµng yªu phôc ma l¹i cµng cao siªu h¬n, <sex> gia nhËp C«n L«n, ®ã lµ c¸i phóc cña b¸ t¸nh.",
				}
		end

		TalkEx("task_006_05_0_1",strTalk);


	--Ã»ÓĞ´ø»ØÎïÆ·and²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Minh NguyÖt Sø ë tÇng 1 Cæ D­¬ng ®éng®éc chiÕm viÖc khai th¸c Tiªu th¹ch, ng­¬i h·y cè g¾ng lÊy ®­îc 10 phÇn, nhí lµ ®õng vµo qu¸ s©u, ®Ò phßng dŞ thó tÊn c«ng."
				}
		else
			strTalk = {
				"Minh NguyÖt Sø ë tÇng 1 Cæ D­¬ng ®éng®éc chiÕm viÖc khai th¸c Tiªu th¹ch, ng­¬i h·y cè g¾ng lÊy ®­îc 10 phÇn, nhí lµ ®õng vµo qu¸ s©u, ®Ò phßng dŞ thó tÊn c«ng."
				}
		end

		if	GetTrigger(KILL_XB_MINGYUESHI) == 0 then
			CreateTrigger(0,1225,KILL_XB_MINGYUESHI);
			TaskTip("§Õn tÇng 1 Cæ D­¬ng ®éng, lÊy 10 Tiªu th¹ch tõ tay Minh NguyÖt Sø.");
			Msg2Player("§Õn tÇng 1 Cæ D­¬ng ®éng, lÊy 10 Tiªu th¹ch tõ tay Minh NguyÖt Sø.");
		end

		TalkEx("",strTalk);
	end
end

--Ğø¶Ô»°
function task_006_05_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"(§¸ng ghĞt, s­ phô chØ truyÒn c¸ch luyÖn ®¬n cho DiÖp Tö Thu, cßn ta thİch luyÖn ®¬n nh­ vËy th× chØ ®­îc ch­ëng qu¶n lß luyÖn ®¬n, s­ phô qu¸ kiªng dÌ ta, kh«ng biÕt cã thÓ qua mÆt ®­îc tªn tiÓu tö nµy kh«ng.)",
			"å, kü thuËt cña ph¸i ta ®óng lµ xuÊt thÇn nhËp hãa, kh«ng biÕt s­ huynh cã biÕt c¸ch luyÖn ®¬n kh«ng?",
			"Sao? C¸i nµy… tr­íc tiªn dïng l­u huúnh lµm d­îc dÉn, sau ®ã… sau ®ã cho thªm c¸c th¶o d­îc quı nh­ nh©n s©m, hµ thñ «, quan träng lµ ph¶i khèng chÕ háa hÇu, mét khi luyÖn thµnh, kh«ng nh÷ng cã c«ng hiÖu kĞo dµi tuæi thä, nÕu dïng l©u cßn cã thÓ tr­êng sinh bÊt l·o.",
			"(C¶ tr­êng sinh bÊt l·o còng d¸m phŞa ra, ch¾c ch¾n lµ nãi dèi råi. Tr­íc ®©y ta tõng nghe nãi, dïng l­u huúnh Tiªu th¹ch lµm thuèc lµ c¸ch chÕ Ngò Th¹ch t¸n l­u truyÒn tõ thêi nhµ §­êng, ¨n vµo kh«ng tróng ®éc chÕt lµ may l¾m råi, cßn muèn lõa ta sao! Mµ khoan, mÆc kÖ nã thËt hay gi¶, ta chØ cÇn chuyÓn lêi ®Õn Xa Lu©n B¸ V­¬ng, th× coi nh­ hoµn thµnh nhiÖm vô cßn g×?)",
			}
	else
		strTalk = {
			"Kh«ng biÕt TriÖu ®¹i ca ®ang luyÖn lo¹i ®¬n g×? C«n L«n ph¸i cã ®¬n d­îc nµo gióp kĞo dµi tuæi thä kh«ng?",
			"µ, ®©y lµ Hµnh V©n ®¬n mµ s­ phô dÆn ta luyÖn chÕ, cÇn 12 canh giê míi xong, nh­ng giê cã thªm l­u huúnh lµm d­îc dÉn, l¹i cã Tiªu th¹ch trî háa, kho¶ng 4 canh giê n÷a lµ hoµn thµnh. õm... thuèc nµy còng cã c«ng hiÖu kĞo dµi tuæi thä.",
			"(§¸ng ghĞt, s­ phô chØ truyÒn c¸ch luyÖn ®¬n cho DiÖp Tö Thu, cßn ta thİch luyÖn ®¬n nh­ vËy th× chØ ®­îc ch­ëng qu¶n lß luyÖn ®¬n, s­ phô qu¸ kiªng dÌ ta, kh«ng biÕt cã thÓ qua mÆt ®­îc tªn tiÓu tö nµy kh«ng.) ",
			"Víi thÇn ®¬n nµy, khi chÕ luyÖn cã bİ kiÕp nµo kh«ng?",
			"Sao? C¸i nµy… tr­íc tiªn dïng l­u huúnh lµm d­îc dÉn, sau ®ã… sau ®ã cho thªm c¸c th¶o d­îc quı nh­ nh©n s©m, hµ thñ «, quan träng lµ ph¶i khèng chÕ háa hÇu, mét khi luyÖn thµnh, kh«ng nh÷ng cã c«ng hiÖu kĞo dµi tuæi thä, nÕu dïng l©u cßn cã thÓ tr­êng sinh bÊt l·o.",
			}
	end

	TalkEx("task_006_05_0_2",strTalk)

end

--Ğø¶Ô»°
function task_006_05_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"TriÖu s­ huynh qu¶ nhiªn tinh th«ng ®¬n thuËt, mong s­ huynh chØ b¶o thªm.",
			"S­ ®Ö kh¸ch s¸o qu¸, ta cßn ph¶i trë vÒ phßng luyÖn ®¬n, sau nµy cã vÊn ®Ò g× cø ®Õn t×m ta, ta sÏ gióp cho.? (Tªn nµy thËt ngèc, ta nãi vËy mµ h¾n còng tin.)",
			"§­îc, ®Ö xin c¸o tõ.",
			"(TriÖu s­ huynh nµy d­êng nh­ chØ hiÓu biÕt s¬ vÒ thuËt luyÖn ®¬n, khi gÆp Xa Lu©n B¸ V­¬ng  ta ph¶i nãi khoa tr­¬ng mét chót míi ®­îc.)",
			}
	else
		strTalk = {
			"(C¶ tr­êng sinh bÊt l·o còng d¸m phŞa ra, ch¾c ch¾n lµ nãi dèi råi. Tr­íc ®©y ta tõng nghe nãi, dïng l­u huúnh Tiªu th¹ch lµm thuèc lµ c¸ch chÕ Ngò Th¹ch t¸n l­u truyÒn tõ thêi nhµ §­êng, ¨n vµo kh«ng tróng ®éc chÕt lµ may l¾m råi, cßn muèn lõa ta sao! Mµ khoan, mÆc kÖ nã thËt hay gi¶, ta chØ cÇn chuyÓn lêi ®Õn Xa Lu©n B¸ V­¬ng, th× coi nh­ hoµn thµnh nhiÖm vô cßn g×?)",
			"(ThuËt luyÖn ®¬n cña C«n L«n ph¸i ®óng lµ xuÊt quû nhËp thÇn, danh bÊt h­ truyÒn!",
			"§­¬ng nhiªn råi. Ng­¬i mau chuÈn bŞ ®i, mÊy canh giê n÷a, khi ®¬n d­îc luyÖn thµnh, chóng ta sÏ tíi gÆp ch­ëng m«n.",
			"§­îc. ¥n cña TriÖu ®¹i ca, mai nµy ta nhÊt ®Şnh sÏ b¸o ®¸p.",
			"(B©y giê chİnh lµ thêi c¬ tèt nhÊt ®Ó ta chuån ®©y. Khi ®Õn chç Xa Lu©n B¸ V­¬ng, ta ph¶i khoa tr­¬ng vÒ thuËt luyÖn Tr­êng sinh bÊt tö ®¬n víi h¾n míi ®­îc.)",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,696,10);
	RemoveTrigger(GetTrigger(KILL_XB_MINGYUESHI));
	SetTask(TASK_XB_ID,30);
	TaskTip("§Õn b¸o víi Xa Lu©n B¸ V­¬ng vÒ Tr­êng sinh bÊt tö ®¬n.");
	Msg2Player("§Õn b¸o víi Xa Lu©n B¸ V­¬ng vÒ Tr­êng sinh bÊt tö ®¬n.");
	GivePlayerAward("Award_XB_13","Easy");
	GivePlayerExp(SkeyXibei,"mingyueshi")
end



--»¹Ã»ºÍ³µÂÖ°ÔÍõ¶Ô»°
function task_006_05_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i h·y ®îi thªm 1 l¸t, khi ®¬n d­îc luyÖn thµnh, ta sÏ cïng ng­¬i ®Õn gÆp ch­ëng m«n.",
			"(B©y giê chİnh lµ thêi c¬ tèt nhÊt ®Ó ta chuån ®©y. Khi ®Õn chç Xa Lu©n B¸ V­¬ng, ta ph¶i khoa tr­¬ng vÒ thuËt luyÖn Tr­êng sinh bÊt tö ®¬n víi h¾n míi ®­îc.)",
			}
	else
		strTalk = {
			"Sau nµy s­ ®Ö cã vÊn ®Ò g× cø ®Õn t×m ta, ta sÏ gióp cho.",
			"(TriÖu s­ huynh nµy d­êng nh­ chØ hiÓu biÕt s¬ vÒ thuËt luyÖn ®¬n, khi gÆp Xa Lu©n B¸ V­¬ng  ta ph¶i nãi khoa tr­¬ng mét chót míi ®­îc.)",
			}
	end

	TalkEx("",strTalk);

end

--Óë³µÂÖ°ÔÍõ¶Ô»°Íê³ÉµÚ¶ş¸ö¿¼Ñé
function task_006_06_0()

local strTalk = {
	"Sao råi? LÇn ®i C«n L«n ph¸i nµy cã thu ho¹ch g× kh«ng?",
	"Trêi kh«ng phô lßng ng­êi, sau nhiÒu n¨m Èn m×nh t¹i phßng luyÖn ®¬n cña C«n L«n ph¸i, ta ®· biÕt ®­îc bİ ph­¬ng vµ nguyªn liÖu ®Ó luyÖn Tr­êng sinh bÊt tö ®¬n.",
	"Ha ha, cã thÓ tù do ra vµo phßng luyÖn ®¬n cña C«n L«n ph¸i, <sex> qu¶ nhiªn th©n thñ bÊt phµm! Ng­¬i ®· t×m ra bİ mËt g×?",
	"(ChuyÖn vÒ phßng luyÖn ®¬n cña C«n L«n qu¶ nhiªn thu hót ®­îc sù chó ı cña h¾n, ta ph¶i ®em lêi nãi cña TriÖu Tö B×nh phãng ®¹i, thªu dÖt thªm míi ®­îc.)",
	"Tr­êng sinh bÊt tö ®¬n cã nguyªn liÖu chİnh lµ Ngò kim, b¸t th¹ch, Tam hoµng, kÕt hîp víi c¸c th¶o d­îc quı nh­ Nh©n s©m ngµn n¨m, hµ thñ «, dïng Kim th¹ch ®­îc Cæ D­¬ng thó trÊn gi÷ trong Cæ D­¬ng ®éng lµm d­îc dÉn, dïng chiÕc Th¸i Thanh cæ ®Ønh t¹i ®Ønh nói C«n L«n, ®· hÊp thô tinh hoa trêi ®Êt lµm chiÕc ®Ønh luyÖn ®¬n, nung b»ng ngän löa thuÇn d­¬ng, hãa gi¶i khİ ngµn n¨m trong suèt 7 ngµy, tËp hîp S¬n tr¹ch chi b¶o, 49 ngµy míi thµnh c«ng.",
	}

	TalkEx("task_006_06_0_1",strTalk);

end

--Ğø¶Ô»°
function task_006_06_0_1()

local strTalk = {
	"ThuËt luyÖn ®¬n cña C«n L«n qu¶ nhiªn cao th©m. §ån r»ng Cæ D­¬ng thó trong Cæ D­¬ng ®éng trÊn gi÷ dŞ b¶o, ch¼ng lÏ chuyÖn cã thËt sao?",
	"§óng vËy, ta tõng ®Õn Cæ D­¬ng ®éng xem xĞt, nh÷ng n¬i cã Cæ D­¬ng thó lai v·ng, ®Òu cã l­u quang, ¾t cã dŞ b¶o. Cßn n÷a, khi luyÖn ®¬n cÇn ph¶i lªn ®Ønh nói C«n L«n n¬i tô hîp linh khİ, dïng Th¸i Thanh ®Ønh chÕ luyÖn ®óng 49 ngµy, cã tiªn duyªn th× sÏ luyÖn thµnh. Mét khi ®· luyÖn thµnh c«ng, dïng ®¬n nµy sÏ thä nh­ Kim ngäc, bÊt l·o bÊt tö.",
	"Hãa ra n¬i luyÖn ®¬n kh«ng ph¶i ë C«n L«n, ch¶ tr¸ch V­¬ng téc T©y H¹ nhiÒu lÇn ®Õn ®Êy cÇu thuËt ®Òu tay tr¾ng trë vÒ. Tèt l¾m, Ha ha, t×nh b¸o cña ng­¬i rÊt cã gi¸ trŞ, ta sÏ bÈm b¸o l¹i víi V­¬ng téc T©y H¹. LÇn thö th¸ch thø 2 nµy coi nh­ ng­¬i th«ng qua råi. Kh«ng ngê n¨ng lùc t×nh b¸o cña ng­¬i l¹i xuÊt s¾c nh­ vËy, NhÊt PhÈm §­êng rÊt thİch nh÷ng nh©n tµi nh­ thÕ. Ng­¬i h·y nghØ ng¬i ®i, ®îi sau khi hoµn thµnh thö th¸ch cuèi cïng, ng­¬i sÏ ®­îc xÕp vµo hµng ngò cña NhÊt PhÈm §­êng.",
	"(Cuèi cïng còng giµnh ®­îc lßng tin cña h¾n. Ha ha, ®îi khi V­¬ng téc T©y H¹ cña c¸c ng­êi t×m thÊy Th¸i Thanh ®Ønh ë nói C«n L«n réng lín, ch¾c h¼n NhÊt PhÈm §­êng ®· bŞ san thµnh b×nh ®Şa råi.)",
	"Ch¾c ch¾n råi, ta chØ mong cã chç yªn th©n th«i.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,31);
	TaskTip("Sau khi nghØ ng¬i Xa Lu©n B¸ V­¬ng sÏ giao nhiÖm vô thö th¸ch cuèi cïng ®Ó ®­îc nhËn vµo NhÊt PhÈm §­êng.");
	Msg2Player("Sau khi nghØ ng¬i Xa Lu©n B¸ V­¬ng sÏ giao nhiÖm vô thö th¸ch cuèi cïng ®Ó ®­îc nhËn vµo NhÊt PhÈm §­êng.");
	GivePlayerAward("Award_XB_14","Easy");
	GivePlayerExp(SkeyXibei,"busidan")
end

---------------------------------- Î÷±±Çø07ÄĞ¶ùï£¹Ç----------------------------------
--ÁìÈ¡Ò»Æ·ÌÃµÚÈı¸ö¿¼Ñé
function task_007_01_0()

local strTalk = {
	"ViÖc gi¶i tho¸t S¸t thñ Oa Oa ng­¬i ®· lµm rÊt tèt, th¨m dß thuËt luyÖn ®¬n cña C«n L«n còng rÊt xuÊt s¾c, ch­a nhËp §­êng mµ ®· lËp ®­îc 2 c«ng tr¹ng, NhÊt PhÈm §­êng cã ®­îc nh©n tµi nh­ ng­¬i, cßn sî §¹i Tèng hay sao? Nh­ng NhÊt PhÈm §­êng x­a nay chØ nhËn ng­êi tµi, vµ lu«n tu©n thñ quy t¾c ®µo nh­îc l­u c­êng.",
	"§µo nh­îc l­u c­êng lµ sao?",
	"HiÖn nay cã rÊt nhiÒu hµo kiÖt vâ l©m muèn ®Õn víi NhÊt PhÈm §­êng, ®­¬ng nhiªn NhÊt PhÈm §­êng ta còng ph¶i chän lùc kü cµng. Nay cã mét ®µo ph¹m cña §¹i Tèng lµ Di Tu ®¹i h¸n còng ®ang nhËn thö th¸ch nhËp §­êng, ®· ®­îc ph¸i ®Õn Quang Minh ®Ønh ®iÒu tra ®éng tÜnh cña Minh gi¸o. Ng­¬i vµ h¾n, bän ta chØ chän lÊy 1, trong c¸c ng­¬i ch¾c ch¾n ph¶i cã mét ng­êi bá m¹ng.",
	"Sao l¹i ph¶i cã mét ng­êi bá m¹ng? Ta vµ h¾n kh«ng thÓ cïng nhau gia nhËp NhÊt PhÈm §­êng sao?",
	}

	TalkEx("task_007_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_007_01_0_1()

local strTalk = {
	"Nùc c­êi, NhÊt PhÈm §­êng ®©u ph¶i lµ n¬i tŞ n¹n, ng­êi ®«ng th× cã İch g× chø? Gi÷a ng­¬i vµ h¾n ph¶i tranh nhau danh hiÖu §Çu Danh Tr¹ng, nÕu ng­¬i kh«ng giÕt h¾n, th× ®µnh ngåi ®îi h¾n tíi giÕt ng­¬i. NhÊt PhÈm §­êng x­a nay kh«ng chµo ®ãn kÎ b¹c nh­îc, nÕu h¾n kh«ng b»ng ng­¬i th× gi÷ l¹i lµm g×? Ng­îc l¹i, víi ng­¬i còng vËy.",
	"Ra cã mét ng­êi ph¶i bá m¹ng lµ chØ cuéc tµn s¸t gi÷a ta vµ h¾n, ph­¬ng ph¸p ®µo nh­îc l­u c­êng nµy qu¶ cao minh, nh­ng còng qu¸ tµn nhÉn. Ta hiÓu råi, «ng cø ®îi tin cña ta.",
	"Ha ha, tèt, <sex> qu¶ nhiªn s¶ng kho¸i, ®©y sÏ lµ thö th¸ch cuèi cïng cña ng­¬i, NhÊt PhÈm §­êng ®ang réng cöa chê ®ãn ng­¬i ®ã.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,32);
	TaskTip("Di Tu ®¹i h¸n ®ang ë Quang Minh ®Ønh, h·y ®Õn ®ã ®¸nh b¹i h¾n ®Ó cã c¸ch gia nhËp NhÊt PhÈm §­êng.");
	Msg2Player("Di Tu ®¹i h¸n ®ang ë Quang Minh ®Ønh, h·y ®Õn ®ã ®¸nh b¹i h¾n ®Ó cã c¸ch gia nhËp NhÊt PhÈm §­êng.");
end

--Î´´ò°Üò°Ğë´óºº¶Ô»°
function task_007_01_1()

local strTalk = {
	"Cï Tï ®¹i h¸n hiÖn ®ang ë Quang Minh ®Ønh ®iÒu tra chuyÖn Minh gi¸o, h·y ®em thñ cÊp cña h¾n ®Õn gÆp ta, ng­¬i sÏ lµ thµnh viªn cña NhÊt PhÈm §­êng.",
	}

	TalkEx("",strTalk);

end

--Íê³ÉµÚÈı¸ö¿¼Ñé£¬Óë³µÂÖ¶Ô»°¼ÓÈëÒ»Æ·ÌÃ
function task_007_02_0()

local strTalk = {
	"Di Tu ®¹i h¸n ®· bŞ diÖt, ®©y lµ thñ cÊp cña h¾n, ta cã thÓ gia nhËp NhÊt PhÈm §­êng råi chø?",
	"Ha ha, th¾ng råi µ? <sex> qu¶ nhiªn n¨ng lùc siªu phµm. Ba thö th¸ch ®· qua, kh«ng ngê tuæi trÎ mµ tµi cao ®Õn vËy.? (NhÊt PhÈm §­êng hoan nghªnh sù gia nhËp cña ng­¬i, giê ng­¬i lµ thİch kh¸ch cña NhÊt PhÈm §­êng. NhÊt PhÈm §­êng tæ chøc nghiªm minh, vµ cÇn ph¶i thËt cÈn träng khi hµnh sù. Ng­êi trong NhÊt phÈm ®§­êng gÆp ¸m hiÖu nµy, ¾t sÏ tíi gióp ®ì.)",
	"Ta nguyÖn cèng hiÕn hÕt søc m×nh.",
	"Ng­¬i bŞ Lôc PhiÕn M«n truy n· ®· l©u, nh­ng chØ mét Lôc PhiÕn M«n cán con vÉn ch­a xøng lµ ®èi thñ cña bän ta, sau nµy ng­¬i cø yªn t©m, gia nhËp NhÊt PhÈm §­êng råi th× Lôc PhiÕn M«n sÏ kh«ng thÓ lµm phiÒn ng­¬i n÷a. ChØ cÇn ng­¬i tËn trung víi NhÊt PhÈm §­êng, mai nµy phó quı danh lîi ®Òu trong tÇm tay. H·y nghØ ng¬i ®·, cã nhiÖm vô míi ta sÏ t×m ng­¬i.",
	"§­îc. Xin c¸o tõ.",
	"(MÊt kh«ng İt c«ng søc míi vµo ®­îc NhÊt PhÈm §­êng, ta ph¶i b¸o l¹i víi ¢u D­¬ng tiÒn bèi míi ®­îc. Kh«ng biÕt th­¬ng tİch cña Viªn Bé kho¸i thÕ nµo råi, ta còng lo qu¸, hay lµ ®Õn nha m«n tr­íc vËy.)",
	}

	DelItem(2,0,697,1);--É¾È¥ò°Ğë´óººÈËÍ·
	SetTask(TASK_XB_ID,34);
	TalkEx("",strTalk);
	TaskTip("§Õn nha m«n phñ Phông T­êng hái th¨m th­¬ng tİch cña Viªn Bé kho¸i.");
	Msg2Player("§Õn nha m«n phñ Phông T­êng hái th¨m th­¬ng tİch cña Viªn Bé kho¸i.");
	GivePlayerAward("Award_XB_15","Easy");
	GivePlayerExp(SkeyXibei,"disanjianshi")
	add_xb_title(2);--»ñµÃÒ»Æ·ÌÃ´Ì¿Í³ÆºÅ
end

--Î´Óë·ïÏè²¶Í·¶Ô»°
function task_007_02_1()

local strTalk = {
	"Ng­¬i ®· lµ thµnh viªn cña bæn §­êng, h·y lui xuèng nghØ ng¬i, l¸t sau sÏ cã nhiÖm vô míi.",
	"(Kh«ng biÕt th­¬ng tİch cña Viªn Bé kho¸i thÕ nµo råi, ta thËt lo qu¸, hay lµ cø ®Õn nha m«n mét chuyÕn.)",
	}

	TalkEx("",strTalk);

end

--Óë·ïÏè²¶Í·¶Ô»°Ñ¯ÎÊÔ¬·ÉÔÆÈ¥Ïò
function task_007_03_0()

local strTalk = {
	"VŞ bé ®Çu nµy cã quen biÕt Viªn Phi V©n Viªn Bé kho¸i kh«ng?",
	"Viªn Bé kho¸i lµ trô cét cña phñ nha nµy, bé ®Çu nha dŞch nh­ bän ta ®Òu rÊt kİnh träng ng­êi, sao l¹i kh«ng biÕt danh Viªn Bé kho¸i chø? <sex> ®Õn t×m cã viÖc g× kh«ng?",
	"Ta cã duyªn kÕt giao víi Viªn bé ®Çu, ®­îc biÕt gÇn ®©y huynh Êy bŞ th­¬ng, ta rÊt lo, kh«ng biÕt hiÖn giê huynh Êy ®ang ë ®©u?",
	"Viªn Bé kho¸i th«ng minh, tµi trİ, x­a nay hµnh sù ®Òu rÊt cÈn träng qu¶ ®o¸n, kh«ng hiÓu sao lÇn nµy l¹i s¬ ı ®Ó ph¹m nh©n ch¹y tho¸t, b¶n th©n cßn bŞ th­¬ng. Nha m«n vèn lµ n¬i thŞ phi, nhiÒu kÎ tiÓu nh©n vèn kh«ng phôc Viªn Bé kho¸i ®· ®æ dÇu vµo löa, t©u víi triÒu ®×nh vÒ sù thÊt tr¸ch cña ng­êi, khiÕn uy danh cña Viªn Bé kho¸i gi¶m sót h¼n.",
	}

	TalkEx("task_007_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_007_03_0_1()

local nMapName,nXpos,nYpos = SelectMapData(3);
local nTriggerID = Map_Data[GetTask(YUANFEIYUN_MAP_DATA_ID)][7];
local strTalk = {
	"Kh«ng ngê sù viÖc l¹i lµm khã Viªn Bé kho¸i ®Õn vËy.",
	"(Còng t¹i ta, ®· lµm liªn lôy Viªn Bé kho¸i, cßn ®Ó huynh Êy chŞu téi thÊt tr¸ch. Viªn Bé kho¸i vµ ta bÌo n­íc t­¬ng phïng, nh­ng l¹i ch©n thµnh gióp ®ì ta, kh«ng tİnh to¸n thiÖt h¬n, ®óng lµ mét ng­êi tèt hiÕm cã.)",
	"§óng vËy, bän ta còng t­ëng Viªn Bé kho¸i sÏ an t©m tŞnh d­ìng mét thêi gian, kh«ng ngê chØ vµi ngµy sau, ng­êi ®· lªn ®­êng ®Õn "..nMapName.."("..nXpos..", "..nYpos..") b¾t téi ph¹m, nha m«n trªn d­íi ®Òu tù hµo vÒ ng­êi. NÕu <sex> ®Şnh ®i t×m Viªn Bé kho¸i, phiÒn ®­a gióp chai Lôc PhiÕn M«n th­¬ng d­îc nµy cho ng­êi, bän ta ®Òu rÊt lo l¾ng cho th­¬ng tİch cña Viªn Bé kho¸i.",
	"§õng kh¸ch s¸o, ta nhÊt ®Şnh sÏ ®­a thuèc nµy ®Õn tay Viªn V©n Phi. C¸o tõ.",
	}

	TalkEx("",strTalk);
	AddItem(2,0,749,1,1);--µÃµ½ÁùÉÈÃÅÉËÒ©
	SetTask(TASK_XB_ID,35);
	CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);--µØÍ¼´¥·¢Æ÷
	TaskTip("§Õn "..nMapName.."("..nXpos..", "..nYpos..") ®­a thuèc cña Lôc PhiÕn M«n cho Viªn V©n Phi.");
	Msg2Player("§Õn "..nMapName.."("..nXpos..", "..nYpos..") ®­a thuèc cña Lôc PhiÕn M«n cho Viªn V©n Phi.");

end

--ÉĞÎ´ÓëÔ¬·ÉÔÆ¶Ô»°£¨²¹·¢´¥·¢Æ÷£©
function task_007_03_1()

local nMapDataID = GetTask(YUANFEIYUN_MAP_DATA_ID);
local nMapName = Map_Data[nMapDataID][1];
local nXpos,nYpos = Map_Data[nMapDataID][5],Map_Data[nMapDataID][6];
local nTriggerID = Map_Data[nMapDataID][7];
local strTalk = {
	"Viªn Bé kho¸i ®· tíi "..nMapName.."("..nXpos..", "..nYpos..") lµm viÖc, nÕu ng­¬i ®i t×m ng­êi. Xin ®em Lôc PhiÕn M«n th­¬ng d­îc nµy theo, ®©y lµ tÊm lßng cña c¸c huynh ®Ö trong nha m«n.",
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,749) < 1 then
		AddItem(2,0,749,1,1);--µÃµ½ÁùÉÈÃÅÉËÒ©
	end

	if GetTrigger(RECT_XB_YUANFEIYUN) == 0 then
		CreateTrigger(2,nTriggerID,RECT_XB_YUANFEIYUN);
		TaskTip("§Õn "..nMapName.."("..nXpos..", "..nYpos..") ®­a thuèc cña Lôc PhiÕn M«n cho Viªn V©n Phi.");
		Msg2Player("§Õn "..nMapName.."("..nXpos..", "..nYpos..") ®­a thuèc cña Lôc PhiÕn M«n cho Viªn V©n Phi.");
	end

end

--ÓëÔ¬·ÉÔÆ¶Ô»°ËÍÓëÉËÒ©
function task_007_07_0()

local strTalk = {
	"§Õn nha m«n ®­îc biÕt Viªn Bé kho¸i th­¬ng tİch ch­a lµnh, ®· b«n ba c«ng viÖc, trong lßng rÊt lo l¾ng, nªn ®Õn th¨m, c¸c bé ®Çu trong nha m«n còng nhê ta mang thuèc trŞ th­¬ng cho ng­êi. Viªn Bé kho¸i hÕt lßng gióp ®ì, nh­ng ta l¹i lµm liªn lôy ®Õn ng­êi, thËt ¸y n¸y.",
	"<sex> cßn nhí ta tõng b¶o, mong ®­îc cïng nhau uèng r­îu t©m sù? Kh«ng tiÕc b»ng h÷u ®µn ca, chØ tiÕc tri ©m İt ái, sinh tö lµ chuyÖn nhá, chØ ®au v× tri kû khã cÇu. Huynh vµ ta bÌo n­íc t­¬ng phïng, nh­ng l¹i th©n thiÕt nh­ cè nh©n. Gióp ®ì b»ng h÷u lµ niÒm vui cña ta, huynh kh«ng cÇn ¸y n¸y lµm g×.",
	"Nh­ng chung quy ta vÉn khiÕn huynh bŞ träng th­¬ng, cßn ph¶i chŞu oan øc. Viªn huynh ®èi xö víi ta ch©n thµnh, nh­ng ta ch­a h¼n ®· b¸o ®¸p ®­îc tÊm lßng, ta thÊy rÊt khã xö.",
	"VÕt th­¬ng vÆt nµy cã ®¸ng g×. Nam nhi ®Õn chÕt tim vÉn nh­ s¾t ®¸, ung dung th¶n nhiªn, chót th­¬ng tİch cã lµ g×. H¬n n÷a chuyÖn n­íc nhµ, tr­íc nay chØ ph©n biÖt ®¸ng lµm vµ kh«ng ®¸ng lµm, nµo cã ph©n thËt gi¶ ®óng sai? Ta chØ lµm nh÷ng viÖc ta cho lµ xøng ®¸ng, vµ dèc hÕt søc v× nã. Lêi nãi dÌm pha bãng giã, Êy lµ hµnh ®éng cña tiÓu nh©n, ®õng nªn bËn t©m. Huynh còng ®õng nªn ®Ó bông, ng­êi lµm ®¹i sù kh«ng c©u nÖ tiÓu tiÕt.",
	"Viªn Bé kho¸i tÊm lßng bao dung réng më, thËt khiÕn ng­êi ta kh©m phôc, ch¶ tr¸ch Viªn Bé kho¸i l¹i ®­îc giang hå t«n träng ®Õn vËy. Mong r»ng sù viÖc kh«ng g©y ¶nh h­ëng lín ®Õn danh tiÕng cña ng­êi.",
	}

	TalkEx("task_007_07_0_1",strTalk);

end

--Ğø¶Ô»°
function task_007_07_0_1()

local strTalk = {
	"Sao <sex> l¹i nãi vËy? Hai ta ®Òu lo l¾ng cho vËn mÖnh n­íc nhµ, <sex> v× cøu b¸ t¸nh mµ cam t©m dÊn th©n vµo long ®µm huyÖt hæ, bá ngoµi tai nh÷ng lêi m¾ng nhiÕc ph¶n quèc nghŞch thÇn. Xin ®õng qu¸ bËn t©m vÒ viÖc nµy.",
	"N¨m x­a ta còng tõng lµm néi gi¸n cho phñ nha, biÕt râ lµm néi gi¸n nÕu kh«ng cã dòng khİ vµ ı chİ kiªn ®Şnh th× kh«ng thÓ duy tr× ®Õn phót cuèi. Kh«ng nh÷ng ph¶i tù nh¾c nhë kh¼ng ®Şnh lËp tr­êng cña m×nh, cßn ph¶i réng l­îng bÊt chÊp nh÷ng lêi dÌm pha, cµng ph¶i ®èi mÆt víi nhiÒu quyÕt ®Şnh khİ kh¨n, tiÕn tho¸i l­ìng nan. <sex> cÇn hÕt søc thËn träng, n¾m ®iÓm yÕu ®Ó dÔ dµng ®èi phã víi kÎ thï.",
	"Ngay tõ ®Çu ta ®· nhËn thøc gi¸n ®iÖp lµ mét thö th¸ch rÊt lín. Tuy còng lo søc ta kh«ng ®ñ g¸nh v¸c, nh­ng sau khi nghe lêi t©m sù cña Viªn Bé kho¸i, ta quyÕt dèc hÕt søc m×nh, ®Ó kh«ng thÑn víi lßng. §a t¹ nh÷ng lêi vµng ngäc cña Viªn Bé kho¸i, ta xin kh¾c ghi trong lßng.",
	"VËy lµ tèt råi, ta tin t­ëng nhËn xĞt cña Tr­êng Ca m«n, vµ còng tin vµo con m¾t cña chİnh m×nh, <sex> sÏ lµm nªn ®¹i nghiÖp. Sau nµy nÕu cÇn g×, ta sÏ gióp ®ì hÕt m×nh. Nay ta cßn nhiÒu c«ng vô. Xin c¸o tõ.",
	"(Viªn Bé kho¸i tíi lui nh­ giã, b«n ba v× chuyÖn thiªn h¹, ®óng lµ thiÕt huyÕt ®an t©m. Cã thÓ kÕt giao víi mét l­¬ng s­ İch h÷u nh­ thÕ, ®óng lµ kh«ng uæng cuéc ®êi. Cã lÏ ta nªn trë vÒ chç Xa Lu©n B¸ V­¬ng, ®Ó xem nhiÖm vô míi lµ g×.)",
	}

	DelItem(2,0,749,1);--É¾³ıÁùÉÈÃÅÉËÒ©;
	TalkEx("task_007_07_1",strTalk);
	SetTask(TASK_XB_ID,36);
	TaskTip("§Õn chç Xa Lu©n B¸ V­¬ng, b¾t ®Çu hµnh ®éng gi¸n ®iÖp cña m×nh t¹i NhÊt PhÈm §­êng!");
	Msg2Player("§Õn chç Xa Lu©n B¸ V­¬ng, b¾t ®Çu hµnh ®éng gi¸n ®iÖp cña m×nh t¹i NhÊt PhÈm §­êng!");
	GivePlayerAward("Award_XB_16","Easy");
	GivePlayerExp(SkeyXibei,"tiexueernv")
end



--ÓëÔ¬·ÉÔÆ¶Ô»°»Øµ÷É¾³ıNpc
function task_007_07_1()

	SetNpcLifeTime(GetTask(YUANFEIYUN_NPCINDEX),0);--ÈÃNpcÏûÊ§
	SetNpcScript(GetTask(YUANFEIYUN_NPCINDEX),"");--½Å±¾ÖÃ¿Õ

end

---------------------------------- Î÷±±Çø08Æå·êµĞÊÖ----------------------------------
--Óë³µÂÖ°ÔÍõ¶Ô»°ÁìÈ¡Ò»Æ·ÌÃÈÎÎñ
function task_008_01_0()

local strTalk = {
	"Lµ thµnh viªn cña NhÊt PhÈm §­êng, ng­¬i ph¶i lu«n ghi nhí §­êng quy, phôc tïng mÖnh lÖnh th­îng cÊp, tuyÖt ®èi kh«ng ®­îc ph¹m th­îng, mäi viÖc ph¶i ®Æt lîi İch cña bæn §­êng lªn ®Çu, thÒ tËn trung víi bæn §­êng. NÕu ng­¬i cã ı ph¶n nghŞch, kÕt côc chØ cã mét con ®­êng chÕt, râ ch­a?",
	"Ta hiÓu, NhÊt PhÈm §­êng ®· cho ta mét chèn dung th©n, ta quyÕt dèc søc phông sù bæn §­êng!",
	"Tèt, víi tµi trİ vµ th©n thñ cña ng­¬i, tin r»ng sÏ kh«ng phô kú väng cña ta. Téc T©y H¹ chuéng vâ, NhÊt PhÈm §­êng ta lµ th¸nh ®Şa vâ häc, ngay c¶ T©y H¹ §Ö nhÊt dòng sü còng ë trong hµng ngò cña NhÊt PhÈm §­êng, ng­êi nµy lµ Th¸c B¹t Ho»ng, vâ c«ng siªu viÖt, v« ®Şch T©y H¹ nhiÒu n¨m liÒn, lµ m·nh t­íng ®­îc ®İch th©n Lı Nguyªn Kh¸nh ®¹i nh©n chiªu mé.",
	"Lı Nguyªn Kh¸nh ®¹i nh©n ph¶i ch¨ng chİnh lµ ng­êi tæng phô tr¸ch ®· ®­îc nh¾c tíi trong mËt hµm? LÇn nµy «ng ta còng tíi Phông T­êng phñ µ?",
	}

	TalkEx("task_008_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_008_01_0_1()

local strTalk = {
	"§óng vËy, lÇn nµy cã Lı ®¹i nh©n chñ tr× ®¹i côc, ng­¬i cø yªn t©m hµnh sù. Nh­ng nh÷ng viÖc kh«ng nªn hái th× tèt nhÊt ng­¬i ®õng l¾m ®iÒu. HiÖn nay Th¸c B¹t Ho»ng phông lÖnh ®iÒu tra chuyÖn Quang Minh ®Ønh cña Minh gi¸o, Minh gi¸o mÊy n¨m tr­íc vÉn rÊt biÕt ®iÒu, th­êng hîp t¸c víi bæn §­êng, nh­ng nay th× kh¸c råi, cã dÊu hiÖu chèng ®èi ta. Ng­¬i h·y tíi Phông T­êng phñ t×m Th¸c B¹t Ho»ng, xem h¾n cã sai b¶o g× kh«ng.",
	"Nh­ng Th¸c B¹t Ho»ng phô tr¸ch ®iÒu tra Quang Minh ®Ønh, sao giê l¹i xuÊt hiÖn ë Phông T­êng?",
	"Hõ, Th¸c B¹t Ho»ng vâ c«ng tuyÖt ®Ønh, tuy lµ ng­êi cña NhÊt PhÈm §­êng, nh­ng l¹i kh«ng tËn t©m cho n­íc nhµ, chØ thİch t×m kiÕm ®èi thñ so tµi vç nghÖ, nÕu h¾n kh«ng ®iªn khïng nh­ vËy, ch¾c giê ®· leo ®Õn vŞ trİ thèng lÜnh NhÊt PhÈm §­êng råi. Ch¾c ë Phông T­êng h¾n l¹i gÆp mét cao thñ g× ®ã, khiÕn bá bª c¶ nhiÖm vô.",
	"Ra vËy, nghÜ l¹i c¸c cao nh©n ®Òu tİnh t×nh kú qu¸i, ng­êi ngoµi kh«ng thÓ ®o¸n biÕt ®­îc. Ta xin c¸o tõ.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID,37);
	TaskTip("§Õn Phông T­êng, hái Th¸c B¹t Ho»ng vÒ tiÕn triÓn nhiÖm vô ®iÒu tra ë Quang Minh ®Ønh.");
	Msg2Player("§Õn Phông T­êng, hái Th¸c B¹t Ho»ng vÒ tiÕn triÓn nhiÖm vô ®iÒu tra ë Quang Minh ®Ønh.");

end

--ÉĞÎ´ÓëÍØ°Îºë¶Ô»°
function task_008_01_1()

local strTalk = {
	"Th¸c B¹t Ho»ng hiÖn ®ang ë Phông T­êng phñ, ng­¬i ®Õn t×m h¾n, xem h¾n cã cÇn gióp ®ì kh«ng.",
	}

	TalkEx("",strTalk);

end

--ÓëÍØ°Îºë¶Ô»°µÃµ½Ò»Æ·ÌÃÃØÒ©
function task_008_02_0()

local strTalk = {
	"Chiªu thøc cña h¾n tho¹t nh×n cã vÎ nh¹t nhÏo, nh­ng chiªu thøc hîp víi t©m tr¹ng ng­êi cÇm kiÕm, biÕn hãa ®a d¹ng l¹i thèng nhÊt, biÕt ph¸ gi¶i nh­ thÕ nµo ®©y?",
	"C¸c h¹ cã ph¶i Th¸c B¹t Ho»ng tiÒn bèi? Xa Lu©n B¸ V­¬ng sai t¹i h¹ ®Õn ®©y t×m «ng!",
	"… ê ®óng vËy. Ra lµ ng­êi cña bæn §­êng, Xa Lu©n B¸ V­¬ng ph¸i ng­¬i tíi sao? L¹i hèi thóc vÒ nhiÖm vô ë Quang Minh ®Ønh chø g×? Ng­¬i vÒ b¸o l¹i víi Xa Lu©n, ta biÕt ph¶i lµm g×, kh«ng cÇn h¾n hèi thóc chØ ®¹o. Khôc... khôc…",
	"Xa Lu©n B¸ V­¬ng kh«ng cã ı hèi thóc B¹n, «ng Êy b¶o t¹i h¹ ®Õn trî gióp B¹n cïng ®iÒu tra Quang Minh ®Ønh. Nh­ng tiÒn bèi d­êng nh­ ®ang bŞ th­¬ng th× ph¶i? TiÒn bèi vâ c«ng c¸i thÕ, ch¼ng lÏ lµ bŞ ®¸nh lĞn?",
	"(Cã vÎ nh­ «ng ta rÊt ch¸n ghĞt nhiÖm vô mµ NhÊt PhÈm §­êng giao cho, cßn NhÊt PhÈm §­êng còng cã vÎ hÕt nhÉn n¹i víi h¾n.)",
	"Ha ha, <sex> nãi vËy lµ sai råi. Ng­êi häc vâ kh«ng cã c¸i thuyÕt c¸i thÕ siªu phµm, vâ häc còng kh«ng ph©n chia m¹nh yÕu, kÎ m¹nh ®ång thêi còng bao hµm mét tr¸i tim yÕu ®uèi, bï l¹i kÎ yÕu l¹i th­êng cã c¬ thÓ m¹nh mÏ. C¸i sè trong thiªn h¹, b¾t ®Çu tõ ®©u sÏ kÕt thóc t¹i ®ã. sù cao thÊp trong vâ häc nãi ®óng h¬n chİnh lµ sù cao thÊp cña c¸i t©m ng­êi häc vâ.",
	}

	TalkEx("task_008_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_008_02_0_1()

local strTalk = {
	"Lêi nãi cña tiÒn bèi ı nghÜa s©u xa, cã thÓ gi¶i thİch vÒ sù m¹nh yÕu cña vâ häc nh­ thÕ, ®óng lµ mét lı luËn uyªn th©m.",
	"å? Ng­¬i hiÓu ta muèn nãi g× thËt sao?",
	"Ng­êi ch¬i: Cã g× khã ®©u chø. Còng vİ nh­ c¸c chiªu thøc vâ c«ng, khİ ph¸t ra thÓ hiÖn trong c¸c chiªu thøc, nh­ng b¶n th©n chiªu thøc kh«ng chia m¹nh yÕu, cao thñ xuÊt chiªu cã vÎ nh­ kh«ng cã s¬ hë,®iÓm m¹nh nhÊt vµ ®iÓm yÕu nhÊt th­êng ®­îc ®Æt chung víi nhau, cao thñ chØ cè giÊu ®iÓm yÕu chiªu thøc. Do ®ã tr­íc khi biÕn hãa xuÊt chiªu, ch¾c ch¾n sÏ ®Ó lé s¬ hë, chİnh s¬ hë nµy sÏ quyÕt ®Şnh sù cao thÊp",
	"Ha ha, cã lı cã lı, vâ nghÖ vµ chiªu thøc vèn cïng mét gèc, kh«ng ngê kiÕn thøc vâ häc cña <sex> còng kh«ng tåi, l¹i cã thiªn phó. Nµo, chóng ta so tµi mét phen. Khôc khôc…",
	"T¹i h¹ chØ xu«i theo lı luËn cña tiÒn bèi mµ nãi bõa vËy th«i, chø vâ häc cña t¹i h¹ chØ míi giai ®o¹n nhËp m«n, ®©u d¸m so tµi cïng tiÒn bèi. H¬n n÷a tiÒn bèi ®ang bŞ th­¬ng, t¹i h¹ ph¶i gióp ng­êi trŞ th­¬ng tr­íc míi ph¶i.",
	}

	TalkEx("task_008_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_008_02_0_2()

local strTalk = {
	"Ng­¬i kh¸ch s¸o qu¸. Nh­ng sau nµy ta sÏ cßn nhiÒu c¬ héi so tµi víi nhau. VÕt th­¬ng cña ta kh«ng ®¸ng ng¹i, do h«m tr­íc tû thİ mét ngµy mét ®ªm víi T­ M· Minh Phongnªn míi vËy. Tõ ngµy xuÊt ®¹o ®Õn nay, ta ch­a tõng ®­îc ®¸nh mét trËn s¶ng kho¸i ®Õn vËy, h¬n n÷a cßn bÊt ph©n th¾ng b¹i. Ta nghÜ ch¾c h¾n còng ®· bŞ th­¬ng, <sex> cã vÎ nh­ lµ ng­êi Tèng, h·y gióp ta ®­a NhÊt PhÈm §­êng MËt d­îc nµy cho h¾n, v× d­êng nh­ h¾n h¬i ph¶n c¶m víi ng­êi T©y H¹.",
	"Theo nh­ lêi tiÒn bèi, T­ M· Minh Phong lµ mét ng­êi H¸n, kh«ng biÕt giê h¾n ®ang ë ®©u?",
	"H¾n vÉn cßn ë trong Phông T­êng phñ, ta vµ h¾n vÉn ch­a ph©n th¾ng b¹i, chØ lµ t¹m thêi nghØ ng¬i, sao cã thÓ bá ®i ®­îc? Mét ®èi thñ c©n søc nh­ thÕ ®©u ph¶i dÔ gÆp. Ng­¬i mau ®­a thuèc tíi cho h¾n, ®ång thêi gióp ta hÑn ngµy giao ®Êu tiÕp. §i mau ®i, ta cßn ph¶i suy nghÜ c¸ch ph¸ gi¶i chiªu thøc cña h¾n, biÕn hãa cña chiªu thøc ph¶i kÕt hîp ®­îc ®iÓm m¹nh nhÊt vµ yÕu nhÊt, ch¶ lÏ khi biÕn hãa còng lµ lóc ®Ó lé s¬ hë...",
	"…………….",
	"(Xem ra Th¸c B¹t Ho»ng ®· bá ngoµi tai nhiÖm vô cña NhÊt PhÈm §­êng råi. T­ M· Minh Phong kia lµ thÇn th¸nh ph­¬ng nµo? NÕu h¾n lµ ng­êi Tèng, mét cao nh©n nh­ thÕ sao giang hå l¹i kh«ng nghe danh t¸nh vËy?)",
	}

	TalkEx("",strTalk);
	AddItem(2,0,698,1,1);--Ò»Æ·ÌÃÃØÒ©
	SetTask(TASK_XB_ID,38);
	TaskTip("Gióp Th¸c B¹t Ho»ng ®em MËt d­îc NhÊt PhÈm §­êng ®Õn cho T­ M· Minh Phong, ®ång thêi chiªm ng­ìng phong th¸i cña vŞ ®¹i hiÖp nµy.");
	Msg2Player("Gióp Th¸c B¹t Ho»ng ®em MËt d­îc NhÊt PhÈm §­êng ®Õn cho T­ M· Minh Phong, ®ång thêi chiªm ng­ìng phong th¸i cña vŞ ®¹i hiÖp nµy.");
	GivePlayerExp(SkeyXibei,"xixiayongshi")
end

--ÉĞÎ´ÓëË¾ÂíÃù·ç¶Ô»°
function task_008_02_1()

local strTalk = {
	"Ta ®o¸n T­ M· Minh Phong còng ®· bŞ th­¬ng, giê ch¾c h¾n vÉn cßn ë trong Phông T­êng phñ. H·y gióp ta ®­a NhÊt PhÈm §­êng MËt d­îc nµy cho h¾n, ®ång thêi gióp ta hÑn ngµy giao ®Êu tiÕp.§i mau ®i, ta cßn ph¶i suy nghÜ c¸ch ph¸ gi¶i chiªu thøc cña h¾n, biÕn hãa cña chiªu thøc ph¶i kÕt hîp ®­îc ®iÓm m¹nh nhÊt vµ yÕu nhÊt, ch¶ lÏ khi biÕn hãa còng lµ lóc ®Ó lé s¬ hë...",
	}

	TalkEx("",strTalk);

end

--ÓëË¾ÂíÃù·ç¶Ô»°É¾È¥Ò»Æ·ÌÃÃØÒ©
function task_008_03_0()

local strTalk = {
	"TiÒn bèi cã ph¶i lµ T­ M· Minh Phong?",
	"T¹i h¹ chİnh lµ T­ M· Minh Phong, sao <sex> l¹i biÕt t¹i h¹?",
	"Th¸c B¹t Ho»ng tiÒn bèi ®· nãi víi t¹i h¹, hai ng­êi so tµi suèt mét ngµy mét ®ªm, e lµ tiÒn bèi còng ®· bŞ th­¬ng, ®©y lµ NhÊt PhÈm §­êng MËt d­îc mµ «ng Êy nhê t¹i h¹ ®em ®Õn tÆng.",
	"Giang hå phiªu b¹t, thuyÒn nan ng­îc xu«i, ai biÕt ®©u lµ thiªn ®­êng? T¹i h¹ nhiÒu n¨m kh«ng hµnh tÈu giang hå, kh«ng ngê l¹i thay ®æi nhiÒu ®Õn vËy, hãa ra T©y H¹ còng lµ n¬i ngäa hæ tµng long, gÆp mét ®èi thñ nh­ Th¸c B¹t Ho»ng ta ch¼ng cßn g× ®Ó hèi tiÕc. Kh«ng ngê h¾n hµnh sù lçi l¹c, cßn cho thñ h¹ ®Õn tÆng thuèc, ®óng lµ mét tªn h¶o h¸n, chØ ®¸ng tiÕc l¹i lµ ng­êi cña NhÊt PhÈm §­êng.",
	}

	TalkEx("task_008_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_008_03_0_1()

local strTalk = {
	"Th¸c B¹t tiÒn bèi còng hÕt lêi khen ngîi vâ nghÖ cña T­ M· tiÒn bèi, nãi ng­êi lµ ®èi thñ c©n søc nhÊt tõ tr­íc ®Õn nay, ®ång thêi cßn dÆn t¹i h¹ hÑn thêi gian so tµi lÇn tíi.",
	"Ha ha, ®©y còng chİnh lµ mong muèn cña t¹i h¹. Ta vèn kh«ng thiÖn c¶m víi ng­êi T©y H¹, nh­ng gÆp ®­îc Th¸c B¹t Ho»ng ®· khiÕn ta thay ®æi suy nghÜ vÒ T©y H¹ NhÊt PhÈm §­êng. <sex> lµ ng­êi Tèng, sao l¹i phông sù cho NhÊt PhÈm §­êng? Nh­ng ®©y lµ chuyÖn riªng t­ cña c¸c h¹, ta còng kh«ng tiÖn hái. §a t¹ th­¬ng d­îc cña c¸c h¹. Xin chuyÓn lêi ®Õn Th¸c B¹t Ho»ng, ta sÏ ®Õn ®óng hÑn.",
	"Kh«ng lµm phiÒn tiÒn bèi trŞ th­¬ng n÷a, ta sÏ chuyÓn lêi ®Õn Th¸c B¹t tiÒn bèi. Xin c¸o tõ.",
	"(¤i, lêi nh¾c nhë cña Viªn V©n Phi qu¶ nhiªn ®· øng nghiÖm, ta cÇn ph¶i cã dòng khİ ®Ó ®èi mÆt víi sù hiÓu lÇm cña ng­êi ®êi. T­ M· Minh Phong ¨n nãi ®Ünh ®¹c, n¨m x­a h¼n lµ mét nh©n vËt lîi h¹i, cã lÏ nªn ®i t×m ¢u D­¬ng Häa tiÒn bèi ®Ó hái cho râ.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,698,1);--Ò»Æ·ÌÃÃØÒ©
	SetTask(TASK_XB_ID,39);
	CreateTrigger(4,210,TALK_XB_OUYANGHUA);
	TaskTip("ChuyÓn lêi ®Õn Th¸c B¹t Ho»ng, ®ång thêi ®i t×m ¢u D­¬ng Häa tiÒn bèi hái th¨m vÒ T­ M· Minh Phong.");
	Msg2Player("ChuyÓn lêi ®Õn Th¸c B¹t Ho»ng, ®ång thêi ®i t×m ¢u D­¬ng Häa tiÒn bèi hái th¨m vÒ T­ M· Minh Phong.");
	GivePlayerAward("Award_XB_17","Easy");
	GivePlayerExp(SkeyXibei,"dishou")
end

--ÉĞÎ´ÓëÅ·Ñô»­»òÍØ°Îºë¶Ô»°
function task_008_03_1()

local strTalk = {};

	--Î´ÓëÅ·Ñô»­¶Ô»°
	if GetTask(TASK_XB_ID_01) ~= 0 then
		strTalk = {
			"(T­ M· Minh Phong ¨n nãi ®Ünh ®¹c, n¨m x­a h¼n lµ mét nh©n vËt lîi h¹i, ta nªn ®i t×m ¢u D­¬ng Häa tiÒn bèi ®Ó hái cho râ.)"
				}
		--²¹·¢Å·Ñô»­¶Ô»°´¥·¢Æ÷
		if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
			CreateTrigger(4,210,TALK_XB_OUYANGHUA);
			TaskTip("T×m ¢u D­¬ng Häa hái vÒ T­ M· Minh Phong.");
			Msg2Player("T×m ¢u D­¬ng Häa hái vÒ T­ M· Minh Phong.");
		end
		TalkEx("",strTalk);
	--Î´ÓëÍØ°Îºë¶Ô»°
	elseif GetTask(TASK_XB_ID_02) ~= 0 then
		strTalk = {
			"§a t¹ th­¬ng d­îc cña c¸c h¹. Xin chuyÓn lêi ®Õn Th¸c B¹t Ho»ng, ta sÏ ®Õn ®óng hÑn.",
				}
		TalkEx("",strTalk);
	--Î´ÓëÅ·Ñô»­&Î´ÓëÍØ°Îºë¶Ô»°
	else
		 strTalk = {
		 	"§a t¹ th­¬ng d­îc cña c¸c h¹. Xin chuyÓn lêi ®Õn Th¸c B¹t Ho»ng, ta sÏ ®Õn ®óng hÑn.",
			"(T­ M· Minh Phong ¨n nãi ®Ünh ®¹c, h¼n lµ mét nh©n vËt lîi h¹i, ta nªn ®i t×m ¢u D­¬ng Häa tiÒn bèi ®Ó hái cho râ.)",
			}
		--²¹·¢Å·Ñô»­¶Ô»°´¥·¢Æ÷
		if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
			CreateTrigger(4,210,TALK_XB_OUYANGHUA);
			TaskTip("T×m ¢u D­¬ng Häa hái vÒ T­ M· Minh Phong.");
			Msg2Player("T×m ¢u D­¬ng Häa hái vÒ T­ M· Minh Phong.");
		end
	end

	TalkEx("",strTalk);

end

-----------------------------------------·ÖÖ§1¿ªÊ¼----------------------------------------------------------------
---------------------------------- Î÷±±Çø09·ÖÖ§1_1¹âÃ÷×óÊ¹----------------------------------
--´úË¾ÂíÃù·ç×ª¸æÍØ°ÎºëÉËÒ©ÒÑÊÕµ½
function task_009_01_0()

local strTalk = {
	"TiÒn bèi, ta ®· ®Õn gÆp T­ M· Minh Phong, vÕt th­¬ng cña «ng Êy kh«ng ®¸ng ng¹i, «ng Êy còng rÊt mong ®­îc cïng tiÒn bèi so tµi lÇn n÷a, ®îi khi c¶ hai ®· lµnh h¼n, «ng Êy sÏ ®Õn ®óng hÑn.",
	"Ta kh«ng nh×n lÇm T­ M· Minh Phong, h¾n còng lµ mét ng­êi cã tinh thÇn vâ häc. §a t¹ <sex> ®· gióp ra xö lı viÖc riªng, ng­êi cña NhÊt PhÈm §­êng ®Òu cã b¶n chÊt tù t­ tù lîi, thİch tranh giµnh quyÒn lùc, nh÷ng ng­êi nhiÖt t×nh gióp ®ì ng­êi kh¸c nh­ ng­¬i qu¶ lµ rÊt hiÕm.",
	"TiÒn bèi qu¸ lêi. TiÒn bèi vµ T­ M· Minh Phong dïng vâ kÕt giao, v× lo l¾ng cho th­¬ng tİch cña b»ng h÷u mµ ®em tÆng thuèc quı, t¹i h¹ chØ gióp ®ì ®«i chót, tiÒn bèi xin ®õng kh¸ch s¸o.",
	"Ha ha, kh«ng giÊu g× ng­¬i, ta vµ T­ M· Minh Phong kh«ng ph¶i b»ng h÷u, còng ch¼ng ph¶i ®èi ®Şch, h¾n lµ nh©n tµi mµ NhÊt PhÈm §­êng ®ang muèn chiªu mé. Nh­ng d­êng nh­ h¾n kh«ng thİch ng­êi T©y H¹, míi nghe nãi ta ®Õn tõ T©y H¹ NhÊt PhÈm §­êng, muèn chiªu mé h¾n, ®· tá ı khã chŞu råi c¶ hai quyÕt ®Êu bÊt ph©n th¾ng b¹i. Quy ®Şnh cña NhÊt PhÈm §­êng lµ nÕu kh«ng chiªu mé ®­îc, th× ph¶i trõ khö ®i. T­ M· Minh Phong kh«ng muèn gia nhËp, nªn h¾n kh«ng nh÷ng kh«ng ph¶i lµ b»ng h÷u, mµ cßn lµ kÎ ®Şch.",
	}

	TalkEx("task_009_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_009_01_0_1()

local strTalk = {
	"Ra lµ vËy, nh­ng tiÒn bèi kh«ng nh÷ng kh«ng trõ khö h¾n, tr¸i l¹i cßn tÆng thuèc trŞ th­¬ng. Ch¼ng lÏ tiÒn bèi kh«ng sî NhÊt PhÈm §­êng tr¸ch téi sao?",
	"<sex> vµ ta cã duyªn, ë ng­¬i cã luång chİnh khİ kh¸c h¼n víi mäi ng­êi, nªn ta bÊt gi¸c thæ lé nhiÒu ®iÒu. ThËt ra viÖc ta gia nhËp NhÊt PhÈm §­êng còng kh¸ dµi dßng, víi ta, cuéc ®êi ng¾n ngñi, ı nghÜa cuéc ®êi chİnh lµ t×m ®­îc ®èi thñ so tµi vâ nghÖ. Huèng hå søc ta còng kh«ng thÓ tiªu diÖt ®­îc h¾n, vËy th× cã téi g× chø? Cßn nÕu Lı Nguyªn Kh¸nh muèn tr¸ch téi, th× cø ®Ó h¾n ®i t×m cao thñ kh¸c vËy.",
	"TiÒn bèi ®óng lµ kú l¹, hµnh sù phãng tóng l¹i th¼ng th¾n kho¸ng ®¹t, kh«ng c©u nÖ chuyÖn ®­îc mÊt.",
	"(Quan hÖ gi÷a Th¸c B¹t Ho»ng vµ Lı Nguyªn Kh¸nh d­êng nh­ kh«ng ®­îc b×nh th­êng, ®Şa vŞ cña h¾n cao h¬n c¶ ThËp ®¹i Kim cang, trùc tiÕp nghe lÖnh cña Lı Nguyªn Kh¸nh, nh­ng l¹i lµ kÎ si vâ, dïng vâ nghÖ kÕt giao b»ng h÷u l¹i tá ra quang minh lçi l¹c, ®óng lµ bËc anh hµo hiÕm cã trong NhÊt PhÈm §­êng.)",
	}

	TalkEx("task_009_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_009_01_0_2()

local strTalk = {
	"Ha ha, kú nh©n th× kh«ng d¸m, ch¼ng qua lµ tªn qu¸i nh©n kh«ng nh×n thÊu vâ ®¹o, l¹i thİch kiÕm chuyÖn ®¸nh nhau th«i. Tuy ta th­êng phít lê nhiÖm vô, nh­ng ®èi víi kÎ míi gia nhËp m«n ph¸i nh­ ng­¬i, hoµn thµnh nhiÖm vô kh«ng nh÷ng gióp ng­¬i trô v÷ng trong §­êng, cßn lµ c¬ héi th¨ng tiÕn. LÇn nµy Minh gi¸o trïng h­ng Quang Minh ®Ønh, Lı Nguyªn Kh¸nh ®· sím cã sù nghi ngê, c¶m thÊy Minh gi¸o cßn ©m m­u nµo kh¸c. Nh­ng ta l¹i kh«ng høng thó víi viÖc nµy, nÕu kh«ng v× h¾n nhê v¶, ta còng ch¼ng thÌm nhóng tay vµo.",
	"Tæng ®µn Minh gi¸o d­êng nh­ ®­îc ®Æt ë TuyÒn Ch©u, t¹i sao l¹i ngµn dÆm xa x«i ®Õn vïng hoang v¾ng nµy ®Ó x©y dùng c¨n cø?",
	"§©y chİnh lµ môc ®İch cña nhiÖm vô lÇn nµy. GÇn ®©y ta ch×m ®¾m trong chuyÖn T­ M· Minh Phong, lµm nhiÖm vô nµy bŞ g¸c l¹i. §Õn nay chØ biÕt ®­îc ng­êi phô tr¸ch x©y dùng lµ Quang Minh t¶ sø ¢n Minh cña Minh gi¸o. VËy ®i, ng­¬i thay ta ®Õn Quang Minh ®Ønh, coi nh­ ®©y lµ nhiÖm vô ®Çu tiªn sau khi nhËp §­êng. Nghe nãi ¢n Minh h¶o r­îu, ng­¬i h·y b¾t tay tõ ®©y, cã thÓ sÏ t×m ra manh mèi nµo ®ã.",
	"T¹i h¹ sÏ gióp tiÒn bèi xö lı viÖc nµy, tiÒn bèi cø yªn t©m øng chiÕn.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,1);
	--if GetTask(TASK_XB_ID_02) == 1 then
		SetTask(TASK_XB_ID,40);--¹Ø±Õ08ÈÎÎñÃæ°å
	--end
	TaskTip("§Õn Quang Minh ®Ønh th¨m dß ®éng tÜnh Minh gi¸o tõ nguån Quang Minh t¶ sø - ¢n Minh.");
	Msg2Player("§Õn Quang Minh ®Ønh th¨m dß ®éng tÜnh Minh gi¸o tõ nguån Quang Minh t¶ sø - ¢n Minh.");
	GivePlayerExp(SkeyXibei,"mingjiao")
end

--Î´ÓëÒóÃú¶Ô»°
function task_009_01_1()

local strTalk = {
	"Ng­êi phô tr¸ch trïng tu Quang Minh ®Ønh lµ Quang Minh t¶ sø ¢n Minh cña Minh gi¸o. ¢n Minh h¶o r­îu, ng­¬i cã thÓ khai th¸c ®iÓm nµy cña h¾n ®Ó thu thËp th«ng tin. Giê ®©y ¢n Minh ®ang cã mÆt trªn Quang Minh ®Ønh.",
	}

	TalkEx("",strTalk);

end

--ÓëÒóÃú¶Ô»°°ïÊÕ¼¯²¨Ë¹ÆÏÌÑ¾Æ
function task_009_02_0()

local strTalk = {
	" Kh¸i ®­¬ng dÜ khang, ­u t­ nan vong, hµ dÜ gi¶i ­u, duy h÷u ®ç khang. Thiªn h¹ anh hïng hµo khİ, thïy d­ céng Èm ®ång x­íng?",
	"T¹i h¹ ®i ngang Quang Minh ®Ønh, thÊy ®Ö tö Minh gi¸o ra vµo ng­îc xu«i, l¹i nghe c¸c h¹ uèng r­îu ng©m nga, d­êng nh­ cã nçi buån man m¸c. Tõ l©u nghe danh Minh gi¸o Quang Minh t¶ sø ¢n Minh töu kiÕm song tuyÖt, ch÷ töu lªn xÕp trªn ®Çu, ph¶i ch¨ng c¸c h¹ ®©y chİnh lµ Quang Minh t¶ sø ¢n Minh?",
	"<sex> ®o¸n hay l¾m, ta chİnh lµ ¢n Minh. Khi n·y chØ lµ do h¬i men, nçi buån bÊt gi¸c trµo d©ng, nªn míi ng©m nga mÊy c©u, mong <sex> ®õng c­êi chª.",
	"Tù cæ r­îu vµo lêi ra, ng­êi mª r­îi l¹i cµng phãng kho¸ng tho¸t tôc, tiªn sinh c¶m kh¸i mu«n vµn, l¹i cßn ng©m th¬ gióp vui, t¹i h¹ nµo d¸m c­êi chª?",
	}

	TalkEx("task_009_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_009_02_0_1()

local strTalk = {
	"<sex> d­êng nh­ còng cã nhiÒu kiÕn gi¶i ®éc ®¸o vÒ r­îu, ®óng lµ b»ng h÷u tri kû. Ta chu du kh¾p ®¹i giang nam b¾c, ph¸t hiÖn r­îu cña Trung Nguyªn nÕu kh«ng ph¶i qu¸ m¹nh th× lµ qu¸ nh¹t, rÊt hiÕm cã nh÷ng lo¹i r­îu nång Êm ch­ng cÊt l©u n¨m. R­îu sinh hµo khİ, nay kh«ng t×m thÊy r­îu ngon, nçi buån bÊt gi¸c d©ng trµo, kh«ng sao cÇm ®­îc.",
	"R­îu Trung Nguyªn còng cã lo¹i nång nµn d­ vŞ nh­ Tam Oa §Çu, N÷ Nhi Hång, cßn c¸c lo¹i B¸ch Th¶o, HÇu Nhi l¹i lµ c¸c lo¹i r­îu thuèc thanh liÖt s¶ng kho¸i, sao l¹i nãi lµ kh«ng cã r­îu ngon?",
	"Hay, hay l¾m, <sex> qu¶ nhiªn lµ ng­êi sµnh r­îu, ®ã ®İch thùc lµ nh÷ng lo¹i r­îu ngon nhÊt Trung Nguyªn, chØ tiÕc Phông T­êng phñ ë n¬i hÎo l¸nh, r­îu còng nghÌo nµn. Song Phông T­êng do gi¸p ranh T©y Vùc, nªn l¹i cã b¸n lo¹i T©y Vùc Mü Töu mµ Trung Nguyªn kh«ng cã, h­¬ng vŞ tuyÖt diÖu. ",
	"Ta lµm sao d¸m so s¸nh víi c¸c h¹, kh«ng biÕt lµ lo¹i r­îu ngon nµo l¹i ®­îc lßng c¸c h¹ ®Õn vËy?",
	}

	TalkEx("task_009_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_009_02_0_2()

local strTalk = {
	"Khİ hËu T©y Vùc Ba T­ cã hai mïa tr¸i ng­îc, mïa hÌ n¾ng löa, mïa ®«ng gi¸ rĞt, cho nªn bå ®µo ë ®©y còng rÊt ®Æc biÖt, mµu ®á nh­ m¸u, th¬m dŞu dµng, kh«ng cay kh«ng nh¹t, dï cã uèng ngµn ly còng kh«ng say, ®óng lµ cùc phÈm.",
	"R­îu nho Ba T­ ®­îc tiªn sinh khen ngîi nh­ vËy, sao kh«ng thÊy tiªn sinh uèng?",
	"R­îu nho Ba T­ nµy chØ cã ë Phông T­êng phñ chç th­¬ng nh©n Ba T­, mçi lÇn chØ cã l­îng h¹n chÕ, nh­ng ta v× kÑt c«ng vô nªn kh«ng thÓ tíi ®ã, ®µnh ngåi ®©y nh×n r­îu than thë, uèng r­îu gi¶i sÇu.",
	"Ta sÏ gióp tiªn sinh ®­îc to¹i nguyÖn, giê ta sÏ tíi Phông T­êng phñ, t×m r­îu ngon cho tiªn sinh.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,2);
	TaskTip("Tíi Phông T­êng phñ t×m th­¬ng nh©n Ba T­ mua r­îu Bå §µo cho ¢n Minh.");
	Msg2Player("Tíi Phông T­êng phñ t×m th­¬ng nh©n Ba T­ mua r­îu Bå §µo cho ¢n Minh.");
	GivePlayerAward("Award_XB_18","Easy");
	GivePlayerExp(SkeyXibei,"putaomeijiu")
end

--Î´Óë²¨Ë¹ÉÌÈË¶Ô»°
function task_009_02_1()

local strTalk = {
	"R­îu nho Ba T­ chØ cã ë Phông T­êng phñ chç th­¬ng nh©n Ba T­, mçi lÇn chØ cã l­îng h¹n chÕ, nh­ng ta v× kÑt c«ng vô nªn kh«ng thÓ tíi ®ã, ®µnh ngåi ®©y nh×n r­îu than thë, uèng r­îu gi¶i sÇu.",
	}

	TalkEx("",strTalk);

end

--Óë²¨Ë¹ÉÌÈË¶Ô»°µÃÖªÆÏÌÑ¾Æ±»Î÷±±ÑÌººÇÀÈ¥
function task_009_03_0()

local strTalk = {
	"<sex>, ë ®©y ta cã mét ®ît hµng quı hiÕm ®Õn tõ Ba T­, nÕu chän ®­îc c¸i ­ng ı, gi¸ tiÒn cã thÓ th­¬ng l­îng.",
	"Nghe ®ån ë ®©y cã b¸n r­îu Bå §µo cña Ba T­, cã ph¶i kh«ng?",
	"<sex> thËt sµnh sái, r­îu Bå §µo cña ta lµ lo¹i r­îu ngon ®· cÊt h¬n 12 n¨m, sè l­îng kh«ng nhiÒu, chØ tiÕc ng­êi ®· chËm 1 b­íc, r­îu ®· bŞ T©y B¾c Yªn H¸n mua hÕt víi gi¸ cao, ch¼ng cßn sãt l¹i b×nh nµo.",
	"(Sao ®µn «ng ë Phông T­êng phñ nµy ®Òu h¶o r­îu hÕt vËy? LÇn tr­íc sè thuèc gi· r­îu còng bŞ mua hÕt s¹ch. Cho hái bao giê th× «ng míi cã hµng míi?",
	}

	TalkEx("task_009_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_009_03_0_1()

local strTalk = {
	"Ta míi ®Õn ®©y kh«ng l©u, ph¶i ®îi kiÕm ®ñ vèn cña chuyÕn hµng nµy míi vÒ Ba T­ ®­îc, cho nªn còng kh«ng thÓ nãi ch¾c lµ bao giê. ChuyÕn hµng lÇn sau cã lÏ sÏ kh«ng b»ng b©y giê, nh­ng còng lµ lo¹i r­îu cÊt ®­îc 10 n¨m, lÇn sau <sex> nhí ®Õn sím.",
	"ThËt ®óng lµ r­îu ngon khã t×m, kh«ng biÕt T©y B¾c Yªn H¸n cã chŞu nh­îng l¹i? ¤ng cã biÕt hä ®i vÒ h­íng nµo kh«ng?",
	"<sex> ®óng lµ ng­êi h¶o r­îu, ch¼ng kh¸c nµo T©y B¾c Yªn H¸n, nh­ng cho dï cã ®uæi kŞp hä còng ch­a ch¾c chŞu nh­îng l¹i ®©u. Ta nhí hä ®· ®i vÒ phİa nam Phông T­êng phñ, cø ®Õn ®ã xem thö.",
	"§a t¹, ta ph¶i tíi xem liÖu hä cã thÓ nh­îng 10 r­îu Bå §µo, nh­ vËy th× ®Ñp c¶ ®«i ®µng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,3);
	CreateTrigger(0,1226,KILL_XB_XIBEIYANHAN);--É±¹Ö´¥·¢Æ÷
	TaskTip("§Õn phİa Nam Phông T­êng phñ t×m T©y B¾c Yªn H¸n mua 10 r­îu Bå §µo.");
	Msg2Player("§Õn phİa Nam Phông T­êng phñ t×m T©y B¾c Yªn H¸n mua 10 r­îu Bå §µo.");
end

--Î´È¡µÃ10·İÆÏÌÑ¾ÆÓë²¨Ë¹ÉÌÈË¶Ô»°and²¹·¢´¥·¢Æ÷
function task_009_03_1()

local strTalk = {
			"T©y B¾c Yªn H¸n ®· ®i vÒ phİa nam Phông T­êng phñ, hä quı r­îu h¬n c¶ sinh m¹ng, e kh«ng dÔ dµng nh­îng l¹i cho ng­¬i ®©u.",
			}
	if	GetTrigger(KILL_XB_XIBEIYANHAN) == 0 then
		CreateTrigger(0,1226,KILL_XB_XIBEIYANHAN);--É±¹Ö´¥·¢Æ÷
		TaskTip("§Õn phİa Nam Phông T­êng phñ t×m T©y B¾c Yªn H¸n mua 10 r­îu Bå §µo.");
		Msg2Player("§Õn phİa Nam Phông T­êng phñ t×m T©y B¾c Yªn H¸n mua 10 r­îu Bå §µo.");
	end

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø10·ÖÖ§1_2Î´Óê³ñçÑ----------------------------------
--È¡µÃÆÏÌÑ¾ÆºóÓëÒóÃú¶Ô»°
function task_010_01_0()

local strTalk = {};

	if GetItemCount(2,0,708) >= 10 then
		--Ã÷½ÌµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"<sex> bŞ h­¬ng th¬m cña r­îu l«i cuèn ®Õn ®©y ph¶i ch¨ng vÉn l­u luyÕn h­¬ng vŞ R­îu nho Ba T­?",
				"R­îu vÉn cßn trong b×nh mµ ¢n T¶ Sø vÉn ngöi thÊy sao? R­îu nho Ba T­ ph¶i tÆng ng­êi biÕt th­ëng thøc nh­ ¢n Tµ Sø ®©y.",
				"Ha ha, cho dï cã ch«n d­íi ®Êt vÉn kh«ng thÓ giÊu ®­îc mïi r­îu. Chóng ta ®Òu lµ b¹n bÌ t¹m thêi h·y bá qua nh÷ng lÔ nghÜa th­êng ngµy mµ cïng nhau uèng mét b÷a cho no say. R­îu nho nµy mïi vŞ qu¶ lµ rÊt kh¸c th­êng, ngon kh«ng chª vµo ®©u ®­îc.",
				"R­îu nµy sau 3 lÇn ch­ng cÊt th× vŞ chua ®· v¬i ®i nhiÒu, nÕu ch­ng cÊt thªm 1 lÇn th× ch¾c lµ sÏ khö hÕt vŞ chua.",
				"Ng­¬i nãi rÊt ®óng qu¶ lµ ng­êi biÕt th­ëng thøc, nh­ng vŞ chua nµy l¹i lµ tinh tóy cña r­îu nho, trµn ®Çy d­ ©m. Sù ®êi còng thÕ nÕu nh­ mäi viÖc ®Òu b×nh th­êng th× ®©u høng thó g×.",
				}
		else
			strTalk = {
				"<sex> bŞ h­¬ng th¬m cña r­îu l«i cuèn ®Õn ®©y ph¶i ch¨ng vÉn l­u luyÕn h­¬ng vŞ R­îu nho Ba T­?",
				"R­îu vÉn cßn trong b×nh mµ ¢n T¶ Sø vÉn ngöi thÊy sao? R­îu nho Ba T­ ph¶i tÆng ng­êi biÕt th­ëng thøc nh­ ¢n Tµ Sø ®©y.",
				"Ha ha, cho dï cã ch«n d­íi ®Êt vÉn kh«ng thÓ giÊu ®­îc mïi r­îu. Chóng ta ®Òu lµ b¹n bÌ t¹m thêi h·y bá qua nh÷ng lÔ nghÜa th­êng ngµy mµ cïng nhau uèng mét b÷a cho no say. R­îu nho nµy mïi vŞ qu¶ lµ rÊt kh¸c th­êng, ngon kh«ng chª vµo ®©u ®­îc.",
				"R­îu nµy sau 3 lÇn ch­ng cÊt th× vŞ chua ®· v¬i ®i nhiÒu, nÕu ch­ng cÊt thªm 1 lÇn th× ch¾c lµ sÏ khö hÕt vŞ chua.",
				"<sex> nãi rÊt ®óng qu¶ lµ ng­êi biÕt th­ëng thøc, nh­ng vŞ chua nµy l¹i lµ tinh tóy cña r­îu nho, trµn ®Çy d­ ©m. Sù ®êi còng thÕ nÕu nh­ mäi viÖc ®Òu b×nh th­êng th× ®©u høng thó g×.",
				}
		end

		TalkEx("task_010_01_0_1",strTalk);

	--Ã»ÓĞ´ø»ØÎïÆ·
	else
		strTalk = {
			"R­îu nho Ba T­ chØ cã ë Phông T­êng phñ chç th­¬ng nh©n Ba T­, mçi lÇn chØ cã l­îng h¹n chÕ, nh­ng ta v× kÑt c«ng vô nªn kh«ng thÓ tíi ®ã, ®µnh ngåi ®©y nh×n r­îu than thë, uèng r­îu gi¶i sÇu.",
			}
		TalkEx("",strTalk);

	end

end

--Ğø¶Ô»°
function task_010_01_0_1()

local strTalk = {}

	--Ã÷½ÌµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"¢n T¶ Sø ph¶i ch¨ng ®ang cã chuyÖn phiÒn muén?",
			"Ng­¬i ®· tõng nghe Si Háa gi¸o? Si Háa gi¸o lµ gi¸o ph¸i thÇn bİ ë trung nguyªn, v× muèn ®o¹t B¶n ®å S¬n Hµ X· T¾c nªn lµm lo¹n trung nguyªn. Si Háa gi¸o vµ B¶n gi¸o t­ëng nh­ dÔ lÉn lén nh­ng thËt ra lµ kh¸c biÖt rÊt xa. Nh­ng cã lÏ v× gi¸o chóng kh«ng c©u nÖ lÔ nghÜa trung nguyªn nªn ng­êi trong vâ l©m ®Òu cã thµnh kiÕn vµ ®em lßng thï ®Şch.",
			"Thuéc h¹ còng cã nghe nãi Si Háa gi¸o lµm lo¹n trung nguyªn nh­ng sao l¹i kÕt o¸n víi ta?",
			"Si Háa gi¸o vèn kh«ng thiÖn chİ víi vâ l©m trung nguyªn, chuyÖn chİnh quyÒn §¹i Lı rèi lo¹n lµ do Si Háa gi¸o g©y nªn nh­ng Minh gi¸o còng bŞ v¹ l©y vµ cho lµ ®ång bän cña Si Háa gi¸o. V× thÕ mµ ta ®· nhiÒu lÇn quyÕt ®Êu víi Si Háa gi¸o nh­ng ®Òu bÊt ph©n th¾ng b¹i. Sau nhiÒu lÇn giao tranh ®­îc biÕt Si Háa gi¸o ®· ®¸nh c¾p Th¸nh Háa LÖnh nªn mèi thï cµng s©u h¬n. ChuyÖn Minh gi¸o trïng tu Quang Minh ®Ønh vèn c¬ mËt nh­ng l¹i bŞ lé, e r»ng sÏ g©y sù chó ı cña NhÊt PhÈm ®­êng.",
			}
	else
		strTalk = {
			"¢n T¶ Sø ph¶i ch¨ng ®ang cã chuyÖn phiÒn muén?",
			"<sex> ®· tõng nghe Si Háa gi¸o? Si Háa gi¸o lµ gi¸o ph¸i thÇn bİ ë trung nguyªn, v× muèn ®o¹t B¶n ®å S¬n Hµ X· T¾c nªn lµm lo¹n trung nguyªn. Si Háa gi¸o vµ B¶n gi¸o t­ëng nh­ dÔ lÉn lén nh­ng thËt ra lµ kh¸c biÖt rÊt xa. Nh­ng cã lÏ v× gi¸o chóng kh«ng c©u nÖ lÔ nghÜa trung nguyªn nªn ng­êi trong vâ l©m ®Òu cã thµnh kiÕn vµ ®em lßng thï ®Şch.",
			"ChuyÖn Si Háa gi¸o lµm lo¹n trung nguyªn vÉn ch­a yªn sao chóng l¹i kÕt o¸n víi Minh gi¸o?",
			"Si Háa gi¸o vèn kh«ng thiÖn chİ víi vâ l©m trung nguyªn, chuyÖn chİnh quyÒn §¹i Lı rèi lo¹n lµ do Si Háa gi¸o g©y nªn nh­ng Minh gi¸o còng bŞ v¹ l©y vµ cho lµ ®ång bän cña Si Háa gi¸o. V× thÕ mµ ta ®· nhiÒu lÇn quyÕt ®Êu víi Si Háa gi¸o nh­ng ®Òu bÊt ph©n th¾ng b¹i. Sau nhiÒu lÇn giao tranh ®­îc biÕt Si Háa gi¸o ®· ®¸nh c¾p Th¸nh Háa LÖnh nªn mèi thï cµng s©u h¬n. ChuyÖn Minh gi¸o trïng tu Quang Minh ®Ønh vèn c¬ mËt nh­ng l¹i bŞ lé, e r»ng sÏ g©y sù chó ı cña NhÊt PhÈm ®­êng.",
			}
	end

	TalkEx("task_010_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_010_01_0_2()

local strTalk = {}

	--Ã÷½ÌµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Th× ra lµ vËy ch¼ng tr¸ch ¢n T¶ Sø lo l¾ng thÕ, chuyÖn nµy sao l¹i liªn quan ®Õn NhÊt PhÈm ®­êng?",
			"Ng­¬i võa gia nhËp gi¸o kh«ng biÕt b¶n gi¸o vµ NhÊt PhÈm ®­êng ®· tõng hîp t¸c, nh­ng ®ã ®· lµ qu¸ khø. Ta thÊy ng­êi cña NhÊt PhÈm ®­êng nhiÒu lÇn ra vµo Quang Minh ®Ønh, cã lÏ NhÊt PhÈm ®­êng ®· nghi ngê. Giê ta d¸m kh¼ng ®Şnh trong gi¸o cã Gian tÕ, kh«ng chØ ë Tæng ®µ mµ c¸c ®Ö tö trªn Quang Minh ®Ønh ®Òu cã gian tÕ Èn nÊp.",
			"Theo lêi ¢n T¶ Sø th× gian tÕ kh«ng chØ ho¹t ®éng ë Quang Minh ®Ønh e r»ng ë tæng ®µ còng cã kh«ng İt.",
			"Kh«ng sai, ta vµ ng­¬i võa gÆp nh­ ®· quen ®¸ng lÏ ph¶i uèng cho say nh­ng ta cßn ph¶i gi¸m s¸t viÖc trïng tu Quang Minh ®Ønh vµ trë vÒ tæng ®µ håi bµo tin tøc, ng­¬i cã thÓ gióp ta ®iÒu tra§Ö tö Minh gi¸o trªn Quang Minh ®Ønh xem cã manh mèi cña gian tÕ kh«ng.",
			"¢n T¶ Sø chí kh¸ch s¸o h·y ®îi tin tèt cña ta.",
			}
	else
		strTalk = {
			"(Quang Minh T¶ Sø qu¶ kh«ng tÇm th­êng, ta t­ëng h¾n chØ lµ tªn bîm r­îu, mong r»ng h¾n sÏ kh«ng ph¸t hiÖn th©n phËn NhÊt PhÈm ®­êng cña ta.)",
			"Theo lêi ¢n T¶ Sø th× gian tÕ kh«ng chØ ho¹t ®éng ë Quang Minh ®Ønh e r»ng ë tæng ®µ còng cã kh«ng İt.",
			"Kh«ng giÊu g× ng­¬i Minh gi¸o vµ NhÊt PhÈm ®­êng ®· tõng hîp t¸c, nh­ng ®ã ®· lµ qu¸ khø. Ta thÊy ng­êi cña NhÊt PhÈm ®­êng nhiÒu lÇn ra vµo Quang Minh ®Ønh, cã lÏ NhÊt PhÈm ®­êng ®· nghi ngê. Giê ta d¸m kh¼ng ®Şnh trong gi¸o cã Gian tÕ, kh«ng chØ ë Tæng ®µ mµ c¸c ®Ö tö trªn Quang Minh ®Ønh ®Òu cã gian tÕ Èn nÊp.",
			"Theo lêi ¢n T¶ Sø th× gian tÕ kh«ng chØ ho¹t ®éng ë Quang Minh ®Ønh e r»ng ë tæng ®µ còng cã kh«ng İt.",
			"Kh«ng sai, ta vµ ng­¬i võa gÆp nh­ ®· quen ®¸ng lÏ ph¶i uèng cho say nh­ng ta cßn ph¶i gi¸m s¸t viÖc trïng tu Quang Minh ®Ønh vµ trë vÒ tæng ®µ håi bµo tin tøc, ng­¬i cã thÓ gióp ta ®iÒu tra§Ö tö Minh gi¸o trªn Quang Minh ®Ønh xem cã manh mèi cña gian tÕ kh«ng.",
			"¢n T¶ Sø chí kh¸ch s¸o h·y ®îi tin tèt cña ta.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,708,10);
	RemoveTrigger(GetTrigger(KILL_XB_XIBEIYANHAN));
	SetTask(TASK_XB_ID_01,4);
	CreateTrigger(0,1227,KILL_XB_MINGJIAOJIANXI);--É±¹Ö´¥·¢Æ÷
	TaskTip("§iÒu tra gian tÕ Minh gi¸o xem cã tin tøc liªn quan ®Õn Si Háa gi¸o kh«ng.");
	Msg2Player("§iÒu tra gian tÕ Minh gi¸o xem cã tin tøc liªn quan ®Õn Si Háa gi¸o kh«ng.");
	GivePlayerAward("Award_XB_19","Easy");
	GivePlayerExp(SkeyXibei,"xibeiyanhan")
end

--´ø»Ø»òÎ´´ø»Øò¿»ğ½ÌÁîÅÆ
function task_010_02_0()

local strTalk = {};

	--´ø»Øò¿»ğ½ÌÁîÅÆ
	if GetItemCount(2,0,709) >= 1 then
		--Ã÷½ÌµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Kh«ng ngoµi dù ®o¸n cña ¢n T¶ Sø, n¬i nµy cã gian tÕ cña Si Háa gi¸o Èn nÊp, ®©y lµ LÖnh bµi ta t×m ®­îc.",
				"Ra lµ Si Háa gi¸o ®ang g©y chuyÖn, n¬i nµy c¸ch tæng ®µ rÊt xa mµ gian tÕ Si Háa gi¸o ®· lÎn vµo trong khi nh÷ng ng­êi chñ chèt trong gi¸o ch­a cã, e r»ng thùc lùc kh«ng ®ñ ®Ó ®èi phã khi gi¸o chóng t¹o ph¶n. NÕu Si Háa gi¸o xói giôc ®Ö tö t¹o ph¶n kh«ng nh÷ng sÏ ph¸ hñy Quang Minh ®Ønh cßn lµ ®¶ kİch cho bæn gi¸o, chuyÖn nµy thËt ®¸ng lo.",
				"C¸ch tèt nhÊt lµ tr­íc khi Si Háa gi¸o xói giôc ®Ö tö t¹o ph¶n th× ph¶i t×m ra tªn ph¶n ®å, ¢n T¶ Sø cã ph¸t hiÖn gÇn ®©y Quang Minh ®Ønh cã g× kh¸c th­êng?",
				"Ta ®· kh¼ng ®Şnh mét sè ®Ö tö cã ı t¹o ph¶n, ta cÇn æn ®Şnh lßng qu©n trong ph©n ®µ, ng­¬i h·y gióp ta t×m §Ö tö Minh gi¸o trªn Quang Minh ®Ønh vµ tiªu diÖt 30 tªn ®Ó ng¨n chÆn hµnh ®éng cña chóng, ta ®i b¾t tay vµo phßng bŞ.",
				"Thuéc h¹ tu©n lÖnh, ¢n T¶ Sø h·y mau ®i phßng bŞ.",
				}
		else
			strTalk = {
				"Kh«ng ngoµi dù ®o¸n cña ¢n T¶ Sø, n¬i nµy cã Gian tÕ cña Si Háa gi¸o Èn nÊp, ®©y lµ LÖnh bµi ta t×m ®­îc.",
				"Ra lµ Si Háa gi¸o ®ang g©y chuyÖn, n¬i nµy c¸ch tæng ®µ rÊt xa mµ gian tÕ Si Háa gi¸o ®· lÎn vµo trong khi nh÷ng ng­êi chñ chèt trong gi¸o ch­a cã, e r»ng thùc lùc kh«ng ®ñ ®Ó ®èi phã khi gi¸o chóng t¹o ph¶n. NÕu Si Háa gi¸o xói giôc ®Ö tö t¹o ph¶n kh«ng nh÷ng sÏ ph¸ hñy Quang Minh ®Ønh cßn lµ ®¶ kİch cho bæn gi¸o, chuyÖn nµy thËt ®¸ng lo.",
				"C¸ch tèt nhÊt lµ tr­íc khi Si Háa gi¸o xói giôc ®Ö tö t¹o ph¶n th× ph¶i t×m ra tªn ph¶n ®å, ¢n T¶ Sø cã ph¸t hiÖn gÇn ®©y Quang Minh ®Ønh cã g× kh¸c th­êng?",
				"Ta ®· kh¼ng ®Şnh mét sè ®Ö tö cã ı t¹o ph¶n, ta cÇn æn ®Şnh lßng qu©n trong ph©n ®µ, <sex> h·y gióp ta t×m §Ö tö Minh gi¸o trªn Quang Minh ®Ønh vµ tiªu diÖt 30 tªn ®Ó ng¨n chÆn hµnh ®éng cña chóng, ta ®i b¾t tay vµo phßng bŞ.",
				"Ra søc v× b¹n mµ sao kh¸ch khİ thÕ, ¢n T¶ Sø h·y mau ®i phßng bŞ.",
				}
		end
		DelItem(2,0,709,1);
		RemoveTrigger(GetTrigger(KILL_XB_MINGJIAOJIANXI));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,5);
		CreateTrigger(0,1228,KILL_XB_MINGJIAOPANTU);
		TaskTip("Tiªu diÖt 30 §Ö tö Minh gi¸o ®Ó ng¨n chÆn kÕ ho¹ch uy hiÕp Quang Minh ®Ønh.");
		Msg2Player("Tiªu diÖt 30 §Ö tö Minh gi¸o ®Ó ng¨n chÆn kÕ ho¹ch uy hiÕp Quang Minh ®Ønh.");
		GivePlayerAward("Award_XB_20","Easy");
		GivePlayerExp(SkeyXibei,"mingjiaojianxi")
	--Ã»ÓĞ´ø»ØÁîÅÆand²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"E lµ §Ö tö Minh gi¸o trªn Quang Minh ®Ønh cã gian tÕ, ta ®ang cã viÖc ng­¬i cã thÓ gióp ta diÒu tra kh«ng?",
			}
		if	GetTrigger(KILL_XB_MINGJIAOJIANXI) == 0 then
			CreateTrigger(0,1227,KILL_XB_MINGJIAOJIANXI);
			TaskTip("¢n T¶ Sø ®· hÕt c¸ch, nhê b¹n ®iÒu tra xem cã tin tøc cña gian tÕ Si Háa gi¸o trong Quang Minh ®Ønh.");
			Msg2Player("¢n T¶ Sø ®· hÕt c¸ch, nhê b¹n ®iÒu tra xem cã tin tøc cña gian tÕ Si Háa gi¸o trong Quang Minh ®Ønh.");
		end

		TalkEx("",strTalk);
	end
end

--»¹Î´É±ËÀ30ÅÑÍ½and²¹·¢´¥·¢Æ÷
function task_010_02_1()

local strTalk = {
	"Ta ®· kh¼ng ®Şnh mét sè ®Ö tö cã ı t¹o ph¶n, ta cÇn æn ®Şnh lßng qu©n trong ph©n ®µ, <sex> h·y gióp ta t×m §Ö tö Minh gi¸o trªn Quang Minh ®Ønh vµ tiªu diÖt 30 tªn ®Ó ng¨n chÆn hµnh ®éng cña chóng, ta ®i b¾t tay vµo phßng bŞ.",
	};

	if	GetTrigger(KILL_XB_MINGJIAOPANTU) == 0 then
			CreateTrigger(0,1228,KILL_XB_MINGJIAOPANTU);
			TaskTip("Tiªu diÖt 30 §Ö tö Minh gi¸o ®Ó ng¨n chÆn kÕ ho¹ch uy hiÕp Quang Minh ®Ønh.");
			Msg2Player("Tiªu diÖt 30 §Ö tö Minh gi¸o ®Ó ng¨n chÆn kÕ ho¹ch uy hiÕp Quang Minh ®Ønh.");
	end

	TalkEx("",strTalk);

end

--É±ÁËÉ±30ÅÑÍ½
function task_010_03_0()

local strTalk = {};

	--Ã÷½ÌµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ta ®· tiªu diÖt 30 §Ö tö Minh gi¸o, hµnh ®éng cña chóng v× thÕ mµ bŞ c¶n trë.",
			"Tèt råi, nh­ vËy ta cã nhiÒu thêi gian chiªu mé ng­êi tµi ®Ó tiªu diÖt sè ph¶n ®å cßn l¹i. Ng­¬i ®· lËp c«ng lín cho Minh gi¸o ta nhÊt ®Şnh sÏ b¸o l¹i víi tæng ®µ th­ëng cho ng­¬i.",
			"¢n T¶ Sø qu¸ lêi, ®õng tr¸ch thuéc h¹ nhiÒu chuyÖn, bæn gi¸o thiÕt lËp Ph©n ®µ ë mét n¬i hoang v¾ng nh­ thÕ sÏ bŞ ph©n t¸n lùc l­îng vµ dÔ bŞ kÎ thï ®¸nh lĞn, Minh gi¸o kh«ng sî tæn thÊt sao?",
			}
	else
		strTalk = {
			"Ta ®· tiªu diÖt 30 §Ö tö Minh gi¸o, hµnh ®éng cña chóng v× thÕ mµ bŞ c¶n trë.",
			"Tèt råi, nh­ vËy ta cã nhiÒu thêi gian chiªu mé ng­êi tµi ®Ó tiªu diÖt sè ph¶n ®å cßn l¹i. <sex> ®· lËp c«ng lín cho Minh gi¸o ta nhÊt ®Şnh sÏ b¸o l¹i víi tæng ®µ th­ëng cho ng­¬i.",
			"¢n T¶ Sø kh¸ch s¸o råi. Xin thø téi nhiÒu chuyÖn. Minh gi¸o thiÕt lËp Ph©n ®µ ë mét n¬i hoang v¾ng nh­ thÕ sÏ bŞ ph©n t¸n lùc l­îng vµ dÔ bŞ kÎ thï ®¸nh lĞn, Minh gi¸o kh«ng sî tæn thÊt sao?",
			}
	end

	TalkEx("task_010_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_010_03_0_1()

local strTalk = {}

	--Ã÷½ÌµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"¢u lo cña ng­¬i còng gièng nh­ cña ta. Nh­ng bæn gi¸o khã ®­îc trung nguyªn chÊp nhËn vµ thua xa kÎ ®Şch Si Háa gi¸o, néi bé trong gi¸o l¹i mÊt ®oµn kÕt nªn kh«ng thÓ kh«ng m¹o hiÓm lËp ph©n ®µ t¹i ®©y ®Ó b¶o toµn bé phËn lùc l­îng. Dï Minh gi¸o cã bŞ tÊn c«ng còng kh«ng ®Õn nçi mÊt hÕt lùc l­îng, kh«ng ngê tin tøc bŞ lé khiÕn kÎ ®Şch thõa c¬, sî r»ng c¸c ph¸i kh¸c l¹i nghi ngê.",
			"NÕu viÖc nµy m¹o hiÓm qu¸ lín th× sao ph¶i tiÕn hµnh? ChuyÖn gian tÕ ®· g©y nªn sãng giã nÕu v× hiÓu lÇm mµ tÊn c«ng th× lùc l­îng cña ta sÏ tæn thÊt nÆng nÒ.",
			"Ta còng biÕt viÖc nµy rÊt khã nh­ng l¹i cã lîi vÒ sau, bæn gi¸o kh«ng muèn xung ®ét víi c¸c ph¸i, nh­ng nÕu vâ l©m kh«ng cho phĞp th× Minh gi¸o sÏ kh«ng khoanh tay chŞu trãi mµ gi÷ v÷ng lËp tr­êng cña m×nh.",
			}
	else
		strTalk = {
			"¢u lo cña <sex> còng gièng nh­ cña ta. Nh­ng bæn gi¸o khã ®­îc trung nguyªn chÊp nhËn vµ thua xa kÎ ®Şch Si Háa gi¸o, néi bé trong gi¸o l¹i mÊt ®oµn kÕt nªn kh«ng thÓ kh«ng m¹o hiÓm lËp ph©n ®µ t¹i ®©y ®Ó b¶o toµn bé phËn lùc l­îng. Dï Minh gi¸o cã bŞ tÊn c«ng còng kh«ng ®Õn nçi mÊt hÕt lùc l­îng, kh«ng ngê tin tøc bŞ lé khiÕn kÎ ®Şch thõa c¬, sî r»ng c¸c ph¸i kh¸c l¹i nghi ngê.",
			"NÕu viÖc nµy m¹o hiÓm qu¸ lín th× sao ph¶i tiÕn hµnh? ChuyÖn gian tÕ ®· g©y nªn sãng giã nÕu v× hiÓu lÇm mµ tÊn c«ng th× lùc l­îng cña Minh gi¸o sÏ tæn thÊt nÆng nÒ.",
			"Ta còng biÕt viÖc nµy rÊt khã nh­ng l¹i cã lîi vÒ sau, bæn gi¸o kh«ng muèn xung ®ét víi c¸c ph¸i, nh­ng nÕu vâ l©m kh«ng cho phĞp th× Minh gi¸o sÏ kh«ng khoanh tay chŞu trãi mµ gi÷ v÷ng lËp tr­êng cña m×nh.",
			}
	end

	TalkEx("task_010_03_0_2",strTalk);

end

--Ğø¶Ô»°
function task_010_03_0_2()

local strTalk = {}

	--Ã÷½ÌµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ra lµ thÕ, tÊt c¶ ®Òu t¹i vâ l©m cã thµnh kiÕn qu¸ s©u víi ch¸nh tµ khiÕn cho mét sè m«n ph¸i ®i khái trung nguyªn, ®óng lµ tù chuèc lÊy khæ.",
			"LÇn nµy ng­¬i lËp ®­îc c«ng lín, cøu bæn gi¸o tho¸t khái nguy hiÓm, khi nµo r¶nh ta sÏ uèng víi ng­¬i.",
			"§a t¹, kh«ng quÊy rÇy ¢n T¶ Sø lµm viÖc, sau nµy ta sÏ mang r­îu nho Ba T­ ®Õn th¨m viÕng.",
			"(Th× ra Minh gi¸o gÇy dùng c¬ ®å ë Quang Minh ®Ønh v× nguyªn do nµy, trë vÒ t×m Th¸c B¹t Ho»ng  ®Ó th«ng b¸o t×nh h×nh.)",
			}
	else
		strTalk = {
			"Ra lµ thÕ, tÊt c¶ ®Òu t¹i vâ l©m cã thµnh kiÕn qu¸ s©u víi ch¸nh tµ khiÕn cho mét sè m«n ph¸i ®i khái trung nguyªn, ®óng lµ tù chuèc lÊy khæ. Quen ®­îc ¢n T¶ Sø ®óng lµ vinh h¹nh.",
			"Sao kh¸ch sao thÕ? ¢n Minh thay mÆt Minh gi¸o ®a t¹ <sex> ra tay gióp ®ì Minh gi¸o tho¸t khái nguy hiÓm, khi nµo r¶nh ta sÏ uèng víi ng­¬i.",
			"Ta còng cã ı ®ã, kh«ng quÊy rÇy ¢n T¶ Sø lµm viÖc, sau nµy ta sÏ mang R­îu nho Ba T­ ®Õn th¨m viÕng.",
			"(Th× ra Minh gi¸o gÇy dùng c¬ ®å ë Quang Minh ®Ønh v× nguyªn do nµy, trë vÒ t×m Th¸c B¹t Ho»ng  ®Ó th«ng b¸o t×nh h×nh.)",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,7);
	TaskTip("VÒ gÆp Th¸c B¹t Ho»ng b¸o c¸o t×nh h×nh vÒ Minh gi¸o.");
	Msg2Player("VÒ gÆp Th¸c B¹t Ho»ng b¸o c¸o t×nh h×nh vÒ Minh gi¸o.");
	GivePlayerAward("Award_XB_21","Easy");
	GivePlayerExp(SkeyXibei,"mingjiaopanduan")
end

--ÉĞÎ´ÓëÍØ°Îºë¶Ô»°
function task_010_03_1()

local strTalk = {};

	if GetPlayerRoute() == 100 then
		strTalk = {
			"LÇn nµy ng­¬i lËp ®­îc c«ng lín, cøu bæn gi¸o tho¸t khái nguy hiÓm, khi nµo r¶nh ta sÏ uèng víi ng­¬i.",
			"§a t¹, kh«ng quÊy rÇy ¢n T¶ Sø lµm viÖc, sau nµy ta sÏ mang r­îu nho Ba T­ ®Õn th¨m viÕng.",
			"(Th× ra Minh gi¸o gÇy dùng c¬ ®å ë Quang Minh ®Ønh v× nguyªn do nµy, trë vÒ t×m Th¸c B¹t Ho»ng  ®Ó th«ng b¸o t×nh h×nh.)",
			}
	else
		strTalk = {
			"¢n Minh thay mÆt Minh gi¸o ®a t¹ <sex> ra tay gióp ®ì Minh gi¸o tho¸t khái nguy hiÓm, khi nµo r¶nh ta sÏ uèng víi ng­¬i.",
			"Ta còng cã ı ®ã, kh«ng quÊy rÇy ¢n T¶ Sø lµm viÖc, sau nµy ta sÏ mang R­îu nho Ba T­ ®Õn th¨m viÕng.",
			"(Th× ra Minh gi¸o gÇy dùng c¬ ®å ë Quang Minh ®Ønh v× nguyªn do nµy, trë vÒ t×m Th¸c B¹t Ho»ng  ®Ó th«ng b¸o t×nh h×nh.)",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø11·ÖÖ§1_3µÛÍõÖ®Ä¹----------------------------------
--Ã÷½ÌÒ»ÊÂ½áÊøºóÓëÍØ°Îºë¶Ô»°
function task_011_01_0()

local strTalk = {
	"<sex>, chuyÕn ®i Quang Minh ®Ønh cã thu ho¹ch kh«ng?",
	"Kh«ng phô lßng tin cña tiÒn bèi, chuyÖn Minh gi¸o gÇy dùng c¬ ®å t¹i Quang Minh ®Ønh chØ ®Ó tù vÖ. V× kh«ng ®­îc vâ l©m trung nguyªn tiÕp nhËn nªn VŞ Vò Trï MËu míi lËp ph©n ®µ ®Ó gi÷ lùc l­îng chø kh«ng cã m­u ®å vµ cµng kh«ng dİnh lİu ®Õn NhÊt PhÈm ®­êng.",
	"Tèt, nh­ thÕ chuyÖn cña Minh gi¸o xem nh­ kÕt thóc. Ng­¬i cã thÓ ®Õn b¸o cho Xa Lu©n B¸ V­¬ng . Ta còng rót khái chuyÖn nµy ®Ó chuÈn bŞ cuéc chiÕn víi T­ M· Minh Phong. B¶n lÜnh cña ng­¬i còng kh«ng tåi, ®îi sau khi ta ph©n cao thÊp víi T­ M· Minh Phong nhÊt ®Şnh sÏ so tµi víi ng­¬i.",
	"B¶n lÜnh cña ta sau s¸nh ®­îc víi tiÒn bèi? Ta ®i t×m Xa Lu©n B¸ V­¬ng  b¸o c¸o viÖc nµy. C¸o tõ!",
	}

	SetTask(TASK_XB_ID_01,8);
	TalkEx("",strTalk);
	TaskTip("B¸o víi Xa Lu©n B¸ V­¬ng chuyÖn liªn quan ®Õn Minh gi¸o");
	Msg2Player("B¸o víi Xa Lu©n B¸ V­¬ng chuyÖn liªn quan ®Õn Minh gi¸o");
	GivePlayerAward("Award_XB_22","Easy");
	GivePlayerExp(SkeyXibei,"qianyinhouguo")
end

--»¹Ã»¼û³µÂÖ°ÔÍõÓëÍØ°Îºë¶Ô»°
function task_011_01_1()

local strTalk = {
	"NÕu ng­¬i ®· t×m ra ch©n t­íng th× trùc tiÕp b¸o cho Xa Lu©n B¸ V­¬ng . Ta còng rót khái chuyÖn nµy ®Ó chuÈn bŞ cuéc chiÕn víi T­ M· Minh Phong.",
	}

	TalkEx("",strTalk);

end

--Óë³µÂÖ°ÔÍõ¶Ô»°
function task_011_02_0()

local strTalk = {
	"Ng­¬i cã gÆp Th¸c B¹t Ho»ng kh«ng? ViÖc Minh gi¸o gÇy dùng c¬ ®å t¹i Quang Minh ®Ønh cã manh mèi råi ch¨ng??",
	"Ta ®· gÆp tiÒn bèi Th¸c B¹t Ho»ng, chuyÖn Quang Minh ®Ønh ®· ®iÒu tra râ. Th× ra Minh gi¸o vµ ®Ö tö bŞ vâ l©m tÈy chay, l¹i kÕt o¸n víi Si Háa gi¸o, Minh gi¸o thÊy chuyÖn ch¼ng lµnh nªn VŞ Vò Trï MËu ®· lËp Ph©n ®µ t¹i Quang Minh ®Ønh ®Ó b¶o vÖ lùc l­îng, kh«ng cã ı ®Şnh ®èi phã NhÊt PhÈm ®­êng.",
	"Th× ra lµ vËy, mËt th¸m còng ®· håi b¸o Minh gi¸o kh«ng cã hµnh ®éng x©m ph¹m NhÊt PhÈm ®­êng. Nh­ thÕ còng tèt cã thÓ g¸c l¹i chuyÖn ®èi phã Minh gi¸o. Tin nµy ph¶i Th¸c B¹t Ho»ng nãi ng­¬i biÕt kh«ng?",
	"Lµ Th¸c B¹t tiÒn bèi sai ta ®Õn Quang Minh ®Ønh ®iÒu tra sù thËt. ¤ng ta hiÖn giê ë Phông T­êng  bËn ®èi phã víi T­ M· Minh Phong.",
	}

	TalkEx("task_011_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_011_02_0_1()

local strTalk = {
	"Qu¶ kh«ng sai, h¾n lµm sao hoµn thµnh nhiÖm vô nhanh thÕ ®­îc. Tªn T­ M· Minh Phong tiªu diÖt hay kh«ng còng thÕ th«i, sao Th¸c B¹t Ho»ng  l¹i g©y thªm r¾c rèi lµm tèn thêi gian. Th¸c B¹t Ho»ng û cã Lı Nguyªn Kh¸nh ®¹i nh©n lµm hËu thuÉn mµ xem nhÑ nhiÖm vô, ch¾c l¹i bŞ T­ M· Minh Phong hót lÊy råi. Ng­êi nµy ch¼ng ®­îc tİch sù g× c¶ nh­ng Lı ®¹i nh©n l¹i kh«ng nghe lêi khuyªn cña ta. Ng­¬i võa gia nhËp ®· lËp c«ng lín t­¬ng lai sÏ rÊt s¸ng l¹n.",
	"Lµm viÖc cho NhÊt PhÈm ®­êng lµ bæn phËn cña ta, nhÊt ®Şnh ph¶i hoµn thµnh nhiÖm vô ®­îc giao.",
	"NÕu ng­¬i hÕt lßng lµm viÖc sau nµy NhÊt PhÈm ®­êng sÏ cã thÓ h« giã gäi m­a. Thùc ra Phi Hé cña ta ®ang phô tr¸ch mét chuyÖn c¬ mËt nh­ng tiÕn triÓn kh«ng thuËn lîi. B¶n lÜnh cña ng­¬i giái vµ lµm viÖc cÈn thËn vËy, ta sÏ th¨ng chøc ng­¬i lµ NhÊt PhÈm ®­êng Phi Hé ®Ó ®iÒu tra viÖc nµy, cã gan thö kh«ng?",
	"Cø viÖc dÆn dß, sao l¹i cã chuyÖn kh«ng d¸m thö.",
	}

	TalkEx("task_011_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_011_02_0_2()

local strTalk = {
	"Phİa §«ng cña B¾c Phông T­êng lµ TÇn L¨ng n¬i ch«n cÊt cña TÇn Thñy Hoµng. Tr­íc ®©y «ng ta x­ng b¸ thiªn h¹, t­¬ng truyÒn trong mé cã Kho b¸u nªn ®· g©y sù chó ı cña Ng­êi trém mé, trªn ng­êi hä cã mang 1 lo¹i vËt phÈm lµ MÆt n¹ t¬ vµng. Ng­¬i h·y t×m c¸ch mang vÒ 10 mÆt n¹ t¬ vµng, ta sÏ s¾p xÕp hµnh ®éng tiÕp theo. ViÖc nµy v« cïng quan träng, ng­¬i chí nªn hái nhiÒu vµ còng ®õng tiÕt lé ra ngoµi, ®i råi vÒ mau.",
	"Ta biÕt nªn lµm g× råi, ng­¬i h·y ®îi tin tèt cña ta.",
	"(Xem ra NhÊt PhÈm ®­êng l¹i cã ©m m­u, nh­ng kh«ng biÕt liªn quan g× ®Õn TÇn L¨ng, chi b»ng vÒ hái ¢u D­¬ng tiÒn bèi thö xem.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,9);
	TaskTip("ThØnh gi¸o ¢u D­¬ng Häa chuyÖn liªn quan ®Õn TÇn L¨ng.");
	Msg2Player("ThØnh gi¸o ¢u D­¬ng Häa chuyÖn liªn quan ®Õn TÇn L¨ng.");
	add_xb_title(3);--»ñµÃÒ»Æ·ÌÃ·É»¤³ÆºÅ
end



--»¹Ã»ÓëÅ·Ñô»­¶Ô»°
function task_011_02_1()

local strTalk = {
	"Phİa §«ng cña B¾c Phông T­êng lµ TÇn L¨ng n¬i ch«n cÊt cña TÇn Thñy Hoµng. Tr­íc ®©y «ng ta x­ng b¸ thiªn h¹, t­¬ng truyÒn trong mé cã Kho b¸u nªn ®· g©y sù chó ı cña Ng­êi trém mé, trªn ng­êi hä cã mang 1 lo¹i vËt phÈm lµ MÆt n¹ t¬ vµng. Ng­¬i h·y t×m c¸ch mang vÒ 10 mÆt n¹ t¬ vµng, ta sÏ s¾p xÕp hµnh ®éng tiÕp theo. ",
	"(Xem ra NhÊt PhÈm ®­êng l¹i cã ©m m­u, nh­ng kh«ng biÕt liªn quan g× ®Õn TÇn L¨ng, chi b»ng vÒ hái ¢u D­¬ng tiÒn bèi thö xem.)",
	}

	TalkEx("",strTalk);

end

--ÓëÅ·Ñô»­¶Ô»°Ç°Íù»ÊÁêÍâ½ØÉ±Ò»Æ·ÌÃ°µÉ±Ê¹
function task_011_03_0()

local strTalk = {
	"§· l©u kh«ng gÆp ¢u D­¬ng tiÒn bèi vÉn kháe chø? HËu bèi cã viÖc muèn hái.",
	"Sau lÇn tr­íc chia ly, ta lu«n lo cho sù an nguy cña ng­¬i, nay thÊy ng­¬i an toµn trë l¹i ®©y ta míi yªn lßng. <sex> cã viÖc g× cø nãi.",
	"TiÒn bèi ®õng lo, ta lu«n cÈn thËn khi lµm viÖc. TiÒn bèi ®· nghe qua Kho b¸u trong TÇn L¨ng? Xa Lu©n B¸ V­¬ng  sai ta ®i thu thËp MÆt n¹ t¬ vµng.",
	"Th× ra liªn quan ®Õn TÇn L¨ng, ta ®· sím biÕt NhÊt PhÈm ®­êng sÏ kh«ng dÔ dµng bá qua chuyÖn nµy, xem ra NhÊt PhÈm ®­êng ®· bİ mËt hµnh ®éng, Th¸m tö mµ chóng ta ph¸i ®i th¨m dß TÇn L¨ng ®· mÊt tİch, e r»ng do chóng ®· ph¸ råi. Nh­ng MÆt n¹ t¬ vµng th× ta ch­a tõng nghe qua, nã cã t¸c dông g×.",
	}

	TalkEx("task_011_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_011_03_0_1()

local strTalk = {
	"Xa Lu©n B¸ V­¬ngnãi chóng cã 1 hµnh ®éng c¬ mËt ®· triÓn khai ë TÇn L¨ng, rèt cuéc lµ chuyÖn g× ®©y?",
	"NhÊt PhÈm ®­êng ®· hµnh ®éng råi? <sex> cã biÕt TÇn L¨ng lµ n¬i cÊt gi÷ bİ mËt vÒ B¶n ®å S¬n Hµ X· T¾c? HÌn chi th¸m tö ®Òu mÊt tİch, NhÊt PhÈm ®­êng sî bŞ hít tay trªn. nÕu ®Ó NhÊt PhÈm ®­êng cã ®­îc B¶n ®å S¬n Hµ X· T¾c th× thiªn h¹ sÏ gÆp n¹n chuyÖn nµy v« cïng quan träng. NÕu NhÊt PhÈm ®­êng sím cã hµnh ®éng th× e r»ng th¸m tö bŞ ¸m s¸t bëi ¸m s¸t Sø cña NhÊt PhÈm ®­êng, ng­¬i h·y ®i TÇn L¨ng ®iÒu tra hµnh tung ¸m s¸t Sø cña NhÊt PhÈm ®­êng xem sao.",
	"Kh«ng ngê bİ mËt l¹i lµ B¶n ®å S¬n Hµ X· T¾c, nÕu bŞ NhÊt PhÈm ®­êng lÊy ®­îc th× nguy to. Ta sÏ ®Õn TÇn L¨ng mét chuyÕn.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,10);
	CreateTrigger(0,1229,KILL_XB_YIPINTANGANSHASHI);--É±¹Ö´¥·¢Æ÷
	TaskTip("§Õn Hoµng l¨ng tiªu diÖt ¸m s¸t Sø cña NhÊt PhÈm ®­êng.");
	Msg2Player("§Õn Hoµng l¨ng tiªu diÖt ¸m s¸t Sø cña NhÊt PhÈm ®­êng.");
	GivePlayerAward("Award_XB_23","Easy");
	GivePlayerExp(SkeyXibei,"huangling")
end

--»¹Î´É±ËÀ30°µÉ±Ê¹and²¹·¢´¥·¢Æ÷
function task_011_03_1()

local strTalk = {
	"NÕu NhÊt PhÈm ®­êng sím cã hµnh ®éng th× e r»ng th¸m tö bŞ ¸m s¸t bëi ¸m s¸t Sø cña NhÊt PhÈm ®­êng, ng­¬i h·y ®i TÇn L¨ng ®iÒu tra hµnh tung ¸m s¸t Sø cña NhÊt PhÈm ®­êng xem sao.",
	};

	if	GetTrigger(KILL_XB_YIPINTANGANSHASHI) == 0 then
			CreateTrigger(0,1229,KILL_XB_YIPINTANGANSHASHI);
			TaskTip("§Õn Hoµng l¨ng tiªu diÖt ¸m s¸t Sø cña NhÊt PhÈm ®­êng.");
			Msg2Player("§Õn Hoµng l¨ng tiªu diÖt ¸m s¸t Sø cña NhÊt PhÈm ®­êng.");
	end

	TalkEx("",strTalk);

end

--ÒÑ¾­É±ËÀ30¸öÒ»Æ·ÌÃ°µÉ±Ê¹²¢»ñµÃ´óËÎÃÜº¯ÓëÅ·Ñô»°¶Ô»°
function task_011_04_0()

local strTalk = {
	"Xung quanh TÇn L¨ng ®Òu lµ ¸m s¸t Sø cña NhÊt PhÈm ®­êng, t×m ®­îc Th­ hµm mËt th¸m §¹i Tèng trªn ng­êi chóng.",
	"Thñ ®o¹n cña NhÊt PhÈm ®­êng qu¶ lµ ®éc ¸c, mËt th¸m cña ta e lµ lµnh İt d÷ nhiÒu. Trong Th­ hµm nµy nãi NhÊt PhÈm ®­êng ®· n¾m ®­îc manh mèi cña B¶n ®å S¬n Hµ X· T¾c trong l¨ng, trong l¨ng khãi ®éc mï mŞt cÇn cã MÆt n¹ t¬ vµng ®Ó phßng tr¸nh, v¶ l¹i trong l¨ng cã T­îng binh m· biÕt di chuyÓn. Ch¼ng lÏ ®ã lµ søc m¹nh cña B¶n ®å S¬n Hµ X· T¾c?",
	"NÕu thÕ th× ®óng lµ trong TÇn L¨ng cã B¶n ®å S¬n Hµ X· T¾c, hay lµ ta vµo trong ®ã dß la xem sao?",
	"L¨ng mé thêi x­a C¬ quan trïng trïng huèng chi ®©y lµ linh cöu cña Hoµng ®Õ, ®ét nhËp vµo mé ®©u ph¶i chuyÖn dÔ. Hay lµ ta ®i hái Cao nh©n ®µo trém mé, ng­¬i h·y ®i lµm viÖc do Xa Lu©n B¸ V­¬ng  giao cho, lÊy MÆt n¹ t¬ vµng ®Ó dïng khi vµo mé nh­ng chí cã lÊy nhiÒu tr¸nh cho chóng nghi ngê. NhiÖm vô ng¨n chÆn NhÊt PhÈm ®­êng ®o¹t B¶n ®å S¬n Hµ X· T¾c giao cho <sex>, vÊt v¶ cho ng­¬i råi.",
	"TiÒn bèi kh¸ch khİ thÕ. Ta ®Õn TÇn L¨ng t×m 10 MÆt n¹ t¬ vµng ®Ó th¨m dß hµnh ®éng tiÕp theo cña Xa Lu©n B¸ V­¬ng  ®©y.",
	}

	DelItem(2,0,711,1);--É¾È¥´óËÎÃÜÌ½Êéº¯
	SetTask(TASK_XB_ID_01,12);
	TalkEx("",strTalk);
	CreateTrigger(0,1230,KILL_XB_DAOMUREN);--µÁÄ¹ÈËÉ±¹Ö´¥·¢Æ÷
	TaskTip("§Õn TÇn L¨ng tiªu diÖt ng­êi trém mé ®Ó thu thËp 10 MÆt n¹ t¬ vµng.");
	Msg2Player("§Õn TÇn L¨ng tiªu diÖt ng­êi trém mé ®Ó thu thËp 10 MÆt n¹ t¬ vµng.");
	GivePlayerAward("Award_XB_24","Easy");
	GivePlayerExp(SkeyXibei,"daomu")
end

--»¹Ã»È¡µÃ10¸ö½ğË¿ÃæÕÖÓëÅ·Ñô»­¶Ô»°and²¹·¢´¥·¢Æ÷
function task_011_04_1()

local strTalk = {
	"L¨ng mé thêi x­a C¬ quan trïng trïng huèng chi ®©y lµ linh cöu cña Hoµng ®Õ, ®ét nhËp vµo mé ®©u ph¶i chuyÖn dÔ. Hay lµ ta ®i hái Cao nh©n ®µo trém mé, ng­¬i h·y ®i lµm viÖc do Xa Lu©n B¸ V­¬ng  giao cho, lÊy MÆt n¹ t¬ vµng ®Ó dïng khi vµo mé.",
	}

	TalkEx("",strTalk);

	if GetTrigger(KILL_XB_DAOMUREN) == 0 then
		CreateTrigger(0,1230,KILL_XB_DAOMUREN);--µÁÄ¹ÈËÉ±¹Ö´¥·¢Æ÷
		TaskTip("§Õn TÇn L¨ng tiªu diÖt ng­êi trém mé ®Ó thu thËp 10 MÆt n¹ t¬ vµng.");
		Msg2Player("§Õn TÇn L¨ng tiªu diÖt ng­êi trém mé ®Ó thu thËp 10 MÆt n¹ t¬ vµng.");
	end

end

---------------------------------- Î÷±±Çø12·ÖÖ§1_4¶Ï±Û²ĞÍÈ----------------------------------

--ÒÑÈ¡µÃ10¸ö½ğË¿ÃæÕÖ½»¸ø³µÂÖ°ÔÍõ
function task_012_01_0()

local strTalk = {};

	--ÒÑÈ¡µÃ10¸ö½ğË¿ÃæÕÖ
	if GetItemCount(2,0,710) >= 10 then
		DelItem(2,0,710,8);
		strTalk = {
			"§©y lµ 10 MÆt n¹ t¬ vµng, b­íc tiÕp theo lµ g× nµo.",
			"RÊt tèt. Theo th¸m tö håi b¸o trong l¨ng mé trµn ®Çy khİ ®éc, MÆt n¹ t¬ vµng nµy dïng khi vµo trong mé. Trong mé qu¸ nguy hiÓm nªn ph¶i giao cho §o¹n Tóy vµ Tµn Tho¸i trong sè ThËp ®¹i Kim Cang ®i lµm, ng­¬i h·y quay l¹i TÇn L¨ng ®em 2 MÆt n¹ t¬ vµng cho chóng, chóng ®· ®îi ngoµi l¨ng mé råi.",
			"Tu©n lÖnh!",
			"(NÕu nh­ ThËp ®¹i Kim Cang vµo mé th× nhÊt ®Şnh lÊy ®­îc b¶n ®å.B¶n ®å S¬n Hµ X· T¾c liªn quan sù an nguy cña thiªn h¹ nÕu r¬i vµo tay NhÊt PhÈm ®­êng th× sÏ h¹i n­íc h¹i d©n. Chi b»ng ®¸nh lõa §o¹n Tóy Tµn Tho¸i råi tiªu diÖt chóng. ThËp ®¹i Kim Cang bít ®i 1 ng­êi sÏ yÕu ®i phÇn nµo.)",
			"(Nh­ thÕ sÏ dÉn ®Õn sù nghi ngê cña Xa Lu©n B¸ V­¬ng, hay lµ nãi r»ng chóng kh«ng chŞu ®eo MÆt n¹ t¬ vµng vµo mé nªn bŞ tróng ®éc, nãi kho¸c r»ng khİ ®éc trong mé vÉn cßn hõng hùc nªn dêi l¹i thêi h¹n vµo mé.)",
			};
		TalkEx("",strTalk);
		RemoveTrigger(GetTrigger(KILL_XB_DAOMUREN));
		SetTask(TASK_XB_ID_01,13);
		--Çå³ıÏÈÇ°ÓÃµÄ±äÁ¿
		SetTask(DUANBI_DEAD_STATE,0);
		SetTask(CANTUI_DEAD_STATE,0);
		TaskTip("Tiªu diÖt §o¹n Tóy vµ Tµn Tho¸i bªn ngoµi Hoµng l¨ng.");
		Msg2Player("Tiªu diÖt §o¹n Tóy vµ Tµn Tho¸i bªn ngoµi Hoµng l¨ng.");
		GivePlayerAward("Award_XB_25","Easy");
		GivePlayerExp(SkeyXibei,"jinsimianzhao")
	else
		strTalk = {
			"Phİa §«ng cña B¾c Phông T­êng lµ TÇn L¨ng n¬i ch«n cÊt cña TÇn Thñy Hoµng. Tr­íc ®©y «ng ta x­ng b¸ thiªn h¹, t­¬ng truyÒn trong mé cã Kho b¸u nªn ®· g©y sù chó ı cña Ng­êi trém mé, trªn ng­êi hä cã mang 1 lo¹i vËt phÈm lµ MÆt n¹ t¬ vµng. Ng­¬i h·y t×m c¸ch mang vÒ 10 mÆt n¹ t¬ vµng, ta sÏ s¾p xÕp hµnh ®éng tiÕp theo. ",
			};
		TalkEx("",strTalk);
	end

end

--»¹Ã»É±ËÀ¶Ï±Û²ĞÍÈÓë³µÂÖ°ÔÍõ¶Ô»°and²¹·¢½ğË¿ÃæÕÖ
function task_012_02_1()

local strTalk = {
	"MÆt n¹ t¬ vµng dïng khi ®i vµo mé. Ng­¬i ®em 2 MÆt n¹ t¬ vµng ®Õn TÇn L¨ng giao cho §o¹n Tóy vµ Tµn Tho¸i, chóng ®· ®îi ë ngoµi mé.",
	"(NÕu nh­ ThËp ®¹i Kim Cang vµo mé th× nhÊt ®Şnh lÊy ®­îc b¶n ®å.B¶n ®å S¬n Hµ X· T¾c liªn quan sù an nguy cña thiªn h¹ nÕu r¬i vµo tay NhÊt PhÈm ®­êng th× sÏ h¹i n­íc h¹i d©n. Chi b»ng ®¸nh lõa §o¹n Tóy Tµn Tho¸i råi tiªu diÖt chóng. ThËp ®¹i Kim Cang bít ®i 1 ng­êi sÏ yÕu ®i phÇn nµo.)",
	"(Nh­ thÕ sÏ dÉn ®Õn sù nghi ngê cña Xa Lu©n B¸ V­¬ng, hay lµ nãi r»ng chóng kh«ng chŞu ®eo MÆt n¹ t¬ vµng vµo mé nªn bŞ tróng ®éc, nãi kho¸c r»ng khİ ®éc trong mé vÉn cßn hõng hùc nªn dêi l¹i thêi h¹n vµo mé.)",
	};

	if GetItemCount(2,0,710) < 2 then
		AddItem(2,0,710,2,1);
		TalkEx("",strTalk);
		TaskTip("Tiªu diÖt §o¹n Tóy vµ Tµn Tho¸i bªn ngoµi Hoµng l¨ng.");
		Msg2Player("Tiªu diÖt §o¹n Tóy vµ Tµn Tho¸i bªn ngoµi Hoµng l¨ng.");
	end

	TalkEx("",strTalk);

end

--ÒÑ¾­É±ËÀ¶Ï±Û²ĞÍÈÓë³µÂÖ°ÔÍõ¶Ô»°
function task_012_03_0()

local strTalk = {
	"Kh«ng xong råi, §o¹n Tóy vµ Tµn Tho¸i ®Òu mÊt m¹ng. Sù viÖc qu¸ bÊt ngê ta chØ t×m ®­îc NhÊt PhÈm Kim Cang LÖnh trªn ng­êi chóng vÒ phôc mÖnh.",
	"§· x¶y ra chuyÖn g× vËy? Víi b¶n lÜnh cña §o¹n Tóy Tµn Tho¸i sao l¹i cã thÓ cïng nhau bá m¹ng? Ng­¬i h·y nãi râ h¬n ng­êi nµo ®· ra tay?",
	"Ta theo lêi dÆn cña «ng ®em MÆt n¹ t¬ vµng ®Õn tr­íc l¨ng mé giao cho hä nh­ng lóc ®Õn n¬i ®· kh«ng thÊy hä. Nh­ng l¹i nghe thÊy tiÕng c·i nhau tõ bªn trong mé, nãi lµ Xa Lu©n qu¸ cÈn thËn råi, cã khİ ®éc g× ®©u? Vâ c«ng cña ng­¬i thua ta xa h·y ngoan ngo·n ë ®©y ®îi MÆt n¹ t¬ vµng ®i. cßn nãi lµ Ng­¬i muèn vµo mé giµnh b¸u vËt tr­íc ta sao? §õng hßng, mÆt n¹ ®ã lµ Xa Lu©n chuÈn bŞ cho ng­¬i ®ã.",
	}

	TalkEx("task_012_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_012_03_0_1()

local strTalk = {
	"Sao? Chóng kh«ng ®eo mÆt n¹ mµ vµo mé? §¸ng chÕt, ta ®· dÆn lµ ph¶i ®eo mÆt n¹ míi vµo mé kh«ng ngê chóng vÉn chøng nµo tËt nÊy, anh em víi nhau mµ tranh c«ng ®o¹t lîi. Kim Cang LÖnh lµ tİn vËt tïy th©n cña ThËp ®¹i Kim Cang, chóng ®· bá m¹ng trong mé ra sao?",
	"§óng thÕ, ta ë ngoµi nghe thÊy v« cïng sèt ruét nh­ng kh«ng d¸m vµo trong, nghÜ r»ng §o¹n Tóy Tµn Tho¸i lµ ThËp ®¹i Kim Cang cã thÓ trë ra an toµn. Sau mét håi vÉn ch­a thÊy ai trë ra, ta ®· ®eo mÆt n¹ vµo trong mé xem thö chØ thÊy x¸c cña chóng ngoµi ra kh«ng thÊy ai kh¸c, s¾c mÆt t¸i ®en e lµ do tróng ®éc mµ chÕt.",
	"Mé §Õ V­¬ng khİ ®éc mï mŞt, ngay c¶ ThËp ®¹i Kim Cang còng kh«ng tr¸nh khái. Xem ra chuyÖn vµo mé ph¶i suy tİnh l¹i, giê chØ cã thÓ giao viÖc nµy cho Th¸c B¹t Ho»ng. Ng­¬i h·y ®i xem h¾n ®Êu vâ xong ch­a sau ®ã nãi râ mäi viÖc råi ®­a MÆt n¹ t¬ vµng cho h¾n ®Ó s¾p xÕp viÖc vµo mé.",
	}

	TalkEx("task_012_03_0_2",strTalk);

end

--Ğø¶Ô»°
function task_012_03_0_2()

local strTalk = {
	"LÇn nµy ta kh«ng lµm trßn bæn phËn, cã thÓ ®Ó ta vµo mé ®iÒu tra ®Ó lÊy c«ng chuéc téi kh«ng? Ta nhÊt ®Şnh cè g¾ng hÕt søc ®Ó hoµn thµnh nhiÖm vô.",
	"Ng­¬i chí co tù tr¸ch m×nh, chØ t¹i §o¹n Tóy Tµn Tho¸i kh«ng nghe lêi khuyªn nªn tù r­íc häa vµo th©n. Ta biÕt ng­¬i nãng lßng muèn lËp c«ng nh­ng ThËp ®¹i Kim Cang võa mÊt ®i 2 ng­êi, t×nh h×nh trong mé l¹i kh«ng râ tèt nhÊt ng­¬i kh«ng nªn manh ®éng, h·y ®Ó viÖc nµo cho Th¸c B¹t Ho»ng.",
	"Tèt nhÊt nªn cÈn thËn hµnh sù, ta ®i t×m Th¸c B¹t Ho»ng tiÒn bèi ®©y. C¸o tõ.",
	"Tªn nµy qu¶ lµ cÈn träng, bÒ ngoµi ®èi cö ch©n thµnh víi ta thùc chÊt cßn nghi ngê th©n phËn ng­êi Tèng. ViÖc nµy kh¼ng ®Şnh? (NhÊt PhÈm ®­êng ®· n¾m ®­îc bİ mËt cña B¶n ®å S¬n Hµ X· T¾c ta ph¶i t×m c¸ch ng¨n c¶n.)",
	}

	TalkEx("task_012_03_0_3",strTalk);

end

--·¢½±Àø
function task_012_03_0_3()

	give_zb_award(26);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,750,1);--É¾È¥Ò»Æ·½ğ¸ÕÁîÖ®¶Ï±Û
		DelItem(2,0,751,1);--É¾È¥Ò»Æ·½ğ¸ÕÁîÖ®²ĞÍÈ
		SetTask(TASK_XB_ID_01,15);
		--²¹·¢½ğË¿ÃæÕÖ
		if GetItemCount(2,0,710) < 2 then
			AddItem(2,0,710,2,1);
		end
		TaskTip("Giao MÆt n¹ t¬ vµng giao Th¸c B¹t Ho»ng.");
		Msg2Player("Giao MÆt n¹ t¬ vµng giao Th¸c B¹t Ho»ng.");
		GivePlayerAward("Award_XB_26","Easy");
		GivePlayerExp(SkeyXibei,"huanglingwai")
	end
end

--»¹Ã»Ç°ÍùÓëÍØ°Îºë¶Ô»°
function task_012_03_1()

local strTalk = {
	"Ng­¬i chí co tù tr¸ch m×nh, chØ t¹i §o¹n Tóy Tµn Tho¸i kh«ng nghe lêi khuyªn nªn tù r­íc häa vµo th©n. Ta biÕt ng­¬i nãng lßng muèn lËp c«ng nh­ng ThËp ®¹i Kim Cang võa mÊt ®i 2 ng­êi, t×nh h×nh trong mé l¹i kh«ng râ tèt nhÊt ng­¬i kh«ng nªn manh ®éng, h·y ®Ó viÖc nµo cho Th¸c B¹t Ho»ng.",
	"Tèt nhÊt nªn cÈn thËn hµnh sù, ta ®i t×m Th¸c B¹t Ho»ng tiÒn bèi ®©y. C¸o tõ.",
	"Tªn nµy qu¶ lµ cÈn träng, bÒ ngoµi ®èi cö ch©n thµnh víi ta thùc chÊt cßn nghi ngê th©n phËn ng­êi Tèng. ViÖc nµy kh¼ng ®Şnh? (NhÊt PhÈm ®­êng ®· n¾m ®­îc bİ mËt cña B¶n ®å S¬n Hµ X· T¾c ta ph¶i t×m c¸ch ng¨n c¶n.)",
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø13·ÖÖ§1_5Òô¾ø¹ÅÄ¹----------------------------------

--ÓëÍØ°Îºë¶Ô»°½»¸øÆä½ğË¿ÃæÕÖ
function task_013_01_0()

local strTalk = {
	"Th¸c B¹t tiÒn bèi, «ng ®· quyÕt ®Êu víi T­ M· tiÒn bèi ch­a??",
	"Ng­¬i ®Õn thËt ®óng lóc ta ®ang cã chuyÖn buån phiÒn. D¹o tr­íc ta quyÕt ®Êu víi T­ M· Minh Phong ph¸t hiÖn r»ng «ng ta xuÊt chiªu chËm h¬n x­a rÊt nhiÒu khiÕn ta rÊt ch¸n n¶n.",
	"Hai ng­êi vÉn ch­a ph©n th¾ng b¹i sao? NÕu kh«ng cã ı chİ chiÕn ®Êu th× ®­êng kiÕm còng sÏ nh¸n nhÉm th«i. T­ M· tiÒn bèi ch¾c ®ang cã chuyÖn phiÒn n·o.",
	"Ng­¬i nãi kh«ng sai tİ nµo, kiÕm ı cña T­ M· Minh Phong mang suy nghÜ, thÕ mµ ta cø t­ëng «ng ta kh«ng muèn quyÕt ®Êu ®iÒu nµy khiÕn ta lo l¾ng. T­ M· Minh Phong lu«n ë Phông T­êng phñ kh«ng muèn ®i ®©u th× ra lµ v× muèn ®Õn TÇn L¨ng xem thö, l©u nay vÉn ch­a ®­îc to¹i nguyÖn nªn lu«n l¹nh nh¹t ®èi víi sù ®êi. LÇn ®Çu ta vµ h¾n quyÕt ®Êu lµ do t×nh cê nªn míi kİch thİch ı chİ cña «ng ta mµ th«i.",
	}

	TalkEx("task_013_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_013_01_0_1()

local strTalk = {
	"Ra lµ vËy tiÒn bèi ch­a thÓ quyÕt ®Êu ®Õn cïng ch¶ tr¸ch sÊu n·o. T¹i sao T­ M· tiÒn bèi muèn vµo TÇn L¨ng? ThËt trïng hîp, Xa Lu©n B¸ V­¬ng muèn «ng tiÕp nhËn viÖc vµo mé, ®©y lµ MÆt n¹ t¬ vµng dïng ®Ó vµo mé.",
	"ChuyÖn cña TÇn L¨ng vÉn ch­a cã kÕt qu¶ sao? ViÖc nµy qu¶ lµ tèn nhiÒu thêi gian, giê l¹i cßn ®Õn t×m ta n÷a. Còng may T­ M· Minh Phong ®ang muèn vµo mé, tuy ta kh«ng biÕt môc ®İch cña «ng ta nh­ng chØ cÇn h¾n trót bá t©m sù mµ quyÕt ®Êu víi ta th× ®ñ råi. Ng­¬i h·y ®em MÆt n¹ t¬ vµng giao cho «ng ta.",
	"H¶? Ha ha… Th¸c B¹t tiªn bèi l¹i lµm theo ı m×nh råi, lÇn nµy Xa Lu©n B¸ V­¬ng l¹i tøc giËn cho mµ xem.",
	}

	TalkEx("task_013_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_013_01_0_2()

local strTalk = {
	"Cø ®Ó h¾n tøc giËn ®i, ta sÏ chŞu mäi tr¸ch nhiÖm. NÕu ®Ó lì mÊt ®èi thñ nh­ thÕ th× ®ã cßn ®¸ng tiÕc h¬n chuyÖn cña TÇn L¨ng n÷a. V¶ l¹i vÉn cßn 1 c¸i mÆt n¹ ta cã thÓ ph¸i ng­êi kh¸c vµo mé ®iÒu tra.",
	"§­îc råi ta ®i t×m T­ M· Minh Phong ®©y.",
	"(T­ M· tiªn bèi còng tíi TÇn L¨ng, ch¼ng lÏ «ng ta biÕt tin tøc cña B¶n ®å S¬n Hµ X· T¾c? M×nh ta ®eo mÆt n¹ vµo mé còng kh¸ m¹o hiÓm chi b»ng ®i t×m T­ M· tiÒn bèi dß hái ı cña «ng ta.)",
	}

	TalkEx("",strTalk);
		--´¦Àí½ğË¿ÃæÕÖ
	if GetItemCount(2,0,710) >= 1 then
		DelItem(2,0,710,GetItemCount(2,0,710));
		AddItem(2,0,710,1,1);
	else
		AddItem(2,0,710,1,1);
	end

	SetTask(TASK_XB_ID_01,16);
	TaskTip("Giao 1 MÆt n¹ t¬ vµng cho T­ M· Minh Phong.");
	Msg2Player("Giao 1 MÆt n¹ t¬ vµng cho T­ M· Minh Phong.");

end

--»¹Î´¸øË¾ÂíÃù·ç´øÈ¥½ğË¿ÃæÕÖand²¹·¢ÃæÕÖ£¨Ã»ÓĞÃæÕÖ²»ÄÜ½ø»ÊÁêÒ»²ã£©
function task_013_01_1()

local strTalk = {
	"Kh«ng biÕt t¹i sao T­ M· Minh Phong cø canh c¸nh trong lßng vÒ TÇn L¨ng, ng­¬i h·y giao 1 MÆt n¹ t¬ vµng cho h¾n ®Ó h¾n gi¶i quyÕt xong t©m nguyÖn mµ sím quyÕt ®Êu víi ta.",
	};

	--¶ªÊ§ÁËÃæÕÖ²¹·¢
	if GetItemCount(2,0,710) < 1 then
		AddItem(2,0,710,1,1);
		strTalk = {};
	end

	TalkEx("",strTalk);

end

--½«½ğË¿ÃæÕÖ½»¸øË¾ÂíÃù·ç
function task_013_02_0()

local strTalk = {
	"T­ M· tiÒn bèi vÉn kháe chø? Nghe Th¸c B¹t Ho»ng tiÒn bèi nãi «ng cã chuyÖn phiÒn muén nªn kh«ng thÓ tËp trung ®Êu vâ?",
	"Ta ®· tõng thÒ ®éc r»ng sÏ kh«ng ®éng thñ víi ai, kh«ng ngê l¹i gÆp ph¶i Th¸c B¹t Ho»ng nªn nhÊt thêi bŞ «ng ta khªu khİch. Ta t­ëng h¾n hÑn ta quyÕt ®Êu lµ muèn l«i kĞo ta vµo NhÊt PhÈm ®­êng, thùc ra h¾n chØ muèn so tµi nªn khiÕn ta mÊt hÕt ı chİ chiÕn ®Êu, së r»ng nã sÏ lµm h¾n thÊt väng.",
	"Th¸c B¹t tiÒn bèi ®óng lµ h¬i thÊt väng nh­ng biÕt T­ M· tiÒn bèi lo l¾ng chuyÖn TÇn L¨ng, mµ gÇn ®©y ta ®iÒu tra ®­îc tin tøc liªn quan ®Õn TÇn L¨ng nªn sai ta ®Õn t×m T­ M· tiÒn bèi ®Ó gióp «ng gi¶i táa nçi lo. ¤ng tõng nghe trong mé cã Khİ ®éc kh«ng?",
	"Kh«ng giÊu g× ng­¬i, ta lu«n muèn vµo trong TÇn L¨ng xem thö nh­ng lu«n bŞ Khİ ®éc trong mé lµm ta chïn b­íc. TÇn L¨ng kh«ng hæ danh lµ Mé §Õ V­¬ng, Khİ ®éc rÊt nhiÒu, ta ®· thö dïng ch©n khİ toµn th©n ng¨n c¶n khİ ®éc ®Ó vµo mé nh­ng vÉn kh«ng chŞu næi nöa canh giê. <sex> d­êng nh­ rÊt am hiÓu TÇn L¨ng kh«ng biÕt cã cao kiÕn g×?",
	}

	TalkEx("task_013_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_013_02_0_1()

local strTalk = {
	"TiÒn bèi kh¸ch s¸o råi, ta chØ t×nh cê biÕt ®­îc mét sè th«ng tin trong lóc lµm nhiÖm vô, nÕu «ng muèn vµo trong th× còng ®­îc, nh­ng khİ ®éc trong mé rÊt m¹nh vµo trong ®ã råi kh«ng biÕt sèng chÕt ra sao, «ng h·y suy nghÜ cho kü.",
	"Ng­¬i cã c¸ch vµo mé sao? T©m nguyÖn l©u nay cña ta chØ muèn Vµo mé xem thö, vèn ®· kh«ng mµng ®Õn chuyÖn sèng chÕt. Nh­ng nÕu chuyÖn liªn quan ®Õn bİ mËt cña NhÊt PhÈm ®­êng th× ta còng kh«ng Ğp ng­¬i, nh­ng cã thÓ gióp ta lµm râ mét viÖc kh«ng? Ta sÏ ®Òn ®¸p c«ng ¬n cña c¸c h¹.",
	"Ta cã biÕt s¬ vÒ c¸ch vµo mé nh­ng kh«ng ch¾c lµ sÏ thµnh c«ng, tiªn bèi h·y cho ta biÕt nguyªn nh©n «ng vµo mé? Ta nhÊt ®Şnh sÏ gióp ®ì «ng.",
	"ChuyÖn c¸ch nay ®· 18 n¨m råi, lóc trÎ ta ®· qu¸ ®am mª vâ thuËt mµ t¹o nªn nghiÖp ch­íng, Tö Qu©n vî ta ®· ®äc trong mét sè ghi chĞp cæ biÕt ®­îc TÇn L¨ng cã chøa MËt b¶o thÇn binh viÕt MÆc ®Êu lµ Béi KiÕm ®· theo TÇn V­¬ng chinh chiÕn nhiÒu n¨m. Th©n kiÕm ®en nh­ mùc, ®­îc rÌn tõ s¾t ngµn n¨m tuy nhÑ nh­ng s¾c bĞn, cã thÓ ph¸t huy hÕt uy lùc kiÕm ph¸p cña ta. Tö Qu©n thõa lóc ta ®Õn Hoa S¬n luËn kiÕm ®· mét m×nh vµo mé, ®Õn nay ®· 18 n¨m.",
	}

	TalkEx("task_013_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_013_02_0_2()

local strTalk = {
	"Th× ra lµ thÕ nªn tiÒn bèi ®· mai danh Èn tİch.",
	"Tö Qu©n vÉn ch­a râ sèng chÕt, nÕu kh«ng t×m ®­îc thi thÓ ta sÏ kh«ng cam lßng. Vâ c«ng thiªn h¹ ®Ö nhÊt th× sao chø? Ngay c¶ ng­êi con g¸i m×nh yªu quı còng kh«ng gi÷ ®­îc. NÕu <sex> cã thÓ vµo mé ta chØ nhê ng­¬i ®iÒu tra tin cña vî ta Tö Qu©n, dï sèng hay chÕt còng b¸o cho ta biÕt.",
	"TiÒn bèi nÆng t×nh thÕ sao ta cã thÓ kh«ng gióp? ¤ng cø yªn t©m, vî chång «ng t×nh s©u nghÜa nÆng nhÊt ®Şnh sÏ gÆp l¹i nhau. Xin c¸o tõ.",
	"(Kh«ng cßn c¸ch nµo hay h¬n lµ lîi dông t×nh nghÜa cña T­ M· tiÒn bèi ®Ó vµo mé, ®µnh ph¶i võa truy t×m B¶n ®å S¬n Hµ X· T¾c võa gióp «ng ta hoµn thµnh t©m nguyÖn. Ph¶i råi ¢u D­¬ng Häa  tõng dÆn tr­íc khi vµo mé h·y ®Õn t×m «ng ta.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,17);
	TaskTip("Hái ¢u D­¬ng Häa chuyÖn vµo mé.");
	Msg2Player("Hái ¢u D­¬ng Häa chuyÖn vµo mé.");
	GivePlayerAward("Award_XB_27","Easy");
	GivePlayerExp(SkeyXibei,"lianggemianzhao")
end

--ÉĞÎ´Ñ¯ÎÊÅ·Ñô»­ÈëÄ¹Çé¿ö
function task_013_02_1()

local strTalk = {
	"Vâ c«ng thiªn h¹ ®Ö nhÊt th× sao chø? Ngay c¶ ng­êi con g¸i m×nh yªu quı còng kh«ng gi÷ ®­îc. NÕu <sex> cã thÓ vµo mé ta chØ nhê ng­¬i ®iÒu tra tin cña vî ta Tö Qu©n, dï sèng hay chÕt còng b¸o cho ta biÕt.",
	"(Kh«ng cßn c¸ch nµo hay h¬n lµ lîi dông t×nh nghÜa cña T­ M· tiÒn bèi ®Ó vµo mé, ®µnh ph¶i võa truy t×m B¶n ®å S¬n Hµ X· T¾c võa gióp «ng ta hoµn thµnh t©m nguyÖn. Ph¶i råi ¢u D­¬ng Häa  tõng dÆn tr­íc khi vµo mé h·y ®Õn t×m «ng ta.)",
	}

	TalkEx("",strTalk);

end

--Ñ¯ÎÊÅ·Ñô»­ÈëÄ¹Çé¿ö
function task_013_03_0()

local strTalk = {
	"TiÒn bèi t×m ®­îc Cao nhËn ®µo trém mé ch­a? Ta cÇn vµo mé mét chuyÕn.",
	"Tèt l¾m, chuyÖn vµo mé v« cïng cÊp b¸ch, T­îng binh m· trong mé ®· sèng l¹i, ch¾c ®©y lµ søc m¹nh cña B¶n ®å S¬n Hµ X· T¾c nhÊt ®Şnh kh«ng thÓ ®Ó B¶n ®å S¬n Hµ X· T¾c r¬i vµo tay ng­êi T©y H¹. T×nh h×nh trong mé ta còng kh«ng râ, e r»ng víi MÆt n¹ t¬ vµng còng sÏ cã trë ng¹i, Mé §Õ V­¬ng kh«ng thÓ xem th­êng. Ta t×m ®­îc truyÒn nh©n cña C­íp mé tªn lµ LiÔu Tïng V©n .",
	"Tèt råi, ng­êi nµy ë ®©u? Ta sÏ ®i t×m h¾n.",
	"Ng­êi nµy hµnh nghÒ Trém mé ë Phông T­êng phñ, tinh th«ng C¸ch t¹o c¬ quan rÊt am hiÓu vÒ TÇn L¨ng. Ng­¬i h·y ®i dß hái t×nh h×nh trong mé, ta ph¶i vµo mé tr­íc ng­êi T©y H¹, cµng ph¶i cÈn thËn víi t­îng binh m· vµ c¬ quan trong mé.",
	"§a t¹ tiÒn bèi!",
	}

	SetTask(TASK_XB_ID_01,18);
	TalkEx("",strTalk);
	TaskTip("Hái LiÔu Tïng V©n c¸ch ®Ó vµo Hoµng L¨ng mé thÊt.");
	Msg2Player("Hái LiÔu Tïng V©n c¸ch ®Ó vµo Hoµng L¨ng mé thÊt.");
	GivePlayerExp(SkeyXibei,"daomushijia")
end

--»¹Î´Ñ¯ÎÊÁø×İÔÆÈëÄ¹Çé¿ö
function task_013_03_1()

local strTalk = {
	"Phông T­êng phñ cã truyÒn nh©n cña C­íp mé tªn lµ LiÔu Tïng V©n , ng­êi nµy tinh th«ng C¸ch t¹o c¬ quan, ng­¬i cã thÓ t×m h¾n ®Ó hái t×nh h×nh trong ®ã ta ph¶i vµo mé tr­íc ng­êi T©y H¹.",
	}

	TalkEx("",strTalk);

end

--Ñ¯ÎÊÁø×İÔÆÈëÄ¹Çé¿öÆô¶¯É±¹Ö´¥·¢Æ÷
--ĞèÒª30·ÖÖÓ²ÅÄÜÖØĞÂ²¹·¢´¥·¢Æ÷·ÀÖ¹Ë¢Boss£¬Ğè¼ÇÂ¼Ê±¼ä
function task_013_04_0()

local strTalk = {
	"§©y cã ph¶i lµ LiÔu Tïng V©n? Nghe nãi c¸c h¹ lµ ng­êi trém mé nªn muèn thØnh gi¸o vµi ®iÒu vÒ cæ mé.",
	"§óng råi. Th× ra <sex> còng høng thó víi cæ mé sao? Cæ mé vµ c¬ quan trong ®ã cã rÊt nhiÒu d¹ng, mµ mçi lo¹i c¬ quan cã c¸ch ph¸ gi¶i kh¸c nhau, <sex> muèn biÕt cÊu t¹o cña l¨ng mé nµo?",
	"¤ng ®· tõng vµo TÇn L¨ng ch­a? Cã biÕt t×nh h×nh bªn trong kh«ng?",
	"Sao? Ng­¬i nãi TÇn L¨ng? §©y… ®©y kh«ng ph¶i n¬i ai còng vµo ®­îc. C¶ ®êi ta tõng vµo nhiÒu ng«i mé nh­ng ch­a gÆp c¸i nµo kú l¹ nh­ thÕ. Tuy lµ Mé §Õ V­¬ng nh­ng còng lµ vËt ®· chÕt vËy mµ T­îng binh m· trong mé siªu viÖt ®Õn nçi gÆp ng­êi lµ giÕt.",
	"VËy lµ chuyÖn t­îng binh m· sèng l¹i lµ cã thËt, søc m¹nh cña B¶n ®å S¬n Hµ X· T¾c qu¶ kh«ng thÓ ®o¸n.",
	}

	--85¼¶·½ÄÜ¼ÌĞøÈÎÎñ
	if GetLevel() >= 72 then
		TalkEx("task_013_04_0_1",strTalk);
	else
		strTalk = {
			"§©y cã ph¶i lµ LiÔu Tïng V©n? Nghe nãi c¸c h¹ lµ ng­êi trém mé nªn muèn thØnh gi¸o vµi ®iÒu vÒ cæ mé.",
			"§óng råi. Th× ra <sex> còng høng thó víi cæ mé sao? Cæ mé vµ c¬ quan trong ®ã cã rÊt nhiÒu d¹ng, mµ mçi lo¹i c¬ quan cã c¸ch ph¸ gi¶i kh¸c nhau, <sex> muèn biÕt cÊu t¹o cña l¨ng mé nµo?",
			"¤ng ®· tõng vµo TÇn L¨ng ch­a? Cã biÕt t×nh h×nh bªn trong kh«ng?",
			"Sao? Ng­¬i nãi TÇn L¨ng? §©y… ®©y kh«ng ph¶i n¬i ai còng vµo ®­îc. C¶ ®êi ta tõng vµo nhiÒu ng«i mé nh­ng ch­a gÆp c¸i nµo kú l¹ nh­ thÕ. Tuy lµ Mé §Õ V­¬ng nh­ng còng lµ vËt ®· chÕt vËy mµ T­îng binh m· trong mé siªu viÖt ®Õn nçi gÆp ng­êi lµ giÕt.",
		}
		TalkEx("task_013_04_0_2",strTalk);
	end

end

--Ğø¶Ô»°
function task_013_04_0_1()

local strTalk = {
	"B¶n ®å S¬n Hµ X· T¾c lµ b¸u vËt g× thÕ? Cã liªn quan ®Õn t­îng binh m· sao? §­îc th«i ta ®· quyÕt ®Şnh kh«ng ®Õn ®ã n÷a th× còng kh«ng ng¹i nãi ng­¬i biÕt. TÇn L¨ng rÊt to lín vµ chia lµm 2 tÇng. mçi tÇng ®Òu cã T­îng binh m· trÊn gi÷, lóc ta ®ét nhËp vµo th× bŞ chóng tÊn c«ng nÕu ta kh«ng nhanh ch©n ch¹y trèn b»ng mËt ®¹o th× e lµ ®· ph¶i bá m¹ng råi.",
	"NÕu vËy «ng cã thÓ cho ta biÕt ph­¬ng ph¸p ®Ó vµo mé kh«ng?",
	"HuyÖt mé nguy hiÓm nh­ cã g× hay ho chø? nÊu ng­¬i cø kh¨ng kh¨ng muèn ®i th× ph¶i cÈn thËn. MËt ®¹o L¨ng mé tÇng 1quanh co vµ trèng kh«ng, thiÕt nghÜ b¸u vËt ®­îc giÊu ë tÇng 2. C¬ quan ë tÇng 1 rÊt İt chØ cÇn MÆt n¹ t¬ vµng lµ ®ñ. Nh­ng cæng vµo L¨ng mé tÇng 2 do Thèng lÜnh t­îng binh m· trÊn gi÷, cÇn ®¸nh b¹i 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m· th× thèng lÜnh míi xuÊt hiÖn. §óng råi, M« Kim phï vËt gia truyÒn cña ta bŞ Thèng lÜnh t­îng binh m· c­íp mÊt, nÕu ng­¬i ®¸nh b¹i thèng lÜnh cã thÓ gióp ta lÊy l¹i nã kh«ng? Khi trë vÒ ®©y ta sÏ d¹y ng­¬i c¸ch ®Ó vµo tÇng 2.",
	"§a t¹ tiªn sinh chØ gi¸o, nÕu kh«ng thÓ ®¸nh b¹i Thèng lÜnh t­îng binh m· mµ lªn tÇng 2 chİnh lµ tù t×m chç chÕt. ¤ng h·y ®îi tin tøc cña ta.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,19);
	SetTask(TASK_BINGMAYONGTONGLING_TIME,GetTime());--¼ÇÂ¼Ê±¼ä
	CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--É±¹Ö´¥·¢Æ÷
	CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--É±¹Ö´¥·¢Æ÷
	--Çå¿ÕÏÈÇ°Ê¹ÓÃ±äÁ¿×´Ì¬
	SetTask(KONGSHOU25_STATE,0);
	SetTask(CHINU25_STATE,0);
	TaskTip("§Õn l¨ng mé tÇng 1 tiªu diÖt 25 Vâ vÖ t­îng binh m· vµ Hé vÖ t­îng binh m·.");
	Msg2Player("§Õn l¨ng mé tÇng 1 tiªu diÖt 25 Vâ vÖ t­îng binh m· vµ Hé vÖ t­îng binh m·, sau ®ã tiªu diÖt Thèng lÜnh t­îng binh m· lÊy M« Kim Phï vÒ cho LiÔu Tïng V©n.");
end

--Ğø¶Ô»°
function task_013_04_0_2()

local strTalk = {
	"VËy lµ chuyÖn t­îng binh m· sèng l¹i lµ cã thËt, søc m¹nh cña B¶n ®å S¬n Hµ X· T¾c qu¶ kh«ng thÓ ®o¸n.",
	"B¶n ®å S¬n Hµ X· T¾c lµ b¸u vËt g× thÕ? Cã liªn quan ®Õn t­îng binh m· sao? §­îc th«i ta ®· quyÕt ®Şnh kh«ng ®Õn ®ã n÷a th× còng kh«ng ng¹i nãi ng­¬i biÕt. TÇn L¨ng rÊt to lín vµ chia lµm 2 tÇng. mçi tÇng ®Òu cã T­îng binh m· trÊn gi÷, lóc ta ®ét nhËp vµo th× bŞ chóng tÊn c«ng nÕu ta kh«ng nhanh ch©n ch¹y trèn b»ng mËt ®¹o th× e lµ ®· ph¶i bá m¹ng råi.",
	"NÕu vËy «ng cã thÓ cho ta biÕt ph­¬ng ph¸p ®Ó vµo mé kh«ng?",
	"LiÔu Tèng V©n: theo ta thÊy, thùc lùc hiÖn t¹i cña <sex>, vµo L¨ng C¬ mé chØ e lµ mét ®i kh«ng trë l¹i, h·y quay vÒ luyÖn thªm 1 thêi gian ®i, ®¹t cÊp 72 h·y ®Òn t×m ta",
	"§a t¹ tiÒn bèi."
	}

	TalkEx("",strTalk);
end


--ÉĞÎ´È¡»ØÃş½ğ·ûandĞèÒª30·ÖÖÓ²ÅÄÜÖØĞÂ²¹·¢´¥·¢Æ÷·ÀÖ¹Ë¢Boss
function task_013_04_1()

local strTalk = {};

	--Íê³ÉÈÎÎñµ«Ã»ÓĞÉ±ËÀÍ³Áì
	if GetTask(KONGSHOU25_STATE) == 1 and GetTask(CHINU25_STATE) == 1 then
		if (GetTime() - GetTask(TASK_BINGMAYONGTONGLING_TIME)) < 1800 then -- ÅĞ¶ÏÊ±¼äÏŞÖÆ
			strTalk = {
				"Cæng vµo L¨ng mé tÇng 2 do Thèng lÜnh t­îng binh m· trÊn gi÷, cÇn ®¸nh b¹i 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m· th× thèng lÜnh míi xuÊt hiÖn. §óng råi, M« Kim phï vËt gia truyÒn cña ta bŞ Thèng lÜnh t­îng binh m· c­íp mÊt, nÕu ng­¬i ®¸nh b¹i thèng lÜnh cã thÓ gióp ta lÊy l¹i nã kh«ng? Khi trë vÒ ®©y ta sÏ chØ ng­¬i c¸ch ®Ó vµo tÇng 2.",
				};
		else --ÖØĞÂ·¢²¼ÈÎÎñ
			CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--É±¹Ö´¥·¢Æ÷
			CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--É±¹Ö´¥·¢Æ÷
			SetTask(KONGSHOU25_STATE,0);
			SetTask(CHINU25_STATE,0);
			strTalk = {
				"Cæng vµo L¨ng mé tÇng 2 do Thèng lÜnh t­îng binh m· trÊn gi÷, cÇn ®¸nh b¹i 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m· th× thèng lÜnh míi xuÊt hiÖn. §óng råi, M« Kim phï vËt gia truyÒn cña ta bŞ Thèng lÜnh t­îng binh m· c­íp mÊt, nÕu ng­¬i ®¸nh b¹i thèng lÜnh cã thÓ gióp ta lÊy l¹i nã kh«ng? Khi trë vÒ ®©y ta sÏ chØ ng­¬i c¸ch ®Ó vµo tÇng 2.",
				};
			TaskTip("§Õn l¨ng mé tÇng 1 tiªu diÖt 25 Vâ vÖ t­îng binh m· vµ Hé vÖ t­îng binh m·.");
			Msg2Player("§eo mÆt n¹ t¬ vµng råi vµo l¨ng mé tÇng 1, tiªu diÖt 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m·, sau ®ã ®¸nh b¹i Thèng lÜnh t­îng binh m· ®o¹t l¹i M« Kim phï cho LiÔu Tïng V©n.");
		end
	--ÉĞÎ´Íê³ÉÈÎÎñ²¹·¢´¥·¢Æ÷
	else
		if GetTrigger(KILL_XB_KONGSHOUBINGMAYONG) == 0 and GetTask(KONGSHOU25_STATE) == 0 then
			CreateTrigger(0,1231,KILL_XB_KONGSHOUBINGMAYONG);--É±¹Ö´¥·¢Æ÷
			TaskTip("§Õn l¨ng mé tÇng 1 tiªu diÖt 25 Vâ vÖ t­îng binh m· vµ Hé vÖ t­îng binh m·.");
			Msg2Player("§eo mÆt n¹ t¬ vµng råi vµo l¨ng mé tÇng 1, tiªu diÖt 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m·, sau ®ã ®¸nh b¹i Thèng lÜnh t­îng binh m· ®o¹t l¹i M« Kim phï cho LiÔu Tïng V©n.");
		elseif GetTrigger(KILL_XB_CHINUBINGMAYONG) == 0 and GetTask(CHINU25_STATE) == 0 then
			CreateTrigger(0,1232,KILL_XB_CHINUBINGMAYONG);--É±¹Ö´¥·¢Æ÷
			TaskTip("§Õn l¨ng mé tÇng 1 tiªu diÖt 25 Vâ vÖ t­îng binh m· vµ Hé vÖ t­îng binh m·.");
			Msg2Player("§eo mÆt n¹ t¬ vµng råi vµo l¨ng mé tÇng 1, tiªu diÖt 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m·, sau ®ã ®¸nh b¹i Thèng lÜnh t­îng binh m· ®o¹t l¹i M« Kim phï cho LiÔu Tïng V©n.");
		else--Õı³£ÈÎÎñÖĞ
			strTalk = {
				"Cæng vµo L¨ng mé tÇng 2 do Thèng lÜnh t­îng binh m· trÊn gi÷, cÇn ®¸nh b¹i 25 vâ vÖ t­îng binh m· vµ 25 hé vÖ t­îng binh m· th× thèng lÜnh míi xuÊt hiÖn. §óng råi, M« Kim phï vËt gia truyÒn cña ta bŞ Thèng lÜnh t­îng binh m· c­íp mÊt, nÕu ng­¬i ®¸nh b¹i thèng lÜnh cã thÓ gióp ta lÊy l¹i nã kh«ng? Khi trë vÒ ®©y ta sÏ chØ ng­¬i c¸ch ®Ó vµo tÇng 2.",
				};
		end
	end

	TalkEx("",strTalk);

end

--Ë¢³ö±øÂíÙ¸Í³Áì
function CreateBingMaYongTongLing()

local nMapPosIndex = random(1,getn(BingMaYongTongLing_MapData));
local nNpcIndex = 0;

	Msg2Player("Thèng lÜnh t­îng binh m· xuÊt hiÖn råi!")
	nNpcIndex = CreateNpc("L·nh qu©n t­îng binh m·","Thèng lÜnh t­îng binh m·",513,BingMaYongTongLing_MapData[nMapPosIndex][1],BingMaYongTongLing_MapData[nMapPosIndex][2]);
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒÒ»²ã\\npc\\±øÂíÙ¸Í³Áì.lua");
	SetNpcLifeTime(nNpcIndex,1500);
	Msg2Player("Thèng lÜnh t­îng binh m· xuÊt hiÖn t¹i  "..BingMaYongTongLing_MapData[nMapPosIndex][3]..", "..BingMaYongTongLing_MapData[nMapPosIndex][4].."  mau ®i tiªu diÖt ®Ó lÊy M« Kim Phï.")
	TaskTip("Thèng lÜnh t­îng binh m· xuÊt hiÖn t¹i "..BingMaYongTongLing_MapData[nMapPosIndex][3]..", "..BingMaYongTongLing_MapData[nMapPosIndex][4].." mau ®i tiªu diÖt ®Ó lÊy M« Kim Phï.");
end


---------------------------------- Î÷±±Çø14·ÖÖ§1_6ÈëÄ¹Ö®Õù----------------------------------
--É±ËÀ±øÂíÙ¸Í³ÁìÈ¡µÃÃş½ğ·ûºóÓëÁø×İÔÆ¶Ô»°
function task_014_01_0()

local strTalk = {
	"¤ng xem thö ®©y cã ph¶i lµ M« Kim phï kh«ng? Ta ®· ®¸nh b¹i l·nh qu©n t­îng binh m·, cæng vµo l¨ng mé tÇng 2 ®· xuÊt hiÖn nh­ng kh«ng thÓ ®i vµo, lµm thÕ nµo ®Ó vµo ®­îc ®©y?",
	"Tèt, ®óng lµ M« Kim phï råi. <sex> thËt lµ tµi cã thÓ ®¸nh b¹i sè t­îng binh m· ®ã. NÕu muèn vµo bªn trong cæ mé th× ph¶i cã c¸ch, ®· lµ cæ mé ®Òu cã dŞ thó, c¬ quan hoÆc x¸c ng­êi lµmtrÊn mé linh vËt Mé §Õ V­¬ng còng thÕ.",
	"Nh­ng ta kh«ng thÊy trong l¨ng mé tÇng 1 cã linh vËt g×, chØ thÊy rÊt nhiÒu t­îng binh m·.",
	"§­¬ng nhiªn råi, mé cña TÇn V­¬ng sao dÔ dµng ®Ó ng­êi ngoµi quÊy nhiÔu? HuyÖt mé nµy kh«ng chØ cã Linh vËt rÊt m¹nh trÊn gi÷ cµng l¹i cã phong thñy trËn. nÕu kh«ng ph¸ ®­îc nã e r»ng h×nh d¸ng cña Linh vËt còng kh«ng thÊy ®­îc. Tuy c¸ch bè trİ cña c¸c mé thÊt ®Òu kh«ng gièng nhau nh­ng còng kh«ng n»m ngoµi ®iÓm chung, ng­¬i cÇn §o¹n Thñy Chö vµ La Canh ®Ó ph¸ nã.",
	"Ph¸ phong thñy trËn cÇn §o¹n Thñy Chö vµ La Canh ta cã thÓ t×m chóng ë ®©u?",
	}

	TalkEx("task_014_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_014_01_0_1()

local strTalk = {
	"La Canh ®Ó t×m huyÖt phong thñy, §o¹n Thñy Chö ®Ó ®ãng vµo huyÖt phong thñy, chØ khi ph¸ ®­îc 4 ®iÓm phong thñy míi vµo ®­îc mËt ®¹o cña trÊn mé linh vËt, ph¸ vì trÊn mé linh vËt míi vµo ®­îc tÇng 2. Hai thø nµy vèn dÜ ta ®Òu cã nh­ng lÇn tr­íc khi ®Õn mª cung sa m¹c t×m b¸u vËt cã ghĞ qua D­îc V­¬ng Cèc, bŞ Ng­êi T©y H¹ ë ®ã c­íp mÊt råi.",
	"Sao? BŞ Ng­êi T©y H¹ c­íp ®i råi sao?",
	"KÓ ra còng l¹ Ng­êi T©y H¹ sao l¹i ®i c­íp thø kh«ng cã t¸c dông g× ngoµi viÖc trém mé thÕ chø. Sè ng­êi qua l¹i ë D­îc V­¬ng Cèc lµ do vâ sÜ T©y H¹ vµ dòng sÜ T©y H¹ gi¶ d¹ng.",
	"Kh«ng xong råi, c¶m ¬n tiªn sinh, ta ®i t×m §o¹n Thñy Chö vµ La Canh vÒ ®©y.",
	"(Ng­êi T©y H¹ ®· tËp hîp tõ lóc nµo thÕ? T¹m g¸c l¹i chuyÖn nµy, mau ®Õn D­îc V­¬ng Cèc lÊy 4 §o¹n Thñy Chö vµ La Canh.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,712,1);--É¾È¥Ãş½ğ·û
	SetTask(TASK_XB_ID_01,21);
	CreateTrigger(0,1233,KILL_XB_XIXIAWUSHI);--É±¹Ö´¥·¢Æ÷
	CreateTrigger(0,1234,KILL_XB_XIXIAYONGSHI);--É±¹Ö´¥·¢Æ÷
	SetTask(FENGSHUIXUE_ID,0);--¶Ô·çË®Ñ¨Ïà¹Ø±äÁ¿ÇåÁã
	SetTask(FENGSHUIXUE_STATE,0);--¶Ô·çË®Ñ¨Ïà¹Ø±äÁ¿ÇåÁã
	SetTask(TASK_BINGMAYONGTONGLING_TIME,0);--¶ÔÍ³ÁìË¢ĞÂÊ±¼ä±äÁ¿ÇåÁã
	TaskTip("§Õn D­îc V­¬ng Cèc thu thËp 4 §o¹n Thñy Chö vµ 1 La Canh tõ vâ sÜ T©y H¹ vµ dòng sÜ T©y H¹.");
	Msg2Player("§Õn D­îc V­¬ng Cèc thu thËp 4 §o¹n Thñy Chö vµ 1 La Canh tõ vâ sÜ T©y H¹ vµ dòng sÜ T©y H¹.");
	GivePlayerAward("Award_XB_28","Easy");
	GivePlayerExp(SkeyXibei,"mojinfu")
end

--È¡µÃ»òÎ´È¡µÃ¶ÏË®èÆÓëÂŞ¸ı
function task_014_02_0()

local strTalk = {};

	--´ø»Ø¶ÏË®èÆÓëÂŞ¸ı
	if GetItemCount(2,0,713) >= 4 and GetItemCount(2,0,714) >= 1 then
		strTalk = {
			"LiÔu tiªn sinh xem thö ®©y cã ph¶i §o¹n Thñy Chö vµ La Canh kh«ng, nh÷ng thø nµy lµm sao sö dông?",
			"§óng råi nh­ng thËt cã lçi víi <sex>, nh÷ng thø nµy e r»ng ch­a thÓ ph¸ phong thñy trËn. V× chØ cã Ph¸ Phong Chïy míi cã thÓ ®ãng §o¹n Thñy Chö vµo huyÖt phong thñy, võa míi cã ng­êi tù x­ng lµ NhÊt PhÈm ®­êng kim cang tr¶o v­¬ng ®Õn hái ta lÊy Ph¸ Phong Chïy. Nã lµ mËt b¶o trém mé gia truyÒn cña nhµ ta vèn ®Şnh cho ng­¬i m­în th× sao ta ®­a cho h¾n? ThÕ lµ h¾n ra tay c­íp chïy cña ta vµ kÕt qu¶ chïy ®· bŞ h¾n c­íp ®i.",
			"Sao? H¾n tù x­ng lµ NhÊt PhÈm ®­êng kim cang sao?",
			}

		TalkEx("task_014_02_0_1",strTalk);

	--Ã»ÓĞ´ø»ØÎïÆ·and²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"§o¹n Thñy Chö vµ La Canh vèn dÜ ta ®Òu cã nh­ng lÇn tr­íc khi ®Õn mª cung sa m¹c t×m b¸u vËt cã ghĞ qua D­îc V­¬ng Cèc, bŞ Ng­êi T©y H¹ ë ®ã c­íp mÊt råi. Sao chóng l¹i c­íp dông cô trém mé cña ta thËt kú l¹.",
			}
		if	GetTrigger(KILL_XB_XIXIAWUSHI) == 0 or GetTrigger(KILL_XB_XIXIAYONGSHI) == 0 then
			if GetTrigger(KILL_XB_XIXIAWUSHI) == 0 then
				CreateTrigger(0,1233,KILL_XB_XIXIAWUSHI);--É±¹Ö´¥·¢Æ÷
			end
			if GetTrigger(KILL_XB_XIXIAYONGSHI) == 0 then
				CreateTrigger(0,1234,KILL_XB_XIXIAYONGSHI);--É±¹Ö´¥·¢Æ÷
			end
			TaskTip("§Õn D­îc V­¬ng Cèc thu thËp 4 §o¹n Thñy Chö vµ 1 La Canh tõ vâ sÜ T©y H¹ vµ dòng sÜ T©y H¹.");
			Msg2Player("§Õn D­îc V­¬ng Cèc thu thËp 4 §o¹n Thñy Chö vµ 1 La Canh tõ vâ sÜ T©y H¹ vµ dòng sÜ T©y H¹.");
		end
		TalkEx("",strTalk);
	end

end

--Ğø¶Ô»°
function task_014_02_0_1()

local strTalk = {
	"§óng råi, ®ã lµ do Ng­êi T©y H¹ gi¶ d¹ng. Ch¼ng lÏ Ng­êi T©y H¹ l¹i muèn ®i trém mé, sao chóng l¹i c­íp dông cô trém mé cña ta? Ng­¬i ph¶i dïng La Canh t×m huyÖt phong thñy sau ®ã dïng Ph¸ Phong Chïy ®Ó ®ãng §o¹n Thñy Chö vµo, th× cã thÓ ph¸ phong thñy trËn më mËt ®¹o cña trÊn mé linh vËt, C¬ quan thñ mé nh©n ë cæng vµo tÇng 2 sÏ dÉn ng­¬i vµo trong.",
	"ChuyÖn kh«ng hay råi. §a t¹ tiªn sinh chØ gi¸o, ta ph¶i ®Õn l¨ng mé mét chuyÕn, c¸o tõ.",
	"(Ch¼ng lÏ NhÊt PhÈm ®­êng ®· t×m ®­îc c¸ch vµo mé? HÕt c­íp La Canh vµ §o¹n Thñy Chö l¹i ®o¹t Ph¸ Phong Chïy, ThËp ®¹i Kim Cang còng hµnh ®éng råi th× nguy cho B¶n ®å S¬n Hµ X· T¾c. Kh«ng thÓ ®Ó Ng­êi T©y H¹ ®¹t ®­îc môc ®İch, hay lµ ta trë vÒ hái Th¸c B¹t Ho»ng  xem sao.)",
	}

	RemoveTrigger(GetTrigger(KILL_XB_XIXIAWUSHI));
	RemoveTrigger(GetTrigger(KILL_XB_XIXIAYONGSHI));
	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,22);
	TaskTip("T×m Th¸c B¹t Ho»ng ®iÒu tra vÒ tr¶o v­¬ng.");
	Msg2Player("T×m Th¸c B¹t Ho»ng ®iÒu tra vÒ tr¶o v­¬ng.");
	GivePlayerAward("Award_XB_30","Easy");
	GivePlayerExp(SkeyXibei,"rumujiguan")
end

--ÉĞÎ´ÓëÍØ°Îºë¶Ô»°(²¹·¢¶ÏË®èÆÓëÂŞ¸ı)
function task_014_02_1()

local strSay = {
	"<sex> sao l¹i quay vÒ råi?",
	"T¹i h¹ lµm mÊt §o¹n Thñy Chö vµ La Canh råi/task_014_02_2",
	"Kh«ng cã g×/task_014_02_3",
	}

	SelectSay(strSay);

end

--²¹·¢¶ÏË®èÆÓëÂŞ¸ı
function task_014_02_2()

local strTalk = {};

	--ÉíÉÏ´øÓĞ4¸ö¶ÏË®èÆÓëÂŞ¸ı
	if GetItemCount(2,0,713) >= 4 and GetItemCount(2,0,714) >= 1 then
		strTalk = {
			"<sex> t×m kü l¹i xem, ta võa thÊy 4 §o¹n Thñy Chö vµ La Canh trong ba l« cña ng­¬i, s¬ ı nh­ thÕ sao mµ vµo trong l¨ng mé chø?",
			"Lêi cña tiÒn bèi nãi chİ ph¶i, lÇn sau ta sÏ cÈn thËn h¬n.",
			};
		TalkEx("",strTalk);
		return
	end

	if GetItemCount(2,0,713) < 4 then
		AddItem(2,0,713,(4-GetItemCount(2,0,713)),1);
	end

	if GetItemCount(2,0,714) < 1 then
		AddItem(2,0,714,1,1);
	end

	strTalk = {
		"Tªn NhÊt PhÈm ®­êng kim cang tr¶o v­¬ng nµo ®ã ®· c­íp Ph¸ Phong Chïy cña ta. Kh«ng cã Ph¸ Phong Chïy th× kh«ng thÓ ph¸ phong thñy trËn trong mé còng kh«ng thÓ më mËt ®¹o cña trÊn mé linh vËt.",
		"(Ch¼ng lÏ NhÊt PhÈm ®­êng ®· t×m ®­îc c¸ch vµo mé? Nguy cho B¶n ®å S¬n Hµ X· T¾c råi, kh«ng thÓ ®Ó Ng­êi T©y H¹ ®¹t ®­îc môc ®İch, hay lµ ta trë vÒ hái Th¸c B¹t Ho»ng  xem sao.)",
		};
	TalkEx("",strTalk);
end

--»¹Ã»ÓëÍØ°Îºë¶Ô»°
function task_014_02_3()

local strTalk = {
	"Tªn NhÊt PhÈm ®­êng kim cang tr¶o v­¬ng nµo ®ã ®· c­íp Ph¸ Phong Chïy cña ta. Kh«ng cã Ph¸ Phong Chïy th× kh«ng thÓ ph¸ phong thñy trËn trong mé còng kh«ng thÓ më mËt ®¹o cña trÊn mé linh vËt.",
	"(Ch¼ng lÏ NhÊt PhÈm ®­êng ®· t×m ®­îc c¸ch vµo mé? Nguy cho B¶n ®å S¬n Hµ X· T¾c råi, kh«ng thÓ ®Ó Ng­êi T©y H¹ ®¹t ®­îc môc ®İch, hay lµ ta trë vÒ hái Th¸c B¹t Ho»ng  xem sao.)",
	};

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø15·ÖÖ§1_6¹ÅÄ¹·çÔÆ----------------------------------
--ÓëÍØ°Îºë¶Ô»°µÃÖª×¦ÍõÒÑ¾­È¡µÃÆÆ·çé³½øÈëÁêÄ¹
function task_015_01_0()

local strTalk = {
	"Cuèi cïng ng­¬i ®· quay vÒ råi µ, T­ M· Minh Phong ch¾c ®· nhËn ®­îc Kim Ti DiÖn Tr¸o råi chø?",
	"(ViÖc T­ M· tiÒn bèi ch­a vµo mé hay lµ kh«ng nªn tiÕt lé sÏ tèt h¬n, ®Ó tr¸nh phiÒn phøc bªn ngoµi.)",
	"T­ M· tiÒn bèi ®· nhËn ®­îc Kim Ti DiÖn Tr¸o, th× ra «ng ta vµo mé lµ muèn t×m ng­êi vî ®· ly t¸n 18 n¨m, khæ nçi ch­a nghÜ ra c¸ch gi¶i khİ ®éc trong mé, cho nªn vÉn ch­a to¹i nguyÖn. LÇn nµy cã thÓ vµo mé, xem nh­ còng tháa ®­îc t©m nguyÖn.",
	"Tèt l¾m, ®îi t©m nguyÖn cña «ng ta hoµn thµnh, ta sÏ hÑn «ng ta ®Êu mét trËn. HÌn chi lÇn tr­íc ®ä søc cïng ta «ng ta cã vÎ lo ra, th× ra ®ang lo l¾ng cho vî, khã tr¸nh viÖc «ng ta l­u l¹c 18 n¨m ë Phông T­êng, nÕu «ng ta cã thÓ t×m ®­îc tung tİch cña vî m×nh, råi míi cïng ta thi thè mét trËn, nh­ thÕ ch¼ng ph¶i vÑn c¶ ®«i ®­êng sao?",
	"¤ng kh«ng cßn muèn chiªu mé T­ M· tiÒn bèi n÷a µ?",
	"¤i….Ng­êi träng t×nh träng nghÜa t¹i NhÊt phÈm ®­êng chØ cã thÓ lµ ng­êi ch­a gÆp thêi, thªm vµo vâ c«ng cao c­êng, kh«ng ph¶i lµ ta dÔ dµng ®ãn nhËn, chuyÖn chiªu mé nhÊt ®Şnh kh«ng thÓ miÔn c­ìng råi. Chi b»ng cø theo c¶m høng, tËn t×nh luËn vâ, trªn ®êi nµy cã chuyÖn g× vui thİch h¬n viÖc trau dåi vâ häc? lµm sao cã thÓ bá qua ®èi thñ ®¸ng gêm nµy? Êy...Hay lµ trong khi chê ®îi anh ta c¾t ®øt t©m sù, chóng ta so tµi mét chót?",
	}

	TalkEx("task_015_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_015_01_0_1()

local strTalk = {
	"V·n bèi kh«ng d¸m, hay lµ ®Ó v·n bèi chia sÏ bít mét vµi viÖc gióp tiÒn bèi. TiÒn bèi cã ®iÒu chi c¨n dÆn?",
	"Tèt, thiÕu niªn trÎ tuæi th× nªn rÌn luyÖn nhiÒu. Nh­ng ta ®· giao viÖc vµo Hoµng L¨ng cho Tr¶o V­¬ng mét trong ThËp ®¹i kim cang. NÕu kh«ng cã g× thay ®æi th× vËt phÈm mµ ta nhËn ®­îc nhÊt ®Şnh sÏ ë trong r­¬ng ë L¨ng mé tÇng 2. Sau khi th¨m dß th× ng­êi gi÷ r­¬ng chİnh lµ Quû t­íng qu©n, ta sî r»ng viÖc nµy qu¸ khã, ng­¬i kh«ng ®ñ søc, cho nªn ®· giao cho Tr¶o V­¬ng lµm. Ng­¬i ®õng lo, cø luyÖn tËp cho giái, sau nµy sÏ cßn nhiÒu c¬ héi thö søc.",
	"(Kh«ng ®­îc råi, Tr¶o V­¬ng qu¶ nhiªn ®· b¾t ®Çu hµnh ®éng, NhÊt PhÈm §­êng ®· cã t×nh b¸o chİnh x¸c nh­ thÕ, nÕu kh«ng v©y ®¸nh Tr¶o V­¬ng th× e r»ng b¹i sù ¾t thµnh, kh«ng cßn ®­êng rót lui.)",
	"MÆc dï ta kh«ng giao cho ng­¬i viÖc nµy, nh­ng ng­¬i vÉn cè hÕt søc mµ kh«ng than v·n, thËt lµ ®¸ng khen. Ta sÏ th¨ng chøc cho ng­¬i thµnh NhÊt PhÈm §­êng Hæ Dùc, kÓ tõ h«m nay, hÔ NhÊt PhÈm §­êng kim cang nh×n thÊy danh hiÖu nµy, th× sÏ s½n sµng hîp t¸c cïng ng­¬i.",
	"§a t¹ tiÒn bèi ®· quan t©m ®Ò b¹t, t¹i h¹ xin c¸o tõ."
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,23);
	TaskTip("§Õn Hoµng l¨ng mé tÇng 1 giÕt chÕt Tr¶o V­¬ng lÊy Ph¸ phong chïy më th«ng ®¹o tÇng 2.");
	Msg2Player("§Õn Hoµng l¨ng mé tÇng 1 giÕt chÕt Tr¶o V­¬ng lÊy Ph¸ phong chïy më th«ng ®¹o tÇng 2.");
	add_xb_title(4);
	GivePlayerExp(SkeyXibei,"pofengchui")
end

--ÉĞÎ´É±ËÀ×¦ÍõÓëÍØ°Îºë¶Ô»°
function task_015_01_1()

local strTalk = {
	"NÕu kh«ng cã g× thay ®æi th× vËt phÈm mµ ta nhËn ®­îc nhÊt ®Şnh sÏ ë trong r­¬ng ë L¨ng mé tÇng 2. Sau khi th¨m dß th× ng­êi gi÷ r­¬ng chİnh lµ Quû t­íng qu©n, ta sî r»ng viÖc nµy qu¸ khã, ng­¬i kh«ng ®ñ søc, cho nªn ®· giao cho Tr¶o V­¬ng lµm. Ng­¬i ®õng lo, cø luyÖn tËp cho giái, sau nµy sÏ cßn nhiÒu c¬ héi thö søc.",
	"(Kh«ng ®­îc råi, Tr¶o V­¬ng qu¶ nhiªn ®· b¾t ®Çu hµnh ®éng, NhÊt PhÈm §­êng ®· cã t×nh b¸o chİnh x¸c nh­ thÕ, nÕu kh«ng v©y ®¸nh Tr¶o V­¬ng th× e r»ng b¹i sù ¾t thµnh, kh«ng cßn ®­êng rót lui.)"
	}

	TalkEx("",strTalk);

end

--ÒÑ¾­ÆÆ»µÒ»²ãËÄ¸ö·çË®Ñ¨ºÍÊØÄ¹ÈË¶Ô»°
function task_015_02_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(Zhenmushou_MapData));
local xWPos,yWPos,xPos,yPos = Zhenmushou_MapData[nMapDataIndex][1],Zhenmushou_MapData[nMapDataIndex][2],Zhenmushou_MapData[nMapDataIndex][3],Zhenmushou_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--Íæ¼ÒÈôÈÎÎñÊ§°ÜĞèÒª¹ı30·ÖÖÓ²ÅÄÜÖØĞÂË¢´¦ÕòÄ¹ÊŞ
	if GetTime()-GetTask(CREAT_ZHENMUSHOU_TIME)	>= 1800 then

		strTalk = {
			"Thñ mé nh©n: TrÊn mé linh thó ®· xuÊt hiÖn, mau tiªu diÖt!",
			"TrÊn mé linh thó: Gõ gõ!!!",
			"B¹n nh×n thÊy mét con vËt thËt lín xuÊt hiÖn ë ("..xPos..", "..yPos.."), ch¾c lµ TrÊn mé thó mµ LiÔu tiÒn bèi ®· nãi, mau tiÖu diÖt nã!"
			}

		SetTask(CREAT_ZHENMUSHOU_TIME,GetTime());--¼ÇÂ¼ÕòÄ¹ÊŞË¢ĞÂÊ±¼ä
		nNpcIndex = CreateNpc("TrÊn Mé Thó","TrÊn Mé Thó",513,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒÒ»²ã\\npc\\ÕòÄ¹ÊŞ.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		TaskTip("TrÊn mé thó xuÊt hiÖn ë  "..xPos..", "..yPos.." , mau ®Õn tÊn c«ng nã.")
		Msg2Player("TrÊn mé thó xuÊt hiÖn ë  "..xPos..", "..yPos.." , mau ®Õn ®¸nh b¹i nã vµ më th«ng ®¹o vµo l¨ng mé tÇng 2.");
		GivePlayerExp(SkeyXibei,"fengshuixue")
	else
		strTalk = {
			"Thñ mé nh©n: ……",
			"H×nh nh­ ch¼ng cã ph¶n øng g× c¶, cø c¸ch 30 phót lµ TrÊn mé thó xuÊt hiÖn, h·y ®îi mét lóc råi thö l¹i sau!"
			}

	end

	TalkEx("",strTalk);

end

--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´ÆÆ»µ·çË®Ñ¨ÓëÊØÄ¹ÈË¶Ô»°
function task_015_02_1()

local strTalk = {
	"Thñ mé nh©n: ……",
	"Theo lêi LiÔu tiÒn bèi, cÇn dïng §o¹n thñy chö vµ Ph¸ phong chïy, sau ®ã nhê sù gióp ®ì cña La Canh t×m 4 c¸i Phong thñy huyÖt ph¸ hñy chóng th× cã thÓ dô ®­îc TrÊn mé linh thó ë tÇng 2."
	};

	TalkEx("",strTalk);

end

--Ã»ÓĞÁìÈ¡ÈÎÎñÓëÊØÄ¹ÈË¶Ô»°
function task_015_02_2()

local strTalk = {
	"Thñ mé nh©n: ……",
	};

	TalkEx("",strTalk);

end

--ÒÑ¾­´òµ¹ËÄ¸öÕòÄ¹½«¾üºÍÊØÄ¹½«¾ü¶Ô»°
function task_015_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(GuiJiangJun_MapData));
local xWPos,yWPos,xPos,yPos = GuiJiangJun_MapData[nMapDataIndex][1],GuiJiangJun_MapData[nMapDataIndex][2],GuiJiangJun_MapData[nMapDataIndex][3],GuiJiangJun_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--Íæ¼ÒÈôÈÎÎñÊ§°ÜĞèÒª¹ı30·ÖÖÓ²ÅÄÜÖØĞÂË¢³ö¹í½«¾ü
	if GetTime()-GetTask(CREAT_GUIJIANGJUN_TIME)	>= 1800 then

		strTalk = {
			"Thñ mé t­íng qu©n: Quû t­íng qu©n ®· xuÊt hiÖn, mau ®¸nh!",
			"Quû t­íng qu©n: Gõ gõ!!!",
			"B¹n nh×n thÊy mét con vËt thËt lín xuÊt hiÖn ë ("..xPos..", "..yPos.."), ch¾c lµ Quû t­íng qu©n trong bøc th­ T©y H¹ ®· nh¾c ®Õn, mau ®¸nh b¹i nã vµ lÊy vËt phÈm trong b¶o r­¬ng!"
			}

		SetTask(CREAT_GUIJIANGJUN_TIME,GetTime());--¼ÇÂ¼¹í½«¾üË¢ĞÂÊ±¼ä
		nNpcIndex = CreateNpc("T©y B¾c Quû T­¬ng §Çu","Quû T­íng Qu©n",514,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\»ÊÁêÄ¹ÊÒ¶ş²ã\\npc\\¹í½«¾ü.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		Msg2Player("Quû t­íng qu©n xuÊt hiÖn ë  "..xPos..", "..yPos.."  , mau ®¸nh b¹i nã vµ lÊy vËt phÈm trong b¶o r­¬ng.")
		TaskTip("Quû t­íng qu©n xuÊt hiÖn ë  "..xPos..", "..yPos.."  , mau ®¸nh b¹i nã vµ lÊy vËt phÈm trong b¶o r­¬ng.");

	else

		strTalk = {
			"Thñ mé t­íng qu©n: ……",
			"H×nh nh­ ch¼ng cã ph¶n øng g× c¶, cø c¸ch 30 phót lµ Quû t­íng qu©n xuÊt hiÖn, h·y ®îi mét lóc råi thö l¹i sau!"
			}

	end

	TalkEx("",strTalk);

end

--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´ÆÆ»µ·çË®Ñ¨ÓëÊØÄ¹ÈË¶Ô»°
function task_015_03_1()

local strTalk = {
	"Thñ mé t­íng qu©n: ……",
	"Theo nh­ trong bøc th­ T©y H¹, nÕu ®¸nh b¹i 4 vŞ TrÊn mé t­íng qu©n §«ng Nam T©y B¾c th× cã thÓ ®¸nh thøc Quû t­íng qu©n ®ang gi÷ b¶o r­¬ng."
	};

	TalkEx("",strTalk);

end

--Ã»ÓĞÁìÈ¡ÈÎÎñÓëÊØÄ¹½«¾ü¶Ô»°
function task_015_03_2()

local strTalk = {
	"Thñ mé t­íng qu©n: ……",
	};

	TalkEx("",strTalk);

end

--´ò°Ü¹í½«¾üºóÓëË¾ÂíÃù·ç¶Ô»°
function task_015_04_0()

local strTalk = {
	"T­ M· tiÒn bèi, t¹i h¹ ®· t×m ®­îc Ngäc béi vµ MÆc ®Èu kiÕm, tiÒn bèi cã nhËn ra vËt nµy kh«ng?",
	"§©y lµ …..Minh phong quúnh ngäc yªn hµn, hång nhan t­¬ng t­ nan hoµn. Tõ Qu©n ®· ®eo ngäc nµy, vµ kh«ng hÒ th¸o xuèng bao giê, lÏ nµo….lÏ nµo….Tõ Qu©n…..",
	"TiÒn bèi….xin h·y nĞn ®au th­¬ng, t¹i h¹ kh«ng t×m thÊy thi thÓ trong mé, kh«ng chõng hiÒn thª cña «ng vÉn cßn sèng.",
	"……..",
	"………",
	"Trong l¨ng hiÓm ¸c trïng trïng, Tõ Qu©n e lµ lµnh İt d÷ nhiÒu, ®a t¹ <sex> ®· an ñi, ta còng kh«ng cÇn ph¶i tù lõa dèi m×nh, kh«ng t×m ®­îc thi thÓ cña Tõ Qu©n trong lßng ra còng ®· nghÜ ra ®­îc t×nh huèng xÊu nhÊt. ChuyÓn chóc phiªu linh nhÊt méng qui, ®·i nguyÖt tr× ®µi kh«ng thÖ thñy, thiªn ı bÊt l©n c¸nh triªm y, trÇn tİch nan tÇm tóc nguyÖn vi. MÆc ®Èu kiÕm nµy cÇn ®Ó lµm g× n÷a chø?",
	"TiÒn bèi………",
	}

	TalkEx("task_015_04_0_1",strTalk);

end

--Ğø¶Ô»°
function task_015_04_0_1()

local strTalk = {
	"Lµ mét thÇn binh th× sao chø? Sèng ë thÕ gian nµy chØ g©y h¹i cho nh©n gian, chi b»ng chÕt ®i cho xong. Vâ c«ng thiªn h¹ ®Ö nhÊt lµ c¸i g× c¬ chø? Cuèi cïng th× còng r¬i xuèng hè s©u nghiÖt ng·, kh«ng thÓ cïng nhau ®Õn ch©n trêi gèc bÓ, giê nh­ n­íc ch¶y ®«ng t©y.",
	"TiÒn bèi ®õng qu¸ ®au lßng, lÖnh thª biÕt ®­îc trong l¨ng mé cã ThÇn binh, ®­¬ng nhiªn lµ ph¶i biÕt c¸ch vµo mé, vµ thõa biÕt r»ng sÏ nguy hiÓm nh­ thÕ nµo, nh­ng c« ta bá qua tÊt c¶, mét lßng v× tiÒn bèi h­íng ®Õn ®Ønh ®iÓm cña Vâ ®¹o. C« ta hiÓu ®­îc tÊm lßng cña «ng, cã lÏ trªn thÕ gian nµy chØ cã c« ta míi hiÓu ®­îc ®iÒu ®ã. TiÒn bèi kh«ng nªn v× qu¸ ®au lßng mµ tõ bá tÊt c¶.",
	"………",
	"Cã lÏ ng­¬i ®óng, Tõ Qu©n th«ng minh lanh lîi nh­ thÕ, lÏ nµo kh«ng biÕt ®­îc lÇn ®i nµy khã cã ®­êng quay vÒ? Kú väng cña c« ta e r»ng l¹i lµ bÓ khæ cho ta, vµ e r»ng chØ cã kú väng cña c« ta míi cã thÓ gi¶i tho¸t ®­îc bÓ khæ cho ta. Ng­¬i lµ ng­êi tèt ta rÊt lÊy lµm c¶m kİch.",
	"TiÒn bèi kh«ng cÇn kh¸ch s¸o thÕ, trªn thÕ gian nµy vÉn cßn mét ng­êi cã thÓ hiÓu ®­îc tiÒn bèi, ®ã chİnh lµ Th¸c B¹t Ho»ng  tiÒn bèi.",
	}

	TalkEx("task_015_04_0_2",strTalk);

end

--Ğø¶Ô»°
function task_015_04_0_2()

local strTalk = {
	"Th¸c B¹t Ho»ng? Cã thÓ ng­¬i nãi ®óng. LÇn ®Çu gÆp mÆt, «ng ta ®· muèn thö søc cïng ta, sau nµy míi biÕt th× ra «ng ta muèn chiªu mé ta gia nhËp NhÊt PhÈm §­êng, nh­ng ta thÊy trong l¨ng TÇn Thñy Hoµng th­êng cã ng­êi T©y H¹ quanh quÈn, mµ hiÒn thª cña ta mÊt tİch ë l¨ng TÇn Thñy Hoµng, cho nªn khã tr¸nh khái viÖc nghi ngê bän T©y H¹ ®éc ¸c. Huèng hå NhÊt PhÈm §­êng l¹i lµ kÎ thï ®¸ng gêm cña vâ l©m §¹i Tèng, ta sao cã thÓ ph¶n l¹i qu©n m×nh? Ta cßn t­ëng r»ng «ng ta hÑn ra khiªu chiÕn v× lİ do kh«ng hµng th× giÕt, nh­ng kh«ng ngê ®¸nh ®­îc vµi chiªu th× míi biÕt r»ng ®ã chØ lµ muèn thö søc, chø kh«ng cßn ı muèn chiªu n¹p n÷a.",
	"ThËt ra Th¸c B¹t tiÒn bèi còng gièng nh­ «ng vËy, nghiªn cøu vâ ®¹o, am hiÓu tinh th«ng, ®Òu kh«ng muèn mµng ®Õn thÕ sù. ChuyÖn vÒ chiªu mé e r»ng Th¸c B¹t tiÒn bèi ®· kh«ng ®Ó trong lßng n÷a. ¤ng ta chØ muèn thö søc cïng «ng mµ th«i.",
	"§èi thñ tèt nh­ thÕ sao cã thÓ bá lì ®­îc? Ng­¬i h·y nãi víi Th¸c B¹t Ho»ng , 3 ngµy sau ta sÏ viÕng th¨m. §óng råi, <sex> ®õng tr¸ch ta nãi th¼ng, NhÊt PhÈm §­êng lµ mét tæ chøc thÊp hÌn nh­ thÕ, thËt sù kh«ng phï hîp nh÷ng ng­êi cã phÈm chÊt cao sang nh­ Th¸c B¹t Ho»ng vµ ng­¬i. <sex> lµ con d©n §¹i Tèng, nh×n thÊy thiªn h¹ lo¹n l¹c nh­ hiÖn nay, th× giang s¬n còng khã mµ yªn æn, ng­êi giang hån nªn v× quèc gia mµ gãp søc, sao l¹i muèn b¸n ®øng quèc gia nh­ thÕ? Ta nghÜ «ng ta nªn sím rêi khái NhÊt PhÈm §­êng, ®Ó tr¸nh ph¶i hèi tiÕc vÒ sau.",
	"TiÒn bèi….lêi cña «ng nãi t«i sÏ ghi kh¾c trong lßng, t¹i h¹ xin phĞp c¸o tõ, chuyÓn t©m ı cña «ng ®Õn Th¸c B¹t tiÒn bèi.",
	"(¤i….kh«ng biÕt t×nh h×nh sai dŞch cña Viªn Phi V©n nh­ thÕ nµo råi, cã thÓ kh¾p trong thiªn h¹ chØ cã anh ta hiÓu ®­îc c¶m nhËn cña ta lóc nµy, nh­ng sù viÖc vÉn ch­a ®­îc hoµn thµnh, cÇn ph¶i nhÉn n¹i nhiÒu h¬n, nh÷ng sù hiÓu lÇm ®µnh xem nh­ lµ ®éng lùc mµ th«i.)"
	}

	TalkEx("task_015_04_0_3",strTalk);

end

--·¢½±Àø
function task_015_04_0_3()

	give_zb_award(34);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		SetTask(TASK_XB_ID_01,29);
		DelItem(2,0,718,1);--É¾È¥Ä«¶·
		DelItem(2,0,719,1);--É¾È¥ÓñÅå
		DelItem(2,0,710,1);--É¾È¥½ğË¿ÃæÕÖ
		DelItem(2,0,716,1);--É¾È¥Î÷ÏÄ·¨ÍõÃÜº¯
		TaskTip("Håi b¸o Th¸c B¹t Ho»ng vÒ viÖc T­ M· Minh Phong ®· ®ång ı tû vâ.");
		Msg2Player("Håi b¸o Th¸c B¹t Ho»ng vÒ viÖc T­ M· Minh Phong ®· ®ång ı tû vâ.");
		GivePlayerAward("Award_XB_34","Easy");
		GivePlayerExp(SkeyXibei,"guijiangjun")
	end
end

--ÉĞÎ´»ã±¨ÍØ°Îºë
function task_015_04_1()

local strTalk = {
	"Ng­¬i h·y nãi víi Th¸c B¹t Ho»ng , 3 ngµy sau ta sÏ viÕng th¨m. <sex> ®õng tr¸ch ta nãi th¼ng, <sex> lµ con d©n §¹i Tèng, nh×n thÊy thiªn h¹ lo¹n l¹c nh­ hiÖn nay, th× giang s¬n còng khã mµ yªn æn, ng­êi giang hån nªn v× quèc gia mµ gãp søc, sao l¹i muèn b¸n ®øng quèc gia nh­ thÕ? Ta nghÜ «ng ta nªn sím rêi khái NhÊt PhÈm §­êng, ®Ó tr¸nh ph¶i hèi tiÕc vÒ sau."
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø16·ÖÖ§1_7Ò©ÈË¾ªÏÖ----------------------------------
--½«Ä«¶·ºÍÓñÅå½»¸øÃù·çºóÓëÍØ°Îºë¶Ô»°
function task_016_01_0()

local strTalk = {
	"§· mét thêi gian råi, Tr¶o V­¬ng cã thÓ vµo ®­îc l¨ng mé hay kh«ng, còng ph¶i håi b¸o mét tiÕng chø. Bªn Xa Lu©n l¹i ph¸i ng­êi ®Õn ®èc thóc, viÖc r¾c rèi nµy thËt khiÕn ta nhøc ®Çu.",
	"(Kh«ng ®­îc, Tr¶o V­¬ng ®· chÕt, viÖc nµy ph¶i bµn giao nh­ thÕ nµo ®©y? Th«i, NhÊt PhÈm §­êng ®Õn nay vÉn ch­a vµo mé, cã thÓ che dÊu ®­îc bao nhiªu th× dÊu vËy, ph¶i cÈn thËn chµo hái th× míi ®­îc.)",
	"Th¸c B¹t tiÒn bèi kh«ng cÇn ph¶i lo l¾ng, tÇng 2 l¨ng mé lµ mét n¬i rÊt nguy hiÓm, ®îi thªm vµi ngµy n÷a xem sao. §óng råi, T­ M· tiÒn bèi b¶o t«i nh¾n lêi víi «ng, t©m sù cña «ng ta ®· ®­îc gi¶i quyÕt, mÆc dï kh«ng thÓ t×m ®­îc hiÒn thª, th× ®µnh g¸c qua mét bªn vËy, «ng ta hÑn «ng ba h«m sau sÏ ®Êu.",
	"Cã thËt nh­ thÕ kh«ng? Qu¸ tèt, qu¸ tèt, Ha ha…, T­ M· Minh Phong thËt sù khiÕn ta rÊt sèt ruét. Chiªu thøc cña «ng ta, ta vÉn ch­a ph¸ gi¶i hÕt, chØ ®îi lÇn nµy thi thè, ta sÏ cã thÓ th­ëng thøc toµn bé chiªu thøc råi.",
	}

	TalkEx("task_016_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_016_01_0_1()

local strTalk = {
	"Th¸c B¹t tiÒn bèi võa nãi ®Õn chiªu thøc, võa lé nĞt phiÒn n·o, nh­ng sinh khİ l¹i dåi dµo. NÕu kh«ng ph¶i v× viÖc «ng chiªu mé T­ M· tiÒn bèi vµo ®­êng mµ cã thÓ so tµi víi mét ®èi thñ ngang tÇm, th× e r»ng tiÒn bèi còng khã mµ chŞu ®­îc c¶m gi¸c c« ®¬n cña mét ng­êi ®øc cao väng träng.",
	"C« ®¬n cña mét ng­êi ®øc cao väng träng th× h¬i qu¸, nh­ng th­êng lµ c¶m gi¸c c« qu¹nh. Ta b×nh sinh nghiªn cøu vâ ®¹o, c¶ ®êi cè c«ng theo ®uæi, râ biÕt thiªn h¹ rÊt réng lín, khã t×m ®­îc ng­êi v« ®Şch. Cho nªn ta míi ®Õn T©y H¹, muèn t×m ®èi thñ thö søc mét phen. VÒ sau cã gÆp Lı Nguyªn Kh¸nh, «ng ta nãi vâ häc T©y H¹ kh«ng th©m s©u uyªn b¸c nh­ §¹i Tèng. Ng­êi T©y H¹ yªu thİch vâ, ng­êi §¹i Tèng l¹i tinh th«ng vâ, b¶o ta gia nhËp NhÊt PhÈm §­êng ®Ó trùc tiÕp nghe lÖnh cña «ng ta, «ng ta cã thÓ gióp ta t×m ®­îc cao thñ §¹i Tèng, gióp ta hoµn thµnh t©m nguyÖn cña m×nh.",
	"Th× ra lµ vËy, T­ M· Minh Phong chİnh lµ cao thñ mµ «ng ta gióp «ng t×m µ?",
	}

	TalkEx("task_016_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_016_01_0_2()

local strTalk = {
	"å…mÆc dï nãi lµ t×m cao thñ §¹i Tèng, nh­ng th­êng nhiÖm vô cø ®Ì trªn vai ta, b×nh th­êng còng cã rÊt nhiÒu viÖc khã gi¶i quyÕt cÇn ta xö lı, rÊt phiÒn phøc. Nh­ng Lı Nguyªn Kh¸nh xem ra còng gi÷ lêi høa ®Êy, t×m gióp ta rÊt nhiÒu cao thñ, lÇn nµy cã thÓ gÆp ®­îc T­ M· Minh Phong, xem ra Lı Nguyªn Kh¸nh ®· lµm mét viÖc khİÕn ta to¹i nguyÖn. NhiÖm vô th× cø xem nh­ ta b¸o ®¸p ¬n cña «ng Êy vËy. Nh­ng nhiÖm vô lÇn nµy thËt kú l¹, khã kh¨n v« cïng. Ng­¬i ®i nãi víi Xa Lu©n B¸ V­¬ng , viÖc vµo mé khã cã tiÕn triÓn, b¶o «ng Êy ®îi thªm mét thêi gian.",
	"§­îc, tiÒn bèi ®õng lo l¾ng, cø chuÈn bŞ ®ä søc cïng T­ M· Minh Phong. Mäi viÖc cø ®Ó t¹i h¹ xö lı.",
	"(Th¸c B¹t Ho»ng  xem ra cµng lóc cµng ch¸n NhÊt PhÈm §­êng, «ng ta lµ T©y H¹ ®Ö nhÊt dòng sÜ, NhÊt PhÈm §­êng lín m¹nh lµ nhê «ng ta, mµ Th¸c B¹t Ho»ng lµ mét kÎ §¹o vâ chİnh cèng, b¶n chÊt còng kh«ng ph¶i thÊp hÌn nh­ NhÊt PhÈm §­êng. NÕu cã thÓ c¸ch ly quan hÖ cña «ng ta vµ NhÊt PhÈm §­êng, kh«ng chõng cã thÓ gì bá ®­îc sù rµng buéc cho «ng ta, mµ cßn cã thÓ lµm lung lay thùc lùc cña NhÊt PhÈm §­êng. Ph¶i nghÜ c¸ch míi ®­îc.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,30);
	TaskTip("Quay vÒ håi b¸o Xa Lu©n B¸ V­¬ng vÒ t×nh h×nh l¨ng mé.");
	Msg2Player("Quay vÒ håi b¸o Xa Lu©n B¸ V­¬ng vÒ t×nh h×nh l¨ng mé.");

end

--Î´Óë³µÂÖ»ã±¨¹ØÓÚÁêÄ¹µÄÇé¿ö
function task_016_01_1()

local strTalk = {
	"NhiÖm vô lÇn nµy thËt kú l¹, khã kh¨n mu«n trïng. Ng­¬i ®i b¸o víi Xa Lu©n B¸ V­¬ng , viÖc vµo mé khã mµ tiÕn triÓn ®­îc, b¶o «ng ta ®îi thªm mét thêi gian n÷a.",
	}

	TalkEx("",strTalk);

end

--Óë³µÂÖ»ã±¨¹ØÓÚÁêÄ¹µÄÇé¿ö
function task_016_02_0()

local strTalk = {
	"ThÕ nµo? Th¸c B¹t Ho»ng ®· hoµn thµnh viÖc vµo mé ch­a?",
	"Th¸c B¹t tiÒn bèi ®· giao viÖc ®ã cho Tr¶o V­¬ng xö lı, e r»ng trong mé C¬ quan trïng trïng, khã mµ thùc hiÖn, «ng ta b¶o «ng chê thªm mét thêi gian n÷a, hiÖn giê «ng ta ®ang chuÈn bŞ cho viÖc chiªu mé T­ M· Minh Phong.",
	"C¸i g×? L¹i lµ T­ M· Minh Phong? NÕu chiªu mé kh«ng ®­îc, th× giÕt qu¸ch ®i kh«ng hay h¬n µ? Th¸c B¹t Ho»ng  cµng lóc cµng lµm nh÷ng viÖc kh«ng ®©u. ViÖc vµo mé nªn ®İch th©n ®i lµm th× l¹i, t¹i sao l¹i ®Ó cho Tr¶o V­¬ng lµm chø? E r»ng viÖc T­ M· Minh Phong còng kh«ng ph¶i lµm v× nhiÖm vô, «ng ta muèn tho¸t khái viÖc nµy, ®Ó tû vâ ví vÈn g× ®ã.",
	"Th¸c B¹t tiÒn bèi thİch sù tù do, nghiªn cøu vâ ®¹o, e r»ng viÖc lµm nhiÖm vô kh«ng ph¶i lµ ı muèn cña «ng ta, cã miÔn c­ìng còng v« İch, nÕu lµm «ng ta næi giËn, rêi khái NhÊt PhÈm §­êng th× lµ tæn thÊt cho chóng ta råi.",
	}

	TalkEx("task_016_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_016_02_0_1()

local strTalk = {
	"Hõm, NhÊt PhÈm §­êng lµ chç «ng ta nãi ®Õn lµ ®Õn nãi ®i lµ ®i sao? Ng­êi cña NhÊt PhÈm §­êng th× ph¶i v× lîi İch cña NhÊt PhÈm §­êng, Lı Nguyªn Kh¸nh ®¹i nh©n thËt lµ qu¸ dung tóng cho «ng ta råi. Th«i ®i, th«i ®i, ng­êi nµy mÆc dï vâ c«ng cao th©m, nh­ng rÊt khã ®iÒu khiÓn. µ, ng­¬i trë thµnh §­êng Hæ Dùc cña ta lóc nµo? Ch¾c lµ do Th¸c B¹t Ho»ng th¨ng chøc cho ng­¬i ®óng kh«ng? Tèt, Th¸c B¹t Ho»ng lµm viÖc kh«ng tåi, tÇm nh×n rÊt tèt. §­êng Hæ Dùc cã thÓ hîp t¸c lµm viÖc víi ThËp §¹i Kim Cang vµ Ph¸p V­¬ng, vµ ph¶i kh«ng ngõng rÌn luyÖn!",
	"ThÕ th× tèt qu¸, t¹i h¹ nhÊt ®Şnh kh«ng phô lßng mong mái. Xin cø c¨n dÆn.",
	"ViÖc Hoµng l¨ng cø ®Ó Tr¶o V­¬ng lµm ®i, kiªn nhÉn ®îi tin tøc lµ ®­îc råi. LÇn nµy NhÊt PhÈm §­êng ®Õn Phông T­êng , lµ v× muèn t¨ng thªm thùc lùc qu©n ®éi T©y H¹, môc tiªu dÜ nhiªn chİnh lµ §¹i Tèng. Ng­¬i ch¾c biÕt Phông T­êng phñ b¾c cã c¸i D­îc V­¬ng §éng chø? N¬i nµy lÊy tªn lµ D­îc V­¬ng, lµ do mét ng­êi ®am mª d­îc mÊy n¨m tr­íc bŞ hoang t­ëng cña sa m¹c, ®· t×m ®Õn s¬n ®éng thÇn bİ nµy, trong ®éng chøa ®Çy c¸c lo¹i kú hoa dŞ th¶o, lµ nh÷ng d­îc liÖu hiÕm thÊy trªn thÕ gian. Ng­êi nµy gièng nh­ lµ b¾t ®­îc vµng, ®Õn giê vÉn kh«ng muèn rêi s¬n ®«ng nöa b­íc, tù nhËn lµ D­îc V­¬ng, còng chİnh lµ tªn cña ®éng nµy.",
	"T«i ®· ®Õn qua D­îc V­¬ng ®éng, ë ®ã cã rÊt nhiÒu ng­êi T©y H¹, cã viÖc g× thÕ?",
	}

	TalkEx("task_016_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_016_02_0_2()

local strTalk = {
	"Ng­êi cña ta ®· th¨m dß ®­îc D­îc V­¬ng gÇn ®©y ®· nghiªn cøu ®­îc BÊt tö D­îc nh©n, Ph¸p V­¬ng cña ta ®· th­¬ng l­îng cïng víi D­îc V­¬ng, muèn dïng pha chÕ D­îc nh©n, cã thÓ t¨ng c­êng thùc lùc cña qu©n ®éi.",
	"BÊt tö D­îc nh©n lµ vËt g× vËy? Rèt cuéc lµ nã cã søc m¹nh nh­ thÕ nµo?",
	"§­¬ng nhiªn, D­îc nh©n chİnh lµ BÊt tö nh©n do D­îc V­¬ng khæ c«ng nghiªn cøu thµnh, ch¾c lµ dïng nh÷ng d­îc liÖu ®Æc biÖt ®Ó t¹o thµnh, c¬ thÓ rÊt c­êng tr¸ng, m¹nh mÏ v« cïng, vµ kh«ng biÕt ®au ®ín lµ g× c¶, nÕu bŞ th­¬ng th× sÏ tù ®éng phôc håi. Lµ mét kú binh m·nh t­íng x«ng pha chiÕn trËn. Tháa thuËn cña Ph¸p V­¬ng còng s¾p hoµn thµnh råi, ng­¬i h·y ®Õn D­îc V­¬ng cèc hiÖp trî cïng «ng ta xö lı viÖc nµy.",
	"Qu¶ nhiªn cã lo¹i D­îc nh©n kú dŞ nµy µ, vËy th× t«i sÏ ®i t×m Ph¸p V­¬ng ngay.",
	"(Kh«ng ®­îc, NhÊt PhÈm §­êng ©m m­u quû kÕ thËt khã l­êng, chuyÖn D­îc nh©n rèt cuéc lµ nh­ thÕ nµo nhØ? NÕu thËt nh­ Xa Lu©n B¸ V­¬ng ®· nãi, th× qu©n ®éi T©y H¹ qu¶ lµ hiÓm häa lín cho §¹i Tèng, ph¶i t×m ¢u D­¬ng Häa tiÒn bèi ®Ó th­¬ng l­îng.)",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,31);
	TaskTip("T×m ¢u D­¬ng Häa tiÒn bèi th­¬ng l­îng vÒ viÖc D­îc nh©n.");
	Msg2Player("T×m ¢u D­¬ng Häa tiÒn bèi th­¬ng l­îng vÒ viÖc D­îc nh©n.");
	GivePlayerAward("Award_XB_35","Easy");
	GivePlayerExp(SkeyXibei,"yaowang")
end

--»¹Î´ÓëÅ·Ñô»­»ã±¨Ò©ÈËÒ»ÊÂ
function task_016_02_1()

local strTalk = {
	"T©y H¹ Ph¸p V­¬ng ®· b¾t ®Çu tháa thuËn víi D­îc V­¬ng, lóc nµy ch¾c ®ang ë [D­îc V­¬ng cèc. NÕu cã ®­îc c¸ch pha chÕ D­îc nh©n, th× thùc lùc cña qu©n ta sÏ t¨ng d÷ déi.",
	}

	TalkEx("",strTalk);

end

--ÓëÅ·Ñô»­»ã±¨¹ØÓÚÒ©ÈËÒ»ÊÂ
function task_016_03_0()

local strTalk = {
	"¢u D­¬ng tiÒn bèi, cã viÖc kh«ng lµnh råi, t¹i h¹ biÕt ®­îc mét ©m m­u kh¸c cña NhÊt PhÈm §­êng. T©y H¹ ®· cÊu kÕt víi D­îc V­¬ng, ®Şnh lîi dông D­îc nh©n ®Ó t¨ng c­êng søc m¹nh qu©n ®éi, vµ ®îi thêi c¬ ®Ó x©m chiÕm Tèng. Ngoµi ra L¨ng TÇn Thñy Hoµng kh«ng cã manh mèi vÒ b¶n ®å S¬n Hµ X· T¾c nh­ chóng ta dù kiÕn, c¬ quan trong mé rÊt m¹nh, ch¾c ch¾n lµ cã rÊt nhiÒu Ho¹t nh©n dòng.",
	"D­îc V­¬ng? M¹ng l­íi t×nh b¸o cña NhÊt PhÈm §­êng qu¶ nhiªn danh bÊt h­ truyÒn, ng­êi bİ Èn nh­ thÕ mµ còng cã thñ ®o¹n øng phã. D­îc V­¬ng tİnh t×nh qu¸i ®¶n, thİch nghiªn cøu nh÷ng lo¹i d­îc th¶o kú dŞ, nghe nãi D­îc nh©n lµ nghiªn cøu t©m ®¾c nhÊt cña «ng ta, BÊt thèng bÊt tö, D­îc V­¬ng nÕu tiÕp tay víi T©y H¹, th× qu©n ®éi T©y H¹ sÏ mÆc søc tung hoµnh thiªn h¹.",
	"D­îc nh©n e r»ng ®· xuÊt hiÖn trong D­îc V­¬ng ®éng, hay lµ ®Ó t¹i h¹ ®i th¸m thİnh mét chuyÕn.",
	"Nh­ thÕ cµng tèt, nÕu trong l¨ng TÇn Thñy Hoµng kh«ng cã b¶n ®å S¬n Hµ X· T¾c, th× t¹m dõng viÖc nµy l¹i. NÕu ng­êi T©y H¹ cã ®­îc D­îc nh©n th× hËu qu¶ sÏ khã l­êng. Ng­¬i h·y ®Õn D­îc V­¬ng ®éng tr­íc tiªu diÖt sè D­îc nh©n ®ã ®Ó tr× ho·n kÕ ho¹ch cña ng­êi T©y H¹, khi tiªu diÖt bän D­îc nh©n nhí kh«ng ®­îc bøt d©y ®éng rõng, tr¸nh ®Ó cho Ph¸p V­¬ng T©y H¹ ph¸t gi¸c.",
	"T¹i h¹ sÏ cè g¾ng cÈn thËn, khi nµo cã vÊn ®Ò g× kh¸c t¹i h¹ sÏ quay vÒ håi b¸o tiÒn bèi.",
	}

	SetTask(TASK_XB_ID_01,32);
	TalkEx("",strTalk);
	CreateTrigger(0,1235,KILL_XB_YAOREN);--Ò©ÈËÉ±¹Ö´¥·¢Æ÷
	TaskTip("§Õn D­îc V­¬ng ®éng, tiªu diÖt 30 tªn D­îc nh©n.");
	Msg2Player("§Õn D­îc V­¬ng ®éng, tiªu diÖt 30 tªn D­îc nh©n.");

end

--»¹Î´É±ËÀ30Ò©ÈË
function task_016_03_1()

local strTalk = {
	"Ng­¬i ®Õn D­îc V­¬ng ®éng tiªu diÖt D­îc nh©n tr× ho·n kÕ ho¹ch cña ng­êi T©y H¹, khi tiªu diÖt D­îc nh©n nhí kh«ng ®­îc bøt d©y ®éng rõng, tr¸nh ®Ó Ph¸p V­¬ng T©y H¹ ph¸t hiÖn.",
	}

	if	GetTrigger(KILL_XB_YAOREN) == 0 then
		CreateTrigger(0,1235,KILL_XB_YAOREN);--Ò©ÈËÉ±¹Ö´¥·¢Æ÷
		TaskTip("§Õn D­îc V­¬ng ®éng, tiªu diÖt 30 tªn D­îc nh©n.");
		Msg2Player("§Õn D­îc V­¬ng ®éng, tiªu diÖt 30 tªn D­îc nh©n.");
	end

	TalkEx("",strTalk);

end

--ÏûÃğ30Ò©ÈËºóÏòÅ·Ñô»­»ã±¨Çé¿ö
function task_016_04_0()

local strTalk = {
	"TiÒn bèi, t¹i h¹ ®· tiªu diÖt mét sè D­îc nh©n, D­îc nh©n qu¶ nhiªn rÊt khã ®èi phã, kh«ng nh÷ng c­êng tr¸ng kháe m¹nh, mµ l¹i kh«ng ngõng håi sinh, nhiÒu v« sè kÓ.",
	"Nguy to, chØ sî D­îc V­¬ng ®· ®ång ı chÕ t¹o D­îc nh©n cho ng­êi T©y H¹, cho nªn míi s¶n sinh ra sè l­îng lín nh­ thÕ. Bän D­îc nh©n ®ã kh«ng thÓ dïng c¸ch th«ng th­êng mµ ®èi phã ®­îc. Muèn giÕt D­îc nh©n th× ph¶i biÕt ®­îc ph­¬ng ph¸p chÕ t¹o cña nã, nÕu kh«ng th× còng uæng phİ c«ng søc mµ th«i.",
	"D­îc nh©n lµ mét nghiªn cøu t©m ®¾c nhÊt cña D­îc V­¬ng, kh«ng dÔ g× biÕt ®­îc, hay lµ trùc tiÕp t×m D­îc V­¬ng?",
	"Kh«ng æn, kh«ng biÕt thùc h­ nh­ thÕ nµo kh«ng nªn ®­êng ®ét hµnh ®éng kh«ng chõng m¾c kÕ. V¶ l¹i hiÖn giê Ph¸p V­¬ng T©y H¹ vµ D­îc V­¬ng ®ang th­¬ng th¶o víi nhau, nÕu gÆp ph¶i hä, ng­¬i sÏ mÊt ®i c¬ héi hµnh ®éng. Hay lµ ng­¬i ®Õn gÇn khu D­îc V­¬ng cèc th¸m thİnh xem cã ai biÕt ®­îc t×nh h×nh D­îc V­¬ng ®éng, t×m hä ®Ó t×m hiÓu t×nh h×nh, biÕt ng­êi biÕt ta tr¨m trËn tr¨m th¾ng, kh«ng chõng sÏ biÕt ®­îc mét vµi tin tøc vÒ D­îc nh©n.",
	"TiÒn bèi nãi rÊt ph¶i, nªn ®¸nh vµo nh­îc ®iÓm cña kÎ ®Şch th× míi cã hiÖu qu¶ ®­îc, ®Ó t¹i h¹ ®i th¸m thİnh thö xem cã ai hiÓu râ néi t×nh bªn trong kh«ng, cã vÊn ®Ò g× t¹i h¹ sÏ quay vÒ cïng b¸n tİnh víi tiÒn bèi.",
	}

	SetTask(TASK_XB_ID_01,34);
	TalkEx("",strTalk);
	TaskTip("T×m ¢u D­¬ng Häa tiÒn bèi th­¬ng l­îng vÒ viÖc D­îc nh©n.");
	Msg2Player("T×m ¢u D­¬ng Häa tiÒn bèi th­¬ng l­îng vÒ viÖc D­îc nh©n.");
	GivePlayerAward("Award_XB_36","Easy");
	GivePlayerExp(SkeyXibei,"yaoren")
end

--»¹Î´ÓëÁõÈı¶Ô»°Ç°ÓëÅ·Ñô»­¶Ô»°
function task_016_04_1()

local strTalk = {
	"Hay lµ ng­¬i ®Õn gÇn khu D­îc V­¬ng cèc th¸m thİnh xem cã ai biÕt ®­îc t×nh h×nh D­îc V­¬ng ®éng, t×m hä ®Ó t×m hiÓu t×nh h×nh, biÕt ng­êi biÕt ta tr¨m trËn tr¨m th¾ng, kh«ng chõng sÏ biÕt ®­îc mét vµi tin tøc vÒ D­îc nh©n.",
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø17·ÖÖ§1_8ÆæÒìÖ®²İ----------------------------------
--ÓëÁõÈı¶Ô»°´ğÓ¦°ïËûÊÕ¼¯20Ç§ÄêÎÚÄ¾
function task_017_01_0()

local strTalk = {
	"B¹n trÎ, nªn x­ng h« nh­ thÕ nµo ®©y? Sao l¹i ®øng ë ®©y? D­îc V­¬ng cèc nguy hiÓm trïng trïng, nÕu kh«ng cã viÖc g×, th× mau rêi khái ®©y ®i.",
	"<sex> c¶m ¬n ng­¬i ®· quan t©m, ta lµ L­u Tam. Ta biÕt n¬i nµy nguy hiÓm, ®øng ë ®©y ta còng rÊt lo sî. Nh­ng v× ng­êi T©y H¹ ra vµo D­îc V­¬ng ®éng, th­êng mang ra mét İt ¤ Méc ®Ó b¸n cho ta, sè ¤ méc nµy cã thÓ b¸n kiÕm mét İt tiÒn, cho nªn ta míi ®øng ®©y ®îi. NÕu kh«ng v× miÕng ¨n th× ta ®· rêi khái tõ l©u råi.",
	"Ta chØ nghe nãi D­îc V­¬ng ®éng cã rÊt nhiÒu kú hoa dŞ th¶o, kh«ng ngê cßn cã gç n÷a µh? Sao ng­¬i cã thÓ biÕt ®­îc t×nh h×nh trong ®éng?",
	"µ, ta ®èn gç m­u sinh. Nh­ng Phông T­êng  mÊy n¨m gÇn ®©y b·o c¸t qu¸ nhiÒu, hÇu nh­ tiªu hïy hÕt c©y cèi. H«m nä ta v« t×nh ®i qua ®©y, ph¸t hiÖn gÇn cöa hang D­îc V­¬ng ®éng cã mét sè ¤ Méc ngµn n¨m rÊt quİ gi¸, ta liÒn nhÆt ®em b¸n. Sau ®ã muèn vµo ®éng t×m xem cßn gç n÷a kh«ng, kh«ng ngê suıt chót th× kh«ng cßn m¹ng quay vÒ.",
	}

	TalkEx("task_017_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_017_01_0_1()

local strTalk = {
	"Ng­¬i ®· vµo ®éng råi µ, nghe nãi D­îc nh©n trong ®éng dòng m¹nh v« cïng, sao ng­¬i cã thÓ tho¸t ®­îc?",
	"¢y da, nh¾c ®Õn bän D­îc nh©n thËt ®¸ng sî, c¶ ®êi ta còng ch­a nh×n thÊt vËt g× ghª gím nh­ thÕ. Lóc ®ã ta chØ muèn trém mét İt gç trªn ng­êi Thô nh©n, kh«ng ngê bŞ D­îc nh©n ph¸t hiÖn, liÒn ®Õn b¾t ta, ta lµm sao chèng næi h¾n, cho nªn ®µnh ph¶i ngoan ngo·n ®Ó h¾n b¾t vÒ chç D­îc V­¬ng, D­îc V­¬ng nh×n thÊy ng­êi sèng nh­ b¾t ®­îc vµng, ®Şnh ®em ta lµm thµnh D­îc nh©n. Ta nghÜ lóc ®ã còng khã sèng sãt, nh©n lóc cã mÊy ng­êi T©y H¹ ®Õn, D­îc V­¬ng bËn tiÕp kiÕn hä, ta liÒn bá trèn.",
	"Ng­¬i nãi D­îc V­¬ng muèn ®em ng­¬i lµm thµnh D­îc nh©n µ? Ng­¬i cã thÓ nãi râ cho ta vÒ chuyÖn D­îc nh©n kh«ng?",
	"Nh÷ng tªn D­îc nh©n ®¸ng sî ®ã kh«ng biÕt lµ ng­êi hay lµ quû, <sex> sao l¹i cã høng thó thÕ? Nh­ng <sex> lµ ng­êi trong vâ l©m, nÕu <sex> ®ång ı gióp ta vµo ®éng mét chuyÕn, lÊy hé ta ¤ Méc ngµn n¨m trªn ng­êi Thô nh©n, th× ta sÏ kÓ cho nghe chuyÖn D­îc nh©n.",
	"ChØ lµ viÖc nhá, ta cßn ®ang lo l¾ng kh«ng biÕt nªn b¸o ®¸p cho ng­¬i thÕ nµo ®©y.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,35);
	CreateTrigger(0,1236,KILL_XB_QIANNIANSHUREN);--Ç§ÄêÊ÷ÈËÉ±¹Ö´¥·¢Æ÷
	TaskTip("Gióp L­u Tam ®Õn D­îc V­¬ng ®éng thu thËp 20 c©y ¤ Méc ngµn n¨m trªn ng­êi Thô nh©n.");
	Msg2Player("Gióp L­u Tam ®Õn D­îc V­¬ng ®éng thu thËp 20 c©y ¤ Méc ngµn n¨m trªn ng­êi Thô nh©n.");

end

--´ø»Ø»òÎ´´ø»Ø20Ç§ÄêÎÚÄ¾ÎïÆ·
function task_017_02_0()

local strTalk = {};

	--´ø»Ø20Ç§ÄêÎÚÄ¾ÎïÆ·
	if GetItemCount(2,0,720) >= 20 then
		strTalk = {
			"Anh b¹n nhá, ng­¬i xem cã ph¶i ®©y lµ ¤ Méc mµ ng­¬i cÇn kh«ng?",
			"¸i chµ, thËt c¶m ¬n ng­¬i, nhiÒu nh­ thÕ µ, ta cã thÓ sèng mét thêi gian mµ kh«ng cÇn ®Õn n¬i quû qu¸i nµy råi. §óng, <sex> biÕt trong D­îc V­¬ng ®éng cã D­îc nh©n, vµ biÕt ®­îc chç Èn n¸u cña D­îc V­¬ng kh«ng?",
			"Ta còng cã nghe nãi, D­îc V­¬ng lµ mét ng­êi qu¸i dŞ, ng­¬i ®· nh×n thÊy h¾n, ch¾c còng ph¶i biÕt h¾n chÕ t¹o D­îc nh©n nh­ thÕ nµo chø?",
			"Trong D­îc V­¬ng ®éng cã rÊt nhiÒu kú hoa dŞ th¶o, lo¹i D­îc Nh©n Th¶o lµ nhiÒu nhÊt. D­îc V­¬ng trèn trong mét MËt ®éng trong D­îc V­¬ng ®éng kh«ng rêi nöa b­íc, bän D­îc nh©n chİnh lµ ®Çy tí cña h¾n ta. Ai vµo ®éng sÏ bŞ b¾t ®Õn MËt ®éng ®ã ®Ó chÕ d­îc nh©n, ta nh×n thÊy rÊt nhiÒu siªu thuèc trong MËt ®éng, ng©m rÊt nhiÒu d­îc nh©n ch­a thµnh h×nh, c¶nh t­îng Êy rÊt kinh hoµng.",
			}

		TalkEx("task_017_02_0_1",strTalk);

	--Ã»ÓĞ´ø»Ø20Ç§ÄêÎÚÄ¾and²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			"<sex> lµ ng­êi trong vâ l©m, nÕu <sex> ®ång ı gióp ta vµo ®éng mét chuyÕn, lÊy hé ta ¤ Méc ngµn n¨m trªn ng­êi Thô nh©n, th× ta sÏ kÓ cho nghe chuyÖn D­îc nh©n.",
			}
		if	GetTrigger(KILL_XB_QIANNIANSHUREN) == 0 then
			CreateTrigger(0,1236,KILL_XB_QIANNIANSHUREN);--Ç§ÄêÊ÷ÈËÉ±¹Ö´¥·¢Æ÷
			TaskTip("Gióp L­u Tam ®Õn D­îc V­¬ng ®éng thu thËp 20 c©y ¤ Méc ngµn n¨m trªn ng­êi Thô nh©n.");
			Msg2Player("Gióp L­u Tam ®Õn D­îc V­¬ng ®éng thu thËp 20 c©y ¤ Méc ngµn n¨m trªn ng­êi Thô nh©n.");
		end

		TalkEx("",strTalk);
	end
end

--Ğø¶Ô»°
function task_017_02_0_1()

local strTalk = {
	"D­îc nh©n khã ®èi phã nh­ thÕ, ch¾c ch¾n lµ cã liªn quan ®Õn d­îc th¶o trong ®éng, D­îc Nh©n Th¶o thËt ra lµ c¸i g×?",
	"§óng råi, lÇn tr­íc trong lóc ho¶ng lo¹n ta v« t×nh ng¾t ®­îc mét c©y, <sex> ®· lÊy cho ta nhiÒu gç nh­ thÕ, c©y D­îc Nh©n Th¶o nµy tÆng cho <sex>, hy väng cã İch cho ng­¬i.",
	"ThËt tèt qu¸, ta võa ®Şnh vµo ®éng t×m mét İt D­îc Nh©n Th¶o, ®Şnh tiªu hñy nh÷ng thø qu¸i dŞ nµy.",
	"§óng vËy, lo¹i D­îc Nh©n Th¶o nµy tån t¹i chØ g©y h¹i chø kh«ng cã lîi, <sex> cø xem nh­ v× d©n trõ h¹i. Nh÷ng hoa kh¸c trong ®éng kh«ng cã g× bÊt th­êng, chØ cã sè D­îc Nh©n Th¶o ®ã ®­îc b¶o vÖ bëi bän ng­êi §¹i d­îc nh©n cßn dòng m·nh h¬n c¶ d­îc nh©n, <sex> mÆc dï ng­¬i tµi nghÖ cao c­êng, nh­ng còng ph¶i cÈn thËn ®Êy.",
	"Th× ra D­îc nh©n còng cã nhiÒu lo¹i, c¶m ¬n ng­¬i ®· cho ta biÕt nhiÒu chuyÖn ®Õn thÕ, anh b¹n nhá h·y b¶o träng nhĞ, hÑn gÆp l¹i.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,720,20);
	AddItem(2,0,721,1,1);--µÃµ½Ò»ÖêÒ©ÈË²İ
	RemoveTrigger(GetTrigger(KILL_XB_QIANNIANSHUREN));
	SetTask(TASK_XB_ID_01,36);
	TaskTip("§Õn D­îc V­¬ng ®éng, thö tiªu diÖt mét sè D­îc Nh©n Th¶o.");
	Msg2Player("§Õn D­îc V­¬ng ®éng, thö tiªu diÖt mét sè D­îc Nh©n Th¶o.");
	GivePlayerAward("Award_XB_37","Easy");
	GivePlayerExp(SkeyXibei,"yaowanggu")
end

--»¹Ã»°ÎÈ¥Ò»ÖêÒ©ÈË²İ
function task_017_02_1()

local strTalk = {
	"§óng vËy, lo¹i D­îc Nh©n Th¶o nµy tån t¹i chØ g©y h¹i chø kh«ng cã lîi, <sex> cø xem nh­ v× d©n trõ h¹i. Nh÷ng hoa kh¸c trong ®éng kh«ng cã g× bÊt th­êng, chØ cã sè D­îc Nh©n Th¶o ®ã ®­îc b¶o vÖ bëi bän ng­êi §¹i d­îc nh©n cßn dòng m·nh h¬n c¶ d­îc nh©n, <sex> mÆc dï ng­¬i tµi nghÖ cao c­êng, nh­ng còng ph¶i cÈn thËn ®Êy.",
	}

	TalkEx("",strTalk);

end

--ÓëÒ©ÈË²İ¶Ô»°
function task_017_03_0()

local nNpcIndex = GetTargetNpc();
local strSay = {
	"Lo¹i nµy cã vÎ gièng víi lo¹i mµ L­u Tam ®· giao, ch¾c chİnh lµ D­îc Nh©n Th¶o.",
	"Nhæ D­îc Nh©n Th¶o!/#task_017_03_1("..nNpcIndex..")",
	"Lo¹i c©y nµy tr«ng cã vÎ ®Ñp, tèt nhÊt kh«ng nªn lµm h­ nã/Task_Exit",
		}

	if nNpcIndex == nil then
		return
	end

	SelectSay(strSay)

end

--Ñ¡Ôñ°ÎµôÒ©ÈË²İ
function task_017_03_1(nNpcIndex)

local strTalk = {
	"D­îc Nh©n Th¶o ®óng lµ kú qu¸i kh¸c th­êng, kh«ng dÔ g× ph¸ hñy ®­îc. Lo¹i c©y nµy sinh tån rÊt m¹nh, khã mµ tiªu diÖt. Hay lµ ®Õn hái ¢u D­¬ng Häa  tiÒn bèi xem sao.",
	}

	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("D­îc Nh©n Th¶o","D­îc Nh©n Th¶o",GetWorldPos());--Ô­µØÖØÉúÒ»¿ÅÒªÈË²İ
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\Ò©Íõ¶´\\npc\\Ò©ÈË²İ.lua");
	SetNpcLifeTime(nNpcIndex,300);
	SetTask(TASK_XB_ID_01,37);
	TalkEx("",strTalk);
	TaskTip("§em D­îc Nh©n Th¶o mµ L­u Tam giao ®Õn cho ¢u D­¬ng tiÒn bèi xem, sau ®ã míi quyÕt ®Şnh nªn lµm thÕ nµo.");
	Msg2Player("§em D­îc Nh©n Th¶o mµ L­u Tam giao ®Õn cho ¢u D­¬ng tiÒn bèi xem, sau ®ã míi quyÕt ®Şnh nªn lµm thÕ nµo.");

end

--»¹Ã»½«Ò©ÈË²İ´ø¸øÅ·ÑôÇ°±²
function task_017_03_2()

local strTalk = {
	"Xem ra lo¹i D­îc Nh©n Th¶o nµy rÊt khã tiªu diÖt, hay lµ quay vÒ th­¬ng l­îng cïng ¢u D­¬ng tiÒn bèi xem sao.",
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø18·ÖÖ§1_9ÜÆº®ÁÒÑô----------------------------------
--¸æËßÅ·Ñô»­Ò©ÈË²İÄÑÒÔÏûÃğÒ»ÊÂ
function task_018_01_0()

local strTalk = {
	"¢u D­¬ng tiÒn bèi, t¹i h¹ ®· t×m ®­îc mét İt D­îc Nh©n Th¶o ë D­îc V­¬ng ®éng, nghe nãi dïng ®Ó chÕ t¹o D­îc nh©n. T¹i h¹ ®Şnh tiªu hñy hÕt lo¹i nµy trong D­îc V­¬ng ®éng, nh­ng kh«ng ngê kh«ng thÓ tiªu diÖt ®­îc, võa hñy c¸i nµy nã l¹i s¶n sinh c¸i kh¸c.",
	"Cã lo¹i c©y kú dŞ ®ã µ? D­îc V­¬ng cã thÓ tËn dông ®­îc th¶o d­îc ®Õn møc nµy, qu¶ nhiªn khiÕn ng­êi ta ph¶i kh©m phôc. Khi ng­¬i ra ngoµi th¸m thİnh ta còng ®· t×m ®­îc mét ng­êi rÊt hiÓu vÒ th¶o d­îc, cã thÓ sÏ gióp ta gi¶i ®­îc bİ mËt nµy.",
	"Tèt qu¸, tiÒn bèi qu¶ nhiªn suy nghÜ chu ®¸o, vŞ ®ã lµ cao nh©n ph­¬ng nµo?",
	"Ng­êi ®ã tªn lµ T«n Ph­¬ng Nh©n, lµ hËu nh©n cña T«n T­ M¹c, rÊt næi danh víi Thiªn Kim YÕu Ph­¬ng, ®­îc gäi lµ \'ThÇn Y\' trªn giang hå. 'Thiªn Kim YÕu Ph­¬ng' lµ sù tËp trung cña phÇn lín y thuËt, ghi l¹i h¬n mét ngµn ph­¬ng thuèc, ®èi víi lo¹i d­îc phÈm kú dŞ nµy «ng ta ch¾c ch¾n ph¶i cã nghiªn cøu. T«n Ph­¬ng Nh©n hiÖn nay ®ang ë Phông T­êng phñ, ng­¬i h·y thö ®i hái xem «ng ta cã c¸ch kh¾c chÕ lo¹i d­îc th¶o nµy kh«ng.",
	"ThÕ th× tèt qu¸, tiÒn bèi nhiÖt t×nh gióp ®ì nh­ thÕ, khiÕn v·n bèi c¶m kİch v« cïng.",
	}

	SetTask(TASK_XB_ID_01,38);
	TalkEx("",strTalk);
	TaskTip("T×m T«n Ph­¬ng Nh©n hái vÒ c¸ch tiªu diÖt D­îc Nh©n Th¶o.");
	Msg2Player("T×m T«n Ph­¬ng Nh©n hái vÒ c¸ch tiªu diÖt D­îc Nh©n Th¶o.");
	GivePlayerAward("Award_XB_38","Easy");
	GivePlayerExp(SkeyXibei,"yaorencao")
end

--»¹Ã»ÕÒµ½Ëï·½ÈÊÇë½ÌÒ©ÈË²İÒ»ÊÂ
function task_018_01_1()

local strTalk = {
	"<sex> kh«ng cÇn kh¸ch s¸o, hËu nh©n T«n T­ M¹c T«n Ph­¬ng Nh©n hiÖn nay ®ang ë Phông T­êng phñ. Cã thÓ «ng ta sÏ cã c¸ch gi¶i ®­îc D­îc Nh©n Th¶o, ng­¬i h·y mau ®i t×m.",
	}

	TalkEx("",strTalk);

end

--ÏòËï·½ÈÊÇë½ÌÏûÃğÒ©ÈË²İÒ»ÊÂ
function task_018_02_0()

local strTalk = {
	"VŞ nµy ch¾c chİnh lµ ThÇn Y T«n Ph­¬ng Nh©n T«n tiªn sinh chø? Nghe nãi T«n tiªn sinh rÊt tinh th«ng vÒ d­îc th¶o, kiÕn thøc uyªn b¸c th©m s©u, kh«ng biÕt tiªn sinh ®· thÊy qua lo¹i D­îc Nh©n Th¶o nµy ch­a?",
	"T¹i h¹ chİnh lµ T«n Ph­¬ng Nh©n, thÇn y ta kh«ng d¸m nhËn, l­¬ng y nh­ phô mÉu lµ lêi gi¸o huÊn cña tæ tiªn. <sex> d­îc th¶o trong tay h×nh nh­ cã ®éc, h×nh d¹ng kú l¹, t¹i h¹ ®· tõng thÊy trong 'Thiªn Kim YÕu Ph­¬ng' tæ tiªn ®Ó l¹i.",
	"T«n tiªn sinh qu¶ thËt ®· thÊy qua råi sao? Kh«ng biÕt lo¹i d­îc th¶o nµy cã ®Æc tİnh g×? Cã c¸ch g× trõ chóng kh«ng?",
	"Ha ha. <sex> ch¼ng viÖc g× ph¶i lo l¾ng, lo¹i cá l¹ nµy ta còng míi thÊy lÇn ®Çu, d­îc tİnh cña nã thÕ nµo ta vÉn ch­a râ. §Ó ta xem ®·, <sex> chê mét chót.",
	}

	TalkEx("task_018_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_018_02_0_1()

local strTalk = {
	"Cã ®©y, <sex> lo¹i cá ng­¬i cÇm tªn lµ ChØ Hµn Th¶o, kh«ng ph¶i lµ D­îc Nh©n Th¶o. Theo 'Thiªn Kim Ph­¬ng' ghi l¹i, ChØ Hµn Th¶o cã vŞ cay, tİnh hµn, d­îc tİnh rÊt ®Æc biÖt, sinh tr­ëng nhanh vµ khã diÖt tËn gèc. NÕu dïng Kim D­îc th× ch÷a lµnh vÕt th­¬ng rÊt nhanh, song ®éc tİnh còng cùc m¹nh, kh«ng thÓ bµo chÕ thuèc.",
	"Hãa ra lo¹i ®éc th¶o nµy l¹i cã t¸c dông lµm liÒn da thŞt, nh­ng l¹i rÊt ®éc, ®óng lµ t¹o hãa trªu ng­¬i. Kh«ng biÕt 'Thiªn Kim YÕu Ph­¬ng' cã ghi l¹i c¸ch diÖt nã kh«ng?",
	"<sex> ®óng lµ rÊt kú l¹, v¹n vËt sinh ra ®Òu cã c¸i lı cña nã, ®éc tè cña lo¹i d­îc th¶o nµy kh«ng c­íp ®i sinh m¹ng, chØ lµm ng­êi ta mÊt trİ hãa ®iªn. Cí sao <sex> l¹i cè chÊp muèn diÖt trõ chóng? Trêi ®Êt ©m d­¬ng ®iÒu hßa, chóng ta chØ lµ phµm phu tôc tö lµm sao tïy ı thay ®æi?",
	"T«n tiªn sinh lµ lang trung ®­¬ng nhiªn lßng d¹ l­¬ng thiÖn. Nh­ng mµ thÕ gian lu«n cã kÎ bØ æi muèn ra oai, nh÷ng kÎ mu m« bÊt chİnh lîi dông lo¹i cá nµy lµm c¬ thÓ kh«ng bŞ tæn th­¬ng, nh÷ng d­îc nh©n kh«ng biÕt ®au sÏ gieo r¾c t¹i häa nµy. Cho nªn cá nµy kh«ng diÖt ¾c sÏ cã thªm nhiÒu n¹n nh©n.",
	}

	TalkEx("task_018_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_018_02_0_2()

local strTalk = {
	"C¸i g×? Cã ng­êi ®éc ¸c ®Õn thÕ sao, dïng ®éc th¶o lªn c¬ thÓ ng­êi? Lµm chuyÖn t¸n tËn l­¬ng t©m, th¶o nµo <sex> hái cÆng kÏ nh­ vËy. ChØ tiÕc lµ 'Thiªn Kim YÕu Ph­¬ng' chØ ghi l¹i d­îc lı cña nã, cßn c¸ch diÖt th× kh«ng cã. Nh­ng tæ tiªn cßn truyÒn l¹i 'Thiªn Kim Dùc Ph­¬ng' cã bæ sung thªm c¸ch gi¶i ®éc d­îc, ch¾c cã ghi chĞp l¹i.",
	"T«n tiªn sinh y thuËt uyªn th©m, kh«ng biÕt cã thÓ gióp ta tra cøu liÒn ®­îc kh«ng?",
	"QuyÓn 'Thiªn Kim Dùc Ph­¬ng' cña ta mang theo khi h¸i thuèc ®Ó biÕt râ d­îc tİnh. Kh«ng may lÇn tr­íc ta ®i sa m¹c h¸i thuèc bŞ hµnh gi¶ trong sa m¹c trém mÊt, ®Õn nay vÉn ch­a t×m vÒ ®­îc. Cho nªn kh«ng thÓ gióp ngay ®­îc <sex> lËt, lËt.",
	"§©u cã thÕ ®­îc, tªn Hµnh gi¶ sa m¹c ®ã ë ®©u? Ta sÏ gióp «ng ®ßi cuèn s¸ch vÒ.",
	" <sex> xem ra vâ c«ng còng kh¸, cø thö ®õng ng¹i. Hµnh gi¶ sa m¹c Èn nóp trong Mª cung sa m¹c, Thiªn Kim Dùc Ph­¬ng cã 10 Tµn QuyÓn, ng­¬i ®em10 Tµn QuyÓn vÒ ®©y, cã thÓ sÏ t×m ra c¸ch diÖt.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,721,1);--É¾È¥Ò©ÈË²İ
	SetTask(TASK_XB_ID_01,39);
	CreateTrigger(0,1237,KILL_XB_SHAMOXINGZHE);--É³Ä®ĞĞÕßÉ±¹Ö´¥·¢Æ÷
	TaskTip("LÊy 10 tµn quyÓn 'Thiªn Kim Dùc Ph­¬ng' trªn ng­êi Hµnh gi¶ sa m¹c ë Mª cung sa m¹c ®em vÒ ®©y.");
	Msg2Player("LÊy 10 tµn quyÓn 'Thiªn Kim Dùc Ph­¬ng' trªn ng­êi Hµnh gi¶ sa m¹c ë Mª cung sa m¹c ®em vÒ ®©y.");

end

--´ø»Ø»òÎ´´ø»Ø10Æª¡¶Ç§½ğÒí·½¡·²Ğ¾í
function task_018_03_0()

local strTalk = {};

	--´ø»Ø10Æª¡¶Ç§½ğÒí·½¡·²Ğ¾í
	if GetItemCount(2,0,722) >= 10 then
		strTalk = {
		"T«n tiªn sinh, xin xem ®©y cã ph¶i lµ Thiªn Kim Dùc Ph­¬ng tµn quyÓn kh«ng?",
		"§óng vËy, ®©y ®óng lµ Thiªn Kim Dùc Ph­¬ng. <sex> lµm viÖc tèt l¾m, chØ mÊt mét lóc ng­¬i ®· ®em ®­îc s¸ch vÒ, ta v« cïng c¶m kİch. <sex> chê mét chót, ®Ó ta tra l¹i.",
		"ChØ Hµn Th¶o mäc ë ®éng ¢m Hµn, v× m«i tr­êng sèng kh¸ kh¾c nghiÖt, cho nªn chØ cÇn ChØ Hµn Th¶o cã mét c¬ héi sèng sÏ sinh s«i n¶y në. V× mäc ë n¬i ©m hµn nªn cã vŞ cay tİnh hµn, tuy ®éc tİnh kh«ng g©y chÕt ng­êi nh­ng t©m trİ mª muéi, nÕu vµo c¬ thÓ qu¸ l©u sÏ khiÕn m¹ch m¸u tª liÖt, lµm mÊt lı trİ, vµ còng cã t¸c dông ch÷a lµnh vÕt th­¬ng rÊt nhanh, nh­ng c¬ thÓ d­îc nh©n kh«ng kh¸c g× ng­êi chÕt.",
		"TriÖu chøng tiªn sinh m« t¶ qu¶ lµ gièng víi D­îc nh©n, cã c¸ch diÖt d­îc th¶o nµy kh«ng?",
		}

		TalkEx("task_018_03_0_1",strTalk);


	--Ã»ÓĞ´ø»Ø¡¶Ç§½ğÒí·½¡·²Ğ¾íand²¹·¢ÈÎÎñ´¥·¢Æ÷
	else
		strTalk = {
			" <sex> xem ra vâ c«ng còng kh¸, cø thö ®õng ng¹i. Hµnh gi¶ sa m¹c Èn nóp trong Mª cung sa m¹c, Thiªn Kim Dùc Ph­¬ng cã 10 Tµn QuyÓn, ng­¬i ®em10 Tµn QuyÓn vÒ ®©y, cã thÓ sÏ t×m ra c¸ch diÖt.",
			}
		if	GetTrigger(KILL_XB_SHAMOXINGZHE) == 0 then
			CreateTrigger(0,1237,KILL_XB_SHAMOXINGZHE);--É³Ä®ĞĞÕßÉ±¹Ö´¥·¢Æ÷
			TaskTip("LÊy 10 tµn quyÓn 'Thiªn Kim Dùc Ph­¬ng' trªn ng­êi Hµnh gi¶ sa m¹c ë Mª cung sa m¹c ®em vÒ ®©y.");
			Msg2Player("LÊy 10 tµn quyÓn 'Thiªn Kim Dùc Ph­¬ng' trªn ng­êi Hµnh gi¶ sa m¹c ë Mª cung sa m¹c ®em vÒ ®©y.");
		end

		TalkEx("",strTalk);
	end
end

--Ğø¶Ô»°
function task_018_03_0_1()

local strTalk = {
	"D­îc th¶o nµy qu¶ lµ rÊt ®éc. Tuy cá nµy sèng dai nh­ng v¹n vËt trong trêi ®Êt ®Òu t­¬ng sinh t­¬ng kh¾c, cá nµy cùc hµn, nÕu gÆp d­îc th¶o cùc nhiÖt sÏ hĞo, lóc ®ã kh¶ n¨ng sèng sÏ kh«ng cßn.Dùc Ph­¬ng cã ghi, ë s©u trong sa m¹c cã mét lo¹i Tİch D­¬ng C¨n, trªn hót mÆt trêi rùc löa, d­íi hÊp thô c¸i nãng hõng hùc cña c¸t, còng mäc ë n¬i kh¾c nghiÖt, søc sèng m·nh liÖt. Cã kh¸c lµ d­îc tİnh thuéc nhiÖt, nÕu gÆp ChØ Hµn Th¶o th× hai t­¬ng kh¾c nhau, cïng hñy diÖt.",
	"Mét vËt kh¾c mét vËt, thµnh vßng tuÇn hoµn tù nhiªn. Tiªn sinh biÕt chç nµo cã Tİch D­¬ng C¨n kh«ng?",
	"Nãi ra còng thËt trïng hîp, lÇn tr­íc ta ®i h¸i thuèc ë Mª cung sa m¹c, t×nh cê nh×n thÊy Tİch D­¬ng C¨n. Dïng nã bµo chÕ thuèc cã rÊt nhiÒu c«ng dông, nh­ng kh«ng h¸i vÒ. Theo Dùc Ph­¬ng ghi l¹i, h¸i vµ bµo chÕ thuèc Tİch D­¬ng C¨n rÊt r­êm rµ. Tİch D­¬ng C¨n cã 3 mµu xanh l¸, vµng, ®á. C©y mµu xanh ®Æc nhÊt, lÊy l­ìi liÒm c¾t tõ phÇn th©n; c©y mµu vµng rçng nhÊt, dïng cuèc cÈn thËn ®µo ®Êt quanh c©y råi lÊy lªn; c©y mµu ®á m¹nh nhÊt, dïng Chñy thñ räc líp ngoµi ®Ó lÊy chÊt dŞch. Cßn phÇn kh¸c ®Òu kh«ng thÓ dïng.",
	"Kh«ng biÕt tiªn sinh cÇn bao nhiªu míi cã thÓ bµo chÕ thuèc?",
	"C¸ch bµo chÕ thuèc kh¸ r­êm rµ, v× khã ë chç ph¶i ®Ò phßng ®éc tİnh cña nã. T¹m thêi ng­¬i ®i h¸i 10 Tİch D­¬ng C¨n ®em vÒ ®©y, ®©y lµ mét vµi dông cô h¸i thuèc cña ta, ng­¬i lÊy nã mµ dïng, ta tiÕp tôc nghiªn cøu c¸ch bµo chÕ thuèc.",
	"C¸ch bµo chÕ thuèc kh¸ r­êm rµ, v× khã ë chç ph¶i ®Ò phßng ®éc tİnh cña nã. T¹m thêi ng­¬i ®i h¸i 10 Tİch D­¬ng C¨n ®em vÒ ®©y, ®©y lµ mét vµi dông cô h¸i thuèc cña ta, ng­¬i lÊy nã mµ dïng, ta tiÕp tôc nghiªn cøu c¸ch bµo chÕ thuèc.",
	}

	TalkEx("",strTalk);
	AddItem(2,0,724,1,1);--µÃµ½Ëï·½ÈÊµÄ²ÉÒ©°ü¹ü
	DelItem(2,0,722,10);
	RemoveTrigger(GetTrigger(KILL_XB_SHAMOXINGZHE));
	SetTask(TASK_XB_ID_01,40);
	TaskTip("§Õn Mª cung sa m¹c, thu thËp 10 Tİch D­¬ng C¨n");
	Msg2Player("§Õn Mª cung sa m¹c, thu thËp 10 Tİch D­¬ng C¨n");
	GivePlayerAward("Award_XB_39","Easy");
	GivePlayerExp(SkeyXibei,"qianjinyifang")
end

--»¹Ã»´ø»ØÁÒÑô¸ù¸øËï·½ÈÊ
function task_018_03_1()

local strTalk = {
	"C¸ch bµo chÕ thuèc kh¸ r­êm rµ, v× khã ë chç ph¶i ®Ò phßng ®éc tİnh cña nã. T¹m thêi ng­¬i ®i h¸i 10 Tİch D­¬ng C¨n ®em vÒ ®©y, theo Dùc Ph­¬ng ghi l¹i, h¸i vµ bµo chÕ thuèc Tİch D­¬ng C¨n rÊt r­êm rµ. Tİch D­¬ng C¨n cã 3 mµu xanh l¸, vµng, ®á. C©y mµu xanh ®Æc nhÊt, lÊy l­ìi liÒm c¾t tõ phÇn th©n; c©y mµu vµng rçng nhÊt, dïng cuèc cÈn thËn ®µo ®Êt quanh c©y råi lÊy lªn; c©y mµu ®á m¹nh nhÊt, dïng Chñy thñ räc líp ngoµi ®Ó lÊy chÊt dŞch. Cßn phÇn kh¸c ®Òu kh«ng thÓ dïng. Ta tiÕp tôc nghiªn cøu c¸ch bµo chÕ thuèc.",
	}

	TalkEx("",strTalk);

	--²¹·¢²ÉÒ©°ü¹ü
	if GetItemCount(2,0,724) < 1 then
		AddItem(2,0,724,1,1);
	end

end

--Óë»ÒÁÒÑô¸ù¶Ô»°²É¼¯
function task_018_04_0()

local strSay = {
	"Ch¾c ch¾n ®©y lµ Tİch D­¬ng C¨n T«n tiÒn bèi ®· nãi, ®Ó ta xem dïng c¸i g× ®Ó h¸i chóng ®©y.",
	"L­ìi liÒm/#task_018_05_0(1)",
	"Cuèc/#task_018_05_0(0)",
	"Chñy thñ/#task_018_05_0(0)",
	"Lo¹i c©y nµy tr«ng cã vÎ ®Ñp, tèt nhÊt kh«ng nªn lµm h­ nã/Task_Exit",
		}

	SelectSay(strSay)

end

--Óë»ÆÁÒÑô¸ù¶Ô»°²É¼¯
function task_018_04_1()

local strSay = {
	"Ch¾c ch¾n ®©y lµ Tİch D­¬ng C¨n T«n tiÒn bèi ®· nãi, ®Ó ta xem dïng c¸i g× ®Ó h¸i chóng ®©y.",
	"L­ìi liÒm/#task_018_05_0(0)",
	"Cuèc/#task_018_05_0(1)",
	"Chñy thñ/#task_018_05_0(0)",
	"Lo¹i c©y nµy tr«ng cã vÎ ®Ñp, tèt nhÊt kh«ng nªn lµm h­ nã/Task_Exit",
		}

	SelectSay(strSay)

end

--ÓëºìÁÒÑô¸ù¶Ô»°²É¼¯
function task_018_04_2()

local strSay = {
	"Ch¾c ch¾n ®©y lµ Tİch D­¬ng C¨n T«n tiÒn bèi ®· nãi, ®Ó ta xem dïng c¸i g× ®Ó h¸i chóng ®©y.",
	"L­ìi liÒm/#task_018_05_0(0)",
	"Cuèc/#task_018_05_0(0)",
	"Chñy thñ/#task_018_05_0(1)",
	"Lo¹i c©y nµy tr«ng cã vÎ ®Ñp, tèt nhÊt kh«ng nªn lµm h­ nã/Task_Exit",
		}

	SelectSay(strSay)

end

--²É¼¯ÁÒÑô¸ù
function task_018_05_0(nType)

local nNpcIndex = GetTargetNpc();
local strTalk = {};

	if nNpcIndex == nil then
		return
	end

	SetNpcLifeTime(nNpcIndex,0);

	if nType == 1 then

		AddItem(2,0,723,1,1);--»ñµÃÒ»¿ÅÁÒÑô¸ù

		if GetItemCount(2,0,723) >= 10 then
			strTalk = {
				"H¸i ®­îc 10 Tİch D­¬ng C¨n, cßn kh«ng mau ®­a cho T«n Ph­¬ng Nh©n ®Ó bµo chÕ c¸ch kh¾c chÕ D­îc Nh©n Th¶o."
				}
		else
			strTalk = {
				"B¹n ®· h¸i thµnh c«ng 1 Tİch D­¬ng C¨n h÷u dông."
				}
		end

	else

		strTalk = {
			"H×nh nh­ b¹n sö dông kh«ng ®óng dông cô h¸i thuèc, h¸i Tİch D­¬ng C¨n kh«ng thµnh c«ng.",
			"T«n tiÒn bèi tõng nãi r»ng h¸i vµ bµo chÕ thuèc Tİch D­¬ng C¨n rÊt r­êm rµ. Tİch D­¬ng C¨n cã 3 mµu xanh l¸, vµng, ®á. C©y mµu xanh ®Æc nhÊt, lÊy l­ìi liÒm c¾t tõ phÇn th©n; c©y mµu vµng rçng nhÊt, dïng cuèc cÈn thËn ®µo ®Êt quanh c©y råi lÊy lªn; c©y mµu ®á m¹nh nhÊt, dïng Chñy thñ räc líp ngoµi ®Ó lÊy chÊt dŞch. Cßn phÇn kh¸c ®Òu kh«ng thÓ dïng.",
			"CÇn ph¶i chó ı mµu s¾c cña Tİch D­¬ng C¨n, sö dông ®óng dông cô h¸i míi cã thÓ thµnh c«ng.",
			}

	end


	TalkEx("",strTalk);

end

--ÒÑ¾­ÊÕ¼¯»òÎ´ÊÕ¼¯6¿ÃÁÒÑô¸ùºÍËï·½ÈÊ¶Ô»°
function task_018_06_0()

local strTalk = {};

	--´ø»ØÁÒÑô¸ùÎïÆ·
	if GetItemCount(2,0,723) >= 10 then
		strTalk = {
			"T«n tiªn sinh, xin xem ®©y cã ph¶i lµ Tİch D­¬ng C¨n kh«ng?",
			"§óng råi, ®©y lµ Tİch D­¬ng C¨n d­îc tİnh cùc hµn, ta ®· hiÓu râ c¸ch bµo chÕ thuèc tõ Tİch D­¬ng C¨n, chê ta.",
			"Mét lóc sau…",
			"§©y lµ Tİch D­¬ng Thñy, lµ tinh hoa cña Tİch D­¬ng C¨n, ph¬i Tİch D­¬ng Thñy trªn cá D­îc v­¬ng, kh«ng l©u sau th©n vµ rÔ cña nã sÏ bŞ tæn th­¬ng, lóc ®ã sÏ diÖt trõ tËn gèc d­îc th¶o nµy. Ng­¬i cÇm ®i, c¶m t¹ ng­¬i gióp ta t×m l¹i Thiªn Kim Dùc Ph­¬ng.",
			"§a t¹ T«n tiªn sinh, may mµ ®­îc T«n tiªn sinh t­¬ng trî, cuèi cïng ®· diÖt trõ ®­îc ®éc th¶o nµy.",
			}

		DelItem(2,0,723,10);
		DelItem(2,0,724,1);--²ÉÒ©°ü¹ü
		AddItem(2,0,725,1);--»ñµÃÁÒÑôË®
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,41);
		SetTask(KILL_YAORENBOSS_NUM,0);
		TaskTip("CÇm Tİch D­¬ng Thñy do T«n Ph­¬ng Nh©n pha chÕ ®Õn D­îc V­¬ng ®éng tiªu diÖt 5 c©y D­îc Nh©n Th¶o.");
		Msg2Player("CÇm Tİch D­¬ng Thñy do T«n Ph­¬ng Nh©n pha chÕ ®Õn D­îc V­¬ng ®éng tiªu diÖt 5 c©y D­îc Nh©n Th¶o.");
		GivePlayerAward("Award_XB_40","Easy");
		GivePlayerExp(SkeyXibei,"lieyanggen")
	--Ã»ÓĞ´ø»ØÁÒÑô¸ù
	else
		strTalk = {
			"C¸ch bµo chÕ thuèc kh¸ r­êm rµ, v× khã ë chç ph¶i ®Ò phßng ®éc tİnh cña nã. CÇn Tİch D­¬ng C¨n xanh, vµng, ®á mçi lo¹i 2 c©y, ng­¬i ®em 10 Tİch D­¬ng C¨n vÒ ®©y, Theo Dùc Ph­¬ng ghi l¹i, h¸i vµ bµo chÕ thuèc Tİch D­¬ng C¨n rÊt r­êm rµ. Tİch D­¬ng C¨n cã 3 mµu xanh l¸, vµng, ®á. C©y mµu xanh ®Æc nhÊt, lÊy l­ìi liÒm c¾t tõ phÇn th©n; c©y mµu vµng rçng nhÊt, dïng cuèc cÈn thËn ®µo ®Êt quanh c©y råi lÊy lªn; c©y mµu ®á m¹nh nhÊt, dïng Chñy thñ räc líp ngoµi ®Ó lÊy chÊt dŞch. Cßn phÇn kh¸c ®Òu kh«ng thÓ dïng. Ta tiÕp tôc nghiªn cøu c¸ch bµo chÕ thuèc.",
			}
		TalkEx("",strTalk);
	end
end

--»¹Ã»ÏûÃğÒ©ÈË²İÓëËï·½ÈÊ¶Ô»°
function task_018_06_1()

local strTalk = {
	"Ph¬i Tİch D­¬ng Thñy trªn cá D­îc v­¬ng, kh«ng l©u sau th©n vµ rÔ cña nã sÏ bŞ tæn th­¬ng, lóc ®ã sÏ diÖt trõ tËn gèc d­îc th¶o nµy. Ng­¬i cÇm ®i, c¶m t¹ ng­¬i gióp ta t×m l¹i Thiªn Kim Dùc Ph­¬ng.",
	}
	--²¹·¢ÁÒÑôË®
	if GetItemCount(2,0,725) < 1 then
		AddItem(2,0,725,1);--»ñµÃÁÒÑôË®
	end
	TalkEx("",strTalk);

end

--´øÉÏÁÒÑôË®ÓëÒ©ÈË²İ¶Ô»°
function task_018_07_0()

local strSay = {
	"Ng­¬i muèn lµm g×?",
	"Dïng Tİch D­¬ng Thñy tiªu diÖt 1 D­îc Nh©n Th¶o/task_018_07_1",
	"Kh«ng muèn lµm/Task_Exit"
	};

	SelectSay(strSay);

end

--´øÉÏÁÒÑôË®ÏûÃğÒ©ÈË²İ
function task_018_07_1()

local strTalk = {};
local nNpcIndex = GetTargetNpc();

	if GetTargetNpc() == nil then
		return
	end

	if GetItemCount(2,0,725) < 1 then
	 	strTalk = {
	 		"NÕu kh«ng cã Tİch D­¬ng Thñy, thÕ th× kh«ng cã c¸ch nµo diÖt D­îc Nh©n Th¶o."
	 		}
	 	TalkEx("",strTalk);
	 	return
	end

	strTalk = {
		"Hõm…",
		"NÕu cã D­îc nh©n chuyªn canh gi÷ D­îc Nh©n Th¶o, thÕ th× ch¼ng cßn c¸ch nµo ®µnh ph¶i trõ khö chóng míi cã thÓ diÖt lo¹i cá nµy."
		}

	SetNpcLifeTime(nNpcIndex,0);
	nNpcIndex = CreateNpc("Thñ lÜnh D­îc nh©n","D­îc nh©n v­¬ng",GetWorldPos());
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\Ò©Íõ¶´\\npc\\Ò©ÈËÊ×Áì.lua");
	SetNpcLifeTime(nNpcIndex,600);
	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø19·ÖÖ§1_10¸¶Öî¶«Á÷----------------------------------

--³É¹¦ÏûÃğÎåÖêÒ©ÈË²İ£¬»ØÈ¥ÓëÅ·Ñô¶Ô»°
function task_019_01_0()

local strTalk = {
	"¢u D­¬ng tiÒn bèi, T«n tiªn sinh qu¶ nhiªn cao minh, «ng ®· t×m ra c¸ch diÖt D­îc Nh©n Th¶o, ta ®· vµo D­îc V­¬ng ®éng diÖt D­îc Nh©n Th¶o, D­îc v­¬ng kh«ng cßn lîi dông lo¹i d­îc th¶o nµy ®Ó lµm ra D­îc nh©n ®­îc n÷a.",
	"Qu¸ tèt, <sex> ®· lµm viÖc tèt cho b¸ t¸nh.D­îc v­¬ng qu¸ ¶o t­ëng vÒ tinh chÕ th¶o d­îc, D­îc Nh©n Th¶o trong D­îc V­¬ng ®éng tuy ®· diÖt hÕt, nh­ng víi nh÷ng hiÓu biÕt vÒ d­îc th¶o h¾n sÏ t×m lo¹i d­îc th¶o kh¸c thay thÕ.",
	"Trong D­îc V­¬ng ®éng cã 1 MËt ®éng n¬i D­îc v­¬ng Èn n¸u, ra vµo rÊt khã, trong mËt ®éng cßn rÊt nhiÒu D­îc nh©n ch­a h×nh thµnh, sî r»ng trong MËt ®éng vÉn cßn cÊt giÊu D­îc v­¬ng th¶o. D­îc v­¬ng th¶o dÔ mäc, trång l¹i nã dÔ nh­ trë bµn tay.",
	"D­îc v­¬ng lµ mèi tai häa kh«n l­¬ng, b©y giê bŞ T©y H¹ mua vÒ th× cµng cùc kú nguy hiÓm. B©y giê bän chóng ®ang chÕ t¹o rÊt nhiÒu D­îc nh©n, chØ cßn c¸ch diÖt trõ tËn gèc th«i.",
	}

	TalkEx("task_019_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_019_01_0_1()

local strTalk = {
	"NÕu ®· nh­ vËy, kh«ng sî kinh ®éng ®Õn ng­êi T©y H¹ sao?",
	"CÇn ph¶i cÈn träng, ng­¬i biÕt D­îc v­¬ng mËt ®éng ë ®©u kh«ng?",
	"Ta ®· tõng ®­îc 1 ng­êi chØ ®iÓm c¸ch vµo D­îc v­¬ng mËt ®éng, D­îc v­¬ng Èn n¸u trong ®éng do Canh gi÷ D­îc nh©n canh g¸c, ngoµi D­îc v­¬ng ra kh«ng ai ®­îc vµo. Canh gi÷ D­îc nh©n mét khi ph¸t hiÖn cã ng­êi tù tiÖn x«ng vµo mËt ®éng, tøc kh¾c sÏ triÖu tËp tÊt c¶ D­îc nh©n trong ®éng cïng c«ng kİch.",
	"Nãi nh­ vËy th× ng­êi T©y H¹ còng kh«ng thÓ vµo MËt ®éng, c¸ch tèt nhÊt lµ ¸m s¸t D­îc v­¬ng ¸m s¸t ë trong MËt ®éng. Canh gi÷ D­îc nh©n chØ nhËn ra D­îc v­¬ng, chóng ta ph¶i lîi dông ®ØÓm nµy, ®Ó ng­¬i c¶i trang thµnh D­îc v­¬ng trµ trén vµo MËt ®éng. Ng­¬i ch­a tõng gÆp D­îc v­¬ng ®óng kh«ng? Nh­ng ®· cã ng­êi tõng gÆp h¾n?",
	}

	TalkEx("task_019_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_019_01_0_2()

local strTalk = {
	"A, ta cã quen 1 ng­êi ®· tõng thÊy mÆt D­îc v­¬ng, tªn h¾n lµ L­u Tam, ta ®i hái h¾n dung m¹o D­îc v­¬ng.",
	"Tèt qu¸, ng­¬i nhê h¾n gióp ng­¬i m« t¶ dung m¹o D­îc v­¬ng, sau ®ã quay l¹i ®©y ta gióp ng­¬i vÏ 1 bøc ch©n dung D­îc v­¬ng. Ta cã quen mét cao thñ c¶i trang ë Phông T­êng phñ, së tr­êng cña h¾n lµ chÕ t¹o mÆt n¹ da ng­êi, nÕu cã mÆt n¹ sÏ lõa ®­îc Canh gi÷ D­îc nh©n, lÎn vµo trong mËt ®éng.",
	"KÕ nµy qu¶ rÊt hay, thÇn trİ cña Canh gi÷ D­îc nh©n bŞ D­îc v­¬ng th¶o hñy ho¹i, chóng kh«ng thÓ ph©n biÖt ®­îc dung m¹o, ta ®i t×m L­u Tam hái h¾n dung m¹o D­îc v­¬ng.",
	}

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_01,43);
	TaskTip("§Õn D­îc v­¬ng cèc t×m L­u Tam hái th¨m dung m¹o c¸ch ¨n mÆc cña D­îc v­¬ng.");
	Msg2Player("§Õn D­îc v­¬ng cèc t×m L­u Tam hái th¨m dung m¹o c¸ch ¨n mÆc cña D­îc v­¬ng.");
	GivePlayerAward("Award_XB_41","Easy");
	GivePlayerExp(SkeyXibei,"qingchuyaorencao")
end

--ÉĞÎ´ÓëÁõÈı¶Ô»°
function task_019_01_1()

local strTalk = {
	"Ng­¬i mau ®i t×m L­u Tam nhê h¾n m« t¶ dung m¹o D­îc v­¬ng, sau ®ã quay l¹i ®©y ta gióp ng­¬i vÏ 1 bøc ch©n dung D­îc v­¬ng."
	}

	TalkEx("",strTalk);

end

--ÓëÁõÈı¶Ô»°Ñ¯ÎÊÒ©ÍõÒÂ×ÅÈİÃ²
function task_019_02_0()

local strTalk = {
	"Nh×n thÊy <sex> b×nh an v« sù, ta còng yªn t©m phÇn nµo. B©y giê ta cã thÓ yªn t©m rêi khái ®©y.",
	"Ch¼ng lÏ tØÓu ca ®øng ë ®©y ®îi ta xuÊt ®éng? §Ó tØÓu ca lo l¾ng ta thËt ¸y n¸y. N¬i nµy kh«ng thÓ ë l©u, tØÓu ca mau rêi khái n¬i nµy. TØÓu ca ®· tõng thÊy dung m¹o D­îc v­¬ng, cã thÓ m« t¶ l¹i gióp ta ®­îc kh«ng?",
	"<sex> ph¶i ®Õn D­îc V­¬ng ®éng sao? Ng­¬i ph¶i cÈn thËn D­îc v­¬ng, tuy h¾n r©u tãc b¹c tr¾ng nh­ng v« cïng kháe. §Çu h¾n gièng nh­ b¸o, r©u tãc dµi b¹c tr¾ng vµ rËm, da dÎ kh«ng kh¸c g× ng­êi trÎ tuæi. Sau l­ng ®eo 1 b×nh d­îc hå l« lín, lóc ®ã khÈn cÊp kh«ng thÓ nh×n râ nh­ng dung m¹o cña h¾n rÊt dÔ nhí.",
	"TiÓu ca m« t¶ h×nh d¸ng D­îc v­¬ng còng kh¸ chi tiÕt. B»ng h÷u h·y mau rêi khái n¬i nµy, t×m n¬i kh¸c m­u sinh. §a t¹ b»ng h÷u, ta xin c¸o tõ.",
	"<sex> qu¸ kh¸ch s¸o råi, ta ph¶i c¸m ¬n míi ®óng, <sex> hµnh tÈu gian hå, mäi viÖc ph¶i cÈn träng.",
	}

	SetTask(TASK_XB_ID_01,44);
	TalkEx("",strTalk);
	TaskTip("§· biÕt ®­îc t­íng m¹o cña D­îc v­¬ng, mau quay vÒ b¸o ¢u D­¬ng Häa tiÒn bèi.");
	Msg2Player("§· biÕt ®­îc t­íng m¹o cña D­îc v­¬ng, mau quay vÒ b¸o ¢u D­¬ng Häa tiÒn bèi.");

end

--Î´»Ø±¨Å·Ñô»­Ò©ÍõµÄÈİÃ²
function task_019_02_1()

local strTalk = {
	"<sex> nhÊt ®Şnh ph¶i cÈn thËn víi D­îc v­¬ng, tuy h¾n r©u tãc b¹c tr¾ng nh­ng v« cïng kháe. §Çu h¾n gièng nh­ b¸o, r©u tãc dµi b¹c tr¾ng vµ rËm, sau l­ng ®eo 1 lä d­îc hå l«, lóc ®ã khÈn cÊp ta kh«ng nh×n râ nh­ng dung m¹o cña h¾n rÊt dÔ nhí."
	}

	TalkEx("",strTalk);

end

--ÏòÅ·Ñô»­ÃèÊöÒ©ÍõÒÂ×ÅÈİÃ²
function task_019_03_0()

local strTalk = {
	"Ta ®· chuÈn bŞ xong bót mùc, ng­¬i ®· hái kü dung m¹o D­îc v­¬ng ch­a?",
	"Ta ®· hái dung m¹o cña D­îc v­¬ng. D­îc v­¬ng r©u tãc b¹c tr¾ng, ®· cã tuæi. §Çu h¾n gièng nh­ b¸o, r©u tãc dµi b¹c tr¾ng vµ rËm. da dÎ kh«ng kh¸c g× ng­êi trÎ tuæi. Sau l­ng ®eo 1 b×nh d­îc hå l« lín, tiÒn bèi cã thÓ dùa theo ®ã vÏ ®­îc kh«ng?",
	"Tuy kh«ng râ rµng l¾m, nh­ng nh÷ng chi tiÕt m« t¶ kh¸ ®Æc tr­ng. Theo m« t¶ cña ng­¬i thÊy còng cã vµi nĞt gièng Tr­¬ng Phi thêi Tam Quèc, ng­¬i chê ta 1 tiÕng, ta ®i vÏ 1 bøc tranh gièng nh­ thËt.",
	" 1 giê sau……",
	}

	TalkEx("task_019_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_019_03_0_1()

local strTalk = {
	"ViÖc lín ®· xong, ng­¬i ®em ch©n dung D­îc v­¬ng ®i t×m §­êng Thiªn Thiªn, c« ta sÏ lµm ®å c¶i trang gièng nh­ thËt cho ng­¬i.",
	"§­êng Thiªn Thiªn ®ang ë Phông T­êng phñ? Ch¼ng ph¶i §­êng m«n ë Tø Xuyªn sao?",
	"Phô th©n cña §­êng Thiªn Thiªn vµ ta cã th©m t×nh víi nhau, tiÕc lµ kh«ng may chÕt yÓu, tr­íc lóc l©m chung dÆn dß ta ch¨m sãc c« ta. Thiªn Thiªn vèn thuéc §­êng m«n, c« ta chØ thİch thuËt c¶i trang, nh­ng ng­êi cña §­êng m«n tõ tr­íc ®Õn nay lu«n xem th­êng thuËt c¶i trang. Sau khi phô th©n cña Thiªn Thiªn mÊt, c« ta bŞ §­êng m«n lo¹i trõ, cuèi cïng ta khuyªn c« ta ®Õn ®Şnh c­ t¹i Phông T­êng , tr¸nh xa n¬i phiÒn phøc, l¹i cã thÓ ph¸t huy së tr­êng.",
	"Hãa ra lµ vËy, ta ®i t×m §­êng c« n­¬ng ®©y. TiÒn bèi, c¸o tõ!",
	}

	TalkEx("",strTalk);
	AddItem(2,0,752,1,1);--µÃµ½Ò©Íõ»­Ïñ
	SetTask(TASK_XB_ID_01,45);
	TaskTip("T×m §­êng Thiªn Thiªn ë Phông T­êng nhê chÕ t¹o vËt dông ®Ó c¶i trang theo ch©n dung D­îc v­¬ng.");
	Msg2Player("T×m §­êng Thiªn Thiªn ë Phông T­êng nhê chÕ t¹o vËt dông ®Ó c¶i trang theo ch©n dung D­îc v­¬ng.");
	GivePlayerAward("Award_XB_42","Easy");
	GivePlayerExp(SkeyXibei,"yaowanghuaxiang")
end

--Î´ÓëÌÆÜ·Ü·¶Ô»°ÇëÇóÖÆ×÷Ò×Èİ×°
function task_019_03_1()

local strTalk = {
	"Ng­¬i ®em bøc 'ch©n dung D­îc v­¬ng' ta vÏ ®­a cho §­êng Thiªn Thiªn, nhê c« ta chÕ t¹o ®å c¶i trang, nh­ vËy viÖc h¹ thñ D­îc v­¬ng dÔ nh­ trë bµn tay."
	}

	TalkEx("",strTalk);

end

--ÓëÌÆÜ·Ü·¶Ô»°ÇëÇó°ïÃ¦ÖÆ×÷Ò×Èİ×°
function task_019_04_0()

	local strTalk = {
	"C« n­¬ng lµ §­êng Thiªn Thiªn? ¢u D­¬ng Häa tiÒn bèi nãi víi ta c« rÊt tinh th«ng thuËt c¶i trang, cã thÓ gióp ta chÕ t¹o 1 tÊm mÆt n¹ da ng­êi?",
	"Ta chİnh lµ §­êng Thiªn Thiªn. Hãa ra lµ b»ng h÷u cña ¢u D­¬ng b¸ b¸, lµm 1 bé ®å c¶i trang th× qu¸ dÔ. ChØ cÇn c¸c h¹ ®­a ch©n dung cña ng­êi muèn gi¶ d¹ng cho ta, b¶o ®¶m thËt gi¶ khã ph©n biÖt ®­îc.",
	"§a t¹ c« n­¬ng, nhê c« n­¬ng lµm mÆt n¹ dùa vµo bøc h×nh nµy.",
	"Th× ra lµ 1 «ng giµ, r©u tãc ®Òu b¹c tr¾ng, da dÎ th× l¹i bãng l­ìng. Sî r»ng ta kh«ng cã ®ñ thuèc nhuém. C¸c h¹ t×m gióp ta 100 L·nh trïng t¬ vµ 100 Da s­ tö. ChØ cã 2 lo¹i nguyªn liÖu nµy míi phï hîp víi lo¹i tãc vµ mµu da nµy.",
	"§­¬ng nhiªn kh«ng cã vÊn ®Ò g×, c« n­¬ng chê ta chèc l¸t, ta lËp tøc ®i thu thËp nguyªn liÖu.",
	}

	DelItem(2,0,752,1);--É¾È¥Ò©Íõ»­Ïñ
	SetTask(TASK_XB_ID_01,46);
	TalkEx("",strTalk);
	TaskTip("Thu thËp 100 L·nh trïng t¬ vµ 100 Da s­ tö giao cho §­êng Thiªn Thiªn chÕ t¹o ®å c¶i trang D­îc v­¬ng.");
	Msg2Player("Thu thËp 100 L·nh trïng t¬ vµ 100 Da s­ tö giao cho §­êng Thiªn Thiªn chÕ t¹o ®å c¶i trang D­îc v­¬ng.");

end

--´ø»Ø»òÃ»ÓĞ´ø»ØÀä³æË¿µÈÎïÆ·¸øÌÆÜ·Ü·
function task_019_05_0()

local strTalk = {};

	--´ø»ØÎïÆ·
	if GetItemCount(2,9,4) >= 100 and GetItemCount(2,2,47) >= 100 then
		strTalk = {
			"§©y lµ nguyªn liÖu c« n­¬ng cÇn, cßn cÇn thø g× n÷a kh«ng?",
			"BÊy nhiªu ®ñ råi, mäi thø ®· ®ñ kho¶ng n÷a giê sau sÏ lµm xong mÆt n¹, <sex> chê chót.",
			"Mét lóc sau…",
			"MÆt n¹ vµ ®å c¶i trang ®· lµm xong, c¸c h¹ thö xem cã võa ı ch­a?",
			"§­êng c« n­¬ng trİ tuÖ h¬n ng­êi, bµn tay l¹i khĞo lĞo, c¶i trang rÊt khã ph©n biÖt thËt gi¶. ThuËt c¶i trang cña §­êng c« n­¬ng thËt cao siªu.T¹i h¹ cßn viÖc quan träng cÇn lµm, c¶m t¹ c« n­¬ng tr­îng nghÜa t­¬ng trî.",
			}
		AddItem(2,0,760,1,1);--Ò©ÍõÒ×Èİ×°
		DelItem(2,9,4,100);
		DelItem(2,2,47,100);
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_01,47);
		TaskTip("§å c¶i trang D­îc v­¬ng ®· cã ®ñ, cã thÓ lõa ®­îc ng­êi canh g¸c trong D­îc V­¬ng ®éng.");
		Msg2Player("§å c¶i trang D­îc v­¬ng ®· cã ®ñ, cã thÓ lõa ®­îc ng­êi canh g¸c trong D­îc V­¬ng ®éng.");
		GivePlayerAward("Award_XB_43","Easy");
		GivePlayerExp(SkeyXibei,"yaowangyirongzhuang")
	--Ã»ÓĞ´ø»ØÎïÆ·
	else
		strTalk = {
			"Th× ra lµ 1 «ng giµ, r©u tãc ®Òu b¹c tr¾ng, da dÎ th× l¹i bãng l­ìng. Sî r»ng ta kh«ng cã ®ñ thuèc nhuém. C¸c h¹ t×m gióp ta 100 L·nh trïng t¬ vµ 100 Da s­ tö. ChØ cã 2 lo¹i nguyªn liÖu nµy míi phï hîp víi lo¹i tãc vµ mµu da nµy."
			}

		TalkEx("",strTalk);
	end

end

--ÒÑ¾­È¡µÃÒ×Èİ×°(²¹·¢Ò×Èİ×°)
function task_019_05_1()

local strTalk = {
	"MÆt n¹ vµ ®å c¶i trang ®· lµm xong, c¸c h¹ thö xem cã võa ı ch­a?"
	}

	TalkEx("",strTalk);

	if GetItemCount(2,0,760) < 1 then
		AddItem(2,0,760,1,1);--Ò©ÍõÒ×Èİ×°
	end

end

--ÓëÈ¡µÃÒ×Èİ×°ÓëÒ©ÍõÃØ¶´¿´ÊØÈË¶Ô»°
function task_019_06_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(YaoWang_MapData));
local xWPos,yWPos,xPos,yPos = YaoWang_MapData[nMapDataIndex][1],YaoWang_MapData[nMapDataIndex][2],YaoWang_MapData[nMapDataIndex][3],YaoWang_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--Íæ¼ÒÈôÈÎÎñÊ§°ÜĞèÒª¹ı30·ÖÖÓ²ÅÄÜÖØĞÂË¢³öÒ©Íõ
	if GetTime()-GetTask(CREAT_YAOWANG_TIME)	>= 1800 then

		strTalk = {
			"Ng­¬i lµ ai?",
			"Ta lµ D­îc v­¬ng, kh«ng nhËn ra ta sao?",
			"Ai lµm ån bªn ngoµi ®ã!?",
			"§¹i sù kh«ng hay råi, kh«ng thÓ ®¸nh lõa ®­îc n÷a, kh«ng cßn c¸ch nµo kh¸c, ®µnh ph¶i x«ng lªn, trõ khö D­îc v­¬ng.",
			}

		SetTask(CREAT_YAOWANG_TIME,GetTime());--¼ÇÂ¼Ò©ÍõË¢ĞÂÊ±¼ä
		nNpcIndex = CreateNpc("D­îc V­¬ng","D­îc V­¬ng",510,xWPos,yWPos);
		SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\Ò©Íõ¶´\\npc\\Ò©Íõ.lua");
		SetNpcLifeTime(nNpcIndex,1500);
		Msg2Player("D­îc v­¬ng xuÊt hiÖn ë  "..xPos..", "..yPos.." , h·y mau ®i tiªu diÖt h¾n.")
		TaskTip("D­îc v­¬ng xuÊt hiÖn ë  "..xPos..", "..yPos.." , h·y mau ®i tiªu diÖt h¾n.");

	else

		strTalk = {
			"……",
			"D­êng nh­ kh«ng cã ph¶n øng g×, c¸ch 30 phót D­îc v­¬ng míi xuÊt hiÖn, chê c¬ héi thö tiÕp!"
			}

	end

	TalkEx("",strTalk);

end

--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃÒ×Èİ×°Óë¿´ÊØÈË¶Ô»°
function task_019_06_1()

local strTalk = {
	"……",
	"Kh«ng cã ®å c¶i trang chí tù tiÖn hµnh ®éng, b»ng kh«ng kinh ®éng ®Õn D­îc v­¬ng hËu qu¶ khã l­êng.",
	};

	TalkEx("",strTalk);

end

--Ã»ÓĞÁìÈ¡ÈÎÎñÓëÒ©ÊÒ¿´ÊØÈË¶Ô»°
function task_019_06_2()

local strTalk = {
	"……",
	};

	TalkEx("",strTalk);

end

--ÒÑ¾­É±ËÀÒ©ÍõºÍÅ·Ñô»­¶Ô»°
function task_019_07_0()

local strTalk = {
	"¢u D­¬ng tiÒn bèi, may mµ chóng ta ®i tr­íc mét b­íc tiªu diÖt D­îc v­¬ng, D­îc v­¬ng ®· ®ång ı chÕ t¹o D­îc nh©n cho qu©n ®éi T©y H¹, ng­¬i h·y xem mËt th­ nµy, D­îc v­¬ng cßn chuÈn bŞ Ph­¬ng thuèc D­îc nh©n cho T©y H¹.",
	"Lóc ®Çu ta cø t­ëng T©y H¹ muèn D­îc v­¬ng chÕ t¹o sè l­îng lín D­îc nh©n ®Ó sö dông, kh«ng ngê T©y H¹ vÉn muèn trùc tiÕp sö dông qu©n ®éi cña m×nh, ng­êi T©y H¹ qu¶ thËt thñ ®o¹n ®éc ¸c. May mµ ®· diÖt D­îc Nh©n Th¶o, kÕ ho¹ch cña bän chóng råi sÏ nh­ d· trµng xe c¸t.",
	"Sî r»ng ng­êi T©y H¹ kh«ng tin t­ëng thÇn d©n §¹i Tèng, thµ hy sinh ng­êi cña m×nh chø quyÕt kh«ng dïng ng­êi Tèng trong qu©n ®éi. §èi thñ lµ §¹i Tèng, T©y H¹ quyÕt kh«ng l¬ lµ.",
	"NÕu T©y H¹ cã ®­îc ph­¬ng thuèc nµy, chóng ta chèng ®ì kh«ng næi, ph¶i hñy ph­¬ng thuèc nµy ®Ó tr¸nh g©y häa cho ng­êi d©n. Nh­ng nÕu NhÊt phÈm ®­êng ph¸t hiÖn ra kh«ng thÊy tung tİch cña ph­¬ng thuèc ®©u, nhÊt ®Şnh sÏ nghi ngê. Cã råi, ng­êi ®i t×m T«n Ph­¬ng Nh©n , ®­a ph­¬ng thuèc thËt cho «ng ta nghiªn cøu, lµm 1 ph­¬ng thuèc gi¶ cho NhÊt phÈm ®­êng, lµm nh­ thÕ võa giÊu ®­îc chuyÖn D­îc v­¬ng bŞ tiªu diÖt vµ cã thÓ chÕ t¹o D­îc nh©n gi¶ trµ trén vµo qu©n ®éi T©y H¹.",
	"TuyÖt kÕ, ¢u D­¬ng tiÒn bèi kh«ng hæ danh lµ bé n·o cña Tr­êng Ca M«n. C¸i nµy gäi lµ gieo nh©n nµo gÆp qu¶ nÊy.",
	}

	TalkEx("task_019_07_0_1",strTalk);

end

--·¢½±Àø
function task_019_07_0_1()

	give_zb_award(44);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,727,1);--É¾È¥·¨ÍõÊéĞÅ
		SetTask(TASK_XB_ID_01,49);
		TaskTip("T×m T«n Ph­¬ng Nh©n hái xem Ph­¬ng thuèc D­îc nh©n cã thÓ lµm gi¶ hay kh«ng.");
		Msg2Player("T×m T«n Ph­¬ng Nh©n hái xem Ph­¬ng thuèc D­îc nh©n cã thÓ lµm gi¶ hay kh«ng.");
		GivePlayerAward("Award_XB_44","Easy");
		GivePlayerExp(SkeyXibei,"yaowang")
	end
end

--»¹Î´ÓëËï·½ÈÊ¶Ô»°
function task_019_07_1()

local strTalk = {
	"Ng­¬i ®i t×m T«n Ph­¬ng Nh©n , ®­a ph­¬ng thuèc thËt cho «ng ta nghiªn cøu, lµm 1 ph­¬ng thuèc gi¶ cho NhÊt phÈm ®­êng, lµm nh­ thÕ võa giÊu ®­îc chuyÖn D­îc v­¬ng bŞ tiªu diÖt vµ cã thÓ chÕ t¹o D­îc nh©n gi¶ trµ trén vµo qu©n ®éi T©y H¹. ",
	}

	TalkEx("",strTalk);

end

--ÓëËï·½ÈÊ¶Ô»°ÈÃÆä°ïÃ¦Î±ÔìÒ©ÈËÒ©·½
function task_019_08_0()

local strTalk = {
	"<sex> cã diÖt gÇn hÕt D­îc Nh©n Th¶o h¹i ng­êi ®ã kh«ng?",
	"May cã Tİch D­¬ng Thñy cña T«n tiªn sinh chÕ ra, D­îc Nh©n Th¶o gÆp n­íc bŞ biÕn chÊt, ®· tiªu diÖt tËn gèc. Tiªn sinh cßn nhí lÇn tr­íc ta nh¾c ®Õn cã ng­êi ®éc ¸c muèn dïng D­îc Nh©n Th¶o lªn c¬ thÓ ng­êi kh«ng? Ta ®· cã ®­îc ph­¬ng thuèc D­îc nh©n.",
	"§¹o cao 1 th­íc, ma cao 1 tr­îng, tuy nãi ng­êi nghiªn cøu ra ph­¬ng thuèc nµy t©m ®Şa ®éc ¸c, nh­ng kh«ng thÓ kh«ng kh©m phôc tµi trİ tinh th«ng, kiÕn thøc s©u réng cña h¾n ®èi víi th¶o d­îc. Ph¶i dung thuèc ®óng liÒu, thËt ®¸ng kh©m phôc.",
	"Kh«ng biÕt T«n tiªn sinh cã thÓ chÕ ra 1 ph­¬ng thuèc gi¶ m¹o, chØ cã h×nh d¹ng bªn ngoµi cña D­îc nh©n nh­ng l¹i kh«ng gièng D­îc nh©n?",
	}

	TalkEx("task_019_08_0_1",strTalk);

end

--Ğø¶Ô»°
function task_019_08_0_1()

local strTalk = {
	"Khã qu¸, trong chèc l¸t kh«ng thÓ lµm ra ph­¬ng thuèc nµy, nh­ng <sex> muèn ph­¬ng ph¸p chÕ t¹o gièng mµ l¹i kh«ng gièng D­îc nh©n? ThÕ th× ph¶i nghiªn cøu liÒu l­îng vµ t¸c dông lÉn nhau gi÷a c¸c lo¹i thuèc vµ cÇn sö dông mét liÒu nhá D­îc Nh©n Th¶o.",
	"NÕu tiªn sinh cã thÓ chÕ t¹o ph­¬ng thuèc gièng nh­ng kh«ng ph¶i lµ Ph­¬ng thuèc D­îc nh©n th× qu¸ tèt råi, mét sè D­îc Nh©n Th¶o chÕt kh« kh«ng biÕt cßn dïng ®­îc kh«ng?",
	"D­îc Nh©n Th¶o bŞ hĞo cã bµo chÕ thuèc ®­îc hay kh«ng cÇn ph¶i c©n nh¾c, mét l¸t ng­¬i h·y quay l¹i chø viÖc nµy trong phót chèc kh«ng thÓ n«n nãng ®­îc, ®îi ta nghiªn cøu ®·.",
	"§a t¹ T«n tiªn sinh, nÕu tiªn sinh cã tiÕn triÓn g× míi xin b¸o l¹i cho ¢u D­¬ng Häa tiÒn bèi, v·n bèi sÏ lËp tøc ®Õn lÊy. Kh«ng quÊy rÇy T«n tiªn sinh n÷a, c¸o tõ.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,726,1);--É¾È¥Ò©ÈËÒ©·½
	SetTask(TASK_XB_ID_01,50);
	TaskTip("T«n Ph­¬ng Nh©n ®Ó ng­¬i ®îi mét thêi gian míi ®Õn lÊy Ph­¬ng thuèc D­îc nh©n gi¶.");
	Msg2Player("T«n Ph­¬ng Nh©n ®Ó ng­¬i ®îi mét thêi gian míi ®Õn lÊy Ph­¬ng thuèc D­îc nh©n gi¶.");
	GivePlayerAward("Award_XB_45","Easy");
	GivePlayerExp(SkeyXibei,"zhuanyan")
end

--²¢ĞĞÖ§ÏßÎ´½áÊøÎ´È¡µÃÎ±ÔìÒ©ÈËÒ©·½
function task_019_08_1()

local strTalk = {
	"Ng­¬i ®îi mét thêi gian råi h½n ®Õn, chø viÖc nµy trong phót chèc kh«ng thÓ n«n nãng ®­îc, ®îi ta nghiªn cøu ®·.",
	}

	TalkEx("",strTalk);

end


---------------------------------- Î÷±±Çø20·ÖÖ§1_11±ø²»ÑáÕ©----------------------------------
--²¢ĞĞÖ§Ïß½áÊø£¬»ã×Ü£¬È¡µÃÎ±ÔìÒ©ÈËÒ©·½
function task_020_01_0()

local strTalk = {
	"T«n tiªn sinh ®· chÕ t¹o ra 1 ph­¬ng thuèc gi¶ råi ph¶i kh«ng?",
	"Ph­¬ng thuèc nµy ph¶i tİnh to¸n tØ mØ chñng lo¹i vµ liÒu l­îng, nÕu kh«n tİnh to¸n chİnh x¸c e r»ng thuèc nµy khã thµnh. MÊy ngµy nay ta kh«ng ngõng thö thuèc, cuèi cïng ®· chÕ thµnh, nÕu sö dông lªn c¬ thÓ ng­êi, t¹m thêi xuÊt hiÖn d¸ng vÎ bªn ngoµi cña D­îc nh©n, nh­ng kh«ng cã søc m¹nh cña D­îc nh©n, qua 2 canh giê sÏ håi phôc l¹i nh­ cò, tuy cã mét İt ®éc tİnh nh­ng kh«ng cã trë ng¹i g× lín.",
	"T«n tiªn sinh qu¶ nhiªn lîi h¹i, lµm nh­ vËy cã thÓ khiÕn kÎ gian ¸c r¬i vµo bÉy. Khi bän chóng t­ëng r»ng cã thÓ ph¸t huy uy lùc cña D­îc nh©n còng lµ lóc diÖt vong. VÊt v¶ cho T«n tiªn sinh qu¸.",
	}

	TalkEx("task_020_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_020_01_0_1()

local strTalk = {
	"<sex> kh«ng cÇn kh¸ch s¸o, tuy biÕt rÊt tµn ¸c nh­ng ®­îc nh×n thÊy ph­¬ng thuèc nµy nh­ ®­îc më réng tÇm m¾t, nh­ bŞ y thuËt l«i cuèn h¬n. Ph­¬ng thuèc thËt cÇn ph¶i hñy, nÕu r¬i vµo tay ng­êi thiÖn th× tèt cßn chø r¬i vµo tay kÎ ¸c lµ häa, gi÷ l¹i qu¶ lµ tai häa.",
	"T«n tiªn sinh nãi rÊt ®óng, vËt h¹i ng­êi nh­ vËy lµm sao cã thÓ gi÷ l¹i? B©y giê Hñy ®i. §a t¹ T«n tiªn sinh t­¬ng trî, tiªn sinh b¶o träng, ta xin c¸o tõ.",
	"(D­îc Nh©n Th¶o, Ph­¬ng thuèc D­îc nh©n, D­îc v­¬ng ®Òu ®· trõ s¹ch, cuèi cïng ®· ®Ëp tan ©m m­u tµn ¸c cña T©y H¹, b©y giê ph¶i cÈn thËn giao ph­¬ng thuèc gi¶ cho Xa Lu©n B¸ V­¬ng.)",
	}

	TalkEx("",strTalk);
	AddItem(2,0,728,1,1);--µÃµ½Î±ÔìµÄÒ©ÈËÒ©·½
	SetTask(TASK_XB_ID_01,51);
	TaskTip("Giao Ph­¬ng thuèc D­îc nh©n gi¶ cho Xa Lu©n B¸ V­¬ng .");
	Msg2Player("Giao Ph­¬ng thuèc D­îc nh©n gi¶ cho Xa Lu©n B¸ V­¬ng .");

end

--»¹Î´½«Î±ÔìÒ©·½½»¸ø³µÂÖ°ÔÍõ
function task_020_01_1()

local strTalk = {
	"Häc thuËt vÒ d­îc th¶o qu¶ nhiªn uyªn th©m, xem ra ta vÉn ch­a hiÓu hÕt vÒ Thiªn Kim YÕu Ph­¬ng, tõ b©y giê ph¶i ch¨m chØ nghiªn cøu tiÕp tôc chİ nguyÖn cña tiªn tæ.",
	"(D­îc Nh©n Th¶o, Ph­¬ng thuèc D­îc nh©n, D­îc v­¬ng ®Òu ®· trõ s¹ch, cuèi cïng ®· ®Ëp tan ©m m­u tµn ¸c cña T©y H¹, b©y giê ph¶i cÈn thËn giao ph­¬ng thuèc gi¶ cho Xa Lu©n B¸ V­¬ng.)",
	}

	TalkEx("",strTalk);
	--²¹·¢Ò©·½
	if GetItemCount(2,0,728) < 1 then
		AddItem(2,0,728,1,1);--µÃµ½Î±ÔìµÄÒ©ÈËÒ©·½
		TaskTip("Giao Ph­¬ng thuèc D­îc nh©n gi¶ cho Xa Lu©n B¸ V­¬ng .");
		Msg2Player("Giao Ph­¬ng thuèc D­îc nh©n gi¶ cho Xa Lu©n B¸ V­¬ng .");
	end

end

--½«Î±ÔìÒ©·½½»¸ø³µÂÖ°ÔÍõ
function task_020_02_0()

local strTalk = {
	"Ng­¬i ®· ®i mét thêi gian dµi, chuyÖn D­îc v­¬ng tiÕn triÓn sao råi?",
	"May mµ kh«ng phô lßng ñy th¸c cña B¹n, Ph¸p v­¬ng ®· l«i kĞo ®­îc D­îc v­¬ng, D­îc v­¬ng ®ång ı chÕ t¹o D­îc nh©n cho T©y H¹ , cßn d©ng Ph­¬ng thuèc D­îc nh©n ®Ó qu©n T©y H¹ dïng.",
	"Ha ha, tèt qu¸, nghe nãi D­îc v­¬ng rÊt x¶o tr¸ qu¸i ®¶n, lóc ®Çu ta cø lo kh«ng thÓ thuyÕt phôc ®­îc h¾n. Ng­¬i lÊy ®­îc ph­¬ng thuèc råi ph¶i kh«ng? §­a cho ta xem.",
	"§©y lµ Ph­¬ng thuèc D­îc nh©n, theo c¸ch pha chÕ ghi ë ®©y chÕ t¹o D­îc nh©n, tõ rµy vÒ sau T©y H¹ sÏ v« ®Şch thiªn h¹.",
	}

	TalkEx("task_020_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_020_02_0_1()

local strTalk = {
	"Ha ha, nãi ®óng l¾m, sím muén g× Trung Nguyªn còng thuéc vÒ T©y H¹ chóng ta. NÕu viÖc nµy gi¶i quyÕt sím, c«ng cña ng­¬i kh«ng nhá, tİnh ra ng­¬i còng ®· lËp kh«ng İt c«ng lao, cho ng­¬i nhËn chøc Vò VÖ ®­êng néi. Vò VÖ trùc tiÕp nghe lÖnh cña ThËp ®¹i kim cang, giê ®©y ThËp ®¹i kim cang bŞ th­¬ng nghiªm träng, nguyªn khİ bŞ tæn th­¬ng, ng­¬i lËp ®­îc c«ng lao sÏ ®­îc ngåi vµo chøc vô cßn trèng, gäi lµ Kim cang NhÊt phÈm ®­êng néi.",
	"Kh«ng d¸m, t¹i h¹ lµm hÕt søc m×nh lµ viÖc nªn lµm.",
	"ThÊy ng­¬i kh«ng ham danh lîi. Ta giao cho ng­¬i 1 nhiÖm vô. Khi ng­¬i dß la vÒ bİ mËt cña Tr­êng Sinh BÊt L·o ®¬n d­îc cho NhÊt phÈm ®­êng, cã nh¾c ®Õn kim ®¬n trÊn gi÷ dŞ thó trong Cæ D­¬ng ®éng, chóng ta ®· cho ng­êi ®i ®iÒu tra, trong Cæ D­¬ng ®éng qu¶ nhiªn cã dŞ thó, nh­ng ngÆt nçi lóc ®ã kh«ng cã c¸ch thu phô dŞ thó, khã mµ lÊy ®­îc kim ®¬n cña nã. May mµ bän ta gÆp 1 vŞ Èn nóp trong ®éng tù x­ng lµ C«n L«n l·o ®¹o Phi Th­êng §¹o Nh©n. Ng­êi nµy cã c¸ch thu phôc dŞ thó.",
	"(Kh«ng hay råi, Phi Th­êng §¹o Nh©n ®· bŞ ta giÕt, ®· ®ông ch¹m víi NhÊt phÈm ®­êng. Ph¶i b×nh tÜnh l¹i, nghe xem NhÊt phÈm ®­êng cã hµnh ®éng g×.)",
	}

	TalkEx("task_020_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_020_02_0_2()

local strTalk = {
	"µ, khi ®Õn C«n L«n th¨m dß tin tøc ®­îc biÕt Phi Th­êng §¹o Nh©n ®· bŞ ®uæi ra khái nói, Èn nóp ë Cæ D­¬ng ®éng, nh­ng kh«n nghÜ r»ng «ng ta biÕt c¸ch thu phôc Cæ D­¬ng thó.",
	"§óng vËy, Ph¸p v­¬ng ®· giao thiÖp víi «ng ta 1 lÇn, l·o ®¹o ®· ®ång ı thu phôc Cæ D­¬ng thó gióp chóng ta vµ ®ång ı nghiªn cøu thuèc Tr­êng sinh bÊt l·o. Ta ®· ph¸i S¸t thñ Oa Oa ®i bµn b¹c, nhê «ng ta thu phôc Cæ D­¬ng thó, nh­ng ®Õn giê vÉn ch­a cã tin tøc, ng­¬i ®· tõng ®Õn Cæ D­¬ng ®éng, th«ng thuéc ®Şa h×nh, ng­¬i ®i mét chuyÕn phèi hîp víi S¸t thñ Oa Oa, cïng trî gióp Phi Th­êng §¹o Nh©n thu phôc dŞ thó, giê ®©y ng­¬i ®· lµ Vò VÖ, trùc tiÕp phèi hîp víi S¸t thñ Oa Oa, cïng trî gióp Phi Th­êng §¹o Nh©n thu phôc dŞ thó.",
	"Tu©n lÖnh.",
	"(Tiªu råi, nÕu S¸t thñ Oa Oa ®Õn Cæ D­¬ng ®éng nh­ng kh«ng thÊy bãng d¸ng cña Cæ D­¬ng thó ®©u vµ ph¸t hiÖn thi thÓ cña Phi Th­êng §¹o Nh©n, NhÊt phÈm ®­êng ®Òu biÕt chØ cã ta ch¹m tr¸n Phi Th­êng §¹o Nh©n, th©n phËn gi¸n ®iÖp bŞ b¹i lé th× mäi nç lùc cña ta sÏ tiªu tan. Chi b»ng trõ khö S¸t thñ Oa Oa, xem nh­ lµ trõ h¹i cho d©n, nh­ng ng­êi nµy kh«ng dÔ ®èi phã, ph¶i lµm sao ®©y? §óng råi, Viªn Bé kho¸i tõng b¾t h¾n chi b»ng hái h¾n cã kÕ s¸ch g×. Kh«ng biÕt Viªn Bé kho¸i cã ë nha m«n Phông T­êng kh«ng.)",
	}

	TalkEx("",strTalk);
	DelItem(2,0,728,1);--É¾È¥Î±ÔìÒ©·½
	SetTask(TASK_XB_ID_01,52);
	TaskTip("§Õn nha m«n Phông T­êng ®iÒu tra hµnh tung cña Viªn Phi V©n ®Ó dß hái viÖc giÕt S¸t thñ Oa Oa.");
	Msg2Player("§Õn nha m«n Phông T­êng ®iÒu tra hµnh tung cña Viªn Phi V©n ®Ó dß hái viÖc giÕt S¸t thñ Oa Oa.");
	GivePlayerAward("Award_XB_46","Easy");
	GivePlayerExp(SkeyXibei,"wawashashou")
	add_xb_title(5);--Ò»Æ·ÌÃÓğÎÀ³ÆºÅ

end

--»¹Î´Óë²¶¿ì¶Ô»°
function task_020_02_1()

local strTalk = {
	"S¸t thñ Oa Oa ®Õn Cæ D­¬ng ®éng bµn b¹c víi Phi Th­êng §¹o Nh©n, nhê «ng ta thu phôc Cæ D­¬ng thó, nh­ng ®Õn giê vÉn ch­a cã tin tøc, ng­¬i ®· tõng ®Õn Cæ D­¬ng ®éng, th«ng thuéc ®Şa h×nh, ng­¬i ®i mét chuyÕn phèi hîp víi S¸t thñ Oa Oa, cïng trî gióp Phi Th­êng §¹o Nh©n thu phôc dŞ thó.",
	"(Tiªu råi, S¸t thñ Oa Oa ®Õn Cæ D­¬ng ®éng th©n phËn gi¸n ®iÖp mµ bŞ b¹i lé th× mäi nç lùc cña ta sÏ tiªu tan. Chi b»ng trõ khö S¸t thñ Oa Oa, xem nh­ lµ trõ h¹i cho d©n, nh­ng ng­êi nµy kh«ng dÔ ®èi phã, ph¶i lµm sao ®©y? §óng råi, Viªn Bé kho¸i tõng b¾t h¾n chi b»ng hái h¾n cã kÕ s¸ch g×. Kh«ng biÕt Viªn Bé kho¸i cã ë nha m«n Phông T­êng kh«ng.)",
	}

	TalkEx("",strTalk);

end

--Óë·ïÏè²¶¿ì¶Ô»°Ñ¯ÎÊÔ¬·ÉÔÆĞĞ×Ù
function task_020_03_0()

local strTalk = {
	"<sex> l¹i lµ ng­¬i, ®Õn t×m Viªn Bé kho¸i n÷a h¶?",
	"Bé ®Çu ®¹i ca cã trİ nhí rÊt tèt, kh«ng biÕt Viªn Bé kho¸i cã ë nha m«n kh«ng?",
	"Viªn Bé kho¸i kh«ng cã lóc nµo r¶nh, kh«ng b¾t ph¹m nh©n vÒ quy ¸n th× còng bŞ th­¬ng, İt khi nµo xuÊt hiÖn ë nha m«n, ë nha m«n trªn d­íi ®Òu kh©m phôc t¸c phong cña Viªn Bé kho¸i vµ lÊy ®ã lµm g­¬ng, xö ¸n kh«ng d¸m khinh suÊt. LÇn nµy Viªn Bé kho¸i ®Õn Mª cung sa m¹c thô lı ¸n.",
	"Mª cung sa m¹c lµ n¬i kh«ng mét bãng ng­êi, còng x¶y ra vô ¸n nµo sao?",
	"§¹i ®¹o ®éc hµnh l·o §µ trèn tr¸nh sù truy b¾t cña Viªn Bé kho¸i, nªn trèn vµo Mª cung sa m¹c. Nh­ng Viªn Bé kho¸i dÔ g× tha cho h¾n, còng vµo sa m¹c truy b¾t. §éc hµnh l·o §µ tµi nghÖ cao c­êng, toµn sö dông binh khİ kú qu¸i, nÕu ng­¬i muèn t×m Viªn Bé kho¸i th× ph¶i cÈn thËn tªn ®¹o tÆc nµy.",
	"Ta ®i t×m Viªn Bé kho¸i, ®a t¹ bé ®Çu ®¹i ca chØ gi¸o.",
	}

	SetTask(TASK_XB_ID_01,53);
	TalkEx("",strTalk);
	TaskTip("§Õn Mª cung sa m¹c, t×m ®­îc §éc hµnh l·o §µ th× sÏ t×m ®­îc Viªn bé ®Çu.");
	Msg2Player("§Õn Mª cung sa m¹c, t×m ®­îc §éc hµnh l·o §µ th× sÏ t×m ®­îc Viªn bé ®Çu.");

end

--»¹Î´É±ËÀ¶ÀĞĞÀÏÍÓºÍ²¶¿ì¶Ô»°
function task_020_03_1()

local strTalk = {
	"Giang Nam §¹i ®¹o ®éc hµnh l·o §µ trèn tr¸nh sù truy lïng cña Viªn Bé kho¸i nªn trèn vµo Mª cung sa m¹c. Viªn Bé kho¸i còng vµo sa m¹c truy b¾t.",
	}

	TalkEx("",strTalk);

end

--ÓëÌÆºùÂ«¶Ô»°ÂòÌÇºùÂ«
function task_020_04_0()

local strTalk = {
	"B»ng h÷u cã b¸n kÑo hå l« kh«ng?",
	"<sex> biÕt xem hµng ®Êy, kÑo hå l« cña ta chua ngät hßa quyÖn vµo nhau, ¨n vµo gi¶i kh¸t l¹i no bông. Lµ sè 1 cña §¹i Tèng ®ã. Nh­ng <sex> ®Õn kh«ng ®óng lóc, ta ®· b¸n hÕt kÑo hå l« lµm h«m nay cho ng­êi t×m kho b¸u sa m¹c, bän hä ®Õn ®©y mua ®Şnh kú, ®©y lµ mãn ¨n võa gi¶i kh¸t võa lãt d¹ tuyÖt nhÊt ë sa m¹c. §óng lóc h«m nay bän hä xuÊt ph¸t. NÕu <sex> muèn mua th× ph¶i ®îi ®Õn mai, ta sÏ lµm c¸i míi cho.",
	"NÕu ®îi ®Õn mai qu¶ thùc kh«ng æn. §¸m ng­êi t×m kho b¸u ®i sa m¹c råi µ? ¤ng biÕt bän hä ®· ®i ®­îc mÊy giê råi?",
	"Bän hä ®i vÉn ch­a l©u, ®Òu lµ nh÷ng kh¸ch quen, ®i t×m kho b¸u sa m¹cråi, ch¾c lµ vÉn ch­a ®i xa, ch­a vµo s©u trong sa m¹c ®©u.",
	"B÷a kh¸c ta tíi mua kÑo hå l« cña b»ng h÷u, c¸o tõ.",
	}

	SetTask(TASK_XB_ID_01,55);
	TalkEx("",strTalk);
	CreateTrigger(0,1238,KILL_XB_XUNBAOREN);--É±¹Ö´¥·¢Æ÷
	TaskTip("§Õn Mª cung sa m¹c cã thÓ t×m thÊy 10 x©u kÑo hå l« trªn ng­êi t×m kho b¸u.");
	Msg2Player("§Õn Mª cung sa m¹c cã thÓ t×m thÊy 10 x©u kÑo hå l« trªn ng­êi t×m kho b¸u.");

end

--Î´È¡µÃ10¸ö±ùÌÇºùÂ«
function task_020_04_1()

local strTalk = {
	"Bän hä ®i vÉn ch­a l©u, ®Òu lµ nh÷ng kh¸ch quen, ®i t×m kho b¸u sa m¹cråi, ch¾c lµ vÉn ch­a ®i xa, ch­a vµo s©u trong sa m¹c ®©u.",
	}

	if	GetTrigger(KILL_XB_XUNBAOREN) == 0 then
		CreateTrigger(0,1238,KILL_XB_XUNBAOREN);
		TaskTip("§Õn Mª cung sa m¹c cã thÓ t×m thÊy 10 x©u kÑo hå l« trªn ng­êi t×m kho b¸u.");
		Msg2Player("§Õn Mª cung sa m¹c cã thÓ t×m thÊy 10 x©u kÑo hå l« trªn ng­êi t×m kho b¸u.");
	end

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø21·ÖÖ§1_12½£°ÎåóÕÅ----------------------------------
--É±ËÀÍŞÍŞÉ±ÊÖºó»Ø¼û³µÂÖ°ÔÍõ
function task_021_01_0()

local strTalk = {
	"ViÖc lín kh«ng hay råi, Cæ D­¬ng thó ®· xuÊt hiÖn, uy lùc v­ît qu¸ søc t­ëng t­îng cña chóng ta. Phi Th­êng §¹o Nh©n tù cho r»ng c¸ch thu phôc Cæ D­¬ng thó cã thÓ lµm t¨ng uy lùc cña nã, «ng ta muèn chiÕm lÊy Cæ D­¬ng thó.S¸t thñ Oa Oa sî r»ng d÷ nhiÒu lµnh İt. Ta vµo trong ®éng bŞ Cæ D­¬ng thó tÊn c«ng. Còng may tho¸t ®­îc, Cæ D­¬ng ®éng giê ®©y rÊt nguy hiÓm.",
	"C¸i g×? Rèt cuéc lµ cã chuyÖn g×? Phi Th­êng §¹o Nh©n thÒ víi ta r»ng b¶o ®¶m c¸ch thu phôc Cæ D­¬ng thó tuyÖt ®èi kh«ng x¶y ra sai sãt, giê ®©y l¹i thÊt thñ bá m¹ng cµng lµm liªn lôy ®Õn ThËp ®¹i kim cang. S¸t thñ Oa Oa bŞ bá m¹ng trong ®éng, ng­¬i tËn m¾t chøng kiÕn Cæ D­¬ng thó tÊn c«ng S¸t thñ Oa Oa ®óng kh«ng?",
	"Lóc ta vµo trong ®éng ®· kh«ng thÊy Phi Th­êng §¹o Nh©n vµ S¸t thñ Oa Oa ®©u c¶, chØ t×m thÊy 1 lÖnh bµi. Cæ D­¬ng thó thËt hung d÷, cã søc m¹nh ghª gím, sî r»ng ®ã lµ Háa luyÖn kim ®¬n cña Phi Th­êng §¹o Nh©n luyÖn ra. NÕu kh«ng th× cao thñ nh­ S¸t thñ Oa Oa, ngoµi Cæ D­¬ng thó bŞ c­êng hãa ra th× kh«ng cßn ai ®èi ®Çu næi?",
	"S¸t thñ Oa Oa tuy h×nh d¸ng nh­ trÎ con, nh­ng vÒ vâ c«ng chØ ®øng sau Th¸c B¹t Ho»ng . LÇn nµy thÊt b¹i, chØ sî h¾n trë tay kh«ng kŞp, viÖc nµy t¹m thêi dõng l¹i, ta sÏ cho ng­êi vµo ®éng ®iÒu tra. Cæ D­¬ng thó xuÊt hiÖn Cæ D­¬ng ®éng cµng nguy hiÓm h¬n, Tr­êng Sinh BÊt L·o ®¬n cÇn bµn b¹c kü h¬n. NhÊt phÈm ®­êng l¹i mÊt ®i mét trî thñ, ThËp ®¹i kim cang ®· th­¬ng vong h¬n mét n÷a, hµnh ®éng lÇn nµy xem nh­ lµ ®­îc mét mÊt m­êi. Hµnh ®éng lÇn nµy ®· lµm suy gi¶m thùc lùc tİch lòy ®· nhiÒu n¨m cña NhÊt phÈm ®­êng, tæn th­¬ng nguyªn khİ.",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_021_01_0_4()
		return 0;
	end

	TalkEx("task_021_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_021_01_0_1()

local strTalk = {
	"NhÊt phÈm ®­êng cã nhiÒu nh©n tµi, l¹i thªm cao thñ sè mét T©y H¹ lµ Th¸c B¹t Ho»ng , søc m¹nh kh«ng l­êng ®­îc.",
	"Ta kh«ng muèn lµm mÊt uy phong cña m×nh, viÖc ®· ®Õn n­íc nµy. Cßn Th¸c B¹t Ho»ng  tù cho r»ng cã Lı Nguyªn Kh¸nh ®¹i nh©n n©ng ®ì th× coi nhÑ nhiÖm vô. Ta cã nghe Th¸c B¹t Ho»ng  mua chuéc T­ M· Minh Phong kh«ng thµnh, nh­ng l¹i bŞ T­ M· Minh Phong dïng tµ yªu mª hoÆc, muèn ph¶n béi l¹i NhÊt phÈm ®­êng. Lı Nguyªn Kh¸nh ®¹i nh©n ®· ®Ó ı ®Õn chuyÖn nµy. Th¸c B¹t Ho»ng  lÇn nµy lµ tù t¹o nghiÖt.",
	"Cã chuyÖn nµy sao? Th¸c B¹t Ho»ng  nhËn lÖnh mua chuéc T­ M· Minh Phong, sao l¹i bŞ h¾n xói giôc råi?",
	}

	TalkEx("task_021_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_021_01_0_2()

local strTalk = {
	"Ta còng kh«ng râ n÷a. Tãm l¹i lµ Th¸c B¹t Ho»ng  ®· cã ı ph¶n béi NhÊt PhÈm ®­êng nªn téi kh«ng thÓ tha. Ng­¬i h·y ®em Thuèc d­îc nh©n cho h¾n uèng.",
	"Ta ®i t×m Th¸c B¹t Ho»ng ®©y.",
	"(Thuèc d­îc nh©n nµy kh«ng cã t¸c dông, quan hÖ cña Th¸c B¹t tiÒn bèi vµ NhÊt PhÈm ®­êng ®· ®Õn håi gay cÊn. NÕu Xa Lu©n B¸ V­¬ng ph¸i ng­êi ®Õn Cæ D­¬ng ®éng ®iÒu tra sÏ lé th× th©n phËn gi¸n ®iÖp cña ta sÏ bŞ lé. Hay lµ ®i ®iÒu tra xem xu h­íng hiÖn t¹i cña NhÊt PhÈm ®­êng.)",
	}

	TalkEx("task_021_01_0_3",strTalk);

end

--·¢½±Àø
function task_021_01_0_3()

	give_wp_award(49);

end

--³É¹¦ÁìÈ¡½±ÀøºóÖ´ĞĞ
function task_021_01_0_4()

	DelItem(2,0,754,1);--É¾È¥ÍŞÍŞÁîÅÆ
	AddItem(2,0,731,1,1);--µÃµ½Ò©ÈËÒ©
	SetTask(TASK_XB_ID_01,57);
	GivePlayerAward("Award_XB_49","Easy");
	GivePlayerExp(SkeyXibei,"jisha")
	TaskTip("T×m Th¸c B¹t Ho»ng, t×m c¸ch che giÊu th©n phËn gi¸n ®iÖp ®Ó dß la thªm tin tøc cña NhÊt PhÈm ®­êng.");
	Msg2Player("T×m Th¸c B¹t Ho»ng, t×m c¸ch che giÊu th©n phËn gi¸n ®iÖp ®Ó dß la thªm tin tøc cña NhÊt PhÈm ®­êng.");

end;

--Î´ÓëÍØ°Îºë¶Ô»°
function task_021_01_1()

local strTalk = {
	"Th¸c B¹t Ho»ng  ®· cã ı ph¶n béi NhÊt PhÈm ®­êng nªn téi kh«ng thÓ tha. Ng­¬i h·y ®em Thuèc d­îc nh©n cho h¾n uèng.",
	}

	TalkEx("",strTalk);

end

--ÓëÍØ°Îºë¶Ô»°
function task_021_02_0()

local strTalk = {
	"Th× ra lµ ng­¬i, Xa Lu©n B¸ V­¬ng sai ng­¬i ®Õn ®Ó thu phôc ta, tiÕc lµ ta kh«ng thÓ cïng ng­¬i ®¸nh mét trËn cho ®·.",
	"Trong NhÊt PhÈm ®­êng chØ cã tiÒn bèi lµ ®¸ng kİnh, sao ta l¹i cã thÓ…",
	"ı ta ®· quyÕt ng­¬i chí nhiÒu lêi. Ta vµ T­ M· Minh Phong quyÕt ®Êu 3 ngµy 3 ®ªm trªn ®Ønh Hoa S¬n tõ ®ã ®· thøc tØnh. Ta tõng nghÜ r»ng gia nhËp NhÊt PhÈm ®­êng sÏ gÆp ®­îc cao thñ ®Ó ®­îc tháa lßng.",
	"Ch¼ng ph¶i Th¸c B¹t tiÒn bèi ®· nãi, NhÊt PhÈm §­êng ®· gióp ng­êi t×m ®­îc rÊt nhiÒu cao thñ hay sao?",
	"§ã chØ lµ c¸i cí ®Ó bµnh tr­íng thÕ lùc cña NhÊt §­êng th«i. B×nh sinh ta lu«n kİnh träng nh÷ng ng­êi cã chİ häc vâ, cßn NhÊt PhÈm §­êng chØ muèn cã ®­îc vò lùc cña hä, sau khi chiªu mé vµo §­êng th× giao cho c¸c nhiÖm vô ¸m s¸t, hoÆc xói giôc l«i kĞo, hoÆc ph¸ ho¹i, chØ toµn c¸c hµnh ®éng bøc h¹i ®éc ¸c. Ta c¶m thÊy téi lçi v× ®· kĞo nh÷ng cao thñ v« l©m nµy vµo thÕ giíi ®en tèi cña NhÊt PhÈm §­êng.",
	}

	TalkEx("task_021_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_021_02_0_1()

local strTalk = {
	"Th¸c B¹t tiÒn bèi xin ®õng tù tr¸ch m×nh, mäi viÖc ®Òu do NhÊt PhÈm §­êng…",
	"Trong sè c¸c cao thñ còng kh«ng İt ng­êi cã thÓ trë thµnh tri kû nh­ T­ M· Minh Phong, nh­ng ®Òu ph¶n béi hoÆc bŞ trõ khö. Míi ®©y Lı Nguyªn Kh¸nh ®· tíi t×m ta, muèn ta th«i ®Êu víi T­ M· Minh Phong, bëi h¾n ®· kh«ng cßn nhÉn n¹i ®­îc n÷a. T­ M· Minh Phong ®· kh«ng cßn ®­îC NhÊt PhÈm §­êng chÊp nhËn, nÕu c¶ T­ M· Minh Phong còng bŞ h¹i, th× thiªn h¹ cßn ai hiÓu ®­îc Th¸c B¹t Ho»ng? Môc ®İch ban ®Çu cña ta ®· bŞ lÖch h­íng, Lı Nguyªn Kh¸nh còng kh«ng cßn vŞ nÓ ¬n x­a, ta hµ tÊt ph¶i biÕn m×nh thµnh con cê trong tay kÎ kh¸c? Ta ®· nãi hÕt lêi, ®­îc chÕt d­íi tay ng­¬i còng lµ mét sù may m¾n, ra tay ®i.",
	"Xem ra Th¸c B¹t tiÒn bèi ®· h¹ quyÕt t©m, vËy th× tèt qu¸. Tõ ngµy kÕt giao víi tiÒn bèi ®Õn nay, ta ®Òu thÊy tiÕc cho ng­êi, mét n¬i xÊu xa ®en tèi nh­ NhÊt PhÈm §­êng lµm sao xøng ®¸ng víi mét ®Êng anh hµo nh­ thÕ? Nh­ng giê th× ta ®· hiÓu râ ngän ngµnh. TiÒn bèi yªn t©m, ta kh«ng cã ı h¹i ng­êi ®©u, h¬n n÷a d­îc nh©n d­îc nµy lµ do ta ph­¬ng thuèc gi¶ ®Ó t¹o ra.",
	"...Ch¶ tr¸ch gÇn ®©y NhÊt PhÈm §­êng lu«n gÆp trë ng¹i, ra ®Òu do <sex> c¶. Ta kh©m phôc tµi trİ vµ dòng khİ cña ng­¬i, ta t­ëng chõng ®· bu«ng xu«i kh«ng ngê l¹i gÆp ®­îc mét tri kû nh­ ng­¬i.",
	"Sao tiÒn bèi l¹i nãi vËy? VÕt th­¬ng cña tiÒn bèi sau vµi ngµy sÏ khái, rót khái NhÊt PhÈm ®­êng th× thËt lµ tiÕc.",
	}

	TalkEx("task_021_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_021_02_0_2()

local strTalk = {
	"Ng­¬i cã ®iÒu kh«ng biÕt råi, kh«ng ai ph¶n béi NhÊt PhÈm ®­êng mµ cã thÓ sèng sãt, chóng lËp nªn Ngò hµnh sø lµ ®Ó tiªu diÖt ph¶n ®å. ChuyÖn ta kÕt nghÜa víi T­ M· Minh Phong ®· bŞ Lı Nguyªn Kh¸nh biÕt ®­îc, h¾n ®· ra lÖnh lÊy m¹ng cña ta, lÇn nµy ta chÕt ch¾c råi.",
	"Ngò hµnh trËn lµ g× mµ víi søc cña tiÒn bèi còng kh«ng ph¸ ®­îc?",
	"Ngò hµnh trËn chuyªn ®Ó thanh lı m«n hé sao cã thÓ dÔ dµng ph¸ ®­îc? Dï ta cã ®i hay kh«ng còng ph¶i chŞu chÕt. Ng­¬i ph¶i cÈn thËn kh«ng ®Ó lé th©n phËn nÕu kh«ng chóng sÏ ®èi phã ng­¬i.",
	"TiÒn bèi, trêi kh«ng tuyÖt ®­êng sèng cña ng­êi, Ngò hµnh trËn nµy sím muén ta còng ph¶i ®èi diÖn, chi b»ng b©y giê ®i tiªu diÖt nã ®Ó tiÒn bèi cã thÓ hÕt lßng víi vâ thuËt, thÕ kh«ng tèt sao?",
	"Ngò hµnh trËn kh«ng thÓ ph¸ bëi søc cña 1 ng­êi nh­ng ng­¬i cã thÓ t×m b¹n ®ång hµnh. Ngò hµnh trËn ë trong sa m¹c khi thÊy LÖnh bµi cña ta th× Ngò hµnh trËn sø sÏ dÉn ng­¬i vµo trong Ngò hµnh trËn, trong ®ã cã 5 ng­êi, ng­¬i ph¶i cÈn thËn. Ng­¬i nhÊt ®Şnh ph¶i gi÷ m¹ng ®Ó trë vÒ ®Êu víi ta 1 trËn.",
	"TiÒn bèi ®· dÆn sao d¸m kh«ng nghe?",
	}

	TalkEx("",strTalk);
	DelItem(2,0,731,1);--É¾È¥Ò©ÈËÒ©
	SetTask(TASK_XB_ID_01,58);
	AddItem(2,0,755,1,1);--Ò»Æ·ÍØ°ÎÁî
	TaskTip("§Õn mª cung sa m¹c t×m Ngò hµnh trËn sø xuÊt tr×nh lÖnh bµi ®Ó dÉn Ngò hµnh sø ra.");
	Msg2Player("§Õn mª cung sa m¹c t×m Ngò hµnh trËn sø xuÊt tr×nh lÖnh bµi ®Ó dÉn Ngò hµnh sø ra.");
	GivePlayerAward("Award_XB_50","Easy");
	GivePlayerExp(SkeyXibei,"panzhe")
end

--Î´É±ËÀÎåĞĞÊ¹¶Ô»°
function task_021_02_1()

local strTalk = {
	"Ngò hµnh trËn kh«ng thÓ ph¸ bëi søc cña 1 ng­êi nh­ng ng­¬i cã thÓ t×m b¹n ®ång hµnh. Ngò hµnh trËn ë trong sa m¹c khi thÊy LÖnh bµi cña ta th× Ngò hµnh trËn sø sÏ dÉn ng­¬i vµo trong Ngò hµnh trËn, trong ®ã cã 5 ng­êi, ng­¬i ph¶i cÈn thËn. Ng­¬i nhÊt ®Şnh ph¶i gi÷ m¹ng ®Ó trë vÒ ®Êu víi ta 1 trËn.",
	}

	TalkEx("",strTalk);

	--²¹·¢ÍØ°ÎÁîÈÎÎñÎïÆ·
	if GetItemCount(2,0,755) < 1 then
		AddItem(2,0,755,1,1);--Ò»Æ·ÍØ°ÎÁî
		TaskTip("§Õn mª cung sa m¹c t×m Ngò hµnh trËn sø xuÊt tr×nh lÖnh bµi ®Ó dÉn Ngò hµnh sø ra.");
		Msg2Player("§Õn mª cung sa m¹c t×m Ngò hµnh trËn sø xuÊt tr×nh lÖnh bµi ®Ó dÉn Ngò hµnh sø ra.");
	end

end

--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃÍØ°ÎÁî¶Ô»°
function task_021_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(WuXingShi_MapData));
local xWPos,yWPos,xPos,yPos = WuXingShi_MapData[nMapDataIndex][1],WuXingShi_MapData[nMapDataIndex][2],WuXingShi_MapData[nMapDataIndex][3],WuXingShi_MapData[nMapDataIndex][4]
local nNpcIndex1,nNpcIndex2,nNpcIndex3,nNpcIndex4,nNpcIndex5 = 0,0,0,0,0;

	--Íæ¼ÒÈôÈÎÎñÊ§°ÜĞèÒª¹ı30·ÖÖÓ²ÅÄÜÖØĞÂË¢³öÎåĞĞÊ¹
	if GetTime()-GetTask(CREAT_YAOWANG_TIME)	>= 1800 then

		strTalk = {
			"Ng­¬i lµ ai?",
			"Ta lµ ng­êi khiªu chiÕn, thÕ còng kh«ng nhËn ra sao?",
			"Qu¶ lµ gan d¹!",
			}

		DelItem(2,0,755,1);--É¾³ıÒ»Æ·ÍØ°ÎÁî
		SetTask(CREAT_WUXINGSHI_TIME,GetTime());--¼ÇÂ¼ÎåĞĞÊ¹Ë¢ĞÂÊ±¼ä
		nNpcIndex1 = CreateNpc("Ngò Hµnh Sø Kim","Ngò Hµnh Sø Kim",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex2 = CreateNpc("Ngò Hµnh Sø Méc","Ngò Hµnh Sø Méc",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex3 = CreateNpc("Ngò Hµnh Sø Thñy","Ngò Hµnh Sø Thñy",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex4 = CreateNpc("Ngò Hµnh Sø Háa","Ngò Hµnh Sø Háa",506,xWPos,yWPos,-1,1,1,70);
		nNpcIndex5 = CreateNpc("Ngò Hµnh Sø Thæ","Ngò Hµnh Sø Thæ",506,xWPos,yWPos,-1,1,1,70);
		SetNpcScript(nNpcIndex1,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\ÎåĞĞÊ¹½ğ.lua");
		SetNpcScript(nNpcIndex2,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\ÎåĞĞÊ¹Ä¾.lua");
		SetNpcScript(nNpcIndex3,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\ÎåĞĞÊ¹Ë®.lua");
		SetNpcScript(nNpcIndex4,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\ÎåĞĞÊ¹»ğ.lua");
		SetNpcScript(nNpcIndex5,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\ÎåĞĞÊ¹ÍÁ.lua");
		SetNpcLifeTime(nNpcIndex1,1500);
		SetNpcLifeTime(nNpcIndex2,1500);
		SetNpcLifeTime(nNpcIndex3,1500);
		SetNpcLifeTime(nNpcIndex4,1500);
		SetNpcLifeTime(nNpcIndex5,1500);

		Msg2Player("Ngò hµnh sø xuÊt hiÖn ë  "..xPos..", "..yPos.." , h·y mau ®i tiªu diÖt h¾n.")
		TaskTip("Ngò hµnh sø xuÊt hiÖn ë  "..xPos..", "..yPos.." , h·y mau ®i tiªu diÖt h¾n.");

	else

		strTalk = {
			"…",
			"Thêi gian Ngò hµnh sø xuÊt hiÖn c¸ch nhau 30 phót, h·y ®îi chót ®i!"
			}

	end

	TalkEx("",strTalk);

end

--ÒÑ¾­ÁìÈ¡ÈÎÎñµ«»¹Î´È¡µÃÍØ°ÎÁî¶Ô»°
function task_021_03_1()

local strTalk = {
	"…",
	"…",
	};

	TalkEx("",strTalk);

end

--ÒÑ¾­É±ËÀÎåĞĞÊ¹£¬¹Ø¿¨½Ó¿Ú¿ªÆô
function task_021_03_2()

local strTalk = {
	"Vâ c«ng cña c¸c h¹ qu¶ lµ tuyÖt vêi.",
	};

	TalkEx("",strTalk);

end


--ÒÑ¾­´ò°ÜÎåĞĞÊ¹ÓëÍØ°Îºë¶Ô»°
function task_021_04_0()

local strTalk = {
	"GÆp <sex> quay vÒ, biÕt ng­¬i ®· ph¸ ®­îc Ngò hµnh trËn, Ngò Hµnh Sø kh«ng ph¶i lµ ®èi thñ cña ng­¬i, ta rÊt muèn ®­îc giao ®Êu víi ng­¬i. Ng­¬i ®· cøu m¹ng Th¸c B¹t Ho»ng, ¬n nµy kh«ng biÕt ph¶i tr¶ thÕ nµo.",
	"TiÒn bèi ®· coi ta lµ ng­êi quen, kh«ng cÇn ph¶i c¶m ¬n. Khi nµo tiÒn bèi Th¸c B¹t kháe l¹i, sÏ ®Õn thØnh gi¸o B¹n.",
	"Ha ha, ®õng kh¸ch s¸o. L©u råi ta kh«ng ®­îc tho¶i m¸i nh­ h«m nay, kh«ng bŞ rµng buéc, lµ ®¹o tù nhiªn, lµ ®¹o vâ häc, rÊt tèt. Nh­ng T©y H¹ Ph¸p V­¬ng s¾p ®Õn sa m¹c, lÇn nµy ch¾c cã chuyÖn, ng­¬i ph¶i thËn träng.",
	}

	TalkEx("task_021_04_0_1",strTalk);

end

--Ğø¶Ô»°
function task_021_04_0_1()

local strTalk = {
	"õm. TiÒn bèi cã tin cña NhÊt PhÈm ®­êng gÇn ®©y kh«ng?",
	"L©u nay ta c¶m thÊy NhÊt PhÈm ®­êng kh«ng cßn tin ta n÷a, nhiÒu bİ mËt ®ang ®­îc gi÷ kİn. ChuyÖn B¶n ®å S¬n Hµ X· T¾c ch­a cã kÕt qu¶, cßn ph­¬ng thuèc cña hä còng lµ gi¶. LÇn nµy hµnh ®éng cña Phông T­êng phñ m­êi phÇn cã ®Õn t¸m chİn phÇn ®· x«i háng báng kh«ng. NÕu Xa Lu©n B¸ V­¬ng  biÕt ng­¬i lµ gi¸n ®iÖp, e r»ng toµn bé cao thñ Trung Nguyªn thu nhËn lÇn nµy còng ch¼ng lµm ®­îc g×. Nh­ vËy tiÕng t¨m cña h¾n sÏ bŞ NhÊt PhÈm ®­êng h¹ thÊp vµ sÏ bŞ ph¶n c«ng. Ng­¬i ph¶i lo¹i bá ®iÒu nµy tr­íc khi h¾n ra tay.",
	"Xa Lu©n B¸ V­¬ng lÇn nµy ch¾c ch¾n sÏ chŞu kh«ng İt tr¸ch nhiÖm cho lÇn thÊt tr¸ch nµy. Kh«ng biÕt cßn cã ©m m­u g× sau l­ng h¾n kh«ng, ta còng c¶m thÊy Xa Lu©n B¸ V­¬ng sÏ b¸o thï NhÊt PhÈm ®­êng, thËm chİ g©y häa cho c¶ trung nguyªn. §a t¹ tiÒn bèi Th¸c B¹t ®· nh¾c nhë, Xa Lu©n B¸ V­¬ng ch¾c sÏ trõ ®­îc nã vµ quay vÒ.",
	}

	TalkEx("",strTalk);
	DelItem(2,0,743,1);--É¾È¥ÍØ°ÎÁî
	SetTask(TASK_XB_ID_01,60);
	TaskTip("KÎ lµm néi øng ch¾c ®· bŞ v¹ch trÇn, ®· ®Õn lóc quyÕt chiÕn mét trËn víi Xa Lu©n B¸ V­¬ng.");
	Msg2Player("KÎ lµm néi øng ch¾c ®· bŞ v¹ch trÇn, ®· ®Õn lóc quyÕt chiÕn mét trËn víi Xa Lu©n B¸ V­¬ng.");
	GivePlayerAward("Award_XB_51","Easy");
	GivePlayerExp(SkeyXibei,"wuxingzhen")
end

--Î´´ò°Ü³µÂÖ°ÔÍõ
function task_021_04_1()

local strTalk = {
	"Hµnh ®éng lµn nµy cña Xa Lu©n B¸ V­¬ng  t¹i Phông T­êng phñ m­êi phÇn cã ®Õn t¸m chİn phÇn ®· bŞ ng­¬i ph¸ háng, ch¾c sÏ kh«ng dÔ chŞu thua, ng­¬i ph¶i ra tay tr­íc khi h¾n hµnh ®éng.",
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø22·ÖÖ§1_13´óÄ®»ÃÏó----------------------------------
--Óë³µÂÖ°ÔÍõ¶Ô»°²¢ÓëÆäÕ½¶·
function task_022_01_0()

local nNpcIndex = GetTargetNpc();
local strTalk = {
	"Ha ha ha, ®óng lµ thuèc gi¶, ®óng lµ m­în dao giÕt ng­êi. Ng­¬i cßn d¸m quay vÒ gÆp ta µ? Ng­¬i chÕt ®i.",
	}

	if nNpcIndex == nil then
		return
	end

	TalkEx("#task_022_01_1("..nNpcIndex..")",strTalk);
	TaskTip("H·y quyÕt chiÕn mét trËn víi Xa Lu©n B¸ V­¬ng.");
	Msg2Player("H·y quyÕt chiÕn mét trËn víi Xa Lu©n B¸ V­¬ng.");

end

--×ª»»³µÂÖ°ÔÍõÕ½¶·×´Ì¬
function task_022_01_1(nNpcIndex)

	ChangeNpcToFight(nNpcIndex);

end

--´ò°Ü³µÂÖ°ÔÍõºóÓëÆä¶Ô»°
function task_022_01_2()

local strTalk = {
	"Ngµy tµn cña Tèng triÒu kh«ng cßn xa, Trung nguyªn sím muén g× còng lµ thiªn h¹ cña T©y H¹. Ha ha ha.",
	}

	TalkEx("",strTalk);

end



--»ã±¨Å·Ñô»­É³Ä®»ÃÏóÒ»ÊÂ
function task_022_02_0()

local strTalk = {
	"TiÒn bèi, NhÊt PhÈm ®­êng ®· biÕt râ th©n phËn ta, thùc lùc cña NhÊt PhÈm ®­êng gÇn nh­ ®· tiªu hao hÕt. Xa Lu©n B¸ V­¬ng còng bŞ ta ®¸nh b¹i, nh­ng h¾n lu«n miÖng nãi cµn, nµo lµ ¶o gi¸c sa m¹c s¾p th«n tİnh §¹i Tèng, §¹i Tèng s¾p diÖt vong.",
	"¶o gi¸c sa m¹c? Ta ch­a tõng nghe qua, nh­ng ®©y lµ ®iÒu nh÷ng nhµ bu«n ®i qua sa m¹c hoÆc ng­êi ®Õn sa m¹c t×m b¸u vËt nãi. ¶o gi¸c lµ chuyÖn cã thËt, nh­ng ng­¬i l¹i nãi ch­a tõng nghe ®Õn. Th©n phËn ng­¬i ®· bŞ NhÊt PhÈm ®­êng biÕt râ, cã lÏ ng­¬i ®ang gÆp nguy hiÓm?",
	"Ngò hµnh sø, ng­êi bŞ NhÊt PhÈm ®­êng truy s¸t còng ®· bŞ trõ khö, ch¾c kh«ng qu¸ nguy hiÓm. Nh­ng ¶o gi¸c sa m¹c d­êng nh­ Èn chøa nhiÒu bİ mËt. T©y H¹ Ph¸p V­¬ng d­êng nh­ ®ang thao tóng phİa sau.",
	"Ng­¬i rót lui ta thËt yªn t©m. T©y H¹ Ph¸p V­¬ng kh«ng thÓ coi th­êng, ¶o gi¸c sa m¹c lµ thø v« h×nh, nÕu ®­îc T©y H¹ Ph¸p V­¬ng dïng, hËu qu¶ sÏ khã l­êng. H·y ®i hái ng­êi cña C«n L«n ph¸i, cã lÏ hä biÕt ®­îc bİ mËt.",
	"§Ö Tö C«n L«n cã lÏ biÕt ®­îc bİ mËt. H·y hái «ng ta. Ta xin c¸o tõ.",
	}

	SetTask(TASK_XB_ID_01,62);
	TalkEx("",strTalk);
	TaskTip("H·y ®Õn C«n L«n hái DiÖp Tö Thu vÒ ¶o gi¸c sa m¹c.");
	Msg2Player("H·y ®Õn C«n L«n hái DiÖp Tö Thu vÒ ¶o gi¸c sa m¹c.");
	GivePlayerAward("Award_XB_52","Easy");
	GivePlayerExp(SkeyXibei,"poxiangzhifa")
end

--»¹Î´Ñ¯ÎÊÒ¶×ÓÇï¹ØÓÚÉ³Ä®»ÃÏóÒ»ÊÂ
function task_022_02_1()

local strTalk = {
	"Ng­êi cña C«n L«n ph¸i cã lÏ biÕt bİ mËt cña ¶o gi¸c sa m¹c, ng­¬i h·y ®Õn ®ã hái.",
	"§Ö Tö C«n L«n cã lÏ biÕt ®­îc bİ mËt. H·y hái «ng ta. Ta xin c¸o tõ.",
	}

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø23·ÖÖ§1_14»ÆÉ³ÂäÄ»----------------------------------
--Ñ¯ÎÊÒ¶×ÓÇï¹ØÓÚÉ³Ä®»ÃÏóµÄÊÂÇé
function task_023_01_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"\'B¸ t¸nh cã n¹n, ®¹i ®¹o bÊt h­ng, ®¹i nghÜa quy Èn, thÒ hÕt lßng tu ®¹o thuËt, trõ « uÕ, gi¸ng yªu ma, thiªn h¹ th¸i b×nh\'. Ng­¬i cã chuyÖn chi cÇn gÆp ta?",
			"DiÖp thiÕu hiÖp vÉn sung søc nh­ x­a. Cã ®iÒu nµy muèn hái, thiÕu hiÖp cã biÕt trong sa m¹c cã ¶o gi¸c kh«ng? Kh«ng biÕt ¶o gi¸c sa m¹c nµy lµ g×?",
			"Ng­¬i nãi ®Õn ChÊn lÇu trong sa m¹c µ? Nh­ng nguån gèc kh«ng râ rµng, còng kh«ng cã søc m¹nh. Nh­ng nÕu bŞ khèng chÕ, sÏ gäi ®­îc ChÊn trong truyÒn thuyÕt xa x­a. ¶o gi¸c mµ ChÊn t¹o ra cã thÓ biÕn ra nhiÒu h×nh d¹ng kh¸c nhau, cã thÓ th«n tİnh trêi ®Êt. NÕu lÇn nµy nã xuÊt hiÖn, sÏ khã thu phôc, v× h×nh d¹ng thËt cña chóng khã t×m, cã thÓ g©y ®¹i häa.",
			"Qu¶ ®óng Xa Lu©n B¸ V­¬ng  kh«ng phao tin giËt g©n. DiÖp thiÕu hiÖp, NhÊt PhÈm ®­êng ®· ph¸i T©y H¹ Ph¸p V­¬ng ®i khèng chÕ ¶o gi¸c, cßn khoe khoang muèn dïng ¶o gi¸c th«n tİnh Trung Nguyªn, g©y häa chiÕn tranh.",
			}
	else
		strTalk = {
			"\'B¸ t¸nh cã n¹n, ®¹i ®¹o bÊt h­ng, ®¹i nghÜa quy Èn, thÒ hÕt lßng tu ®¹o thuËt, trõ « uÕ, gi¸ng yªu ma, thiªn h¹ ®­îc th¸i b×nh. \' <sex> cã kháe kh«ng?",
			"DiÖp thiÕu hiÖp vÉn sung søc nh­ x­a. Cã ®iÒu nµy muèn hái, thiÕu hiÖp cã biÕt chuyÖn trong sa m¹c cã µo gi¸c kh«ng? Kh«ng biÕt ¶o gi¸c sa m¹c nµy lµ g×?",
			" <sex> nãi ®Õn ChÊn lÇu trong sa m¹c µ? Nã cã nguån gèc kh«ng râ rµng, còng kh«ng cã søc m¹nh. Nh­ng nÕu bŞ khèng chÕ, sÏ gäi ®­îc ChÊn trong truyÒn thuyÕt xa x­a. ¶o gi¸c mµ ChÊn t¹o ra cã thÓ biÕn thµnh nhiÒu h×nh d¹ng kh¸c nhau, cã thÓ th«n tİnh trêi ®Êt. NÕu nã xuÊt hiÖn, sÏ khã thu phôc, v× h×nh d¹ng thËt cña nã khã t×m, cã thÓ g©y ®¹i häa.",
			"Qu¶ ®óng Xa Lu©n B¸ V­¬ng  kh«ng phao tin giËt g©n. DiÖp thiÕu hiÖp, NhÊt PhÈm ®­êng ®· ph¸i T©y H¹ Ph¸p V­¬ng ®i khèng chÕ ¶o gi¸c, cßn khoe khoang muèn dïng ¶o gi¸c th«n tİnh Trung Nguyªn, g©y häa chiÕn tranh.",
			}
	end

	TalkEx("task_023_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_023_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"¶o gi¸c sa m¹c tuy m¹nh, nh­ng kh«ng thÓ th«n tİnh ®­îc c¶ trêi ®Êt nµy. Nh­ng th«n tİnh c¶ sa m¹c, mª hoÆc lßng ng­êi, ®Çu ®éc qu©n ®éi qu¶ lµ d­ søc. Muèn ®èi phã víi ChÊn ®· bŞ khèng chÕ, ph¶i t×m ®­îc nguyªn h×nh cña nã. Nguyªn h×nh cña ChÊn kh«ng hiÖn ra sÏ khã ®èi phã, trõ phi t×m ®­îc ph¸p khİ phong Ên cña ng­êi khèng chÕ ChÊn.",
			"Ph¸p khİ phong Ên nµy ch¾c lµ cña T©y H¹ Ph¸p V­¬ng. Ph¶i ®èi phã thÕ nµo?",
			"¶o gi¸c sa m¹c kh«ng dÔ ®èi phã, nÕu cã Ph¸p khİ phong Ên, ¶o gi¸c sÏ biÕn ra nhiÒu h×nh d¹ng, nÕu ng­¬i ®¸nh b¹i, nã sÏ hiÖn hiªn nguyªn h×nh ChÊn, muèn ®¸nh b¹i ChÊn, ph¶i sö dông Phong yªu th¸p nµy niÖm Lêi nguyÒn—— thu phôc nã, nÕu kh«ng nã sÏ lÉn trèn mÊt t¨m. Muèn ®èi phã víi nã còng kh«ng cßn c¬ héi n÷a.",
			"D¸m hái Lêi nguyÒn phong Ên nµy lµ g× vËy?",
			}
	else
		strTalk = {
			"¶o gi¸c sa m¹c tuy m¹nh, nh­ng kh«ng thÓ th«n tİnh ®­îc c¶ trêi ®Êt nµy. Nh­ng th«n tİnh c¶ sa m¹c, mª hoÆc lßng ng­êi, ®Çu ®éc qu©n ®éi qu¶ lµ d­ søc. Muèn ®èi phã víi ChÊn ®· bŞ khèng chÕ, ph¶i t×m ®­îc nguyªn h×nh cña nã. Nguyªn h×nh cña ChÊn kh«ng hiÖn ra sÏ khã ®èi phã, trõ phi t×m ®­îc ph¸p khİ phong Ên cña ng­êi khèng chÕ ChÊn.",
			"Ph¸p khİ phong Ên nµy ch¾c lµ cña T©y H¹ Ph¸p V­¬ng. Ph¶i ®èi phã thÕ nµo?",
			"¶o gi¸c sa m¹c bŞ khèng chÕ kh«ng dÔ ®èi phã, nÕu cã Ph¸p khİ phong Ên, ¶o gi¸c sÏ biÕn thµnh nhiÒu h×nh d¹ng, nÕu ng­¬i ®¸nh b¹i, nã sÏ hiÖn hiªn nguyªn h×nh ChÊn, ®¸nh b¹i ChÊn, ph¶i sö dông phong yªu th¸p nµy niÖm lêi nguyÒn—— thu phôc nã, nÕu kh«ng nã sÏ lÉn trèn mÊt t¨m. Muèn ®èi phã víi nã còng kh«ng cßn c¬ héi n÷a.",
			"D¸m hái Lêi nguyÒn phong Ên nµy lµ g× vËy?",
			}
	end

	TalkEx("task_023_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_023_01_0_2()

local nCruseIndex = random(1,getn(HUANXIANG_CURSE));
local strTalk = {}

	SetTask(HUANGXIANG_CURSE_ID,nCruseIndex);

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i ph¶i nhí "..HUANXIANG_CURSE[nCruseIndex].." , ®©y lµ lêi nguyÒn phong Ên, kh«ng ®­îc nhí sai, nÕu kh«ng sÏ phİ c«ng nhäc søc!",
			"Th× ra lµ vËy, ¶o gi¸c sa m¹c l¹i khã ®èi phã nh­ vËy, kh«ng biÕt ¶o gi¸c th­êng xuÊt hiÖn n¬i nµo?",
			"Cuèi sa m¹c th­êng cã ¶o gi¸c xuÊt hiÖn, nh­ng kh«ng cã h­íng ®Ó t×m Sa m¹c, khã nhËn ra ®­êng ®Ó ®i ®Õn cuèi, nh­ng ta t×nh cê quen víi B¹ch Thiªn Thµnh, ng­êi t×m b¸u vËt ë sa m¹c, «ng ta n¨m nµo còng ®Õn sa m¹c, biÕt râ sa m¹c nh­ lßng bµn tay, ng­¬i h·y ®i t×m «ng ta, «ng ta cã thÓ sÏ dÉn ng­¬i ®Õn cuèi sa m¹c.",
			"Th× ra lµ vËy, ®a t¹ ®¹i s­ huynh. Ta sÏ ®i t×m ph¸p khİ phong Ên, kh«ng ®Ó cho ¶o gi¸c sa m¹c h¹i ®êi.",
			}
	else
		strTalk = {
			"Ng­¬i ph¶i nhí "..HUANXIANG_CURSE[nCruseIndex].." , ®©y lµ lêi nguyÒn phong Ên, kh«ng ®­îc nhí sai, nÕu kh«ng sÏ phİ c«ng nhäc søc!",
			"Th× ra lµ vËy, ¶o gi¸c sa m¹c l¹i khã ®èi phã nh­ vËy, kh«ng biÕt ¶o gi¸c th­êng xuÊt hiÖn n¬i nµo?",
			"Cuèi sa m¹c th­êng cã ¶o gi¸c xuÊt hiÖn, nh­ng kh«ng cã h­íng ®i ®Õn Sa m¹c, khã nhËn ra ®­êng ®Ó ®i ®Õn cuèi, nh­ng ta t×nh cê quen víi B¹ch Thiªn Thµnh, ng­êi t×m b¸u vËt ë sa m¹c, «ng ta n¨m nµo còng ®Õn sa m¹c, biÕt râ sa m¹c nh­ lßng bµn tay, ng­¬i h·y ®i t×m «ng ta, «ng ta sÏ dÉn ng­¬i ®Õn cuèi sa m¹c.",
			"Th× ra lµ vËy, ®a t¹ DiÖp thiÕu hiÖp ®· cho ta biÕt nhiÒu tin cã İch nh­ vËy. Ta sÏ ®i t×m ph¸p khİ phong Ên, kh«ng ®Ó cho ¶o gi¸c sa m¹c h¹i ®êi.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,732,1,1);--µÃµ½·âÑıËş
	SetTask(TASK_XB_ID_01,63);
	TaskTip("§Õn D­îc V­¬ng Cèc ®¸nh b¹i T©y H¹ Ph¸p V­¬ng ®äat ph¸p khİ phong Ên.");
	Msg2Player("§Õn D­îc V­¬ng Cèc ®¸nh b¹i T©y H¹ Ph¸p V­¬ng ®äat ph¸p khİ phong Ên.");

end

--»¹Î´´ò°ÜÎ÷ÏÄ·¨Íõ
function task_023_01_1()

local strTalk = {}
local nCruseIndex = GetTask(HUANGXIANG_CURSE_ID);

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Muèn ®èi phã víi ¶o gi¸c sa m¹c ph¶i t×m ®­îc Ph¸p khİ phong Ên, cßn ph¶i t×m B¹ch Thiªn Thµnh, ng­êi t×m b¸u vËt ë sa m¹c dÉn ng­¬i ®Õn cuèi sa m¹c, míi thÊy ®­îc ¶o gi¸c.",
			"Ng­¬i ph¶i nhí "..HUANXIANG_CURSE[nCruseIndex].." , ®©y lµ lêi nguyÒn phong Ên, kh«ng ®­îc nhí sai, nÕu kh«ng sÏ phİ c«ng nhäc søc!",
			}
	else
		strTalk = {
			"Muèn ®èi phã víi ¶o gi¸c sa m¹c ph¶i t×m ®­îc Ph¸p khİ phong Ên, cßn ph¶i t×m B¹ch Thiªn Thµnh, ng­êi t×m b¸u vËt ë sa m¹c dÉn ng­¬i ®Õn cuèi sa m¹c, míi thÊy ®­îc ¶o gi¸c.",
			"Ng­¬i ph¶i nhí "..HUANXIANG_CURSE[nCruseIndex].." , ®©y lµ lêi nguyÒn phong Ên, kh«ng ®­îc nhí sai, nÕu kh«ng sÏ phİ c«ng nhäc søc!",
			}
	end

	--²¹ÁìËøÑıËş
	if GetItemCount(2,0,732) < 1 then
		AddItem(2,0,732,1,1);--µÃµ½·âÑıËş
	end

	TalkEx("",strTalk);

end

--»¹Î´´ò°Ü»ÃÏóÖ®Ç°ÓëÒ¶×ÓÇï¶Ô»°²¹Áì·âÑıËş
function task_023_01_2()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Muèn ®èi phã víi ¶o gi¸c sa m¹c ph¶i t×m ®­îc Ph¸p khİ phong Ên, cßn ph¶i t×m B¹ch Thiªn Thµnh, ng­êi t×m b¸u vËt ë sa m¹c dÉn ng­¬i ®Õn cuèi sa m¹c, míi thÊy ®­îc ¶o gi¸c.",
			}
	else
		strTalk = {
			"Muèn ®èi phã víi ¶o gi¸c sa m¹c ph¶i t×m ®­îc Ph¸p khİ phong Ên, cßn ph¶i t×m B¹ch Thiªn Thµnh, ng­êi t×m b¸u vËt ë sa m¹c dÉn ng­¬i ®Õn cuèi sa m¹c, míi thÊy ®­îc ¶o gi¸c.",
			}
	end

	--²¹ÁìËøÑıËş
	if GetItemCount(2,0,732) < 1 then
		AddItem(2,0,732,1,1);--µÃµ½·âÑıËş
	end

	TalkEx("",strTalk);

end

--É±ËÀ·¨ÍõºóÓë°×Ìì³É¶Ô»°Ë¢³ö»ÃÏó
function task_023_02_0()

local strTalk = {};

	--Íæ¼ÒÈôÈÎÎñÊ§°ÜĞèÒª¹ı30·ÖÖÓ²ÅÄÜÖØĞÂË¢³öÎåĞĞÊ¹
	if GetTime()-GetTask(CREAT_HUANGXIANG_TIME)	>= 1800 then

		strTalk = {
			"VŞ nµy lµ B¹ch Thiªn Thµnh µ? Nghe nãi B¹ch tiªn sinh th­êng t×m b¶o vËt ë sa m¹c, ch¾c biÕt râ h­íng sa m¹c. Kh«ng biÕt B¹ch tiªn sinh cã thÓ ®­a ta ®Õn cuèi sa m¹c ®­îc kh«ng?",
			"B¹ch Thiªn Thµnh Cuèi sa m¹c ch¼ng ph¶i lµ n¬i thó vŞ g×, ta khuyªn <sex> ®õng ®i chuyÕn nµy. Cuèi sa m¹c khã nhËn ra h­íng ®i, h¬n n÷a nguy hiÓm lu«n r×nh rËp, l¹i cßn cã ¶o gi¸c mª hoÆc lßng ng­êi, nÕu kh«ng lµ chuyÖn lín th× nªn tr¸nh. H¬n n÷a ta chØ t×m nh÷ng thø cã gi¸ trŞ mµ th«i, cuèi sa m¹c ch¼ng cã g× hay, ®i lµm g× c¬ chø?",
			"Nh­ng B¹ch tiªn sinh, ¶o gi¸c cuèi sa m¹c ®· bŞ ®¸nh thøc, nÕu kh«ng sím ®èi phã, chØ e sÏ g©y häa cho d©n, huèng chi sau nµy ®Õn cuèi sa m¹c t×m b¸u vËt ch¼ng lÏ c¸c h¹ còng muèn khiÕp sî n÷a sao?",
			"¶o gi¸c sa m¹c lµm ng­êi ta bŞ th­¬ng µ? Tr­íc kia ®i qua ®ã, ta kh«ng thÊy ¶o gi¸c lµm ng­êi ta bŞ th­¬ng? Nh­ng ¶o gi¸c cã bİ Èn g×?",
			}
		TalkEx("task_023_02_0_1",strTalk);
	else

		strTalk = {
			"¶o gi¸c nµy tho¾t Èn tho¾t hiÖn, <sex> ®îi chót n÷a h·y ®Õn, lóc nµy ta còng kh«ng lµm g× ®­îc.",
			}
		TalkEx("",strTalk);
	end
end

--Ğø¶Ô»°
function task_023_02_0_1()

local nMapDataIndex = random(1,getn(HuangXiang_MapData));
local xWPos,yWPos,xPos,yPos = HuangXiang_MapData[nMapDataIndex][1],HuangXiang_MapData[nMapDataIndex][2],HuangXiang_MapData[nMapDataIndex][3],HuangXiang_MapData[nMapDataIndex][4]
local nNpcIndex = 0;
local strTalk = {
	"§óng vËy, kÎ ®éc ¸c muèn khèng chÕ ¶o gi¸c, lÇn nµy ta ®Õn cuèi sa m¹c lµ ®Ó phong Ên ¶o gi¸c. Xem nµy, ®©y lµ Ph¸p khİ phong Ên dïng ®Ó khèng chÕ ¶o gi¸c, b¹ch tiªn sinh ®­a ta ®i ®­îc kh«ng?",
	"å? Ph¸p khİ nµy lµ mãn ®å kh«ng tåi. VÇy ®i, ta sÏ dÉn ng­¬i ®Õn cuèi sa m5c, nh­ng ng­¬i ph¶i tÆng ph¸p khİ nµy cho ta, thÕ nµo? ",
	"Ng­êi t×m b¸u vËt qu¶ nhiªn ®Òu tham b¸u vËt, th«i, ph¸p khi nµy dïng ®Ó gäi nguyªn h×nh cña ChÊn, sau khi thu ChÊn vµo phong yªu th¸p còng hÕt t¸c dông, tÆng cho «ng ta còng kh«ng sao.)",
	"§­îc, nÕu B¹ch tiªn sinh thİch vËt nµy, ®îi ta phong Ên ¶o gi¸c xong, sÏ tÆng nã cho «ng ®Ó c¶m t¹.",
	"Ta nhí lÇn tr­íc ë "..xPos..", "..yPos.." ®· gÆp qua¶o gi¸c, <sex> h·y ®i kiÓm tra xem sao.",
	}

	TalkEx("",strTalk);
	SetTask(CREAT_HUANGXIANG_TIME,GetTime());--¼ÇÂ¼»ÃÏóË¢ĞÂÊ±¼ä
	nNpcIndex = CreateNpc("Hoan T­îng (T­íng lÜnh t­îng)","¶o gi¸c thèng lÜnh",506,xWPos,yWPos,-1,1,1,70);
	SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\É³Ä®ÃÔ¹¬\\npc\\»ÃÏóÍ³Áì.lua");
	SetNpcLifeTime(nNpcIndex,1800);
	Msg2Player("§Õn  "..xPos..", "..yPos.." , t×m vµ tiªu diÖt ¶o gi¸c.")
	TaskTip("§Õn  "..xPos..", "..yPos.." , t×m vµ tiªu diÖt ¶o gi¸c.");

end

--ÉĞÎ´´ï³É´ò°Ü»ÃÏóµÄÌõ¼ş
function task_023_02_1()

local strTalk = {
	"§©y lµ sa m¹c ®¸ng sî, kh«ng thËn träng sÏ mÊt m¹ng nh­ ch¬i.",
	};

	TalkEx("",strTalk);

end

--ÒÑ¾­É±ËÀ»ÃÏó£¬¹Ø¿¨½Ó¿Ú¿ªÆô
function task_023_02_2()

local strTalk = {
	"C¸c h¹ cã b¸u vËt quı g× thÕ?",
	};

	TalkEx("",strTalk);

end

--ÒÑ¾­·âÓ¡»ÃÏó£¬½«·¨Æ÷ËÍ¸ø°×Ìì³É
function task_023_03_0()

local strTalk = {
	"<sex> vÒ råi µ? Cã phong Ên ¶o gi¸c sa m¹c kh«ng?",
	"Kh«ng sai, ¶o gi¸c nµy qu¶ lµ kh«ng dÔ ®èi phã, nh­ng sau nµy ®i vµo sa m¹c t×m b¸u vËt sÏ dÔ dµng h¬n. §©y lµ ph¸p khİ, ®a t¹ B¹ch tiªn sinh ®· dÉn ®­êng.",
	"<sex> chí kh¸ch khİ, ta míi lµ ng­êi ph¶i ®a t¹ ng­¬i, sau nµy nÕu muèn ®Õn cuèi sa m¹c cø ®Õn t×m ta, ta sÏ dÉn ®­êng cho ng­¬i.",
	}

	DelItem(2,0,733,1);--É¾È¥·¨Æ÷
	SetTask(TASK_XB_ID_01,66);
	TalkEx("",strTalk);
	TaskTip("Mang phong yªu th¸p vÒ C«n L«n cho DiÖp Tö Thu.");
	Msg2Player("Mang phong yªu th¸p vÒ C«n L«n cho DiÖp Tö Thu.");
	GivePlayerAward("Award_XB_54","Easy");
	GivePlayerExp(SkeyXibei,"fengyao")
end

--½«·âÑıËş´ø¸øÒ¶×ÓÇï
function task_023_04_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"thÊy <sex> b×nh yªn quay vÒ, nh­ng cã phong Ên ¶o gi¸c sa m¹c ®­îc kh«ng?",
			"Nhê DiÖp thiÕu hiÖp chØ gi¸o, nªn ®· phong Ên ¶o gi¸c sa m¹c t¹i Phong yªu th¸p nµy, nh­ vËy, ChÊn còng kh«ng cßn h¹i d©n ®­îc n÷a.",
			"Tèt, ng­¬i ®· lµm mét viÖc lín cho vâ l©m, ®¹i s­ huynh thËt tù hµo vÒ ng­¬i.",
			"DiÖp thiÕu hiÖp qu¸ lêi råi. HÕt lßng v× vâ l©m, lµ tr¸ch nhiÖm cña ta. Ta cßn ph¶i ®i thªm chuyÕn n÷a, nãi sù t×nh cho ¢u D­¬ng Häa  tiÒn bèi biÕt. Xin c¸o tõ.",
			}
	else
		strTalk = {
			"ThÊy <sex> b×nh yªn quay vÒ, nh­ng cã phong Ên ¶o gi¸c sa m¹c ®­îc kh«ng?",
			"Nhê DiÖp thiÕu hiÖp chØ gi¸o, ®· phong Ên ¶o gi¸c sa m¹c t¹i Phong yªu th¸p nµy, nh­ vËy, ChÊn còng kh«ng cßn h¹i d©n ®­îc n÷a.",
			"Tèt, <sex> l¹i lµm mét viÖc lín cho vâ l©m, t¹i h¹ thËt b¸i phôc.",
			"DiÖp thiÕu hiÖp qu¸ lêi råi. HÕt lßng v× vâ l©m, lµ tr¸ch nhiÖm cña ta. Ta cßn ph¶i ®i thªm chuyÕn n÷a, nãi sù t×nh cho ¢u D­¬ng Häa  tiÒn bèi biÕt, sau nµy sÏ vÒ th¨m.",
			}
	end

	DelItem(2,0,732,1);--É¾È¥·âÑıËş
	SetTask(TASK_XB_ID_01,67);
	TalkEx("",strTalk);
	TaskTip("Nãi cho ¢u D­¬ng Häa biÕt chuyÖn phong Ên ¶o gi¸c.");
	Msg2Player("Nãi cho ¢u D­¬ng Häa biÕt chuyÖn phong Ên ¶o gi¸c.");

end

--»¹Î´»ã±¨Å·Ñô»­
function task_023_04_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i v× d©n trõ h¹i, thËt khiÕn ®¹i s­ huynh b¸i phôc.",
			"DiÖp thiÕu hiÖp qu¸ lêi råi. HÕt lßng v× vâ l©m, lµ tr¸ch nhiÖm cña ta. Ta cßn ph¶i ®i thªm chuyÕn n÷a, nãi sù t×nh cho ¢u D­¬ng Häa  tiÒn bèi biÕt. Xin c¸o tõ."
			}
	else
		strTalk = {
			"<sex> v× d©n trõ h¹i, thËt khiÕn t¹i h¹ b¸i phôc.",
			"DiÖp thiÕu hiÖp qu¸ lêi råi. HÕt lßng v× vâ l©m, lµ tr¸ch nhiÖm cña ta. Ta cßn ph¶i ®i thªm chuyÕn n÷a, nãi sù t×nh cho ¢u D­¬ng Häa  tiÒn bèi biÕt, sau nµy sÏ vÒ th¨m.",
			}
	end

	TalkEx("",strTalk);

end

--½«ÊÂÇé¸æÖªÅ·Ñô»­
function task_023_05_0()

local strTalk = {
	"¢u D­¬ng tiÒn bèi, ¶o gi¸c sa m¹c qu¶ nhiªn lµ chiªu lîi h¹i nhÊt cña NhÊt PhÈm ®­êng, may lµ, chóng ta ®· phong Ên ¶o gi¸c sa m¹c tr­íc khi h¾n hµnh ®éng.",
	"Tèt, tèt, nh÷ng g× vâ l©m lµm lÇn nµy ®óng lµ t¹o phóc cho thiªn h¹. Thùc lùc cña NhÊt PhÈm ®­êng phen nµy ch¾c sÏ bŞ ®¸nh b¹i. Nh÷ng ng­êi vong mÖnh t¹i Phông T­êng phñ chØ e ch¼ng İch g×; B¶n §å S¬n Hµ X· T¾c còng sÏ tù ®éng mÊt ®i; kÕ ho¹ch muèn dïng d­îc nh©n x©m ph¹m §¹i Tèng còng ®· tan thµnh m©y khãi, T©y H¹ ch¾c sÏ kh«ng d¸m ra giang hå mét thêi gian. Nh­ng ta còng lo Lı Nguyªn Kh¸nh sÏ kh«ng chŞu ®Ó yªn, e r»ng sÏ ph¶n c«ng, thÕ nh­ng, ta rÊt yªn t©m, ng­¬i ®¸nh cho NhÊt PhÈm ®­êng thÊt ®iªn b¸t ®¶o, chóng còng kh«ng d¸m b¸o thï ng­¬i, Tr­êng ca m«n nh©n cña ta sÏ hÕt søc b¶o vÖ <sex>. ",
	"NÕu NhÊt PhÈm ®­êng ®Õn b¸o thï, ta còng kh«ng lo, ta sÏ quªn m×nh ®Ó trõ h¹i cho d©n. Ta ®· kÕt ®­îc nhiÒu b¹n tèt, cuèi cïng ta ®· t×m ®­îc ng­êi góp ta. ¢u D­¬ng tiÒn bèi, ®a t¹ ®· ra kÕ s¸ch.",
	}

	TalkEx("task_023_05_0_1",strTalk);

end

--Ğø¶Ô»°
function task_023_05_0_1()

local strTalk = {
	"Ha ha ha, b©y giê nhí l¹i mèi lo cña ng­¬i, míi ®ã ng­¬i ®· cøu §¹i Tèng tho¸t khái dÇu s«i löa báng. ¥n nµy thËt khã quªn. ¢m m­u quû kÕ cña NhÊt PhÈm ®­êng tuy ®· bŞ ph¸, ThËp ®¹i kim cang còng ®· tæn thÊt nghiªm träng, b©y giê chØ lo NhÊt PhÈm ®­êng sÏ tõ bá chiÕn l­îc Thao Quang D­ìng Hèi, tÊn c«ng t©y b¾c vâ l©m, chØ e lóc ®ã <sex> vÉn ph¶i ®Õn gióp ®ì.",
	"§©y lµ tr¸ch nhiÖm cña ta, kh«ng thÓ chèi tõ.",
	"Nh×n thÊy <sex> ®Çy nhiÖt huyÕt nh­ vËy, ta thËt vui mõng. Tuy §¹i Tèng s¾p diÖt vong, nh­ng lóc nµo còng trµn ®Çy hy väng vµo ng­¬i. Phån hoa l¹c m¹c, chung h÷u hång trÇn tam thiªn, kh¸m chóng sinh thÕ gian, giai thŞ t×nh duyªn. <sex> vÊt v¶ qu¸.",
	}

	--TalkEx("task_023_05_0_2",strTalk);--¹Ø±Õ×îÖÕ½±Àø¶Ò»»
	TalkEx("task_029_01_0",strTalk);
	SetTask(TASK_XB_ID_01,68);
	GivePlayerAward("Award_XB_55","Easy");
	GivePlayerExp(SkeyXibei,"qixia")
	AddItem(0,107,156,1,1);
	--É¾È¥Ò»Æ·ÌÃ³ÆºÅ
	for i=1,6 do
		RemoveTitle(60,i);
	end
	add_xb_title(7);--»ñµÃµıÓ°ÆæÏÀ³ÆºÅ
end

function task_023_05_0_2()

local strTalk = {
	"Nh×n thÊy <sex> ®Çy nhiÖt huyÕt nh­ vËy, ta thËt vui mõng. Tuy §¹i Tèng s¾p diÖt vong, nh­ng lóc nµo còng trµn ®Çy hy väng vµo ng­¬i. Phån hoa l¹c m¹c, chung h÷u hång trÇn tam thiªn, kh¸m chóng sinh thÕ gian, giai thŞ t×nh duyªn. <sex> vÊt v¶ qu¸.",
	}

	TalkEx("",strTalk);
	AddTitle(60,7);--»ñµÃ´óËÎÓ¢ĞÛ³ÆºÅ

end

------------------------------------------·ÖÖ§2´ı¸Ä---------------------------------------------------------------
---------------------------------- Î÷±±Çø24·ÖÖ§2_1¹íÃÅÔ©»ê----------------------------------
--ÓëÅ·Ñô»­¶Ô»°²éÌ½¹ØÓÚÀ¥ÂØÈëÊÀµÄÊÂÇé
function task_024_01_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"¢u D­¬ng tiÒn bèi, ta ®· th©m nhËp NhÊt PhÈm ®­êng ®­îc råi. §óng råi, ta cßn mét chuyÖn muèn hái.",
			"Tèt, tèt, th©m nhËp ®­îc vµo NhÊt PhÈm ®­êng còng lµ b­íc ®­îc b­íc ®Çu tiªn, khã kh¨n ng­¬i s¾p ®èi mÆt kh«ng thÓ coi th­êng, nªn thËn träng, gÆp r¾c rèi cø ®Õn t×m ta, ta sÏ cè g¾ng gióp ng­¬i. ChuyÖn g× nãi ®i.",
			"TiÒn bèi vÉn nhiÖt t×nh nh­ vËy, ta xin ®a t¹. TiÒn bèi lµ kh¸ch giang hå, lµ ng­êi tõng tr¶i, kh«ng biÕt tiÒn bèi cã tõng nghe ®Õn T­ M· Minh Phong? Ng­êi nµy d­êng nh­ lµ cao thñ vâ l©m.",
			"Cã ph¶i ng­¬i nãi ®Õn KiÕm thÇn T­ M· Minh Phong? Xem ra, T­ M· Minh Phong thËt næi danh. 18 n¨m tr­íc luËn kiÕm ë Hoa S¬n, ®Ønh Hoa S¬n tËp trung c¸c cao thñ trong thiªn h¹, l¹i nãi NhÊt Niªn Thanh kiÕm kh¸ch däc ngang Hoa S¬n nh­ thÇn, kh«ng ai tiÕp næi 20 chiªu cña «ng ta. Nhê ®ã, danh tiÕng «ng vang kh¾p thiªn h¹. Ng­êi nµy chİnh lµ T­ M· Minh Phong.",
			"Th× ra lµ nh©n vËt vâ l©m g©y chÊn ®éng nh­ vËy, sao l¹i kh«ng nghe tiÕng trong giang hå?",
			}
	else
		strTalk = {
			"¢u D­¬ng tiÒn bèi, ta ®· th©m nhËp NhÊt PhÈm ®­êng ®­îc råi. §óng råi, ta cßn mét chuyÖn muèn hái.",
			"Tèt, tèt, th©m nhËp ®­îc vµo NhÊt PhÈm ®­êng còng lµ b­íc ®­îc b­íc ®Çu tiªn, khã kh¨n ng­¬i s¾p ®èi mÆt kh«ng thÓ coi th­êng, nªn thËn träng, gÆp r¾c rèi cø ®Õn t×m ta, ta sÏ cè g¾ng gióp ng­¬i. ChuyÖn g× nãi ®i.",
			"TiÒn bèi vÉn nhiÖt t×nh nh­ vËy, ta xin ®a t¹. TiÒn bèi lµ kh¸ch giang hå, lµ ng­êi tõng tr¶i, kh«ng biÕt tiÒn bèi cã tõng nghe ®Õn T­ M· Minh Phong? Ng­êi nµy d­êng nh­ lµ cao thñ vâ l©m.",
			"Cã ph¶i ng­¬i nãi ®Õn KiÕm thÇn T­ M· Minh Phong? Xem ra, T­ M· Minh Phong thËt næi danh. 18 n¨m tr­íc luËn kiÕm ë Hoa S¬n, ®Ønh Hoa S¬n tËp trung c¸c cao thñ trong thiªn h¹, l¹i nãi NhÊt Niªn Thanh kiÕm kh¸ch däc ngang Hoa S¬n nh­ thÇn, kh«ng ai tiÕp næi 20 chiªu cña «ng ta. Nhê ®ã, danh tiÕng «ng vang kh¾p thiªn h¹. Ng­êi nµy chİnh lµ T­ M· Minh Phong.",
			"Th× ra lµ nh©n vËt vâ l©m g©y chÊn ®éng nh­ vËy, sao l¹i kh«ng nghe tiÕng trong giang hå?",
			}
	end

	TalkEx("task_024_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_024_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ha ha, gäi «ng ta lµ kiÕm thÇn, lµ v× «ng rót khái giang hå sau khi thÓ hiÖn kiÕm ph¸p v« song, nhiÒu n¨m tr­íc ng­êi trªn nói Hoa S¬n nh¾c ®Õn kiÕm ph¸p thÇn kú kia, cßn T­ M· Minh Phong bİ Èn biÕn mÊt, còng ®­îc biÕt ®Õn lµ KİÕm thÇn h¹ phµm, xuÊt quû nhËp thÇn. §¸nh trËn g©y chÊn ®éng thiªn h¹, nh­ng sau ®ã l¹i biÕn mÊt, nh­ vËy cã truyÒn kú kh«ng chø? ChuyÖn nµy ®­îc truyÒn tõ l©u trong giang hå, ng­êi ®êi còng dÇn quªn. N¨m ®ã ta may m¾n ®­îc thÊy kiÕm ph¸p cña «ng ta trªn ®Ønh Hoa S¬n, ®óng lµ tuyÖt kü.",
			"Kh«ng ngê T­ M· Minh Phong l¹i cã lai lŞch lín nh­ vËy, ch¼ng tr¸ch §Ö nhÊt dòng sÜ T©y H¹ kh«ng ®Şch næi «ng ta. TiÒn bèi biÕt ng­êi nµy ë Phông T­êng, cßn ng­êi cña NhÊt PhÈm ®­êng d­êng nh­ ®ang tiÕp xóc víi «ng ta.",
			"å? Tõng nghe «ng ta ®i kh¾p bèn biÓn, hoÆc ë Giao ChØ, hoÆc ë Liªu Thæ, nh­ng ch­a nghe nãi «ng ta ë Phông T­êng phñ. NhÊt PhÈm ®­êng e r»ng ®ang truy t×m t«ng tİch cña «ng t¹i Phông T­êng , muèn mêi «ng nhËp ®­êng. NÕu ng­¬i ®· gÆp «ng ta, nªn l­u ı, nÕu «ng ta thËt sù gia nhËp NhÊt PhÈm ®­êng, NhÊt PhÈm ®­êng sÏ khã ®èi phã h¬n.",
			"Ta hiÓu råi.",
			}
	else
		strTalk = {
			"Ha ha, gäi «ng ta lµ kiÕm thÇn, lµ v× «ng rót khái giang hå sau khi thÓ hiÖn kiÕm ph¸p v« song, nhiÒu n¨m tr­íc ng­êi trªn nói Hoa S¬n nh¾c ®Õn kiÕm ph¸p thÇn kú kia, cßn T­ M· Minh Phong bİ Èn biÕn mÊt, còng ®­îc biÕt ®Õn lµ KİÕm thÇn h¹ phµm, xuÊt quû nhËp thÇn. §¸nh trËn g©y chÊn ®éng thiªn h¹, nh­ng sau ®ã l¹i biÕn mÊt, nh­ vËy cã truyÒn kú kh«ng chø? ChuyÖn nµy ®­îc truyÒn tõ l©u trong giang hå, ng­êi ®êi còng dÇn quªn. N¨m ®ã ta may m¾n ®­îc thÊy kiÕm ph¸p cña «ng ta trªn ®Ønh Hoa S¬n, ®óng lµ tuyÖt kü.",
			"Kh«ng ngê T­ M· Minh Phong l¹i cã lai lŞch lín nh­ vËy, ch¼ng tr¸ch §Ö nhÊt dòng sÜ T©y H¹ kh«ng ®Şch næi «ng ta. TiÒn bèi biÕt ng­êi nµy ë Phông T­êng, cßn ng­êi cña NhÊt PhÈm ®­êng d­êng nh­ ®ang tiÕp xóc víi «ng ta.",
			"å? Tõng nghe «ng ta ®i kh¾p bèn biÓn, hoÆc ë Giao ChØ, hoÆc ë Liªu Thæ, nh­ng ch­a nghe nãi «ng ta ë Phông T­êng phñ. NhÊt PhÈm ®­êng e r»ng ®ang truy t×m t«ng tİch cña «ng t¹i Phông T­êng , muèn mêi «ng nhËp ®­êng. NÕu ng­¬i ®· gÆp «ng ta, nªn l­u ı, nÕu «ng ta thËt sù gia nhËp NhÊt PhÈm ®­êng, NhÊt PhÈm ®­êng sÏ khã ®èi phã h¬n. ",
			}
	end

	TalkEx("task_024_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_024_01_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Cßn mét chuyÖn nhê ®Õn ng­¬i. Chim bå c©u ®­a th­ cña B¸ch HiÕu Sinh ®Õn b¸o, gÇn ®©y Trung Nguyªn th­êng xuÊt hiÖn ®Ö tö C«n L«n ph¸i, ®· g©y nghi ngê cho c¸c ®¹i m«n ph¸i, v× sù an nguy cña Trung Nguyªn, vâ l©m Trung Nguyªn x­a nay lu«n gi÷ th¸i ®é thËn träng víi c¸c m«n ph¸i ngo¹i lai. C¸c m«n ph¸i kh«ng hiÓu môc ®İch nhËp thÕ cña C«n L«n ph¸i, e r»ng sÏ g©y ph©n tranh. Ng­¬i lµ §Ö Tö C«n L«n, nªn g¸nh lÊy tr¸ch nhiÖm nµy, giê lµ lóc c¸c ph¸i ph¶i ®oµn kÕt l¹i, nãi râ chİ h­íng cña c¸c ng­¬i cho c¸c ph¸i biÕt, hãa gi¶i ph©n tranh kh«ng cÇn thiÕt, míi lµ ®iÒu quan träng nhÊt.",
			"Ph¸i ta kh«ng ph¶i İt ra giang hå, chØ lµ x­a nay ho¹t ®éng n¬i nói rõng, víi môc ®İch gi¸ng yªu trõ ma. Ta sÏ vÒ hái ®¹i s­ huynh DiÖp Tö Thu nguyªn nh©n ®Õn Trung Nguyªn lÇn nµy, ¢u D­¬ng tiÒn bèi ®õng qu¸ lo l¾ng.",
			"Hãa gi¶i ph©n tranh, kh«ng tá ra yÕu kĞm, ®óng lµ bËc kú tµi, <sex> thËt bao dung. Quû M«n Håi Lang tËp hîp nhiÒu §Ö Tö C«n L«n, d­êng nh­ ®· x¶y ra chuyÖn g× råi, ng­¬i h·y ®i xem thÕ nµo.",
			"Ta nhÊt ®Şnh sÏ cho tiÒn bèi biÕt môc ®İch nhËp thÕ cña ph¸i ta, Quû M«n Håi Lang lµ n¬i oan hån tËp hîp, ch¾c ®· x¶y ra chuyÖn g× råi, ta xin c¸o tõ. §a t¹ tiÒn bè ®· cho ta biÕt tin vÒ T­ M· Minh Phong.",
			}
	else
		strTalk = {
			"Ta hiÓu råi.",
			"Cßn mét chuyÖn nhê ®Õn ng­¬i. Chim bå c©u ®­a th­ cña B¸ch HiÕu Sinh ®Õn b¸o, gÇn ®©y Trung Nguyªn nhiÒu lÇn xuÊt hiÖn ®Ö tö C«n L«n ph¸i, Vâ l©m Trung Nguyªn x­a nay c¶nh gi¸c víi chuyÖ m«n ph¸i nhËp thÕ, C«n L«n ph¸i rÊt İt quan t©m ®Õn thÕ sù, lÇn nµy nhiÒu §Ö Tö C«n L«n ra giang hå, c¸c ph¸i vâ l©m nghi ngê môc ®İch cña hä. <sex> cã thÓ t×m hiÓu môc ®İch nhËp thÕ cña C«n L«n ph¸i ®­îc kh«ng? Cã nhiÒu §Ö Tö C«n L«n tËp trung t¹i Quû M«n Håi Lang, ng­¬i h·y ®i dß la xem sao.",
			"C«n L«n ph¸i tuy İt ra giang hå, nh­ng chİ h­íng kh«ng gièng gian tµ, nh­ ®Ó phßng bÊt tr¾c, còng nªn ®i t×m hiÓu mét lÇn, ¢u D­¬ng tiÒn bèi xin c¸o tõ. §a t¹ B¹n ®· cho ta biÕt tin vÒ T­ M· Minh Phong.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,1);
	if GetTask(TASK_XB_ID_01) == 1 then
		SetTask(TASK_XB_ID,40);--¹Ø±Õ08ÈÎÎñÃæ°å
	end
	TaskTip("H·y ®Õn Quû M«n Håi Lang ®iÒu tra chuyÖn §Ö Tö C«n L«n ®Õn Trung Nguyªn.");
	Msg2Player("H·y ®Õn Quû M«n Håi Lang ®iÒu tra chuyÖn §Ö Tö C«n L«n ®Õn Trung Nguyªn.");

end

--Óë¹íÃÅ»ØÀÈÖĞÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°
function task_024_02_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"ña? VŞ s­ huynh nµy sao bŞ th­¬ng vËy?",
			"VÕt th­¬ng cña ta kh«ng nÆng l¾m, chØ lµ t¹m thêi kh«ng hµnh ®éng ®­îc, oan hån t¹i Quû M«n Håi Lang d­êng nh­ ®ang m¹nh lªn, ta t¹m thêi bá qua ®¹i ı. Sao ng­¬i l¹i ®Õn ®©y?",
			"Nghe nãi n¬i ®©y ®· tËp hîp ®­îc mét sè ®Ö tö ph¸i ta, ta liÒn ®Õn xem cã chuyÖn g× x¶y ra. VÕt th­¬ng cña B¹n d­êng nh­ kh«ng nhÑ, cã cÇn gióp g× kh«ng?",
			"Th× ra lµ vËy, ta võa thu Oan hån vµo trong B×nh ®ùng hån nµy, ph¸p lùc cña b×nh ®ùng hån ®ang yÕu dÇn, chØ sî s¾p kh«ng chøa ®­îc oan hån. VÕt th­¬ng cña ta do oan hån lùc g©y ra, t¹m thêi khã hµnh ®éng, nh­ng kh«ng h¹i ®Õn tİnh m¹ng. Ng­¬i h·y mau mang b×nh nµy ®Õn chç §¹i s­ huynh ®­îc kh«ng? ¤ng ta sÏ tù biÕt néi dung ta muèn håi b¸o.",
			"§­îc, c¸c h¹ h·y tŞnh d­ìng, s½n ®©y xin hái ®¹i thiÕu hiÖp ch÷a vÕt th­¬ng cho c¸c h¹ nh­ thÕ nµo?",
			}
	else
		strTalk = {
			"ña? Nh×nh c¸ch ¨n mÆc cña c¸c h¹ gièng víi ®Ö tö C«n L«n ph¸i, sao l¹i bŞ th­¬ng vËy?",
			"VÕt th­¬ng cña ta kh«ng nÆng l¾m, chØ lµ t¹m thêi kh«ng hµnh ®éng ®­îc, Oan hån t¹i Quû M«n Håi Lang d­êng nh­ ®· m¹nh lªn, ta t¹m thêi bá qua ®¹i ı. Sao ng­¬i nhËn ra c¸ch ¨n mÆc cña C«n L«n ph¸i chóng ta?",
			"Ta vµ ®¹i ®Ö tö DiÖp Tö Thu cña C«n L«n ph¸i cã duyªn víi nhau, nªn biÕt ®­îc c¸ch ¨n mÆc cña c¸c h¹. VÕt th­¬ng cña c¸c h¹ cã vÎ kh«ng nhÑ, cã cÇn gióp g× kh«ng?",
			"Th× ra ng­¬i biÕt DiÖp s­ huynh, tèt, ta võa thu Oan hån vµo trong B×nh ®ùng hån nµy, ph¸p lùc cña b×nh ®ùng hån ®ang yÕu dÇn, chØ sî s¾p kh«ng chøa ®­îc oan hån. VÕt th­¬ng cña ta do oan hån lùc g©y ra, t¹m thêi khã hµnh ®éng, nh­ng kh«ng h¹i ®Õn tİnh m¹ng. Ng­¬i h·y mau mang b×nh nµy ®Õn chç DiÖp s­ huynh ®­îc kh«ng? ¤ng ta sÏ tù biÕt néi dung ta muèn håi b¸o.",
			"§­îc, c¸c h¹ h·y tŞnh d­ìng, s½n ®©y xin hái DiÖp thiÕu hiÖp ch÷a vÕt th­¬ng cho c¸c h¹ nh­ thÕ nµo?",
			}
	end

	SetTask(TASK_XB_ID_02,2);
	AddItem(2,0,699,1,1);--Ëø»êé×
	TalkEx("",strTalk);
	TaskTip("H·y mang b×nh ®ùng hån vÒ C«n L«n giao cho DiÖp Tö Thu");
	Msg2Player("H·y mang b×nh ®ùng hån vÒ C«n L«n giao cho DiÖp Tö Thu");

end

--ÉĞÎ´½«Ëø»êé×ËÍ·µÀ¥ÂØÓëÊÜÉËÀ¥ÂØµÜ×Ó¶Ô»°
function task_024_02_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Th× ra lµ vËy, ta võa thu Oan hån vµo trong B×nh ®ùng hån nµy, ta bŞ th­¬ng nªn t¹m thêi kh«ng ®i ®­îc, ng­¬i h·y mau mang chiÕc b×nh nµy ®Õn chç §¹i s­ huynh ®­îc kh«ng?",
			}
	else
		strTalk = {
			"Th× ra ng­¬i quen DiÖp s­ huynh, nh­ vËy thËt tèt, ta võa thu Oan hån vµo trong B×nh ®ùng oan hån nµy, ta bŞ th­¬ng nªn t¹m thêi kh«ng ®i ®­îc, ng­¬i h·y mau mang chiÕc b×nh nµy ®Õn chç DiÖp s­ huynh ®­îc kh«ng?",
			}
	end

	TalkEx("",strTalk);

end

--ÓëÒ¶×ÓÇï¶Ô»°½»¸øËûËø»êé×
function task_024_03_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"DiÖp s­ huynh, ta gÆp ng­êi cña ph¸i ta t¹i Quû M«n Håi Lang, «ng ta bŞ th­¬ng do thu phôc Oan hån nªn kh«ng thÓ hµnh ®éng, nªn nhê ta mang B×nh ®ùng hån nµy vÒ cho B¹n, B¹n xem cã g× kh¸c th­êng kh«ng.",
			"Sao? Cã ng­êi bŞ th­¬ng µ? Cã nÆng kh«ng? Cã ph¶i bŞ th­¬ng do Oan hån khİ bªn trong Quû M«n Håi Lang kh«ng?",
			"Nghe «ng ta nãi cã vÎ nh­ kh«ng trë ng¹i l¾m, chØ lµ t¹m thêi kh«ng hµnh ®éng ®­îc. ¤ng ta nãi v× søc m¹nh cña Oan hån t¹i Quû M«n Håi Lang bçng d­ng t¨ng lªn, t¹m thêi bá qua vÕt th­¬ng. Ta ®Şnh ch÷a cho «ng ta, nh­ng «ng ta l¹i b¶o ta mau vÒ phôc mÖnh.",
			"Th× ra lµ vËy, may lµ kh«ng bŞ th­¬ng nÆng, Quû M«n Håi Lang gÇn ®©y liªn tôc cã chuyÖn bÊt th­êng, oan hån trong ®ã còng bŞ c¶m hãa, rôch rŞch ngãc ®Çu dËy. S­ phô tõng nãi Trung Nguyªn cã ma, hoµnh hµnh kh¾p n¬i, xem ra lµ thËt.",
			}
	else
		strTalk = {
			"DiÖp s­ huynh, ta gÆp ng­êi cña ph¸i ta t¹i Quû M«n Håi Lang, «ng ta bŞ th­¬ng do thu phôc Oan hån nªn kh«ng thÓ hµnh ®éng, nªn nhê ta mang B×nh ®ùng hån nµy vÒ, xin xem thö!",
			"Sao? Cã ng­êi bŞ th­¬ng µ? Cã nÆng kh«ng? Cã ph¶i bŞ th­¬ng do Oan hån khİ bªn trong Quû M«n Håi Lang kh«ng?",
			"Ng­êi ch¬i Nghe «ng ta nãi cã vÎ nh­ kh«ng trë ng¹i l¾m, chØ lµ t¹m thêi kh«ng hµnh ®éng ®­îc. ¤ng ta nãi v× søc m¹nh cña Oan hån t¹i Quû M«n Håi Lang bçng d­ng t¨ng lªn, t¹m thêi bá qua vÕt th­¬ng.",
			"Th× ra lµ vËy, may mµ bŞ th­¬ng kh«ng nÆng, Quû M«n Håi Lang gÇn ®©y liªn tôc cã chuyÖn bÊt th­êng, oan hån trong ®ã còng bŞ c¶m hãa, rôch rŞch ngãc ®Çu dËy. S­ phô tõng nãi Trung Nguyªn cã ma, hoµnh hµnh kh¾p n¬i, xem ra lµ thËt.",
			}
	end

	TalkEx("task_024_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_024_03_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"S­ huynh th­êng nãi ph¸i cña ta hé thiªn ®Şa, trõ yªu ma, nh­ng İt khi hái chuyÖn Trung Nguyªn, b©y giê l¹i ®Õn Trung Nguyªn, cã ph¶i v× viÖc nµy?",
			"Kh«ng sai, tõ khi më nói lËp ph¸i, C«n L«n chuyªn trõ yªu diÖt ma, kü n¨ng tinh t­êng. Yªu ma trèn trong rõng s©u nói hiÓm, ®Ö tö ph¸i ta còng th­êng qua l¹i n¬i nµy, kh«ng ngê Trung Nguyªn Giang T©n th«n th­êng xuyªn cã quû h¹i ng­êi, chóng ta lµm sao cã thÓ ®Ó cho gian tµ h¹i d©n? Nªn míi ®Õn Trung Nguyªn. Cã ®iÒu ph¶i ®i vßng qua nói rõng, lµm cho c¸c ph¸i Trung Nguyªn kinh ng¹c, thËm chİ cßn g©y nghi ngê, nÕu cã hiÓu lÇm, th× nªn hãa gi¶i.",
			"Th× ra lµ vËy, ph¸i ta chuyªn trõ ma, b¶o vÖ thiªn ®Şa, n¬i nµo cã tµ ma, n¬i ®ã cã C«n L«n. C¸c ph¸i Trung Nguyªn x­a nay nghi kş víi c¸c ph¸i kh¸c, v× sù an toµn cña Trung Nguyªn, kh«ng cã ¸c ı. Hãa gi¶i ph©n tranh míi cho thÊy khİ kh¸i cña ph¸i ta, ta sÏ nãi sai Tr­êng Ca M«n nãi môc ®İch nhËp thÕ cña ph¸i ta, chØ lµ hé thiªn ®Şa chİnh ®¹o, kh«ng ®Ó cho c¸c ph¸i Trung Nguyªn ph¶i hiÓu lÇm.",
			}
	else
		strTalk = {
			"Nghe DiÖp thiÕu hiÖp nãi chİ h­íng cña quı ph¸i lµ hé thiªn ®Şa chİnh ®¹o, trõ yªu ma, rÊt İt hái chuyÖn Trung Nguyªn, b©y giê l¹i ®Õn Trung Nguyªn, cã ph¶i lµ v× chuyÖn nµy?",
			"<sex> nãi ®óng l¾m, tõ khi më nói lËp ph¸i, C«n L«n chuyªn trõ yªu diÖt ma, kü n¨ng tinh t­êng. Yªu ma trèn trong rõng s©u nói hiÓm, ®Ö tö §Ö Tö C«n L«n còng th­êng qua l¹i n¬i nµy, kh«ng ngê Trung Nguyªn Giang T©n th«n th­êng xuyªn cã quû h¹i ng­êi, §Ö Tö C«n L«n lµm sao cã thÓ ®Ó cho gian tµ h¹i d©n? Nªn C«n L«n ph¸i ®Õn Trung Nguyªn. Cã ®iÒu ph¶i ®i vßng qua nói rõng, lµm cho c¸c ph¸i Trung Nguyªn kinh ng¹c, thËm chİ cßn g©y nghi ngê, nÕu cã hiÓu lÇm. Xin h·y l­îng thø.",
			"Th× ra lµ vËy, C«n L«n chuyªn trõ ma, lµ ®Ó b¶o vÖ thiªn ®Şa, n¬i nµo cã tµ ma, n¬i ®ã cã C«n L«n. C¸c ph¸i Trung Nguyªn x­a nay nghi kş víi c¸c ph¸i kh¸c, v× sù an toµn cña Trung Nguyªn, kh«ng cã ¸c ı, thiÕu hiÖp còng ®õng qu¸ lo l¾ng, ta sÏ cho Tr­êng Ca M«n nãi cho c¸c ph¸i biÕt, C«n L«n ph¸i nhËp thÕ ®Ó trõ ma, c¸c ph¸i Trung Nguyªn kh«ng nªn khã xö, mµ nªn hç trî nhau.",
			"§©y còng lµ bæn ı cña ph¸i ta, <sex> nghÜa s©u ®øc dµy, l¹i nh©n nghÜa, ta ®­îc kÕt th©n víi ng­êi b¹n nh­ vËy qu¶ thËt may m¾n. Xin ®a t¹ <sex> gióp ®ì.",
			}
	end

	TalkEx("task_024_03_0_2",strTalk);

end

--Ğø¶Ô»°
function task_024_03_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§©y vèn lµ bæn ı cña ph¸i ta, h·y nãi cho vâ l©m Trung Nguyªn biÕt, tr¸nh ph©n tranh kh«ng cÇn thiÕt còng lµ ®iÒu tèt.",
			"Kh«ng sai, s­ huynh nãi chİ ph¶i. §óng råi, tuy bŞ th­¬ng t¹i Quû M«n Håi Lang §ång M«n kh«ng nÆng, nh­ng n¬i ®ã rÊt nguy hiÓm, nh­ng cã c¸ch cøu ch÷a chø?",
			"DÜ nhiªn lµ cã, C«n L«n Kim §¬n chuyªn trõ Tµ yªu khİ, ta sÏ t×m thuèc cho «ng ta. Ph¶i råi, Oan hån trong B×nh ®ùng hån kh«ng ph¶i lµ Oan hån thùc sù, mµ lµ nh÷ng Du hån v« téi bŞ Yªu tµ lùc khèng chÕ biÕn thµnh. Søc m¹nh cña yªu tµ nµy kh«ng thÓ coi th­êng, cã thÓ biÕn du hån thµnh ¸c quû. §©y lµ C«n L«n tiªn ®¬n, cã thÓ gi¶i tµ, ng­¬i h·y ®­a cho «ng ta vµ nãi cho «ng ta biÕt chuyÖn oan hån, vµ hái nguån gèc cña Yªu tµ lùc råi h·y th­¬ng l­îng.",
			"Kh«ng thµnh vÊn ®Ò, nÕu ®¹i s­ huynh muèn tíi Cæ D­¬ng §éng th× nªn cÈn thËn, n¬i ®ã nguy c¬ trïng trïng.",
			}
	else
		strTalk = {
			"DiÖp thiÕu hiÖp ®· coi ta lµ b¹n th× ®õng nªn kh¸ch s¸o. Th­¬ng tİch cña ®Ö tö Quû M«n Håi Lang tuy kh«ng nÆng, nh­ng n¬i nµy vÉn rÊt nguy hiÓm, cã c¸ch ch÷a trŞ nµo kh«ng?",
			"§­¬ng nhiªn lµ cã. C«n L«n Kim §¬n chuyªn trõ khİ tµ yªu, ta võa t×m ®­îc ®¬n d­îc cho hä ®©y. µ ph¶i, Oan Hån ®­îc thu phôc trong Tiªu Hån T«n kh«ng ph¶i lµ Oan Hån thËt, mµ chØ lµ nh÷ng Du Hån v« téi bŞ chi phèi bëi Gian Tµ chi lùc. Nguån søc m¹nh Gian Tµ nµy kh«ng thÓ xem th­êng, chóng cã thÓ biÕn c¸c Du Hån b×nh th­êng thµnh liÖt quû. C«n L«n Tiªn §¬n nµy cã thÓ gi¶i khİ §Şnh Th©n, ®¸ng ra ta ph¶i ®İch th©n ®Õn ®ã, nh­ng v× cßn ph¶i véi tíi Cæ D­¬ng §éng, nªn ®µnh ph¶i nhê <sex> mét lÇn n÷a. Khi <sex> gÆp hä. Xin h·y nãi râ viÖc Oan Hån kh«ng ph¶i lµ Oan Hån thËt, vµ t×m hiÓu vÒ xuÊt xø cña Gian Tµ chi lùc, råi ta sÏ th¶o luËn sau.",
			"Kh«ng thµnh vÊn ®Ò, DiÖp thiÕu hiÖp nÕu muèn ®Õn Cæ D­¬ng §éng cÇn hÕt søc cÈn thËn, Cæ D­¬ng §éng kh¾p n¬i ®Òu lµ c¹m bÉy.",
			"§a t¹ sù nh¾c nhë cña <sex>, l©u nay ®­îc <sex> gióp ®ì, ta thËt rÊt c¶m kİch.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,3);
	DelItem(2,0,699,1);--É¾È¥Ëø»êé×
	AddItem(2,0,756,1,1);--µÃµ½À¥ÂØÏÉµ¤
	TaskTip("§­a C«n L«n Tiªn §¬n cho c¸c ®Ö tö Quû M«n Håi Lang ®ang bŞ th­¬ng.");
	Msg2Player("§­a C«n L«n Tiªn §¬n cho c¸c ®Ö tö Quû M«n Håi Lang ®ang bŞ th­¬ng.");
	GivePlayerAward("Award_XB_56","Easy");
	GivePlayerExp(SkeyXibei,"jiuren")
end

--Î´½«ÏÉµ¤´ø¸ø¹íÃÅ»ØÀÈ´¦µÄÀ¥ÂØµÜ×Ó
function task_024_03_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§©y lµ C«n L«n Tiªn §¬n, cã thÓ gi¶i khİ §Şnh Th©n, ng­¬i ®em vÒ ®­a cho ®Ö tö Quû M«n Håi Lang bŞ th­¬ng, cho hä biÕt chuyÖn Oan Hån gi¶, ®ång thêi t×m ra ®Çu nguån cña Gian Tµ chi lùc, råi ta sÏ bµn luËn sau.",
			}
	else
		strTalk = {
			"PhiÒn <sex> ®em C«n L«n Tiªn §¬n nµy ®Õn cho ®Ö tö Quû M«n Håi Lang bŞ th­¬ng, ®ång thêi t×m hiÓu vÒ nguån gèc cña Gian Tµ chi lùc.",
			}
	end

	--²¹·¢À¥ÂØÏÉµ¤
	if GetItemCount(2,0,756) < 1 then
		AddItem(2,0,756,1,1);--µÃµ½À¥ÂØÏÉµ¤
		TaskTip("§­a C«n L«n Tiªn §¬n cho c¸c ®Ö tö Quû M«n Håi Lang ®ang bŞ th­¬ng.");
		Msg2Player("§­a C«n L«n Tiªn §¬n cho c¸c ®Ö tö Quû M«n Håi Lang ®ang bŞ th­¬ng.");
	end

	TalkEx("",strTalk);

end

--½«ÏÉµ¤½»¸øÊÜÉËµÄÀ¥ÂØµÜ×Ó
function task_024_04_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Cã ®em Tiªu Hån T«n cho ®¹i s­ huynh ch­a?",
			"Yªn t©m ®i, ta ®· ®­a Tiªu Hån T«n cho ®¹i s­ huynh råi, huynh Êy muèn ta ®em Tiªn §¬n tíi ®Ó trŞ th­¬ng cho c¸c ng­êi, h·y mau dïng ®i.",
			"§­îc, ®a t¹. §¹i s­ huynh xem qua Tiªu Hån T«n cã dÆn dß g× kh«ng?",
			"§¹i s­ huynh nãi, trong Tiªu Hån T«n kh«ng ph¶i lµ Oan Hån thËt, chØ lµ nh÷ng Du Hån bŞ Gian Tµ chi lùc khèng chÕ, ng­¬i cã biÕt n¬i c¸c Oan Hån bŞ phãng thİch ra kh«ng? Cã thÓ ®ã chİnh lµ ®Çu nguån cña søc m¹nh Gian Tµ.",
			}
	else
		strTalk = {
			"<sex> cã ®em Tiªu Hån T«n cho ®¹i s­ huynh kh«ng?",
			"C¸c h¹ yªn t©m, ta ®· ®em Tiªu Hån T«n tíi tay DiÖp thiÕu hiÖp, chİnh thiÕu hiÖp ®· nhê ta ®em C«n L«n Tiªn §¬n ®Õn, cã thÓ gióp c¸c h¹ trŞ th­¬ng, c¸c h¹ h·y dïng ®i.",
			"<sex> thËt tèt bông, ta ®óng lµ c¶m ¬n kh«ng xiÕt. DiÖp s­ huynh sau khi xem Tiªu Hån T«n cã dÆn dß g× kh«ng?",
			"DiÖp thiÕu hiÖp nãi, Oan Hån bŞ niªm phong trong Tiªu Hån T«n kh«ng ph¶i Oan Hån thËt, mµ lµ c¸c Du Hån bŞ khèng chÕ bëi søc m¹nh Gian Tµ, ng­¬i cã ph¸t hiÖn ®­îc n¬i c¸c Oan Hån ®­îc phãng thİch ra kh«ng? Cã thÓ ®ã lµ ®Çu nguån cña søc m¹nh Gian Tµ",
			}
	end

	TalkEx("task_024_04_0_1",strTalk);

end

--Ğø¶Ô»°
function task_024_04_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Nãi vËy, t¹i n¬i tËn cïng cña Quû M«n Håi Lang ®óng lµ cã mét søc m¹nh Gian Tµ ®ang ngµy cµng lín m¹nh, c¸c Oan Hån tõ n¬i ®ã tu«n ra kh«ng ngõng. Søc m¹nh nµy d­êng nh­ cã thÓ khèng chÕ ®­îc c¸c Du Hån, sù t×nh cÊp b¸ch, liªn quan tíi vËn mÖnh cña c¸c th«n trÊn quanh Quû M«n Håi Lang. Giê ta vÉn ch­a håi phôc c«ng lùc, e lµ kh«ng thÓ ®Õn ®­îc ®ã. Vâ c«ng cña ng­¬i cã vÎ còng kh¸, cã thÓ gióp ta ®Õn xem t×nh h×nh thÕ nµo?",
			"Liªn quan tíi vËn mÖnh cña b¸ t¸nh, C«n L«n thÒ quyÕt theo chİnh ®¹o, sao cã thÓ kh«ng ®i ®­îc? Nh­ng kh«ng biÕt ph¶i ®iÒu tra nh­ thÕ nµo?",
			"Gian Tµ chi lùc muèn khèng chÕ c¸c Du Hån, nªn mét khi gÆp ph¶i c¸c hån ma v« téi ¾t sÏ hiÖn th©n. Chç ta cã mét C« Hån T«n, trong ®ã toµn lµ nh÷ng c« hån d· quû, ng­¬i cã thÓ mang theo vËt nµy ®Õn n¬i phãng thİch c« hån trong Quû M«n Håi Lang ®Ó dô søc m¹nh nµy xuÊt hiÖn, ®Ó xem thùc h­ thÕ nµo. Ph¶i hÕt søc thËn träng, tèt nhÊt lµ nªn tíi ®ã cïng víi vµi b»ng h÷u ®ång m«n. Nguån søc m¹nh nµy kh«ng thÓ xem th­êng, chØ riªng viÖc biÕn c¸c C« hån b×nh th­êng thµnh LiÖt quû víi søc m¹nh ghª gím còng ®ñ biÕt uy lùc to lín cña nã.",
			"Ta hiÓu råi, t¹m thêi ng­¬i cø an t©m tu d­ìng, ta sÏ thËn träng øng phã, viÖc nµy cø giao cho ta lµ ®­îc.",
			}
	else
		strTalk = {
			"Nãi vËy, t¹i n¬i tËn cïng cña Quû M«n Håi Lang ®óng lµ cã mét søc m¹nh Gian Tµ ®ang ngµy cµng lín m¹nh, c¸c Oan Hån tõ n¬i ®ã tu«n ra kh«ng ngõng. Søc m¹nh nµy d­êng nh­ cã thÓ khèng chÕ ®­îc c¸c Du Hån, sù t×nh cÊp b¸ch, liªn quan tíi vËn mÖnh cña c¸c th«n trÊn quanh Quû M«n Håi Lang. Giê ta vÉn ch­a håi phôc c«ng lùc, e lµ kh«ng thÓ ®Õn ®­îc ®ã. Vâ c«ng cña ng­¬i cã vÎ còng kh¸, cã thÓ gióp ta ®Õn xem t×nh h×nh thÕ nµo?",
			"Liªn quan tíi vËn mÖnh cña b¸ t¸nh, C«n L«n thÒ quyÕt theo chİnh ®¹o, ®­¬ng nhiªn ph¶i gióp ®ì hÕt m×nh. Nh­ng kh«ng biÕt ph¶i ®iÒu tra nh­ thÕ nµo?",
			"Gian Tµ chi lùc muèn khèng chÕ c¸c Du Hån, nªn mét khi gÆp ph¶i c¸c hån ma v« téi ¾t sÏ hiÖn th©n. Chç ta cã mét C« Hån T«n, trong ®ã toµn lµ nh÷ng c« hån d· quû, ng­¬i cã thÓ mang theo vËt nµy ®Õn n¬i phãng thİch c« hån trong Quû M«n Håi Lang ®Ó dô søc m¹nh nµy xuÊt hiÖn, ®Ó xem thùc h­ thÕ nµo. Ph¶i hÕt søc thËn träng, tèt nhÊt lµ nªn tíi ®ã cïng víi vµi b»ng h÷u ®ång m«n. Nguån søc m¹nh nµy kh«ng thÓ xem th­êng, chØ riªng viÖc biÕn c¸c C« hån b×nh th­êng thµnh LiÖt quû víi søc m¹nh ghª gím còng ®ñ biÕt uy lùc to lín cña nã.",
			"Ra lµ vËy, t¹m thêi ng­¬i cø an t©m tu d­ìng, ta sÏ thËn träng øng phã, viÖc nµy cø giao cho ta lµ ®­îc.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,4);
	AddItem(2,0,757,1,1);--¹Â»êé×
	DelItem(2,0,756,1);--É¾È¥À¥ÂØÏÉµ¤
	TaskTip("Sö dông C« Hån T«n dÉn dô O¸n Hån Chi V­¬ng xuÊt hiÖn vµ tiªu diÖt chóng.");
	Msg2Player("Sö dông C« Hån T«n dÉn dô O¸n Hån Chi V­¬ng xuÊt hiÖn vµ tiªu diÖt chóng.");

end

--Î´ÏûÃğÔ¹»êÖ®ÍõÓëÊÜÉËµÄµÜ×Ó¶Ô»°
function task_024_04_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Gian Tµ chi lùc muèn khèng chÕ c¸c Du Hån, nªn mét khi gÆp ph¶i c¸c hån ma v« téi ¾t sÏ hiÖn th©n. Chç ta cã mét C« Hån T«n, trong ®ã toµn lµ nh÷ng c« hån d· quû, ng­¬i cã thÓ mang theo vËt nµy ®Õn n¬i phãng thİch c« hån trong Quû M«n Håi Lang ®Ó dô søc m¹nh nµy xuÊt hiÖn, ®Ó xem thùc h­ thÕ nµo. Ph¶i hÕt søc thËn träng, tèt nhÊt lµ nªn tíi ®ã cïng víi vµi b»ng h÷u ®ång m«n. Nguån søc m¹nh nµy kh«ng thÓ xem th­êng, chØ riªng viÖc biÕn c¸c C« hån b×nh th­êng thµnh LiÖt quû víi søc m¹nh ghª gím còng ®ñ biÕt uy lùc to lín cña nã.",
			}
	else
		strTalk = {
			"Gian Tµ chi lùc muèn khèng chÕ c¸c Du Hån, nªn mét khi gÆp ph¶i c¸c hån ma v« téi ¾t sÏ hiÖn th©n. Chç ta cã mét C« Hån T«n, trong ®ã toµn lµ nh÷ng c« hån d· quû, ng­¬i cã thÓ mang theo vËt nµy ®Õn n¬i phãng thİch c« hån trong Quû M«n Håi Lang ®Ó dô søc m¹nh nµy xuÊt hiÖn, ®Ó xem thùc h­ thÕ nµo. Ph¶i hÕt søc thËn träng, tèt nhÊt lµ nªn tíi ®ã cïng víi vµi b»ng h÷u ®ång m«n. Nguån søc m¹nh nµy kh«ng thÓ xem th­êng, chØ riªng viÖc biÕn c¸c C« hån b×nh th­êng thµnh LiÖt quû víi søc m¹nh ghª gím còng ®ñ biÕt uy lùc to lín cña nã.",
			}
	end

	TalkEx("",strTalk);

	--²¹·¢¹Â»êé×
	if GetItemCount(2,0,757) < 1 then
		AddItem(2,0,757,1,1);--¹Â»êé×
		TaskTip("Sö dông C« Hån T«n dÉn dô O¸n Hån Chi V­¬ng xuÊt hiÖn vµ tiªu diÖt chóng.");
		Msg2Player("Sö dông C« Hån T«n dÉn dô O¸n Hån Chi V­¬ng xuÊt hiÖn vµ tiªu diÖt chóng.");
	end

end

--ÏûÃğÔ¹»êÖ®ÍõºÍÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°
function task_024_05_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Cã thu ho¹ch ®­îc g× kh«ng? Cã t×m ra ®Çu nguån søc m¹nh ®ang khèng chÕ c¸c Du Hån ch­a?",
			"T¹i n¬i tËn cïng cña Quû M«n Håi Lang, ta ®· gäi ®­îc Oan Hån Chi V­¬ng xuÊt hiÖn, h¾n rÊt m¹nh, còng may cã b»ng h÷u t­¬ng trî, khi hån phi ph¸ch t¸n nã cã ®Ó l¹i mét ®¹o phï nµy, ta kh«ng biÕt nã lµ vËt g×, ng­¬i xem thö ®i.",
			"ña, sao vËt nµy tr«ng gièng TrÊn Ma Phï cña ph¸i ta vËy, nh­ng l¹i kh«ng hoµn toµn lµ TrÊn Ma Phï, d­êng nh­ nã ®· bŞ ¸m c©u Tµ chó qu¸i dŞ mµ nhÊt thêi ta còng kh«ng thÓ ph©n biÖt râ ®­îc. Cã lÏ ®¹i s­ huynh sÏ biÕt c©u tr¶ lêi.",
			"NÕu lµ ®¹o phï cña C«n L«n, ch¾c lµ ®¹i s­ huynh sÏ nhËn ra, nh­ng kÎ nµo trong ph¸i C«n L«n ®· ®iÒu khiÓn Oan Hån V­¬ng?",
			"ViÖc nµy ta còng kh«ng râ, ch¾c lµ cã uÈn khóc g× ®©y. Giê th­¬ng tİch cña ta ®· lµnh h¼n, cã thÓ hµnh ®éng ®­îc råi. Ng­¬i h·y ®em ®¹o phï nµy giao cho ®¹i s­ huynh, vµ b¸o víi huynh Êy ta sÏ tiÕp tôc ®iÒu tra vô nµy, vµi ngµy n÷a sÏ trë vÒ C«n L«n.",
			"Ta hiÓu. N¬i nµy rÊt nguy hiÓm, ng­¬i ph¶i thËn träng kÎo bŞ c¸c Oan Hån ®¶ th­¬ng.",
			}
	else
		strTalk = {
			"<sex> cã thu ho¹ch ®­îc g× kh«ng? Cã t×m ®­îc ®Çu nguån søc m¹nh khèng chÕ c¸c Du Hån ch­a?",
			"T¹i n¬i tËn cïng cña Quû M«n Håi Lang, ta ®· gäi ®­îc Oan Hån Chi V­¬ng xuÊt hiÖn, h¾n rÊt m¹nh, còng may cã b»ng h÷u t­¬ng trî, khi hån phi ph¸ch t¸n nã cã ®Ó l¹i mét ®¹o phï nµy, ta kh«ng biÕt nã lµ vËt g×, ng­¬i xem thö ®i.",
			"<sex> kh«ng nh÷ng cã tÊm lßng hiÖp nghÜa, cßn cã vâ c«ng cao siªu, ta rÊt kh©m phôc. ña, sao vËt nµy tr«ng gièng TrÊn Ma Phï cña ph¸i ta vËy, nh­ng l¹i kh«ng hoµn toµn lµ TrÊn Ma Phï, d­êng nh­ nã ®· bŞ ¸m c©u Tµ chó qu¸i dŞ, ta hiÓu biÕt n«ng c¹n, nh­ng cã lÏ ®¹i s­ huynh sÏ cã c©u tr¶ lêi.",
			"NÕu lµ ®¹o phï cña C«n L«n, ch¾c lµ DiÖp thiÕu hiÖp sÏ nhËn ra, nh­ng kÎ nµo trong ph¸i C«n L«n ®· ®iÒu khiÓn Oan Hån V­¬ng?",
			"ViÖc nµy ta còng kh«ng râ, ch¾c lµ cã uÈn khóc g× ®©y. Giê th­¬ng tİch cña ta ®· lµnh h¼n, cã thÓ hµnh ®éng ®­îc råi. <sex> cã thÓ ®em ®¹o phï nµy giao cho DiÖp s­ huynh, vµ b¸o víi huynh Êy ta sÏ tiÕp tôc ë l¹i ®iÒu tra vô nµy, vµi ngµy n÷a míi trë vÒ C«n L«n. Lµm phiÒn <sex>.",
			"§õng kh¸ch s¸o, chuyÖn nhá th«i mµ. N¬i nµy rÊt nguy hiÓm, ng­¬i ph¶i thËn träng kÎo bŞ c¸c Oan Hån ®¶ th­¬ng.",
			}
	end

	SetTask(TASK_XB_ID_02,6);
	TalkEx("",strTalk);
	TaskTip("§­a ®¹o phï cã ®­îc sau khi giÕt chÕt O¸n Hån Chi V­¬ng cho DiÖp Tö Thu ph¸i C«n L«n, ®ång thêi b¸o c¸o vÒ chuyÖn O¸n Hån Chi V­¬ng.");
	Msg2Player("§­a ®¹o phï cã ®­îc sau khi giÕt chÕt O¸n Hån Chi V­¬ng cho DiÖp Tö Thu ph¸i C«n L«n, ®ång thêi b¸o c¸o vÒ chuyÖn O¸n Hån Chi V­¬ng.");
	GivePlayerAward("Award_XB_57","Easy");
	GivePlayerExp(SkeyXibei,"fuming")
end

--»¹Î´¸æËßÒ¶×ÓÇïÔ¹»êÖ®ÍõÒ»ÊÂ
function task_024_05_1()

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i ®­a ®¹o phï nµy vÒ cho ®¹i s­ huynh, ®ång thêi nãi l¹i víi huynh Êy ta sÏ tiÕp tôc ë l¹i ®©y ®iÒu tra, vµi ngµy n÷a míi trë vÒ.",
			}
	else
		strTalk = {
			"<sex> h·y ®­a gióp ®¹o phï nµy ®Õn tay DiÖp s­ huynh, vµ nãi víi huynh Êy, ta sÏ tiÕp tôc ë l¹i ®©y ®iÒu tra, vµi ngµy n÷a míi vÒ C«n L«n. Xin c¶m ¬n <sex>.",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø25·ÖÖ§2_2ÃØ¾³÷¼÷Ã----------------------------------
--¸æËßÒ¶×ÓÇïÔ¹»êÖ®ÍõÒ»ÊÂ
function task_025_01_0()

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§¹i s­ huynh, ®Ö võa trë vÒ tõ Quû M«n Håi Lang, th­¬ng tİch cña ®Ö tö C«n L«n ®· lµnh h¼n, h¾n nãi ph¶i ë l¹i tiÕp tôc ®iÒu tra vÒ t×nh h×nh cña Quû M«n Håi Lang, sau ®ã míi trë vÒ C«n L«n. §Çu nguån cña Gian Tµ chi lùc lµ do dŞ biÕn cña Oan Hån Chi V­¬ng ë n¬i tËn cïng cña Quû M«n Håi Lang, khã kh¨n l¾m ®Ö míi ®¸nh b¹i ®­îc h¾n vµ ph¸t hiÖn ®¹o phï nµy, ®¹i s­ huynh cã biÕt vËt nµy cã t¸c dông g× kh«ng?",
			"§Ö tö Quû M«n Håi Lang ®­îc b×nh yªn lµ ta yªn t©m råi. §¹o phï nµy tr«ng gièng vËt cña ph¸i ta, rÊt gièng TrÊn Ma Phï nh­ng d­êng nh­ ph¸p lùc cña nã cßn m¹nh h¬n c¶ TrÊn Ma Phï. Cßn nhí khi Phi Th­êng §¹o Nh©n cßn ë trong m«n ph¸i, ngãn së tr­êng chİnh lµ TrÊn Ma Phï, nh­ng sao TrÊn Ma Phï l¹i cã thÓ ®iÒu khiÓn ®­îc ma qu¸i? Ch¼ng lÏ Phi Th­êng §¹o Nh©n ®· t¨ng ph¸p lùc cho ®¹o phï nµy?",
			"Phi Th­êng §¹o Nh©n lµ ai? D­êng nh­ ch­a tõng nghe nãi ®Õn ng­êi nµy.",
			"Khôc khôc, ng­êi nµy kÓ ra còng dµi dßng l¾m. Phi Th­êng §¹o Nh©n vèn lµ s­ b¸ cña ta, 20 n¨m tr­íc do s­ c«ng truyÒn ng«i vŞ ch­ëng m«n cho s­ phô ta nªn ®· rêi khái C«n L«n, ®Õn nay vÉn kh«ng cam lßng, kh«ng ngõng lªn kÕ ho¹ch ph¶n c«ng C«n L«n t¹i Cæ D­¬ng §éng, hßng ®o¹t l¹i ng«i vŞ ch­ëng m«n. C«n L«n coi träng viÖc tu t©m d­ìng t¸nh, sao cã thÓ dung tóng lßng tham quyÒn lùc nh­ thÕ. Vèn s­ phô ta còng niÖm t×nh ®ång m«n mµ bá qua, nh­ng theo t×nh b¸o, Phi Th­êng §¹o Nh©n kh«ng nh÷ng cã ı ®å thu phôc Cæ D­¬ng Thó, cßn qua l¹i víi T©y H¹, nh÷ng hµnh ®éng ph¶n ®¹o m·i quèc nh­ thÕ sao cã thÓ tha ®­îc? V× thÕ s­ phô ®· ph¸i ta ®Õn Cæ D­¬ng §éng thanh lı m«n hé.",
			}
	else
		strTalk = {
			"DiÖp thiÕu hiÖp, ta võa trë vÒ tõ Quû M«n Håi Lang, th­¬ng tİch cña ®Ö tö C«n L«n ®· lµnh h¼n, h¾n nãi ph¶i ë l¹i tiÕp tôc ®iÒu tra vÒ t×nh h×nh cña Quû M«n Håi Lang, sau ®ã míi trë vÒ C«n L«n. §Çu nguån cña Gian Tµ chi lùc lµ do dŞ biÕn cña Oan Hån Chi V­¬ng ë n¬i tËn cïng cña Quû M«n Håi Lang, khã kh¨n l¾m ta míi ®¸nh b¹i ®­îc h¾n vµ ph¸t hiÖn ®¹o phï nµy, DiÖp thiÕu hiÖp cã biÕt vËt nµy cã t¸c dông g× kh«ng?",
			"§Ö tö Quû M«n Håi Lang ®­îc b×nh yªn lµ ta yªn t©m råi. §¹o phï nµy tr«ng gièng vËt cña ph¸i ta, rÊt gièng TrÊn Ma Phï nh­ng d­êng nh­ ph¸p lùc cña nã cßn m¹nh h¬n c¶ TrÊn Ma Phï. Cßn nhí khi Phi Th­êng §¹o Nh©n cßn ë trong m«n ph¸i, ngãn së tr­êng chİnh lµ TrÊn Ma Phï, nh­ng sao TrÊn Ma Phï l¹i cã thÓ ®iÒu khiÓn ®­îc ma qu¸i? Ch¼ng lÏ Phi Th­êng §¹o Nh©n ®· t¨ng ph¸p lùc cho ®¹o phï nµy?",
			"Phi Th­êng §¹o Nh©n lµ ai? Còng lµ ng­êi cña ph¸i C«n L«n sao?",
			"Khôc khôc, ®©y lµ ®iÒu hæ thÑn trong m«n ph¸i. ThÊy lµ <sex> ta còng kh«ng ng¹i nãi th¼ng. Phi Th­êng §¹o Nh©n vèn lµ s­ b¸ cña ta, 20 n¨m tr­íc do s­ c«ng truyÒn ng«i vŞ ch­ëng m«n cho s­ phô ta nªn ®· rêi khái C«n L«n, ®Õn nay vÉn kh«ng cam lßng, kh«ng ngõng lªn kÕ ho¹ch ph¶n c«ng C«n L«n t¹i Cæ D­¬ng §éng, hßng ®o¹t l¹i ng«i vŞ ch­ëng m«n. C«n L«n coi träng viÖc tu t©m d­ìng t¸nh, sao cã thÓ dung tóng lßng tham quyÒn lùc nh­ thÕ. Vèn s­ phô ta còng niÖm t×nh ®ång m«n mµ bá qua, nh­ng theo t×nh b¸o, Phi Th­êng §¹o Nh©n kh«ng nh÷ng cã ı ®å thu phôc Cæ D­¬ng Thó, cßn qua l¹i víi T©y H¹, nh÷ng hµnh ®éng ph¶n ®¹o m·i quèc nh­ thÕ sao cã thÓ tha ®­îc? V× thÕ s­ phô ®· ph¸i ta ®Õn Cæ D­¬ng §éng thanh lı m«n hé. ",
			}
	end

	TalkEx("task_025_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_025_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ra lµ vËy. Phi Th­êng §¹o Nh©n khèng chÕ c¸c ma vËt nµy còng lµ v× muèn tÊn c«ng ph¸i ta ­?",
			"ViÖc nµy còng kh«ng thÓ nãi râ ®­îc. MÊy ngµy nay ta ë Cæ D­¬ng §éng kh«ng thÊy t«ng tİch cña Phi Th­êng §¹o Nh©n, ch¾c lµ ®ang lÈn trèn ®©u ®ã thu phôc Cæ D­¬ng Thó råi. Xem ra ta ph¶i tíi ®ã lÇn n÷a, lÇn b»ng ®­îc t«ng tİch cña Phi Th­êng §¹o Nh©n.",
			"Nghe ®ån Cæ D­¬ng Thó uy lùc v« song, sao cã thÓ dÔ dµng bŞ thu phôc? NÕu Cæ D­¬ng Thó xuÊt hiÖn, ch¼ng thµnh ra thiªn h¹ ®¹i lo¹n?",
			"Phi Th­êng §¹o Nh©n ®· mai phôc ë Cæ D­¬ng §éng suèt 20 n¨m, nÕu nghiÖm ra ®­îc c¸ch thu phôc th× còng kh«ng lÊy lµm l¹. C«ng dông cña ®¹o phï nµy chİnh lµ nh­ thÕ, nh­ng cã thÓ do ph¸p lùc ch­a ®ñ m¹nh ®Ó thu phôc ®­îc Cæ D­¬ng Thó, nªn míi dïng cho nh÷ng ma vËt yÕu h¬n. µ ph¶i, ë Thiªn S­ MËt C¶nh còng cã nh÷ng dŞ th­êng gièng nh­ vËy, ®Ö tö ph¸i ta ®· ®Õn ®ã nhiÒu ngµy, nh­ng ch­a cã tin b¸o vÒ. Ng­¬i cã thÓ ®Õn Thiªn S­ MËt C¶nh t×m hä ®Ó n¾m râ sù t×nh, cßn ta ph¶i tíi Cæ D­¬ng §éng ®èi phã víi Phi Th­êng §¹o Nh©n.",
			"Trõ ma vÖ ®¹o quyÕt kh«ng tõ nan, chuyÖn ®Õn Thiªn S­ MËt C¶nh cø giao cho ta, DiÖp thiÕu hiÖp h·y yªn t©m lµm c«ng viÖc thanh lı m«n hé.",
			}
	else
		strTalk = {
			"Ra lµ vËy. Phi Th­êng §¹o Nh©n khèng chÕ c¸c ma vËt nµy còng lµ v× muèn tÊn c«ng ph¸i ta ­?",
			"ViÖc nµy còng kh«ng thÓ nãi râ ®­îc. MÊy ngµy nay ta ë Cæ D­¬ng §éng kh«ng thÊy t«ng tİch cña Phi Th­êng §¹o Nh©n, ch¾c lµ ®ang lÈn trèn ®©u ®ã thu phôc Cæ D­¬ng Thó råi. Xem ra ta ph¶i tíi ®ã lÇn n÷a, lÇn b»ng ®­îc t«ng tİch cña Phi Th­êng §¹o Nh©n.",
			"Nghe ®ån Cæ D­¬ng Thó uy lùc v« song, sao cã thÓ dÔ dµng bŞ thu phôc? NÕu Cæ D­¬ng Thó xuÊt hiÖn, ch¼ng thµnh ra thiªn h¹ ®¹i lo¹n?",
			"Phi Th­êng §¹o Nh©n ®· mai phôc ë Cæ D­¬ng §éng suèt 20 n¨m, nÕu nghiÖm ra ®­îc c¸ch thu phôc th× còng kh«ng lÊy lµm l¹. C«ng dông cña ®¹o phï nµy chİnh lµ nh­ thÕ, nh­ng cã thÓ do ph¸p lùc ch­a ®ñ m¹nh ®Ó thu phôc ®­îc Cæ D­¬ng Thó, nªn míi dïng cho nh÷ng ma vËt yÕu h¬n. µ ph¶i, ë Thiªn S­ MËt C¶nh còng cã nh÷ng dŞ th­êng gièng nh­ vËy, ®Ö tö ph¸i ta ®· ®Õn ®ã nhiÒu ngµy, nh­ng ch­a cã tin b¸o vÒ. <sex> cã thÓ gióp ta thªm mét lÇn, ®Õn Thiªn S­ MËt C¶nh t×m hä ®Ó n¾m râ sù t×nh, cßn ta ph¶i tíi Cæ D­¬ng §éng ®èi phã víi Phi Th­êng §¹o Nh©n.",
			"Trõ ma vÖ ®¹o quyÕt kh«ng tõ nan, chuyÖn ®Õn Thiªn S­ MËt C¶nh cø giao cho ta, DiÖp thiÕu hiÖp h·y yªn t©m lµm c«ng viÖc thanh lı m«n hé.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,7);
	DelItem(2,0,717,1);--É¾È¥·Ç³£µÀ·û
	TaskTip("NhËn ñy th¸c cña DiÖp Tö Thu, lªn ®­êng ®Õn Thiªn S­ MËt C¶nh t×m kiÕm ®Ö tö C«n L«n bŞ mÊt liªn l¹c.");
	Msg2Player("NhËn ñy th¸c cña DiÖp Tö Thu, lªn ®­êng ®Õn Thiªn S­ MËt C¶nh t×m kiÕm ®Ö tö C«n L«n bŞ mÊt liªn l¹c.");

end

--»¹Î´ÓëÌìÊ¦ÃØ¾³ÖĞÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°
function task_025_01_1()

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"ë Thiªn S­ MËt C¶nh còng cã nh÷ng dÊu hiÖu cña Gian Tµ chi lùc, ®Ö tö ph¸i ta ®· ®Õn ®ã nh­ng ch­a thÊy tin b¸o vÒ. Ng­¬i cã thÓ ®Õn Thiªn S­ MËt C¶nh t×m hä ®Ó n¾m râ sù t×nh, cßn ta ph¶i tíi Cæ D­¬ng §éng ®èi phã víi Phi Th­êng §¹o Nh©n.",
			}
	else
		strTalk = {
			"ë Thiªn S­ MËt C¶nh còng cã nh÷ng dÊu hiÖu cña Gian Tµ chi lùc, ®Ö tö ph¸i ta ®· ®Õn ®ã nh­ng ch­a thÊy tin b¸o vÒ. <sex> cã thÓ gióp ta ®Õn Thiªn S­ MËt C¶nh t×m hä ®Ó n¾m râ sù t×nh, cßn ta ph¶i tíi Cæ D­¬ng §éng ®èi phã víi Phi Th­êng §¹o Nh©n.",
			}
	end

	TalkEx("",strTalk);

end

--ÓëÌìÊ¦ÃØ¾³ÖĞÊÜÉËµÄÀ¥ÂØµÜ×Ó¶Ô»°»ñµÃ½â·âµÄÖäÓï
function task_025_02_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"S­ huynh ph¶i ch¨ng ®Õn ®©y ®Ó ®iÒu tra vÒ dŞ th­êng cña Thiªn S­ MËt C¶nh? §¹i s­ huynh ph¸i ta ®Õn t×m hiÓu t×nh h×nh cã tiÕn triÓn g× kh«ng?",
			"S­ ®Ö ®Õn thËt ®óng lóc. Xin h·y chuyÓn lêi lµ ta ®· ph¸t hiÖn Thiªn S­ MËt C¶nh cã nguån Gian Tµ chi lùc ®ang t¸c qu¸i, khiÕn C« L©u V­¬ng cã dÊu hiÖu thøc tØnh sau tr¹ng th¸i ngñ mª. Ta bŞ h¾n ®¶ th­¬ng, hao tèn tÊt c¶ ph¸p lùc míi miÔn c­ìng phong Ên ®­îc h¾n, nh­ng l¹i kh«ng cßn søc lùc ®Ó tiªu diÖt. NÕu C« L©u V­¬ng l¹i thøc tØnh lÇn n÷a, e sÏ nguy h¹i nh©n gian.",
			"ë ®©y còng cã nguån Gian Tµ chi lùc lµm C« L©u V­¬ng thøc tØnh ­? Sao l¹i trïng hîp víi sù viÖc cña Oan Hån V­¬ng vËy?",
			"ı ng­¬i lµ Oan Hån Chi V­¬ng ë Quû M«n Håi Lang ®ã sao? NÕu Oan Hån Chi V­¬ng vµ C« L©u V­¬ng cïng lóc hiÖn thÕ th× kh«ng ph¶i lµ ®iÒm lµnh. Oan Hån V­¬ng cã bŞ tiªu diÖt ch­a?",
			"Oan Hån V­¬ng ®· bŞ ta tiªu diÖt, xem ra C« L©u V­¬ng còng kh«ng ®­îc phĞp tån t¹i n÷a råi, kh«ng biÕt cã c¸ch nµo tiªu diÖt C« L©u V­¬ng kh«ng? H·y ®Ó ta gióp s­ huynh tiªu diÖt nã vËy.",
			}
	else
		strTalk = {
			"Ph¶i ch¨ng ng­¬i chİnh lµ ng­êi cña ph¸i C«n L«n ®Õn ®iÒu tra vÒ dŞ th­êng cña Thiªn S­ MËt C¶nh? DiÖp Tö Thu ph¸i ta ®Õn t×m hiÓu t×nh h×nh cã tiÕn triÓn g× kh«ng?",
			"Ra <sex> quen biÕt DiÖp s­ huynh. Xin h·y chuyÓn lêi lµ ta ®· ph¸t hiÖn Thiªn S­ MËt C¶nh cã nguån Gian Tµ chi lùc ®ang t¸c qu¸i, khiÕn C« L©u V­¬ng cã dÊu hiÖu thøc tØnh sau tr¹ng th¸i ngñ mª. Ta bŞ h¾n ®¶ th­¬ng, hao tèn tÊt c¶ ph¸p lùc míi miÔn c­ìng phong Ên ®­îc h¾n, nh­ng l¹i kh«ng cßn søc lùc ®Ó tiªu diÖt. NÕu C« L©u V­¬ng l¹i thøc tØnh lÇn n÷a, e sÏ nguy h¹i nh©n gian.",
			"ë ®©y còng cã nguån Gian Tµ chi lùc lµm C« L©u V­¬ng thøc tØnh ­? Sao l¹i trïng hîp víi sù viÖc cña Oan Hån V­¬ng vËy?",
			"<sex> ®ang nãi tíi Oan Hån Chi V­¬ng trong Quû M«n Håi Lang ph¶i kh«ng? NÕu Oan Hån Chi V­¬ng vµ C« L©u V­¬ng cïng lóc hiÖn thÕ th× kh«ng ph¶i lµ ®iÒm lµnh. Oan Hån V­¬ng cã bŞ tiªu diÖt ch­a?",
			"Oan Hån V­¬ng ®· bŞ ta tiªu diÖt, xem ra C« L©u V­¬ng còng kh«ng ®­îc phĞp tån t¹i n÷a råi, kh«ng biÕt cã c¸ch nµo tiªu diÖt C« L©u V­¬ng kh«ng? H·y ®Ó ta gióp s­ huynh tiªu diÖt nã vËy.",
			}
	end

	TalkEx("task_025_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_025_02_0_1()

local strTalk = {}
local nCruseIndex = random(1,getn(KULOUWANG_CURSE));

	SetTask(KULOUWANG_CURSE_ID,nCruseIndex);

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C« L©u V­¬ng ®ang bŞ ta phong Ên t¹i n¬i tËn cïng cña Thiªn S­ MËt C¶nh, nÕu muèn tiªu diÖt th× ph¶i nh©n lóc nµy. Ng­¬i cã thÓ dïng c©u Tµ chó nµy ®Ó gi¶i phong Ên, sau ®ã cïng Tr¶m Yªu Phï tiªu diÖt h¾n. Chí dïng sai Tµ chó, v× nÕu dïng sai Tµ chó trong lóc gi¶i phong Ên, C« L©u V­¬ng sÏ tho¸t ra, mét khi h¾n phôc håi ph¸p lùc sÏ rÊt khã ®èi phã.",
			"Xin hái s­ huynh c©u Tµ chó lµ g×?",
			"Ng­¬i ph¶i nhí cho kü Tµ chó lµ "..KULOUWANG_CURSE[nCruseIndex]..", nÕu ®äc sai th× phong Ên sÏ kh«ng gi¶i trõ ®­îc ®©u.",
			"HiÓu råi, ta sÏ cÈn thËn. S­ huynh cø yªn t©m d­ìng th­¬ng.",
			}
	else
		strTalk = {
			"C« L©u V­¬ng ®ang bŞ ta phong Ên t¹i n¬i tËn cïng cña Thiªn S­ MËt C¶nh, nÕu muèn tiªu diÖt th× ph¶i nh©n lóc nµy. Tuy <sex> kh«ng ph¶i ng­êi cña ph¸i C«n L«n ta, nh­ng l¹i cã tÊm lßng phôc ma hiÖp nghÜa, ta xin ®a t¹ <sex>. Phong Ên cã thÓ dïng c©u Tµ chó ®Ó gi¶i trõ, sau ®ã cïng Tr¶m Yªu Phï tiªu diÖt h¾n. Chí dïng sai Tµ chó, v× nÕu dïng sai Tµ chó trong lóc gi¶i phong Ên, C« L©u V­¬ng sÏ tho¸t ra, mét khi h¾n phôc håi ph¸p lùc sÏ rÊt khã ®èi phã.",
			"Xin hái c¸c h¹ c©u Tµ chó lµ g×?",
			"Ng­¬i ph¶i nhí cho kü Tµ chó lµ "..KULOUWANG_CURSE[nCruseIndex]..", nÕu ®äc sai th× phong Ên sÏ kh«ng gi¶i trõ ®­îc ®©u.",
			"HiÓu råi, ta sÏ cÈn thËn. Xin cø yªn t©m d­ìng th­¬ng.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,758,1,1);--Õ¶Ñı·û
	SetTask(TASK_XB_ID_02,8);
	TaskTip("NhËn ñy th¸c cña ®Ö tö C«n L«n, lªn ®­êng ®i ®Õn n¬i C« L©u V­¬ng bŞ phong Ên ®Ó tiªu diÖt h¾n.");
	Msg2Player("NhËn ñy th¸c cña ®Ö tö C«n L«n, lªn ®­êng ®i ®Õn n¬i C« L©u V­¬ng bŞ phong Ên ®Ó tiªu diÖt h¾n.");

end

--ÉĞÎ´ÏûÃğ÷¼÷ÃÍõ
function task_025_02_1()

local nCruseIndex = GetTask(KULOUWANG_CURSE_ID);
local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"C« L©u V­¬ng ®· bŞ ta phong Ên t¹i n¬i tËn cïng cña Thiªn S­ MËt C¶nh, cã thÓ dïng c©u Tµ chó lÇn tr­íc ta ®· truyÒn thô ®Ó gi¶i trõ, sau dïng Tr¶m Yªu Ph× ®Ó tiªu diÖt. Chí dïng sai Tµ chó, v× nÕu dïng sai Tµ chó trong lóc gi¶i phong Ên, C« L©u V­¬ng sÏ tho¸t ra, mét khi h¾n phôc håi ph¸p lùc sÏ rÊt khã ®èi phã.",
			"H·y nhí c©u Tµ chó gi¶i trõ phong Ên lµ "..KULOUWANG_CURSE[nCruseIndex]..", nÕu ®äc sai th× phong Ên sÏ kh«ng gi¶i trõ ®­îc ®©u.",
			}
	else
		strTalk = {
			"C« L©u V­¬ng ®· bŞ ta phong Ên t¹i n¬i tËn cïng cña Thiªn S­ MËt C¶nh, cã thÓ dïng c©u Tµ chó lÇn tr­íc ta ®· truyÒn thô ®Ó gi¶i trõ, sau dïng Tr¶m Yªu Ph× ®Ó tiªu diÖt. Chí dïng sai Tµ chó, v× nÕu dïng sai Tµ chó trong lóc gi¶i phong Ên, C« L©u V­¬ng sÏ tho¸t ra, mét khi h¾n phôc håi ph¸p lùc sÏ rÊt khã ®èi phã.",
			"H·y nhí c©u Tµ chó gi¶i trõ phong Ên lµ "..KULOUWANG_CURSE[nCruseIndex]..", nÕu ®äc sai th× phong Ên sÏ kh«ng gi¶i trõ ®­îc ®©u.",
			}
	end

	TalkEx("",strTalk);

	--²¹·¢Õ¶Ñı·û
	if GetItemCount(2,0,758) < 1 then
		AddItem(2,0,758,1,1);--Õ¶Ñı·û
		TaskTip("NhËn ñy th¸c cña ®Ö tö C«n L«n, lªn ®­êng ®i ®Õn n¬i C« L©u V­¬ng bŞ phong Ên ®Ó tiªu diÖt h¾n.");
		Msg2Player("NhËn ñy th¸c cña ®Ö tö C«n L«n, lªn ®­êng ®i ®Õn n¬i C« L©u V­¬ng bŞ phong Ên ®Ó tiªu diÖt h¾n.");
	end

end

--³É¹¦ÏûÃğ÷¼÷ÃÍõÓëÀ¥ÂØµÜ×Ó¶Ô»°
function task_025_03_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i cã tiªu diÖt ®­îc C« L©u V­¬ng ch­a? Cã bŞ th­¬ng kh«ng?",
			"Nhê bŞ phong Ên, uy lùc cña C« L©u V­¬ng bŞ gi¶m ®i rÊt nhiÒu, nªn ta kh«ng bŞ th­¬ng g×. Khi bŞ tiªu diÖt còng gièng nh­ lóc ta diÖt trõ Oan Hån V­¬ng, ®Òu ®Ó l¹i ®¹o phï nµy, søc m¹nh cña C« L©u V­¬ng vµ Oan Hån V­¬ng ®Òu ®Õn tõ cïng mét nguån, xem ra lµ cïng mét thñ ph¹m.",
			"Hãa ra chuyÖn ë Quû M«n Håi Lang còng cã liªn quan, e lµ viÖc thøc tØnh cña C« L©u V­¬ng lµ ®iÒu bÊt th­êng. C« L©u V­¬ng tuy ®· bŞ diÖt, nh­ng nÕu vÉn cßn c¸c yªu vËt kh¸c th× kh«ng hay chót nµo. §Ó ®Ò phßng bÊt tr¾c, cã lÏ ta sÏ ë l¹i ®©y tiÕp tôc ®iÒu tra, cßn ng­¬i trë vÒ b¸o víi ®¹i s­ huynh chuyÖn cña C« L©u V­¬ng ë Thiªn S­ MËt C¶nh. Ta ph¶i ë l¹i ®©y thªm vµi h«m.",
			"§­îc, ta sÏ b¸o l¹i víi ®¹i s­ huynh, ng­¬i ë l¹i ph¶i cÈn thËn hµnh sù.",
			}
	else
		strTalk = {
			"<sex> cã tiªu diÖt ®­îc C« L©u V­¬ng ch­a? Cã bŞ th­¬ng kh«ng?",
			"Nhê bŞ phong Ên, uy lùc cña C« L©u V­¬ng bŞ gi¶m ®i rÊt nhiÒu, nªn ta kh«ng bŞ th­¬ng g×. Khi bŞ tiªu diÖt còng gièng nh­ lóc ta diÖt trõ Oan Hån V­¬ng, ®Òu ®Ó l¹i ®¹o phï nµy, søc m¹nh cña C« L©u V­¬ng vµ Oan Hån V­¬ng ®Òu ®Õn tõ cïng mét nguån, xem ra lµ cïng mét thñ ph¹m.",
			"Hãa ra chuyÖn ë Quû M«n Håi Lang còng cã liªn quan, e lµ viÖc thøc tØnh cña C« L©u V­¬ng lµ ®iÒu bÊt th­êng. C« L©u V­¬ng tuy ®· bŞ diÖt, nh­ng nÕu vÉn cßn c¸c yªu vËt kh¸c th× kh«ng hay chót nµo. §Ó ®Ò phßng bÊt tr¾c, cã lÏ ta sÏ ë l¹i ®©y tiÕp tôc ®iÒu tra, nÕu <sex> quen biÕt víi DiÖp s­ huynh, cã thÓ phiÒn Ng­êi b¸o l¹i víi huynh Êy chuyÖn C« L©u V­¬ng ë Thiªn S­ MËt C¶nh? Ta ph¶i ë l¹i ®©y thªm vµi h«m. §a t¹ sù gióp ®ì cña <sex>, ph¸i C«n L«n c¶m kİch bÊt tËn.",
			"Xin ®õng kh¸ch s¸o. T«i sÏ truyÒn ®¹t t×nh h×nh cô thÓ ®Õn DiÖp thiÕu hiÖp, ng­¬i ë l¹i nhí ph¶i thËt cÈn träng.",
			}
	end

	SetTask(TASK_XB_ID_02,10);
	TalkEx("",strTalk);
	TaskTip("NhËn ñy th¸c cña ®Ö tö C«n L«n, ®em sù viÖc C« L©u V­¬ng ë Thiªn S­ MËt C¶nh b¸o l¹i víi DiÖp Tö Thu.");
	Msg2Player("NhËn ñy th¸c cña ®Ö tö C«n L«n, ®em sù viÖc C« L©u V­¬ng ë Thiªn S­ MËt C¶nh b¸o l¹i víi DiÖp Tö Thu.");
	GivePlayerAward("Award_XB_58","Easy");
	GivePlayerExp(SkeyXibei,"jiefengzhouyu")
end

--ÉĞÎ´¸æÖªÒ¶×ÓÇï÷¼÷ÃÍõÒ»ÊÂ
function task_025_03_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"H·y b¸o l¹i víi ®¹i s­ huynh chuyÖn C« L©u V­¬ng ë Thiªn S­ MËt C¶nh, ta ph¶i ë l¹i thªm vµi ngµy ®Ó xem cßn cã ma vËt nµo n÷a kh«ng. §a t¹ sù gióp ®ì cña <sex>, ph¸i C«n L«n c¶m kİch bÊt tËn.",
			}
	else
		strTalk = {
			"Nhê <sex> chuyÓn lêi ®Õn DiÖp s­ huynh vÒ chuyÖn C« L©u V­¬ng ë Thiªn S­ MËt C¶nh, ta ph¶i ë l¹i thªm vµi ngµy ®Ó xem cßn cã ma vËt nµo n÷a kh«ng. §a t¹ sù gióp ®ì cña <sex>, ph¸i C«n L«n c¶m kİch bÊt tËn.",
			}
	end

	TalkEx("",strTalk);

end

--¸æÖªÒ¶×ÓÇï÷¼÷ÃÍõÒ»ÊÂ
function task_025_04_0()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§¹i s­ huynh, C« L©u V­¬ng ë Thiªn S­ MËt C¶nh ®· thøc tØnh, nh­ng ®· ®­îc ng­êi cña ph¸i ta phong Ên kŞp thêi. Khi tiªu diÖt C« L©u V­¬ng, ®Ö còng t×m ®­îc mét ®¹o phï, gièng y c¸ch thøc ®· khèng chÕ Oan Hån V­¬ng.",
			"Ta võa trë vÒ tõ Cæ D­¬ng §éng, t¹i Cæ D­¬ng §éng ta ngÉu nhiªn ph¸t hiÖn t«ng tİch cña Phi Th­êng §¹o Nh©n, nh­ng h¾n phãng thİch c¸c ma vËt ®· ®­îc thuÇn hãa råi tÈu tho¸t. Khi ta tiªu diÖt c¸c ma vËt nµy míi ph¸t hiÖn tÊt c¶ ®Òu bŞ khèng chÕ bëi ®¹o phï. KÕt hîp víi lêi kÓ cña ng­¬i, cã thÓ ch¾c ch¾n viÖc thøc tØnh cña Oan Hån V­¬ng vµ C« L©u V­¬ng lµ do Phi Th­êng §¹o Nh©n g©y ra. Ch­ëng m«n ®· c¶m nhËn ®­îc dŞ th­êng ë C«n L«n s¬n ®ang gia t¨ng, d­êng nh­ sÏ cã yªu vËt xuÊt hiÖn. Phi Th­êng §¹o Nh©n trèn trong Cæ D­¬ng §éngsuèt 20 n¨m, viÖc thuÇn hãa Cæ D­¬ng Thó chØ lµ vÊn ®Ò thêi gian.",
			"§ån r»ng Cæ D­¬ng Thó tİnh t×nh hung b¹o, lµ mèi häa cña nh©n gian, Phi Th­êng §¹o Nh©n v× c¸i lîi riªng mµ phã mÆc an nguy cña b¸ t¸nh, phãng thİch Cæ D­¬ng Thó, ¾t sÏ g©y nªn ®¹i häa.",
			"§óng vËy, nªn s­ phô ta míi quyÕt t©m thanh lı m«n hé, chØ e Phi Th­êng §¹o Nh©n ®· s¾p thu phôc ®­îc Cæ D­¬ng Thó, b»ng kh«ng sao h¾n l¹i véi vµng tiÕp xóc víi ng­êi T©y H¹? §Ó cøu b¸ t¸nh thiªn h¹, ¾t ph¶i trõng trŞ Phi Th­êng §¹o Nh©n, b¶o vÖ C«n L«n chİnh ®¹o. µ ph¶i, ta vÉn cßn mét viÖc muèn nhê ng­¬i gióp ®ì.",
			}
	else
		strTalk = {
			"DiÖp thiÕu hiÖp, C« L©u V­¬ng ë Thiªn S­ MËt C¶nh®· thøc tØnh, nh­ng ®· bŞ ®Ö tö C«n L«n phong Ên. Khi tiªu diÖt C« L©u V­¬ng, cã ph¸t hiÖn thªm mét ®¹o phï, gièng hÖt nh­ c¸ch ®· khèng chÕ Oan Hån V­¬ng.",
			"Ta võa trë vÒ tõ Cæ D­¬ng §éng, t¹i Cæ D­¬ng §éng ta ngÉu nhiªn ph¸t hiÖn t«ng tİch cña Phi Th­êng §¹o Nh©n, nh­ng h¾n phãng thİch c¸c ma vËt ®· ®­îc thuÇn hãa råi tÈu tho¸t. Khi ta tiªu diÖt c¸c ma vËt nµy míi ph¸t hiÖn tÊt c¶ ®Òu bŞ khèng chÕ bëi ®¹o phï. KÕt hîp víi lêi kÓ cña ng­¬i, cã thÓ ch¾c ch¾n viÖc thøc tØnh cña Oan Hån V­¬ng vµ C« L©u V­¬ng lµ do Phi Th­êng §¹o Nh©n g©y ra. Ch­ëng m«n ®· c¶m nhËn ®­îc dŞ th­êng ë C«n L«n s¬n ®ang gia t¨ng, d­êng nh­ sÏ cã yªu vËt xuÊt hiÖn. Phi Th­êng §¹o Nh©n trèn trong Cæ D­¬ng §éngsuèt 20 n¨m, viÖc thuÇn hãa Cæ D­¬ng Thó chØ lµ vÊn ®Ò thêi gian.",
			"§ån r»ng Cæ D­¬ng Thó tİnh t×nh hung b¹o, lµ mèi häa cña nh©n gian, Phi Th­êng §¹o Nh©n v× c¸i lîi riªng mµ phã mÆc an nguy cña b¸ t¸nh, phãng thİch Cæ D­¬ng Thó, ¾t sÏ g©y nªn ®¹i häa.",
			"<sex> nãi rÊt cã lı, vËy nªn s­ phô ta míi quyÕt t©m thanh lı m«n hé, chØ e Phi Th­êng §¹o Nh©n ®· s¾p thu phôc ®­îc Cæ D­¬ng Thó, b»ng kh«ng sao h¾n l¹i véi vµng tiÕp xóc víi ng­êi T©y H¹? §Ó cøu b¸ t¸nh thiªn h¹, ¾t ph¶i trõng trŞ Phi Th­êng §¹o Nh©n, b¶o vÖ C«n L«n chİnh ®¹o. <sex> ®· gióp ®ì ph¸i C«n L«n rÊt nhiÒu, ta thËt kh«ng biÕt ph¶i nãi g× ®Ó c¶m ¬n. µ ph¶i, ta vÉn cßn mét viÖc muèn nhê <sex> gióp ®ì. ",
			}
	end

	TalkEx("task_025_04_0_1",strTalk);

end

--Ğø¶Ô»°
function task_025_04_0_1()

local strTalk = {}

		--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§¹i s­ huynh ®õng kh¸ch s¸o. Xin cø dÆn dß.",
			"Phô th©n ta ë Phông T­êng ®· l©u kh«ng thÊy liªn l¹c, lÇn tr­íc ng­¬i cã nh¾c ®Õn phô th©n ë quª nhµ th­êng lo l¾ng cho ta, b¶n th©n ta còng rÊt mong nhí Ng­êi, ng­¬i cã thÓ thay ta b¸o b×nh an cho phô th©n? Ngoµi ra viÖc s­ phô giao phã còng s¾p hoµn thµnh, s¾p tíi ta cã thÓ vÒ ®oµn tô víi phô th©n råi. Xin h·y chuyÓn l¹i tíi phô th©n ta ®ang ë Phông T­êng phñ ®­îc an t©m.",
			"Kh«ng ngê ®¹i s­ huynh còng lµ ng­êi con hiÕu th¶o. §¹i s­ huynh cø yªn t©m, ®Ö sÏ chuyÓn lêi cña huynh ®Õn DiÖp l·o, huynh cø yªn t©m ®Õn Cæ D­¬ng §éng, nh­ng d­êng nh­ ph¸p lùc cña Phi Th­êng §¹o Nh©n ®· t¨ng rÊt nhiÒu, huynh ph¶i cÈn thËn.",
			"(Cßn n÷a ta quªn b¸o víi ¢u D­¬ng tiÒn bèi vÒ môc ®İch nhËp thÕ cña ph¸i ta. §i t×m «ng Êy nãi râ t×nh h×nh råi míi tíi chç DiÖp l·o vËy.)",
			}
	else
		strTalk = {
			"DiÖp thiÕu hiÖp kh¸ch s¸o qu¸, b»ng h÷u gióp ®ì nhau lµ viÖc nªn lµm. Xin cø nãi ®õng ng¹i. ",
			"Phô th©n ta ë Phông T­êng ®· l©u kh«ng liªn l¹c, lÇn tr­íc <sex> cã nh¾c ®Õn phô th©n ë quª nhµ th­êng lo l¾ng cho ta, b¶n th©n ta còng rÊt mong nhí Ng­êi, <sex> cã thÓ thay ta b¸o b×nh an cho phô th©n? Ngoµi ra viÖc s­ phô giao phã còng s¾p hoµn thµnh, s¾p tíi ta cã thÓ vÒ ®oµn tô víi phô th©n råi. Xin h·y chuyÓn l¹i tíi phô th©n ta ®ang ë Phông T­êng phñ ®­îc an t©m.",
			"Hãa ra DiÖp thiÕu hiÖp còng lµ ng­êi con hiÕu th¶o. ThiÕu hiÖp cø yªn t©m, ta sÏ chuyÓn lêi ®Õn DiÖp l·o, huynh cø yªn t©m ®Õn Cæ D­¬ng §éng, nh­ng d­êng nh­ ph¸p lùc cña Phi Th­êng §¹o Nh©n ®· t¨ng rÊt nhiÒu, huynh ph¶i cÈn thËn.",
			"(Môc ®İch nhËp thÕ cña C«n L«n ®· râ rµng råi, tr­íc khi tíi chç DiÖp l·o ch¾c ta nªn ®i t×m ¢u D­¬ng tiÒn bèi nãi râ sù t×nh.)",
			}
	end

	TalkEx("task_025_04_0_2",strTalk);

end

--·¢½±Àø
function task_025_04_0_2()

	give_ss_award(59);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,717,1);--·Ç³£µÀ·û
		SetTask(TASK_XB_ID_02,11);
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("§em môc ®İch nhËp thÕ cña C«n L«n ph¸i nãi râ víi ¢u D­¬ng tiÒn bèi.");
		Msg2Player("§em môc ®İch nhËp thÕ cña C«n L«n ph¸i nãi râ víi ¢u D­¬ng tiÒn bèi.");
		GivePlayerAward("Award_XB_59","Easy");
		GivePlayerExp(SkeyXibei,"fuhui")
	end
end

--ÉĞÎ´¸æÖªÅ·Ñô»­À¥ÂØÈëÊÀÒ»ÊÂÒòÓÉ
function task_025_04_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§· l©u ta kh«ng liªn l¹c g× víi phô th©n ë Phông T­êng, lÇn tr­íc ng­¬i cã nh¾c ®Õn phô th©n ë quª nhµ th­êng lo l¾ng cho ta, b¶n th©n ta còng rÊt mong nhí Ng­êi, ng­¬i cã thÓ thay ta b¸o b×nh an cho phô th©n? Ta sÏ nhanh chãng hoµn thµnh c«ng viÖc s­ phô giao phã ®Ó vÒ ®oµn tô víi phô th©n.",
			"Kh«ng ngê ®¹i s­ huynh còng lµ ng­êi con hiÕu th¶o. §¹i s­ huynh cø yªn t©m, ®Ö sÏ chuyÓn lêi cña huynh ®Õn DiÖp l·o, huynh cø yªn t©m ®Õn Cæ D­¬ng §éng, nh­ng d­êng nh­ ph¸p lùc cña Phi Th­êng §¹o Nh©n ®· t¨ng rÊt nhiÒu, huynh ph¶i cÈn thËn.",
			"(Cßn n÷a ta quªn b¸o víi ¢u D­¬ng tiÒn bèi vÒ môc ®İch nhËp thÕ cña ph¸i ta. §i t×m «ng Êy nãi râ t×nh h×nh råi míi tíi chç DiÖp l·o vËy.)",
			}
	else
		strTalk = {
			"§· l©u ta kh«ng liªn l¹c g× víi phô th©n ë Phông T­êng, lÇn tr­íc <sex> cã nh¾c ®Õn phô th©n ë quª nhµ th­êng lo l¾ng cho ta, b¶n th©n ta còng rÊt mong nhí Ng­êi, <sex> cã thÓ thay ta b¸o b×nh an cho phô th©n? Ta sÏ nhanh chãng hoµn thµnh c«ng viÖc s­ phô giao phã ®Ó vÒ ®oµn tô víi phô th©n.",
			"Hãa ra DiÖp thiÕu hiÖp còng lµ ng­êi con hiÕu th¶o. ThiÕu hiÖp cø yªn t©m, ta sÏ chuyÓn lêi ®Õn DiÖp l·o, huynh cø yªn t©m ®Õn Cæ D­¬ng §éng, nh­ng d­êng nh­ ph¸p lùc cña Phi Th­êng §¹o Nh©n ®· t¨ng rÊt nhiÒu, huynh ph¶i cÈn thËn.",
			"(Môc ®İch nhËp thÕ cña C«n L«n ®· râ rµng råi, tr­íc khi tíi chç DiÖp l·o ch¾c ta nªn ®i t×m ¢u D­¬ng tiÒn bèi nãi râ sù t×nh.)",
			}
	end

	TalkEx("",strTalk);

	--²¹·¢Å·Ñô»­¶Ô»°´¥·¢Æ÷
	if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("§em môc ®İch nhËp thÕ cña C«n L«n ph¸i nãi râ víi ¢u D­¬ng tiÒn bèi.");
		Msg2Player("§em môc ®İch nhËp thÕ cña C«n L«n ph¸i nãi râ víi ¢u D­¬ng tiÒn bèi.");
	end

end

--ÉĞÎ´¸æÖªÅ·Ñô»­À¥ÂØÈëÊÀÒ»ÊÂÒòÓÉÓëÒ¶ÀÏ¶Ô»°²¹·¢Å·Ñô»­¶Ô»°´¥·¢Æ÷
function task_025_04_2()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Kh«ng ngê C«n L«n nhËp thÕ l¹i dÊy lªn nhiÒu nghi kş nh­ vËy, viÖc quan träng tr­íc m¾t lµ ph¶i ®Õn gÆp ¢u D­¬ng Häa bÈm râ ngän ngµnh.",
			}
	else
		strTalk = {
			"Kh«ng ngê C«n L«n nhËp thÕ l¹i dÊy lªn nhiÒu nghi kş nh­ vËy, viÖc quan träng tr­íc m¾t lµ ph¶i ®Õn gÆp ¢u D­¬ng Häa bÈm râ ngän ngµnh.",
			}
	end

	TalkEx("",strTalk);

	--²¹·¢Å·Ñô»­¶Ô»°´¥·¢Æ÷
	if GetTrigger(TALK_XB_OUYANGHUA) == 0 then
		CreateTrigger(4,210,TALK_XB_OUYANGHUA);
		TaskTip("Mau chãng nãi râ nguyªn do C«n L«n nhËp thÕ víi ¢u D­¬ng tiÒn bèi.");
		Msg2Player("Mau chãng nãi râ nguyªn do C«n L«n nhËp thÕ víi ¢u D­¬ng tiÒn bèi.");
	end

end


---------------------------------- Î÷±±Çø26·ÖÖ§2_3·Ç³£µÀÈË----------------------------------
--¸æËßÅ·Ñô»­À¥ÂØÈëÊÀÒ»ÊÂÒòÓÉ

function task_026_01_0()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"¢u D­¬ng tiÒn bèi, môc ®İch nhËp thÕ cña C«n L«n ®· râ, b×nh th­êng chóng t«i chØ hµng yªu trõ ma ë chèn rõng s©u, gÇn ®©y do Trung Nguyªn Giang T©n th«n yªu ma hoµnh hµnh, cã nguy c¬ lan sang c¸c th«n lµng l©n cËn, C«n L«n ph¸i míi xuÊt hiÖn quanh vïng Giang T©n th«n, khiÕn c¸c bang ph¸i Trung Nguyªn lÇm t­ëng chóng t«i cã ©m m­u, sù thËt lµ yªu ma hiÖn thÕ, C«n L«n truy hung, ®¹i s­ huynh DiÖp Tö Thu cã dÆn, nÕu C«n L«n g©y nªn hiÓu lÇm g×. Xin bá qu¸ cho.",
			"Kh«ng ngê C«n L«n ph¸i tuy İt xuÊt hiÖn trªn giang hå l¹i quan t©m ®Õn thiªn h¹ b¸ t¸nh nh­ vËy, thËt ®¸ng quı. Ma quû xuÊt hiÖn quanh Giang T©n th«n ®· biÕn quanh vïng thµnh quû vùc. C«n L«n gióp søc lµ ®iÒu ®¸ng quı, ta sÏ cho bå c©u ®­a th­ ®Õn c¸c bang ph¸i, ®õng nghi kş ng­êi cña C«n L«n, ®Ó tr¸nh nh÷ng tranh chÊp kh«ng ®¸ng cã.",
			"§Ö tö C«n L«n ®a phÇn ®Òu chuyªn t©m tu luyÖn, ®Æt viÖc tr¶m yªu trõ ma lªn hµng ®Çu, İt khi tranh chÊp so ®o cïng ai, mäi ng­êi ®Òu mong ®­îc chung sèng hßa môc víi c¸c bang ph¸i Trung Nguyªn.",
			}
	else
		strTalk = {
			"¢u D­¬ng tiÒn bèi, môc ®İch nhËp thÕ cña C«n L«n ph¸i ®· ®­îc lµm râ. C«n L«n kh«ng ph¶i kh«ng hµnh tÈu Trung Nguyªn, chØ lµ tËp trung hµng yªu trõ ma ë chèn rõng s©u. GÇn ®©y Trung Nguyªn Giang T©n th«n yªu ma hoµnh hµnh, cã nguy c¬ lan sang c¸c th«n lµng l©n cËn, C«n L«n ph¸i míi xuÊt hiÖn quanh vïng Giang T©n th«n, khiÕn c¸c bang ph¸i Trung Nguyªn lÇm t­ëng chóng t«i cã ©m m­u, sù thËt lµ yªu ma hiÖn thÕ, C«n L«n truy hung, ®¹i s­ huynh cã dÆn, nÕu C«n L«n g©y nªn hiÓu lÇm g×. Xin bá qu¸ cho.",
			"Kh«ng ngê C«n L«n ph¸i tuy İt xuÊt hiÖn trªn giang hå l¹i quan t©m ®Õn thiªn h¹ b¸ t¸nh nh­ vËy, thËt ®¸ng quı. Ma quû xuÊt hiÖn quanh Giang T©n th«n ®· biÕn quanh vïng thµnh quû vùc. C«n L«n gióp søc lµ ®iÒu ®¸ng quı, ta sÏ cho bå c©u ®­a th­ ®Õn c¸c bang ph¸i, ®õng nghi kş ng­êi cña C«n L«n, ®Ó tr¸nh nh÷ng tranh chÊp kh«ng ®¸ng cã.",
			"§Ö tö C«n L«n ®Òu chuyªn t©m tu luyÖn, tÊm lßng b¸c ¸i, ai ai còng ®Æt viÖc tr¶m yªu trõ ma lªn ®Çu, lµ mét m«n ph¸i ®¸ng kİnh.",
			}
	end

	TalkEx("task_026_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_026_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Gian Tµ yªu nghiÖt chuyªn lµm ®iÒu ¸c mµ l¹i khã diÖt trõ, ta ph¶i th«ng b¸o ®Õn c¸c bang ph¸i, trî gióp C«n L«n tr¶m yªu trõ ma. Nay §¹i Tèng quèc n¹n liªn miªn, vâ l©m ®ång ®¹o ph¶i ®ång t©m hiÖp lùc, mét lßng giÕt ®Şch míi ph¶i.",
			"TiÒn bèi d¹y ph¶i l¾m, chuyÖn cña C«n L«n ph¸i xin nhê tiÒn bèi nãi gióp cho. Ta cßn cã viÖc. Xin c¸o tõ.",
			"(Mong sao c¸c bang ph¸i Trung Nguyªn ®õng lµm khã C«n L«n. M«n ph¸i ta mét lßng trõ ma cøu thÕ, nh­ng l¹i bŞ hiÓu lÇm th× qu¶ lµ kh«ng ®¸ng. Kh«ng biÕt hiÖn giê søc kháe DiÖp l·o thÕ nµo?)",
			}
	else
		strTalk = {
			"Gian Tµ yªu nghiÖt chuyªn lµm ®iÒu ¸c mµ l¹i khã diÖt trõ, ta ph¶i th«ng b¸o ®Õn c¸c bang ph¸i, trî gióp C«n L«n tr¶m yªu trõ ma. Nay §¹i Tèng quèc n¹n liªn miªn, vâ l©m ®ång ®¹o ph¶i ®ång t©m hiÖp lùc, mét lßng giÕt ®Şch míi ph¶i.",
			"TiÒn bèi d¹y ph¶i l¾m, chuyÖn cña C«n L«n ph¸i xin nhê tiÒn bèi nãi gióp cho. Ta cßn cã viÖc. Xin c¸o tõ.",
			"(Mong sao c¸c bang ph¸i Trung Nguyªn ®õng lµm khã C«n L«n. M«n ph¸i ta mét lßng trõ ma cøu thÕ, nh­ng l¹i bŞ hiÓu lÇm th× qu¶ lµ kh«ng ®¸ng. Kh«ng biÕt hiÖn giê søc kháe DiÖp l·o thÕ nµo?)",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,12);
	TaskTip("Thay DiÖp Tö Thu ®Õn vÊn an DiÖp l·o.");
	Msg2Player("Thay DiÖp Tö Thu ®Õn vÊn an DiÖp l·o.");

end

--´úÒ¶×ÓÇïÏòÒ¶ÀÏ±¨Æ½°²
function task_026_02_0()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Chµo DiÖp l·o! Ng­êi vÉn m¹nh kháe chø?",
			"Chµo <sex>! Sao r¶nh tíi th¨m ta vËy? C¸i th©n giµ nµy vÉn kháe, nh­ng gÇn ®©y thêi tiÕt thÊt th­êng, khiÕn ta thÊp thám kh«ng yªn. <sex> ®Õn ®©y cã viÖc g×?",
			"DiÖp s­ huynh nãi l·o mét m×nh sèng t¹i Phông T­êng, nªn rÊt mong nhí, nhê ta ®Õn b¸o víi l·o, nhiÖm vô cña s­ phô giao cho ®· s¾p hoµn thµnh, sÏ nhanh chãng trë vÒ ®oµn tô víi l·o. Xin ®õng lo l¾ng qu¸.",
			"Ra lµ vËy, ta còng ®ang ®Şnh hái th¨m nã ®©y. Kh«ng biÕt s­ phô c¸c ng­êi giao nhiÖm vô g× mµ ®Õn giê nã vÉn ch­a xong. Sù viÖc cã khã kh¨n l¾m kh«ng? Ch¾c lµ v× nã kh«ng ®ñ søc g¸nh v¸c råi.",
			"Kh«ng ®©u, kh«ng ®©u, sù viÖc lÇn nµy rÊt phøc t¹p, DiÖp s­ huynh tuæi trÎ tµi cao, l¹i cã chİ lín, phen nµy ®Õn Cæ D­¬ng §éng ch¾c ch¾n sÏ hoµn thµnh nhiÖm vô ®­îc giao.",
			"C¸i… c¸i g×? Cæ… Cæ D­¬ng §éng… Nã ph¶i ®Õn Cæ D­¬ng §éng thËt sao?",
			}
	else
		strTalk = {
			"Chµo DiÖp l·o! Ng­êi vÉn m¹nh kháe chø?",
			"Chµo <sex>! Sao r¶nh tíi th¨m ta vËy? C¸i th©n giµ nµy vÉn kháe, nh­ng gÇn ®©y thêi tiÕt thÊt th­êng, khiÕn ta thÊp thám kh«ng yªn. <sex> ®Õn ®©y cã viÖc g×?",
			"GÇn ®©y ta vµ DiÖp Tö Thu - con cña DiÖp l·o kh¸ th©n, nghe huynh Êy nh¾c l·o ®ang sèng ë Phông T­êng, rÊt nhí mong l·o, nªn ®· nhê ta ®Õn nh¾n vµi lêi, nhiÖm vô mµ s­ phô huynh Êy giao phİ ®· s¾p hoµn thµnh, sÏ nhanh chãng trë vÒ ®oµn tô víi l·o. Mong l·o ®õng th­¬ng nhí qu¸.",
			"Ra lµ vËy, ta còng ®ang ®Şnh hái <sex> vÒ tiÓu nhi ®©y. Kh«ng biÕt s­ phô nã giao nhiÖm vô g× mµ ®Õn giê vÉn ch­a lµm xong. Sù viÖc cã khã kh¨n l¾m kh«ng? Ch¾c lµ v× nã kh«ng ®ñ søc g¸nh v¸c.",
			"Kh«ng ®©u, kh«ng ®©u, sù viÖc lÇn nµy rÊt phøc t¹p, DiÖp thiÕu hiÖp tuæi trÎ tµi cao, l¹i cã chİ lín, phen nµy ®Õn Cæ D­¬ng §éng ch¾c ch¾n sÏ hoµn thµnh nhiÖm vô ®­îc giao.",
			"C¸i… c¸i g×? Cæ… Cæ D­¬ng §éng… Nã ph¶i ®Õn Cæ D­¬ng §éng thËt sao?",
			}
	end

	TalkEx("task_026_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_026_02_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"DiÖp l·o h·y b¶o träng, ®õng nªn lo l¾ng qu¸. ChuyÖn g× vËy? Cã ph¶i Cæ D­¬ng §éng lµ n¬i rÊt nguy hiÓm? ",
			"Kh«ng… kh«ng ®­îc ®Ó nã ®Õn Cæ D­¬ng §éng, tuyÖt ®èi kh«ng ®­îc ®Ó nã ®Õn Cæ D­¬ng §éng, ®· ®Õn ®ã råi th× kh«ng trë ra ®­îc n÷a.",
			"DiÖp l·o xin h·y b×nh tÜnh. DiÖp s­ huynh lµ ®¹i ®Ö tö C«n L«n, vâ c«ng cao c­êng, DiÖp l·o ®õng qu¸ lo l¾ng. Ph¶i ch¨ng Cæ D­¬ng §éng cã ®iÒu g× bÊt th­êng?",
			"<sex> kh«ng biÕt ®ã th«i, nhiÒu n¨m tr­íc ®©y Cæ D­¬ng §éng ®· næi tiÕng lµ n¬i hiÓm ¸c, lµ mét n¬i chÕt ng­êi. §· tõng cã ng­êi ®µo 1 vËt s¸ng lÊp l¸nh vµ bŞ ®ån lµ vµng, thu hót rÊt nhiÒu ng­êi ®Õn xem vµ ®µo bíi. VÒ sau ng­êi tham gia ®µo cµng ngµy İt ®i v× mét ®i kh«ng trë l¹i. Tõ ®ã truyÒn r»ng kho b¸u cña Cæ D­¬ng §éng cã dŞ thó trÊn gi÷, nh÷ng kÎ tham lam ®Òu ph¶i bá m¹ng vµ n¬i ®©y bŞ bá hoang tõ ®ã.",
			}
	else
		strTalk = {
			"DiÖp l·o h·y b¶o träng, ®õng nªn lo l¾ng qu¸. ChuyÖn g× vËy? Cã ph¶i Cæ D­¬ng §éng lµ n¬i rÊt nguy hiÓm? ",
			"Kh«ng… kh«ng ®­îc ®Ó nã ®Õn Cæ D­¬ng §éng, tuyÖt ®èi kh«ng ®­îc ®Ó nã ®Õn Cæ D­¬ng §éng, ®· ®Õn ®ã råi th× kh«ng trë ra ®­îc n÷a.",
			"DiÖp l·o xin h·y b×nh tÜnh. DiÖp s­ huynh lµ ®¹i ®Ö tö C«n L«n, vâ c«ng cao c­êng, DiÖp l·o ®õng qu¸ lo l¾ng. Ph¶i ch¨ng Cæ D­¬ng §éng cã ®iÒu g× bÊt th­êng?",
			"<sex> kh«ng biÕt ®ã th«i, nhiÒu n¨m tr­íc ®©y Cæ D­¬ng §éng ®· næi tiÕng lµ n¬i hiÓm ¸c, lµ mét n¬i chÕt ng­êi. §· tõng cã ng­êi ®µo 1 vËt s¸ng lÊp l¸nh vµ bŞ ®ån lµ vµng, thu hót rÊt nhiÒu ng­êi ®Õn xem vµ ®µo bíi. VÒ sau ng­êi tham gia ®µo cµng ngµy İt ®i v× mét ®i kh«ng trë l¹i. Tõ ®ã truyÒn r»ng kho b¸u cña Cæ D­¬ng §éng cã dŞ thó trÊn gi÷, nh÷ng kÎ tham lam ®Òu ph¶i bá m¹ng vµ n¬i ®©y bŞ bá hoang tõ ®ã.",
			}
	end

	TalkEx("task_026_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_026_02_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Tin ®ån bªn trong Cæ D­¬ng §éng cã dŞ thó kh¾p thiªn h¹ ai ai còng biÕt, ta ®· tõng ®Õn ®éng Êy, nh­ng ch­a tõng thÊy dŞ thó nµo c¶.",
			"DŞ thó lµ cã thËt ®Êy. ThËt ra Tö Thu cßn cã mét huynh tr­ëng song sinh, lóc nhá do bÊt cÈn l¹c vµo Cæ D­¬ng §éng, tõ ®ã kh«ng thÊy trë ra, e lµ ®· chÕt d­íi mãng vuèt dŞ thó. Vî ta mÊt sím, cßn l¹i ta vµ Tö Thu sèng n­¬ng tùa nhau. Nam nhi chİ t¹i bèn ph­¬ng, nã ë C«n L«n ph¸i lµm nªn c¬ nghiÖp, ta rÊt mõng, nh­ng tuyÖt ®èi kh«ng ®­îc bĞn m¶ng ®Õn Cæ D­¬ng §éng.",
			"DiÖp l·o yªn t©m, DiÖp s­ huynh vâ c«ng cao c­êng, ¾t sÏ gÆp d÷ hãa lµnh. Hay ®Ó ta ®Õn ®ã t×m huynh Êy xem cã gióp ®­îc g× kh«ng, vµ còng ®Ó DiÖp l·o yªn t©m.",
			"§a t¹ <sex>, ®a t¹ <sex>, cã <sex> gióp søc th× ta yªn t©m h¬n. Xin ®õng nãi víi nã chuyÖn huynh ®Ö song sinh trong Cæ D­¬ng §éng, ®Ó tr¸nh ph©n t©m mµ lì viÖc. RÊt biÕt ¬n <sex> ®· gióp ®ì cho con ta.",
			"DiÖp l·o ®õng kh¸ch s¸o, còng ®õng lo l¾ng qu¸, ta nhÊt ®Şnh sÏ dèc søc gióp ®ì DiÖp s­ huynh. Xin c¸o tõ.",
			}
	else
		strTalk = {
			"Tin ®ån bªn trong Cæ D­¬ng §éng cã dŞ thó kh¾p thiªn h¹ ai ai còng biÕt, ta ®· tõng ®Õn ®éng Êy, nh­ng ch­a tõng thÊy dŞ thó nµo c¶.",
			"DŞ thó lµ cã thËt ®Êy. ThËt ra Tö Thu cßn cã mét huynh tr­ëng song sinh, lóc nhá do bÊt cÈn l¹c vµo Cæ D­¬ng §éng, tõ ®ã kh«ng thÊy trë ra, e lµ ®· chÕt d­íi mãng vuèt dŞ thó. Vî ta mÊt sím, cßn l¹i ta vµ Tö Thu sèng n­¬ng tùa nhau. Nam nhi chİ t¹i bèn ph­¬ng, nã ë C«n L«n ph¸i lµm nªn c¬ nghiÖp, ta rÊt mõng, nh­ng tuyÖt ®èi kh«ng ®­îc bĞn m¶ng ®Õn Cæ D­¬ng §éng.",
			"DiÖp l·o yªn t©m, DiÖp thiÕu hiÖp vâ c«ng cao c­êng, ¾t sÏ gÆp d÷ hãa lµnh. Hay ®Ó ta ®Õn ®ã t×m huynh Êy xem cã gióp ®­îc g× kh«ng, vµ còng ®Ó DiÖp l·o yªn t©m.",
			"§a t¹ <sex>, ®a t¹ <sex>, cã <sex> gióp søc th× ta yªn t©m h¬n. Xin ®õng nãi víi nã chuyÖn huynh ®Ö song sinh trong Cæ D­¬ng §éng, ®Ó tr¸nh ph©n t©m mµ lì viÖc. RÊt biÕt ¬n <sex> ®· gióp ®ì cho con ta.",
			"DiÖp l·o ®õng kh¸ch s¸o, còng ®õng lo l¾ng qu¸, ta nhÊt ®Şnh sÏ dèc søc gióp ®ì DiÖp thiÕu hiÖp. Xin c¸o tõ.",
			}
	end

	TalkEx("",strTalk);
	SetTask(TASK_XB_ID_02,13);
	TaskTip("NhËn lêi ñy th¸c cña DiÖp l·o, ®Õn gióp ®ì DiÖp Tö Thu.");
	Msg2Player("NhËn lêi ñy th¸c cña DiÖp l·o, ®Õn gióp ®ì DiÖp Tö Thu.");
	GivePlayerAward("Award_XB_60","Easy");
	GivePlayerExp(SkeyXibei,"zaihuiyenao")
end

--Î´ÓëÒ¶×ÓÇï¶Ô»°ÓëÒ¶ÀÏ¶Ô»°
function task_026_02_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§a t¹ <sex>, ®a t¹ <sex>, cã <sex> gióp søc th× ta yªn t©m h¬n. Xin ®õng nãi víi nã chuyÖn huynh ®Ö song sinh trong Cæ D­¬ng §éng, ®Ó tr¸nh ph©n t©m mµ lì viÖc. RÊt biÕt ¬n <sex> ®· gióp ®ì cho con ta.",
			}
	else
		strTalk = {
			"§a t¹ <sex>, ®a t¹ <sex>, cã <sex> gióp søc th× ta yªn t©m h¬n. Xin ®õng nãi víi nã chuyÖn huynh ®Ö song sinh trong Cæ D­¬ng §éng, ®Ó tr¸nh ph©n t©m mµ lì viÖc. RÊt biÕt ¬n <sex> ®· gióp ®ì cho con ta.",
			}
	end

	TalkEx("",strTalk);

end

--ÊÜÒ¶ÀÏËùÍĞÓëÒ¶×ÓÇï¶Ô»°
function task_026_03_0()

local strTalk = {};

	--µÈ¼¶ÏŞÖÆ
	if GetLevel() < 85 then
		if GetPlayerRoute() == 100 then
			strTalk = {
				"§¸ng tiÕc c«ng lùc cña ng­¬i cßn yÕu, b»ng kh«ng thu phôc tªn ph¶n ®å C«n L«n Phi Th­êng §¹o Nh©n nhÊt ®Şnh ph¶i nhê ®Õn sù gióp ®ì cña ng­¬i."
				}
		else
			strTalk = {
				"DiÖp Tö Thu: §¸ng tiÕc <sex> vâ c«ng cßn kĞm, ch­a ®¹t ®Õn {cÊp 85}. NÕu thu phôc {§¹o nh©n} nµy nhÊt ®Şnh ph¶i t×m ng­¬i gióp ®ì råi."
				}
		end
		TalkEx("",strTalk);
		return
	end

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Sao ®¹i s­ huynh l¹i bŞ th­¬ng? Th­¬ng tİch cã nÆng l¾m kh«ng?",
			"VÕt th­¬ng kh«ng ®¸ng ng¹i. Ta v× nhÊt thêi s¬ ı ®Ó Phi Th­êng §¹o Nh©n dÉn dô vµo s©u trong ®éng, bŞ c¸c ma vËt ®­îc h¾n thu phôc tÊn c«ng, khã kh¨n l¾m míi tho¸t ra ®­îc nh­ng vÉn bŞ bän yªu vËt lµm bŞ th­¬ng. Phi Th­êng §¹o Nh©n ®· thu phôc mét l­îng lín yªu vËt, h¾n chİnh lµ kÎ ®· khèng chÕ Oan Hån V­¬ng vµ C« L©u V­¬ng. H¾n chØ dïng yªu vËt mµ kh«ng hiÖn th©n, ta e viÖc thu phôc Cæ D­¬ng Thó ®· ®Õn giai ®o¹n quyÕt ®Şnh.",
			"S­ huynh ph¶i b¶o träng, míi cã thÓ dèc søc giÕt ®Şch. §Ö ®· chuyÓn lêi cña huynh ®Õn DiÖp l·o, Ng­êi rÊt m¹nh kháe, huynh kh«ng cÇn ph¶i lo l¾ng. S­ huynh, Cæ D­¬ng Thó cã thËt sù tån t¹i kh«ng?",
			"Cæ D­¬ng Thó lµ cã thËt, tuy bªn ngoµi cã nhiÒu lêi ®ån, nh­ng s­ phô ®· tõng cã ı ®Şnh thu phôc chóng, sau ph¸t hiÖn Cæ D­¬ng Thó chØ tÊn c«ng nh÷ng kÎ x©m nhËp vµo trong ®éng, lÊy ®éng khÈu lµm ranh giíi, tuyÖt nhiªn kh«ng cã ı ra ngoµi. Thiªn h¹ v¹n vËt ®Òu cã linh khİ, quy luËt tù nhiªn kh«ng nªn bŞ ph¸ vì bëi ı nghÜa cña con ng­êi, nÕu ma vËt kh«ng ra khái ®éng lµm h¹i ng­êi, th× con ng­êi kh«ng cÇn ph¶i ®uæi cïng diÖt tËn. Chİnh v× thÕ s­ phô ®· th«i ı ®Şnh thu phôc Cæ D­¬ng Thó. Kh«ng ngê Phi Th­êng §¹o Nh©n t©m thuËt bÊt chİnh, v× lîi İch cña b¶n th©n, bá ngoµi tai sù sèng cßn cña b¸ t¸nh, quyÕt thu phôc cho b»ng ®­îc.",
			}
	else
		strTalk = {
			"Sao thiÕu hiÖp l¹i bŞ th­¬ng? Th­¬ng tİch cã nÆng l¾m kh«ng?",
			"<sex> yªn t©m, vÕt th­¬ng kh«ng ®¸ng ng¹i. Ta v× nhÊt thêi s¬ ı ®Ó Phi Th­êng §¹o Nh©n dÉn dô vµo s©u trong ®éng, bŞ c¸c ma vËt ®­îc h¾n thu phôc tÊn c«ng, khã kh¨n l¾m míi tho¸t ra ®­îc nh­ng vÉn bŞ bän yªu vËt lµm bŞ th­¬ng. Phi Th­êng §¹o Nh©n ®· thu phôc mét l­îng lín yªu vËt, h¾n chİnh lµ kÎ ®· khèng chÕ Oan Hån V­¬ng vµ C« L©u V­¬ng. H¾n chØ dïng yªu vËt mµ kh«ng hiÖn th©n, ta e viÖc thu phôc Cæ D­¬ng Thó ®· ®Õn giai ®o¹n quyÕt ®Şnh.",
			"ThiÕu hiÖp ph¶i b¶o träng, míi cã thÓ dèc søc giÕt ®Şch. Ta ®· chuyÓn lêi cña thiÕu hiÖp ®Õn DiÖp l·o, Ng­êi rÊt m¹nh kháe, thiÕu hiÖp chí lo. Xin hái thiÕu hiÖp, Cæ D­¬ng Thó cã thËt hay kh«ng?",
			"Cæ D­¬ng Thó lµ cã thËt, tuy bªn ngoµi cã nhiÒu lêi ®ån, nh­ng s­ phô ®· tõng cã ı ®Şnh thu phôc chóng, sau ph¸t hiÖn Cæ D­¬ng Thó chØ tÊn c«ng nh÷ng kÎ x©m nhËp vµo trong ®éng, lÊy ®éng khÈu lµm ranh giíi, tuyÖt nhiªn kh«ng cã ı ra ngoµi. Thiªn h¹ v¹n vËt ®Òu cã linh khİ, quy luËt tù nhiªn kh«ng nªn bŞ ph¸ vì bëi ı nghÜa cña con ng­êi, nÕu ma vËt kh«ng ra khái ®éng lµm h¹i ng­êi, th× con ng­êi kh«ng cÇn ph¶i ®uæi cïng diÖt tËn. Chİnh v× thÕ s­ phô ®· th«i ı ®Şnh thu phôc Cæ D­¬ng Thó. Kh«ng ngê Phi Th­êng §¹o Nh©n t©m thuËt bÊt chİnh, v× lîi İch cña b¶n th©n, bá ngoµi tai sù sèng cßn cña b¸ t¸nh, quyÕt thu phôc cho b»ng ®­îc.",
			}
	end

	TalkEx("task_026_03_0_1",strTalk);

end

--Ğø¶Ô»°
function task_026_03_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Mét khi Cæ D­¬ng Thó bŞ thu phôc sÏ lµ ®¹i häa cho thiªn h¹, lµ kiÕp n¹n cña b¸ t¸nh, b»ng mäi gi¸ ph¶i diÖt trõ Phi Th­êng §¹o Nh©n. S­ huynh h·y yªn t©m tu d­ìng, ®Ö sÏ thay huynh ®i thu phôc Phi Th­êng §¹o Nh©n.",
			"Sao? Phi Th­êng §¹o Nh©n ph¸p lùc cao c­êng, nh­ng hiÖn nay h¾n ®ang tËp trung thu phôc Cæ D­¬ng Thó, ¾t sÏ bŞ ph©n t©m, h¬n n÷a c¸c ma vËt mµ h¾n thu phôc ®­îc ®Òu ®· bŞ ta tiªu diÖt c¶ råi, giê chİnh lµ thêi c¬ tèt nhÊt ®Ó trõ khö h¾n. Th«i ®­îc, viÖc nµy sÏ giao cho ®Ö, ®Ö ph¶i hÕt søc cÈn thËn, Phi Th­êng §¹o Nh©n dï g× còng lµ s­ b¸ cña chóng ta, ch­a kÓ h¾n cßn cã c©u kÕt víi T©y Vùc.",
			"S­ huynh yªn t©m, ®Ö biÕt m×nh ph¶i lµm g×. Huynh cø yªn t©m d­ìng th­¬ng.",
			}
	else
		strTalk = {
			" Mét khi Cæ D­¬ng Thó bŞ thu phôc sÏ lµ ®¹i häa cho thiªn h¹, lµ kiÕp n¹n cña b¸ t¸nh, diÖt trõ Phi Th­êng §¹o Nh©n ®· kh«ng cßn lµ viÖc thanh lı m«n hé cña C«n L«n, mµ lµ tr¸ch nhiÖm cña toµn thiªn h¹. ThiÕu hiÖp cø yªn t©m tu d­ìng, viÖc thu phôc Phi Th­êng §¹o Nh©n cø giao cho ta.",
			"Sao ta cã thÓ lµm phiÒn <sex> ®­îc? <sex> ®· gióp C«n L«n ta rÊt nhiÒu råi, nÕu lÇn nµy cßn ®Ó <sex> ph¶i m¹o hiÓm th× thËt ¸y n¸y qu¸.",
			"Xin chí nãi vËy. Ta diÖt trõ Phi Th­êng §¹o Nh©n lµ v× b¸ t¸nh trong thiªn h¹, kh«ng ph¶i gióp C«n L«n thanh lı m«n hé, thiÕu hiÖp cø yªn t©m, ta sÏ cÈn thËn khi ®èi phã víi Phi Th­êng §¹o Nh©n.",
			"Ta biÕt ph¶i nãi g× tr­íc tÊm lßng hiÖp nghÜa cña <sex>, Tö Thu xin ®a t¹ ¬n t­¬ng trî cña <sex>. Phi Th­êng §¹o Nh©n cßn cã c©u kÕt víi T©y H¹, cÇn ®Ò cao c¶nh gi¸c.",
			}
	end

	SetTask(TASK_XB_ID_02,14);
	TalkEx("",strTalk);
	TaskTip("§Õn tÇng mét Cæ D­¬ng §éng gióp DiÖp Tö Thu ®¸nh b¹i Phi Th­êng §¹o Nh©n.");
	Msg2Player("§Õn tÇng mét Cæ D­¬ng §éng gióp DiÖp Tö Thu ®¸nh b¹i Phi Th­êng §¹o Nh©n.");

end

--Î´´òµ¹·Ç³£µÀÈË¶Ô»°
function task_026_03_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Phi Th­êng §¹o Nh©n dï g× còng lµ s­ b¸ cña chóng ta, l¹i cßn c©u kÕt víi T©y Vùc, ®Ö ph¶i hÕt søc ®Ò phßng.",
			}
	else
		strTalk = {
			"Tö Thu xin ®a t¹ ¬n t­¬ng trî cña <sex>. Phi Th­êng §¹o Nh©n cßn cã c©u kÕt víi T©y H¹, cÇn ®Ò cao c¶nh gi¸c.",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø27·ÖÖ§2_4¹ÅÑôÒìÊŞ----------------------------------
--´òµ¹·Ç³£µÀÈËºóÓëÒ¶×ÓÇï¶Ô»°
function task_027_01_0()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"§Ö vÒ råi ®Êy µ, ta cø lo l¾ng cho sù an nguy cña ®Ö.",
			"§a t¹ sù quan t©m cña ®¹i s­ huynh, Phi Th­êng §¹o Nh©n ®· bŞ chÕ phôc, nh­ng trªn ng­êi h¾n ®Ö t×m thÊy m·nh vôn cña §¬n d­îc ThÇn bİ, kh«ng biÕt cã c«ng dông g×. Ngoµi ra cßn cã mËt th­ trao ®æi víi T©y H¹, mäi ©m m­u ®Òu cã c¶ trong th­ nµy.",
			"Qu¶ nhiªn Phi Th­êng §¹o Nh©n cã c©u kÕt víi T©y H¹, mau ®­a mËt th­ cho ta xem. Hõ, v× ham muèn c¸ nh©n mµ bá mÆc ©n o¸n n­íc nhµ, T©y H¹ vèn lu«n chùc chê chiÕm lÜnh Trung Nguyªn, Phi Th­êng §¹o Nh©n l¹i muèn m­în thÕ lùc cña chóng ®Ó ®¸nh C«n L«n, ch¼ng ph¶i ®· v« t×nh gióp T©y H¹ ®­îc tháa nguyÖn ®ã sao? Tªn nµy thËt qu¸ hiÓm ¸c. Trong th­ cã nh¾c chØ cÇn ba ngµy lµ cã thÓ thu phôc Cæ D­¬ng Thó, ®Ö ë Cæ D­¬ng §éng cã thÊy Cæ D­¬ng Thó kh«ng?",
			"ë trong ®éng ®Ö kh«ng thÊy con Cæ D­¬ng Thó nµo c¶, chØ thÊy Phi Th­êng §¹o Nh©n ®ang ®i trë ra, trªn ng­êi ®em theo rÊt nhiÒu Phi Th­êng ®¹o phï, ch¾c lµ dïng ®Ó hé th©n trong lóc thu phôc yªu vËt. ThÕ lµ ®Ö ®· chÆn ®­êng h¾n.",
			}
	else
		strTalk = {
			"<sex> vÒ råi sao? Ta cø lo cho sù an nguy cña <sex>.",
			"§a t¹ sù quan t©m cña thiÕu hiÖp, Phi Th­êng §¹o Nh©n ®· bŞ chÕ phôc, nh­ng trªn ng­êi h¾n ta t×m ®­îc m·nh vôn cña §¬n d­îc ThÇn bİ, kh«ng biÕt cã c«ng dông g×. Ngoµi ra cßn cã mËt th­ trao ®æi víi T©y H¹, mäi ©m m­u ®Òu cã c¶ trong th­ nµy.",
			"Qu¶ nhiªn Phi Th­êng §¹o Nh©n cã c©u kÕt víi T©y H¹, mau ®­a mËt th­ cho ta xem. Hõ, v× ham muèn c¸ nh©n mµ bá mÆc ©n o¸n n­íc nhµ, T©y H¹ vèn lu«n chùc chê chiÕm lÜnh Trung Nguyªn, Phi Th­êng §¹o Nh©n l¹i muèn m­în thÕ lùc cña chóng ®Ó ®¸nh C«n L«n, ch¼ng ph¶i ®· v« t×nh gióp T©y H¹ ®­îc tháa nguyÖn ®ã sao? Tªn nµy thËt qu¸ hiÓm ¸c. Trong th­ cã nh¾c chØ cÇn ba ngµy lµ cã thÓ thu phôc Cæ D­¬ng Thó, ®Ö ë Cæ D­¬ng §éng cã thÊy Cæ D­¬ng Thó kh«ng?",
			"ë trong ®éng ®Ö kh«ng thÊy con Cæ D­¬ng Thó nµo c¶, chØ thÊy Phi Th­êng §¹o Nh©n ®ang ®i trë ra, trªn ng­êi ®em theo rÊt nhiÒu Phi Th­êng ®¹o phï, ch¾c lµ dïng ®Ó hé th©n trong lóc thu phôc yªu vËt. ThÕ lµ ®Ö ®· chÆn ®­êng h¾n.",
			}
	end

	TalkEx("task_027_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_027_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"(Phi Th­êng §¹o Nh©n cÊu kÕt víi T©y H¹, ®· bŞ ta diÖt trõ, nh­ng nÕu T©y H¹ l¹i cho ng­êi ®Õn t×m Phi Th­êng §¹o Nh©n th× th©n phËn cña ta sÏ b¹i lé. Ch¾c ch¾n T©y H¹ v× muèn cã ®­îc Tr­êng Sinh BÊt Tö ®¬n míi gióp Phi Th­êng §¹o Nh©n tÊn c«ng C«n L«n, viÖc nµy biÕt xö trİ ra sao ®©y? Tr­íc hÕt nªn phãng ®¹i sù nguy hiÓm cña Cæ D­¬ng §éng vµ uy lùc cña Cæ D­¬ng Thó víi NhÊt PhÈm §­êng ®Ó tranh thñ thªm chót thêi gian.)",
			"Xem ra thêi h¹n ba ngµy ®­îc nh¾c ®Õn trong th­ lµ thËt, b»ng kh«ng Phi Th­êng §¹o Nh©n còng kh«ng cÇn véi vµng ®i t×m yªu vËt hé th©n. Nh÷ng m¶nh vôn Kim ®¬n nµy tr«ng gièng Háa LuyÖn Kim ®¬n, khi ma vËt dïng Kim ®¬n nµy ®­îc 49 ngµy, nã sÏ ph¸t huy t¸c dông khiÕn chóng phôc tïng mÖnh lÖnh cña ng­êi cho thuèc. Ngoµi ra sau khi dïng ®¬n d­îc nµy, uy lùc cña ma vËt sÏ t¨ng gÊp tr¨m lÇn. ",
			"Theo bøc th­ nµy, Cæ D­¬ng Thó ®· ®­îc dïng thuèc ®Õn ngµy thø 46, nÕu kh«ng tiÕp tôc th× kÕt qu¶ sÏ nh­ thÕ nµo?",
			}
	else
		strTalk = {
			"(Phi Th­êng §¹o Nh©n cÊu kÕt víi T©y H¹, ®· bŞ ta diÖt trõ, nh­ng nÕu T©y H¹ l¹i cho ng­êi ®Õn t×m Phi Th­êng §¹o Nh©n th× th©n phËn cña ta sÏ b¹i lé. Ch¾c ch¾n T©y H¹ v× muèn cã ®­îc Tr­êng Sinh BÊt Tö ®¬n míi gióp Phi Th­êng §¹o Nh©n tÊn c«ng C«n L«n, viÖc nµy biÕt xö trİ ra sao ®©y? Tr­íc hÕt nªn phãng ®¹i sù nguy hiÓm cña Cæ D­¬ng §éng vµ uy lùc cña Cæ D­¬ng Thó víi NhÊt PhÈm §­êng ®Ó tranh thñ thªm chót thêi gian.)",
			"Xem ra thêi h¹n ba ngµy ®­îc nh¾c ®Õn trong th­ lµ thËt, b»ng kh«ng Phi Th­êng §¹o Nh©n còng kh«ng cÇn véi vµng ®i t×m yªu vËt hé th©n. Nh÷ng m¶nh vôn Kim ®¬n nµy tr«ng gièng Háa LuyÖn Kim ®¬n, khi ma vËt dïng Kim ®¬n nµy ®­îc 49 ngµy, nã sÏ ph¸t huy t¸c dông khiÕn chóng phôc tïng mÖnh lÖnh cña ng­êi cho thuèc. Ngoµi ra sau khi dïng ®¬n d­îc nµy, uy lùc cña ma vËt sÏ t¨ng gÊp tr¨m lÇn. ",
			"Theo bøc th­ nµy, Cæ D­¬ng Thó ®· ®­îc dïng thuèc ®Õn ngµy thø 46, nÕu kh«ng tiÕp tôc th× kÕt qu¶ sÏ nh­ thÕ nµo?",
			}
	end

	TalkEx("task_027_01_0_2",strTalk);

end

--Ğø¶Ô»°
function task_027_01_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"ViÖc nµy ta còng kh«ng râ l¾m, ph¶i hái s­ phô míi ®­îc. Nh­ng tr­íc m¾t lµ ph¶i nhanh chãng gi¶i trõ Kim ®¬n chi lùc, muèn vËy cÇn ph¶i nhê ®Õn nguån søc m¹nh t­¬ng kh¾c víi dŞ thó. TÇng 2 Cæ D­¬ng §éng cã hai dŞ vËt lµ Xİch LuyÖn Háa Hå vµ LiÖt Nham Ly Long, chóng cã thÓ chung sèng víi Cæ D­¬ng Thó, ch¾c h¼n còng cã kh¶ n¨ng øc chÕ nã. §Ö h·y ®Õn tÇng 2 Cæ D­¬ng §éng lÊy 10 ®u«i Háa Hå vµ  10 Ly Long Tu, ®îi ta hái râ s­ phô, lµm Táa Yªu Phï cã thÓ xãa d­îc lùc cña Kim ®¬n.",
			"VËy th× tèt qu¸, nh­ng kh«ng biÕt t×nh h×nh Cæ D­¬ng Thó ra sao, chóng cã n¶y sinh dŞ biÕn sau khi dïng Kim ®¬n hay kh«ng?",
			"ViÖc nµy còng ®¸ng lo l¾m, ®Ó ta t×m mét ®Ö tö ®¸ng tin cËy ®Õn Cæ D­¬ng §éng t¹m thêi phong Ên Cæ D­¬ng Thó, mét lµ ®Ó ng¨n chÆn dŞ biÕn, hai lµ tranh thñ thêi gian. ViÖc kh«ng thÓ chËm trÔ, ta chia nhau ra hµnh sù.",
			"Tèt, vËy ®Ö sÏ ®Õn tÇng 2 Cæ D­¬ng §éng tr­íc ®©y.",
			}
	else
		strTalk = {
			"ViÖc nµy ta còng kh«ng râ l¾m, ph¶i hái s­ phô míi ®­îc. Nh­ng tr­íc m¾t lµ ph¶i nhanh chãng gi¶i trõ Kim ®¬n chi lùc, muèn vËy cÇn ph¶i nhê ®Õn nguån søc m¹nh t­¬ng kh¾c víi dŞ thó. TÇng 2 Cæ D­¬ng §éng cã hai dŞ vËt lµ Xİch LuyÖn Háa Hå vµ LiÖt Nham Ly Long, chóng cã thÓ chung sèng víi Cæ D­¬ng Thó, ch¾c h¼n còng cã kh¶ n¨ng øc chÕ nã. §Ö h·y ®Õn tÇng 2 Cæ D­¬ng §éng lÊy 10 ®u«i Háa Hå vµ  10 Ly Long Tu, ®îi ta hái râ s­ phô, lµm Táa Yªu Phï cã thÓ xãa d­îc lùc cña Kim ®¬n.",
			"VËy th× tèt qu¸, nh­ng kh«ng biÕt t×nh h×nh Cæ D­¬ng Thó ra sao, chóng cã n¶y sinh dŞ biÕn sau khi dïng Kim ®¬n hay kh«ng?",
			"ViÖc nµy còng ®¸ng lo l¾m, ®Ó ta t×m mét ®Ö tö ®¸ng tin cËy ®Õn Cæ D­¬ng §éng t¹m thêi phong Ên Cæ D­¬ng Thó, mét lµ ®Ó ng¨n chÆn dŞ biÕn, hai lµ tranh thñ thêi gian. ViÖc kh«ng thÓ chËm trÔ, ta chia nhau ra hµnh sù.",
			"Tèt, vËy ®Ö sÏ ®Õn tÇng 2 Cæ D­¬ng §éng tr­íc ®©y.",
			}
	end

	TalkEx("",strTalk);
	DelItem(2,0,700,1);--»ğÁ¶½ğµ¤ËéÆ¬
	DelItem(2,0,701,1);--Î÷ÏÄÃÜĞÅ
	SetTask(TASK_XB_ID_02,16);
	CreateTrigger(0,1239,KILL_XB_LIEYANCHILONG);--ÁÑÑÒó¤ÁúÉ±¹Ö´¥·¢Æ÷
	CreateTrigger(0,1240,KILL_XB_CHILIANHUOHU);--³àÁ¶»ğºüÉ±¹Ö´¥·¢Æ÷
	TaskTip("§Õn tÇng 2 Cæ D­¬ng §éng t×m 10 Ly Long Tu vµ ®u«i Háa Hå.");
	Msg2Player("§Õn tÇng 2 Cæ D­¬ng §éng t×m 10 Ly Long Tu vµ ®u«i Háa Hå.");
	GivePlayerAward("Award_XB_61","Easy");
	GivePlayerExp(SkeyXibei,"feichangdaoren")
end

--ÊÕ¼¯»òÎ´ÊÕ¼¯µ½10¸ù»ğºüÎ²Óëó¤ÁúĞë
function task_027_02_0()

local strTalk = {};

	--´ø»ØÎïÆ·
	if GetItemCount(2,0,702) >= 10 and GetItemCount(2,0,703) >= 10 then

		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"§¹i s­ huynh, ®©y lµ 10 ®u«i Háa Hå vµ 10 Ly Long Tu, huynh cã hái ®­îc c¸ch gi¶i trõ t¸c dông cña Kim ®¬n ch­a?",
				"Ta ®· hái râ s­ phô råi, nÕu ma vËt dïng Háa LuyÖn Kim ®¬n ch­a ®ñ 49 ngµy mµ ®· ngõng l¹i, ma vËt ¾t sÏ cã dŞ biÕn, søc m¹nh cña Kim ®¬n sÏ lµm béc ph¸t ma tİnh. Cæ D­¬ng Thó vèn kh«ng ra khái ®éng, e lµ lÇn nµy víi t¸c dông cña Kim ®¬n chóng sÏ v­ît qua ranh giíi, hËu qu¶ kh«n l­êng. §Ö tö mµ ta ph¸i ®i ch¾c còng kh«ng chèng ®ì ®­îc l©u, ta sÏ chÕ Táa Yªu Phï cho ®Ö ngay.",
				"Cæ D­¬ng Thó ch¾c ®· xuÊt hiÖn dŞ biÕn, kh«ng biÕt vŞ s­ huynh ®Õn phong Ên chóng cã ®­îc an toµn kh«ng?",
				"§Ö yªn t©m, ®Ö tö ta ph¸i ®i cã thõa n¨ng lùc phong Ên Cæ D­¬ng Thó. §Ö ph¶i hÕt søc thËn träng, uy lùc cña Cæ D­¬ng Thó vèn ®· m¹nh, nay l¹i cã thªm t¸c dông cña Kim ®¬n, cµng kh«ng dÔ ®èi phã. Táa Yªu Phï nµy cã thÓ gióp ®Ö gi¶i trõ t¸c dông cña Kim ®¬n trong c¬ thÓ Cæ D­¬ng Thó, nh­ vËy sÏ nhÑ g¸nh cho ®Ö h¬n. §Ö cã thÓ ®em theo §µo Méc KiÕm cña ta ®i cïng, ®­a nã cho ®Ö tö ®ang trÊn gi÷ t¹i ®ã, v× sù viÖc hÖ träng, ta ®· c¨n dÆn kh«ng ®­îc nhÑ d¹ tin ai hÕt.",
				"Nh­ vËy lµ tèt. ChuyÖn kh«ng thÓ chËm trÔ, nÕu Cæ D­¬ng Thó x«ng ra th× gay go.",
				}
		else
			strTalk = {
				"ThiÕu hiÖp, ®©y lµ 10 ®u«i Háa Hå vµ 10 Ly Long Tu, thiÕu hiÖp cã hái ®­îc c¸ch gi¶i trõ t¸c dông cña Kim ®¬n ch­a?",
				"Ta ®· hái râ s­ phô råi, nÕu ma vËt dïng Háa LuyÖn Kim ®¬n ch­a ®ñ 49 ngµy mµ ®· ngõng l¹i, ma vËt ¾t sÏ cã dŞ biÕn, søc m¹nh cña Kim ®¬n sÏ lµm béc ph¸t ma tİnh. Cæ D­¬ng Thó vèn kh«ng ra khái ®éng, e lµ lÇn nµy víi t¸c dông cña Kim ®¬n chóng sÏ v­ît qua ranh giíi, hËu qu¶ kh«n l­êng. §Ö tö mµ ta ph¸i ®i ch¾c còng kh«ng chèng ®ì ®­îc l©u, ta sÏ chÕ Táa Yªu Phï cho ®Ö ngay.",
				"Cæ D­¬ng Thó ch¾c ®· xuÊt hiÖn dŞ biÕn, ®Ö tö ®­îc ph¸i ®Õn phong Ên chóng liÖu cã ®­îc an toµn kh«ng?",
				"Yªn t©m, ®Ö tö ta ph¸i ®i cã thõa n¨ng lùc phong Ên Cæ D­¬ng Thó. Ng­¬i ph¶i hÕt søc thËn träng, uy lùc cña Cæ D­¬ng Thó vèn ®· m¹nh, nay l¹i cã thªm t¸c dông cña Kim ®¬n, cµng kh«ng dÔ ®èi phã. Táa Yªu Phï nµy cã thÓ gióp ng­¬i gi¶i trõ t¸c dông cña Kim ®¬n trong c¬ thÓ Cæ D­¬ng Thó, nh­ vËy sÏ nhÑ g¸nh cho ng­¬i h¬n. Ng­¬i cã thÓ ®em theo §µo Méc KiÕm cña ta ®i cïng, ®­a nã cho ®Ö tö C«n L«n ®ang trÊn gi÷ t¹i ®ã, v× sù viÖc hÖ träng, ta ®· c¨n dÆn kh«ng ®­îc nhÑ d¹ tin ai hÕt.",
				"Nh­ vËy lµ tèt. ChuyÖn kh«ng thÓ chËm trÔ, nÕu Cæ D­¬ng Thó x«ng ra th× gay go.",
				}
		end
		DelItem(2,0,702,10);
		DelItem(2,0,703,10);
		AddItem(2,0,704,1,1);--ËøÑı·û
		AddItem(2,0,759,1,1);--ÌÒÄ¾½£
		RemoveTrigger(GetTrigger(KILL_XB_LIEYANCHILONG));
		RemoveTrigger(GetTrigger(KILL_XB_CHILIANHUOHU));
		TalkEx("",strTalk);
		SetTask(TASK_XB_ID_02,17);
		TaskTip("§Õn tÇng 2 Cæ D­¬ng §éng t×m ®Ö tö ph¸i C«n L«n vµ ®­a §µo Méc KiÕm, hái vŞ trİ cña Cæ D­¬ng Thó.");
		Msg2Player("§Õn tÇng 2 Cæ D­¬ng §éng t×m ®Ö tö ph¸i C«n L«n vµ ®­a §µo Méc KiÕm, hái vŞ trİ cña Cæ D­¬ng Thó.");
		GivePlayerAward("Award_XB_62","Easy");
		GivePlayerExp(SkeyXibei,"guyangdong")
	--Ã»ÓĞ´ø»ØÎïÆ·and²¹·¢ÈÎÎñ´¥·¢Æ÷
	else

		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Ng­¬i h·y ®Õn tÇng 2 Cæ D­¬ng §éng t×m 10 ®u«i Háa Hå vµ 10 Ly Long Tu, ta sÏ ph¸i ®Ö tö th©n tİn ®Õn Cæ D­¬ng §éng t¹m thêi phong Ên Cæ D­¬ng Thó, ®îi sau khi ta hái râ s­ phô c¸ch gi¶i trõ t¸c dông Kim ®¬n råi th¶o luËn tiÕp.",
				}
		else
			strTalk = {
				"PhiÒn <sex> ®i ®Õn tÇng 2 Cæ D­¬ng §éng t×m 10 ®u«i Háa Hå vµ 10 Ly Long Tu, ta sÏ cho ®Ö tö th©n tİn ®Õn Cæ D­¬ng §éng t¹m thêi phong Ên Cæ D­¬ng Thó, ®îi sau khi hái râ c¸ch gi¶i trõ t¸c dông Kim ®¬n råi th¶o luËn tiÕp.",
				}
		end

		if	GetTrigger(KILL_XB_LIEYANCHILONG) == 0 then
			CreateTrigger(0,1239,KILL_XB_LIEYANCHILONG);--ÁÑÑÒó¤ÁúÉ±¹Ö´¥·¢Æ÷
			TaskTip("§Õn tÇng 2 Cæ D­¬ng §éng t×m 10 Ly Long Tu vµ ®u«i Háa Hå.");
			Msg2Player("§Õn tÇng 2 Cæ D­¬ng §éng t×m 10 Ly Long Tu vµ ®u«i Háa Hå.");
		end

		if	GetTrigger(KILL_XB_CHILIANHUOHU) == 0 then
			CreateTrigger(0,1240,KILL_XB_CHILIANHUOHU);--³àÁ¶»ğºüÉ±¹Ö´¥·¢Æ÷
			TaskTip("§Õn tÇng 2 Cæ D­¬ng §éng t×m 10 Ly Long Tu vµ ®u«i Háa Hå.");
			Msg2Player("§Õn tÇng 2 Cæ D­¬ng §éng t×m 10 Ly Long Tu vµ ®u«i Háa Hå.");
		end

		TalkEx("",strTalk);
	end

end

--Î´ÓëÀ¥ÂØµÜ×Ó¶Ô»°»ñÏ¤¹ÅÑôÊŞĞĞ×Ù
function task_027_02_1()

local strTalk = {};

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i h·y ®­a §µo Méc KiÕm cho ®Ö tö C«n L«n ®ang ®ãng t¹i tÇng 2 Cæ D­¬ng §éng, sau ®ã cã thÓ dïng Táa Yªu Phï thu phôc Cæ D­¬ng Thó.",
			}
	else
		strTalk = {
			"Ng­¬i h·y ®­a §µo Méc KiÕm cho ®Ö tö C«n L«n ®ang ®ãng t¹i tÇng 2 Cæ D­¬ng §éng, sau ®ã cã thÓ dïng Táa Yªu Phï thu phôc Cæ D­¬ng Thó.",
			}
	end

	TalkEx("",strTalk);

	--²¹·¢ÌÒÄ¾½£ºÍËøÑı·û
	if GetItemCount(2,0,704) < 1 then
		AddItem(2,0,704,1,1);--ËøÑı·û
	end

	if GetItemCount(2,0,759) < 1 then
		AddItem(2,0,759,1,1);--ÌÒÄ¾½£
	end

end

--ÓëÀ¥ÂØµÜ×Ó¶Ô»°»ñÏ¤¹ÅÑôÊŞĞĞ×Ù
function task_027_03_0()

local strTalk = {};
local nMapDataIndex = random(1,getn(GuYangShou_MapData));
local xWPos,yWPos,xPos,yPos = GuYangShou_MapData[nMapDataIndex][1],GuYangShou_MapData[nMapDataIndex][2],GuYangShou_MapData[nMapDataIndex][3],GuYangShou_MapData[nMapDataIndex][4]
local nNpcIndex = 0;

	--Íæ¼ÒÈôÈÎÎñÊ§°ÜĞèÒª¹ı30·ÖÖÓ²ÅÄÜÖØĞÂË¢³ö¹ÅÑôÊŞ
	if GetTime()-GetTask(CREAT_GUYANGSHOU_TIME)	>= 1800 then

		--À¥ÂØÅÉµÜ×Ó¶Ô»°
		if GetPlayerRoute() == 100 then
			strTalk = {
				"Sao ng­¬i l¹i ®Õn ®©y? N¬i nµy rÊt nguy hiÓm, nÕu kh«ng cã viÖc g× th× h·y ®i mau!",
				"§¹i s­ huynh ph¸i ta ®Õn thu phôc Cæ D­¬ng Thó, ®©y lµ §µo Méc KiÕm cña huynh Êy.",
				"Ra lµ ng­êi cña ®¹i s­ huynh, tuy Cæ D­¬ng Thó ®· bŞ ta phong Ên, nh­ng ta còng ®· bŞ th­¬ng, uy lùc cña Cæ D­¬ng Thó qu¸ m¹nh, phong Ên ch¾c kh«ng thÓ duy tr× ®­îc l©u. Ng­¬i ®Õn ®óng lóc l¾m, giê ta sÏ gi¶i trõ phong Ên, ng­¬i ph¶i cÈn thËn.",
				"§Ö tö tu©n lÖnh!",
				}
		else
			strTalk = {
				"Ai ®ã? N¬i nµy rÊt nguy hiÓm, nÕu kh«ng cã viÖc g× th× mau rêi khái ®©y.",
				"Ta ®Õn ®©y ®Ó thu phôc Cæ D­¬ng Thó, ®©y lµ §µo Méc KiÕm cña DiÖp Tö Thu thiÕu hiÖp.",
				"Ra lµ b»ng h÷u cña ®¹i s­ huynh. Tuy Cæ D­¬ng Thó ®· bŞ ta phong Ên, nh­ng ta còng ®· bŞ th­¬ng, uy lùc cña Cæ D­¬ng Thó qu¸ m¹nh, e phong Ên kh«ng thÓ duy tr× ®­îc l©u. Ng­¬i ®Õn ®óng lóc l¾m, ta sÏ gi¶i trõ phong Ên, ng­¬i ph¶i cÈn thËn.",
				"§a t¹.",
				}
		end

		SetTask(CREAT_GUYANGSHOU_TIME,GetTime());--¼ÇÂ¼¹ÅÑôÊŞË¢ĞÂÊ±¼ä
		DelItem(2,0,759,1);--ÌÒÄ¾½£
		nNpcIndex = CreateNpc("Cæ D­¬ng Thó","Cæ D­¬ng Thó",512,xWPos,yWPos,-1,1,1,70);
		SetNpcScript(nNpcIndex,"\\script\\Î÷±±Çø\\¹ÅÑô¶´¶ş²ã\\npc\\¹ÅÑôÊŞ.lua");
		SetNpcLifeTime(nNpcIndex,1800);

		Msg2Player("§Õn  "..xPos..", "..yPos.." , ®¸nh b¹i Cæ D­¬ng Thó.")
		TaskTip("§Õn  "..xPos..", "..yPos.." , ®¸nh b¹i Cæ D­¬ng Thó.");

	else

		strTalk = {
			"Cæ D­¬ng Thó uy lùc rÊt lín, tèt nhÊt nªn nghØ ng¬i mét lóc råi míi hµnh ®éng.",
			}

	end

	TalkEx("",strTalk);

end

--ÉĞÎ´´ï³É´ò°Ü¹ÅÑôÊŞµÄÌõ¼ş
function task_027_03_1()

local strTalk = {
	"N¬i ®©y lµ sa m¹c hiÓm ¸c, chØ cÇn s¬ sÈy mét chót lµ kh«ng cßn c¬ héi trë ra ngoµi.",
	};

	TalkEx("",strTalk);

end

--ÒÑ¾­É±ËÀ¹ÅÑôÊŞ£¬¹Ø¿¨½Ó¿Ú¿ªÆô
function task_027_03_2()

local strTalk = {
	"Cæ D­¬ng Thó xuÊt hiÖn ¾t sÏ nguy h¹i thÕ gian!",
	};

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø28·ÖÖ§2_5ÂÏÉúÓñ±Ú----------------------------------
--É±ËÀ¹ÅÑôÊŞºóÓëÒ¶×ÓÇï¶Ô»°
function task_028_01_0()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"ThiÕu hiÖp, Cæ D­¬ng Thó ®· bŞ thu phôc, nh­ng tr­íc khi Cæ D­¬ng Thó biÕn mÊt, ta nghe mét tiÕng hĞt thÊt thanh vµ thÊy mét vÇng s¸ng mµu ®á lãe lªn, sau ®ã kh«ng thÊy dÊu vÕt cña Cæ D­¬ng Thó n÷a. ThiÕu hiÖp cã biÕt chuyÖn nµy lµ sao kh«ng?",
			"Qu¶ nhiªn <sex> ®· thu phôc ®­îc ma vËt. Xin ®a t¹. NhiÒu n¨m tr­íc ®©y s­ phô ta còng tõng cã ı thu phôc Cæ D­¬ng Thó, nªn còng t×m hiÓu nhiÒu vÒ chóng. S­ phô tõng nãi, nh÷ng ng­êi bŞ Cæ D­¬ng Thó nuèt chöng nÕu vÉn cßn o¸n niÖm, sÏ huyÔn hãa trong chİnh c¬ thÓ cña con thó, kĞo dµi sinh mÖnh b»ng c¸ch hót chÊt dinh d­ìng cña Cæ D­¬ng Thó. Nh­ng ngo¹i h×nh vµ tinh thÇn th× vÉn bŞ nhèt bªn trong lèt thó.",
			"Cã chuyÖn nµy sao? VËy tiÕng hĞt mµ ta nghe thÊy chİnh lµ cña nh÷ng ng­êi bŞ nhèt trong con thó µ? Cæ D­¬ng Thó biÕn mÊt, ph¶i ch¨ng nh÷ng ng­êi bªn trong còng biÕn mÊt theo?",
			"Kh«ng, nh÷ng ng­êi bŞ nhèt ®­îc Cæ D­¬ng Thó nu«i d­ìng, uy lùc cña hä kh«ng chõng cßn h¬n h¼n Cæ D­¬ng Thó. Cã thÓ khi Cæ D­¬ng Thó chÕt ®i, hä còng sÏ chÕt theo, nh­ng còng rÊt cã kh¶ n¨ng c¸i chÕt cña Cæ D­¬ng Thó chİnh lµ thêi c¬ ®Ó hä tho¸t khái c¶nh tï tóng. M¶nh HuyÕt Hån Tinh Ph¸ch nµy chİnh lµ vËt cã c«ng dông nu«i d­ìng sinh m¹ng.",
			}
	else
		strTalk = {
			"ThiÕu hiÖp, Cæ D­¬ng Thó ®· bŞ thu phôc, nh­ng tr­íc khi Cæ D­¬ng Thó biÕn mÊt, ta nghe mét tiÕng hĞt thÊt thanh vµ thÊy mét vÇng s¸ng mµu ®á lãe lªn, sau ®ã kh«ng thÊy dÊu vÕt cña Cæ D­¬ng Thó n÷a. ThiÕu hiÖp cã biÕt chuyÖn nµy lµ sao kh«ng?",
			"Qu¶ nhiªn <sex> ®· thu phôc ®­îc ma vËt. Xin ®a t¹. NhiÒu n¨m tr­íc ®©y s­ phô ta còng tõng cã ı thu phôc Cæ D­¬ng Thó, nªn còng t×m hiÓu nhiÒu vÒ chóng. S­ phô tõng nãi, nh÷ng ng­êi bŞ Cæ D­¬ng Thó nuèt chöng nÕu vÉn cßn o¸n niÖm, sÏ huyÔn hãa trong chİnh c¬ thÓ cña con thó, kĞo dµi sinh mÖnh b»ng c¸ch hót chÊt dinh d­ìng cña Cæ D­¬ng Thó. Nh­ng ngo¹i h×nh vµ tinh thÇn th× vÉn bŞ nhèt bªn trong lèt thó.",
			"Cã chuyÖn nµy sao? VËy tiÕng hĞt mµ ta nghe thÊy chİnh lµ cña nh÷ng ng­êi bŞ nhèt trong con thó µ? Cæ D­¬ng Thó biÕn mÊt, ph¶i ch¨ng nh÷ng ng­êi bªn trong còng biÕn mÊt theo?",
			"Kh«ng, nh÷ng ng­êi bŞ nhèt ®­îc Cæ D­¬ng Thó nu«i d­ìng, uy lùc cña hä kh«ng chõng cßn h¬n h¼n Cæ D­¬ng Thó. Cã thÓ khi Cæ D­¬ng Thó chÕt ®i, hä còng sÏ chÕt theo, nh­ng còng rÊt cã kh¶ n¨ng c¸i chÕt cña Cæ D­¬ng Thó chİnh lµ thêi c¬ ®Ó hä tho¸t khái c¶nh tï tóng. M¶nh HuyÕt Hån Tinh Ph¸ch nµy chİnh lµ vËt cã c«ng dông nu«i d­ìng sinh m¹ng.",
			}
	end

	TalkEx("task_028_01_0_1",strTalk);

end

--Ğø¶Ô»°
function task_028_01_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"NÕu ma vËt ch­a ®­îc diÖt trõ, ch¼ng ph¶i sÏ sinh ra mét qu¸i thó m¹nh h¬n Cæ D­¬ng Thó tr­íc ®©y? VÉn nªn trõ khö ®i th× h¬n.",
			"<sex> nãi ph¶i l¾m, nÕu l¹i xuÊt hiÖn thªm nh÷ng kÎ hiÓm ®éc nh­ Phi Th­êng §¹o Nh©n th× thËt tai h¹i! NÕu ma vËt vÉn ch­a chÕt, dïng HuyÕt Hån Tinh Ph¸ch tÊt sÏ dÉn dô ®­îc chóng.",
			"Khi ta ®­a HuyÕt Hån Tinh Ph¸ch vÒ ®©y, còng ®©u thÊy ma vËt xuÊt hiÖn, lµm c¸ch nµo ®Ó dô ®­îc chóng?",
			"HuyÕt Hån Tinh Ph¸ch chØ linh ®éng khi gÆp m¸u, tèt nhÊt lµ m¸u cña ng­êi ®· thu phôc Cæ D­¬ng Thó. Ng­¬i cã thÓ dïng Tô Linh ThÊt Thñ - vËt ®· quy tô linh khİ cña C«n L«n ®Ó trİch m¸u cña m×nh hßa vµo Tinh th¹ch. Khi Tinh th¹ch linh ®éng, ma vËt ¾t sÏ ®¸nh h¬i ®­îc vËt nu«i d­ìng nã vµ t×m ®Õn ®©y. Ma vËt nµy m¹nh h¬n h¼n Cæ D­¬ng Thó, ng­¬i ph¶i hÕt søc cÈn thËn.",
			"Ra lµ vËy, ta hiÓu råi. Ma vËt nµy tuyÖt ®èi kh«ng ®­îc phĞp tån t¹i.",
			}
	else
		strTalk = {
			"NÕu ma vËt ch­a ®­îc diÖt trõ, ch¼ng ph¶i sÏ sinh ra mét qu¸i thó m¹nh h¬n Cæ D­¬ng Thó tr­íc ®©y? VÉn nªn trõ khö ®i th× h¬n.",
			"<sex> nãi ph¶i l¾m, nÕu l¹i xuÊt hiÖn thªm nh÷ng kÎ hiÓm ®éc nh­ Phi Th­êng §¹o Nh©n th× thËt tai h¹i! NÕu ma vËt vÉn ch­a chÕt, dïng HuyÕt Hån Tinh Ph¸ch tÊt sÏ dÉn dô ®­îc chóng.",
			"Khi ta ®­a HuyÕt Hån Tinh Ph¸ch vÒ ®©y, còng ®©u thÊy ma vËt xuÊt hiÖn, lµm c¸ch nµo ®Ó dô ®­îc chóng?",
			"HuyÕt Hån Tinh Ph¸ch chØ linh ®éng khi gÆp m¸u, tèt nhÊt lµ m¸u cña ng­êi ®· thu phôc Cæ D­¬ng Thó. Ng­¬i cã thÓ dïng Tô Linh ThÊt Thñ - vËt ®· quy tô linh khİ cña C«n L«n ®Ó trİch m¸u cña m×nh hßa vµo Tinh th¹ch. Khi Tinh th¹ch linh ®éng, ma vËt ¾t sÏ ®¸nh h¬i ®­îc vËt nu«i d­ìng nã vµ t×m ®Õn ®©y. Ma vËt nµy m¹nh h¬n h¼n Cæ D­¬ng Thó, ng­¬i ph¶i hÕt søc cÈn thËn.",
			"Ra lµ vËy, ta hiÓu råi. Ma vËt nµy tuyÖt ®èi kh«ng ®­îc phĞp tån t¹i.",
			}
	end

	TalkEx("",strTalk);
	AddItem(2,0,706,1,1);--¾ÛÁéØ°Ê×
	SetTask(TASK_XB_ID_02,19);
	TaskTip("§Õn tÇng 2 Cæ D­¬ng §éng, dïng Tô Linh ThÊt Thñ trİch m¸u ®Ó khai phong, lîi dông HuyÕt Hån Tinh Ph¸ch dÉn dô dŞ vËt bªn trong Cæ D­¬ng Thó xuÊt hiÖn.");
	Msg2Player("§Õn tÇng 2 Cæ D­¬ng §éng, dïng Tô Linh ThÊt Thñ trİch m¸u ®Ó khai phong, lîi dông HuyÕt Hån Tinh Ph¸ch dÉn dô dŞ vËt bªn trong Cæ D­¬ng Thó xuÊt hiÖn.");
	GivePlayerAward("Award_XB_63","Easy");
	GivePlayerExp(SkeyXibei,"guyangshou")
end

--»¹Î´É±ËÀÑªÄ§ÈË£¨²¹·¢¾ÛÁéØ°Ê×£©
function task_028_01_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Ng­¬i cã thÓ dïng Tô Linh ThÊt Thñ trİch m¸u cña m×nh ®Ó dÉn dô ma vËt, nh¾m ®óng thêi c¬ ®Ó thu phôc nã. Ma vËt nµy uy lùc rÊt lín, cÇn ph¶i hÕt søc thËn träng.",
			}
	else
		strTalk = {
			"Ng­¬i cã thÓ dïng Tô Linh ThÊt Thñ trİch m¸u cña m×nh ®Ó dÉn dô ma vËt, nh¾m ®óng thêi c¬ ®Ó thu phôc nã. Ma vËt nµy uy lùc rÊt lín, cÇn ph¶i hÕt søc thËn träng.",
			}
	end

	TalkEx("",strTalk);

	if GetItemCount(2,0,706) < 1 then
		AddItem(2,0,706,1,1);--¾ÛÁéØ°Ê×
		TaskTip("§Õn tÇng 2 Cæ D­¬ng §éng, dïng Tô Linh ThÊt Thñ trİch m¸u ®Ó khai phong, lîi dông HuyÕt Hån Tinh Ph¸ch dÉn dô dŞ vËt bªn trong Cæ D­¬ng Thó xuÊt hiÖn.");
		Msg2Player("§Õn tÇng 2 Cæ D­¬ng §éng, dïng Tô Linh ThÊt Thñ trİch m¸u ®Ó khai phong, lîi dông HuyÕt Hån Tinh Ph¸ch dÉn dô dŞ vËt bªn trong Cæ D­¬ng Thó xuÊt hiÖn.");
	end

end

--ÒÑ¾­É±ËÀÑªÄ§ÈË
function task_028_02_0()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Hãa ra ma vËt lµ mét HuyÕt Ma Nh©n, ph¶i tèn kh«ng İt c«ng søc míi cã thÓ diÖt trõ ®­îc nã.",
			"Tèt qu¸! Mäi viÖc ®· kÕt thóc, Phi Th­êng §¹o Nh©n ®· phôc ph¸p, Cæ D­¬ng Thó bŞ diÖt trõ, HuyÕt Ma Nh©n còng ®· ®­îc tiªu diÖt, tÊt c¶ ®Òu lµ c«ng lao cña ®Ö. Mai nµy ®Ö sÏ lµ trô cét cña C«n L«n.",
			"§¹i s­ huynh qu¸ khen, hµng yªu phôc ma lµ t«n chØ cña ph¸i ta, ®Ö nµo d¸m quªn? µ ph¶i, khi ma vËt biÕn mÊt ®· ®Ó l¹i nöa m¶nh ngäc béi, huynh xem thö cã liªn quan ®Õn yªu vËt kh«ng?",
			"M¶nh ngäc béi nµy lÊy tõ chç HuyÕt Ma Nh©n sao? §Ö xem!",
			}
	else
		strTalk = {
			"Hãa ra ma vËt lµ mét HuyÕt Ma Nh©n, ph¶i tèn kh«ng İt c«ng søc míi cã thÓ diÖt trõ ®­îc nã.",
			"Tèt qu¸! Mäi viÖc ®· kÕt thóc, Phi Th­êng §¹o Nh©n ®· phôc ph¸p, Cæ D­¬ng Thó bŞ diÖt trõ, HuyÕt Ma Nh©n còng ®· ®­îc tiªu diÖt, tÊt c¶ ®Òu lµ c«ng lao cña <sex>. <sex> ®· hÕt m×nh v× C«n L«n vµ b¸ t¸nh trong thiªn h¹, ta thËt kh«ng biÕt lÊy g× ®Ó tá lßng biÕt ¬n. ¢n ®øc cña <sex>, Tö Thu xin ghi t¹c trong lßng.",
			"Huynh vµ ta lµ b»ng h÷u, chí nªn kh¸ch s¸o. µ ph¶i, khi ma vËt biÕn mÊt cã ®Ó l¹i nöa m¶nh ngäc béi, huynh xem thö cã liªn quan ®Õn yªu vËt kh«ng?",
			"M¶nh ngäc béi nµy lÊy tõ chç HuyÕt Ma Nh©n sao? <sex> xem!",
			}
	end

	TalkEx("task_028_02_0_1",strTalk);

end

--Ğø¶Ô»°
function task_028_02_0_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Sao s­ huynh còng cã nöa m¶nh ngäc béi vËy? Hai nöa nµy ghĞp l¹i võa khİt víi nhau, kh«ng lÏ…",
			"§Ö ®o¸n ra ®iÒu g× ®ã ph¶i kh«ng? Cø nãi ®õng ng¹i.",
			"Khi ®Ö tíi gÆp DiÖp l·o, cã nh¾c viÖc huynh phông mÖnh s­ phô tíi Cæ D­¬ng §éng. Khi nghe ®Õn Cæ D­¬ng §éng DiÖp l·o rÊt kİch ®éng, hái ra míi biÕt s­ huynh cßn cã mét huynh tr­ëng song sinh, lóc nhá ®i l¹c vµo Cæ D­¬ng §éng th× kh«ng thÊy trë ra n÷a, e lµ ®· thµnh måi cho Cæ D­¬ng Thó. Nay xem ra, HuyÕt Ma Nh©n kia rÊt cã thÓ lµ...",
			"Sao? Nh­ng ta ch­a hÒ nghe phô th©n nãi cßn cã mét ng­êi huynh tr­ëng?",
			}
	else
		strTalk = {
			"Sao thiÕu hiÖp còng cã nöa m¶nh ngäc béi vËy? Hai nöa nµy l¹i võa khİt víi nhau, kh«ng lÏ…",
			"<sex> ®o¸n ra ®iÒu g× ®ã ph¶i kh«ng? Cø nãi ®õng ng¹i.",
			"Khi ta tíi gÆp DiÖp l·o, cã nh¾c viÖc thiÕu hiÖp phông mÖnh s­ phô ®Õn Cæ D­¬ng §éng. Khi nghe ®Õn Cæ D­¬ng §éng DiÖp l·o rÊt kİch ®éng, hái ra míi biÕt thiÕu hiÖp cßn cã mét huynh tr­ëng song sinh, lóc nhá ®i l¹c vµo Cæ D­¬ng §éng th× kh«ng thÊy trë ra n÷a, e lµ ®· thµnh måi cho Cæ D­¬ng Thó. Nay xem ra, HuyÕt Ma Nh©n kia rÊt cã thÓ lµ...",
			"Sao? Nh­ng ta ch­a hÒ nghe phô th©n nãi cßn cã mét ng­êi huynh tr­ëng?",
			}
	end

	TalkEx("task_028_02_0_2",strTalk);

end

--Ğø¶Ô»°
function task_028_02_0_2()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"DiÖp l·o biÕt huynh chİ t¹i bèn ph­¬ng, tuy rÊt yªu th­¬ng huynh, nh­ng còng cam nguyÖn sèng c« ®éc ë Phông T­êng ®Ó huynh hoµn thµnh chİ h­íng. DiÖp l·o cßn c¨n dÆn kh«ng ®­îc ®Ó huynh biÕt m×nh cßn cã huynh tr­ëng song sinh, sî huynh bŞ ph©n t©m, nh­ng vÉn th­êng xuyªn lo l¾ng hái han cuéc sèng cña huynh ë C«n L«n.",
			"Ra phô th©n vÉn lu«n quan t©m lo l¾ng cho ta, cßn ta th× l¹i phít lê t×nh c¶m cña Ng­êi, ta thËt bÊt hiÕu… Hµng yªu phôc ma còng lµ v× b¸ t¸nh thiªn h¹, nÕu v× vËy mµ bá quªn t×nh th©n, th× hµng yªu phôc ma ®Ó lµm g× n÷a? Phô th©n tuy ë xa nh­ng vÉn lo l¾ng cho ta ®ñ ®iÒu, ®îi sau khi b×nh phôc ta ph¶i lËp tøc vÒ th¨m Ng­êi...",
			"Sù viÖc ®· kÕt thóc, s­ huynh cã thÓ vÒ th¨m DiÖp l·o råi, h¼n DiÖp l·o sÏ vui mõng l¾m. §Ö kh«ng lµm phiÒn s­ huynh n÷a.",
			}
	else
		strTalk = {
			"DiÖp l·o biÕt huynh chİ t¹i bèn ph­¬ng, tuy rÊt yªu th­¬ng huynh, nh­ng còng cam nguyÖn sèng c« ®éc ë Phông T­êng ®Ó huynh hoµn thµnh chİ h­íng. DiÖp l·o cßn c¨n dÆn kh«ng ®­îc ®Ó huynh biÕt m×nh cßn cã huynh tr­ëng song sinh, sî huynh bŞ ph©n t©m, nh­ng vÉn th­êng xuyªn lo l¾ng hái han cuéc sèng cña huynh ë C«n L«n.",
			"Ra phô th©n vÉn lu«n quan t©m lo l¾ng cho ta, cßn ta th× l¹i phít lê t×nh c¶m cña Ng­êi, ta thËt bÊt hiÕu… Hµng yªu phôc ma còng lµ v× b¸ t¸nh thiªn h¹, nÕu v× vËy mµ bá quªn t×nh th©n, th× hµng yªu phôc ma ®Ó lµm g× n÷a? Phô th©n tuy ë xa nh­ng vÉn lo l¾ng cho ta ®ñ ®iÒu, ®îi sau khi b×nh phôc ta ph¶i lËp tøc vÒ th¨m Ng­êi...",
			"Sù viÖc ®· kÕt thóc, thiÕu hiÖp cã thÓ vÒ th¨m DiÖp l·o råi, h¼n DiÖp l·o sÏ vui mõng l¾m. Ta kh«ng lµm phiÒn thiÕu hiÖp n÷a, cã thÓ kÕt giao b»ng h÷u víi thiÕu hiÖp ®óng lµ mét ®iÒu may m¾n.",
			}
	end

	TalkEx("task_028_02_0_3",strTalk);

end

--·¢½±Àø
function task_028_02_0_3()

	give_ss_award(64);

	if GetTask(TASK_GET_AWARD) == 1 then
		SetTask(TASK_GET_AWARD,0);
		DelItem(2,0,707,1,1);--°ë¿éÓñÅå
		SetTask(TASK_XB_ID_02,21);
		GivePlayerAward("Award_XB_64","Easy");
		GivePlayerExp(SkeyXibei,"yezhiqiu")
	end

end

--ÒÑ¾­É±ËÀÑªÄ§ÈË
function task_028_02_1()

local strTalk = {}

	--À¥ÂØÅÉµÜ×Ó¶Ô»°
	if GetPlayerRoute() == 100 then
		strTalk = {
			"Bá quªn t×nh th©n th× hµng yªu phôc ma ®Ó lµm g× chø? Phô th©n tuy ë xa nh­ng vÉn lu«n lo l¾ng cho ta ®ñ ®iÒu, ®îi sau khi b×nh phôc ta ph¶i lËp tøc vÒ th¨m Ng­êi…",
			}
	else
		strTalk = {
			"Bá quªn t×nh th©n th× hµng yªu phôc ma ®Ó lµm g× chø? Phô th©n tuy ë xa nh­ng vÉn lu«n lo l¾ng cho ta ®ñ ®iÒu, ®îi sau khi b×nh phôc ta ph¶i lËp tøc vÒ th¨m Ng­êi…",
			}
	end

	TalkEx("",strTalk);

end

---------------------------------- Î÷±±Çø29èÉĞÛÖ®Ñç----------------------------------
--ÓëÅ·Ñô»­¶Ô»°ÁìÈ¡ÈÎÎñ
function task_029_01_0()

local strTalk = {
	"¢u D­¬ng Häa: Ta nhËn ®­îc tin, Lı Nguyªn Kh¸nh cao thñ thø 3 cña t©y H¹ NhÊt PhÈm §­êng ®· ®İch th©n ®Õn Long M«n trÊn, e r»ng bän chóng ®ang ngÇm ho¹t ®éng ë Phông T­êng, h¾n xuÊt hiÖn ë ®©y nhÊt ®Şnh lµ cã ©m m­u. <sex> h·y cÈn thËn ®Ò phßng.",
	"Ng­êi ch¬i: Cã viÖc nµy sao? NhÊt PhÈm §­êng phôc håi søc m¹nh nhanh vËy µ? Lı Nguyªn Kh¸nh cßn ®İch th©n ra trËn.",
	"¢u D­¬ng Häa: Theo ®iÒu tra cña ta, søc m¹nh cña NhÊt PhÈm §­êng ë Phông T­êng nhÊt ®Şnh bŞ {gi¶m sót}, nÕu kh«ng Lı Nguyªn Kh¸nh sÏ kh«ng lé diÖn. TrËn chiÕn nµy ta lo r»ng NhÊt PhÈm §­êng muèn b¸o thï vâ l©m Trung Nguyªn, qu¶ nhiªn ta ®o¸n kh«ng sai, chuyÖn nµy cuèi cïng còng ph¶i x¶y ra.",
	}

	TalkEx("task_029_01_0_1",strTalk);

end

function task_029_01_0_1()

local strTalk = {
	"Ng­êi ch¬i: TiÒn bèi nãi ch¬i sao? Lı Nguyªn Kh¸nh d¸m ®¬n th©n ®éc m· ®Õn ®©y ­?",
	"¢u D­¬ng Häa: <sex> cã ®iÒu ch­a biÕt, Lı Nguyªn Kh¸nh ng­êi nµy kh«ng thÓ xem th­êng ®­îc, h¾n lµ cao thñ thø 3 cña T©y H¹ NhÊt PhÈm §­êng nªn viÖc y ®¬n th©n ®éc m· ®Õn chèn nguy hiÓm nµy còng ®óng víi t¸c phong cña y, tuy lµ ng­êi cña NhÊt PhÈm ®­êng nh­ng rÊt träng t×nh nghÜa, x«ng pha ®¬n ®éc ®Ô tr¸nh sù nguy hiÓm cho ®ång ®éi.",
	"Ng­êi ch¬i: Ta vÉn biÕt y lµ ®èi thñ ®¸ng sî, tõ c¸ch s¾p xÕp hµnh ®éng cã thÓ thÊy y lµ ng­êi rÊt cÈn thËn. Th¾ng ë Phông T­êng lÇn nµy thùc ra chØ gÆp may th«i.",
	"¢u D­¬ng Häa: Ha ha, <sex> ®óng lµ biÕt ng­êi biÕt ta tr¨m trËn tr¨m th¾ng, Lı Nguyªn Kh¸nh lÇn nµy ®İch th©n ®Õn Long M«n trÊn lµ v× muèn {thiÕt yÕn} gi¶i hßa hiÓu lÇm xãa bá nh÷ng ©n o¸n gi÷a Cao thñ vâ l©m trung nguyªn vµ T©y H¹ NhÊt PhÈm §­êng.",
	}

	TalkEx("task_029_01_0_2",strTalk);

end

function task_029_01_0_2()

local strTalk = {
	"Ng­êi ch¬i: Lµm sao míi cã thÓ dù tiÖc?",
	"¢u D­¬ng Häa: Kh«ng sai! Ta còng cho r»ng buæi tiÖc nµy nhÊt ®Şnh cã ©m m­u. C¸i gäi lµ xãa bá ©n o¸n nãi ®©u cã dÔ vËy? <sex> nhí ph¶i ®Ò phßng, Lı Nguyªn Kh¸nh dï sao còng lµ cao thñ d¸m ®Õn Trung Nguyªn tuyªn chiÕn nhÊt ®Şnh ®· cã chuÈn bŞ tr­íc. Ta ®· nhËn ®­îc {thiÖp mêi} cña y, ng­¬i cã thÓ ®Õn gÆp {KhÊu ChuÈn ë BiÖn Kinh} ®Ó hái c¸ch nhËn thiÖp mêi.",
	"Ng­êi ch¬i: Ta ®· chuÈn bŞ nghªnh chiÕn, tËp hîp c¸c nh©n sü vâ l©m ®Ó cïng øng phã. T¹i h¹ ph¶i ®Õn gÆp KhÊu ChuÈn ®Ó hái thiÖp mêi, xin c¸o tõ!",
	}

	--É¾È¥Ò»Æ·ÌÃ³ÆºÅ
	for i=1,6 do
		RemoveTitle(60,i);
	end
	SetTask(TASK_XB_ID_01,69);
	TalkEx("",strTalk);
	TaskTip("§Õn BiÖn Kinh t×m KhÊu ChuÈn hái yÕn tiÖc Long M«n.");
	Msg2Player("§Õn BiÖn Kinh t×m KhÊu ChuÈn hái yÕn tiÖc Long M«n.");

end

--Î´Ç°Íùãê¾©Óë¿Ü×¼¶Ô»°
function task_029_01_1()

local strTalk = {
	"¢u D­¬ng Häa: {KhÊu ChuÈn ë BiÖn Kinh} biÕt c¸ch nhËn ®­îc thiÖp mêi Long M«n, ng­êi cã thÓ t×m «ng ta hái thö.",
	}

	TalkEx("",strTalk);

end

--Óë¿Ü×¼¶Ô»°Ñ¯ÎÊÇë¼íÊÂÒË
function task_029_02_0()

local strTalk = {
	"KhÊu ChuÈn: Xin chµo <sex>! Ta ®­îc tin tõ {Tr­êng Ca M«n} nãi ng­¬i ®Êu mét trËn kŞch liÖt víi NhÊt PhÈm §­êng ë Phông T­êng. GÇn ®©y chØ nghe nãi Lı Nguyªn Kh¸nh cña NhÊt PhÈm §­êng ®ang ®Õn Trung Nguyªn, <sex> ®Õn ®©y lµ v× chuyÖn nµy µ?",
	"Ng­êi ch¬i: T¹i h¹ ®Õn ®©y lµ v× chuyÖn Lı Nguyªn Kh¸nh ®Õn Long M«n trÊn vµ thiÕt yÕn t¹i ®©y. ¢n D­¬ng Häa tiÒn bèi e r»ng {§¹i yÕn vâ l©m Trung Nguyªn} nµy kh«ng ®¬n gi¶n, kÎ nµy kh«ng ph¶i lµ h¹ng tÇm th­êng.",
	"KhÊu ChuÈn: Kh«ng sai! NÕu kh«ng v× lîi İch quèc gia, Lı Nguyªn Kh¸nh kh«ng dÔ g× ra tay, y ®İch th©n ph¶n kİch e r»ng kh«ng chØ ®¬n gi¶n lµ chuyÖn b¸o thï, cã 2 nguyªn nh©n: Thø 1 lµ NhÊt PhÈm §­êng tranh thñ thêi gian nghØ ng¬i, thø 2 lµ ®Şnh m­în buæi tiÖc ë Long M«n ®Ó th¨m dß thùc lùc cña vâ l©m trung nguyªn. ThiÕt Chu lÖnh cña NhÊt PhÈm §­êng ®· ban, <sex> lµ môc tiªu truy ®uæi cña chóng, Lı Nguyªn Kh¸nh sÏ kh«ng bá qua ®©u.",
	}

	TalkEx("task_029_02_0_1",strTalk);

end

function task_029_02_0_1()

local strTalk = {
	"Ng­êi ch¬i: Ta ph¶i cho Lı Nguyªn Kh¸nh hiÓu, hËu bèi bän ta kh«ng ph¶i lµ nh÷ng con rïa rót ®Çu!",
	"KhÊu ChuÈn: Mçi c©u cña <sex> nh­ hiÓu râ lßng ta, Lı Nguyªn Kh¸nh thiÕt yÕn t¹i qu¸n trä Long M«n, chØ cÇn hái {TiÓu NhŞ ë qu¸n trä Long M«n} cã thÓ nhËn ®­îc {thiÖp mêi Long M«n}!",
	"Ng­êi ch¬i: §a t¹ KhÊu tiªn sinh! T¹i h¹ nhÊt ®Şnh gi÷ thÓ diÖn cho §¹i Tèng! Xin c¸o tõ.",
	}

	SetTask(TASK_XB_ID_01,70);
	TalkEx("",strTalk);
	TaskTip("§Õn kh¸ch s¹n Long M«n trÊn t×m TiÓu NhŞ hái thiÖp mêi.");
	Msg2Player("§Õn kh¸ch s¹n Long M«n trÊn t×m TiÓu NhŞ hái thiÖp mêi.");

end

--Î´Ç°ÍùÁúÃÅÑçÈ¡µÃÇë¼í
function task_029_02_1()

local strTalk ={
	"KhÊu ChuÈn: Ng­¬i cã thÓ t×m {TiÓu NhŞ ë qu¸n trä Long M«n} ®Ó hái chuyÖn thiÖp mêi.",
	}

	TalkEx("",strTalk);

end

--Î´´ò°ÜÀîÔªÇìÇ°¿Ü×¼¶Ô»°
function task_029_02_2()

local strTalk ={
	"KhÊu ChuÈn: <sex> muèn dù yÕn tiÖc Long M«n? Lı Nguyªn Kh¸nh kh«ng ph¶i dÔ ®èi phã ®©u, buæi tiÖc nµy nhÊt ®Şnh kh«ng ph¶i ®¬n gi¶n, nÕu lÇn nµy kh«ng thµnh c«ng y còng tæ chøc b÷a tiÖc kh¸c.",
	}

	TalkEx("",strTalk);

end

--ÓëµêĞ¡¶ş¶Ô»°»ñµÃÇë¼í
function task_29_03_0()

local strTalk = {
	"TiÓu NhŞ: <sex> lµ ng­¬i µ? {Sãng giã} Long M«n s¾p x¶y ra, kh«ng cã chuyÖn g× th× mau rêi khái ®©y. Quanh ®©y kh«ng cã qu¸n trä nµo ®©u.",
	"Ng­êi ch¬i: TiÓu NhŞ ca, sãng giã s¾p diÔn ra ë ®©y ng­êi th­êng e khã mµ chŞu ®­îc, ng­¬i h·y mau vÒ nhµ ®i!",
	"TiÓu NhŞ: Ha ha. Kh«ng giÊu g× <sex>, thËt ra TiÓu NhŞ qu¸n trä nµy chİnh lµ ta, tr­ëng quÇy còng lµ ta, ng­êi hÇu còng lµ ta, qu¸n trä nµy chØ cã ta vµ vî, míi ®©y ®· 10 n¨m råi, vî ta còng lµ chñ, chñ kh«ng ®i ta còng kh«ng ®i.",
	}

	TalkEx("task_29_03_0_1",strTalk);

end

function task_29_03_0_1()

local strTalk = {
	"Ng­êi ch¬i: Ch¼ng lÏ TiÓu NhŞ vµ bµ chñ lµ quan hÖ chñ tí?",
	"TiÓu NhŞ: Kh«ng sai! Bµ chñ lµ vî cña ta, tiÕc lµ ng­êi nhµ cña ta khi ®Õn ®©y ®· bŞ chÕt hÕt, qu¸n trä nµy kh«ng ph¶i ®Ó kiÕm tiÒn nh­ng ®Õn giê bµ chñ vÉn kh«ng vui vÎ g×, bµ ta nãi qu¸n trä nµy kh«ng cã kh¸ch còng vÉn ph¶i më cöa, ng­êi më qu¸n trä cuèi cïng còng ®Õn! GÇn ®©y t©m t×nh bµ chñ vui vÎ h¼n ra lµm ta còng vui l©y. Bëi v× ta nghe nãi {Lı Nguyªn Kh¸nh} ®¹i nh©n s¾p ®Õn qu¸n trä, «ng ta chİnh lµ ng­êi më qu¸n trä, ®· bao n¨m tr«i qua cuèi cïng ngµy bµ chñ chê ®îi bÊy l©u còng ®· ®Õn.",
	"Ng­êi ch¬i: Th× ra ng­êi ®øng ®»ng sau qu¸n trä Long M«n lµ Lı Nguyªn Kh¸nh µ? Ch¼ng tr¸ch y chän n¬i nµy thiÕt yÕn. TiÓu NhŞ cã lÏ còng lµ ng­êi cña NhÊt PhÈm §­êng?",
	"TiÓu NhŞ: Kh«ng! Ta vµ bµ chñ kh«ng ph¶i lµ ng­êi cña NhÊt PhÈm §­êng, gÇn ®©y ta míi biÕt Lı ®¹i nh©n lµ ng­êi cña NhÊt PhÈm §­êng, Lı ®¹i nh©n lµ ®¹i anh hïng ®· cøu bµ ta, vâ c«ng cña bµ Êy còng lµ Lı ®¹i nh©n truyÒn thô, «ng ta nãi muèn ®Õn qu¸n trä thiÕt yÕn cao thñ Trung Nguyªn, bµ chñ cña ta rÊt vui mõng.",
	}

	TalkEx("task_29_03_0_2",strTalk);

end

function task_29_03_0_2()

local strTalk = {
	"Ng­êi ch¬i: Th× ra 2 ng­êi kh«ng ph¶i ng­êi cña NhÊt PhÈm §­êng. Ta còng cã nghe nãi Lı Nguyªn Kh¸nh sÏ thiÕt yÕn ë ®©y cho nªn ®Õn ®©y hái TiÓu NhŞ ca vÒ viÖc nµy, lµm sao míi cã thÓ dù tiÖc?",
	"TiÓu NhŞ: MÊy ngµy tr­íc Lı ®¹i nh©n ®· ®Õn ®©y nãi víi bµ chñ muèn thiÕt yÕn cao thñ Trung Nguyªn t¹i qu¸n trä, bµ chñ rÊt vui mõng bµ lµm theo sù s¾p xÕp cña Lı ®¹i nh©n. ¤ng ta nhê bµ chñ chuÈn bŞ nhiÒu thiÖp mêi Long M«n ®Ó ph¸t cho nh©n sü vâ l©m. Ph¶i lµ anh hïng cã tªn trong ThiÕt Chu lÖnh míi cã t­ c¸ch nhËn thiÖp mêi, <sex> cã ph¶i lµ ng­êi cã tªn trong {ThiÕt Chu lÖnh}? NÕu ph¶i th× xin ng­êi h·y lÊy nhËn mêi, <sex> cã thÓ ®Õn dù tiÖc råi! {<sex> ph¶i nhí kh«ng ®­îc lµm mÊt thiÖp nµy, tiÓu nh©n kh«ng cã nhiÒu thiÖp ®©u.}",
	"Ng­êi ch¬i: (Xem ra TiÓu NhŞ còng kh«ng râ Èn khóc bªn trong, Lı Nguyªn Kh¸nh qu¶ nhiªn ®óng nh­ ¢u D­¬ng tiÒn bèi ®· nãi rÊt träng t×nh nghÜa, ch¼ng tr¸ch Xu©n ThËp Tam N­¬ng vµ TiÓu NhŞ cã thÓ sinh tån ë Long M«n trÊn lµ do ®­îc Lı Nguyªn Kh¸nh ©m thÇm b¶o vÖ), ®· lµm phiÒn TiÓu NhŞ ca råi, t¹i h¹ chİnh lµ ng­êi trong ThiÕt Chu lÖnh truy ®uæi, muèn ®Õn ®©y dù tiÖc, ®a t¹ thiÖp mêi cña TiÓu NhŞ ca!",
	}

	TalkEx("",strTalk);
	AddItem(2,0,1037,1,1);--»ñµÃÁúÃÅÑçÇë¼í
	SetTask(TASK_XB_ID_01,71);
	TaskTip("22:00 tèi thø 7 ®Õn dù yÕn tiÖc Long M«n.");
	Msg2Player("22:00 tèi thø 7 ®Õn dù yÕn tiÖc Long M«n.");

end

--´ò°ÜÀîÔªÇìºóºÍ¿Ü×¼¶Ô»°
function task_029_04_0()

local strTalk = {
	"KhÊu ChuÈn: <sex> ®Õn ®­îc ®©y tøc lµ ®· ®¸nh b¹i Lı Nguyªn Kh¸nh t¹i yÕn tiÖc Long M«n? §óng lµ ®iÒu ®¸nh mõng? yÕn tiÖc Long M«n cña h¾n so víi Hång M«n yÕn cña H¹ng b¸ v­¬ng thÕ nµo?",
	"Ng­êi ch¬i: yÕn tiÖc Long M«n kh«ng ph¶i lµ n¬i ®¸ng sî, ®iÒu ®¸ng sî nhÊt chİnh lµ tªn Lı Nguyªn Kh¸nh, ta ch­a thÊy qua vâ nghÖ cña h¾n nªn kh«ng biÕt lµm sao kh¾c chÕ nªn vÉn ph¶i hîp søc cña nhiÒu ng­êi míi mong ®¸nh b¹i h¾n.",
	"KhÊu ChuÈn: Ha ha! §¸nh b¹i Lı Nguyªn Kh¸nh kh«ng ph¶i lµ chuyÖn dÔ, kh«ng thÓ gÊp g¸p, v× thÕ Trung nguyªn cÇn ph¶i ®ång t©m hiÖp lùc, ph¶i råi <sex> cã trang bŞ tr­íc ®©y ¢u D­¬ng Häa tiªn sinh ®­a cho ng­êi kh«ng?",
	}

	TalkEx("task_029_04_0_1",strTalk);

end

--Ğø¶Ô»°
function task_029_04_0_1()

local strTalk = {
	"Ng­êi ch¬i: µ? Trang bŞ nµy cã vÊn ®Ò g× µ?",
	"KhÊu ChuÈn: <sex> ®· gãp søc v× §¹i Tèng, ng­¬i chØ cÇn ®em {1 bé nhiÖm vô nhËn ®­îc trong nhiÖm vô T©y B¾c tr­íc ®©y} ®Õn ®©y ®æi {1 b¶o vËt}?",
	"Ng­êi ch¬i: Hay qu¸! §a t¹ KhÊu tiªn sinh.",
	}

	TalkEx("task_029_04_0_2",strTalk);
	SetTask(TASK_XB_ID_01,73);

end

--ÒÑ½«´ò°ÜÀîÔªÇì ¶Ò»»×îºó½±Àø
function task_029_04_0_2()

local strTalk = {
	"KhÊu ChuÈn: <sex> chØ cÇn ®em {1 bé trang bŞ} tr­íc ®©y nhËn ®­îc ®Õn ®©y ®æi {1 b¶o vËt}?",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_029_04_0_4()
		return
	end

	TalkEx("task_029_04_0_3",strTalk);

end

--·¢½±Àø
function task_029_04_0_3()

	final_award()

end

--½±Àø×°±¸³É¹¦ºó
function task_029_04_0_4()

local strTalk = {
	"KhÊu ChuÈn: §©y lµ vËt b¸u hiÕm cã, <sex> cã thÓ lÊy ®i."
	}

	TalkEx("task_029_04_0_5",strTalk);
	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID_01,74);--¶Ò»»½±ÀøÍê±Ï

end

--½±ÀøÒ»¸ö´¢ÎïÏä
function task_029_04_0_5()

local strTalk = {
	"KhÊu ChuÈn: §óng råi, ta nhí trong giang hå cã nhiÒu ng­êi o¸n hËn nhiÒu vËt phÈm quı kh«ng cã chç ®Ó cÊt, ta ®· t×m ®­îc Thî rÌn cã thÓ gióp ng­¬i {t¨ng dung l­îng r­¬ng chøa ®å}.",
	"Ng­êi ch¬i: §©y chİnh lµ thø t¹i h¹ ®ang cÇn, tiªn sinh nghÜ rÊt chu ®¸o.",
	"KhÊu ChuÈn: ChiÕn dŞch nµy qua ®i, §¹i Tèng {giang s¬n} t¹m thêi ®­îc yªn b×nh! {M­a bôi xanh rên non n­íc xa, khãi s­¬ng mê mŞt n¹n ®· qua, vÇng d­¬ng xuèng nói, phån hoa hÕt, cßn ngän giã xanh thæi méng tµ}.",
	}

	if GetTask(1481) ~= 1 and GetStoreBoxPageCount() <= 4 then
		SetTask(1481,1);
		SetStoreBoxPageCount(GetStoreBoxPageCount()+1);
		Msg2Player("KhÊu ChuÈn ®¸p t¹ nç lùc cña b¹n cho §¹i Tèng nªn t×m thî rÌn ®Õn t¨ng søc chøa r­¬ng chøa ®å cña b¹n!");
	end

	TalkEx("task_029_04_0_100",strTalk);
	SetTask(TASK_XB_ID_01,75);--¶Ò»»½±ÀøÍê±Ï

end

--²¹³äÖ®Ç°Ã»ÓĞÁìµ½¶Ò»»½±Àø:1.½Ó¿Ú¶Ô»°
function task_029_04_0_100()

local strTalk = {
	"KhÊu ChuÈn: <sex> chØ cÇn ®em {1 bé trang bŞ} tr­íc ®©y nhËn ®­îc ®Õn ®©y ®æi {1 b¶o vËt}?",
	}

	if GetTask(TASK_GET_AWARD) == 1 then
		task_029_04_0_102()
		return
	end

	TalkEx("task_029_04_0_101",strTalk);

end

--²¹³äÖ®Ç°Ã»ÓĞÁìµ½¶Ò»»½±Àø2.·¢·Å½±Àø
function task_029_04_0_101()

	final_award();

end

--²¹³äÖ®Ç°Ã»ÓĞÁìµ½¶Ò»»½±Àø2.·¢·Å½±ÀøÍê±Ï
function task_029_04_0_102()

local strTalk = {
	"KhÊu ChuÈn: §©y lµ vËt b¸u hiÕm cã, <sex> cã thÓ lÊy ®i."
	}

	TalkEx("task_029_05_0",strTalk);
	SetTask(TASK_GET_AWARD,0);
	SetTask(TASK_XB_ID_01,76);--¶Ò»»½±ÀøÍê±Ï

end

--Íê³ÉèÉĞÛÖ®ÑçºóÓë¿Ü×¼¶Ô»°
function task_029_05_0()

local strTalk =	{
	"KhÊu ChuÈn: §¹i Tèng cuèi cïng còng ®­îc {yªn b×nh}, thËt hay qu¸! M­a bôi xanh rên non n­íc xa, khãi s­¬ng mê mŞt n¹n ®· qua, vÇng d­¬ng xuèng nói phån hoa hÕt, cßn ngän giã xanh thæi méng tµ.",
	}

	TalkEx("",strTalk);

end

--¿Õº¯Êı£¬²»×öÈÎºÎÊÂÇé
function Task_Exit()
end;

--½±Àø³ÆºÅ
--²ÎÊınType£ºYIPINGTANG_TITLEµÄĞòºÅ
function add_xb_title(nType)

	AddTitle(60,nType);
	SetCurTitle(60,nType);
	Msg2Player("B¹n nhËn ®­îc  "..YIPINGTANG_TITLE[nType][1].." Danh hiÖu!");

end

--ÅĞ¶ÏÊÇ·ñÁÁ³öµ±Ç°½×¶ÎµÄ³ÆºÅ
--·µ»ØÖµ£º1Îªµ±Ç°ÁÁ³ö¸Ã½×¶Î³ÆºÅ£»0Îªµ±Ç°Ã»ÓĞÁÁ³ö¸Ã½×¶Î³ÆºÅ
function is_show_title_level()

local i=0;
local nTitleIndex = 0;
local nCurTitleId_1,nCurTitleId_2 = 0,0;

	for i=1,getn(YIPINGTANG_TITLE) do
		if GetTask(YIPINGTANG_TITLE[i][2]) >= YIPINGTANG_TITLE[i][3] then
			nTitleIndex = i
		end
	end

	nCurTitleId_1,nCurTitleId_2 = GetCurTitle();

	--µ±Ç°Ã»ÓĞ¶¥×Å¸Ã½×¶Î³ÆºÅ
	if nCurTitleId_1 == 60 and nCurTitleId_2 == nTitleIndex then
		return 1
	else
		return 0
	end

end

--³µÂÖ°ÔÍõ²¹·¢³ÆºÅ£¬²¢ÉèÖÃµ±Ç°³ÆºÅÎªµ±Ç°¿É»ñµÃµÄ×î¸ßµÈ¼¶³ÆºÅ
function repeat_add_xb_title()

local i=0;
local nDetailType = 0;

	for i=1,getn(YIPINGTANG_TITLE) do
		--ÅĞ¶ÏÈÎÎñ
		if GetTask(YIPINGTANG_TITLE[i][2]) >= YIPINGTANG_TITLE[i][3] then
			AddTitle(60,i);
			nDetailType = i;
		end
	end

--	if nDetailType ~= 0 then
--		SetCurTitle(60,nDetailType);
--	end
--
--	Msg2Player("Äã»ñµÃÁË"..YIPINGTANG_TITLE[nDetailType][1].."³ÆºÅ£¡");

end

--ÁÁ³ö¸Ã³ÆºÅÈÎÎñÌáÊ¾
--²ÎÊı£ºnTitleIndexÎªĞèÒªÌáÊ¾µÄ³ÆºÅid£¬¶ÔÓ¦YIPINGTANG_TITLE±í£»nNpcNameÎªĞèÒªÌáÊ¾µÄNpcÃû×Ö
function xb_title_tip(nTitleIndex,nNpcName)

local strTalk = {
	[1] = {
				["Xa Lu©n B¸ V­¬ng"] =
				{
				{"Quanh vïng Long M«n trÊn qu¶ nhiªn ngäa hæ tµng long, chØ míi vµi ngµy ®· quy tô ®­îc rÊt nhiÒu T©n BŞ th©n thñ rÊt kh¸ ®Õn xin gia nhËp. Ng­êi cña bæn ®­êng ®Òu cã mét danh hiÖu, nÕu lµ T©n BŞ cña bæn ®­êng, h·y ®Õn tr×nh diÖn, nhËn thö th¸ch nhËp ®­êng; cßn nÕu chØ muèn ph¸ rèi th× h·y nh©n lóc ta ch­a næi giËn mµ ngoan ngo·n ra vÒ."},
				{"Lóc nµy quanh Long M«n trÊn xuÊt hiÖn nhiÒu T©n BŞ th©n thñ rÊt kh¸, nÕu cã thÓ th«ng qua c¶ 3 ¶i thö th¸ch, ¾t cã chç h¬n ng­êi, ch¾c sÏ hÊp dÉn l¾m ®©y. Ng­êi cña bæn ®­êng ®Òu cã mét danh hiÖu, nÕu lµ T©n BŞ cña bæn ®­êng, h·y ®Õn tr×nh diÖn, nhËn thö th¸ch nhËp ®­êng. Thö th¸ch dµnh cho T©n BŞ lµ mét cuéc c¹nh tranh khèc liÖt!"}
				},
				},
	[2] = {
				["Xa Lu©n B¸ V­¬ng"] =
				{
				{"Së dÜ NhÊt PhÈm §­êng ®­îc xem lµ ®éi qu©n tinh nhuÖ nhÊt cña T©y H¹, bëi thİch kh¸ch cña bæn ®­êng ®­îc ph©n bæ réng kh¾p thiªn h¹. RÊt nhiÒu T©n BŞ muèn gia nhËp bæn ®­êng ®Òu cã th©n thñ rÊt kh¸, nÕu v­ît qua c¶ 3 thö th¸ch th× sÏ trë thµnh thİch kh¸ch, nh­ thÕ NhÊt PhÈm §­êng l¹i cã thÓ lín m¹nh h¬n tr­íc. Nh÷ng nhiÖm vô c¬ b¶n ®Òu do thİch kh¸ch hoµn thµnh, ng­êi cña bæn ®­êng ®Òu cã mét danh hiÖu, nÕu lµ thİch kh¸ch cña bæn ®­êng, h·y ®Õn chç ta nhËn nhiÖm vô."},
				},
				["Th¸c B¹t Ho»ng "] =
				{
				{"Ng­êi cña bæn ®­êng ®Òu cã danh hiÖu, nÕu lµ thİch kh¸ch cña bæn ®­êng, h·y ®Õn chç ta nhËn nhiÖm vô; nÕu ch­a ph¶i lµ thİch kh¸ch, h·y ®Õn chç Xa Lu©n B¸ V­¬ng ®Ó nghe chØ dÉn. Thİch kh¸ch chİnh lµ trô cét cña bæn ®­êng, lµ nh÷ng cao thñ ®­îc r¶i ®Òu kh¾p thiªn h¹. "},
				{"Xem ra lÇn nµy ®· chiªu mé ®­îc kh«ng İt nh©n tµi, phñ Phông T­êng qu¶ lµ n¬i ngäa hæ tµng long, kh«ng biÕt cßn t×m ®­îc cao thñ nµo cã thÓ so tµi víi ta mét phen. GÇn ®©y thİch kh¸ch cña bæn ®­êng t¨ng lªn rÊt nhiÒu, tèt l¾m tèt l¾m. §em nhiÖm vô cña bæn ®­êng r¶i ®Òu ra kh¾p n¬i, còng lµ mét c¸ch lµm viÖc hiÖu qu¶."},
				},
				},
	[3] = {
				["Xa Lu©n B¸ V­¬ng"] =
				{
				{"Thİch kh¸ch còng lµ mËt th¸m cña bæn ®­êng, lµ lùc l­îng chİnh chuyªn thu thËp t×nh b¸o, dß la tin tøc, thñ tiªu nh÷ng kÎ g©y bÊt lîi cho bæn ®­êng. T×nh b¸o lÇn tr­íc vÒ Quang Minh ®Ønh còng lµ mét vİ dô. Nh­ng nh÷ng t×nh b¸o c¬ mËt th× vÉn ph¶i giao cho c¸c Phi Hé cña bæn ®­êng ®¶m nhiÖm. Së tr­êng cña Phi Hé lµ khai th¸c bİ mËt, th¨m dß qu©n t×nh, ¸m s¸t c¸c nh©n vËt ®Çu n·o v.v... V× lµ c¬ mËt, nªn ph¶i ®¶m b¶o t×nh b¸o vµ nhiÖm vô ®­îc hoµn thµnh tuyÖt ®èi chİnh x¸c. Khi nhËn nhiÖm vô bİ mËt ®Òu ph¶i cho biÕt danh hiÖu Phi Hé."},
				},
				["Th¸c B¹t Ho»ng "] =
				{
				{"Thİch kh¸ch còng lµ mËt th¸m cña bæn ®­êng, lµ lùc l­îng chİnh chuyªn thu thËp t×nh b¸o, dß la tin tøc, thñ tiªu nh÷ng kÎ g©y bÊt lîi cho bæn ®­êng. T×nh b¸o lÇn tr­íc vÒ Quang Minh ®Ønh còng lµ mét vİ dô. Nh­ng nh÷ng t×nh b¸o c¬ mËt th× vÉn ph¶i giao cho c¸c Phi Hé cña bæn ®­êng ®¶m nhiÖm. Së tr­êng cña Phi Hé lµ khai th¸c bİ mËt, th¨m dß qu©n t×nh, ¸m s¸t c¸c nh©n vËt ®Çu n·o v.v... V× lµ c¬ mËt, nªn ph¶i ®¶m b¶o t×nh b¸o vµ nhiÖm vô ®­îc hoµn thµnh tuyÖt ®èi chİnh x¸c. Khi nhËn nhiÖm vô bİ mËt ®Òu ph¶i cho biÕt danh hiÖu Phi Hé."},
				},
				},
	[4] = {
				["Xa Lu©n B¸ V­¬ng"] =
				{
				{"Hæ Dùc lµ lùc l­îng tinh nhuÖ cña bæn ®­êng. Tuy Phi Hé ®¶m nhËn chøc n¨ng dß th¸m tİnh b¸o, nh­ l¨ng mé TÇn Thñy Hoµng, b¶n ®å S¬n Hµ X· T¾c... ®Òu lµ c¬ mËt. Song nhiÖm vô cña Hæ Dùc l¹i lµ nh÷ng nhiÖm vô c¬ mËt liªn quan ®Õn sù tiÕn tho¸i cña bæn ®­êng, kh«ng nh÷ng ph¶i cã tuyÖt kü do th¸m cña Phi Hé, cßn ph¶i biÕt phèi hîp víi c¸c lùc l­îng kh¸c cña bæn ®­êng ®Ó hoµn thµnh nhiÖm vô. Kim Cang cña bæn ®­êng vµ T©y H¹ ph¸p v­¬ng ®Òu rÊt tin t­ëng Hæ Dùc, v× thÕ cÇn ph¶i cho biÕt danh hiÖu Hæ Dùc khi nhËn nhiÖm vô c¬ mËt."},
				},
				["Th¸c B¹t Ho»ng "] =
				{
				{"Hæ Dùc lµ l­îng lùc tinh nhuÖ cña bæn ®­êng. Tuy Phi Hé ®¶m nhËn chøc n¨ng dß th¸m tİnh b¸o, nh­ l¨ng mé TÇn Thñy Hoµng, b¶n ®å S¬n Hµ X· T¾c... ®Òu lµ c¬ mËt. Song c¸c nhiÖm vô cña Hæ Dùc l¹i lµ nh÷ng nhiÖm vô c¬ mËt liªn quan ®Õn sù tiÕn tho¸i cña bæn ®­êng, kh«ng nh÷ng ph¶i cã tuyÖt kü do th¸m cña Phi Hé, cßn ph¶i biÕt phèi hîp víi c¸c lùc l­îng kh¸c cña bæn ®­êng ®Ó hoµn thµnh nhiÖm vô. Kim Cang cña bæn ®­êng vµ T©y H¹ ph¸p v­¬ng ®Òu rÊt tin t­ëng Hæ Dùc, v× thÕ cÇn ph¶i cho biÕt danh hiÖu Hæ Dùc khi nhËn nhiÖm vô c¬ mËt."},
				},
				},
	[5] = {
				["Xa Lu©n B¸ V­¬ng"] =
				{
				{"Vò VÖ lµ c¸nh tay ®¾c lùc nhÊt cña ThËp §¹i Kim Cang. V­ît qua nh÷ng nhiÖm vô thö th¸ch lín nhá cña NhÊt PhÈm ®­êng, Vò VÖ cßn cÇn ph¶i cã lßng trung thµnh tuyÖt ®èi. NhiÖm vô cña Vò VÖ kh«ng nh÷ng liªn quan ®Õn bæn ®­êng, cßn liªn quan ®Õn quèc gia, kh«ng nh÷ng ph¶i ®­a bæn ®­êng ®i lªn mµ cµng ph¶i gióp qu©n ®éi T©y H¹ thªm v÷ng m¹nh. Tr¸ch nhiÖm cña Vò VÖ còng chİnh lµ tr¸ch nhiÖm víi T©y H¹."},
				},
				["Th¸c B¹t Ho»ng "] =
				{
				{"Ngò Hµnh trËn ngoµi viÖc trõng trŞ ph¶n ®å, cßn lµ n¬i tËp luyÖn cña Vò VÖ. Vò VÖ muèn th¨ng cÊp lªn Kim Cang ®Òu ph¶i tr¶i qua thö th¸ch cña Ngò Hµnh trËn. V× thÕ Ngò Hµnh trËn kh«ng tiÕp nhËn nh÷ng ng­êi d­íi cÊp Vò VÖ."},
				},
				},
	}

	i = random(1,getn(strTalk[nTitleIndex][nNpcName]))
	TalkEx("",strTalk[nTitleIndex][nNpcName][i]);
	repeat_add_xb_title();

end