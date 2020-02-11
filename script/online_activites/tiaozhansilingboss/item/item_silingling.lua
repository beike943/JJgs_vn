--=============================================
--create by zhangming 2010.7.30
--describe:越南版2010年挑战四灵 四灵令脚本文件
--=============================================

Include ("\\script\\online_activites\\tiaozhansilingboss\\string.lua")
Include("\\script\\lib\\globalfunctions.lua");--公共函数文件

g_szItemSayHead = gf_FixColor(VET_201008_02_TB_ITEM_LIST[2][1], 2, 1);

function OnUse(nItemIdx)
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    local tbSel = {
        VET_201008_02_TB_STR_LIST[16].."/#get_award("..nItemIdx..")",
        VET_201008_02_TB_STR_LIST[5].."/gf_DoNothing",
    }
    Say(VET_201008_02_TB_STR_LIST[15],getn(tbSel),tbSel)
end


function get_award(nItemIdx)
    if gf_Judge_Room_Weight(1,1," ") ~= 1 then
        return
    end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        gf_EventGiveRandAward(VET_201008_02_TB_GIVE_SILINGLING_AWARD,100,1,VET_201008_02_STR_LOG_TITLE,VET_201008_02_TB_LOG_ACTION_LIST[4])
    end
end
