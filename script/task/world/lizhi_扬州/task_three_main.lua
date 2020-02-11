--扬州任务分支
--created by lizhi
--2005-9-2 10:12

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

---------------------------------------扬州分支三-------------------------------------

function task_01_00()
    local szTalk = {
        "我真是太倒霉了!",
        "我前几天去武夷山采药",
        "山上的野兽不知道为何暴动起来，袭击了我，不仅受了伤，还把包袱给丢了，少侠能否帮我找回来？",
        "我这就去找!"
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    SetTask(TASK_YZ_THREE, 2);
    CreateTrigger(0,538,KILL_YZ_BG);
    Msg2Player("去武夷山找回张伯汉的包袱");
    TaskTip("去武夷山找回张伯汉的包袱");
end;

function task_02_00()
    local szMsg = {
        "还没有找到{我的包袱}吗?他就丢在武夷山两水洞附近!"
    }
    local szTalk = {
        "这就是我丢失的包裹!",
        "多谢大侠帮我找回来了！",
        "其实这些异兽我也不知道是怎么回事，不过你可以去问问 {李进勇}, 或许他知道!"
    };
    if GetItemCount(2,0,144) >= 1 then
        TalkEx("task_02_01", szTalk);
    else
        TalkEx("task_02_02", szMsg);
    end;
end;

function task_02_02()
    if GetTask(KILL_YZ_BG) == 0 then
        CreateTrigger(0,538,KILL_YZ_BG);
    end;
end;

function task_02_01()
    RemoveTrigger(GetTrigger(KILL_YZ_BG));
    SetTask(TASK_YZ_THREE, 3);
    DelItem(2,0,144,1);
    Msg2Player("去找扬州府的李进勇询问情况");
    TaskTip("去找扬州府的李进勇询问情况");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi1")		--异兽现世1
end;

function task_03_00()
    local szTalk = {
        "其实近来这些事情很多",
        "我这些许有一些线索。",
        "劳烦少侠去{武夷山}帮我带一张{苍猿之皮}!",
        "或许会有一些收获!"
    };
    TalkEx("task_03_01", szTalk);
end;

function task_03_01()
    SetTask(TASK_YZ_THREE, 4);
    CreateTrigger(0,539,KILL_YZ_CY);
    Msg2Player("去武夷山收集一张苍猿之皮");
    TaskTip("去武夷山收集一张苍猿之皮");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi2")		--异兽现世2
end;

function task_04_00()
    local szTalk = {
        "嗯，已经拿到了吗?",
        "线索还是不够",
        "可否劳烦少侠再去取一缕银狐之毫？",
        "我这就去."
    };
    local szMsg = {
        "可否劳烦少侠再去取一缕银狐之毫?"
    };
    if GetItemCount(2,0,145) >= 1 then
        TalkEx("task_04_01", szTalk);
    else
        TalkEx("task_04_02", szMsg);
    end;
end;

function task_04_02()
    if GetTrigger(KILL_YZ_CY) == 0 then
        CreateTrigger(0,539,KILL_YZ_CY);
    end;
end;

function task_04_01()
    RemoveTrigger(GetTrigger(KILL_YZ_CY));
    DelItem(2,0,145,1);
    SetTask(TASK_YZ_THREE, 5);
    CreateTrigger(0,540,KILL_YZ_YH);
    Msg2Player("去武夷山找到一缕银狐之毫");
    TaskTip("去武夷山找到一缕银狐之毫");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi3")		--异兽现世3
end;

function task_05_00()
    local szTalk = {
        "两水洞是武夷山的风水精华所在之地。",
        "也许武夷山出现的异兽的原因是因为两水洞发生了什么事情。",
        "听说最熟悉两水洞的就是{刘玄清}了，你去找他问问两水洞是不是发生了什么!",
        "他就在扬州府西南角!"
    };
    local szMsg = {
        "Phi襫 <sex> n V? Di s琻 mang l玭g ng﹏ h? v?!"
    };
    if GetItemCount(2,0,146) >= 1 then
        TalkEx("task_05_01", szTalk);
    else
        TalkEx("task_05_02", szMsg);
    end;
end;

function task_05_02()
    if GetTask(KILL_YZ_YH) == 0 then
        CreateTrigger(0,540,KILL_YZ_YH);
    end;
end;

function task_05_01()
    RemoveTrigger(GetTrigger(KILL_YZ_YH));
    DelItem(2,0,146,1);
    SetTask(TASK_YZ_THREE, 6);
    Msg2Player("去扬州府西南角找刘玄清");
    TaskTip("去扬州府西南角找刘玄清");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yishouxianshi4")		--异兽现世4
end;

function task_06_00()
    local szTalk = {
        "你问武夷山的事情？",
        "我上次去武夷山的时候，里面竟然出现枪神，我还被狠狠的欺负了一顿。",
        "能否请少侠帮我教训{30}个{枪神}出出气？!",
        "我这就去，你稍等下"
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    CreateTrigger(0,541,KILL_YZ_QS);
    SetTask(TASK_YZ_THREE, 7);
    Msg2Player("去两水洞教训30个枪神");
    TaskTip("去两水洞教训30个枪神");
    GivePlayerAward("Level_45", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan1")		--异动之源1
end;

function task_07_00()
    local szTalk = {
        "还请请少侠前往两水洞帮我教训{30}个{枪神}出这口恶气！"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    if GetTrigger(KILL_YZ_QS) == 0 then
        CreateTrigger(0,541,KILL_YZ_QS);
    end;
end;

function task_08_00()
    local szTalk = {
        "多谢少侠！",
        "最近这两水洞的事情，其实与蚩火教有关。",
        "那天我在两水洞二层入口那里发现一件很奇怪的事情." 
    };
    TalkEx("task_08_00_00", szTalk);
end;

function task_08_00_00()
    local szTalk = {
        "当时地上有红色的火焰在燃烧，并且无法浇灭，很是古怪。",
        "少侠可否前往两水洞一层最中心的地方，取来一些泥土!"
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    SetTask(TASK_YZ_THREE, 9);
    AddItem(2,0,147,1);
    Msg2Player("去两水洞一层最中心的地方取一点泥土回来");
    TaskTip("去两水洞一层最中心的地方取一点泥土回来");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan2")		--异动之源2
end;

function task_09_00()
    local szTalk = {
        "听说扬州府醉春楼的秋荣姑娘和几个蚩火教徒很熟.",
        "去问问也许能够得到什么有用的情报！",
    };
    local szHaveNoBottle = {
        "Chi誧 b譶h kh玭g ta a ngi l祄 m蕋 r錳 ?? May ta c遪 m蕐 b譶h ng n dc, chuy謓 n祔 phi襫 <sex> v藋."
    }
    local szHaveBottle = {
        "? y c? chi誧 b譶h kh玭g ngi v祇 Lng Th駓 ng t莕g 1 l蕐 m閠 輙 c竧 v? y. Ta mu鑞 d飊g c竧 r秈 quanh nh?  tng nh? ngi qu? c?."
    };
    if GetItemCount(2,0,148) >= 1 then  --已经有泥土了
        TalkEx("task_09_01", szTalk);
    else
        if GetItemCount(2,0,147) >= 1 then  --没有泥土有空瓶子
            TalkEx("", szHaveBottle);
        else                                --没有泥土也没有瓶子
            TalkEx("", szHaveNoBottle);
            AddItem(2,0,147,1);
        end;
    end;
end;

function task_09_01()
    SetTask(TASK_YZ_THREE, 10);
    DelItem(2,0,148,1);
    Msg2Player("去扬州找秋蓉");
    TaskTip("去扬州找秋蓉");
    GivePlayerAward("Level_45", "hard", "head", "Level_39");
	GivePlayerExp(SkeyYZxiahouqin,"yidongzhiyuan3")		--异动之源3
end;

function task_10_00()
    local szTalk = {
        "蚩火教的阴谋？",
        "大侠客真会开玩笑，这些事情又与奴家何干呢？",
        "听说蒋维那里有一个名为天香胭脂的稀罕物。",
        "奴家去替大侠打听一二又何妨？",
        "蒋维就在扬州的东南角，还请大侠快去快回!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_YZ_THREE, 11);
    Msg2Player("去找蒋维问问天香胭脂的事情");
    TaskTip("去找蒋维问问天香胭脂的事情");
end;

function task_11_00()
    local szTalk = {
        "我的{天香胭脂}已经用完了。",
        "你去收集江津村阴魂身上的暗烟、武当野猪身上的朱砂、杏花村大黄蜂身上的蜂巢以及武当七星洞二层的女剑豪身上的梳妆匣各一份交给我。",
        "我来重新给你制作一份！"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_YZ_THREE, 12);
    Msg2Player("去收集材料交给蒋维");
end;

--暗烟	2,1,26
--野猪 朱砂 (2,2,30)
--大黄蜂 蜂巢 (2,1,13)
--女剑豪 梳妆匣 (2,1,57)

function task_12_00()
    local szTalk = {
        "这么快就把材料拿来了!",
        "还请大侠稍候片刻",
        "这是天香胭脂，还请大侠收好!"
    };
    local szMsg = {
        "收集江津村阴魂身上的暗烟、武当野猪身上的朱砂、杏花村大黄蜂身上的蜂巢以及武当七星洞二层的女剑豪身上的梳妆匣各一份."
    };
    if GetItemCount(2,1,26) >= 1 and GetItemCount(2,2,30) >= 1 and GetItemCount(2,1,13) >= 1 and GetItemCount(2,1,57) >= 1 then
        TalkEx("task_12_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_12_01()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("将天香胭脂交给秋蓉");
    TaskTip("将天香胭脂交给秋蓉");
    GivePlayerAward("Level_40", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou1")		--两水阴谋
end;

function task_12_02()
    DelItem(2,1,26,1);
    DelItem(2,2,30,1);
    DelItem(2,1,13,1);
    DelItem(2,1,57,1);
    AddItem(2,0,149,1);
    SetTask(TASK_YZ_THREE, 13);
    Msg2Player("将天香胭脂交给秋蓉");
    TaskTip("将天香胭脂交给秋蓉");
end

function task_13_jw_00()
    local szMsg = {
        "<sex> mu鑞 l祄 Thi猲 Hng ph蕁 n鱝 kh玭g? Ch?c莕 n Giang T﹏ Th玭 t譵 kh鉯 ﹎ tr猲 ngi  h錸, chu sa tr猲 m譶h Heo r鮪g, t?ong tr猲 ong v祅g v?lc trang s鴆 tr猲 ngi N?Ki誱 h祇, t譵  nguy猲 li謚 ta s?gi髉 ngi l祄."
    };
    local szElse = {
        "将天香胭脂交给秋蓉."
    };
    local szTalk = {
        "ng l? s? nguy猲 li謚 n祔 r錳! ьi ta m閠 l竧!",
        "厖",
        "Thi猲 Hng ph蕁 y! <sex> c莔 l蕐!",
        " t?!"
    };
    if GetItemCount(2,0,149) >= 1 then
        TalkEx("", szElse);
    else
        if GetItemCount(2,1,26) >= 1 and GetItemCount(2,2,30) >= 1 and GetItemCount(2,1,13) >= 1 and GetItemCount(2,1,57) >= 1 then
            TalkEx("task_12_02", szTalk);
        else
            TalkEx("", szMsg);
        end;
    end;
end;

function task_13_qr_00()
    local szMsg = {
        "少侠还不快去。"
    };
    local szTalk = {
        "那群天杀的蚩火教徒.",
        "他们偷走了我的紫凤金钗!",
        "大侠能不能帮我夺回来？"
    };
    if GetItemCount(2,0,149) >= 1 then
        TalkEx("task_13_qr_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_13_qr_01()
    SetTask(TASK_YZ_THREE, 14);
    DelItem(2,0,149,1);
    CreateTrigger(0,542,KILL_YZ_JT);
    Msg2Player("帮秋蓉去两水洞二层从蚩火教徒身上找回紫凤金钗");
    TaskTip("帮秋蓉去两水洞二层从蚩火教徒身上找回紫凤金钗");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou2")		--两水阴谋2
end;

function task_14_00()
    local szTalk = {
        "我无意中听说蚩火教徒似乎想召唤一个异兽!",
        "似乎是叫做火麒麟",
        "蚩火教徒似乎就是因为它，才会聚集在两水洞，而且武夷山的野兽异动也是因此!",
        "大侠快去{两水洞二层}看看吧！.",
    };
    local szMsg = {"紫凤金钗帮我夺回来了吗？!"};
    if GetItemCount(2,0,303) >= 1 then --紫凤金钗
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szMsg);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_YZ_JT) == 0 then
        CreateTrigger(0,542,KILL_YZ_JT);
    end;
end;

function task_14_01()
    RemoveTrigger(GetTrigger(KILL_YZ_JT));
    SetTask(TASK_YZ_THREE, 15);
    DelItem(2,0,303,1);   --紫凤金钗
    Msg2Player("去两水洞二层击杀火麒麟");
    TaskTip("去两水洞二层击杀火麒麟");
    GivePlayerAward("Level_45", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou3")		--两水阴谋3
end;

function task_16_00()
    local szTalk = {
        "大侠可真是厉害！",
        "大侠可去{唐门}找{唐春}了解一下后续的事宜了!"
    };
    TalkEx("task_16_01", szTalk);
end;

function task_16_01()
    SetTask(TASK_YZ_THREE, 17);
    SetTask(TASK_YZ_TWO, 4);
    GivePlayerAward("Level_50", "hell", "chest", "Level_44");
	GivePlayerExp(SkeyYZxiahouqin,"liangshuiyinmou4")		--两水阴谋4
end;