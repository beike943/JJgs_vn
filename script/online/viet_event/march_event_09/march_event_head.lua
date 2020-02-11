--File name:	march_event_head.lua
--Describe:		三月活动head文件
--Create Date:	2009-02-17
--Author:		chenbenqian


SWITCH_09_WOMEN_0308_VIET = 1;					--妇女节活动开关

DATE_09_WOMEN_0308_VIET_START = 2009030600;		--妇女节活动开始日期
DATE_09_WOMEN_0308_VIET_END = 2009030900;		--妇女节活动结束日期


SWITCH_09_MARCH_VIET = 1;						--三月活动开关

DATE_09_MARCH_VIET_START = 2009031300;			--三月活动开始日期
DATE_09_MARCH_VIET_END = 2009040600;			--三月活动结束日期

SUGAR_EXP_LIMIT_09_MARCH_VIET = 150000000		--三月活动奶糖可获得的总共经验值上限
PEARL_EXP_LIMIT_09_MARCH_VIET = 50000000		--三月活动珍珠可获得的总共经验值上限


--三月活动使用的任务变量
SUGAR_TOTALEXP_09_MARCH_VIET = 2119				--记录三月活动奶糖获得的总共的经验
PEARL_TOTALEXP_09_MARCH_VIET = 2120				--记录三月活动珍珠获得的总共的经验

--妇女节活动使用的任务变量
GAIN_AWARD_09_WOMEN_0308_VIET = 2121			--记录是否领取了妇女节活动奖励


--===================================================================================================

--三月活动开放返回1，关闭返回0
function is_march_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_MARCH_VIET_START and nDate < DATE_09_MARCH_VIET_END then
		return SWITCH_09_MARCH_VIET;
	else
		return 0;
	end
end

--妇女节活动开放返回1，关闭返回0
function is_women_0308_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_WOMEN_0308_VIET_START and nDate < DATE_09_WOMEN_0308_VIET_END then
		return SWITCH_09_WOMEN_0308_VIET;
	else
		return 0;
	end
end

