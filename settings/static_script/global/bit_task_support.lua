Include("\\script\\task_access_code_def.lua")
--player bit task support
_N_BIT_TASK_INDEX_BEGIN= 1
N_BIT_TASK_INDEX_SHOW_QIANBIANHE_MSG = _N_BIT_TASK_INDEX_BEGIN + 0


--_N_BIT_TASK_INDEX_END= 32

function bt_GetBitTask(nIndex)
	local nTaskId,nBitIndex = _get_task_and_bit_index(nIndex)
	if nTaskId and nBitIndex then
		return SafeGetBit(GetTask(nTaskId), nBitIndex)
	end
	print(format("bt_GetBitTask(%d) parameter error", nIndex))
	return 0
end

function bt_SetBitTask(nIndex,nValue)
	local nTaskId,nBitIndex = _get_task_and_bit_index(nIndex)
	if nTaskId and nBitIndex then
		local nTaskVal = GetTask(nTaskId)
		local nTaskValNew = SafeSetBit(nTaskVal, nBitIndex, nValue)
		return SetTask(nTaskId, nTaskValNew, N_TASK_ACCESS_CODE)
	end
	print(format("bt_SetBitTask(%d,%d) parameter error", nIndex, nValue))
	return 0
end


N_TASK_ACCESS_CODE = TASK_ACCESS_CODE_BIT_TASK
t_task_config =
{
	3123,
}
function _get_task_and_bit_index(nIndex)
	if nIndex >= 1 and  nIndex <= getn(t_task_config) * 32 then
		local nBitIdx = nIndex - 1
		n = floor(nBitIdx / 32) + 1
		idx = mod(nBitIdx, 32) + 1
		return t_task_config[n],idx
	end
end