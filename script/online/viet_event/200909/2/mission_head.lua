--=============================================
--create by baiyun 2009.8.31
--describe:越南版9月份中秋活动走军灯笼mission头文件
--=============================================

MISSION_ID = 47;									--Mission的ID
TIMER_ID = 76;										--计时器的ID
LOG_ID = 00;										--登陆触发器ID
LOG_CUSTOM_ID = 00;									--登陆触发器自定义编号
--=========================================================================================
LOG_HEAD = "Mission";								--日志标记头
LOG_ERR_HEAD = "Mission l鏸";						--日志错误标记头
--=========================================================================================
FRAME_PER_SECOND = 18;								--游戏运行速度：每秒１８帧
FRAME_PER_MIN = 60*FRAME_PER_SECOND;				--每分钟游戏帧数
--定义各个阶段的持续时间，单位为分钟，最小值为1/60，即1秒==================================
READY_TIME = 1;									--准备时间，1分钟（这里把准备时间和下面的READY_TIMER_INTERVAL都设成1，为了跳过准备阶段）
--STARTED_TIME = 30;									--进行时间时间，30分钟
ENDING_TIME = 1;									--等待结束时间，1分钟（同准备时间的设置时间）
--定义各个阶段计时器的触发间隔=============================================================
READY_TIMER_INTERVAL = 1;							--计时器触发的时间间隔，单位分钟
READY_TIMER_COUNT = floor(READY_TIME/READY_TIMER_INTERVAL)-1;	
STARTED_TIMER_INTERVAL = 2;					
--STARTED_TIMER_COUNT = floor(STARTED_TIME/STARTED_TIMER_INTERVAL)-1;	
ENDING_TIMER_INTERVAL = 1;
ENDING_TIMER_COUNT = floor(ENDING_TIME/ENDING_TIMER_INTERVAL)-1;	
--MissionS变量=============================================================================

--MissionV变量=============================================================================
MV_MISSION_STATE = 1;								--记录Mission状态
MV_TIMER_LOOP = 2;									--记录计时器的计数
MV_MISSION_UID = 3;									--记录Mission的唯一ID
--Mission状态集============================================================================
MS_STATE_IDEL = 0;									--场地空闲
MS_STATE_READY = 1;									--准备阶段
MS_STATE_STARTED = 2;								--开战阶段
MS_STATE_ENDING = 3;								--等待结束阶段
--=========================================================================================
