-- ¾üÓÃÍ³³ïÊé£¬¾üÓÃÊÕ¼¯Êé

TASK_IB_BOOK1 = 1737

tTab =
{
	{2,	1,	1028, "Qu©n dông-thu thËp th­", 2},
	{2,	1,	1029, "Qu©n dông-Thèng trï th­", 5},
}

function OnUse(nidx)
	local nDay = tonumber(date("%w"))
	if not (nDay == 5 or nDay == 6) then
		Say("HiÖn kh«ng cã vËt liÖu qu©n dông, ®îi thø 6, thø 7 míi sö dông!", 0)
		return
	end
	
	local nItemIndex = tonumber(nidx)
	local nGenre, nDetail, nParticular = GetItemInfoByIndex(nItemIndex)
	local nTabIndex = 0
	for index, value in tTab do
		if value[1] == nGenre and value[2] == nDetail and value[3] == nParticular then
			nTabIndex = index
			break
		end
	end
	
	if nTabIndex == 0 then
		return
	end
	
	Say("B¹n muèn dïng"..tTab[nTabIndex][4].."? Nã cã thÓ gióp b¹n t¨ng tû lÖ cã ®­îc vËt liÖu qu©n dông"..tTab[nTabIndex][5].."lÇn.", 2, "§óng/#yes_use("..nTabIndex..")", "Sai/no_use")
end

function yes_use(nTabIndex)

	local nValue = GetTask(TASK_IB_BOOK1)
	local nDate = mod(nValue, 1000000)
	local nProbability = floor(nValue / 1000000)
	local nNow = tonumber(date("%y%j"))
	
	if nDate >= nNow and nProbability == tTab[nTabIndex][5] then
		Say("H«m nay b¹n ®· sö dông"..tTab[nTabIndex][4].."Ngµy mai h·y quay l¹i!", 0)
	elseif nDate >= nNow and nProbability < tTab[nTabIndex][5] then
		Say("B¹n muèn dïng qu©n dông-thèng trï th­?", 2, "§óng/yes_use_2", "Sai/no_say")
	elseif nDate >= nNow and nProbability > tTab[nTabIndex][5] then
		Say("B¹n ®· dïng qu©n dông-thèng trï th­ kh«ng cÇn dïng qu©n dông-thu thËp th­.", 0)
	elseif nDate < nNow then
		if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], 1) == 1 then
			local nDate = tonumber(date("%y%j"))
			SetTask(TASK_IB_BOOK1, tTab[nTabIndex][5] * 1000000 + nNow)
			Msg2Player("B¹n ®· sö dông 1 "..tTab[nTabIndex][4])
		end
	end
end

function yes_use_2()
	if DelItem(2, 1, 1029, 1) == 1 then
		local nDate = tonumber(date("%y%j"))
		SetTask(TASK_IB_BOOK1, 5 * 1000000 + nDate)
		Msg2Player("B¹n ®· sö dông 1 qu©n dông-thèng trï th­")
	end
end

function no_say()

end
