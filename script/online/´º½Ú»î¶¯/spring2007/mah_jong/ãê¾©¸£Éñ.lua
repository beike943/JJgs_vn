--filename:ÈªÖİ¸£Éñ.lua
--create date:2006-01-12
--author:yanjun
--describe:ãê¾©¸£Éñ½Å±¾

--ĞŞ¸Ä£º1¡¢´å³¤20070123ĞŞ¸Ä±¾½Å±¾£¬Ôö¼Ó»ªÉ½¾º¼¼Ïà¹ØÄÚÈİ

Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================
	--Í²ÆğÊ¼IDÎª£º590
	circle_start_id = 613
	--ÌõÆğÊ¼IDÎª£º599
	bamboo_start_id = 622
	--ÍòÆğÊ¼IDÎª£º608
	ten_kilo_start_id = 631
	--×ÖÆğÊ¼IDÎª£º617
	char_start_id = 647
	--ËùÓĞÂé½«³õÊ¼»¯
	mah_jong = {
		"NhÊt ®ång","NhŞ ®ång","Tam ®ång","Tø ®ång","Ngò ®ång","Lôc ®ång","ThÊt ®ång","B¸t ®ång","Cöu ®ång",
		"Mét","NhŞ ®iÒu","Ba","Bèn","Ngò ®iÒu","Lôc ®iÒu","ThÊt ®iÒu","B¸t ®iÒu","Cöu ®iÒu",
		"NhÊt v¹n","NhŞ v¹n","Tam v¹n","Tø v¹n","Ngò v¹n","Lôc v¹n","ThÊt v¹n","B¸t v¹n","Cöu v¹n",
		"§«ng phong","Nam phong","T©y phong","B¾c phong","Hång trung","ph¸t tµi","B¹ch ban"
	}
	mah_jong_prize_bag = {{650,"Con bµi ®em c­îc"},{651,"Con bµi 2 ®em c­îc"},{652,"Con bµi 3 ®em c­îc"},{653,"Con bµi 4 ®em c­îc"}} --µ½ 630
	--Âé½«ºÍ·¨¶¨Òå
	mah_jong_suc_way = {
		--ºÍÅÆÃû³Æ-------------------ÕÅÊı---------¼ì²éº¯Êı-------------------------------½±ÀøµÈ¼¶--------ÃèÊö
		{"§¹i Tø Hû",		14,	"big_4_hap_chk()",			1,	"§¹i Tø HØ vµ quy t¾c bµi: <color=red>§«ng, Nam, B¾c<color> tÊt c¶ <color=red>3<color> tÊm, ngoµi ra <color=red>bµi Nh­ ı<color> 1 cÆp, tæng céng 14 tÊm."},	--ËÄ¸öËÄÕÅ¶«ÄÏÎ÷±±·ç+ÆäËüÒ»¶Ô
		{"Tø Kh¾c Tö",		14,	"four_hide_4_chk()",		2,	"Quy t¾c cña Tø kh¾c vµ Hßa bµi: 4 phã 4 tÊm lµ 1 cÆp, tÊt c¶ lµ 14 tÊm."},			--ËÄ¸öËÄÕÅ+ÆäËüÒ»¶Ô
		{"Cöu Liªn B¶o §¨ng",	14,	"from_1_to_9_chk()",		1,	"Quy t¾c Cöu liªn b¶o ®¨ng: §ång hoa ®ång s¾c 3 tÊm lµ 1, nhŞ tam tø ngò lôc thÊt b¸t ®ång hoa s¾c lµ 1, tæng céng 14 tÊm"},	--Í¬É«1112345678999+ÈÎÒâÒ»ÕÅÍ¬É«
		{"ThËp Tham Yªu",		14,	"thrteen_1_or_9()",			1,	"Quy t¾c ThËp tam yªu: Mçi s¾c hoa (§ång tö, §iÒu tö, V¹n tö) 1 vµ 9. 7 ch÷ trªn tÊm bµi (§«ng phong, Nam phong, T©y phong, B¾c phong, Hång trung, Ph¸t tµi, B¹ch b¶n) tæng céng 14 tÊm."},		--ÈıÖĞ»¨É«µÄçÛ¾Å+¶«ÄÏÎ÷±±ÖĞ·¢°×
		{"Liªn ThÊt §èi",		14,	"connect_7_double()",		2,	"Quy t¾c Liªn ThÊt §èi: Dùa theo sè thø tù 7 cÆp liªn tiÕp cña nh÷ng tÊm ®ång hoa s¾c. Tæng céng cã 14 tÊm."},	--Í¬É«Á¬ÆğÀ´µÄÆß¶Ô
		{"Thanh ThÊt §èi",		14,	"sam_color_7_double()",		3,	"Quy t¾c thanh long ®èi: 7 cÆp cña nh÷ng tÊm ®ång hoa s¾c, tæng céng 14 tÊm"},
		{"ThÊt Tinh BÊt Kh¸o",	14,	"seven_star()",				3,	"Quy t¾c ThÊt tinh bÊt kh¸o: Chon tÊt c¶ 14 tÊm trong ®ã nhÊt ®Şnh ph¶i cã 7 tÊm trong §«ng, T©y, Nam, B¾c thªm 3 tÊm hoa s¾c vµ chän nh÷ng tÊm trong trïng c¸c sè 147, 258, 369…"},
		{"Thèi bÊt ®¶o",		14,	"cannot_push()",			2, 	"Quy t¾c Th«i BÊt §¶o Dùa theo c¸c h×nh vÏ trªn tÊm bµi kh¸c nhau ®Ó xÕp thµnh 1 nhãm gåm: 123456789 bİnh, 245689 ®iÒu, b¹ch ®iÒu. Tæng céng 14 tÊm."},
		{"§¹i Tam Nguyªn",		14,	"big_3_yuan()",				3,	"Quy t¾c §¹i Tam Nguyªn (<color=red>quy t¾c bÊt chİnh<color>): Chän 14 tÊm trong c¸c lo¹i Hång trung, Ph¸t tµi, B¹ch b¶n, cßn l¹i <color=red>tïy ı<color>."},
		{"Thanh Yªu Cöu",		14,	"all_1_or_9()",				3,	"Quy t¾c Thanh Yªu Cöu: (<color=red>Quy t¾c bÊt chİnh<color>: chän 14 tÊm trong tÊt c¶ c¸c lo¹i."},
		{"NhÊt S¾c Tø §ång ThuËn",	14,	"one_color_four_seq()",		2,	"Quy t¾c NhÊt S¾c Tø §ång ThuËn (<color=red>Quy t¾c bÊt chİnh<color>): Chän 14 tÊm theo c¸c sè thø tù (nh­: 1 v¹n, 2 v¹n, 3 v¹n), cßn l¹i chän <color=red>cïng s¾c tïy ı<color>"},
		{"NhÊt S¾c Tø TiÕt Cao",	14,	"one_color_four_cont()",	2,	"Quy t¾c §ång S¾c Tø TiÕt Cao (<color=red>quy t¾c bÊt chİnh<color>): Chän 14 tÊm theo c¸c sè thø tù t¨ng dÇn (1 v¹n, 2 v¹n, 3 v¹n, 4 v¹n ) vµ 2 tÊm <color=red>®ång s¾c tïy ı<color>."},
		{"Tù NhÊt S¾c",		14,	"all_char()",				3,	"Quy t¾c Ch÷ NhÊt S¾c (<color=red>Quy t¾c bÊt chİnh<color>): chän tÊt c¶ 14 tÊm <color=red>tïy ı<color> trong c¸c ch÷ (§«ng phong, T©y phong, Nam phong, B¾c phong, Hång Trung, Ph¸t tµi, B¹ch b¶n)"},
		{"Thanh NhÊt S¾c",		14,	"all_sam_color()",			4,	"Quy t¾c Thanh NhÊt S¾c (<color=red>quy t¾c bÊt chİnh<color>): Chän tïy ı 14 tÊm trong nh÷ng tÊm <color=red>®ång s¾c<color>, (§ång tö, §iÒu tö, V¹n tö)."},
		{"Toµn ®¹i",		14,	"all_big()",				4,	"Quy t¾c Toµn §¹i (<color=red>quy t¾c bÊt chİnh<color>: Chän 14 tÊm tïy ı trong c¸c tÊm <color=red>hoa s¾c<color> hoÆc trong tæ hîp sè thø tù <color=red>7, 8, 9<color>"},
		{"Toµn trung",		14,	"all_normal()",				4,	"Quy t¾c toµn trung (<color=red>quy t¾c bÊt chİnh<color>): Chän 14 tÊm tïy ı trong c¸c tÊm <color=red>hoa s¾c<color> hoÆc trong tæ hîp sè thø tù <color=red>4, 5, 6<color>"},
		{"Toµn tiÓu",		14,	"all_small()",				4,	"Quy t¾c toµn tiÓu (<color=red>quy t¾c bÊt chİnh<color>): Chän 14 tÊm tïy ı trong c¸c tÊm <color=red>hoa s¾c<color> cßn l¹i trong tæ hîp sè thø tù <color=red>1, 2, 3<color>."},
		{"Thanh Long",		14,	"sam_color_dragon()",		3,	"Quy t¾c Thanh Long (<color=red>quy t¾c bÊt chİnh<color>): chän 14 tÊm bµi cã sè thø tù ®ång nhÊt s¾c tõ 1-9, cßn l¹i chän <color=red>hoa s¾c tïy ı<color>."},
		{"Tam Kh¾c Tö",		14,	"three_hide_num_3()",		4,	"Quy t¾c Tam Kh¾c Tö (<color=red>quy t¾c bÊt chİnh<color>): Cã thÓ chän 14 tÊm trong nh÷ng cÆp t­¬ng ®ång cßn l¹i lµ <color=red>hoa s¾c tïy ı<color>."},
		{"Thİ Hå",		14, "just_14()",				5,	"Quy t¾c Tİ Hå (<color=red>quy t¾c bÊt chİnh<color>): Cã thÓ chän 14 tÊm <color=red>tïy ı<color>."},
	}
--==============================Ö÷Âß¼­ÇøÓò===============================
function main(npc_index)
	SetTaskTemp(164,npc_index)				--Ğ´Èë¸£ÉñµÄË÷Òı
	--¼ÓÉÏµÈ¼¶ÅĞ¶Ï
	if spring_2007_date_chk() == 1 then
		local selTab = {
					"Ta muèn nhËn hép quµ n¨m míi./get_present",
					"§iÒu kiÖn nhËn hép quµ n¨m míi./know_detail",
					"Ta ph¶i ®Õn Hoa S¬n tham gia lÔ Héi Hoa S¬n./goto_huashan",
					"Ta muèn t×m hiÓu ho¹t ®éng Hoa S¬n C¶nh Kü/huashan_fight_inf",
					"Ta muèn giao nh÷ng tÊm m¹c ch­îc thu ®­îc/mah_jong_collect_dia",
					"Ta muèn t×m hiÓu ho¹t ®éng thu thËp m¹c ch­îc/mah_jong_collect_inf",
					"§a t¹ Phóc ThÇn!/nothing"
					}
		Say("Nh©n dŞp n¨m míi ta cã chót quµ tÆng mäi ng­êi, chóc mäi ng­êi n¨m míi vui vÎ!",getn(selTab),selTab)
	else
		Say("Xu©n ®· vÒ, mäi ng­êi h©n hoan chµo ®ãn, kh¾p mäi n¬i thËt lµ nhén nhŞp!",0)
	end
end

function get_present()
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20060120 then 	--´º½Ú»î¶¯»¹Ã»¿ªÊ¼£¬¸£ÉñÍü¼Ç´øÀñÎïÁË-_-b
		Say("H·y an t©m, mäi ng­êi ®Òu cã quµ!",0)
		return 0		
	end
	if nDate > 20060205 then	--´º½Ú»î¶¯½áÊø¿©£¬Ã»ÀñÎï·¢¿©£¬¸£ÉñÒª»Ø¼Ò¿©
		Say("TÕt ®· qua, hép quµ n¨m míi ®· bŞ ng­êi ch¬i lÊy hÕt råi. ThËt ¸y n¸y, n¨m sau ta nhÊt ®Şnh mang nhiÒu quµ h¬n!",0)
		return 0
	end
	if GetLevel() < 10 then
		Say("Ng­¬i ch­a ®¹t ®Õn cÊp 10, kh«ng thÓ nhËn hép quµ n¨m míi!",0)
		return 0
	end
	if GetTask(TASK_GOT_PRESENT) ~= GetCurDate() then	--ĞÂµÄÒ»Ìì£¬ÒÑÁìÈ¡ÀñÎï±ê¼ÇÇå0
		SetTask(TASK_GOT_PRESENT,0)
	end
	if GetTask(TASK_GOT_PRESENT) ~= 0 then	--Èç¹û½ñÌìÒÑ¾­ÁìÈ¡¹ıĞÂÄêÀñÎï
		Say("H«m nay ng­¬i ®· nhËn quµ, ngµy mai quay l¹i nhĞ!",0)
		return 0
	end
	local nHour = GetLocalTime()
	if GetGlbValue(GLB_PRESENT_NUM_QZ) == 0 then	--ÀñÎï·¢ÍêÁË
		local strSex = ""
		if GetSex() == 1 then
			strSex = "ThiÕu hiÖp"
		elseif GetSex() == 2 then
			strSex = "C« n­¬ng"
		else
			strSex = "ThiÕu hiÖp/N÷ hiÖp"
		end
		Say("Hép quµ n¨m míi ®· bŞ lÊy hÕt råi,"..strSex.."§îi lÇn sau nhĞ!",0)
		return 0
	end
	if AddItem(2,1,213,1) == 1 then
		WriteLog("[Ho¹t ®éng mïa xu©n Phóc ThÇn]:"..GetName().."NhËn ®­îc 1 hép quµ n¨m míi tõ Phóc ThÇn ë TuyÒn Ch©u")
		SetTask(TASK_GOT_PRESENT,GetCurDate())
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 hép quµ n¨m míi!")
		local present_left = GetGlbValue(GLB_PRESENT_NUM_QZ) - 1
		if present_left < 0 then
			SetGlbValue(GLB_PRESENT_NUM_QZ,0)
		end
		SetGlbValue(GLB_PRESENT_NUM_QZ,present_left)
		if present_left == 0 then	--Ã»ÓĞÀñÎïÊ£ÓàÁË£¬¿ì·¢»î¶¯½áÊøµÄ¹«¸æ°É
			AddGlobalNews("Hép quµ n¨m míi ë TuyÒn Ch©u ®· bŞ lÊy hÕt, ng­êi ch¬i nµo h«m nay ch­a nhËn ®­îc quµ, h·y ®îi c¬ héi lÇn sau.")
			Msg2SubWorld("Hép quµ n¨m míi ë TuyÒn Ch©u ®· bŞ lÊy hÕt, ng­êi ch¬i nµo h«m nay ch­a nhËn ®­îc quµ, h·y ®îi c¬ héi lÇn sau.")
			return 1
		end
		if mod(present_left,10) == 0 then	--Ö»¹«¸æ10´Î
			Msg2SubWorld("TuyÒn Ch©u vÉn cßn"..present_left.." phÇn quµ n¨m míi ®îi ng­êi ch¬i ®Õn nhËn")
		end
	end
end

function know_detail()
	Say("Tõ 20/01 ®Õn 05/02, chØ cÇn ng­êi ch¬i tõ cÊp 10 trë lªn, mçi ngµy theo giê quy ®Şnh ®Õn chç ta nhËn hép quµ n¨m míi.",0)
end
--==========================»ªÉ½¾º¼¼Ïà¹Ø==========================
--***************************´«ËÍµ½»ªÉ½***************************
function goto_huashan()
	if GetPlayerGenre() == 0 then
		Talk(1,"","Ch­a gia nhËp m«n ph¸i kh«ng thÓ tham gia ho¹t ®éng Hoa S¬n C¶nh Kü!")
		return
	else
		if Zgc_pub_today_sec_num_rtn() > 57600 then
			local time_distance =  GetTime() - GetTask(991)
			if time_distance < 600 then
				Talk(1,"","Vµo Hoa S¬n c¸ch nhau 10 phót, ng­¬i cßn"..Zgc_pub_time_sec_change(time_distance,0).." míi cã thÓ vµo")
				return
			end
		end
		NewWorld(969,1633,3263)
		SetTask(991,GetTime())
	end	
end
--*************************»ªÉ½»î¶¯ÏêÇé***************************
function huashan_fight_inf()
	
end
function nothing()

end
--============================Âé½«ÊÕ¼¯Ïà¹Øº¯Êı==============================
--**************************Âé½«ÊÕ¼¯»î¶¯¶Ô»°****************************
function mah_jong_collect_dia()
	local mah_jong_seq_ran = spring_2007_mahj_suc_seq_rtn()			--»ñµÃµ±Ç°ºú·¨µÄËæ»úÊı
	Msg2Player(mah_jong_seq_ran)		--test
	local mah_jong_collect_dia_main = ""
	local mah_jong_collect_dia = {}
	if mah_jong_seq_ran ~= 0 and mah_jong_seq_ran <=(getn(mah_jong_suc_way) -1) then
		mah_jong_collect_dia_main = "Thêi gian thu thËp m¹c ch­îc:"
		mah_jong_collect_dia[1] = mah_jong_suc_way[mah_jong_seq_ran][1].."/#mah_jong_collect_prize("..mah_jong_seq_ran..")" 
		mah_jong_collect_dia[2] = "Ta muèn t×m hiÓu"..mah_jong_suc_way[mah_jong_seq_ran][1].."quy t¾c/#mah_jong_suc_inf("..mah_jong_seq_ran..")"
		mah_jong_collect_dia[3] = "Thİ Hå/#mah_jong_collect_prize(20)"
		mah_jong_collect_dia[4] = "T×m hiÓu quy t¾c tİ hå/#mah_jong_suc_inf(20)"
		mah_jong_collect_dia[5] = "Ta chØ ®Õn xem thö/end_dialog"
	else
		mah_jong_collect_dia_main = "Thêi gian thu thËp m¹c ch­îc:"
		mah_jong_collect_dia[1] = "Thİ Hå/#mah_jong_collect_prize(20)"
		mah_jong_collect_dia[2] = "T×m hiÓu quy t¾c tİ hå/#mah_jong_suc_inf(20)"
		mah_jong_collect_dia[3] = "Ta chØ ®Õn xem thö/end_dialog"		
	end
	Say(mah_jong_collect_dia_main,getn(mah_jong_collect_dia),mah_jong_collect_dia)
end
--**************************Âé½«ÊÕ¼¯»î¶¯ÏêÇé****************************
function mah_jong_collect_inf()
	
end
--***************************ÉÏ½»Âé½«½±Àøº¯Êı***************************
function mah_jong_collect_prize(suc_way)
	--´ÎÊıÏŞÖÆ¼ì²â
	if suc_way == 20 then
		if spring_2007_mahj_num_chk(2) == 0 then			--Æ¨ºú´ÎÊı¼ì²é
			return
		end
	else
		if spring_2007_mahj_num_chk(1) == 0 then			--´óºú´ÎÊı¼ì²é
			return
		end
	end
	--Âé½«ºú·¨¼ì²é
	if dostring(mah_jong_suc_way[suc_way][3]) == 0 then		
		return
	end
	--±³°ü¿Õ¼äºÍ¸ºÖØ¼ì²â
	if suc_way ~= 20 then
		if Zgc_pub_goods_add_chk(1,100) ~= 1 then			
			return
		end
	end
	--Âé½«É¾³ı¼ì²é
	if mah_jong_del_all(14) ~= 0 then						
		return
	end
	--½±Àø¸øÓè
	if suc_way == 20 then
		local exp_num = GetLevel()
		exp_num = exp_num * exp_num * 250
		ModifyExp(exp_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..exp_num.." ®iÓm kinh nghiÖm!")
	else
		local add_flag = AddItem(2,0,mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][1],1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][2].."!")
			if mah_jong_suc_way[suc_way][4] == 1 or mah_jong_suc_way[suc_way][4] == 2 then
				Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Sè m¹c ch­îc lÇn nµy thu thËp ®­îc"..mah_jong_suc_way[suc_way][1].."! §­îc råi"..mah_jong_prize_bag[mah_jong_collect_prize(mah_jong_suc_way[suc_way][4])][2].."!")
			end
		else
			WriteLog("Ho¹t ®éng M¹c Ch­îc, Ng­êi ch¬i:"..GetName().."NhËn phÇn th­ëng thÊt b¹i, t¹i:"..add_flag)
		end
	end
end
--****************************Âé½«ºú·¨ÏêÇé******************************
function mah_jong_suc_inf(mahj_suc_diff)
	Talk(1,"end_dialog","<color=green>Phóc ThÇn<color>:"..mah_jong_suc_way[mahj_suc_diff][5])
end
--******************************´óËÄÏ²**********************************
function big_4_hap_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	if (GetItemCount(2,0,char_start_id) * GetItemCount(2,0,(char_start_id+1)) * GetItemCount(2,0,(char_start_id+2)) * GetItemCount(2,0,(char_start_id+3))) ~= 81 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	else
		local chk_flag = 0 
		for i = circle_start_id,(char_start_id - 1) do
			if GetItemCount(2,0,i) ~= 0 and GetItemCount(2,0,i) == 2 then
				chk_flag = 1
			end
		end
		for i =(char_start_id + 4),(char_start_id + 6) do
			if GetItemCount(2,0,i) ~= 0 and GetItemCount(2,0,i) == 2 then
				chk_flag = 1
			end
		end
	end
	if chk_flag == 0 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
	return 1
end
--******************************ËÄ°µ¿Ì***********************************
function four_hide_4_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local four_chk = 0
	local double_chk = 0
	for i = circle_start_id,(char_start_id + 6) do
		if GetItemCount(2,0,i) == 3 then
			four_chk =four_chk + 1
		elseif GetItemCount(2,0,i) == 2 then 
			double_chk = double_chk + 1
		end
	end
	if four_chk == 4 and double_chk == 1 then
		return 1
	else
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
end
--******************************¾ÅÁ«±¦µÆ*********************************
function from_1_to_9_chk()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color ~= 1 or mah_jong_color ~= 2 or mah_jong_color ~= 3 then
		local chk_flag = 1
		if GetItemCount(2,0,circle_start_id + ( (mah_jong_color-1) * 9)) < 3 and GetItemCount(2,0,circle_start_id + ( (mah_jong_color * 9) - 1)) < 3 then
			Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
			return 0
		end
		for i = (circle_start_id + 1 +( (mah_jong_color-1) * 9)) ,(circle_start_id + ( (mah_jong_color * 9) - 2)) do
			if GetItemCount(2,0,i) == 0 then
				Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
				return 0
			end
		end
	else
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n cã con bµi <color=red>cïng mµu<color>!")
		return 0	
	end
	return 1
end
--******************************Á¬Æß¶Ô***********************************
function connect_7_double()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color ~= 1 or mah_jong_color ~= 2 or mah_jong_color ~= 3 then
		--3\4\5\6\7±ØĞë³É¶Ô¡£
		for i = (circle_start_id + 2 +( (mah_jong_color-1) * 9)) ,(circle_start_id + ( (mah_jong_color * 9) - 3)) do
			if GetItemCount(2,0,i) ~= 2 then
				Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
				return 0
			end
		end
		if (GetItemCount(2,0,(circle_start_id +((mah_jong_color-1) * 9))) == 2 and GetItemCount(2,0,(circle_start_id + 1 +((mah_jong_color-1) * 9))) == 2)
		or (GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 1))) == 2 and GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 2))) == 2)
		or (GetItemCount(2,0,(circle_start_id + 1 +((mah_jong_color-1) * 9))) == 2 and GetItemCount(2,0,(circle_start_id + ((mah_jong_color * 9) - 1))) == 2)
		then
			return 1
		else
			Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
			return 0
		end
	else
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n cã con bµi <color=red>cïng mµu<color>!")
		return 0	
	end
end
--******************************13çÛ*************************************
function thrteen_1_or_9()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local maho_jong_13_1_or_9 = {circle_start_id,(bamboo_start_id - 1),bamboo_start_id,ten_kilo_start_id,(ten_kilo_start_id - 1),}
	local double_chk = 0
	for i = 1,getn(maho_jong_13_1_or_9) do
		if GetItemCount(2,0,maho_jong_13_1_or_9[i]) == 0 then
			if GetItemCount(2,0,i) == 0 then
				Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
				return 0
			elseif 	GetItemCount(2,0,maho_jong_13_1_or_9[i]) == 2 then
				double_chk = 1
			end
		end
	end
	for i = char_start_id , (char_start_id + 6) do
		if GetItemCount(2,0,i) == 0 then
			Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
			return 0
		elseif 	GetItemCount(2,0,i) == 2 then
			double_chk = 1
		end
	end
	if double_chk ~= 1 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0		
	else
		return 1
	end
end
--******************************´óÈıÔª***********************************
function big_3_yuan()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	for i = (char_start_id + 4),(char_start_id + 6) do
		if GetItemCount(2,0,i) < 3 then
			Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
			return 0
		end
	end
	return 1
end
--*******************************ÆßĞÇ²»¿¿********************************
function seven_star()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	for i = char_start_id , (char_start_id + 6) do
		if GetItemCount(2,0,i) ~= 1 then
			Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
			return 0
		end
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local chk_diff_flag = 0
	for i = 1,3 do
		for j = maho_jong_id_start[i],(maho_jong_id_start[i] + 2) do
			if GetItemCount(2,0,j) == 1 and GetItemCount(2,0,(j + 3)) == 1 and GetItemCount(2,0,(j + 6)) == 1then
				chk_flag = (chk_flag + j)
				if j ~= 2 then
					chk_diff_flag = 1
				end
			end
		end
	end
	if chk_flag ~= 6 or chk_diff_flag ~= 1 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	else
		return 1
	end
end
--********************************ÍÆ²»µ¹*********************************
function cannot_push()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local cannot_push_id = {circle_start_id,(circle_start_id+1),(circle_start_id+2),(circle_start_id+3),(circle_start_id+4),(circle_start_id+7),(circle_start_id+8),(bamboo_start_id+1),(bamboo_start_id+3),(bamboo_start_id+4),(bamboo_start_id+5),(bamboo_start_id+7),(bamboo_start_id+8),(char_start_id+6)}
	for i = 1, getn(cannot_push_id) do
		if GetItemCount(2,0,cannot_push_id[i]) ~= 1 then
			Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
			return 0
		end
	end
	return 1
end
--********************************ÇåÆß¶Ô*********************************
function sam_color_7_double()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local maho_jong_color_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local maho_jong_color = mah_jong_same_color_chk()
	if maho_jong_color == 0 or maho_jong_color == 4 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0		
	end
	local double_num = 0
	for i = maho_jong_color_id[maho_jong_color],(maho_jong_color_id[maho_jong_color] + 6) do
		if GetItemCount(2,0,i) == 2 then
			double_num = double_num + 1
		end
	end
	if double_num ~= 7 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	else
		return 1
	end
end
--********************************ÇåçÛ¾Å*********************************
function all_1_or_9()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end	
	local num_1_or_9 = 0
	local id_1_or_9 = {circle_start_id,(bamboo_start_id-1),bamboo_start_id,(ten_kilo_start_id-1),ten_kilo_start_id,(char_start_id-1)}
	for i = 1,getn(id_1_or_9) do
		num_1_or_9 = GetItemCount(2,0,i) + num_1_or_9
	end
	if num_1_or_9 ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0		
	else
		return 1
	end
end
--*****************************Ò»É«ËÄÍ¬Ë³********************************
function one_color_four_seq()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color == 0 or mah_jong_color == 4 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0	
	else
		for i = maho_jong_id_start[mah_jong_color],(maho_jong_id_start[mah_jong_color] + 8) do
			if GetItemCount(2,0,i) >= 4 and GetItemCount(2,0,(i+1)) >= 4 and GetItemCount(2,0,(i+2)) >= 4 then
				chk_flag = 1
				break
			end
		end
	end
	if chk_flag == 1 then
		return 1
	else
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0	
	end
end
--*****************************Ò»É«ËÄ½Ú¸ß********************************
function one_color_four_cont()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local maho_jong_id_start = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	local mah_jong_color = mah_jong_same_color_chk()
	if mah_jong_color == 0 or mah_jong_color == 4 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0	
	else
		for i = maho_jong_id_start[mah_jong_color],(maho_jong_id_start[mah_jong_color] + 8) do
			if GetItemCount(2,0,i) >= 3 and GetItemCount(2,0,(i+1)) >= 3 and GetItemCount(2,0,(i+2)) >= 3 and GetItemCount(2,0,(i+3)) >= 3 then
				chk_flag = 1
				break
			end
		end
	end
	if chk_flag == 1 then
		return 1
	else
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0	
	end
end
--*******************************×ÖÒ»É«**********************************
function all_char()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	if mah_jong_same_color_chk() ~= 4 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
	return 1
end
--*******************************×ÖÒ»É«**********************************
function all_sam_color()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	if mah_jong_same_color_chk() == 0 or mah_jong_same_color_chk() == 4 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
	return 1
end
--*******************************È«´ó************************************
function all_big()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 4,6 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
	return 1
end
--*******************************È«ÖĞ************************************
function all_normal()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 3,5 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
	return 1
end
--*******************************È«Ğ¡************************************
function all_small()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local fit_num = 0 
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	for i = 1,3 do
		for j = 0,2 do
			fit_num = fit_num + GetItemCount(2,0,(color_start_id[i]+j))
		end
	end
	if fit_num ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
	return 1
end
--*******************************ÇåÁú************************************
function sam_color_dragon()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local color_start_id = {circle_start_id,bamboo_start_id,ten_kilo_start_id}
	local chk_flag = 0
	for i = 1, 3 do
		if GetItemCount(2,0,color_start_id[i]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 1)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 2]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 3)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 4]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 5)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 6]) ~= 0 and GetItemCount(2,0,(color_start_id[i] + 7)) ~= 0 and 
		GetItemCount(2,0,color_start_id[i + 8]) ~= 0 then
			return 1
		end	
	end
	Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
	return 0
end
--******************************Èı°µ¿Ì***********************************
function three_hide_num_3()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	end
	local chk_flag = 0
	for i = 0,33 do 
		if GetItemCount(2,0,(circle_start_id+i)) >= 3 then
			chk_flag = chk_flag + 1
		end
	end
	if chk_flag >= 3 then
		return 1
	else
		Talk(1,"end_dialog","X¸c nhËn tronghµnh trang cña b¹n cã con bµi phï hîp!")
		return 0
	end
end
--********************************Æ¨ºú***********************************
function just_14()
	if mah_jong_cout() ~= 14 then
		Talk(1,"end_dialog","X¸c nhËn trong hµnh trang cña b¹n <color=red>chØ cã<color> <color=red>14<color> con bµi!")
		return 0
	else
		return 1
	end
end
--===============================¹«¹²º¯Êı================================
--****************************Âé½«´¿É«¼ì²é*******************************
--·µ»ØÍæ¼ÒÉíÉÏÅÆÊÇ·ñÊÇ´¿É«£º0Îª£º²»ÊÇ´¿É«¡¢1ÎªÍ²¡¢2ÎªÌõ¡¢3ÎªÍò¡¢4Îª×Ö
function mah_jong_same_color_chk()
	local mah_jong_seq = 0		--¼ì²âµ½µÚÒ»ÕÅÅÆµÄID
	for i = circle_start_id,(char_start_id + 6) do
		if GetItemCount(2,0,i) ~= 0 and mah_jong_seq == 0 then
			mah_jong_seq = (floor((i - circle_start_id) / 9) + 1)
		elseif GetItemCount(2,0,i) ~= 0 and mah_jong_seq ~= 0 then
			if (floor((i-circle_start_id)/9) + 1) ~= mah_jong_seq then
				mah_jong_seq = 0
				break
			end
		end
	end
	return mah_jong_seq
end
--***************************Âé½«ÊıÁ¿Í³¼Æº¯Êı****************************
function mah_jong_cout()
	local num_trn = 0
	for i = circle_start_id,(char_start_id + 6) do
		num_trn = GetItemCount(2,0,i) + num_trn
	end
	return num_trn
end
--************************Âé½«È«²¿É¾³ıº¯Êı******************************
function mah_jong_del_all(del_num)
	for i = circle_start_id,(char_start_id + 6) do
		local mah_num = GetItemCount(2,0,i)
		if mah_num ~= 0 then
			if DelItem(2,0,i,mah_num) == 1 then
				del_num = del_num - mah_num
			end
		end
	end
	return del_num
end
