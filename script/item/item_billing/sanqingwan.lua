
--add by lizhi
-- Ç°3ÁÐÊÇÎïÆ·Àà±ð,µÚ4Î»ÊÇÊ±¼ä,µÚ5Î»ÊÇËÙ¶È / 100 = ¶àÉÙ±¶

-- ×¢Òâ£¬³õÊ¼»¯²Ù×÷ÒÆ¶¯µ½ \script\global\autoexec.lua ÖÐ£¡
tItemInfo =
{
	{2, 1, 1097, 480, 1, "Tam Thanh hoµn"},
	{2, 1, 1098, 480, 2, "C­êng Tam Thanh hoµn"},
	{2, 1, 1099, 480, 3, "Tam Thanh Tiªn ®¬n"},
}

function OnUse(nidx)
	local nItemIndex = tonumber(nidx)
	local nTabIndex = 0
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	for index, value in tItemInfo do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break;
		end
	end

	if nTabIndex == 0 then
		return
	end
	
	SetTaskTemp(25, nTabIndex)
	local tUseSanqing = {
		"Sö dông 1 "..tItemInfo[nTabIndex][6]..". Cã thÓ nhËn ®­îc 8 giê "..tItemInfo[nTabIndex][6]..". ë tr¹ng th¸i ñy th¸c rêi m¹ng b¹n cã thÓ nhËn ®­îc ®é cèng hiÕn s­ m«n.",
		"B¹n ®ång ý dïng"..tItemInfo[nTabIndex][6].."?",
		"Sö dông "..tItemInfo[nTabIndex][6].."/UseSanqing",
		"§Ó ta nghÜ l¹i/no"
	}
	Say(tUseSanqing[1]..tUseSanqing[2],2,tUseSanqing[3],tUseSanqing[4])
end

function UseSanqing()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_sq_cb", 1, tonumber(nHave), "Sö dông bao nhiªu"..tItemInfo[nTabIndex][6].."?")
end

function use_sq_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatSanqin(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("B¹n nhËn ®­îc "..tItemInfo[nTabIndex][6].." cã"..tItemInfo[nTabIndex][6].." thêi gian "..nRet.." phót ")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemSanQing()");
			end
		end
	end
end

function no_say()

end
