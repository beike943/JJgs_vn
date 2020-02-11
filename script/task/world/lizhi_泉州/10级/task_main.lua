
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 泉洲 10 级任务主体脚本
-- Edited by peres
-- 2005/07/19 PM 19:29

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 剧情任务文件
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\lizhi_泉州\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function can_not_accept_task()
    local szTalk = {
        "H祅g h鉧 ta m蕋 h誸 r錳, sao v? Dng Ch﹗ y!"
    };
    TalkEx("", szTalk);
end;

function task_000_00()

local strMain = {
	"我本是扬州城的人士，专做玉器买卖，最近进了一批玉器，成色不错，想运到泉州赚些小财。结果刚刚走到泉州府城郊我的{玉器商货}因为被{流氓}抢劫而散落在这郊区附近了，你帮我找一下好么?",
	"好，我去去就来/task_000_01",
	"我还有别的事/Task_Exit"
}

SelectSay(strMain);

end;

function task_000_01()
	Msg2Player("去流氓手里抢回20个玉器商货");
	TaskTip("去流氓手里抢回20个玉器商货");
	CreateTrigger(0, 189, 80);
	SetTask(TASK_LEV_10_ID, 1);
end;


function task_001_00()

local strMain = {
	"你收集到我丢失的玉器商货了吗?",
	"嗯，请收好/task_001_01",
	"还没有，你再等一等/task_001_03"
}

SelectSay(strMain);

end;

function task_001_01()

    local strMain = {
    	"其实我丢失的玉器还好!",
    	"最重要的是我的账本被 {姚立城}抢走了，少侠能否帮我寻回账本？."
    };
    local szNotHaveEnough = 
    {
        "Ngi ch璦 t譵  20 m鉵  {b籲g ng鋍}, i t譵  m韎 nh薾 th? lao."
    };

    local szMsg = "C? v藅 ph萴";
    local nItemCount = GetItemCount(2, 1, 154);
    --Msg2Player(szMsg..nItemCount);
	if nItemCount >= 20 then
		TalkEx("task_001_02", strMain);
	else
		TalkEx("task_001_03", szNotHaveEnough);
	end;
end;

function task_001_03()
    if GetTrigger(80) == 0 then
        CreateTrigger(0, 189, 80);
    end;
end;

-- 完成任务，发奖，并让玩家去找姚立诚
function task_001_02()
    DelItem(2, 1, 154, 20);
	SetTask(TASK_LEV_10_ID, 2);
	GivePlayerAward("Level_10", "easy");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo1")		--玉器商货1
	RemoveTrigger(GetTrigger(80));
	
	Msg2Player("去泉州府北 (198.188)找姚立城拿回账本");
	TaskTip("去泉州府北 (198.188)找姚立城拿回账本");
	
end;

--接到杀姚立诚任务，但是没有杀的时候和NPC对话
function task_002_00()

    local szMain = 
    {
        "听说那贼人姚立诚就在泉州府北，还请帮我讨回账本啊!"
    }
    TalkEx("", szMain);
end;

function task_003_00()
    
    local strMain = {
    	"哦?你果真吧我的账本带回来啦，真是感激少侠帮我免除了一场祸事啊。",
    	"姚立城为什么要抢货物呢，他又要这个账本做什么呢?",
    	"你去找找{夏杰}吧!他最近好像总和那些流氓无赖在一起，也许会知道一些什么。"
    }
    
    TalkEx("task_003_01", strMain);

end;

-- 完成任务，发奖
function task_003_01()

	SetTask(TASK_LEV_10_ID, 4);
	SetTask(TASK_LEV_12_ID, 100);   --开启泉州任务夏杰部分
	DelItem(2, 0, 32, 1);
	GivePlayerAward("Level_10", "hard", "weapon", "Level_10");    --奖励
	GivePlayerExp(SkeyQZWangyewei,"yuqishanghuo2")		--玉器商货2
	Msg2Player("去泉州(166.182)寻找夏杰");
	TaskTip("去泉州(166.182)寻找夏杰");

end;

function task_004_00()
    
    local strMain = {
        "我怎么就这么倒霉呀!"
    }
    TalkEx("",strMain);
end;

function Task_Exit()

end;