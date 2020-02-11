--File name:	new_year_head.lua
--Describe:		春节活动head文件
--Create Date:	2008-12-24
--Author:		chenbenqian


SWITCH_09_NEWYEAR_VIET	= 1;

DATE_09_NEWYEAR_VIET_START	= 2009011600;			-- 春节活动开始日期
DATE_09_NEWYEAR_VIET_END	= 2009021600;			-- 春节活动结束日期

PLUM_EXP_LIMIT_09_NEWYEAR_VIET = 100000000			--春节活动梅-桃活动可获得的总共经验值上限
SEED_EXP_LIMIT_09_NEWYEAR_VIET = 20000000			--春节活动幸福种子可获得的总共经验值上限
PICK_TIME_09_NEWYEAR_VIET = 30						--拾取幸福种子需要的时间(单位：秒)
JOIN_TONG_DAY_09_NEWYEAR_VIET = 7					--最小入帮时间(单位：天)


--春节活动使用的任务变量
GAIN_NEW_BAG_09_NEWYEAR_VIET = 2108					--记录当天当轮是否通过杀手堂获得了新年红包
PLUM_TOTALEXP_09_NEWYEAR_VIET = 2109				--记录春节活动梅-桃活动获得的总共的经验
SEED_TOTALEXP_09_NEWYEAR_VIET = 2110				--记录春节活动幸福种子获得的总共的经验
GIVE_PLUM_DATE_09_NEWYEAR_VIET = 2111				--记录当天是否有赠送4枝梅花
AWARD_PLUM_09_NEWYEAR_VIET = 2112					--记录当天是否有领取梅花奖励
NEW_BAG_WEEK_09_NEWYEAR_VIET = 2113					--记录本周是今年的第几周（用于清除上周领取紫光阁新年红包的个数）
NEW_BAG_NUM_09_NEWYEAR_VIET = 2114					--记录本周领取紫光阁新年红包的个数
STAGE_NUM_09_NEWYEAR_VIET = 2115					--记录本周领取了紫光阁第几关的新年红包

--春节活动使用的临时任务变量
SEED_INDEX_09_NEWYEAR_VIET = 102					--记录所点幸福种子的npc索引


--春节活动共享数据库标识
RELAY_DB_09_NEWYEAR_VIET = "new_year_09_veit"
--===================================================================================================

--春节活动开放返回1，关闭返回0
function is_new_year_09_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_09_NEWYEAR_VIET_START and nDate < DATE_09_NEWYEAR_VIET_END then
		return SWITCH_09_NEWYEAR_VIET;
	else
		return 0;
	end
end

