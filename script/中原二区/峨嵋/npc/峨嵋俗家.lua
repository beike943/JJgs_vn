Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--¶ğÃ¼Ë×¼Ò
--ÍûÔÂĞÄ·¨ (¼¼ÄÜid=90)
[90]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--ËæÒâÇú (¼¼ÄÜid=91)
[91]={
     levelless={3,1,0,90,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     	},
--ÇúÒÕ¾«Í¨ (¼¼ÄÜid=92)
[92]={
     levelless={3,1,0,90,1},
     [1]={1,12,1500,30},
     [2]={2,14,500,30},
     [3]={9,28,0,30},
       },
--ÔÂÊ´Çú (¼¼ÄÜid=93)
[93]={
     levelless={3,1,0,91,2},
     [1]={1,17,5000,60},
     [2]={2,19,800,60},
     [3]={8,31,0,60},
     },
--¶ÏË®ĞÄ·¨ (¼¼ÄÜid=94)
[94]={
     levelless={3,1,0,92,3},
     [1]={1,21,10000,100},
     [2]={2,24,3000,100},
     [3]={6,36,0,100},
     },
--¾²Ò¹Ë¼ (¼¼ÄÜid=95)
[95]={
     levelless={3,1,0,93,2},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={6,40,0,200},
     },
--ÓàÒôÈÆÁº¹¦ (¼¼ÄÜid=96)
[96]={
     levelless={3,1,0,92,6},
     [1]={1,29,20000,300},
     [2]={2,33,15000,300},
     [3]={5,45,0,300},
     },
--Ñô¹ØÈıµş (¼¼ÄÜid=97)
[97]={
     levelless={3,1,0,93,5},
     [1]={1,33,40000,500},
     [2]={2,36,12000,500},
     [3]={6,48,0,500},
     },
--¸²Ë®ĞÄ·¨ (¼¼ÄÜid=98)
[98]={
     levelless={3,1,0,94,4},
     [1]={1,37,60000,600},
     [2]={2,40,20000,600},
     [3]={6,52,0,600},
     },
--·ÙÇÙÖóº×¾÷ (¼¼ÄÜid=99)
[99]={
     levelless={3,2,0,98,1,96,2},
     [1]={1,42,110000,800},
     [2]={2,45,35000,800},
     [3]={7,60,0,800},
     },
--ÎÚÒ¹Ìä (¼¼ÄÜid=100)
[100]={
     levelless={3,1,0,95,6},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={6,63,0,1000},
     },
--ÃÔĞÄÆ®ÏãÇú (¼¼ÄÜid=101)
[101]={
     levelless={3,1,0,97,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--ÌìÒôÕò»êÇú (¼¼ÄÜid=102)
[102]={
     levelless={5,3,1,100,6,101,7,99,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}



function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>»ÛÒôÊ¦Ì«<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("Ng­¬i ch­a ®ñ ®¼ng cÊp ®Ó häc vâ c«ng míi, t¨ng cÊp xong hay quay l¹i.",0)
	elseif n==3 then
		Say("Ng­¬i ch­a ®ñ kinh nghiÖm ®Ó häc vâ c«ng míi, h·y quay l¹i sau?",0)
	elseif n==4 then
		Say("Ng­¬i ch­a ®ñ ®iÓm danh väng ®Ó häc vâ c«ng míi, h·y ®i lµm nhiÖm vô ®Ó tİch lòy ®iÓm danh väng!",0)
	elseif n==5 then
		Say("Vâ c«ng tr­íc ®©y vi s­ d¹y ng­¬i ch­a luyÖn thµnh, kh«ng thÓ d¹y ng­¬i vâ c«ng míi!",0)
	elseif n==6 then
		Say("Ng­¬i kh«ng cã ®ñ tiÒn, cã ph¶i ®Ó quªn trong r­¬ng chøa ®å?",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	Say("Theo <color=yellow>CÇm ph¸p<color> cã thÓ dïng néi c«ng ph¸t ra tiÕng ®µn tÊn c«ng kÎ ®Şch, ®Ö tö theo hÖ ph¸i nµy ph¶i dïng <color=yellow>®µn<color>. Kh«ng biÕt ta cã thÓ gióp g×?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/entersujia",
		"Häc vâ c«ng Nga My tôc gia/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"VÊn an S­ th¸i/no")
end;

canjuan1 = 931
canjuan2 = 932
canjuan3 = 933

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 9 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, MËt tŞch trÊn ph¸i sao cã thÓ giao cho ng­¬i chø?", 0)
		return
	end		

	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- É¶Ò²Ã»ÓĞ
		Say("Ng­¬i ch­a tõng nhËn ®­îc trang mËt tŞch vâ c«ng nµo sao cã thÓ nãi lµ ®· cã nã?", 0)
		return
	end
	
	Say("ThËt kh«ng ngê th«ng qua luyÖn thøc ng­¬i l¹i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Ta sÏ gióp ng­¬i ®ãng l¹i thµnh mét quyÓn hoµn chØnh nh­ng thµnh c«ng hay kh«ng cßn xem ng­¬i cã may m¾n kh«ng .", 
		2,
		"§­a c¸c trang s¸ch cho s­ phô/hand_up_book",
		"Kh«ng cÇn ®©u/no")
end;

-- ½«²Ğ±¾½»¸øÊ¦¸¸
function hand_up_book()
	Say("NÕu nh­ ng­¬i cã ®ñ 3 tËp Th­îng_Trung_H¹, ta nhÊt ®Şnh sÏ ®ãng l¹i thµnh mét quyÓn hoµn chØnh.", 
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
		AddItem(0, 112, 106, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Nga My tôc gia, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Nga My tôc gia thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","Xin lçi, ®æi lÊy MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====

function sujia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("Theo CÇm ph¸p cã thÓ dïng néi c«ng ph¸t ra tiÕng ®µn tÊn c«ng kÎ ®Şch, ®Ö tö theo hÖ ph¸i nµy ph¶i dïng ®µn. Kh«ng biÕt ta cã thÓ gióp g×?",0)
end;


function entersujia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 3 then	--ÃÅÅÉ¼ì²â
		Say("C« n­¬ng ph¶i ®­îc sù ®ång ı cña Ch©n Nh­ S­ Th¸i míi cã thÓ gia nhËp Nga My, sau ®ã míi cã thÓ b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 7 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(9) == 0 then
			return
		end
		Say("Trõ ma vÖ ®¹o lµ bæn phËn cña ®Ö tö Nga My. Ng­¬i cã quyÕt t©m nh­ thÕ ta rÊt vui mõng. Vi s­ chİnh thøc nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i ®iÓm tiÒm n¨ng<color>. Bæn m«n lÊy <color=yellow>Néi c«ng<color> lµm gèc, sau nµy h·y cè g¾ng luyÖn tËp. Giê cã thÓ ®Õn gÆp Ch­ëng m«n ®Ó tiÕp nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(9)	 --Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(90)
		LearnSkill(91)
		AddItem(0,10,64,1,1,4,67,4,68)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö tôc gia Nga My")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Ch­ëng m«n nhËn nhiÖm vô")
	elseif   GetPlayerRoute() == 9 then
	 	Say("H·y cè g¾ng luyÖn c«ng! Kh«ng chõng cã ngµy ng­¬i sÏ thay vi s­ ph¸t d­¬ng bæn ph¸i.",0)
	else
		Say("Ta kh«ng ph¶i lµ s­ phô cña ng­¬i, ng­¬i nªn gäi ta lµ s­ c« míi ®óng!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 9 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Nga My tôc gia.",0)
	else
		Say("Gãc ph¶i phİa d­íi biÓu t­îng vâ c«ng xuÊt hiÖn dÊu mòi tªn biÓu thŞ cã thÓ häc, nhÊn chuét ®Ó t¨ng cÊp.",0)
		AllowLearnSkill()
	end
end;

--Say("<color=green>»ÛÒôÊ¦Ì«<color>£ºÄãÒªÑ§Ï°Ê²Ã´¼¼ÄÜ£¿",13,"ÍûÔÂĞÄ·¨/wangyue","ËæÒâÇú/suiyi","ÇúÒÕ¾«Í¨/jingtong","ÔÂÊ´Çú/yueshi","¶ÏË®ĞÄ·¨/duanshui","¾²Ò¹Ë¼/jingye","ÓàÒôÈÆÁº¹¦/yuyin","Ñô¹ØÈıµş/yangguan","¸²Ë®ĞÄ·¨/fushui","·ÙÇÙÖóº×¾÷/fenqin","ÎÚÒ¹Ìä/wuye","ÃÔĞÄÆ®ÏãÇú/miren","ÌìÒôÕò»êÇú/zhenhun")

function wangyue()
learnskill(90)
end;

function suiyi()
learnskill(91)
end;

function jingtong()
learnskill(92)
end;

function yueshi()
learnskill(93)
end;

function duanshui()
learnskill(94)
end;

function jingye()
learnskill(95)
end;

function yuyin()
learnskill(96)
end;

function yangguan()
learnskill(97)
end;

function fushui()
learnskill(98)
end;

function fenqin()
learnskill(99)
end;

function wuye()
learnskill(100)
end;

function miren()
learnskill(101)
end;

function zhenhun()
learnskill(102)
end;



function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 102) then	--ÌìÒôÕò»êÇú
		if (GetSkillLevel("Thiªn ¢m TrÊn Hån Khóc") <= 0) then
			return "\'Thiªn ¢m TrÊn Hån Khóc\' lµ <color=red>TuyÖt häc trÊn ph¸i<color>, kh«ng ph¶i ®Ö tö bæn m«n th× kh«ng thÓ n¾m ®­îc."
		end
	end
end

function afterlearnskill(id)
	if (id == 102) then	--ÌìÒôÕò»êÇú
		if (GetSkillLevel("Thiªn ¢m TrÊn Hån Khóc") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th©m s©u, ®· b­íc ®Çu lÜnh ngé ®­îc \'Thiªn ¢m TrÊn Hån Khóc\', thËt ®¸ng nÓ! <enter><color=green>Ng­êi ch¬i<color>: Nh­ng....s­ phô, t¹i sao khi con thö thi triÓn \'Thiªn ¢m TrÊn Hån Khóc\', néi khİ ph©n t¸n, khã mµ thi triÓn? Nghe nãi Lôc M¹ch ThÇn KiÕm ë §o¹n ThŞ, ®· ao ­íc tõ l©u, h«m nay míi thö ®­îc. <enter>\'Thiªn ¢m TrÊn Hån Khóc\' rÊt lîi h¹i, cho dï cã may m¾n häc ®­îc, muèn sö dông thµnh th¹o, ®ã kh«ng ph¶i lµ chuyÖn dÔ.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("Thiªn ¢m TrÊn Hån Khóc") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th«ng minh, \'Thiªn ¢m TrÊn Hån Khóc\' ®· lÜnh héi ®­îc 5 phÇn. Cßn xa míi ®¹t ®Õn c¶nh giíi cao nhÊt. Lo¹i vâ c«ng nµy gåm 20 cÊp, 5 cÊp sau cÇn thiÕu hiÖp khæ luyÖn h¬n n÷a, 10 cÊp cuèi cÇn cã mËt tİch trÊn ph¸i míi lÜnh héi ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th«i ®­îc, ®Ó ta gióp ng­¬i thi triÓn \'Thiªn ¢m TrÊn Hån Khóc\'. <enter><enter>RÊt l©u....<enter><enter>§­îc råi, s¸t khİ ®· h×nh thµnh, cã thÓ thö thi triÓn \'Thiªn ¢m TrÊn Hån Khóc\'. TuyÖt häc trÊn ph¸i rÊt m¹nh, dïng ®Ó trõ gian diÖt b¹o, thay trêi hµnh ®¹o, kh«ng h¹i ng­êi v« téi...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

