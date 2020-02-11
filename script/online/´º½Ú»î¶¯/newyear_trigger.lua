--filename:newyear_trigger.lua
--create date:2006-01-06
--author:yanjun
--describe:´º½Ú»î¶¯´¥·¢Æ÷
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")

function material_killed()
	--20¼¶ÖÁ50¼¶¹ÖÎïµôÂä
	--¸ÅÂÊË¥¼õ=µ±Ç°¸ÅÂÊ*£¨1-(Íæ¼ÒµÈ¼¶-¹ÖÎïµÈ¼¶)/70£©
	local nHour = tonumber(date("%H"))
	local N	--Ë¥¼õÏµÊý
	if nHour >= 0 and nHour <= 9 then --0µãµ½10µã²»µô²ÄÁÏ¡£
		N = 0
	elseif nHour >=12 and nHour <= 21 then
		N = 1
	else
		N = 0.25
	end 
	local npcIndex = GetTriggeringUnit()
	local npcLevel = GetUnitBaseStates(npcIndex,0)
	local Quotiety 
	if GetLevel() > npcLevel then
		Quotiety = 1 - (GetLevel() - npcLevel)/70
	else
		Quotiety = 1
	end
	if npcLevel >= 20 and npcLevel <= 50 then
	local nTemp = random(1,1000000)
		if nTemp <= 300000*Quotiety*N then
			AddItem(2,1,255,1)	--Ãæ·Û
		elseif nTemp <= 580000*Quotiety*N then
			AddItem(2,1,256,1)	--Ê®ÈýÏã
		elseif nTemp <= 750000*Quotiety*N then
			AddItem(2,1,262,1)	--°×²Ë
		elseif nTemp <= 810000*Quotiety*N then
			AddItem(2,1,260,1)	--ÂÜ²·
		elseif nTemp <= 850000*Quotiety*N then
			AddItem(2,1,263,1)	--ÇÛ²Ë
		elseif nTemp <= 870000*Quotiety*N then
			AddItem(2,1,264,1)	--¾Â²Ë
		elseif nTemp <= 880000*Quotiety*N then
			AddItem(2,1,257,1)	--ÖíÈâ
		elseif nTemp <= 885000*Quotiety*N then
			AddItem(2,1,258,1)	--»¢Èâ
		elseif nTemp <= 887500*Quotiety*N then
			AddItem(2,1,259,1)	--ÏºÈÊ
		end
	end
end

function KillFollower_OnTimer()
	RemoveTrigger(GetRunningTrigger())
	KillFollower()
	SetTask(TASK_PET_BORN,0)
	Msg2Player("Qu¸ thêi gian, thó c­ng rêi khái b¹n.")
end

function LeaveSnowMap()
	SetDeathPunish(1)
	for SkillID=843,851 do
		RemoveSkill(SkillID)	--Íü¼Ç´òÑ©ÕÌ¼¼ÄÜ
	end
	SetFightState(0)
	SetDeathScript("")
	UseScrollEnable(1)
	SetTempRevPos(0,0,0)
	Msg2Player("Hoan nghªnh lÇn sau c¸c b¹n vµo b¶n ®å tuyÕt ®o¹t b¶o.")
end
