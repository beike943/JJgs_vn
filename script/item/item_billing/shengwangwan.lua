
--add by lizhi
-- Ç°3ÁÐÊÇÎïÆ·Àà±ð,µÚ4Î»ÊÇÊ±¼ä,µÚ5Î»ÊÇËÙ¶È / 100 = ¶àÉÙ±¶

-- ×¢Òâ£¬³õÊ¼»¯²Ù×÷ÒÆ¶¯µ½ \script\global\autoexec.lua ÖÐ£¡
tItemInfo =
{
	{2, 1, 1064, 480, 1, "Lôc ThÇn hoµn"},
	{2, 1, 1065, 480, 2, "C­êng Lôc ThÇn hoµn"},
	{2, 1, 1066, 480, 3, "Lôc ThÇn Tiªn ®¬n"},
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
	if GetReputation() < 3000 then
		Say("Danh väng cña b¹n kh«ng ®ñ 3000, kh«ng thÓ sö dông!"..tItemInfo[nTabIndex][6], 0)
		return
	end
	local UseLiushen = {
		"Sö dông 1 "..tItemInfo[nTabIndex][6]..". Cã thÓ nhËn ®­îc 8 giê "..tItemInfo[nTabIndex][6]..". Trong tr¹ng th¸i ñy th¸c rêi m¹ng b¹n sÏ nhËn ®­îc ®iÓm danh väng.",
		"B¹n ®ång ý dïng"..tItemInfo[nTabIndex][6].."?",
		"Sö dông "..tItemInfo[nTabIndex][6].."/UseLiushen",
		"§Ó ta nghÜ l¹i/no"
	}
	Say(UseLiushen[1]..UseLiushen[2],2,UseLiushen[3],UseLiushen[4])
end

function UseLiushen()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3])
	AskClientForNumber("use_ls_cb", 1, tonumber(nHave), "Sö dông bao nhiªu"..tItemInfo[nTabIndex][6].."?")
end

function use_ls_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tItemInfo[nTabIndex][1], tItemInfo[nTabIndex][2], tItemInfo[nTabIndex][3], nCount) == 1 then
		local nRet = EatLiushen(nTabIndex, tItemInfo[nTabIndex][4] * nCount)
		if nRet > 0 then
			Msg2Player("B¹n nhËn ®­îc "..tItemInfo[nTabIndex][6].." cã"..tItemInfo[nTabIndex][6].." thêi gian "..nRet.." phót ")
			--cdkey
			if 1 == nTabIndex then
				SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemLiuShen()");
			end
		end
	end
end

function no_say()

end
