
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ½ÌÓıÈÎÎñÊµÌå´¦ÀíÎÄ¼ş
-- Edited by peres
-- 2005/05/07 PM 19:55

-- ÑÌ»¨¡£ÄÇÒ»Ò¹µÄÑÌ»¨¡£
-- Ëı¼ÇµÃËûÔÚ´óÓêµÄÈËÈºÖĞ£¬Õ¾ÔÚËıµÄ±³ºóÓµ±§×¡Ëı¡£
-- ËûÎÂÅ¯µÄÆ¤·ô£¬ËûÊìÏ¤µÄÎ¶µÀ¡£ÑÌ»¨ÕÕÁÁËıµÄÑÛ¾¦¡£
-- Ò»ÇĞÎŞ¿ÉÍì»Ø¡­¡­

-- ======================================================

-- ½ÌÓıÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\teach\\teach_head.lua");

-- ½ÌÓıÈÎÎñ½±ÀøÎÄ¼ş
Include("\\script\\task\\teach\\teach_award.lua");

-- µÚÒ»´ÎÓëÒ°ÛÅ¶Ô»°
function task_000_00()
	local nNation = GetGlbValue(GLB_TSK_SERVER_ID)
	local nDate = tonumber(date("%y%m%d"))
--	if nNation ~= 89 then
--		Talk(1, "", "Giang hå ®ang dËy sãng, ta ph¶i nghØ ng¬i 1 tİ ®· !!!!!")
--		return 0
--	end
	
--	if nDate > 140406 then
--		Talk(1, "", "Giang hå ®ang dËy sãng, ta ph¶i nghØ ng¬i 1 tİ ®· !!!!!")
--		return 0
--	end
	
	local strMain = {
		"Hoan nghªnh ®Õn víi thÕ giíi <color=yellow>Vâ L©m 2<color>! Ta chuyªn h­íng dÉn <color=yellow>t©n thñ<color>! Cã muèn t×m hiÓu c¬ b¶n vÒ <color=yellow>trß ch¬i<color> vµ <color=yellow>gióp ®ì lµm nhiÖm vô<color> kh«ng?",
		"§a t¹ l·o tiÒn bèi!/task_000_okay", 
		"Ta ®Õn th¨m L·o tiÒn bèi th«i mµ!/task_000_01"
	}
	SetTask(1, 1);
	AddItem(2,0,505,1)
	SelectSay(strMain);

end;

-- Ñ¡ÔñÌıÒ°ÛÅ½²½â
function task_000_okay()

	local strMain = {

		"Ng­¬i muèn t×m hiÓu vÒ vÊn ®Ò g×?",
		"Thao t¸c c¬ b¶n/Teach_Basic",
		"T¨ng cÊp nh©n vËt/Teach_Level",
		"Ph©n phèi tiÒm n¨ng/Teach_Point",
		"Ph­¬ng ph¸p kiÕm tiÒn/Teach_Earn",
		"Gia nhËp m«n ph¸i/Teach_Faction",
		"HiÖn cã thÓ lµm /Teach_Something",
		"Ta ®· hiÓu råi/task_000_00"

	}

	SelectSay(strMain);

end;


-- ¿ªÊ¼×ö½ÌÑ§ÈÎÎñ
function task_000_01()

	local strMain = {
		"<color=yellow>Chñ tiÖm vò khİ, Chñ TiÖm Nam phôc, Chñ TiÖm N÷ phôc, Chñ Kim hoµn, Chñ D­îc ®iÕm, Chñ T¹p hãa<color> trong thµnh ®Òu lµ nh÷ng ng­êi hiÓu biÕt réng! H·y t×m hä häc hái!",
		"Ng­¬i thö ®Õn th¨m hä, biÕt ®©u sÏ nhËn ®­îc <color=yellow>VËt phÈm<color>. Nhí më <color=yellow>B¶n ®å nhá<color> ®i cho tiÖn!"
	}

	TE_Talk("task_000_02",strMain);

end;

-- ½ÓÁËÈÎÎñ£¬¸Ä±äÈÎÎñ±äÁ¿£º1
function task_000_02()
	SetTask(1, 1);
	TaskTip("§Õn gÆp Chñ TiÖm vò khİ");
end;

-- ÓëÎäÆ÷µêÀÏ°åµÄ¶Ô»°
function task_001_00()

	local strMain = {
		"Hoan nghªnh b»ng h÷u tham gia thÕ giíi Vâ L©m. <color=yellow>Vò khİ<color> cña ta tuy chØ cÊp 4 trë xuèng nh­ng còng lµ ®Ö nhÊt cña vïng nµy. Mua ®i! Ta sÏ h­íng dÉn cho c¸ch sö dông.",
		"PhiÒn tiÒn bèi chØ gi¸o!/task_001_01",
		"Kh«ng cÇn ®©u!/task_001_02"
	}
	SelectSay(strMain);

end;

-- ÌıÎäÆ÷µêÀÏ°å½²½â
function task_001_01()

	local strMain = {
		"Hµnh tÈu giang hå, cÇn ph¶i cã vò khİ ®Ó phßng th©n. Nh÷ng thø ®¬n gi¶n nh­ <color=yellow>Hé thñ<color>, <color=yellow>KiÕm<color>, <color=yellow>¸m khİ<color>, <color=yellow>C«n<color> kh«ng cÇn s­ phô h­íng dÉn, nh÷ng thø cßn l¹i nh­ ®ao, cÇm, bót, tr­îng ph¶i ®­îc h­íng dÉn.",
		"Vò khİ trªn ng­êi t­¬ng øng víi tõng ®¼ng cÊp, ng­êi ch¬i cã thÓ mua vò khİ th«ng th­êng ë thî rÌn, cßn nh÷ng lo¹i cao cÊp ph¶i tù t¹o hoÆc mua l¹i tõ ng­êi ch¬i kh¸c.",
		"Lóc tr­íc ta cã giao ®Êu víi cao thñ ph¸i tµ kiÕm ph¸i Thanh Thµnh, may ®­îc mét vŞ Vâ §ang ra tay cøu gióp, trªn tay «ng ta lµ thanh b¶o kiÕm ®­îc kh¶m ngäc, uy lùc kinh ng­êi. Nghe nãi ®©y lµ lo¹i kú th¹ch h¾c b¹ch cã thÓ kh¶m n¹m lªn vò khİ.",
		"NÕu ng­¬i gÆp c¬ duyªn cã ®­îc b¶o kiÕm ®ã th× viÖc hµnh tÈu giang hå xem ra rÊt nhÑ nhµng.",
		"Giê ng­¬i cã thÓ ®i gÆp <color=yellow>Chñ TiÖm Nam phôc<color>."
	}
	TE_Talk("task_001_02",strMain);

end;

-- ÌıÍê½²½â£¬¸Ä±äÈÎÎñ±äÁ¿£º2
function task_001_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ TiÖm vò khİ");
	if GetSex()==1 then
		TaskTip("§Õn gÆp Chñ TiÖm Nam phôc");
	else
		TaskTip("§Õn gÆp chñ TiÖm N÷ phôc");
	end;
end;

-- Óë·ş×°µêÄĞÀÏ°åµÄ¶Ô»°
function task_002_00_male()

	local strMain = {
		"Hoan nghªnh b»ng h÷u tham gia thÕ giíi Vâ L©m. TiÖm ta chuyªn b¸n trang phôc nam cÊp 4. Mua ®i. Mua ®i! Ta sÏ h­íng dÉn vÒ c¸ch sö dông <color=yellow>trang phôc<color>.",
		"PhiÒn tiÒn bèi chØ gi¸o!/task_002_01",
		"Kh«ng cÇn ®©u!/task_002_02"
	}
	SelectSay(strMain);
end;

-- Óë·ş×°µêÅ®ÀÏ°åµÄ¶Ô»°
function task_002_00_female()

	local strMain = {
		"Hoan nghªnh b»ng h÷u tham gia thÕ giíi Vâ L©m. TiÖm ta chuyªn b¸n trang phôc n÷ cÊp 4. Mua ®i. Mua ®i! Ta sÏ h­íng dÉn vÒ c¸ch sö dông <color=yellow>trang phôc<color>.",
		"PhiÒn tiÒn bèi chØ gi¸o!/task_002_01",
		"Kh«ng cÇn ®©u!/task_002_02"
	}
	SelectSay(strMain);
end;

-- Ìı·ş×°µêÀÏ°åµÄ½²½â
function task_002_01()

	local strMaleMain = {
		"Hµnh tÈu giang hå viÖc trang bŞ cho m×nh mét trang phôc lµ ®iÒu tÊt yÕu. trang phôc ë ®©y cã kh¨n ®Çu, th­îng y vµ h¹ y, chó ı c¸ch mÆc <color=yellow>th­îng y<color> do liªn quan ®Õn phßng thñ.",
		"Chç ta chØ b¸n c¸c lo¹i hé thñ th«ng th­êng nÕu muèn cã trang phôc tèt ph¶i t×m thî giái chÕ t¹o. Th­êng trang phôc tèt lµm ra kh«ng ®Ñp l¾m nh­ng l¹i rÊt hiÖu qu¶ trong viÖc phßng thñ. V× vËy nh÷ng ng­êi cã tiÒn th­êng kho¸c thªm <color=yellow>Ngo¹i trang<color>.",
		"Chç ta chØ b¸n Néi trang. B»ng h÷u cã thÓ ®Õn n¬i kh¸c t×m Ngo¹i trang cho m×nh.",
		"§©y cã mãn quµ nhá. Sau nhí chiÕu cè bæn tiÖm nhĞ! Giê cã thÓ ®i gÆp <color=yellow>Chñ Kim hoµn<color>."
	}

	local strFemaleMain = {
		"Hµnh tÈu giang hå viÖc trang bŞ cho m×nh mét trang phôc lµ ®iÒu tÊt yÕu. trang phôc ë ®©y cã kh¨n ®Çu, th­îng y vµ h¹ y, chó ı c¸ch mÆc <color=yellow>th­îng y<color> do liªn quan ®Õn phßng thñ.",
		"Chç ta chØ b¸n c¸c lo¹i hé thñ th«ng th­êng nÕu muèn cã trang phôc tèt ph¶i t×m thî giái chÕ t¹o. Th­êng trang phôc tèt lµm ra kh«ng ®Ñp l¾m nh­ng l¹i rÊt hiÖu qu¶ trong viÖc phßng thñ. V× vËy nh÷ng ng­êi cã tiÒn th­êng kho¸c thªm <color=yellow>Ngo¹i trang<color>.",
		"Chç ta chØ b¸n gi¸p Néi trang. B»ng h÷u cã thÓ ®Õn n¬i kh¸c t×m Ngo¹i trang cho m×nh.",
		"§©y cã mãn quµ nhá. Sau nµy nhí chiÕu cè bæn tiÖm nhĞ! Giê h·y ®i gÆp <color=yellow>Chñ Kim hoµn<color>!"
	}

	if GetSex()==1 then
		TE_Talk("task_002_02",strMaleMain);
	else
		TE_Talk("task_002_02",strFemaleMain);
	end;
	
end;

-- Óë·ş×°µêÀÏ°å¶Ô»°½áÊøºó£¬¸Ä±äÈÎÎñ±äÁ¿£º3
function task_002_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ tiÖm trang phôc");
	TaskTip("§Õn gÆp Chñ Kim hoµn");
end;

-- ÓëÊÎÆ·µêÀÏ°åµÄ¶Ô»°
function task_003_00()

local strMain = {
	"Hoan nghªnh b»ng h÷u tham gia thÕ giíi Vâ L©m. ë ®©y chuyªn b¸n trang søc cÊp 2 vµ s½n sµng h­íng dÉn vÒ c¸ch sö dông <color=yellow>trang søc<color>.",
	"Mong tiÒn bèi chØ gi¸o!/task_003_01",
	"Kh«ng cÇn ®©u!/task_003_02"
}
SelectSay(strMain);

end;

-- ÌıÊÎÆ·µêµÄÀÏ°å½²½â
function task_003_01()

	local strMain = {
		"<color=yellow>Nam cao thñ<color> th­êng mang Ngäc béi, Hé phï, <color=yellow>N÷ kú hiÖp<color> mang h­¬ng nang, H¹ng liªn. Cßn nhÉn c¶ nam n÷ ®Òu ®eo ®­îc.",
		"Bæn tiÖm bu«n b¸n nhá kh«ng cã  b¶o vËt quı! H·y ra ngoµi rõng thö vËn may xem!"
	}
	TE_Talk("task_003_02",strMain);
end;

-- ÌıÍêÊÎÆ·µêÀÏ°å½²½â·¢½±Àø£¬¸Ä±äÈÎÎñ±äÁ¿£º4
function task_003_02()

	local strMain = {
		"Cã <color=yellow>chót quµ män<color>! Sau nµy nhí chiÕu cè bæn tiÖm nhĞ! Giê cã thÓ t×m <color=yellow>Chñ d­îc ®iÕm <color>!"
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ Kim hoµn");
	TaskTip("§Õn gÆp Chñ D­îc ®iÕm");
	TE_Talk("",strMain);

end;

-- ÓëÒ©µêÀÏ°åµÄ¶Ô»°
function task_004_00()

	local strMain = {
		"Hoan nghªnh b»ng h÷u tham gia thÕ giíi Vâ L©m. ë ®©y chuyªn b¸n d­îc liÖu cÊp 2 vµ s½n sµng h­íng dÉn vÒ c¸ch sö dông <color=yellow>d­îc liÖu<color>.",
		"PhiÒn tiÒn bèi chØ gi¸o!/task_004_01",
		"Kh«ng cÇn ®©u!/task_004_02"
	}
	SelectSay(strMain);

end;

-- ÌıÒ©µêÀÏ°åµÄ½²½â
function task_004_01()

	local strMain = {
		"Hµnh tÈu giang hå ®¬n d­îc mang theo phßng th©n lµ ®iÒu tÊt yÕu, gÇn ®©y vâ l©m ®¹i lo¹n mét sè linh d­îc quı ph¶i tù t¹o hoÆc nhê cao nh©n gióp ®ì.",
		"NÕu kh«ng cã ®¬n d­îc ta chØ cã thÓ sö dông <color=yellow>d­îc th¶o<color>. Tuy c«ng hiÖu kh«ng cao nh­ng gióp İch cho nh÷ng ai míi ®Æt ch©n vµo giang hå."
	}
	TE_Talk("task_004_02",strMain);

end;

-- ÌıÍêÒ©µêÀÏ°å½²½â»òÕßÖ±½ÓÌøµ½ÕâÀï£¬¸Ä±äÈÎÎñ±äÁ¿£º5
function task_004_02()

	local strMain = {
		"Ta cã 20 b×nh <color=yellow>Kim S¸ng t¸n<color> lµm quµ! Giê cã thÓ gÆp <color=yellow>Chñ T¹p hãa<color>."
	}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ D­îc ®iÕm");
	TaskTip("§Õn gÆp Chñ T¹p hãa");
	TE_Talk("",strMain);

end;

-- ÓëÔÓ»õµêÀÏ°åµÄ¶Ô»°
function task_005_00()

	local strMain = {
		"Hoan nghªnh b»ng h÷u tham gia thÕ giíi Vâ L©m. ë ®©y chuyªn b¸n ®ñ c¸c lo¹i <color=yellow>vËt phÈm<color> vµ cã h­íng dÉn kÌm theo, ng­¬i cÇn g× nµo?",
		"PhiÒn tiÒn bèi chØ gi¸o!/task_005_01",
		"Kh«ng cÇn ®©u!/task_005_02"
	}
	SelectSay(strMain);

end;

-- ÌıÔÓ»õµêÀÏ°åµÄ½²½â
function task_005_01()

	local strMain = {
		"VËt phÈm trªn giang hå mu«n h×nh v¹n tr¹ng, cÇn hiÓu râ ®Ó vÒ sau sö dông! C¸c lo¹i {Chøc CÈm} vµ {Da thó} cã thÓ chÕ t¹o Hé gi¸p. {C¸c m¶nh kim lo¹i, B¶o Th¹ch} cã thÓ chÕ t¹oVò khİ.",
		"Ngò cèc dïng chÕ t¹o l­¬ng thùc, chu sa vµ linh huyÕt dïng luyÖn linh phï, ngoµi ra cßn mét sè vËt phÈm thÇn bİ.",
		"Nghe nãi <color=yellow>Th­¬ng Nh©n thÇn bİ<color> ®ang thu thËp kú tr©n dŞ b¶o, ng­¬i thñ ®Õn ®ã mét chuyÕn xem sao."
	}
	TE_Talk("task_005_02",strMain);

end;

-- ÌıÍêÔÓ»õµêÀÏ°åµÄ½²½âºó»òÕßÖ±½ÓÌøµ½ÕâÀï£¬¸Ä±äÈÎÎñ±äÁ¿£º6
function task_005_02()

	local strMain = {
		"Bæn tiÖm bu«n b¸n nhá, chØ cã 2 tÊm <color=red>Gi¸m ®Şnh phï<color> nµy tÆng b¹n trÎ! Sau nµy ®¸nh qu¸i r¬i <color=yellow>trang bŞ<color>, chØ cÇn dïng chuét ph¶i nhÊn vµo Gi¸m ®Şnh phï ®­a h×nh chuét tíi trang bŞ lµ cã thÓ biÕt ®­îc thuéc tİnh.",
		"Xem b»ng h÷u còng mÖt råi! H·y vÒ gÆp <color=yellow>D· TÈu<color> xem cã thØnh gi¸o ®­îc g× n÷a kh«ng!"
	}
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ T¹p hãa");
	TaskTip("Quay vÒ gÆp D· TÈu");
	TE_Talk("",strMain);

end;

-- »ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_006_00()

	local strMain = {
		"Thu ho¹ch ®­îc g× råi?",
		"C¸c chñ tiÖm tÆng rÊt nhiÒu ®å, vui qu¸!",
		"Haha! Cßn nhiÒu ®iÒu kinh ng¹c n÷a k×a! §îi ng­¬i ®¹t <color=yellow>cÊp 4<color> l¹i ®Õn t×m ta. §ñ ®iÓm kinh nghiÖm nhí nhÊn <color=yellow><F3><color> më giao diÖn thuéc tİnh <color=yellow>t¨ng cÊp<color> cho nh©n vËt. NÕu bŞ th­¬ng vÒ chç ta ch÷a trŞ miÔn phİ.",
	}
	TE_Talk("task_006_01",strMain);

end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º7
function task_006_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("§Õn gÆp D· TÈu");
	TaskTip("Ra ngoµi thµnh luyÖn c«ng, ®Õn cÊp 4 quay l¹i gÆp D· TÈu.");
end;

-- µ½ÁË 4 ¼¶Ö®ºóÓëÒ°ÛÅµÄ¶Ô»°
function task_007_00()

	local strMain = {
		"Ng­¬i tiÕn bé nhanh vËy sao?",
		"Kh«ng! Qu¸i bªn ngoµi m¹nh l¾m!",
		"<color=yellow>VÖ binh thµnh m«n<color> vµ <color=yellow>Vâ s­<color> ngoµi thµnh rÊt am hiÓu c¸ch chiÕn ®Êu vµ ph©n bè qu¸i, h·y ®Õn ®ã thØnh gi¸o ®i."
	}
	TE_Talk("task_007_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º8
function task_007_01()
	TE_SetTeachAdd();
	TaskTip("T×m vÖ binh thµnh m«n hái khu vùc luyÖn c«ng.");
end;

-- Óë³ÇÃÅÎÀ±øµÄ¶Ô»°
function task_008_00()

	local strMain = {
		"Cã thÓ chØ cho tiÓu ®iÖt ®©y chç <color=yellow>luyÖn c«ng<color> ®­îc kh«ng?",
		"Ng­¬i t×m ®óng ng­êi råi!",
		"Qu¸i ®­îc ph©n bè bªn ngoµi thµnh hoÆc gÇn m«n ph¸i, cµng xa thµnh thŞ ®¼ng cÊp qu¸i cµng m¹nh, qu¸i m¹nh nhÊt kho¶ng <color=yellow>cÊp 50<color>.",
		"Kh«ng nªn vµo c¸c s¬n ®éng v× n¬i ®ã qu¸i rÊt m¹nh.",
		"Lµm sao ®Ó biÕt qu¸i n¬i ®ã nguy hiÓm?",
	}
	TE_Talk("task_008_00_01",strMain);

end;


function task_008_00_01()

	local strMain = {
		"§Ó nhËn biÕt qu¸i ta nh×n <color=yellow>mµu s¾c<color> tªn cña chóng, <color=yellow>mµu tr¾ng<color> chØ qu¸i cÊp thÊp; <color=yellow>mµu ®á<color> chØ qu¸i cÊp cao; <color=yellow>mµu xanh<color> chØ thñ lÜnh cÊp nhá; <color=yellow>mµu vµng kim<color> chØ thñ lÜnh cÊp cao, cÇn ph¶i ®Ò phßng!",
		"May qu¸! Lóc n·y ta ®Şnh giÕt mÊy con qu¸i ch÷ ®á.",
		"Haha! T©n thñ nh­ ng­¬i chØ cã thÓ ®¸nh qu¸i xung quanh thµnh th«i!",
		"§¹i ca cßn g× chØ gi¸o kh«ng?",
		"Ta biÕt râ qu¸i ph©n bè ë ®©u, nÕu cÇn th× ®Õn ®©y <color=yellow>t×m hiÓu<color> n¬i luyÖn c«ng thİch hîp. Cßn vÒ chiÕn ®Êu th× t×m vâ s­ thØnh gi¸o.",
		"HiÓu råi! §a t¹ ®¹i ca! Ta ®i t×m <color=yellow>Vâ s­<color> ®©y!"
	}
	TE_Talk("task_008_01",strMain);

end;

-- ÓëÎÀ±ø¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º9
function task_008_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("VÖ binh thµnh m«n");
	TaskTip("T×m vâ s­ häc c¸ch chiÕn ®Êu");
end;

-- ÓëÎäÊ¦¶Ô»°
function task_009_00()

	local strMain = {
		"D· TÈu b¶o ta ®Õn t×m tiÒn bèi häc <color=yellow>c¸ch chiÕn ®Êu<color>.",
		"L·o phu ®©y rÊt thİch h­íng dÉn hËu bèi nh­ng tr­íc tiªn ph¶i hiÓu <color=yellow>kü n¨ng chiÕn ®Êu<color>. Ng­¬i ph©n biÖt ®­îc c«ng kİch tr¸i vµ c«ng kİch ph¶i kh«ng?",
		"Kh«ng hiÓu l¾m!",
		"Bªn tr¸i chØ ®¸nh VËt lı, bªn ph¶i lµ ®¸nh vâ c«ng. Cã thÓ sö dông <color=yellow>vâ c«ng bªn ph¶i<color> ®¸nh qu¸i. Vâ c«ng m«n ph¸i, mËt tŞch hoÆc theo ta häc ®Òu sö dông ®­îc.",
		"Kh«ng ngê bªn ph¶i h÷u hiÖu ®Õn nh­ vËy?",
		"Ng­¬i muèn nhanh chãng h¹ ®­îc qu¸i cÇn ph¶i biÕt <color=yellow>thuéc tİnh cña chóng<color>.",
		"TiÓu bèi cã nghe vÖ binh nãi qua vÒ ®¼ng cÊp qu¸i, mµu s¾c vµ khu vùc ph©n bè cña chóng.",
	}	
	TE_Talk("task_009_00_01",strMain);
end;

function task_009_00_01()

	local strMain = {
		"Trong thùc tiÔn nh­ vËy vÉn ch­a ®ñ, nãi vÒ <color=yellow>c¸ch ®¸nh<color> ®a sè qu¸i ®Òu cã c¸c d¹ng nh­ tÊn c«ng bŞ ®éng, tÊn c«ng chñ ®éng, tÊn c«ng nh×n râ, bao v©y, ®ét kİch. ChØ cÇn n¾m râ lµ cã thÓ ®èi phã chóng.",
		"TiÒn bèi h­íng dÉn râ h¬n ®­îc kh«ng?",
		"<color=yellow>TÊn c«ng bŞ ®éng<color> chØ qu¸i tù ®éng ®¸nh tr¶; <color=yellow>TÊn c«ng chñ ®éng<color> chØ qu¸i tù ®éng tÊn c«ng; <color=yellow>TÊn c«ng nh×n râ<color> chØ qu¸i nh¹y bĞn quan s¸t ®­îc ®èi ph­¬ng xuÊt chiªu; <color=yellow>Bao v©y<color> chØ qu¸i hç trî cho ®ång ®éi; <color=yellow>®ét kİch<color> chØ qu¸i l­îm vËt phÈm cña ng­êi ch¬i, ph¶i ®¸nh b¹i chóng míi lÊy l¹i ®­îc vËt phÈm.",
		"<color=yellow>Thuéc tİnh c«ng kİch<color> cña chóng th× sao?",	
	}
	TE_Talk("task_009_01",strMain);
end;

-- ÓëÎäÊ¦¶Ô»°µÄÀ©Õ¹
function task_009_01()

	local strMain = {
		"<color=yellow>Thuéc tİnh c«ng kİch<color> chØ tè chÊt qu¸i cã thÓ thay ®æi c«ng phßng, chñ yÕu kim, méc, thñy, háa, thæ, ©m, v«. Qu¸i cÊp thÊp kh«ng mang thuéc tİnh, qu¸i tõ cÊp 20 míi cã <color=yellow>thuéc tİnh ngò hµnh<color>, chóng thay ®æi theo tİnh t­¬ng sinh t­¬ng kh¾c ngò hµnh.",
			"VËy ta ph¶i chän trang bŞ ngò hµnh, cßn <color=yellow>thuéc tİnh ©m<color> th× sao?",
		"Tõ khi <color=yellow>m¶nh S¬n Hµ X· T¾c<color> tan r·, mét lo¹i qu¸i míi mang thuéc tİnh ©m xuÊt hiÖn, chóng kh«ng sî c«ng kİch th­êng, vò khİ ngò hµnh hay vâ c«ng ®¬n gi¶n kh«ng thÓ ®¶ th­¬ng chóng.",
		"ThÊt b¹i trong chiÕn ®Êu trõng ph¹t ra sao? Cã tö vong kh«ng?",
	}
	TE_Talk("task_009_02",strMain);
end;

-- ÓëÎäÊ¦¶Ô»°µÄÀ©Õ¹
function task_009_02()

	local strMain = {
		"Trong trß ch¬i kh«ng cã tö vong, nÕu ®¸nh thua qu¸i, chØ mÊt 1% kinh nghiÖm hiÖn t¹i, 5% ng©n l­îng vµ mét İt danh väng, kh«ng may cã thÓ bŞ <color=yellow>ngo¹i th­¬ng<color> hoÆc <color=yellow>néi th­¬ng<color>. ChiÕn ®Êu thÊt b¹i ng­¬i cã thÓ chän vÒ thµnh hoÆc ®îi cao thñ Nga My phËt gia ®Õn cøu, nÕu cøu sèng chØ tæn thÊt ng©n l­îng vµ danh väng mµ kh«ng tæn thÊt kinh nghiÖm, néi th­¬ng.",
		"TiÒn bèi cã thÓ chØ vµi chiªu cho tiÓu bèi ®­îc kh«ng?",
		"Ta cã mãn vâ <color=yellow>khinh c«ng<color> ®Şnh d¹y ng­¬i, nh­ng l¹i cã viÖc gÊp råi, th«i ®Ó khi kh¸c vËy.",
		"§a t¹ tiÒn bèi! Ta ph¶i quay vÒ gÆp <color=yellow>D· TÈu<color>."
	}
	TE_Talk("task_009_03",strMain);
end;

-- ÓëÎäÊ¦¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º10
function task_009_03()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Vâ s­");
	LearnSkill(20)--Ö±½ÓÑ§»áÇá¹¦
	TaskTip("C¸c h¹ ®· lÜnh héi ®­îc khinh c«ng, cã thÓ quay vÒ gÆp D· TÈu")
end;

-- »ØÈ¥ÓëÒ°ÛÅ¶Ô»°
function task_010_00()

	local strMain = {
		"Ng­¬i ®· biÕt c¸ch chiÕn ®Êu råi µ?",
		"Nghe vâ s­ vµ vÖ binh chØ gi¸o ®· hiÓu râ h¬n mét chót. §a t¹ tiÒn bèi!",
		"§Õn cÊp 6 nhí quay l¹i t×m ta. Sao ng­¬i mang theo nhiÒu ®å vËy? §Õn t×m <color=yellow>Thñ khè<color> xem sao!"
	}
	TE_Talk("task_010_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º11
function task_010_01()
	TE_SetTeachAdd();
	TaskTip("§Õn cÊp 6 quay l¹i t×m D· TÈu.");
end;

-- µÈ¼¶µ½ÁË 6 ¼¶Ê±»ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_011_00()

	local strMain = {
		"ThÕ nµo råi?",
		"Ch¼ng cã g× thó vŞ, tuy häc hái ®­îc rÊt nhiÒu tõ mÊy chñ tiÖm nh­ng hä ®Òu bËn. NÕu cã ng­êi <color=yellow>nãi chuyÖn<color> th× hay biÕt mÊy!",
		"Kh«ng vui lµ ph¶i råi! Ng­¬i ph¶i th­êng xuyªn nãi chuyÖn víi hä.",
		"ThÕ nµy vËy! H·y t×m <color=yellow>Chñ töu lÇu<color> vµ <color=yellow>Tiªu s­<color>, kh«ng chõng hä sÏ chØ d¹y ®­îc g× thªm!",
		"Hay qu¸! VËy tiÓu bèi ®i t×m <color=yellow>Chñ töu lÇu<color> ®©y!"
	}
	TE_Talk("task_011_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º12
function task_011_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Chñ töu lÇu");
	TaskTip("T×m chñ töu lÇu häc c¸ch giao l­u.");
end;

-- Óë¾ÆÂ¥ÀÏ°åµÄ¶Ô»°
function task_012_00()
	local strMain = {
		"TiÒn bèi cã thÓ chØ cho c¸ch <color=yellow>giao l­u<color> ®­îc kh«ng?",
		"§¬n gi¶n th«i! Trong trß ch¬i muèn ®èi tho¹i víi ai chØ cÇn nhÊn phİm <color=yellow><Ctrl><color> kÕt hîp víi chuét ph¶i lªn ®èi ph­¬ng chän dßng thİch hîp lµ ®­îc.",
		"<color=yellow>T×m hiÓu<color>: Xem th«ng tin ®èi ph­¬ng; <color=yellow>T¸n gÉu<color>: Chat mËt víi ®èi ph­¬ng; <color=yellow>Theo sau<color>: §i theo mét ng­êi nµo ®ã; <color=yellow>Giao dŞch<color>: Mêi ng­êi ch¬i kh¸c giao dŞch; <color=yellow>Tæ ®éi<color>: Mêi ng­êi ch¬i cïng tæ ®éi.",
		"Ng­êi ch¬i kh«ng n»m trong ph¹m vi th× giao l­u b»ng c¸ch nµo?",
	}
	TE_Talk("task_012_00_01",strMain);
end;


function task_012_00_01()
	local strMain = {
		"Khi muèn t¸n gÉu, nhÊn <color=yellow><Enter><color> hoÆc chän <color=yellow>TÇn sè t¸n gÉu <color>, nhËp tªn ng­êi ch¬i vµ néi dung muèn göi ®i, nhÊn <Enter> lµ ®­îc.",
		"TÇn sè t¸n gÉu lµ sao?",
		"Cã nhiÒu tÇn sè ®Ó t¸n gÉu. <color=yellow>TÇn sè phô cËn<color> ng­êi ch¬i xung quanh nh×n thÊy. <color=yellow>TÇn sè c«ng céng<color> ng­êi ch¬i toµn server nh×n thÊy. <color=yellow>TÇn sè hÖ thèng<color> hiÓn thŞ th«ng b¸o cña hÖ thèng.",
		"<color=yellow>TÇn sè ®éi ngò<color> chØ trong ®éi míi thÊy; <color=yellow>TÇn sè M«n ph¸i<color> chØ thuéc m«n ph¸i míi thÊy; <color=yellow>BÇn sè bang ph¸i<color> chØ ng­êi trong bang míi thÊy.",
		"Sao cã lóc chän tÇn sè råi vÉn kh«ng t¸n gÉu ®­îc?",
	}
	TE_Talk("task_012_01",strMain);
end;

-- Óë¾ÆÂ¥ÀÏ°åµÄ¶Ô»°À©Õ¹
function task_012_01()

	local strMain = {
		"§Ó ®¶m b¶o cho chÊt l­îng t¸n gÉu, mçi tÇn sè ®Òu cã h¹n chÕ riªng. TÇn sè m«n ph¸i cÇn ng­êi ch¬i ph¶i gia nhËp m«n ph¸i, c¸ch nhau 1 phót. TÇn sè c«ng céng ®ßi hái ng­êi ch¬i trªn cÊp 30, c¸ch nhau 3 phót. TÇn sè bŞ h¹n chÕ sÏ hiÖn mµu ®á rÊt dÔ nh×n thÊy.",
		"Ta hiÓu råi!",
		"Muèn kÕt giao h¶o h÷u nªn t×m <color=yellow>Tiªu s­<color>, ng­êi nµy cã nhiÒu b»ng h÷u, nhÊt ®Şnh sÏ gióp ®­îc ng­¬i!",
		"§a t¹ tiÒn bèi! Ta ®i t×m <color=yellow>Tiªu s­<color> ®©y!"
	}
	TE_Talk("task_012_02",strMain);
end;

-- Óë¾ÆÂ¥ÀÏ°å¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º13
function task_012_02()
	TE_SetTeachAdd();
	TaskTip("T×m tiªu s­ häc c¸ch kÕt giao b¹n h÷u.");
end;

-- ÓëïÚÊ¦µÄ¶Ô»°
function task_013_00()

	local strMain = {
		"Xin tiÒn bèi chØ dÉn cho nh÷ng kinh nghiÖm <color=yellow>KÕt giao b¹n h÷u<color>!",
		"Qu¸ khen! §¬n gi¶n th«i muèn kÕt b»ng h÷u víi ai nhÊn <color=yellow><ctrl><color> kÕt hîp chuét ph¶i nhÊp lªn ng­êi ®èi ph­¬ng chän <color=yellow>h¶o h÷u<color>, hÖ thèng tù ®éng xin phĞp ng­êi ch¬i ®ã. NÕu ®ång ı tªn ng­êi ®ã lËp tøc hiÖn trong danh s¸ch h¶o h÷u. VÒ sau chØ cÇn nhÊn <color=yellow><F6><color> lµ biÕt ®­îc hä cã online hay kh«ng.",
		"Ta nghe cã ng­êi nãi vÒ ®é th©n thiÖn, tiÒn bèi cã thÓ nãi râ ®­îc kh«ng?",
	}
	TE_Talk("task_013_00_01",strMain);
end;

function task_013_00_01()
	local strMain = {
		"Ng­êi ch¬i sau khi trë thµnh h¶o h÷u sÏ cã thªm <color=yellow>®iÓm th©n thiÖn<color>. Ng­êi ch¬i b×nh th­êng tæ ®éi ®¸nh qu¸i, t¸n gÉu còng ®­îc tİnh ®iÓm th©n thiÖn, mét sè vËt phÈm ®Æc biÖt nh­ hoa hång còng gióp t¨ng ®iÓm th©n thiÖn. NÕu trªn 1000 ®iÓm th©n thiÖn cã thÓ <color=yellow>KÕt NghÜa Kim Lan<color>, trªn 1500 ®iÓm, hai ng­êi kh¸c giíi cã thÓ ®Õn C« ®¶o t×m NguyÖt L·o kÕt thµnh <color=yellow>phu thª<color>.",
		"H¶o h÷u, kim lan hoÆc phu thª b×nh th­êng cïng tæ ®éi luyÖn c«ng sÏ ®­îc tİnh thªm kinh nghiÖm.",
		"Th¶o nµo gÇn ®©y cã nhiÒu ng­êi xin ®­îc tæ ®éi.",
		"R¶nh rçi nªn ®i gÆp <color=yellow>Vò N­¬ng<color>! B©y giê cã thÓ quay vÒ gÆp D· TÈu.",
		"§a t¹! Ta ®i t×m <color=yellow>D· TÈu<color> ®©y!"
	}
	TE_Talk("task_013_01",strMain);
end;

-- ÓëïÚÊ¦¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º14
function task_013_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("Tiªu s­");
	TaskTip("Quay vÒ gÆp D· TÈu");
end;

-- »ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_014_00()

	local strMain = {
		"HiÓu c¸ch giao l­u råi ph¶i kh«ng?",
		"HiÓu råi! Hay qu¸!",
		"Giê h·y ®i mêi mét ng­êi b¹n theo ng­¬i vÒ ®©y, sÏ cã <color=yellow>LÔ vËt<color> cho ng­¬i! NÕu kh«ng t×m ®­îc cã thÓ tù lËp tæ ®éi råi mêi b¹n h÷u vÒ, nh­ng  <color=yellow>lÔ vËt<color> sÏ kh«ng tèt l¾m!"
	}
	TE_Talk("task_014_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°ºó¸Ä±äÈÎÎñ±äÁ¿£º15
function task_014_01()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("trao ®æi nhiÖm vô víi ng­êi kh¸c");
	TaskTip("T×m mét ng­êi b¹n hoÆc tù tæ ®éi t×m D· TÈu");
end;



-- Íæ¼ÒÔÙ´Î´øÅóÓÑÀ´ÓëÒ°ÛÅ¶Ô»°
-- ´«Èë²ÎÊı£º1 ÎªÒÑ¾­×é¶Ó  2 Îª»¹Ã»ÓĞ×é¶Ó  3 ÎªÑ¡²»ÖªµÀÔõÃ´×é¶Ô  4 ÎªÑ¡»¹Ã»ÓĞ×é¶Ó
function task_015_check(nState)
	local strMain = {
		"Cã mãn quµ nhá tÆng c¸c ng­¬i, hy väng hai ng­êi sÏ lµ h¶o h÷u tèt cña nhau.",
		"Muèn g¹t ta ­? <color=yellow>h¶o h÷u<color> cña ng­¬i ®©u?",
		"NhÊn <color=yellow>tæ ®éi<color>, mêi ng­êi kh¸c gia nhËp tæ ®éi sau ®ã ®Õn t×m ta.",
		"NhiÒu ng­êi ®Õn t×m ta råi, ng­¬i cßn kh«ng nhanh ch©n!",
		"Hy väng ng­¬i t×m ®­îc ng­êi b¹n thİch hîp.",
		"NÕu kh«ng t×m ®­îc h¶o h÷u th× cø tæ ®éi víi ai ®ã råi ®Õn gÆp ta!"
	
	
	}
	
	if (nState==1) then
		Talk(1,"task_015_01",strMain[1]);
	elseif (nState==2) then
		Talk(1,"",strMain[2]);
	elseif (nState==3) then
		Talk(1,"",strMain[3]);
	elseif (nState==4) then
		Talk(1,"",strMain[4]);
	elseif (nState==5) then
		Talk(1,"task_015_01",strMain[5]);
	elseif (nState==6) then
		Talk(1,"",strMain[6]);
	end
	
	return
	
end;

-- ´øÁìÁËÅóÓÑÀ´Ö®ºó¸Ä±äÈÎÎñ±äÁ¿£º16
function task_015_01()

local strMain = {
	"§Õn cÊp 8 nhí quay l¹i nhĞ!"
}

	TE_SetTeachAdd();
	GivePlayerAward_Teach("NhiÖm vô kÕt giao h¶o h÷u");
	TaskTip("NhiÖm vô hoµn thµnh ®Õn cÊp 8 quay l¹i t×m D· TÈu!");
	TE_Talk("",strMain);
end;

-- µ½ÁË 8 ¼¶Ö®ºóºÍÒ°ÛÅµÄ¶Ô»°
function task_016_00()

	local strMain = {
		"Nhanh thËt! ChØ cßn 2 cÊp n÷a lµ b¹n trÎ cã thÓ gia nhËp m«n ph¸i råi!",
		"Còng nhê tiÒn bèi h­íng dÉn tËn t×nh.",
		"§õng kh¸ch s¸o, nhiÖm vô cña ta lµ h­íng dÉn T©n thñ mµ! Ng­¬i mau ®Õn c¸c m«n ph¸i t×m hiÓu nĞt <color=yellow>®Æc s¾c<color> ë ®ã.",
		"Nh­ng tiÓu bèi cßn ch­a biÕt ph¶i b¾t ®Çu tõ ®©u!",
		"Trong mçi thµnh thŞ ®Òu cã <color=yellow>Sø gi¶ m«n ph¸i<color>, h·y ®Õn ®ã thØnh gi¸o! LÇn tr­íc <color=yellow>B¸ch HiÓu Sinh<color> cã hái ta <color=yellow>6 c©u hái<color>, chuyÕn nµy trë vÒ gióp ta gi¶i ®¸p ®­îc kh«ng?"
	}

	TE_Talk("task_016_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º17
function task_016_01()
	TE_SetTeachAdd();
	TaskTip("T×m hiÓu ®Æc s¾c m«n ph¸i vÒ tr¶ lêi 6 c©u hái cña D· TÈu")
end;

-- ÔÙ´Î»ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_017_00()
	Say("Ng­¬i hiÓu hÕt ®Æc s¾c cña c¸c m«n ph¸i ch­a?",2,"HiÓu råi!/Teach_Qustion_001","Ch­a hiÓu l¾m!/task_exit");
	return
end;

-- ÍêÈ«ÕıÈ·µÄ»Ø´ğÎÊÌâºó
function task_017_01()

	local strMain = {
		"Kh¸ l¾m! Mang ®¸p ¸n nµy ®Õn gÆp <color=yellow>B¸ch HiÓu Sinh<color> ®i!"
	}
	TE_Talk("task_017_02",strMain);
end;

-- ¸Ä±äÈÎÎñ±äÁ¿£º18
function task_017_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("HiÓu vÒ c¸c m«n ph¸i");
	TaskTip("§em ®¸p ¸n nãi cho B¸ch HiÓu Sinh");
end;

-- Óë°ÙÏşÉúµÄ¶Ô»°
function task_018_00()

	local strMain = {
		"Theo B¸ch tiªn sinh ®¸p ¸n nh­ vËy ®óng kh«ng?",
		"§óng råi! Ng­¬i biÕt g× vÒ sÜ, hiÖp, Èn tam ®¹i <color=yellow>l­u ph¸i<color>?",
		"Nhê tiªn sinh chØ gi¸o!",
		"<color=green>B¸ch HiÓu Sinh<color>: Giang hå cã thËp ®¹i ph¸i ph©n biÖt lµ ThiÕu L©m, Vâ §ang, Nga My, C¸i Bang, §­êng M«n, Minh Gi¸o, C«n L«n, Ngò §éc, Thóy Yªn vµ Thiªn Ba D­¬ng phñ, nh­ng hiÖn cã 9 m«n ph¸i thu nhËn ®Ö tö lµ ThiÕu L©m, Vâ §ang, Nga My, C¸i Bang, §­êng M«n, Ngò §éc, Thiªn Ba D­¬ng Phñ, C«n L«n, Thóy Yªn.",
		"<color=green>B¸ch HiÓu Sinh<color>: ThiÕu L©m cã 3 h­íng gåm ThiÒn T«ng, Vâ T«ng vµ Tôc gia; Vâ §ang cã Tôc gia vµ §¹o gia; Nga My cã Tôc gia vµ PhËt gia; C¸i Bang cã TŞnh Y vµ ¤ Y; §­êng M«n cã mét h­íng; Thiªn Ba D­¬ng Phñ cã Th­¬ng kş vµ Cung kş; Ngò §éc cã Cæ S­ vµ HiÖp §éc; C«n L«n cã Thiªn S­; Thóy Yªn cã Vò N÷ vµ Linh N÷. Nh­ng bÊt cø c¸c m«n ph¸i cung cÊp mÊy h­íng tu luyÖn, mçi ng­êi chØ ®­îc chän mét h­íng tu hµnh.",
		"<color=green>B¸ch HiÓu Sinh<color>: 17 h­íng chØ chän ®­îc 1 th× tiÕc nhØ!",
		"<color=green>B¸ch HiÓu Sinh<color>: V× vËy míi cã l­u ph¸i. 17 h­íng hay 20 h­íng chung quy còng lµ sÜ , hiÖp, Èn tam ®¹i l­u ph¸i. NÕu c¸c h¹ hiÓu ®iÒu nµy th× sÏ kh«ng nghi hoÆc råi.",
		"Tiªn sinh nãi râ h¬n ®­îc kh«ng?",
	}
	TE_Talk("task_018_00_01",strMain);
end;

function task_018_00_01()
	local strMain = {
		"SÜ, hiÖp, Èn thùc tÕ chØ h­íng tu luyÖn cña nh©n vËt, ng­êi ch¬i theo <color=yellow>sÜ<color> cã th©n thÓ c­êng tr¸ng vµ søc m¹nh h¬n ng­êi.",
		"Theo <color=yellow>HiÖp<color> søc m¹nh vµ nhanh nhen c©n b»ng; theo <color=yellow>Èn<color> kh«ng quan träng bªn ngoµi, chñ yÕu rÌn luyÖn tinh thÇn.",
		"Tiªn sinh nãi xem ta nªn ®i theo h­íng nµo?",
		"Ng­¬i ch­a gia nhËp m«n ph¸i, sao chän ®­îc h­íng ®i, nªn th©n träng khi ®­a ra quyÕt ®Şnh.",
		"Tiªn sinh h­íng dÉn thªm ®­îc kh«ng?",	
	}
	TE_Talk("task_018_01",strMain);
end;

-- Óë°ÙÏşÉúµÄ¶Ô»°À©Õ¹
function task_018_01()

	local strMain = {
		"ThËt ra theo h­íng nµo còng cã ­u ®iÓm riªng cña nã, cÇn ph¶i chän lùa s­ phô sau khi gia nhËp m«n ph¸i.",
		"NhiÒu m«n ph¸i vµ nhiÒu h­íng tu luyÖn, ta ph¶i lµm sao?",
		"Tu hµnh tïy mçi ng­êi th«i!",
		"§a t¹ tiªn sinh!",
		"H·y quay vÒ gÆp <color=yellow>D· TÈu<color> ®i!"
	}
	TE_Talk("task_018_02",strMain);
end;

-- Óë°ÙÏşÉú¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º19
function task_018_02()
	TE_SetTeachAdd();
    Earn(100);
	ModifyReputation(4,0);
	GivePlayerExp(SKeyXinShou,"baixiaosheng")
	TaskTip("VÒ gÆp D· TÈu");
end;

-- ÔÙ´Î»ØÀ´ÓëÒ°ÛÅµÄ¶Ô»°
function task_019_00()

	local strMain = {
		"Sao ®i l©u vËy? B¸ch HiÓu Sinh nãi g×?",
		"B¸ch tiªn sinh nãi víi v·n bèi vÒ sÜ , hiÖp, Èn tam ®¹i l­u ph¸i.",
		"B¸ch HiÓu Sinh qu¶ thËt m­u trİ h¬n ng­êi, vÒ sau cÇn g× ng­¬i cø ®Õn ®ã thØnh gi¸o. §¹t <color=yellow>cÊp 9<color> ®Õn t×m ta! Giê h·y ®i thØnh gi¸o <color=yellow>Chñ th­¬ng héi<color>!"
	}
	TE_Talk("task_019_01",strMain);
end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º20
function task_019_01()
	TE_SetTeachAdd();
	TaskTip("Hoµn thµnh nhiÖm vô t×m hiÓu m«n ph¸i ®¹t cÊp 9 t×m D· TÈu");
end;

-- Íæ¼Òµ½ÁË 9 ¼¶Ö®ºóºÍÒ°ÛÅ¶Ô»°
function task_020_00()

	local strMain = {
		"30 n¨m råi…mau thËt!",
		"TiÒn bèi nãi 30 n¨m tr­íc lµ sao?",
		"Kh«ng cã g×! Xin gióp ta mang bøc th­ cho <color=yellow>TriÖu Diªn Niªn ë BiÖn Kinh<color>, vÒ ta sÏ nãi sau!",
	}

	TE_Talk("task_020_01",strMain);

end;

-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º21
function task_020_01()
	TE_SetTeachAdd();
	TaskTip("D· TÈu nhê b¹n mang bøc th­ cho TriÖu Diªn Niªn ë BiÖn Kinh");
	AddItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"yeshou3")
	RestoreStamina()
	--CreateTrigger(4,199,80);
end;


function task_021_00()

	local strMain = {
		"VŞ "..GetPlayerSex().." ®Õn ®¸nh cê víi ta ch¨ng?",
		"D· TÈu nhê ta mang bøc th­ cho tiÒn bèi!",
		"Ra lµ vËy! L¹i bŞ phiÒn phøc n÷a råi!",
		"(TriÖu Diªn Niªn më th­ ra xem)",
		"Ta ®ãi qu¸, ng­¬i cã thÓ t×m cho ta 1 c¸i <color=yellow>b¸nh ng«<color> ®­îc kh«ng?",
		"Móa kiÕm th× ®­îc, b¸nh ng« th×.....",
		"B¸nh ng« ®¬n gi¶n thÕ còng kh«ng lµm ®­îc, sao hµnh tÈu giang hå!",
		"Nhí kü! Ng­¬i më <color=yellow>giao diÖn kü n¨ng<color> chän <color=yellow>tuyÖt kü gia truyÒn<color> sau ®ã nhÊn <color=yellow>B¸nh ng«<color> råi <color=yellow>§ång ı<color> lµ ®­îc.",
		"§Ó v·n bèi thö xem!",
	}

	TE_Talk("task_021_01",strMain);

end;

-- ÓëÕÔÑÓÄê¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º22
function task_021_01()
	TE_SetTeachAdd();
	DelItem(2,0,48,1);
	GivePlayerExp(SKeyXinShou,"zhaoyannian")
	TaskTip("TriÖu Diªn Niªn nhê b¹n lµm 1 c¸i b¸nh ng«");
end;



function task_022_00()

	local strMain = {
		"Ng­¬i qu¶ lµ ng­êi tèt bông, ®Ó l·o phu kÓ ng­¬i nghe c©u chuyÖn 30 n¨m vÒ tr­íc.",
		"Lµm phiÒn tiÒn bèi!",
		"30 n¨m tr­íc th¸i tæ TriÖu Khu«ng DÉn ®o¹t ®­îc <color=yellow>b¶n ®å S¬n Hµ X· T¾c<color> tõ tay Sµi Vinh, bİ mËt liªn l¹c c¸c m«n ph¸i cïng t×m b¶n ®å kho b¸u bªn trong ®ång thêi ph¸t ®éng binh biÕn TrÇn kiÒu, m­u ®å so¸i vŞ. Kh«ng ai biÕt ®ã chİnh lµ tÊm b¶n ®å cña Thiªn, §Şa, Nh©n <color=yellow>Tam Giíi chÊn phï<color>, long m¹ch cña Trung Nguyªn, b¸u vËt mµ Sµi Vinh ®em tİnh m¹ng ra giµnh lÊy. ViÖc lµm cña th¸i tæ dÉn ®Õn trêi ®Êt c¨m phÉn, trong ngµy ®¹i lÔ tÕ trêi, S¬n Hµ X· T¾c ®ét nhiªn hãa thµnh tro bôi, bay ®i kh¾p n¬i.",
		"Th¸i tæ biÕt m×nh ®· lµm nghŞch ı trêi, ®¶o lén cµn kh«n tam giíi, yªu ma hiÖn thÕ, Trung Nguyªn s¾p l©m vµo ®¹i kiÕp. §Ó söa sai lÇm, mét bªn chÊn chØnh l¹i c¸c côc diÖn, mÆt kh¸c bè c¸o thiªn h¹, hy väng t×m ®­îc ng­êi kiÕm l¹i nh÷ng m¶nh b¶n ®å S¬n Hµ X· T¾c."
	};

	if GetItemCount(1,1,1)>=1 then
	    DelItem(1,1,1,1);
		TE_Talk("task_022_01",strMain);
		return
	else
		Say("Ch­a lµm xong b¸nh ng« µ? H·y më kü n¨ng sèng ra xem ®i!",0);
	end;
	
end;

-- ÓëÕÔÑÓÄê¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º23
function task_022_01()

	local strMsg = {
		"C©u chuyÖn t­ëng chõng ch×m vµo quªn l·ng, ®ét nhiªn cã tin th¸i tæ b¹o bÖnh qua ®êi, ng­êi kÕ vŞ kh«ng ph¶i th¸i tö TriÖu §øc Ph­¬ng mµ lµ em vua TriÖu Quang NghÜa, tin ®ån lan truyÒn ®Õn d©n gi©n....100 ngµn binh lİnh cña n­íc Liªu ®· kÒ cËn Nh¹n M«n Quan, mét sè hµo kiÖt lai lŞch kh«ng râ chiÕm cø L­¬ng S¬n B¹c, Thµnh §« phñ vµ TuyÒn Ch©u phñ xung quanh xuÊt hiÖn nhiÒu quû qu¸i.",
		"KÓ tõ ®ã tin tøc vÒ tÊm b¶n ®å S¬n Hµ X· T¾c lan truyÒn kh¾p Trung Nguyªn.",
		"T­¬ng lai kh«ng xa, Trung Nguyªn sÏ ph¶i ®èi mÆt víi mét côc diÖn tranh giµnh, tµn s¸t lÉn nhau ®Ó cã ®­îc tÊm b¶n ®å quı gi¸ Êy."
	};
	local strMain = {
		"Ta kh«ng thÓ khoanh tay ®øng nh×n, ph¶i t×m c¸ch cøu Trung Nguyªn th«i!",
		"Sè phËn do trêi, ng­¬i ®õng qu¸ lo l¾ng! §¹t cÊp 10 quay l¹i t×m ta.",
		"NhÊt ®Şnh v·n bèi sÏ quay l¹i!"
	};

	TE_SetTeachAdd();
	TaskTip("LuyÖn ®Õn cÊp 10 t×m TriÖu Diªn Niªn");
	GivePlayerExp(SKeyXinShou,"zhaoyannian_wotou")
	TE_Talk("",strMsg);
	TE_Talk("", strMain);
end;

function task_023_00()

	local strMain = {
		"Kh¸ l¾m! Kh«ng lµm ta thÊt väng.",
		"Ta cã 3 bøc th­ nhê mang cho <color=yellow>D· TÈu<color>. Lµm phiÒn b»ng h÷u qu¸!",
		"SÏ kh«ng lµm tiÒn bèi thÊt väng!"
	}
	TE_Talk("task_023_01",strMain);
end;

-- ÓëÕÔÑÓÄê¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º24
-- ¸øÓèÍæ¼ÒÈı·âĞÅ
function task_023_01()
	TE_SetTeachAdd();
	AddItem(2,0,49,3);
	TaskTip("TriÖu Diªn Niªn nhê mang 3 bøc th­ cho D· TÈu");
end;


function task_024_00()

	local strMain = {
		"VÒ råi ­? Ng­¬i biÕt TriÖu Diªn Niªn lµ ai kh«ng?",
		"V·n bèi kh«ng biÕt!",
		"TriÖu Diªn Niªn vèn ng­êi hoµng téc, do ch¸n c¶nh tranh quyÒn chèn hoµng cung mµ quyÕt ®Şnh bá hÕt danh lîi, phiªu b¹t giang hå.",
		"Th× ra lµ vËy!",
		"Ng­¬i ®· cã chót thµnh tùu, cã thÓ ®Õn c¸c m«n ph¸i häc hái thªm. Cè g¾ng nhĞ!",
		"§a t¹ tiÒn bèi!"
	}
	TE_Talk("task_024_01",strMain);
end;


function task_024_01()

	local strMain = {
		"Ng­¬i gióp ta chuyÓn 3 bøc th­ cña TriÖu Diªn Niªn ®­îc kh«ng?",
		"§­îc th«i! Nh­ng mang ®Õn cho ai vËy?",
		"TriÖu Diªn Niªn lo c¸c ®Şa ph­¬ng x¶y ra <color=yellow>biÕn cè<color>, cho nªn muèn liªn l¹c c¸c vŞ sau. <color=yellow>KhÊu ChuÈn<color> ng­êi chİnh trùc hiÖn ®ang lµm quan ë <color=yellow>BiÖn Kinh<color>; <color=yellow>Ph¹m Träng Yªm<color> v¨n quan hiÖn ë <color=yellow>Nam Thµnh §«<color>; <color=yellow>V­¬ng NghiÖp VÜ<color> th­¬ng gia sµnh sø hiÖn ë <color=yellow>TuyÒn Ch©u<color>.",
		"ChØ cÇn mang th­ ®Õn cho bän hä lµ §­îc! §©y ta cã chót quµ tÆng ng­¬i, ®i ®­êng cÈn thËn nhĞ!",
		"Xin ®a t¹! V·n bèi ®i ®©y."
	}
	TE_Talk("task_024_02",strMain);
end


-- ÓëÒ°ÛÅ¶Ô»°½áÊøºó¸Ä±äÈÎÎñ±äÁ¿£º25
function task_024_02()
	TE_SetTeachAdd();
	GivePlayerAward_Teach("ChuyÖn giang hå");
	TaskTip("Hoµn thµnh nhiÖm vô T©n thñ cã thÓ phiªu b¹t giang hå!");
	SetTask(130,1); --ÍõÒµÎ°
	SetTask(131,1); --¿Ü×¼
	SetTask(132,1); --·¶ÖÙÑÍ
end;


-- ·ÅÆú×ö½ÌÓıÈÎÎñ
function task_giveout()
--	TE_SetTeachState(23);
	Say("ThÊy ng­¬i b¶n lÜnh h¬n ng­êi, l·o ®©y kh«ng cÇn d¹y nhiÒu, vÒ sau ®iÒu g× kh«ng hiÓu cã thÓ ®Õn t×m ta.", 0);
end;

-- Ê²Ã´Ò²²»×öµÄ¿Õº¯Êı
function task_exit()

end;






-- »ù±¾²Ù×÷
function Teach_Basic()

	local strMain = {
		"Dïng chuét chØ vµo bÊt kú n¬i nµo trong b¶n ®å ®Ó di chuyÓn nh©n vËt. NÕu kh«ng x¸c ®Şnh ®­îc vŞ trİ, më <color=yellow>B¶n ®å nhá<color>, dÊu chÊm <color=yellow>vµng<color> bªn trong chØ cho vŞ trİ cña ng­êi ch¬i.",
		"Ra ngoµi thµnh nÕu kh«ng may chØ chuét lªn qu¸i, nh©n vËt sÏ tù ®éng ®¸nh qu¸i liªn tôc, cÇn chó ı!",
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ÈËÎïµÈ¼¶ÌáÉı
function Teach_Level()

	local strMain = {
		"Nh©n vËt dïng <color=yellow>§iÓm kinh nghiÖm<color> ®Ó t¨ng cÊp. NhÊn <color=yellow><F3><color> më Giao diÖn trang bŞ nh©n vËt sÏ thÊy <color=yellow>nót t¨ng cÊp<color>. Khi ®iÓm kinh nghiÖm lín h¬n kinh nghiÖm ®Ó t¨ng cÊp, cã thÓ <color=yellow>t¨ng cÊp nh©n vËt<color>. Sau khi t¨ng cÊp nh©n vËt sÏ cã <color=yellow>§iÓm tiÒm n¨ng<color>. §¼ng cÊp cµng cao ®iÓm tiÒm n¨ng cµng nhiÒu.",
		"Cã nhiÒu c¸ch ®Ó nhËn <color=yellow>§iÓm kinh nghiÖm<color>, nh­ ®¸nh qu¸i, lµm nhiÖm vô, bÕ quan tu luyÖn thËm chİ truyÒn c«ng...Kinh nghiÖm hiÖn t¹i ¶nh h­ëng ®¼ng cÊp vµ kü n¨ng nh©n vËt, nªn cÇn chó ı tû lÖ ph©n bè c©n b»ng!"
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜÇ±ÄÜµã·ÖÅä
function Teach_Point()

	local strMain = {
		"Nh©n vËt cã 5 tiÒm n¨ng: <color=yellow>Søc m¹nh<color>, <color=yellow>Néi c«ng<color>, <color=yellow>G©n cèt<color>, <color=yellow>Th©n ph¸p<color>, <color=yellow>Linh ho¹t<color>.",
		"<color=yellow>Søc m¹nh<color> quyÕt ®Şnh ®¸nh ngo¹i c«ng vµ søc lùc; <color=yellow>Néi c«ng<color> quyÕt ®Şnh néi lùc, ®¸nh néi c«ng vµ phßng thñ néi.",
		"<color=yellow>G©n cèt<color> quyÕt ®Şnh sinh lùc vµ phßng thñ ngo¹i; <color=yellow>Th©n ph¸p<color> quyÕt ®Şnh nĞ tr¸nh, chİnh x¸c vµ tèc ®é ®¸nh; <color=yellow>nh×n râ<color> quyÕt ®Şnh tÊn c«ng chİ m¹ng vµ tù ®éng nĞ tr¸nh, ¶nh h­ëng chİnh x¸c vµ tèc ®é ®¸nh.",
		" LiT©n thñ nªn t¨ng nhiÒu vµo <color=yellow>Søc m¹nh<color> vµ <color=yellow>G©n cèt<color>."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜ×¬Ç®
function Teach_Earn()

	local strMain = {
		"Ng­¬i cã thÓ ra ngoµi thµnh ®¸nh qu¸i mang vËt phÈm vÒ b¸n cho c¸c chñ tiÖm hoÆc lµm mét vµi nhiÖm vô ®¬n gi¶n. <color=yellow>B¸ch HiÓu Sinh<color> trong thµnh cã c©u hái cho T©n thñ, ®¸p ®óng sÏ ®­îc phÇn th­ëng. Bªn c¹nh ®ã triÒu ®×nh cßn ph¸i Kh©m Sai ®¹i thÇn tiÕp tÕ T©n thñ, nhí n¾m b¾t c¬ héi nhĞ!",
		"§Õn <color=yellow>cÊp 10<color> cã thÓ mua b¸n, vËn tiªu, t×m kiÕm kho b¸u, ®¸nh l«i ®µi..."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜ°İÈëÃÅÅÉ
function Teach_Faction()

	local strMain = {
		"HiÖn c¸c m«n ph¸i ®ang thu nhËn ®Ö tö, ta thÊy ng­¬i t­ chÊt còng kh«ng tÖ, chØ cÇn cè g¾ng luyÖn ®Õn cÊp 10 ®èi tho¹i víi <color=yellow>Sø gi¶ m«n ph¸i<color> lµ cã thÓ gia nhËp.",
		"Mçi m«n ph¸i cã h­íng tu luyÖn kh¸c nhau, cÇn t×m hiÓu kü ®Æc s¾c cña hä."
	}
	TE_Talk("task_000_okay",strMain);
end;

-- ½éÉÜµ±Ç°ÄÜ×öµÄÊÂÇé
function Teach_Something()

	local strMain = {
		"Ng­êi míi ra giang hå cÇn <color=yellow>Giao l­u<color> nhiÒu víi ng­êi trong thµnh!",
		"Ng­¬i cã thÓ ra ngoµi ®¸nh qu¸i, nh­ng kh«ng nªn ®i qu¸ xa v× n¬i ®ã qu¸i rÊt m¹nh, nÕu lì bŞ th­¬ng vÒ t×m ta trŞ liÖu miÔn phİ. Tèt nhÊt ®i cïng ®ång ®éi.",
		"NÕu cè g¾ng hoµn thµnh nhiÖm vô h­íng dÉn T©n thñ sÏ cã lîi cho ng­¬i, cÇn chó ı nh÷ng c©u th«ng b¸o bªn d­íi hoÆc nhÊn <color=yellow><F11><color> ®Ó xem h­íng dÉn."
	}
	TE_Talk("task_000_okay",strMain);
end;





-- Áù¸öÎÊ´ğÌâµÄÄÚÈİ
function Teach_Qustion_001()
	Say("Giê ta sÏ hái ng­¬i mét vµi vÊn ®Ò, c©u hái 1: HiÖn cã mÊy ®¹i ph¸i thu nhËn ®Ö tö?",4,"ThËp ®¹i m«n ph¸i/Teach_Qustion_Error","B¸t ®¹i m«n ph¸i/Teach_Qustion_Error","Cöu ®¹i m«n ph¸i/Teach_Qustion_002","Tam ®¹i m«n ph¸i/Teach_Qustion_Error");
	return
end

function Teach_Qustion_002()
	Say("Tr¶ lêi tèt l¾m! C©u hái tiÕp theo: KiÕm ph¸p Vâ §ang xuÊt thÇn nhËp quû do ®Ö tö ®¹o gia hay ®Ö tö tôc gia luyÖn?",3,"§¹o gia ®Ö tö/Teach_Qustion_003","Tôc gia ®Ö tö/Teach_Qustion_Error","C¶ hai ®Òu ®óng/Teach_Qustion_Error");
	return
end

function Teach_Qustion_003()
	Say("Kh¸ l¾m! C©u hái 3: §­êng M«n ®­îc xem lµ gia téc m«n ph¸i, vËy ng­êi phô tr¸ch m«n ph¸i lµ ai?",4,"M«n chñ/Teach_Qustion_Error","L·o l·o/Teach_Qustion_004","Ch­ëng m«n/Teach_Qustion_Error","Tæng qu¶n/Teach_Qustion_Error");
	return
end

function Teach_Qustion_004()
	Say("C©u hái tiÕp theo: §Ö tö tôc gia Nga My sö dông binh khİ nµo?",4,"Thİch/Teach_Qustion_Error","KiÕm/Teach_Qustion_Error","CÇm/Teach_Qustion_005","Bót/Teach_Qustion_Error");
	return
end

function Teach_Qustion_005()
	Say("§óng råi! C©u hái 5: Vâ c«ng ThiÕu L©m tinh th©m khã ®o¸n, 72 tuyÖt kü danh chÊn thiªn h¹. VËy ThiÕu L©m cã mÊy h­íng tu luyÖn?",4,"Mét/Teach_Qustion_Error","Hai/Teach_Qustion_Error","Ba/Teach_Qustion_006","Bèn/Teach_Qustion_Error");
	return
end

function Teach_Qustion_006()
	Say("C©u hái cuèi cïng: Nghe nãi ®Ö tö C¸i Bang cã ¤ Y, TŞnh Y, vËy ®Ö tö TŞnh Y tu luyÖn vâ c«ng nµo?",4,"C«n ph¸p/Teach_Qustion_Error","Ch­ëng ph¸p/task_017_01","ThuÇn d­ìng/Teach_Qustion_Error","BÉy/Teach_Qustion_Error");
	return
end

function Teach_Qustion_Error()
	Say("Nh­ng ta nghe ng­êi ta nãi kh«ng ph¶i nh­ vËy, ng­¬i thö vÒ xem l¹i!",1,"§­îc! §Ó ta xem l¹i!/task_exit");
end
