Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
  local nTaskValue = FN_GetTaskState(FN_YM);
  local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValue==1) then
		task_103();
		return
	elseif (nTaskValue==2) then
		Say("Tµo B©n ë thµnh BiÖn Kinh.",0);
		return
	elseif (nTaskValue==3) then
		Say("Ng­êi B¸n ngùa ë BiÖn Kinh c¸ch cæng binh bé kh«ng xa!",0);
		return
	elseif (nTaskValue==4) then
		Say("H·y ®Õn Tµo B©n håi b¸o chuyÖn chiÕn m·!",0);
		return
  elseif (nTaskValue==5) then
		task_111();
		return
	elseif (nTaskValue==6) then
		task_113();
		return
	elseif (nTaskValue==7) then
		Say("Giê cã thÓ ®Õn gÆp Xa Th¸i Qu©n råi!",0);
		return
	end;
	
	if  GetSex()==1 then
		if (nTaskValue>=8) or (nTaskValue==0) then
		Say("D­¬ng M«n th­¬ng kş ta ®Ó c¸c <color=yellow>®Ö tö th­¬ng kş<color> luyÖn tËp! Giái vÒ x«ng pha chiÕn trËn, giÕt giÆc lËp c«ng! <color=yellow>Tr­êng th­¬ng<color> lµ vò khİ chuyªn dông! Cã muèn ta gióp g× kh«ng?",
			4,
			"Tham kiÕn gi¸o ®Çu/entersujia",
			"Häc vâ c«ng Th­¬ng Kş D­¬ng M«n/skilllearn",
			"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
			"Tham kiÕn t­íng qu©n/no")
		end
	end 
		  
	if  GetSex()==2 then
		if (nTaskValuem>=8) or (nTaskValuem==0) then
		Say("D­¬ng M«n th­¬ng kş ta ®Ó c¸c <color=yellow>®Ö tö th­¬ng kş<color> luyÖn tËp! Giái vÒ x«ng pha chiÕn trËn, giÕt giÆc lËp c«ng! <color=yellow>Tr­êng th­¬ng<color> lµ vò khİ chuyªn dông! Cã muèn ta gióp g× kh«ng?",
			4,
			"Tham kiÕn gi¸o ®Çu/entersujia",
			"Häc vâ c«ng Th­¬ng Kş D­¬ng M«n/skilllearn",
			"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
			"Tham kiÕn t­íng qu©n/no")
		else
			Say("Ng­¬i ®i b¸o danh sau ®ã quay l¹i.",0);
   		end;
	end;
end	
	
canjuan1 = 946
canjuan2 = 947
canjuan3 = 948

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 17 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, MËt tŞch trÊn ph¸i sao cã thÓ giao cho ng­¬i chø?", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- É¶Ò²Ã»ÓĞ
		Say("Ng­¬i ch­a tõng nhËn ®­îc trang mËt tŞch vâ c«ng nµo sao cã thÓ nãi lµ ®· cã nã?", 0)
		return
	end
	
	Say("ThËt kh«ng ngê th«ng qua luyÖn thøc ng­¬i l¹i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Ta sÏ gióp ng­¬i ®ãng l¹i thµnh mét quyÓn hoµn chØnh nh­ng thµnh c«ng hay kh«ng cßn tïy vµo may m¾n!", 
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
		AddItem(0, 112, 111, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi 1 MËt tŞch trÊn ph¸i cña D­¬ng M«n th­¬ng kş, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi MËt tŞch trÊn ph¸i cña D­¬ng M«n th­¬ng kş thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","B¸o lçi, ®æi MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


--¼¼ÄÜÁĞ±í
SKILLS={
--ÑîÃÅÇ¹Æï
--Ñî¼ÒÇ¹ĞÄ·¨ (¼¼ÄÜid=720)
[720]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--Ñî¼ÒÇ¹·¨×Ü¾ö (¼¼ÄÜid=721)
[721]={
     levelless={3,1,0,720,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--Ñî¼ÒÆÆ·çÇÀ (¼¼ÄÜid=722)
[722]={
     levelless={3,1,0,721,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--Ñî¼ÒÔ¦ÂíÊõ (¼¼ÄÜid=723)
[723]={
     levelless={3,1,0,721,3},
     [1]={1,16,3000,50},
     [2]={2,18,1200,50},
     [3]={8,30,0,50},
     },
--Ñî¼Ò±¼ÀÇÇÀ (¼¼ÄÜid=724)
[724]={
     levelless={3,1,0,721,4},
     [1]={1,20,8000,100},
     [2]={2,23,2500,100},
     [3]={7,38,0,100},
     },
--Ñî¼ÒÕ½¶¨¾÷ (¼¼ÄÜid=725)
[725]={
     levelless={3,1,0,721,6},
     [1]={1,24,13000,180},
     [2]={2,27,4500,180},
     [3]={6,39,0,180},
     },
--Ñî¼ÒÇÉÕ½¾÷ (¼¼ÄÜid=726)
[726]={
     levelless={3,1,0,723,5},
     [1]={1,29,20000,300},
     [2]={2,33,15000,300},
     [3]={5,45,0,300},
     },
--Ñî¼ÒÌìºâÇ¹ (¼¼ÄÜid=727)
[727]={
     levelless={3,1,0,722,6},
     [1]={1,34,45000,500},
     [2]={2,37,15000,500},
     [3]={7,52,0,500},
     },
--Ñî¼ÒÓ¢ĞÛÆø (¼¼ÄÜid=728)
[728]={
     levelless={3,1,0,725,4},
     [1]={1,38,70000,600},
     [2]={2,41,25000,600},
     [3]={6,53,0,600},
     },
--Ñî¼Òµ¹º£Ç¹ (¼¼ÄÜid=729)
[729]={
     levelless={3,1,0,724,6},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={6,59,0,800},
     },
--Ñî¼ÒÓùÂíÊõ (¼¼ÄÜid=730)
[730]={
     levelless={3,2,0,726,4,728,2},
     [1]={1,48,250000,1000},
     [2]={2,51,100000,1000},
     [3]={6,63,0,1000},
     },
--±ÌÔÂ·ÉĞÇÇ¹ (¼¼ÄÜid=731)
[731]={
     levelless={3,2,0,727,6,729,3},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--Á¬»·×êÁúÇ¹ (¼¼ÄÜid=732)
[732]={
     levelless={5,2,1,730,6,731,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}



function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>Ñî×Ú±£<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
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



function shaolinsujia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("Vâ c«ng ta d¹y ng­¬i thuéc D­¬ng M«n th­¬ng kş, x«ng pha chiÕn trËn, giÕt giÆc lËp c«ng lµ ­u ®iÓm! Tr­êng th­¬ng lµ vò khİ chuyªn dïng!",0)
end;


function entersujia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 6 then	--ÃÅÅÉ¼ì²â
		Say("H·y t×m Xa Th¸i Qu©n xin gia nhËp D­¬ng M«n råi ®Õn ®©y häc vâ nghÖ!",0)
	elseif   GetPlayerRoute() == 16 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(17) == 0 then
			return
		end
		Say("Tèt! Sau nµy theo ta häc vâ c«ng! Ta ®· gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i ®iÓm tiÒm n¨ng<color>. Vâ c«ng Th­¬ng Kş lÊy <color=yellow>Søc m¹nh<color> lµm gèc! Giê ng­¬i cã thÓ ®Õn Xa Th¸i Qu©n nhËn <color=yellow>NhiÖm vô s­ m«n<color>!",0)
		SetPlayerRoute(17)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(720)
		AddItem(0,105,10,1)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö D­¬ng M«n th­¬ng kş!")
		TaskTip("B¹n ®· ®­îc tÈy l¹i ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Xa Th¸i Qu©n nhËn nhiÖm vô.")
	elseif   GetPlayerRoute() == 17 then
	 	Say("Ng­¬i ph¶i siªng n¨ng luyÖn tËp, ®õng ®Ó mÊt mÆt ta!",0)
	else
		Say("Ta kh«ng ph¶i lµ s­ phô cña ng­¬i, nhÇm råi!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 17 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ th­¬ng kş ®Ö tö, kh«ng thÓ häc vâ c«ng th­¬ng kş cña D­¬ng M«n",0)
	else
		Say("Gãc ph¶i d­íi cña h×nh t­îng vâ c«ng cã dÊu *v*, biÓu thŞ cã thÓ häc; dÊu mòi tªn biÓu thŞ cã thÓ t¨ng cÊp! NhÊp trùc tiÕp vµo ®Ó th¨ng",0)
		AllowLearnSkill()
	end
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 732) then	--Á¬»·×êÁúÇ¹
		if (GetSkillLevel("Liªn Hoµn Toµn Long th­¬ng") <= 0) then
			return "“Liªn Hoµn Toµn Long Th­¬ng” lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, chØ truyÒn cho ng­êi tµi giái."
		end
	end
end

function afterlearnskill(id)
	if (id == 732) then	--Á¬»·×êÁúÇ¹
		if (GetSkillLevel("Liªn Hoµn Toµn Long th­¬ng") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt kh«ng tÖ, b­íc ®Çu ®· lÜnh héi “Liªn Hoµn Toµn Long Th­¬ng” cña bæn m«n, thËt ®¸ng nÓ!<enter><color=green>Ng­êi ch¬i<color>: Nh­ng... th­a s­ phô, v× sao lóc ®Ö tö thi triÓn “Liªn Hoµn Toµn Long Th­¬ng”, néi khİ trong ng­êi bŞ ph©n t¸n? §· nghe danh Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ tõ l©u, nghÜ ®Õn còng kh«ng d¸m, h«m nay l¹i cã dŞp thö. <enter>ThiÕu hiÖp cßn ch­a biÕt ®iÒu nµy, “Liªn Hoµn Toµn Long Th­¬ng”rÊt m¹nh, cho dï may m¾n häc ®­îc, nh­ng ch­a ch¾c ®iÒu khiÓn ®­îc nã. Tinh khİ bªn trong c¬ thÓ kh«ng tİch tô thµnh “s¸t khİ”? (møc s¸t khİ), th× kh«ng thÓ thi triÓn vâ c«ng nµy, cÇn tiªu hao “s¸t khİ” bªn trong. “S¸t khİ” gåm 10 phÇn, t¨ng khi c«ng ph¸ s¸t th­¬ng, dÇn dÇn tİch tô l¹i.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("Liªn Hoµn Toµn Long th­¬ng") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt th«ng minh, “Liªn Hoµn Toµn Long Th­¬ng” ®· lÜnh héi ®­îc 5 phÇn. Vâ c«ng nµy cã 20 cÊp, tõ cÊp 5 trë ®i thiÕu hiÖp cÇn ra søc luyÖn c«ng, ®Õn mét møc nhÊt ®Şnh sÏ t¨ng thªm 1 cÊp. Tõ cÊp 10 trë ®i ph¶i lÜnh héi MËt tŞch trÊn ph¸i cña bæn m«n, míi cã thÓ häc ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta ®ang vËn c«ng chØ dÉn ng­¬i tİch tô 10 phÇn s¸t khİ trong ng­êi, ®Ó ng­¬i thö thi triÓn “Liªn Hoµn Toµn Long Th­¬ng”. <enter><enter>L©u sau...<enter><enter>S¸t khİ trong ng­êi thiÕu hiÖp ®· h×nh thµnh, lóc nµy cã thÓ thö thi triÓn “Liªn Hoµn Toµn Long Th­¬ng”. TuyÖt häc trÊn ph¸i cña bæn m«n uy lùc dòng m·nh, chØ dïng ®Ó trõ b¹o gióp kÎ yÕu, thay trêi hµnh ®¹o, ®õng h¹i ng­êi v« téi, h·y nhí kü lÊy...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

