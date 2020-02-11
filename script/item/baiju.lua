TASKVAL_BAIJUWAN	= 2501		-- ¸ÃÈÎÎñ±äÁ¿±£´æ°×¾ÔÍèµÄÊ£ÓàÊ±¼ä£¨·ÖÖÓ£©
TASKVAL_BAIJUWAN1 	= 2507		-- ´ó°×¾ÔÍèµÄÊ±¼ä
TASKVAL_BAIJUWAN2 	= 2508		-- °×¾ÔÏÉµ¤µÄÊ±¼ä
BAIJUWAN_TIME		= 8 * 60	-- Ò»¸ö°×¾ÔÍèµÄÊ±¼äÊÇ8¸öÐ¡Ê±£¨µ¥Î»ÊÇ·ÖÖÓ£©

tTab =
{
	{2, 1, 270, "B¹ch C©u Hoµn", 2501},
	{2, 1, 1007, "§¹i B¹ch C©u hoµn", 2507},
	{2, 1, 1008, "B¹ch C©u Tiªn ®¬n", 2508},
}

function OnUse(idx)
	local nItemIndex = tonumber(idx)
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
	
	SetTaskTemp(25, nTabIndex)
	local val = tTab[nTabIndex][5]
	local UseBaiju = {
		"Sö dông 1 "..tTab[nTabIndex][4]..". Cã thÓ nhËn ®­îc 8 giê "..tTab[nTabIndex][4]..". ñy th¸c rêi m¹ng t¨ng kinh nghiÖm.",
		" HiÖn b¹n cßn ".. GetTask(val) .." phót "..tTab[nTabIndex][4]..". B¹n muèn sö dông"..tTab[nTabIndex][4].."?",
		"Sö dông "..tTab[nTabIndex][4].."/UseBaiJuWan",
		"§Ó ta nghÜ l¹i/no"
	}
	Say(UseBaiju[1]..UseBaiju[2],2,UseBaiju[3],UseBaiju[4])
end

function UseBaiJuWan()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3])
	AskClientForNumber("use_bj_cb", 1, tonumber(nHave), "Sö dông bao nhiªu"..tTab[nTabIndex][4].."?")
end

function use_bj_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], nCount) == 1 then
		local value = GetTask(tTab[nTabIndex][5]) + BAIJUWAN_TIME * nCount
		SetTask(tTab[nTabIndex][5], value)
		Say("Thêi gian sö dông"..tTab[nTabIndex][4].."cña b¹n cßn <color=yellow>" .. value .. "<color> phót !", 0)
		--cdkey
		if 1 == nTabIndex then
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemBaiJu()");
		end
	end
end

function no()
end
