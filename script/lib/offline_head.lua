OFFLINE_EXP_TIME = 2288
LAST_GET_OFFLINE_EXP_DATE = 2289
OFFLINE_EXP_MASK = 2290
function SCCheckCanGetOfflineExp()
	local bWantOfflineLiveExp = 0
	local nNowHour = tonumber(date("%H"))
	if (nNowHour >= 18) then
		local nLastGetTime = GetTask(LAST_GET_OFFLINE_EXP_DATE)
		local nThisGetTime = tonumber(date("%Y%m%d"))
		if (nThisGetTime ~= nLastGetTime) then
			bWantOfflineLiveExp = 1
		end
	end
	return bWantOfflineLiveExp
end
function SCCheckOfflineExp(nType)
	local nLastGetTime = GetTask(LAST_GET_OFFLINE_EXP_DATE)
	local nThisGetTime = tonumber(date("%Y%m%d"))
	if (nThisGetTime ~= nLastGetTime) then
		local nMask = GetTask(OFFLINE_EXP_MASK)
		nMask = SetBit(nMask, nType, 1)
		nMask = SetBit(nMask, 2, 1)
		nMask = SetBit(nMask, 3, 1)
		nMask = SetBit(nMask, 4, 1)
		nMask = SetBit(nMask, 5, 1)
		SetTask(OFFLINE_EXP_MASK, nMask)
		if (nMask == 31) then
			SetTask(LAST_GET_OFFLINE_EXP_DATE, nThisGetTime)
			SetTask(OFFLINE_EXP_TIME, 960)
			SetTask(OFFLINE_EXP_MASK, 0)
		end
	else
		SetTask(OFFLINE_EXP_MASK, 0)
	end
end
