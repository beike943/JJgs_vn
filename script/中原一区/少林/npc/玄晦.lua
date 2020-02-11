Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--ÉÙÁÖìøÉ®
--ÉÙÁÖìøÔ²¹¦ (¼¼ÄÜid=45)
[45]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--·ü»¢Æø¹¦ (¼¼ÄÜid=46)
[46]={
     levelless={3,1,0,45,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     	},
--ÉÙÁÖĞŞĞÄ·¨ (¼¼ÄÜid=47)
[47]={
     levelless={3,1,0,45,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={6,27,0,30},
       },
--Îå×ªÖ¸ (¼¼ÄÜid=48)
[48]={
     levelless={3,1,0,47,1},
     [1]={1,15,3000,50},
     [2]={2,17,800,50},
     [3]={10,33,0,50},
     },
--ÆÆÄ§Öä (¼¼ÄÜid=49)
[49]={
     levelless={3,1,0,47,2},
     [1]={1,20,8000,80},
     [2]={2,22,1000,80},
     [3]={8,34,0,80},
     },
--½ğ¸Õ²»»µ (¼¼ÄÜid=50)
[50]={
     levelless={3,1,0,48,2},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={10,40,0,100},
     },
--ÒòÍÓÂŞÀ×Ó¡ÆÆ (¼¼ÄÜid=51)
[51]={
     levelless={3,1,0,46,5},
     [1]={1,26,15000,300},
     [2]={2,28,2500,300},
     [3]={8,40,0,300},
     },
--ôÂôÄ·üÄ§ÉñÍ¨ (¼¼ÄÜid=52)
[52]={
     levelless={3,1,0,46,6},
     [1]={1,31,25000,500},
     [2]={2,33,5000,500},
     [3]={8,45,0,500},
     },
--ÎŞÏàÉñ¹¦ (¼¼ÄÜid=53)
[53]={
     levelless={3,1,0,50,4},
     [1]={1,36,55000,600},
     [2]={2,39,18000,600},
     [3]={6,51,0,600},
     },
--Ê¨×Óºğ (¼¼ÄÜid=54)
[54]={
     levelless={3,1,0,52,4},
     [1]={1,43,120000,800},
     [2]={2,47,70000,800},
     [3]={5,59,0,800},
     },
--²»¶¯Ã÷ÍõÖä (¼¼ÄÜid=55)
[55]={
     levelless={3,1,0,49,6},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={7,66,0,1000},
     },
--´óÁ¦½ğ¸ÕÖ¸ (¼¼ÄÜid=56)
[56]={
     levelless={3,2,0,51,6,54,2},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--Ï´Ëè¾­ (¼¼ÄÜid=57)
[57]={
     levelless={5,3,1,55,7,53,6,56,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>Ğş»Ş<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("§¼ng cÊp cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==3 then
		Say("§iÓm kinh nghiÖm cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==4 then
		Say("§iÓm danh väng cña ng­¬i kh«ng ®ñ, cÇn tİch lòy thªm nhĞ!",0)
	elseif n==5 then
		Say("Vâ c«ng tr­íc ®©y rÌn luyÖn ch­a thµnh thôc sao ta d¸m d¹y ng­¬i chiªu míi, dôc tèc bÊt ®¹t!",0)
	elseif n==6 then
		Say("Ng©n l­îng cña ng­¬i kh«ng ®ñ, t×m ®ñ råi h·y quay l¹i nhĞ!",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	Say("A Di §µ PhËt! §Ö tö tu thiÒn cã thÓ dïng phËt ph¸p v« biªn ®¶o ng­îc ngò hµnh, ®ång thêi dïng néi lùc m¹nh b¶o vÖ b¶n th©n hoÆc ®¶ th­¬ng ®Şch. <color=yellow>Tİch Tr­îng<color> lµ ph¸p b¶o chuyªn dïng. BÇn t¨ng gióp g× ®­îc cho ng­¬i?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/entercanseng",
		"Häc vâ c«ng ThiÕu L©m ThiÒn T¨ng/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"Tham kiÕn §¹i s­/no")
end;

canjuan1 = 922
canjuan2 = 923
canjuan3 = 924

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 3 then	--Á÷ÅÉ¼ì²â
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
		AddItem(0, 112, 103, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi 1 MËt tŞch trÊn ph¸i cña ThiÕu L©m thiÒn t«ng, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi MËt tŞch trÊn ph¸i cña ThiÕu L©m thiÒn t«ng thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","B¸o lçi, ®æi MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


function shaolincanseng()	--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()	--²ì¿´¼¼ÄÜ
Say("§Ö tö tu thiÒn cã thÓ dïng phËt ph¸p v« biªn ®¶o ng­îc ngò hµnh, ®ång thêi dïng néi lùc m¹nh b¶o vÖ b¶n th©n hoÆc ®¶ th­¬ng ®Şch. Tİch Tr­îng lµ ph¸p b¶o chuyªn dïng.",0)
end;


function entercanseng()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 1 then	--ÃÅÅÉ¼ì²â
		Say("Ph¶i ph­¬ng tr­îng cho phĞp gia nhËp ThiÕu L©m míi cã thÓ ®Õn ®©y b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 1 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó
		if join_route_main(3) == 0 then
			return
		end
		Say("Khæ ¶i v« biªn, quay ®Çu lµ bê, bÇn t¨ng chİnh thøc thu nhËn ng­¬i lµm ®Ö tö, gióp ®¶ th«ng l¹i kinh m¹ch <color=yellow>tÈy ®iÓm tiÒm n¨ng<color>. C«ng phu cña ta chñ yÕu <color=yellow>Néi c«ng<color>, ng­¬i ®· gia nhËp l­u ph¸i giê cã thÓ ®Õn gÆp ph­¬ng tr­îng nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(3)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(45)
		LearnSkill(46)
		AddItem(0,8,86,1,1,4,67,4,68)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö thiÒn t¨ng!")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Ph­¬ng tr­îng nhËn nhiÖm vô")
	elseif   GetPlayerRoute() == 3 then
	 	Say("Mau ®i luyÖn c«ng ®õng ®Ó mÊt mÆt vi s­.",0)
	else
		Say("Ta kh«ng ph¶i s­ phô cña ng­¬i, nhÇm råi!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 3 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cña ta kh«ng thÓ häc vâ c«ng ThiÕu L©m thiÒn t¨ng.",0)
	else
		Say("Kü n¨ng nµo d­íi gãc ph¶i cã dÊu mòi tªn th× cã thÓ häc, nhÊp chuét ®Ó t¨ng cÊp",0)
		AllowLearnSkill()
	end
end;

--Say("<color=green>Ğş»Ş<color>£ºÄãÒªÑ§Ï°Ê²Ã´¼¼ÄÜ£¿",13,"ÉÙÁÖìøÔ²¹¦/chanyuan","·ü»¢Æø¹¦/fuhu","ÉÙÁÖĞŞĞÄ·¨/xiuxin","Îå×ªÖ¸/wuzhuan","ÆÆÄ§Öä/pomo","½ğ¸Õ²»»µ/buhuai","ÒòÍÓÂŞÀ×Ó¡ÆÆ/leiyin","ôÂôÄ·üÄ§ÉñÍ¨/fumo","ÎŞÏàÉñ¹¦/wuxiang","Ê¨×Óºğ/sizihou","²»¶¯Ã÷ÍõÖä/mingwang","´óÁ¦½ğ¸ÕÖ¸/jingang","Ï´Ëè¾­/xisui")


function chanyuan()
learnskill(45)
end;

function fuhu()
learnskill(46)
end;

function xiuxin()
learnskill(47)
end;

function wuzhuan()
learnskill(48)
end;

function pomo()
learnskill(49)
end;

function buhuai()
learnskill(50)
end;

function leiyin()
learnskill(51)
end;

function fumo()
learnskill(52)
end;

function wuxiang()
learnskill(53)
end;

function sizihou()
learnskill(54)
end;

function mingwang()
learnskill(55)
end;

function jingang()
learnskill(56)
end;

function xisui()
learnskill(57)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 57) then	--Ï´Ëè¾­
		if (GetSkillLevel("TÈy Tñy Kinh") <= 0) then
			return "“TÈy Tñy Kinh” lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, chØ truyÒn cho ng­êi tµi giái."
		end
	end
end

function afterlearnskill(id)
	if (id == 57) then	--Ï´Ëè¾­
		if (GetSkillLevel("TÈy Tñy Kinh") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt kh«ng tÖ, b­íc ®Çu ®· lÜnh héi “TÈy Tñy Kinh” cña bæn m«n, thËt ®¸ng nÓ!<enter><color=green>Ng­êi ch¬i<color>: Nh­ng... th­a s­ phô, v× sao lóc ®Ö tö thi triÓn “TÈy Tñy Kinh”, néi khİ trong ng­êi bŞ ph©n t¸n? §· nghe danh Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ tõ l©u, nghÜ ®Õn còng kh«ng d¸m, h«m nay l¹i cã dŞp thö. <enter>ThiÕu hiÖp cßn ch­a biÕt ®iÒu nµy, “TÈy Tñy Kinh”rÊt m¹nh, cho dï may m¾n häc ®­îc, nh­ng ch­a ch¾c ®iÒu khiÓn ®­îc nã. Tinh khİ bªn trong c¬ thÓ kh«ng tİch tô thµnh “s¸t khİ”? (møc s¸t khİ), th× kh«ng thÓ thi triÓn vâ c«ng nµy, cÇn tiªu hao “s¸t khİ” bªn trong. “S¸t khİ” gåm 10 phÇn, t¨ng khi c«ng ph¸ s¸t th­¬ng, dÇn dÇn tİch tô l¹i.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("TÈy Tñy Kinh") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt th«ng minh, “TÈy Tñy Kinh” ®· lÜnh héi ®­îc 5 phÇn. Vâ c«ng nµy cã 20 cÊp, tõ cÊp 5 trë ®i thiÕu hiÖp cÇn ra søc luyÖn c«ng, ®Õn mét møc nhÊt ®Şnh sÏ t¨ng thªm 1 cÊp. Tõ cÊp 10 trë ®i ph¶i lÜnh héi MËt tŞch trÊn ph¸i cña bæn m«n, míi cã thÓ häc ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta ®ang vËn c«ng chØ dÉn ng­¬i tİch tô 10 phÇn s¸t khİ trong ng­êi, ®Ó ng­¬i thö thi triÓn “TÈy Tñy Kinh”. <enter><enter>L©u sau...<enter><enter>S¸t khİ trong ng­êi thiÕu hiÖp ®· h×nh thµnh, lóc nµy cã thÓ thö thi triÓn “TÈy Tñy Kinh”. TuyÖt häc trÊn ph¸i cña bæn m«n uy lùc dòng m·nh, chØ dïng ®Ó trõ b¹o gióp kÎ yÕu, thay trêi hµnh ®¹o, ®õng h¹i ng­êi v« téi, h·y nhí kü lÊy...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

