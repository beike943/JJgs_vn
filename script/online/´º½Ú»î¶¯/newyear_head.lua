Include("\\script\\lib\\globalfunctions.lua");
NEWYEAR_SWITCH = 1	--春节活动开关。1为开，0为关
--全局变量索引
GLB_PRESENT_NUM_BJ	= 4580	--用来记录汴京福神身上的礼物数量
GLB_PRESENT_NUM_CD	= 4581	--用来记录成都福神身上的礼物数量
GLB_PRESENT_NUM_QZ	= 4582	--用来记录泉州福神身上的礼物数量
--全局常量
TITLE_GENRE = 4	--称号主类型编号


XIAONIANSHOU_COUNT = 30;	--小年兽的数量
--任务变量
TASK_GOT_NIANSHOU = 2359	--记录玩家获得小年兽礼物的时间
TITLE_OLD_DETAILTYPE = 2360	--用来记录玩家前一个春节称号
TASKID_OPEN_LITTER_GIFT = 2360 -- 记录小红包使用时间(越南)
TASK_GOT_JIAOZI = 2361	--用来记录玩家当天上线是否领取过饺子
TASK_GOT_PRESENT = 2362	--用来记录玩家当天是否领取过新年礼物
TASK_PET_BORN = 2363	--用来记录宠物的出生时间
TASK_GOT_BOX = 2364	--用来记录打开箱子的时间 
TASK_GOT_LIBAO	= 2365	--用来记录玩家当天是否领取过大礼包
TASK_GOT_SNOWBALL = 2366	--用来记录玩家是否在进雪仗场地的时候领取过雪球
TASK_EAT_NIANGAO	= 2367	--用来记录玩家吃年糕的情况
TASK_EAT_SANXIAN	= 2368	--用来记录玩家吃了多少个三鲜年糕
--临时任务变量

DATE_SPRING_START = 20080126
DATE_SPRING_END = 20080217

function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function GetCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end

function GetCurMonth()
	nMonth = date("%m")
	return tonumber(nMonth)
end

function Check_Date()
	local nDate = tonumber(date("%Y%m%d"));
	if nDate < DATE_SPRING_START then
		return -1;	--时间未到
	elseif nDate > DATE_SPRING_END then
		return 1;	--时间已过
	else
		return 0;	--活动进行中
	end;
end;

function is_spring_2008_date_viet()
	local ndate = tonumber(date("%Y%m%d"));
	if ndate < DATE_SPRING_START or ndate > DATE_SPRING_END then
		return 0
	else
		return 1
	end
end
