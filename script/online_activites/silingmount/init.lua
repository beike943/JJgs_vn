Include("\\script\\online_activites\\silingmount\\npc\\spwan.lua");

function ServerStartUp(startTime, endTime)
	do	return	end
	VET_AddSilingMaster();
	VET_AddSilingComposer();
end

function PlayerLogin(exchangeComing, startTime, endTime)
end