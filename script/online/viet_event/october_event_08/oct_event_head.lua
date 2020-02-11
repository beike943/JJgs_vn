--File name:	oct_event_head.lua
--Describe:		十月活动head文件
--Create Date:	2008-09-26
--Author:		chenbenqian

Include("\\script\\lib\\writelog.lua")

SWITCH_08_OCT_EVENT_VIET		= 1;				-- 十月活动开关

DATE_08_OCT_EVENT_VIET_START	= 2008101000;		-- 十月活动开始日期
DATE_08_OCT_EVENT_VIET_END		= 2008102100;		-- 十月活动结束日期

RELAY_DB_08_OCT_EVENT_VIET = "october_event_08_viet"		--共享数据库字符串标识

--十月活动开放返回1，关闭返回0
function is_oct_event_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_OCT_EVENT_VIET_START and nDate < DATE_08_OCT_EVENT_VIET_END then
		return SWITCH_08_OCT_EVENT_VIET;
	else
		return 0;
	end
end
