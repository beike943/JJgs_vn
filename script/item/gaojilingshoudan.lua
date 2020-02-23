Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s 任务未完成，暂时无法打开！", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("当前队伍人数超过5人");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		CustomAwardGiveOne(CustomAwardSelectOne("gaojidan"));
	end
end
