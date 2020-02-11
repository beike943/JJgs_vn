--File name:	jixiang_head.lua
--Describe:		吉祥小包活动head文件
--Create Date:	2008-06-24
--Author:		chenbenqian

SWITCH_08_JIXIANG_VIET	= 1;

DATE_08_JIXIANG_VIET_START	= 2008080100;		-- 吉祥小包活动开始日期
DATE_08_JIXIANG_VIET_END	= 2008081100;		-- 吉祥小包活动结束日期

--吉祥小包活动开放返回1，关闭返回0
function is_jixiang_event_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_JIXIANG_VIET_START and nDate < DATE_08_JIXIANG_VIET_END then
		return SWITCH_08_JIXIANG_VIET;
	else
		return 0;
	end
end
