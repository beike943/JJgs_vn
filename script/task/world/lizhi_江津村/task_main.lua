--江津村脚本
--created by lizhi
--2005-9-5 19:43

Include("\\script\\task\\world\\task_var_id.lua");
Include("\\script\\task\\world\\task_trigger_list.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\task\\world\\task_award.lua");

function task_01_00()
    local szTalk = {
        "少侠找我有何贵干?",
        "[{向诸葛棋诉说“花石纲”中暗藏有《山河社稷图》的事}]",
    };
    TalkEx("task_01_01", szTalk);
end;

function task_01_01()
    local szTalk = {
        "我现在无法脱身离开这里,你所提之事老朽也爱莫能助了.",
        "不过老朽为你引荐一人!",
        "此人乃丐帮成都分舵同济堂堂主-{六袋弟子陈飞扬}!",
        "此人刚毅果断,义薄云天!",
        "你去成都寻找{难民甲},他自会为你引荐!"
    };
    TalkEx("task_01_02", szTalk);
end;

function task_01_02()
    SetTask(TASK_JJC, 2);
    DelItem(2,0,78,1);
    AddItem(2,0,81,1);
    Msg2Player("去成都找难民甲");
    TaskTip("去成都找难民甲");
    GivePlayerAward("Level_20", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"baifangzhugeqi1")		--拜访诸葛棋1
end;

function task_02_00()
    local szTalk = {
        "{对难民甲说出来意}",
        "哈哈,看你也面善倒也不会糊弄俺.",
        "不过俺现在口干舌燥没酒喝.",
        "不妨帮我打20壶烧酒回来吧!"
    };
    TalkEx("task_02_01", szTalk);
end;

--2,1,12  烧酒

function task_02_01()
    SetTask(TASK_JJC, 3);
    Msg2Player("帮难民甲带回20壶烧酒");
    TaskTip("帮难民甲带回20壶烧酒");
    GivePlayerAward("Level_20", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"baifangzhugeqi2")		--拜访诸葛棋2
end;

function task_03_00()
    local szSay = {
        "少侠把烧酒带回来了吗?",
        "20壶烧酒我带来了!/have_one",
        "我还没收集好!/have_none"
    };
    SelectSay(szSay);
end;

function have_one()
    local szMsg = {
        "少侠还没有收集齐."
    };
    local szTalk = {
        "如此好酒不可只有我一人享用.",
        "还请少侠帮我把这些酒分给难民乙丙丁!"
    };
    if GetItemCount(2,1,12) >= 20 then
        TalkEx("task_03_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_03_01()
    SetTask(TASK_JJC, 4);
    SetTask(TASK_JJC_YI, 1);
    SetTask(TASK_JJC_BING, 1);
    SetTask(TASK_JJC_DING, 1);
    DelItem(2,1,12,5);
    Msg2Player("把烧酒分发给难民乙丙丁");
    TaskTip("把烧酒分发给难民乙丙丁");
    GivePlayerAward("Level_20", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangtangzhu1")		--丐帮堂主1
end;

function task_04_00()
    local szTalk = {
        "<sex> mau 甧m ru ngon ph﹏ ph竧 cho m蕐 n筺 d﹏ kh竎!"
    };
    --修补任务bug，补上
    if GetTask(TASK_JJC_YI) == 2 and GetTask(TASK_JJC_BING) == 2 and GetTask(TASK_JJC_DING) == 2 then
        --SetTask(TASK_JJC, 5);
        SetTask(TASK_JJC_YI, 0);
        SetTask(TASK_JJC_BING, 0);
        SetTask(TASK_JJC_DING, 0);
        task_05_00();
    else
    	TalkEx("", szTalk);
    end;
end;

function task_jjc_fq(nPerson)
    local szTalk = {};
    local nTaskID = 0;
    if GetItemCount(2,1,12) >= 5 then
        if nPerson == 2 then    --难民乙
            szTalk = {
                "[这是难民甲让我送来的烧酒!]",
                "哈哈,多谢少侠!回头替我谢谢兄弟难民甲."
            };
            nTaskID = TASK_JJC_YI;
        elseif nPerson == 3 and GetCash() >= 50 then    --难民丙，有50铜以上
            szTalk = {
                "这是难民甲让我送来的烧酒!",
                "多谢少侠!回头替我谢谢兄弟难民甲!",
                "不过,有酒没有下酒菜,真是可惜啊!",
                "还请少侠给我点铜币买点下酒菜吧."
            };
            nTaskID = TASK_JJC_BING;
        elseif nPerson == 3 and GetCash() < 50 then     --难民丙，没有50铜
            szTalk = {
                "这是难民甲让我送来的烧酒!",
                "多谢少侠!回头替我谢谢兄弟难民甲!",
                "不过,有酒没有下酒菜,真是可惜啊!",
                "啊!少侠没有铜币?真是可惜啊!"
            };
            nTaskID = TASK_JJC_BING;
        elseif nPerson == 4 then    --难民丁
            szTalk = {
                "这是难民甲让我送来的烧酒!",
                "(咕噜..咕噜)",
                "好久没喝到酒了,多谢少侠!"
            };
            nTaskID = TASK_JJC_DING;
        end;
        if GetTask(nTaskID) == 1 then
            TalkEx("#task_jjc_fq_01("..nTaskID..")", szTalk);
        end;
    else
        szTalk = {
            "少侠把烧酒送到了吗!"
        };
        TalkEx("", szTalk);
    end;
end;

function task_jjc_fq_01(nTaskID)
    --GivePlayerAward("Level_20", "normal");
	if nTaskID == TASK_JJC_BING and GetCash() >= 50 then
    	Pay(10);
    end;
    ModifyExp(100);
	DelItem(2,1,12,5);
	SetTask(nTaskID, 2);
    --如果3个难民都送过了
    if GetTask(TASK_JJC_YI) == 2 and GetTask(TASK_JJC_BING) == 2 and GetTask(TASK_JJC_DING) == 2 then
        SetTask(TASK_JJC, 5);
        SetTask(TASK_JJC_YI, 0);
        SetTask(TASK_JJC_BING, 0);
        SetTask(TASK_JJC_DING, 0);
    end;
end;

function task_05_00()
    local szTalk = {
        "还是烧酒好喝,够劲!",
        "说到我们陈舵主,俺也好多天没见到他了,前些日子舵主说要去{剑阁蜀道},你得去那里找找."
    };
    TalkEx("task_05_01", szTalk);
end;

function task_05_01()
    SetTask(TASK_JJC, 6);
   Msg2Player("去剑阁蜀道找陈飞杨");
    TaskTip("去剑阁蜀道找陈飞杨");
    GivePlayerAward("Level_20", "hard", "chest", "Level_27");
	GivePlayerExp(SkeyCDFanzhongyan,"gaibangtangzhu2")		--丐帮堂主2
end;

function task_06_00()
    local szTalk = {
        "[这位大哥可是丐帮的{陈飞杨},陈舵主?]",
        "哈哈,什么舵主不舵主的,叫我陈兄弟就好了,我看你一路风尘,找我有什么事?",
        "[陈舵主,哦...陈兄弟果然快人快语,这次我是经{诸葛前辈}介绍来请陈兄弟帮个忙.]",
        ".........该来的总是要来."
    };
    TalkEx("task_06_01", szTalk);
end;

function task_06_01()
    local szTalk = {
        "不知道你怎么看待{西夏人}?",
        "[晚辈初涉江湖时世了解不多,对于西夏人晚辈还没有接触过,不过英雄应该由他的品行所决定,所以我想西夏人也是{同汉人大概无异},只不过民族不同罢了.]",
        "小小年纪就能由如此见地,真是令人佩服.",
        "我本该下山助你一臂之力,不过我在金光洞内夺一法器时被洞中妖孽所伤,虽无大碍,但还是有些行走不便,不知你是否能为我寻些{虎骨}来!"
    };
    TalkEx("task_06_02", szTalk);
end;

function task_06_02()
    SetTask(TASK_JJC, 7);
    CreateTrigger(0,546,KILL_JJC_LAOHU);
    DelItem(2,0,81,1);
    Msg2Player("打10根虎骨给陈飞杨做药引");
    TaskTip("打10根虎骨给陈飞杨做药引");
    GivePlayerAward("Level_24", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"liaoshangzhiyao1")		--疗伤之药1
end;

function task_07_00()
    local szTalk = {
        "哈哈,看来你不仅见识卓越,武功也不错,真是后生可畏呀!",
        "有了虎骨我只需要再调养几天即可痊愈,梁山高手如云,还是我去趟探听下虚实好了.",
        "你也不比闲着,这是我从金光洞中夺得的{法器}.",
        "兄弟你不妨将其带给诸葛棋{助他除妖}",
        "江山那边就让兄弟我打探,有了消息,就会赶到江津村与兄弟你汇合.",
    };
    local szMsg = {
        "少侠收集齐了吗?"
    };
    if GetItemCount(2,0,55) >= 10 then
        TalkEx("task_07_01", szTalk);
    else
        TalkEx("task_07_02", szMsg);
    end;
end;

function task_07_02()
    if GetTrigger(KILL_JJC_LAOHU) == 0 then
        CreateTrigger(0,546,KILL_JJC_LAOHU);
    end;
end;

function task_07_01()
    DelItem(2,0,55,10);
    AddItem(2,0,83,1);
    SetTask(TASK_JJC, 8);
    Msg2Player("将陈飞杨夺回的法器带给诸葛棋");
    TaskTip("将陈飞杨夺回的法器带给诸葛棋");
    GivePlayerAward("Level_24", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"liaoshangzhiyao2")		--疗伤之药2
end;

function task_08_00()
    local szTalk = {
        "我来看看飞扬这小子给我带来了什么好东西.",
        "好!好!想不到他竟然寻到了{一半锁妖锺}.",
        "此锁妖锺为张天师所炼,可以将妖魔魂魄收于其中,让其不得危害人间.",
        "看来这锁妖锺威力不小,你且拿好这法器.",
        "这些江津村的{腐尸}和{行尸}其实都为村中居民的死后不得解脱的{冤魂所化},我实在不忍心将他们打的魂飞魄散.",
        "你先去{收集他们的冤魂},看看能否驾驭这个法器."
    };
    TalkEx("task_08_01", szTalk);
end;

function task_08_01()
    DelItem(2,0,83,1);
    AddItem(2,0,84,1);
    CreateTrigger(0,547,KILL_JJC_FS);
    CreateTrigger(0,548,KILL_JJC_XS);
    SetTask(TASK_JJC, 9);
    Msg2Player("收集25个腐尸15个行尸的冤魂回报诸葛棋");
    TaskTip("收集25个腐尸15个行尸的冤魂回报诸葛棋");
    GivePlayerAward("Level_26", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"huangyeyuanhun1")		--荒野冤魂1
end;

function task_09_00()
    local szTalk = {
        "看样子你已经可以充分驾驭锁妖锺.",
        "哎,不让它们魂飞魄散我还得想想办法.",
        "生前都是大宋臣民,不能让他们死后{不得善终}!",
        "老夫听说{少林高僧}可以用{佛法超度}邪灵冤魂.",
        "请你带着这些冤魂去少林看看能不能将其超度.",
        "希望他们可以安息.",
        "来生投到太平盛世,平安幸福的度过一生!"
    };
    local szMsg = {
        "<sex> mau mang theo T醓 Y猽 Chung n祔 thu ph鬰 Oan h錸 {H? Thi v? H祅h Thi}!"
    };
    --冤魂数量不够
    if GetItemCount(2,0,85) < 25 or GetItemCount(2,0,86) < 15 then
        TalkEx("task_09_02", szMsg);
        if GetItemCount(2,0,84) == 0 then
            AddItem(2,0,84,1);
        end;
    else
        TalkEx("task_09_01", szTalk);
    end;
end;

function task_09_02()
    if GetTrigger(KILL_JJC_FS) == 0 then
        CreateTrigger(0,547,KILL_JJC_FS);
    end;
    if GetTrigger(KILL_JJC_XS) == 0 then
        CreateTrigger(0,548,KILL_JJC_XS);
    end;
end;

function task_09_01()
    RemoveTrigger(GetTrigger(KILL_JJC_FS));
    RemoveTrigger(GetTrigger(KILL_JJC_XS));
    if GetItemCount(2,0,84) == 0 then
        AddItem(2,0,84,1);
    end;
    SetTask(TASK_JJC, 10);
    Msg2Player("带着装有冤魂的锁妖锺去少林");
    TaskTip("带着装有冤魂的锁妖锺去少林");
    GivePlayerAward("Level_26", "hard", "head", "Level_30");
	GivePlayerExp(SkeyCDFanzhongyan,"huangyeyuanhun2")		--荒野冤魂2
end;

function task_10_00()
    local szTalk = {
        "施主请留步!",
        "此乃少林诸位高僧安息之所,施主还是莫要将{冤魂}带入为善.",
        "{将江津村发生的事情告知无名僧}",
        "啊!竟有此事!这些冤魂因为暴死于非命,死后又{执着于前世故土}.故不能解脱.",
        "贫僧有方法将这些冤魂超度,送往西方极乐世界.",
        "不过还得有劳施主回去寻些{江津村的遗物}来,以解冤魂对故土的思念.",
        "江津村中长有一种红白小花十分好看,人称{望江红},施主可前去寻{五株}回来,阿弥陀佛!"
    };
    TalkEx("task_10_01", szTalk);
end;

function task_10_01()
    SetTask(TASK_JJC, 11);
    DelItem(2,0,84,1);
    DelItem(2,0,85,25);
    DelItem(2,0,86,15);
    CreateTrigger(0, 549, KILL_JJC_WJH);
    Msg2Player("去江津村拿取5株望江红给无名僧");
    TaskTip("去江津村拿取5株望江红给无名僧");
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi1")		--少年往事1
end;

function task_11_00()
    local szTalk = {
        "<sex> c? 甧m 頲 di v藅 ? Giang T﹏ Th玭 v? kh玭g?",
        "{V鋘g Giang H錸g} y!",
        "Ta s? 甧m T醓 Y猽 Chung v? V鋘g Giang H錸g t di th竝, c竎  t? s? ni謒 kinh si猽 tho竧 oan h錸, kho秐g 1 gi? sau th? 頲. Hi謓 b莕 t╪g c? chuy謓 kh玭g r? mu鑞 th豱h gi竜 s? ph?!",
        "Xin i s? c? h醝.",
        "B莕 t╪g nghe n鉯 T醓 Y猽 Chung b? m蕋 t輈h trong cu閏 chi課 ch竛h t?, kh玭g bi誸 th? ch? l蕐 t? u?"
    };
    local szMsg = {
        "施主果然厉害,老衲这就{超度亡灵}",
        "阿弥陀佛!"
    };
    if GetItemCount(2,0,87) >= 5 then
        TalkEx("task_11_01", szTalk);
    else
        TalkEx("task_11_02", szMsg);
    end;
end;

function task_11_02()
    if GetTrigger(KILL_JJC_WJH) == 0 then
        CreateTrigger(0, 549, KILL_JJC_WJH);
    end;
end;

function task_11_01()
    local szTalk = {
        "C? 頲 chu玭g l? nh? s? gi髉  c馻 {Tr莕 Phi Dng},  ch? уng T? 阯g c馻 C竔 Bang.",
        "Ch? tr竎h m蕐 h玬 trc l穙 n筽 th蕐 Phi Dng n th╩ vi課g Phng Trng.",
        "Nghe i s? n鉯 v藋, kh玭g l? Tr莕 i ca l? ngi c馻 Thi誹 L﹎?",
        "Phi Dng t? nh?  m蕋 song th﹏, 頲 Huy襫 T? i s? mang v? Thi誹 L﹎ nu玦 dng, v? sau l筰 頲 Long T筰 Thi猲 bang ch? c馻 C竔 Bang thu l祄  t?, truy襫 d箉 v? c玭g.",
        "Ta th蕐 Tr莕 i ca 產ng phi襫 mu閚.",
        "Th阨 gian kh玭g c遪 nhi襲, th? ch? ? y i ta mang chu玭g v?."
    };
    TalkEx("task_11_02", szTalk);
end;

function task_11_02()
    SetTask(TASK_JJC, 12);
    DelItem(2,0,87,5);
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi2")		--少年往事2
end;

function task_12_00()
    local szTalk = {
        "敢问施主是如何得到这{锁妖锺}?",
        "原来是飞扬,哈哈.",
        "飞扬少年原本{不是中原人},自幼父母双亡,被玄慈大师在西夏和密法喇嘛论佛法途中所救,见他机灵可爱,天资甚高,又无依无靠,于是{待会少林抚养}!",
        "飞扬成年后蒙丐帮帮主龙在天看中,收到门下,委以大用.!",
        "施主放心,老衲必将此事告知方丈,请他做出定夺,派人前往江津村,帮助成都百姓除妖!"
    };
    TalkEx("task_12_01", szTalk);
end;

function task_12_01()
    SetTask(TASK_JJC, 13);
    Msg2Player("回去成都府南的诸葛棋那里复命");
    TaskTip("回去成都府南的诸葛棋那里复命");
    GivePlayerAward("Level_28", "hard");
	GivePlayerExp(SkeyCDFanzhongyan,"shaonianwangshi3")		--少年往事3
end;

function task_13_00()
    local szTalk = {
        "能顺利的超度亡灵并且得到少林的帮助,真是太好了!",
        "对了,我发现陈飞杨送来的包裹里面{还有封信},上面虽然没有文字,但是发出一股淡淡的酸味,江湖中十分{机密的信件},往往会送某种特殊的墨水写成.",
        "等墨水干后自己会消失只有用黑色的细灰才能让它显出字迹,估计这封信也是如此.",
        "想要解开这封信,需要一些{黑鸦的羽毛},将黑鸦的羽毛烧成灰撒在信上,字迹应该就会出来了.",
        "劳烦你去江津村一趟,那边有很多{黑鸦}."
    };
    TalkEx("task_13_01", szTalk);
end;

function task_13_01()
    SetTask(TASK_JJC, 14);
    CreateTrigger(0,550,KILL_JJC_HY);
    Msg2Player("去江津村击杀黑鸦收集4根羽毛");
    TaskTip("去江津村击杀黑鸦收集4根羽毛");
    GivePlayerAward("Level_28", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"mixinyiyun1")		--密信疑云1
end;

function task_14_00()
    local szTalk = {
        "事情不妙!",
        "陈飞杨信中说有件{非常重要的东西}!",
        "落入了{乌蒙部}一行人的手中!",
        "请你速速夺回!"
    };
    local szMsg = {
        "劳烦你去江津村一趟,那边有很多{黑鸦}",
        "想要解开这封信,需要一些{黑鸦的羽毛},将黑鸦的羽毛烧成灰撒在信上,字迹应该就会出来了."
    };
    if GetItemCount(2,0,88) >= 4 then
        TalkEx("task_14_01", szTalk);
    else
        TalkEx("task_14_02", szMsg);
    end;
end;

function task_14_02()
    if GetTrigger(KILL_JJC_HY) == 0 then
        CreateTrigger(0,550,KILL_JJC_HY);
    end;
end;

function task_14_01()
    SetTask(TASK_JJC, 15);
    RemoveTrigger(GetTrigger(KILL_JJC_HY));
    DelItem(2,0,88,4);
    CreateTrigger(0,551,KILL_JJC_SN);
    Msg2Player("去乌蒙部夺回物品");
    TaskTip("去乌蒙部夺回物品");
    GivePlayerAward("Level_28", "hard", "legs", "Level_32");
	GivePlayerExp(SkeyCDFanzhongyan,"mixinyiyun2")		--密信疑云2
end;

function task_15_00()
    local szTalk = {
        "请少侠速去乌蒙部夺回物品!"
    };
    TalkEx("task_15_01", szTalk);
end;

function task_15_01()
    if GetTask(TASK_JJC) == 15 then
        if GetTrigger(KILL_JJC_SN) == 0 then
            CreateTrigger(0,551,KILL_JJC_SN);
        end;
    elseif GetTask(TASK_JJC) == 16 then
        if GetTrigger(KILL_JJC_SN) == 0 then
            CreateTrigger(0,551,KILL_JJC_SN);
        end;
        if GetTrigger(KILL_JJC_ZR) == 0 then
            CreateTrigger(0,552,KILL_JJC_ZR);
        end;
        if GetTrigger(KILL_JJC_YS) == 0 then
            CreateTrigger(0,553,KILL_JJC_YS);
        end;
    end;
end;

function task_17_00()
    local szTalk = {
        "哪来的小毛孩子,此乃绿林梁山,来的都是英雄好汉,不是小儿嬉闹的场所.",
        "若你自觉得厉害不妨去那边找我梁山中的几个好手{较量一下}.",
        "他们分别是{云里金刚宋万},{催命判官李立},{母大虫顾大嫂}.",
        "若是胜得过他们,我就承认你的上山资格."
    };
    TalkEx("task_17_01", szTalk);
end;

function task_17_01()
    SetTask(TASK_JJC, 18);
    SetTask(TASK_JJC_BEAT_SW, 0);
    SetTask(TASK_JJC_BEAT_LL, 0);
    SetTask(TASK_JJC_BEAT_G, 0);
    Msg2Player("击败梁山中的几个好手");
    TaskTip("击败梁山中的几个好手");
    GivePlayerAward("Level_34", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"liangshanhaohan1")		--梁山好汉1
end;

function task_18_00()
    local szTalk = {
        "哼!还没有击败我梁山的好手?",
        "小毛孩子哪来的回哪去!"
    };
    if GetTask(TASK_JJC_BEAT_SW) == 2 and GetTask(TASK_JJC_BEAT_LL) == 2 and GetTask(TASK_JJC_BEAT_G) == 2 then
    	task_19_00();
    else
    	TalkEx("", szTalk);
    end;
end;

function task_19_00()
    local szTalk = {
        "哦,看不出来少侠年纪轻轻,竟有如此身手,我真是老了,眼睛也不好使了!",
        "[哼!若不是{这封信},我才不会来!]",
        "(大吃一惊!)啊!",
        "这封信怎么会在你手上?我这信写好还没来得及派人送出去就{被人偷走}!",
        "怎么会跑到你的手里?来人呀!把这个偷信的小贼拿下!",
        "[{且慢!}这封信不是我偷的,而是丐帮堂主{陈飞杨}指引我从苗人那里抢回来的.]",
        "此次来梁山我只想知道你怎么会对{陈大哥的身世}这么感兴趣?"
    };
    TalkEx("task_19_01", szTalk);
end;

function task_19_01()
    local szTalk = {
        "想必少侠已经知道成都府运送此次花石纲中有{山河社稷图}碎片一事了吧!",
        "这个消息本来是陈飞杨告诉于我,他说西夏一品堂欲乘此机会夺了{山河社稷图}碎片,让我先去夺来不要让西夏人得手.",
        "但是前阵子我又有可靠消息{西夏一品堂}好像知道我们要去抢花石纲二打算等我们抢夺时再乘机下手!"
    };
    TalkEx("task_19_02", szTalk);
end;

function task_19_02()
    local szTalk = {
        "此次行动极为隐秘,{梁山中大部分人都不知道},更不会把这消息传播出去.所以我就有点{怀疑}是不是{陈飞杨}将此消息传出,再加上江湖有传言{陈飞杨本非汉人},使得我不得不去一查.",
        "俗话说知人知面不知心,{山河社稷图}关系{大宋江山},汉人的安危,作为大宋子民我不得不小心从事,陈飞杨自小被少林收养,少侠不妨去{少林}再打探打探,希望陈飞杨他是清白的!"
    };
    TalkEx("task_19_03", szTalk);
end;

function task_19_03()
    SetTask(TASK_JJC, 20);
    DelItem(2,0,89,1);
    DelItem(2,0,90,1);
    DelItem(2,0,91,1);
    DelItem(2,0,92,1);
    DelItem(2,0,93,1);
    Msg2Player("宋江怀疑陈飞杨泄密,去少林寺找方丈问问");
    TaskTip("宋江怀疑陈飞杨泄密,去少林寺找方丈问问");
    GivePlayerAward("Level_34", "hell", "chest", "Level_35");
	GivePlayerExp(SkeyCDFanzhongyan,"liangshanhaohan2")		--梁山好汉2
end;

function task_20_00()
    local szTalk = {
        "施主不必多礼,不知施主此次来少林找老衲所为何事?",
        "在下和丐帮的陈飞杨,陈大哥有些交情,陈大哥自小被{方丈领入中原抚养}相比了解陈大哥的为人和性格(将从剑阁蜀道遇到陈飞杨到梁山的宋江对陈飞杨起疑心一事原原本本告诉方丈)",
        "施主对此事是信还是不信呢?施主的心结还要靠施主自己来解开.老衲可以告诉少侠一个线索.",
        "飞扬自小一直居住在少林却{执意不肯出家},直到17岁那年少林来了个{修理少林密室铜人的工匠},自此以后飞扬就常常去{少林密室},不久后他就拜入龙在天门下,加入了丐帮,那个{工匠也不知所踪}",
        "多谢大师指点!",
        "阿弥陀佛!"
    };
    TalkEx("task_20_01", szTalk);
end;

function task_20_01()
    SetTask(TASK_JJC, 21);
    CreateTrigger(0,557,KILL_JJC_TR);
    Msg2Player("去少林密室调查,击败铜人,得到8个铜制碎片.");
    TaskTip("去少林密室调查,击败铜人,得到8个铜制碎片.");
    GivePlayerAward("Level_36", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"tongrendemimi1")		--铜人的秘密1
end;

function task_21_00()
    local szTalk = {
        "这些铜质碎片上面刻有文字,并非经文,老衲也不认识.",
        "不如施主下山寻一{博学之士}看看能不能解开此中秘密."
    };
    local szMsg = {
        "123."
    };
    if GetItemCount(2,0,94) >= 8 then
        TalkEx("task_21_01", szTalk);
    else
        TalkEx("task_21_02", szMsg);
    end;
end;

function task_21_02()
    if GetTask(KILL_JJC_TR) == 0 then
        CreateTrigger(0,557,KILL_JJC_TR);
    end;
end;

function task_21_01()
    SetTask(TASK_JJC, 22);
    Msg2Player("去成都府南诏诸葛棋解密");
    TaskTip("去成都府南诏诸葛棋解密");
    GivePlayerAward("Level_36", "hard", "head", "Level_38");
	GivePlayerExp(SkeyCDFanzhongyan,"tongrendemimi2")		--铜人的秘密2
end;

function task_22_00()
    local szTalk = {
        "稀奇,真是稀奇.",
        "想不到西夏人也能设计出如此{精妙的密码}.",
        "这密码采用西夏隶书字型,句子按{周易八卦进行大乱重新排布},解密还需要一些时间.",
        "眼下我已饿的昏了眼,还请少侠先去取{两盘素烧竹肉和四个窝窝头}给我."
    };
    TalkEx("task_22_01", szTalk);
end;

function task_22_01()
    Earn(1000);
    SetTask(TASK_JJC, 23);
    DelItem(2,0,94,8);
    Msg2Player("去取两盘素烧竹肉和四个窝窝头给诸葛棋");
    TaskTip("去取两盘素烧竹肉和四个窝窝头给诸葛棋");
    GivePlayerAward("Level_38", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"shizhengshixie1")		--是正是邪1
end;

function task_23_00()
    local szTalk = {
        "这密码读起来除了比较费事.",
        "倒也没什么复杂的!"
    };
    local szMsg = {
        "请少侠去取两盘素烧竹肉和四个窝窝头给我.",
    };
    if GetItemCount(1,1,1) >= 4 and GetItemCount(1,1,6) >= 2 then
        TalkEx("task_23_01", szTalk);
    else
        TalkEx("", szMsg);
    end;
end;

function task_23_01()
    local szTalk = {
        "不过看来你还得{再见陈飞杨一次}.",
        "陈飞杨成名已久,武功极高!",
        "若我们不幸言中你切勿和他对战,先保全自己要紧!"
    };
    TalkEx("task_23_02", szTalk);
end;

function task_23_02()
    DelItem(1,1,1,4);
    DelItem(1,1,6,2);
    SetTask(TASK_JJC, 24);
    Msg2Player("去剑阁蜀道找到陈飞杨");
    TaskTip("去剑阁蜀道找到陈飞杨");
    GivePlayerAward("Level_38", "hard", "legs", "Level_40");
	GivePlayerExp(SkeyCDFanzhongyan,"shizhengshixie2")		--是正是邪2
end;

function task_24_00()
    local szTalk = {
        "少侠你好心急呀,为兄正准备去梁山打听消息,你就来了.",
        "我估计你是永远不会去了吧.",
        "少侠何出此言?",
        "其实你是西夏在中原的{卧底},抢夺{山河社稷图}一事本来就是你{泄露给西夏一品堂的}.",
        "哈哈哈,少侠可有证据吗?",
        "我已调查过你过去,还在少林密室找到了你和西夏沟通的证据,现在全武林都知道你是{西夏的卧底了},陈飞杨你还是和我回去接受武林公裁吧!",
        "哈哈哈,武林公裁!你当我想做个西夏的卧底?你知道我有多么想做一个汉人吗?为何我不是汉人,哈哈哈,汉人,西夏人,也罢!既然你知道了,也就不用下山了,刀绝,剑狂,把他拿下!"
    };
    TalkEx("task_24_01", szTalk);
end;

function task_24_01()
    CreateTrigger(0,558,KILL_JJC_JK);
    CreateTrigger(0,559,KILL_JJC_DJ);
    SetTask(TASK_JJC, 25);
    Msg2Player("击败10名刀绝8名剑狂");
    TaskTip("击败10名刀绝8名剑狂");
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"zhenshishenfen1")		--真实身份1
end;

function task_25_00()
    local szMsg = {
        "快去击败10名刀绝8名剑狂!"
    };
    TalkEx("task_25_01", szMsg);
end;

function task_25_01()
    if GetTask(TASK_JJC_JK) == 0 and GetTrigger(KILL_JJC_JK) == 0 then
        CreateTrigger(0,558,KILL_JJC_JK);
    end;
    if GetTask(TASK_JJC_DJ) == 0 and GetTrigger(KILL_JJC_DJ) == 0 then
        CreateTrigger(0,559,KILL_JJC_DJ);
    end;
end;

function task_27_00()
    local szTalk = {
        "想不到几日不见少侠你武功竟然如此长进,竟已能胜过西夏一等一的好手.",
        "也罢!",
        "今日{你我一战}在所难免!"
    };
    TalkEx("task_27_01", szTalk);
    SetTask(TASK_JJC_TEMP, GetTargetNpc());
end;

function task_27_01()
    
    ChangeNpcToFight(GetTask(TASK_JJC_TEMP));

--    SetTask(TASK_JJC, 28);
--    --log触发器
--    CreateTrigger(3, 205, LEAVE_GAME_JJC);
--    SetLogType(GetTrigger(LEAVE_GAME_JJC), 1); --设置为蹬出类型
--    
--    --rect 触发器
--    CreateTrigger(2,1302,LEAVE_RECT_JJC);
--    
--    SetDeathScript("\\script\\task\\world\\lizhi_江津村\\task_Death.lua");
    Msg2Player("击杀陈飞杨");
    TaskTip("击杀陈飞杨");
end;

function task_29_00()
    local szTalk = {
        "陈大哥,不,陈飞杨,我本意只是想试一试你,谁知你真是西夏卧底.",
        "卧底也好,不是卧底也好,{只要我不是汉人},整个中原武林还是没法信服我的,死反而是种更好的解脱!",
        "......",
        "我已身受重伤,临终前还有一个{遗愿},此乃我写给少林方丈的{遗书},还望少侠你帮我转交给他们,就说我陈飞杨对不起大师!",
        "你放心吧!这个我自会帮你送到的.",
        "那我就可以安心的去了!",
        "...."
    };
    TalkEx("task_29_01", szTalk);
    SetTask(TASK_JJC, 30);
    AddItem(2,0,95,1);  --给少林的信
    AddItem(2,0,96,1);  --给丐帮的信
end;

function task_29_01()
    Msg2Player("将陈飞杨的遗书交给少林方丈");
    TaskTip("将陈飞杨的遗书交给少林方丈");
    GivePlayerAward("Level_40", "hell", "weapon", "Level_40");
	GivePlayerExp(SkeyCDFanzhongyan,"zhenshishenfen2")		--真实身份2
end;

function task_30_00()
    local szTalk = {
        "大师,这里有陈飞杨让在下交给大师的一封信,请过目.他临终前向对大师说一声对不起.",
        "唉,飞扬他还是...感谢少侠了,飞扬有生之年能遇到你这样的{一个朋友}真是他的福分.",
        "方丈,此事莫要再提,我本把陈飞杨当是{重情重义的汉子},以兄弟相待,岂料他....."
    };
    TalkEx("task_30_01", szTalk);
end;

function task_30_01()
    local szTalk = {
        "看来施主还未悟透,其实飞扬他前些日子拜访老衲时,言辞中尽是迷惑和妄念,他虽然为西夏一品堂卧底,但这孩子{天性禀直},幼年受佛法儒学熏陶,又被龙在天不计出身,委以大任.飞扬他自知不能做出有损中原武林之事,也正因为他重情重义,忠心爱国所以也不能做出对不起自己国家的事,{此间的痛苦决不是普通人所能理解的}.他最终选择让少侠了解他矛盾困惑的一生,可以说是把少侠当作是真正可以{信任}的朋友最好证明.",
        "多些大师指点,也许晚辈江湖资历尚浅,尚未看穿世事,需要历练才能明白其中的真谛.{清风已去,唯尘飞扬},希望陈飞杨已经彻底的放下了,晚辈告辞!",
        "阿弥陀佛!还请少侠将遗书转交给丐帮帮主{龙在天}!"
    };
    TalkEx("task_30_02", szTalk);
end;

function task_30_02()
    SetTask(TASK_JJC, 31);
    DelItem(2,0,95,1);
    Msg2Player("将陈飞杨的遗书交给丐帮帮主");
    TaskTip("将陈飞杨的遗书交给丐帮帮主");
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang1")		--清风飞扬1
end;

function task_31_00()
    local szTalk = {
        "[将陈飞杨的遗书交给丐帮帮主龙在天]",
     };
    TalkEx("task_31_01", szTalk);
end;

function task_31_01()
    local szTalk = {
        "哎!这飞扬啊.....",
    };
    TalkEx("task_31_02", szTalk);
end;

function task_31_02()
    local szTalk = {
        "多谢少侠!.",
        "此事丐帮欠少侠一份情谊,今后少侠若有需要帮助的地方,随时来丐帮找老叫花子",
        "{此间事了,去找诸葛棋吧}"
    };
    TalkEx("task_31_03", szTalk);
end;

function task_31_03()
    SetTask(TASK_JJC, 32);
    DelItem(2,0,96,1);
    GivePlayerAward("Level_40", "normal");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang2")		--清风飞扬2
end;

function task_32_00()
    local szTalk = {
        "多谢少侠,!",
        "Tr莕 i ca! May qu? huynh 蕐 c遪 s鑞g!",
        "Th? ch? nh譶 l莔 ngi ch╪g? B莕 t╪g l? V﹏ Du t╪g nh﹏, ph竝 hi謚 Thanh Phong",
        "Xin l鏸 i s?!"
    };
    TalkEx("", szTalk);
end;

function task_32_zgq()
    local szTalk = {
        "没想到竟然发生了这样的事情,陈飞杨....哎!这些日子多谢少侠了!"
    }
    TalkEx("task_32_01", szTalk);
end;

function task_32_01()
    SetTask(TASK_JJC, 33);
    GivePlayerAward("Level_40", "hard", "legs", "Level_49");
	GivePlayerExp(SkeyCDFanzhongyan,"qingfengfeiyang3")		--清风飞扬3
end;

function task_33_00()
    local szTalk = {
        "没想到竟然发生了这样的事情,陈飞杨....哎!这些日子多谢少侠了!"
    }
    TalkEx("", szTalk);
end;