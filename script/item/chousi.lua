--³éË¿

function OnUse()
	local n = GetWorldPos()
	if n == 712 or n == 717 or n == 722 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh«ng thÓ sö dông c«ng cô thu thËp nµy ë ®©y.")
	end
end