--师门真卷包
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\activity_head.lua")

function OnUse(nItem)
	if gf_Judge_Room_Weight(1, 10," ") ~= 1 then
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		ahf_GetGaojiZhenjuan(0, 1, 1);
	end
end