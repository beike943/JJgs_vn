--=============================================
--create by xiongyizhi 2010.11.2
--describe:Ô½ÄÏ°æ2010Äê12ÔÂ»î¶¯1 Ê¥µ®ÀñºÐ½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\online_activites\\2010_12\\activites_01\\head.lua");--»î¶¯Í·ÎÄ¼þ

MAX_XMAS_BOX_NUM = 1500

g_szItemSayHead = gf_FixColor(VET_201012_01_TB_ITEM_LIST[1][1], 2, 1);

function OnUse(nItemIdx)
    local nDate = tonumber(date("%y%m%d"))
    local nMaxBox = 1500
    if nDate > 110109 then
    	   Talk(1,"","Hép quµ ®· hÕt h¹n sö dông!")
    	   return
    end
    if GetTask(VET_201012_XMAS_BOX_MODE) == 0 then
        set_award_mode()
        return 0;--ÏÈÊÔÊÔÊÇ·ñÔì³É¶Ô»°²»Õý³£
    end
    if gf_Judge_Room_Weight(1, 10 , g_szItemSayHead) ~= 1 then return end
    if GetTask(VET_201012_01_GET_FINAL_AWARD_FLAG) >= 1 then
          nMaxBox = 3000
    end
    if GetTask(VET_201012_01_USE_XMAS_BOX_COUNT) >= nMaxBox then
         Talk(1, "", format(VET_201012_01_TB_STRING_LIST[9], GetTask(VET_201012_01_USE_XMAS_BOX_COUNT), nMaxBox));
         return 0;
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        SetTask(VET_201012_01_USE_XMAS_BOX_COUNT, GetTask(VET_201012_01_USE_XMAS_BOX_COUNT) + 1);
        if GetTask(VET_201012_XMAS_BOX_MODE) == 2 then
            gf_EventGiveCustomAward(1, SINGLE_XMAS_EXP*1.25, 1, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[3])
            return 1;
        elseif GetTask(VET_201012_XMAS_BOX_MODE) == 1 then
            gf_EventGiveCustomAward(1, SINGLE_XMAS_EXP, 1, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[7])
            if mod(GetTask(VET_201012_01_USE_XMAS_BOX_COUNT), 20) == 0 then
                gf_EventGiveRandAward(VET_201012_TB_XMAS_BOX_SP_AWARD, 10000, 6, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[5])
            else
                gf_EventGiveRandAward(VET_201012_TB_XMAS_BOX_NOMAL_AWARD, 1000, 15, VET_201012_01_STR_LOG_TITLE, VET_201012_01_TB_LOG_ACTION_LIST[4])
            end
        end
    end
end
