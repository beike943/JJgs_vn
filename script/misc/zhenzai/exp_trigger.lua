
-- êâÔÖ³ÆºÅ¼ÆÊ±Æ÷

function OnTimer()
	local theday = tonumber(date("%m%d"))
	if theday > 525 then
		return
	end

	if IsOfflineLive() == 1 then
		return
	end
	
	local level = GetLevel()
	local exp = level * level * 0.6
	ModifyExp(exp)
end
