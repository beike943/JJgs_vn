TASKVAL_BAIJUWAN	= 2501		-- 该任务变量保存白驹丸的剩余时间（分钟）
TASKVAL_BAIJUWAN1 	= 2507		-- 大白驹丸的时间
TASKVAL_BAIJUWAN2 	= 2508		-- 白驹仙丹的时间
BAIJUWAN_TIME		= 8 * 60	-- 一个白驹丸的时间是8个小时（单位是分钟）

tTab =
{
	{2, 1, 270, "白驹丸", 2501},
	{2, 1, 1007, "大白驹丸", 2507},
	{2, 1, 1008, "白驹仙丹", 2508},
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
		"使用 1"..tTab[nTabIndex][4].."可获得委托8小时"..tTab[nTabIndex][4].."的离线经验。",
		"你现在有".. GetTask(val) .."分钟"..tTab[nTabIndex][4].."你想用吗"..tTab[nTabIndex][4].."?",
		"使用"..tTab[nTabIndex][4].."/UseBaiJuWan",
		"让我想想/no"
	}
	Say(UseBaiju[1]..UseBaiju[2],2,UseBaiju[3],UseBaiju[4])
end

function UseBaiJuWan()
	local nTabIndex = GetTaskTemp(25)
	local nHave = GetItemCount(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3])
	AskClientForNumber("use_bj_cb", 1, tonumber(nHave), "使用多少个"..tTab[nTabIndex][4].."?")
end

function use_bj_cb(nCount)
	local nTabIndex = GetTaskTemp(25)
	if DelItem(tTab[nTabIndex][1], tTab[nTabIndex][2], tTab[nTabIndex][3], nCount) == 1 then
		local value = GetTask(tTab[nTabIndex][5]) + BAIJUWAN_TIME * nCount
		SetTask(tTab[nTabIndex][5], value)
		Say("使用时间"..tTab[nTabIndex][4].."你的<color=yellow>" .. value .. "<color>分钟", 0)
		--cdkey
		if 1 == nTabIndex then
			SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_UseItemBaiJu()");
		end
	end
end

function no()
end
