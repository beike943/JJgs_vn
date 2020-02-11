
Include("\\script\\lib\\globalfunctions.lua") 
t_attr_info = {
	--new attr, new level, nGain, new line_id
	[1323001] = {601, 100},-->13284
	[1323002] = {612, 200},
	[1323003] = {623, 300},
	[1323101] = {602, 400},-->13285
	[1323102] = {613, 800},
	[1323103] = {624, 1200},
	[1323701] = {608, 5000},-->13286
	[1323702] = {619, 10000},
	[1323703] = {630, 15000},
}

function OnNpcTalk()
--	local nDate = tonumber(date("%Y%m%d"))
--	if not (nDate >= 20130810 and nDate <= 20130830) then--²»ÔÚ²¹³¥ÆÚ
--		Talk (1,"",format("²»ÔÚ²¹³¥ÓÐÐ§ÆÚ£¡"))
--		return
--	end
	
	_On_Repair()
	
--	local szTitle = format("ÎÒÓÐÊ²Ã´¿ÉÒÔ°ïÄãµÄÂð£¿")
--	local tbSay = {}
--	tinsert(tbSay, format("%s/_On_Repair","ÁìÈ¡ÊôÐÔ²¹³¥"))
--	tinsert(tbSay, "ËãÁË/no")
--	Say(szTitle, getn(tbSay), tbSay)
end

function _On_Repair()
	local szTitle = format("NhËn ®Òn bï cÇn ph¶i th¸o trang bÞ ra ®Æt vµo hµnh trang, ng­¬i ®· chuÈn bÞ xong ch­a?")
	local tbSay = {}
	tinsert(tbSay, format("%s/_confirm_repair","NhËn ®Òn bï"))
	tinsert(tbSay, "Tõ bá/no")
	Say(szTitle, getn(tbSay), tbSay)
end

function _confirm_repair()
	local tItems = GetRoomItems(2) --»ñÈ¡±³°üÖÐµÄµÀ¾ß
	local nGain = 0
	if tItems then
		for i=1, getn(tItems) do
			nGain = nGain + _repair_item(tItems[i])
		end
	end
	
	if nGain > 0 then
		--Msg2Player(format("Äú»ñµÃ%dXu²¹³¥", nGain))
		Talk (1,"",format("Ng­¬i nhËn ®­îc %dXu ®Òn bï !", nGain))
	else
		Talk (1,"",format("Ng­¬i kh«ng cã ®Òn bï ®Ó nhËn !"))
	end

	return nGain
end

function _repair_item(nIdx)
	local tItemInfo = GetItemFeedUpAttrs(nIdx)
	local tNewInfo = {-1,-1,-1,-1,-1,-1}
	local nGain = 0
	local tOldAttrs = {-1,-1,-1,-1,-1,-1}
	if tItemInfo then
		for i=1, getn(tItemInfo.tSocketInfo) do
			local tAttr = tItemInfo.tSocketInfo[i]
			local nAttrInfoIndex = tAttr.AttrId * 100 + tAttr.AttrLv
			tOldAttrs[i] = nAttrInfoIndex
			local t = t_attr_info[nAttrInfoIndex]
			if t then
				tNewInfo[i] = t[1]
				local nNewGain = t[2]
				nGain = nGain + nNewGain
				
				--print(format("idx=%d attr%d %d->%d gain %d\n", nIdx, i, nAttrInfoIndex, tNewInfo[i], nNewGain))
			end
		end
		
		if nGain > 0 then
			local nRoomNeed = floor((nGain + 999)/1000)
			if gf_Judge_Room_Weight(nRoomNeed, 1, nil) == 1 then
				SetItemFeedUpAttrs(nIdx, tNewInfo[1], tNewInfo[2], tNewInfo[3], tNewInfo[4], tNewInfo[5], tNewInfo[6])
    			--Earn(nGain)
    			AddItem(2,1,30230,nGain)
    			
    			local szLog = format("Account[%s] Role[%s] update item %s from[%d, %d, %d, %d, %d, %d]-->[%d, %d, %d, %d, %d, %d] gain %dXu",GetAccount(), GetName(), GetItemName(nIdx) 
    				, tOldAttrs[1], tOldAttrs[2], tOldAttrs[3], tOldAttrs[4], tOldAttrs[5], tOldAttrs[6]
    				, tNewInfo[1], tNewInfo[2], tNewInfo[3], tNewInfo[4], tNewInfo[5], tNewInfo[6]
    				, nGain
    				)
    			--print(szLog)
    			gf_WriteLogEx("repair item attr", szLog, "", "", "")
    		else
    			nGain = 0
    			Talk (1,"",format("Kh«ng gian hµnh trang kh«ng ®ñ %d, xin h·y chØnh ®èn l¹i!", nRoomNeed))
    			return 0
			end
		end
	end
	return nGain
end

function no()
end
