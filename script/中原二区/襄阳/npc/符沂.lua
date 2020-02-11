Include("\\script\\online_activites\\head\\activity_kill_npc_task.lua")

function main(bTag)
	if g_akct_GetTaskStep(bTag) then
		return
	end
	
	Talk(1,"","Hõm… mäi ng­êi ®Òu nãi trong s¸ch cã hoµng kim, ta ®äc s¸ch bao nhiªu n¨m nay cã thÊy g× ®©u!");
end;