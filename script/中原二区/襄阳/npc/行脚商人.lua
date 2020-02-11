-- ÊÀ½çÊÕ¼¯ÈÎÎñµÄ½Å±¾Í·ÎÄ¼ş
Include("\\script\\task\\collection\\task_head.lua")
Include("\\script\\lib\\globalfunctions.lua");

FILE_NAME = "\\script\\ÖĞÔ­¶şÇø\\ÏåÑô\\npc\\ĞĞ½ÅÉÌÈË.lua"

Zgc_com_jue_table = {}						--¾÷Òªtable
Zgc_adv_jue_talbe = {}						--¸ß¼¶¾÷Òªtable
Zgc_com_jue_num = 0
Zgc_adv_jue_num = 0
Zgc_change_date_id = 951					--¶Ò»»ÈÕÆÚ
Zgc_change_date_num_id = 952				--¶Ò»»ÊıÁ¿
Zgc_adv_jue_remain_day_id = 953				--ÉÏ´Î¶Ò»»¸ß¼¶¾÷ÒªµÄÊ±¼ä
Zgc_adv_jue_remain_times_id = 954			--ÉÏ´Î¶Ò»»¸ß¼¶¾÷Òªµ½ÏÖÔÚµÄ´ÎÊı
Zgc_com_jue_table = {
	{1,"ThiÕu L©m §ao quyÕt"},
	{2,"ThiÕu L©m C«n quyÕt"},
	{3,"Tr¶m Ma §ao quyÕt"},
	{4,"Phong C«n quyÕt"},
	{6,"Nhiªn Méc §ao quyÕt"},
	{7,"V« Th­êng C«n quyÕt"},
	{8,"X¶ Th©n QuyÕt"},
	{9,"§¹i Nh­ Lai quyÕt"},
	{11,"ThÊt B¶o ChiÕu quyÕt"},
	{12,"La H¸n QuyÒn quyÕt"},
	{13,"Ca DiÖp Thèi quyÕt"},
	{15,"Vi §µ quyÕt"},
	{16,"V¨n V©n quyÕt"},
	{17,"La H¸n TrËn quyÕt"},
	{18,"§¹i Tu Di Ch­ëng"},
	{19,"V« ¶nh quyÕt"},
	{21,"Phôc Hæ quyÕt"},
	{22,"Tu T©m quyÕt"},
	{23,"Ngò ChuyÓn ChØ quyÕt"},
	{24,"Ph¸ Ma Chó quyÕt"},
	{25,"Kim Cang yÕu quyÕt"},
	{26,"La L«i quyÕt"},
	{27,"Phôc Ma ThÇn quyÕt"},
	{28,"V« T­íng quyÕt"},
	{30,"Minh Chó quyÕt"},
	{32,"ChÕ ¸m yÕu quyÕt"},
	{33,"T©m Nh·n quyÕt"},
	{34,"§éc Thİch Cèt quyÕt"},
	{35,"Gi¶i §éc Bİ quyÕt"},
	{36,"C©u Hån TÜnh quyÕt"},
	{37,"Ph¸ Quan quyÕt"},
	{38,"Truy T©m TiÔn quyÕt"},
	{39,"Thu Minh quyÕt"},
	{40,"Xuyªn T©m quyÕt"},
	{41,"Thèi §éc quyÕt"},
	{42,"§o¹n Ph¸ch quyÕt"},
	{43,"B¹o Ch©m quyÕt"},
	{44,"Hµm Xa quyÕt"},
	{45,"Táa MÖnh Ch©m quyÕt"},
	{47,"Quan ¢m QuyÕt"},
	{48,"Nga My PhËt quyÕt"},
	{49,"Ngäc N÷ KiÕm quyÕt"},
	{50,"§é Nguyªn QuyÕt"},
	{51,"PhËt Phæ quyÕt"},
	{52,"Liªn Hoa quyÕt"},
	{54,"L­u Thñy yÕu quyÕt"},
	{55,"Phæ TÕ quyÕt"},
	{56,"BÊt DiÖt quyÕt"},
	{57,"PhËt ChiÕn quyÕt"},
	{58,"PhËt ¢m quyÕt"},
	{60,"Tïy Khóc quyÕt"},
	{61,"Khóc NghÖ quyÕt"},
	{62,"NguyÖt Thùc Khóc quyÕt"},
	{63,"§o¹n Thñy quyÕt"},
	{64,"TÜnh D¹ T­ quyÕt"},
	{65,"D­ NhiÔu quyÕt"},
	{66,"D­¬ng Tam quyÕt"},
	{68,"PhÉn CÇm quyÕt"},
	{69,"¤ D¹ §Ò quyÕt"},
	{71,"C¸i Bang Ch­ëng quyÕt"},
	{72,"Th«ng Tı quyÕt"},
	{73,"Thiªn C©n quyÕt"},
	{74,"B¸ V­¬ng quyÕt"},
	{75,"Táa HÇu Thñ quyÕt"},
	{76,"Tiªu Dao Du quyÕt"},
	{77,"Lôc Hîp yÕu quyÕt"},
	{80,"C¸i Bang C«n quyÕt"},
	{81,"Khu Xµ quyÕt"},
	{82,"KhÊt Th¶o quyÕt"},
	{84,"DiÖu Thñ QuyÕt"},
	{85,"Th©u ChuyÓn quyÕt"},
	{86,"T¹ Gi¸p quyÕt"},
	{87,"Th©u Ho¸n quyÕt"},
	{89,"Vâ §ang KiÕm quyÕt"},
	{90,"L­u Quang KiÕm quyÕt"},
	{91,"VŞ ¦¬ng KiÕm quyÕt"},
	{92,"Nhu V©n KiÕm quyÕt"},
	{93,"LiÖt DiÖm KiÕm quyÕt"},
	{94,"B«n KiÕm quyÕt"},
	{95,"V« Ng· Ph¸p quyÕt"},
	{96,"Th¸i Thanh KiÕm quyÕt"},
	{97,"TriÒn KiÕm quyÕt"},
	{98,"L¹c KiÕm quyÕt"},
	{100,"HuyÒn KiÕm TrËn quyÕt"},
	{101,"Ngù KiÕm quyÕt"},
	{102,"Chİnh L­ìng kiÕm quyÕt"},
	{103,"Th¸i Êt KiÕm quyÕt"},
	{104,"ThËp Tam KiÕm quyÕt"},
	{105,"HuyÒn ¢m KiÕm quyÕt"},
	{106,"Thiªn ThuÇn kiÕm quyÕt"},
	{107,"B¸t Qu¸i KiÕm quyÕt"},
	{109,"Bót Ph¸p quyÕt"},
	{110,"Th¸i Tiªu C«ng quyÕt"},
	{111,"Lôc Hãa C«ng quyÕt"},
	{112,"ThÕ V©n Tung quyÕt"},
	{113,"ThÊt Tinh TrËn"},
	{115,"ThiÕu ¢m QuyÕt"},
	{116,"B¾c §Èu TrËn quyÕt"},
	{117,"Tµn ¶nh QuyÕt"},
	{118,"Cµn Kh«n QuyÕt"},
	{120,"Th­¬ng Ph¸p quyÕt"},
	{121,"Ph¸ Phong Th­¬ng quyÕt"},
	{122,"Ngù M· quyÕt"},
	{123,"B«n Lang Th­¬ng quyÕt"},
	{124,"ChiÕn §Şnh quyÕt"},
	{125,"X¶o ChiÕn quyÕt"},
	{126,"Thiªn Hoµnh Th­¬ng quyÕt"},
	{127,"Anh Hïng quyÕt"},
	{128,"§¶o H¶i Th­¬ng quyÕt"},
	{131,"Cung Ph¸p quyÕt"},
	{132,"Liªn X¹ ThuËt quyÕt"},
	{133,"TrËn LiÖu quyÕt"},
	{134,"Håi Long TiÔn quyÕt"},
	{135,"TriÒn V©n TiÔn quyÕt"},
	{136,"Kú M«n §én quyÕt"},
	{137,"Khİ TiÔn quyÕt"},
	{139,"HuyÔn ThÇn quyÕt"},
	{140,"Tôc MÖnh quyÕt"},
	{142,"Bİ kiÕp Ngò §éc §ao Ph¸p"},
	{143,"Bİ kiÕp DÉn Hån Chó"},
	{144,"Bİ kiÕp Thao Thi ThuËt"},
	{145,"Bİ kiÕp Thi §éc ThuËt"},
	{146,"Bİ kiÕp Thi Béc §¹i Ph¸p"},
	{147,"Bİ kiÕp TËp Thi Tµ Khİ"},
	{148,"Bİ kiÕp Ngù Thi ThuËt"},
	{149,"Bİ kiÕp V¹n §éc §o¹t MÖnh §ao"},
	{150,"Bİ kiÕp ¢m Tµ HÊp Hån Khİ"},
	{152,"Bİ kiÕp Tµ Linh §¹i Ph¸p"},
	{153,"Bİ kiÕp Tµ §éc C«ng"},
	{155,"Bİ kiÕp H¹ Cæ MËt Ph­¬ng"},
	{156,"Bİ kiÕp Phong Cæ"},
	{157,"Bİ kiÕp D­ìng Cæ Bİ ThuËt"},
	{158,"Bİ kiÕp Cuång Phong Tr¶o"},
	{159,"Bİ kiÕp §éc Cæ"},
	{160,"Bİ kiÕp HuyÕt §Ønh C«ng"},
	{161,"Bİ kiÕp HuyÕt Cæ"},
	{162,"Bİ kiÕp H­¬ng Cæ"},
	{163,"Bİ kiÕp Thi Cæ"},
	{164,"Bİ kiÕp Yªu Cæ"},
	{165,"Bİ kiÕp T©m Cæ"},
	{166,"Bİ kiÕp V¹n Cæ Thùc Thiªn"},			
}
Zgc_adv_jue_talbe = {
	{5,"Kim Chung Tr¸o quyÕt"},
	{10,"§¹t Ma Vò quyÕt"},
	{14,"HuÖ Nh·n quyÕt"},
	{20,"Long Tr¶o Thñ quyÕt"},
	{29,"S­ Tö Hèng"},
	{31,"Kim Cang ChØ quyÕt"},
	{46,"M·n Thiªn Vò quyÕt"},
	{53,"Thanh Ph¹n quyÕt"},
	{59,"§¹i Bi quyÕt"},
	{67,"Phóc Thñy ph¸p"},
	{70,"Mª T©m Khóc quyÕt"},
	{78,"Tóy §iÖp"},
	{79,"Tóy QuyÒn"},
	{83,"Nª Thu quyÕt"},
	{88,"§¶ CÈu quyÕt"},
	{99,"Tİch D­¬ng KiÕm quyÕt"},
	{108,"ThÊt TiÖt KiÕm quyÕt"},
	{114,"ThiÕu D­¬ng QuyÕt"},
	{119,"Th­îng Thanh C«ng quyÕt"},
	{129,"Ngù M· quyÕt"},
	{130,"Bİch Th­¬ng quyÕt"},
	{138,"To¸i TiÔn quyÕt"},
	{141,"L­u TuyÖt TiÔn quyÕt"},
	{151,"Bİ kiÕp Th«i Thi Tµ Khİ"},
	{154,"Bİ kiÕp Thi LiÖt Ma C«ng"},
	{168,"Bİ kiÕp Tµm Cæ"},
	{167,"Bİ kiÕp HuyÔn Cæ"}
}
Zgc_master_com_id = {
	205,206,207,208,209,350,390
}
--------------------------------------------Ö÷º¯Êı------------------------------------------
function main()
	local nMap, nX, nY = GetWorldPos()
	local strName = GetTargetNpcName()
	local time_h = tonumber(date("%H"))			--»ñµÃµ±Ç°Ğ¡Ê±Êı£¨24Ğ¡Ê±ÖÆ£©
	
	if checkCollectNpc(nMap, strName) ==1 then
		if time_h >= 18 then
		Say("§õng hái ta sao cø b«n ba kh¾p n¬i! Tuy ta kh«ng ph¶i lµ ng­êi xuÊt gia nh­ng lóc nµo còng tiªu diªu tù t¹i, kÎ phµm phu tôc tö sao cã thÓ hiÓu ®­îc?",
			3,
			"Ta ®Õn nhËn nhiÖm vô thu thËp/#createCollectTalk(\"Hµnh C­íc Th­¬ng Nh©n\")",
			"Ta ®Õn ®æi Bİ kiÕp/Dialog_main",
			"Rêi khái/Zgc_dialog_end"
		)
		elseif checkCollectNpc(nMap, strName) ==1 then
			createCollectTalk(strName)
		end
		return
	end
	if time_h >=18 then							--²»Í¬µÄÊ±¼ä¶Ô»°²»Í¬
		Dialog_main()
	else
		Talk(2,"","§õng hái ta sao cø b«n ba kh¾p n¬i! Tuy ta kh«ng ph¶i lµ ng­êi xuÊt gia nh­ng lóc nµo còng tiªu diªu tù t¹i, kÎ phµm phu tôc tö sao cã thÓ hiÓu ®­îc?","X­a cã c©u: §i mét ngµy ®µng häc mét sµng kh«n.")
	end	
end
--*********************************Ö÷¶Ô»°º¯Êı************************
function Dialog_main()
	Say("GÇn ®©y vâ l©m loan tin bİ kiÕp tuyÖt häc cña c¸c m«n ph¸i ®ét nhiªn biÕn mÊt mét c¸ch kú l¹, nghe nãi Minh Chñ Kim S¬n sî r¬i vµo tay kÎ xÊu, hËu qu¶ kh«n l­êng do ®ã ®Ó ®æi bİ kiÕp ph¶i cã LÖnh bµi s­ m«n, l·o phu ®­îc giao träng tr¸ch gióp ®ì c¸c hiÖp kh¸ch, xin hái b»ng h÷u t×m l·o phu cã chuyÖn g×?",
		4,
		"§æi lÖnh bµi s­ m«n lÊy Bİ KiÕp/Zgc_jue_change_main",		
		"H«m nay cßn bao nhiªu lÇn ®æi/Zgc_jue_change_time_inq",
		--"ÎÒÒª¿´¿´ÄÄĞ©ÊÇÏ¡ÊÀ¾÷Òª/Zgc_jue_change_com_jue_inq",
		"T×m hiÓu quy t¾c ®æi/Zgc_jue_change_rule_inq",
		"KÕt thóc/Zgc_dialog_end"
	)
end
------------------------------------------¶Ò»»¶Ô»°----------------------------------------
function Zgc_jue_change_main()
	Say("Xin h·y chän sè l­îng bİ kiÕp ng­¬i muèn ®æi.",
		5,
		"Ng­¬i muèn ®æi 5 bİ kiÕp bÊt kú lÊy 1 bİ kiÕp tù chän hÖ ph¸i (cÇn 35 tiÒn Vµng vµ 5 bİ kiÕp)/exchange_yue",
		"Ng­¬i muèn ®æi lÖnh bµi s­ m«n lÊy 1 bİ kiÕp (cÇn 2 tiÒn Vµng vµ 2 lÖnh bµi s­ m«n)/#Zgc_jue_chg_cond_chk(1)",
		"Ng­¬i muèn ®æi lÖnh bµi s­ m«n lÊy 5 bİ kiÕp (cÇn 10 tiÒn Vµng vµ 10 lÖnh bµi s­ m«n)/#Zgc_jue_chg_cond_chk(5)",
		"Ng­¬i muèn ®æi lÖnh bµi s­ m«n lÊy 10 bİ kiÕp (cÇn 20 tiÒn Vµng vµ 20 lÖnh bµi s­ m«n)/#Zgc_jue_chg_cond_chk(10)",
		"KÕt thóc/Zgc_dialog_end"		
	)
end

----------------------------------------¶Ò»»Ö÷º¯Êı--------------------------------------
function Zgc_jue_chg_cond_chk(change_num)
	local Actor_function = GetPlayerFaction()
	local time_date_today = floor((GetTime()-57600)/86400)
	if Actor_function == 0 or GetLevel() < 11 then						--ÅĞ¶ÏÊÇ·ñ¼ÓÈëÃÅÅÉ£¨Î´ÅĞ¶ÏµÈ¼¶£¬ÒòÎª¼ÓÈëÃÅÅÉµÈ¼¶¾Í¿Ï¶¨´ïµ½ÒªÇó£©
		Say ("Ng­¬i ph¶i ®¹t ®Õn cÊp 11 vµ gia nhËp mét m«n ph¸i míi ®ñ ®iÒu kiÖn trao ®æi.",
			1,
			"Ta biÕt råi!/Zgc_dialog_end"
		)
	elseif GetItemCount(2,0,Zgc_master_com_id[Actor_function]) < (2 * change_num) or GetCash() < (20000 * change_num) then		--ÅĞ¶Ï¶Ò»»ÎïÆ·Ìõ¼şÊÇ·ñ·ûºÏ
		Say ("§¹i hiÖp ®õng ®ïa víi l·o phu! H·y xem lÖnh bµi vµ ng©n l­îng trong hµnh trang cã ®ñ kh«ng? Nhí kü! NhÊt ®Şnh ph¶i cã"..(2*change_num).." lÖnh bµi vµ "..(2*change_num).." Xu míi cã thÓ ®æi"..change_num.." Bİ kiÕp.",
			1,
			"Ta biÕt råi!/Zgc_dialog_end"
		)
	elseif GetFreeItemRoom() < change_num or (GetMaxItemWeight() - GetCurItemWeight()) < change_num then									--=========================ÔÚ´Ë¼ÓÈë¸ºÖØºÍ¿Õ¸ñÊıµÄÅĞ¶Ï
		Say ("VŞ huynh ®Ö nµy! Hµnh trang ®· ®Çy, s¾p xÕp xong h·y quay l¹i nhĞ!",
			1,
			"Ta biÕt råi!/Zgc_dialog_end"
		)
	elseif GetTask(Zgc_change_date_num_id) >= 20 and time_date_today <= GetTask(Zgc_change_date_id) then
		Say ("Tªn tiÓu tö nµy tham qu¸! L·o phu cßn ph¶i chuÈn bŞ cho vŞ b»ng h÷u kh¸c.",
			1,
			"Ta biÕt råi!/Zgc_dialog_end"
		)
	elseif change_num > 1 and (GetTask(Zgc_change_date_num_id) >= (21 - change_num)) and time_date_today <= GetTask(Zgc_change_date_id) then
		Say ("H«m nay b¹n chØ cã thÓ ®æi bİ kiÕp"..(20 - GetTask(Zgc_change_date_num_id)).." lÇn yÕu quyÕt!",
			1,
			"Ta biÕt råi!/Zgc_dialog_end"
		)	
	elseif Pay(20000 * change_num) == 1 and DelItem(2,0,Zgc_master_com_id[Actor_function],(2 * change_num)) ==1 then
		local com_jue_num = getn(Zgc_com_jue_table)
		local adv_jue_num = getn(Zgc_adv_jue_talbe)
		for i = 1, change_num do
			if GetTask(Zgc_adv_jue_remain_day_id) == 0 then		--Èç¹ûÍæ¼ÒÃ»ÓĞ»ñµÃ¹ı¸ß¼¶¾÷Òª£¬Ôò²»ÊÜµÚ¶şÌõ¼şµÄÏŞÖÆ¡£
				local change_num = random (1,((com_jue_num * 1000) + adv_jue_num))
				if change_num > (com_jue_num * 1000) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end
			elseif GetTask(Zgc_adv_jue_remain_times_id) >= 30 and (time_date_today - GetTask(Zgc_adv_jue_remain_day_id)) >= 30 then
				local change_num = random (1,((com_jue_num * 1000) + adv_jue_num))
				if change_num > (com_jue_num * 1000) then
					Zgc_jue_pay(1)
				else
					Zgc_jue_pay(0)
				end				
			else
				Zgc_jue_pay(0)
			end	
		end
	else
		return	
	end
end

TSK_TMP_SELECT_YUE_YUE = 107
YUE_EXCHANGE = 5

tRouteYue =
{
		{"ThiÕu L©m Tôc Gia", 1, {1,8}, {1,2}},
		{"ThiÕu L©m ThiÒn T«ng", 2, {17,25}, {5,6}},
		{"ThiÕu L©m Vâ T«ng", 3, {9,16}, {3,4}},
		{"§­êng M«n", 4, {26,39}, {7,7}},
		{"Nga My PhËt Gia", 5, {40,50}, {8,9}},
		{"Nga My Tôc Gia", 6, {51,59}, {10,11}},
		{"C¸i Bang TÜnh Y", 7, {60,66}, {12,13}},
		{"C¸i Bang ¤ Y", 8, {67,73}, {14,15}},
		{"Vâ §ang §¹o Gia", 9, {74,91}, {16,17}},
		{"Vâ §ang Tôc Gia",10, {92,100}, {18,19}},	
		{"D­¬ng Gia Th­¬ng Kş", 11, {101,109}, {20,21}},
		{"D­¬ng Gia Cung Kş",12, {110,118}, {22,23}},
		{"Ngò §éc HiÖp §éc", 13, {119,129}, {24,25}},
		{"Ngò §éc Tµ §éc", 14, {130,141}, {26,27}},
}

function exchange_yue()	
	local tSay = {}
	for i=1,getn(tRouteYue) do
		tinsert(tSay,format("%s/#do_exchange(%d)",tRouteYue[i][1],tRouteYue[i][2]))
	end
	tinsert(tSay,"Ta ch­a cÇn/Zgc_dialog_end")	
	Say("Ng­¬i muèn ®æi bİ kiÕp hÖ ph¸i nµo?",getn(tSay),tSay)	
end

function do_exchange(nSelected)	
	local time_date_today = floor((GetTime()-57600)/86400)
	if nSelected == 0 then
		return 0;
	end
	if gf_CheckPlayerRoute() == 0 or GetLevel() < 11 then
		Talk (1,"","Ng­¬i ph¶i ®¹t ®Õn cÊp 11 vµ gia nhËp mét hÖ ph¸i míi ®ñ ®iÒu kiÖn trao ®æi.")
		return 0;
	end
	if GetTask(Zgc_change_date_num_id) >= 20 and time_date_today <= GetTask(Zgc_change_date_id) then
		Talk (1,"","Tªn tiÓu tö nµy tham qu¸! L·o phu cßn ph¶i chuÈn bŞ cho vŞ b»ng h÷u kh¸c.")
		return 0;
	end
	if GetCash() < 350000 then
		Talk(1, "", "Ng©n l­îng trªn ng­êi kh«ng ®ñ!");
		return 0;
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end	
	SetTaskTemp(TSK_TMP_SELECT_YUE,nSelected)	
	local nSlot = YUE_EXCHANGE	
	PutinItemBox("§æi YÕu QuyÕt" ,nSlot , "X¸c nhËn muèn thùc hiÖn?", FILE_NAME, 1)
end

function OnPutinCheck(param, idx, genre, detail, particular)
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end
	if param ~= 1 then
		return 0;
	end	
	if (genre == 2 and detail == 6 and particular >= 0) then	
		return 1;
	end	
	Talk(1, "", "ChØ cã thÓ bá vµo bİ kiÕp!");
	return 0;
end

function OnPutinComplete(param)	
	local nSelect = GetTaskTemp(TSK_TMP_SELECT_YUE)
	SetTaskTemp(TSK_TMP_SELECT_YUE,0)
	if param ~= 1 then
		Talk(1, "", "Bá vµo vËt phÈm kh«ng ®óng");
		return 0;
	end
	local t = GetPutinItem()
	if getn(t) ~= YUE_EXCHANGE then
		Talk(1, "", "Sè l­îng vËt phÈm kh«ng ®óng");
		return 0;
	end	
	if get_yue_count(t, 2, 6) ~= YUE_EXCHANGE then
		Talk(1, "", "Sè l­îng vËt phÈm kh«ng ®óng");
		return 0;							
	end	
	if GetCash() < 350000 then
		Talk(1, "", "Ng©n l­îng trªn ng­êi kh«ng ®ñ");
		return 0;
	end
	if gf_JudgeRoomWeight(2,100," ") == 0 then
		return 0;
	end
	if Pay(350000) == 1 then
		local nResult = 1;
		for i = 1, getn(t) do			
			if DelItemByIndex(t[i][1], -1) ~= 1 then
				nResult = 0;
				break;
			end
		end		
		if nResult == 1 then
			local com_jue_num = getn(Zgc_com_jue_table)
			local adv_jue_num = getn(Zgc_adv_jue_talbe)
			local change_num = random (1,((com_jue_num * 1000) + adv_jue_num))
			local change_jue_seq = 0
			local change_jue_id = 0
			local change_jue_times_now = 0
			local change_jue_name = ""
			local date_now = floor((GetTime()-57600)/86400)
			if GetTask(Zgc_change_date_id) >= date_now then
				change_jue_times_now = GetTask(Zgc_change_date_num_id) + 1
			else
				change_jue_times_now = 1
			end
			if change_num > (com_jue_num * 1000) then
				local nRand = random(tRouteYue[nSelect][4][1],tRouteYue[nSelect][4][2])
				local nRet, nItemIdx = AddItem(2,6,Zgc_adv_jue_talbe[nRand][1],1)
				change_jue_name = Zgc_adv_jue_talbe[nRand][2]
				if nRet == 1 then
					if change_jue_times_now < 20 then
						Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", h«m nay b¹n cßn"..(20-change_jue_times_now).." lÇn ®æi bİ kiÕp")
					else
						Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", ngµy mai h·y quay l¹i ®©y.")
					end
					SetTask(Zgc_change_date_id,date_now)
					SetTask(Zgc_change_date_num_id,change_jue_times_now)		
					SetTask(Zgc_adv_jue_remain_day_id,date_now)
					SetTask(Zgc_adv_jue_remain_times_id,0)
				end
			else
				local nRand = random(tRouteYue[nSelect][3][1],tRouteYue[nSelect][3][2])
				local nRet, nItemIdx = AddItem(2,6,Zgc_com_jue_table[nRand][1],1)
				change_jue_name = Zgc_com_jue_table[nRand][2]
				if nRet == 1 then
					if change_jue_times_now < 20 then
						Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", h«m nay b¹n cßn"..(20-change_jue_times_now).." lÇn ®æi bİ kiÕp")
					else
						Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", ngµy mai h·y quay l¹i ®©y.")
					end				
					SetTask(Zgc_change_date_id,date_now)
					SetTask(Zgc_change_date_num_id,change_jue_times_now)
					local adv_jue_times = GetTask(Zgc_adv_jue_remain_times_id) + 1
					SetTask(Zgc_adv_jue_remain_times_id,adv_jue_times)
				end
			end		
		else
			WriteLogEx("Doi Yeu Quet","xãa item thÊt b¹i")		
		end
	end
end


function get_yue_count(t, id1, id2)
	local nCount = 0;
	for i = 1, getn(t) do
		if (t[i][2] == id1 and t[i][3] == id2) then
			nCount = nCount + 1;			
		end
	end
	return nCount;
end


-----------------------------------------¾÷Òª¸øÓèº¯Êı--------------------------------------
function Zgc_jue_pay(adv_flag)
	local change_jue_seq = 0
	local change_jue_id = 0
	local change_jue_times_now = 0
	local change_jue_name = ""
	local date_now = floor((GetTime()-57600)/86400)
	if GetTask(Zgc_change_date_id) >= date_now then
		change_jue_times_now = GetTask(Zgc_change_date_num_id) + 1
	else
		change_jue_times_now = 1
	end
	if adv_flag == 1 then
		change_jue_seq = random(1,getn(Zgc_adv_jue_talbe))
		change_jue_id = Zgc_adv_jue_talbe[change_jue_seq][1]
		change_jue_name = Zgc_adv_jue_talbe[change_jue_seq][2]
		local add_flag = AddItem(2,6,change_jue_id,1)
		if add_flag ~= 0 then
			if change_jue_times_now < 20 then
				Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", h«m nay b¹n cßn"..(20-change_jue_times_now).." lÇn ®æi bİ kiÕp")
			else
				Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", ngµy mai h·y quay l¹i ®©y.")
			end
			--AddGlobalNews("[ĞĞ½ÅÉÌÈË]:"..GetName().."ÏÀÊ¿»ñµÃÁËÏ¡ÊÀ¾÷Òª"..change_jue_name.."Ò»±¾£¬×£ËûÔçÈÕÁìÎòÎäÑ§ÕæÚĞ¡£")
			WriteLog("Ng­êi ch¬i:"..GetName().."§æi 1 quyÓn "..change_jue_name.."Bİ kiÕp cao cÊp.")
			SetTask(Zgc_change_date_id,date_now)
			SetTask(Zgc_change_date_num_id,change_jue_times_now)		
			SetTask(Zgc_adv_jue_remain_day_id,date_now)
			SetTask(Zgc_adv_jue_remain_times_id,0)
		else
			WriteLog("Ng­êi ch¬i:"..GetName().."§æi 1 quyÓn "..change_jue_name.." thÊt b¹i! TrŞ quay l¹i:"..add_flag..".")
		end
	else
		change_jue_seq = random (1,getn(Zgc_com_jue_table))
		change_jue_id = Zgc_com_jue_table[change_jue_seq][1]
		change_jue_name = Zgc_com_jue_table[change_jue_seq][2]
		local add_flag = AddItem(2,6,change_jue_id,1)
		if add_flag ~= 0 then
			if change_jue_times_now < 20 then
				Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", h«m nay b¹n cßn"..(20-change_jue_times_now).." lÇn ®æi bİ kiÕp")
			else
				Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 quyÓn"..change_jue_name..", ngµy mai h·y quay l¹i ®©y.")
			end
			SetTask(Zgc_change_date_id,date_now)
			SetTask(Zgc_change_date_num_id,change_jue_times_now)
			local adv_jue_times = GetTask(Zgc_adv_jue_remain_times_id) + 1
			SetTask(Zgc_adv_jue_remain_times_id,adv_jue_times)
		else
			WriteLog("Ng­êi ch¬i:"..GetName().."§æi bİ kiÕp phæ th«ng"..change_jue_name.." thÊt b¹i, trŞ quay l¹i:"..add_flag..".")
		end
	end
end
------------------------------------------Ê£Óà¶Ò»»´ÎÊı²éÑ¯--------------------------------
function Zgc_jue_change_time_inq()
	local time_save = GetTask(Zgc_change_date_id)
	local change_time = GetTask(Zgc_change_date_num_id)
	local time_now = floor((GetTime()-57600)/86400)
	local times_remain = 20 
	if time_now - time_save < 1 then
		times_remain = 20 - change_time
	end
	Say ("H«m nay b¹n chØ cã thÓ ®æi bİ kiÕp "..times_remain.."  lÇn.",
		1,
		"Ta biÕt råi!/Zgc_dialog_end"
	)
end
------------------------------------------Ï¡ÊÀ¾÷Òª²éÑ¯--------------------------------------
function Zgc_jue_change_com_jue_inq()
	local dialog_string = "  "
	for i = 1, getn(Zgc_adv_jue_talbe) do
		dialog_string = dialog_string..Zgc_adv_jue_talbe[i][2]
		if floor(i/5)-(i/5) == 0 then
			dialog_string = dialog_string .."\n  "
		else
			for j = 1,(16-strlen(Zgc_adv_jue_talbe[i][2])) do
				dialog_string = dialog_string .." "
			end
		end
	end
	Say("D­íi ®©y ®Òu lµ bİ kiÕp\n hiÕm thÊy cña c¸c m«n ph¸i"..dialog_string,
		1,
		"Ta biÕt råi!/Zgc_dialog_end"
	)
end
------------------------------------------¶Ò»»¹æÔò²éÑ¯---------------------------------------
function Zgc_jue_change_rule_inq()
	Say("§Ö tö <color=yellow>cÊp 11 trë lªn<color> gia nhËp m«n ph¸i cã thÓ dïng lÖnh bµi bæn m«n ®æi bİ kiÕp m«n ph¸i, mçi ngµy cã thÓ ®æi tèi ®a <color=yellow>20 lÇn<color>, mçi lÇn tèn <color=yellow>2 lÖnh bµi<color> vµ <color=yellow>2 tiÒn Vµng<color>. Nhí kü! Mçi tèi tõ <color=yellow>18 giê-24 giê<color> L·o phu míi cã thÓ gióp ng­¬i ®æi.",
		1,
		"Ta biÕt råi!/Zgc_dialog_end"
	)
end
---------------------------------------------¶Ô»°½áÊø------------------------------------------
function Zgc_dialog_end()

end
