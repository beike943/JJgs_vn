Include("\\script\\lib\\globalfunctions.lua");
--Include("\\script\\task\\global_task\\gtask_head.lua")

function OnUse(nItem)
	if gf_CheckVeitPetTaskFinish() ~= 1 then
		Say(format("%s还没有完成劳动义务，暂时无法开业！", gf_GetPlayerSexName()), 0);
		return 0;
	end
	if GetPetCount() >= 5 then
		Msg2Player("目前同伴人数超过5人");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		CustomAwardGiveOne(CustomAwardSelectOne("dijidan"));
	end
end
