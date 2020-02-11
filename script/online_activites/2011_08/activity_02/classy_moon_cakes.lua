--=============================================
--create by liub 2011.8.2
--describe:Ô½ÄÏ°æ8ÔÂ·Ý»î¶¯ **ÉÏµÈÖÐÇïÔÂ±ý½Å±¾ÎÄ¼þ
--=============================================

Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\2011_08\\string.lua")

function OnUse(nItem)
	--Ê±¼äÅÐ¶Ï
	local nCurrentTime = GetTime()
	local nInTime = MkTime(2011,08,26,0,0,0)
	local nOutTime = MkTime(2011,10,03,0,0,0)
	if nCurrentTime > nOutTime or nCurrentTime < nInTime then
		Talk(1,"","VËt phÈm ®· qu¸ h¹n sö dông")
		return
	end
	if DelItemByIndex(nItem,1) ~= 0 then
		gf_Modify("Exp",250000)
		gf_Modify("Rep",3)
		SetTask(336,GetTask(336)+3)
		WriteLogEx(VET_201108_CAKE_LOG_TITLE, "nhËn 250 ngµn exp, 3 ®iÓm danh väng, 3 ®iÓm s­ m«n")
		Msg2Player("C¸c h¹ nhËn ®­îc 3 ®iÓm S­ M«n")
	end
end