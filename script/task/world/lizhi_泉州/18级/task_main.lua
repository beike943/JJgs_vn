
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 泉洲 18 级任务主体脚本
-- Edited by lizhi
-- 2005-8-4 16:36
-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\lizhi_长歌门\\task_head.lua");

function can_not_accept_task()
    local szTalk = {
        "少侠有什么事吗?"
    };
    TalkEx("", szTalk);
end;

function task_000_00()
    local szTalk = {
        "听说代志强家的失窃案是你主谋的，说！为什么要偷代志强家的东西？",
        "横竖也是死，我全说了！我一个铁匠过的安安稳稳的，偷什么东西啊！还不是那天突然来一个黑衣人，绑走了我的妻子，一定要我去偷大富翁代志强家新买的玉器。",
        "那你是怎么拿到代志强家宝库的钥匙的呢？",
        "代志强加的锁就是我打的，我有个习惯，给别人打锁后会留一把钥匙，也不知道那人是怎么知道我这个习惯的，他说不把东西弄给他，就要杀了我的妻子，我哪里敢违抗。",
        "你可知这个人到底是谁，什么背景，现在在哪里?",
        "交货的时候偷偷听到别人叫他章伟刚，好像是一个蚩火教的小头目，人现在应该在泉州府北﹗",
        "好，我马上过去找他."
    };
    
    TalkEx("task_001_00", szTalk);
    
end;
    
function task_001_00()

    Msg2Player("前往泉州府北(179.180)找到章伟刚");
    TaskTip("前往泉州府北(179.180)找到章伟刚");
    --CreateTrigger(0, 195, 85);  --杀死章伟刚
    KillFollower();
    SetTask(TASK_LEV_18_ID, 1);
    SetTask(TASK_LEV_14_ID, GetTask(TASK_LEV_14_ID) + 1);   --消除任务面板
    
end;

function task_001_01()
    local szTalk = {
        "主谋是章伟刚﹗他劫持了我的媳妇，就在泉州府北的西北角，少侠你一定要帮我啊！"
    };
    TalkEx("task_001_02", szTalk);
end;

function task_001_02()
--    if GetTrigger(85) == 0 then
--        CreateTrigger(0, 195, 85);  --杀死章伟刚
--    end;
	KillFollower();
end;

function task_002_00()
    local szTalk = {
        "我已经带回了你的妻子!"
    };
    TalkEx("task_003_00", szTalk);
end;

function task_003_00()
    KillFollower();
    RemoveTrigger(GetTrigger(86));
    RemoveTrigger(GetTrigger(87));
    GivePlayerAward("Level_18", "hell", "chest", "Level_19");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"zongfangdekunao")		--钟放的苦恼
    SetTask(TASK_LEV_18_ID, 3);
end;

function task_003_01()
    local szTalk = {
        "Чi nh﹏ r秐h r鏸 n Tuy襫 Ch﹗ thng ngo筺 m閠 chuy課!"
    };
    TalkEx("task_001_02", szTalk);
end;
