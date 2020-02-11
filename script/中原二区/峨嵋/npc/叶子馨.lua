function main()
	Say("VÞ huynh ®Ö ®©y t×m ta cã viÖc g×?",
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
   Sale(45)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Nga My, mua vËt phÈm bÝ truyÒn cña bæn m«n lµm g×?",0)
	return
else
   Sale(72)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Nga My, mua vËt phÈm bÝ truyÒn cña bæn m«n lµm g×?",0)
	return
else
   Sale(73)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Nga My, mua vËt phÈm bÝ truyÒn cña bæn m«n lµm g×?",0)
	return
else
   Sale(74)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 3 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Nga My, thay ®æi x­ng h« th× cã liªn quan g×?",0)
	return
else
   Sale(61)
end
end