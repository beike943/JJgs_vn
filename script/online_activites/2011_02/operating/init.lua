Include("\\script\\online_activites\\2011_02\\operating\\head.lua");

function ServerStartUp(nStartTime, nEndTime)
	if gf_CheckEventDateEx2(nStartTime, nEndTime) == 1 then
	end
end

function PlayerLogin(bExchangeComing, nStartTime, nEndTime)
	if gf_CheckEventDateEx(VET_201102_OPERATING_ACTIVITY_ID) == 1 and bExchangeComing ~= 1 then
	    VET_201102_Operating_GivePlayerLoginItem();
	end
end

