--=============================================
--create by zhangming 2010.6.18
--describe:越南版2010年7月活动1 鹰神蛋脚本文件
--=============================================

Include("\\script\\online_activites\\2010_07\\activites_01\\head.lua");--活动头文件

g_szItemSayHead = gf_FixColor(VET_201007_01_TB_ITEM_LIST[12][1], 2, 1);

function OnUse(nItemIdx)
    local tbSay = {};
    tinsert(tbSay,  VET_201007_01_TB_STRING_LIST[15].."/VET_201007_01_use");
    tinsert(tbSay,  VET_201007_01_TB_STRING_LIST[16].."/gf_DoNothing");
    Say(format(VET_201007_01_TB_STRING_LIST[14],VET_201007_01_TB_ITEM_LIST[12][1]) ,getn(tbSay),tbSay);
end

function VET_201007_01_use()
    KillFollower();
    AskClientForString("VET_201007_01_create_pet","",1,14,VET_201007_01_TB_STRING_LIST[13]);
end

function VET_201007_01_create_pet(sName)
    SetTask(VET_201007_01_TASK_GET_CHONGWU_DATE,GetTime())
    SummonNpc(VET_201007_01_NPC_NAMES[4],sName)
    Talk(1,"",VET_201007_01_TB_STRING_LIST[17])
end
