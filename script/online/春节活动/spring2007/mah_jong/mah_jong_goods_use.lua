--2007Äê´º½Ú»î¶¯-Âé½«ÊÕ¼¯»î¶¯-ÎïÆ·Ê¹ÓÃº¯Êı
--´úÂë¿ª·¢ÈË£ºÕÔ¹ó´º
--´úÂë¿ª·¢Ê±¼ä£º2007-01-24
--´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online\\zgc_public_fun.lua")		--´å³¤µÄ¹«¹²º¯Êı
--==========================¹«¹²±äÁ¿¶¨ÒåÇøÓò=============================
	--Í²ÆğÊ¼IDÎª£º590
	circle_start_id = 630
	--ÌõÆğÊ¼IDÎª£º599
	bamboo_start_id = 639
	--ÍòÆğÊ¼IDÎª£º608
	ten_kilo_start_id = 648
	--×ÖÆğÊ¼IDÎª£º617
	char_start_id = 657
	--ÌØÊâÂé½«ID£º624
	special_mah_jong_id = 664
	--Âé½«°ü
	mah_jong_bag = {{665,8,"Tói M¹c Ch­îc (tiÓu)"},{666,14,"Tói M¹c Ch­îc (®¹i)"}} --ID£¬ÕÅÊı
	--Âé½«»î¶¯½±Àø°ü
	mah_jong_prize_bag = {{667,200,"Con bµi ®em c­îc"},{668,200,"Con bµi 2 ®em c­îc"},{669,200,"Con bµi 3 ®em c­îc"},{670,200,"Con bµi 4 ®em c­îc"}}
	--ËùÓĞÂé½«³õÊ¼»¯
	mah_jong = {
			"NhÊt ®ång","NhŞ ®ång","Tam ®ång","Tø ®ång","Ngò ®ång","Lôc ®ång","ThÊt ®ång","B¸t ®ång","Cöu ®ång",
			"Mét","NhŞ ®iÒu","Ba","Bèn","Ngò ®iÒu","Lôc ®iÒu","ThÊt ®iÒu","B¸t ®iÒu","Cöu ®iÒu",
			"NhÊt v¹n","NhŞ v¹n","Tam v¹n","Tø v¹n","Ngò v¹n","Lôc v¹n","ThÊt v¹n","B¸t v¹n","Cöu v¹n",
			"§«ng phong","Nam phong","T©y phong","B¾c phong","Hång trung","ph¸t tµi","B¹ch ban"}
	--Âé½«ºÍ·¨¶¨Òå
--==============================Ö÷Âß¼­ÇøÓò===============================
function OnUse(goods_index)
	if Zgc_pub_action_level_chk() == 0 then
		return
	end
	if spring_2007_date_chk() ~= 1 then
		Talk(1,"end_dialog","VËt phÈm nµy chØ cã thÓ sö dông vµo ho¹t ®éng n¨m míi!")
		return
	end
	local goods_id = GetItemParticular(goods_index)
	--µ¥¸öÂé½«»»È¡½±Àø
	if goods_id >= circle_start_id and goods_id <= (circle_start_id + 33) then
		Say("Ng­¬i cã muèn ®æi phÇn th­ëng kh«ng?",
		2,
		"Ta muèn ®æi phÇn th­ëng/#single_mahj_pri("..goods_id..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
		return
	--Âé½«°ü¶Ò»»½±Àø
	elseif goods_id == mah_jong_bag[1][1] or goods_id == mah_jong_bag[2][1] then
		local bag_diff = (goods_id + 1) - mah_jong_bag[1][1]
		Say("B¹n muèn sö dông: <color=green>".. mah_jong_bag[bag_diff][3].."<color> ®æi <color=green>".. mah_jong_bag[bag_diff][2].."<color> M¹c ch­îc ­?",
		2,
		"§æi/#mah_jong_bag_chg("..bag_diff..")",
		"§Ó ta suy nghÜ l¹i/end_dialog")
	elseif goods_id >= mah_jong_prize_bag[1][1] and goods_id <= mah_jong_prize_bag[4][1] then  	--Âé½«½±Àø°ü»»È¡½±Àø
		local prize_diff = (goods_id + 1) - mah_jong_prize_bag[1][1]
		Say("B¹n x¸c nhËn dïng: <color=green>"..mah_jong_prize_bag[prize_diff][3].."<color> ®æi phÇn th­ëng ­?",
			2,
			"Ta cÇn ®æi phÇn th­ëng/#mah_jong_prize("..goods_id..")",
			"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	elseif goods_id == special_mah_jong_id then
		Say("B¹n cÇn ®æi l¸ bµi nµo?",
			5,
			"Ta muèn ®æi thµnh (§ång)/#mah_jong_chg(1)",
			"Ta muèn ®æi thµnh (§iÒu)/#mah_jong_chg(2)",
			"Ta muèn ®æi thµnh (V¹n)/#mah_jong_chg(3)",
			"Ta muèn ®æi thµnh (Ch÷)/#mah_jong_chg(4)",
			"§Ó ta suy nghÜ l¹i/end_dialog"
		)
	end
	
end
--**************************µ¥¸öÂé½«»»È¡½±Àø************************
function single_mahj_pri(goods_id)
	local chg_num_remain = spring_2007_mahj_num_chk(3)
	if chg_num_remain == -1 then
		return
	end
	local mah_jong_diff = goods_id - circle_start_id + 1
	if GetItemCount(2,0,goods_id) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn trong tói hµnh lang cña b¹n cã <color=green>"..mah_jong[mah_jong_diff].."<color>TÊm bµi nµy!")
		return
	end
	if DelItem(2,0,goods_id,1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn trong tói hµnh lang cña b¹n cã <color=green>"..mah_jong[mah_jong_diff].."<color>TÊm bµi nµy!")
		return
	else
		local num = GetLevel()
		num = (num * num) * 12
		ModifyExp(num)
		SetTask(997,(GetTask(997)+1))
		Msg2Player("Xin chóc mõng"..mah_jong[mah_jong_diff].."®æi "..num.." ®iÓm kinh nghiÖm!")
		if chg_num_remain == 1 then
			Talk(1,"","<color=green>Nh¾c nhì<color>: H«m nay ®©y lµ <color=red>lÇn cuèi cïng<color> b¹n cã thÓ ®æi phÇn th­ëng")
			return
		else
			Talk(1,"","<color=green>Nh¾c nhì<color>: B¹n cã thÓ sö dông tÊm bµi nµy ®Ó ®æi phÇn th­ëng<color=green>"..(chg_num_remain-1).."<color> lÇn!")
			return
		end
	end
end
--***************************Âé½«°ü»»Âé½«********************************
function mah_jong_bag_chg(bag_diff)
	if Zgc_pub_goods_add_chk(mah_jong_bag[bag_diff][2],mah_jong_bag[bag_diff][2]) ~= 1 then
		return
	else
		if GetItemCount(2,0,mah_jong_bag[bag_diff][1]) == 0 then
			Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
			return
		end
		if DelItem(2,0,mah_jong_bag[bag_diff][1],1) ~= 1 then
			Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã: <color=green>"..mah_jong_bag[bag_diff][3].."<color>!")
			return
		else
			local fail_num = 0
			for j = 1,mah_jong_bag[bag_diff][2] do
				local add_flag = AddItem(2,0,random(circle_start_id,(char_start_id+6)),1)
				if add_flag ~= 1 then
					fail_num = fail_num + 1
				end
			end
			if fail_num ~= 0 then
				WriteLog ("Ng­êi ch¬i:"..GetName().."§æi con bµi thÊt b¹i"..fail_num.." con bµi nµy!")
			end
		end
	end
end
--**************************ÌØÊâÂé½«»»È¡¶Ô»°*****************************
function mah_jong_chg(mah_jong_diff)
	local mah_jong_id = {{circle_start_id,9,1},{bamboo_start_id,9,10},{ten_kilo_start_id,9,19},{char_start_id,7,28}}
	local mah_jong_chg_dia = {}
	for i = 1, mah_jong_id[mah_jong_diff][2] do
		mah_jong_chg_dia[i]="Ta cÇn ®æi ("..mah_jong[(mah_jong_id[mah_jong_diff][3]-1)+i]..")/#mah_jong_add("..(mah_jong_id[mah_jong_diff][1] - 1 + i)..")"
	end
	mah_jong_chg_dia[mah_jong_id[mah_jong_diff][2] + 1] = "§Ó ta suy nghÜ l¹i/end_dialog"
	Say("Xin chän con bµi cÇn ®æi.",
		getn(mah_jong_chg_dia),
		mah_jong_chg_dia
	)	
end
--***************************ÌØÊâÂé½«»»È¡****************************
function mah_jong_add(goods_id)
	if GetItemCount(2,0,special_mah_jong_id) == 0 then
		Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã con bµi ®Æc biÖt!")
		return
	else
		if Zgc_pub_goods_add_chk(1,1) ~= 1 then			--¸ºÖØÅĞ¶Ï
			return
		end
		if DelItem(2,0,special_mah_jong_id,1) ~= 1 then	--É¾³ıÌØÊâÂé½«³É¹¦ÅĞ¶Ï
			Talk(1,"end_dialog","Xin x¸c nhËn trong hµnh trang cña b¹n cã con bµi ®Æc biÖt!")
			return
		else
			local add_flag = AddItem(2,0,goods_id,1)
			if add_flag == 1 then
				Msg2Player("B¹n dïng con bµi ®Æc biÖt ®æi mét tÊm"..mah_jong[goods_id - circle_start_id +1].."!")
			else
				WriteLog ("Ng­êi ch¬i:"..GetName().."Dïng con bµi ®Æc biÖt ®æi"..mah_jong[goods_id - circle_start_id +1].."ThÊt b¹i!")
			end
		end
	end
end
--*************************Âé½«½±Àø°ü»»È¡½±Àø************************
function mah_jong_prize(goods_id)
	local big_prize_diff = goods_id - mah_jong_prize_bag[1][1] + 1
	local bag_prize_inf = {
   --¾­Ñé°Ù·Ö±È--½ğÇ®----ÉùÍûÏÂÏŞ-ÉÏÏŞ-----ÎäÆ÷ÏÂÏŞ-ÉÏÏŞ--¸ºÖØÒªÇó--¿Õ¼äÒªÇó
		{3,	700000,300,	500,	4,	6,	500,	8},
		{2,	600000,100,	200,	4,	6,	500,	8},
		{1,	500000,50,	100,	1,	3,	300,	5},
		{1,1,1,1,1,1,50,5}
	}
	local weapon_nokaifeng_id = 375
	--ÎïÆ·ÅĞ¶Ï
	if GetItemCount(2,0,goods_id) == 0 then	
		Talk(1,"","Xin x¸c nhËn trong hµnh trang cña b¹n cã"..mah_jong_prize_bag[big_prize_diff][3].."!")
		return
	end
	--¸ºÖØºÍ¿Õ¼äÅĞ¶Ï
	if Zgc_pub_goods_add_chk(bag_prize_inf[big_prize_diff][8],bag_prize_inf[big_prize_diff][7]) ~= 1 then
		return
	end
	--É¾³ıÎïÆ·³É¹¦ÅĞ¶Ï
	if DelItem(2,0,goods_id,1) ~= 1 then
		Talk(1,"","Xin x¸c nhËn trong hµnh trang cña b¹n cã"..mah_jong_prize_bag[big_prize_diff][3].."!")
		return	
	end
	--½±ÀøÌí¼Ó£¨ÏÈÌí¼ÓÇá¸ºÖØ¡¢¹óÖØÎïÆ·£©
	if big_prize_diff <= 3 then
		--¼Ó¾­Ñé
		local add_num = floor(Zgc_pub_player_uplevel_num_rtn(1) * bag_prize_inf[big_prize_diff][1] /100)
		ModifyExp(add_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..add_num.." ®iÓm kinh nghiÖm!")
		--¼ÓÇ®
		Earn(bag_prize_inf[big_prize_diff][2])
		--¼ÓÉùÍû
		add_num = random(bag_prize_inf[big_prize_diff][3],bag_prize_inf[big_prize_diff][4])
		ModifyReputation(add_num,0)
		--¼ÓÌØÊâ×°±¸
		add_num = random(1,100)
		if big_prize_diff == 1 then
			--Ò»½±°ü
			if add_num <= 5 then				--è­è²Ö®ĞÇ
				 local add_flag = AddItem(10,2,44,1)
				 if add_flag == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc Th«i X¸n Tinh!")
					Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Dïng Con bµi 1®em c­îc nhËn ®­îc Th«i X¸n Tinh!")
				 else
					WriteLog("Ho¹t ®éng thu thËp con bµi: Ng­êi ch¬i:"..GetName().."T¨ng [Th«i X¸n Tinh] thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag)
				 end
			elseif add_num <= 10 then		--ÎŞĞĞÃØ¼®
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc ngò hµnh mËt tŞch!")
					Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Dïng Con bµi 1 ®em c­îc nhËn ®­îc MËt tŞch ngò hµnh!")
				else
					WriteLog("Ho¹t ®éng thu thËp con bµi: Ng­êi ch¬i:"..GetName().."T¨ng [MËt tŞch ngò hµnh] thÊt b¹i, täa ®é thÊt b¹i:"..add_flag)
				end
			elseif add_num <= 15 then		--Ëæ»úÊ¦ÃÅÃØ¼®
				mah_jong_bag_prize_book()
			end
		elseif big_prize_diff == 2 then	--¶ş½±°ü
			if add_num <= 5 then
				local add_flag = AddItem(0,107,155,1)
				if add_flag == 1 then
					Msg2Player("Chóc mõng b¹n nhËn ®­îc ngò hµnh mËt tŞch!")
					Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Dïng Con bµi 2 ®em c­îc ®æi ®­îc MËt tŞch ngò hµnh!")
				else
					WriteLog("Ho¹t ®éng thu thËp con bµi: Ng­êi ch¬i:"..GetName().."T¨ng [MËt tŞch ngò hµnh] thÊt b¹i, täa ®é thÊt b¹i:"..add_flag)
				end
			elseif add_num <= 13 then
				mah_jong_bag_prize_book(big_prize_diff)
			end
		elseif big_prize_diff == 3 then	--3½±°ü
			if add_num <= 10 then
				mah_jong_bag_prize_book(big_prize_diff)
			end
		end
		--Î´¿ª·æÎäÆ÷Ôö¼Ó
		local weapon_num = random(bag_prize_inf[big_prize_diff][5],bag_prize_inf[big_prize_diff][6])
		mah_jong_bag_prize_weapon(weapon_num)
	else
		--¼Ó¾­Ñé
		local add_num = floor(Zgc_pub_player_uplevel_num_rtn(1)/100)
		ModifyExp(add_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..add_num.." ®iÓm kinh nghiÖm!")
		--¼ÓÇ®
		Earn(200000)
		--¼Ó²ÄÁÏ
		for i = 66,69 do
			add_num = random(5,10)
			AddItem(2,2,i,add_num)
		end
		--¼ÓÉùÍû
		add_num = random(20,50)
		ModifyReputation(add_num,0)
	end
	spring2007_spring_goods_add()
end
--**********************Ê¦ÃÅÃØ¼®Ôö¼Ó**************************
function mah_jong_bag_prize_book(prize_diff)
	local book_name = {"Kim Cang Phôc Ma kinh","TiÒm Long MËt tŞch","V« TrÇn MËt tŞch","Thiªn La MËt TŞch","Nh­ ı MËt TŞch","Bİch H¶i Phæ","Hçn §én MËt tŞch",
						"Quı Thiªn MËt tŞch","HuyÒn ¶nh MËt tŞch","Qu©n Tö MËt tŞch","TrÊn Qu©n MËt tŞch","Xuyªn V©n MËt tŞch","U Minh Quû Lôc","Linh Cæ MËt tŞch"}
	local book_seq = random(1,getn(book_name))
	local book_id = ((book_seq - 1) * 2) + 1
	local add_flag = AddItem(0,107,book_id,1)
	if add_flag == 1 then
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..book_name[book_seq].."!")
		Msg2SubWorld("Ng­êi ch¬i:"..GetName().."Sö dông bµi c­îc"..mah_jong_prize_bag[prize_diff][3].."NhËn ®­îc "..book_name[book_seq].."!")
	else
		WriteLog("Ho¹t ®éng thu thËp con bµi: Ng­êi ch¬i:"..GetName().."T¨ng"..book_name[book_seq].." thÊt b¹i, kı hiÖu:"..add_flag)
	end
	return
end
--**********************Î´¿ª·æµÄÎäÆ÷Ôö¼Ó**************************
function mah_jong_bag_prize_weapon(num)
	for i = 1,num do
		local weapon_id =random(375,(375+11))
		local add_flag = AddItem(2,1,weapon_id,1)
		if add_flag ~= 1 then
			WriteLog("Ho¹t ®éng thu thËp con bµi: Ng­êi ch¬i:"..GetName().."t¨ng vò khİ ["..weapon_id.."] thÊt b¹i, vŞ trİ thÊt b¹i:"..add_flag)
		end
	end
	Msg2Player("Chóc mõng b¹n nhËn ®­îc "..num.."Vò khİ ch­a kİch ho¹t")
	return
end
