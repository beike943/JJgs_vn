--File name:	mooncake_head.lua
--Describe:		中秋活动head文件
--Create Date:	2008-08-18
--Author:		chenbenqian

SWITCH_08_MOONCAKE_VIET	= 1;

DATE_08_MOONCAKE_VIET_START	= 2008090500;			-- 中秋活动开始日期
DATE_08_MOONCAKE_VIET_END	= 2008100600;			-- 中秋活动结束日期

TOTALEXP_08_MOONCAKE_VIET = 2455					--记录使用月饼获得的总共的经验
FIRE_TIME_08_MOONCAKE_VIET = 2456					--记录点火(生成火炉)的时间
CAKE_TYPE_08_MOONCAKE_VIET = 2457					--记录烧烤月饼的类型
BURNER_IDX_08_MOONCAKE_VIET = 2458					--记录火炉npc的索引
WOOD_NUM_08_MOONCAKE_VIET = 2459					--记录成功放木材的个数
OBTAIN_CAKE_08_MOONCAKE_VIET = 2460					--记录是否领取了月饼
LUCKY_DATE_08_MOONCAKE_VIET = 2461					--记录当天点亮幸运灯笼的日期
LUCKY_TIMES_08_MOONCAKE_VIET = 2462					--记录当天点亮幸运灯笼的次数
WOOD_TIME_08_MOONCAKE_VIET = 2463					--记录放木柴的时间
CAKE_DATE_08_MOONCAKE_VIET = 2464					--记录交月饼的日期

RELAY_DB_08_MOONCAKE_VIET = "mooncake_event_08_viet"		--共享数据库字符串标识

g_nExpTotal_MoonCakeViet = 50000000					--中秋活动使用月饼可获得的总共经验值
g_nTime_MoonCakeViet = 300							--烧烤月饼需要的时间(单位：秒)
Include("\\script\\lib\\writelog.lua")
szLogTrungThuName = "Hoat Dong Trung Thu"

--中秋活动开放返回1，关闭返回0
function is_mooncake_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_MOONCAKE_VIET_START and nDate < DATE_08_MOONCAKE_VIET_END then
		return SWITCH_08_MOONCAKE_VIET;
	else
		return 0;
	end
end

