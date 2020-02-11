--=============================================
--create by zhoulimei 2010.5.11
--describe:越南版2010年6月活动1 头文件
--=============================================

Include("\\script\\online_activites\\task_values.lua");                         --任务变量头文件
Include("\\script\\online_activites\\2010_06\\activites_01\\strings.lua");     --活动字符串
Include("\\script\\lib\\globalfunctions.lua");


VET_201006_01_EVENT_NUMBER = 7;                                                  ----在活动表上的编号是7

VET_201006_01_GIVETOSON_STARTTIME = 2010060400;
VET_201006_01_GIVETOSON_ENDTIME = 2010070500; 
VET_201006_01_USETECHAN_COUNT_MAX = 1500;                                       ----水果特产使用上限1500次
VET_201006_01_USEMIYIN_COUNT_MAX = 8;                                           ----每天使用秘印8个
VET_201006_01_NUM_GET_FACTION_AWARD_MAX_COUNT = 10;                             ----每天获得最多次数

function VET_201006_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 1 then
        szSayHead = VET_201006_01_TB_STRING[1];                            --锦囊大事件say的标题
        tinsert(tbSayDialog, VET_201006_01_TB_STRING[2].."/vet_201006_01_make_techan");
        tinsert(tbSayDialog, VET_201006_01_TB_STRING[3].."/vet_201006_01_get_limited_award");
        if gf_CheckEventDateEx2(VET_201006_01_GIVETOSON_STARTTIME, VET_201006_01_GIVETOSON_ENDTIME) == 1 then
            tinsert(tbSayDialog, VET_201006_01_TB_STRING[4].."/#vet_201006_01_give_to_son(0)");
        end
        --tinsert(tbSayDialog, VET_201006_01_TB_STRING[5].."/vet_201006_01_end_dialog");
    end
    return tbSayDialog, szSayHead;
end

function vet_201006_01_add_jinnangdashijian()
    if GetItemCount(VET_201006_01_ITEM_LOGIN_GIVE[2][1], VET_201006_01_ITEM_LOGIN_GIVE[2][2], VET_201006_01_ITEM_LOGIN_GIVE[2][3]) < 1 then
        AddItem(VET_201006_01_ITEM_LOGIN_GIVE[2][1], VET_201006_01_ITEM_LOGIN_GIVE[2][2], VET_201006_01_ITEM_LOGIN_GIVE[2][3], 1);
    end
end

function vet_201006_01_make_techan()
    local tbSay = {};
    if GetItemCount(VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3]) < 6 then
        tinsert(tbSay, VET_201006_01_TB_STRING[5] .. "/vet_201006_01_end_dialog");
        Say(VET_201006_01_TB_STRING[11], getn(tbSay), tbSay);
        return 0;
    end
    
    if GetItemCount(VET_201006_01_ZHIZUOJINGNANG[2][1], VET_201006_01_ZHIZUOJINGNANG[2][2], VET_201006_01_ZHIZUOJINGNANG[2][3]) < 1 then
        tinsert(tbSay, VET_201006_01_TB_STRING[5] .. "/vet_201006_01_end_dialog");
        Say(VET_201006_01_TB_STRING[11], getn(tbSay), tbSay);
        return 0;
    end
    
    --负重检测
    if gf_Judge_Room_Weight(1, 0, "") == 0 then
        return 0;
    end
    
    local nRetCode = DelItem(VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3], 6);
    if nRetCode == 0 then
        gf_WriteLogEx(VET_201006_01_STR_LOG_TITLE, VET_201006_01_TB_LOG_ACTION[1] .. VET_201006_01_TB_LOG_ACTION[3]);
        return 0;
    end
    
    local nRetCode = DelItem(VET_201006_01_ZHIZUOJINGNANG[2][1], VET_201006_01_ZHIZUOJINGNANG[2][2], VET_201006_01_ZHIZUOJINGNANG[2][3], 1);
    if nRetCode == 0 then
        gf_WriteLogEx(VET_201006_01_STR_LOG_TITLE, VET_201006_01_TB_LOG_ACTION[1] .. VET_201006_01_TB_LOG_ACTION[4]);
        return 0;
    end
    
    gf_EventGiveRandAward(VET_201006_01_TECHAN_HECHEN, 100, 1, VET_201006_01_STR_LOG_TITLE, VET_201006_01_TB_LOG_ACTION[1]);
    SelectSay()
end

function vet_201006_01_get_limited_award()
    local nUseCount = GetTask(VET_201006_01_TASK_USETECHAN_COUNT);
    local tbSay = {};
    if nUseCount < VET_201006_01_USETECHAN_COUNT_MAX then
        tinsert(tbSay, VET_201006_01_TB_STRING[5] .. "/vet_201006_01_end_dialog");
        Say(format(VET_201006_01_TB_STRING[12], nUseCount), getn(tbSay), tbSay);
        return 0;
    end
    
    if GetTask(VET_201006_01_TASK_FLAG_GET_UP_AWARD) == 1 then
        tinsert(tbSay, VET_201006_01_TB_STRING[5] .. "/vet_201006_01_end_dialog");
        Say(VET_201006_01_TB_STRING[13], getn(tbSay), tbSay);
        return 0;
    end
    
    --负重检测
    if gf_Judge_Room_Weight(1, 1, "") == 0 then
        return 0;
    end
    SetTask(VET_201006_01_TASK_FLAG_GET_UP_AWARD, 1);
    gf_EventGiveCustomAward(1, 50000000, 0, "Hoat dong thang 6")
    gf_EventGiveRandAward(VET_201006_01_USETECHAN_AWARD_LIST_UP, 10000, 1, VET_201006_01_STR_LOG_TITLE, VET_201006_01_TB_LOG_ACTION[2]);
end

function vet_201006_01_give_to_son(nNpcFlag)
    local nSex = GetSex();
    local tbSay = {};
    local szNpcName = "";
    if nNpcFlag == 0 then
        szNpcName = "";
    else
        szNpcName = VET_201006_01_STR_NPC_NAME;
    end
    tinsert(tbSay, VET_201006_01_TB_STRING[6].."/#vet_201006_01_eat(1, "..nNpcFlag..")");
    tinsert(tbSay, VET_201006_01_TB_STRING[7].."/#vet_201006_01_eat(2, "..nNpcFlag..")");
    tinsert(tbSay, VET_201006_01_TB_STRING[8].."/#vet_201006_01_eat(3, "..nNpcFlag..")");
    tinsert(tbSay, VET_201006_01_TB_STRING[9].."/#vet_201006_01_eat(4, "..nNpcFlag..")");
    tinsert(tbSay, VET_201006_01_TB_STRING[10].."/vet_201006_01_end_dialog");
    Say(szNpcName .. VET_201006_01_TB_STRING[14][nSex],
    getn(tbSay),
    tbSay
    )
end

function vet_201006_01_eat(nType, nNpcFlag)
    local szNpcName = "";
    if nNpcFlag == 0 then
        szNpcName = "";
    else
        szNpcName = VET_201006_01_STR_NPC_NAME;
    end
    
    if vet_201006_01_limit_50() == 0 then
        Talk(1, "", szNpcName .. VET_201006_01_TB_STRING[20]);
        return 0;
    end
    
    local nDate = tonumber(date("%Y%m%d"));
    local tbSay = {};
    if GetTask(VET_201006_01_TASK_FLAG_EAT) < nDate then
        SetTask(VET_201006_01_TASK_FLAG_EAT, nDate);
        SetTask(VET_201006_01_TASK_FLAG_GIVETOSON, 0); 
    end
    local nNum = GetTask(VET_201006_01_TASK_FLAG_GIVETOSON);
    local nDiv = 1;
    if nType == 1 then
        nDiv = 1000;
    elseif nType == 2 then
        nDiv = 100;
    elseif nType == 3 then
        nDiv = 10;
    elseif nType == 4 then
        nDiv = 1;
    end
    local nFlag = mod(floor(nNum /nDiv), 10);
    if nFlag ~=  0 then
        tinsert(tbSay, VET_201006_01_TB_STRING[18] .. "/vet_201006_01_end_dialog");
        Say(szNpcName .. VET_201006_01_TB_STRING[17], getn(tbSay), tbSay);
        return 0;
    end
    
    local nSex = GetSex();
    if GetItemCount(VET_201006_01_TECHAN_HECHEN[nType][4][1], VET_201006_01_TECHAN_HECHEN[nType][4][2], VET_201006_01_TECHAN_HECHEN[nType][4][3]) < 10 then
        tinsert(tbSay, VET_201006_01_TB_STRING[16] .. "/vet_201006_01_end_dialog");
        Say(szNpcName .. VET_201006_01_TB_STRING[15][nSex], getn(tbSay), tbSay);
        return 0;
    end
    
    --负重检测
    if gf_Judge_Room_Weight(1, 1, "") == 0 then
        return 0;
    end
    
    SetTask(VET_201006_01_TASK_FLAG_EAT, nDate);
    SetTask(VET_201006_01_TASK_FLAG_GIVETOSON, nNum + nDiv);
    nRetCode = DelItem(VET_201006_01_TECHAN_HECHEN[nType][4][1], VET_201006_01_TECHAN_HECHEN[nType][4][2], VET_201006_01_TECHAN_HECHEN[nType][4][3], 10);
    if nRetCode == 1 then
        --获得经验奖励
        vet_201006_01_get_exp(2200000);
        gf_EventGiveRandAward(VET_201006_01_GIVETOSON_AWARD, 100, 1, VET_201006_01_STR_LOG_TITLE, VET_201006_01_TB_LOG_ACTION[5]);
    end
end


function vet_201006_01_get_exp(nExp)
    if 2000000000 - GetExp() < nExp then
        nExp = 2000000000 - GetExp();
    end
    ModifyExp(nExp);
end

--50级并且加入门派限制
function vet_201006_01_limit_50()
    if GetLevel() < 10 then
        return 0;
    end
   -- if GetPlayerFaction() == 0 then
   --     return 0;
   -- end
    return 1;
end

--73级并且加入门派限制
function vet_201006_01_limit_73()
    if GetLevel() < 10 then
        return 0;
    end
   -- if GetPlayerFaction() == 0 then
   --    return 0;
    --end
    return 1;
end


function VET_201006_01_Give_Faction_Award()
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    local tbAwardList = {
            [1] = 30, 
            [2] = 30, 
            [3] = 30, 
            [4] = 30, 
            [5] = 30, 
            [6] = 50, 
            [7] = 60, 
            [8] = 70, 
            [9] = 80, 
        };
    gf_EventFactionAward(
        {VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3]},
        VET_201006_01_SHUIGUOPAN[1],
        tbAwardList,
        VET_201006_01_NUM_GET_FACTION_AWARD_MAX_COUNT,
        GLB_TASK_FACTION_GET_DATE,
        GLB_TASK_FACTION_GET_COUNT,
        VET_201006_01_STR_LOG_TITLE
    );
end

function VET_201006_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward({VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3], 80},
                VET_201006_01_SHUIGUOPAN[1], VET_201006_01_STR_LOG_TITLE);
    end
end

function VET_201006_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 1 then
        gf_GivePlantBigTreeAward({VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3], 120},
                VET_201006_01_SHUIGUOPAN[1], VET_201006_01_STR_LOG_TITLE);
    end
end

function VET_201006_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward({VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3], 50},
                VET_201006_01_SHUIGUOPAN[1], VET_201006_01_STR_LOG_TITLE);
    end
end

function VET_201006_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201006_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201006_01_SHUIGUOPAN[2][1], VET_201006_01_SHUIGUOPAN[2][2], VET_201006_01_SHUIGUOPAN[2][3], 100},
                VET_201006_01_SHUIGUOPAN[1], VET_201006_01_STR_LOG_TITLE);
    end
end

function vet_201006_01_end_dialog()
end

