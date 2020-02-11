--¡¶°ËØÔ±¦µä¡·½Å±¾
--by vivi
--08/10/2007

Include("\\script\\task\\lingshi_task.lua")

--Ì××°ÒÂ·ştable
tTaoZhuang = {
	{"Ng­êi m¹nh","Kh«n","Kh¶m","§oµi","Ly","T¨ng Søc m¹nh vµ G©n cèt","80 trë xuèng"},                                 
	{"Tèc Kİch","Kh¶m","§oµi","Ly","CÊn","T¨ngSøc m¹nh vµ Th©n ph¸p","80 trë xuèng"},                                 
	{"KiÕm khİ","§oµi","Ly","CÊn","Cµn","T¨ng Néi c«ng vµ linh ho¹t","80 trë xuèng"},                                 
	{"§éng ph¸","Ly","CÊn","Cµn","Kh«n","T¨ng linh ho¹t vµ lùc l­îng","80 trë xuèng"},                                 
	{"Thİch kh¸ch","CÊn","Cµn","Kh«n","Kh¶m","T¨ng th©n ph¸p vµ linh ho¹t","80 trë xuèng"},                                 
	{"Phong Tèc","Ly","§oµi","Kh¶m","CÊn","T¨ng Néi c«ng vµ Th©n ph¸p","80 trë xuèng"},
	{"Phôc Long","Cµn","Kh«n","Kh¶m","§oµi","T¨ng Néi c«ng vµ G©n cèt","80 trë xuèng"},                                 
	{"HuyÒn Kh©u","ChÊn","Cµn","CÊn","Ly","T¨ng phßng ngù vµ c«ng kİch Néi, ngo¹i c«ng","80 trë xuèng"},                                 
	{"M·nh hæ","Kh«n","Tèn","Kh¶m","§oµi","S¸t th­¬ng t¨ng ","80 trë xuèng"},                                 
	{"T­êng Ph­îng","Cµn","Kh¶m","ChÊn","§oµi","T¨ng Sinh lùc vµ Néi lùc","80 trë xuèng"},                                 
	{"Giao Long","Kh¶m","CÊn","Ly","Tèn","T¨ng Sinh lùc vµ Néi lùc","80 trë xuèng"},                                 
	{"Uy phong","ChÊn","ChÊn","Kh«n","Cµn","C«ng kİch + ","80 trë xuèng"},                                 
	{"HiÖp sÜ","CÊn","Kh¶m","Tèn","Tèn","T¨ng Sinh lùc","80 trë xuèng"},      	
	{"TiÒm long","Cµn","Kh«n","Kh¶m","§oµi","T¨ng Sinh lùc","80 hoÆc 80 trë lªn"},
	{"Hçn ®én","Kh«n","Kh¶m","§oµi","Ly","T¨ng Søc m¹nh vµ G©n cèt","80 hoÆc 80 trë lªn"},
	{"Ly Háa","Kh¶m","§oµi","Ly","CÊn","T¨ngSøc m¹nh vµ Th©n ph¸p","80 hoÆc 80 trë lªn"},
	{"HuyÒn B¨ng","§oµi","Ly","CÊn","Cµn","T¨ng Néi c«ng vµ linh ho¹t","80 hoÆc 80 trë lªn"},
	{"HuyÒn Hoµng","Ly","CÊn","Cµn","Kh«n","T¨ng linh ho¹t vµ lùc l­îng","80 hoÆc 80 trë lªn"},
	{"C«n B»ng","CÊn","Cµn","Kh«n","Kh¶m","T¨ng th©n ph¸p vµ linh ho¹t","80 hoÆc 80 trë lªn"},
	{"Kh¸ng Long","Ly","§oµi","Kh¶m","CÊn","T¨ng Néi c«ng vµ Th©n ph¸p","80 hoÆc 80 trë lªn"},
	{"NiÕt Bµn","Cµn","Kh«n","Kh¶m","§oµi","T¨ng Néi c«ng vµ G©n cèt","80 hoÆc 80 trë lªn"},
	{"HuyÒn Vò","ChÊn","Cµn","CÊn","Ly","T¨ng phßng ngù vµ c«ng kİch Néi, ngo¹i c«ng","80 hoÆc 80 trë lªn"},
	{"Hæ tr¾ng","Kh«n","Tèn","Kh¶m","§oµi","S¸t th­¬ng t¨ng ","80 hoÆc 80 trë lªn"},
	{"Chu T­íc","Cµn","Kh¶m","ChÊn","§oµi","T¨ng Sinh lùc vµ Néi lùc","80 hoÆc 80 trë lªn"},
	{"Thanh Long","Kh¶m","CÊn","Ly","Tèn","T¨ng Sinh lùc vµ Néi lùc","80 hoÆc 80 trë lªn"},
	{"V« Song","ChÊn","ChÊn","Kh«n","Cµn","C«ng kİch + ","80 hoÆc 80 trë lªn"},
	{"Quèc SÜ","CÊn","Kh¶m","Tèn","Tèn","T¨ng Sinh lùc","80 hoÆc 80 trë lªn"}                          
	}	
	
tTiandi = {
	{"Thiªn §Şa TiÒm Long","Cµn","Kh«n","Kh¶m","§oµi","T¨ng Sinh lùc","T¨ng Sinh lùc"," tõ 119 trë lªn"},
	{"Trêi ®Êt hçn ®én","Kh«n","Kh¶m","§oµi","Ly","T¨ng Søc m¹nh vµ G©n cèt","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Thiªn §Şa Ly Háa","Kh¶m","§oµi","Ly","CÊn","T¨ngSøc m¹nh vµ Th©n ph¸p","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Thiªn §Şa HuyÒn B¨ng","§oµi","Ly","CÊn","Cµn","T¨ng Néi c«ng vµ linh ho¹t","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Thiªn §Şa HuyÒn Hoµng","Ly","CÊn","Cµn","Kh«n","T¨ng linh ho¹t vµ lùc l­îng","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Thiªn §Şa C«n B»ng","CÊn","Cµn","Kh«n","Kh¶m","T¨ng th©n ph¸p vµ linh ho¹t","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Thiªn §Şa Kh¸ng Long","Ly","§oµi","Kh¶m","CÊn","T¨ng Néi c«ng vµ Th©n ph¸p","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Thiªn §Şa NiÕt Bµn","Cµn","Kh«n","Kh¶m","§oµi","T¨ng Néi c«ng vµ G©n cèt","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"},
	{"Tr­êng Sinh HuyÒn Vâ","ChÊn","Cµn","CÊn","Ly","T¨ng phßng ngù vµ c«ng kİch Néi, ngo¹i c«ng","T¨ng Sinh lùc"," tõ 119 trë lªn"},
	{"Hung Tinh B¹ch Hæ","Kh«n","Tèn","Kh¶m","§oµi","S¸t th­¬ng t¨ng ","T¨ng Sinh lùc"," tõ 119 trë lªn"},
	{"Chu T­íc BÊt DiÖt","Cµn","Kh¶m","ChÊn","§oµi","T¨ng Sinh lùc vµ Néi lùc","T¨ng Sinh lùc"," tõ 119 trë lªn"},
	{"T¹i Thiªn Thanh Long","Kh¶m","CÊn","Ly","Tèn","T¨ng Sinh lùc vµ Néi lùc","T¨ng Sinh lùc"," tõ 119 trë lªn"},
	{"Thiªn H¹ V« §Şch","ChÊn","ChÊn","Kh«n","Cµn","C«ng kİch + ","T¨ng Sinh lùc"," tõ 119 trë lªn"},
	{"Thiªn Chi Quèc SÜ","CÊn","Kh¶m","Tèn","Tèn","T¨ng Sinh lùc","N©ng cao giíi h¹n néi lùc vµ sinh mÖnh"," tõ 119 trë lªn"} 
	};	
	
--°ËØÔµÄ×é³É
tGuaWei = {--ØÔÎ» ÈıÁéÊ¯ÆæÅ¼ ×ÜÊıÆæÅ¼
	{"Cµn","LÎ","LÎ","LÎ","LÎ"},
	{"Kh«n","Ch½n","Ch½n","Ch½n","Ch½n"},
	{"Ly","LÎ","Ch½n","LÎ","Ch½n"},
	{"Kh¶m","Ch½n","LÎ","Ch½n","LÎ"},	
	{"ChÊn","LÎ","Ch½n","Ch½n","LÎ"},
	{"Tèn","Ch½n","LÎ","LÎ","Ch½n"},
	{"CÊn","Ch½n","Ch½n","LÎ","LÎ"},
	{"§oµi","LÎ","LÎ","Ch½n","Ch½n"}
	}

function OnUse()
	local strtab = {
		"C¸ch chÕ t¹o trang bŞ B¸t Qu¸i/how_make_bagua",
		"Lµm sao lÊy Linh Th¹ch/how_get_lingshi",
		"Lµm sao kİch ho¹t bé B¸t Qu¸i/how_jihuo_bagua",
		"Lµm sao ®Ó cã ®­îc nguyªn th¹ch, linh th¹ch vµ linh th¹ch phèi ph­¬ng/ziyuanhuode",
		"Yªu cÇu c¸c trang bŞ liªn quan quÎ B¸t Qu¸i/dazao_guawei",
		"Yªu cÇu bé trang phôc B¸t Qu¸i liªn quan/bagua_taozhuang_yaoqiu",
--		"Nh©n vËt liªn quan ®Õn hÖ thèng B¸t Qu¸i/bagua_chuansong"
		}
--	if GetTask(TASK_LINGSHI_ID) == 8 or (GetTask(TASK_LINGSHI_ID) == 0 and GetLevel() > 20) then
--		tinsert(strtab,"Ta muèn më ra nhiÖm ra hÖ thèng B¸t Qu¸i Linh Th¹ch/talk_III");
--	end
		tinsert(strtab,"T¹m thêi ch­a nghÜ ra g×!/nothing");
	Say("B¹n muèn t×m hiÓu ph­¬ng diÖn nµo?",
		getn(strtab),
		strtab)
end

function how_make_bagua()
	Talk(1,"how_make_bagua2","ChÕ t¹o trang bŞ chÕ t¹o B¸t Qu¸ cã 3 b­íc\n B­íc 1, ph¶i cã trang bŞ c¬ b¶n cã linh khİ trêi ®Êt, b¹n cã thÓ t¹o ra trang bŞ nµy qua kü n¨ng sèng. Mçi trang bŞ ®Òu cã 1 <color=red>giíi h¹n gi¸ trŞ linh khİ vµ Èn Sè<color> giíi h¹n gi¸ trŞ linh khİ sÏ quyÕt ®Şnh ­u ®iÓm cña linh th¹ch cã thÓ kh¶m n¹m vµ B¸t Qu¸i Qu¸i VŞ sÏ xuÊt hiÖn trong t­¬ng lai, cßn Èn sè sÏ quyÕt ®Şnh sè l­îng linh th¹ch cã thÓ kh¶m n¹m, nÕu muèn lµm ra trang bŞ B¸t Qu¸i, b¾t buéc ph¶i cã 3 thuéc tİnh Èn. Muèn lµm ra mét bé trang bŞ cã gi¸ trŞ linh khİ cao, ph¶i thªm nhiÒu vËt phÈm cã gi¸ trŞ trong lóc ®óc, tæng gi¸ trŞ vËt phÈm cµng cao, tØ lÖ trang bŞ giíi h¹n cña gi¸ trŞ linh th¹ch t¹o ra cµng lín.");
end

function how_make_bagua2()
	Talk(1,"how_make_bagua3","<color=green>B¸t Qu¸i B¶o §iÓn<color> B­íc 2, lµm xong trang bŞ c¬ b¶n råi, míi b¾t ®Çu kh¶m n¹m linh th¹ch. Trªn mçi linh th¹ch ®Òu cã 1 ®iÓm linh khİ, nÕu trŞ sè ®iÓm linh khİ lµ sè lÎ, linh th¹ch lµ D­¬ng, trŞ sè linh khİ lµ ch½n sÏlµ ©m. Toµn bé trŞ linh khİ <color=red>cña linh th¹ch<color> kh¶m trªn trang bŞ c¬ b¶n <color=red>kh«ng v­ît qu¸<color> <color=red>giíi h¹n ®iÓm linh th¹ch<color>cña trang bŞ c¬ b¶n nµy. Lóc ®iÓm linh khİ vµ linh th¹ch cña bé trang bŞ c¬ b¶n nµy <color=red>b»ng víi<color> giíi h¹n ®iÓm linh khİ, sÏ trë thµnh trang bŞ B¸t Qu¸i ch­a kİch ho¹t. NÕu muèn xem c¸ch t¹o qu¸i vŞ trªn trang bŞ cã thÓ xem thªm trong <color=red>môc thø 6<color=red>.");
end

function how_make_bagua3()
	Talk(1,"OnUse","<color=green>B¸t Qu¸i B¶o §iÓn<color> B­íc 3, sau khi ®· cã trang bŞ B¸t Qu¸i ch­a kİch ho¹t, vÉn ch­a thÊy ®­îc trang bŞ B¸t Qu¸i kİch ho¹t, muèn tham gia kİch ho¹t trang bŞ B¸t Qu¸i ph¶i <color=red>kİch ho¹t<color> thuéc tİhh. Mang trang bŞ B¸t Qu¸i ®· kİch ho¹t, tíi c¸c thµnh phè t×m <color=red>ThÇn Du Ch©n Nh©n<color> ®Ó nhê kİch ho¹t, nh­ng ph¶i tiªu hao Th¸i H­ B¸t Qu¸i Bµi. Trang bŞ B¸t Qu¸i sau khi ®· kİch ho¹t cã thÓ mang ®Õn C«ng D· ThÕ Gia <color=red> hîp thµnh bé trang bŞ B¸t Qu¸i<color>!");
end

function how_get_lingshi()
	Talk(1,"how_get_lingshi2","<color=green>B¸t Qu¸i B¶o §iÓn<color> B­íc 1, muèn cã ®­îc linh th¹ch, ph¶i cã nguyªn th¹ch vµ trang bŞ cã hiÖu qu¶. Nguyªn th¹ch cã thÓ t¸ch ra lÊy thuéc tİnh trªn trang bŞ, sau khi t¸ch thµnh c«ng, nguyªn th¹ch nµy sÏ biÕn thµnh linh th¹ch t­¬ng øng. Nguyªn th¹ch cã t¸c dông cao thÊp kh¸c nhau, ph©n thµnh 7 cÊp, nÕu ®¼ng cÊp nguyªn th¹ch kh«ng ®ñ, còng kh«ng thÓ hÊp thu thuéc tİnh cÊp cao cña trang bŞ ®i kÌm. Nguyªn th¹ch ph©n thµnh <color=red>Thiªn, §Şa, Nh©n<color>, ph©n biÖt dùa trªn c¸c thuéc tİnh <color=red> 1, 2, 3<color> t­¬ng øng trªn trang bŞ. Muèn t¸ch ®­îc thuéc tİnh nµo th× ph¶i sö dông lo¹i nguyªn th¹ch ®ã.");
end

function how_get_lingshi2()
	Talk(1,"OnUse","<color>: Hai, trang bŞ cã thuéc tİnh linh khİ cao cÊp rÊt İt, muèn nhËn ®­îc Linh Th¹ch cao cÊp, cßn mét c¸ch kh¸c, tù m×nh<color=red>hîp thµnh Linh Th¹ch<color>, biÕn nhiÒu Linh Th¹ch thµnh mét Linh Th¹ch, nÕu nhiÒu Linh Th¹ch cïng lo¹i, kh¶ n¨ng hîp thµnh Linh Th¹ch sÏ cao. Thêi chiÕn Th­îng cæ Phong ThÇn cã truyÒn l¹i ph­¬ng ph¸p phèi hîp hîp thµnh Linh th¹ch, nÕu lÊy ®­îc ph­¬ng ph¸p phèi hîp nµy, lµm theo ghi chĞp, bæ sung Linh Th¹ch t­¬ng øng, cã thÓ hîp thµnh Linh Th¹ch, nh­ng ch­a C¸c ng­êi thµnh c«ng...");
end

function how_jihuo_bagua()
	Talk(1,"how_jihuo_bagua2","B¸t Qu¸i trong trêi ®Êt vèn cã t­¬ng t¸c lÉn nhau, thiªn biÕn v¹n hãa hãa, C«ng D· ThÕ Gia c¶ ®êi ra søc nghiªn cøu…");
end

function how_jihuo_bagua2()
	Talk(1,"how_jihuo_bagua3","B­íc 1, ph¶i hîp thµnh bé trang bŞ B¸t Qu¸i, tr­íc hÕt ph¶i cã <color=red>trang bŞ B¸t Qu¸i <color> t­¬ng øng. Sau khi tËp hîp ®Çy ®ñ, ®Õn C«ng D· ThÕ Gia hîp thµnh. Mçi bé trang bŞ B¸t Qu¸i cã trŞ Linh khİ kh¸c nhau, hiÖu qu¶ hîp thµnh trang bŞ B¸t Qu¸i cã liªn quan ®Õn <color=red>trŞ sè linh khİ kİch ho¹t<color>. NÕutrŞ linh khİ kİch ho¹t qu¸ thÊp, hiÖu qu¶ sau khi hîp thµnh sÏ thÊp. Lóc hîp thµnh nÕu cho thªm c¸c vËt phÈm <color=red>gi¸ trŞ<color> th× sÏ gi¶m thiÓu tæn thÊt!");
end

function how_jihuo_bagua3()
	Talk(1,"OnUse","B­íc 2, nÕu thuéc tİnh kİch ho¹t cho trang bŞ B¸t Qu¸i ®ã kh«ng ®ñ, ph¶i phôc håi l¹i tr¹ng th¸i ban ®Çu. Nh­ng nÕu thÊt b¹i th× sÏ <color=red>tæn thÊt<color> mét sè trang bŞ trong bé B¸t Qu¸i ®ã. NÕu muèn n©ng cao kh¶ n¨ng thµnh c«ng vµ gi¶m bít tæn thÊt, trong lóc phôc håi l¹i ph¶i thªm c¸c lo¹i vËt phÈm cã gi¸ trŞ");
end

function bagua_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTaoZhuang)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTaoZhuang[nPageNum*nPage+i][1].."Trang bŞ: §iÓm linh khİ ®¬n "..tTaoZhuang[nPageNum*nPage+i][7].."]["..tTaoZhuang[nPageNum*nPage+i][2]..":"..tTaoZhuang[nPageNum*nPage+i][3]..":"..tTaoZhuang[nPageNum*nPage+i][4]..":"..tTaoZhuang[nPageNum*nPage+i][5].."]["..tTaoZhuang[nPageNum*nPage+i][6].."]/#taozhuang_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"Trang tr­íc/#bagua_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"Trang kÕ/#bagua_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"trë l¹i/OnUse");
	Say("Trang bŞ B¸t Qu¸i cã: ",
		getn(tDiaTab),
		tDiaTab)
end	

function taozhuang_detail(nPage,nType)
	Talk(1,"#bagua_taozhuang("..nPage..")","\n<color=red>"..tTaoZhuang[nType][1].."<color>trang bŞ<color=red>"..tTaoZhuang[nType][2].."<color>Qu¸i §Çu Bé+<color=red>"..tTaoZhuang[nType][3].."<color>Qu¸i Y Phôc+<color=red>"..tTaoZhuang[nType][4].."<color>Qu¸i H¹ Trang+<color=red>"..tTaoZhuang[nType][5].."<color>Qu¸i Vò Khİ. Ph¹m vi ®iÓm linh khİ cÇn cho mçi trang bŞ lµ: <color=red>"..tTaoZhuang[nType][7].."<color>. Thuéc tİnh kİch ho¹t lµ: <color=red>"..tTaoZhuang[nType][6].."<color>")
end

function dazao_guawei()
	local strtab = {};
	for i=1,getn(tGuaWei) do
		tinsert(strtab,tGuaWei[i][1]..": Tæng linh khİ ["..tGuaWei[i][5].."] Thø tù 3 khæng linh khİ ["..tGuaWei[i][2].."]["..tGuaWei[i][3].."]["..tGuaWei[i][4].."]/#guawei_detail("..i..")");
	end
	tinsert(strtab,"Ta biÕt râ c¶ råi, ta ta ph¶i hiÓu râ néi dung cña nã./OnUse");
	Say("B¹n muèn t×m hiÓu qu¸i vŞ nµo?",
		getn(strtab),
		strtab);
end

function ziyuanhuode()
	Say("Nh÷ng vËt liªn quan víi linh th¹ch nµy ph¶i lµm sao ®Ó cã!? Ph¶i t×m hiÓu cho kü!",
	5,
	"NhËn ®­îc Nguyªn Th¹ch/yuanshihuode",
	"NhËn ®­îc Linh Th¹ch/lingshihuode",
	"Hîp thµnh Linh Th¹ch/hechenglingshi",	
	"BiÕt ®­îc c¸ch phèi hîp Linh Th¹ch /lingshipeifanghuode",
	"§Õn hái th¨m th«i mµ!/SayHello"
	)
end

function yuanshihuode()
	Talk(1,"OnUse","B¹n cã thÓ mua Nguyªn th¹ch<color> ë<color=red>chñ tiÖm t¹p hãa<color>, cÇn chó ı lµ vŞ trİ thuéc tİnh linh khİ t­¬ng øng víi c¸c linh th¹ch kh¸c nhau th× kh«ng gièng nhau, thuéc tİnh cao nhÊt cña c¸c ®¼ng cÊp nguyªn th¹ch kh¸c nhau ®­îc lÊy ra còng kh«ng gièng nhau!")
end

function lingshihuode()
	Talk(1,"OnUse","Ngoµi dïng Nguyªn Th¹ch ®Ó rót Linh khİ trang bŞ ra, nghe nãi hai n­íc Tèng Liªu ®Ó cæ vò t­íng sü, phµm ai tham gia <color=red>chiÕn tr­êng Nh¹n M«n quan<color> ®Òu ®­îc th­ëng <color=red>Linh Th¹ch<color>, nh­ng muèn cã ®­îc Linh Th¹ch ph¶i xem xĞt c«ng tr¹ng vµ biÓu hiÖn cña hä. TruyÒn r»ng bän s¸t thñ rÊt høng thó víi Linh Th¹ch, c¸c anh hïng khi gÆp bän <color=red>s¸t thñ<color> cÇn l­u t©m xem chóng cã mang theo Linh Th¹ch nµy kh«ng.")
end

function hechenglingshi()
	Talk(1,"OnUse"," Linh Th¹ch nµy thÕ gian rÊt hiÕm thÊy. C¸c vŞ tiÒn nh©n ®· v« cïng khæ cùc nghiªn cøu ra <color=red>Linh Th¹ch phèi ph­¬ng<color>, chØ cÇn <color=red>Linh Th¹ch phèi ph­¬ng<color> vµ <color=red>Linh Th¹ch<color> cïng ®Æt trªn cét hîp thµnh Linh Th¹ch ®Ó t¹o ra <color=red>Linh Th¹ch theo phèi ph­¬ng<color>. Kh«ng thªm phèi ph­¬ng, tïy ı kÕp hîp Linh Th¹ch tuy cã thÓ hîp thµnh, nh­ng thµnh c«ng hay kh«ng cßn do Trêi ®Şnh.")
end

function lingshipeifanghuode()
	Talk(1,"OnUse","Linh Th¹ch phèi ph­¬ng tõ Th­îng cæ l­u truyÒn ®Õn nay kh«ng nhiÒu...Ng­¬i cèng hiÕn cho m«n ph¸i, hoµn thµnh <color=red>nhiÖm vô s­ m«n<color> mçi ngµy, tin r»ng ch­ëng m«n sÏ hiÓu ®­îc sù nç lùc cña ng­¬i. C¸c s¸t thñ cao cÊp trong <color=red>S¸t thñ ®­êng<color> ®Òu cã mang theo phèi ph­¬ng, nh­ng cã lÊy ®­îc hay kh«ng cßn ph¶i xem vËn khİ cña ng­¬i n÷a!")
end

function guawei_detail(nType)
	if nType > 0 and nType <= getn(tGuaWei) then
		local strtab = {
			"Xem Qu¸i vŞ kh¸c/dazao_guawei",
			"Tho¸t/nothing"};
		Say("ChÕ t¹o 1 bé <color=yellow>"..tGuaWei[nType][1].."<color>Qu¸i trang bŞ cÇn \ntrang bŞ: giíi h¹n ®iÓm linh khİ lµ <color=yellow>"..tGuaWei[nType][5].."<color>Trang bŞ sè\nKh¶m n¹m viªn linh th¹ch thø 1: ®iÓm linh khİ kh¶m n¹m lµ <color=yellow>"..tGuaWei[nType][2].."<color>linh th¹ch sè\nKh¶m n¹m viªn linh th¹ch thø 2: ®iÓm linh khİ kh¶m n¹m lµ <color=yellow>"..tGuaWei[nType][3].."<color>linh th¹ch sè\nkh¶m n¹m viªn linh th¹ch thø 3: d®iÓm linh khİ kh¶m n¹m lµ <color=yellow>"..tGuaWei[nType][4].."<color>linh th¹ch sè\nB¸t Qu¸t trang bŞ vµ ®iÓm linh khİ cña linh th¹ch ph¶i phï hîp trªn b¶ng chØ dÉn, lóc ®iÓm cña 3 viªn linh th¹ch b»ng víi giíi h¹n ®iÓm linh khİ trang bŞ tøc lµ h×nh thµnh trang bŞ b¸t qu¸i ch­a kİch ho¹t.",
			getn(strtab),
			strtab)
	end
end

function nothing()

end 

function bagua_chuansong()
	local nPos = GetWorldPos();
	if nPos >= 700 then
		Talk(1,"OnUse","Khu vùc hiÖn t¹i kh«ng thÓ dïng chøc n¨ng truyÒn tèng nµy!");
		return
	end
	if GetFightState() == 1 then
		Talk(1,"OnUse","Xin sö dông chøc n¨ng truyÒn tèng nµy trong khu vùc hßa b×nh.");
		return
	end
	Say("§· gäi lµ b¶o ®iÓn, ®­¬ng nhiªn ph¶i kh¸c c¸c vËt tÇm th­êng! ChØ cÇn tèn 1 chót tiÒn lµ cã thÓ ®­a ng­¬i ®Õn n¬i muèn ®Õn!",
	5,
	"Ng­êi kİch ho¹t B¸t Qu¸i trang bŞ vµ lÊy linh th¹ch/gongyeshijia",
	"Ng­êi gióp chÕ t¹o trang bŞ linh khİ vµ ®ôc lç/zhizuoxi",
	"Ng­êi gióp kİch ho¹t trang bŞ b¸t qu¸i!/shenyouzhenren",
	"Ng­êi gióp kh¶m n¹m linh th¹ch vµ t¨ng trang bŞ B¸t Qu¸i./liutiejiang",
	"ChØ xem thö!/SayHello"	
	)
end

function gongyeshijia()
	Say("C¸c truyÒn nh©n cña C«ng §· ThÕ Gia ë ®©u còng cã. LÊy vµ hîp thµnh Linh th¹ch hä ®Òu gióp ®­îc. Ta cã thÓ ®­a ®Õn ng­¬i ®ã, thu phİ <color=red>20 b¹c<color> nhĞ!.",
	4,
	"C«ng D· Binh- T­¬ng D­¬ng/gongyebing",
	"C«ng D· Khİ- D­¬ng Ch©u./gongyeqi",
	"C«ng D· Cô -§¹i Lı/gongyeju",
	"Ta kh«ng muèn t×m hä./SayHello"	
	)
end

function zhizuoxi()
	Say("Thiªn h¹ thî rÌn khĞo tay rÊt nhiÒu, mÊy vŞ nµy ®Òu lµ cao thñ trong trong ®ã, b¸t qu¸i vµ c¸c trang bŞ cã lç nhÊt ®Şnh ph¶i t×m hä míi ®­îc. Thu phİ <color=red>101 b¹c<color> nhĞ!",
	7,
	"BiÖn Kinh to lín, binh khİ ®­îc chÕ t¹o nhiÒu, chñ yÕu lµ c«n, th­¬ng, thiÒn tr­îng/moda",
	"M¹c NhŞ ë Thµnh §«, thiªn vÒ chÕ t¹o vò khİ ng¾n dµi, chñ yÕu lµ ®ao, kiÕm, song ®ao, hé thñ./moer",
	"M¹c Tam ë T­¬ng D­¬ng, thiªn vÒ chÕ t¹o binh khİ kú m«n, chñ yÕu ¸m khİ, ®µn, bót, tr¶o, cung/mosan",
	"CÈm N­¬ng ë Thµnh §«, thiªn vÒ dÖt v¶i, mçi h×nh d¸ng ®Òu cã thÓ häc ®­îc tõ bµ Êy./jinniang",
	"Tö Quyªn c« n­¬ng ë §¹i Lı, thiªn vÒ dÖt h¹ trang/zijuan",
	"Minh s­ phô ë T­¬ng D­¬ng, chuyªn vÒ Kh«i qu¸n/mingshifu",
	"Ta kh«ng muèn t×m hä./SayHello"	
	)
end

function shenyouzhenren()
	Say("Nãi ®Õn B¸t Qu¸i, ph¶i nãi ®Õn ThÇn Du Ch©n Nh©n, kİch ho¹t trang bŞ b¸t qu¸i ch­a kİch ho¹t ph¶i dùa vµo «ng ta, thu tiÒn<color=red>10 b¹c<color> nhĞ.",
	4,
	"ThÇn Du Ch©n Nh©n ë BiÖn Kinh/bianjingshenyou",
	"ThÇn Du Ch©n Nh©n ë Thµnh §«/chengdushenyou",
	"ThÇn Du Ch©n Nh©n ë TuyÒn Ch©u/quanzhoushenyou",
	"Ta kh«ng muèn t×m hä./SayHello"	
	)
end
	
function liutiejiang()
	Say("C­êng hãa trang bŞ, cã ai kh«ng biÕt danh tiÕng cña thî rÌn L­u! Thu tiÒn <color=red>20 b¹c<color>.",
	2,
	"Thî rÌn L­u ë T­¬ng D­¬ng/xiangyangliutie",
	"Ta kh«ng muèn t×m hä./SayHello"	
)
end

function moneygo1()
	return	PrePay(2000)
end;

function moneygo2()
	return	PrePay(1000)
end;

function gongyebing()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
		NewWorld(350,1399,2992)
		SetFightState(0);
	end
end

function gongyeqi()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(150,1647,3152)
			SetFightState(0);
	end
end

function gongyeju()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(400,1493,3058)
			SetFightState(0);
	end
end

function xiangyangliutie()
	n=moneygo1()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(350,1415,2930)
			SetFightState(0);
	end
end

function moda()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(200,1426,3025)
			SetFightState(0);
	end
end

function moer()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(300,1709,3459)
			SetFightState(0);
	end
end

function mosan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(350,1345,2929)
			SetFightState(0);
	end
end

function jinniang()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(300,1862,3479)
			SetFightState(0);
	end
end

function zijuan()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(400,1409,2985)
			SetFightState(0);
	end
end

function mingshifu()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(350,1546,2935)
			SetFightState(0);
	end
end
	
function bianjingshenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(200,1151,2855)
			SetFightState(0);
	end
end

function chengdushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(300,1975,3557)
			SetFightState(0);
	end
end

function quanzhoushenyou()
	n=moneygo2()
	if n==0 then 
		Talk(1,"","H×nh nh­ ng­¬i kh«ng ®ñ tiÒn?")
	else 
		CleanInteractive();	--½â³ıÍæ¼Ò»¥¶¯¶¯×÷ added by yanjun 2006-3-14
			NewWorld(100,1379,2860)
			SetFightState(0);
	end
end

function SayHello()

end

function bagua_taozhuang_yaoqiu()
	local strtab = {
		"trang bŞ B¸t Qu¸i Phæ th«ng /#bagua_taozhuang(0)",
--		"ÌìµØĞş»ÆÌ××°/#tiandi_taozhuang(0)",
		"trë l¹i/OnUse"};
	Say("Ng­¬i muèn xem trang bŞ b¸t qu¸i nµo?",
		getn(strtab),
		strtab)
end

function tiandi_taozhuang(nPage)
	local nPageNum = 7;
	local nRemaidNum = getn(tTiandi)-(nPageNum*nPage);
	local tDiaTab = {};
	local num_this_dia = 7;
	if nRemaidNum <= 7 then
		num_this_dia = nRemaidNum;
	end
	for i=1,num_this_dia do
		tinsert(tDiaTab,tTiandi[nPageNum*nPage+i][1].."Trang bŞ: §iÓm linh khİ ®¬n "..tTiandi[nPageNum*nPage+i][8].."]["..tTiandi[nPageNum*nPage+i][2]..":"..tTiandi[nPageNum*nPage+i][3]..":"..tTiandi[nPageNum*nPage+i][4]..":"..tTiandi[nPageNum*nPage+i][5].."]/#tiandi_detail("..nPage..","..(nPageNum*nPage+i)..")");
	end
	if nPage ~= 0 then
		tinsert(tDiaTab,"Trang tr­íc/#tiandi_taozhuang("..(nPage-1)..")");
	end
	if nRemaidNum > nPageNum then
		tinsert(tDiaTab,"Trang kÕ/#tiandi_taozhuang("..(nPage+1)..")");
	end
	tinsert(tDiaTab,"trë l¹i/OnUse");
	Say("Trang bŞ Thiªn §Şa HuyÒn hoµng bao gåm thuéc tİnh trang bŞ Phæ th«ng B¸t Qu¸i.",
		getn(tDiaTab),
		tDiaTab)
end	

function tiandi_detail(nPage,nType)
	Talk(1,"#tiandi_taozhuang("..nPage..")","\n<color=red>"..tTiandi[nType][1].."<color>trang bŞ<color=red>"..tTiandi[nType][2].."<color>Qu¸i §Çu Bé+<color=red>"..tTiandi[nType][3].."<color>Qu¸i Y Phôc+<color=red>"..tTiandi[nType][4].."<color>Qu¸i H¹ Trang+<color=red>"..tTiandi[nType][5].."<color>Qu¸i Vò Khİ. Ph¹m vi ®iÓm linh khİ cÇn cho mçi trang bŞ lµ: <color=red>"..tTiandi[nType][8].."<color>. Thuéc tİnh kİch ho¹t lµ: <color=red>"..tTiandi[nType][6].."."..tTiandi[nType][7].."<color>.")
end