
t_item_cfg =
{
	[30557] = {145, 146, 147, "千变金卷"},
	[30558] = {148, 149, 150, "千变银卷"},
	[30559] = {151, 152, 153, "千变铜卷"},
}
ITEM_G=2
ITEM_D=1
--coat = 1
COLLECTION_TYPE=1

function OnUse(id)
	local g = GetItemGenre(id)
	local d = GetItemDetail(id)
	if g == ITEM_G and ITEM_D == 1 then
		local p = GetItemParticular(id)
		local t = t_item_cfg[p]
		if t then
    		local szMsg = format("你确定要使用这个外观[%s]吗？", t[4])
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
	local t = t_item_cfg[nItemP]
	if t then
		if 1 ~= _is_collected(t) then
			local nDelResult = DelItem(ITEM_G, ITEM_D, nItemP, 1)
			if 1 == nDelResult then
				SetPlayerCollectionData(COLLECTION_TYPE, t[1], 1)
				SetPlayerCollectionData(COLLECTION_TYPE, t[2], 1)
				SetPlayerCollectionData(COLLECTION_TYPE, t[3], 1)
				Msg2Player(format("你成功地保存了时装外观[%s]", t[4]))
			end
		else
			Say(format("该外观已保存成功[%s],无法再次使用！", t[4]), 0)
		end
	end
end

function _is_collected(t)
	if t then
		for i=1,3 do
			if GetPlayerCollectionData(COLLECTION_TYPE, t[i]) > 0 then
				return 1
			end
		end
	end
	return 0
end

function no()
end


