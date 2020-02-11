--ÊÕ¸û

function OnUse()
	local n = GetWorldPos()
	if n == 713 or n == 718 or n == 723 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh«ng thÓ sö dông c«ng cô thu thËp nµy ë ®©y.")
	end
end