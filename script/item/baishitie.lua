-- °İÊ¦Ìû

function OnUse(idx)
	Say("ThiÖp B¸i S­ cã thÓ gióp b¹n b¸i s­ hoÆc thu nhËn ®Ö tö!",
	5,
	"Ph¸t tin b¸i s­/bai_shi", 
	"NhËn th­ tiÕn cö/thutiencu", 
--	"§Õn Quèc Tö gi¸m t×m hiÓu liªn quan s­ ®å./shou_tu",
	"ThuyÕt minh HÖ thèng S­ ®å/see_info2", 
	"§Ö tö cã thÓ lµm nhiÖm vô S­ ®å nµo?/renwuchaxun", 
	"Kh«ng lµm g× hÕt!/no_say"
	)
end

function bai_shi()
	local tInfo = GetMPBaseInfo()
	if tInfo["ismaster"] ~= 0 then
		Say("B¹n ®· trë thµnh s­ phô, kh«ng thÓ göi tin b¸i s­.", 0)
		return
	end
	if tInfo["master"] ~= "" then
		Say("B¹n cã s­ phô råi, kh«ng thÓ göi tin b¸i s­.", 0)
		return
	end
	
	local nTime = CustomDataRead("mp_p_want_take_on_a_master")
	local nNow = GetTime()
	if nTime == nil then
		CustomDataSave("mp_p_want_take_on_a_master", "d", nNow)
	else
		local nDiffTime = 600 - (nNow - nTime)
		if nDiffTime > 0 then		-- 10·ÖÖÓ²ÅÄÜÓÃÒ»´Î
			local nMin = floor(nDiffTime / 60)
			local nSec = mod(nDiffTime, 60)
			Say("B¹n cßn cÇn "..nMin.." Phót "..nSec.." gi©y míi cã thÓ göi tiÕp tin b¸i s­.", 0)
			return
		end
		CustomDataSave("mp_p_want_take_on_a_master", "d", nNow)
	end
	
	Want2TakeOnAMaster()
	Say("     B¹n ®· göi tin b¸i s­, c¸c cao thñ l©n cËn ®Òu nhËn ®­îc, nÕu cã ng­êi muèn thu ®å ®Ö, sÏ chñ ®éng liÖn hÖ víi b¹n. \n <color=yellow>NÕu thÊy cã ng­êi nãi chuyÖn víi b¹n, chØ cÇn Ên Ctrl+chuét ph¶i ngay c©u nãi ®ã ®Ó tr¶ lêi. <color>\n Tin b¸i s­ cã thÓ duy tr× trong 10 phót, c¸c s­ phô vâ häc cã thÓ thÊy ®­îc tin b¸i s­ cña b¹n trong 10 phót, trong thêi gian ®ã b¹n cã thÓ lµm vÖc kh¸c. <color=yellow>nÕu b¹n lµ t©n thñ, ®Ò nghŞ b¹n tíi D· Song gÇn n¬i b¹n xuÊt th©n ®Ó nhËn nhiÖm vô cña t©n thñ . <color>\n NÕu sau 10 phót vÉn ch­a cã ai nhËn b¹n lµm ®Ö tö, b¹n cã thÓ göi l¹i tin b¸i s­ lÇn n÷a.\n Hi väng b¹n cã thÓ t×m ®­îc s­ phô tµi ®øc.",1,"§ång ı/no_say")
end
function thutiencu()
AddItem(2,1,1200,3)
AddItem(2,1,15,10)
AddItem(2,1,199,1)
AddItem(2,1,30609,1)
AddItem(2,1,585,1)
end

function shou_tu()
	Say("NÕu b¹n muèn nhËn ®Ö tö, cã thÓ ®Õn <color=yellow>Quèc Tö gi¸m<color> ë BiÖn Kinh, cã viªn quan triÒu ®×nh phô tr¸ch vÒ viÖc liªn quan ®Õn s­ ®å. TruyÒn tin ®i ph¶i cÇn 10 b¹c ( cÊp 20 trë lªn miÔn phİ)!", 2, "§ång ı/yes_shou_tu", "Hñy bá/no_say")
end

function yes_shou_tu()
	if GetFightState() == 1 then
		Say("ChØ sö dông ®­îc trong thµnh", 0)
		return
	end
	if GetLevel() >= 20 then
		if GetCash() < 1000 then
			Say("B¹n kh«ng cã ®ñ 10 b¹c, kh«ng thÓ göi", 0)
			return
		end
		Pay(1000)
	end
	NewWorld(200,1458,2755)
end


function see_info2()
	local tInfo = GetMPBaseInfo()
	Say("B¹n muèn biÕt th«ng tin s­ phô hay ®Ö tö? Xin nh¾c nhë 1 chót, HÖ thèng S­ ®å cã rÊt nhiÒu thao t¸c, më <color=yellow>giao diÖn th«ng tin s­ ®å<color>, sau ®ã nhÊp chuét ph¶i vµo tªn ng­êi muèn thao t¸c ®Ó xuÊt hiÖn <color=yellow>giao diÖn thao t¸c<color>.",
		3,
		"Ta muèn xem néi dung vÒ s­ phô/shifu",
		"Ta muèn xem néi dung vÒ ®Ö tö/tudi",
		"Kh«ng viÖc g×, chØ xem th«i./no_say")
end

function shifu()
	local tInfo = GetMPBaseInfo()
	Say("Th«ng tin s­ phô nh­ sau, b¹n muèn biÕt néi dung nµo. HÖ Thèng S­ M«n cã rÊt nhiÒu chøc n¨ng, më <color=yellow>giao diÖn th«ng tin s­ ®å<color>, sau ®ã nhÊp chuét ph¶i vµo tªn ng­êi muèn thao t¸c ®Ó xuÊt hiÖn <color=yellow>giao diÖn thao t¸c<color>.",
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
	Talk(4,"shifu","NÕu b¹n muèn nhËn ®Ö tö, ph¶i ®Õn <color=yellow>Quèc Tö gi¸m <color> ®¨ng kı, sau ®ã cã thÓ më giao diÖn <color=yellow>'Th«ng Tin S­ §å'<color> ","§¨ng kı xong, nhÊn F3 sÏ xuÊt hiÖn <color=yellow>'Trang BŞ Thuéc Tİnh'<color> Trong giao diÖn sÏ cã thªm <color=yellow>'Th«ng Tin S­ §å<color>, cã thÓ xem ®­îc t×nh h×nh kÕ nghiÖp thÇy cña b¹n. NÕu chän môc d­íi gãc tr¸i <color=yellow>'Më ra nhËn ®Ö tö'<color>, cã thÓ thÊy ®­îc ng­êi nµo ë gÇn cÇn b¸i s­, ®Ó t×m ®Õn hä.","NÕu b¹n thÊy ®­îc ®¼ng cÊp ng­êi nµo thÊp h¬n m×nh, Ên <color=yellow> Ctrl+Chuét ph¶i<color> vµo ng­êi ®ã, chän <color=yellow>'Thu ®å ®Ö\'<color>. NÕu ng­êi ®ã ®ång ı, sÏ trë thµnh <color=green>®Ö tö t¹m thêi<color> cña b¹n.","Khi ®¼ng cÊp <color=green>®Ö tö t¹m thêi<color> ®¹t tíi <color=yellow>10<color>, sÏ trë thµnh ®Ö tö chİnh thøc. ChØ cÇn cù ly gi÷a b¹n vµ tæ ®Ö tö gÇn nhau, ®Ö tö <color=yellow>'B¸i'<color> 1 lÇn, sÏ thµnh <color=green>®Ö tö chİnh thøc<color>!")
end
	
function shirenwu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu","Khi ®· lµ s­ phô, mçi ngµy cã thÓ tíi <color=yellow> Quèc Tö gi¸m<color> ®Ó truyÒn <color=yellow>NhiÖm vô S­ ®å<color>, tæng céng cã 7 nhiÖm vô ®Ó chän. Sau khi truyÒn nhiÖm vô, lÖnh ®å cã thÓ nhËn nhiÖm vô <color=yellow>trong giao diÖn th«ng tin S­ §å<color>.","Kú h¹n sau khi truyÒn lÖnh lµ <color=yellow>24 tiÕng<color>, nghÜa lµ ph¶i hoµn thµnh xong nhiÖm vô trong vßng 24 tiÕng. §ång thêi chØ ®­îc truyÒn 1 nhiÖm vô trong vßng 24 tiÕng ®ã mµ th«i.","Khi ®· hoµn thµnh nhiÖm vô, lÖnh ®å nhËn ®­îc phÇn th­ëng nhiÖm vô, cßn b¹n lµ s­ phô, sÏ cã ®­îc <color=yellow>§iÓm S­ ®å<color>. NhiÖm vô mµ 1 ®Ö tö hoµn thµnh trong ngµy cã thÓ ®em cho s­ phô <color=green>10<color>§iÓm S­ ®å. <color=yellow>®Ö tö cµng nhiÒu, sè §iÓm S­ ®å cña b¹n cµng cao<color>.")
end
	
function shitudianshu()
	local tInfo = GetMPBaseInfo()
	Talk(5,"shifu",	"<color=yellow>§iÓm S­ ®å<color> lµ phÇn th­ëng mµ s­ phô nhËn ®­îc sau khi ®Ö tö hoµn thµnh NhiÖm vô S­ ®å. 1 ®Ö tö hoµn thµnh xong nhiÖm vô trong thêi gian qui ®Şnh sÏ tÆng cho s­ phô <color=green>10<color> §iÓm S­ ®å. T¸c dông cña §iÓm S­ ®å <color=yellow> chuyÓn thµnh phÇn th­ëng cña s­ phô<color> hoÆc <color=yellow>chuyÓn thµnh §iÓm S­ §øc<color>.","S­ phô cã thÓ ®Õn <color=yellow> Quèc Tö gi¸m <color> lÊy §iÓm S­ ®å chuyÓn thµnh phÇn th­ëng, <color=yellow>mçi ®iÓm chuyÓn thµnh 1 phÇn th­ëng<color>. ChuyÓn thµnh ®iÓm sè ph¶i tiªu hao <color=yellow>S­ ®å phï chØ<color> mçi lÇn chuyÓn 1 ®iÓm S­ ®å ph¶i tiªu hao 1 tê S­ §å. <color=green>nh­ng c¨n cø ®¼ng cÊp thô nghiÖp cao thÊp cña s­ phô mµ trùc tiÕp chuyÓn ®æi 1 bé phËn phÇn th­ëng<color>.","S­ phô còng cã thÓ lÊy §iÓm S­ ®å chuyÓn thµnh <color=yellow>§iÓm S­ ®øc<color>, còng ph¶i tiªu hao<color=yellow>S­ ®å phï chØ<color> mçi lÇn chuyÓn 1 ®iÓm S­ ®å ph¶i mÊt 1 tê s­ ®å. Xin l­u ı, <color=green>Lóc chuyÓn §iÓm S­ ®å cÇn cã S­ ®å phï chØ, kh«ng thÓ c¨n cø ®¼ng cÊp thô nghiÖp cña s­ phô mµ chuyÓn ®æi<color>.","Tõ khi tİnh NhiÖm vô S­ ®å cña s­ phô giao cho , <color=green>§iÓm S­ ®å sÏ b»ng 0 sau 24 tiÕng<color>. NghÜa lµ ®iÓm s­ ®å ®¹t ®­îc sau mçi nhiÖm vô sÏ kh«ng l­u l¹i trong nhiÖm vô lÇn sau.","§¼ng cÊp thô nghiÖp cµng cao, ®iÓm s­ ®å nhËn ®­îc cµng nhiÒu.")
end
	
function shidedianshu()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"§iÓm S­ §å lµ trŞ sè <color=yellow>Thô NghiÖp §¼ng CÊp<color> ®­îc x¸c ®Şnh, do §iÓm S­ ®å céng thªm S­ ®å phï chØ, ®­îc tiÕn hµnh chuyÓn ®æi t¹i <color=yellow>Quèc Tö gi¸m<color>.","§iÓm S­ ®å mçi ngµy sÏ gi¶m ®i <color=green>1%<color>.")
end
	
function shouyedengji()
	local tInfo = GetMPBaseInfo()
	Talk(2,"shifu",	"Thô NghiÖp §¼ng CÊp thÓ hiÖn ®¼ng cÊp cña b¹n khi lµ s­ phô, do sè sè l­îng §iÓm S­ ®øc quyÕt ®Şnh. <color=yellow>§iÓm S­ ®øc cµng nhiÒu , thô nghiÖp ®¼ng cÊp cµng cao, b¹n cã thÓ thu nhËn ®Ö tö cµng nhiÒu <color>. HiÖn t¹i cÊp cao nhÊt cña Thô NghiÖp §¼ng CÊp lµ 10, ®Ö tö thu nhËn cã thÓ lªn ®Õn 15 ng­êi.","D­íi ®©y lµ thuyÕt minh cña 10 Thô NghiÖp §¼ng CÊp c¬ b¶n: \n\nCÊp 1 §iÓm S­ ®øc <color=yellow>0<color> dÉn ®­îc <color=yellow>3<color> ®å ®Ö. CÊp 6 §iÓm S­ ®øc <color=yellow>1200<color> dÉn ®­îc <color=yellow>8<color> ®å ®Ö\nCÊp 2 §iÓm S­ ®øc <color=yellow>100<color> dÉn ®­îc <color=yellow>4<color> ®å ®Ö. CÊp 7 §iÓm S­ ®øc <color=yellow>1600<color> dÉn ®­îc <color=yellow>9<color> ®å ®Ö\n CÊp 3 §iÓm S­ ®øc <color=yellow>300<color> dÉn ®­îc <color=yellow>5<color> ®å ®Ö. CÊp 8 §iÓm S­ ®øc <color=yellow>2000<color> dÉn ®­îc <color=yellow>10<color> ®å ®Ö\nÊcp 4 §iÓm S­ ®øc <color=yellow>550<color> dÉn ®­îc <color=yellow>6<color> ®å ®Ö. CÊp 9 §iÓm S­ ®øc <color=yellow>2500<color> dÉn ®­îc <color=yellow>12<color> ®å ®Ö\nCÊp 5 §iÓm S­ ®øc <color=yellow>850<color> dÉn ®­îc <color=yellow>7<color> ®å ®Ö. CÊp 10 §iÓm S­ ®øc <color=yellow>3000<color> dÉn ®­îc <color=yellow>15<color> ®å ®Ö")
end
	
function huahong()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Hoa Hång Quèc Tö Gi¸m<color>lµ triÒu ®×nh x©y dùng ®Ó khen th­ëng cho vâ häc. B¹n cã thÓ kªu lÖnh ®å ®Õn <color=yellow> Quèc Tö gi¸m<color><color=yellow>mua Hoa Hång<color>, khi lÖnh ®å ngµy mét tr­ëng thµnh, b¹n cã thÓ nhËn ®­îc <color=yellow>bæng léc t­¬ng øng<color>. NÕu lÖnh ®å xuÊt s­ vµ ®¹t yªu cÇu, b¹n cã thÓ nhËn ®­îc h¬n gÊp <color=green>6 lÇn<color> bæng léc Hoa Hång.","Xin l­u ı, <color=yellow>tõ khi b¸i s­ trë thµnh ®Ö tö chİnh thøc, nh÷ng bæng léc tr­íc ®©y s­ phô kh«ng nhËn ®­îc<color>. NÕu nh­ ®Ö tö cÊp 65 chİnh thøc b¸i s­ trë thµnh ®Ö tö chİnh thøc, bæng léc tr­íc cÊp 65 nh­ cÊp 30, 40, 50 vµ 60, s­ phô sÏ kh«ng nhËn ®­îc.","<color=yellow>Mçi s­ phô chØ nhËn bæng béc mµ hiÖn t¹i ®Ö tö ch­a nhËn<color>. NÕu ®Ö tö nµo ®¹t ®iÒu kiÖn th× s­ phô tr­íc sÏ nhËn bæng léc, s­ phô sau kh«ng nhËn ®­îc. Sau khi 2 ng­êi ch¬i kÕt lµm s­ ®å t¹m thêi, s­ phô cã thÓ xem ®­îc s­ phô tr­íc cña ®Ö tö ®· nhËn ®­îc bæng léc nµo trªn giao diÖn s­ ®å b»ng c¸ch nhÊp chuét ph¶i môc 'Tra xem Hoa hång'")
end
	
function fenglu()
	local tInfo = GetMPBaseInfo()
	Talk(3,"shifu",	"<color=yellow>Bæng léc Quèc Tö gi¸m <color> lµ n¬i håi b¸o cña triÒu ®×nh vÒ viÖc b¹n mua Hoa Hång båi d­ìng ®Ö tö, mua nh÷ng vËt phÈm quİ hiÕm ë <color=yellow>Quèc Tö gi¸m<color>.","HiÖn t¹i ë <color=yellow>Quèc Tö gi¸m<color> cã b¸n rÊt nhiÒu vËt phÈm, bæng léc Quèc Tö gi¸m.","NhËn bæng léc Quèc Tö gi¸m kh«ng ®­îc ®Õn <color=yellow> Quèc Tö gi¸m <color>, trùc tiÕp lµm trªn <color=yellow>giao diÖn s­ ®å<color>. Trªn chuét ph¶i chØ tªn ®Ö tö, chän Hoa Hång trªn <color=yellow>giao diÖn Hoa Hång<color>. Cã thÓ tra xem t×nh h×nh tr­ëng thµnh cña ®Ö tö trªn giao diÖn Hoa Hång, cã thÓ <color=yellow>nhËn bæng léc<color> trong giao diÖn nµy.")
end

function shichushi()
	local tInfo = GetMPBaseInfo()
	Say("Cã 3 lo¹i chÊm døt quan hÖ thÇy trß: xuÊt s­, trôc xuÊt s­ m«n vµ ph¶n béi s­ m«n.",
		4,
		"Lµm thÕ nµo ®Ó xuÊt s­/shichushi1",
		"Lµm thÕ nµo ®Ó trôc xuÊt s­ m«n/shichushi2",
		"Ph¶n béi s­ m«n lµ nh­ thÕ nµo/shichushi3",
		"Kh«ng viÖc g×, chØ xem th«i./no_say"	
		)
end
	
function shichushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(4,"shichushi",	"Khi lÖnh ®å ®¹t ®Õn<color=green>73<color> cÊp, b¹n cã thÓ ®Õn <color=yellow>Quèc Tö gi¸m<color> nhËn nhiÖm vô xuÊt s­. NhËn ®­îc <color=yellow>'XuÊt S­ Tiªu'<color>, tæ ®éi víi ®å ®Ö ra ngoµi thµnh, dïng XuÊt S­ Tiªu gäi ra <color=yellow>TuÇn kh¶o Quèc Tö gi¸m<color>, lµ ng­êi cña triÒu ®×nh ph¸i ®Õn ®Ó kiÓm tra xuÊt s­.","Sau khi gäi tuÇn kh¶o Quèc Tö Gi¸m ra, ph¶i <color=yellow>®¸nh b¹i<color> h¾n. Xin l­u ı, <color=green> b­íc cuèi cïng ph¶i do lÖnh ®å hoµn thµnh<color>.","Sau khi ®¸nh b¹i tuÇn kh¶o Quèc Tö Gi¸m, b¹n vµ nhãm lÖnh ®å dïng ®éng t¸c <color=yellow>'B¸i'<color> ë cù li gÇn ®Ó xuÊt s­.","NÕu <color=yellow>Hoa Hång Quèc Tö Gi¸m<color> mµ ®Ö tö b¹n mua khi <color=green>xuÊt s­ ®­îc100% bæng léc<color>; <color=green>sau 15 ngµy<color>, <color=green>cã thÓ l¹i nhËn ®­îc 100% bæng léc<color>; <color=green>h¬n 15 ngµy<color>, <color=green>cßn nhËn thªm 100% bæng léc<color>, <color=green> tæng céng lµ 300% bæng léc<color>. Xin nhËn th­ëng trªn giao diÖn th«ng tin s­ ®å.")
end

function shichushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"shichushi",	"Khi ®Ö tö kh«ng ®¹t th× <color=yellow>Trôc xuÊt s­ m«n<color>. C¸ch trôc xuÊt s­ m«n: trong <color=yellow>giao diÖn s­ ®å<color>, chØ vµo <color=yellow>chuét ph¶i<color> tªn ®Ö tö muèn trôc xuÊt, råi trôc xuÊt tiÕp ®Ö tö kh¸c.","Lóc trôc xuÊt ®Ö tö ph¶i tiªu hao <color=yellow>99 tê s­ ®å<color>, ®ång thêi kh«ng ®­îc nhËn ®Ö tö trong vßng <color=yellow>24 tiÕng<color>. \n Trôc xuÊt ®Ö tö t¹m thêi kh«ng cã mÆt h¹n chÕ nµy. <color=yellow>§Ö tö chİnh thøc rêi m¹ng tõ 7 ngµy trë lªn còng kh«ng cã h¹n chÕ ®ã<color>.","NÕu ®Ó ®Ö tö nµy mua <color=yellow>Hoa Hång Quèc Tö Gi¸m<color>, sau khi bŞ trôc xuÊt<color=green>nh÷ng bæng léc liªn quan mµ ®Ö tö ®ã ch­a nhËn sÏ bŞ hñy bá<color>. \n §Ó ®Òn bï, <color=green>sau khi bŞ trôc xuÊt 15 ngµy, ®Ö tö nµy nhËn ®­îc 80% bæng léc<color>, <color=green>h¬n 15 ngµy<color>, <color=green>nhËn thªm 80% bæng léc<color>, <color=green>tæng céng 160% bæng léc<color>. Xin l­u ı chØ ®­îc nhËn trong giao diÖn th«ng tin s­ ®å.")
end

function shichushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"shichushi",	"§Ö tö cã thÓ sÏ <color=yellow>ph¶n béi s­ m«n<color>. Xin chó ı ®iÓm nµy, ph¶i nghÜ ®Õn c¶m nhËn cña ®Ö tö.","NÕu ®Ó ®Ö tõ nµy mua<color=yellow>Hoa Hång Quèc Tö Gi¸m<color>, sau khi ph¶n béi s­ m«n, <color=green>nh÷ng bæng léc mµ ®Ö tö nµy ch­a nhËn sÏ bŞ hñy bá<color>. \n §Ó ®Òn bï, <color=green>15 ngµy sau khi ph¶n béi s­ m«n ®­îc nhËn 100% bæng léc<color>, <color=green>h¬n 15 ngµy<color>, <color=green>nhËn ®­îc 100% bæng léc<color>,<color=green>tæng céng 200% bæng léc<color>. ChØ ®­îc nhËn trong giao diÖn th«ng tin s­ ®å.")
end


function tudi()
	local tInfo = GetMPBaseInfo()
	Say("Th«ng tin ®Ö tö nh­ sau, b¹n muèn biÕt vÒ phÇn nµo. Xin nh¾c nhë 1 chót, nhiÒu thao t¸c cña HÖ thèng S­ ®å, lµ nh÷ng <color=yellow>chuét ph¶i chØ tªn ng­êi xuÊt hiÖn trªn menu<color> sau khi <color=yellow>giao diÖn th«ng tin s­ ®å<color> ®­îc më ra.",
		5,
		"Lµm c¸ch nµo ®Ó b¸i s­/baishi",
		"NhiÖm vô S­ ®å sau khi b¸i s­ lµ g×/turenwu",
		"Sau khi b¸i s­ cã thÓ nhËn ®­îc phÇn th­ëng nµo/jiangli",
		"Lµm sao chÊm døt quan hÖ S­ ®å/tuchushi",
		"Kh«ng viÖc g×, chØ xem th«i./no_say")
end

function baishi()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","KiÓm tra l¹i hµnh trang cña b¹n, bªn trong cã 1 tÊm <color=yellow>thiÖp b¸i s­<color>. nhÊp chuét ph¶i ®Ó sö dông thiÖp b¸i s­, míi göi ®­îc thiÖp b¸i s­, c¸c s­ phô l©n c©n ®Òu nhËn ®­îc. <color=green>NÕu chän ra ng­êi muèn nhËn b¹n lµm ®Ö tö<color>, chØ cÇn x¸c nhËn chän lµ trë thµnh <color=green>®Ö tö t¹m thêi<color>. ","Sau khi thµnh ®Ö tö t¹m thêi, trong F3 giao diÖn sÏ cã nhiÒu <color=yellow>giao diÖn th«ng tin s­ ®å<color>. Xin chó ı!","Lóc b¹n ®¹t ®­îc <color=green> cÊp 10<color>, sÏ thµnh ®Ö tö chİnh thøc. Cô thÓ: hîp thµnh ®éi víi s­ phô, sau ®ã dïng ®éng t¸c <color=yellow>'B¸i'<color> ë cù li gÇn lµ trë thµnh <color=green>®Ö tö chİnh thøc<color>.","NÕu b¹n ®· ®¨ng kı lµm s­ phô th× kh«ng thÓ b¸i s­ ®­îc n÷a.")
end
	
function turenwu()
	local tInfo = GetMPBaseInfo()
	Talk(4,"tudi","Sau khi b¸i s­, s­ phô ®Òu truyÒn <color=yellow>NhiÖm vô S­ ®å<color> mçi ngµy, tæng céng cã 7 nhiÖm vô ®Ó chän. B¹n cã thÓ trao ®æi víi s­ phô vÒ chän nhiÖm vô lµm. Sau khi truyÒn lÖnh, b¹n cã thÓ thÊy ®­îc c¸c nhiÖm vô trong<color=yellow>giao diÖn th«ng tin s­ ®å<color>, sau ®ã chän <color=yellow>nhiÖm vô<color>.","Kú h¹n sau khi truyÒn lÖnh lµ <color=green>24 tiÕng<color>, ph¶i hoµn thµnh nhiÖm vô trong vßng 24 tiÕng, trong thêi h¹n ®ã kh«ng ®­îc giao nhiÖm vô kh¸c.","Sau khi hoµn thµnh nhiÖm vô, b¹n sÏ nhËn ®­îc <color=yellow>khen th­ëng nhiÖm vô<color>. NhiÖm vô kh«ng gièng nhau, phÇn th­ëng còng kh«ng gièng nhau.","Chó ı: khi ®¹t ®­îc <color=green>cÊp 73<color>, phÇn th­ëng b¹n nhËn ®­îc sÏ gi¶m cßn mét nöa, khi ®¹t ®Õn <color=green>cÊp 80<color>, b¹n sÏ kh«ng cßn ®­îc nhËn th­ëng n÷a.")
end
	
function jiangli()
	local tInfo = GetMPBaseInfo()
	Talk(5,"tudi","Lîi İch lín nhÊt cña b¹n lµ cã ®­îc s­ phô, s­ phô sÏ gióp İch rÊt nhiÒu trong cuéc ®êi giang hå cña b¹n, s­ ®Ö, s­ huynh, s­ muéi, s­ tØ ®Òu lµ nh÷ng ng­êi b¹n ®ång hµnh trªn giang hå cña b¹n.","Cô thÓ: ngay khi b¹n trë thµnh <color=green>®Ö tö chİnh tøc<color>, b¹n cã thÓ tíi <color=yellow>Quèc Tö gi¸m <color> nhËn bao <color=green>'HËu Sinh Kh¶ óy'<color>, ®©y lµ quµ gÆp mÆt cña s­ phô ®èi víi b¹n, trang bŞ bªn trong ®Òu lµ nh÷ng mãn thùc dông ®èi víi t©n thñ lµ b¹n.","Khi ®¹t <color=green>cÊp 45<color>, cã thÓ tíi <color=yellow>Quèc Tö gi¸m<color> nhËn bao <color=green>'TiÒn Tr×nh Tù CÈm'<color>.","Khi ®¹t <color=green>cÊp 60<color>, ®Õn <color=yellow>Quèc Tö gi¸m<color> nhËn bao <color=green>'S­ §å T×nh Th©m'<color>.","Khi ®¹t <color=green>cÊp 73<color> cã thÓ xuÊt s­, b¹n cã thÓ cïng s­ phô hoµn thµnh <color=yellow>nhiÖm vô xuÊt s­<color>. Sau khi xong nhiÖm vô ®­îc nhËn bao <color=green>'S­ ¢n khã quªn'<color>, ®©y lµ phÇn th­ëng cña s­ phô ®èi víi sù tr­ëng thµnh cña b¹n.")
end


function tuchushi()
	local tInfo = GetMPBaseInfo()
	Say("Cã 3 lo¹i chÊm døt quan hÖ thÇy trß: xuÊt s­, trôc xuÊt s­ m«n vµ ph¶n béi s­ m«n.",
	4,
		"Lµm thÕ nµo ®Ó xuÊt s­/tuchushi1",
		"Lµm thÕ nµo ®Ó trôc xuÊt s­ m«n/tuchushi2",
		"Ph¶n béi s­ m«n lµ nh­ thÕ nµo/tuchushi3",
		"Kh«ng viÖc g×, chØ xem th«i./no_say"	
		)
end
	
function tuchushi1()
	local tInfo = GetMPBaseInfo()	
	Talk(3,"tuchushi",	"Khi ®¹t <color=green>cÊp 73<color>, ®Õn <color=yellow>Quèc Tö gi¸m<color> t×m s­ phô ®Ó nhËn nhiÖm vô xuÊt s­. NhËn ®­îc <color=yellow>'XuÊt S­ Tiªu'<color>, tæ ®éi víi ®å ®Ö ra ngoµi thµnh, dïng XuÊt S­ Tiªu gäi ra <color=yellow>TuÇn kh¶o Quèc Tö gi¸m<color>, lµ ng­êi cña triÒu ®×nh ph¸i ®Õn ®Ó kiÓm tra xuÊt s­.","Sau khi gäi tuÇn kh¶o Quèc Tö gi¸m ra, ph¶i <color=yellow>®¸nh b¹i<color> h¾n. Chó ı<color=green>b­íc cuèi cïng ph¶i chİnh b¹n hoµn thµnh<color>.","Sau khi ®¸nh b¹i tuÇn kh¶o Quèc Tö gi¸m, b¹n vµ s­ phô tæ ®éi, lµm ®éng t¸c <color=yellow>'B¸i'<color> s­ phô ®Ó xuÊt s­.")
end

function tuchushi2()
	local tInfo = GetMPBaseInfo()	
	Talk(1,"tuchushi",	"S­ phô cã thÓ<color=yellow>trôc xuÊt s­ m«n<color> ®Ö tö, ph¶i chó ı ®Òu nµy. \n NÕu bŞ trôc xuÊt s­ m«n, b¹n ph¶i b¸i ng­êi kh¸c lµm s­ phô.")
end

function tuchushi3()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"tuchushi",	"NÕu b¹n bÊt m·n víi s­ phô, cã thÓ<color=yellow>ph¶n béi s­ m«n<color>. C¸ch lµm: trong <color=yellow>giao diÖn s­ ®å<color>, nhÊp <color=yellow>chuét ph¶i<color> vµo tªn s­ phô ®Ó chän ph¶n béi s­ m«n.","Ph¶n béi s­ m«n ph¶i tiªu hao<color=yellow>99 s­ ®å phï chØ<color>, ®ång thêi sau khi ph¶n béi s­ m«n trong vßng <color=yellow>24 tiÕng<color> kh«ng thÓ b¸i s­. \n NÕu b¹n lµ ®Ö tö t¹m thêi, kh«ng cã h¹n chÕ nµy. <color=yellow>s­ phô rêi m¹ng tõ 7 gnay2 trë lªn còng kh«ng cã h¹n chÕ nh­ vËy<color>.")
end



function no_say()
end


	
function renwuchaxun()
	local tInfo = GetMPBaseInfo()	
	Talk(2,"no_say","    Khi trë thµnh ®Ö tö chİnh thøc cña ng­êi kh¸c, mçi ngµy ®Òu hoµn thµnh 1 NhiÖm vô S­ ®å do s­ phô truyÒn <color=yellow> khi sau khi hoµn thµnh nhiÖm vô, sÏ nhËn th­ëng tïy theo nhiÖm vô, s­ phô ®­îc §iÓm S­ ®å. <color>\n Mét khi ®Ö tö ®¹t cÊp 73, phÇn th­ëng gi¶m ®i mét nöa; cÊp 80 sÏ kh«ng cã th­ëng. \n NhiÖm vô S­ ®å tæng céng cã 7 lo¹i, mçi ngµy chän 1 trong ®ã ®Ó giao nhiÖm vô<color=yellow>sau khi b¸i s­ dùa theo yªu cÇu vµ trao ®æi cña b¹n víi s­ phô ®Ó chän nhiÖm vô<color>.","Giíi thÖu NhiÖm vô S­ ®å: \n1 Hoµn thµnh 2 lÇn nhiÖm vô S¬ cÊp s­ m«n hoÆc 20 th­¬ng héi, møc ®é ®ãng gãp s­ m«n 15 ®iÓm, <color=white>Danh väng 50 ®iÓm<color>\n2 Hoµn thµnh 5 lÇn nhiÖm vô s¸t thñ hoÆc 20 lÇn th­¬ng héi, danh väng: 50 ®iÓm\n3 1 lÇn ®¸nh trËn hoÆc hoµn thµnh 20 lÇn th­¬ng héi, ghi c«ng 150 ®Óm <color=white>kinh nghiÖm (®¼ng cÊp* ®¼ng cÊp*110)<color>\n4 Tµng kiÕm 2 lÇn hoÆc 20 lÇn th­¬ng héi, kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*110)\n5 Th¸i H­ qu¸ 4 phª qu¸i hoÆc hoµn thµnh 20 lÇn th­¬ng héi, kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*120)\n6 ch¹y xong 4 lÇn thuyÒn rång hoÆc 20 lÇn th­¬ng héi, kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*110)\n7 §¸nh vâ ®µi 1 m×nh: 5 lÇn hoÆc 20 lÇn th­¬ng héi, kinh nghiÖm (®¼ng cÊp*®¼ng cÊp*100)\n<color=white>Ch÷ mµu tr¾ng lµ th­ëng cho ®Ö tö kh«ng thuéc m«n ph¸i nµo, phÇn th­ëng cña mçi nhiÖm vô kh«ng gièng nhau<color>.")
end

