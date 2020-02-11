--Ê¥µ®ÀñÎï½Å±¾

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	--Ê±¼äÅÐ¶Ï
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,12,16,0,0,0)
	local nOutTime = MkTime(2012,01,09,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông")
		return
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end