Include("\\settings\\static_script\\kf_newbattles\\functions.lua");
POINT_LIMITED = 1000;	--积分上限

if IB_VERSION == 1 then
	EXP_AWARD_WIN = 25000;	--胜利方经验奖励基数
	EXP_AWARD_LOSE = 9000;	--失败方经验奖励基数
	EXP_AWARD_DRAW = 17000;	--平局经验奖励基数
else
	EXP_AWARD_WIN = 35000;	--胜利方经验奖励基数
	EXP_AWARD_LOSE = 25000;	--失败方经验奖励基数
	EXP_AWARD_DRAW = 30000;	--平局经验奖励基数
end;
GOLDENEXP_AWARD_WIN = 3000000;	--胜利方健康转经验奖励基数
GOLDENEXP_AWARD_LOSE = 1000000;	--失败方健康转经验奖励基数
GOLDENEXP_AWARD_DRAW = 2000000;	--平局健康转经验奖励基数
--全局常量
MAPID = PRIMARY_MAIN_MAP_ID;	--地图ID 未定义
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
MISSION_ID = PRIMARYMAIN_MISSION_ID;  --MissionID = 76

WINNER_BONUS = 600;	--胜积分
DRAW_BONUS = 400;	--平积分
LOSER_BONUS = 200;	--负积分

MAX_PLAYER = MAIN_BATTLE_MAX_PLAYER;		--主战场单个阵营最大支持玩家数
SIGNUP_MAX_PLAYER = MAIN_BATTLE_SIGNUP_MAX_PLAYER;	--最大支持报名玩家数
LEAST_PLAYER = 0;		--主战场单个阵营最少要求人数

PLAYERCOUNT_DIFF = MAIN_BATTLE_PLAYER_DIFF;	--主战场最大人数差
SIGNUP_PLAYERCOUNT_DIFF = MAIN_BATTLE_SIGNUP_PLAYER_DIFF;	--报名最大人数差
--以下是Mission变量
--===================MissionS==========================================

--===================MissionV================================================
MV_FRONT_TRAP_SONG = 31;	--记录宋方是否可以走前营TRAP点
MV_FRONT_TRAP_LIAO = 32;	--记录辽方是否可以走前营TRAP点
MV_MID_TRAP_SONG = 33;	--记录宋方是否可以走中营TRAP点
MV_MID_TRAP_LIAO = 34;	--记录辽方是否可以走中营TRAP点

MV_FIGHTING_ROOM1 = 35;	--记录单挑场地的状态；
MV_FIGHTING_ROOM2 = 36;
MV_FIGHTING_ROOM3 = 37;
MV_FIGHTING_ROOM4 = 38;

MV_KILL_SONG_LOOEY_COUNT = 39;	--辽方杀死宋方校尉的数量（以下类推）
MV_KILL_LIAO_LOOEY_COUNT = 40;
MV_KILL_SONG_CAPTAIN_COUNT = 41;
MV_KILL_LIAO_CAPTAIN_COUNT = 42;
MV_KILL_SONG_PIONEER_COUNT = 43;
MV_KILL_LIAO_PIONEER_COUNT = 44;
MV_KILL_SONG_GENERAL_COUNT = 45;
MV_KILL_LIAO_GENERAL_COUNT = 46;

MV_NPC_TYPE_SONG = 47;	--记录双方当前出现的NPC类型（０为未出，１为先锋，２为将军，３为元帅）
MV_NPC_TYPE_LIAO = 48;	--

MV_HELP_REFUGEE_COUNT_SONG = 49;	--记录双方求助难民的数量
MV_HELP_REFUGEE_COUNT_LIAO = 50;

MV_EMPLACEMENT0_POSSESSION = 51;	--记录三个炮台的拥有者,0,1,2分别对应着战场上的中左右（公宋辽）三门炮台
MV_EMPLACEMENT1_POSSESSION = 52;	--值表示该炮台属于哪个阵营
MV_EMPLACEMENT2_POSSESSION = 53;

MV_KILL_BOX_COUNT = 54			--记录杀了多少个宝箱
MV_KILL_VILLAGER_COUNT = 55		--记录杀死土民的数量
MV_KILL_SONG_SOLDIER_COUNT = 56	--记录宋方士兵死亡数量
MV_KILL_LIAO_SOLDIER_COUNT = 57	--记录辽方士兵死亡数量

MV_FIGHTER_GROUP1_1 = 58		--记录单挑两玩家的索引
MV_FIGHTER_GROUP1_2 = 59
MV_FIGHTER_GROUP2_1 = 60
MV_FIGHTER_GROUP2_2 = 61
MV_FIGHTER_GROUP3_1 = 62
MV_FIGHTER_GROUP3_2 = 63
MV_FIGHTER_GROUP4_1 = 64
MV_FIGHTER_GROUP4_2 = 65

MV_HEADER_DEATH = 66			--土民首领是否已死
MV_HERO_DEATH = 67				--中立武将是否已死

MV_MARSHAL_SONG = 68;			--宋方元帅索引
MV_MARSHAL_LIAO = 69;			--辽方元帅索引
--===========================================================================
TIMER_ID = 109;					--Timer的ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--报名准备时间计时器的报时间隔，３０秒
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--报名准备时间计时器报时次数（15分钟）
FIGHT_TIME = 20*FRAME_PER_SECOND;			--打仗时间计时器的报时间隔
FIGHT_TIMER_LOOP = (45*FRAME_PER_MIN/FIGHT_TIME)-1;	--打仗时间计时器的报时次数（45分钟）
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）
--===========================================================================
INJURE_TIMER_ID = 110;			--处理炮台伤人的Timer ID

INTERVAL_TIME = 10*18;			--刷新间隔时间
--===========================================================================
ROOM_STATE_IDLE = 0;
ROOM_STATE_READY = 1;
ROOM_STATE_FIGHT = 2;
ROOM_STATE_END = 3;
--===========================================================================


