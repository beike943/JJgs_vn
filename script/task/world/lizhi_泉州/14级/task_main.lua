
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 泉洲 14 级任务主体脚本
-- Edited by lizhi
-- 2005-8-4 10:38
-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "我看管的这么严密的宝库怎么就被偷了呢?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

    local szTalk = {
        "听说你的宝库被偷了，我正在调查这件事情，能跟我详细说一下吗?",
        "就在昨天，我一起床，喊我的管家刘管家，半天没人答应，我就觉得奇怪了。到他房里一看，他的东西都不见了，已经卷铺盖跑路啦！",
        "然后呢?",
        "这个时候我的丫鬟钱湘就慌慌张张的跑进来说:路过库房的时候发现我的库房的门是开的。我的库房只有我一个人有钥匙啊。我赶忙去看，还好大部分东西都还在。",
        "那到底少了什么东西呢?会是刘管家偷的吗?我新购进的一批玉器倒是通通不见了，真是可惜啊，成色真是不错啊。花了我大笔银子呢!说来奇怪，只有我自己才有库房的钥匙啊，他是怎么把门打开的呢?对了，我在刘管家的房间里发现了一封信函，应该是他匆忙遗失的。不过，落在了水里，字迹已经模糊了。你拿去调查吧。"
    };
    
    TalkEx("task_001_00", szTalk);
end;

function task_001_00()
    local szMsg = {
        "你去找泉州府的书生周斌举吧。我看他总是看一些古旧的破书:他应该知道怎么修复这封信。",
    };
    
    TalkEx("", szMsg);

	Msg2Player("去找书生周斌举看看能不能修复这封信");
	TaskTip("去找书生周斌举看看能不能修复这封信");
	
	AddItem(2, 0, 38, 1);   --模糊的字条
	
	SetTask(TASK_LEV_14_ID, 1);
	SetTask(TASK_LEV_12_ID, GetTask(TASK_LEV_12_ID) + 1);   --消除任务面板
end;


function task_001_01()

    local szTalk = {
        "Ngi th? n t譵 Chu B﹏ C? (162.185), bi誸 u kh玦 ph鬰 頲 b鴆 th?."
    };

    TalkEx("", szTalk);
end;

function task_001_02()

    local szTalk = {
        "请问，我有一封书信，不小心落入了水中，可否帮我修复辨识一下?",
        "这倒不难。不过需要的材料可不太好找，需要遁甲书1张。还有附近野猪身上掉落的极细的野猪毛根，用来改造笔毛。",
        "这个好办，我去去就来。"
    };
    
    TalkEx("task_002_00",szTalk);
end;

function task_002_00()

    Msg2Player("去收集修复书信需要的材料");
    TaskTip("去收集修复书信需要的材料");
    CreateTrigger(0, 194, 84);  --杀死野猪
    SetTask(TASK_LEV_14_ID, 2);
end;

function task_002_01()
    
    local szNotFinished = {
        "材料还没有收集好吗?"
    };
    local szMaleFinished = {
        "对了，就的这些材料，等一下，我这就帮你修复。",
        "?.",
        "已经修复好了，呵呵，写的是{泉州府西，老地方见}."
    };
    local szFemaleFinished = {
        "对了，就的这些材料，等一下，我这就帮你修复。",
        "?.",
        "已经修复好了，呵呵，写的是{泉州府西，老地方见}."
            };
        
    local nPen = 0;
    local nPaper = 0;
    local nHair = 0;
    
    nPen = GetItemCount(2, 2, 65);     --灵符纸
    nPaper = GetItemCount(2, 2, 30);  --朱砂
    nHair = GetItemCount(2, 0, 39);     --极细的野猪毛
    
    if ((nPen >= 1) and (nPaper >= 1) and (nHair >= 1)) then
        if (GetSex() == 1) then
            TalkEx("task_003_00", szMaleFinished);
        elseif (GetSex() == 2) then
            TalkEx("task_003_00", szFemaleFinished);
        end;
    else
        TalkEx("task_003_10", szNotFinished);
    end;
end;

function task_003_10()
    if GetTrigger(84) == 0 then
        CreateTrigger(0, 194, 84);  --杀死野猪
    end;
end;

function task_003_00()

    GivePlayerAward("Level_14", "easy");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei1")		--家有内贼1
    SetTask(TASK_LEV_14_ID, 3);
    
    DelItem(2,2,65,1);
    DelItem(2,2,30,1);
    DelItem(2,0,39,1);
    DelItem(2, 0, 38, 1);   --模糊的字条
    RemoveTrigger(GetTrigger(84));

end;

function task_003_01()
    
    local szTalk = {
        "写的是{泉州府西，老地方见}!"
    };
    TalkEx("", szTalk);

end;

function task_003_02()
    
    local szTalk = {
        "刘管家，以为偷了东西就可以偷偷溜掉么?说代志强的玉器被你藏到哪里了?是谁要你做的？",
        "英雄！不要杀我啊！我说，我都说！",
        "快说!",
        "是泉州府的铁匠让我干的啊，他说以前给代老爷做锁的时候偷偷留了一把钥匙，还说事成之后分我大头。东西刚才被他拿走了，有什么事情你问他吧。大侠饶命啊!",
        "今天先放过你，以后本分干活，不要再做偷鸡摸狗之事!"
    };
    TalkEx("task_004_00", szTalk);
end;

function task_004_00()

    GivePlayerAward("Level_14", "hard", "weapon", "Level_16");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"jiayouneizei2")		--家有内贼2
    SetTask(TASK_LEV_14_ID, 4);
    SetTask(TASK_LEV_18_ID, 100);   --泉州钟放任务开启
end;

function task_004_01()
    
    local szTalk = {
        "都是钟放要我干的啊！他就在泉州府的武器店那里!"
    };
    TalkEx("", szTalk);
end;