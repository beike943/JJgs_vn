--File name:	xmas_head.lua
--Describe:		圣诞节活动head文件
--Create Date:	2008-11-17
--Author:		chenbenqian


SWITCH_08_XMAS_VIET	= 1;

DATE_08_XMAS_VIET_START	= 2008120500;			-- 圣诞节活动开始日期
DATE_08_XMAS_VIET_END	= 2009010500;			-- 圣诞节活动结束日期

EXP_LIMIT_08_XMAS_VIET = 100000000				--圣诞节活动使用道具可获得的总共经验值上限
PICK_TIME_08_XMAS_VIET = 60						--拾取圣诞树需要的时间(单位：秒)

--圣诞节活动使用的任务变量
TOTALEXP_08_XMAS_VIET = 2483					--记录圣诞节活动获得的总共的经验
TREE_DATE_08_XMAS_VIET = 2484					--记录当天拾取圣诞树的日期
TREE_NUM_08_XMAS_VIET = 2485					--记录当天拾取圣诞树的个数(获取奖励的次数)
GAIN_POUCH_08_XMAS_VIET = 2486					--记录是否获得了锦囊大事件物品
GAIN_STAR_08_XMAS_VIET = 2487					--记录是否使用锦囊大事件获得过圣诞星星
LUCK_BOX_DATE_08_XMAS_VIET = 2488				--记录当天领取幸运礼盒的日期
LUCK_BOX_NUM_08_XMAS_VIET = 2489				--记录当天领取幸运礼盒的个数
LUCK_BOX_TURN_08_XMAS_VIET = 2490				--记录领取了第几轮幸运礼盒
GAIN_PILL_08_XMAS_VIET = 2491					--记录是否获得了龙血丸
GAIN_NEW_BOX_08_XMAS_VIET = 2492				--记录是否获得了礼盒(新手奖品)
FIREWORKS_DATE_08_XMAS_VIET = 2493				--记录当天使用烟火的日期
FIREWORKS_NUM_08_XMAS_VIET = 2494				--记录当天使用烟火的个数
GAIN_CLOTH_BOX_08_XMAS_VIET = 2495				--记录是否获得了外装礼盒
FIREWORKS_TIME_08_XMAS_VIET = 2496				--记录上次使用烟火的时间
GAIN_LUCK_BOX_08_XMAS_VIET = 2497				--记录当天是否通过杀手堂获得了幸运礼盒

--圣诞节活动使用的临时任务变量
TREE_INDEX_08_XMAS_VIET = 101					--记录所点圣诞树的npc索引

--圣诞节活动使用的全局变量
BJ_LUCK_BOX_NUM_XMAS_VIET = 1002				--记录汴京圣诞树npc发放的幸运礼盒的数量
CD_LUCK_BOX_NUM_XMAS_VIET = 1003				--记录成都圣诞树npc发放的幸运礼盒的数量
QZ_LUCK_BOX_NUM_XMAS_VIET = 1004				--记录泉州圣诞树npc发放的幸运礼盒的数量
AWARD_MAP_IDX_XMAS_VIET = 1005					--记录能够产生特别礼盒的地图索引
AWARD_TURN_XMAS_VIET = 1006						--记录将在第几轮发放幸运礼盒时产生特别礼盒

--圣诞节活动开放返回1，关闭返回0
function is_xmas_08_viet_open()
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= DATE_08_XMAS_VIET_START and nDate < DATE_08_XMAS_VIET_END then
		return SWITCH_08_XMAS_VIET;
	else
		return 0;
	end
end

