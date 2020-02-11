Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--Îå¶¾Ğ°ÏÀ
--Íò¶¾ĞÄ·¨ (¼¼ÄÜid=364)
[364]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--Îå¶¾µ¶·¨ (¼¼ÄÜid=365)
[365]={
     levelless={3,1,0,364,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--Òı»êÖä (¼¼ÄÜid=366)
[366]={
     levelless={2,1,0,364,1},
     [1]={1,12,0,0},
     [2]={1,12,0,0},
     },
--²ÙÊ¬Êõ (¼¼ÄÜid=367)
[367]={
     levelless={3,1,0,364,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={6,27,0,30},
     },
--Ê¬¶¾Êõ (¼¼ÄÜid=368)
[368]={
     levelless={3,1,0,364,3},
     [1]={1,16,3000,50},
     [2]={2,19,2000,50},
     [3]={7,34,0,50},
     },
--Ê¬±¬´ó·¨ (¼¼ÄÜid=369)
[369]={
     levelless={3,1,0,368,1},
     [1]={1,20,8000,100},
     [2]={2,24,4500,100},
     [3]={5,36,0,100},
     },
--¼¯Ê¬Ğ°Æø (¼¼ÄÜid=370)
[370]={
     levelless={3,1,0,365,6},
     [1]={1,23,11000,180},
     [2]={2,25,2500,180},
     [3]={8,37,0,180},
     },
--Ô¦Ê¬Êõ (¼¼ÄÜid=371)
[371]={
     levelless={3,1,0,367,4},
     [1]={1,26,15000,220},
     [2]={2,29,9000,220},
     [3]={6,41,0,220},
     },
--Íò¶¾¶áÃüµ¶ (¼¼ÄÜid=372)
[372]={
     levelless={3,1,0,370,3},
     [1]={1,30,27000,300},
     [2]={2,33,9000,300},
     [3]={7,48,0,300},
     },
--ÒõĞ°Îü»êÆø (¼¼ÄÜid=373)
[373]={
     levelless={3,1,0,370,4},
     [1]={1,34,45000,500},
     [2]={2,38,15000,500},
     [3]={5,50,0,500},
     },
--´ßÊ¬Ğ°Æø (¼¼ÄÜid=374)
[374]={
     levelless={3,1,0,369,4},
     [1]={1,38,70000,600},
     [2]={2,41,25000,600},
     [3]={7,56,0,600},
     },
--Ğ°Áé´ó·¨ (¼¼ÄÜid=375)
[375]={
     levelless={3,1,0,371,5},
     [1]={1,43,100000,800},
     [2]={2,46,50000,800},
     [3]={7,58,0,800},
     },
--Ğ°¶¾¹¦ (¼¼ÄÜid=376)
[376]={
     levelless={3,2,0,372,5,373,3},
     [1]={1,48,220000,1000},
     [2]={2,51,80000,1000},
     [3]={7,66,0,1000},
     },
--Ê¬ÁÑÄ§¹¦ (¼¼ÄÜid=377)
[377]={
     levelless={3,1,0,374,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--ÎŞÌìÄ§¹¦ (¼¼ÄÜid=775)
[775]={
     levelless={5,3,1,375,6,376,7,377,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>ÎâÑÔ<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("§¼ng cÊp kh«ng ®ñ kh«ng thÓ häc vâ c«ng míi, h·y ®i luyÖn thªm nhĞ!",0)
	elseif n==3 then
		Say("§iÓm kinh nghiÖm kh«ng ®ñ kh«ng thÓ häc vâ c«ng míi, h·y ®i luyÖn thªm nhĞ!",0)
	elseif n==4 then
		Say("Danh väng kh«ng ®ñ kh«ng thÓ häc vâ c«ng míi, ng­¬i h·y ®i lµm nhiÖm vô ®Ó tİch lòy ®iÓm danh väng!",0)
	elseif n==5 then
		Say("Vâ c«ng tr­íc ®©y rÌn luyÖn ch­a thµnh thôc sao ta d¸m d¹y ng­¬i chiªu míi, dôc tèc bÊt ®¹t!",0)
	elseif n==6 then
		Say("Cã tiÒn th× h·y quay l¹i nhĞ!",0)
	else
	end
end;

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
	Say("Bän ®Çu tr©u mÆt ngùa kh¾p n¬i ®Òu bŞ ta sai khiÕn. T¸ thi hoµn hån, sai khiÕn thi thÓ giÕt ng­êi tr­êng ph¸i ta ®Òu tinh th«ng. §Ö tö tµ hiÖp nªn dïng <color=yellow>song ®ao<color>. Ch¼ng hay ta cã thÓ gióp g× cho ng­¬i?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/enterxiexia",
		"Häc vâ c«ng Ngò §éc tµ hiÖp/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"Tham kiÕn Th­¬ng Chñ/no")
end;

canjuan1 = 955
canjuan2 = 956
canjuan3 = 957

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 20 then	--Á÷ÅÉ¼ì²â
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
		AddItem(0, 112, 113, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§· ®æi 1 Ngò §éc Tµ HiÖp MËt tŞch trÊn ph¸i, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi Ngò §éc Tµ HiÖp MËt tŞch trÊn ph¸i thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","§æi MËt tŞch trÊn ph¸i thÊt b¹i råi!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====

function tedian()		--²ì¿´¼¼ÄÜ
Say("§Ö tö ta thiÖn dïng tµ thuËt, giÕt ng­êi trong nh¸y m¾t khiÕn ®èi ph­¬ng kh«ng kŞp trë tay. LuyÖn ®Õn c¶nh giíi tèi cao tinh th«ng ®éc m«n tuyÖt kü, cã thÓ sai khiÕn ng­êi chÕt. Cho dï cao thñ tuyÖt ®Ønh nghe danh ®· khiÕp sî.",0)
end;


function enterxiexia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 7 then	--ÃÅÅÉ¼ì²â
		Say("Tr­íc tiªn, ng­¬i ph¶i gÆp B¹ch gi¸o chñ xin gia nhËp bæn gi¸o, råi míi quay l¹i ®©y b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 19 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(20) == 0 then
			return
		end
		Say("Tr­êng ph¸i ta cã thÓ sai khiÕn thi thÓ, ng­êi nghe qua ®· khiÕp sî. Ngoµi thiªn phó bÈm sinh ra cÇn ph¶i thËt nhÉn n¹i. ThÊy ng­êi thµnh t©m nh­ thÕ, ta chİnh thøc thu nhËn ng­¬i lµm ®Ö tö. §Çu tiªn ta gióp ng­¬i <color=yellow>TÈy ®iÓm tiÒm n¨ng<color>. Vâ c«ng bæn gi¸o lÊy <color=yellow>Th©n ph¸p<color>, <color=yellow>Søc m¹nh<color>, <color=yellow>Néi c«ng<color> lµm c¬ së. Giê cã thÓ ®Õn gÆp B¹ch gi¸o chñ nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(20)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(13)--ÉèÖÃ×¦ÆÕÍ¨¹¥»÷
		LearnSkill(364)
		LearnSkill(365)
		AddItem(0,7,1,1,1,4,65,4,66)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö Ngò §éc tµ hiÖp!")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp B¹ch gi¸o chñ nhËn nhiÖm vô")
	elseif   GetPlayerRoute() == 20 then
	 	Say("Sai khiÕn thi thÓ ph¶i thËt tinh th«ng nÕu kh«ng sÏ rÊt nguy hiÓm, ng­¬i h·y ®i luyÖn tËp thªm!",0)
	else
		Say("Ng­¬i lµ ®Ö tö cña LiÔu Th­¬ng Chñ, sao ®Õn chç ta lµm chi!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 20 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Ngò §éc tµ hiÖp.",0)
	else
		Say("Kü n¨ng nµo d­íi gãc ph¶i cã dÊu mòi tªn th× cã thÓ häc, nhÊp chuét ®Ó t¨ng cÊp",0)
		AllowLearnSkill()
	end
end;

--Ï´Ç±ÄÜµã
function resetpoint()

	if GetPlayerRoute() == 20 then
		if GetTask(1150) == 0 then
			Say("Vâ c«ng bæn gi¸o lÊy <color=yellow>Th©n ph¸p<color>, <color=yellow>Søc m¹nh<color>, <color=yellow>Néi c«ng<color> lµm c¬ së. Ng­¬i chØ cã <color=yellow>1 lÇn<color>c¬ héi tÈy ®iÓm. H·y suy nghÜ thËt kü!",
		2,
		"TÈy ®iÓm/confirm_reset",
		"Ch­a muèn tÈy ®iÓm./no");
		else
			Say("Ta ®· gióp ng­¬i tiÕn hµnh tÈy ®iÓm, kh«ng ®­îc céng sai ®iÓm n÷a nhĞ!",0);
		end
	else
		Say("Ng­¬i kh«ng ph¶i lµ <color=green>§Ö tö tµ hiÖp<color>, tha lçi cho ta kh«ng thÓ gióp ng­¬i tÈy ®iÓm.",0);
	end
end

function confirm_reset()

	Say("Ng­¬i ®· tÈy ®iÓm tiÒm n¨ng thµnh c«ng, vâ c«ng tr­êng ph¸i ta lÊy <color=yellow>Th©n ph¸p<color>, <color=yellow>Søc m¹nh<color> vµ <color=yellow>Néi c«ng<color> lµm c¬ b¶n, lÇn nµy kh«ng nªn céng sai nhĞ!",0);
	ResetProperty()
	SetTask(1150,1);
	
end

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 775) then	--ÎŞÌìÄ§¹¦
		if (GetSkillLevel("V« Thiªn Ma C«ng") <= 0) then
			return "V« Thiªn Ma C«ng' lµ <color=red>TuyÖt häc trÊn ph¸i<color> cña bæn m«n , kh«ng ph¶i ng­êi cña bæn m«n kh«ng ®­îc häc."
		end
	end
end

function afterlearnskill(id)
	if (id == 775) then	--ÎŞÌìÄ§¹¦
		if (GetSkillLevel("V« Thiªn Ma C«ng") == 1) then
			Say("T­ chÊt cña con qu¶ kh«ng tåi, c¬ b¶n ®· lÜnh héi ®­îc 'V« Thiªn Ma C«ng' cña bæn m«n, qu¶ lµ hiÕm cã!<enter><color=green>Ng­êi ch¬i<color>: Nh­ng… s­ phô, lóc con thö thi triÓn “V« Thiªn Ma C«ng”, thÊy néi khİ trong ng­êi kh«ng thÓ tô l¹i rÊt khã thi triÓn? Nay con ®· biÕt ®­îc c¶m gi¸c kh«ng thÓ ph¸t ra nh­ Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ.<enter>VËy lµ con kh«ng biÕt råi, 'V« Thiªn Ma C«ng' uy lùc rÊt lín, häc råi muèn tù do thi triÓn còng kh«ng ph¶i chuyÖn dÔ. Tinh khİ trong ng­êi kh«ng thÓ tô l¹i lµ 's¸t khİ'? (TrŞ s¸t khİ), kh«ng ph¸t ®­îc. Muèn thi triÓn th× ph¶i tiªu tèn 's¸t khİ'. 'S¸t khİ' gåm 10 phÇn, cã thÓ t¨ng lªn lóc ®¸nh b¹i ®èi ph­¬ng hoÆc tô l¹i dÇn dÇn.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("V« Thiªn Ma C«ng") == 5) then
			Say("V« Thiªn Ma C«ng' ®· lÜnh héi ®Õn cÊp 5 con qu¶ lµ th«ng minh, nh÷ng cÊp sau nµy lµ do con siªng n¨ng rÌn luyÖn råi. Nã cã tÊt c¶ 20 cÊp, sau khi luyÖn ®Õn ®é thuÇn thôc nhÊt ®Şnh sÏ qua cÊp míi. 10 cÊp cuèi cïng ph¶i tham kh¶o MËt tŞch trÊn ph¸i cña bæn m«n míi cã thÓ lÜnh ngé.", 0)
		end
	end
end

function GiveMomentum()
	Say("§­îc råi, b©y giê ta sÏ vËn c«ng ®Ó s¸t khİ trong ng­êi con tô l¹i ®Õ con thö thi triÓn 'V« Thiªn Ma C«ng'.<enter><enter>Mét thêi gian sau…<enter><enter>§­îc råi, s¸t khİ trong ng­êi con ®· h×nh thµnh, cã thÓ thö thi triÓn 'V« Thiªn Ma C«ng'. H·y nhí lÊy tuyÖt häc trÊn ph¸i cña bæn m«n uy lùc rÊt lín h·y dïng ®Ó gióp ®ì kÎ yÕu, thay trêi hµnh ®¹o, kh«ng lµm h¹i ng­êi v« téi....", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

