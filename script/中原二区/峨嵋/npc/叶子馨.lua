function main()
	Say("想买什么?",
		5,
		"购买师门物品/PutongBuy",
		"购买初级师门套装/ChujitaoBuy",
		"购买中级师门套装/ZhongtaoBuy",
		"购买高级师门套装/GaotaoBuy",
		"我看一看/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(45)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ngi kh玭g ph秈  t? Nga My, mua v藅 ph萴 b? truy襫 c馻 b鎛 m玭 l祄 g??",0)
	return
else
   Sale(72)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ngi kh玭g ph秈  t? Nga My, mua v藅 ph萴 b? truy襫 c馻 b鎛 m玭 l祄 g??",0)
	return
else
   Sale(73)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ngi kh玭g ph秈  t? Nga My, mua v藅 ph萴 b? truy襫 c馻 b鎛 m玭 l祄 g??",0)
	return
else
   Sale(74)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ngi kh玭g ph秈  t? Nga My, thay i x璶g h? th? c? li猲 quan g??",0)
	return
else
   Sale(61)
end
end