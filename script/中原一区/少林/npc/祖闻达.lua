function main()
	Say("VÞ huynh ®Ö nµy t×m ta cã viÖc g× kh«ng?",
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
   Sale(44)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ThiÕu L©m sao l¹i mua vËt phÈm bÝ truyÒn cña bæn ph¸i?",0)
	return
else
   Sale(66)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ThiÕu L©m sao l¹i mua vËt phÈm bÝ truyÒn cña bæn ph¸i?",0)
	return
else
   Sale(67)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña ThiÕu L©m sao l¹i mua vËt phÈm bÝ truyÒn cña bæn ph¸i?",0)
	return
else
   Sale(68)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 1 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö ThiÕu L©m sao d¸m lõa g¹t ta?",0)
	return
else
   Sale(59)
end
end