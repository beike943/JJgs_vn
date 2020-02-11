Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	
function OnUse()
	if GetTask(TASK_EAT_SANXIAN) >= 10 then
		Say("B¹n ®· ¨n 10 Sñi c¶o ba mãn, t¸i sö dông sÏ v« hiÖu.",0)
		return 0
	end
	if DelItem(2,1,251,1) == 1 then
		WriteLog("[Ho¹t ®éng mïa xu©n (b¸nh tæ 3 mãn)]:"..GetName().." ®· sö dông mét b¸nh tæ 3 mãn.")
		ModifyPopur(1000)
		SetTask(TASK_EAT_SANXIAN,GetTask(TASK_EAT_SANXIAN)+1)
		Msg2Player("B¹n nhËn ®­îc 1000 ®iÓm tu luyÖn.")
	end
end