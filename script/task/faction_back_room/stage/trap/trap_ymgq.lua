--Author:Yim
--Date:2007.12.25 10:49
--Description:Map trap file
Include("\\script\\task\\faction_back_room\\back_room_function.lua");
function main()
	local nMapID = SubWorldIdx2ID(SubWorld);
	local nFaction = GetMissionV(MV_FACTION);	
	NewWorld(nMapID,TB_ENTRY_POS[nFaction][1],TB_ENTRY_POS[nFaction][2]);
end;