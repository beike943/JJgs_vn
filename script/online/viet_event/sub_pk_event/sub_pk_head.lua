--File name:	sub_pk_head.lua
--Describe:		周末减PK值活动head文件
--Create Date:	2008-06-24
--Author:		chenbenqian

SWITCH_08_SUB_PK_VIET	= 1;

DATE_08_SUB_PK_VIET_START	= 2008070400;		-- 周末减PK值活动开始日期
DATE_08_SUB_PK_VIET_END		= 2008072800;		-- 周末减PK值活动结束日期

--周末减PK值活动开放返回1，关闭返回0
function is_sub_pk_event_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_SUB_PK_VIET_START and nDate < DATE_08_SUB_PK_VIET_END then
		return SWITCH_08_SUB_PK_VIET;
	else
		return 0;
	end
end

