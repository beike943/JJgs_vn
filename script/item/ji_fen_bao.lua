--脚本名称：楚国密令使用脚本
--脚本功能：使用此物品，给玩家增减1000个信物
--脚本策划人：小天天
--代码开发人：村长
--代码开发时间：2007年6月11日
--代码修改记录：

	keepsake_num_TaskID = 1227

function OnUse()
	Say("<color=green>注意<color>:使用这个物品可以增加<color=yellow>1000<color>个<color=yellow>信物<color>,你可以拿着这个<color=yellow>信物<color>到<color=green>XX部落<color>旁边的<color=green>野生管<color>兑换<color=yellow>桂花糕材料<color>。确定要使用吗?",
	2,
	"同意使用/use_dtm",
	"让我想想/end_dialog"
	)
end
function use_dtm()
	--携带检测
	if GetItemCount(2,1,1142) == 0 then
		Talk(1,"","<color=green>注意<color>:请确认你有<color=yellow>个楚国密令<color>!")
		return
	end
	--删除检测
	if DelItem(2,1,1142,1) ~= 1 then
		Talk(1,"","<color=green>注意<color>:请确认你有<color=yellow>个楚国密令<color>!")
		return
	end
	--信物增加
	SetTask(keepsake_num_TaskID,(GetTask(keepsake_num_TaskID)+1000))
	Msg2Player("恭喜你成功地增加了1000个信物,你可以到‘楚国XX部落’那看看,并使用它!")
end
