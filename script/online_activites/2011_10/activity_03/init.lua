--by liubo
--×ðÊ¦ÖØµÀ
Include("\\script\\online_activites\\2011_10\\activity_03\\teacher_day.lua")
function ServerStartUp(nStartTime,nEndTime)

end

function PlayerLogin(nExchangeComing,nStartTime,nEndTime)
	local nIndex1 =GetTrigger(2557)
	if nIndex1 ~= 0 then
		RemoveTrigger(nIndex1)
	end
	local nIndex2 = GetTrigger(2550)
	if nIndex2 ~= 0 then
		RemoveTrigger(nIndex2)
	end
	--ÅÐ¶Ï»î¶¯ÊÇ·ñ¿ªÆô
	if gf_CheckEventDateEx(44) ~= 1 then
		return 0
	end
	--ÊÇ·ñÊÇ¿ç·þ
	if nExchangeComing ~= 0 then
		--print("nExchangeComing")
		return 0 
	end
	--ÅÐ¶Ï´ÎÊý
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
	end
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.Times) >= VET_201111_MaxUsedCount then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.TriggerIndex,0)
		return 0
	end
	--´´½¨µÇ³ö´¥·¢Æ÷
	local nIndex = CreateTrigger(3,VET_201111_TEACHER_DAY_TBID,VET_201111_TEACHER_DAY_UFID)
	if nIndex == 0 then
		WriteLog("[Event]201111 event lÔ nhµ gi¸o, t¹o m¸y khëi ®éng thÊt b¹i")
		return 0
	end
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.TriggerIndex,nIndex)
	--´´½¨Ê±¼ä´¥·¢Æ÷
	nIndex = CreateTrigger(1, VET_201111_TEACHER_DAY_TBID1, VET_201111_TEACHER_DAY_UFID1) 
	if nIndex == 0 then
		WriteLog("[Event]201111 event lÔ nhµ gi¸o, t¹o m¸y khëi ®éng thÊt b¹i")
		return 0
	end
    ContinueTimer(GetTrigger(VET_201111_TEACHER_DAY_UFID1)) 
	--µÇÂ¼Ê±¼ÇÂ¼Ê±¼ä
	local nTime = GetTime()
	if VET_201111_TEACHER_DAY:GetTask(VET_201111_TEACHER_DAY.DaySeq) ~= zgc_pub_day_turn() then
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.DaySeq,zgc_pub_day_turn())
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.Times,0)
		VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.SpaceTime,0)		
	end
	VET_201111_TEACHER_DAY:SetTask(VET_201111_TEACHER_DAY.LoginInTime,nTime)
end