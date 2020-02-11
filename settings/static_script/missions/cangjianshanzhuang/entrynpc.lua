Include("\\settings\\static_script\\missions\\cangjianshanzhuang\\head.lua")

--function main()
--	if ttd_isCaption() ~= 1 then
--		Talk(1,"","请组队且由队长组织进入！");
--		return 0;
--	end
--	enter(1)
--end

function enter(nType)
--	tbHDTTD.msOption.bSetPkCamp = 0;
--	local nMapID = mf_GetMissionV(tbHDTTD.missionID,MV_MAP_ID,tbHDTTD.realMapID);
--	if nMapID ~= 0 then
--		tbHDTTD:Enter(nMapID,nType);
--	else
		local nMapID = tbJZMY:Create();
		tbJZMY:TeamEnter(nMapID,nType);
--	end
end

