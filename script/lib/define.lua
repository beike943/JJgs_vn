Include("\\script\\tmp_task_id_def.lua")

--==================新任务系统新加 2740~~2820===============
TASK_GT_TASK_ID_START = 2740;
TASK_GT_TASK_ID_END = 2779;
TASK_GT_TASK_FINISH_START = 2780;
TASK_GT_TASK_FINISH_END = 2819;
TASK_GT_TASK_CANCEL_TIME = 2820; --放弃任务的时间

--===================地玄宫用到的任务变量===================
TASKID_DXG_SCORE = 3142
TASKID_DIXUANGONG_DAILY_BOSS1 = 3143
TASKID_DIXUANGONG_DAILY_BOSS2 = 3144
TASKID_DIXUANGONG_DAILY_BOSS3 = 3145

------------------------------------------------------------
ITEM_DXG_TONGTIANLING = {2, 1, 30409, "Th玭g Thi猲 L謓h"};  

--3v3==========================================================
TASKID_3V3_WIN_ROUND_DAILY		= 3146;		-- 每日胜场, 领奖时清空
TASKID_3V3_TOTAL_ROUND_DAILY	= 3147;		-- 每日总场
TASKID_3V3_TOTAL_ROUND			= 3148;		-- 总场
TASKID_3V3_BATTLE_SCORE			= 3149;		-- Rank分
TASKID_3V3_KILL_TOTAL			= 3150;		-- 总人头
TASKID_3V3_DEAD_TOTAL			= 3151;		-- 总死亡次数
TASKID_3V3_VIC_RATE				= 3152;		-- 胜率 = 总胜场 / 总场
TASKID_3V3_SCORE_DAILY			= 3153;		-- 每日积分
TASKID_3V3_SCORE_TOTAL			= 3154;		-- 赛季积分(GameDataDef.h define too)
TASKID_3V3_SCORE_LAST			= 3155;		-- 上赛季积分
TASKID_3V3_MAX_SCORE_HISTORY	= 3156;		-- 历史最高积分
TASKID_3V3_AWARD_DAILY_DATE		= 3157;		-- 每日奖励日期
TASKID_3V3_WIN_ROUND_MATCH		= 3158;		-- 赛季总胜场
TASKID_3V3_WIN_ROUND_TOTAL		= 3159;		-- 总胜场(GameDataDef.h define too)
TASKID_3V3_TOTAL_ROUND_MATCH	= 3160;		-- 赛季总场(GameDataDef.h define too)
TASKID_3V3_KILL_DAILY			= 3161;		-- 每日人头
TASKID_3V3_KILL_MATCH           = 3162;		-- 赛季人头
TASKID_3V3_DEAD_DAILY           = 3163;		-- 每日死亡
TASKID_3V3_DEAD_MATCH           = 3164;		-- 赛季死亡
TASKID_3V3_BATTLE_POWER			= 3165;		-- 战斗力 = rank分数*1.5+胜率*3000*(总场/(总场+10))+min(总胜场*1, 3000)
TASKID_3V3_ESCAPE_DAILY			= 3166;		-- 每日逃跑
TASKID_3V3_ESCAPE_MATCH			= 3167;		-- 赛季逃跑次数
TASKID_3V3_ESCAPE_TOTAL			= 3168;		-- 总逃跑
TASKID_3V3_WEEKLY_AWARD_DATE	= 3169;		-- 周奖励日期
TASKID_3V3_FIRST_DAY_BUCHANG	= 3170;		-- 补偿
TASKID_3V3_MATCH_ROUND			= 3171;		-- 赛季标记
TASKID_3V3_WIN_AWARD_COUNT		= 3172;		-- 胜场奖励标记

TASKID_NEED_SYNC_REALM_DATA		= 3173; --任务变量跨服同步标记

TASKID_3V3_LOSE_ROUND_DAILY			= 3174;
TASKID_3V3_LOSE_ROUND_MATCH			= 3175;
TASKID_3V3_LOSE_ROUND_TOTAL			= 3176;
TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_TOTAL		= 3177;
TASKID_3V3_MATCH_PERSONAL_AWARD_TIMES_USED		= 3178;
TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_TOTAL	= 3179;
TASKID_3V3_MATCH_FIGHTTEAM_AWARD_TIMES_USED		= 3180;
TASKID_3V3_MATCH_FIGHTTEAM_SCORE 				= 3181;

TEMP_TASKID_3V3_IS_DEAD			= TMP_TASK_3V3_IS_DEAD;
TEMP_TASKID_3V3_KILLED			= TMP_TASK_3V3_KILLED;

TASKID_3V3_WEEK_FIGHT_TIMES = 3182;	--本周 高两字节表示胜场，低2字节表示败场(GameDataDef.h define too)
TASKID_3V3_LASTWEEK_FIGHT_TIMES = 3183; --上周 高两字节表示胜场，低2字节表示败场(GameDataDef.h define too)

TASKID_LAST_MATCH_RANK = 3184;	--上赛季高两位跨服排名，低两位本服排名(GameDataDef.h define too)

TASKID_3V3_AWARD_TAG = 3185; --1字节表示是否领取上周奖励，2字节表示是否领取上赛季奖励（0不可领取，1可领取，2已领取）,3字节表示角色跨赛季流程,4字节表示角色跨赛季流程

TASKID_CUR_MATCH_RANK = 3186;	--本赛季高两位跨服排名，低两位本服排名(GameDataDef.h define too)

TASKID_3V3_EVERY_MATCH_EXP = 3187; --每场经验奖励
TASKID_3V3_EVERY_MATCH_YINJUAN = 3188; --每场银卷奖励

--===========================================================================
-- GlobalValue
-- !!!添加前注意冲突
-- !!!\sword2-design\策划设计设定\任务系统\剑网2_任务_任务记录表.xls
GV_MISSION_TEMP_BEGIN = 171;
GV_MISSION_TEMP_END = 180;

--帮会信息定义到任务变量上---------------
TASKID_TONG_INFO_TRANSLATION = 3200
TASKID_TONG_INFO_PLAYER_JOINTIME = 3201
-----------------------------------------

--太一塔---------------------------------
TASKID_TAIYI_ITEM								= 3205;--太一塔记录是否拥有某物品
TASKID_TAIYI_FOREST_CONSUME			= 3206;--太一塔.梵天林消费额度
TASKID_TAIYITA_TIME							= 3207;--太一塔走进trap点的时间点
TASKID_TAIYITA_NINGBINGJUE_FORBIDDEN = 3208; --太一塔是否禁用凝冰诀
TASKID_TAIYI_LATEST_WEEK				= 3209;--太一塔最近参加的周
TASKID_TAIYI_FOREST_JOIN_IN_TIME = 3210;--普通版.梵天林 最近一周已参加次数
TASKID_TAIYI_TOWER_CONSUME			= 3211;--太一塔.太一塔消费额度
TASKID_TAIYI_TOWER_JOIN_IN_TIME = 3212;--普通版.太一塔 最近一周已参加次数
TASKID_TAIYI_LAST_PASSED_STAGE	= 3213;--太一塔.最后一次通关的stageId
TASKID_TAIYI_SHOUTUI_PRIZE			= 3214;--太一首推奖励领取时间
TASKID_TY_NORMAL_ENTER_LIMIT		= 3215;		-- 太一普通
TASKID_TY_HERO_ENTER_LIMIT			= 3216;		-- 太一英雄
TASKID_FTL_NORMAL_ENTER_LIMIT		= 3217;		-- 梵天林普通
TASKID_FTL_HERO_ENTER_LIMIT			= 3218;		-- 梵天林英雄

--==================资料片比武大会新加=====================
TASKID_BIWU_BLOCK_ROUTE_OLD		= 3227; --屏蔽的流派
TASKID_BIWU_MATCH_RESULT	= 3228; --上一场比赛结果

TSK_SEASON_ZIGE_LAST = 3224;     --存上赛季的资格分数
TSK_SEASON_GET_AWARD = 3225;      --是否领取上赛季的奖励，存入当前为第几赛季
TSK_USE_JINGWU_BAG_TIME = 3226;		--使用比武大会精武包的次数

TASK_BIWU_WIN_10 = 3219; --记录前10场的胜利场次
TASK_BIWU_LOSE_10 = 3220; --记录前10场的失败场次
TASK_BIWU_GET_AWARD_10 = 3221; --记录是否领取了前10场的奖励
TASK_BIWU_DUIZHAN_JINGYAN = 3222; --对战经验 程序界面有用到
TASK_BIWU_GET_REALM_AWARD = 3223; --是否领取了全区服奖励
--TASKID_XOYO_GOLD = 2737; --逍遥币
--TASKID_XOYO_CONSUME = 2738; --逍遥币的消耗
--TASKID_BIWU_IS_REALM = 2739; --是否跨服

--活动模板，杀怪任务
TASKID_ACTIVITY_KILLNPC_ID = 3229

--世界BOSS使用
TASKID_WORLD_BOSS_USE	=	3231

----幸运百宝箱--------
TASKID_LUCKYBOX_LOTTERY = 3244 --第一字节表示当日剩余免费抽奖次数,第二字节表示一次抽奖结果(9-13)是否IB(14-16)，第三字节记录连续抽奖的剩余次数，第4字节记录天骄令使用次数

--跨服CD
TASKID_EXCHG_SVR_TAG = 3251;
TASKID_EXCHG_SVR_TIME = 3252;

--雷劫兽
TASKID_LEIJIESHOU_TIME = 3268;

--越南收费激活武尊
TASKID_IB_ACT_WUZUN_TASK = 3269;
TASKID_IB_ACT_WUZUN_TIME = 3270;

--记录角色拥有的天骄令数目
TASKID_PLAYER_TJL_COUNT = 3273;