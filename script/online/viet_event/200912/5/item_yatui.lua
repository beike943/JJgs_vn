--=============================================
--create by baiyun 2009.11.22
--describe:越南版12月份圣诞节活动鸭腿脚本
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua")

function OnUse(nItemIdx)
	do return end
	--local nDate = tonumber(date("%y%m%d"));
	--if nDate > 091025 then
	--	Talk(1, "", "物品已经过期，不能打开。");
	--	return 0;
	--end
	if gf_Judge_Room_Weight(2, 50, " ") ~= 1 then 
		return 0;
	end
	if DelItemByIndex(nItemIdx, 1) == 1 then
            --给物品奖励
            local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
            gf_EventGiveRandAward(VIET_0912_YUTUXIAO_AWARD, 100000, 13, szFullLogTitle,"эi v辴");
	end
end
