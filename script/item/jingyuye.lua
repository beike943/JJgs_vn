Include("\\script\\equip_shop\\equip_shop_head.lua")

function OnUse(nItem)
	local tSay = {
		format("1-2级技能商店/#show_equip_shop(%d)", 3047),
		format("3-4级技能商店#show_equip_shop(%d)", 3048),
		"取消/nothing",	
	}
	Say("选择您要更换的商店: ", getn(tSay), tSay);
end

function nothing()
	
end
