Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--¶ğÃ¼³ö¼Ò
--ÓñÅ®ĞÄ¾­ (¼¼ÄÜid=75)
[75]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--¹ÛÒô¾÷ (¼¼ÄÜid=76)
[76]={
     levelless={3,1,0,75,1},
     [1]={1,10,1000,0},
     [2]={2,13,800,0},
     [3]={6,25,0,0},
     	},
--¶ëáÒ·ğÒâ (¼¼ÄÜid=77)
[77]={
     levelless={3,1,0,76,2},
     [1]={1,16,3000,50},
     [2]={2,20,3000,50},
     [3]={5,32,0,50},
       },
--ÓñÅ®½£·¨ (¼¼ÄÜid=78)
[78]={
     levelless={3,1,0,75,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--¶ÉÔª¾÷ (¼¼ÄÜid=79)
[79]={
     levelless={3,1,0,76,3},
     [1]={1,20,8000,80},
     [2]={2,23,2500,80},
     [3]={6,35,0,80},
     },
--·ğ¹âÆÕÕÕ (¼¼ÄÜid=80)
[80]={
     levelless={3,1,0,76,4},
     [1]={1,23,11000,100},
     [2]={2,27,7000,100},
     [3]={5,39,0,100},
     },
--Á«»ªĞÄ¾­ (¼¼ÄÜid=81)
[81]={
     levelless={3,1,0,76,4},
     [1]={1,26,15000,200},
     [2]={2,28,2500,200},
     [3]={8,40,0,200},
     },
--ÇåÒôèó³ª (¼¼ÄÜid=82)
[82]={
     levelless={3,1,0,79,3},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={7,48,0,300},
     },
--Á÷Ë®¾÷ (¼¼ÄÜid=83)
[83]={
     levelless={3,1,0,81,3},
     [1]={1,34,45000,500},
     [2]={2,36,7000,500},
     [3]={9,50,0,500},
     },
--ÆÕ¼ÃÖÚÉú (¼¼ÄÜid=84)
[84]={
     levelless={3,2,0,76,6,82,2},
     [1]={1,39,80000,700},
     [2]={2,42,20000,700},
     [3]={6,54,0,700},
     },
--²»ÃğĞÄ·¨ (¼¼ÄÜid=85)
[85]={
     levelless={3,1,0,83,2},
     [1]={1,43,100000,800},
     [2]={2,47,60000,800},
     [3]={5,59,0,800},
     },
--·ğ¹âÕ½Æø (¼¼ÄÜid=86)
[86]={
     levelless={3,1,0,80,5},
     [1]={1,48,220000,1000},
     [2]={2,51,70000,1000},
     [3]={6,63,0,1000},
     },
--·ğÒôÕ½Òâ (¼¼ÄÜid=87)
[87]={
     levelless={3,1,0,80,5},
     [1]={1,50,220000,1200},
     [2]={2,53,70000,1200},
     [3]={6,65,0,1200},
     },
--´ó´È´ó±¯Öä (¼¼ÄÜid=88)
[88]={
     levelless={3,1,0,84,4},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--ÍòÏàÉñ¹¦ (¼¼ÄÜid=89)
[89]={
     levelless={5,4,1,86,6,87,6,85,5,88,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>»ÛĞÄÊ¦Ì«<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("Ng­¬i kh«ng ®ñ ®¼ng cÊp ®Ó häc vâ c«ng míi, h·y quay l¹i sau?",0)
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
	Say("Phµm lµ ®Ö tö bæn ph¸i ph¶i toµn t©m h­íng PhËt, lÊy PhËt ph¸p ®é nh©n. <color=yellow>KiÕm<color> lµ vò khİ së tr­êng cña bæn ph¸i. Kh«ng biÕt ta cã thÓ gióp g×?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/enterfojia",
		"Häc vâ c«ng Nga My PhËt gia/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"VÊn an S­ th¸i/no")
end;

canjuan1 = 928
canjuan2 = 929
canjuan3 = 930

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 8 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, MËt tŞch trÊn ph¸i sao cã thÓ giao cho ng­¬i chø?", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- É¶Ò²Ã»ÓĞ
		Say("Ng­¬i ch­a tõng nhËn ®­îc trang mËt tŞch vâ c«ng nµo sao cã thÓ nãi lµ ®· cã nã?", 0)
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
		AddItem(0, 112, 105, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Nga My PhËt gia, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Nga My PhËt gia thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","Xin lçi, ®æi lÊy MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


function fojia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("Phµm lµ ®Ö tö bæn ph¸i ph¶i toµn t©m h­íng PhËt, lÊy PhËt ph¸p ®é nh©n. <color=yellow>KiÕm<color> lµ vò khİ së tr­êng cña bæn ph¸i.",0)
end;


function enterfojia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 3 then	  --ÃÅÅÉ¼ì²â
		Say("C« n­¬ng ph¶i ®­îc sù ®ång ı cña Ch©n Nh­ S­ Th¸i míi cã thÓ gia nhËp Nga My, sau ®ã míi cã thÓ b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 7 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(8) == 0 then
			return
		end
		Say("Trõ ma vÖ ®¹o lµ bæn phËn cña ®Ö tö Nga My. Ng­¬i cã quyÕt t©m nh­ thÕ ta rÊt vui mõng. Vi s­ chİnh thøc nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i ®iÓm tiÒm n¨ng<color>. Bæn m«n lÊy <color=yellow>Néi c«ng<color> lµm gèc, sau nµy h·y cè g¾ng luyÖn tËp. Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng m«n ®Ó tiÕp nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(8)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(75)
		LearnSkill(76)
		AddItem(0,2,16,1,1,4,67,4,68)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö PhËt gia Nga My")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng.")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Ch­ëng m«n nhËn nhiÖm vô")
	elseif   GetPlayerRoute() == 8 then
	 	Say("H·y cè g¾ng luyÖn c«ng! Kh«ng chõng cã ngµy ng­¬i sÏ thay vi s­ ph¸t d­¬ng bæn ph¸i.",0)
	else
		Say("S­ phô cña ng­¬i lµ HuÖ ¢m S­ Th¸i míi ph¶i.",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 8 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Nga My PhËt gia.",0)
	else
		Say("Gãc ph¶i phİa d­íi biÓu t­îng vâ c«ng xuÊt hiÖn dÊu mòi tªn biÓu thŞ cã thÓ häc vâ c«ng nµy, nhÊn chuét ®Ó t¨ng cÊp.",0)
		AllowLearnSkill()
	end
end;




function sunv()
learnskill(75)
end;

function guanyin()
learnskill(76)
end;

function foyi()
learnskill(77)
end;

function yunv()
learnskill(78)
end;

function duyuan()
learnskill(79)
end;

function puzhao()
learnskill(80)
end;

function lianhua()
learnskill(81)
end;

function qingyin()
learnskill(82)
end;

function liushui()
learnskill(83)
end;

function puji()
learnskill(84)
end;

function bumie()
learnskill(85)
end;

function zhanqi()
learnskill(86)
end;

function zhanyi()
learnskill(87)
end;

function dabei()
learnskill(88)
end;

function wanxiang()
learnskill(89)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 89) then	--ÍòÏàÉñ¹¦
		if (GetSkillLevel("V¹n T­íng ThÇn C«ng") <= 0) then
			return "\'V¹n T­íng thÇn c«ng\' lµ <color=red>TuyÖt häc trÊn ph¸i<color>, kh«ng ph¶i ®Ö tö bæn m«n th× kh«ng thÓ n¾m ®­îc."
		end
	end
end

function afterlearnskill(id)
	if (id == 89) then	--ÍòÏàÉñ¹¦
		if (GetSkillLevel("V¹n T­íng ThÇn C«ng") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th©m s©u, ®· b­íc ®Çu lÜnh ngé ®­îc \'V¹n T­íng thÇn c«ng\', thËt ®¸ng nÓ! <enter><color=green>Ng­êi ch¬i<color>: Nh­ng....s­ phô, t¹i sao khi con thö thi triÓn \'V¹n T­íng thÇn c«ng\', néi khİ ph©n t¸n, khã mµ thi triÓn? Nghe nãi Lôc M¹ch ThÇn KiÕm ë §o¹n ThŞ, ®· ao ­íc tõ l©u, h«m nay míi thö ®­îc. <enter>\'V¹n T­íng thÇn c«ng\' rÊt lîi h¹i, cho dï cã may m¾n häc ®­îc, muèn sö dông thµnh th¹o, ®ã kh«ng ph¶i lµ chuyÖn dÔ.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("V¹n T­íng ThÇn C«ng") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th«ng minh, \'V¹n T­íng thÇn c«ng\' ®· lÜnh héi ®­îc 5 phÇn. Cßn xa míi ®¹t ®Õn c¶nh giíi cao nhÊt. Lo¹i vâ c«ng nµy gåm 20 cÊp, 5 cÊp sau cÇn thiÕu hiÖp khæ luyÖn h¬n n÷a, 10 cÊp cuèi cÇn cã mËt tİch trÊn ph¸i míi lÜnh héi ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th«i ®­îc, ®Ó ta gióp ng­¬i thi triÓn \'V¹n T­íng thÇn c«ng\'. <enter><enter>RÊt l©u....<enter><enter>§­îc råi, s¸t khİ ®· h×nh thµnh, cã thÓ thö thi triÓn \'V¹n T­íng thÇn c«ng\'. TuyÖt häc trÊn ph¸i rÊt m¹nh, dïng ®Ó trõ gian diÖt b¹o, thay trêi hµnh ®¹o, kh«ng h¹i ng­êi v« téi...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

