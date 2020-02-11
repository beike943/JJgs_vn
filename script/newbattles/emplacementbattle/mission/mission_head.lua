Include("\\script\\newbattles\\functions.lua");

POINT_LIMITED = 500;		--积分上限
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
MAPID = EMPLACEMENT_MAP_ID;	--地图ID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_EMPL;
MISSION_ID = EMPLACEMENT_MISSION_ID;

WINNER_BONUS = 300;	--胜积分
DRAW_BONUS = 200;	--平积分
LOSER_BONUS = 100;	--负积分

MAX_PLAYER = SUB_BATTLE_MAX_PLAYER;			--炮台战单个阵营最大支持玩家数
SIGNUP_MAX_PLAYER = SUB_BATTLE_SIGNUP_MAX_PLAYER;	--最大支持报名玩家数
LEAST_PLAYER = 0;							--炮台战单个阵营最少要求人数

PLAYERCOUNT_DIFF = SUB_BATTLE_PLAYER_DIFF;	--炮台战最大人数差
SIGNUP_PLAYERCOUNT_DIFF = SUB_BATTLE_SIGNUP_PLAYER_DIFF;	--报名最大人数差
--以下是Mission变量
--===========================================================================
MV_OCCUPY_TIME_SONG = 31;		--记录宋方占领炮台的总时间，单位为秒
MV_OCCUPY_TIME_LIAO = 32;		--记录辽方占领炮台的总时间，单位为秒

MV_TAKE_TIME_SONG = 33;			--记录宋方上次攻占炮台的时间
MV_TAKE_TIME_LIAO = 34;			--记录辽方上次攻占炮台的时间

MV_KILL_NATIVE_COUNT = 35;		--记录土民死亡数量
MV_KILL_GUARD_COUNT = 36;		--记录炮台守卫死亡数量
MV_KILL_BOX_COUNT = 37;			--记录打开宝箱的数量

--===========================================================================
TIMER_ID = 52;					--Timer的ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--报名准备时间计时器的报时间隔，３０秒
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--报名准备时间计时器报时次数（15分钟）
FIGHT_TIME = 20*FRAME_PER_SECOND;			--打仗时间计时器的报时间隔
FIGHT_TIMER_LOOP = (30*FRAME_PER_MIN/FIGHT_TIME)-1;	--打仗时间计时器的报时次数（30分钟）
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）
--===========================================================================
INJURE_TIMER_ID = 58;			--处理炮台伤人的Timer ID

INTERVAL_TIME = 10*18;			--刷新间隔时间