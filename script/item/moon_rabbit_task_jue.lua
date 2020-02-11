--½Å±¾Ãû³Æ£ºÊ¦ÃÅ¾÷Òª°üÊ¹ÓÃ½Å±¾
--½Å±¾¹¦ÄÜ£ºÍæ¼ÒÊ¹ÓÃ½Å±¾ºó£¬Ëæ»ú¸øÍæ¼ÒÔö¼ÓÈÎÒâÒ»¸öÃÅÅÉµÄÈÎÒâÁ½±¾¾÷Òª
--´úÂë±àĞ´ÈË£º´å³¤
--´úÂë±àĞ´Ê±¼ä£º2007-01-28
--ĞŞ¸Ä¼ÇÂ¼£ºĞ¡À¶´ò²¹¶¡
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--=================================¹«¹²±äÁ¿¶¨ÒåÇø============================
jue_list = {
		{{"ThiÕu L©m §ao quyÕt",2,6,1},
		{"ThiÕu L©m C«n quyÕt",2,6,2},
		{"Tr¶m Ma §ao quyÕt",2,6,3},
		{"Phong C«n quyÕt",2,6,4},
		{"Kim Chung Tr¸o quyÕt",2,6,5},
		{"Nhiªn Méc §ao quyÕt",2,6,6},
		{"V« Th­êng C«n quyÕt",2,6,7},
		{"X¶ Th©n QuyÕt",2,6,8},
		{"§¹i Nh­ Lai quyÕt",2,6,9},
		{"§¹t Ma Vò quyÕt",2,6,10},
		{"ThÊt B¶o ChiÕu quyÕt",2,6,11},
		{"La H¸n QuyÒn quyÕt",2,6,12},
		{"Ca DiÖp Thèi quyÕt",2,6,13},
		{"HuÖ Nh·n quyÕt",2,6,14},
		{"Vi §µ quyÕt",2,6,15},
		{"V¨n V©n quyÕt",2,6,16},
		{"La H¸n TrËn quyÕt",2,6,17},
		{"§¹i Tu Di Ch­ëng",2,6,18},
		{"V« ¶nh quyÕt",2,6,19},
		{"Long Tr¶o Thñ quyÕt",2,6,20},
		{"Phôc Hæ quyÕt",2,6,21},
		{"Tu T©m quyÕt",2,6,22},
		{"Ngò ChuyÓn ChØ quyÕt",2,6,23},
		{"Ph¸ Ma Chó quyÕt",2,6,24},
		{"Kim Cang yÕu quyÕt",2,6,25},
		{"La L«i quyÕt",2,6,26},
		{"Phôc Ma ThÇn quyÕt",2,6,27},
		{"V« T­íng quyÕt",2,6,28},
		{"S­ Tö Hèng",2,6,29},
		{"Minh Chó quyÕt",2,6,30},
		{"Kim Cang ChØ quyÕt",2,6,31}},
		{{"ChÕ ¸m yÕu quyÕt",2,6,32},
		{"T©m Nh·n quyÕt",2,6,33},
		{"§éc Thİch Cèt quyÕt",2,6,34},
		{"Gi¶i §éc Bİ quyÕt",2,6,35},
		{"C©u Hån TÜnh quyÕt",2,6,36},
		{"Ph¸ Quan quyÕt",2,6,37},
		{"Truy T©m TiÔn quyÕt",2,6,38},
		{"Thu Minh quyÕt",2,6,39},
		{"Xuyªn T©m quyÕt",2,6,40},
		{"Thèi §éc quyÕt",2,6,41},
		{"§o¹n Ph¸ch quyÕt",2,6,42},
		{"B¹o Ch©m quyÕt",2,6,43},
		{"Hµm Xa quyÕt",2,6,44},
		{"Táa MÖnh Ch©m quyÕt",2,6,45},
		{"M·n Thiªn Vò quyÕt",2,6,46}},
		{{"Quan ¢m QuyÕt",2,6,47},
		{"Nga My PhËt quyÕt",2,6,48},
		{"Ngäc N÷ KiÕm quyÕt",2,6,49},
		{"§é Nguyªn QuyÕt",2,6,50},
		{"PhËt Phæ quyÕt",2,6,51},
		{"Liªn Hoa quyÕt",2,6,52},
		{"Thanh Ph¹n quyÕt",2,6,53},
		{"L­u Thñy yÕu quyÕt",2,6,54},
		{"Phæ TÕ quyÕt",2,6,55},
		{"BÊt DiÖt quyÕt",2,6,56},
		{"PhËt ChiÕn quyÕt",2,6,57},
		{"PhËt ¢m quyÕt",2,6,58},
		{"§¹i Bi quyÕt",2,6,59},
		{"Tïy Khóc quyÕt",2,6,60},
		{"Khóc NghÖ quyÕt",2,6,61},
		{"NguyÖt Thùc Khóc quyÕt",2,6,62},
		{"§o¹n Thñy quyÕt",2,6,63},
		{"TÜnh D¹ T­ quyÕt",2,6,64},
		{"D­ NhiÔu quyÕt",2,6,65},
		{"D­¬ng Tam quyÕt",2,6,66},
		{"Phóc Thñy ph¸p",2,6,67},
		{"PhÉn CÇm quyÕt",2,6,68},
		{"¤ D¹ §Ò quyÕt",2,6,69},
		{"Mª T©m Khóc quyÕt",2,6,70}},
		{{"C¸i Bang Ch­ëng quyÕt",2,6,71},
		{"Th«ng Tı quyÕt",2,6,72},
		{"Thiªn C©n quyÕt",2,6,73},
		{"B¸ V­¬ng quyÕt",2,6,74},
		{"Táa HÇu Thñ quyÕt",2,6,75},
		{"Tiªu Dao Du quyÕt",2,6,76},
		{"Lôc Hîp yÕu quyÕt",2,6,77},
		{"Tóy §iÖp",2,6,78},
		{"Tóy QuyÒn",2,6,79},
		{"C¸i Bang C«n quyÕt",2,6,80},
		{"Khu Xµ quyÕt",2,6,81},
		{"KhÊt Th¶o quyÕt",2,6,82},
		{"Nª Thu quyÕt",2,6,83},
		{"DiÖu Thñ QuyÕt",2,6,84},
		{"Th©u ChuyÓn quyÕt",2,6,85},
		{"T¹ Gi¸p quyÕt",2,6,86},
		{"Th©u Ho¸n quyÕt",2,6,87},
		{"§¶ CÈu quyÕt",2,6,88}},
		{{"Vâ §ang KiÕm quyÕt",2,6,89},
		{"L­u Quang KiÕm quyÕt",2,6,90},
		{"VŞ ¦¬ng KiÕm quyÕt",2,6,91},
		{"Nhu V©n KiÕm quyÕt",2,6,92},
		{"LiÖt DiÖm KiÕm quyÕt",2,6,93},
		{"B«n Ph¸p quyÕt",2,6,94},
		{"V« Ng· Ph¸p quyÕt",2,6,95},
		{"Th¸i Thanh KiÕm quyÕt",2,6,96},
		{"TriÒn KiÕm quyÕt",2,6,97},
		{"L¹c KiÕm quyÕt",2,6,98},
		{"Tİch D­¬ng KiÕm quyÕt",2,6,99},
		{"HuyÒn KiÕm TrËn quyÕt",2,6,100},
		{"Ngù KiÕm quyÕt",2,6,101},
		{"Chİnh L­ìng kiÕm quyÕt",2,6,102},
		{"Th¸i Êt KiÕm quyÕt",2,6,103},
		{"ThËp Tam KiÕm quyÕt",2,6,104},
		{"HuyÒn ¢m KiÕm quyÕt",2,6,105},
		{"Thiªn ThuÇn kiÕm quyÕt",2,6,106},
		{"B¸t Qu¸i KiÕm quyÕt",2,6,107},
		{"ThÊt TiÖt KiÕm quyÕt",2,6,108},
		{"Bót Ph¸p quyÕt",2,6,109},
		{"Th¸i Tiªu C«ng quyÕt",2,6,110},
		{"Lôc Hãa C«ng quyÕt",2,6,111},
		{"ThÕ V©n Tung quyÕt",2,6,112},
		{"ThÊt Tinh TrËn",2,6,113},
		{"ThiÕu D­¬ng QuyÕt",2,6,114},
		{"ThiÕu ¢m QuyÕt",2,6,115},
		{"B¾c §Èu TrËn quyÕt",2,6,116},
		{"Tµn ¶nh QuyÕt",2,6,117},
		{"Cµn Kh«n QuyÕt",2,6,118},
		{"Th­îng Thanh C«ng quyÕt",2,6,119}},
		{{"Th­¬ng Ph¸p quyÕt",2,6,120},
		{"Ph¸ Phong Th­¬ng quyÕt",2,6,121},
		{"Ngù M· quyÕt",2,6,122},
		{"B«n Lang Th­¬ng quyÕt",2,6,123},
		{"ChiÕn §Şnh quyÕt",2,6,124},
		{"X¶o ChiÕn quyÕt",2,6,125},
		{"Thiªn Hoµnh Th­¬ng quyÕt",2,6,126},
		{"Anh Hïng quyÕt",2,6,127},
		{"§¶o H¶i Th­¬ng quyÕt",2,6,128},
		{"Ngù M· quyÕt",2,6,129},
		{"Bİch Th­¬ng quyÕt",2,6,130},
		{"Cung Ph¸p quyÕt",2,6,131},
		{"Liªn X¹ ThuËt quyÕt",2,6,132},
		{"TrËn LiÖu quyÕt",2,6,133},
		{"Håi Long TiÔn quyÕt",2,6,134},
		{"TriÒn V©n TiÔn quyÕt",2,6,135},
		{"Kú M«n §én quyÕt",2,6,136},
		{"Khİ TiÔn quyÕt",2,6,137},
		{"To¸i TiÔn quyÕt",2,6,138},
		{"HuyÔn ThÇn quyÕt",2,6,139},
		{"Tôc MÖnh quyÕt",2,6,140},
		{"L­u TuyÖt TiÔn quyÕt",2,6,141}},
		{{"Bİ kiÕp Ngò §éc §ao Ph¸p",2,6,142},
		{"Bİ kiÕp DÉn Hån Chó",2,6,143},
		{"Bİ kiÕp Thao Thi ThuËt",2,6,144},
		{"Bİ kiÕp Thi §éc ThuËt",2,6,145},
		{"Bİ kiÕp Thi Béc §¹i Ph¸p",2,6,146},
		{"Bİ kiÕp TËp Thi Tµ Khİ",2,6,147},
		{"Bİ kiÕp Ngù Thi ThuËt",2,6,148},
		{"Bİ kiÕp V¹n §éc §o¹t MÖnh §ao",2,6,149},
		{"Bİ kiÕp ¢m Tµ HÊp Hån Khİ",2,6,150},
		{"Bİ kiÕp Th«i Thi Tµ Khİ",2,6,151},
		{"Bİ kiÕp Tµ Linh §¹i Ph¸p",2,6,152},
		{"Bİ kiÕp Tµ §éc C«ng",2,6,153},
		{"Bİ kiÕp Thi LiÖt Ma C«ng",2,6,154},
		{"Bİ kiÕp H¹ Cæ MËt Ph­¬ng",2,6,155},
		{"Bİ kiÕp Phong Cæ",2,6,156},
		{"Bİ kiÕp D­ìng Cæ Bİ ThuËt",2,6,157},
		{"Bİ kiÕp Cuång Phong Tr¶o",2,6,158},
		{"Bİ kiÕp §éc Cæ",2,6,159},
		{"Bİ kiÕp HuyÕt §Ønh C«ng",2,6,160},
		{"Bİ kiÕp HuyÕt Cæ",2,6,161},
		{"Bİ kiÕp H­¬ng Cæ",2,6,162},
		{"Bİ kiÕp Thi Cæ",2,6,163},
		{"Bİ kiÕp Yªu Cæ",2,6,164},
		{"Bİ kiÕp T©m Cæ",2,6,165},
		{"Bİ kiÕp V¹n Cæ Thùc Thiªn",2,6,166},
		{"Bİ kiÕp HuyÔn Cæ",2,6,167},
		{"Bİ kiÕp Tµm Cæ",2,6,168}},
}
jue_id = {	{607,"Tói bİ kiÕp ThiÕu L©m"},
			{608,"Tói bİ kiÕp §­êng M«n"},
			{609,"Tói bİ kiÕp Nga My"},
			{610,"Tói bİ kiÕp C¸i Bang"},
			{611,"Tói bİ kiÕp Vâ §ang"},
			{612,"Tói bİ kiÕp D­¬ng M«n"},
			{613,"Tói bİ kiÕp Ngò §éc"}}
--==================================½Å±¾Ö÷Âß¼­Çø=============================
function OnUse(goods_index)
	local goods_id = GetItemParticular(goods_index)
	local goods_diff = 0
	for i =1, getn(jue_id) do
		if goods_id == jue_id[i][1] then
			goods_diff = i
			break
		end
	end
	Say("Muèn x¸c nhËn sö dông"..jue_id[goods_diff][2].." kh«ng? Cã thÓ thu ®­îc 5 quyÓn t­¬ng øng cña yÕu quyÕt.",2,
	"§æi/#goods_use_det("..goods_diff..")",
	"§Ó ta suy nghÜ l¹i/end_dialog"
	)
end
--***********************************ÎïÆ·Ê¹ÓÃÇø******************************
function goods_use_det(goods_diff)
	if Zgc_pub_goods_add_chk(5,50) ~= 1 then		--¿Õ¼ä/¸ºÖØÅĞ¶Ï
		Talk(1,"","Xin mêi x¸c nhËn hµnh trang kh«ng qu¸ t¶i hoÆc ®ñ chç trèng!")
		return
	end
	if GetItemCount(2,0,jue_id[goods_diff][1]) == 0 then
		Talk(1,"","Xin x¸c nhËn trong hµnh trang cã <color=red>"..jue_id[goods_diff][2].."<color>!")
		return
	end
	if DelItem(2,0,jue_id[goods_diff][1],1) ~= 1 then
		Talk(1,"","Xin x¸c nhËn trong hµnh trang cã <color=red>"..jue_id[goods_diff][2].."<color>!")
		return
	else
		for i = 1, 5 do
			local ran_num = random(1,getn(jue_list[goods_diff]))
			local add_flag = AddItem(jue_list[goods_diff][ran_num][2],jue_list[goods_diff][ran_num][3],jue_list[goods_diff][ran_num][4],1)
			if add_flag == 1 then
				Msg2Player("NhËn ®­îc 1 :\""..jue_list[goods_diff][ran_num][1].."\"")
			else
				WriteLog(GetName().."NhËn ®­îc phÇn th­ëng:"..jue_list[goods_diff][ran_num][1].."Thªm thÊt b¹i, kı hiÖu:"..add_flag)
			end
		end
	end	
end
