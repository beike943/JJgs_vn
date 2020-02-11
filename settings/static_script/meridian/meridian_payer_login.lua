
--N_MERIDIAN_FIX_TIME = MkTime(2014,8,5, 0, 0, 0)
function onlogin_fix_meridian_attr_point_addon(bForce)
	local tAttrLimitAddOn = { 1200, 1400, 1600, 1800, 2000, 2200}
	local nBastAttrLimit = 999
	
	local nLastLogoutTime = GetLastLogoutTime()
	if nLastLogoutTime or not nLastLogoutTime then --if true
		local nMeridianLv = MeridianGetLevel()
		local nAttrLimit = tAttrLimitAddOn[nMeridianLv]
		if nAttrLimit then
			local nAttrLimitEx = nAttrLimit - nBastAttrLimit
			if GetStrengthMaxAddOn() < nAttrLimitEx then
    			SetStrengthMaxAddOn(nAttrLimitEx)
    			SetDexterityMaxAddOn(nAttrLimitEx)
    			SetVitalityMaxAddOn(nAttrLimitEx)
    			SetEnergyMaxAddOn(nAttrLimitEx)
    			SetObserveMaxAddOn(nAttrLimitEx)
    			
    			local nY,nM,nD,nH,nMin,nS = GmTime(nLastLogoutTime)
    			local nLastLogoutDate = nY*10000+nM*100+nD
    			local nLastLogoutTime = nH*10000+nMin*100+nS
    			local szMsg = format("Player %s max attr of meridian has been fixed to %d nLastLogoutTime=%d-%d nMeridianLv=%d"
    				, GetName(), nAttrLimitEx, nLastLogoutDate, nLastLogoutTime, nMeridianLv)
    			WriteLog(szMsg)
    			return 1
			end
		end
	end
end