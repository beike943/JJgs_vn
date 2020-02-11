--  ===============文件信息=================
--  剑侠情缘onlineII 泉洲 12 级任务主体脚本
--  Edited by lizhi
--  2005-8-2 15:36
--  ========================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "你还有什么事情？"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "听说你在姚立城手下做过事情，还抢劫过一个货商？",
        "你是谁，你是姚立城派来灭口的么？我什么都没做过，什么都没做过!",
        "没关系，我只是随便问问，我既不是姚立城派来的，也不是官服的人，你放心好了，我只是想了解一些事情。",
        "我怎么才能相信你呢，泉州郊区的流氓其实都是姚立城的手下，你去击败 {10名流氓} 和 {10名无赖}我就相信你!",
    };
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    
	Msg2Player("去击败10名流氓和10名无赖");
	TaskTip("去击败10名流氓和10名无赖");
	
	CreateTrigger(0, 191, 81);  --杀死流氓10人
	CreateTrigger(0, 192, 82);  --杀死无赖10人
	
    SetTask(TASK_LEV_12_ID, 1);
    SetTask(TASK_LEV_10_ID, GetTask(TASK_LEV_10_ID) + 1);   --消除任务面板
    
end;

function task_001_01()
    
    local szTalk = {
        "击败{10个流氓}和{10个无赖}!"
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
    if GetTrigger(81) == 0 then
        CreateTrigger(0, 191, 81);  --杀死流氓10人
    end;
    
    if GetTrigger(82) == 0 then
        CreateTrigger(0, 192, 82);  --杀死无赖10人
    end;
end;

function task_003_00()

    local szTalk = {    
        "你真的办到啦！其实我也冰不是想给姚立城做事，我也知道这样不好，不过我家中妻子得了伤寒病，需要的药材我根本弄不到啊。姚立城说只要我给他做事，就帮我弄到药材",
        "那么到底需要什么药材呢?",
        "大夫说需要在 {泉州府西}取得 {青蒿}, {葛根}, {佩兰}, {连翘}, {金银花}各 {3个}。",
        "治病要紧，我先去帮你把需要的药材拿到救治你的妻子，其他的一会儿再说吧!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    Msg2Player("去泉州府西采集药草以及10根狼毛");
    TaskTip("去泉州府西采集药草以及10根狼毛");
    
    CreateTrigger(0, 193, 83);  --杀死药草
    SetTask(TASK_LEV_12_ID, 4);
    GivePlayerAward("Level_12", "easy");    --奖励
    GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong1")		--夏杰的苦衷1
end;

function task_004_01()
    
    local szFinished = {
        "这么快就收集齐了？",
        "真是谢谢大侠了！",
        "恩人啊！连药材都给我哪来了，小人当初还不相信你，真是瞎了眼啊。",
        "我都跟您说了吧。",
        "姚立城好像是一个什么 {蚩火教}的小头目，教内得到消息说是什么{山河社稷图碎片}混杂在了一个叫王业伟的商人的货物里，要他一定要弄到手。",
        "似乎姚立城在抢劫到的货物里面并没有找到山河社稷图碎片，所以便开始查王业伟的账本，看看他把货物卖给了谁，好找到去处。",
        "那么账本上的人都有危险，快去王业伟那里看看他的账本上面买他货物的人的名单吧！!"
    };
    local szNotFinished = {
        "材料还没有收集齐吗？"
    };
    local nQingCount = 0;
    local nGeCount = 0;
    local nPeiCount = 0;
    local nLianCount = 0;
    local nJinCount = 0;
    local nMaoCount = 0;
    
    nQingCount = GetItemCount(2, 0, 33);    --青蒿
    nGeCount = GetItemCount(2, 0, 34);      --葛根
    nPeiCount = GetItemCount(2, 0, 35);     --佩兰
    nLianCount = GetItemCount(2, 0, 36);    --连翘
    nJinCount = GetItemCount(2, 0, 37);     --金银花
    nMaoCount = GetItemCount(2, 1, 5);      --狼毛
    
    if ((nQingCount >= 3) and (nGeCount >= 3) and (nPeiCount >= 3) and (nLianCount >= 3) and (nJinCount >= 3) and (nMaoCount >= 10)) then
        TalkEx("task_005_00", szFinished);
    else
        TalkEx("task_005_01", szNotFinished);
    end;

end;

function task_005_01()
    if GetTrigger(83) == 0 then
        CreateTrigger(0, 193, 83);  --杀死药草
    end;
end;

function task_005_00()
    GivePlayerAward("Level_12", "hard", "head", "Level_13");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"xiajiedekuzhong2")		--夏杰的苦衷2
    SetTask(TASK_LEV_12_ID, 5);
    --删除任务道具
    DelItem(2, 0, 33, 3);
    DelItem(2, 0, 34, 3);
    DelItem(2, 0, 35, 3);
    DelItem(2, 0, 36, 3);
    DelItem(2, 0, 37, 3);
    DelItem(2, 1, 5, 10);
    RemoveTrigger(GetTrigger(83));  --删除草药触发器
end;