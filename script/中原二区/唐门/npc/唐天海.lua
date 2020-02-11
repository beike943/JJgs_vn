function main()
	Say("B»ng h÷u t×m ta cã viÖc g×?",
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
   Sale(48)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö §­êng M«n, kh«ng thÓ mua vËt dông bÝ truyÒn cña bæn m«n.",0)
	return
else
   Sale(69)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö §­êng M«n, kh«ng thÓ mua vËt dông bÝ truyÒn cña bæn m«n.",0)
	return
else
   Sale(70)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö §­êng M«n, kh«ng thÓ mua vËt dông bÝ truyÒn cña bæn m«n.",0)
	return
else
   Sale(71)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 5 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö §­êng M«n, ®æi c¸ch x­ng h« th× cã quan g×?",0)
	return
else
   Sale(60)
end
end