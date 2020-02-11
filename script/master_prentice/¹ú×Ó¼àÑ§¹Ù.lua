-- ¹ú×Ó¼àÑ§¹Ù

Include("\\script\\master_prentice\\some_op.lua")
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı

function main()
	do return end
	if MPUpdate("\\script\\master_prentice\\¹ú×Ó¼àÑ§¹Ù.lua", "main_cb", 0) == 0 then
		main_cb()
	end
end

function main_cb()
	local tInfo = GetMPBaseInfo()
	if tInfo["master"] ~= "" then
		Say("S­ phô cã mét chót quµ cho b¹n. Muèn nhËn chø?",
			6,
			"Tói HËu sinh kh¶ óy (cã thÓ nhËn khi trë thµnh ®Ö tö chİnh thøc)/#lin_bao(10)",
			"Tói TiÒn tr×nh tù cÈm ( cã thÓ nhËn sau khi ®Ö tö chİnh thøc ®¹t cÊp 45)/#lin_bao(45)",
			"Tói S­ ®å t×nh th©m (cã thÓ nhËn sau khi ®Ö tö chİnh thøc ®¹t cÊp 60)/#lin_bao(60)",
			"ThuyÕt minh HÖ thèng S­ ®å/see_info2",
			"NhËn 1 ThiÖp b¸i s­/baishitie",
			"Kh«ng viÖc g×, chØ xem th«i./no_say")
	elseif tInfo["ismaster"] == 0 then
		Say("Quèc Tö gi¸m chİnh lµ n¬i ®Ó d¹y häc cña triÒu ®×nh…ChØ cÇn ®¼ng cÊp ®¹t ®Õn <color=yellow>75<color>, ®Õn Quèc Tö gi¸m -ThÇn Vâ viÖn ®¨ng kı lµ cã thÓ thu nhËn ®å ®Ö",
			5,
			"Ta muèn thµnh s­ phô/yes_make_master",
			"T«i muèn lµm ®å ®Ö/yes_be_prentice",
			"ThuyÕt minh HÖ thèng S­ ®å/see_info2",
			"NhËn 1 ThiÖp b¸i s­/baishitie",
			"Kh«ng viÖc g×, chØ xem th«i./no_say")
	elseif tInfo["ismaster"] > 0 then
		Say("C¸c h¹ ®· ®¨ng kı trong hå s¬ lµ S­ phô vâ häc Quèc Tö gi¸m ThÇn vâ viÖn, muèn gióp g× cø nãi ",
			9,
			"c«ng bè NhiÖm vô S­ ®å/create_task",
			"Dïng §iÓm S­ ®å nhËn phÇn th­ëng/use_point",
			"Mua hoa hång cho ®å ®Ö nµy/buy_fund",
			"Dïng bæng léc mua vËt phÈm Quèc Tö gi¸m/#use_fenglu(1)",
			"NhËn 1 nhiÖm vô xuÊt s­/get_graduate_item",
			"Ta muèn b¸i «ng ta lµm s­ phô, Ta ph¶i hñy bá ®¨ng kı ë Quèc Tö gi¸m/disband_master",
			"ThuyÕt minh HÖ thèng S­ ®å/see_info2",
			"NhËn 1 ThiÖp b¸i s­/baishitie",
			"Kh«ng viÖc g×, chØ xem th«i./no_say")
	end
end

function lin_bao(nLevel)
	local tInfo = GetMPBaseInfo()
	if GetLevel() < nLevel then
		Say("®¹t ®Õn cÊp "..nLevel.." råi h·y tíi.", 0)
		return
	end
	
	if tInfo["istemp"] == 0 then
		Say("Trë thµnh ®å ®Ö chİnh thøc tr­íc råi h·y tíi.", 0)
		return
	end
	local n1, n2, n3 = CustomDataRead("mp_p_award")
	local tLeveltoIdx =
	{
		[10] = {n1, " tói HËu Sinh Kh¶ óy"},
		[45] = {n2, "TiÒn Tr×nh Tù CÈm Bµo"},
		[60] = {n3, "Tói S­ §å T×nh Th©m"},
	}
	for index, value in tLeveltoIdx do
		if value[1] == nil then
			value[1] = 0
		end
	end
	
	if tLeveltoIdx[nLevel][1] == 1 then
		Say("Ng­¬i ®· nhËn "..tLeveltoIdx[nLevel][2].."1 lÇn råi.", 0)
		return
	end
	
	if Zgc_pub_goods_add_chk(1,1) == 0 then
		return
	end
	
	local tItem =
	{
		[10] = {2,1,591," tói HËu Sinh Kh¶ óy"},
		[45] = {2,1,592,"TiÒn Tr×nh Tù CÈm Bµo"},
		[60] = {2,1,597,"Tói S­ §å T×nh Th©m"},
	}
	
	AddItem(tItem[nLevel][1], tItem[nLevel][2], tItem[nLevel][3], 1, 1)
	tLeveltoIdx[nLevel][1] = 1
	CustomDataSave("mp_p_award", "ddd", tLeveltoIdx[10][1], tLeveltoIdx[45][1], tLeveltoIdx[60][1])
	WriteLog("[S­ ®å-hoa hång ®å ®Ö]:"..GetName().."NhËn ®­îc 1 "..tItem[nLevel][4])
end

function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("C¸c h¹ muèn biÕt thuyÕt minh vÒ phÇn s­ phô hay ®å ®Ö? RÊt nhiÒu thao t¸c cña HÖ thèng S­ ®å ®Òu ph¶i më <color=yellow>B¶ng th«ng tin s­ ®å<color>, sau ®ã <color=yellow>nhÊp ph¶i vµo tªn mét ng­êi trong danh s¸ch<color> sÏ xuÊt hiÖn giao diÖn ®Ó thao t¸c.",
		3,
		"Néi dung vÒ mÆt s­ phô/shifu",
		"Néi dung vÒ mÆt ®å ®Ö/tudi",
		"Kh«ng viÖc g×, chØ xem th«i./no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("VÒ mÆt s­ phô cã nh÷ng néi dung bªn d­íi. RÊt nhiÒu thao t¸c cña HÖ thèng S­ ®å ®Òu ph¶i më <color=yellow>B¶ng th«ng tin s­ ®å<color>, sau ®ã <color=yellow>nhÊp ph¶i vµo tªn mét ng­êi trong danh s¸ch<color> sÏ xuÊt hiÖn giao diÖn ®Ó thao t¸c.",
		9,
		"Lµm sao ®Ó nhËn ®Ö tö/shoutu",
		"NhiÖm Vô S­ §å sau khi nhËn ®Ö tö lµ g×/shirenwu",
		"§iÓm S­ ®å lµ g×/shitudianshu",
		"§iÓm S­ ®øc lµ g×/shidedianshu",
		"Thô NghiÖp §¼ng CÊp lµ g×/shouyedengji",
		"Hoa Hång Quèc Tö Gi¸m lµ g×?/huahong",
		"Bæng Léc Quèc Tö gi¸m lµ g×, cã thÓ mua ®­îc nh÷ng g×/fenglu",
		"Lµm sao chÊm døt quan hÖ S­ ®å/shichushi",
		"Kh«ng viÖc g×, chØ xem th«i./no_say"
		)
end
	
function shoutu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"shifu","NÕu C¸c h¹ muèn nhËn ®å ®Ö, ph¶i ®Õn chç ta ®¨ng kı, sau ®ã më b¶ng <color=yellow>'th«ng tin s­ ®å'<color>","§¨ng kı xong, nhÊn F3 sÏ xuÊt hiÖn b¶ng <color=yellow>'trang bŞ thuéc tİnh'<color>trong giao diÖn sÏ cã <color=yellow>'th«ng tin s­ ®å'<color>, cã thÓ kiÓm tra t×nh tr¹ng s­ ®å hiÖn t¹i cña b¹n. Chän më <color=white>'NhËn ®å ®Ö'<color> ®Ó xem vµ t×m ®Õn nh÷ng ai muèn b¸i s­.","Khi b¹n gÆp <color=white>ng­êi ch¬i cã ®¼ng cÊp thÊp h¬n<color>, nhÊn <color=white>Ctrl<color> vµ nhÊp chuét ph¶i chän 'NhËn lµm ®å ®Ö'. NÕu ®èi ph­¬ng ®ång ı th× sÏ trë thµnh <color=white>®Ö tö t¹m thêi<color> cña b¹n.","Khi <color=green>§å ®Ö t¹m thêi<color>®¹t ®Õn <color=yellow>cÊp 10<color>, cã thÓ chİnh thøc b¸i s­. ChØ cÇn hai ng­êi hîp thµnh tæ, anh ta sÏ <color=white>'B¸i'<color> b¹n ë cù ly gÇn ®Ó xin trë thµnh <color=white>®å ®Ö chİnh thøc<color>.")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","Sau khi C¸c h¹ trë thµnh s­ phô, mçi ngµy cã thÓ ®Õn chç ta c«ng bè <color=yellow>NhiÖm vô S­ ®å<color>, cã 7 nhiÖm vô ®Ó chän. Sau khi c«ng bè nhiÖm vô, lÖnh ®å cã thÓ tiÕp nhËn nhiÖm vô trong <color=yellow>b¶ng th«ng tin s­ ®å<color>.","Kú h¹n sau khi truyÒn lÖnh lµ <color=yellow>24 tiÕng<color>, nghÜa lµ ph¶i hoµn thµnh xong nhiÖm vô trong vßng 24 tiÕng. §ång thêi chØ ®­îc truyÒn 1 nhiÖm vô trong vßng 24 tiÕng ®ã mµ th«i.","NhiÖm vô hoµn thµnh xong, lÖnh ®å sÏ nhËn ®­îc phÇn th­ëng nhiÖm vô, nÕu lµ s­ phô sÏ nhËn ®­îc <color=yellow>§iÓm S­ ®å<color>. 1 ®å ®Ö hoµn thµnh nhiÖm vô trong ngµy cã thÓ gióp s­ phô cã <color=green>10 ®iÓm<color> S­ ®å. <color=yellow>§å ®Ö cµng nhiÒu, b¹n cµng ®­îc nhiÒu ®iÓm S­ ®å<color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>§iÓm S­ ®å<color> lµ phÇn th­ëng mµ s­ phô nhËn ®­îc sau khi ®Ö tö hoµn thµnh NhiÖm vô S­ ®å. 1 ®Ö tö hoµn thµnh xong nhiÖm vô trong thêi gian qui ®Şnh sÏ tÆng cho s­ phô <color=green>10<color> §iÓm S­ ®å. T¸c dông cña §iÓm S­ ®å <color=yellow> chuyÓn thµnh phÇn th­ëng cña s­ phô<color> hoÆc <color=yellow>chuyÓn thµnh §iÓm S­ §øc<color>.","S­ phô cã thÓ ®Õn chç ta ®æi §iÓm S­ ®å thµnh phÇn th­ëng<color=yellow>Mçi 1 ®iÓm ®æi mét phÇn th­ëng<color>. §æi ®iÓm sÏ ph¶i tiªu hao <color=yellow>S­ ®å phï chØ<color>, mçi 1 ®iÓm S­ ®å sÏ tiªu hao 1 S­ ®å phï chØ. <color=green>C¨n cø vµo ®¼ng cÊp thô nghiÖp cña s­ phô cao hay thÊp mµ cã thÓ trùc tiÕp ®æi mét phÇn gi¶i th­ëng<color>.","S­ phô còng cã thÓ lÊy §iÓm S­ ®å chuyÓn thµnh <color=yellow>§iÓm S­ ®øc<color>, còng ph¶i tiªu hao<color=yellow>S­ ®å phï chØ<color> mçi lÇn chuyÓn 1 ®iÓm S­ ®å ph¶i mÊt 1 tê s­ ®å. Xin l­u ı, <color=green>Lóc chuyÓn §iÓm S­ ®å cÇn cã S­ ®å phï chØ, kh«ng thÓ c¨n cø ®¼ng cÊp thô nghiÖp cña s­ phô mµ chuyÓn ®æi<color>.","Tõ khi tİnh NhiÖm vô S­ ®å cña s­ phô giao cho , <color=green>§iÓm S­ ®å sÏ b»ng 0 sau 24 tiÕng<color>. NghÜa lµ ®iÓm s­ ®å ®¹t ®­îc sau mçi nhiÖm vô sÏ kh«ng l­u l¹i trong nhiÖm vô lÇn sau.","§¼ng cÊp thô nghiÖp cµng cao, ®iÓm s­ ®å nhËn ®­îc cµng nhiÒu.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"§iÓm s­ ®øc quyÕt ®Şnh trŞ sè <color=yellow>®¼ng cÊp thô nghiÖp<color>, do §iÓm S­ ®å céng S­ ®å phï chØ.","§iÓm S­ ®å mçi ngµy sÏ gi¶m ®i <color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"§¼ng cÊp thô nghiÖp biÓu thŞ ®¼ng cÊp b¹n lµ s­ phô vâ häc, do trŞ sè ®iÓm s­ ®øc quyÕt ®Şnh <color=yellow>§iÓm s­ ®øc cµng cao, ®¼ng cÊp thô nghiÖp cµng cao, b¹n cµng thu nhËn ®­îc nhiÒu ®å ®Ö<color>. §¼ng cÊp thô nghiÖp cao nhÊt hiÖn nay lµ cÊp 10, cã thÓ thu nhËn ®­îc 15 ®å ®Ö.","D­íi ®©y lµ thuyÕt minh cña 10 Thô NghiÖp §¼ng CÊp c¬ b¶n: \n\nCÊp 1 §iÓm S­ ®øc <color=yellow>0<color> dÉn ®­îc <color=yellow>3<color> ®å ®Ö. CÊp 6 §iÓm S­ ®øc <color=yellow>1200<color> dÉn ®­îc <color=yellow>8<color> ®å ®Ö\nCÊp 2 §iÓm S­ ®øc <color=yellow>100<color> dÉn ®­îc <color=yellow>4<color> ®å ®Ö. CÊp 7 §iÓm S­ ®øc <color=yellow>1600<color> dÉn ®­îc <color=yellow>9<color> ®å ®Ö\n CÊp 3 §iÓm S­ ®øc <color=yellow>300<color> dÉn ®­îc <color=yellow>5<color> ®å ®Ö. CÊp 8 §iÓm S­ ®øc <color=yellow>2000<color> dÉn ®­îc <color=yellow>10<color> ®å ®Ö\nÊcp 4 §iÓm S­ ®øc <color=yellow>550<color> dÉn ®­îc <color=yellow>6<color> ®å ®Ö. CÊp 9 §iÓm S­ ®øc <color=yellow>2500<color> dÉn ®­îc <color=yellow>12<color> ®å ®Ö\nCÊp 5 §iÓm S­ ®øc <color=yellow>850<color> dÉn ®­îc <color=yellow>7<color> ®å ®Ö. CÊp 10 §iÓm S­ ®øc <color=yellow>3000<color> dÉn ®­îc <color=yellow>15<color> ®å ®Ö")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Hoa hång Quèc Tö gi¸m<color> lµ do triÒu ®×nh x©y dùng nh»m khİch lÖ tinh thÇn vâ häc. C¸c h¹ cã thÓ ®Õn chç ta mua <color=yellow>hoa hång<color> cho lŞnh ®å, khi ®å ®Ö tr­ëng thµnh, c¸c h¹ cã thÓ nhËn <color=yellow>bæng léc<color> t­¬ng øng. NÕu ®å ®Ö xuÊt s­ vµ ®¹t ®­îc mäi yªu cÇu, c¸c h¹ cã thÓ nhËn ®­îc bæng léc nhiÒu h¬n hoa hång gÊp <color=green>6 lÇn<color>.","Xin l­u ı, <color=yellow>tõ khi b¸i s­ trë thµnh ®Ö tö chİnh thøc, nh÷ng bæng léc tr­íc ®©y s­ phô kh«ng nhËn ®­îc<color>. NÕu nh­ ®Ö tö cÊp 65 chİnh thøc b¸i s­ trë thµnh ®Ö tö chİnh thøc, bæng léc tr­íc cÊp 65 nh­ cÊp 30, 40, 50 vµ 60, s­ phô sÏ kh«ng nhËn ®­îc.","<color=yellow>Mçi s­ phô chØ cã thÓ l·nh bæng léc ch­a bŞ l·nh cña ®å ®Ö hiÖn t¹i<color>. VŞ s­ phô sau kh«ng thÓ l·nh bæng léc cña ®å ®Ö nÕu s­ phô tr­íc ®©y ®· l·nh. Sau khi 2 ng­êi ch¬i kÕt hîp mèi quan hÖ s­ ®å, s­ phô cã thÓ nhÊp vµo 'kiÓm ta hoa hång' trong b¶ng s­ ®å ®Ó kiÓm tra nh÷ng bæng léc mµ s­ phô tr­íc cña ®å ®Ö nµy ®· l·nh.")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=white>Bæng léc Quèc Tö gi¸m <color> lµ phÇn th­ëng sau khi b¹n mua hoa hång ®Ó huÊn luyÖn cho ®Ö tö, dïng ®Ó mua nh÷ng vËt phÈm quı hiÕm","Chç ta cã b¸n rÊt nhiÒu lo¹i vËt phÈm, nh­ng ph¶i dïng Bæng léc Quèc Tö gi¸m míi cã thÓ mua.","<color=yellow>Bæng léc Quèc Tö gi¸m<color> nhËn trùc tiÕp trong <color=yellow> giao diÖn s­ ®å<color>. NhÊp chuét ph¶i tªn ®Ö tö chän <color=yellow>KiÓm tra hoa hång<color> vµo <color=yellow>giao diÖn hoa hång<color> xem t×nh h×nh tr­ëng thµnh cña ®Ö tö hoÆc <color=yellow>NhËn bæng léc<color>.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("Cã 3 c¸ch kÕt thóc quan hÖ s­ ®å, xuÊt s­, trôc xuÊt s­ m«n vµ ph¶n béi s­ m«n",
		4,
		"Lµm thÕ nµo ®Ó xuÊt s­/shichushi1",
		"Lµm thÕ nµo ®Ó trôc xuÊt s­ m«n/shichushi2",
		"Ph¶n béi s­ m«n lµ nh­ thÕ nµo/shichushi3",
		"Kh«ng viÖc g×, chØ xem th«i./no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"Khi lÖnh ®å ®¹t <color=green>cÊp 73<color>, ng­¬i cã thÓ ®Õn gÆp ta nhËn nhiÖm vô xuÊt s­. NhËn ®­îc <color=yellow>'XuÊt S­ Tiªu'<color>, tæ ®éi víi ®å ®Ö ra ngoµi thµnh, dïng XuÊt S­ Tiªu gäi ra <color=yellow>TuÇn kh¶o Quèc Tö gi¸m<color>, lµ ng­êi cña triÒu ®×nh ph¸i ®Õn ®Ó kiÓm tra xuÊt s­.","Sau khi gäi tuÇn kh¶o Quèc Tö Gi¸m ra, ph¶i <color=yellow>®¸nh b¹i<color> h¾n. Xin l­u ı, <color=green> b­íc cuèi cïng ph¶i do lÖnh ®å hoµn thµnh<color>.","Sau khi ®¸nh b¹i tuÇn kh¶o Quèc Tö Gi¸m, b¹n vµ nhãm lÖnh ®å dïng ®éng t¸c <color=yellow>'B¸i'<color> ë cù li gÇn ®Ó xuÊt s­.","NÕu c¸c h¹ mua <color=yellow>Quèc Tö gi¸m hoa hång<color> cho lÖnh ®å, <color=green>bæng léc sÏ ®¹t 100% khi ®å ®Ö xuÊt s­<color>; <color=green>qua 15 ngµy sau<color>, <color=green>tiÕp tôc l·nh 100% bæng léc<color>; <color=green>15 ngµy tiÕp theo<color>, <color=green>vÉn cã thÓ nhËn 100% bæng léc<color>. <color=green>tæng céng lµ 300% bæng léc<color>. Xin chó ı nhËn bæng léc trong b¶ng th«ng tin s­ ®å.")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"Khi c¸c h¹ kh«ng hµi lßng víi ®å ®Ö cã thÓ<color=yellow>trôc xuÊt s­ m«n<color>, nhÊp <color=yellow>chuét ph¶i<color> lªn tªn cña ®å ®Ö muèn trôc xuÊt trong <color=yellow>b¶ng s­ ®å<color>, ®ã lµ c¸ch trôc xuÊt s­ m«n.","Lóc trôc xuÊt ®Ö tö ph¶i tiªu hao <color=yellow>99 tê s­ ®å<color>, ®ång thêi kh«ng ®­îc nhËn ®Ö tö trong vßng <color=yellow>24 tiÕng<color>. \n Trôc xuÊt ®Ö tö t¹m thêi kh«ng cã mÆt h¹n chÕ nµy. <color=yellow>§Ö tö chİnh thøc rêi m¹ng tõ 7 ngµy trë lªn còng kh«ng cã h¹n chÕ ®ã<color>.","NÕu ®Ó ®Ö tö nµy mua <color=yellow>Hoa Hång Quèc Tö Gi¸m<color>, sau khi bŞ trôc xuÊt<color=green>nh÷ng bæng léc liªn quan mµ ®Ö tö ®ã ch­a nhËn sÏ bŞ hñy bá<color>. \n §Ó ®Òn bï, <color=green>sau khi bŞ trôc xuÊt 15 ngµy, ®Ö tö nµy nhËn ®­îc 80% bæng léc<color>, <color=green>h¬n 15 ngµy<color>, <color=green>nhËn thªm 80% bæng léc<color>, <color=green>tæng céng 160% bæng léc<color>. Xin l­u ı chØ ®­îc nhËn trong giao diÖn th«ng tin s­ ®å.")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"§å ®Ö cã thÓ sÏ <color=yellow>ph¶n béi s­ m«n<color>, c¸c h¹ cÇn chó ı ®iÓm nµy, nªn suy nghÜ nhiÒu ®Õn c¶m nhËn cña ®å ®Ö.","NÕu ®Ó ®Ö tõ nµy mua<color=yellow>Hoa Hång Quèc Tö Gi¸m<color>, sau khi ph¶n béi s­ m«n, <color=green>nh÷ng bæng léc mµ ®Ö tö nµy ch­a nhËn sÏ bŞ hñy bá<color>. \n §Ó ®Òn bï, <color=green>15 ngµy sau khi ph¶n béi s­ m«n ®­îc nhËn 100% bæng léc<color>, <color=green>h¬n 15 ngµy<color>, <color=green>nhËn ®­îc 100% bæng léc<color>,<color=green>tæng céng 200% bæng léc<color>. ChØ ®­îc nhËn trong giao diÖn th«ng tin s­ ®å.")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("Néi dung liªn quan ®Õn ®å ®Ö, RÊt nhiÒu thao t¸c cña HÖ thèng S­ ®å ®Òu ph¶i më <color=yellow>B¶ng th«ng tin s­ ®å<color>, sau ®ã <color=yellow>nhÊp ph¶i vµo tªn mét ng­êi trong danh s¸ch<color> sÏ xuÊt hiÖn giao diÖn ®Ó thao t¸c.",
		5,
		"Lµm c¸ch nµo ®Ó b¸i s­/baishi",
		"NhiÖm vô S­ ®å sau khi b¸i s­ lµ g×/turenwu",
		"Sau khi b¸i s­ cã thÓ nhËn ®­îc phÇn th­ëng nµo/jiangli",
		"Lµm sao chÊm døt quan hÖ S­ ®å/tuchushi",
		"Kh«ng viÖc g×, chØ xem th«i./no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Xem l¹i hµnh trang cña b¹n: 1 <color=white>ThiÖp b¸i s­<color>. nhÊp chuét ph¶i ®Ó sö dông, cã thÓ göi tin tøc b¸i s­, c¸c cao thñ l©n cËn sÏ nhËn ®­îc. NÕu cã ng­êi muèn nhËn b¹n lµm ®Ö tö, chØ cÇn x¸c nhËn ®Ó trë thµnh <color=white>®Ö tö t¹m thêi<color>.","Sau khi thµnh ®Ö tö t¹m thêi, trong F3 giao diÖn sÏ cã nhiÒu <color=yellow>giao diÖn th«ng tin s­ ®å<color>. Xin chó ı!","Khi ®¼ng cÊp cña b¹n ®¹t <color=green>cÊp 10<color>, cã thÓ chuyÓn thµnh ®Ö tö chİnh thøc. Tæ ®éi víi s­ phô, sau ®ã l¶m ®éng t¸c <color=yellow>'b¸i'<color> ë kho¶ng c¸ch gÇn, sÏ trë thµnh <color=green>®Ö tö chİnh thøc<color>.","NÕu b¹n ®· ®¨ng kı lµm s­ phô, b¹n kh«ng ®­îc b¸i ng­êi kh¸c lµm s­ phô, ph¶i hñy bá ®¨ng kı tr­íc.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","B¸i s­ xong, mçi ngµy s­ phô c«ng bè 1 <color=yellow>NhiÖm vô S­ ®å<color>, tæng céng cã 7 nhiÖm vô ®Ó chän, b¹n cã thÓ th­¬ng l­îng víi s­ phô sÏ c«ng bè nhiÖm vô nµo. C«ng bè nhiÖm vô xong, b¹n cã thÓ nh×n thÊy nhiÖm vô ®­îc c«ng bè trong <color=yellow>B¶ng tin tøc s­ ®å<color>, sau ®ã chän <color=yellow>tiÕp nhËn nhiªm vô<color>.","Kú h¹n sau khi truyÒn lÖnh lµ <color=green>24 tiÕng<color>, ph¶i hoµn thµnh nhiÖm vô trong vßng 24 tiÕng, trong thêi h¹n ®ã kh«ng ®­îc giao nhiÖm vô kh¸c.","NhiÖm vô hoµn thµnh xong, b¹n sÏ nhËn ®­îc <color=yellow>PhÇn th­ëng nhiÖm vô<color>. PhÇn th­ëng kh¸c nhau tïy theo nhiÖm vô s­ ®å.","Chó ı: khi ®¹t ®­îc <color=green>cÊp 73<color>, phÇn th­ëng b¹n nhËn ®­îc sÏ gi¶m cßn mét nöa, khi ®¹t ®Õn <color=green>cÊp 80<color>, b¹n sÏ kh«ng cßn ®­îc nhËn th­ëng n÷a.")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","Lîi İch lín nhÊt lµ cã s­ phô, gióp b¹n rÊt nhiÒu trong ®êi sèng giang hå, c¸c s­ muéi, s­ ®Ö, s­ huynh, s­ tØ còng lµ b¹n ®ång hµnh trªn b­íc ®­êng hµnh tÈu giang hå cña b¹n.","Ngay khi trë thµnh <color=white>®Ö tö chİnh thøc<color>, b¹n sÏ nhËn ®­îc tói <color=white>'HËu Sinh Kh¶ óy'<color> ë <color=white>Quèc Tö gi¸m<color>, ®©y lµ quµ gÆp mÆt rÊt thùc dông cña s­ phô tÆng b¹n.","Khi b¹n ®¹t cÊp<color=green>45<color>, ®Õn <color=green>Quèc Tö gi¸m<color> nhËn tói <color=green>'TiÒn Tr×nh Tù CÈm'<color>.","Khi b¹n ®¹t cÊp<color=green>60<color>, ®Õn <color=green>Quèc Tö gi¸m<color> nhËn tói <color=green>'S­ ®å t×nh th©m'<color>.","Khi b¹n ®¹t cÊp <color=green>73<color>, cã thÓ xuÊt s­, s­ phô cã thÓ cïng b¹n hoµn thµnh <color=green>NhiÖm vô xuÊt s­<color>. Sau khi hoµn thµnh nhiÖm vô sÏ nhËn ®­îc tói <color=green>'S­ ¢n khã quªn'<color> lµ phÇn th­ëng khi xuÊt s­.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("Cã 3 c¸ch kÕt thóc quan hÖ s­ ®å, xuÊt s­, trôc xuÊt s­ m«n vµ ph¶n béi s­ m«n",
	4,
		"Lµm thÕ nµo ®Ó xuÊt s­/tuchushi1",
		"Lµm thÕ nµo ®Ó trôc xuÊt s­ m«n/tuchushi2",
		"Ph¶n béi s­ m«n lµ nh­ thÕ nµo/tuchushi3",
		"Kh«ng viÖc g×, chØ xem th«i./no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"Khi ®¹t cÊp<color=green>73<color>, b¹n ®Õn<color=green>Quèc Tö gi¸m<color> t×m s­ phô nhËn nhiÖm vô xuÊt s­. NhËn ®­îc <color=yellow>'XuÊt S­ Tiªu'<color>, tæ ®éi víi ®å ®Ö ra ngoµi thµnh, dïng XuÊt S­ Tiªu gäi ra <color=yellow>TuÇn kh¶o Quèc Tö gi¸m<color>, lµ ng­êi cña triÒu ®×nh ph¸i ®Õn ®Ó kiÓm tra xuÊt s­.","Sau khi gäi tuÇn kh¶o Quèc Tö gi¸m ra, ph¶i <color=yellow>®¸nh b¹i h¾n<color>. <color=green> Chiªu cuèi cïng ph¶i do b¹n hoµn thµnh<color>!","Sau khi ®¸nh b¹i tuÇn kh¶o Quèc Tö gi¸m, b¹n vµ s­ phô tæ ®éi, lµm ®éng t¸c <color=yellow>'B¸i'<color> s­ phô ®Ó xuÊt s­.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"S­ phô cã thÓ <color=yellow>trôc xuÊt ®å ®Ö<color> ra khái s­ m«n. \nNÕu bŞ trôc xuÊt s­ m«n, b¹n cã thÓ b¸i s­ kh¸c.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"NÕu b¹n bÊt m·n víi s­ phô, cã thÓ <color=yellow>Ph¶n béi s­ m«n<color>. Trong<color=yellow>Giao diÖn s­ ®å<color>, nhÊp <color=yellow>chuét ph¶i<color> ngay tªn s­ phô ®Ó chän Ph¶n béi s­ m«n.","Ph¶n béi s­ m«n ph¶i tiªu hao <color=yellow>99 S­ ®å phï chØ<color>, ®ång thêi trong <color=yellow>24 giê<color> sau khi ph¶n béi kh«ng ®­îc b¸i s­. \n NÕu b¹n lµ §å ®Ö t¹m thêi, kh«ng cã h¹n chÕ nµy. <color=yellow>S­ phô kh«ng lªn m¹ng tõ 7 ngµy trë lªn còng kh«ng bŞ h¹n chÕ nµy<color>.")
end



function baishitie()
	if BigGetItemCount(2,1,587) == 0 then
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then
			return
		else
			AddItem(2,1,587,1)
		end
	else
		Talk(1,"","C¸c h¹ ®· cã 1 thiÖp b¸i s­ råi , kh«ng cÇn l·nh n÷a.")	
		return
	end	
end
		