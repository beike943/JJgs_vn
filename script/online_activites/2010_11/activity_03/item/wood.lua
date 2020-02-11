function OnUse(itemIndex)
	do return end
	if 1 == DelItemByIndex(itemIndex)
		ModifyExp(1000);
	end
end