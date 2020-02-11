Include("\\script\\online\\collect_card\\cc_head.lua")

function OnUse(nItem)
	--参与条件
	if gf_CheckBaseCondition(CC_PLAYER_LEVEL_MIN) ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		ModifyExp(10000);
	end
end