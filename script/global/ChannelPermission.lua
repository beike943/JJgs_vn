Include("\\script\\lib\\get_managed_viet_string.lua")
-- ¼ì²âÔÚÆµµÀÖĞÊÇ·ñÄÜËµ»°

t_chat_consume=
{	--[nChannelType] = {item{name,g,d,p,n}, money}
	[2] = {{"Thiªn Lı TruyÒn ¢m Phï", 2,1,3508,5},100000,},	--¹«ÁÄ
	[8] = {{"Thiªn Lı TruyÒn ¢m Phï", 2,1,3508,1},10000,},	--ÅÉÁÄ
}

function OnCheck(nChannelType)
	if nChannelType == 2 or nChannelType == 8 then	-- ¹«ÁÄºÍÅÉÁÄ
		local nMapID = GetWorldPos()
		if nMapID == 701 then
			Msg2Player("Trong ®¹i lao kh«ng ®­îc dïng kªnh chat c«ng céng vµ kªnh m«n ph¸i")
			return 0
		end
	end
	
	local t = t_chat_consume[nChannelType]
	if t then
		local g,d,p,n = t[1][2], t[1][3], t[1][4], t[1][5]
		if DelItem(g,d,p,n) == 1 then
			return 1
		end
		local money = t[2]
		local ok = Pay(money)
		if ok and ok == 1 then
			return 1
		else
			local gold = floor(money / 10000)
			Msg2Player(format(getManagedVietString(VIET_STR_ID_MONEY_NOT_ENOUGH), gold))
			return 0
		end
	end
	return 1
end