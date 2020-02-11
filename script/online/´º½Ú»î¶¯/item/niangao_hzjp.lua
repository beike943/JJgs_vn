Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")
function OnUse()
	local nEatNum = GetByte(GetTask(TASK_EAT_NIANGAO),1)
	if nEatNum >= 100 then
		Say("Ng­êi ch¬i tèi ®a chØ cã thÓ ¨n 100 c¸i b¸nh tæ.",0)
		return 0
	end
	INum = 35
	if GetEatDoubleCount() > INum - 1 then
		Msg2Player("TuÇn nµy b¹n ®· sö dông"..INum.." lÇn nh©n ®«i ®iÓm kinh nghiÖm, sö dông n÷a sÏ kh«ng cã hiÖu qu¶.");
	elseif GetExpScale() > 1 then
		Msg2Player("HiÖn giê linh khİ trêi ®Êt ®ang giao hßa, hiÖu qu¶ tu luyÖn ®¹t møc cao nhÊt, cho dï ¨n thªm b¸nh tæ nh©n t¸o còng kh«ng hiÖu qu¶.");
	else
		if DelItem(2,1,268,1) == 1 then
			DoubleExpTime(3600)
			Msg2Player("HiÖn giê b¾t ®Çu ®¸nh qu¸i nh©n ®«i kinh nghiÖm, sau 1 giê hiÖu qu¶ nh©n ®«i sÏ mÊt.")
			WriteLog("[Ho¹t ®éng mïa xu©n (¨n b¸nh tæ)]:"..GetName().."B¹n ®· ¨n 1 c¸i b¸nh tæ nh©n t¸o.")
			SetTask(TASK_EAT_NIANGAO,SetByte(GetTask(TASK_EAT_NIANGAO),1,nEatNum+1))
		end
	end
end
