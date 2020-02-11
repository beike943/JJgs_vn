Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--Îå¶¾¹ÆÊ¦
--°Ù¹ÆĞÄ¾­ (¼¼ÄÜid=347)
[347]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--ÏÂ¹ÆÃØ·½ (¼¼ÄÜid=348)
[348]={
     levelless={3,1,0,347,1},
     [1]={1,10,0,0},
     [2]={2,20,100000,0},
     [3]={4,40,0,0},
     	},
--Î¹Ñø¹ÆÄ¸ (¼¼ÄÜid=349)
[349]={
     levelless={2,1,0,347,1},
     [1]={1,10,0,0},
     [2]={1,10,0,0},
      },
--²ú¹Æ (¼¼ÄÜid=350)
[350]={
     levelless={2,1,0,349,1},
     [1]={1,10,0,0},
     [2]={1,10,0,0},
     },
--·è¹Æ (¼¼ÄÜid=351)
[351]={
     levelless={3,1,0,347,1},
     [1]={1,10,1000,0},
     [2]={2,13,500,0},
     [3]={7,28,0,0},
     },
--Ñø¹ÆÃØÊõ (¼¼ÄÜid=352)
[352]={
     levelless={3,1,0,349,1},
     [1]={1,12,1500,30},
     [2]={2,13,500,30},
     [3]={10,21,0,30},
     },
--¿ñ·ç×¦ (¼¼ÄÜid=353)
[353]={
     levelless={3,1,0,351,2},
     [1]={1,15,2000,50},
     [2]={2,18,1500,50},
     [3]={6,30,0,50},
     },
--¶¾¹Æ (¼¼ÄÜid=354)
[354]={
     levelless={3,1,0,347,3},
     [1]={1,17,5000,60},
     [2]={2,20,2000,60},
     [3]={7,35,0,60},
     },
--Ñª¶¦¹¦ (¼¼ÄÜid=355)
[355]={
     levelless={3,1,0,352,4},
     [1]={1,21,10000,100},
     [2]={2,25,4000,100},
     [3]={5,37,0,100},
     },
--Ñª¹Æ (¼¼ÄÜid=356)
[356]={
     levelless={3,1,0,354,2},
     [1]={1,25,15000,200},
     [2]={2,28,5000,200},
     [3]={7,43,0,200},
     },
--Ïã¹Æ (¼¼ÄÜid=357)
[357]={
     levelless={3,1,0,347,6},
     [1]={1,29,20000,300},
     [2]={2,32,8000,300},
     [3]={7,47,0,300},
     },
--Ê¬¹Æ (¼¼ÄÜid=358)
[358]={
     levelless={3,1,0,356,2},
     [1]={1,33,40000,500},
     [2]={2,38,12000,500},
     [3]={7,51,0,500},
     },
--Ñı¹Æ (¼¼ÄÜid=359)
[359]={
     levelless={3,1,0,357,2},
     [1]={1,37,60000,600},
     [2]={2,40,18000,600},
     [3]={7,55,0,600},
     },
--ĞÄ¹Æ (¼¼ÄÜid=360)
[360]={
     levelless={3,1,0,358,2},
     [1]={1,40,90000,700},
     [2]={2,43,24000,700},
     [3]={7,58,0,700},
     },
--Íò¹ÆÊ´Ìì (¼¼ÄÜid=361)
[361]={
     levelless={3,1,0,353,6},
     [1]={1,44,140000,800},
     [2]={2,46,30000,800},
     [3]={8,58,0,800},
     },
--»Ã¹Æ (¼¼ÄÜid=362)
[362]={
     levelless={3,1,0,359,3},
     [1]={1,48,220000,1000},
     [2]={2,51,70000,1000},
     [3]={7,66,0,1000},
     },
--ĞQ¹Æ (¼¼ÄÜid=363)
[363]={
     levelless={3,3,0,360,4,361,4,362,2},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--ÎŞÓ°Ä§¹Æ (¼¼ÄÜid=774)
[774]={
     levelless={5,1,0,363,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}

function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>ÁøĞÂÖñ<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("Muèn häc vâ c«ng míi, h·y rÌn luyÖn thªm nhĞ!",0)
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
	Say("T©y Nam rõng thiªn n­íc ®éc, lµ n¬i sinh ra thuËt dông ®éc cña ph¸i ta, bÊt kú cao thñ nµo dİnh ®éc vµo lµ v« ph­¬ng cøu ch÷a. §Ö tö ta ®Òu ph¶i biÕt dïng <color=yellow>tr¶o<color>. CÇn ta gióp viÖc chi cø nãi?",
		6,
		"§Ö tö b¸i kiÕn s­ phô!/entergushi",
		"Häc vâ c«ng Ngò §éc cæ s­/skilllearn",
		"§Ö tö muèn m­în quyÓn Cæ Kinh/requestbook",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"H·y ®­a ta 1 ThÇn Méc V­¬ng §Ønh/get_guding",
		"Tham kiÕn Th­¬ng Chñ/no")
end;

function get_guding()
	local nPlayerRoute = GetPlayerRoute();
	if nPlayerRoute ~= 21 then
		Say("<color=green>LiÔu T©n Tróc<color>: Ng­¬i kh«ng ph¶i ®Ö tö cña ta, ThÇn Méc V­¬ng §Ønh sao cã thÓ ®­a cho ng­¬i chø!", 0)
		return 0;
	end;
	if GetItemCount(2,0,1063) >= 1 then
		Talk(1,"","<color=green>LiÔu T©n Tróc<color>: Ng­¬i ®· cã 1 ThÇn Méc V­¬ng §Ønh råi.");
		return 0;
	end;
	AddItem(2,0,1063,1);
	Msg2Player("B¹n nhËn ®­îc 1 ThÇn Méc V­¬ng §Ønh");
end;

canjuan1 = 952
canjuan2 = 953
canjuan3 = 954

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 21 then	--Á÷ÅÉ¼ì²â
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
		AddItem(0, 112, 114, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§· ®æi 1 Ngò §éc Cæ S­ MËt tŞch trÊn ph¸i, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi Ngò §éc Cæ S­ MËt tŞch trÊn ph¸i thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","§æi MËt tŞch trÊn ph¸i thÊt b¹i råi!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====

function tedian()		--²ì¿´¼¼ÄÜ
Say("Vâ c«ng tinh hoa cña tr­êng ph¸i ta chñ yÕu phô thuéc vµo cæ mÉu, chØ cÇn chuyªn t©m dïng néi lùc nu«i d­ìng, nhÊt ®Şnh cã thÓ sai khiÕn chóng lµm nh÷ng viÖc chóng ta muèn. Mét khi ®· tróng ®éc cña ta th× ngay c¶ cao thñ còng ph¶i bã tay chŞu chÕt. §Ö tö cña ta ®Òu ph¶i biÕt dïng ®éc tr¶o.",0)
end;


function entergushi()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 7 then	--ÃÅÅÉ¼ì²â
		Say("Tr­íc tiªn ph¶i gÆp B¹ch gi¸o chñ xin gia nhËp bæn gi¸o, råi míi quay l¹i ®©y b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 19 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(21) == 0 then
			return
		end
		Say("LuyÖn ®éc ph¶i thËt nhÉn n¹i. ThÊy ng­êi thµnh t©m nh­ thÕ, ta chİnh thøc thu nhËn ng­¬i lµm ®Ö tö. §Çu tiªn ta gióp ng­¬i <color=yellow>TÈy l¹i ®iÓm tiÒm n¨ng<color>. Vâ c«ng bæn gi¸o lÊy <color=yellow>Linh ho¹t<color> lµm c¬ së. §©y lµ quyÓn <color=yellow>Cæ Kinh<color>, ng­¬i h·y tõ tõ nghiªn cøu, ®õng lµm ta thÊt väng! Giê cã thÓ ®Õn gÆp B¹ch gi¸o chñ nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(21)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(14)--ÉèÖÃË«µ¶ÆÕÍ¨¹¥»÷
		LearnSkill(347)
		LearnSkill(351)
		AddItem(2,0,385,1)
		AddItem(2,0,1063,1);	--¸øËûÒ»¸öÉñÄ¾Íõ¶¦
		AddItem(0,11,1,1,1,4,65,4,66)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö Ngò §éc Cæ s­!")
		TaskTip("B¹n ®· ®­îc tÈy l¹i tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp B¹ch gi¸o chñ nhËn nhiÖm vô")
	elseif   GetPlayerRoute() == 21 then
	 	Say("LuyÖn ®éc kh«ng thÓ gÊp rót nÕu kh«ng dÔ bŞ tÈu háa nhËp ma, ng­¬i h·y tõ tõ mµ nghiªn cøu!",0)
	else
		Say("Ng­¬i lµ ®Ö tö cña Ng« Th­¬ng Chñ, ®Õn chç ta lµm g×?",0)
		
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 21 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Ngò §éc cæ s­.",0)
	else
		Say("Kü n¨ng nµo d­íi gãc ph¶i cã dÊu mòi tªn th× cã thÓ häc, nhÊp chuét ®Ó t¨ng cÊp",0)
		AllowLearnSkill()
	end
end;

function requestbook()

	if GetPlayerRoute() ~= 21 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cña ta, kh«ng thÓ m­în Cæ Kinh.",0);
	else
		Say("§©y lµ quyÓn Cæ Kinh, s¸ch chØ nam vâ c«ng nhËp m«n cña bæn gi¸o, ng­¬i h·y tõ tõ nghiªn cøu, kh«ng ®­îc ®Ó mÊt ®Êy!",0);
		AddItem(2,0,385,1);
	end
end

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 774) then	--ÎŞÓ°Ä§¹Æ
		if (GetSkillLevel("V« ¶nh Ma Cæ") <= 0) then
			return "V« ¶nh Ma Cæ' lµ <color=red>TuyÖt häc trÊn ph¸i<color> cña bæn m«n, kh«ng ph¶i ng­êi cña bæn m«n kh«ng ®­îc häc."
		end
	end
end

function afterlearnskill(id)
	if (id == 774) then	--ÎŞÓ°Ä§¹Æ
		if (GetSkillLevel("V« ¶nh Ma Cæ") == 1) then
			Say("T­ chÊt cña con qu¶ kh«ng tåi, c¬ b¶n ®· lÜnh héi ®­îc 'V« Thiªn Ma C«ng' cña bæn m«n, qu¶ lµ hiÕm cã!<enter><color=green>Ng­êi ch¬i<color>: Nh­ng… s­ phô, lóc con thö thi triÓn “V« Thiªn Ma C«ng”, thÊy néi khİ trong ng­êi kh«ng thÓ tô l¹i rÊt khã thi triÓn? Nay con ®· biÕt ®­îc c¶m gi¸c kh«ng thÓ ph¸t ra nh­ Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ.<enter>VËy lµ con kh«ng biÕt råi, 'V« Thiªn Ma C«ng' uy lùc rÊt lín, häc råi muèn tù do thi triÓn còng kh«ng ph¶i chuyÖn dÔ. Tinh khİ trong ng­êi kh«ng thÓ tô l¹i lµ 's¸t khİ'? (TrŞ s¸t khİ), kh«ng ph¸t ®­îc. Muèn thi triÓn th× ph¶i tiªu tèn 's¸t khİ'. 'S¸t khİ' gåm 10 phÇn, cã thÓ t¨ng lªn lóc ®¸nh b¹i ®èi ph­¬ng hoÆc tô l¹i dÇn dÇn.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("V« ¶nh Ma Cæ") == 5) then
			Say("V« ¶nh Ma Cæ' ®· lÜnh héi ®Õn cÊp 5 con qu¶ lµ th«ng minh, nh÷ng cÊp sau nµy lµ do con siªng n¨ng rÌn luyÖn råi. Nã cã tÊt c¶ 20 cÊp, sau khi luyÖn ®Õn ®é thuÇn thôc nhÊt ®Şnh sÏ qua cÊp míi. 10 cÊp cuèi cïng ph¶i tham kh¶o MËt tŞch trÊn ph¸i cña bæn m«n míi cã thÓ lÜnh ngé.", 0)
		end
	end
end

function GiveMomentum()
	Say("§­îc råi, b©y giê ta sÏ vËn c«ng ®Ó s¸t khİ trong ng­êi con tô l¹i ®Õ con thö thi triÓn 'V« ¶nh Ma Cæ'.<enter><enter>Mét thêi gian sau…<enter><enter>§­îc råi, s¸t khİ trong ng­êi con ®· h×nh thµnh, cã thÓ thö thi triÓn 'V« ¶nh Ma Cæ'. H·y nhí lÊy tuyÖt häc trÊn ph¸i cña bæn m«n uy lùc rÊt lín h·y dïng ®Ó gióp ®ì kÎ yÕu, thay trêi hµnh ®¹o, kh«ng lµm h¹i ng­êi v« téi....", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

