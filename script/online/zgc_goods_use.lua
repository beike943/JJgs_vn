------------------------------------------------------------------
--   ¡ò¨q¡ğ¨r¡ò¨q¡ğ¨r¡ò¨q¡ğ¨r¡ò¨q¡ğ¨r¡ò 
-- /¨€¡Å¨€\/¨€¡Å¨€\/¨€¡Å¨€\/¨€¡Å¨€¡Å¨€\ 
--   ¡Ç     ¡Ç    ¡Ç     ¡Ç    ¡Ç     ¡Ç    ¡Ç     ¡Ç    ¡Ç
------------------------------------------------------------------
Include("\\script\\online\\zgc_public_fun.lua")
Include("\\script\\online\\zgc_public_virable.lua")
File_name = "\\script\\online\\zgc_goods_use.lua"
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
--º¯ÊıÃû³Æ£º°ï»áÊı¾İget
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

--=================================ÏµÍ³Ö÷º¯Êı========================
function OnUse(goods_index)
	if GetTask(960) ~= 1226 then			--Êı¾İ³õÊ¼»¯
		for j = 961,975 do
			SetTask(j,0)
		end
		SetTask(968,3456)					--½±Àø×é³É
		SetTask(960,1226)					--»î¶¯±êÖ¾
	end
	local goods_id = GetItemParticular(goods_index)
	local i = 1
	local find_flag = 0
	for i = 1,getn(Goods_Use_Table) do
		if getn(Goods_Use_Table[i]) == 2 and goods_id == Goods_Use_Table[i][1] then
			find_flag = 1
			dostring(Goods_Use_Table[i][2]..goods_index..")")
			break
		elseif getn(Goods_Use_Table[i]) == 3 and goods_id >= Goods_Use_Table[i][1] and goods_id <= Goods_Use_Table[i][2] then
			find_flag = 1
			dostring(Goods_Use_Table[i][3])
			break
		end
	end	
	if find_flag == 0 then
		DelItemByIndex(goods_index,1)
	end
end
--====================================================================Ê¥µ®»î¶¯============================================================================
--*******************************¸öÈËÊ¥µ®Ê÷µÄ´´½¨***************************
function Xmas_tree(tree_diff,goods_index)
	local map_min = 700
	local MapID,Att_X,Att_Y = GetWorldPos()
	--ÈËÎïµÈ¼¶ÅĞ¶Ï
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	--µØÍ¼ÅĞ¶Ï
	if MapID >= map_min then
		Talk(1,"end_dialog","    N¬i ®©y kh«ng cã linh khİ, nªn t×m mét chç tèt h¬n!")
		return
	end
	--Ê±¼äÅĞ¶Ï
	if Xmas_goods_use_date_chk() == 0 then
		return
	end
	--Ã¿ÌìÊıÁ¿ÏŞÖÆÅĞ¶Ï
	if tree_diff == 1 and GetTask(965) == zgc_pub_day_turn(1) then												--Ê¥µ®Ê÷ÊıÁ¿ÅĞ¶Ï
		Talk(1,"end_dialog","    Mçi ngµy chØ trång ®­îc mét c©y Gi¸ng sinh tËp thÓ!")
		return
	end
	if GetTask(966) >= zgc_pub_day_turn(1) and GetTask(967) >= 4 then						--ÖÖÊ÷´ÎÊıµÄÅĞ¶Ï
		Talk(1,"end_dialog","    giíi h¹n mçi ngµy trång ®­îc 4 c©y!")
		return
	end
	--ÊÇ·ñ»¹ÓĞÊôÓÚ×Ô¼ºµÄÊ÷µÄÅĞ¶Ï
	if Xmas_tree_create_time_con() ~= 1 then
		Talk(1,"end_dialog","    B¹n ®· trång ®­îc 1 c©y Gi¸ng sinh!")
		return
	end
	
	local SFX_seq = 0			--ÌØĞ§ĞòºÅ£¬ÔÚÍâÃælocal¿ÉÒÔÓÃÀ´±£´æºóÃæµÄÊ÷µÄÀàĞÍ
	if tree_diff == 1 then		--ÌØĞ§¼ÆËã
		SFX_seq = 1
	else
		SFX_seq = random(1,4)
	end
	
	local Xmas_tree_name = GetName().." trång "..Conf_Xmas_tree_SQF_name[1][SFX_seq + 1].."c©y Gi¸ng sinh (nhá)"
	local Xmas_tree_index = CreateNpc(Xms_tree_npc_name[1][tree_diff],Xmas_tree_name,MapID,Att_X,Att_Y,6,1,1,0)
	SetNpcScript(Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
	--ÔÚ´Ë¼ÓÈëÌØĞ§

	tree_diff_save = (tree_diff * 100) + 10 + SFX_seq						--Ê÷µÄÀàĞÍ¼ÆËã
	SetCurrentNpcSFX(Xmas_tree_index,Xmas_tree_SFX_table[tree_diff][1][SFX_seq],1,1)				--ÌØĞ§ÉèÖÃ
	
	SetUnitCurStates(Xmas_tree_index,4,tree_diff_save) 						--Ğ´ÈëÊ÷µÄÀàĞÍ
	SetUnitCurStates(Xmas_tree_index,1,GetTime()) 							--Ğ´ÈëÖÖÊıµÄÊ±¼ä
	SetUnitCurStates(Xmas_tree_index,0,1) 									--Ğ´ÈëÊ÷µÄÀàĞÍ
	SetUnitCurStates(Xmas_tree_index,8,strlen(GetName())) 					--Ğ´ÈëÊ÷µÄÀàĞÍ
	SetTask(962,GetTime())
	SetTask(963,Xmas_tree_index)
	if tree_diff == 1 then													--½Ì»áÊ¥µ®Ê÷ÖÖÊ÷µÄ´ÎÊıºÍ±¾ÂÖµÄÊ±¼ä¼ÇÂ¼
		SetTask(964,(GetTask(964) + 1))
		SetTask(965,zgc_pub_day_turn(1))
	end
	if GetTask(966) ~= zgc_pub_day_turn(1) then
		SetTask(966,zgc_pub_day_turn(1))
		SetTask(967,1)
	else
		SetTask(967,(GetTask(967) + 1))
	end
	SetNpcLifeTime(Xmas_tree_index,900)										--´æ»îÊ±¼ä15·ÖÖÓ
	DelItemByIndex(goods_index,1)
	if GetTask(966) < zgc_pub_day_turn(1) then
		Talk(1,"end_dialog","    H«m nay, ®©y lµ lÇn thø <color=yellow>1<color> b¹n trång c©y, b¹n cã thÓ trång <color=yellow>3<color> c©y Gi¸ng sinh tËp thÓ hoÆc c©y Gi¸ng sinh c¸ nh©n!")
	else
		local Xmas_tree_times_total = ""
		local Xmas_tree_times_remain = ""
		if GetTask(967) == 1 then
			Xmas_tree_times_total = "<color=yellow>lÇn 1<color>"
			Xmas_tree_times_remain = ", h«m nay b¹n cã thÓ trång <color=yellow>3<color> lÇn c©y Gi¸ng sinh tËp thÓ hoÆc lµm nhiÖm vô kh¸c ®Ó nhËn c©y Gi¸ng sinh!"
		elseif GetTask(967) == 2 then
			Xmas_tree_times_total = "<color=yellow>lÇn 2<color>"
			Xmas_tree_times_remain = ", h«m nay b¹n cã thÓ trång <color=yellow>2<color> lÇn c©y Gi¸ng sinh tËp thÓ hoÆc lµm nhiÖm vô kh¸c ®Ó nhËn c©y Gi¸ng sinh!"
		elseif GetTask(967) == 3 then
			Xmas_tree_times_total = "<color=yellow>lÇn 3<color>"
			Xmas_tree_times_remain = ", h«m nay b¹n cã thÓ trång <color=yellow>1<color> lÇn c©y Gi¸ng sinh tËp thÓ hoÆc lµm nhiÖm vô kh¸c ®Ó nhËn c©y Gi¸ng sinh!"
		elseif GetTask(967) == 4 then
			Xmas_tree_times_total = "<color=yellow>lÇn cuèi cïng<color>"
			Xmas_tree_times_remain = "!"
		end
		Talk(1,"end_dialog","    §©y lµ lÇn thø "..Xmas_tree_times_total.." lÇn trång c©y"..Xmas_tree_times_remain)
	end
end
--********************************ÖÖ°ï»áÊ¥µ®Ê÷**********************************
function conf_Xmas_tree(tree_index)
	if IsTongMaster() ~= 1 then
		Talk(1,"end_dialog","    ChØ cã bang chñ míi cã thÓ trång c©y Gi¸ng sinh bang héi.")
		return
	end
	--µÈ¼¶ÅĞ¶Ï
	if Zgc_pub_action_level_chk() ~= 1 then
		return
	end
	--Ê±¼äÅĞ¶Ï
	if Xmas_goods_use_date_chk() == 0 then
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	local map_chk_flag = 0
	local tree_map_dialog = ""
	for i = 1,getn(Conf_Xmas_tree_map) do
		tree_map_dialog = "<color=yellow>"..tree_map_dialog..Conf_Xmas_tree_map[i][2].."<color> ,"
		if map_ID == Conf_Xmas_tree_map[i][1] then
			map_chk_flag = 1
			break
		end
	end
	tree_map_dialog = strsub(tree_map_dialog,1,(strlen(tree_map_dialog)-1))
	if map_chk_flag == 0 then
		Talk(1,"end_dialog",
		"    C©y Gi¸ng sinh bang héi chØ cã thÓ trång ë nh÷ng khu vùc sau ®©y:"..tree_map_dialog
		)
		return
	end

	if tonumber(date("%H%M")) <2100 or tonumber(date("%H%M")) > 2130 then
		Talk(1,"end_dialog",
		"    C©y gi¸ng sinh bang héi mçi ngµy chØ cã thÓ trång tõ <color=yellow>21:00<color> ®Õn <color=yellow>21:30<color>."
		)
		return
	end
	SetTaskTemp(161,tree_index)
	Zgc_pub_getconftask(2,2)				--Î»ÖÃ¡¢º¯ÊıĞòºÅ
end
function ConfDataGetReturn_2(data_value)
	if data_value >= zgc_pub_day_turn(1) then
		Talk(1,"end_dialog",
			"    h«m nay ®· trång c©y Gi¸ng sinh, ngµy mai l¹i ®Õn nhĞ!"
		)
		return 		--test
	end
	local del_flag = DelItemByIndex(GetTaskTemp(161),1)
	if del_flag ~= 1 then
		Talk(1,"end_dialog",
			"    X¸c nhËn trong hµnh trang cña b¹n cã c©y Gi¸ng sinh bang héi!"
		)
		return
	else
		local SFC_seq = floor(random(10,49)/10)					--ÌØĞ§ID
		local conf_tree_diff = 10 + SFC_seq			--°ï»áÊ¥µ®Ê÷Àà±ğ¼ÆËã
		local map_ID,att_X,att_Y = GetWorldPos()
		local conf_Xmas_tree_name = GetTongName().." trång "..Conf_Xmas_tree_SQF_name[1][SFC_seq +1 ].."-".."C©y Gi¸ng Sinh (nhá)"
		local conf_Xmas_tree_index = CreateNpc(Xms_tree_npc_name[1][4],conf_Xmas_tree_name,map_ID,att_X,att_Y,6,1,1,0)
		SetNpcScript(conf_Xmas_tree_index,"\\script\\online\\zgc_npc_dialog.lua")
		--½«Ê¥µ®Ê÷µÄ2¡¢3Î»Êı¾İÇå¿Õ
		SetUnitCurStates(conf_Xmas_tree_index,2,0)
		SetUnitCurStates(conf_Xmas_tree_index,3,0)
		SetUnitCurStates(conf_Xmas_tree_index,6,0)
		SetUnitCurStates(conf_Xmas_tree_index,8,strlen(GetTongName()))
		--tripµã¼ÓÈë
		for i = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
			for j = - Conf_Xmas_trap_att,Conf_Xmas_trap_att do
				AddMapTrap(map_ID,((att_X + i) * 32),((att_Y + j) * 32),Conf_Xmas_trap_way)
			end
		end
		--°ï»á¹«¸æ
		local map_name = Zgc_pub_mapID_name_change(map_ID,1) 
		if map_name ~= 0 then
			SendTongMessage("T¹i"..map_name.."C©y Gi¸ng sinh bang héi ®· trång, mong c¸c vŞ bang chóng ®Õn trang trİ!")
		end
		--ÌØĞ§¼ÓÈë
		SetCurrentNpcSFX(conf_Xmas_tree_index,Xmas_tree_SFX_table[4][1][SFC_seq],1,1)					--ÌØĞ§ÉèÖÃ
		SetUnitCurStates(conf_Xmas_tree_index,4,conf_tree_diff) 						--Ğ´ÈëÊ÷µÄÀàĞÍ
		SetUnitCurStates(conf_Xmas_tree_index,1,GetTime()) 								--Ğ´ÈëÖÖÊıµÄÊ±¼ä	
		SetUnitCurStates(conf_Xmas_tree_index,0,2) 										--Ğ´ÈëÊ÷µÄÀàĞÍ
		SetNpcLifeTime(conf_Xmas_tree_index,600)										--´æ»îÊ±¼ä10·ÖÖÓ
	end
	Zgc_pub_setconftask(2,zgc_pub_day_turn(1),2)		--Î»ÖÃ¡¢Öµ¡¢º¯ÊıĞòºÅ
end
function ConfDataSetReturn_2()
end
--====================================================================½áÊø============================================================================
