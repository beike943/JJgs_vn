--神秘地图
--created by lizhi
--2005-9-1 20:05

Include("\\script\\task\\world\\task_award.lua")
Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function OnUse()
    if GetTask(TASK_FIVE) == 25 and GetItemCount(0,200,13) >= 1 then
        local nMapid, nX, nY = GetWorldPos();
        local nDist = DistanceBetweenPoints(nMapid, nX, nY, 107, 1337, 3132);
        if nDist >= 0 and nDist <= 16 then
            AddItem(2,0,106,1);
            DelItem(2,0,105,1);
            DelItem(0,200,13,1);
            SetTask(TASK_FIVE, 26);
            Msg2Player("挖到了神秘宝物，交给夏侯琴吧");
            TaskTip("挖到了神秘宝物，交给夏侯琴吧");
        else
            Msg2Player("这个地址不对，挖不到宝物");
            TaskTip("这个地址不对，挖不到宝物");
        end;
    else
        Msg2Player("дn T筽 h鉧 mua Cu鑓 trc !");
        TaskTip("дn T筽 h鉧 mua Cu鑓 trc !");
    end;
end;