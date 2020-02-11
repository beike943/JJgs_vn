--文件说明
--与公孙书对话触发的脚本
--created by lizhi
--2005-8-11 17:16

Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function talk_one()
    local szMsg = {
        "我知道了",
        "多谢少侠."
    };
    RemoveTrigger(GetRunningTrigger());
    if GetTask(TASK_ONE) == 110 then
        GivePlayerAward("Level_20", "easy", "legs", "Level_23");
    elseif GetTask(TASK_ONE) == 102 then
        GivePlayerAward("Level_20", "hard", "legs", "Level_23");
    end;
    
    SetTask(125, 2);
    if GetTask(124) == 2 and GetTask(126) == 2 then
        RemoveTrigger(GetTrigger(90));
        SetTask(111, 111);
    else
        RemoveTrigger(GetTrigger(90));
        CreateTrigger(1, 201, 90);
        ContinueTimer(GetTrigger(90));
    end;
    TalkEx("", szMsg);
end;

function talk_five()
    local szMsg = {
        "H? H莡 C莔 b秓 v穘 b鑙 n th玭g b竜 v? m秐h S琻 H? X? T綾 c? kh? n╪g r琲 v祇 tay Xi H醓 gi竜, y l? th? c馻 玭g ta, m阨 ti襫 b鑙 xem qua!",
        " t? ti觰 huynh !",
        "C遪 nhi襲 ngi c莕 ph秈 th玭g b竜 n鱝, v穘 b鑙 甶 y!"
    };
    local nStep = 0;
    nStep = GetTask(TASK_FIVE);
    if nStep >= 2 and nStep < 5 then
        RemoveTrigger(GetRunningTrigger());
        SetTask(TASK_FIVE, nStep + 1);
        SetTask(129,2);
        DelItem(2,0,42,1);
        TalkEx("", szMsg);
    end;
end;
