YUANDAN_SWITCH = 0 --元旦节日开关，1为开，0为关

--以下是全局变量
ID_FLAG_NUMBER_CD = 4570	--用来记录上交的旗子的数目（成都府南）
ID_FLAG_NUMBER_BJ = 4571	--用来记录上交的旗子的数目（汴京府南）
ID_FLAG_NUMBER_QZ = 4572	--用来记录上交的旗子的数目（泉州府北）

--以下是任务变量
TASK_FLAG_HANDUP = 2350	--用来记录是否上交过旗子
--以下是临时任务变量
TASK_FLAG_FOLLOW = 111	--用来记录是否带着旗子
MAP_ID 	= 112
MAP_X	= 113
MAP_Y	= 114

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