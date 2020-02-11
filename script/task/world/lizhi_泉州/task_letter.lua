--  文件说明
--  使用章伟刚的秘函以后触发的脚本文件
--  Created by lizhi
--  2005-8-4 21:13

Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

    local szMsg = {
        "货物已经安全转移。",
        "另外查明扬州府的夏侯琴是长歌门的{琴棋书画}之一,负责江南附近的接头和联络工作，要赶快除掉。",
        "还是赶快去通知{扬州府}的{夏侯琴}."
    };
    local nStep;
    
    nStep = GetTask(TASK_THREE);
    if (nStep == 0) then
        Msg2Player("去通知扬州府的夏侯琴");
        TaskTip("去通知扬州府的夏侯琴");
        SetTask(TASK_THREE, 1);
        TalkEx("", szMsg);
    elseif nStep == 1 then
        Msg2Player("去通知扬州府的夏侯琴");
        TaskTip("去通知扬州府的夏侯琴");
    end;

end;