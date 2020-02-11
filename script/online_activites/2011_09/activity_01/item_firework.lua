--10ÔÂ»î¶¯Ãµ¹åÀñ»¨½Å±¾
--by liubo

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	--Ê±¼äÅÐ¶Ï
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,10,07,0,0,0)
	local nOutTime = MkTime(2011,11,07,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông")
		return
	end
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	end
end