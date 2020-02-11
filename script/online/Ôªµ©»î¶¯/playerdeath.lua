Include("\\script\\online\\Ôªµ©»î¶¯\\yuandan_head.lua")
function OnDeath(Launcher)
	SetDeathPunish(1)	--È·±£ÓÐËÀÍö³Í·££¨ËÀÁËÖ®ºó¿Ï¶¨»Ø³Ç£¬¼´¿Ï¶¨´¥·¢Àë¿ªµØÍ¼µÄ½Å±¾£©
	if GetTaskTemp(TASK_FLAG_FOLLOW) == 1 then
		KillFollower()
		SetTaskTemp(TASK_FLAG_FOLLOW,0)
		RemoveTitle(3,3)
		local npcFlag = CreateNpc("Tiªu s­-®èi tho¹i","Tiªu kú",GetWorldPos())
		SetNpcScript(npcFlag,"\\script\\online\\Ôªµ©»î¶¯\\Æì×Ó.lua")
		SetDeathScript("")	
	end
end

