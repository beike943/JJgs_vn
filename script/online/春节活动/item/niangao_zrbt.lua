Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),4)
	if nEatNum >= 1000 then
		Say("C¶ ®êi ng­êi chØ cã thÓ ¨n ®­îc 1000 c¸i b¸nh tæ.",0)
		return 0
	end
	if DelItem(2,1,267,1) then
		ModifyPopur(300)
		Msg2Player("B¹n nhËn ®­îc 300 ®iÓm tu luyÖn.")
		WriteLog("[Ho¹t ®éng mïa xu©n (¨n b¸nh tæ)]:"..GetName().."B¹n ®· ¨n 1 c¸i b¸nh tæ ®­êng c¸t.")
		SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),4,nEatNum+1))
	end
end
