Include("\\settings\\static_script\\kf_newbattles\\functions.lua");

POINT_LIMITED = 500;	--个人积分上限
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
MAPID = VILLAGE_MAP_ID;	--地图ID
MAPID_SONG = MAPID;
MAPID_LIAO = MAPID;
RANDOM_PLACE = GLB_RANDOM_PLACE_VILL;
MISSION_ID = VILLAGE_MISSION_ID;

WINNER_BONUS = 300;	--胜积分
DRAW_BONUS = 200;	--平积分
LOSER_BONUS = 100;	--负积分

MAX_PLAYER = SUB_BATTLE_MAX_PLAYER;		--村落战单个阵营最大支持玩家数
SIGNUP_MAX_PLAYER = SUB_BATTLE_SIGNUP_MAX_PLAYER;	--最大支持报名玩家数
LEAST_PLAYER = 0;		--村落战单个阵营最少要求人数

PLAYERCOUNT_DIFF = SUB_BATTLE_PLAYER_DIFF;	--村落战最大人数差
SIGNUP_PLAYERCOUNT_DIFF = SUB_BATTLE_SIGNUP_PLAYER_DIFF;	--报名最大人数差
--以下是Mission变量
--===================MissionS==========================================
MSTR_SONG_TARGETNAME = 1;	--记录宋方目标NPC的名字
MSTR_LIAO_TARGETNAME = 2;	--记录辽方目标NPC的名字
MSTR_SONG_ONE	= 3;	--记录双方三个被选择的人的名字
MSTR_LIAO_ONE	= 4;
MSTR_SONG_TWO   = 5;
MSTR_LIAO_TWO	= 6;	
MSTR_SONG_THREE	= 7;
MSTR_LIAO_THREE = 8;
--===================MissionV================================================
MV_HEADER_APPEAR = 31;	--标记首领的NPC索引，值为0表示首领还没出现。
MV_SONG_TASKSTEP = 32;	--记录双方完成任务的步数
MV_LIAO_TASKSTEP = 33;

MV_SONG_KILL_SONG = 34;	--记录宋方杀死宋方目标知情人的数量
MV_LIAO_KILL_LIAO = 35 	--记录辽方杀死辽方目标知情人的数量

MV_SONG_KILL_LIAO = 36;	--记录宋方杀死辽方目标知情人的数量
MV_LIAO_KILL_SONG = 37	--记录辽方杀死宋方目标知情人的数量

MV_TASK_NPCINDEX_SONG = 38;	--记录目标NPC的索引
MV_TASK_NPCINDEX_LIAO = 39;

MV_KNOWMAN_SONG_BEGIN = 40;	--记录知情人NPC的索引
MV_KNOWMAN_SONG_END = 49;
MV_KNOWMAN_LIAO_BEGIN = 50;
MV_KNOWMAN_LIAO_END = 59;

MV_POS_INDEX_SONG_BEGIN = 60;	--记录已被占用的位置索引
MV_POS_INDEX_SONG_END = 70;
MV_POS_INDEX_LIAO_BEGIN = 71;
MV_POS_INDEX_LIAO_END = 81;

MV_TARGET_NPC_STATE_SONG = 82;	--记录宋方目标NPC的状态，0为对话状态，1为战斗状态
MV_TARGET_NPC_STATE_LIAO = 83;	--记录辽方目标NPC的状态，0为对话状态，1为战斗状态

MV_NPC_FIGHT_BEGIN_SONG = 84;	--记录宋方目标NPC变成战斗NPC时计时器的计数值
MV_NPC_FIGHT_BEGIN_LIAO = 85;	--记录辽方目标NPC变成战斗NPC时计时器的计数值

MV_FIGHT_NPC_TYPE_SONG = 86;	--记录宋方战斗NPC的类型，1为仇恨，2为愤怒，3为狂暴
MV_FIGHT_NPC_TYPE_LIAO = 87;	--记录辽方战斗NPC的类型，1为仇恨，2为愤怒，3为狂暴
--===========================================================================
TIMER_ID = 102;	--Timer的ID
--===========================================================================
READY_TIME = 30*FRAME_PER_SECOND;--报名准备时间计时器的报时间隔，３０秒
READY_TIMER_LOOP = (15*FRAME_PER_MIN/READY_TIME)-1;--报名准备时间计时器报时次数（15分钟）
FIGHT_TIME = 20*FRAME_PER_SECOND;			--打仗时间计时器的报时间隔
FIGHT_TIMER_LOOP = (30*FRAME_PER_MIN/FIGHT_TIME)-1;	--打仗时间计时器的报时次数（30分钟）
WAITOUT_TIME = 30*FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）
--===========================================================================
FIGHT_NPC_TIMEOUT1 = 9;		--仇恨NPC生存时间，２０秒一个单位
FIGHT_NPC_TIMEOUT2 = 12;	--愤怒NPC生存时间
FIGHT_NPC_TIMEOUT3 = 15;	--狂暴NPC生存时间
--===========================================================================
