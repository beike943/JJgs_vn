--抽丝

function OnUse()
	local n = GetWorldPos()
	if n == 712 or n == 717 or n == 722 then
		OpenNewGatherWindow()
	else
		Msg2Player("你不能在这里使用这个采集工具")
	end
end
