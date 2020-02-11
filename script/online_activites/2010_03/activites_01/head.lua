--=============================================
--create by baiyun 2010.2.24
--describe:越南版2010年3月活动1 头文件
--related files: 
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_03\\activites_01\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

VET_201003_01_EVENT_NUMBER = 3;--在活动表上的编号是3
VET_201003_01_NUM_GET_FACTION_AWARD_MAX_COUNT = 10;
VET_201003_01_NUM_USE_WUSESHI_MAX_COUNT = 1800; --最多使用能得到经验的五色石的个数

function VET_201003_01_GivePlayerItem()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
        return 0;
    end
    if GetItemCount(VET_201003_01_ITEM_LOGIN_GIVE[1][2], VET_201003_01_ITEM_LOGIN_GIVE[1][3], VET_201003_01_ITEM_LOGIN_GIVE[1][4]) ~= 0 then
        return 0;
    end
    gf_AddItemEx2({VET_201003_01_ITEM_LOGIN_GIVE[1][2], VET_201003_01_ITEM_LOGIN_GIVE[1][3], VET_201003_01_ITEM_LOGIN_GIVE[1][4], 1}, 
        VET_201003_01_ITEM_LOGIN_GIVE[1][1], VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[1], 0, 1);
end

function VET_201003_01_Give_Faction_Award()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
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
        {VET_201003_01_TB_ITEM_LIST[1][2], VET_201003_01_TB_ITEM_LIST[1][3], VET_201003_01_TB_ITEM_LIST[1][4]},
        VET_201003_01_TB_ITEM_LIST[1][1],
        tbAwardList,
        VET_201003_01_NUM_GET_FACTION_AWARD_MAX_COUNT,
        GLB_TASK_FACTION_GET_DATE,
        GLB_TASK_FACTION_GET_COUNT,
        VET_201003_01STR_LOG_TITLE
    );
end

function VET_201003_01_GivePlantSmallTreeAward()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 1 then
        gf_GivePlantSmallTreeAward({VET_201003_01_TB_ITEM_LIST[1][2], VET_201003_01_TB_ITEM_LIST[1][3], VET_201003_01_TB_ITEM_LIST[1][4], 100},
                VET_201003_01_TB_ITEM_LIST[1][1], VET_201003_01_STR_LOG_TITLE);
    end
end

function VET_201003_01_GivePlantBigTreeAward()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 1 then
        gf_GivePlantBigTreeAward({VET_201003_01_TB_ITEM_LIST[1][2], VET_201003_01_TB_ITEM_LIST[1][3], VET_201003_01_TB_ITEM_LIST[1][4], 100},
                VET_201003_01_TB_ITEM_LIST[1][1], VET_201003_01_STR_LOG_TITLE);
    end
end

function VET_201003_01_Give_DailyTaskPersonalAward()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskPersonalAward({VET_201003_01_TB_ITEM_LIST[1][2], VET_201003_01_TB_ITEM_LIST[1][3], VET_201003_01_TB_ITEM_LIST[1][4], 50},
                VET_201003_01_TB_ITEM_LIST[1][1], VET_201003_01_STR_LOG_TITLE);
    end
end

function VET_201003_01_Give_DailyTaskTeamAward()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 1 then
        gf_GiveDailyTaskTeamAward({VET_201003_01_TB_ITEM_LIST[1][2], VET_201003_01_TB_ITEM_LIST[1][3], VET_201003_01_TB_ITEM_LIST[1][4], 100},
                VET_201003_01_TB_ITEM_LIST[1][1], VET_201003_01_STR_LOG_TITLE);
    end
end

function VET_201003_01_JingNangDaShiJiangDialog(tbSayDialog, szSayHead)
    local szNpcName = gf_FixColor(VET_201003_01_ITEM_LOGIN_GIVE[1][1], 2, 1);
    if gf_CheckEventDateEx2(2010030500, 2010041200) == 1 then
    	  szSayHead = szNpcName..VET_201003_01_TB_STRING[1];--锦囊大事件say的标题
    	  if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 1 then
    	  	tinsert(tbSayDialog, VET_201003_01_TB_STRING[2].."/VET_201003_01_Exchange_Wuseshi");        
    	  	tinsert(tbSayDialog, VET_201003_01_TB_STRING[16].."/VET_201003_01_ExchangeBaoHe");
    	  end    	  
    	  tinsert(tbSayDialog, VET_201003_01_TB_STRING[7].."/VET_201003_01_GetMaxExpAward");     
    	  if gf_CheckEventDateEx2(2010031200, 2010041200) == 1 then        
       	 tinsert(tbSayDialog, VET_201003_01_TB_STRING[17].."/VET_201003_01_Hand_Wuseshi");
       end   
    end
    return tbSayDialog, szSayHead;
end

--兑换女娲宝盒
function VET_201003_01_ExchangeBaoHe()
    if GetLevel() < 73 or GetPlayerRoute() == 0 then
        Talk(1, "", VET_201003_01_TB_STRING[19]);
        return 0;
    end
    local nDate = tonumber(date("%y%m%d"));
    local nLastGetDate = GetTask(VET_201003_01_TASK_GET_BAOHE_DATE);
    if nLastGetDate ~= nDate then
        SetTask(VET_201003_01_TASK_GET_BAOHE_DATE, nDate);
        SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, 0);
        SetTask(VET_201003_01_TASK_USE_BAOHE_COUNT, 0);               
    end
    if GetTask(VET_201003_01_TASK_GET_BAOHE_COUNT) >= 2 then
        Talk(1, "", VET_201003_01_TB_STRING[18]);
        return 0;
    end
    if gf_Judge_Room_Weight(1, 50, " ") ~= 1 then return end
    local exchange_list = {
        {
            {VET_201003_01_TB_ITEM_LIST[1][1], VET_201003_01_TB_ITEM_LIST[1][2], VET_201003_01_TB_ITEM_LIST[1][3], VET_201003_01_TB_ITEM_LIST[1][4], 20}, 
        },
        {
            {VET_201003_01_TB_ITEM_LIST[9][1], 100, {VET_201003_01_TB_ITEM_LIST[9][1], {VET_201003_01_TB_ITEM_LIST[9][2], VET_201003_01_TB_ITEM_LIST[9][3], VET_201003_01_TB_ITEM_LIST[9][4], 1}, 1 * 24 * 3600}},
        },
    };
    if gf_ExchangeItemEx(exchange_list, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[6]) == 0 then
        Talk(1, "", VET_201003_01_TB_STRING[12]);
        return 0;
    end
    SetTask(VET_201003_01_TASK_GET_BAOHE_COUNT, GetTask(VET_201003_01_TASK_GET_BAOHE_COUNT) + 1);
end

--卖露水
function VET_201003_01_BuyLuShui()
    if gf_Judge_Room_Weight(1, 10, " ") == 0 then
	return 0;
    end
    if Pay(1000) == 0 then
	Talk(1, "", VET_201003_01_TB_STRING[13]);
	return 0;
    end
    gf_AddItemEx2({2, 0, 351, 1}, VET_201003_01_TB_STRING[14], VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[5], 0, 1);
end

--上交五色石
function VET_201003_01_Hand_Wuseshi()
    local nDate = tonumber(date("%y%m%d"));
    local nLastHandDate = GetTask(VET_201003_01_TASK_HAND_WUSESHI_DATE);
    if nLastHandDate < nDate then
        SetTask(VET_201003_01_TASK_HAND_WUSESHI_COUNT, 0);
    end
    if GetTask(VET_201003_01_TASK_HAND_WUSESHI_COUNT) >= 3 then
        Talk(1, "", VET_201003_01_TB_STRING[11]);
        return 0;
    end
    if GetItemCount(VET_201003_01_TB_ITEM_LIST[8][2], VET_201003_01_TB_ITEM_LIST[8][3], VET_201003_01_TB_ITEM_LIST[8][4]) < 10 then
        Talk(1, "", VET_201003_01_TB_STRING[12]);
        return 0;
    end
    if gf_Judge_Room_Weight(2, 50, " ") ~= 1 then return end
    if DelItem(VET_201003_01_TB_ITEM_LIST[8][2], VET_201003_01_TB_ITEM_LIST[8][3], VET_201003_01_TB_ITEM_LIST[8][4], 10) == 1 then
        SetTask(VET_201003_01_TASK_HAND_WUSESHI_COUNT, GetTask(VET_201003_01_TASK_HAND_WUSESHI_COUNT) + 1);
        SetTask(VET_201003_01_TASK_HAND_WUSESHI_DATE, nDate);
        gf_EventGiveCustomAward(1, 1500000, 1, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[4]);
        gf_EventGiveRandAward(VET_201003_01_HAND_WUSESHI_AWARD_LIST, 1000, 16, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[4]);
    end
end

--兑换五色石
function VET_201003_01_Exchange_Wuseshi()
    --local szNpcName = gf_FixColor(VET_201003_01_ITEM_LOGIN_GIVE[1][1], 2, 1);
    if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then return end
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
        Talk(1, "", VET_201003_01_TB_STRING[3]);
        return 0;
    end
    if gf_ExchangeItemEx(VET_201003_01_EXCHANGE_AWARD_LIST, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[7]) == 0 then--原料不足
        Talk(1, "", VET_201003_01_TB_STRING[4]);
        return 0;
    end
    SelectSay()
end

--领取经验上限奖励
function VET_201003_01_GetMaxExpAward()
	if GetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT) < VET_201003_01_NUM_USE_WUSESHI_MAX_COUNT then
		Talk(1, "", VET_201003_01_TB_STRING[22]);
		return
	end
	if GetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT) > VET_201003_01_NUM_USE_WUSESHI_MAX_COUNT then
		Talk(1, "", VET_201003_01_TB_STRING[23]);
		return
	end
    if gf_Judge_Room_Weight(2, 200, " ") ~= 1 then return end
    gf_EventGiveCustomAward(1, 30000000, 1, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[3]);
    SetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT, GetTask(VET_201003_01_TASK_USE_WUSESHI_COUNT) + 1);
    gf_EventGiveRandAward(VET_201003_01_WUSESHI_MAX_EXP_AWARD_LIST, 10000, 2, VET_201003_01_STR_LOG_TITLE, VET_201003_01_TB_LOG_ACTION[3]);
end
