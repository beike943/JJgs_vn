Include("\\script\\task\\faction\\faction_main_ym.lua");
Include("\\script\\task\\faction\\faction_head.lua");
Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\faction\\npc\\faction_master_main.lua")

function main()
	 if GetAntiEnthrallmentStatus() > 1 then
	 	Talk(1,"","§· qu¸ 5 giê ch¬i, kh«ng thÓ häc vâ c«ng n÷a, h·y nghØ ng¬i ®Ó gi÷ g×n søc kháe!")
	 	return
	 end
  local nTaskValue = FN_GetTaskState(FN_YM);
  local nTaskValuem = FN_GetTaskState(FN_YMM);

	if (nTaskValuem==1) then
		task_003();
		return
	elseif (nTaskValuem==2) then
		Say("TriÖu Phæ ë BiÖn Kinh",0);
		return
	elseif (nTaskValuem==3) then
		Say("CÊm qu©n ë chİnh m«n hoµng cung",0);
		return
	elseif (nTaskValuem==4) then
		Say("§Õn BiÖn Kinh t×m TriÖu Phæ",0);
		return
  elseif (nTaskValuem==5) then
		task_011();
		return
	elseif (nTaskValuem==6) then
		task_013();
	return
	elseif (nTaskValuem==7) then
		Say("§Õn bÈm b¸o Xa Th¸i Qu©n",0);
		return
	elseif GetTask(1401) == 135 or GetTask(1401) == 125 then --ÌìÃÅÕóºóĞøÈÎÎñ
		Talk(1,"","<color=green>Méc QuÕ Anh<color>: nghe nãi lÇn nµy ng­¬i muèn tham gia ph¸ Thiªn M«n TrËn? ChuyÖn nµy kh«ng ph¶i trß ®ïa ngay c¶ ta còng ch­a cã n¾m ch¾c phÇn th¾ng dï ®· n¾m râ mäi yÕu ®iÓm cña Thiªn M«n TrËn. V× thÕ ta ®· lÖnh cho <color=yellow>Phiªu Kş t­íng qu©n Qu¸ch Qu©n B»ng<color> ®Õn <color=yellow>T­¬ng D­¬ng [178,175]<color> lËp nªn Thiªn M«n TrËn,dµnh cho qu©n sÜ ngµy ®ªm rÌn luyÖnmong sím t×m ra c¸ch ph¸ gi¶i huyÒn c¬, thiÕu hiÖp nÕu muèn tham gia th× h·y ®Õn ®ã rÌn luyÖn tr­íc.");
		SetTask(1401,136);
		GivePlayerExp(SkeyTianmenzhen,"guojunpen")
		TaskTip("T×m Qu¸ch Qu©n B»ng (T­¬ng D­¬ng [178,175]) hái th¨m vÒ t×nh h×nh Thiªn M«n TrËn.");
		return 0;	
	elseif GetTask(1401) == 138 then
		Talk(8,"","<color=green>Méc QuÕ Anh<color>: lÇn nµy thiÕu hiÖp v­ît ¶i n¾m ®­îc bao nhiªu kh¶ n¨ng chiÕn th¾ng?","<color=green> <color>: Kho¶n 50 phÇn tr¨m c¬ héi, hoÆc İt h¬n.","<color=green>Méc QuÕ Anh<color>: ch¼ng lÏ l¹i lµ v× m·nh b¶n ®å S¬n Hµ X· T¾c?","<color=green> <color>: ®óng vËy.","<color=green>Méc QuÕ Anh<color>: qu©n ta th¸m tö håi b¸o, m¶nh b¶n ®å S¬n Hµ X· T¾c ®· bŞ bİ mËt mang ®Õn Nh¹n M«n Quan råi.","<color=green> <color>: thÕ t­íng qu©n cã biÕt cô thÓ m·nh b¶n ®å ®· ®­îc ®­a ®Õn n¬i nµo?","<color=green>Méc QuÕ Anh<color>: cã lÏ giê ®· ®Õn Th¶o Nguyªn råi, thiÕu hiÖp h·y ®Õn ®ã xem thÕ nµo.","<color=green> <color>: ®a t¹ t­íng qu©n!")
		SetTask(1401,139);
		GivePlayerExp(SkeyTianmenzhen,"yanwushengli")
		TaskTip("T×m qu©n quan qu©n Liªu (Nh¹n M«n Quan [194,195]) ®o¹t l¹i b¶n ®å S¬n Hµ X· T¾c.");
		return 0;	
	elseif GetTask(1401) == 140 then
		Talk(4,"","<color=green>Méc QuÕ Anh<color>: xem ra qu©n Liªu ®· ®æi h­íng ®i,  b¶n ®å ®· bŞ hé tèng chuyÓn vÒ råi.","<color=green> <color>: ¸i chµ! Ch¼ng lÏ ta l¹i kh«ng thÓ t×m ra b¶n ®å S¬n Hµ X· T¾c.","<color=green>Méc QuÕ Anh<color>: thiÕu hiÖp chí lo ©u,  ngµy sau nÕu muèn th¸m thİnh thªm th«ng tin h·y ®Õn ®©y t×m ta.","<color=green> <color>: chØ ®µnh nh­ vËy, ®a t¹ t­íng qu©n!");
		SetTask(1401,141);
		GivePlayerExp(SkeyTianmenzhen,"huibingmuguiying")
		return 0;
	end;
	
	if  GetSex()==1 then
		if (nTaskValue>=8) or (nTaskValue==0) then
		Say("D­¬ng M«n cung kş dµnh cho <color=yellow>®Ö tö cung kş<color> tu luyÖn, chñ yÕu khèng chÕ ®èi ph­¬ng b¶o vÖ bªn m×nh. Sö dông <color=yellow>Cung<color> lµm vò khİ. Ta gióp g× ®­îc cho ng­¬i?",
			4,
			"Tham kiÕn gi¸o ®Çu/entersujia",
			"Häc vâ c«ng D­¬ng M«n cung kş/skilllearn",
			"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
			"Tham kiÕn t­íng qu©n/no")
		else
			Say("Méc QuÕ Anh: Ng­¬i ®i b¸o danh sau ®ã quay l¹i.",0);
		end
	end 
		  
	if  GetSex()==2 then
		if (nTaskValuem>=8) or (nTaskValuem==0) then
		Say("D­¬ng M«n cung kş dµnh cho <color=yellow>®Ö tö cung kş<color> tu luyÖn, chñ yÕu khèng chÕ ®èi ph­¬ng b¶o vÖ bªn m×nh. Sö dông <color=yellow>Cung<color> lµm vò khİ. Ta gióp g× ®­îc cho ng­¬i?",
			4,
			"Tham kiÕn gi¸o ®Çu/entersujia",
			"Häc vâ c«ng D­¬ng M«n cung kş/skilllearn",
			"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
			"Tham kiÕn t­íng qu©n/no")
	   end;
	end;
end	
	
canjuan1 = 949
canjuan2 = 950
canjuan3 = 951

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 18 then	--Á÷ÅÉ¼ì²â
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
		AddItem(0, 112, 112, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi 1 MËt tŞch trÊn ph¸i cña D­¬ng M«n cung kş, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi MËt tŞch trÊn ph¸i cña D­¬ng M«n cung kş thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","B¸o lçi, ®æi MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


--¼¼ÄÜÁĞ±í
SKILLS={
--ÑîÃÅÇ¹Æï
--Ñî¼Ò¹­ĞÄ·¨ (¼¼ÄÜid=733)
[733]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--Ñî¼Ò¹­·¨×Ü¾ö (¼¼ÄÜid=734)
[734]={
     levelless={3,1,0,733,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={10,28,0,0},
     	},
--Ñî¼ÒÁ¬ÉäÊõ (¼¼ÄÜid=735)
[735]={
     levelless={3,1,0,734,1},
     [1]={1,12,1500,30},
     [2]={2,15,1200,30},
     [3]={7,30,0,30},
       },
--Ñî¼ÒÕóÁÆÊõ (¼¼ÄÜid=736)
[736]={
     levelless={3,1,0,734,2},
     [1]={1,16,3000,50},
     [2]={2,19,2000,50},
     [3]={6,31,0,50},
     },
--Ñî¼Ò»ØÁú¼ı (¼¼ÄÜid=737)
[737]={
     levelless={3,1,0,734,4},
     [1]={1,20,8000,100},
     [2]={2,23,2500,100},
     [3]={7,38,0,100},
     },
--Ñî¼Ò²øÔÆ¼ı (¼¼ÄÜid=738)
[738]={
     levelless={3,1,0,737,1},
     [1]={1,24,13000,180},
     [2]={2,26,2500,180},
     [3]={8,38,0,180},
     },
--Ñî¼ÒÆæÃÅ¶Ü (¼¼ÄÜid=739)
[739]={
     levelless={3,1,0,736,3},
     [1]={1,28,20000,300},
     [2]={2,32,12000,300},
     [3]={5,44,0,300},
     },
--Ñî¼ÒÕıÆø¼ı (¼¼ÄÜid=740)
[740]={
     levelless={3,1,0,737,4},
     [1]={1,33,40000,500},
     [2]={2,35,7000,500},
     [3]={9,49,0,500},
     },
--Ñî¼ÒËé½ğ¼ı (¼¼ÄÜid=741)
[741]={
     levelless={3,1,0,735,6},
     [1]={1,38,70000,600},
     [2]={2,40,12000,600},
     [3]={8,52,0,600},
     },
--Ñî¼Ò»ÃÉñ¾÷ (¼¼ÄÜid=742)
[742]={
     levelless={3,1,0,739,4},
     [1]={1,44,140000,800},
     [2]={2,47,40000,800},
     [3]={6,59,0,800},
     },
--Ñî¼ÒĞøÃü¾÷ (¼¼ÄÜid=743)
[743]={
     levelless={3,1,0,739,5},
     [1]={1,48,250000,1000},
     [2]={2,51,60000,1000},
     [3]={7,66,0,1000},
     },
--Á÷¹â¾øÓ°¼ı (¼¼ÄÜid=744)
[744]={
     levelless={3,3,0,738,6,740,6,741,6},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--°ÔÍõÏè·ï¼ı (¼¼ÄÜid=745)
[745]={
     levelless={5,3,0,742,6,743,7,744,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>ÄÂ¹ğÓ¢<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
	if n==2 then
		Say("§¼ng cÊp cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==3 then
		Say("§iÓm kinh nghiÖm cña ng­¬i ch­a ®ñ, cè g¾ng thªm nhĞ!",0)
	elseif n==4 then
		Say("§iÓm danh väng cña ng­¬i kh«ng ®ñ, cÇn tİch lòy thªm nhĞ!",0)
	elseif n==5 then
		Say("Vâ c«ng lóc tr­íc ta d¹y cßn ch­a häc xong sao häc ®­îc c¸i míi, mau rÌn luyÖn thªm ®i!",0)
	elseif n==6 then
		Say("Ng©n l­îng cña ng­¬i kh«ng ®ñ, t×m ®ñ råi h·y quay l¹i nhĞ!",0)
	else
	end
end;



function shaolinsujia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("Vâ c«ng ta d¹y thuéc D­¬ng M«n cung kş chñ yÕu khèng chÕ ®èi ph­¬ng b¶o vÖ bªn m×nh, lÊy cung lµm vò khİ.",0)
end;


function entersujia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 6 then	--ÃÅÅÉ¼ì²â
		Say("Mau t×m Xa Th¸i Qu©n gia nhËp D­¬ng M«n råi ®Õn gÆp ta!",0)
	elseif   GetPlayerRoute() == 16 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(18) == 0 then
			return
		end
		Say("Tèt! Ng­¬i ®· gia nhËp D­¬ng M«n sau nµy cã thÓ theo ta häc nghÖ, ta sÏ gióp ®¶ th«ng l¹i kinh m¹ch <color=yellow>tÈy ®iÓm tiÒm n¨ng<color>. Vâ c«ng cung kş chñ yÕu <color=yellow>Th©n ph¸p<color> lµm chñ. Giê cã thÓ ®Õn gÆp Xa Th¸i Qu©n nhËn <color=yellow>NhiÖm vô s­ m«n<color>.",0)
		SetPlayerRoute(18)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(733)
		AddItem(0,4,108,1,1,4,65,4,66)
		AddItem(0,105,10,1)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("Ng­¬i ®· trë thµnh ®Ö tö D­¬ng M«n cung kş!")
		TaskTip("B¹n ®· ®­îc tÈy ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ ®Õn gÆp Xa Th¸i Qu©n nhËn nhiÖm vô.")
	elseif   GetPlayerRoute() == 18 then
	 	Say("Mau ®i luyÖn c«ng ®õng ®Ó mÊt mÆt vi s­.",0)
	else
		Say("Ta kh«ng ph¶i lµ s­ phô cña ng­¬i, nhÇm råi!",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 18 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i ®Ö tö cung kş kh«ng thÓ häc vâ c«ng D­¬ng M«n cung kş.",0)
	else
		Say("Kü n¨ng nµo d­íi gãc ph¶i cã dÊu mòi tªn th× cã thÓ häc, nhÊp chuét ®Ó t¨ng cÊp",0)
		AllowLearnSkill()
	end
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 745) then	--°ÔÍõÏè·ï¼ı
		if (GetSkillLevel("B¸ V­¬ng T­êng Phông TiÔn") <= 0) then
			return "“B¸ V­¬ng T­êng Phông TiÔn” lµ <color=red>tuyÖt häc trÊn ph¸i<color> cña bæn m«n, chØ truyÒn cho ng­êi tµi giái."
		end
	end
end

function afterlearnskill(id)
	if (id == 745) then	--°ÔÍõÏè·ï¼ı
		if (GetSkillLevel("B¸ V­¬ng T­êng Phông TiÔn") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt kh«ng tÖ, b­íc ®Çu ®· lÜnh héi “B¸ V­¬ng T­êng Phông TiÔn” cña bæn m«n, thËt ®¸ng nÓ!<enter><color=green>Ng­êi ch¬i<color>: Nh­ng... th­a s­ phô, v× sao lóc ®Ö tö thi triÓn “B¸ V­¬ng T­êng Phông TiÔn”, néi khİ trong ng­êi bŞ ph©n t¸n? §· nghe danh Lôc M¹ch ThÇn KiÕm cña §¹i Lı §oµn ThŞ tõ l©u, nghÜ ®Õn còng kh«ng d¸m, h«m nay l¹i cã dŞp thö. <enter>ThiÕu hiÖp cßn ch­a biÕt ®iÒu nµy, “B¸ V­¬ng T­êng Phông TiÔn”rÊt m¹nh, cho dï may m¾n häc ®­îc, nh­ng ch­a ch¾c ®iÒu khiÓn ®­îc nã. Tinh khİ bªn trong c¬ thÓ kh«ng tİch tô thµnh “s¸t khİ”? (møc s¸t khİ), th× kh«ng thÓ thi triÓn vâ c«ng nµy, cÇn tiªu hao “s¸t khİ” bªn trong. “S¸t khİ” gåm 10 phÇn, t¨ng khi c«ng ph¸ s¸t th­¬ng, dÇn dÇn tİch tô l¹i.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("B¸ V­¬ng T­êng Phông TiÔn") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn tè chÊt th«ng minh, “B¸ V­¬ng T­êng Phông TiÔn” ®· lÜnh héi ®­îc 5 phÇn. Vâ c«ng nµy cã 20 cÊp, tõ cÊp 5 trë ®i thiÕu hiÖp cÇn ra søc luyÖn c«ng, ®Õn mét møc nhÊt ®Şnh sÏ t¨ng thªm 1 cÊp. Tõ cÊp 10 trë ®i ph¶i lÜnh héi MËt tŞch trÊn ph¸i cña bæn m«n, míi cã thÓ häc ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Ta ®ang vËn c«ng chØ dÉn ng­¬i tİch tô 10 phÇn s¸t khİ trong ng­êi, ®Ó ng­¬i thö thi triÓn “B¸ V­¬ng T­êng Phông TiÔn”. <enter><enter>L©u sau...<enter><enter>S¸t khİ trong ng­êi thiÕu hiÖp ®· h×nh thµnh, lóc nµy cã thÓ thö thi triÓn “B¸ V­¬ng T­êng Phông TiÔn”. TuyÖt häc trÊn ph¸i cña bæn m«n uy lùc dòng m·nh, chØ dïng ®Ó trõ b¹o gióp kÎ yÕu, thay trêi hµnh ®¹o, ®õng h¹i ng­êi v« téi, h·y nhí kü lÊy...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

