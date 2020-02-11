
t_item_index =
{
	[199] = 1,
	[30490] = 2,
}
t_itemconfig = 
{
	--szName,g,d,p,nAddXu
	{"§¹i ng©n phiÕu",2, 1, 199, 100},
	{"Hoµng Kim §¹i Ng©n PhiÕu", 2, 1, 30490, 1000},
}

function OnUse(nItemIndex)
	local g = GetItemGenre(nItemIndex)
	local d = GetItemDetail(nItemIndex)
	if g == 2 and d == 1 then
		local p = GetItemParticular(nItemIndex)
		local nType = t_item_index[p] or 0
		local t = t_itemconfig[nType]
		if t then
			Say(format("X¸c ®Þnh dïng 1 %s ®æi %d Xu ?",t[1],t[5]), 2, format("§ång ý/#ensure(%d)", nItemIndex), "Hñy bá/do_nothing");
		end
	end
	
end

function ensure(nItemIndex)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ")
		return 1;
	end
		local g = GetItemGenre(nItemIndex)
	local d = GetItemDetail(nItemIndex)
	if g == 2 and d == 1 then
		local p = GetItemParticular(nItemIndex)
		local nType = t_item_index[p] or 0
		local t = t_itemconfig[nType]
		if t then
			if DelItem(2, 1, t[4], 1) == 1 then
				AddItem(2, 1, 30230, t[5]);
			end
		end
	end
end

function do_nothing()
end