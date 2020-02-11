--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 混元功10成脚本文件
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--活动头文件
Include("\\script\\online_activites\\2010_07\\activites_01\\item\\item_hunyuan.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[20][1], 2, 1);

function OnUse(nItemIdx)
   VET_201007_01_Give_Hunyuangong_Award(10,nItemIdx)
end
