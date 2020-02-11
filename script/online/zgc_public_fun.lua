---------------------------------------------------------
--´å³¤Ëµ£ºÎÒÏàĞÅ·²ÊÂ¶¼ÓĞ½â¾öµÄ°ì·¨
--²»ÄÜ½â¾öµÄÊÂÇéÖ»ÄÜÇóĞÄ¶øÒÑ¡£--2006-12-04
---------------------------------------------------------
--º¯ÊıÃû³Æ£ºÂÖ´Î·µ»Øº¯Êı
--¹¦       ÄÜ£º·µ»Øµ±Ç°µÄÂÖ´Î
function zgc_pub_day_turn(day_num)
	if day_num == nil then day_num = 1 end
	if day_num <= 0 then day_num = 1 end
	day_num = day_num or 1
	local time_return = floor((GetTime()-57600)/(86400 * day_num))
	return time_return
end
--º¯ÊıÃû³Æ£ºÈÕÆÚ·µ»Øº¯Êı
--º¯Êı¹¦ÄÜ£º·µ»Øµ±Ç°µÄÈÕÆÚ£¨Ìì£©
function zgc_pub_date_num()
	return tonumber(date("%Y%m%d"))
end
--º¯ÊıÃû³Æ£ºÎïÆ·Ìí¼Ó¼ì²éº¯Êı
--¹¦        ÄÜ£º¶Ôµ±Ç°Íæ¼Ò¿É·ñÕı³£Ìí¼ÓÎïÆ·½øĞĞ¼ì²â 
function Zgc_pub_goods_add_chk(goods_num,goods_weight)
		if GetFreeItemRoom() < goods_num then
			Talk (1,"end_dialog","<color=red>kho¶ng trèng<color> trong hµnh trang kh«ng ®ñ!")
			return 0
		elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
			Talk (1,"end_dialog","<color=red>Søc lùc<color> cña b¹n kh«ng ®ñ!")
			return 0
		else 
			return 1
		end
end
--¹¦ÄÜº¯Êı£ºÊı×Ö°´Î»·µ»Ø
--¹¦        ÄÜ£º½«Êı×Ö°´Î»·µ»Ø,Î»ÖÃ¼ÆËã£º......3<--2<--1<--
function Zgc_pub_num_apart(num,num_att)
	local num_return = 0
	local num_att = strlen(tostring(num)) - num_att + 1
	if num_att <= 0 or strlen(tostring(num)) < num_att then
		return 10
	else
		return tonumber(strsub(tostring(num),num_att,num_att))
	end
end
--º¯ÊıÃû³Æ£ºÊı×Ö´¦Àíº¯Êı 
--¹¦       ÄÜ£ºÀûÓÃÊı×ÖºÍ×Ö·û´®µÄ×ª»»½«Ä³Î»Êı×Ö´ÓÄ¸Êı¾İµÄ°şÀë,Î»ÖÃ¼ÆËã£º--> 1-->2-->3........
function Zgc_pub_num_peel(num,num_att)
	local num_return = 0
	local str_num = tostring(num)
	if num_att <= 0 or strlen(str_num) < num_att then
		return "erro"
	else
		if num_att ~= 1 and num_att ~= strlen(str_num) then
			num_return = strsub(str_num,1,num_att - 1)..strsub(str_num,num_att +1,strlen(str_num))
		elseif num_att == 1 then
			num_return = strsub(str_num,2,strlen(str_num))
		elseif num_att == strlen(str_num) then
			num_return = strsub(str_num,1,(strlen(str_num)-1))
		end
	end
	return tonumber(num_return)
end
--Ê±¼ä´¦Àíº¯Êı£¨1£©
function Zgc_pub_time_sec_change(sec_num,flag)
	--flag = 1 ±íÊ¾£º·µ»ØĞ¡Ê±¡¢·ÖÖÓºÍÃë
	--flag = 0 ±íÊ¾£ºÖ»·µ»Ø·ÖÖÓºÍÃë
	if sec_num <= 0 or (flag ~=0 and flag ~= 1) then
		return 0
	end
	local num_h = 0
	local num_m = 0
	local num_s = 0
	if flag == 0 then
		if sec_num > 3600 then
			num_h = floor(sec_num/3600)
			sec_num = sec_num - (num_h *3600)
		end
		if sec_num > 60 then
			num_m = floor(sec_num/60)
			sec_num = sec_num - (num_m * 60)
		end
		num_s = sec_num
	elseif flag == 1 then
		if sec_num > 60 then
			num_m = floor(sec_num/60)
			sec_num = sec_num - (num_m * 60)
		end
		num_s = sec_num
	end
	local dialog_rtn = ""
	if num_h ~= 0 then
		dialog_rtn = dialog_rtn..num_h.."h "
	end
	if num_m ~= 0 then
		dialog_rtn = dialog_rtn..num_m.." phót "
	end
	if num_s ~= 0 then
		dialog_rtn = dialog_rtn..num_s.." Gi©y "
	end
	return dialog_rtn
end
--º¯ÊıÃû³Æ£ºÖÜ¼¸¼ÆËãº¯Êı
--¹¦        ÄÜ£º·µ»Ø½ñÌìÊÇĞÇÆÚ¼¸
function Zgc_pub_week_day()
	local num_return = 0
	num_return = floor((GetTime() - 57600)/86400)
	num_return = num_return - (floor(num_return/7) * 7)
	if num_return >= 2 then
		num_return = num_return - 2
	else
		num_return = num_return + 5
	end
	return num_return
end
--º¯ÊıÃû³Æ£ºÖÜĞòÊı¼ÆËãº¯Êı
--º¯Êı¹¦ÄÜ£º·µ»ØÖÜµÄĞòÊı
function Zgc_pub_week_seq()
	return floor((zgc_pub_day_turn(1) - 2)/7)
end

--º¯ÊıÃû³Æ£ºNPCË÷ÒıÖµÉè¶¨
--¹¦        ÄÜ£ºÖ±½ÓÉè¶¨NPCË÷ÒıÎ»ÖÃµÄÖµ
function SetUnitCurStates(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end
--º¯ÊıÃû³Æ£º»ñµÃÍæ¼ÒĞÔÃû
--¹¦        ÄÜ£ºÅĞ¶ÏÎªÉÙÏÀ»¹ÊÇÅ®ÏÀ
function Zgc_pub_sex_name()
	local sex_name = ""
	if GetSex() == 1 then
		sex_name = "ThiÕu hiÖp"
	else
		sex_name = "N÷ hiÖp "
	end
	return sex_name
end
--º¯ÊıÃû³Æ£º»î¶¯µÈ¼¶ÅĞ¶Ï
--¹¦        ÄÜ£ºÅĞ¶ÏÍæ¼ÒµÈ¼¶ÊÇ·ñ´ïµ½11¼¶
function Zgc_pub_action_level_chk()
	local npc_name = GetNpcName(GetTaskTemp(164))
	if npc_name == "" then
		npc_name = "nh¾c nhë"
	end
	if GetLevel() < 11 then
		Talk(1,"end_dialog","<color=green>"..npc_name.."<color>: "..Zgc_pub_sex_name().."cÇn rÌn luyÖn thªm mét thêi gian!")
		SetTaskTemp(164,0)
		return 0
	else
		SetTaskTemp(164,0)
		return 1
	end
end
--º¯ÊıÃû³Æ£ºµØÍ¼Ãû³Æ·µ»Øº¯Êı
--¹¦        ÄÜ£º°ÑµØÍ¼IDºÍµØÍ¼Ãû³Æ½øĞĞÏà»¥×ª»»
function Zgc_pub_mapID_name_change(data_in,change_flag)
	--change_flagÎª1µÄÊ±ºòID->Ãû×Ö
	--change_flagÎª2µÄÊ±ºòÃû×Ö->ID
	local find_flag = 0
	for i = 1,getn(Zgc_pub_table_map_name) do
		if Zgc_pub_table_map_name[i][change_flag] == data_in then
			if change_flag == 1 then
				return Zgc_pub_table_map_name[i][2]
			elseif change_flag == 2 then
				return Zgc_pub_table_map_name[i][1]
			end
			find_flag = 1
			break
		end
	end
	if find_flag == 0 then
		return 0 
	end
end
--º¯ÊıÃû³Æ£ºµØÍ¼Ãû³Æ·µ»Øº¯Êı
--¹¦        ÄÜ£º°ÑµØÍ¼IDºÍµØÍ¼Ãû³Æ½øĞĞÏà»¥×ª»»
function Zgc_pub_money_name_change(money)
	if money == 0 then
		return "0 l­îng"
	end
	local money_gold = floor(money/10000)
	local money_silver = floor((money-(money_gold*10000))/100)
	local money_copper = floor(money-(money_gold*10000)-(money_silver*100))
	local money_name = ""
	if money_gold ~= 0 then
		money_name = money_gold.." Kim "
	end
	if money_silver ~= 0 then
		money_name = money_name..money_silver.." b¹c "
	end
	if money_copper ~= 0 then
		money_name = money_name..money_copper.." §ång "
	end
	return money_name
end
--º¯ÊıÃû³Æ£º·µ»Øµ±Ç°Ê±¼ä£¨ÃëÊ÷£©
--¹¦       ÄÜ£º·µ»Øµ±Ç°Ê±¼äÊÇ½ñÌìµÄµÚ¶àÉÙÃë
function Zgc_pub_today_sec_num_rtn()
	local sec_num = (GetTime() - 57600)
	sec_num = sec_num - ((floor(sec_num/86400))*86400)
	return sec_num
end
--º¯ÊıÃû³Æ£ºÍæ¼ÒÉı¼¶ĞÅÏ¢
--¹¦	    ÄÜ£º·µ»ØÍæ¼Òµ±Ç°Éú»úËùĞèÒªµÄ¾­ÑéºÍµ±Ç°µÈ¼¶¿É»ñµÃµÄÇ±ÄÜµãÊı
--±¸        ×¢£ºnum_diffÎª1Ê±·µ»Ø¾­ÑéµãÊı¡¢Îª2Ê±·µ»ØÇ±ÄÜµãÊı
function Zgc_pub_player_uplevel(num_diff)
	local player_uplevel_num = {
	{10,3},{20,3},{40,3},{80,3},{140,3},
	{245,3},{429,3},{643,3},{965,4},{1302,4},
	{1758,4},{2373,4},{3086,4},{3857,4},{4725,4},
	{5670,4},{6662,4},{7661,4},{8695,5},{9782,5},
	{11005,5},{12381,5},{13928,5},{15669,5},{17628,5},
	{19832,5},{22311,5},{25099,5},{28237,6},{32049,6},
	{36375,6},{41286,6},{46860,6},{53186,6},{60366,6},
	{68515,6},{77765,6},{88263,6},{100178,7},{117710,7},
	{138309,7},{162513,7},{190953,7},{224369,7},{263634,7},
	{309770,7},{363980,7},{427676,7},{502519,8},{585435,8},
	{682032,8},{794567,8},{925671,8},{1078406,8},{1256343,8},
	{1463640,8},{1705140,8},{1986489,8},{2314259,9},{2672969,9},
	{3087280,9},{3565808,9},{4118508,9},{4756877,9},{5494193,9},
	{6345793,9},{7329390,9},{8465446,9},{9777590,10},{12710867,10},
	{16524127,10},{21481365,10},{27925775,10},{37699796,10},{50894725,10},
	{68707878,10},{92755636,10},{125220108,10},{169047146,11},{196094689,11},
	{227469839,11},{263865014,11},{306083416,11},{355056762,11},{411865844,11},
	{477764379,11},{554206680,11},{642879749,11},{745740509,12},{857601585,12},
	{986241823,12},{1134178096,12},{1304304811,12},{1499950532,12},{1724943112,12},
	{1950000000,12},{1950000000,12},{1950000000,12},{1950000000,12}
	}
	if num_diff == 1 then
		return player_uplevel_num[GetLevel()][1]
	elseif num_diff == 2 then
		return player_uplevel_num[GetLevel()][2]
	else
		return 0
	end
end
--º¯ÊıÃû³Æ£ºNPC¾àÀë¼ÆËãº¯Êı
--º¯Êı¹¦ÄÜ£º¼ÆËãÍæ¼ÒÓëµ±Ç°NPCµÄX+YµÄ¾ø¶ÔÖµ
function Zgc_pub_npc_distance()
	local npc_index = GetTargetNpc()
	local npc_map_id,npc_att_x,npc_att_y = GetNpcWorldPos(npc_index)
	local player_map_id,player_att_x,player_att_y = GetWorldPos()
	return (abs(npc_att_x - player_att_x) + abs(npc_att_y - player_att_y))
end
--º¯ÊıÃû³Æ£º°ï»áÊı¾İget
--¹¦        ÄÜ£º°´Î»È¡µÃ°ï»áÊı¾İ
function Zgc_pub_getconftask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackGetConfTask")
end
function CallBackGetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	if conf_data[id] == nil then
		conf_data[id] = 0 
	end
	local return_fun = "ConfDataGetReturn_"..fun_id.."("..conf_data[id]..")"
	dostring(return_fun)
end
--º¯ÊıÃû³Æ£º°ï»áÊı¾İset
--¹¦        ÄÜ£º°´Î»ÉèÖÃ°ï»áÊı¾İ
function Zgc_pub_setconftask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData(GetTongName(),0,0,File_name,"CallBackSetConfTask")
end
function CallBackSetConfTask(szKey, nKey1, nKey2, nCount)
	local id = GetTaskTemp(158)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = ""
	suit_id = tostring(floor(id/10) + 1)			--¼ÆËã´óÎ»ÖÃ
													--È¡Öµ]
	local conf_data	= {}
	conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if conf_data[i] == nil then
			conf_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	conf_data[save_id] = value
	local rtn_flag = AddRelayShareData(GetTongName(),0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", conf_data[0],conf_data[1],conf_data[2],conf_data[3],conf_data[4],conf_data[5],conf_data[6],conf_data[7],conf_data[8],conf_data[9])
	local return_fun = "ConfDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--º¯ÊıÃû³Æ£º¶Ô»°º¯ÊıµÄ·­Ò³Í³Ò»´¦Àí
--º¯Êı¹¦ÄÜ£º´«ÈëĞèÒª´¦ÀíµÄ¶Ô»°£¬¶Ô¶Ô»°½øĞĞ×Ô¶¯·­Ò³µÄ´¦Àí
--´«Èë²ÎÊı£ºtb_deal:ĞèÒª´¦ÀíµÄtable£»page_seq:ĞèÒª´¦ÀíµÄÒ³Êı£»npp:Ã¿Ò³µÄÊıÁ¿£»fun_str£ºÔ­º¯ÊıµÄº¯ÊıÃû³Æ£»add_dia£º¸½´øÔÚ×îºóµÄ¶Ô»°£¬¿ÉÒÔÔö¼Ó±ÈÈçÍË³ö£¨¡±ÍË³ö/end_dialog¡°£©Íê³É¶Ô»°
function zgc_pub_dialog_page_deal(tb_deal,page_seq,npp,fun_str,add_dia)
	local tb_dia_rtn = {}
	--ÅĞ¶Ï´«Èë²ÎÊıÊÇ·ñÕıÈ·
	if getn(tb_deal) <= ((page_seq-1) * npp) or page_seq < 1 then
		tb_dia_rtn = {"err"}
	else
		--¿ªÊ¼ÕûºÏ
		local num_this_page = (getn(tb_deal) - ((page_seq-1) * npp))
		local next_page_flag = 0
		--ÅĞ¶Ï±¾Ò³ÏÔÊ¾µÄ´ÎÊı
		if num_this_page > npp then
			num_this_page = npp
			next_page_flag = 1
		end
		--ÅĞ¶ÏÊÇ·ñĞèÒªÏÂÒ»Ò³
		--if (num_this_page) > (2 * npp) then
		--	next_page_flag = 1
		--end
		--Ğ´Èë¡±ÉÏÒ»Ò³¡°
		if page_seq > 1 then
			tinsert(tb_dia_rtn,"Trang tr­íc/#"..fun_str.."("..(page_seq-1)..")")
		end
		--Ğ´ÈëÖ÷Ìâ
		for i = 1,num_this_page do
			tinsert(tb_dia_rtn,tb_deal[((page_seq-1) * npp)+i])
		end
		--Ğ´Èë¡±ÏÂÒ»Ò³¡±
		if next_page_flag == 1 then
			tinsert(tb_dia_rtn,"Trang kÕ/#"..fun_str.."("..(page_seq+1)..")")
		end
		if add_dia ~= "" then
			tinsert(tb_dia_rtn,add_dia)
		end
	end
	return tb_dia_rtn
end
--º¯ÊıÃû³Æ£ºtableµÄ·ÇÖØ¸´ĞÔËæ»úÑ¡Ôñ
--º¯Êı¹¦ÄÜ£º¶Ô´«ÈëµÄtable°´ÖÆ¶¨µÄ¸öÊı½øĞĞ·ÇÖØ¸´ĞÔËæ»úÑ¡È¡
function zgc_pub_table_sel_norepeat(table_name,sel_num)
	table_length = getn(table_name)
	local table_temp = zgc_pub_table_copy(table_name)
	local table_return = {}
	if  not(table_length < sel_num) then
		--¿ªÊ¼ÕıÊ½´¦Àí
		for i = table_length ,(table_length - sel_num + 1), -1 do
			local insert_seq = random(1,i)
			tinsert(table_return,table_temp[insert_seq])
			table_temp[insert_seq] = table_temp[i]
		end
	end
	return table_return
end
--º¯ÊıÃû³Æ£ºtable¸´ÖÆº¯Êı
--º¯Êı¹¦ÄÜ£º´´½¨Ò»¸öĞÂµÄÒ»ÑùµÄtable£¬·µ»ØÕâ¸ötableµÄcopy
function zgc_pub_table_copy(table_name)
	local table_rtn = {}
	for i = 1,getn(table_name) do
		tinsert(table_rtn,table_name[i])
	end
	return table_rtn
end
--º¯ÊıÃû³Æ£º×é¶Ó¼ì²âº¯Êı
--º¯Êı¹¦ÄÜ£º¼ì²â´«ÈëµÄplayer_indexÊÇ·ñºÍµ±Ç°µÄPlayerIdexÔÚÍ¬Ò»¸ö¶ÓÎéÖĞ
function zgc_pub_same_team_chk(player_index)
	local team_member_num = GetTeamSize()
	local chk_flag = 0
	if team_member_num ~= 0 then
		for i = 1, team_member_num do
			if GetTeamMember(i) == player_index then
				chk_flag = 1
			end
		end
	end	
	return chk_flag
end
--º¯ÊıÃû³Æ£ºÍæ¼ÒÃû³Æ¹ıÂËº¯Êı
--º¯Êı¹¦ÄÜ£ºÌæ»»Íæ¼ÒÃû³ÆÖĞµÄ·Ç·¨×Ö·û
function zgc_pub_name_replace(str,pattern,s)
	local startS,endS = strfind(str,pattern)
	while(startS) do
		str = strsub(str,1,startS-1)..s..strsub(str,endS+1,strlen(str))
		startS,endS = strfind(str,pattern)
	end
	return str
end
--º¯ÊıÃû³Æ£º¶Ô»°¿Õº¯Êı
--¹¦        ÄÜ£º¶Ô»°¿Õº¯Êı£¬¿ì½İ½áÊø
function end_dialog()

end
--==================================================================µ¥´ÎÕë¶ÔĞÔº¯Êı=======================================================================
--µÀ¾ßÊ¹ÓÃÊ±¼äÅĞ¶Ï
function Xmas_goods_use_date_chk()
	if zgc_pub_day_turn(1) < Xmas_start_day or zgc_pub_day_turn(1) > Xmas_end_day then
		Talk(1,"end_dialog","    VËt phÈm nµy chØ cã thÓ sö dông vµo ho¹t ®éng Gi¸ng sinh.")
		return 0
	end
	return 1
end
--¸öÈËÊ¥µ®Ê÷¹éÊôÅĞ¶Ï
function Xmas_tree_name_chk(Xmas_tree_index)
	local name_len = strlen(GetName())
	local Xmas_tree_name = strsub(GetNpcName(Xmas_tree_index),1,name_len)
	if GetName() == Xmas_tree_name and strlen(GetName()) == GetUnitCurStates(Xmas_tree_index,8) then
		return 1
	end
	return 0
end
--°ï»áÊ¥µ®Ê÷¹éÊôÅĞ¶Ï
function Conf_Xmas_tree_name_chk(conf_Xmas_tree_index)
	local name_long = strlen(GetTongName())
	local conf_Xmas_tree_name = strsub(GetNpcName(conf_Xmas_tree_index),1,name_long)
	if GetTongName() == conf_Xmas_tree_name and strlen(GetTongName()) == GetUnitCurStates(conf_Xmas_tree_index,8) then
		return 1
	end
	return 0
end
--ÊÇ·ñ¿ÉÒÔÖÖÊ÷µÄÅĞ¶Ï
function Xmas_tree_create_time_con()
	local old_time = GetTask(962)
	local old_index = GetTask(963)
	if old_time == 0 or old_index == 0 then
		return 1
	elseif (GetTime() - old_time) > 900 then
		return 1
	end
	return 0
end
--****************************´º½Ú»î¶¯*****************************
function spring_2007_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13552 or date_seq > 13569 then
		return 0
	else
		return 1
	end
end
--****************************ÄêÊŞÔö¼Óº¯Êı*************************
function spring2007_spring_goods_add()
	local add_odds_coat = 25
	local add_flag = AddItem(0,105,33,1,1,-1,-1,-1,-1,-1,-1)
	if add_flag == 1 then
	Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc thó c­ìi: Niªn Thó!")
	end
	if random(1,100) >= add_odds_coat then
		local TaskID_spring2007_cap = 973
		local TaskID_spring2007_coat = 974
		local TaskID_spring2007_trou = 975
		local coat_id_list = {
		{{"Thu Thi qu¸n",0,108,195},{"§«ng Hµn m·o",0,108,196},{"H¹ Vinh kÕt",0,108,197},{"Xu©n No·n tr©m",0,108,198}},
		{{"Thu Thi bµo",0,109,255},{"§«ng Hµn gi¸p",0,109,256},{"H¹ Vinh trang",0,109,257},{"Xu©n No·n th­êng",0,109,258}},
		{{"Thu Thi ngoa",0,110,85},{"§«ng Hµn ngoa",0,110,86},{"H¹ Vinh quÇn",0,110,87},{"Xu©n No·n quÇn",0,110,88}},	
		}
		local not_get = {}
		local not_get_num = 1
		for i = TaskID_spring2007_cap,TaskID_spring2007_trou do
			if GetTask(i) ~= 1 then
				not_get[not_get_num] = i
				not_get_num = not_get_num + 1
			end
		end
		if getn(not_get) <= 0 then
			return
		else
			local coat_seq = random(1,getn(not_get))
			coat_seq = not_get[coat_seq]
			local player_body = GetBody()
			local add_flag = AddItem(coat_id_list[coat_seq - 972][player_body][2],coat_id_list[coat_seq - 972][player_body][3],coat_id_list[coat_seq - 972][player_body][4],1)
			if add_flag == 1 then
				Msg2Player("Chóc mõng b¹n ®· nhËn ®­îc 1:"..coat_id_list[coat_seq - 972][player_body][1].."!")
			end
			SetTask(coat_seq,1)
		end
	end
	return
end
--*******************************2007ÄêÇåÃ÷½Ú»î¶¯************************
function tomb_sweep_2007_date_chk()
	local date_save = zgc_pub_day_turn(1)
	if date_save >= 13601 and date_save <= 13610 then
		return 1
	elseif date_save < 13601 then
		return -1
	else
		return 0
	end
end
--*****************************2007ÄêÎåÒ»»î¶¯Ê±¼ä*************************
function labor_day_2007_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13628 then
		return -1
	elseif date_seq >= 13628 and date_seq <=13642 then
		return 0
	else
		return 1
	end
end
--*****************************ÎåÒ»»î¶¯Ê¦ÃÅÀúÁ·Ê±¼ä*************************
function labor_2007_teach_date_chk()
	local date_seq = zgc_pub_day_turn(1)
	if date_seq < 13628 then
		return -1
	elseif date_seq >= 13628 and date_seq <=13649 then
		return 0
	else
		return 1
	end
end
--******************************½á»é¶şÆÚÏà¹Ø******************************

--***************************ÎåÒ»»î¶¯Ê¦ÃÅÀúÁ·ÈÎÎñ¶Ô»°**********************
TaskID_up_book_week_seq = 1202
TaskID_up_book_diff = 1245
TaskID_up_book_num = 1246
TaskID_Temp_book_diff = 173
Tb_teacher_name = {"<color=green>HuyÒn Tõ<color>:","<color=green>Tö H¹c Ch©n Nh©n<color>:","<color=green>Ch©n Nh­ S­ Th¸i<color>:","<color=green>Long T¹i Thiªn<color>:","<color=green>§­êng Së Hång<color>:","<color=green>Xa Th¸i Qu©n<color>:","<color=green>B¹ch Doanh Doanh<color>:",}
Tb_teacher_name[0] = "<color=green>§Æc sø Vâ L©m<color>:"
Tb_book = {	{75,"Thùc chiÕn t©m ®¾c",1101,20},
			{10,"Quan chiÕn t©m ®¾c",1102,40},
			{10,"Thùc chiÕn kinh nghiÖm tËp",1103,6},
			}
Sever_diff_lilian = 2
function labor_07_dia_main(sver_flag)
	do
		Say(Tb_teacher_name[GetPlayerFaction()].."Ho¹t ®éng S­ m«n rÌn luyÖn hiÖn ch­a b¾t ®Çu!",
		1,
		"KÕt thóc ®èi tho¹i/end_dialog"
		);
		return
	end
	Sever_diff_lilian = sver_flag
	if GetPlayerFaction() ~= 0 then
		Say(Tb_teacher_name[GetPlayerFaction()].."Ng­¬i ®· häc vâ nghÖ nhiÒu n¨m råi, b©y giê ®õng ng¹i h¹ s¬n t×m ng­êi kh¸c ®Ó tu luyÖn vâ häc, hoÆc tû thİ vâ c«ng víi ng­êi kh¸c. X­a nay ®· häc ®­îc nhiÒu råi, nÕu trong tay ng­¬i vÉn cßn '<color=yellow>Quan ChiÕn T©m §¾c<color>', th× cã thÓ ®Õn chç ta ®Ó ®æi phÇn th­ëng.",
		6,
		--"ÎÒÒªÉÏ½»¡°ÊµÕ½ĞÄµÃ¡±/#book_hand_in(1)",
		"Ta ph¶i nép'Quan ChiÕn T©m §¾c'/#book_hand_in(2)",
		"Ta ph¶i nép 'Thùc chiÕn kinh nghiÖm tËp'/#book_hand_in(3)",
		"Lµm sao ®Ó nhËn ®­îc Thùc chiÕn t©m ®¾c vµ Quan chiÕn t©m ®¾c/how_2_get_book",
		"T¸c dông cña Thùc chiÕn kinh nghiÖm tËp/fight_exp_book_inf",
		"Cã thÓ nhËn ®­îc nh÷ng phÇn th­ëng /what_prize",
		"Ta chØ ®Õn xem thö/end_dialog"
		)
		return
	else
		Say(Tb_teacher_name[GetPlayerFaction()].."Ng­¬i tuy v« m«n v« ph¸i, nh­ng còng lµ nh©n sü giang hå, b©y giê ng­¬i ®õng ng¹i tu luyÖn vâ c«ng hoÆc tû thİ vâ nghÖ víi ng­êi kh¸c. X­a nay ®· häc ®­îc nhiÒu råi, nÕu trong tay ng­¬i vÉn cßn '<color=yellow>Quan ChiÕn T©m §¾c<color>', th× cã thÓ ®Õn chç ta ®Ó ®æi phÇn th­ëng.",
		6,
		"Ta ph¶i nép'Quan ChiÕn T©m §¾c'/#book_hand_in(2)",
		"Ta ph¶i nép 'Thùc chiÕn kinh nghiÖm tËp'/#book_hand_in(3)",
		"Lµm sao ®Ó nhËn ®­îc Thùc chiÕn t©m ®¾c vµ Quan chiÕn t©m ®¾c/how_2_get_book",
		"T¸c dông cña Thùc chiÕn kinh nghiÖm tËp/fight_exp_book_inf",
		"Cã thÓ nhËn ®­îc nh÷ng phÇn th­ëng /what_prize",
		"Ta chØ ®Õn xem thö/end_dialog"
		)
	end
end
--*************************ÉÏ½»ĞÄµÃ*********************
function book_hand_in(book_diff)
	local player_level = GetLevel()
	--µÈ¼¶ÅĞ¶Ï
	if player_level < Tb_book[book_diff][1] then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."<color=yellow>"..Tb_book[book_diff][1].."<color>§Ö tö trªn cÊp<color=yellow>"..Tb_book[book_diff][2].."<color> míi cã thÓ giao nép!")
		return
	end
	--½ñÌìÊÇ·ñÒÑ¾­½»¹ıÁËĞÄµÃ
	local book_uped_diff = GetTask(TaskID_up_book_diff)
	if GetTask(TaskID_up_book_week_seq) == Zgc_pub_week_seq() and (book_uped_diff ~= 0 and book_uped_diff ~= nil)then
		if GetTask(TaskID_up_book_num) >= Tb_book[book_uped_diff][4] then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Ng­¬i ®· ®ñ b¶n lÜnh h·y tù m×nh rÌn luyÖn thªm, kh«ng cÇn ®­a nh÷ng thø ®ã cho ta n÷a")
			return
		end
		if book_diff ~= book_uped_diff then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."TuÇn nµy ng­¬i ®· nép <color=yellow>"..Tb_book[book_uped_diff][2].."<color>, kh«ng thÓ nép n÷a.")
			return
		end
	end
	--ÊäÈëÉÏ½»µÄ±¾Êı
	local book_num_get = GetItemCount(2,1,Tb_book[book_diff][3])
	if book_num_get <= 0 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H·y mau hoµn thµnh nhiÖm vô, ng­¬i ch­a cã <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	local book_num_need = Tb_book[book_diff][4]
	if GetTask(TaskID_up_book_week_seq) == Zgc_pub_week_seq() then
		book_num_need = book_num_need - GetTask(TaskID_up_book_num)
	end
	local book_num_up = min(book_num_need,book_num_get)
	SetTaskTemp(TaskID_Temp_book_diff,book_diff)
	AskClientForNumber("prize_get",1,book_num_up,"Xin nhËp thø b¹n muèn nép"..Tb_book[book_diff][2].."!")
end
--**************************½±Àø¸øÓÚ************************
function prize_get(book_num)
	local book_diff = GetTaskTemp(TaskID_Temp_book_diff)
	if book_diff == 0 or book_diff == nil then
		return
	end
	SetTaskTemp(TaskID_Temp_book_diff,0)
	if Sever_diff_lilian ~= 2 then
		local golden_exp_num = GetGoldenExp()
		if golden_exp_num == 0 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."HiÖn <color=yellow>kinh nghiÖm søc kháe<color> lµ <color=red>0<color>, kh«ng chuyÓn ®­îc!")
			return
		end
	end
	--Ğ¯´ø¼ì²â
	if GetItemCount(2,1,Tb_book[book_diff][3]) < book_num then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H·y mau hoµn thµnh nhiÖm vô, ng­¬i ch­a cã <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	--½±Àø¸øÓÚ
	local player_level = GetLevel()
	local chg_num = floor((player_level * player_level * player_level * player_level) * 0.1953125 * book_num/Tb_book[book_diff][4])
	if Sever_diff_lilian == 2 then				--IB·şÎñÆ÷
		--É¾³ı¼ì²â
		if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H·y mau hoµn thµnh nhiÖm vô, ng­¬i ch­a cã <color=yellow>"..Tb_book[book_diff][2].."<color>!")
			return
		end
		chg_num = floor((player_level * player_level * player_level * player_level) * book_num /(20 * Tb_book[book_diff][4]))
		ModifyExp(chg_num)
		Msg2Player("Chóc mõng b¹n nhËn ®­îc "..chg_num.." ®iÓm kinh nghiÖm!")
	else								--ÊÕ·Ñ·şÎñÆ÷
		local golden_exp_num = GetGoldenExp()
		if chg_num > golden_exp_num then
			Say(Tb_teacher_name[GetPlayerFaction()].."C¨n cø ®¼ng cÊp hiÖn t¹i cña b¹n, b¹n cã thÓ ®æi <color=yellow>"..chg_num.."<color> ®iÓm søc kháe thµnh ®iÓm kinh nghiÖm nh­ng ®iÓm søc kháe cña b¹n kh«ng ®ñ, b¹n x¸c nhËn muèn ®æi?",
			2,
			"Ta x¸c nhËn/#chg_dtm("..golden_exp_num..","..book_diff..","..book_num..")",
			"§Ó ta suy nghÜ l¹i/end_dialog")
			return
		end
		--É¾³ı¼ì²â
		if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
			Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H·y mau hoµn thµnh nhiÖm vô, ng­¬i ch­a cã <color=yellow>"..Tb_book[book_diff][2].."<color>!")
			return
		end
		ModifyGoldenExp(-chg_num)
		ModifyExp(chg_num)
		Msg2Player("Chóc mõng b¹n chuyÓn"..chg_num.."®iÓm søc kháe thµnh ®iÓm kinh nghiÖm!")
	end
	--Íê³ÉºóµÄ´¦Àí
	finish_deal(book_diff,book_num)
end
function chg_dtm(golden_exp_num,book_diff,book_num)
	if DelItem(2,1,Tb_book[book_diff][3],book_num) ~= 1 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."H·y mau hoµn thµnh nhiÖm vô, ng­¬i ch­a cã <color=yellow>"..Tb_book[book_diff][2].."<color>!")
		return
	end
	ModifyGoldenExp(-golden_exp_num)
	ModifyExp(golden_exp_num)
	Msg2Player("Chóc mõng b¹n chuyÓn"..golden_exp_num.."®iÓm søc kháe thµnh ®iÓm kinh nghiÖm!")
	finish_deal(book_diff,book_num)
end
--*************************Íê³ÉºóµÄ´¦Àí*****************
function finish_deal(book_diff,book_num)
	local week_save = GetTask(TaskID_up_book_week_seq)
	local week_now = Zgc_pub_week_seq()
	local book_uped_num = GetTask(TaskID_up_book_num)
	if week_save >= week_now then
		SetTask(TaskID_up_book_num,(book_uped_num+book_num))
		SetTask(TaskID_up_book_diff,book_diff)			--ÕâÀï±£´æÉÏ½»µÄÖÖÀàÊÇÎªÁË±ÜÃâÍâÍøÒÑ¾­½»¹ıµÄÍæ¼Ò³öÏÖÊı¾İ´íÎó
	else
		SetTask(TaskID_up_book_week_seq,week_now)
		SetTask(TaskID_up_book_num,book_num)
		SetTask(TaskID_up_book_diff,book_diff)
		book_uped_num = 0
	end
	local num_remain = (Tb_book[book_diff][4]-(book_uped_num+book_num))
	if num_remain ~= 0 then
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."LÇn nµy ng­¬i ®· nép <color=yellow>"..book_num.."<color> quyÓn <color=yellow>"..Tb_book[book_diff][2].."<color>, tuÇn nµy ng­¬i cã thÓ nép <color=yellow>"..num_remain.."<color> quyÓn!")
	else
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."LÇn nµy ng­¬i ®· nép <color=yellow>"..book_num.."<color> quyÓn <color=yellow>"..Tb_book[book_diff][2].."<color>, tuÇn nµy ng­¬i kh«ng thÓ nép n÷a!")
	end
end
--*************************½±ÀøÁĞ±í*********************
function what_prize()
	if Sever_diff_lilian == 2 then				--IB·şÎñÆ÷
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."Hoµn thµnh nhiÖm vô <color=yellow>Thİ luyÖn s­ m«n<color> ng­¬i cã thÓ ®Õn chç ta nhËn phÇn th­ëng ®iÓm kinh nghiÖm")
	else	
		Talk(1,"",Tb_teacher_name[GetPlayerFaction()].." Hoµn thµnh nhiÖm vô <color=yellow>Thİ luyÖn s­ m«n<color> ng­¬i cã thÓ ®Õn chç ta nhËn phÇn th­ëng ®iÓm søc kháe chuyÓn sang ®iÓm kinh nghiÖm")
	end
end
--*************************ÈçºÎ»ñµÃÊé*******************
function how_2_get_book()
	Talk(2,"",	Tb_teacher_name[GetPlayerFaction()].."Tham gia tû vâ ®¹i héi sÏ cã c¬ héi nhËn ®­îc '<color=yellow>Thùc ChiÕn T©m §¾c<color>'. B©y giê kh«ng thÓ nhËn '<color=yellow>Quan ChiÕn T©m §¾c<color>', nÕu cßn Quan ChiÕn T©m §¾c, th× cã thÓ ®Õn chç ta ®Ó ®æi phÇn th­ëng. Thùc ChiÕn T©m §¾c cã thÓ nhÊn chuét ph¶i ®Ó sö dông.",
				Tb_teacher_name[GetPlayerFaction()].."Nªn nhí ph¶i giao ®Êu tr­íc <color=red>24h thø 7 mçi tuÇn<color>"
	)
end
--**********************ÊµÕ½ĞÄµÃ¼¯µÄ×÷ÓÃ******************
function fight_exp_book_inf()
	Talk(1,"",Tb_teacher_name[GetPlayerFaction()].."NÕu kh«ng cã thêi gian cã thÓ ®Õn Ngù c¸c mua <color=yellow>Thùc ChiÕn Kinh NghiÖm TËp<color> cña c¸c bËc tiÒn bèi, xem xong ®­a ta còng ®­îc. Nh­ng <color=yellow>Thùc ChiÕn Kinh NghiÖm TËp<color> chØ cã thÓ l·nh mçi tuÇn do ng­¬i ch­a nép <color=yellow>Thùc ChiÕn T©m §¾c<color> vµ <color=yellow>Quan ChiÕn T©m §¾c<color> phÇn th­ëng sãt l¹i kh«ng thÓ nhËn ngoµi ®Şnh møc. NÕu muèn nhËn phÇn th­ëng tuÇn nµy, <color=yellow>Thùc ChiÕn Kinh NghiÖm TËp<color> còng ph¶i nép tr­íc <color=red>24 giê Thø 7<color>.")
end 
--====================================2007¶ËÎç½ÚÏà¹Ø=============================
--*********************ÊÇ·ñÊÇ»î¶¯ÆÚ¼ä*********************
function dragon_boat_date_chk()
	--if zgc_pub_day_turn(1) >= 13681 then
		return 1
	--else
	--	return 0
	--end
end
-- append by lizhi
-- ¼ÆËã¾àÀë
function distance_between_points(MapID1, MapX1, MapY1, MapID2, MapX2, MapY2)
	if MapID1 ~= MapID2 then
		return -1
	else
		local dx = MapX2 - MapX1
		local dy = MapY2 - MapY1
		local nDist = (dx * dx + dy * dy)^(1/2)
		return nDist
	end
end

function mp_goods_add_chk(goods_num,goods_weight)
	if GetFreeItemRoom() < goods_num then
		Msg2Player("Hµnh trang cña b¹n kh«ng ®ñ chç trèng!")					-- Ò»¶¨ÒªÓÃMsg2Player
		return 0
	elseif (GetMaxItemWeight() - GetCurItemWeight()) < goods_weight then			--ÅĞ¶ÏÍæ¼Ò¸ºÖØºÍ¿Õ¼ä
		Msg2Player("Søc lùc cña b¹n kh«ng ®ñ, h·y thu xÕp l¹i ®i.")
		return 0
	else
		return 1
	end
end
