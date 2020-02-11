--扬州任务分支
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

--------------------------------------------扬州分支二--------------------------------------

function task_01_00()
    local szTalk = {
        "飞瀑金针？为甚少侠会有我们唐门的武器？",
        "哦？就是这枚飞瀑金针杀了人吗？",
        "这件事情，确实有必要好好查一查。",
        "还请少侠去云梦泽从天蝎身上取得20个天蝎尾针交给我!",
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,100,1);
    SetTask(TASK_YZ_TWO, 2);
    CreateTrigger(0,536,KILL_YZ_TX);
    Msg2Player("去云梦泽从天蝎身上取得20个天蝎尾针");
    TaskTip("去云梦泽从天蝎身上取得20个天蝎尾针");
    GivePlayerAward("Level_36", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi1")		--追查暗器1
end;

function task_02_00()
    local szTalk = {
        "调查还需要一段时间，少侠先去扬州看看是否有其他事情可以帮忙把！"
    };
    local szNot = {
        "N誹 nh? th蕐 kh? t譵 畊玦 b? c筽 th? c? n鉯 v韎 ta nh?!"
    };
    if GetItemCount(2,0,102) >= 20 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szNot);
    end;
end;

function task_02_02()
    if GetTrigger(KILL_YZ_TX) == 0 then
        CreateTrigger(0,536,KILL_YZ_TX);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    DelItem(2,0,102,20);
    SetTask(TASK_YZ_TWO, 3);
    SetTask(TASK_YZ_THREE, 1);  --开启扬州分支三
    Msg2Player("去扬州看看有没有别的事可以帮忙");
    TaskTip("去扬州看看有没有别的事可以帮忙");
    GivePlayerAward("Level_36", "hard", "chest", "Level_36");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi2")		--追查暗器2
end;

function task_04_00()
    local szTalk = {
        "少侠来的正好，我已查明，这件事情乃长歌门唐宁所为。",
        "少侠可去武夷山找唐宁问个明白。"
    };
    TalkEx("task_04_01", szTalk);
end;

function task_04_01()
    RemoveTrigger(GetTrigger(TALK_YZ_TC));
    SetTask(TASK_YZ_TWO, 5);
    Msg2Player("去武夷山找唐宁谈谈");
    TaskTip("去武夷山找唐宁谈谈");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"zuichaanqi3")		--追查暗器3
end;

function two_05_00()
    local szTalk = {
        "为什么杀死雷胜？",
        "没想到少侠竟然能查到这里来。",
    };
    TalkEx("two_05_01", szTalk);
end;

function two_05_01()
    local szTalk = {
        "其实雷胜投奔长歌门，是有着一些特殊的原因。",
        "但是恕我不能向少侠直言。",
        "少侠可去找夏侯琴谈谈。",
        "这事于她有大干系!",
    };
    TalkEx("two_05_02", szTalk);
end;

function two_05_02()
    SetTask(TASK_YZ_TWO, 6);
    Msg2Player("去扬州府找夏侯琴谈谈");
    TaskTip("去扬州府找夏侯琴谈谈");
    GivePlayerAward("Level_50", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang1")		--得知真相1
end;

function two_06_00()
    local szTalk = {
        "没想到还是没能瞒过少侠！",
        "其实这也有我的苦衷。",
        "事涉莲儿，还希望少侠知道原因后，能够保密。",
    };
    TalkEx("two_06_01", szTalk);
end;

function two_06_01()
    local szTalk = {
        "莲儿从小异于常人。",
        "体质强盛且有着火麒麟的些许血脉之力。",
        "那雷胜投奔长歌门，其实也是想获得莲儿的一些血脉之力",
        "因此我才会请唐宁在暗处击杀他。",
        "以免养虎为患!"
    };
    TalkEx("two_06_02", szTalk);
end;

function two_06_02()
    SetTask(TASK_YZ_TWO, 7);
    GivePlayerAward("Level_50", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"dezhizhenxiang2")		--得知真相2
end;

function two_07_00()
    local szSay = {
        "少侠是否获得了麒麟血？",
        "麒麟血有什么用/about_chj",
        "我确实获得了麒麟血/about_xhl"
    };
    SelectSay(szSay);
end;

function about_chj()
    local szTalk = {
        "莲儿身世特殊，火麒麟血于她有大用！"
    };
    TalkEx("", szTalk);
end;

function about_xhl()
    local szSay = {
        "少侠能否将 {麒麟血} 给我呢？",
        "麒麟血与我无用，就送给你了/have_one",
        "我不想给你/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szTalk = {
        "麒麟血我就收下了.",
        "在此替莲儿感谢少侠!"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_YZ_TWO, 8);
    DelItem(2,0,150,1);
end;

function have_none()

end;