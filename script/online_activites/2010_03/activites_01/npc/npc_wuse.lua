--=============================================
--create by baiyun 2010.2.24
--describe:越南版2010年3月活动1 五色NPCNPC脚本文件
--=============================================

Include("\\script\\online_activites\\2010_03\\activites_01\\head.lua");--活动头文件

function main()
    if gf_CheckEventDateEx(VET_201003_01_EVENT_NUMBER) == 0 then
        Talk(1, "", VET_201003_01_TB_STRING[3]);
        return 0;
    end
    Say(VET_201003_01_TB_STRING[8],
        2,
        VET_201003_01_TB_STRING[9].."/VET_201003_01_Exchange_Wuseshi",
        VET_201003_01_TB_STRING[10].."/gf_DoNothing");
end
