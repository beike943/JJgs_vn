Include("\\settings\\static_script\\missions\\hunduantongtianding\\head.lua")

function enter(nType)
		local nMapID = tbHDTTD:Create();
		tbHDTTD:TeamEnter(nMapID,nType);
end

