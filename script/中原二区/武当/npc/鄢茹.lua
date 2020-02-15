function main()
	Say("有何贵干?",
		5,
		"我想买些师门用品/PutongBuy",
		"购买初级师门套装/ChujitaoBuy",
		"购买中级师门套装/ZhongtaoBuy",
		"购买高级师门套装/GaotaoBuy",
		"我来看看/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(46)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("你不是本门弟子",0)	return
else
   Sale(78)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("你不是本门弟子",0)
	return
else
   Sale(79)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("你不是本门弟子",0)
	return
else
   Sale(80)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("你不是本门弟子",0)
	return
else
   Sale(63)
end
end