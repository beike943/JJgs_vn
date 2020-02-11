--SetTempTask() Id定义
--SetDailyTask()任务变量的ID定义
--所有用到的TempTaskId在这里按顺序注册
--禁止直接在脚本里面SetTempTask(121)这种用法

_TMP_TASK_ID_VEIT_BEGIN = 256 

--关卡获得装备次数,在\script\missions\base\mission_award_base.lua使用
TMP_TASK_ID_GUANKA_AWARD_EQUIP_COUNT = _TMP_TASK_ID_VEIT_BEGIN + 0; 
TMP_TASK_ID_OLY_COMPOSE_TEMP_INDEX = _TMP_TASK_ID_VEIT_BEGIN + 1;--奥运活动的不知道记录什么，加注释啊，不然以后怎么回收
TMP_TASK_ID_OLY_MHGL_TEMP_INDEX = _TMP_TASK_ID_VEIT_BEGIN + 2;--奥运活动的不知道记录什么

TMP_TASK_BW_YAJIN_LEITAI = _TMP_TASK_ID_VEIT_BEGIN + 3;--押金擂台记录选项索引
TMP_TASK_TRANS_ZHENQI_STATE = _TMP_TASK_ID_VEIT_BEGIN + 4;--记录真气传输的状态
TMP_TASK_ID_TAG_101 = _TMP_TASK_ID_VEIT_BEGIN + 5; --云帮主任务使用不可重用
TMP_TASK_ID_TAG_106 = _TMP_TASK_ID_VEIT_BEGIN + 6; --守卫任务（不可复用）
TMP_TASK_KF_TIME = _TMP_TASK_ID_VEIT_BEGIN + 7; --跨服战场记录死亡时间
TMP_TASK_KF_KILL_NUM = _TMP_TASK_ID_VEIT_BEGIN + 8; --跨服战场被杀次数和杀人次数
TMP_TASK_KF_SCORE = _TMP_TASK_ID_VEIT_BEGIN + 9; --个人贡献积分值
TMP_TASK_3V3_IS_DEAD = _TMP_TASK_ID_VEIT_BEGIN + 10; --3v3
TMP_TASK_3V3_KILLED = _TMP_TASK_ID_VEIT_BEGIN + 11; --3v3
TMP_TASK_TONG_MELEE_X = _TMP_TASK_ID_VEIT_BEGIN + 12; --TongMelee
TMP_TASK_TONG_MELEE_Y = _TMP_TASK_ID_VEIT_BEGIN + 13; --TongMelee
TMP_TASK_TONG_MELEE_DOUBLESORCE = _TMP_TASK_ID_VEIT_BEGIN + 14; --TongMelee
TMP_TASK_TONG_MELEE_NOTREDUCESORCE = _TMP_TASK_ID_VEIT_BEGIN + 15; --TongMelee
TMP_TASK_TAIXU_TAG = _TMP_TASK_ID_VEIT_BEGIN + 16; --太虚标记等待时间（修复刷过关奖励BUG）

_TMP_TASK_ID_VEIT_END = 511


---------------------------------------------------------------------------------------------------------

--SetDailyTask()任务变量的ID定义


--经脉系统占用
DAILY_TASK_ID_DAILY_MERDIAN1 = 1
DAILY_TASK_ID_DAILY_MERDIAN2 = 2

--每日从关卡中获得代币的数量
DAILY_TASK_ID_DAILY_GET_DAIBI = 3

--每日传输真气的限制
DAILY_TASK_ID_TRANS_ZHENQI_LIMIT = 4

--每日获得银券上限
DAILY_TASK_ID_YINJUAN_LIMT = 5


--用到这里表示没有可用的了
__DAILY_TASK_ID_END__ = 6

