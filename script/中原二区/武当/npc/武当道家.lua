Include("\\script\\global\\¼¼ÄÜÊ÷²Ù×÷.lua")
Include("\\script\\faction\\npc\\faction_master_main.lua")

--¼¼ÄÜÁĞ±í
SKILLS={
--Îäµ±µÀ¼Ò
--Îäµ±½£¾­ (¼¼ÄÜid=125)
[125]={
     --{¹Ø¼üµãÊı£¬Ç°Ìá¼¼ÄÜÊı£¬Ç°Ìá¼¼ÄÜ¹ØÏµ£¨Óë£º1£¬»ò£º0£©£¬Ç°Ìá¼¼ÄÜ1£¬Ç°Ìá¼¼ÄÜ1µÈ¼¶£¬...}
     levelless={3,0,0,},
     --¹Ø¼üµã£¨¼¼ÄÜµÈ¼¶£¬Íæ¼ÒµÈ¼¶£¬Íæ¼Ò¾­Ñé£¬ÃÅÅÉ¹±Ï×¶È}
     [1]={1,10,300,0},
     [2]={2,11,50,0},
     [3]={10,27,0,0},
	},
--Îäµ±½£·¨ (¼¼ÄÜid=126)
[126]={
     levelless={3,1,0,125,1},
     [1]={1,10,1000,0},
     [2]={2,12,200,0},
     [3]={8,24,0,0},
     	},
--Á÷¹â½£·¨ (¼¼ÄÜid=127)
[127]={
     levelless={3,1,0,126,3},
     [1]={1,15,3000,60},
     [2]={2,17,800,60},
     [3]={8,29,0,60},
     },
--Î´Ñë½£·¨ (¼¼ÄÜid=128)
[128]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--ÈáÔÆ½£·¨ (¼¼ÄÜid=129)
[129]={
     levelless={3,1,0,126,3},
     [1]={1,15,3000,60},
     [2]={2,17,800,60},
     [3]={8,29,0,60},
     },
--ÁÒÑæ½£·¨ (¼¼ÄÜid=130)
[130]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--±¼À×½£·¨ (¼¼ÄÜid=131)
[131]={
     levelless={3,1,0,126,3},
     [1]={1,16,4000,60},
     [2]={2,18,900,60},
     [3]={8,30,0,60},
     },
--ÎŞÎÒĞÄ·¨ (¼¼ÄÜid=132)
[132]={
     levelless={3,1,0,125,6},
     [1]={1,22,10000,100},
     [2]={2,24,2000,100},
     [3]={9,38,0,100},
     },
--Ì«Çå½£Æø (¼¼ÄÜid=133)
[133]={
     levelless={3,1,0,127,6},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--²øÃÎ½£Òâ (¼¼ÄÜid=134)
[134]={
     levelless={3,1,0,128,6},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--ÂäËª½£Òâ (¼¼ÄÜid=135)
[135]={
     levelless={3,1,0,129,6},
     [1]={1,29,20000,400},
     [2]={2,32,8000,400},
     [3]={6,44,0,400},
     },
--ÖËÑô½£Æø (¼¼ÄÜid=136)
[136]={
     levelless={3,1,0,130,6},
     [1]={1,28,20000,300},
     [2]={2,31,8000,300},
     [3]={7,46,0,300},
     },
--ĞşÎä½£Õó (¼¼ÄÜid=137)
[137]={
     levelless={3,1,0,131,6},
     [1]={1,30,27000,500},
     [2]={2,34,10000,500},
     [3]={5,46,0,500},
     },
--Óù½£¾÷ (¼¼ÄÜid=138)
[138]={
     levelless={3,1,0,125,6},
     [1]={1,36,55000,600},
     [2]={2,40,30000,600},
     [3]={5,52,0,600},
     },
--ÕıÁ½ÒÇ½£·¨ (¼¼ÄÜid=139)
[139]={
     levelless={3,1,0,126,6},
     [1]={1,41,100000,800},
     [2]={2,44,30000,800},
     [3]={6,56,0,800},
     },
--Ì«ÒÒÈıÇå½£ (¼¼ÄÜid=140)
[140]={
     levelless={3,1,0,133,5},
     [1]={1,46,150000,1000},
     [2]={2,49,42000,1000},
     [3]={7,64,0,1000},
     },
--ÉñÃÅÊ®Èı½£ (¼¼ÄÜid=141)
[141]={
     levelless={3,1,0,134,5},
     [1]={1,47,180000,1000},
     [2]={2,50,45000,1000},
     [3]={7,65,0,1000},
     },
--µØÄşĞşÒõ½£ (¼¼ÄÜid=142)
[142]={
     levelless={3,1,0,135,5},
     [1]={1,46,150000,1000},
     [2]={2,49,42000,1000},
     [3]={7,64,0,1000},
     },
--ÌìÇå´¿Ñô½£ (¼¼ÄÜid=143)
[143]={
     levelless={3,1,0,136,5},
     [1]={1,47,180000,1000},
     [2]={2,50,45000,1000},
     [3]={7,65,0,1000},
     },
--°ËØÔ½£Æø (¼¼ÄÜid=144)
[144]={
     levelless={3,1,0,137,5},
     [1]={1,48,200000,1000},
     [2]={2,51,48000,1000},
     [3]={7,66,0,1000},
     },
--ÕæÎäÆß½Ø½£ (¼¼ÄÜid=145)
[145]={
     levelless={3,1,0,139,5},
     [1]={1,55,500000,3000},
     [2]={2,58,200000,3000},
     [3]={7,73,0,3000},
     },
--ÎŞÉÏÌ«¼«½£ (¼¼ÄÜid=146)
[146]={
     levelless={5,6,1,140,7,141,7,142,7,143,7,144,7,145,7},
     [1]={1,80,20000000,10000},
     [2]={2,81,0,10000},
     [3]={3,82,0,10000},
     [4]={4,83,0,10000},
     [5]={5,84,0,10000},
     },
}


function showlimit(n)	--Ê¦ÃÅËµ»°
--	if n==1 then
--		Say("<color=green>ÓáÕñÉú<color>£ºÄãµÄÎä¹¦¾«½øÁË£¡",0)
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
	Say("DÜ khİ ngù kiÕm, kiÕm khİ hîp nhÊt, hÖ ph¸i ta lµ kiÕm khİ, m­în <color=yellow>kiÕm<color> ph¸t ra kiÕm khİ. Kh«ng biÕt ta cã thÓ gióp g×?",
		4,
		"§Ö tö b¸i kiÕn s­ phô!/enterdaojia",
		"Häc vâ c«ng Vâ §ang ®¹o gia/skilllearn",
		"Ta nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i/change_mistery_book",
		"VÊn an ®¹o tr­ëng/no")
end;

canjuan1 = 940
canjuan2 = 941
canjuan3 = 942

-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================begin==
function change_mistery_book()
	local nBook1 = GetItemCount(2, 1, canjuan1)		-- ÉÏ¾í
	local nBook2 = GetItemCount(2, 1, canjuan2)		-- ÖĞ¾í
	local nBook3 = GetItemCount(2, 1, canjuan3)		-- ÏÂ¾í
	
	if GetPlayerRoute() ~= 14 then	--Á÷ÅÉ¼ì²â
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
	Say("NÕu cã ®ñ 3 tËp Th­îng_Trung_H¹, ta nhÊt ®Şnh sÏ gióp ng­¬i ®ãng l¹i thµnh mét quyÓn hoµn chØnh", 
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
		AddItem(0, 112, 109, 1)
		Say("Ng­¬i thËt lµ may m¾n, ®©y lµ quyÓn MËt tŞch trÊn ph¸i hoµn chØnh!", 0)
		Msg2Player("B¹n nhËn ®­îc mét quyÓn MËt tŞch trÊn ph¸i!")
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Vâ §ang ®¹o gia, nChangeType:"..nChangeType);
	else
		WriteLog("[§æi mËt tŞch trÊn ph¸i]:"..GetName().."§æi lÊy MËt tŞch trÊn ph¸i Vâ §ang ®¹o gia thÊt b¹i, nChangeType:"..nChangeType);
		Talk(1,"","Xin lçi, ®æi lÊy MËt tŞch trÊn ph¸i thÊt b¹i!");
	end;
end;
-- ¶Ò»»ÕòÅÉÃØ¼®µÄ¹¦ÄÜ =============================================end====


function daojia()		--²ì¿´¼¼ÄÜ
--µ¯½çÃæ
end;

function tedian()		--²ì¿´¼¼ÄÜ
Say("DÜ khİ ngù kiÕm, kiÕm khİ hîp nhÊt, hÖ ph¸i ta lµ kiÕm khİ, m­în kiÕm ph¸t ra kiÕm khİ.",0)
end;


function enterdaojia()		--¼ÓÈëÁ÷ÅÉ
	if GetPlayerFaction() ~= 2 then	--ÃÅÅÉ¼ì²â
		Say("Ng­¬i ph¶i ®­îc Vâ §ang ch­ëng m«n Tö H¹c Ch©n Nh©n chÊp thuËn míi ®­îc gia nhËp Vâ §ang, sau ®ã cã thÓ ®Õn t×m ta b¸i s­ häc nghÖ.",0)
	elseif   GetPlayerRoute() == 13 then	--Î´ÈëÁ÷ÅÉµÄ±¾ÃÅµÜ×Ó 
		if join_route_main(14) == 0 then
			return
		end
		Say("Vi s­ chİnh thøc nhËn ng­¬i lµm ®Ö tö vµ gióp ng­¬i ®¶ th«ng kinh m¹ch, <color=yellow>tÈy l¹i ®iÓm tiÒm n¨ng<color>. Vâ c«ng hÖ ph¸i lÊy <color=yellow>Néi c«ng<color> lµm träng. Sau nµy h·y cè g¾ng rÌn luyÖn! Giê ng­¬i cã thÓ ®Õn gÆp Ch­ëng m«n tiÕp nhËn <color=yellow>NhiÖm vô m«n ph¸i<color>.",0)
		SetPlayerRoute(14)	--Ö±½ÓÉèÖÃÁ÷ÅÉ
		LearnSkill(125)
		LearnSkill(126)
		AddItem(0,2,16,1,1,4,67,4,68)
		ResetProperty()        --Ï´Ç±ÄÜµã
		TaskTip("B¹n ®· trë thµnh ®Ö tö Vâ §ang ®¹o gia!")
		TaskTip("B¹n ®·  ®­îc tÈy ®iÓm tiÒm n¨ng!")
		TaskTip("B¹n ®· nhËp m«n! Cã thÓ t×m Ch­ëng m«n nhËn nhiÖm vô ")
	elseif   GetPlayerRoute() == 14 then
	 	Say("H·y cè g¾ng luyÖn tËp! Mai nµy ph¸t d­¬ng quang ®¹i bæn ph¸i.",0)
	else
		Say("Ta chØ lµ s­ b¸ cña ng­¬i! Kh«ng ph¶i s­ phô cña ng­¬i! Sao cø quªn hoµi vËy?",0)
	end
end;

function skilllearn()		--Ñ§Ï°¼¼ÄÜ
	if GetPlayerRoute() ~= 14 then	--Á÷ÅÉ¼ì²â
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ta, kh«ng thÓ häc vâ c«ng Vâ §ang ®¹o gia.",0)
	else
		Say("Gãc ph¶i phİa d­íi biÓu t­îng vâ c«ng xuÊt hiÖn dÊu {v} biÓu thŞ cã thÓ häc vâ c«ng nµy, dÊu mòi tªn biÓu thŞ cã thÓ t¨ng cÊp, nhÊp trùc tiÕp vµo ®Ó t¨ng cÊp.",0)
		AllowLearnSkill()
	end
end;


function jianjing()
learnskill(125)
end;

function jianfa()
learnskill(126)
end;

function liuguang()
learnskill(127)
end;

function weiyang()
learnskill(128)
end;

function rouyun()
learnskill(129)
end;

function lieyan()
learnskill(130)
end;

function benlei()
learnskill(131)
end;

function wuwo()
learnskill(132)
end;

function taiqing()
learnskill(133)
end;

function chanmeng()
learnskill(134)
end;

function luoshuang()
learnskill(135)
end;

function yanyang()
learnskill(136)
end;

function xuanwu()
learnskill(137)
end;

function yujian()
learnskill(138)
end;

function zhengfan()
learnskill(139)
end;

function taiyi()
learnskill(140)
end;

function shenmen()
learnskill(141)
end;

function dining()
learnskill(142)
end;

function tianqing()
learnskill(143)
end;


function bagua()
learnskill(144)
end;

function zhenwu()
learnskill(145)
end;

function wushang()
learnskill(146)
end;

function no()
end;

function change_mistery_book_linshi()
		Say("Kh«ng ngê th«ng qua viÖc luyÖn thøc ng­¬i cã thÓ nhËn ®­îc MËt tŞch trÊn ph¸i, thËt xøng ®¸ng lµ ®å ®Ö cña bæn m«n. Nh­ng trÊn ph¸i vâ häc nµy ta còng ph¶i lÜnh ngé mét thêi gian míi cã thÓ truyÒn thô ®­îc, ng­¬i quay l¹i sau nhĞ!",0)
end;

function beforelearnskill(id)
	if (id == 146) then	--ÎŞÉÏÌ«¼«½£
		if (GetSkillLevel("V« Th­îng Th¸i Cùc KiÕm") <= 0) then
			return "\'V« Th­îng Th¸i Cùc KiÕm\' lµ <color=red>TuyÖt häc trÊn ph¸i<color>, kh«ng ph¶i ®Ö tö bæn m«n th× kh«ng thÓ n¾m ®­îc."
		end
	end
end

function afterlearnskill(id)
	if (id == 146) then	--ÎŞÉÏÌ«¼«½£
		if (GetSkillLevel("V« Th­îng Th¸i Cùc KiÕm") == 1) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th©m s©u, ®· b­íc ®Çu lÜnh ngé ®­îc \'V« Th­îng Th¸i Cùc KiÕm\', thËt ®¸ng nÓ! <enter><color=green>Ng­êi ch¬i<color>: Nh­ng....s­ phô, t¹i sao khi con thö thi triÓn \'V« Th­îng Th¸i Cùc KiÕm\', néi khİ ph©n t¸n, khã mµ thi triÓn? Nghe nãi Lôc M¹ch ThÇn KiÕm ë §o¹n ThŞ, ®· ao ­íc tõ l©u, h«m nay míi thö ®­îc. <enter>\'V« Th­îng Th¸i Cùc KiÕm\' rÊt lîi h¹i, cho dï cã may m¾n häc ®­îc, muèn sö dông thµnh th¹o, ®ã kh«ng ph¶i lµ chuyÖn dÔ.", 1, "§ång ı/GiveMomentum")
		elseif (GetSkillLevel("V« Th­îng Th¸i Cùc KiÕm") == 5) then
			Say("ThiÕu hiÖp qu¶ nhiªn t­ chÊt th«ng minh, \'V« Th­îng Th¸i Cùc KiÕm\' ®· lÜnh héi ®­îc 5 phÇn. Cßn xa míi ®¹t ®Õn c¶nh giíi cao nhÊt. Lo¹i vâ c«ng nµy gåm 20 cÊp, 5 cÊp sau cÇn thiÕu hiÖp khæ luyÖn h¬n n÷a, 10 cÊp cuèi cÇn cã mËt tİch trÊn ph¸i míi lÜnh héi ®­îc.", 0)
		end
	end
end

function GiveMomentum()
	Say("Th«i ®­îc, ®Ó ta vËn c«ng gióp ng­¬i thi triÓn \'V« Th­îng Th¸i Cùc KiÕm\'.<enter><enter>RÊt l©u....<enter><enter>§­îc råi, s¸t khİ ®· h×nh thµnh, cã thÓ thö thi triÓn \'V« Th­îng Th¸i Cùc KiÕm\'. TuyÖt häc trÊn ph¸i rÊt m¹nh, dïng ®Ó trõ gian diÖt b¹o, thay trêi hµnh ®¹o, kh«ng h¹i ng­êi v« téi...", 0)
	SetMomentum(10)
	RandomTaskTipEx("NhËn ®­îc 10 ®iÓm s¸t khİ s­ phô truyÒn cho", "momentumtip")
end

