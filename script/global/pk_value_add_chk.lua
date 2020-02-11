-- 杀人后是否增长PK值
-- 2007-5-9 10:23

-- 返回1则不增长，返回其他则增长

-- 各大城市城郊对应城市
tMapIDMap =
{
	[105] = 100,			-- 泉州府西
	[108] = 100,			-- 泉州府北
	[301] = 300,			-- 成都府西
	[304] = 300,			-- 成都府南
	[308] = 300,			-- 成都府北
	[312] = 350,			-- 武当
	[218] = 350,			-- 灵宝山
}

function IsAddPKValue()
	local szTongName = GetTongName()
	local nMapID = GetWorldPos()
	local nCityID = tMapIDMap[nMapID]
	if nCityID == nil then
		return 0
	end
	local szCityWarTong = GetCityWarInfo(nCityID, "base")
	if szCityWarTong == szTongName then
		return 1
	end
	return 0
end
