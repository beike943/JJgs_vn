Include("\\script\\task_access_code_def.lua")
Include("\\settings\\static_script\\meridian\\meridian_level_update_condition.lua")

TASK_ID_LAST_MONTH_CONSUMME = 3197

t_ib_level = {
	--min,max,trans_level_min
	{0, 0, 90,},
	{1, 4000,},
	{4001, 12000,},
	{12001, 30000,},
	{30001, 90000,},
	{90001, 180000,},
	{180001, 2100000000,},
}

function gf_GetTransLevel()
	local nTrans = gf_GetTransCount()
	return nTrans*99 + GetLevel()
end

function ib_get_last_month_consume_level()
	local nRet = 0
	local nConsume = GetTask(TASK_ID_LAST_MONTH_CONSUMME)
	for i,v in t_ib_level do
		if nConsume >= v[1] then
			if nConsume <= v[2] then
				if not v[3] or gf_GetTransLevel() >= v[3] then
					nRet = i
				end
				break
			end
		else
			break
		end
	end
	return nRet
end