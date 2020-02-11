--ÍÚ¿ó
Include("\\script\\function\\zq_battles\\zq_head.lua")

function OnUse(nItem)
	local n = GetWorldPos()
	if n == 711 or n == 716 or n == 721 then
		OpenNewGatherWindow()
	else
		Msg2Player("Kh«ng thÓ sö dông c«ng cô thu thËp nµy ë ®©y.")
	end
end