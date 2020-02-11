Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--Îäµ±Ë×¼Ò
--Îäµ±Ææ¾­ (¼¼ÄÜid=147)
[147]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--Îäµ±±Ê·¨ (¼¼ÄÜid=148)
[148]={
     levelless={3,1,0,147,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--Ì«ÒÒåĞÒ£¹¦ (¼¼ÄÜid=149)
[149]={
     levelless={3,1,0,148,1},
     [1]={1,12,1500,30},
     [2]={2,16,1500,30},
     [3]={5,28,0,30},
       },
--ÁùÆø»¯Óñ¹¦ (¼¼ÄÜid=150)
[150]={
     levelless={3,1,0,147,2},
     [1]={1,16,3000,60},
     [2]={2,19,2000,60},
     [3]={6,31,0,60},
     },
--ÌİÔÆ×İ (¼¼ÄÜid=151)
[151]={
     levelless={3,1,0,150,1},
     [1]={1,21,10000,100},
     [2]={2,26,5000,100},
     [3]={4,36,0,100},
     },
--ÆßĞÇ¾÷ (¼¼ÄÜid=152)
[152]={
     levelless={3,1,0,148,6},
     [1]={1,25,15000,300},
     [2]={2,28,5000,300},
     [3]={7,43,0,300},
     },
--ÉÙÑô¾÷ (¼¼ÄÜid=153)
[153]={
     levelless={3,1,0,149,3},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--ÉÙÒõ¾÷ (¼¼ÄÜid=154)
[154]={
     levelless={3,1,0,149,4},
     [1]={1,31,28000,500},
     [2]={2,34,10000,500},
     [3]={7,49,0,500},
     },
--±±¶·ÆßĞÇÕó (¼¼ÄÜid=155)
[155]={
     levelless={3,1,0,151,3},
     [1]={1,36,55000,600},
     [2]={2,39,30000,600},
     [3]={7,54,0,600},
     },
--²ĞÓ°¾÷ (¼¼ÄÜid=156)
[156]={
     levelless={3,1,0,152,4},
     [1]={1,42,110000,800},
     [2]={2,45,50000,800},
     [3]={6,57,0,800},
     },
--Ç¬À¤¾÷ (¼¼ÄÜid=157)
[157]={
     levelless={3,1,0,151,4},
     [1]={1,48,250000,1000},
     [2]={2,51,100000,1000},
     [3]={6,63,0,1000},
     },
--ÉÏÇåÎŞ¼«¹¦ (¼¼ÄÜid=158)
[158]={
     levelless={3,2,0,153,6,154,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--Ì«¼«Éñ¹¦ (¼¼ÄÜid=159)
[159]={
     levelless={5,3,1,156,6,157,6,158,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>´ú½£Öİ<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("Ng­¬i kh«ng ®ñ ®¼ng cÊp ®Ó häc vâ c«ng míi, t¨ng cÊp xong h·y quay l¹i ®©y.",0)
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
	Say("HÖ ph¸i ta b¶n th©n linh ho¹t, chiªu sè nhanh, chuÈn, m¹nh mÏ. Vò khİ ®Ö tö hÖ ph¸i th­êng sö dông vò khİ lµ <color=yellow>bót<color>. Kh«ng biÕt ta cã thÓ gióp g×?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/entersujia",
		"Häc vâ c«ng Vâ §ang tôc gia/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"VÊn an ®¹o tr­ëng/no")
end;

canjuan1 = 943
canjuan2 = 944
canjuan3 = 945

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 15 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, MËt tŞch trÊn ph¸i sao cã thÓ giao cho ng­¬i chø?", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- É¶Ò²Ã»ÓĞ
		Say("Ng­¬i ch­a tõng nhËn ®­îc trang mËt tŞch vâ c«ng nµo sao cã thÓ nãi lµ ®· cã nã?", 0)
		return
	end
	
	Say("ThËt kh«ng ngê th«ng qua luyÖn thøc ng­¬i l¹i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Ta sÏ gióp ng­¬i ®ãng l¹i thµnh mét quyÓn hoµn chØnh nh­ng thµnh c«ng hay kh«ng cßn xem ng­¬i cã may m¾n kh«ng.", 
		2,
		"§­a c¸c trang s¸ch cho s­ phô/hand_up_book",
		"Kh«ng cÇn ®©u/no")
end;

-- ½«²Ğ±¾½»¸øÊ¦¸¸
function hand_up_book()
	Say("NÕu nh­ ng­¬i cã ®ñ 3 tËp Th­îng_Trung_H¹, ta nhÊt ®Şnh sÏ ®ãng l¹i thµnh mét quyÓn hoµn", 
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
		AddItem(0, 112, 110, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Vâ §ang tôc gia, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Vâ §ang tôc gia thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","Xin lçi, ®æi lÊy MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


function sujia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("HÖ ph¸i ta b¶n th©n linh ho¹t, chiªu sè nhanh, chuÈn, m¹nh mÏ. Vò khİ ®Ö tö hÖ ph¸i th­êng sö dông vò khİ lµ bót. Kh«ng biÕt ta cã thÓ gióp g×?",0)
end;


function entersujia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 2 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i ph¶i ®­îc Vâ §ang ch­ëng m«n Tö H¹c Ch©n Nh©n chÊp thuËn míi ®­îc gia nhËp Vâ §ang, sau ®ã cã thÓ ®Õn t×m ta b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 13 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(15) == 0 then
			return
		end
		Say("Vi s­ chİnh thøc nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>TÈy l¹i ®iÓm tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i xem träng <color=yellow>Linh ho¹t<color>. Sau nµy h·y cè g¾ng rÌn luyÖn! Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng m«n tiÕp nhËn <color=yellow>NhiÖm vô m«n ph¸i<color>.",0)
		SetPlayerRoute(15)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(147)
		LearnSkill(148)
		AddItem(0,9,75,1,1,4,65,4,66)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö Vâ §ang tôc gia!")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng.")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ t×m Ch­ëng m«n nhËn nhiÖm vô ")
	elseif   GetPlayerRoute() == 15 then
	 	Say("Hõ! Sao kh«ng tranh thñ thêi gian luyÖn c«ng, c¶ ngµy cø lµm biÕng sao cã tiÒn ®å?",0)
	else
		Say("Ng­¬i lµ ®¹o gia ®Ö tö, ph¶i gäi ta lµ s­ thóc míi ph¶i!",0)
		
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 15 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Vâ §ang tôc gia.",0)
	else
		Say("Gãc ph¶i phİa d­íi biÓu t­îng vâ c«ng xuÊt hiÖn dÊu {v} biÓu thŞ cã thÓ häc vâ c«ng nµy, dÊu mòi tªn biÓu thŞ cã thÓ t¨ng cÊp, nhÊp trùc tiÕp vµo ®Ó t¨ng cÊp.",0)
		AllowLearnSkill()
	end
end;



function qijing()
learnskill(147)
end;

function bifa()
learnskill(148)
end;

function taiyi()
learnskill(149)
end;

function liuqi()
learnskill(150)
end;

function tiyun()
learnskill(151)
end;

function qixing()
learnskill(152)
end;

function shaoyang()
learnskill(153)
end;

function shaoyin()
learnskill(154)
end;

function qixingzhen()
learnskill(155)
end;

function canyin()
learnskill(156)
end;

function qiankun()
learnskill(157)
end;

function wuji()
learnskill(158)
end;

function taiji()
learnskill(159)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Cuèi cïng ng­¬i còng ®· nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 159) then	--Ì«¼«Éñ¹¦
		if (GetSkillLevel("Th¸i Cùc ThÇn C«ng") <= 0) then
			return "\'Th¸i Cùc ThÇn C«ng\' lµ <color=red>TuyÖt häc trÊn ph¸i<color>, kh«ng ph¶i ®Ö tö bæn m«n th× kh«ng thÓ n¾m ®­îc."
		end
	end
end

function afterlearnskill(id)
	if (id == 159) then	--Ì«¼«Éñ¹¦
		if (GetSkillLevel("Th¸i Cùc ThÇn C«ng") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th©m s©u, ®· b­íc ®Çu lÜnh ngé ®­îc \'Th¸i Cùc ThÇn C«ng\', thËt ®¸ng nÓ! <enter><color=green>Ng­êi ch¬i<color>: Nh­ng....s­ phô, t¹i sao khi con thö thi triÓn \'Th¸i Cùc ThÇn C«ng\', néi khİ ph©n t¸n, khã mµ thi triÓn? Nghe nãi Lôc M¹ch ThÇn KiÕm ë §o¹n ThŞ, ®· ao ­íc tõ l©u, h«m nay míi thö ®­îc. <enter>\'Th¸i Cùc ThÇn C«ng\' rÊt lîi h¹i, cho dï cã may m¾n häc ®­îc, muèn sö dông thµnh th¹o, ®ã kh«ng ph¶i lµ chuyÖn dÔ.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("Th¸i Cùc ThÇn C«ng") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th«ng minh, \'Th¸i Cùc ThÇn C«ng\' ®· lÜnh héi ®­îc 5 phÇn. Cßn xa míi ®¹t ®Õn c¶nh giíi cao nhÊt. Lo¹i vâ c«ng nµy gåm 20 cÊp, 5 cÊp sau cÇn thiÕu hiÖp khæ luyÖn h¬n n÷a, 10 cÊp cuèi cÇn cã mËt tİch trÊn ph¸i míi lÜnh héi ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th«i ®­îc, ®Ó ta vËn c«ng gióp ng­¬i thi triÓn \'Th¸i Cùc ThÇn C«ng\'.<enter><enter>RÊt l©u....<enter><enter>§­îc råi, s¸t khİ ®· h×nh thµnh, cã thÓ thö thi triÓn \'Th¸i Cùc ThÇn C«ng\'. TuyÖt häc trÊn ph¸i rÊt m¹nh, dïng ®Ó trõ gian diÖt b¹o, thay trêi hµnh ®¹o, kh«ng h¹i ng­êi v« téi...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

