--ÅäÖÃÏî Begin

--²éÑ¯ÏûºÄÄÍ¾Ã
AUTO_MOVE_QUERY_COST = 20

--ÅäÖÃÏî End


function CanQueryTargetPlayerPos(nMaxDurability)

	if (nMaxDurability < AUTO_MOVE_QUERY_COST) then
		return 0
	end

	return 1

end


function QueryTargetPlayerPos(nItemIdxShenXing)

	if (nItemIdxShenXing <= 0) then
		return
	end

	if (AbradeItem(nItemIdxShenXing, AUTO_MOVE_QUERY_COST) <= 0) then
		Say("§é bÒn ThÇn Hµnh b¶o ®iÓn cña b¹n lµ 0, tan r· thµnh tõng m¶nh!", 0)
		DelItemByIndex(nItemIdxShenXing, 0)					-- ÄÍ¾ÃÎª0ÒªÉ¾³ıµôÎïÆ·
	end

	Msg2Player("Xem täa ®é ng­êi ch¬i tiªu hao thÇn hµnh"..AUTO_MOVE_QUERY_COST.." ®iÓm")

end