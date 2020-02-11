--******************************************************
--********************½ğÉ½Èí¼ş½£Íø2½Å±¾*****************
--¹¦ÄÜ£º2006ÖØÑô»î¶¯
--¿ª·¢ÈËÔ±£ºÕÔ¹ó´º
--¿ª·¢Ê±¼ä£º2006-10-12
--******************************************************
prize_table = {
	{"Hoµng Cóc",546,"R­îu hoa cóc",549,"ñ r­îu","b×nh"},
	{"Tö Cóc",547,"B¸nh hoa cóc",550," chÕ thµnh "," phÇn"},
	{"Thï du",548,"Bã thï du",551," chÕ thµnh ","Thóc"},
}
change_num = 9			--¶Ò»»ĞèÒªµÄÔ­ÁÏÊıÁ¿
map_id_min = 969
map_id_max = 971
use_att_Y = 2954
exp_num_1 = 500000
exp_num_2 = 200000
healthy_exp_need = 500000
prize_use_start_time = 13447
prize_use_end_time = 13463

function main()
	local palyer_sex = "§¹i hiÖp"
	if GetSex() == 2 then
		palyer_sex = "N÷ hiÖp "
	end
	if GetLevel() < 11 then
		Say("VŞ "..palyer_sex.."NÕu muèn x­ng b¸ vâ l©m th× cÇn ph¶i rÌn luyÖn thªm.",
		1,
		"Ta biÕt råi/end_dialog")
		return
	end
	local plant_talble = {
	{"Hoµng Cóc",546},
	{"Tö Cóc",547},
	{"Thï du",548},	
	}
	local npc_index = GetTargetNpc()
	if npc_index == 0 then
		return
	end
	
	local num_save = GetUnitCurStates(npc_index,2)
	if num_save == 0 then
		return
	else
		AddUnitStates(npc_index,2,( - num_save))
	end
	if GetFreeItemRoom() < 1 or (GetMaxItemWeight() - GetCurItemWeight()) < 1 then
		Msg2Player("Kho¶ng trèng trong hµnh trang hoÆc søc lùc cña b¹n kh«ng ®ñ, xin kiÓm tra l¹i!")
		AddUnitStates(npc_index,2,1)
		return
	end
	local npc_name = GetNpcName(npc_index)
	for i = 1,getn(plant_talble) do
		if npc_name == plant_talble[i][1] then
			SetNpcLifeTime(npc_index,0)
			local add_flag = AddItem(2,0,plant_talble[i][2],1)
			if add_flag == 0 then
				WriteLog("Ho¹t ®éng Trïng Cöu:"..npc_name.."Thªm thÊt b¹i, kı hiÖu:"..add_flag)
			end
		end
	end	
end
function OnUse(id)
	local palyer_sex = "§¹i hiÖp"
	if GetSex() == 2 then
		palyer_sex = "N÷ hiÖp "
	end
	if GetLevel() < 11 then
		Say("VŞ "..palyer_sex.."NÕu muèn x­ng b¸ vâ l©m th× cÇn ph¶i rÌn luyÖn thªm.",
		1,
		"Ta biÕt råi/end_dialog")
		return
	end
	if prze_use_date_chk() == 0 then
		Say("Ho¹t ®éng ®· kÕt thóc! Xem chi tiÕt trªn trang chñ!",
		1,
		"Ta biÕt råi/end_dialog")
		return
	end
	--³õÊ¼±äÁ¿¶¨Òå
	local goods_ID = GetItemParticular(id)
	--Ö÷Âß¼­
	if goods_ID >= prize_table[1][2] and goods_ID <= prize_table[3][2] then					--ÅĞ¶ÏÍæ¼ÒÊ¹ÓÃµÄÊÇÊ²Ã´µÀ¾ß
		for i = 1, getn(prize_table) do
			if goods_ID == prize_table[i][2] then			--ÕÒµ½¶ÔÓ¦µÀ¾ß£¬Ôö¼Ó¶ÔÓ¦ÎïÆ·
				if GetItemCount(2,0,prize_table[i][2]) < change_num then
					Say(change_num.."§ãa"..prize_table[i][1].." míi cã thÓ "..prize_table[i][5].."mét"..prize_table[i][6]..prize_table[i][3]..". Trªn ng­êi b¹n h×nh nh­ kh«ng ®ñ"..prize_table[i][1].." H×nh nh­ kh«ng ®ñ!",
					1,
					"Ta biÕt råi/end_dialog"
					)
				else
					Say("B¹n ®ång ı dïng"..change_num.."§ãa"..prize_table[i][1]..prize_table[i][5].."mét"..prize_table[i][6]..prize_table[i][3].."?",
					2,
					"ChÕ t¸c /#plant_use("..i..")",
					"§Ó ta nghÜ l¹i/end_dialog"
					)
				end
			end
		end
	elseif goods_ID >= prize_table[1][4] and goods_ID <= prize_table[3][4] then
		local map_ID,att_X,att_Y = GetWorldPos()
		if map_ID < map_id_min or map_ID > map_id_max then
			Say("Trªn ®Ønh Hoa s¬n míi sö dông ®­îc vËt phÈm nµy. B¹n cã thÓ ®Õn gÆp Vâ L©m Minh truyÒn nh©n ®­a ®i!",
			1,
			"Ta biÕt råi/end_dialog")
			return
		elseif att_Y >= use_att_Y  then
			Say("Lªn tíi ®Ønh míi sö dông vËt phÈm nµy!",
			1,
			"Ta biÕt råi/end_dialog")
			return
		end
		if GetTask(962) >= 42 then
			Say("Xin lçi! Tæng sè phÇn th­ëng b¹n nhËn ®­îc ®· qu¸ 42 lÇn, mêi b¹n tham gia ho¹t ®ång lÇn sau!",
			    1,
				"Ta biÕt råi/end_dialog")
			return			
		end	
		if GetTask(960) >= 6 and GetTask(961) >= day_num_return() then
			Say("Xin lçi! Sè phÇn th­ëng h«m nay ®· qu¸ 6 lÇn, ngµy mai h·y quay l¹i!",
			    1,
				"Ta biÕt råi/end_dialog")
			return			
		end
		for i = 1 ,getn(prize_table) do
			if goods_ID == prize_table[i][4] then			--ÕÒµ½¶ÔÓ¦µÀ¾ß£¬Ôö¼Ó¶ÔÓ¦ÎïÆ·
				Say(" B¹n ®ång ı dïng "..prize_table[i][3].."?",
					2,
					"§ång ı dïng/#Prize_use("..i..")",
					"§Ó ta nghÜ l¹i/end_dialog"
				)
			end
		end
	end
end
--*******************************¶Ò»»½±Àøº¯Êı**********************************
function plant_use(goods_seq)
	if GetFreeItemRoom() < 1 then
		Say("Kho¶ng trèng hµnh trang kh«ng ®ñ, xin xem l¹i!",
		    1,
			"Ta biÕt råi/end_dialog")
		return		
	end
	if GetItemCount(2,0,prize_table[goods_seq][2]) < change_num then
		Msg2Player("Xin x¸c nhËn hµnh trang ®ñ vËt phÈm ®Ó ®æi th­ëng!")
		return
	end
	local deal_flag = DelItem(2,0,prize_table[goods_seq][2],change_num)
	if deal_flag == 0 then
		Msg2Player("Xin x¸c nhËn hµnh trang ®ñ vËt phÈm ®Ó ®æi th­ëng!")
	else
		local add_flag = AddItem(2,0,prize_table[goods_seq][4],1)
		if add_flag ~= 0 then
			Msg2Player("Chóc mõng b¹n dïng "..change_num.."§ãa"..prize_table[goods_seq][1]..prize_table[goods_seq][5].."®· dïng 1 "..prize_table[goods_seq][6]..prize_table[goods_seq][3].."!")
		else
			WriteLog ("Ng­êi ch¬i:"..GetName().."T¨ng"..prize_table[goods_seq][3].." thÊt b¹i, trŞ quay vÒ:"..add_flag..".")
		end
	end
end
--*******************************Ê¹ÓÃ½±Àøº¯Êı**********************************
function Prize_use(goods_seq)
	if goods_seq == 1 then
		local healthy_exp = GetGoldenExp() 							--»ñÈ¡Íæ¼Ò½¡¿µ¾­Ñé
		if healthy_exp == 0 then
			Say("HiÖn b¹n kh«ng cã ®iÓm søc kháe kh«ng thÓ dïng r­îu hoa cóc!",
			1,
			"Ta biÕt råi/end_dialog")
		elseif healthy_exp < exp_num_1 then
			Say("§iÓm søc kháe cña b¹n lµ:"..healthy_exp..", kh«ng ®ñ 50 v¹n, b¹n muèn ®æi ®iÓm søc kháe lÊy kinh nghiÖm kh«ng?",
			2,
			"Ta muèn ®æi ®iÓm søc kháe thµnh kinh nghiÖm/#exp_change(1)",
			"§Ó khi kh¸c/end_dialog")
		else
			exp_change(1)
		end
	elseif goods_seq == 2 or goods_seq == 3 then
		if goods_seq == 2 then
			local healthy_exp = GetGoldenExp() 							--»ñÈ¡Íæ¼Ò½¡¿µ¾­Ñé
			if healthy_exp == 0 then
				Say("HiÖn b¹n kh«ng cã ®iÓm søc kháe kh«ng thÓ dïng b¸nh hoa cóc!",
				1,
				"Ta biÕt råi/end_dialog")
			elseif healthy_exp < exp_num_2 then
				Say("§iÓm søc kháe cña b¹n lµ:"..healthy_exp..", kh«ng ®ñ 20 v¹n, b¹n muèn ®æi ®iÓm søc kháe lÊy kinh nghiÖm kh«ng?",
				2,
				"Ta muèn ®æi ®iÓm søc kháe thµnh kinh nghiÖm/#exp_change(2)",
				"§Ó khi kh¸c/end_dialog")
			else
				exp_change(2)
			end
		elseif goods_seq == 3 then
			local del_flag = DelItem(2,0,prize_table[3][4],1)
			if del_flag == 1 then
				ModifyGoldenExp(healthy_exp_need)
				Msg2Player("B¹n ®· sö dông "..prize_table[goods_seq][3]..", nhËn ®­îc 50 v¹n ®iÓm søc kháe!")
				use_times_save()
				prize_end_dialog()
			else
				Msg2Player("Xin x¸c nhËn hµnh trang cßn "..prize_table[goods_seq][4].."!")
			end
		end
	end
end
--****************************½¡¿µ¾­Ñé×ª»»Îª¾­Ñé***********************************
function exp_change(change_flag)											--½¡¿µ¾­Ñé×ªÎª¾­Ñé
	local healthy_exp = GetGoldenExp() 										--»ñÈ¡Íæ¼Ò½¡¿µ¾­Ñé
	local del_flag = DelItem(2,0,prize_table[change_flag][4],1)
	if del_flag == 1 and change_flag == 1 then
		if healthy_exp >= exp_num_1 then
			ModifyGoldenExp(-exp_num_1)
			ModifyExp(exp_num_1)
			Msg2Player("B¹n sö dông "..prize_table[change_flag][3]..", ®em"..exp_num_1.."®iÓm søc kháe ®æi"..exp_num_1.." ®iÓm kinh nghiÖm!")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("B¹n sö dông "..prize_table[change_flag][3]..", ®em"..healthy_exp.."®iÓm søc kháe ®æi"..healthy_exp.." ®iÓm kinh nghiÖm!")
		end
		use_times_save()
		prize_end_dialog()
	elseif del_flag == 1 and change_flag == 2 then
		if healthy_exp >= exp_num_2 then
			ModifyGoldenExp(-exp_num_2)
			ModifyExp(exp_num_2)
			Msg2Player("B¹n sö dông "..prize_table[change_flag][3]..", ®em"..exp_num_2.."®iÓm søc kháe ®æi"..exp_num_2.." ®iÓm kinh nghiÖm!")
		else
			ModifyGoldenExp(-healthy_exp)
			ModifyExp(healthy_exp)
			Msg2Player("B¹n sö dông "..prize_table[change_flag][3]..", ®em"..healthy_exp.."®iÓm søc kháe ®æi"..healthy_exp.." ®iÓm kinh nghiÖm!")
		end
		ModifyReputation(10,0)
		Msg2Player("B¹n sö dông "..prize_table[change_flag][3].."nhËn ®­îc 10 ®iÓm danh väng!")
		use_times_save()
		prize_end_dialog()
	else
		Msg2Player("Xin x¸c nhËn hµnh trang cßn "..plant_talble[1][4].."!")
	end
end
--**********************************Ê¹ÓÃÊ±¼äÅĞ¶Ï**********************************
function prze_use_date_chk()
	if day_num_return() < prize_use_start_time or day_num_return() > prize_use_end_time then
		return 0 
	else
		return 1
	end
end
--**********************************Ê¹ÓÃ´ÎÊı¼ÇÂ¼**********************************
function use_times_save()
	local use_times = GetTask(960)
	local use_date_seq = GetTask(961)
	local use_time_total = GetTask(962)
	if use_date_seq == day_num_return() then
		SetTask(960,use_times + 1)
	else
		SetTask(961,day_num_return())
		SetTask(960,1)
	end
	SetTask(962,use_time_total + 1)
end
--*******************************Ê¹ÓÃ´ÎÊıÌáÊ¾************************************
function prize_end_dialog()
	local use_times = GetTask(960)
	local use_num_today = 6 - use_times
	local use_num_total = GetTask(962)
	if use_times < 6 and use_num_total < 42 then
		Msg2Player("H«m nay lÇn thø "..use_times.."b¹n nhËn ®­îc phÇn th­ëng, cßn"..use_num_today.."lÇn c¬ héi nhËn th­ëng. §©y lµ lÇn tİch lòy thø"..use_num_total.." lÇn ®æi phÇn th­ëng, cßn ®æi ®­îc"..(42-use_num_total).." lÇn.")
	elseif use_times == 6 and use_num_total < 42 then
		Msg2Player("H«m nµy b¹n ®· nhËn th­ëng 6 lÇn cho phĞp, ngµy mai h·y quay l¹i! §©y lµ lÇn tİch lòy thø"..use_num_total.." lÇn ®æi phÇn th­ëng, cßn ®æi ®­îc"..(42-use_num_total).." lÇn.")
	elseif use_num_total == 42 then
		Msg2Player("B¹n ®· ®æi 42 phÇn th­ëng kh«ng thÓ tiÕp tôc ®æi, mêi tham gia ho¹t ®éng lÇn sau!")
	end
end
function end_dialog()
end
--**************************ÂÖ´Î¼ÆËãº¯Êı******************************************
function day_num_return()
	local times_return = floor((GetTime() - 57600)/(86400))
	return times_return
end
