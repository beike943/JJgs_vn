--脚本名称：月亮兔仙丹使用脚本
--脚本功能：使用月亮兔仙丹增加60个仙数量
--功能策划人：兔子
--功能开发人：村长
--功能测试人：洋葱
--代码开发时间：2008-12-11
--代码修改记录：
Elixir_chg_num = 60							--一个月亮仙丹兑换的数量
TaskID_elixer_num = 1263					--仙丹的数量
Elixer_num_max = 30000					--仙丹存放的最大数量

function OnUse(elixir_index)
	Say("<color=green>提示<color>：使用<color=yellow>月亮仙丹<color>可以让你自己的<color=yellow>仙丹<color>数量增加<color=yellow>"..Elixir_chg_num.."<color>个，您确认要使用吗？",
	2,
	"我确认要使用/elixir_use_dtm",
	"我再考虑考虑/end_dialog"
	)
end
--确认使用数量输入
function elixir_use_dtm()
	local num_max = GetItemCount(2,0,1042)
	AskClientForNumber("elixir_chg_dtm",1,num_max,"请输入您要兑换的数量")
end
--确认对话
function elixir_chg_dtm(num_enter)
	--携带检测
	if GetItemCount(2,0,1042) <num_enter then
		Talk(1,"","<color=green>提示<color>：您的<color=yellow>月亮仙丹<color>数量不足，请确认后重新使用！")
		return
	end
	--上限判断
	local elixir_num = GetTask(TaskID_elixer_num) + (num_enter *Elixir_chg_num)
	if elixir_num > Elixer_num_max then
		Talk(1,"","<color=green>提示<color>：您的<color=yellow>仙丹<color>数量已经达到上限：<color=red>"..Elixer_num_max.."<color>粒，请先到<color=yellow>凤翔<color>找<color=green>大考官兔总管<color>兑换掉再来使用吧！")
		return
	end
	--删除检测
	if DelItem(2,0,1042,num_enter) ~= 1 then
		Talk(1,"","<color=green>提示<color>：您的<color=yellow>月亮仙丹<color>数量不足，请确认后重新使用！")
		return
	end
	SetTask(TaskID_elixer_num,elixir_num)
	Talk(1,"","<color=green>提示<color>：使用后您增加了<color=yellow>".. (num_enter *Elixir_chg_num).."<color>粒仙丹，现在您的仙丹总数为<color=yellow>"..elixir_num.."<color>粒！")
end
--结束对话
function end_dialog()
end
