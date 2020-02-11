--IBÎïÆ·Ò°ÍâbossÕÙ»½ÎïÆ·½Å±¾
--×÷Õß£ºÕÔ¹ó´º
--¿ªÊ¼Ê±¼ä£º2007-01-16
--½áÊøÊ±¼ä£º
--±¸×¢£ºÆÁ±ÎµØÍ¼£º×÷Õß:
--ÀÎ·¿,701¡¢702¡¢703
--¶ñÈË¹È,708
--ÀÞÌ¨,801,802,803,805,810,811
--Õ½³¡,807,809,881,882,883,884
--Ê¦ÃÅÐÞÁ¶µØÍ¼,812,813,814,815,816,817,422
--¶àÈËÀÞÌ¨,821,822,823,824,825,826
--×é¶ÓÀÞÌ¨,827,828,829,830,831,832,833,834
Include("\\script\\online\\zgc_public_fun.lua")
--======================================================ÊÀ½çÊý¾Ý·â×°=================================================================================
--º¯ÊýÃû³Æ£ºÊÀ½çÊý¾Ýget
--¹¦        ÄÜ£º°´Î»È¡µÃ°ï»áÊÀ½çÊý¾Ý
File_name = "\\script\\item\\item_billing\\jueshigaoshou.lua"
function Zgc_pub_getwrdtask(id,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("Sè liÖu ID thÕ giíi",0,0,File_name,"CallBackGetWrdTask")
end
function CallBackGetWrdTask(szKey, nKey1, nKey2, nCount)
	local id = (GetTaskTemp(158)-1)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10)+1)
	local wrd_data	= {}
	wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	local save_id = (id - (floor(id/10)*10))
	if wrd_data[save_id] == nil then
		wrd_data[save_id] = 0 
	end
	local return_fun = "WrdDataGetReturn_"..fun_id.."("..wrd_data[save_id]..")"
	dostring(return_fun)
end
--º¯ÊýÃû³Æ£ºÊÀ½çÊý¾Ýset
--¹¦        ÄÜ£º°´Î»ÉèÖÃÊÀ½çÊý¾Ý
function Zgc_pub_setwrdtask(id,value,fun_id)
	SetTaskTemp(158,id)
	SetTaskTemp(159,value)
	SetTaskTemp(160,fun_id)
	ApplyRelayShareData("Sè liÖu ID thÕ giíi",0,0,File_name,"CallBackSetWrdTask")
end
function CallBackSetWrdTask(szKey, nKey1, nKey2, nCount)
	local id =(GetTaskTemp(158) - 1)
	local value = GetTaskTemp(159)
	local fun_id = tostring(GetTaskTemp(160))
	local suit_id = tostring(floor(id/10) + 1)			--¼ÆËã´óÎ»ÖÃ
	local wrd_data	= {}
	wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9] = GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	for i = 0, 9 do
		if wrd_data[i] == nil then
			wrd_data[i] = 0 
		end
	end
	local save_id = (id - (floor(id/10)*10))
	wrd_data[save_id] = value
	local rtn_flag = AddRelayShareData("Sè liÖu ID thÕ giíi",0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9])
	local return_fun = "WrdDataSetReturn_"..fun_id.."()"
	dostring(return_fun)
end
--=============================¹«¹²±äÁ¿¶¨Òå======================
	boss_list = {
		{"S¬n TÆc §Çu Môc", "B¾c Lôc L©m Minh Chñ", 1014, "Lôc L©m Lang Yªn", 3, "\\script\\task\\boss\\boss_ondeath.lua"},			--bossÃû³Æ£¬Ä£°åÃû£¬¶ÔÓ¦ÎïÆ·ID£¬¶ÔÓ¦ÎïÆ·Ãû³Æ£¬Ã¿Ìì¿ÉÒÔÕÙ»½µÄ×î´óÊýÁ¿£¬NPC¹ÒµÄË÷Òý½Å±¾
		{"HuyÒn Vâ Th­ong", "Th­¬ng ThÇn Doanh Thiªn", 1047, "Thñy Hoµng BÝ ChiÕu", 3, "\\script\\task\\boss\\boss_ondeath.lua"},
		{"NghiÖt Hån", "L·nh H­¬ng L¨ng", 1048, "Uyªn ¦¬ng Kim Ti B¹c", 3, "\\script\\task\\boss\\boss_ondeath.lua"},
	}
--================================Ö÷Âß¼­=========================
--**************************ÎïÆ·Ê¹ÓÃÖ÷º¯Êý************************
function OnUse(goods_index)
	SetItemUseLapse(id,90)
	if GetFightState() == 0 then
		Talk(1,"end_dialog","N¬i ®©y kh«ng ®­îc sö dông vËt phÈm nµy!")
		return
	end
	local MapID,Att_X,Att_Y = GetWorldPos()
	if MapID > 700 then
		Talk(1,"end_dialog","N¬i ®©y kh«ng ®­îc sö dông vËt phÈm nµy!")
		return
	end
	local goods_id = GetItemParticular(goods_index) 
	local boss_seq = 0
	if goods_id == 1014 then
		boss_seq = 1
	elseif goods_id == 1047 then
		boss_seq = 2
	elseif goods_id == 1048 then
		boss_seq = 3
	else
		return
	end
	Say("B¹n ®ång ý dïng"..boss_list[boss_seq][4].."TriÖu gäi <color=red>"..boss_list[boss_seq][2].."<color> chø?",
		2,
		"Ta muèn triÖu gäi"..boss_list[boss_seq][2].."/#boss_create("..boss_seq..")",
		"§Ó ta suy nghÜ l¹i/end_dialog"
		)
end
--***************************boss´´½¨Í³Ò»º¯Êý·â×°*************************
function boss_create(boss_diff)
	SetTaskTemp(164,boss_diff)
	Zgc_pub_getwrdtask(11,11)
end
function WrdDataGetReturn_11(date_seq)
	local boss_diff = GetTaskTemp(164)
	if date_seq > zgc_pub_day_turn(1) then
		Talk(1,"end_dialog",boss_list[boss_diff][2].."cã chót nghi ngê, ngµy mai h·y quay l¹i!")
		return
	elseif date_seq == zgc_pub_day_turn(1) then
		Zgc_pub_getwrdtask(boss_diff,1)
	else
		Zgc_pub_setwrdtask(11,zgc_pub_day_turn(1),11)
	end
end
--*********************************bossÊýÁ¿ÉèÖÃ********************************
function WrdDataSetReturn_11()
	local boss_diff = GetTaskTemp(164)
	boss_num_set(boss_diff)
	--Zgc_pub_setwrdtask(boss_diff,1,1)
end
--*********************************bossÊýÁ¿»ØÖÃ********************************
function boss_num_set(boss_diff)
	SetTaskTemp(158,boss_diff)
	ApplyRelayShareData("Sè liÖu ID thÕ giíi",0,0,File_name,"CallBackBossNumSet")
end
function CallBackBossNumSet(szKey, nKey1, nKey2, nCount)			--bossÊýÁ¿ÉèÖÃ»Øµ÷
	DelRelayShareDataCopy(szKey,nKey1,nKey2)
	local boss_diff = GetTaskTemp(158)
	local boss_num = {}
	for i = 1,10 do
		if i == boss_diff then
			boss_num[i] = 1
		else
			boss_num[i] = 0
		end
	end
	AddRelayShareData("Sè liÖu ID thÕ giíi",0,0,File_name,"end_dialog",0,1,"dddddddddd",boss_num[1],boss_num[2],boss_num[3],boss_num[4],boss_num[5],boss_num[6],boss_num[7],boss_num[8],boss_num[9],boss_num[10])
	boss_crt_finish(boss_diff,0)
end
--*******************************Ò°ÍâbossÊýÁ¿ÅÐ¶Ï*******************************
function WrdDataGetReturn_1(boss_crt_num)
	local boss_diff = GetTaskTemp(164)
	if boss_crt_num >= boss_list[boss_diff][5] then
		Talk(1,"end_dialog",boss_list[boss_diff][2].."cã chót nghi ngê, ngµy mai h·y quay l¹i!")
		return
	else
		boss_crt_finish(boss_diff,boss_crt_num)
	end
end
--****************************ÕÙ»½bossÖ´ÐÐº¯Êý**********************************
function boss_crt_finish(boss_diff,boss_crt_num)
	if DelItem(2,1,boss_list[boss_diff][3],1) ~= 1 then
		Talk(1,"end_dialog","Xin x¸c nhËn trªn ng­êi cã <color=red>"..boss_list[boss_diff][4].."<color>!")
		return
	end
	local map_ID,att_X,att_Y = GetWorldPos()
	local npc_index = CreateNpc(boss_list[boss_diff][1],boss_list[boss_diff][2],map_ID,att_X,att_Y,-1,1,1,0)
	if npc_index ~= 0 then
		SetNpcScript(npc_index,boss_list[boss_diff][6])
	end
	Zgc_pub_setwrdtask(boss_diff,(boss_crt_num + 1),2)
end
--*************************bossÊýÁ¿Ôö¼Ó»Øµ÷º¯Êý£¨¿Õ£©******************************
function WrdDataSetReturn_2()

end

