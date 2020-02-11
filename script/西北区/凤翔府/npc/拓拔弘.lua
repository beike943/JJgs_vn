-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÍØ°ÎºëScript
-- By StarryNight
-- 2007/06/26 PM 5:04

-- Î¢Ğ¦ÒÀÈ»¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

	---------------------------------- Î÷±±ÈÎÎñ08Æå·êµĞÊÖ----------------------------------
	
	--ÊÜ³µÂÖ°ÔÍõ·Ô¸À£¬ÏñÍØ°ÎºëÑ¯ÎÊ¹ØÓÚ¹âÃ÷¶¥µÄÇé¿ö
	if nStep_XBTask == 37 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ´Ì¿Í³ÆºÅ 
			task_008_02_0();
		else
			xb_title_tip(2,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--ÉĞÎ´°Ñ´øÉËÒ©¸øË¾ÂíÃù·ç
	if nStep_XBTask == 38 then
		task_008_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø09·ÖÖ§1_1¹âÃ÷×óÊ¹----------------------------------
	--°Ñ´øÉËÒ©¸øË¾ÂíÃù·çºó»Ø±¨ÍØ°Îºë
	if nStep_XBTask == 39 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ´Ì¿Í³ÆºÅ 
			task_009_01_0();
		else
			xb_title_tip(2,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--´òÌ½¹âÃ÷¶¥ÏûÏ¢ÖĞ
	if nStep_XBTask_01 >= 1 and nStep_XBTask_01 <= 6 then
		task_009_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø11·ÖÖ§1_3µÛÍõÖ®Ä¹----------------------------------
	
	--´òÌ½Íê¹âÃ÷¶¥ÊÂÇé»ØÀ´ºó
	if nStep_XBTask_01 == 7 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ´Ì¿Í³ÆºÅ 
			task_011_01_0();
		else
			xb_title_tip(2,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--»¹Ã»¼û³µÂÖ°ÔÍõÓëÍØ°Îºë¶Ô»°
	 if nStep_XBTask_01 == 8 then
		task_011_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø13·ÖÖ§1_5Òô¾ø¹ÅÄ¹----------------------------------
	
	--ÓëÍØ°Îºë¶Ô»°½»¸øÆä½ğË¿ÃæÕÖ
	if nStep_XBTask_01 == 15 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ·É»¤³ÆºÅ 
			task_013_01_0();
		else
			xb_title_tip(3,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--»¹Î´½«½ğË¿ÃæÕÖ½»¸øË¾ÂíÃù·ç
	if nStep_XBTask_01 == 16 then
		task_013_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø15·ÖÖ§1_6¹ÅÄ¹·çÔÆ----------------------------------
	
	--ÓëÍØ°Îºë¶Ô»°µÃÖª×¦ÍõÒÑ¾­Ç±ÈëÁêÄ¹£¨»ñµÃÒ»Æ·ÌÃ»¢Òí³ÆºÅ£©
	if nStep_XBTask_01 == 22 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ·É»¤³ÆºÅ 
			task_015_01_0();
		else
			xb_title_tip(3,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--ÉĞÎ´½ØÉ±×¦Íõ
	if nStep_XBTask_01 == 23 then
		task_015_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø16·ÖÖ§1_7Ò©ÈË¾ªÏÖ----------------------------------
	
	--½«Ä«¶·ºÍÓñÅå½»¸øÃù·çºóÓëÍØ°Îºë¶Ô»°
	if nStep_XBTask_01 == 29 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃ»¢Òí³ÆºÅ 
			task_016_01_0();
		else
			xb_title_tip(4,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--Î´Óë³µÂÖ»ã±¨¹ØÓÚÁêÄ¹µÄÇé¿ö
	if nStep_XBTask_01 == 30 then
		task_016_01_1();
		return
	end
	
	---------------------------------- Î÷±±Çø21·ÖÖ§1_12½£°ÎåóÕÅ----------------------------------
	--ÓëÍØ°Îºë¶Ô»°
	if nStep_XBTask_01 == 57 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÓğÎÀ³ÆºÅ 
			task_021_02_0();
		else
			xb_title_tip(5,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--Î´É±ËÀÎåĞĞÊ¹¶Ô»°
	if nStep_XBTask_01 == 58 then
		task_021_02_1();
		return
	end
	
	--É±ËÀÎåĞĞÊ¹¶Ô»°
	if nStep_XBTask_01 == 59 then
		if is_show_title_level() == 1 then --ÁÁ³öÒ»Æ·ÌÃÓğÎÀ³ÆºÅ 
			task_021_04_0();
		else
			xb_title_tip(5,"Th¸c B¹t Ho»ng ");
		end
		return
	end
	
	--Î´É±ËÀ³µÂÖ°ÔÍõ¶Ô»°
	if nStep_XBTask_01 == 60 then
		task_021_04_1();
		return
	end
	
	--ÔùËÍÎåĞĞÕóÃÅÆ±
	if GetBit(GetTask(GIVE_TICKET_STATE),5) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Vâ c«ng c¸i thÕ ®óng bŞa ®Æt, vâ häc sao cã kÎ m¹nh nhÊt? Vâ t©m míi lµ sù cao thÊp cña vâ nghÖ."},
		{"KiÕm vµ t©m nÕu kh«ng hîp nhÊt th× chi b»ng tõ nay ®õng dïng kiÕm."},
		{"Thiªn h¹ tuy réng lín nh­ng ng­êi cã vâ c«ng cao chØ xuÊt hiÖn ë trung nguyªn."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--ÔùËÍÃÅÆ±½Å±¾
function give_ticket_01()

local strTalk = {
	"Th¸c B¹t Ho»ng: Hãa ra lµ <sex>, ha ha ha, h×nh nh­ chóng ta mçi lÇn gÆp mÆt, ta ®Òu träng th­¬ng, ®Òu kh«ng thÓ ch¨m sãc ng­¬i, thËt hæ thÑn!",
	"Ng­êi ch¬i: TiÒn bèi ®· xem ta lµ h¶o h÷u, th× nãi chi nh÷ng lêi kh¸ch khİ thÕ chø. VÕt th­¬ng cña tiÒn bèi cã nÆng kh«ng? Ngò Hµnh Sø rèt cuéc x¶y ra chuyÖn g× thÕ?",
	"Th¸c B¹t Ho»ng: Ha ha ha, h«m tr­íc T­ M· Minh Phong míi tÆng mét İt thuèc gia truyÒn, ta ®· ®ì nhiÒu råi. LÇn nµy thËt sù lµ may m¾n, c¸m ¬n ng­¬i lÇn tr­íc ®Õn sa m¹c ph¸ Ngò Hµnh TrËn mét lÇn, khiÕn cho nguyªn khİ cña hä bŞ tæn th­¬ng. 5 ng­êi trong Ngò Hµnh Sø lµ mét, tuyÖt ®èi sÏ kh«ng hµnh ®éng riªng lÎ, nh­ h«m nay chØ cã 3 ng­êi hµnh thİch ta, ta ®o¸n cã 2 nguyªn nh©n. Lı Nguyªn Kh¸nh nhÊt ®Şnh ®· truyÒn {ThiÕt Chu LÖnh}, hai lµ 5 ng­êi trong Ngò Hµnh Sø tÊt c¶ ®Òu ch­a håi phôc nguyªn khİ, cho dï lµ 3 ng­êi còng kh«ng thÓ kh«ng hµnh ®éng.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ng­êi ch¬i: TiÒn bèi kh«ng ng¹i, ta cµng an t©m. Xem ra NhÊt PhÈm ®­êng kh«ng dÔ dµng tõ bá. {ThiÕt Chu LÖnh} mµ tiÒn bèi nãi cã thÓ gièng víi Truy S¸t lÖnh kh«ng?",
	"Th¸c B¹t Ho»ng: Kh«ng sai, thËt ra Ngò Hµnh Sø thuéc nhãm ¸m s¸t NhÊt PhÈm ®­êng, ®©y lµ tæ chøc bİ mËt trùc tiÕp nghe lÖnh tõ Lı Nguyªn Kh¸nh, th«ng tin ta biÕt kh¸ İt. Nh­ng ThiÕt Chu LÖnh cña Lı Nguyªn Kh¸nh, lµ Truy S¸t lÖnh kh«ng ph©n biÖt thêi gian, kh«ng gian, ®Şa ®iÓm, thñ ®o¹n, kh«ng ®¹t ®­îc môc ®İch sÏ kh«ng rót lÖnh. Nhãm ¸m s¸t nµy sÏ ra tay gièng nh­ thñ ®o¹n ¸m s¸t c¸c Ch­ëng m«n ®¹i m«n ph¸i ë Trung Nguyªn. LÊy nguyªn nh©n lµ Ngò Hµnh Sø tuy chØ cã 3 ng­êi, vÉn ph¶i chÊp hµnh nhiÖm vô, Èn t×nh phİa sau khã mµ ®o¸n ®­îc. <sex> cø an t©m, nÕu ta ®o¸n kh«ng sai, ng­¬i còng lµ môc tiªu cña chóng.",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"Ng­êi ch¬i, Hõm, NhÊt PhÈm ®­êng ®óng lµ xem th­êng ng­êi kh¸c, xem ra ngµy nµo ch­a giÕt ®­îc Ngò Hµnh Sø th× khã tr¸nh khái hËu ho¹n, Dï cho cã xem ta lµ môc tiªu, Ngò Hµnh Sø vÉn ch­a håi phôc nguyªn khİ, chi b»ng ra tay tr­íc. Nh­ng lÇn tr­íc ta ®· thö qua uy lùc cña Ngò Hµnh TrËn råi, chóng thËt sù rÊt khã ®èi phã.",
	"Th¸c B¹t Ho»ng: Ngò Hµnh Sø t­¬ng sinh t­¬ng kh¾c, dïng tµi n¨ng ®Ó c©n b»ng, trõ phi mét nh¸t tiªu diÖt hÕt bän chóng, nÕu kh«ng th× ai trong sè chóng còng kh«ng thÓ chÕt ®­îc. Nguyªn khİ cña chóng ch­a håi phôc, nÕu ra tay tr­íc kh«ng ngõng ¸p chÕ chóng, hä sÏ khã mµ thùc hiÖn nhiÖm vô, ®ã còng lµ c¸ch tèt. NÕu Ngò Hµnh Sø truy s¸t ng­êi t¹o ph¶n, sÏ ®Ó l¹i {Ngò Hµnh Kú Phiªn}, mét lµ cho thÕ nh©n biÕt ®ã lµ ng­êi do Ngò Hµnh Sø truy s¸t, hai lµ nh¾c nhë ai cã ı t¹o ph¶n, dïng {Ngò Hµnh Kú Phiªn} lµ kı hiÖu cña Ngò Hµnh Sø. Mang vËt nµy ®Õn Ngò Hµnh TrËn, cho dï Ngò Hµnh Sø cã träng th­¬ng còng sÏ kÕt trËn tiÕp ng­¬i, nÕu ng­¬i lµ ng­êi ThiÕt Chu LÖnh truy s¸t, chóng sÏ kh«ng dÔ g× bá qua. NÕu chóng b¹i trËn, sau nµy ng­¬i còng cã thÓ dïng vËt nµy tiÕp tôc ¸p chÕ Ngò Hµnh TrËn.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1035,1,1);--µÃµ½ÎåĞĞÆìá¦
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),5,1));
	
end