--=============================================
--create by xiongyizhi
--describe:Ô½ÄÏ°æ2010Äê12ÔÂ»î¶¯3 Í·ÎÄ¼þ
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--ÈÎÎñ±äÁ¿Í·ÎÄ¼þ
Include("\\script\\online_activites\\2010_12\\activites_03\\strings.lua");--»î¶¯×Ö·û´®
Include("\\script\\lib\\globalfunctions.lua");--¹«¹²º¯ÊýÎÄ¼þ

VET_201012_03_EVENT_NUMBER = 21;--ÔÚ»î¶¯±íÉÏµÄ±àºÅÊÇ13
VET_201012_03_TIME_USER_DEFINE = 2517;--»ð¶ÑÊ±¼ä´¥·¢Æ÷×Ô¶¨ÒåID
VET_201012_03_TIME_TB_DEFINE = 1506;--»ð¶ÑÊ±¼ä´¥·¢Æ÷±íÄÚID
VET_201012_03_MATCH_COST = 200000; --»ð²ñ¼Û¸ñ20½ð
VET_201012_03_MAX_FIRE_TIMES = 4; --Ã¿ÈË×î¶à²ÎÓë»î¶¯4´Î
VET_201012_03_FIRE_LIFE = 5*60;         --»ð¶Ñnpc´æ»îÊ±¼ä£¬Êµ¼ÊÊ±ÏÞºÍ´¥·¢Æ÷Ê±ÏÞ¶¼ÂÔÎ¢ÓÐ¼Ó³¤ÐÞ¸´

function VET_201012_03_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201012_03_EVENT_NUMBER) == 1 then
        tinsert(tbSayDialog, VET_201012_03_TB_STRING_LIST[1].."/active_fire_for_warm"); --±£³Ö¹¦ÄÜ¶ÀÁ¢ÐÔ£¬Ìí¼Óµ½±¾¶ÀÁ¢ÎÄ¼þ¼Ð
        tinsert(tbSayDialog, VET_201012_03_TB_STRING_LIST[2].."/buy_match");
    end
    return tbSayDialog, szSayHead;
end

function active_fire_for_warm()
    local nTeamSize = GetTeamSize()
    if nTeamSize < 2 then
        Talk(1, "", VET_201012_03_TB_STRING_LIST[6])
        return
    end
    if GetCaptainName() ~= GetName() then
        Talk(1, "", VET_201012_03_TB_STRING_LIST[5])
        return
    end
    if Check_team_member(nTeamSize) == 0 then
        return 0;
    end
    to_set_fire_now(nTeamSize)
end

function buy_match()
    if GetCash() < VET_201012_03_MATCH_COST then
        Talk(1, "", VET_201012_03_TB_STRING_LIST[4])
        return
    end
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if Pay(VET_201012_03_MATCH_COST) == 1 then
        --SetTask(VET_201012_03_TASK_DATE_GOUMAILAZHU,nDate)
        local tbItemIds = {VET_201012_03_TB_ITEM_LIST[1][2],VET_201012_03_TB_ITEM_LIST[1][3],VET_201012_03_TB_ITEM_LIST[1][4],1}
        gf_AddItemEx2(tbItemIds, VET_201012_03_TB_ITEM_LIST[1][1],VET_201012_03_STR_LOG_TITLE,VET_201012_03_TB_LOG_ACTION_LIST[1],24*3600,1)
    end
end

function Is_In_City_Map()
    local nMapId = GetWorldPos()
    local bMapIsOk = 0
    for i = 1, getn(VET_201012_03_TB_MAPID) do
        if nMapId == VET_201012_03_TB_MAPID[i] then
            bMapIsOk = 1;
            break
        end
    end
    if bMapIsOk == 0 then
        return 0;
    end
end

function Check_team_member(nTeamSize)
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[7]);
            return 0;
        end
        if Is_In_City_Map() == 0 then
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201012_03_TB_STRING_LIST[12]);
            return 0;
        end
        local nLevel = GetLevel()
        if nLevel < 77 or GetPlayerFaction() == 0 or gf_Check55FullSkill() == 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[10]);
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201012_03_TB_STRING_LIST[10]);
            return 0;
        end
        if GetItemCount(VET_201012_03_TB_ITEM_LIST[1][2],VET_201012_03_TB_ITEM_LIST[1][3],VET_201012_03_TB_ITEM_LIST[1][4]) < 1 then
            PlayerIndex = nOldPlayer; --Õâ¸öÏûÏ¢¸æËß¶Ó³¤¾ÍÐÐÁË
            Talk(1, "", VET_201012_03_TB_STRING_LIST[8]);
            return 0;
        end
        local nTimes = GetTask(VET_201012_03_FIRE_TIMES)
        if times == nil then
            times = 0
        end
        if nTimes >= VET_201012_03_MAX_FIRE_TIMES then
            Talk(1, "", format(VET_201012_03_TB_STRING_LIST[11], VET_201012_03_MAX_FIRE_TIMES));
            return 0;
        end
    end
    PlayerIndex = nOldPlayer
end

function to_set_fire_now(nTeamSize)
    if GetTrigger(VET_201012_03_TIME_USER_DEFINE) ~= 0 then
    		Talk(1,"","B¹n ®ang ®èt 1 lß löa råi, kh«ng thÓ ®èt thªm!")
    		return
    end
    local nOldPlayer = PlayerIndex
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[7])
            return
        end
        if DelItem(VET_201012_03_TB_ITEM_LIST[1][2],VET_201012_03_TB_ITEM_LIST[1][3],VET_201012_03_TB_ITEM_LIST[1][4],1) ~= 1 then
            return
        end
    end
    PlayerIndex = nOldPlayer

    local nNpcIndex = CreateNpc(VET_201012_03_TB_NPCS[1][1],VET_201012_03_TB_NPCS[1][2],GetWorldPos())
    SetNpcLifeTime(nNpcIndex, VET_201012_03_FIRE_LIFE + 10)  --ÐÞÕý·ÀÖ¹NPCÏûÊ§ÄÃ²»µ½×îºóÒ»´Î¾­Ñé

    local nOldPlayer = PlayerIndex
    local nEndTime = GetTime() + 300
    for i = 1, nTeamSize do
        PlayerIndex = GetTeamMember(i)
        if PlayerIndex <= 0 then
            Talk(1, "", VET_201012_03_TB_STRING_LIST[7])
            return
        end
        SetTask(VET_201012_03_TASK_TIME_END_HUOCHAI, GetTime() + VET_201012_03_FIRE_LIFE + 20)     --´¥·¢Æ÷ÖÕÖ¹Ê±¼ä£¬·ÀÖ¹NPCÒâÍâ¶ªÊ§¡£´¥·¢Æ÷½«ÔÚNPCÊ±ÏÞ10ÃëºóÏûÊ§
        CreateTrigger(1, VET_201012_03_TIME_TB_DEFINE, VET_201012_03_TIME_USER_DEFINE);
        ContinueTimer(GetTrigger(VET_201012_03_TIME_USER_DEFINE));
        gf_WriteLogEx(VET_201012_03_STR_LOG_TITLE,VET_201012_03_TB_LOG_ACTION_LIST[2]) --by xiongyizhi ÐÂ¼Ó²Î¼Ó»î¶¯log
        SetTask(VET_201012_03_NPCIDX,nNpcIndex);
        SetTask(VET_201012_03_FIRE_TIMES, GetTask(VET_201012_03_FIRE_TIMES) + 1);
    end
    PlayerIndex = nOldPlayer
end

