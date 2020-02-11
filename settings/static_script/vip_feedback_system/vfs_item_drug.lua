--¾«Á¦Íè
--µş¼ÓÊıÄ¿99£¬¿ÉÒÔ½»Ò×£¬Ê¹ÓÃºó¾«Á¦»Ø¸´100µã£¬IBÊÛ¼Û 100Xu
function OnUse(nItem)
	Say("Ng­¬i quyÕt ®Şnh sö dông Tinh Lùc Hoµn kh«ng?", 2, format("§ång ı/#ensure(%d)", nItem), "Kh«ng cÇn ®©u/do_nothing");
end

function ensure(nItem)
	local nCurrent, nMax = ModifyEnergy(0,1);
	if nCurrent < 0 or nMax < 0 or nCurrent == nMax then
		Msg2Player("Sö dông Tinh Lùc Hoµn thÊt b¹i");
		return 0;
	end
	if 1 == DelItemByIndex(tonumber(nItem), 1) then
		ModifyEnergy(100, 1);
	end
end

function do_nothing()
--do nothing
end