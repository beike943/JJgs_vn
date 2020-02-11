
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

function OnDeath(Launcher)
	if PlayerIndex == GetTeamMember(0) then
		local nOldSubWorld = SubWorld;
		SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID);
		if SubWorld >= 0 then
			DelMSPlayer(MISSION_ID,0);
		end;
		SubWorld = nOldSubWorld;
	end
	return -1;
end;
