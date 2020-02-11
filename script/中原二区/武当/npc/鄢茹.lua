function main()
	Say("B»ng h÷u t×m ta cã chuyÖn g×?",
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
   Sale(46)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Vâ §ang, sao cã thÓ mua vËt phÈm bÝ truyÒn cña bæn m«n?",0)
	return
else
   Sale(78)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Vâ §ang, sao cã thÓ mua vËt phÈm bÝ truyÒn cña bæn m«n?",0)
	return
else
   Sale(79)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Vâ §ang, sao cã thÓ mua vËt phÈm bÝ truyÒn cña bæn m«n?",0)
	return
else
   Sale(80)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 2 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö Vâ §ang, ®æi c¸ch x­ng h« th× cã liªn quan g×?",0)
	return
else
   Sale(63)
end
end