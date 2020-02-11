--11ÔÂ»î¶¯É½²èÀñ»¨½Å±¾
--by liubo

Include("\\script\\online_activites\\head\\activity_normal_head.lua")
function OnUse(nItemIndex)
	local tbActivity,nItemSeq = gf_VnGetActivityByItemIndex(nItemIndex)
	if tbActivity then
		tbActivity:ItemPrizeOnUse(nItemIndex,nItemSeq)
	else
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông")
	end
end