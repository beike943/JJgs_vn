function main()
	Say("想买些什么?",
		5,
		"购买师门物品/PutongBuy",
		"购买初级师门套装/ChujitaoBuy",
		"购买中级师门套装/ZhongtaoBuy",
		"购买高级师门套装/GaotaoBuy",
		"我来看看./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(55)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ngi kh玭g ph秈 l?  t? Ng? чc, kh玭g th? mua v藅 ph萴 b鎛 gi竜",0)
	return
else
   Sale(84)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ngi kh玭g ph秈 l?  t? Ng? чc, kh玭g th? mua v藅 ph萴 b鎛 gi竜",0)
	return
else
   Sale(85)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ngi kh玭g ph秈 l?  t? Ng? чc, kh玭g th? mua v藅 ph萴 b鎛 gi竜",0)
	return
else
   Sale(86)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ngi kh玭g ph秈 l?  t? Ng? чc, kh玭g th? thay i x璶g hi謚!",0)
	return
else
   Sale(65)
end
end