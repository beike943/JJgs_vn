Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\misc\\taskmanager.lua") 

function OnUse(nItem)
	if gf_CheckEventDateEx(80) ~= 1 then
		return 0;
	end
	local g_TaskGroup = TaskManager:Create(9,4);
	if g_TaskGroup:GetTask(8) >= 6800 then
		Talk(1,"","'B¹n ®· sö dông tèi ®a <color=green>6800<color> bao L× X× N¨m Míi");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		gf_Modify("Exp", 666888);
		g_TaskGroup:SetTask(8, g_TaskGroup:GetTask(8) + 1);
		Msg2Player(format("sö dông 'L× x× n¨m míi' %d lÇn", g_TaskGroup:GetTask(8)));
		if g_TaskGroup:GetTask(8) == 6800 then
			gf_SetTaskByte(2731, 2, 1)
		end
	end
end