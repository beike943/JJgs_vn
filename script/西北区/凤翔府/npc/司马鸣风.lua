-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ·ïÏè¸®NPCË¾ÂíÃù·çScript
-- By StarryNight
-- 2007/06/25 PM 3:13

-- Æ£¾ë¾ÍÊÇ¼´Ê¹Óöµ½ÁîÄã¿ªĞÄµÄÊÂ£¬µ«ÊÇÒÀÈ»ĞË·Ü²»ÆğÀ´¡£

-- ======================================================

-- ÒıÓÃ¾çÇéÈÎÎñÍ·ÎÄ¼ş
Include("\\script\\task\\world\\xibei\\task_head.lua");
Include("\\script\\task\\world\\xibei\\task_main.lua");
Include("\\script\\task\\world\\task_head.lua");

function main()

local nStep_XBTask = GetTask(TASK_XB_ID);
local nStep_XBTask_01 = GetTask(TASK_XB_ID_01);

local tbSayDialog = {};
local nSaySize = 0;
local szSayHead = "Ta n¾m gi÷ bİ kİp chÕ t¹o ChuyÓn Sinh §¬n do Nguyªn Thñy Thiªn T«n ®Ó l¹i. NÕu muèn ta chÕ t¹o ChuyÓn Sinh §¬n, ng­êi h·y gióp ta hoµn thµnh c¸c viÖc sau ®©y: 300 nhiÖm vô s­ m«n, 30 lÇn Th¸i H­ HuyÔn C¶nh, 81 lÇn Tµi Nguyªn ChiÕn, 30 lÇn L­¬ng S¬n, 33 lÇn TrŞ An (B×nh Thiªn H¹), 33 lÇn Thñy Lîi (B×nh Thiªn H¹), 300 H¹t Gièng, 181 B¸t nh· nhá, 99 B¸t nh· lín, 99 c©y Tø Linh"

if GetTask(TSK_CSD) < 1 then
	szSayHead = "Ta c¶m thÊy vui vÎ vµ may m¾n th× ta míi chÕ t¹o ChuyÓn Sinh §¬n ®­îc"
--	tinsert(tbSayDialog, "NhËn nhiÖm vô ChuyÓn Sinh §¬n (tiªu hao 7 ng«i sao may m¾n)/get_mission_CSD")
elseif GetTask(TSK_CSD) == 1 then
	tinsert(tbSayDialog, "Gióp chÕ t¹o ChuyÓn Sinh §¬n (tiªu hao 999 Thiªn th¹ch + 333 B¸nh bét vµng)/get_CSD")
	tinsert(tbSayDialog, "Hoµn thµnh nhanh sè l­îng nhiÖm vô s­ m«n cßn l¹i (4 xu vËt phÈm/1 nhiÖm vô)/finish_sumon")	
elseif GetTask(TSK_CSD) == 2 then
	local szSayHead = "Ta ®ang ®ãi nªn kh«ng cã søc ®Ó chÕ t¹o ChuyÓn Sinh §¬n, h·y cho ta 333 B¸nh bét vµng ®Ó lãt d¹."
	tinsert(tbSayDialog, "Gióp ¨n no ®Ó chÕ t¹o ChuyÓn Sinh §¬n (tiªu hao 333 B¸nh bét vµng)/confirm_get_CSD")	
else
	local szSayHead = "B©y giê ta sÏ chÕ t¹o ChuyÓn Sinh §¬n cho ®¹i hiÖp, nh­ng h·y cho ta thªm  333 B¸nh bét vµng ®Ó dù tr÷ nha !!!."
	tinsert(tbSayDialog, "ChÕ t¹o ChuyÓn Sinh §¬n (tiªu hao 333 B¸nh bét vµng)/get_confirm_get_CSD")
end
	tinsert(tbSayDialog, "Xem sè l­îng c¸c nhiÖm vô/get_CSD_infor")
	tinsert(tbSayDialog,"§æi ChuyÓn Sinh §¬n (cã thÓ giao dŞch, cã h¹n sö dông 30 ngµy) - tiªu hao 2 C­u Thiªn V« Cùc §¬n/exchange_CSD"	)	
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/nothing"	)	
nSaySize = getn(tbSayDialog);
Say(szSayHead, nSaySize, tbSayDialog);
	---------------------------------- Î÷±±ÈÎÎñ08Æå·êµĞÊÖ----------------------------------
	
	--ÊÜÍØ°ÎºëËùÖö£¬´øÉËÒ©¸øË¾ÂíÃù·ç
	if nStep_XBTask == 38 then
		task_008_03_0();
		return
	end
	
	--ÉĞÎ´ÓëÅ·Ñô»­»òÍØ°Îºë¶Ô»°
	if nStep_XBTask == 39 then
		task_008_03_1();
		return
	end
	
	---------------------------------- Î÷±±Çø13·ÖÖ§1_5Òô¾ø¹ÅÄ¹----------------------------------
	--½«½ğË¿ÃæÕÖ½»¸øË¾ÂíÃù·ç
	if nStep_XBTask_01 == 16 then
		task_013_02_0();
		return
	end
	
	--ÉĞÎ´Ñ¯ÎÊÅ·Ñô»­ÈëÄ¹Çé¿ö
	if nStep_XBTask_01 == 17 then
		task_013_02_1();
		return
	end
	
	---------------------------------- Î÷±±Çø15·ÖÖ§1_6¹ÅÄ¹·çÔÆ----------------------------------
	--½«Ä«¶·ÓëÓñÅå½»¸øË¾ÂíÃù·ç
	if nStep_XBTask_01 == 28 then
		task_015_04_0();
		return
	end
	
	--»¹Î´ÓëÍØ°Îºë¶Ô»°
	if nStep_XBTask_01 == 29 then
		task_015_04_1();
		return
	end
	
	--ÔùËÍ»ÊÁêÃÜÊÒÃÅÆ±
	if GetBit(GetTask(GIVE_TICKET_STATE),3) ~= 1 and GetTask(2031) >= 68 then
		give_ticket_01();
		return
	end
	
	--Ò»°ãÇé¿öÏÂµÄ¶Ô»°
	strTalk = {
		{"Giang hå réng lín, ®©u lµ n¬i cÇn ®Õn?"},
		{"Vâ c«ng thiªn h¹ ®Ö nhÊt lµ ai?"},
		{"suy th¶o tµ d­¬ng, cæ b¸ch thiªn th­¬ng, cÈm tù ®« lai tam l­ìng hµnh…"},
		{"T©y H¹ qu¶ nhiªn lµ ®Êt ngäa hæ tµng long, nÕu kh«ng sao l¹i ©m m­u th«n tİnh trung nguyªn?"},
		}
	local i = random(1,getn(strTalk));

	--TalkEx("",strTalk[i]);
	return
	
end;

--ÔùËÍÃÅÆ±½Å±¾
function give_ticket_01()

local strTalk = {
	"T­ M· Minh Phong: Xin chµo <sex>, l©u råi kh«ng gÆp. Nghe nãi ng­¬i biÕt mét sè tin tøc trong Hoµng l¨ng mé ë chç LiÔu tiªn sinh, cã liªn quan ®Õn Tö Qu©n vî ta?",
	"Ng­êi ch¬i: §óng, T­ M· tiÒn bèi, ta ®Õn t×m «ng còng v× chuyÖn nµy, chuyÖn M« Kim phï cña LiÔu tiªn sinh ®ang cÊt giÊu, vî cña tiÒn bèi 18 n¨m tr­íc ®· vµo TÇn L¨ng t×m b¶o vËt. Ta ®· ®Õn l¨ng mé, nh­ng t×m kh«ng ra manh mèi cña bµ ta.",
	"T­ M· Minh Phong: §a t¹ <sex>, v× chuyÖn nµy mµ ng­¬i ®· ®Õn TÇn L¨ng. §èi víi vî ta, khi cÇm MÆc §Èu KiÕm mµ <sex> t×m gióp, ta ®· biÕt Tö Qu©n chÕt trong mé. Tö Qu©n lµ ng­êi con g¸i kiªn c­êng, lu«n cè chÊp, nÕu c« ta ®i t×m kiÕm th× sÏ kh«ng bá kiÕm mµ ®i. H¬n n÷a miÕng ngäc béi Minh Phong nµy kh«ng thÓ r¬i l¹i, ngäc cßn ng­êi cßn, ngäc chÕt ng­êi chÕt.",
	"Ng­êi ch¬i: Nh­ng tiÒn bèi, trong l¨ng mé kh«ng nh×n thÊy x¸c cña vî tiÒn bèi, sao cã thÓ dÔ dµng kÕt luËn vËy chø?",
	}
	
	TalkEx("give_ticket_02",strTalk);
	
end

function give_ticket_02()

local strTalk = {
	"T­ M· Minh Phong: T©m ı cña <sex>, ta kh¾c ghi vµo lßng. Cã lÏ ®èi víi Tö Qu©n, viÖc t×m kiÕm cña ta míi lµ mét kÕt côc. 18 n¨m, hy väng cña ta tan biÕn dÇn, sau nµy biÕt ®­îc Tö Qu©n v× MÆc §Èu kiÕm ®· vµo Hoµng l¨ng, hy väng nµy còng ®· ®Õn lóc. Nh­ng, theo kú väng cña Tö Qu©n, ta l¹i kh«ng d¸m quªn.",
	"Ng­êi ch¬i: Trong thêi gian 18 n¨m ®au khæ mµ tiÒn bèi chŞu ®ùng thËt sù kh«ng nhÑ.",
	"T­ M· Minh Phong: TÊt c¶ mäi chuyÖn mµ Tö Qu©n ®· lµm trong l¨ng mé, İt ra còng cho ta biÕt râ rµng, còng lµ chuyÖn ®¸ng an ñi, nãi ra cÇn ph¶i ®a t¹ <sex>, ®óng råi, kh«ng biÕt <sex> cã thÓ cho ta biÕt c¸ch vµo tÇng 2 l¨ng mé kh«ng?",
	"Ng­¬i ch¬i: TiÒn bèi muèn vµo l¨ng mé mét chuyÕn µ?",
	}
	
	TalkEx("give_ticket_03",strTalk);
	
end

function give_ticket_03()

local strTalk = {
	"T­ M· Minh Phong: Tuy kh«ng thÓ gÆp Tö Qu©n, nh­ng ®­îc vµo trong mé cóng tÕ linh hån cña c« Êy. Nh©n tiÖn gÆp Quû T­íng Qu©n.",
	"Ng­êi ch¬i: NÕu tiÒn bèi muèn vµo l¨ng mé, h·y cÈn thËn, Quû T­íng Qu©n kh«ng dÔ ®èi phã ®©u. H¬n n÷a khi §Ønh ngµn c©n trong mËt thÊt Hoµng l¨ng r¬i, th× kh«ng thÓ vµo l¹i mËt thÊt ®­îc.",
	"T­ M· Minh Phong: §Ønh ngµn c©n thùc chÊt lµ mét lo¹i c¬ quan trong l¨ng mé, ng­êi c­íp mé cã vËt ph¸. {To¸i Th¹ch ChÊn} cña hä lµ chuyªn dïng ®Ó ph¸ lo¹i c¬ quan nµy, ta v× t×m vî, ®· nghiªn cøu c¬ quan l¨ng mé rÊt nhiÒu, ®©y lµ To¸i Th¹ch ChÊn, ng­¬i cÇm ®i.",
	"Ng­êi ch¬i: §a t¹ tiÒn bèi, ta còng ®ang ®Şnh ®i gÆp Quû T­íng Qu©n, ®i th¨m dß l¹i manh mèi cña vî tiÒn bèi, nãi kh«ng chõng chóng ta cßn cã thÓ gÆp nhau ®Êy.",
	}
	
	TalkEx("",strTalk);
	AddItem(2,0,1033,1,1);--µÃµ½ËéÊ¯Õğ
	SetTask(GIVE_TICKET_STATE, SetBit(GetTask(GIVE_TICKET_STATE),3,1));
	
end
function get_mission_CSD()
	
--	if (GetTask(1537) > 0 and GetTask(1537) < 7) or (GetTask(1537) > 7 and GetTask(1537) < 12) or (GetTask(1537) >12 and GetTask(1537) < 22) or (GetTask(1537) >22 and GetTask(1537) < 30) or (GetTask(1537) >30 and GetTask(1537) < 36) then
--		Talk(1, "", "§¹i hiÖp ®ang nhËn nhiÖm vô ChuyÓn Sinh nªn kh«ng thÓ nhËn tiÕp nhiÖm vô nµy. H·y hoµn thµnh nhiÖm vô ChuyÓn Sinh xong råi quay l¹i.")
--		return
--	end
	if GetItemCount(2,1,30191) < 7 then
		Talk(1, "", "§¹i hiÖp ch­a mang theo ®ñ Ng«i sao may m¾n?")
		return
	end	
	if DelItem(2,1,30191, 7) == 1 then
		SetTask(TSK_CSD,1)
		Talk(1, "", "§¹i hiÖp h·y gióp ta lµm c¸c nhiÖm vô, ta sÏ chÕ t¹o ChuyÓn Sinh §¬n cho ®¹i hiÖp")
		Msg2Player("§¹i hiÖp h·y gióp ta lµm c¸c nhiÖm vô, ta sÏ chÕ t¹o ChuyÓn Sinh §¬n cho ®¹i hiÖp")
		gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho¹t thµnh c«ng", 1, "§K chuyÓn sinh ®¬n 1")
	end	
end
function get_CSD()
	--TSK_CSD_COUNT_A = 2748		--300 nv s­ m«n (x) - 30 lÇn th¸i h­ (y) - 81 tµi nguyªn chiÕn (z) - 30 lÇn L­¬ng S¬n (w)		- wwzzyyxxx
	--TSK_CSD_COUNT_B = 2749		--300 h¹t gièng (x) - 33 lÇn TrŞ An (y) - 33 lÇn Thñy l¬i (z)			- zzyyxxx
	--TSK_CSD_COUNT_C = 2750		--181 B¸t nh· nhá (x) - 99 b¸t nh· to (y) - 99 c©y tø linh (z)		- zzyyxxx
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "§¹i hiÖp ch­a mang theo ®ñ 333 B¸nh bét vµng.")
		return
	end
	if GetItemCount(2,2,8) < 999 then
		Talk(1, "", "§¹i hiÖp ch­a mang theo ®ñ Thiªn Th¹ch?")
		return
	end
	if nCSD_BNN < 181 or nCSD_BNL < 99 or nCSD_TLinh < 99 or nCSD_HG < 300 then
		Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh ®ñ sè l­îng trång c©y?")
		return
	end
	if nCSD_SuMon < 300 or nCSD_TH < 30 or nCSD_TNC < 81 or nCSD_LS < 30 then
		Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh ®ñ sè l­îng nhiÖm vô: S­ m«n, Th¸i H­, Tµi nguyªn chiÕn, L­¬ng S¬n?")
		return	
	end
	if nCSD_TA < 33 or nCSD_TL < 33 then
		Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh ®ñ sè l­îng nhiÖm vô: TrŞ An, Thñy L¬i?")
		return	
	end	
	if DelItem(1,1,15, 333) == 1 and DelItem(2,2,8, 999) == 1 then
		SetTask(TSK_CSD,2)
		 gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho¹t thµnh c«ng", 1, "§K chuyÓn sinh ®¬n 2")
	end

	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "Cã 'Thùc míi Vùc ®­îc §¹o', kh«ng cho ta ¨n no th× ta kh«ng cã sùc ®Ó chÕ t¹o ChuyÓn Sinh §¬n, h·y cho ta 333 B¸nh bét vµng ®Ó lãt d¹."
	
	tinsert(tbSayDialog, "Gióp ¨n no ®Ó chÕ t¹o ChuyÓn Sinh §¬n (tiªu hao 333 B¸nh bét vµng)/confirm_get_CSD")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/nothing"	)
		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end
function confirm_get_CSD()
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "§¹i hiÖp ch­a mang theo ®ñ 333 B¸nh bét vµng..")
		return
	end
	if GetTask(TSK_CSD) < 2 then
		Talk(1, "", "§¹i hiÖp kh«ng tháa ®iÒu kiÖn?")
		return
	end
	if DelItem(1,1,15, 333) == 1 then
		SetTask(TSK_CSD,3)
		 gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho¹t thµnh c«ng", 1, "§K chuyÓn sinh ®¬n 3")
	end
	local tbSayDialog = {};
	local nSaySize = 0;
	local szSayHead = "B©y giê ta sÏ chÕ t¹o ChuyÓn Sinh §¬n cho ®¹i hiÖp, nh­ng h·y cho ta thªm  333 B¸nh bét vµng ®Ó dù tr÷ nha !!!."
	
	tinsert(tbSayDialog, "ChÕ t¹o ChuyÓn Sinh §¬n (tiªu hao 333 B¸nh bét vµng)/get_confirm_get_CSD")
	tinsert(tbSayDialog,"KÕt thóc ®èi tho¹i/nothing"	)
		
	nSaySize = getn(tbSayDialog);
	Say(szSayHead, nSaySize, tbSayDialog);
	
end
function get_confirm_get_CSD()
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	if GetTask(TSK_CSD) >= 4 then
		Talk(1, "", "§¹i hiÖp ®· nhËn ChuyÓn Sinh §¬n råi?")
		return
	end
	if GetTask(TSK_CSD) < 3 then
		Talk(1, "", "§¹i hiÖp ch­a cho ta ¨n no?")
		return
	end
	if nCSD_BNN < 181 or nCSD_BNL < 99 or nCSD_TLinh < 99 or nCSD_HG < 300 then
		Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh ®ñ sè l­îng trång c©y?")
		return
	end
	if nCSD_SuMon < 300 or nCSD_TH < 30 or nCSD_TNC < 81 or nCSD_LS < 30 then
		Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh ®ñ sè l­îng nhiÖm vô: S­ m«n, Th¸i H­, Tµi nguyªn chiÕn, L­¬ng S¬n?")
		return	
	end
	if nCSD_TA < 33 or nCSD_TL < 33 then
		Talk(1, "", "§¹i hiÖp ch­a hoµn thµnh ®ñ sè l­îng nhiÖm vô: TrŞ An, Thñy L¬i?")
		return	
	end	
	if GetItemCount(1,1,15) < 333 then
		Talk(1, "", "§¹i hiÖp ch­a mang theo ®ñ 333 B¸nh bét vµng?")
		return
	end
	if gf_Judge_Room_Weight(3, 100," ") ~= 1 then
        	return
    end
	if DelItem(1,1,15, 333) == 1 and GetTask(TSK_CSD) == 3 then
		SetTask(TSK_CSD,4)
		gf_AddItemEx2({2,1,30345, 1,4}, "ChuyÓn Sinh §¬n", "CHUOI NHIEM VU CSD", "NHAN THANH CONG CSD")
	end
end
function exchange_CSD()
	if GetItemCount(2,1,30345) < 1 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo ChuyÓn Sinh §¬n ?")
		return
	end
	if GetItemCount(2,1,1006) < 2 then
		Talk(1, "", "§¹i hiÖp kh«ng mang theo Cöu Thiªn V« Cùc §¬n ?")
		return
	end
	if DelItem(2,1,30345,1) == 1	and DelItem(2,1,1006,2) == 1 then
		gf_AddItemEx2({2,1,30345, 1,1}, "ChuyÓn Sinh §¬n", "DOI CSD", "CSD THANH CONG", 30*24*60*60)		
	end
end
function get_CSD_infor()
	local nCSD_BNN = mod(GetTask(TSK_CSD_COUNT_C), 1000)	--181
	local nCSD_BNL = mod(floor(GetTask(TSK_CSD_COUNT_C) / 1000),100)	--99
	local nCSD_TLinh = mod(floor(GetTask(TSK_CSD_COUNT_C) / 100000)	,100)	--99
	local nCSD_HG = mod(GetTask(TSK_CSD_COUNT_B), 1000)		--300
	local nCSD_TA = mod(floor(GetTask(TSK_CSD_COUNT_B) / 1000),100)		--33
	local nCSD_TL = mod(floor(GetTask(TSK_CSD_COUNT_B) / 100000),100)		--33
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)		--300
	local nCSD_TH = mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000),100)		--30
	local nCSD_TNC = mod(floor(GetTask(TSK_CSD_COUNT_A) / 100000),100)		 --81
	local nCSD_LS = mod(floor(GetTask(TSK_CSD_COUNT_A) / 10000000),100)		--30
	Talk(1, "", "NhiÖm vô S­ m«n: "..nCSD_SuMon.."/300\nNhiÖm vô Th¸i H­ HuyÔn C¶nh: "..nCSD_TH.."/30\nNhiÖm vô Tµi Nguyªn ChiÕn: "..nCSD_TNC.."/81\nNhiÖm vô L­¬ng S¬n: "..nCSD_LS.."/30\nNhiÖm vô TrŞ An: "..nCSD_TA.."/33\nNhiÖm vô Thñy L¬i: "..nCSD_TL.."/33\nTrång H¹t Gièng: "..nCSD_HG.."/300\nTrång B¸t nh· nhá: "..nCSD_BNN.."/181\nTrång B¸t nh· to: "..nCSD_BNL.."/99\nTrång c©y Tø Linh: "..nCSD_TLinh.."/99")
end
function finish_sumon()
	local nCSD_SuMon = mod(GetTask(TSK_CSD_COUNT_A), 1000)
	local nRemain = 300 - nCSD_SuMon
	local nCost = nRemain * 4
	if nCSD_SuMon >= 300 then
		Talk(1, "", "B¹n ®· hoµn thµnh ®ñ sè l­îng nhiÖm vô yªu cÇu nªn kh«ng cÇn ta gióp ®ì !!!")
		return
	end
	if GetItemCount(2,1,30230) < nRemain * 4 then
		Talk(1, "", "Mçi nhiÖm vô tèn 4 xu vËt phÈm. B¹n kh«ng ®ñ "..nCost.."  xu vËt phÈm ®Ó hoµn thµnh "..nRemain.." nhiÖm vô cßn l¹i !!!")
		return	
	end
	if nCSD_SuMon < 300 and GetTask(TSK_CSD) == 1 then
		if DelItem(2,1,30230,nCost) == 1 then
			gf_WriteLogEx("THOA DIEU KIEN NHAN CSD", "kick ho¹t thµnh c«ng", 1, "Hoµn thµnh nhanh nv S­ M«n")
			SetTask(TSK_CSD_COUNT_A, GetTask(TSK_CSD_COUNT_A) + nRemain)
		end
	end
end
function nothing()

end