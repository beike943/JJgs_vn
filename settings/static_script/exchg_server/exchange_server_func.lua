--¿ç·ş¹«¹²º¯Êı¿â
Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\kuafu_battle\\kf_head.lua")
Include("\\settings\\static_script\\exchg_server\\exchange_paycoin_head.lua")
Include("\\script\\misc\\globaldatasync.lua")
Include("\\script\\missions\\nvn\\3v3.lua")

ESF_SZ_THIS_SCRIPT = "\\settings\\static_script\\exchg_server\\exchange_server_func.lua"

t_auto_sync_task_group = 
{
	--Ò»×éÍ¬²½µÄ±äÁ¿²»ÄÜ¹ı¶à ÒÑÖª³¬¹ı10¸ö±äÁ¿Ò»ÆğÍ¬²½»áÍ¬²½²»»ØÀ´ ËùÒÔÎå¶¾±äÁ¿·Ö³ÉÁË2×é·Ö¿ªÍ¬²½
	--task list,access code,route
	{{2204,2207,2210,2213,2216}, 0, 21},--Îå¶¾¹ÆÊ¦±äÁ¿×é1
	{{3132}, 12, nil}, --¿ç·şÕ½³¡´«»ØµÄÈÎÎñ±äÁ¿
	{{3134}, 13, nil}, --Í¨ÓÃ½ğ±ÒÏûºÄ
	{{2219,2222,2225,2228,2231}, 0, 21},--Îå¶¾¹ÆÊ¦±äÁ¿×é2
	{{3187,3188}, 0, nil}, --3v3Ã¿³¡½±Àø
	{{3202,3203}, 20, nil}, --°ï»á´óÂÒ¶·Ã¿³¡½±Àø
	{{661, 662,665, 666, 667}, 21, nil}, --±ÈÎä´ó»áÕ½¶·Êı¾İ
	{{668, 669, 670, 671, 672}, 21, nil}, --±ÈÎä´ó»áÕ½¶·Êı¾İ
	{{3219, 3220, 3221, 3222, 3223}, 21, nil}, --±ÈÎä´ó»áÕ½¶·Êı¾İ2
	{{3224, 3225, 3226, 3227, 3228}, 21, nil}, --±ÈÎä´ó»áÕ½¶·Êı¾İ2
	{{3254, 3255, 3256, 3257, 3258}, 30, nil}, --ÎäÁÖ¹¦Ñ«ºÍ½£ÏÀµãÊı
	{{3271, 3272, 3274}, 33, nil}, --¶÷Ô¹Ì¨Õ½³¡
	{{3273}, 34, nil}, --¿ç·şÏûºÄÌì½¾Áî
	{{3275, 3276, 3277}, 0, nil}, --¿ç·şÅÚÌ¨Õ½½á¹û£¬¸öÈË»ı·ÖºÍ»ı·Ö½±Àø
}

t_kf_reset_task_group = 
{
	--task list, resetvalue, access code, route
	{{2201,2202,2203,2205,2206,2208,2209,2211,2212,2214,2215,2217,2218,2220,2221,2223,2224,2226,2227,2229,2230}, 999,0, 21},--Îå¶¾¹ÆÊ¦±äÁ¿
}

------------------------------------------------------------------------------------------------------------
--µÇÈë´¦Àí
function exgsvr_func_on_player_login()
	--print("exgsvr_func_on_player_login:",GetName())
	if kf_is_in_match_area() == 0 then	--Ô­·ş
		sf_sync_task_group_from_kuafu() --±äÁ¿Í¬²½»ØÔ´·ş
	else								--¿ç·ş
		kf_reset_all_task_list()
	end
	exgsvr_func_check_init_p3v3(); --3v3¸ãÆğ
end

--µÇ³ö´¦Àí
function exgsvr_func_on_player_logout()
	--print("exgsvr_func_on_player_logout:",GetName())
	exgsvr_func_save_player_task()
	--3v3 uninit
	exgsvr_func_check_exit_p3v3()
end

function exgsvr_func_save_player_task()
	_tjl_player_syn_record() --¼ÇÂ¼Ìì½¾Áî
	
	if kf_is_in_match_area() == 0 then	--Ô­·ş
			
	else								--¿ç·ş
		kf_sync_all_task_to_source()
	end
end

------------------------------------------------------------------------------------------------------------

--Ô´·şÈÎÎñ±äÁ¿Í¬²½ºóµÄ»Øµ÷£¬¸ú¾ßÌå¹¦ÄÜÏà¹Ø
function on_kuafu_task_synced(nGroupId)
	--Í¬²½Íê³ÉºóÖ´ĞĞµÄ²Ù×÷
	if 2 == nGroupId then
		KF_PlayerLoginOriginServer() --¿ç·şÕ½³¡Íæ¼Ò¿ç»ØÔ´·şĞèÍê³ÉµÄ²Ù×÷£¨¿Û½ğ£©
	end	
	if 3 == nGroupId then
		pc_back_originalserver_pay() --Í¨ÓÃ½ğ±ÒÏûºÄ
	end
	if 5 == nGroupId then
		_3v3_every_match_award() --3v3Ã¿³¡½±Àø
	end
	if 13 == nGroupId then
		_tjl_player_syn_delitem(); --Ìì½¾Áî¿ç·şÏûºÄ
	end
	--print(format("\n%son_kuafu_task_synced(%d)",GetName(), nGroupId))
	--Msg2Player(format("task saved group %d",nGroupId))
end

function kf_reset_all_task_list()
	if kf_is_in_match_area() == 0 then--²»ÊÇ¿ç·ş£¬²»ÓÃÍ¬²½ÁË
		return 0
	end
	for i = 1,getn(t_kf_reset_task_group) do
		_kf_reset_task_group(i)
	end
end

function _kf_reset_task_group(nGroupId)
	if kf_is_in_match_area() == 0 then--²»ÊÇ¿ç·ş£¬²»ÓÃÍ¬²½ÁË
		return 0
	end
	
	local t = t_kf_reset_task_group[nGroupId]
	if t then
		if not t[4] or GetPlayerRoute() == t[4] then
			for k,v in t[1] do
				SetTask(v,t[2],t[3])
    		end
		end
	end
end

--(¿ç·ş)Í¬²½ËùÓĞ±äÁ¿µ½Ô­·ş
function kf_sync_all_task_to_source()
	if kf_is_in_match_area() == 0 then--²»ÊÇ¿ç·ş£¬²»ÓÃÍ¬²½ÁË
		return 0
	end
	for i = 1,getn(t_auto_sync_task_group) do
		_kf_sync_task_group_to_source(i)
	end
end

--ĞŞ¸Ä¿ç·şĞèÒªÍ¬²½µÄ±äÁ¿
function kf_set_auto_sync_task(nGroupId, nIndexInGroup, nValue)
	local t = t_auto_sync_task_group[nGroupId]
	if t then
		local nTaskId = t[1][nIndexInGroup]
		if nTaskId then
			SetTask(nTaskId, nValue, t[2])
			return _kf_sync_task_group_to_source(nGroupId)
		end
	end
	return 0
end

--»ñÈ¡¿ç·şĞèÒªÍ¬²½µÄ±äÁ¿
function kf_get_auto_sync_task(nGroupId, nIndexInGroup)
	local t = t_auto_sync_task_group[nGroupId]
	if t then
		local nTaskId = t[1][nIndexInGroup]
		if nTaskId then
			return GetTask(nTaskId)
		end
	end
	return 0
end

--½â°ütable¡£
--²ÎÊı1£ºÊäÈëtable
--²ÎÊı2£º¿ªÊ¼Î»ÖÃ¡£Ä¬ÈÏÖµÎª1
--²ÎÊı3£º½áÊøÎ»ÖÃ¡£Ä¬ÈÏÖµÎªtable´óĞ¡
function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

--ÈÎÎñ±äÁ¿Í¬²½Ô´·ş
function _kf_sync_task_group_to_source(nGroupId)
	if kf_is_in_match_area() == 0 then--²»ÊÇ¿ç·ş£¬²»ÓÃÍ¬²½ÁË
		return 0
	end
	
	local t = t_auto_sync_task_group[nGroupId]
	if t then
		if (not t[3]) or (GetPlayerRoute() == t[3]) then
    		local strGbGroup,strName = _kf_GetRealmName(GetName())
    		local szKey, nKey1, nKey2,szItem = _kf_get_kuafu_share_data_keys(strName, nGroupId)
    		local strFormat = ""
    		local tb_value = {}
    		for k,v in t[1] do
    			local nValue = GetTask(v)
    			strFormat = strFormat.."dd"
    			tinsert(tb_value,v)
    			tinsert(tb_value,nValue)
    		end
    		--print(format("\nAddRelayShareDataToSourceRealm(%s,%d,%d,%s)",szKey, nKey1, nKey2,szItem))
    		AddRelayShareDataToSourceRealm(szKey, nKey1, nKey2,ESF_SZ_THIS_SCRIPT,"_kf_callback_nothing",0, szItem ,strFormat,gf_UnPack(tb_value))
    	end
	end
	return 0
end

function _kf_callback_nothing()
	--print("\n_kf_callback_nothing")
end

function _kf_get_kuafu_share_data_keys(szName, nGroupId)
	szName ="KF_"..szName
	local szItem = "GSTSK"..tostring(nGroupId)
	return szName,0, nGroupId, szItem
end

--´Ó¿ç·şÍ¬²½ÈÎÎñ±äÁ¿Êı¾İ
function sf_sync_task_group_from_kuafu()
	if kf_is_in_match_area() == 1 then--ÊÇ¿ç·ş£¬¾Í²»ÓÃÍ¬²½ÁË
		return 0
	end
	
	--print("kf_sync_task_group_from_kuafu")
	
	for i= 1,getn(t_auto_sync_task_group) do
		if not t_auto_sync_task_group[i][3] or GetPlayerRoute() == t_auto_sync_task_group[i][3] then
			local szKey, nKey1, nKey2,szItem = _kf_get_kuafu_share_data_keys(GetName(), i)
			ApplyRelayShareData(szKey,nKey1,nKey2,ESF_SZ_THIS_SCRIPT,"_kf_sync_task_group_from_kuafu_callback")
			--print(format("\nApplyRelayShareData(%s,%d,%d,%s)",szKey,nKey1,nKey2,szItem))
		end
	end
	return getn(t_auto_sync_task_group)
end

function _kf_sync_task_group_from_kuafu_callback(strName,nKey1,nKey2,nItemCount, strSrcName,nSrcKey1,nSrcKey2)
	if strSrcName and nSrcKey1 and nSrcKey2 then--Ö¸¶¨µÄÊı¾İ²»´æÔÚ
		DelRelayShareDataCopy(strSrcName,nSrcKey1,nSrcKey2)
		ClearRelayShareData(strSrcName,nSrcKey1,nSrcKey2,ESF_SZ_THIS_SCRIPT,"_kf_clear_relay_share_data_callback")
		
		local szMsg = format("kuafu share data(%s,%d,%d) not exist",strSrcName,nSrcKey1,nSrcKey2)
		--print(format("\n%s",szMsg))
		WriteLogEx(szMsg)
		return
	end
	
	--print(format("\n_get relay share data(%s,%d,%d,%d)",strName,nKey1,nKey2,nItemCount))
	
	local szItem = "GSTSK"..tostring(nKey2)
	local nValue = GetRelayShareDataByKey(strName,nKey1,nKey2,szItem)
	if nValue == nil or nValue < 0 then
		WriteLogEx(format("get relay share data(%s,%d,%d,%s) fail",strName,nKey1,nKey2,szItem))
		return 0
	end
	
	local TbList = _kf_return_tb(GetRelayShareDataByKey(strName,nKey1,nKey2,szItem))
	if getn(TbList) < 2 then
		return 0
	end
	local t = t_auto_sync_task_group[nKey2] or {}
	local nAcc = t[2]
	for i=1,getn(TbList),2 do
		if TbList[i] ~= 0 and TbList[i+1] ~= nil then
			SetTask(TbList[i],TbList[i+1], nAcc)
		end
	end
	
	DelRelayShareDataCopy(strName,nKey1,nKey2)
	ClearRelayShareData(strName,nKey1,nKey2,ESF_SZ_THIS_SCRIPT,"_kf_clear_relay_share_data_callback")
	on_kuafu_task_synced(nKey2)
	return 1
end

function _kf_clear_relay_share_data_callback(strName,nKey1,nKey2)
	--do nothing
end

function _kf_return_tb(...)
	local nReturnTb = {}
	for i=1,arg.n do
		tinsert(nReturnTb,arg[i])
	end
	return nReturnTb
end

function kf_is_in_match_area()
	local nVersion,nCurGs = GetRealmType()
	return nCurGs or 0
end

--»ñÈ¡¿ç·şÍæ¼ÒÇø·şºÍÃû×Ö
function _kf_GetRealmName(strName)
	local aa,bb,strGbGroup,strGbName = strfind(strName,"(.-)*(.*)")
	return strGbGroup,strGbName
end

--ÊÇ·ñÒª¸ãÆğ3v3
function exgsvr_func_check_init_p3v3()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	--Í¬²½3v3ÈÎÎñ±äÁ¿
	local nVersion,nCurGs = GetRealmType()
	--Ô´·ş
	if nCurGs ~= 1 then
		if GetTask(TASKID_NEED_SYNC_REALM_DATA) ~= 0 then
			SetTask(TASKID_NEED_SYNC_REALM_DATA, 0);
			GDS_updateTask(5,0);
		end
		--¿çÈü¼¾µÄ»°³õÊ¼»¯ÈÎÎñ±äÁ¿
		_3v3_CrossMatchRetsetPlayerTask();
	end
	--¿ç·ş£¬ÊÇ¸ã3v3µÄ£¬Æ®¹ı
	local nMap_ID = GetWorldPos();
	if nCurGs == 1 and nMap_ID == 8000 then
		P3v3_Join();
		SendScript2Client("Open('3v3')");
	end
end

function exgsvr_func_check_exit_p3v3()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType()
	local nMap_ID = GetWorldPos();
	if nCurGs == 1 and nMap_ID == 8000 then
		P3v3_Leave();
	end
end

--playerlogout
function _tjl_player_syn_record()
	--¼ÇÂ¼Ìì½¾ÁîÊıÄ¿------
	local nTJL = BigGetItemCount(2, 97, 236);
	SetTask(TASKID_PLAYER_TJL_COUNT, nTJL, TASK_ACCESS_CODE_KFTJL);
	local _,nCurGs = GetRealmType()
	WriteLog(format("[_tjl_player_syn_record]PlayerLogout\t%s\t%s\t%d\t%d", GetAccount(), GetName(), nTJL, nCurGs));
end

--playerlogin
function _tjl_player_syn_delitem()
	local nTJL = BigGetItemCount(2, 97, 236);
	local nTaskTJL = GetTask(TASKID_PLAYER_TJL_COUNT);
	local nNeedDel = max(nTJL-nTaskTJL, 0);
	if nNeedDel <= 0 then
		return 0;
	end
	--ÓÅÏÈÏûºÄ±³°üÄÚµÀ¾ß
	local realcost = 0;
	local bagCount = GetItemCount(2, 97, 236);
	if bagCount >= nNeedDel then
		if DelItem(2, 97, 236, nNeedDel) == 1 then
			realcost = realcost + nNeedDel;
		end
	else
		if bagCount > 0 then
			if DelItem(2, 97, 236, bagCount) == 1 then
				realcost = realcost + bagCount; 
			end
		end
		if BigDelItem(2, 97, 236, nNeedDel - bagCount) == 1 then
			realcost = realcost + (nNeedDel - bagCount);
		end
	end
	SetTask(TASKID_PLAYER_TJL_COUNT, nTaskTJL - realcost, TASK_ACCESS_CODE_KFTJL);
	WriteLog(format("[_tjl_player_syn_delitem]PlayerLogin\t%s\t%s\t%d\t%d\t%d\t%d", GetAccount(), GetName(), nTJL, nTaskTJL, nNeedDel, realcost));
	if realcost < nNeedDel then
		WriteLog(format("[ERROR]_tjl_player_syn_delitem name:%s realcost:%d < nNeedDel:%d", GetName(), realcost, nNeedDel));
	end
end

--¿ç·ş½ÓÒıÈË
t_kuafu_guide_npc_pos_gs={
	{300, 1850, 3550, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{100, 1344, 2939, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{150, 1775, 3119, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{350, 1606, 2937, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
}
--¿ç·şÁì½±ÈË
t_kuafu_award_npc_pos_gs={
	{300, 1855, 3556, "ZM_jieyingren", "Ng­êi Ph¸t Th­ëng Liªn Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
	{350, 1613, 2944, "ZM_jieyingren", "Ng­êi Ph¸t Th­ëng Liªn Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
	{100, 1350, 2946, "ZM_jieyingren", "Ng­êi Ph¸t Th­ëng Liªn Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
	{150, 1781, 3126, "ZM_jieyingren", "Ng­êi Ph¸t Th­ëng Liªn Server", "\\script\\exchg_server\\exchg_server_award_npc.lua"},
}
--¿ç·ş½ÓÒıÈË
t_kuafu_guide_npc_pos_ggs = {
	{428, 1290, 2693, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{428, 1431, 2809, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{428, 1512, 2720, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
	{428, 1347, 2592, "Vâ L©m Minh Chñ1", "Lien Dau Tiep Dan Quan", "\\script\\exchg_server\\exchg_server_npc.lua"},
}
--¿ç·ş±¨ÃûÈË1
t_kuafu_join_npc_pos1_ggs={
	{428, 1310, 2671, "KFZC_songshangbing", "ChiÕn tr­êng liªn ®Êu","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
	{428, 1403, 2778, "KFZC_songshangbing", "ChiÕn tr­êng liªn ®Êu","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
	{428, 1483, 2723, "KFZC_songshangbing", "ChiÕn tr­êng liªn ®Êu","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
	{428, 1376, 2588, "KFZC_songshangbing", "ChiÕn tr­êng liªn ®Êu","\\script\\missions\\kuafu_battle\\npc\\kf_jieyinren.lua"},
}
--¿ç·ş±¨ÃûÈË2
t_kuafu_join_npc_pos2_ggs={
	{428, 1310, 2714, "Tèng T­íng Qu©n", "§¹i Sø Bang Ph¸i","\\script\\ÊÀ½çµØÍ¼\\¿ç·şÑİÎä³¡\\npc\\tong_ambassagor.lua"},
	{428, 1413, 2828, "Tèng T­íng Qu©n", "§¹i Sø Bang Ph¸i","\\script\\ÊÀ½çµØÍ¼\\¿ç·şÑİÎä³¡\\npc\\tong_ambassagor.lua"},
	{428, 1501, 2724, "Tèng T­íng Qu©n", "§¹i Sø Bang Ph¸i","\\script\\ÊÀ½çµØÍ¼\\¿ç·şÑİÎä³¡\\npc\\tong_ambassagor.lua"},
	{428, 1358, 2588, "Tèng T­íng Qu©n", "§¹i Sø Bang Ph¸i","\\script\\ÊÀ½çµØÍ¼\\¿ç·şÑİÎä³¡\\npc\\tong_ambassagor.lua"},
}
--¿ç·ş±¨ÃûÈË3
t_kuafu_join_npc_pos3_ggs = {
	{428, 1330, 2695, "EYT_NPC", "Ng­êi tiÕp dÉn ¢n O¸n §µi","\\script\\missions\\eyt_battle\\join_npc.lua"},
	{428, 1387, 2802, "EYT_NPC", "Ng­êi tiÕp dÉn ¢n O¸n §µi","\\script\\missions\\eyt_battle\\join_npc.lua"},
	{428, 1490, 2755, "EYT_NPC", "Ng­êi tiÕp dÉn ¢n O¸n §µi","\\script\\missions\\eyt_battle\\join_npc.lua"},
	{428, 1359, 2618, "EYT_NPC", "Ng­êi tiÕp dÉn ¢n O¸n §µi","\\script\\missions\\eyt_battle\\join_npc.lua"},
}

function _kf_create_npc_list(tNpcList)
	for _, tNpc in tNpcList do
		local npc = CreateNpc(tNpc[4], tNpc[5], tNpc[1], tNpc[2], tNpc[3]);
		if npc > 0 then
			SetNpcScript(npc, tNpc[6] or "");
		else
			WriteLogEx(format("Create[%s] Npc[%s][%s] fail", tNpc[1], tNpc[2], tNpc[6] or ""))
		end
	end
end

function _kf_create_npc_server_start()
	local _, at_ggs = GetRealmType()
	if at_ggs == 0 then
		_kf_create_npc_list(t_kuafu_guide_npc_pos_gs)
		_kf_create_npc_list(t_kuafu_award_npc_pos_gs)
	else
		_kf_create_npc_list(t_kuafu_guide_npc_pos_ggs)
		_kf_create_npc_list(t_kuafu_join_npc_pos1_ggs)
		_kf_create_npc_list(t_kuafu_join_npc_pos2_ggs)
		if ISEytSystemOpen() ~= 0 then
			_kf_create_npc_list(t_kuafu_join_npc_pos3_ggs)
		end
	end
end

function _check_to_kuafu_condition()
	local nTransLevel = gf_GetPlayerRebornCount() * 100 + GetLevel()
	if nTransLevel < 596 or GetPlayerRoute() == 0 then
		Talk(1, "", "ChuyÓn sinh 5 cÊp 96 vµ ®· gia nhËp l­u ph¸i míi cã thÓ vµo liªn server")
		return 0;
	end
	if 1 ~= _check_exgsvr_click_time() then
		return 0;
	end
	if 1 ~= _check_exgsvr_pay_money() then
		return 0;
	end
	return 1;
end

--¼ì²éÊ±¼ä¼ä¸ô
function _check_exgsvr_click_time()
	local NEED_TIME = 15
	local nLastTime = GetTask(TASKID_EXCHG_SVR_TIME);
	local nCurTime = GetTime();
	local nPastTime = nCurTime - nLastTime;
	if nPastTime < NEED_TIME then
		Talk(1,"",format("Thao t¸c qu¸ nhiÒu, %ds sau h·y thö l¹i", NEED_TIME - nPastTime));
		return 0;
	end
	return 1;	
end

--¿ç·şÏûºÄ½ğ×Ó
function _check_exgsvr_pay_money()
	local nPay = 10 --10Òø
	if GetCash() < nPay then
		Talk(1, "", format("Vµng kh«ng ®ñ %d", nPay))
		return 0;
	end
	Msg2Player(format("Liªn server sÏ tiªu hao %d b¹c", nPay));
	return 1;
end


