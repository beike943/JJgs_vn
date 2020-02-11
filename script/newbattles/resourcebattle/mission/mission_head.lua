Include("\\script\\newbattles\\functions.lua");

POINT_LIMITED = 500;	--积分上限
if IB_VERSION == 1 then
	if tonumber(date("%y%m%d")) >= 081010 and tonumber(date("%y%m%d")) <= 081020 then
		EXP_AWARD_WIN = 7000;	--胜利方经验奖励基数
		EXP_AWARD_LOSE = 7000;	--失败方经验奖励基数
		EXP_AWARD_DRAW = 5000;	--平局经验奖励基数
	else
		EXP_AWARD_WIN = 7000;	--胜利方经验奖励基数
		EXP_AWARD_LOSE = 3000;	--失败方经验奖励基数
		EXP_AWARD_DRAW = 5000;	--平局经验奖励基数
	end
else
	EXP_AWARD_WIN = 6000;	--胜利方经验奖励基数
	EXP_AWARD_LOSE = 3000;	--失败方经验奖励基数
	EXP_AWARD_DRAW = 4500;	--平局经验奖励基数
end;
GOLDENEXP_AWARD_WIN = 900000;	--胜利方健康转经验奖励基数
GOLDENEXP_AWARD_LOSE = 300000;	--失败方健康转经验奖励基数
GOLDENEXP_AWARD_DRAW = 600000;	--平局健康转经验奖励基数
--全局常量
MAPID = RESOURCE_MAP_ID;	--地图ID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_RESO;
MISSION_ID = RESOURCE_MISSION_ID;

WINNER_BONUS = 300;	--胜积分
DRAW_BONUS = 200;	--平积分
LOSER_BONUS = 100;	--负积分

MAX_PLAYER = SUB_BATTLE_MAX_PLAYER;		--资源战单个阵营最大支持玩家数
SIGNUP_MAX_PLAYER = SUB_BATTLE_SIGNUP_MAX_PLAYER;	--最大支持报名玩家数
LEAST_PLAYER = 0;		--资源战单个阵营最少要求人数

PLAYERCOUNT_DIFF = SUB_BATTLE_PLAYER_DIFF;	--资源战最大人数差
SIGNUP_PLAYERCOUNT_DIFF = SUB_BATTLE_SIGNUP_PLAYER_DIFF;	--报名最大人数差

BASE_RESOURCE = 10000;	--初始资源数量

DRUM_COUNT = 10;
--===========================================================================
--以下是Mission变量
--===========================================================================
MV_RESOURCE_SONG = 31;	--记录宋方粮草数
MV_RESOURCE_LIAO = 32;	--记录辽方粮草数

--MV_REFLASH_TIMER_LOOP = 33;	--记录粮草刷新Timer的报时次数

MV_RESOURCE_POS_BEGIN = 34;	--记录粮草NPC的位置信息，用位来记，一共要121位，值１表示该位置有NPC，０表示没有NPC
MV_RESOURCE_POS_END = 37;	--要记121个位置，每个变量有３２位，因此要4个变量（4×３２＝128）

MV_CHANGEDRUMLEFT_SONG = 38;		--当前宋方可换取战鼓剩余次数
MV_CHANGEDRUMLEFT_LIAO = 39;		--当前宋方可换取战鼓剩余次数

MV_DRUM_USE_TIME_SONG = 40;	--宋方上次使用战鼓的时间
MV_DRUM_USE_TIME_LIAO = 41;	--辽方上次使用战鼓的时间

MV_STONE_COUNT_SONG = 42;	--宋方上交的石头数量
MV_STONE_COUNT_LIAO = 43;	--辽方上交的石头数量
--===========================================================================
TIMER_ID = 50;	--Timer的ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--报名准备时间计时器的报时间隔，３０秒
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--报名准备时间计时器报时次数（15分钟）
FIGHT_TIME = 20*FRAME_PER_SECOND;			--打仗时间计时器的报时间隔
FIGHT_TIMER_LOOP = (30*FRAME_PER_MIN/FIGHT_TIME)-1;	--打仗时间计时器的报时次数（30分钟）
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）
--===========================================================================
CATERAN_TIMER_ID = 51;	--山贼事件TImer

CATERAN_TIME = 1*18;	--刷新间隔时间
CATERAN_TIMER_LOOP = 60	--1分钟
--===================以下是Timer状态=========================================
TM_STATE_CATERAN_SONG = 1;	--表示当前是山贼横行宋方的状态，
TM_STATE_CATERAN_LIAO = 2;	--表示当前是山贼横行辽方的状态，