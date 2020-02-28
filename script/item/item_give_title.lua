
t_tile_cfg =
{
	[30560] = {65, 1, 30, "越南道具30560"},
	[30561] = {65, 2, 30, "越南道具30561"},
	[30562] = {65, 3, 30, "越南道具30562"},
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
    		local szMsg = format("您确认要获得%d日[%s]吗？", t[3], t[4])
    		local tSay = 
        	{
        		format("同意/#ye_use(%d)", p),
        		"离开/no",
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
				Msg2Player(format("你成功了增加了%d头衔的有效[%s]日期", t[3], t[4]))
			end
		else
			Say(format("不能继续使用[%s]，该道具只能使用一次。", t[4]), 0)
		end
	end
end

function no()
end
