--配置项 Begin

--查询消耗耐久
AUTO_MOVE_QUERY_COST = 20;

--配置项 End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0, "您至少需要"..AUTO_MOVE_QUERY_COST.."点耐久的“神行秘本”或“神行宝典”才能寻人"
	end

	return 1, ""

end