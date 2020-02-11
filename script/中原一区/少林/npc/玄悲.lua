Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")
--¼¼ÄÜÁĞ±í
SKILLS={
--ÉÙÁÖË×¼Ò
--»ìÔªÒ»Æø¹¦ (¼¼ÄÜid=21)
[21]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--ÉÙÁÖµ¶·¨ (¼¼ÄÜid=22)
[22]={
     levelless={3,1,0,21,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--ÉÙÁÖ¹÷·¨ (¼¼ÄÜid=23)
[23]={
     levelless={3,1,0,21,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
       },
--Õ¶Ä§µ¶·¨ (¼¼ÄÜid=24)
[24]={
     levelless={3,1,1,22,1,0,0},
     [1]={1,12,1500,30},
     [2]={2,16,1500,30},
     [3]={5,28,0,30},
     },
--·âÄ§¹÷·¨ (¼¼ÄÜid=25)
[25]={
     levelless={3,1,1,23,1,0,0},
     [1]={1,15,2000,50},
     [2]={2,19,2000,50},
     [3]={5,31,0,50},
     },
--½ğÖÓÕÖ (¼¼ÄÜid=26)
[26]={
     levelless={3,1,1,21,5,0,0},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={10,40,0,100},
     },
--È¼Ä¾µ¶·¨ (¼¼ÄÜid=27)
[27]={
     levelless={3,1,1,24,4,0,0},
     [1]={1,29,20000,300},
     [2]={2,32,8000,300},
     [3]={7,47,0,300},
     },
--ÎŞ³£¹÷·¨ (¼¼ÄÜid=28)
[28]={
     levelless={3,1,1,25,4,0,0},
     [1]={1,32,30000,500},
     [2]={2,35,10000,500},
     [3]={7,50,0,500},
     },
--ÉáÉí¾÷ (¼¼ÄÜid=29)
[29]={
     levelless={3,1,1,26,6,0,0},
     [1]={1,39,80000,700},
     [2]={2,42,20000,700},
     [3]={6,54,0,700},
     },
--´ó³ËÈçÀ´ĞÄ·¨ (¼¼ÄÜid=30)
[30]={
     levelless={3,1,1,29,2,0,0},
     [1]={1,47,200000,1000},
     [2]={2,49,30000,1000},
     [3]={10,65,0,1000},
     },
--´ïÄ¦Îä¾­ (¼¼ÄÜid=31)
[31]={
     levelless={3,2,0,27,5,28,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--Ò×½î¾­ (¼¼ÄÜid=32)
[32]={
     levelless={5,2,1,30,10,31,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>Ğş±¯<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("§¼ng cÊp hiÖn thêi cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==3 then
		Say("§iÓm kinh nghiÖm hiÖn thêi cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==4 then
		Say("§iÓm danh väng hiÖn giê cña ng­¬i ch­a ®ñ, cÇn tİch lòy thªm nhĞ!",0)
	elseif n==5 then
		Say("Vâ c«ng tr­íc ®©y rÌn luyÖn ch­a thµnh thôc sao ta d¸m d¹y ng­¬i chiªu míi, dôc tèc bÊt ®¹t!",0)
	elseif n==6 then
		Say("Ng©n l­îng ng­¬i ®em theo kh«ng ®ñ, t×m ®ñ råi h·y quay l¹i nhĞ!",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	Say("A Di §µ PhËt! <color=yellow>§Ö tö tôc gia<color> tu luyÖn chñ yÕu rÌn luyÖn g©n cèt, cã thÓ luyÖn thµnh kim th©n bÊt ho¹i, chuyªn dïng <color=yellow>§ao<color>, <color=yellow>C«n<color>. BÇn t¨ng gióp g× ®­îc cho ng­¬i?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/entersujia",
		"Häc vâ c«ng ThiÕu L©m Tôc Gia/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"Tham kiÕn §¹i s­/no")
end;

canjuan1 = 916
canjuan2 = 917
canjuan3 = 918

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 2 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, MËt tŞch trÊn ph¸i sao cã thÓ giao cho ng­¬i chø?", 0)
		return
	end
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- É¶Ò²Ã»ÓĞ
		Say("A di ®µ phËt! Ng­êi xuÊt gia kh«ng ®­îc nãi dèi. Ng­¬i ch­a tõng nhËn trang mËt tŞch nµo sao l¹i b¶o lµ ®· cã nã?", 0)
		return
	end
	
	Say("ThËt kh«ng ngê th«ng qua luyÖn thøc ng­¬i l¹i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Ta sÏ gióp ng­¬i ®ãng l¹i thµnh mét quyÓn hoµn chØnh nh­ng thµnh c«ng hay kh«ng cßn xem ng­¬i cã may m¾n kh«ng n÷a.", 
		2,
		"§­a c¸c trang s¸ch cho s­ phô/hand_up_book",
		"Kh«ng cÇn ®©u/no")
end;

-- ½«²Ğ±¾½»¸øÊ¦¸¸
function hand_up_book()
	Say("NÕu nh­ ng­¬i cã ®ñ 3 tËp Th­îng_Trung_H¹, ta nhÊt ®Şnh sÏ ®ãng l¹i thµnh mét quyÓn hoµn chØnh cho ng­¬i.", 
		2,
		"§ång ı ®ãng s¸ch/confirm_change_book",
		"Kh«ng cÇn ®©u/no")
end;

-- È·ÈÏÕÒ»ØÍêÕûÃØ¼®
function confirm_change_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	local nSel = random(1, 100)
	local nCanChange = 0
	local nChangeType = 0;
	if (nBook1 >= 1 and nBook2 >= 1 and nBook3 >= 1) then	-- È«Æë£¬100%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1) then
			nCanChange = 1
		end
		nChangeType = 1;
	elseif (nBook1 >= 1 and nBook2 >= 1) then				-- ÉÏÖĞ£¬5%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 5) then
			nCanChange = 1
		end
		nChangeType = 2;
	elseif (nBook1 >= 1 and nBook3 >= 1) then				-- ÉÏÏÂ£¬50%
		if (DelItem(2, 1, canjuan1, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 50) then
			nCanChange = 1
		end
		nChangeType = 3;
	elseif (nBook2 >= 1 and nBook3 >= 1) then				-- ÖĞÏÂ£¬60%
		if (DelItem(2, 1, canjuan2, 1) == 1 and DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 60) then
			nCanChange = 1
		end
		nChangeType = 4;
	elseif (nBook1 >= 1) then								-- ÉÏ£¬1%
		if (DelItem(2, 1, canjuan1, 1) == 1 and nSel == 1) then
			nCanChange = 1
		end
		nChangeType = 5;
	elseif (nBook2 >= 1) then								-- ÖĞ£¬3%
		if (DelItem(2, 1, canjuan2, 1) == 1 and nSel <= 3) then
			nCanChange = 1
		end
		nChangeType = 6;
	elseif (nBook3 >= 1) then								-- ÏÂ£¬40%
		if (DelItem(2, 1, canjuan3, 1) == 1 and nSel <= 40) then
			nCanChange = 1
		end
		nChangeType = 7;
	end
	
	if (nCanChange == 1) then		-- ¿ÉÒÔ¸øÃØ¼®
		AddItem(0, 112, 101, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi 1 MËt tŞch trÊn ph¸i cña ThiÕu L©m tôc gia, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi MËt tŞch trÊn ph¸i cña ThiÕu L©m tôc gia thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","B¸o lçi, ®æi MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====

function shaolinsujia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("§Ö tö tôc gia tu luyÖn chñ yÕu rÌn luyÖn g©n cèt, cã thÓ luyÖn thµnh kim th©n bÊt ho¹i, chuyªn dïng ®ao, c«n.",0)
end;


function entersujia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 1 then	--ÃÅÅÉ¼ì²â
		Say("Ph¶i ph­¬ng tr­îng cho phĞp gia nhËp ThiÕu L©m míi cã thÓ ®Õn ®©y b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 1 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(2) == 0 then
			return
		end
		Say("Ng· phËt tõ bi, ng­¬i cã lßng vËy bÇn t¨ng nhÊt ®Şnh thu nhËn lµm ®Ö tö, gióp ®¶ th«ng l¹i kinh m¹ch <color=yellow>tÈy ®iÓm tiÒm n¨ng<color>. C«ng phu cña ta chñ yÕu <color=yellow>G©n cèt<color>, ng­¬i ®· gia nhËp l­u ph¸i giê cã thÓ ®Õn gÆp ph­¬ng tr­îng nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(2)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(21)
		LearnSkill(22)
		LearnSkill(23)
		AddItem(0,3,53,1,1,4,65,4,66)
		AddItem(0,5,29,1,1,4,65,4,66)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö tôc gia!")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Ph­¬ng tr­îng nhËn nhiÖm vô")
	elseif   GetPlayerRoute() == 2 then
	 	Say("Mau ®i luyÖn c«ng ®õng ®Ó mÊt mÆt vi s­.",0)
	else
		Say("Ta kh«ng ph¶i s­ phô cña ng­¬i, nhÇm råi!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 2 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cña ta kh«ng thÓ häc vâ c«ng tôc gia.",0)
	else
		Say("Kü n¨ng nµo d­íi gãc ph¶i cã dÊu mòi tªn th× cã thÓ häc, nhÊp chuét ®Ó t¨ng cÊp",0)
		AllowLearnSkill()
	end
end;


function hunyuanyiqi()
learnskill(21)
end;

function shaolindaofa()
learnskill(22)
end;

function shaolingunfa()
learnskill(23)
end;

function zhanmodaofa()
learnskill(24)
end;

function fengmogunfa()
learnskill(25)
end;

function ranmudaofa()
learnskill(26)
end;

function wuchanggunfa()
learnskill(27)
end;

function sheshenjue()
learnskill(28)
end;

function jinzhongzhao()
learnskill(29)
end;

function dachengrulaixinfa()
learnskill(30)
end;

function damowujing()
learnskill(31)
end;

function yijinjing()
learnskill(32)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 32) then	--Ò×½î¾­
		if (GetSkillLevel("DŞch C©n Kinh") <= 0) then
			return "“DŞch C©n Kinh” lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, chØ truyÒn cho ng­êi tµi giái."
		end
	end
end

function afterlearnskill(id)
	if (id == 32) then	--Ò×½î¾­
		if (GetSkillLevel("DŞch C©n Kinh") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt kh«ng tÖ, b­íc ®Çu ®· lÜnh héi “DŞch C©n Kinh” cña bæn m«n, thËt ®¸ng nÓ!<enter><color=green>Ng­êi ch¬i<color>: Nh­ng... th­a s­ phô, v× sao lóc ®Ö tö thi triÓn “DŞch C©n Kinh”, néi khİ trong ng­êi bŞ ph©n t¸n? §· nghe danh Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ tõ l©u, nghÜ ®Õn còng kh«ng d¸m, h«m nay l¹i cã dŞp thö. <enter>ThiÕu hiÖp cßn ch­a biÕt ®iÒu nµy, “DŞch C©n Kinh”rÊt m¹nh, cho dï may m¾n häc ®­îc, nh­ng ch­a ch¾c ®iÒu khiÓn ®­îc nã. Tinh khİ bªn trong c¬ thÓ kh«ng tİch tô thµnh “s¸t khİ”? (møc s¸t khİ), th× kh«ng thÓ thi triÓn vâ c«ng nµy, cÇn tiªu hao “s¸t khİ” bªn trong. “S¸t khİ” gåm 10 phÇn, t¨ng khi c«ng ph¸ s¸t th­¬ng, dÇn dÇn tİch tô l¹i.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("DŞch C©n Kinh") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt th«ng minh, “DŞch C©n Kinh” ®· lÜnh héi ®­îc 5 phÇn. Vâ c«ng nµy cã 20 cÊp, tõ cÊp 5 trë ®i thiÕu hiÖp cÇn ra søc luyÖn c«ng, ®Õn mét møc nhÊt ®Şnh sÏ t¨ng thªm 1 cÊp. Tõ cÊp 10 trë ®i ph¶i lÜnh héi MËt tŞch trÊn ph¸i cña bæn m«n, míi cã thÓ häc ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta ®ang vËn c«ng chØ dÉn ng­¬i tİch tô 10 phÇn s¸t khİ trong ng­êi, ®Ó ng­¬i thö thi triÓn “DŞch C©n Kinh”. <enter><enter>L©u sau...<enter><enter>S¸t khİ trong ng­êi thiÕu hiÖp ®· h×nh thµnh, lóc nµy cã thÓ thö thi triÓn “DŞch C©n Kinh”. TuyÖt häc trÊn ph¸i cña bæn m«n uy lùc dòng m·nh, chØ dïng ®Ó trõ b¹o gióp kÎ yÕu, thay trêi hµnh ®¹o, ®õng h¹i ng­êi v« téi, h·y nhí kü lÊy...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

