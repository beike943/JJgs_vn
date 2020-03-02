--伐木

function OnUse()
	local n = GetWorldPos()
	if n == 710 or n == 715 or n == 720 then
		OpenNewGatherWindow()
	else
		Msg2Player("你不能在这里使用这个采集工具")
	end
end
