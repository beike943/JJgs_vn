function main()
	Say("有何贵干?",
		5,
		"购买师门物品/PutongBuy",
		"购买师门初级套装/ChujitaoBuy",
		"购买师门中级套装/ZhongtaoBuy",
		"购买师门高级套装/GaotaoBuy",
		"我看一看/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(44)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ngi kh玭g ph秈 l?  t? c馻 Thi誹 L﹎ sao l筰 mua v藅 ph萴 b? truy襫 c馻 b鎛 ph竔?",0)
	return
else
   Sale(66)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ngi kh玭g ph秈 l?  t? c馻 Thi誹 L﹎ sao l筰 mua v藅 ph萴 b? truy襫 c馻 b鎛 ph竔?",0)
	return
else
   Sale(67)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ngi kh玭g ph秈 l?  t? c馻 Thi誹 L﹎ sao l筰 mua v藅 ph萴 b? truy襫 c馻 b鎛 ph竔?",0)
	return
else
   Sale(68)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ngi kh玭g ph秈 l?  t? Thi誹 L﹎ sao d竚 l鮝 g箃 ta?",0)
	return
else
   Sale(59)
end
end