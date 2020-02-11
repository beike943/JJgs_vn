--扬州任务
--created by lizhi
--2005-9-1 10:21

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");

function task_06_00()
    local szTalk = {
        "其实还有一些事情想麻烦少侠",
        "我亲戚的女儿夏侯莲,生了一场怪病，但是我现在不便行动，你可替我去找陈敏大夫看看需要什么药材？",
        "我这就去!"
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    SetTask(TASK_FIVE, 7);
    Msg2Player("去陈敏大夫那里看看");
    TaskTip("去陈敏大夫那里看看");
end;

function task_07_xh_00()
    local szTalk = {
        "陈敏大夫在扬州东南角，你快去找他吧！"
    };
    TalkEx("", szTalk);
end;

function task_07_cm_00()
    local szTalk = {
        "我是替夏侯琴来的，她有些事情脱不开身，请问夏侯莲那孩子的病情如何的了？需要一些什么药材?",
        "那孩子的病甚是奇怪，似乎是中毒的情况，但是又不好确定。你先弄一根黄虎灵骨来，压制一下毒性.但是扬州四处又没有什么老虎。你去少林或者灵宝山的老虎身上取得一根黄虎灵骨来。"
    };
    TalkEx("task_07_01", szTalk);
end;

function task_07_01()
    SetTask(TASK_FIVE, 8);
    CreateTrigger(0,533,KILL_YZ_LAOHU);
    Msg2Player("去少林或灵宝山的老虎身上取得一根黄虎灵骨");
    TaskTip("去少林或灵宝山的老虎身上取得一根黄虎灵骨");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng1")		--怜儿的奇症1
end;

function task_08_00()
    local szTalk = {
        "黄虎灵骨带回来了吗?."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    if GetTrigger(KILL_YZ_LAOHU) == 0 then
        CreateTrigger(0,533,KILL_YZ_LAOHU);
    end;
end;

function task_09_00()
    local szTalk = {
        "对，对，就是这种白虎灵骨了,可以暂时的缓解一下那个孩子的病情了!",
        "好了,这是虎骨灵粉,你快去送予夏侯莲那里,叫她速速服下,不可再有耽搁.",
        "我这就赶过去.",
    };
    local szNot = {
        "<sex> t譵 頲 Ho祅g h? linh c鑤 ch璦?",
        "V蒼 ch璦 t譵 頲."
    };
    if GetItemCount(2,0,44) >= 1 then
        TalkEx("task_09_01", szTalk);
    else
        TalkEx("task_08_01", szNot);
    end;
end;

function task_09_01()
    SetTask(TASK_FIVE, 10);
    RemoveTrigger(GetTrigger(KILL_YZ_LAOHU));
    DelItem(2,0,44,1);
    AddItem(2,0,45,1);
    Msg2Player("将虎骨灵粉让扬州府的夏侯莲服下");
    TaskTip("将虎骨灵粉让扬州府的夏侯莲服下");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng2")		--怜儿的奇症2
end;

function task_10_00()
    local szTalk = {
        "这是陈大夫让你吃的药!",
        "妈妈说不能随便要陌生人给的东西,尤其是吃的",
        "不能耽误了，是你们夏侯琴姐姐叫我送来的啊。",
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_FIVE, 11);
    DelItem(2,0,45,1);
    Msg2Player("将情况告诉夏侯琴");
    TaskTip("将情况告诉夏侯琴");
    GivePlayerAward("Level_20","easy");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng3")		--怜儿的奇症3
end;

function task_11_00()
    local szTalk = {
        "莲儿的病已经好点了是吧.",
        "真的是太感谢你了!"
    };
    TalkEx("task_11_01", szTalk);
end;

function task_11_01()
    SetTask(TASK_FIVE, 12);
    local szTalk = {
        "嗯，听说江南的武器价格大涨，甚至打铁的材料也水涨船高，城中的铁匠孟岩拽受人所迫被逼迫打造兵器，你现在去调查一下!",
        "好的，我这就去！"
    };
    TalkEx("task_12_01", szTalk);
    GivePlayerAward("Level_20","hard");
	GivePlayerExp(SkeyYZxiahouqin,"lianerdeqizheng4")		--怜儿的奇症4
end;

function task_12_00()
    local szTalk = {
        "Nghe n鉯 gi? c? v? nguy猲 li謚 l祄 v? kh? ? Giang Nam t nhi猲 t╪g cao, th? r蘮 {M穘h Nham } b? 衟 l祄 m閠 s? binh kh?, ngi n  甶襲 tra xem!",
        "T筰 h? l猲 阯g ngay!"
    };
    TalkEx("task_12_01", szTalk);
end;

function task_12_01()
    SetTask(TASK_FIVE, 13);
    Msg2Player("去找扬州府的铁匠孟岩谈谈");
    TaskTip("去找扬州府的铁匠孟岩谈谈");
end;

function task_13_00()
    local szTalk = {
        "听说现在武器的价格都已经涨了几倍，是怎么回事啊?",
        "是啊!不知道为什么各地都有人在收购兵刃，所以别说兵器了。甚至连矿石什么的都张了好几倍的价钱了，就算有钱都很难买到了。现在这个时候居然还有个死婆娘把刀架在老子脖子上逼老子造那么多刀剑:我哪来的材料啊?",
        "哦，原来是这样啊，那逼你造刀剑的女人是谁啊?",
        "那我可怎么能说啊!武器做不完我脖子上就肯定有个大口子了，再说出去我祖坟都得被那个死婆娘挖了。除非你能帮我找齐制造的材料，我能够按期交上刀剑才能告诉你。",
        "那么你需要什么材料呢?哪里才能弄到呢?",
        "现在正当手段根本就弄不到了。上次，有个商人想弄一批生铁来扬州大发笔。结果路过龙泉村的时候被草寇抢了。你只有到龙泉村去从那些草寇身上反抢一些了。你给我拿20块生铁回来吧。",
    };
    TalkEx("task_13_01", szTalk);
end;

function task_13_01()
    SetTask(TASK_FIVE, 14);
    CreateTrigger(0,534,KILL_YZ_CK);
    Msg2Player("去龙泉村击杀草寇夺得20个生铁!");
    TaskTip("去龙泉村击杀草寇夺得20个生铁!");
    GivePlayerAward("Level_25", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"jiagegaozhangdewuqi1")		--价格高涨的武器1
end;

function task_14_00()
    local szTalk = {
        "真的拿回来了啊!这些材料足够我锻造很多兵器了。逼我的人叫向丝青，好像是到龙泉村的西北角可以找到她。"
    };
    local szNot = {
        "20个生铁带回来了吗？"
    };
    if GetItemCount(2,0,98) >= 20 then
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szNot);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_YZ_CK) == 0 then
        CreateTrigger(0,534,KILL_YZ_CK);
    end;
end;

function task_14_01()
    RemoveTrigger(GetTrigger(KILL_YZ_CK));
    DelItem(2,0,98,20);
    SetTask(TASK_FIVE, 15);
    Msg2Player("去龙泉村找向丝青");
    TaskTip("去龙泉村找向丝青");
    GivePlayerAward("Level_25", "hard", "trinket", "Level_25");
	GivePlayerExp(SkeyYZxiahouqin,"jiagegaozhangdewuqi2")		--价格高涨的武器2
end;

function task_15_00()
    local szTalk = {
        "你就是向丝青吧？听说你在大肆收购兵器，有何居心，效命于谁?",
        "呵呵，杀人啊,小乖乖，难道回家切豆腐？老娘当然是蚩火教的人了，我不说你也能猜到吧?",
        "身为一个女子，怎能如此狠毒，把杀人说的跟吃饭睡觉一般平常。",
        "哟，你怎么能说我狠毒呢？可是把奴家的心给伤了，本来我还想好心的救人呢，既然你说我狠毒，这事我也就不管了，算了，那个小女孩的死活我不管了，只可惜那么个美人胚子，将来肯定是大美女呢！",
        "你要救人?小女孩?莫非你说的是夏侯莲?你怎么知道她中毒了?",
        "哼,我不仅知道这个,我还知道如果三十天内没有我的秘制解药,她这条命就算交代了!",
        "竟然有这事!救人一命胜造七级浮屠,还望姑娘出手相助啊!",
        "你去扬州西方云梦泽，在毒蟾蜍身上找到3份蟾酥拿给向青丝",
        "我马上去!"
    };
    TalkEx("task_15_01", szTalk);
end;

function task_15_01()
    SetTask(TASK_FIVE, 16);
    CreateTrigger(0,535,KILL_YZ_DCC);
    Msg2Player("去云梦泽的毒蟾蜍身上找到3份蟾酥");
    TaskTip("去云梦泽的毒蟾蜍身上找到3份蟾酥");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren1")		--神秘女人1
end;

function task_16_00()
    local szTalk = {
        "已经拿到了吗?",
        "稍等",
        "我现在制作天蟾化毒膏!",
    };
    local szNot = {
        "快去找3份蟾酥!"
    };
    if GetItemCount(2,0,99) >= 3 then
        TalkEx("task_16_01", szTalk);
    else
        TalkEx("task_16_02", szNot);
    end;
end;

function task_16_02()
    if GetTrigger(KILL_YZ_DCC) == 0 then
        CreateTrigger(0,535,KILL_YZ_DCC);
    end;
end;

function task_16_01()
    RemoveTrigger(GetTrigger(KILL_YZ_DCC));
    SetTask(TASK_FIVE, 17);
    AddItem(2,0,302,1);   --天蟾化毒膏
    DelItem(2,0,99,3);
    Msg2Player("将天蟾化毒膏给陈敏大夫验证一下");
    TaskTip("将天蟾化毒膏给陈敏大夫验证一下");
    GivePlayerAward("Level_30", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren2")		--神秘女人2
end;

function task_17_00()
    local szTalk = {
        "这份天蟾化毒膏应该是没有什么问题",
        "你这样.",
        "把这个药拿给夏侯琴看看她的意见",
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    SetTask(TASK_FIVE, 18);
    Msg2Player("询问一下夏侯琴的意见");
    TaskTip("询问一下夏侯琴的意见");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren3")		--神秘女人3
end;

function task_18_00()
    local szTalk = {
        "既然陈敏大夫已经验证过天蟾化毒膏!",
        "那就请你将药膏交给夏侯莲使用吧.",
    };
    TalkEx("task_18_01", szTalk);
end;

function task_18_01()
    SetTask(TASK_FIVE, 19);
    Msg2Player("把天蟾化毒膏给夏侯莲服下");
    TaskTip("把天蟾化毒膏给夏侯莲服下");
    GivePlayerAward("Level_30", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren4")		--神秘女人4
end;

function task_19_00()
    local szTalk = {};
    if GetSex() == 1 then
        szTalk = {
            "快来把这个药吃了吧!!",
            "这?.",
            "谢谢大侠,吃了这个药我好多了",
        };
    elseif GetSex() == 2 then
        szTalk = {
            "快来把这个药吃了吧!!",
            "这?.",
            "谢谢大侠,吃了这个药我好多了",
        };
    end;
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    SetTask(TASK_FIVE, 20);
    DelItem(2,0,302,1);
    Msg2Player("把消息告诉夏侯琴");
    TaskTip("把消息告诉夏侯琴");
    GivePlayerAward("Level_30", "hard", "weapon", "Level_28");
	GivePlayerExp(SkeyYZxiahouqin,"shenminvren5")		--神秘女人5
end;

function task_20_00()
    local szTalk = {
        "看来莲儿是没问题了!",
        "辛苦你了!"
    };
    TalkEx("task_20_01", szTalk);
end;

function task_20_01()
    local szTalk = {
        "投奔长歌门的原蚩火教重要人物雷胜来扬州途中被人追杀,现在躲入龙泉村附近的清溪洞.",
        "麻烦你尽快过去支援!"
    };
    SetTask(TASK_FIVE, 21);
    TalkEx("", szTalk);
    Msg2Player("去龙泉村的清溪洞帮助雷胜脱困");
    TaskTip("去龙泉村的清溪洞帮助雷胜脱困");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"jiuzhuleisheng")		--救助雷胜
end;

function task_22_00()
    local szTalk = {
        "已经死了吗?",
        "看来还是去晚了一步."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    local szTalk = {
        "听说雷胜脱离蚩火教是准备把一样神秘的宝物送给我们长歌门.",
        "你去清溪洞检查下雷胜的尸体,把东西找到交给我."
    };
    TalkEx("task_22_02", szTalk);
end;

function task_22_02()
    SetTask(TASK_FIVE, 23);
    Msg2Player("去清溪洞检查雷胜的尸体");
    TaskTip("去清溪洞检查雷胜的尸体");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu1")		--神秘宝物1
end;

function task_23_00()
    local szTalk = {
        "应该不止是这些,你再仔细的搜一下.",
        "去附近的天阴武士身上寻找神秘地图右部!",
    };
    local szNot = {
        "Ngi th? 甶 甶襲 tra thi th? c馻 L玦 Th緉g xem c? ph竧 hi謓 g? kh玭g?"
    };
    if GetItemCount(2,0,103) >= 1 then
        TalkEx("task_23_01", szTalk);
    else
        TalkEx("", szNot);
    end;
end;

function task_23_01()
    SetTask(TASK_FIVE, 24);
    DelItem(2,0,103,1);
    CreateTrigger(0,537,KILL_YZ_WS);
    Msg2Player("去寻找神秘地图右部份");
    TaskTip("去寻找神秘地图右部份!");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu2")		--神秘宝物2
end;

function task_24_00()
    local szTalk = {
        "现在你带着锄头和神秘地图,到武夷山的牌坊附近使用神秘地图，看看宝物在哪里.",
        "我现在就去."
    };
    local szNot = {
        "Mau n {Thanh Kh? ng} nh b筰 {Thi猲  v? s軁 畂箃 {n鯽 t蕀 b秐 } c遪 l筰!"
    };
    if GetItemCount(2,0,104) >= 1 then
        TalkEx("task_24_01", szTalk);
    else
        TalkEx("task_24_02", szNot);
    end;
end;

function task_24_02()
    if GetTrigger(KILL_YZ_WS) == 0 then
        CreateTrigger(0,537,KILL_YZ_WS);
    end;
end;

function task_24_01()
    AddItem(2,0,105,1);
    DelItem(2,0,104,1);
    SetTask(TASK_FIVE, 25);
    Msg2Player("去武夷山使用神秘地图!");
    TaskTip("去武夷山使用神秘地图!");
    GivePlayerAward("Level_34", "hard");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu3")		--神秘宝物3
end;

function task_25_00()
    local szTalk = {
        "锄头在杂货店购买, 然后在武夷山167.195附近挖一下!"
    };
    local szMsg = {
        "T譵 kh玭g 頲 {B秐  th莕 b輢?? May m? ta c遪 1 t蕀, c莔 l蕐 甶!"
    };
    if GetItemCount(2,0,105) >= 1 then
        TalkEx("", szTalk);
    else
        TalkEx("task_25_00_00", szMsg);
    end;
end;

function task_25_00_00()
    AddItem(2,0,105,1);
end;

function task_26_00()
    local szTalk = {
        "已经得到了吗？",
        "你把这份宝物交给武夷山一见草舍的唐宁."
    };
    TalkEx("task_26_01", szTalk);
end;

function task_26_01()
    SetTask(TASK_FIVE, 27);
    Msg2Player("去武夷山找唐宁");
    TaskTip("去武夷山找唐宁");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu4")		--神秘宝物4
end;

function task_27_00()
    local szTalk = {
        "竟然发生了这么多事.",
        "我知道了，你现在先去回复夏侯琴吧."
    };
    TalkEx("task_27_01", szTalk);
end;

function task_27_01()
    SetTask(TASK_FIVE, 28);
    DelItem(2,0,106,1);
    Msg2Player("回复夏侯琴");
    TaskTip("回复夏侯琴");
    GivePlayerAward("Level_34", "easy");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu5")		--神秘宝物5
end;

function task_28_00()
    local szTalk = {
        "此事至此告一段落.",
        "辛苦少侠了!"
    };
    TalkEx("task_28_01", szTalk);
end;

function task_28_01()
    SetTask(TASK_FIVE, 29);
    GivePlayerAward("Level_34", "hard", "weapon", "Level_34");
	GivePlayerExp(SkeyYZxiahouqin,"shenmibaowu6")		--神秘宝物6
end;

