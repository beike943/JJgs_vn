Include("\\script\\task\\global_task\\gtask_head.lua");

function main()
	if GetItemCount(2, 0, 30065) > 0 and GetTask(3133) == 0 then
		--持有天师符，并且没有完成过任务
		Talk(1, "", "<color=yellow>天元法阵: <color> 你使用了天师符, 天元法阵已激活.");
		SetTask(3133, 1);
		SetCurrentNpcSFX(GetTargetNpc(), 921, 1, 0, 18 *3);
		TaskTip("天元法阵已重新激活并封印了妖狐,回去找马不前");
		Msg2Player("天元法阵已重新激活并封印了妖狐,回去找马不前");
		return 0;
	end
	Talk(1,"","把天师符贴到石柱上，才能激活天元法阵, 并重新封印妖狐");
end
