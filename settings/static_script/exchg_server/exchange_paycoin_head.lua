--通用消耗金币机制
Include("\\script\\task_access_code_def.lua")

--记录扣金数目的任务变量（单位铜）
PC_COIN_TASK = 3134;

--跨回源服金币实现真正消耗
function pc_back_originalserver_pay()
	local nTotalValue = GetTask(PC_COIN_TASK);
	if nTotalValue > 0 then
		if Pay(nTotalValue) == 1 then
			SetTask(PC_COIN_TASK, 0, TASK_ACCESS_CODE_KUAFU_DRAG);
			WriteLog(format("[pc_back_originalserver_pay]\t%s\t%s\t%d", GetAccount(), GetName(), nTotalValue));
		end
	end
end