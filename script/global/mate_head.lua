DOLL_TIME_LIMIT		= 10000000;		-- 替身娃娃的使用时间的上限
TASKVAR_DOLLTIME 	= 2013			-- 任务变量：替身娃娃的使用剩余时间（秒）
TASKVAR_DOLLEXP	 	= 2014			-- 任务变量：替身娃娃的经验（未乘以百分比）
TASK_LOVEGRADE 		= 2015			-- 任务变量：同心值
TASK_MARRYDATE		= 2016			-- 任务变量：结婚日期（年份 * 600 + 月份 * 40 + 日期）
TASK_MATESTYLE		= 2017			-- 任务变量：配偶体型
TASK_DECLOVE_TIME	= 2020			-- 保存上次扣除同心值的日期时间
TASK_INCLOVE_TIME 	= 2021			-- 保存累计的夫妇同时在线时间
TASK_DOLL_ACTIVE	= 2022			-- 表示当前是否在使用替身娃娃，记录的是使用出魂果的时间
TMPV_DECLOVE_TIME	= 0				-- 玩家临时变量，保存上次扣除同心值的日期时间
TMPV_INCLOVE_TIME	= 1				-- 玩家临时变量，保存累计的夫妇同时在线时间
VALUE_DECLOVE		= 4				-- 每次扣除的同心值
VALUE_INCCLOVE		= 1				-- 每次增加的同心值
INTERVAL_INCLOVE	= 15 * 60		-- 累加同心值的时间间隔（秒）
MAX_LOVEGRADE		= 500			-- 同心值的最大值
DOLL_TIME			= 2*3600			-- 替身娃娃的使用时间（秒）

SFX_DOLL			= 949			-- 替身娃娃特效ID

function encode_datetime(year, mon, day)
	return year * 1000 + mon * 40 + day 
end

-- 降低同心值
function dec_lovegrade(datetime, player, value)
	if (GetTask(TASK_DECLOVE_TIME,player) < datetime) then	--以防跨服的时候因时间不一致造成多扣
		local grade = GetTask(TASK_LOVEGRADE, player)
		if (grade ~= 0) then
			if (grade >= value) then
				grade = grade - value
			else
				grade = 0
			end
			SetTask(TASK_LOVEGRADE, grade, 0, player)
			SetTask(TASK_DECLOVE_TIME,datetime, 0, player);
		end
	end
end