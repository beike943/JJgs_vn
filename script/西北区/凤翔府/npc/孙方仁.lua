-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCËï·½ÈÊScript
-- By StarryNight
-- 2007/08/04 AM 11:37

-- ÖÜÄ©µÄÌìÆø·Ç³£·Ç³£Ö®ºÃ£¬o(¡É_¡É)o...¹ş¹ş

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()


local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
local nStep_XBTask_02 = GetTask(TASK_XB_ID_02);
	
	---------------------------------- Î÷±±Çø18·ÖÖ§1_9ÜÆº®ÁÒÑô----------------------------------
	--Çó½ÌËï·½ÈÊÒ©ÈË²İÒ»ÊÂ
	if nStep_XBTask_01 == 38 then
		task_018_02_0();
		return
	end
	
	--´ø»Ø»òÎ´´ø»Ø10Æª¡¶Ç§½ğÒí·½¡·²Ğ¾í
	if nStep_XBTask_01 == 39 then
		task_018_03_0();
		return
	end
	
	--´ø»Ø»òÉĞÎ´´ø»ØÁÒÑô¸ù
	if nStep_XBTask_01 == 40 then
		task_018_06_0();
		return
	end
	
	--»¹Ã»ÏûÃğÒ©ÈË²İÓëËï·½ÈÊ¶Ô»°
	if nStep_XBTask_01 == 41 then
		task_018_06_1();
		return
	end
	
	---------------------------------- Î÷±±Çø19·ÖÖ§1_10¸¶Öî¶«Á÷----------------------------------
	
	--ÓëËï·½ÈÊ¶Ô»°ÈÃÆä°ïÃ¦Î±ÔìÒ©ÈËÒ©·½
	if nStep_XBTask_01 == 49 then
		task_019_08_0();
		return
	end
	
	---------------------------------- Î÷±±Çø20·ÖÖ§1_11±ø²»ÑáÕ©----------------------------------
	
	--²¢ĞĞÖ§Ïß½áÊø£¬»ã×Ü£¬È¡µÃÎ±ÔìÒ©ÈËÒ©·½
	if nStep_XBTask_01 == 50 and nStep_XBTask_02 == 21 then
		task_020_01_0();
		return
	--²¢ĞĞÖ§ÏßÎ´½áÊøÎ´È¡µÃÎ±ÔìÒ©ÈËÒ©·½
	elseif nStep_XBTask_01 == 50 then
		task_019_08_1();
		return
	end
	
	--»¹Î´½«Î±ÔìÒ©·½½»¸ø³µÂÖ°ÔÍõ
	if nStep_XBTask_01 == 51 then
		task_020_01_1();
		return
	end
	
	--ÔùËÍÁ¶µ¤¶´ÃÅÆ±
	if GetBit(GetTask(GIVE_TICKET_STATE),4) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Thiªn M«n §«ng trŞ ho bæ m¸u, M¹ch M«n §«ng thanh t©m gi¶i kh¸t."},
		{"Kú L©n cÇm m¸u, trŞ vÕt th­¬ng ®ao kiÕm, §­¬ng Quy d­ìng khİ huyÕt."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--ÔùËÍÃÅÆ±½Å±¾
function give_ticket_01()

local strTalk = {
	"T«n Ph­¬ng Nh©n: <sex> kh«ng may råi, trong mét ®ªm ë D­îc V­¬ng ®éng mäc ®Çy D­îc nh©n th¶o. Ta cho r»ng sau khi D­îc V­¬ng bŞ ®¸nh b¹i, D­îc nh©n th¶o vµ D­îc nh©n còng ph¶i mÊt ®i chø, nghe nãi trong D­îc V­¬ng ®éng cã nhiÒu kú hoa dŞ th¶o, kh«ng xem kh«ng ®­îc, trong ®éng l¹i võa mäc D­îc nh©n th¶o, e r»ng D­îc V­¬ng võa vÒ D­îc V­¬ng ®éng råi.",
	"Ng­êi ch¬i: L¹ thËt? Ta ®· dïng Tİch D­¬ng thñy lo¹i bá D­îc nh©n th¶o trong ®éng, c¶ rÔ còng ®· thiªu hñy råi, sao mét ®ªm l¹i cã chø?",
	"T«n Ph­¬ng Nh©n: Tèc ®é ph¸t triÓn D­îc nh©n th¶o tuy ®¸ng kinh ng¹c, nh­ng Tİch D­¬ng c¨n cã thÓ kh¾c phôc, <sex> lo¹i bá D­îc nh©n th¶o nhÊt ®Şnh kh«ng sai. Cã lÏ trªn ng­êi D­îc V­¬ng cã giÊu lo¹i D­îc nh©n th¶o, h¾n ta bŞ <sex> ®¸nh b¹i, chØ t¹m thêi rót lui khái D­îc V­¬ng ®éng, hoÆc h¾n vèn ch­a rêi khái D­îc V­¬ng ®éng, trong ®éng cßn cã mËt ®éng, chóng ta kh«ng biÕt mµ th«i.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"Ng­êi ch¬i: Theo nh­ lêi tiªn sinh, D­îc V­¬ng thËt hung ¸c, D­îc nh©n tèn c¶ ®êi t©m huyÕt ®Ó chÕ ra nh­ng l¹i bŞ hñy trong chíp m¾t, ®óng lµ sØ nhôc, sao kh«ng hËn chø? NÕu D­îc V­¬ng tr¶ thï, ta e r»ng khã mµ ®Ò phßng.",
	"T«n Ph­¬ng Nh©n: §©y còng lµ mèi lo cña ta, ng­êi nµy thËt t¸n tËn l­¬ng t©m, sao l¹i kh«ng tr¶ thï chø? D­îc V­¬ng ®éng lµ mét n¬i ®Ñp, thËm chİ cã D­îc th¶o quı ®· hñy diÖt, lµm thuèc cã c«ng dông khëi tö håi sinh. Tr­íc ®©y khi D­îc V­¬ng t×m ®­îc ®éng nµy còng kİch ®éng nh­ vËy, chØ ®¸ng tiÕc D­îc nh©n th¶o rÊt dÔ khiÕn ng­êi sa vµo. NÕu giái dïng D­îc th¶o nµy, th× thÕ giíi nµy sÏ gi¶i ®­îc rÊt nhiÒu bÖnh hiÓm nghÌo.",
	"Ng­êi ch¬i: Tiªn sinh, chi b»ng ta ®Õn D­îc V­¬ng ®éng xem cã thÓ ®uæi D­îc V­¬ng ra khái ®éng kh«ng! Nh­ng D­îc V­¬ng trèn ë LuyÖn §¬n ®éng, Thiªn c©n ®¹i th¹ch ë cöa ®éng, e r»ng chØ thÊy ng­êi gi÷ ®éng míi më ®­îc. LÇn tr­íc ta c¶i trang D­îc V­¬ng ®i mét chuyÕn, c¸ch nµy e r»ng kh«ng dïng ®­îc n÷a.",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"T«n Ph­¬ng Nh©n: §a t¹ <sex>…§uæi h¾n ra khái ®éng lµ tèt nhÊt, võa cã thÓ phßng trõ häa, võa cã thÓ dïng D­îc th¶o ®Ó cøu ng­êi. D­îc nh©n tr«ng coi LuyÖn §¬n ®éng th× tèt nhÊt. Ta ®· tõng nghiªn cøu lµm thÕ nµo ®Ó gi¶m uy lùc cña D­îc nh©n, ph¸t hiÖn D­îc nh©n còng cã ®iÓm yÕu, ®ã chİnh lµ Tİch D­¬ng c¨n. §©y lµ {Tİch D­¬ng tinh hoa}, D­îc nh©n cã lîi h¹i còng ph¶i sî vËt nµy, nÕu ngÊm ph¶i sÏ mÊt ®i c«ng lùc. Ng­¬i cã thÓ dïng vËt nµy ®Ó uy hiÕp ng­êi tr«ng coi thuèc, vµo LuyÖn §¬n ®éng sÏ dÔ nh­ trë bµn tay. Cßn n÷a, nÕu kh«ng thÓ ®uæi D­îc V­¬ng, sau nµy ng­¬i cã ®­îc {Tİch D­¬ng tinh hoa}, còng dÔ ®Õn D­îc V­¬ng ®éng gi¸m s¸t hµnh ®éng cña nã.",
	"Ng­êi ch¬i: §óng lµ diÖu kÕ. Tiªn sinh yªn t©m, ta nhÊt ®Şnh sÏ b¶o vÖ ®øc y häc cña tiªn sinh!",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1034,1,1);--µÃµ½ÁÒÑô¾«»ª
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),4,1));
	
end