Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),2)
	if nEatNum >= 1000 then
		Say("C¶ ®êi ng­êi chØ cã thÓ ¨n ®­îc 1000 c¸i b¸nh tæ.",0)
		return 0
	end
	if DelItem(2,1,266,1) == 1 then
		ModifyReputation(5,0)
		Msg2Player("B¹n nhËn ®­îc 5 ®iÓm danh väng.")
		WriteLog("[Ho¹t ®éng mïa xu©n (¨n b¸nh tæ)]:"..GetName().."B¹n ®· ¨n 1 c¸i b¸nh tæ h¹t sen.")
		SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),2,nEatNum+1))
	end
end
