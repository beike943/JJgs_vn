--´¥·¢Æ÷
--created by lizhi
--2005-9-10 13:29

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\WeekEnd\\task_head.lua");
Include("\\script\\task\\world\\g_random_head.lua");
Include("\\script\\online\\viet_event\\vng_task_control.lua")

function Path_Wrong(nPath)
	if nPath == PATH_BJ2QZ then
	    SetTask(TASK_GQ_DELIVER, 0);
	    for index, value in rect_trigger_table do
	        RemoveTrigger(GetTrigger(value[2]));
	    end;
	    for index, value in path_table do
	        SetTask(value, 0);
	    end;
    elseif nPath == PATH_XY2YZ then
		SetTask(TASK_GQ_DELIVER, 0);
	    for index, value in rect_trigger_table_2 do
	        RemoveTrigger(GetTrigger(value[2]));
	    end;
	    for index, value in path_table_2 do
	        SetTask(value, 0);
	    end;
    else
		SetTask(TASK_GQ_DELIVER, 0);
	    for index, value in rect_trigger_table_3 do
	        RemoveTrigger(GetTrigger(value[2]));
	    end;
	    for index, value in path_table_3 do
	        SetTask(value, 0);
	    end;
	end;
	
	Msg2Player(ErrorMsg);
	TaskTip(ErrorMsg);
end;

function Enter_Map()
    local nMapId = GetWorldPos();
    local nPath = GetTask(TASK_GQ_DELIVER);
    local nIndex = 0;
    local nCount = 0;
    
    if is_exist(finished_product_table) == 0 then	--Èç¹ûÃ»ÓÐ»õÎï
        SetTask(TASK_GQ_DELIVER, 0);
    	--ÒÆ³ý´¥·¢Æ÷
    	if nPath == PATH_BJ2QZ then
		    for index, value in rect_trigger_table do
		        if GetTrigger(value[2]) ~= 0 then
		            RemoveTrigger(GetTrigger(value[2]));
		        end;
		    end;
		else
			for index, value in rect_trigger_table_2 do
		        if GetTrigger(value[2]) ~= 0 then
		            RemoveTrigger(GetTrigger(value[2]));
		        end;
		    end;
		end;
		for i=1730, 1736 do	--Ã»Ê±¼äÁË£¬Ö±½ÓÐ´ËÀ
    		SetTask(i, 0);
    	end;
		Msg2Player("H×nh nh­ ng­¬i kh«ng mang vËt t­!");
		TaskTip("H×nh nh­ ng­¬i kh«ng mang vËt t­!");
	    return
	end
    
    if nPath == PATH_BJ2QZ then
		nIndex = 0;
		for index, value in path_table_index do
			if value == nMapId then
				nIndex = index;
				break
			end;
		end;
		SetTask(path_table[nIndex], 1);
    elseif nPath == PATH_XY2YZ then
		nIndex = 0;
		for index, value in path_table_2_index do
			if value == nMapId then
				nIndex = index;
				break
			end;
		end;
		SetTask(path_table_2[nIndex], 1);
	elseif nPath == PATH_YZ2XY then
		nIndex = 0;
		for index, value in path_table_3_index do
			if value == nMapId then
				nIndex = index;
				break
			end;
		end;
		SetTask(path_table_3[nIndex], 1);
    end;
    
    --ÅÐ¶ÏÊÇ·ñ°´ÕÕÂ·¾¶ÐÐ×ß
	if nPath == PATH_BJ2QZ then
		nCount = 0;
		for index, value in path_table_index do
			if value == nMapId then
				nCount = index;
				break
			end;
		end;
		for i=1, nCount do
			if GetTask(path_table[i]) == 0 then		--Ã»ÓÐ°´ÕÕÐÐ½øÂ·Ïß½øÐÐ
				Path_Wrong(nPath);
				return
			end;
		end;
	elseif nPath == PATH_XY2YZ then
		nCount = 0;
		for index, value in path_table_2_index do
			if value == nMapId then
				nCount = index;
				break
			end;
		end;
		for i=1, nCount do
			if GetTask(path_table_2[i]) == 0 then		--Ã»ÓÐ°´ÕÕÐÐ½øÂ·Ïß½øÐÐ
				Path_Wrong(nPath);
				return
			end;
		end;
	elseif nPath == PATH_YZ2XY then
		nCount = 0;
		for index, value in path_table_3_index do
			if value == nMapId then
				nCount = index;
				break
			end;
		end;
		for i=1, nCount do
			if GetTask(path_table_3[i]) == 0 then
				Path_Wrong(nPath);
				return
			end;
		end;
	end;

    Msg2Player(map_message[nPath][nMapId]);
    TaskTip(map_message[nPath][nMapId]);
end;

function Leave_Map_Boss()
    SetTask(TASK_NPC_INDEX, 0);
	SetTask(TASK_BOSS_INDEX, 0);
	--É¾³ýbossµÄrect´¥·¢Æ÷
	RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
	RemoveTrigger(GetTrigger(log_boss_table[2]));
	RemoveTrigger(GetTrigger(time_boss_table[2]));
end;

function Leave_Game_Boss()
    SetTask(TASK_NPC_INDEX, 0);
    SetTask(TASK_BOSS_INDEX, 0);
    --É¾³ýbossµÄrect´¥·¢Æ÷
    RemoveTrigger(GetTrigger(rect_boss_table[1][2]));
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(time_boss_table[2]));
end;

function Leave_Game_Wk()
    --ÖØÖÃÈÎÎñ±äÁ¿
    SetTask(TASK_GQ_DELIVER, 0);
    SetTask(TASK_GQ_KILLWK, 0);
    SetTask(TASK_GQ_KILLWK_START, 0);
    SetFightState(0);
    RemoveTrigger(GetRunningTrigger());
    
    for index, value in rect_wk_table do    --ÒÆ´¦ÇøÓò´¥·¢Æ÷
        RemoveTrigger(GetTrigger(value[2]));
    end;
    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;
    
    RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
end;

function Leave_Map_Wk()
    --ÖØÖÃÈÎÎñ±äÁ¿
    SetTask(TASK_GQ_DELIVER, 0);
    SetTask(TASK_GQ_KILLWK, 0);
    SetTask(TASK_GQ_KILLWK_START, 0);
    ForbidChangePK(0);  --pk
    SetFightState(0);
    SetLogoutRV(0);
    RemoveTrigger(GetRunningTrigger());
    RemoveTrigger(GetTrigger(log_wk_table[2]));

    for index, value in kill_trigger_table do
        RemoveTrigger(GetTrigger(value[2]));
    end;

    RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
    TaskTip("B¹n ®· rêi khái chiÕn tr­êng vµo Oa KhÊu.");
end;

function Kill_Wk()
    SetTask(TASK_GQ_KILLWK, GetTask(TASK_GQ_KILLWK) + 1);
    Msg2Player("§· hoµn thµnh nhiÖm vô cÊp ("..GetTask(TASK_GQ_KILLWK).."/"..MAXNUM_KILLWK..")");
    
    if GetTask(TASK_GQ_KILLWK) >= MAXNUM_KILLWK then
        --ÒÆ´¦´¥·¢Æ÷
        RemoveTrigger(GetRunningTrigger());

        for index, value in rect_wk_table do    --ÒÆ´¦ÇøÓò´¥·¢Æ÷
            RemoveTrigger(GetTrigger(value[2]));
        end;

        RemoveTrigger(GetTrigger(log_wk_table[2]));
        --ÒÆ³ý¼ÆÊ±Æ÷
        RemoveTrigger(GetTrigger(time_trigger_table["wk"][2]));
        
        SetTask(TASK_GQ_DELIVER, 0);
    	SetTask(TASK_GQ_KILLWK, 0);
    	SetTask(TASK_GQ_KILLWK_START, 0);
        SetLogoutRV(0);
        ForbidChangePK(0);  --pk
        SetFightState(0);
        --´«ËÍ³öÉ±ÙÁ¿ÜµØÍ¼
        NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
        --¼ÓÒ»ÂÖ
    	AddKillWkTimes(1);
    	SetTask(TASK_WK_ISDISCONNECT, 0);
        TaskTip("§Õn ChØ huy sø nhËn b¶o vËt §¹i Tèng ®i!");
    end;
end;

function Kill_All()
    local npcIndex, npcTemplete, npcName = GetTriggeringUnit();
    
    if CheckTime(5) == 0 and CheckTime(6) == 0 then	--ÐÇÆÚ5ÊÇ´ò¹ÖµôÂä²ÄÁÏµÄÊ±ºò
    	return
    end;
    
    if npcName == "Oa KhÊu" or npcName == "Oa KhÊu Binh sÜ" or npcName == "Oa KhÊu Thñy Binh" or npcName == "Oa KhÊu Lôc Binh" or npcName == "Oa KhÊu Vâ SÜ" then
        return
    end;

    local nMapId = GetWorldPos();
    local nCount = getn(material_table);
    local i = random(1, nCount);
    
    local maps_table = {105, 108, 201, 203, 205, 301, 304, 308};	--ÐÂÊÖµØÍ¼
	local nFlag = 0;
	for index, value in maps_table do
		if nMapId == value then
			nFlag = 1;
			break
		end;
	end;

	local nProbability = 1
	local nValue = GetTask(TASK_IB_BOOK1)
	if nValue ~= 0 then
		local nDate = mod(nValue, 1000000)
		if nDate >= tonumber(date("%y%j")) then
			nProbability = floor(nValue / 1000000)
		else
			SetTask(TASK_IB_BOOK1, 0)
		end
	end

	if nFlag == 1 then	--ÔÚÐÂÊÖµØÍ¼ÖÐ
        if g_probability(nProbability * 10, 100) then
            AddItem(material_table[i][1], material_table[i][2], material_table[i][3], 1, 1);
        end;
    else
        if g_probability(nProbability * 20, 100) then
            AddItem(material_table[i][1], material_table[i][2], material_table[i][3], 1, 1);
        end;
    end;
end;

function KillWk_OnTimer()   --Ê±¼äµ½
    --´«ËÍµ½Ô­À´µÄµØ·½
    SetFightState(0);
    ForbidChangePK(0);  --½ûÖ¹pk
    SetLogoutRV(0);
    NewWorld(GetTask(TASK_POSITION), GetTask(TASK_POSITION + 1), GetTask(TASK_POSITION + 2));
    
end;

function KillBoss_OnTimer()   --Ê±¼äµ½
	if GetTrigger(2516) ~= 0 then	
		local nFlag = floor(GetTask(TASK_PET_FIGHT)/10)	
			
		RemoveTrigger(GetTrigger(2516))
		
		SetTaskTemp(TSK_TMP_PET_INDEX,0)
		SetTaskTemp(TSK_TMP_ENEMY_INDEX,0)
		SetTaskTemp(TSK_TMP_PET_ENEMY_INDEX,0)
		
		AddUnitStates(nFlag,6, - GetUnitCurStates(nFlag,6))
		
		SetTask(TASK_PET_FIGHT,2)
		Say("So tµi B¹n §ång Hµnh lÇn nµy 2 bªn hßa nhau!",0)
		Msg2Player("So tµi B¹n §ång Hµnh lÇn nµy 2 bªn hßa nhau.")			
	else
	    SetTask(TASK_NPC_INDEX, 0);
	    SetTask(TASK_BOSS_INDEX, 0);
	    RemoveTrigger(GetRunningTrigger());
	    RemoveTrigger(rect_boss_table[1][2]);
	    RemoveTrigger(log_boss_table[2]);
	 end
end;