--Ê¹ÓÃ¿ÕÆ¿×Ó´¥·¢µÄ½Å±¾
--created by lizhi
--2005-9-2 11:18

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_award.lua");

function OnUse()
    if GetTask(TASK_YZ_THREE) == 9 then
        local nMapId, nX, nY = GetWorldPos();
        local nDist = DistanceBetweenPoints(nMapId, nX, nY, 112, 1694, 2987);
        if nDist >= 0 and nDist <= 30 then
            AddItem(2,0,148,1);
            DelItem(2,0,147,1);
        else
            Msg2Player("Vµo L­ìng Thñy ®éng tÇng 1 sö dông ");
            TaskTip("Vµo L­ìng Thñy ®éng tÇng 1 sö dông ");
        end;
    end;
end;