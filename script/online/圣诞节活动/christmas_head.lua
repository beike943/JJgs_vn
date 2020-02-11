CHRISTMAS_SWITCH = 0	--活动开关，1为开，0为关

--全局变量使用(不能大于5000)
ID_PRESENT_NUMBER_CD = 4560 --用来计算成都圣诞树上的礼物数量 
ID_PRESENT_NUMBER_BJ = 4561 --用来计算汴京圣诞树上的礼物数量 
ID_PRESENT_NUMBER_QZ = 4562 --用来计算泉州圣诞树上的礼物数量 
--任务变量使用(不能大于2560)
TASK_GOT_PRESENT = 2340	--用来标记是否领取过礼物
TASK_GOT_DATE = 2341	--用来记录领取礼物的日期
TASK_GOT_HAT = 2342	--用来记录是否领取过圣诞帽

function GetLocalTime()
	nHour = date("%H");
	nMin = date("%M");
	return tonumber(nHour), tonumber(nMin)
end

function GetCurDate()
	nDay = date("%d")
	return tonumber(nDay)
end