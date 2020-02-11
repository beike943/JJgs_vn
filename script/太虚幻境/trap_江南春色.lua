
TAIXU_TEAM_INDEX = 108		-- 记录队员进入时是队伍的哪个位置

function main()
	local nMapid = GetWorldPos()
	local nIndex = GetTaskTemp(TAIXU_TEAM_INDEX)
	-- 8个队员的相对偏移，保证trap后不会传送到同一点
	local tOffset =
	{
		{-2, 0},
		{-1, 0},
		{0, 0},
		{1, 0},
		{-2, 1},
		{-1, 1},
		{0, 1},
		{1, 1},
	}

	if nIndex > 0 and nIndex <= 8 then
		NewWorld(nMapid, 1625 + tOffset[nIndex][1], 3300 + tOffset[nIndex][2])
	else
		NewWorld(nMapid, 1627, 3301)
	end
	
	SetLogoutRV(1)						-- 中途中断后回城
	if nMapid == 2010 or nMapid == 1010 then
		SetFightState(0)
		SetDeathPunish(0)	
	else
		SetFightState(1)	
	end
	SetCreateTeam(1)					-- 关闭组队功能
	UseScrollEnable(0)					-- 禁止使用回城符
    InteractiveEnable(0)				-- 交互开关，0关闭，1打开
    StallEnable(0)		   				-- 摆摊开关
	ForbitTrade(1)						-- 禁止交易
	OpenFriendliness(0)					-- 不提升好感
	
end
