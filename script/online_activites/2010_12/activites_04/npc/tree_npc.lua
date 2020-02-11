--=============================================
--create by xiongyizhi 2010-11-5
--describe:Ô½ÄÏ°æ12ÔÂ·İËÄÁéÊ÷»î¶¯ Ê÷NPC½Å±¾
--=============================================
Include("\\script\\online_activites\\2010_12\\activites_04\\head.lua")
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	
Include("\\script\\vng\\award\\feature_award.lua");

function main()
    local nNpcIndex = GetTargetNpc();
    local nLevel = Judge_tree_level_cost() --ÅĞ¶ÏÊ÷ÔÚÄÄ¸ö½×¶Î
    if Judge_tree_owner(nNpcIndex) == 0 then--Ö»ÄÜÍµ±ğÈËµÄ
        stolen_process(nNpcIndex);
        return 0; --ÍµÍê×ßÈË£¬²»ÄÜÑø±ğÈËµÄÊ÷
    end
    if nLevel == tonumber(getn(VET_201012_04_TB_TREE_GROW)) then --È«²¿³É³¤½×¶ÎÍêÁË£¬ÊÕ»ñ
        Say(VET_201012_04_NPC_TALK_STRINGS[12], 2, VET_201012_04_NPC_TALK_STRINGS[13].."/get_4_soul_tree_award",
                                                   VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");
    else 
        tree_feed_talk(nNpcIndex);
    end
end

function Judge_tree_owner(nNpcIndex)
    local nNpcName = GetNpcName(nNpcIndex);
    local nNameLen = strlen(GetName());
    if GetName() == strsub(nNpcName, 1, nNameLen) then --ÓÃÃû×ÖÀ´ÅĞ¶ÏÊÇ²»ÊÇÍæ¼ÒµÄÊ÷
	return 1;
    else
        return 0;
    end
end

--ÍµÇÔ´¦Àí,³É¹¦·µ»Ø1£¬²»³É¹¦·µ»Ø0
function stolen_process(nNpcIndex)
    if GetPlayerRoute() == 0 then
    	   Talk(1, "", "Ch­a gia nhËp m«n ph¸i kh«ng thÓ c­íp c©y!")
        return 0;
    end
    local nStolenFlag = GetUnitCurStates(nNpcIndex, 4);--ÍµÈ¡Ê±¼äÎª: 0²»µ½¿ÉÍµµÄ½×¶Î;Ê±¼ä´ÁÎªÍµµÄÊ±¼ä, -1ÎªÍµ¹ıÁË
    if nStolenFlag == 0 or GetTime() < nStolenFlag then --Ö»ÄÜÊÕ»ñ½×¶ÎÍµ
        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[18])
        return 0;
    end
    if nStolenFlag == -1 then 
        Talk(1, "", gf_FixColor(VET_201012_04_NPC_TB[2][2], 2, 1)..VET_201012_04_NPC_TALK_STRINGS[7]);
        return 0;
    else --Ã»ÓĞ±»Íµ¹ı
        for i = 1, getn(VET_201012_04_TB_ITEM) do
            gf_AddItemEx2({VET_201012_04_TB_ITEM[i][2][1], VET_201012_04_TB_ITEM[i][2][2], VET_201012_04_TB_ITEM[i][2][3], 1}, 
                          VET_201012_04_TB_ITEM[i][1], 
                          VET_201012_04_STR_LOG_TITLE, 
                          VET_201012_04_TB_LOG_ACTION_LIST[4], 
                          0, 
                          1);
        end
        nStolenFlag = - nStolenFlag - 1;
        AddUnitStates(nNpcIndex, 4, nStolenFlag); --Ê¹ÓÃNPCÍâ·ÀÎ»À´¼ÇÂ¼ÒÑ¾­ÍµÈ¡¹ıÁË
    end
end

--¸ù¾İ´ÓÖÖÏÂµ½ÏÖÔÚµÄÊ±¼ä,ÅĞ¶ÏÊ÷ÏÖÔÚ´¦ÓÚµÄ³É³¤½×¶Î
--ÒÀ´Î·µ»Ø ³É³¤½×¶Î£¬ÃèÊöÏûºÄµÄ×Ö·û´®
--Èç (5, "½½Ë®*1 Ê©·Ê*2 É±³æ*3 ")
function Judge_tree_level_cost()
    local nLife = tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME);
    local nLevel, nCostCount; 
    local szCost = "";
    if nLife < 0 then return -1 end

    local nLevelTime = VET_201012_04_TB_TREE_GROW[1][4];
    for nLevel = 1, getn(VET_201012_04_TB_TREE_GROW) do
        if nLife <= nLevelTime then --Èç¹ûÔÚÄ³¸ö½×¶ÎÇø¼ä£¬È¡µÃÕâ¸öÇø¼äµÄÏûºÄ
            if VET_201012_04_TB_TREE_GROW[nLevel][3] ~= nil then --ÒªÓĞ²ÄÁÏÏûºÄ£¬ÓĞµÄ½×¶Î¿ÉÄÜÃ»ÏûºÄ
                for nCostCount = 1,getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    local nSingleAct = get_cost2action_name(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1]);
                    szCost = szCost..format(nSingleAct.."*%d ", VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2]);--¼ÇÂ¼ÏÂ²ÄÁÏÏûºÄµÄ×Ö·û´®ÓÃÓÚ¶Ô»°£¬
                                                                                                                      --¸ñÊ½ "½½Ë®*1 Ê©·Ê*2 É±³æ*3 "
                end
                return nLevel, "["..szCost.."]";
            else 
                return nLevel, "";
            end
        else
            if nLevel + 1 <= getn(VET_201012_04_TB_TREE_GROW) then
                nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[nLevel + 1][4];
            end
        end
    end
    return 0, ""; --²»ÔÚÈÎºÎÇø¼äµÄ´íÎóÇé¿ö
end

--¸ù¾İVET_201012_04_TREE_ITEM_TO_ACTION±í£¬ÊäÈëÎïÆ·ID±í{G, D, P}, ·µ»ØÁ½¸öÖµ£¬ÒÀ´ÎÊÇ"¶ÔÓ¦¶¯×÷","ÎïÆ·Ãû"£¬ÕÒ²»µ½·µ»Ø0
function get_cost2action_name(tItem)
    local g, d, p = gf_UnPack(tItem);
    local g1, d1, p1
    for i = 1,getn(VET_201012_04_TREE_ITEM_TO_ACTION) do
        g1, d1, p1 = gf_UnPack(VET_201012_04_TREE_ITEM_TO_ACTION[i][2]);
        if g == g1 and d == d1 and p == p1 then  --²»ÄÜ±È½Ï±íµÄ±¿°ì·¨
            return VET_201012_04_TREE_ITEM_TO_ACTION[i][3], VET_201012_04_TREE_ITEM_TO_ACTION[i][1];        
        end
    end
    return 0;
end

--×Ô¼ºµÄÊ÷£¬Ö÷¶Ô»°,¾ö¶¨ÊÇ·ñÈÃ½½Ë®Ê©·Ê
function tree_feed_talk(nNpcIndex)
    local nLevel, szCost = Judge_tree_level_cost();
    if nLevel == 0 then
        reset_npc_player_state(nNpcIndex);
        return 0;
    end
    local tbTreeDialog = {};
    if szCost ~= "" and GetUnitCurStates(nNpcIndex, 5) ~= nLevel then
        tinsert(tbTreeDialog, szCost.."/#tree_feed_process("..nNpcIndex..")")
    end
    tinsert(tbTreeDialog, VET_201012_04_NPC_TALK_STRINGS[5].."/gf_DoNothing");--½áÊø¶Ô»°

    local nLevelTime = 0;
    for i = 1, nLevel do
        nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[i][4];
    end
    local nTime2NextLevel = nLevelTime - (tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
    if nTime2NextLevel < 0 then
        reset_npc_player_state(nNpcIndex);
        return 0;
    end
    local szLevelName = "["..VET_201012_04_TB_TREE_GROW[nLevel][1].."]";
    Say(format(VET_201012_04_NPC_TALK_STRINGS[10], szLevelName, nTime2NextLevel), getn(tbTreeDialog), tbTreeDialog);
end

--´¦Àí½½Ë®Ê©·ÊÕâĞ©²Ù×÷
function tree_feed_process(nNpcIndex)
    if GetTargetNpc() ~= nNpcIndex then --Èç¹û±£³Ö¶Ô»°Ò»Ö±²»µã,¿ÉÄÜÊ÷ÒÑ¾­ËÀÁË,µ«ÊÇNpcIndex±»ÆäËûnpcÕ¼ÁË
        return 0;
    end
    local nLife = tonumber(GetTime()) - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME);
    local nLevel, nCostCount;
    local szCost = "";
    if nLife < 0 then return -1 end
    local nLevelTime = VET_201012_04_TB_TREE_GROW[1][4];
    for nLevel = 1, getn(VET_201012_04_TB_TREE_GROW) do
        if nLife <= nLevelTime then --Èç¹ûÔÚÄ³¸ö½×¶ÎÇø¼ä£¬È¡µÃÕâ¸öÇø¼äµÄÏûºÄ
            if VET_201012_04_TB_TREE_GROW[nLevel][3] ~= nil then --ÒªÓĞ²ÄÁÏÏûºÄ£¬ÓĞµÄ½×¶Î¿ÉÄÜÃ»ÏûºÄ
                for nCostCount = 1, getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    if GetItemCount(gf_UnPack(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1])) 
                                    < VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2] then
                        Talk(1, "", VET_201012_04_NPC_TALK_STRINGS[11]); --ÑøÊ÷µÄ²ÄÁÏ²»¹»
                        return 0;
                    end
                end
                for nCostCount = 1,getn(VET_201012_04_TB_TREE_GROW[nLevel][3]) do
                    DelItem(VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][1], 
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][2],
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][1][3],
                            VET_201012_04_TB_TREE_GROW[nLevel][3][nCostCount][2]);
                end

                --¶¼´¦ÀíÍêÁË,ÖØĞÂÉú³ÉÏÂ¸ö½×¶ÎµÄNPC
                local nOldNpcIdx = nNpcIndex;
                nNpcIndex = CreateNpc(VET_201012_04_TB_TREE_GROW[nLevel][2], 
                                      GetName()..VET_201012_04_NPC_TALK_STRINGS[17]..VET_201012_04_NPC_TB[2][2], 
                                      GetNpcWorldPos(nOldNpcIdx));
                SetNpcScript(nNpcIndex, VET_201012_04_TREE_SCRIPT);
                SetNpcLifeTime(nOldNpcIdx, 0);  --É±ËÀÔ­NPC

                local nLevelTime = 0;
                for i = 1, (nLevel + 1) do
                    nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[i][4];
                end
                local nTime2NextLevel = nLevelTime - (GetTime() - GetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME));
                SetNpcLifeTime(nNpcIndex, nTime2NextLevel);
                AddUnitStates(nNpcIndex, 5, nLevel); --Ê¹ÓÃNPCÄÚ·Àµ¥Î»¼ÇÂ¼ÒÑ¾­Ñø¹ıÕâ¸ö½×¶Î
                local nStolenTime = GetTime() + nTime2NextLevel - VET_201012_04_TB_TREE_GROW[nLevel + 1][4]
                if nLevel + 1 == getn(VET_201012_04_TB_TREE_GROW) then
                    AddUnitStates(nNpcIndex, 4, nStolenTime) --Ê¹ÓÃNPCÍâ·ÀÎ»¼ÇÂ¼¿ÉÒÔÍµÈ¡µÄÊ±¼ä
                end
                return 0;
            end
        else
            nLevelTime = nLevelTime + VET_201012_04_TB_TREE_GROW[nLevel + 1][4]
        end
    end
end

function get_4_soul_tree_award()
    local nNpcIndex = GetTargetNpc();
    if Judge_tree_owner(nNpcIndex) == 0 then
        return 0;
    end
    local g,d,p;
    if gf_Judge_Room_Weight(4, 0, "") == 1 then
    		  ThuHoachCayTuLinh()
    	   --nhiÖm vô lµm giµu
	   if CFG_NhiemVuLamGiau == 1 then
			if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and gf_GetTaskBit(TSK_LAMGIAU, 9) == 0 then
				gf_SetTaskBit(TSK_LAMGIAU, 9, 1, 0)
				TaskTip("Hoµn thµnh nhiÖm vô lµm giµu: Trång thµnh c«ng 01 C©y Tø Linh.")
			end
	   end
		-----------------------Chuçi nhiÖm vô §ång Hµnh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 20 then
				DongHanh_SetStatus()
			end
		end
        gf_EventGiveCustomAward(1, 500000, 1, VET_201012_04_STR_LOG_TITLE, VET_201012_04_TB_LOG_ACTION_LIST[3])
        SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, 0)
        if GetUnitCurStates(nNpcIndex, 4) == -1 then --±»Íµ¹ıÁË
            for i = 1, getn(VET_201012_04_TB_ITEM) do
                g,d,p = gf_UnPack(VET_201012_04_TB_ITEM[i][2])
                if random(1, 2) == 1 then  --½üËÆ¸ø¸ö50%¸ÅÂÊ
                    gf_AddItemEx2({g, d, p, 3}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[3], 
                                  0, 
                                  1);
                else
                    gf_AddItemEx2({g, d, p, 2}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[3], 
                                  0, 
                                  1);
                end
            end
        else  --Ã»ÓĞ±»Íµ
            for i = 1, getn(VET_201012_04_TB_ITEM) do
                g,d,p = gf_UnPack(VET_201012_04_TB_ITEM[i][2])
                if random(1, 4) == 1 then  --½üËÆ¸ø¸ö25%¸ÅÂÊ
                    gf_AddItemEx2({g, d, p, 5}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[5], 
                                  0, 
                                  1);
                else
                    gf_AddItemEx2({g, d, p, 3}, 
                                  VET_201012_04_TB_ITEM[i][1], 
                                  VET_201012_04_STR_LOG_TITLE, 
                                  VET_201012_04_TB_LOG_ACTION_LIST[5], 
                                  0, 
                                  1);
                end
            end
        end
         -- NhiÖm vô chuyÓn sinh 5
        if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) < 69 then
		gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK3, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) +1)
		if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK3) == 69 then
			TaskTip("Hoµn thµnh yªu cÇu cña B¹ch Tiªn Sinh hoµn thµnh trång thµnh c«ng 69 c©y Tø Linh")
		end
	end
        reset_npc_player_state(nNpcIndex)
    end
end

function reset_npc_player_state(nNpcIndex)
    SetNpcLifeTime(nNpcIndex, 0); --NPC»îµÄÊ±¼ä³¬¹ıÖÖÊ÷Ê±¼äµÄ´íÎóÇé¿ö,É¾³ıÕâ¸öNPC
    SetTask(VET_201012_04_PLANT_4_SOUL_TREE_TIME, 0);
    return 0;
end
