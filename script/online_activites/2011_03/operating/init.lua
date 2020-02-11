Include("\\script\\online_activites\\2011_03\\operating\\head.lua");

function ServerStartUp(nStartTime, nEndTime)
--	if gf_CheckEventDateEx2(nStartTime, nEndTime) == 1 then
--	end
end

function PlayerLogin(bExchangeComing, nStartTime, nEndTime)
	local nDate = tonumber(date("%y%m%d"))
	local nEventCheck = 1
	if nDate < 110401 or nDate > 110417 then
		nEventCheck = 0
	end
	
	if nEventCheck == 1 and bExchangeComing ~= 1 then
	    VET_201103_Operating_GivePlayerLoginItem();
	end
end

