function main()
	Say("想买些什么?",
		5,
		"购买师门物品./PutongBuy",
		"购买初级师门套装/ChujitaoBuy",
		"购买中级师门套装/ZhongtaoBuy",
		"购买高级师门套装/GaotaoBuy",
		"我看一看./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(48)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ngi kh玭g ph秈  t? Л阯g M玭, kh玭g th? mua v藅 d鬾g b? truy襫 c馻 b鎛 m玭.",0)
	return
else
   Sale(69)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ngi kh玭g ph秈  t? Л阯g M玭, kh玭g th? mua v藅 d鬾g b? truy襫 c馻 b鎛 m玭.",0)
	return
else
   Sale(70)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ngi kh玭g ph秈  t? Л阯g M玭, kh玭g th? mua v藅 d鬾g b? truy襫 c馻 b鎛 m玭.",0)
	return
else
   Sale(71)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ngi kh玭g ph秈  t? Л阯g M玭, i c竎h x璶g h? th? c? quan g??",0)
	return
else
   Sale(60)
end
end