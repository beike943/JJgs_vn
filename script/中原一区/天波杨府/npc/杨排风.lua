
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 杨门门派任务杨排风脚本文件
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

function main()
	Say("大侠，有什么事?",
		5,
		"我想买些东西/PutongBuy",
		"购买初级师门套装/ChujitaoBuy",
		"购买中级师门套装/ZhongtaoBuy",
		"购买高级套装/GaotaoBuy",
		"我只是来看看/cancel")
end

function cancel()
end

function PutongBuy()
   Sale(51)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("你不是本门弟子",0)
	return
else
   Sale(81)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("你不是本门弟子",0)
	return
else
   Sale(82)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("你不是本门弟子",0)
	return
else
   Sale(83)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("你不是本门弟子，竟敢骗我?",0)
	return
else
   Sale(64)
end
end
