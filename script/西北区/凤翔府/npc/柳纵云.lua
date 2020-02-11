-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCÁø×İÔÆScript
-- By StarryNight
-- 2007/08/25 PM 3:13

-- ÎŞÓûÔò¸Õ¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);
	
	---------------------------------- Î÷±±Çø13·ÖÖ§1_5Òô¾ø¹ÅÄ¹----------------------------------
	--Çó½ÌÁø×İÔÆÈëÄ¹Çé¿ö
	if nStep_XBTask_01 == 18 then
		task_013_04_0();
		return
	end
	
	--ÉĞÎ´´ò°ÜÍ³ÁìÈ¡µÃÃş½ğ·û
	if nStep_XBTask_01 == 19 then
		task_013_04_1();
		return
	end
	
	--´ò°ÜÍ³ÁìÈ¡µÃÃş½ğ·û
	if nStep_XBTask_01 == 20 then
		task_014_01_0();
		return
	end
	
	---------------------------------- Î÷±±Çø14·ÖÖ§1_6ÈëÄ¹Ö®Õù----------------------------------
	
	--È¡µÃ»òÎ´È¡µÃ¶ÏË®èÆºÍÂŞ¸ı
	if nStep_XBTask_01 == 21 then
		task_014_02_0();
		return
	end
	
	--Î´ÓëÍØ°Îºë¶Ô»°£¨²¹·¢¶ÏË®èÆºÍÂŞ¸ı£©
	if nStep_XBTask_01 >= 22 and nStep_XBTask_01 <= 24 then
		task_014_02_1();
		return
	end
	
	--ÔùËÍ»ÊÁêÃØµÀÃÅÆ±
	if GetBit(GetTask(GIVE_TICKET_STATE),2) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"C¸c h¹ cã biÕt Tµo Th¸o? Tæ tiªn ta chİnh lµ ng­êi ®­îc Tµo Th¸o phong chøc HiÖu óy."},
		{"NÕu M« Kim Phï ®Õn ®êi ta bŞ thÊt truyÒn th× thËt cã lçi víi tæ tiªn."},
		}
	local i = random(1,getn(strTalk));

	TalkEx("",strTalk[i]);
	return
	
end;

--ÔùËÍÃÅÆ±½Å±¾
function give_ticket_01()

local strTalk = {
	"LiÔu Tung V©n: <sex> cã chuyÖn g× n÷a µ? LÇn tr­íc ng­¬i ®· t×m M« Kim phï cho ta, ta ch­a thÓ c¶m ¬n ng­¬i, thËt lµ xÊu hæ. <sex> h×nh nh­ ®· ®Õn TÇn L¨ng, cho nªn ta cã mét sè chuyÖn muèn thØnh gi¸o.",
	"Ng­êi ch¬i: Tiªn sinh kh«ng cÇn kh¸ch khİ, nÕu lµ chuyÖn cã liªn quan ®Õn l¨ng mé, nhÊt ®Şnh ta biÕt g× sÏ nãi.",
	"LiÔu Tung V©n: Kh«ng giÊu g× <sex>, ta vèn cho r»ng ng­¬i gióp ta ®o¹t l¹i M« Kim phï gia truyÒn, nh­ng sau nµy ta ph¸t hiÖn ®ã thËt sù kh«ng ph¶i lµ M« Kim phï cña nhµ ta. ChuyÖn nµy khiÕn ta thËt kinh ng¹c. §­¬ng nhiªn <sex> gióp ta ®o¹t l¹i M« Kim phï, ta ®· rÊt c¶m kİch, cã ph¶i gia truyÒn hay kh«ng kh«ng cßn quan träng n÷a. ChuyÖn ta ng¹c nhiªn lµ cßn cã M« Kim phï cña ng­êi kh¸c r¬i trong mé, ng­êi ®i theo chÕt trong mé kh«ng İt. Cßn cã chuyÖn khiÕn ta ng¹c nhiªn n÷a lµ, h×nh dang mé kim phï <sex> ®o¹t vÒ gièng víi cña ta, nh­ng thêi gian ®· qu¸ l©u råi, h×nh nh­ ®ang Èn giÊu mét vµi bİ mËt.",
	"Ng­êi ch¬i: Cã chuyÖn nµy sao? Nh­ng phï nµy ®óng lµ ta ®o¹t l¹i tõ viÖc ®¸nh b¹i thèng lÜnh Binh m· dòng mµ.",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"LiÔu Tung V©n: E r»ng M« Kim phï <sex> ®o¹t l¹i lµ phï mµ thèng lÜnh c­íp tõ ng­êi c­íp mé kh¸c. Cho nªn ta muèn hái <sex>, trong mé trõ Binh m· dòng ra, cßn cã TrÊn mé linh vËt vµ vËt gäi lµ Quû T­íng Qu©n kh«ng?",
	"Ng­êi ch¬i: Kh«ng sai, tÇng 2 trong l¨ng mé thËt sù cã Quû T­íng Qu©n, rÊt khã ®èi phã, tiªn sinh ch­a vµo tÇng 2, sao biÕt chuyÖn nµy?",
	"LiÔu Tung V©n: Qu¶ nhiªn lµ nh­ vËy, vËt gi÷ mé cã thÓ ho¹t ®éng tù nhiªn, t¸c dông cña b¶n ®å S¬n Hµ X· T¾c hoµn toµn kh«ng ®¸ng tin. Ng­¬i nh×n M« Kim phï nµy cã kh¾c mÊy ch÷ {Ngang nhiªn x©m ph¹m, chÕt d­íi tay Quû T­íng Qu©n}, h×nh nh­ lµ tr­íc khi chÕt ng­êi c­íp mé ®Ó l¹i. Nh­ ta dù ®o¸n, tiªn n÷ nµy cã thÓ lµ ng­êi c­íp mé, c« ta ®· ph¸t hiÖn b¶o vËt ë TÇn Hoµng, t×m ®Õn chç Quû t­íng qu©n, Quû T­íng Qu©n lµ linh vËt hé b¶o, khi tiªn n÷ nµy ®o¹t b¶o vËt, TÇn Hoµng v× hé b¶o mµ nhËp hån vµo Quû T­íng Qu©n. Cã mét ng­êi c­íp mé cïng vµo l¨ng mé ®· nh×n thÊy c¶nh nµy, chØ lµ h¾n kh«ng may bŞ TrÊn Mé Linh Thó c­íp mÊt m¹ng. E r»ng vËt gi÷ mé vÉn lµ kÕ s¸ch xua ®uæi cña hån TÇn Hoµng.",
	"Ng­êi ch¬i? Sao? Lµ n÷ µ? N÷ vµo TÇn L¨ng t×m b¶o vËt sao? ViÖc nµy……",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"LiÔu Tung V©n: <sex> muèn biÕt ­? Nh­ng cã mét sè chuyÖn kh«ng thÓ nãi ra. <sex> cã thÓ nh×n thÊy TrÊn Mé Linh Thó sao? NÕu muèn t×m hiÓu chuyÖn nµy, e r»ng ph¶i ®i l¨ng mé mét chuyÕn.",
	"Ng­êi ch¬i: TrÊn Mé Linh Thó nµy lµ TrÊn mé thó canh gi÷ mËt ®¹o tÇng 1, 2. §¸ng tiÕc ta ®· ®Õn mËt ®¹o 1 lÇn, trong mé cã c¬ quan, mËt ®¹o h×nh nh­ ®· bŞ phong táa, vµo kh«ng ®­îc n÷a.",
	"LiÔu Tung V©n: ThËt sù vµo l¹i mËt ®¹o còng lµ chuyÖn khã. Ta cã nghiªn cøu ®èi víi c¬ quan trong l¨ng mé, mËt thÊt th«ng th­êng trong l¨ng mé nÕu bŞ c¬ quan phong táa, cã thÓ dïng {Håi Long S¸ch} ®Ó më, nh­ vËy cã thÓ vµo ®­îc mËt ®¹o mét lÇn n÷a. NÕu <sex> cã c¸ch, th× ph¶i ®Õn l¨ng mé mét chuyÕn, {Håi Long S¸ch} nµy cã thÓ gióp ®­îc ng­¬i.",
	"Ng­êi ch¬i: KiÕn thøc cña Tiªn sinh ®èi víi Cæ MÆc ®óng lµ ®¸ng nÓ. T¹i h¹ muèn ®Õn mËt ®¹o l¨ng mé ®Ó x¸c nhËn mét chuyÖn, ®a t¹ Håi Long S¸ch cña tiªn sinh.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1032,1,1);--µÃµ½»ØÁúË÷
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),2,1));
	
end