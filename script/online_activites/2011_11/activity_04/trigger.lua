--by liubo
--装饰圣诞树活动触发脚本
Include("\\script\\online_activites\\2011_11\\activity_04\\decorate_tree.lua")

function OnTimer()
	if GetTime() - VET_201111_DECORATETREE_TASK:GetTask(VET_201111_DECORATETREE_TASK.TimeSpace) >= VET_201111_TREE_EXITSTIME then
		VET_201111_DECORATETREE_TASK:SetTask(VET_201111_DECORATETREE_TASK.IsCreate,0)
		RemoveTrigger(GetTrigger(VET_201111_TRIGGER_UFID))
	end
end