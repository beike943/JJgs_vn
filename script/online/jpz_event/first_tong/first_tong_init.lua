
Include("\\script\\online\\jpz_event\\first_tong\\first_tong_head.lua")
Include("\\script\\online\\jpz_event\\first_tong\\mission_head.lua");

function main()
	if is_first_tong_jpz_open() == 1 then
		SubWorld = SubWorldID2Idx(HUASHAN_MAP_ID)
		if SubWorld >= 0 then
			OpenMission(MISSION_ID)
		end
	end
end

