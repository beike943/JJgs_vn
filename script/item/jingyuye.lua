Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		format("TiÖm S¸ch Kü N¨ng CÊp 1-2/#show_equip_shop(%d)", 3047),
		format("TiÖm S¸ch Kü N¨ng CÊp 3-4/#show_equip_shop(%d)", 3048),
		"Hñy bá/nothing",	
	}
	Say("H·y chän tiÖm cÇn ®æi: ", getn(tSay), tSay);
end

function nothing()
	
end