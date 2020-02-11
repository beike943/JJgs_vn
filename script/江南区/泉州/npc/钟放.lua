
-- ====================== 文件信息 ======================
-- 对应NPC名称：钟放
-- Edited by lizhi
-- 2005-8-4 21:37
-- ======================================================

Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua")
Include("\\script\\task\\world\\lizhi_泉州\\18级\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    

    nStep = GetTask(TASK_LEV_18_ID);
    if (nStep == 100) then
        task_000_00();
    elseif (nStep == 1) then
        task_001_01();
    elseif (nStep == 2) then
        task_002_00();
    elseif (nStep == 3 or nStep == 4) then
        task_003_01();
    else
        can_not_accept_task();
    end;
end;