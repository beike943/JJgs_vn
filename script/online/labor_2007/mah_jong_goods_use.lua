--2007Äê´º½Ú»î¶¯-Âé½«ÊÕ¼¯»î¶¯-ÎïÆ·Ê¹ÓÃº¯Êı
--´úÂë¿ª·¢ÈË£ºÕÔ¹ó´º
--´úÂë¿ª·¢Ê±¼ä£º2007-01-24
--´úÂëĞŞ¸Ä¼ÇÂ¼£º2008-04-11 by Ä«ÏÉ
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
Include("Script\\Online\\\laborday08\\mah_jong_head.lua")
Include("Script\\Lib\\lingshi_head.lua")
--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================
	--ÌØÊâÂé½«ID£º624
	random_mah_jong_id = 664
	--Âé½«IDĞòÁĞ±í
	start_seq = {
		{630,638},
		{639,647},
		{648,656},
		{657,663},
		}
	--Âé½«°ü
	mah_jong_bag = {{665,8,"Tói M¹c Ch­îc (tiÓu)"},{666,14,"Tói M¹c Ch­îc (®¹i)"}} --ID£¬ÕÅÊı
	--Âé½«»î¶¯½±Àø°ü
	--mah_jong_prize_bag = {{667,200,"¶ÄÏÀÒ»½±°ü"},{668,200,"¶ÄÏÀ¶ş½±°ü"},{669,200,"¶ÄÏÀÈı½±°ü"},{670,200,"¶ÄÏÀËÄ½±°ü"}}
	--Âé½«½±Àø°ü¶ÔÓ¦½±Àø
	Tb_mah_jong_bag_prize = {
		--Ãû³Æ----------------------ID---¿Õ¼ä-¸ºÖØ-ÉùÍû-´ó½³Ê¦ÊÖÊé-76ÎäÆ÷-Å©É£¼­Òª-Ñ×µÛ¿ø¼×Ñ¥-Ê¦ÃÅËéÆ¬-´ò°üÔÉÌú-ÂÜ²·ÀñºĞ-´«ĞÅÑÌ»ğ-Ìú±¦Ïä
		-------------1---------------2------3-------4----5-----6------7----8---------9-----10---11-------12----13--14--------15--16------------17-18---19-20--------21-
		{"Con bµi ®em c­îc",667,25,700,200,300,5,10,	10,	50,	100,100,50,60,	3,50,	1095,2,0,25,"\n 100%: 10 mãn vò khİ cÊp 76, danh väng 200-300 ®iÓm, 5 quyÓn mËt tŞch, 2 hép quµ cñ c¶i lín \n 60%: 1-3 tÊm b¶n vÏ vò khİ m«n ph¸i\n 50%: Gãi Thiªn Th¹ch, N«ng Tang phæ\n 25%: <color=red>R­¬ng s¾t NguyÖt L­îng Thè<color>\n 10%: <color=red>Viªm §Õ Gi¸p<color>\n 10%: <color=red>Viªm §Õ Kh«i<color>\n  5%: <color=red>Viªm §Õ Trang<color>"},
		{"Con bµi 2 ®em c­îc",668,20,600,100,200,4,8,	8,	30,	30,	30,	0,30,	3,25,	1095,1,3,10,"\n 100%: 8 mãn vò khİ cÊp 76, danh väng 100-200 ®iÓm, 4 quyÓn mËt tŞch, 1 hép quµ cñ c¶i lín, 3 Ph¸o hoa ®­a tin\n 30%: 1-3 tÊm b¶n vÏ vò khİ m«n ph¸i, N«ng Tang phæ\n 25%: Gãi Thiªn Th¹ch\n 10%: <color=red>R­¬ng s¾t NguyÖt L­îng Thè<color>\n  3%: <color=red>Viªm §Õ Gi¸p<color>\n  3%: <color=red>Viªm §Õ Kh«i<color>"},
		{"Con bµi 3 ®em c­îc",669,15,400,50,80,	2,4,	4,	20,	0,	6,	0,5,	2,10,	1094,8,2,0,"\n 100%: 4 mãn vò khİ cÊp 76, danh väng 50-80 ®iÓm, 2 quyÓn mËt tŞch, 8 hép quµ cñ c¶i nhá, 2 Ph¸o hoa ®­a tin\n 10%: Gãi Thiªn Th¹ch, N«ng Tang phæ\n 5%: 1-2 tÊm b¶n vÏ vò khİ m«n ph¸i \n   0.6%: <color=red>Viªm §Õ Gi¸p<color>"},
		{"Con bµi 4 ®em c­îc",670,11,300,20,30,	1,2,	2,	5,	0,	3,	0,1,	1,5,	1094,5,1,0,"\n 100%: 2 mãn vò khİ cÊp 76, danh väng 20-30 ®iÓm, 1 quyÓn mËt tŞch, 5 hép quµ cñ c¶i nhá, 1 Ph¸o hoa ®­a tin\n  5%: Gãi Thiªn Th¹ch, N«ng Tang phæ\n  1%: b¶n vÏ vò khİ m«n ph¸i\n 0.3%: <color=red>Viªm §Õ Gi¸p<color>"},
	}
	--ËùÓĞÂé½«³õÊ¼»¯
	mah_jong = {
			"NhÊt ®ång","NhŞ ®ång","Tam ®ång","Tø ®ång","Ngò ®ång","Lôc ®ång","ThÊt ®ång","B¸t ®ång","Cöu ®ång",
			"Mét","NhŞ ®iÒu","Ba","Bèn","Ngò ®iÒu","Lôc ®iÒu","ThÊt ®iÒu","B¸t ®iÒu","Cöu ®iÒu",
			"NhÊt v¹n","NhŞ v¹n","Tam v¹n","Tø v¹n","Ngò v¹n","Lôc v¹n","ThÊt v¹n","B¸t v¹n","Cöu v¹n",
			"§«ng phong","Nam phong","T©y phong","B¾c phong","Hång trung","ph¸t tµi","B¹ch ban"}
	--ÌØÊâÂé½«ID
	spec_mahj_id_start = 1108
	spec_mahj_id_end = 1111
	mah_jong_prize_shoe = 1215
	--¶ÄÏÀÎå½±°ü
	mahj_prize_5th = {1112,"<color=yellow>Danh s¸ch phÇn th­ëng<color>: \n 100%: <color=yellow>20<color> tiÒn Vµng\n 50%: Hép quµ cñ c¶i nhá\n  5%: MËt tŞch\n  1.5%: Bao m¶nh Thiªn Th¹ch hoÆc Hßa ThŞ Bİch\n 0.5%: <color=red>B¶o r­¬ng trang bŞ Tµng KiÕm ngÉu nhiªn<color>"}
	--Âé½«Ïà¹Ø¿ÉÒÔÊ¹ÓÃ±êÖ¾
	mah_jong_use_flag = 1			--ÎåÒ»½ÚºóÒ»¸ö°æ±¾¹Ø±Õ
--==============================Ö÷Âß¼­ÇøÓò===============================
function OnUse(goods_index)
	if get_laborday08_award_state() ~= 1 then--ÅĞ¶ÏÊÇ·ñÔÚ»î¶¯¿ª·ÅÆÚ¼ä
		Talk(1,"end_dialog","VËt phÈm nµy chØ sö dông trong thêi gian diÔn ra ho¹t ®éng <color=yellow>1/5<color>!")
		return
	end
	if Zgc_pub_action_level_chk() == 0 then
		return
	end
	if mah_jong_use_flag ~= 1 then
		Talk(1,"end_dialog","VËt phÈm nµy chØ sö dông trong thêi gian diÔn ra ho¹t ®éng <color=yellow>1/5<color>!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--µ¥¸öÂé½«»»È¡½±Àø
	if goods_id >= start_seq[1][1] and goods_id <= start_seq[4][2] then
		Say("<color=green>Nh¾c nhë<color>: B¹n muèn dïng 1 M¹t ch­îc ®æi th­ëng?\n<color=yellow>PhÇn th­ëng<color>:\n    B×nh ph­¬ng ®¼ng cÊp*10 ®iÓm kinh nghiÖm, tû lÖ 20% nhËn ®­îc 1 Linh th¹ch cÊp 1-7, ®Æt vµo Tô Linh ®Ønh, tû lÖ gièng tói b¶o th¹ch. NÕu ng­êi ch¬i cÊp 99 sÏ nhËn ®­îc 1 Linh th¹ch cÊp 1-7, ®Æt vµo Tô Linh ®Ønh, tû lÖ gièng tói b¶o th¹ch.",
		2,
		"Ta muèn ®æi phÇn th­ëng/#single_mahj_pri("..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
		return
	--Âé½«°ü¶Ò»»½±Àø
	elseif goods_id == mah_jong_bag[1][1] or goods_id == mah_jong_bag[2][1] then
		local bag_diff = (goods_id + 1) - mah_jong_bag[1][1]
		Say("<color=green>Nh¾c nhë<color>: B¹n x¸c nhËn muèn sö dông: <color=green>".. mah_jong_bag[bag_diff][3].."<color> ®æi <color=green>".. mah_jong_bag[bag_diff][2].."<color> M¹c ch­îc ­?",
		2,
		"§æi/#mah_jong_bag_chg("..bag_diff..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	--Âé½«½±Àø°ü»»È¡½±Àø
	elseif goods_id >= Tb_mah_jong_bag_prize[1][2] and goods_id <= Tb_mah_jong_bag_prize[4][2] then  	
		local prize_diff = (goods_id + 1) - Tb_mah_jong_bag_prize[1][2]
		Say("<color=green>Nh¾c nhë<color>: B¹n x¸c nhËn muèn sö dông:<color=green>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>§æi phÇn th­ëng kh«ng? \n<color=yellow>Danh s¸ch phÇn th­ëng<color>:"..Tb_mah_jong_bag_prize[prize_diff][21],
			2,
			"Ta cÇn ®æi phÇn th­ëng/#mah_jong_prize("..prize_diff..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	--Âé½«Ò»ÕÅµÄÊ¹ÓÃ
	elseif goods_id == random_mah_jong_id then
		--Âé½«Ò»ÕÅÉ¾³ı¼ì²â
		if DelItem(2,0,random_mah_jong_id,1) ~= 1 then
			Talk(1,"","<color=green>Nh¾c nhë<color>: Xin x¸c nhËn trong hµnh trang cã <color=yellow>1 qu©n bµi<color>!")
			return
		else
			--Í¨ÓÃÂé½«¸ÅÂÊ ´«Èë²ÎÊıÎª£º¸ÅÂÊ¡£µ¥Î»£ºÇ§·Ö±È¡£±ÈÈç´«Èë50 ±íÊ¾5%»ñµÃ
			add_mahjong_prob(1000)
		end
	elseif goods_id >= spec_mahj_id_start and goods_id <= spec_mahj_id_end then
		local special_mahj_diff = goods_id - 1107
		mah_jong_chg(special_mahj_diff)
	--¶ÄÏÀÎå½±°ü
	elseif goods_id == mahj_prize_5th[1] then
		Say("<color=green>Nh¾c nhë<color>: B¹n x¸c nhËn muèn sö dông <color=yellow>§æ HiÖp Ngò Th­ëng Bao<color>!\n"..mahj_prize_5th[2],
		2,
		"§æi/mah_jong_przie_5",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	end
end
--**************************µ¥¸öÂé½«»»È¡½±Àø************************
function single_mahj_pri(goods_id)
	if GetTask(TASK_MJ_SINGLE_PRIZE) >= 1000 then--ÁìÈ¡½±ÀøÏŞÖÆ
		Msg2Player("Sè lÇn ®æi tÊm M¹t ch­îc lÊy phÇn th­ëng tèi ®a lµ 1000 lÇn! B¹n ®· nhËn h¬n 1000 lÇn!")
		return
	end
	if DelItem(2,0,goods_id,1) == 1 then
		SetTask(TASK_MJ_SINGLE_PRIZE,GetTask(TASK_MJ_SINGLE_PRIZE) + 1)
		if GetLevel() ~= 99 then
			local nexp = GetLevel()*GetLevel()*10
			ModifyExp(nexp)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..nexp.." ®iÓm kinh nghiÖm!")
			local nLingShi = random(1,5)--20%¼¸ÂÊ»ñµÃÁéÊ¯
			if nLingShi == 1 then
				laborday08_baoshi_prob("Sö dông 1 tÊm M¹t ch­îc")
			end
		else
			laborday08_baoshi_prob("Sö dông 1 tÊm M¹t ch­îc")
		end
		Msg2Player("B¹n cã thÓ nhËn phÇn th­ëng mét tÊm M¹t ch­îc"..1000 - GetTask(TASK_MJ_SINGLE_PRIZE).."lÇn n÷a th«i nhĞ!")
	else
		WriteLog("Ho¹t ®éng 1-5: Ng­êi ch¬i"..GetName().."Xãa tÊm M¹t ch­îc thÊt b¹i.")
	end
end
--***************************Âé½«°ü»»Âé½«********************************
function mah_jong_bag_chg(bag_diff)
	if GetItemCount(2,0,mah_jong_bag[bag_diff][1]) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
		return
	end
	if DelItem(2,0,mah_jong_bag[bag_diff][1],1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
		return
	else
		for j = 1,mah_jong_bag[bag_diff][2] do
			add_mahjong_prob(1000)
			--Í¨ÓÃÂé½«¸ÅÂÊ ´«Èë²ÎÊıÎª£º¸ÅÂÊ¡£µ¥Î»£ºÇ§·Ö±È¡£±ÈÈç´«Èë50 ±íÊ¾5%»ñµÃ
		end
	end
end
--**************************ÌØÊâÂé½«»»È¡¶Ô»°*****************************
function mah_jong_chg(mah_jong_diff)
	local mah_jong_id = {{start_seq[1][1],9,1},{start_seq[2][1],9,10},{start_seq[3][1],9,19},{start_seq[4][1],7,28}}
	local mah_jong_chg_dia = {}
	for i = 1, mah_jong_id[mah_jong_diff][2] do
		mah_jong_chg_dia[i]="Ta cÇn ®æi ("..mah_jong[(mah_jong_id[mah_jong_diff][3]-1)+i]..")/#mah_jong_add("..(mah_jong_id[mah_jong_diff][1] - 1 + i)..","..mah_jong_diff..")"
	end
	mah_jong_chg_dia[mah_jong_id[mah_jong_diff][2] + 1] = "§Ó ta suy nghÜ l¹i/end_dialog"
	Say("B¹n h·y chän qu©n bµi muèn ®æi lÊy.",
		getn(mah_jong_chg_dia),
		mah_jong_chg_dia
	)	
end
--***************************ÌØÊâÂé½«»»È¡****************************
function mah_jong_add(goods_id,color_diff)
	local special_mahj_ID = (1107 + color_diff)
	if GetItemCount(2,1,special_mahj_ID) == 0 then
		Talk(1,"end_dialog","B¹n h·y x¸c nhËn trong hµnh trang cã <color=yellow>Qu©n bµi ®Æc biÖt<color>!")
		return
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then			--¸ºÖØÅĞ¶Ï
			return
		end
		if DelItem(2,1,special_mahj_ID,1) ~= 1 then	--É¾³ıÌØÊâÂé½«³É¹¦ÅĞ¶Ï
			Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cã <color=yellow>1 qu©n bµi M¹t ch­îc<color>!")
			return
		else
			local add_flag = AddItem(2,0,goods_id,1)
			if add_flag == 1 then
				Msg2Player("Chóc mõng b¹n ®æi ®­îc 1 qu©n bµi ®Æc biÖt"..mah_jong[goods_id - start_seq[1][1] +1].."!")
			else
				WriteLog ("Ng­êi ch¬i:"..GetName().."Dïng con bµi ®Æc biÖt ®æi"..mah_jong[goods_id - start_seq[1][1] +1].."ThÊt b¹i!")
			end
		end
	end
end
--*************************Âé½«½±Àø°ü»»È¡½±Àø************************
function mah_jong_prize(prize_diff)
	--ÎïÆ·ÅĞ¶Ï
	if GetItemCount(2,0,Tb_mah_jong_bag_prize[prize_diff][2]) == 0 then	
		Talk(1,"","<color=green>Nh¾c nhë<color>: Xin x¸c nhËn trong hµnh trang cã<color=yellow>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>!")
		return
	end
	--¸ºÖØºÍ¿Õ¼äÅĞ¶Ï
	if Zgc_pub_goods_add_chk(Tb_mah_jong_bag_prize[prize_diff][3],Tb_mah_jong_bag_prize[prize_diff][4]) ~= 1 then
		return
	end
	--É¾³ıÎïÆ·³É¹¦ÅĞ¶Ï
	if DelItem(2,0,Tb_mah_jong_bag_prize[prize_diff][2],1) ~= 1 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: Xin x¸c nhËn trong hµnh trang cã<color=yellow>"..Tb_mah_jong_bag_prize[prize_diff][1].."<color>!")
		return	
	end
	--Ôö¼ÓÉùÍû
	ModifyReputation(random(Tb_mah_jong_bag_prize[prize_diff][5],Tb_mah_jong_bag_prize[prize_diff][6]),0)
	--Ôö¼ÓÑ×µÛ×°
	local palyer_bady = GetBody()
	if random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][11] then
		local yandi_att_cap = {
			{0,103,8001},
			{0,103,8002},
			{0,103,8003},
			{0,103,8004},
		}
		local add_flag = AddItem(yandi_att_cap[palyer_bady][1],yandi_att_cap[palyer_bady][2],yandi_att_cap[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc Viªm §Õ Kh«i!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc Viªm §Õ Kh«i!")
			WriteLog("Ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc Viªm §Õ Kh«i!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng thªm Viªm §Õ Kh«i thÊt b¹i, kı hiÖu:"..add_flag)
		end
	elseif random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][12] then
		local yandi_att_cloth = {
			{0,100,8001},
			{0,100,8002},
			{0,100,8003},
			{0,100,8004},		
		}
		local add_flag = AddItem(yandi_att_cloth[palyer_bady][1],yandi_att_cloth[palyer_bady][2],yandi_att_cloth[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc Viªm §Õ Gi¸p!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc Viªm §Õ Gi¸p!")
			WriteLog("Ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc Viªm §Õ Gi¸p!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng thªm Viªm §Õ Gi¸p thÊt b¹i, kı hiÖu:"..add_flag)
		end
	elseif random(1,1000) <= Tb_mah_jong_bag_prize[prize_diff][13] and GetTask(mah_jong_prize_shoe) ~= 1 then
		local yandi_att_shoe = {
			{0,101,8001},
			{0,101,8002},
			{0,101,8003},
			{0,101,8004},
		}
		local add_flag = AddItem(yandi_att_shoe[palyer_bady][1],yandi_att_shoe[palyer_bady][2],yandi_att_shoe[palyer_bady][3],1,1,-1,-1,-1,-1,-1,-1)
		if add_flag == 1 then
			SetTask(mah_jong_prize_shoe,1)
			Msg2Player("Chóc mõng b¹n nhËn ®­îc Viªm §Õ Trang!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc Viªm §Õ Trang!")
			WriteLog("Ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc Viªm §Õ Trang!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng thªm Viªm §Õ Trang thÊt b¹i, kı hiÖu:"..add_flag)
		end
	end
	--´ó½³Ê¦ÊÖÊé
	AddItem(2,0,397,Tb_mah_jong_bag_prize[prize_diff][7])
	--Å©É£¼­Òª
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][10] then
		local add_flag = AddItem(2,1,1056,1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc N«ng Tang phæ!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc N«ng Tang phæ!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng thªm N«ng Tang phæ thÊt b¹i, kı hiÖu:"..add_flag)
		end	
	end
	--Ê¦ÃÅÎäÆ÷ËéÆ¬
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][14] then
		local add_ran_num = random(1,Tb_mah_jong_bag_prize[prize_diff][15])
		local add_flag = AddItem(2,1,1086,add_ran_num)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc "..add_ran_num.." B¶n vÏ ®óc t¹o thÇn khİ!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc "..add_ran_num.." B¶n vÏ ®óc t¹o thÇn khİ!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng"..add_ran_num.." B¶n vÏ ®óc t¹o thÇn khİ  thÊt b¹i, kı hiÖu:"..add_flag)
		end
	end
	--´ò°üÔÉÌú
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][16] then
		local add_flag = AddItem(2,1,1050,1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc Gãi Thiªn Th¹ch!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc gãi Thiªn Th¹ch!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng Gãi Thiªn Th¹ch thÊt b¹i, kı hiÖu:"..add_flag)
		end
	end
	--ÂÜ²·ÀñºĞ
	AddItem(2,1,Tb_mah_jong_bag_prize[prize_diff][17],Tb_mah_jong_bag_prize[prize_diff][18])
	--´«ĞÅÑÌ»ğ
	if Tb_mah_jong_bag_prize[prize_diff][19] ~= 0 then
		AddItem(2,1,203,Tb_mah_jong_bag_prize[prize_diff][19])
	end
	--Ìú±¦Ïä
	if random(1,100) <= Tb_mah_jong_bag_prize[prize_diff][20] then
		local add_flag = AddItem(2,0,606,1)
		if add_flag == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc R­¬ng s¾t NguyÖt L­îng Thè!")
			Msg2SubWorld("Chóc mõng ng­êi ch¬i:"..GetName().."sö dông"..Tb_mah_jong_bag_prize[prize_diff][1].."NhËn ®­îc R­¬ng s¾t NguyÖt L­îng Thè!")
		else
			WriteLog("Ho¹t ®éng 1/5: Ng­êi ch¬i "..GetName().."T¨ng thªm R­¬ng s¾t NguyÖt L­îng Thè thÊt b¹i, kı hiÖu:"..add_flag)
		end
	end
	--Ôö¼Ó76¼¶Î´¿ª·æÎäÆ÷
	mah_jong_bag_prize_weapon(Tb_mah_jong_bag_prize[prize_diff][8])
end
--**********************Î´¿ª·æµÄÎäÆ÷Ôö¼Ó**************************
function mah_jong_bag_prize_weapon(num)
	for i = 1,num do
		local weapon_id =random(375,(375+11))
		local add_flag = AddItem(2,1,weapon_id,1)
		if add_flag ~= 1 then
			WriteLog("Ho¹t ®éng 1/5/2007: Ng­êi ch¬i:"..GetName().."t¨ng vò khİ ["..weapon_id.."] thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag)
		end
	end
	Msg2Player("Chóc mõng b¹n nhËn ®­îc "..num.."Vò khİ ch­a kİch ho¹t")
	return
end
--************************¶ÄÏÀÎå½±°ü½±Àø******************************
function mah_jong_przie_5()
	--ÎïÆ·Ğ¯´ø¼ì²â
	if GetItemCount(2,1,1112) == 0 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: H·y x¸c nhËn b¹n cã mang theo <color=yellow>§æ HiÖp ngò th­ëng bao<color>!")
		return
	end
	--°ü¹ü¸ºÖØ¿Õ¼ä¼ì²â
	if Zgc_pub_goods_add_chk(5,100) ~= 1 then
		return
	end
	--ÎïÆ·É¾³ı¼ì²â
	if DelItem(2,1,1112,1) ~= 1 then
		Talk(1,"","<color=green>Nh¾c nhë<color>: H·y x¸c nhËn b¹n cã mang theo <color=yellow>§æ HiÖp ngò th­ëng bao<color>!")
		return
	end
--½±ÀøÔö¼Ó
	--Ôö¼Ó½ğ±Ò
	Earn(200000)
	--Ôö¼ÓÂÜ²·Ğ¡ÀñºĞ
	if random(1,100) <= 50 then
		if AddItem(2,1,1094,1) == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc Hép quµ cñ c¶i nhá!")
		end
	end
	--Ôö¼Ó´ó½³Ê¦ÊÖÊé
	if random(1,100) <= 5 then
		if AddItem(2,0,397,1) == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc §¹i t­îng s­ thñ th­")
		end
	end
	--Ôö¼Ó´ò°üµÄÔÉÌúËéÆ¬»òºÍÊÏèµ
	if random(1,100) == 1 then
		if AddItem(2,1,1049,1) == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îc Gãi m¶nh Thiªn Th¹ch!")
			Msg2SubWorld("Ng­êi ch¬i:"..GetName().."d­íi ®©y lµ danh s¸ch hå bµi, b¹n muèn biÕt ph­¬ng ph¸p hå bµi nµo?")
		end	
	elseif random(1,1000) <= 5 then
		if AddItem(2,1,1001,1) == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îcHßa ThŞ Bİch!")
			Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Sö dông §æ HiÖp ngò th­ëng bao nhËn ®­îc 1 Hßa ThŞ Bİch!")
		end		
	end
	--Ôö¼Ó²Ø½£×°±¸
	if random(1,1000) <= 1 then
		if AddItem(2,1,random(1059,1063),1) == 1 then
			Msg2Player("Chóc mõng b¹n nhËn ®­îcTói trang bŞ Tµng KiÕm!")
			Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Sö dông §æ HiÖp ngò th­ëng bao nhËn ®­îc 1 tói trang bŞ Tµng KiÕm!")
		end
	end
end
