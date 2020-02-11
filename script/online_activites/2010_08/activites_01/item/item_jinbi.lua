--=============================================
--create by zhangming 2010.7.15
--describe:越南版2010年8月活动1 金币脚本文件
--=============================================

Include("\\script\\online_activites\\2010_08\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201008_01_TB_ITEM_LIST[6][1], 2, 1);

function OnUse(nItemIdx)
	do	return	end
    if DelItemByIndex(nItemIdx, 1) == 1 then
        Earn(30000)
    end
end
