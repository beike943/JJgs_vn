function main()
	Say("B»ng h÷u t×m ta cã chuyÖn g× kh«ng?",
		5,
		"Ta muèn mua mét sè vËt dông./PutongBuy",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho t©n thñ? H·y cho ta xem!/ChujitaoBuy",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho vâ l©m cao thñ? H·y cho ta xem!/ZhongtaoBuy",
		"Ta nghe nãi s­ m«n cã 1 bé thÇn binh b¶o gi¸p giµnh cho tuyÖt thÕ cao thñ? H·y cho ta xem!/GaotaoBuy",
		"Rêi khái./cancel")
end

function cancel()
end

function PutongBuy()
   Sale(55)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö Ngò §éc, kh«ng thÓ mua vËt phÈm bæn gi¸o",0)
	return
else
   Sale(84)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö Ngò §éc, kh«ng thÓ mua vËt phÈm bæn gi¸o",0)
	return
else
   Sale(85)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö Ngò §éc, kh«ng thÓ mua vËt phÈm bæn gi¸o",0)
	return
else
   Sale(86)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 7 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö Ngò §éc, kh«ng thÓ thay ®æi x­ng hiÖu!",0)
	return
else
   Sale(65)
end
end