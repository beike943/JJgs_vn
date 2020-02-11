--脚本名称：IB消耗回调
--脚本功能：玩家再IB消费以后，将玩家的IB消费进行按月的统计
--策划人：强哥
--代码开发人：村长
--代码开发时间：2008-01-12
--代码修改记录：
Include("\\script\\task_access_code_def.lua")

	IB_cost_month_seq = 1418
	IB_cost_num = 1419
	
	IB_cost_cur_month=3196

function ib_status_relay_ret(price)
	local nIBCostCurMonth = GetTask(IB_cost_cur_month)
	if nIBCostCurMonth < 2100000000 then
		local nIBCostCurMonthNew = nIBCostCurMonth+price
		SetTask(IB_cost_cur_month, nIBCostCurMonthNew, TASK_ACCESS_CODE_MONTHLY_IB)
	end
	--local month_seq_saved = GetTask(IB_cost_month_seq)
	--local month_seq_now = tonumber(date("%Y%m"))
	--if month_seq_now > month_seq_saved then
		--SetTask(month_seq_saved,month_seq_now)
		--SetTask(IB_cost_num,price)
	--else
		SetTask(IB_cost_num,(GetTask(IB_cost_num)+price))
	--end
end
