--========================================================================================--
--create by baiyun 2010.1.7                                                               --
--describe     :越南版所有任务变量 头文件                                                 --
--related files: 请尽量把此文件包含在使用任务变量的脚本中，并把任务变量定义在此文件中     --
--========================================================================================--

--===============天门阵任务变量=========================
TASKID_TMZ_PLAY_DATE = 366;  --记录参加天门阵日期，格式：20090715
TASKID_TMZ_PLAY_NUM = 367;	 --记录玩家今天参与天门阵次数
TASKID_TMZ_PLAY_RESULT = 368;   --记录玩家今天领取奖励的次数
TASKID_TMZ_AWARD_MARK = 369; --记录玩家的天门阵积分
TASKID_TMZ_JOIN_TIME = 370;	 --记录玩家“耻辱”状态时间，存入GetTime()，修改这个变量记得修改playerloginin.lua
TASKID_TMZ_GET_DAMAGE = 371; --记录玩家一次对阵的伤害输出，领取奖励后会清空
TASKID_TMZ_GET_CURE = 372;	 --记录玩家一次对阵的有效治疗，领取奖励后会清空
TASKID_TMZ_KILL_PLAYER = 373;	 	--记录玩家一次对阵的杀敌总数，领取奖励后会清空
TASKID_TMZ_KILL_NUMS = 374;			--记录玩家一次对阵连续杀人数，领取奖励后会清空
TASKID_TMZ_PLAYER_KILLED = 375;	--记录玩家一次对阵被杀次数，领取奖励后会清空
TASKID_TMZ_PLAY_CAMP = 376;   	--记录玩家一次对阵的阵营，领取奖励后会清空
TASKID_TMZ_KILL_NPC = 377;			--记录玩家一次对阵杀死的npc个数，领取奖励后会清空
TASKID_TMZ_KILL_EYE = 378;			--记录玩家一次对阵中破坏的阵眼个数，领取奖励后会清空
TASKID_TMZ_KILL_FLAG = 379;			--记录玩家一次对阵中破坏的阵旗个数，领取奖励后会清空
TASKID_TMZ_PLAY_POINT = 380;    --记录玩家一次对阵中获得的积分（阵营积分），领取奖励后会清空，根据这个来判断是否领取了上次战场的奖励以及是否取得了胜利
TASKID_TMZ_DOUBLE_EXP = 381;    --记录玩家是否在双倍经验的时候进入场地
TASKID_TMZ_ENROLL_MAPID = 400	--记录玩家报名天门阵的地图ID
--以下任务变量是程序使用，一般不变
GLB_TASK_BAIJUXIANDAN = 2508;    --存放白驹仙丹的任务变量单位是 分钟
GLB_TASK_BAIJUWAN_LARGE = 2507;    --存放大白驹丸的任务变量单位是 分钟
GLB_TASK_BAIJUWAN_SMALL = 2501;    --存放小白驹丸的任务变量单位是 分钟
GLB_TASK_SHENGNONGDAN = 2502;    --存放神农丹任务变量单位是 分钟
GLB_TASK_FACTION_GET_DATE = 2190;    --完成师门任务的日期 （每次活动都可以重用）
GLB_TASK_FACTION_GET_COUNT = 2191;    --当天完成师门任务的次数 （每次活动都可以重用）
GLB_200912_TEAM_TASK_NUM = 1030;    --转生-共4位 每一位记录每个门会激活团体任务人数 从高位到低位分别表示龙凤虎鹰
GLB_200912_TEAM_TASK_DATE = 1031;    --转生-记录上次激活时间
GLB_TASK_ZIGUANGGE = 652;    --紫光积分
VET_201001_TASK_FACTION_DATE = 2190;    --完成师门任务的日期 （每次活动都可以重用）
VET_201001_TASK_FACTION_COUNT = 2191;    --当天完成师门任务的次数 （每次活动都可以重用）
VET_201001_TASK_USE_ZONGZI_COUNT = 2192;    --春节活动期间使用粽子的数量
VET_201001_TASK_HAS_GET_LIMIT_AWARD = 2193;    --是否领取了经验上限奖励1为有资格领取，2为已经领取完成
VET_201001_TASK_GIVE_ZONGZI_COUNT = 2194;    --今天赠送极品粽子的数量
VET_201001_TASK_GIVE_ZONGZI_DATE = 2195;    --赠送极品粽子的日期
VET_201001_TASK_GET_HONGBAO_DATE = 2196;    --领取红包的日期
VET_201001_TASK_GET_HONGBAO_COUNT = 2197;    --今天领取红包的数量
VET_201001_TEMP_TASK_HONGBAO_INDEX = 152;    --存放红包索引的临时任务变量
VET_201003_01_TASK_USE_WUSESHI_COUNT = 2251;    --已经使用了五色石的数量
VET_201003_01_TASK_HAND_WUSESHI_DATE = 2157;    --上交五色石的日期
VET_201003_01_TASK_HAND_WUSESHI_COUNT = 2158;    --当天上交五色石的次数
VET_201003_01_TASK_GET_BAOHE_DATE = 2159;    --兑换女娲宝盒的日期
VET_201003_01_TASK_GET_BAOHE_COUNT = 2160;    --当天兑换的女娲宝盒的数量
VET_201003_01_TASK_USE_BAOHE_COUNT = 2156;    --当天兑换的女娲宝盒的数量
VET_201004_01_TASK_TIMES_OPEN_VICBOX = 2579;    --打开胜利礼盒的次数
VET_201004_01_TASK_MAX_TIMES_AWARD = 2580;    --达到上限经验奖励是否领取
VET_201004_01_TASK_MAX_TIMES_LUCKYSTAR = 2581;    --每天兑换幸运星的次数
VET_201004_01_TASK_DATE_LUCKYSTAR = 2582;    --兑换幸运星的日期
VET_201004_01_TASK_DATE_USE_LUCKYSTAR = 2585;    --使用幸运星的日期
VET_201004_01_TASK_TIMES_USE_LUCKYSTAR = 2586;    --每天使用幸运星的次数
VET_201004_01_TASK_DATE_DONATE_VICBOX = 2583;    --赠送胜利礼盒的日期
VET_201004_01_TASK_TIMES_DONATE_VICBOX = 2584;    --每天可以兑换胜利礼盒的次数
VET_201004_02_TASK_DATE_HANDIN_FRUIT = 2575;    --上交水果的日期
VET_201004_02_TASK_NUM_HANDIN_FRUIT = 2576;    --上交水果次数
VET_201004_02_TASK_FLAG_MULTI_REWARD = 2577;    --多次上交水果的开关量
VET_201004_02_TASK_FLAG_ISHANDED = 2578;    --每种水果每天是否已经上交过
VET_201006_01_TASK_USETECHAN_COUNT = 2587;    --水果特产使用次数
VET_201006_01_TASK_FLAG_GET_UP_AWARD = 2588;    --记录是否领取过上限奖励
VET_201006_01_TASK_FLAG_EAT = 2131;    --记录今天有没有赠送给刘铁匠儿子
VET_201006_01_TASK_FLAG_GIVETOSON = 2287;    --记录赠送给刘铁匠儿子每一位分别表示水果饼，水果冰，水果酱，水果汁
VET_201006_01_TASK_DATE_MIYIN = 2198;    --记录使用武林武林秘印时间
VET_201006_01_TASK_USEMIYIN_COUNT = 2199;    --一天使用秘印次数
VET_200912_TASK_JUNGONG = 701;    --转生-记录军功值的任务变量
VET_200912_TASK_ZS_STATE = 2569;    --转生-任务已经进入第几步
VET_200912_TASK_ZISHI_TYPE = 2570;    --转生-任务状态01234分别表示没有任务，龙凤虎鹰
VET_200912_TASK_MENHUI_TYPE = 2571;    --转生-记录该角色转生时入的门会1234表示龙凤虎鹰
VET_200912_TASK_JIUNAN_TYPE = 2572;    --转生-记录救难任务需要交的物品
VET_200912_TASK_ZS_DATE = 2573;    --转生-记录上一次转生日期
VET_200912_TASK_TEAM_TASK_DATE = 2574;    --转生-记录该玩家上次激活团体任务的时间
VET_200912_TASK_JIHUO_FLAG = 2575;    --转生-用十进制位从高位到低位表示该玩家是否激活了宝马、同伴、发光武器、属性外装、升级武器装备功能
VET_201003_TONGBAN_TASK_HEALTHY_POINT = 2560;    --越南2010年转生系统同伴系统 健康点
VET_201003_TONGBAN_TASK_UPGRADE_POINT = 2561;    --越南2010年转生系统同伴系统 升级点
VET_201003_TONGBAN_TASK_TONGBAN_LEVEL = 2562;    --越南2010年转生系统同伴系统 同伴等级记录
VET_201003_TONGBAN_TASK_DAILY_ITEM = 2563;    --越南2010年转生系统同伴系统 同伴日常任务交纳物品 1:白驹丸 2:六神丸 3:三清丸 4:军功章 0：没有任务
VET_201003_TONGBAN_TASK_DAILY_TASK_COUNT = 2564;    --越南2010年转生系统同伴系统 同伴日常任务接受次数
VET_201003_TONGBAN_DATE_TONGBAN_DAILY_TASK = 2565;    --越南2010年转生系统同伴系统 同伴日常任务时间标记 精确到天
VET_201003_TONGBAN_DATE_HAND_DAILY_TASK = 2566;    --越南2010年转生系统同伴系统 同伴日常任务交纳时间 精确到分钟
VET_201003_TONGBAN_DATE_TASK_ADD_PROPERTY = 2567;    --越南2010年转生系统同伴系统 属性获得时间标记
VET_201003_TONGBAN_TASK_HEALTHY_POINT_DEDUCT = 2568;    --越南2010年转生系统同伴系统 扣除健康点累计
VET_201003_TONGBAN_TASK_TRIGGER_ID_DEFINE = 2515;    --越南2010年转生系统同伴系统 触发器自定义ID 计时触发器
VET_201006_03_TASK_GET_CHONGWU_DATE = 2111;    --越南6月活动之端午节活动  召唤世界杯宠物时间
VET_201006_03_TASK_GET_BAOBEI_DATE = 2112;    --越南6月活动之端午节活动  召唤足球宝贝时间
VET_201006_03_TASK_TMP_CHOICE = 109
VET_201007_01_TASK_HUNYUANGONG_NUM = 2589;    --越南7月活动 标记混元功2、4、6、8、10成是否使用过，共标记5位最高位表示混元功10成依次往下
VET_201007_01_TASK_SHENGLONGQIANNIAN_NUM = 2590;    --越南7月活动 记录使用升龙一千年次数
VET_201007_01_TASK_SILINGBAOSHI_NUM = 2591;    --越南7月活动 记录四灵宝石使用次数
VET_201007_01_TASK_SILINGFUYUANDAN_NUM = 2592;    --越南7月活动 记录四灵复原丹使用次数
VET_201007_01_TASK_FLAG_LIMITED_AWARD = 2593;    --越南7月活动 标记四灵复原丹上限奖励
VET_201007_01_TASK_GET_CHONGWU_DATE = 2594;    --越南7月活动 记录跟宠召唤时间

VET_201008_01_TASK_EAT_QIAOKELIDANGAO = 2595 --越南8月活动 记录已经吃了多少个巧克力蛋糕
VET_201008_01_TASK_FLAG_LIMITED_AWARD = 2596 --越南8月活动 标记是否领取上限奖励
VET_201008_02_TASK_NUM_TANXIANGMU = 2599   --挑战四灵boss 记录每天该玩家交的檀香木个数
VET_201008_02_TASK_DATE_TANXIANGMU = 2600   --挑战四灵boss 记录上一次玩家交檀香木的时间
VET_201008_02_TASK_NUM_QINGGONGYAN = 2601   --挑战四灵boss 记录每天该玩家使用庆功宴次数
VET_201008_02_TASK_DATE_QINGGONGYAN = 2602  --挑战四灵boss 记录上一次使用庆功宴的时间
VET_201008_02_TASK_TIME_QINGGONGYAN = 2603  --挑战四灵boss 记录上一次使用庆功宴的时刻

VET_201009_01_TASK_NUM_MOONCAKES = 2604--越南9月中秋节活动 记录使用月饼次数
VET_201009_01_TASK_FLAG_KAOLU = 2605--越南9月中秋节活动 记录当前是否已经激活了一个烤炉
VET_201009_01_TASK_LIMITE_EXP_MOONCAKE = 2606--越南9月中秋节活动 记录当前已经通过使用月饼获得的经验数
VET_201009_01_TASK_LIMITE_EXP_MOONCAKE_SP = 2607--越南9月中秋节活动 记录当前已经通过使用烤熟的月饼或未烤熟的月饼获得的经验数
VET_201009_01_TAKS_TIME_LAST_KAOLU = 2608--越南9月中秋节活动 记录上一次召唤烤炉时间
VET_201009_01_TASK_KAOLU_PHASE = 2609--越南9月中秋节活动 记录烤炉阶段
VET_201009_01_TASK_KAOLU_TIME = 2610--越南9月中秋节活动 记录烤炉阶段对应的开始时间
VET_201009_01_TASK_MUCAI_NUM = 2611--越南9月中秋节活动 记录成功放入烤炉的木柴数
VET_201009_02_TASK_DATE_GOUMAILAZHU = 2612--越南9月四灵灯会活动 记录上次购买黄蜡烛的时间
VET_201009_02_TASK_TIME_END_HUADENG = 2613--越南9月四灵灯会活动 记录花灯奖励结束时间
VET_201009_02_TASK_DATE_JIHUOHUADENG = 2614--越南9月四灵灯会活动 记录上次激活花灯的时间
VET_201009_00_TASK_GET_LOGIN_AWARD = 2615--新手指引任务 记录登录奖励 从低位到高位分别表示一天,三天,七天后登录奖励,5分10分15分20分40分奖励
VET_201009_00_TASK_GET_LEVEL_AWARD = 2616 --新手指引任务 记录等级奖励 从低位到高位分别表示低级到高级的奖励领取情况
VET_201009_00_TASK_GET_TASK_AWARD = 2617 --新手指引任务 记录任务奖励 从低位到高位分别表示任务奖励的奖励领取情况
VET_201009_00_TASK_NUM_FACTION = 2618 --新手指引任务 记录师门任务 3位从低位到高位表示低级中极高级
VET_201009_00_TASK_TONGGUAN_CANGJIAN = 2619 --新手指引任务 记录是否通关藏剑
VET_201009_00_TASK_TONGGUAN_TAIXU = 2620 --新手指引任务 记录是否通关太虚
VET_201009_00_TASK_RICHANG = 2621 --新手指引任务 记录完成日常任务情况 十位表示团队 个位表示个人
VET_201009_00_TASK_SHANGHUI_TIMES = 356 --新手指引任务 记录完成上会任务次数
VET_201009_00_TASK_TONGGUAN_ZIGUANG = 2622 --新手指引任务 记录是否通关紫光
VET_201009_00_TASK_CHENGZHANG = 2623 --新手指引任务 记录是否领取过成长奖励,每一位 0 1 2 3 分别表示没有领取过 第一项已经领取 第二项已经领取 两项都已经领取
VET_201009_00_TASK_FLAG_ADDLOGIN_AWARD = 2624 --新手指引任务 记录是否添加过登录奖励
VET_201011_02_TASK_MODE = 2625
VET_201011_02_TASK_USED_COUNT = 2626
VET_201011_02_TASK_USED_COUNT_MODE1 = 2627
VET_201011_02_TASK_USED_COUNT_MODE2 = 2628
VET_201011_02_IF_GET_REWARD = 2629
VET_201011_03_TASK_GATHERED_COUNT1 = 2630
VET_201011_03_TASK_GATHERED_COUNT2 = 2631
VET_201011_03_TASK_GATHERED_COUNT3 = 2632
VET_201011_03_TASK_GATHERED_COUNT4 = 2633
VET_201011_03_TASK_EXCHANGED1 = 2634
VET_201011_03_TASK_EXCHANGED2 = 2635
VET_201011_03_TASK_EXCHANGED3 = 2636
VET_201011_03_TASK_EXCHANGED4 = 2637
VET_201011_HB_TASK_USED_COUNT = 2638
VET_201011_CM_TASK_LAST_DAILY_RESET_TIME = 2639
VET_201011_05_TASK_ENTERED_COUNT = 2640;
VET_201012_05_TASK_ENTRANCE_MAP_INDEX = 2641;
VET_201012_01_USE_XMAS_BOX_COUNT = 2642;        --2010圣诞活动，打开圣诞礼盒的个数
VET_201012_XMAS_BOX_MODE = 2643;                --2010圣诞活动，使用圣诞礼盒的奖励模式，1是获得物品，2是不要物品，得到更多经验
VET_201012_01_GET_FINAL_AWARD_FLAG = 2644;      --2010圣诞活动，是否领取过打开圣诞盒上限的奖励，1为领取，0为未领取
VET_201012_BUY_XMAS_CLOTHES_FLAG = 2645;        --2010圣诞活动，是否买过圣诞外装，1为买过，0为没买过
VET_201012_03_NPCIDX = 2646;                    --2010年，晚冬取暖时把召唤的NPCIDX记录在玩家身上激活的时候用
VET_201012_03_TASK_TIME_END_HUOCHAI = 2647;     --晚冬取暖，创建触发器时记录触发器终止时间
VET_201012_04_PLANT_4_SOUL_TREE_TIME = 2648;    --四灵树，记录种下树的时间戳
VET_201012_05_TASK_ENTRANCE_MAP_INDEX = 2641;   --雪球活动
VET_201012_05_TASK_EXP_GAINED = 2649;						--雪球活动
VET_201212_05_TASK_ZHENQI_GAINED = 3110;				--雪球活动
--====以下TaskID使用新reset机制，详细见\script\online_activites\daily_taskids_reset.lua ====
VET_201012_03_FIRE_TIMES = 2650;                --晚冬取暖，记录玩家当天参与活动次数
VET_201012_04_PLANT_4_SOUL_TREE_COUNT = 2651;   --四灵树，记录当天种下树的数量
VET_201012_04_AWRAD_4_SOUL_FRUIT_COUNT = 2652;  --四灵树，记录当天上交的水果次数
-->

VET_201101_01_TASK_MODE = 2653;
VET_201101_01_TASK_USED_COUNT = 2654;
VET_201101_01_TASK_USED_COUNT_MODE1 = 2655;
VET_201101_01_TASK_USED_COUNT_MODE2 = 2656;
VET_201101_01_IF_GET_REWARD = 2657;

--DailyTask 在\script\online_activites\everyday_do.lua 设置每日的初始值
VET_TSK_IPBONUS_ONLINE_AWARD =  2658		--每日累计在线时间领奖
VET_TSK_IPBONUS_BUFF_TYPE =  2659			--每日buff类型
--梁山相关:村长-2011-3-7增加
VET_MS_LS_TASKID_LIANGSHAN_ITEM_DAILY = 2686	--梁山物品道具使用次数
VET_MS_TASKID_JUYILING = 2689;					--梁山聚义令使用次数
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_1 = 2694	--初演挑战
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_2 = 2695	--忠勇挑战
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3 = 2696	--夺军挑战
VET_MS_LS_TASKID_LIANGSHAN_DAILY_TASK_3_BOSS = 2697	--夺军BOSS
VET_MS_LS_TASKID_LIANGSHAN_DAILY_BOSS_KILL = 2859	--干掉BOSS获得五行玄石奖励
--================海上龙舟战：刘波-2011-8-30增加==================
VET_LZZ_PLAYER_RESULT = 2920  --上一次参加海上龙舟战结果，1表示胜利，2表示失败，0表示未参加
VET_LZZ_PLAYER_AWARD = 2921 --记录一天内获得的经验
VET_LZZ_PLAYER_AWARD_DAY = 2922 --记录天次
VET_LZZ_ENROLL_MAPID = 2923 --记录玩家报名地图的ＩＤ
VET_LZZ_PLAYER_CAMP = 2924   	--记录玩家一次对阵的阵营，领取奖励后会清空
VET_LZZ_PLAYER_POINT = 2925    --记录玩家一次对阵中获得的积分（阵营积分），领取奖励后会清空，根据这个来判断是否领取了上次战场的奖励以及是否取得了胜利
VET_LZZ_PLAYER_DATE = 2926  --记录参加海上龙舟战日期，格式：20090715
VET_LZZ_PLAYER_DRAG = 2927 -- 记录是否已经领取龙舟，0未领取，其他值为龙舟索引 (修改此值，需同时修改playerloginin.lua)
VET_LZZ_PLAYER_TAG = 2928 --记录一场是否进行过.0未参加，1参加
VET_LZZ_PLAYER_1715 = 2929 --同步1715任务变量(修改此值，需同时修改playerloginin.lua)
VET_LZZ_PLAYER_TAG2 = 2930 --记录一场是否进行到最后，作为领取奖励的凭据.0未参加，1参加
VET_LZZ_DRAGBOAT_KIND = 2931 --龙舟的种类
VET_LZZ_MISSION_MAPID = 2932 --mission id
--===============财神宝箱========================================
VET_TREASURE_BOX_PNUM = 2953 --当天个人通过累计时间获得的木箱的数量
VET_TREASURE_BOX_MNUM = 2954 --当天宝箱商人出售木箱的数量
VET_TREASURE_BOX_CNUM = 2955 --当天宝箱商人出售藏宝箱的数量
--==========通天幻境=============================================
VET_TDD_DALIY_TASK_CROSS = 3070 --通关一次通天幻境
VET_TDD_WEEK_TASK_CROSS = 3071 --通关4次通天幻境
--==========万剑冢=============================================
VET_WJZ_DALIY_TASK_CROSS = 3072 --通关一次万剑冢
VET_WJZ_WEEK_TASK_CROSS = 3073 --通关7次万剑冢
--=========通天幻境和万剑冢收费翻牌===========================
VET_DALIY_TASK_FANPAI = 3074 --收费翻牌
VET_WEEK_TASK_FANPAI = 3075 --收费翻牌15次
--=========通天和万剑冢日常和周常标记接取标记===========
VET_TTD_WJZ_TASK_FLAG = 3076 --第1，2位标识通天通关，3，4位标识万剑冢通关，5，6为翻牌
--===============梁山boss活动=======================================
VET_LSB_DAY_SEQ = 3077 --天记录
VET_LSB_MAIL_NUM = 3078 --第一字节表示梁山信物使用次数，2，任务89，3，90，4，91
VET_LSB_GETBOX = 3079 --拾取黄金打宝箱记录
VET_LSB_CALLBOSS = 3087 --召唤5个梁山boss
VET_LSB_OPENBOX = 3088 --开一次梁山密宝箱
--===============奥运圣火活动========================================
VET_OLY_TASK = 3091 --第一字节表示当日点火次数,第二字节记录数字游戏生成的数字,3,表示猜数字的次数,4表示递归的次数
VET_OLY_TASK1 = 3092 --第一字节表示猜数字领奖次数,2-3字节表示幸运数字,4字节表示是否登记领奖
VET_OLY_TASK2 = 3093 --1-2累计点火次数,3-4领取天罡碎片数量
VET_OLY_TASK3 = 3094 --1字节8位分别表示6个城市今天是否点过,2字节记录触发冥火鬼灵事件次数
--==========以下记录GlobalValue的使用，与上面的TaskID区分防止混乱==========

-- temp task value key
VET_201011_03_TASK_TEMP_GATHER_INDEX = 247;
VET_201011_03_TASK_TEMP_TRIGGER_INDEX = 248;
VET_201011_HB_TASK_TEMP_ITEM_INDEX = 249;
VET_201011_CM_TASK_TEMP_TRIGGER_INDEX = 250;
VET_201012_06_TASK_TEMP_ZONE_INDEX = 251;
VET_201012_06_TASK_TEMP_TREE_INDEX = 252;
VET_201012_06_TASK_TEMP_TRIGGER_INDEX = 253;
