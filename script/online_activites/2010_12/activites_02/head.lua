--=============================================
--create by xiongyizhi 2010.11.2
--describe:越南版2010年12月活动1 头文件
--related files: 
--新加 \script\online\zgc_npc_dialog.lua 该文件，入口太乱，把兑换奖励单独列出
--=============================================

Include("\\script\\online_activites\\task_values.lua");--任务变量头文件
Include("\\script\\online_activites\\2010_12\\activites_02\\strings.lua");--活动字符串
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

VET_201012_02_EVENT_NUMBER = 20;--在活动表上的编号是19

function VET_Buy_Xmas_Clothes()
    if gf_CheckEventDateEx(VET_201012_02_EVENT_NUMBER) == 1 then
        Say(VET_201012_02_TB_STRING_LIST[1], 2,
            VET_201012_02_TB_STRING_LIST[2].."/buy_xmas_clothes",
            VET_201012_02_TB_STRING_LIST[3].."/gf_DoNothing");
            return 0;
    end
end

function buy_xmas_clothes()
--    if GetTask(VET_201012_BUY_XMAS_CLOTHES_FLAG) == 1 then
--        Talk(1, "", VET_201012_02_TB_STRING_LIST[4]);
--        return 0;
    if GetLevel() < 73 or GetPlayerRoute() == 0 then
        Talk(1, "", VET_201012_02_TB_STRING_LIST[5]);
        return 0;
    elseif GetCash() < 300000 then
        Talk(1, "", VET_201012_02_TB_STRING_LIST[6]);
        return 0;
    elseif gf_Judge_Room_Weight(3, 0, "") == 1 then
        Pay(300000) 
        local nBody = GetBody()
        gf_AddItemEx2(VET_201012_02_TB_XMAS_CAP[nBody][2], VET_201012_02_TB_XMAS_CAP[nBody][1], VET_201012_02_STR_LOG_TITLE, VET_201012_02_TB_ACTION_LIST[1], 30 * 24 * 3600)
        gf_AddItemEx2(VET_201012_02_TB_XMAS_CLOTHE[nBody][2], VET_201012_02_TB_XMAS_CLOTHE[nBody][1], VET_201012_02_STR_LOG_TITLE, VET_201012_02_TB_ACTION_LIST[1], 30 * 24 * 3600)
        gf_AddItemEx2(VET_201012_02_TB_XMAS_SHOE[nBody][2], VET_201012_02_TB_XMAS_SHOE[nBody][1], VET_201012_02_STR_LOG_TITLE, VET_201012_02_TB_ACTION_LIST[1], 30 * 24 * 3600)
        
--        gf_EventGiveRandAward(VET_201012_02_TB_XMAS_CAP, 1, 1, VET_201012_02_STR_LOG_TITLE, VET_201012_02_TB_ACTION_LIST[1]);
--        gf_EventGiveRandAward(VET_201012_02_TB_XMAS_CLOTHE, 1, 1, VET_201012_02_STR_LOG_TITLE, VET_201012_02_TB_ACTION_LIST[1]);
--        gf_EventGiveRandAward(VET_201012_02_TB_XMAS_SHOE, 1, 1, VET_201012_02_STR_LOG_TITLE, VET_201012_02_TB_ACTION_LIST[1]);
--        SetTask(VET_201012_BUY_XMAS_CLOTHES_FLAG, 1);
    end
end
