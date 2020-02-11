--=============================================
--create by baiyun 2009.4.12
--describe:越南版4月份金星星银星星活动
--=============================================


GSSTARS_SWITCH = 1													--活动开关：1为开，0为关
GSSTARS_ROLE_LEVEL_LIMIT = 60								--参加此活动的角色等级限制
GSSTARS_GET_SSTARS_INTERVAL = 5 * 60				--连续两次获得银星星的间隔

GSSTARS_TASK_GET_SSTARS_TIME = 2139;				--获得银星星的时间(每次获得银星星都要更新此值，用于限制连续两次得到银星星的间隔)
GSSTARS_TASK_GET_SSTARS_DATE = 2140;				--获得银星星的日期
GSSTARS_TASK_GET_SSTARS_COUNT = 2141;				--获得银星星的次数，每天更新

GSSTARS_LEVEL_TO_GSTAR_NUM = 30;						--升级成金星星需要的银星星的数量
GSSTARS_LEVEL_TO_GSTAR_MONEY = 20 * 100;		--升级成金星星需要的银子（铜钱）
GSSTARS_GET_SSTAR_MAX_TIME = 12;						--每天最多获得银星星的次数

--玩家等级，1次获得的银星星数量， 1天最多获得几次
GSSTARS_PARAM = {
							{1, 0, 0},
							{2, 0, 0},
							{3, 0, 0},
							{4, 0, 0},
							{5, 0, 0},
							{6, 3, 12},
							{7, 4, 12},
							{8, 4, 12},
							{9, 5, 12}
							
};

--取得一星期的第几天
function GSStarsGetCurDay()--0表示星期天
	nDay = date("%w")
	return tonumber(nDay)
end