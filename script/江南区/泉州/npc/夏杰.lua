
-- ====================== 文件信息 ======================
-- 对应NPC名称：夏杰
-- Edited by lizhi
-- 2005/02/22 PM 18:03
-- ======================================================

Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua")
Include("\\script\\task\\world\\lizhi_泉州\\12级\\task_main.lua");

function main()
    
    local nLevel = 0;
    local nStep = 0;
    
    nStep = GetTask(TASK_LEV_12_ID);
    if (nStep == 100) then
        task_000_00();
    elseif (nStep == 1 or nStep == 2) then
        task_001_01();
    elseif (nStep == 3) then
        task_003_00();
    elseif (nStep == 4) then
        task_004_01();
    else
        can_not_accept_task();
    end;
end;