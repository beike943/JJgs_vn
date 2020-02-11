Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua");
Include("\\script\\task\\faction\\faction_main_gb.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--Ø¤°ïÎÛÒÂ
--ÌìĞĞÆø¹¦ (¼¼ÄÜid=114)
[114]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	 },
--Ø¤°ï¹÷·¨ (¼¼ÄÜid=115)
[115]={
     levelless={3,1,0,114,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     },
--ÇıÉß¹÷·¨ (¼¼ÄÜid=116)
[116]={
     levelless={3,1,0,115,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
     },
--ÆòÌìÌÖµØ (¼¼ÄÜid=117)
[117]={
     levelless={3,1,0,114,2},
     [1]={1,16,3000,60},
     [2]={2,20,3000,60},
     [3]={5,32,0,60},
     },
--Äàöú¹¦ (¼¼ÄÜid=118)
[118]={
     levelless={3,1,0,115,4},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={8,36,0,100},
     },
--ÃîÊÖ¾÷ (¼¼ÄÜid=119)
[119]={
     levelless={3,1,0,117,2},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--ÍµÁú×ª·ï (¼¼ÄÜid=120)
[120]={
     levelless={3,1,0,119,1},
     [1]={1,35,50000,500},
     [2]={2,38,15000,500},
     [3]={6,50,0,500},
     },
--°ÔÍõĞ¶¼× (¼¼ÄÜid=121)
[121]={
     levelless={3,1,0,118,6},
     [1]={1,40,90000,700},
     [2]={2,43,30000,700},
     [3]={7,58,0,700},
     },
--ÍµÌì»»ÈÕ (¼¼ÄÜid=122)
[122]={
     levelless={3,1,0,119,5},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={6,63,0,1000},
     },
--´ò¹·¹÷·¨ (¼¼ÄÜid=123)
[123]={
     levelless={3,1,0,116,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--´ò¹·¹÷Õó (¼¼ÄÜid=124)
[124]={
     levelless={5,4,1,120,6,121,7,122,6,123,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>ËÎÔª°²<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("§¼ng cÊp cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==3 then
		Say("§iÓm kinh nghiÖm cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==4 then
		Say("§iÓm danh väng cña ng­¬i kh«ng ®ñ, cÇn tİch lòy thªm nhĞ!",0)
	elseif n==5 then
		Say("Vâ c«ng ta d¹y ng­¬i tr­íc ®©y cßn ch­a luyÖn xong, giê l¹i ®ßi häc c¸i míi. ThËt lµ tham lam v« İch!",0)
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
	local nTaskValue = FN_GetTaskState(FN_GB);
	if (nTaskValue==1) and (GetItemCount(2,1,12)>=1) then
		task_005();
		return
	else
		Say("C«ng phu ta lÊy nhu th¾ng c­¬ng, linh ho¹t khã l­êng. §éc m«n t©m ph¸p cã thÓ lîi dông c«ng phu cña kÎ ®Şch ®Ó tÊn c«ng kÎ ®Şch. Binh khİ th­êng dïng cña ®Ö tö bæn ph¸i lµ <color=yellow>C«n<color>! CÇn ta gióp g× kh«ng?",
			4,
			"§Ö tö b¸i kiÕn s­ phô!/enterwuyi",
			"Häc vâ c«ng C¸i Bang ¤ Y/skilllearn",
			"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
			"Tham kiÕn Tr­ëng l·o/no");
	end
end;

canjuan1 = 937
canjuan2 = 938
canjuan3 = 939

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 12 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña bæn m«n, MËt tŞch trÊn ph¸i sao cã thÓ ®­a cho ng­¬i ®­îc chø?", 0)
		return
	end	
	
	if (nBook1 == 0 and nBook2 == 0 and nBook3 == 0) then	-- É¶Ò²Ã»ÓĞ
		Say("Ng­¬i ch­a tõng nhËn ®­îc quyÓn MËt TŞch vâ c«ng cña bæn m«n sao cã thÓ nãi lµ ®· cã nã?", 0)
		return
	end
	
	Say("Th«ng qua luyÖn thøc ng­¬i ®· cã ®­îc nh÷ng trang MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n! §Ó ta gióp ng­¬i ®ãng l¹i thµnh mét quyÓn mËt tŞch hoµn chØnh, nh­ng cã thµnh c«ng hay kh«ng cßn phô thuéc vµo ng­¬i cã t×m ®ñ c¸c trang mËt tŞch kh«ng n÷a.", 
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
		AddItem(0, 112, 108, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi 1 MËt tŞch trÊn ph¸i cña C¸i Bang « Y, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi MËt tŞch trÊn ph¸i cña C¸i Bang « Y thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","B¸o lçi, ®æi MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


function jingyi()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("C«ng phu ta lÊy nhu th¾ng c­¬ng, linh ho¹t khã l­êng. §éc m«n t©m ph¸p cã thÓ lîi dông c«ng phu cña kÎ ®Şch ®Ó tÊn c«ng kÎ ®Şch. Binh khİ th­êng dïng cña ®Ö tö bæn ph¸i lµ c«n!",0)
end;


function enterwuyi()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 4 then	--ÃÅÅÉ¼ì²â
		Say("B»ng h÷u nªn t×m Long bang chñ xin gia nhËp m«n ph¸i råi h·y t×m ta b¸i s­ häc nghÖ!",0)
	elseif   GetPlayerRoute() == 10 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(12) == 0 then
			return
		end
		Say("¤ Y ph¸i míi lµ C¸i Bang chİnh t«ng. Ng­¬i cã thÓ gia nhËp, ta thÊy rÊt vui lßng! Ta chİnh thøc thu nhËn ng­¬i lµm ®Ö tö, gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i ®iÓm tiÒm n¨ng<color>. C«ng phu bæn ph¸i lÊy <color=yellow>Th©n ph¸p<color> lµm gèc! Ng­¬i ®· gia nhËp hÖ ph¸i, cã thÓ ®Õn Bang chñ nhËn <color=yellow>NhiÖm vô s­ m«n<color>!",0)
		SetPlayerRoute(12)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(114)
		LearnSkill(115)
		AddItem(0,5,29,1,1,4,65,4,66)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö C¸i Bang ¤ Y!")
		TaskTip("B¹n ®· ®­îc tÈy l¹i ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Bang chñ nhËn nhiÖm vô!")
	elseif   GetPlayerRoute() == 12 then
	 	Say("Hõ! Mau ®i luyÖn c«ng ®i! §õng cã c¶ ngµy l­êi nh¸c, ¶nh h­ëng thanh danh ta!",0)
	else
		Say("Ta ch¼ng ph¶i s­ phô thØnh gi¸o cña ng­¬i, ®õng ®Õn ®©y nŞnh hãt!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 12 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö ta, kh«ng thÓ häc vâ c«ng C¸i Bang ¤ Y!",0)
	else
		Say("DÊu {v} biÓu thŞ cã thÓ häc vâ c«ng nµy; dÊu mòi tªn biÓu thŞ cã thÓ t¨ng cÊp! NhÊp trùc tiÕp vµo ®Ó t¨ng cÊp!",0)
		AllowLearnSkill()
	end
end;


--		Say("<color=green>ËÎÔª°²<color>£ºÄãÒªÑ§Ï°Ê²Ã´¼¼ÄÜ£¿",11,"ÌìĞĞÆø¹¦/tianxing","Ø¤°ï¹÷·¨/gunfa","ÇıÉß¹÷·¨/qushe","ÆòÌìÌÖµØ/qutao","Äàöú¹¦/niqiu","ÃîÊÖ¾÷/miaoshou","ÍµÁú×ª·ï/toulong","°ÔÍõĞ¶¼×/xiejia","ÍµÌì»»ÈÕ/toutian","´ò¹·¹÷·¨/dagougun","´ò¹·¹÷Õó/dagouzhen")

function tianxing()
learnskill(114)
end;

function gunfa()
learnskill(115)
end;

function qushe()
learnskill(116)
end;

function qutao()
learnskill(117)
end;

function niqiu()
learnskill(118)
end;

function miaoshou()
learnskill(119)
end;

function toulong()
learnskill(120)
end;

function xiejia()
learnskill(121)
end;

function toutian()
learnskill(122)
end;

function dagougun()
learnskill(123)
end;

function dagouzhen()
learnskill(124)
end;


function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 124) then	--´ò¹·¹÷Õó
		if (GetSkillLevel("§¶ CÈu c«n ph¸p") <= 0) then
			return "“§¶ CÈu Bæng trËn” lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, chØ truyÒn cho ng­êi tµi giái."
		end
	end
end

function afterlearnskill(id)
	if (id == 124) then	--´ò¹·¹÷Õó
		if (GetSkillLevel("§¶ CÈu c«n ph¸p") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt kh«ng tÖ, b­íc ®Çu ®· lÜnh héi “§¶ CÈu Bæng trËn” cña bæn m«n, thËt hiÕm thÊy! <enter><color=green>Ng­êi ch¬i<color>: Nh­ng... th­a s­ phô, v× sao lóc ®Ö tö thi triÓn “§¶ CÈu Bæng trËn”, néi khİ trong ng­êi bŞ ph©n t¸n? §· nghe danh Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ tõ l©u, nghÜ ®Õn còng kh«ng d¸m, h«m nay l¹i cã dŞp thö. <enter>ThiÕu hiÖp cßn ch­a biÕt ®iÒu nµy, “§¶ CÈu Bæng trËn” rÊt m¹nh, cho dï may m¾n häc ®­îc, nh­ng ch­a ch¾c ®iÒu khiÓn ®­îc nã. Tinh khİ bªn trong c¬ thÓ kh«ng tİch tô thµnh “s¸t khİ”? (møc s¸t khİ), th× kh«ng thÓ thi triÓn vâ c«ng nµy, cÇn tiªu hao “s¸t khİ” bªn trong. “S¸t khİ” gåm 10 phÇn, t¨ng khi c«ng ph¸ s¸t th­¬ng, dÇn dÇn tİch tô l¹i.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("§¶ CÈu c«n ph¸p") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt th«ng minh, “§¶ CÈu Bæng trËn” ®· lÜnh héi ®­îc 5 phÇn. Vâ c«ng nµy cã 20 cÊp, tõ cÊp thø 5 trë ®i thiÕu hiÖp cÇn ra søc luyÖn c«ng, ®Õn mét møc nhÊt ®Şnh sÏ t¨ng thªm 1 cÊp. Tõ cÊp 10 trë ®i ph¶i lÜnh héi MËt tŞch trÊn ph¸i cña bæn m«n, míi cã thÓ häc ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta ®ang vËn c«ng chØ dÉn ng­¬i tİch tô 10 phÇn s¸t khİ trong ng­êi, ®Ó ng­¬i thö thi triÓn “§¶ CÈu Bæng trËn”. <enter><enter>L©u sau...<enter><enter>S¸t khİ trong ng­êi thiÕu hiÖp ®· h×nh thµnh, lóc nµy cã thÓ thö thi triÓn “§¶ CÈu Bæng trËn”. TuyÖt häc trÊn ph¸i cña bæn m«n uy lùc dòng m·nh, chØ dïng ®Ó trõ b¹o gióp kÎ yÕu, thay trêi hµnh ®¹o, ®õng h¹i ng­êi v« téi, h·y nhí kü lÊy...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

