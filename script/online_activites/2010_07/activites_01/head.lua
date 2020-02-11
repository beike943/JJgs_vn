--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 头文件
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_07\\activites_01\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

VET_201007_01_EVENT_NUMBER = 10;--在活动表上的编号是10
VET_201007_01_CONST_KUANGSHIBAO_MAX = 10;
VET_201007_01_GET_CHONGWU_TIME = 8*60*60  --跟宠存在时间

function VET_201007_01_GivePlayerLoginItem()
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if GetItemCount(VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][4]) < 1 then
        gf_AddItemEx2({VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][2], VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][3], VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][4], 1}, VET_201007_01_TB_ITEM_LOGINGIVE_LIST[1][1], VET_201007_01_STR_LOG_TITLE, VET_201007_01_TB_LOG_ACTION_LIST[1], 0, 1);
    end
end

function VET_201007_01_Give_Faction_Award()
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 0 then

        return 0;
    end
    local tbAwardList = {
            [1] = 10, 
            [2] = 10, 
            [3] = 10, 
            [4] = 20, 
            [5] = 30, 
            [6] = 40, 
            [7] = 40, 
            [8] = 40, 
            [9] = 40, 
        };
    gf_EventFactionAward(
        {VET_201007_01_TB_ITEM_LIST[1][2], VET_201007_01_TB_ITEM_LIST[1][3], VET_201007_01_TB_ITEM_LIST[1][4]},
        VET_201007_01_TB_ITEM_LIST[1][1],
        tbAwardList,
        VET_201007_01_CONST_KUANGSHIBAO_MAX,
        GLB_TASK_FACTION_GET_DATE,
        GLB_TASK_FACTION_GET_COUNT,
        VET_201007_01_STR_LOG_TITLE
    );
end

function VET_201007_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward({VET_201007_01_TB_ITEM_LIST[1][2], VET_201007_01_TB_ITEM_LIST[1][3], VET_201007_01_TB_ITEM_LIST[1][4], 10},
                VET_201007_01_TB_ITEM_LIST[1][1], VET_201007_01_STR_LOG_TITLE);
    end
end

function VET_201007_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 1 then
        gf_GivePlantBigTreeAward({VET_201007_01_TB_ITEM_LIST[1][2], VET_201007_01_TB_ITEM_LIST[1][3], VET_201007_01_TB_ITEM_LIST[1][4], 15},
                VET_201007_01_TB_ITEM_LIST[1][1], VET_201007_01_STR_LOG_TITLE);
    end
end

function VET_201007_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward({VET_201007_01_TB_ITEM_LIST[1][2], VET_201007_01_TB_ITEM_LIST[1][3], VET_201007_01_TB_ITEM_LIST[1][4], 10},
                VET_201007_01_TB_ITEM_LIST[1][1], VET_201007_01_STR_LOG_TITLE);
    end
end

function VET_201007_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201007_01_TB_ITEM_LIST[1][2], VET_201007_01_TB_ITEM_LIST[1][3], VET_201007_01_TB_ITEM_LIST[1][4], 20},
                VET_201007_01_TB_ITEM_LIST[1][1], VET_201007_01_STR_LOG_TITLE);
    end
end

function VET_201007_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201007_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201007_01_TB_STRING_LIST[1];                            --锦囊大事件say的标题
        tinsert(tbSayDialog, VET_201007_01_TB_STRING_LIST[2].."/vet_201007_01_make_silingbaoshi");
        tinsert(tbSayDialog, VET_201007_01_TB_STRING_LIST[3].."/vet_201007_01_make_silingfuyuandan");
        --tinsert(tbSayDialog, VET_201007_01_TB_STRING_LIST[5].."/gf_DoNothing");
    end
   -- if tonumber(date("%y%m%d%H")) <= 10081224 then
   --     tinsert(tbSayDialog, VET_201007_01_TB_STRING_LIST[4].."/vet_201007_01_get_limited_award");
   -- end
    return tbSayDialog, szSayHead;
end

function vet_201007_01_make_silingbaoshi()
    if GetLevel() < 10 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[10])
        return
    end
    local nCheckMaterial = 1
    for i = 2,6 do
        if GetItemCount(VET_201007_01_TB_ITEM_LIST[i][2],VET_201007_01_TB_ITEM_LIST[i][3],VET_201007_01_TB_ITEM_LIST[i][4]) < 1 then
            nCheckMaterial = 0
            break
        end
    end
    if nCheckMaterial == 0 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[6])
        return
    end
    if gf_Judge_Room_Weight(2,100," ") ~= 1 then
        return
    end
    for i = 2, 6 do
        if DelItem(VET_201007_01_TB_ITEM_LIST[i][2],VET_201007_01_TB_ITEM_LIST[i][3],VET_201007_01_TB_ITEM_LIST[i][4],1) ~= 1 then
            nCheckMaterial = 0
            break
        end
    end
    if nCheckMaterial == 0 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[6])
        return
    end
    local tbItemIds = {VET_201007_01_TB_ITEM_LIST[8][2],VET_201007_01_TB_ITEM_LIST[8][3],VET_201007_01_TB_ITEM_LIST[8][4],1}
    gf_AddItemEx2(tbItemIds,VET_201007_01_TB_ITEM_LIST[8][1],VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[3],0,1)
    SelectSay()
end

function vet_201007_01_make_silingfuyuandan()
    if GetLevel() < 10 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[10])
        return
    end
    local nCheckMaterial = 1
    for i = 2,5 do
        if GetItemCount(VET_201007_01_TB_ITEM_LIST[i][2],VET_201007_01_TB_ITEM_LIST[i][3],VET_201007_01_TB_ITEM_LIST[i][4]) < 1 then
            nCheckMaterial = 0
            break
        end
    end
    if GetCash() < 60000 then
        nCheckMaterial = 0
    end
    if nCheckMaterial == 0 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[6])
        return
    end
    if gf_Judge_Room_Weight(2,100," ") ~= 1 then
        return
    end
    for i = 2, 5 do
        if DelItem(VET_201007_01_TB_ITEM_LIST[i][2],VET_201007_01_TB_ITEM_LIST[i][3],VET_201007_01_TB_ITEM_LIST[i][4],1) ~= 1 then
            nCheckMaterial = 0
            break
        end
    end
    if Pay(60000) ~= 1 then
        nCheckMaterial = 0
    end
    if nCheckMaterial == 0 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[6])
        return
    end
    local tbItemIds = {VET_201007_01_TB_ITEM_LIST[7][2],VET_201007_01_TB_ITEM_LIST[7][3],VET_201007_01_TB_ITEM_LIST[7][4],1}
    gf_AddItemEx2(tbItemIds,VET_201007_01_TB_ITEM_LIST[7][1],VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[4],0,1)
    SelectSay()
end

function vet_201007_01_get_limited_award()
    if GetLevel() < 10 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[10])
        return
    end
    if gf_Judge_Room_Weight(1,0," ") ~= 1 then
        return
    end
    local nSiLingFuYuanDan = GetTask(VET_201007_01_TASK_SILINGFUYUANDAN_NUM)
    if nSiLingFuYuanDan == nil then
        nSiLingFuYuanDan = 0
    end
    if nSiLingFuYuanDan < 1000 then
        Talk(1,"",format(VET_201007_01_TB_STRING_LIST[7],nSiLingFuYuanDan))
        return
    end
    if GetTask(VET_201007_01_TASK_FLAG_LIMITED_AWARD) == 1 then
        Talk(1,"",VET_201007_01_TB_STRING_LIST[12])
        return
    end
    SetTask(VET_201007_01_TASK_FLAG_LIMITED_AWARD,1)
    gf_EventGiveRandAward(VET_201007_01_SILINGFUYUANDANLIMITED_AWARD,1000,1,VET_201007_01_STR_LOG_TITLE,VET_201007_01_TB_LOG_ACTION_LIST[7])
end

function VET_201007_01_get_exp(nExp)
    local nHaveExp = GetExp()
    if 2000000000 - nHaveExp < nExp then
        nExp = 2000000000 - nHaveExp
    end
    ModifyExp(nExp)
end
