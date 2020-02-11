--金钱袋物品脚本

function OnUse(nItemIdx)
	local nPrice = GetItemPrice(nItemIdx)
	if nPrice and nPrice > 0 then
		--先删除被使用道具
		if 1 == DelItemByIndex(nItemIdx, 1) then
			Earn(nPrice)
		end
	end
end