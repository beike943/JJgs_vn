
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII ÑîÃÅÃÅÅÉÈÎÎñÑîÅÅ·ç½Å±¾ÎÄ¼ş
-- Edited by peres
-- 2005/02/17 PM 18:03

-- ======================================================

function main()
	Say("VŞ huynh ®Ö nµy t×m ta cã viÖc g× kh«ng?",
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
   Sale(51)
end	

function ChujitaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña D­¬ng M«n sao l¹i mua vËt phÈm bİ truyÒn cña bæn m«n?",0)
	return
else
   Sale(81)
end
end
function ZhongtaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña D­¬ng M«n sao l¹i mua vËt phÈm bİ truyÒn cña bæn m«n?",0)
	return
else
   Sale(82)
end
end
function GaotaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng­¬i kh«ng ph¶i lµ ®Ö tö cña D­¬ng M«n sao l¹i mua vËt phÈm bİ truyÒn cña bæn m«n?",0)
	return
else
   Sale(83)
end
end
function ChenghaoBuy()
	if GetPlayerFaction() ~= 6 then
		Say("Ng­¬i kh«ng ph¶i ®Ö tö D­¬ng M«n, d¸m lõa g¹t ta µ?",0)
	return
else
   Sale(64)
end
end
