--filename:ÈªÖİ¸£Éñ.lua
--create date:2006-01-12
--author:yanjun
--describe:ãê¾©¸£Éñ½Å±¾

--ĞŞ¸Ä£º1¡¢´å³¤20070123ĞŞ¸Ä±¾½Å±¾£¬Ôö¼Ó»ªÉ½¾º¼¼Ïà¹ØÄÚÈİ

Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================
	start_seq = {
		{630,638},
		{639,647},
		{648,656},
		{657,663}
		}
	--ËùÓĞÂé½«³õÊ¼»¯
	mah_jong = {
		"NhÊt ®ång","NhŞ ®ång","Tam ®ång","Tø ®ång","Ngò ®ång","Lôc ®ång","ThÊt ®ång","B¸t ®ång","Cöu ®ång",
		"Mét","NhŞ ®iÒu","Ba","Bèn","Ngò ®iÒu","Lôc ®iÒu","ThÊt ®iÒu","B¸t ®iÒu","Cöu ®iÒu",
		"NhÊt v¹n","NhŞ v¹n","Tam v¹n","Tø v¹n","Ngò v¹n","Lôc v¹n","ThÊt v¹n","B¸t v¹n","Cöu v¹n",
		"§«ng phong","Nam phong","T©y phong","B¾c phong","Hång trung","ph¸t tµi","B¹ch ban"
	}
	mah_jong_prize_bag = {{670,"Con bµi 4 ®em c­îc"},{669,"Con bµi 3 ®em c­îc"},{668,"Con bµi 2 ®em c­îc"},{667,"Con bµi ®em c­îc"},{667,"Con bµi ®em c­îc"}}
	Npc_name = {"<color=green>Hiªn Viªn Trung<color>:","<color=green>Hiªn Viªn Nh©n<color>:","<color=green>Hiªn Viªn LÔ<color>:"}
--==============================Ö÷Âß¼­ÇøÓò===============================
function main(npc_index)
	local map_ID = GetWorldPos()				--¼ÇÂ¼NPCÃû³Æ
	--¼ÓÉÏµÈ¼¶ÅĞ¶Ï
	local npc_dia = {
		"Hay l¾m! Xem ta ra tay ®©y!/mah_jong_suc_list",
		"§¸nh theo quy t¾c nµo vËy? Lµm sao tİnh th¾ng?/mah_jong_suc_inf",
		"Kh«ng biÕt M¹t ch­îc lµ c¸i g×?/what_is_mah_jong",
		"Cuéc thi §ç thÇn tranh b¸ lµ g×?/mah_jong_task_inf",
		"Ta muèn nhËn H­íng dÉn ho¹t ®éng 1-5/#AddItem(2,1,1114,1)",
		"Ta cßn ph¶i hµnh hiÖp cøu ng­êi, kh«ng r¶nh ®Ó ®¸nh M¹t ch­îc!/end_dialog",
	}
	Say(Npc_name[floor(map_ID/100)].."Ta lµ ®Ö tö cña Hiªn Viªn m«n, gÇn ®©y bæn m«n cã tæ chøc 1 cuéc thi <color=yellow>§ç ThÇn tranh b¸<color>, sao b»ng h÷u kh«ng ®Õn ®ã thö xem!",
		getn(npc_dia),
		npc_dia
	)
end
--*********************************ºúÅÆ¹æÔòËµÃ÷**************************
function mah_jong_suc_inf()
	local map_ID = GetWorldPos()
	Say(Npc_name[floor(map_ID/100)].."D­íi ®©y lµ quy t¾c th¾ng, b¹n muèn ch¬i theo c¸ch nµo?",
	7,
	"Ta muèn biÕt quy t¾c hßa vµ phÇn th­ëng/#mah_jong_rule_dia(1)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Thanh NhÊt S¾c §ång/#mah_jong_rule_dia(2)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Thanh NhÊt S¾c §iÒu/#mah_jong_rule_dia(3)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Thanh NhÊt S¾c V¹n/#mah_jong_rule_dia(4)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña §¹i Tø Hû/#mah_jong_rule_dia(5)",
	"Ta muèn biÕt quy t¾c vµ phÇn th­ëng cña Bµi ThÇn/#mah_jong_rule_dia(6)",
	"Tho¸t/end_dialog"
	)
end
function mah_jong_rule_dia(suc_way)
	local map_ID = GetWorldPos()
	local tb_mah_jong_suc_rule = {
		"<color=yellow>Quy t¾c B×nh Hå<color>: \n CÇn <color=yellow>14 <color>cßn bµi bÊt kú !\n<color=yellow>PhÇn th­ëng<color>: <color=yellow>14 §æ HiÖp Ngò Th­ëng Bao<color> (më ra nhËn ®­îc: Ng©n l­îng, cã thÓ nhËn ®­îc: Hép quµ cñ c¶i nhá, MËt tŞch, Gái m¶nh Thiªn Th¹ch, Hßa ThŞ Bİch, <color=red>R­¬ng trang bŞ Tµng KiÕm<color>)!",
		"<color=yellow>Thanh NhÊt S¾c §ång<color>: \n CÇn cã NhÊt §ång ®Õn Cöu §ång <color=yellow>mçi lo¹i 1 con<color>, ngoµi ra <color=yellow>4 con §ång bÊt kú<color>!\n<color=yellow>PhÇn th­ëng<color>: <color=yellow>§æ HiÖp Tø Th­ëng Bao<color>(Më ra nhËn ®­îc: vò khİ ®Æc biÖt, danh väng, mËt tŞch, hép quµ cñ c¶i nhá, Ph¸o hoa ®­a tin. Cã thÓ nhËn ®­îc: B¶n vÏ binh khİ m«n ph¸i, Gãi Thiªn Th¹ch, N«ng Tang phæ, <color=red>Viªm §Õ Gi¸p<color>)!", 
		"<color=yellow>Thanh NhÊt S¾c §iÒu<color>: \n  CÇn NhÊt §iÒu ®Õn Cöu §iÒu <color=yellow>mçi lo¹i 1 con<color>, ngoµi ra <color=yellow>5 con §iÒu bÊt kú<color>!\n<color=yellow>PhÇn th­ëng<color>: <color=yellow>§æ HiÖp Tam Th­ëng Bao<color>(Më ra nhËn ®­îc: vò khİ ®Æc biÖt, danh väng, mËt tŞch, hép quµ cñ c¶i nhá, Ph¸o hoa ®­a tin. Cã thÓ nhËn ®­îc: B¶n vÏ binh khİ m«n ph¸i, Gãi Thiªn Th¹ch, N«ng Tang phæ, <color=red>Viªm §Õ Gi¸p<color>)!", 
		"<color=yellow>Thanh NhÊt S¾c V¹n<color>: \n  CÇn NhÊt V¹n ®Õn Cöu V¹n <color=yellow>mçi lo¹i 1 con<color>, ngoµi ra <color=yellow>5 con V¹n bÊt kú<color>!\n<color=yellow>PhÇn th­ëng<color>: <color=yellow>§æ HiÖp NhŞ Th­ëng Bao<color>(Më ra nhËn ®­îc: vò khİ ®Æc biÖt, danh väng, mËt tŞch, hép quµ cñ c¶i lín, Ph¸o hoa ®­a tin. Cã thÓ nhËn ®­îc: B¶n vÏ binh khİ m«n ph¸i, Gãi Thiªn Th¹ch, N«ng Tang phæ,  R­¬ng s¾t NguyÖt L­îng Thè, <color=red>Viªm §Õ Gi¸p<color>, <color=red>Viªm §Õ Kh«i<color>)!", 
		"<color=yellow>Quy t¾c §¹i Tø Hû<color>: \n   CÇn cã §«ng Phong, Nam Phong, T©y Phong, B¾c Phong <color=yellow>mçi lo¹i 3 con<color>, ngoµi ra cßn cã <color=yellow>Hång Trung, Ph¸t Tµi, B¹ch B¶n <color>1 ®«i ngÉu nhiªn!\n<color=yellow>PhÇn th­ëng<color>: <color=red>§æ HiÖp NhÊt Th­ëng Bao<color>(Më ra ®­îc: Vò khİ ®Æc biÖt, danh väng, MËt tŞch, Hép quµ cñ c¶i lín, cã thÓ nhËn ®­îc: B¶n vÏ binh khİ m«n ph¸i, Gãi Thiªn Th¹ch, N«ng Tang phæ,  B¶o r­¬ng NguyÖt L­îng Thè, <color=red>3 mãn trang bŞ Viªm §Õ<color>)!",
		"<color=yellow>Bµi ThÇn<color>: \n   CÇn <color=yellow>336 <color> con <color=yellow>M¹t Ch­îc bÊt kú<color>!\n<color=yellow>PhÇn th­ëng<color>: <color=red>§æ HiÖp NhÊt Th­ëng Bao<color>(Më ra ®­îc: Vò khİ ®Æc biÖt, danh väng, MËt tŞch, Hép quµ cñ c¶i lín. Cã thÓ nhËn ®­îc: B¶n vÏ binh khİ m«n ph¸i, Gãi Thiªn Th¹ch, N«ng Tang phæ, B¶o r­¬ng NguyÖt L­îng Thè, <color=red>3 mãn trang bŞ Viªm §Õ<color>)!"
	}
	Talk(1,"",Npc_name[floor(map_ID/100)].."\n"..tb_mah_jong_suc_rule[suc_way])
end
--**********************************Âé½«À´Àú******************************
function what_is_mah_jong()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_1",Npc_name[floor(map_ID/100)].."<color=yellow>M¹t Ch­îc<color> vèn cã tªn lµ <color=yellow>M¹t T­íng<color>, M¹t lµ <color=yellow>108<color> vŞ h¶o h¸n cña Thñy Hö truyÖn. cã ng­êi tªn <color=green>V¹n BØnh §iÒu<color> rÊt sïng b¸i h¶o h¸n L­¬ng S¬n B¹c, ®· ph¸t minh ra cê <color=yellow>M¹t Ch­îc<color>, ®em 108 Anh hïng hãa th©n vµo trß ch¬i. M¹t Ch­îc cã tæng céng <color=yellow>108<color> qu©n bµi, vİ nh­ <color=yellow>108<color> vŞ h¶o h¸n. Trong bµi cã <color=yellow>Cöu §iÒu<color> vİ nh­ <color=green>Cöu §iÒu Long Sö TiÕn<color>, <color=yellow>NhŞ §iÒu<color> vİ nh­ <color=green>Song Tiªn H« Diªn Ch­íc<color>, <color=yellow>NhÊt Bİnh<color> vİ nh­ <color=green>H¾c TiÒn Phong Lı Quú<color>.")
end
function what_is_mah_jong_1()
	local map_ID = GetWorldPos()
	Talk(1,"what_is_mah_jong_2",Npc_name[floor(map_ID/100)].."Tæng c«ng chia lµm <color=yellow>V¹n, Bİnh. §iÒu<color> 3 lo¹i, lµ hµi ©m tªn hä cña mçi ng­êi. Mçi lo¹i tõ 1 ®Õn 9 mçi lo¹i cã 4 tÊm bµi,  võa ®óng <color=yellow>108<color> con bµi. <color=yellow>108<color> vŞ h¶o h¸n héi tô L­¬ng S¬n tõ 8 ph­¬ng 4 h­íng, cho nªn céng thªm <color=yellow>§«ng T©y Nam B¾c Trung<color> 5 h­íng thªm 4 qu©n bµi tæng céng <color=yellow>20 qu©n bµi<color>. C¸c vŞ h¶o h¸n xuÊt th©n tõ tÇng líp kh¸c nhau cho nªn céng thªm <color=yellow>Trung, Ph¸t, B¹ch<color> vİ nh­ tÇng líp cña hä, céng thªm 8 qu©n bµi nµy tæng céng ®· cã <color=yellow>136<color> qu©n bµi.")
end
function what_is_mah_jong_2()
	local map_ID = GetWorldPos()
	Talk(1,"",Npc_name[floor(map_ID/100)].."Sau ®ã l¹i céng thªm 4 lo¹i Hoa bµi tæng céng ®· cã <color=yellow>144<color> qu©n bµi. §¸nh M¹t Ch­îc dïng bµn cã 4 h­íng §«ng T©y Nam B¾c, còng lµ chØ 4 mïa xu©n h¹ thu ®«ng, mçi ng­êi <color=yellow>13 qu©n bµi<color> bëi v× mçi quı cã <color=yellow>13 tuÇn <color>. 4 mïa hîp l¹i lµ <color=yellow>52<color> tuÇn, tæng céng <color=yellow>364 ngµy<color>, céng thªm <color=yellow>1 qu©n bµi<color> giê d­, tæng céng cã <color=yellow>365 ngµy<color>, võa ®óng 1 n¨m. ")
end
--**********************************»î¶¯¼òÊö******************************
function mah_jong_task_inf()
	local map_ID = GetWorldPos()
	Talk(1,"",Npc_name[floor(map_ID/100)].."<color=yellow>Hiªn Viªn m«n<color> ta vèn lµ tæ chøc tËp hîp nhiÒu con b¹c sïng b¸i <color=green>Hiªn Viªn ®¹i hiÖp<color>, mçi n¨m ®Òu tæ chøc cuéc thi §æ ThÇn ®Ó t­ëng nhí <color=green>Hiªn Viªn ®¹i hiÖp<color>. B»ng h÷u cã thêi gian cã thÓ t×m 1 qu©n bµi tèt ®Õn chç ta, ta sÏ c¨n cø sè qu©n bµi thu thËp ®­îc ®Ó tÆng <color=yellow>phÇn th­ëng<color> t­¬ng øng.")
end
--**********************************ºúÅÆ¶Ô»°******************************
function mah_jong_suc_list()
	local date_chk = labor_day_2007_date_chk()
	local map_ID = GetWorldPos()
	if date_chk == -1 then				--»î¶¯Ê±¼äÅĞ¶Ï
		Talk(1,"mah_jong_task_inf",Npc_name[floor(map_ID/100)].."Cuéc thi §æ ThÇn tranh b¸ vÉn ch­a chİnh thøc b¾t ®Çu. b»ng h÷u cã thÓ xem thuyÕt minh liªn quan ho¹t ®éng")
		return
	elseif date_chk == 0 then			--ºúÅÆÁĞ±í
		Say(Npc_name[floor(map_ID/100)].."Kh«ng biÕt <color=yellow>"..Zgc_pub_sex_name().."<color>Cã bµi nµo hay?",
			7,
			"Ta muèn chän B×nh Hå/#mah_jong_suc_dtm(1)",
			"Ta muèn chän Thanh NhÊt S¾c §ång/#mah_jong_suc_dtm(2)",
			"Ta muèn chän Thanh NhÊt S¾c §iÒu/#mah_jong_suc_dtm(3)",
			"Ta muèn chän Thanh NhÊt S¾c V¹n/#mah_jong_suc_dtm(4)",
			"Ta muèn chän §¹i Tø Hû/#mah_jong_suc_dtm(5)",
			"Ta muèn chän Bµi ThÇn/#mah_jong_suc_dtm(6)",
			"Ta vÉn ch­a chuÈn bŞ/end_dialog"
		)
	else
		Say(Npc_name[floor(map_ID/100)].."<color=yellow>Cuéc thi §ç ThÇn tranh b¸ <color><color=red>®· kÕt thóc<color> nh­ng phÇn th­ëng vÉn cã thÓ ®æi b×nh th­êng, b»ng h÷u muèn ®æi th­ëng <color=red>h·y nhanh lªn<color> kÎo hÕt c¬ héi.",
			7,
			"Ta muèn chän B×nh Hå/#mah_jong_suc_dtm(1)",
			"Ta muèn chän Thanh NhÊt S¾c §ång/#mah_jong_suc_dtm(2)",
			"Ta muèn chän Thanh NhÊt S¾c §iÒu/#mah_jong_suc_dtm(3)",
			"Ta muèn chän Thanh NhÊt S¾c V¹n/#mah_jong_suc_dtm(4)",
			"Ta muèn chän §¹i Tø Hû/#mah_jong_suc_dtm(5)",
			"Ta muèn chän Bµi ThÇn/#mah_jong_suc_dtm(6)",
			"Ta vÉn ch­a chuÈn bŞ/end_dialog"
		)
	end
end
--********************************ºúÅÆÈ·ÈÏ********************************
function mah_jong_suc_dtm(suc_seq)
	local map_ID = GetWorldPos()
	local mah_jong_suc_dia = {
		Npc_name[floor(map_ID/100)].."<color=yellow>B×nh Hå<color> chØ cÇn <color=yellow>14<color> con bµi bÊt kú ®Òu cã thÓ ®æi, phÇn th­ëng lµ: <color=yellow>14 §æ HiÖp Ngò Th­ëng Bao<color>. Con bµi nµo ng­¬i kh«ng muèn nép cã thÓ gi÷ l¹i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh NhÊt S¾c (Thïng)<color> cÇn NhÊt §ång ®Õn Cöu §ång <color=yellow>mçi lo¹i 1 con<color>, ngoµi ra<color=yellow>5 con §ång Tö bÊt kú<color> tæng céng <color=yellow>14 con §ång Tö<color>!\n   PhÇn th­ëng lµ: <color=yellow>§æ HiÖp Tø Th­ëng Bao<color>. Con bµi nµo ng­¬i kh«ng muèn nép cã thÓ gi÷ l¹i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh NhÊt S¾c <color>cÇn 1 ®Õn 9<color=yellow> mçi lo¹i 1 con<color>, mgoµi ra <color=yellow>5 con bÊt kú<color> tæng céng, <color=yellow>14 con<color>!\n   PhÇn th­ëng: <color=yellow>§æ HiÖp Tam Th­ëng Bao<color>. Con bµi nµo ng­¬i kh«ng muèn nép cã thÓ gi÷ l¹i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Thanh NhÊt S¾c V¹n <color>cÇn NhÊt V¹n ®Õn Cöu V¹n <color=yellow>mçi lo¹i 1 con<color>, ngoµi ra<color=yellow>bÊt kú 5 con<color> tæng céng <color=yellow>14 con v¹n<color>!\n   PhÇn th­ëng: <color=yellow>§æ HiÖp NhŞ Th­ëng Bao<color>. Con bµi nµo ng­¬i kh«ng muèn nép cã thÓ gi÷ l¹i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>§¹i Tø Hû<color> cÇn cã §«ng Phong, Nam Phong, T©y Phong, B¾c Phong <color=yellow>mçi lo¹i 3 con<color>, ngoµi ra cßn cã <color=yellow>Hång Trung, Ph¸t Tµi, B¹ch B¶n<color> mçi lo¹i 1 cÆp, tæng céng <color=yellow>14 tÊm bµi ch÷<color>!\n PhÇn th­ëng: <color=red>§æ HiÖp NhÊt Th­ëng Bao<color>.Con bµi nµo ng­¬i kh«ng muèn nép cã thÓ gi÷ l¹i!",
		Npc_name[floor(map_ID/100)].."<color=yellow>Bµi ThÇn<color> cÇn <color=yellow>336<color> con bµi th× cã thÓ ®æi!\n PhÇn th­ëng lµ: <color=red>§æ HiÖp NhÊt Th­ëng Bao<color>",
	}
	Say(mah_jong_suc_dia[suc_seq],
	2,
	"Ta muèn ®æi phÇn th­ëng/#mah_jong_num_chk("..(suc_seq-1)..")",		--½øÈëÊıÁ¿¼ì²â
	"§Ó ta chuÈn bŞ thªm/end_dialog"
	)
end
--********************************Âé½«¼ì²â*****************************
function mah_jong_num_chk(color_diff)
--Êı¾İ×¼±¸
	local map_ID = GetWorldPos()
	local npc_name = Npc_name[floor(map_ID/100)]
--------------------------------------ÊıÁ¿¼ì²â--------------------------------------
	local mah_jong_id_start = 0
	local mah_jong_id_end = 0
	if color_diff == 0 or color_diff == 5 then			--¶¨ÒåÂé½«ÊıÁ¿µÄ¿ªÊ¼¼ÆËãIDºÍ½áÊø¼ÆËãID
		mah_jong_id_start = start_seq[1][1]
		mah_jong_id_end = start_seq[4][2]
	else
		mah_jong_id_start = start_seq[color_diff][1]
		mah_jong_id_end = start_seq[color_diff][2]
	end
	local mah_jong_count = 0		--¶¨Òå×ÜµÄÂé½«Êı
	for i = mah_jong_id_start,mah_jong_id_end do
		mah_jong_count = mah_jong_count + GetItemCount(2,0,i)
	end
	if (color_diff ~= 5 and mah_jong_count < 14) or (color_diff == 5 and mah_jong_count < 336) then
		Talk(1,"",npc_name.."B¹n h·y x¸c nhËn trong tói cã <color=yellow>®ñ sè l­îng M¹t ch­îc<color> phï hîp quy t¾c!")
		return
	end
--------------------------------------¹æÔò¼ì²â--------------------------------------
	--¿ªÊ¼¼ì²â
	if color_diff ~= 0 and color_diff ~= 5 then		--Æ½ºúºÍÅÆÉñ²»ĞèÒª¹æÔò¼ì²â
		if color_diff ~= 4 then						--¼ì²âÍ¬ÖÖ»¨É«1-9¸÷Ò»ÕÅ
			for i = start_seq[color_diff][1],start_seq[color_diff][2] do
				if GetItemCount(2,0,i) < 1 then
					Talk(1,"",npc_name.."B¹n h·y x¸c nhËn trong tói cã <color=yellow>con bµi<color> ®ã kh«ng!")
					return
				end
			end
		else
			for i = start_seq[4][1],(start_seq[4][1]+3) do	--¼ì²âËÄ·ç¸÷ÈıÕÅ
				if GetItemCount(2,0,i) < 3 then
					Talk(1,"",npc_name.."B¹n x¸c nhËn trong tói cã §«ng Phong, Nam Phong, T©y Phong, B¾c Phong mçi lo¹i <color=yellow>3 con bµi<color>!")
					return
				end
			end
			local double_chk = 0 							--¶Ô×Ó¼ì²â±êÖ¾
			for i = (start_seq[4][1]+4),start_seq[4][2] do
				if GetItemCount(2,0,i) >= 2 then
					double_chk = 1
					break
				end
			end
			if double_chk == 0 then
				Talk(1,"",npc_name.."Xin x¸c nhËn trong hµnh trang cã <color=yellow>1 cÆp<color> Hång Trung hoÆc Ph¸t Tµi hoÆc B¹ch B¶n!")
				return
			end
		end
	end
-------------------------------------°ü¹ü¿Õ¼ä¼ì²â--------------------------------
	if Zgc_pub_goods_add_chk(1,1) ~= 1 then
		return
	end
--------------------------------------É¾³ı¼ì²â--------------------------------------
	local del_chk = 0
	local del_remain_num = 14		--ĞèÒªÉ¾³ı14ÕÅÂé½«
	if color_diff == 0 or color_diff == 5 then
		if color_diff == 5 then
			del_remain_num = 336
		end
		for i = mah_jong_id_start,mah_jong_id_end do
			local mah_jong_num = GetItemCount(2,0,i)
			if mah_jong_num ~= 0 then
				local del_num = min(mah_jong_num,del_remain_num)
				if DelItem(2,0,i,del_num) == 1 then
					del_remain_num = del_remain_num - del_num
				end
			end
			if del_remain_num <= 0 then
				break
			end
		end
	elseif color_diff >= 1 and color_diff <= 3 then
		del_remain_num = 5						--³ıÒ»µ½¾ÅÍòÁíÍâĞèÒªÉ¾³ı5ÕÅ
		for i = start_seq[color_diff][1],start_seq[color_diff][2] do		--Âß¼­±È½Ï¸´ÔÓ
			local mah_jong_num = GetItemCount(2,0,i)
			local del_num = min(mah_jong_num,(del_remain_num + 1))
			if DelItem(2,0,i,del_num) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - (del_num - 1)
		end
	elseif color_diff == 4 then
		del_remain_num = 5
		for i = start_seq[4][1],(start_seq[4][1]+3) do	--É¾³ıËÄ·ç¸÷ÈıÕÅ
			if DelItem(2,0,i,3) ~= 1 then
				break
			end
			del_remain_num = del_remain_num - 1
		end
		for i = (start_seq[4][1]+4),start_seq[4][2] do	--É¾³ı¶Ô×Ó
			if GetItemCount(2,0,i) >= 2 then
				if DelItem(2,0,i,2) == 1 then
					del_remain_num = del_remain_num - 1
					break
				end
			end
		end
	end
	if del_remain_num > 0 then			--É¾³ıÊ§°Ü
		Talk(1,"",npc_name.."Xin x¸c nhËn M¹t ch­îc trong tói phï hîp quy t¾c yªu cÇu!")
		return
	end
--------------------------------------- ½±Àø¸øÓÚ-------------------------------------
	if color_diff == 0 then
		local add_flag = AddItem(2,1,1112,14)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc 14 §æ HiÖp Ngò Th­ëng Bao!")
		end
	else
		local add_flag = AddItem(2,0,mah_jong_prize_bag[color_diff][1],1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..mah_jong_prize_bag[color_diff][2].."!")
			if color_diff == 4 or color_diff == 5 then
				Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Nép qu©n bµi ®èi øng! NhËn ®­îc"..mah_jong_prize_bag[color_diff][2].."!")
			end
			WriteLog("Ng­êi ch¬i:"..GetName().."NhËn ®­îc:"..mah_jong_prize_bag[color_diff][2])
		else
			WriteLog("Ho¹t ®éng M¹c Ch­îc, Ng­êi ch¬i:"..GetName().."NhËn ®­îc"..mah_jong_prize_bag[color_diff][2].."T¨ng thªm thÊt b¹i, kı hiÖu"..add_flag)
		end	
	end
end
