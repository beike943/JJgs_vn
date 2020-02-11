-- 初始化排行榜时回调的函数
-- 任务变量使用说明
-- 763 记录在玩家身上的衰减周数
-- 764 记录玩家本周的排名,如果未进100名,则设置为999
-- 765 记录玩家获得元帅的次数(不分宋辽,只要是元帅就算)
-- 766 记录玩家获得将军的次数(不分宋辽)
-- 767 记录玩家获得先锋的次数
-- 768 记录资格审核军衔的周数


function OnBattleDataArrive(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildNewBattleRank(szKey, nKey1, nKey2, 1)
	end
end

function OnBattleDataInit(szKey, nKey1, nKey2, nCount)
	if szKey ~= "" then
		BuildNewBattleRank(szKey, nKey1, nKey2, 0)
	end
end

-- 少加一个文件了,同为战场的就也放在这里吧

function UpdateBattleMaxRank()
	-- 更新宋辽的最高军衔
	local nCurrRank = GetTask(704)
	if nCurrRank < 0 then	-- 更新辽方
		local nPreRank = GetTask(746)
		if nCurrRank < nPreRank then
			SetTask(746, nCurrRank)
		end
	elseif nCurrRank > 0 then	-- 更新宋方
		local nPreRank = GetTask(745)
		if nCurrRank > nPreRank then
			SetTask(745, nCurrRank)
		end
	end
end

function CalcBattleNoInRank()
	local song_or_liao = 1
	local nTaskValue = GetTask(701)
	if nTaskValue < 0 then
		nTaskValue = -nTaskValue;
		song_or_liao = -1
	end
	
	if nTaskValue >= 50000 then
		SetTask(704, 3 * song_or_liao)	-- 都统
	elseif nTaskValue >= 15000 then
		SetTask(704, 2 * song_or_liao)	-- 校尉
	else
		SetTask(704, 1 * song_or_liao)	-- 士兵
	end
end

function CalcBattleRank()
	local flag, GIsGlbRealm = GetRealmType();
	if GIsGlbRealm ~= 0 then --不在原服
		return 0
	end
	
	local nWeeks, nRank, nPoint = GetPlayerRank()
	
	if nRank == nil then	-- 排名未进100名
		SetTask(764, 999)
	elseif nRank > 0 then
		SetTask(764, nRank)
	else
		SetTask(764, -nRank)
	end
	
	local nBodyWeeks = GetTask(763)
	if nWeeks == nBodyWeeks or				-- 如果评过了
		nWeeks == -1 then					-- 如果没有数据就保持原样
		return
	end
	
	if nBodyWeeks - nWeeks > 1 then			-- 如果跨区并服产生的变化
		SetTask(768, nWeeks - 1)
		SetTask(763, nWeeks)
		return
	end
	
	SetTask(763, nWeeks)	-- 标识本周已经排过名次了
	
	local t =
	{
		{1, 250000, 6, 0},	--1
		{8, 120000, 5, 0},	--8个将军
		{10, 80000, 4, 0},	--10
		{1000,50000,3,0},
		{1000,15000,2,0},
		{1000,0,1,0},
	}
	local song_or_liao = 1
	
	if nRank == nil or nRank > t[1][1] + t[2][1] + t[3][1] then
		CalcBattleNoInRank()
		return
	end
	
	if nRank < 0 then
		nRank = -nRank
		song_or_liao = -1
	end
	
	local tPlayer = {}
	for i=0, nRank - 1 do
		tPlayer[i+1] = GetRankByIndex(song_or_liao, i)
	end
	
	local n = 1
	for i = 1, getn(tPlayer) do
		for j = n, getn(t) do
			if tPlayer[i] >= t[j][2] and t[j][4] < t[j][1] then
				t[j][4] = t[j][4] + 1
				n = j
				break
			end
		end
	end

	SetTask(704, t[n][3] * song_or_liao)
end
