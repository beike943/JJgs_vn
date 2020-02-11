--=============================================
--create by TrojanPizza 2010.3.26
--describe:越南版2010年4月活动3 初始化文件
--=============================================

Include("\\script\\online_activites\\2010_04\\activities_01\\head.lua");        --活动头文件

function ServerStartUp(nStartTime, nEndTime)
	do return end
    if gf_CheckEventDateEx2(nStartTime, nEndTime) == 1 then
        local nNpcIndex = 0;
        --汴京
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 200, 1374, 2852);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
        --成都
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 300, 1721, 3522);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
        --泉州
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 100, 1444, 2981);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
        --扬州
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 150, 1694, 3157);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
        --襄阳
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 350, 1430, 2985);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
        --大理
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 400, 1530, 2970);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
        --凤翔
        nNpcIndex = CreateNpc(VET_201004_01_TB_STRINGS[2][2], VET_201004_01_TB_STRINGS[2][1], 500, 1740, 3139);
        SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
    end
if DEBUG == 1 then                     --DEBUG模式
    local nNpcIndex = 0;
    --汴京
    nNpcIndex = CreateNpc("Nam nh﹏ phng B綾2", "Li猽 Nhu quan", 200, 1434, 2896);
    print("nNpcIndex = "..nNpcIndex);
    SetNpcScript(nNpcIndex, "\\script\\online_activites\\2010_04\\activities_01\\npc\\npc_mrbai.lua");
end

end

function PlayerLogin(ExchangeComing, nStartTime, nEndTime)
    do return end
    if gf_CheckEventDateEx2(nStartTime, nEndTime) == 1 then
        if GetItemCount(VET_201004_01_TB_ITEMS[10][2], VET_201004_01_TB_ITEMS[10][3], VET_201004_01_TB_ITEMS[10][4]) == 0 then
            AddItem(VET_201004_01_TB_ITEMS[10][2], VET_201004_01_TB_ITEMS[10][3], VET_201004_01_TB_ITEMS[10][4], 1);
        end
    end
end

