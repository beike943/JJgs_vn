
t_tile_cfg =
{
	[30560] = {65, 1, 30, "Du HiÖp"},
	[30561] = {65, 2, 30, "¦ng D­¬ng"},
	[30562] = {65, 3, 30, "ChiÕn Cuång"},
}
ITEM_G=2
ITEM_D=1

function OnUse(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == ITEM_G and ITEM_D == 1 then
		local p = GetItemParticular(id)
		local t = t_tile_cfg[p]
		if t then
    		local szMsg = format("Ng­¬i x¸c nhËn muèn ®æi %d ngµy gia h¹n thêi gian [%s] danh hiÖu kh«ng?", t[3], t[4])
    		local tSay = 
        	{
        		format("§ång ý/#ye_use(%d)", p),
        		"Rêi khái/no",
        	}
        	Say(szMsg, getn(tSay), tSay)
		end
	end	
end

function ye_use(nItemP)
	local t = t_tile_cfg[nItemP]
	if t then
		if 1 ~= IsTitleExist(t[1], t[2]) then
			local nDelResult = DelItem(ITEM_G, ITEM_D, nItemP, 1)
			if 1 == nDelResult then
				AddTitle(t[1], t[2])
				SetTitleTime(t[1], t[2], GetTime() + t[3] * 24 * 60 * 60)
				SetCurTitle(t[1], t[2])
				Msg2Player(format("Ng­¬i nhËn ®­îc %d ngµy gia h¹n thêi gian [%s] danh hiÖu", t[3], t[4]))
			end
		else
			Say(format("§· cã [%s] danh hiÖu, kh«ng thÓ sö dông l¹i", t[4]), 0)
		end
	end
end

function no()
end
