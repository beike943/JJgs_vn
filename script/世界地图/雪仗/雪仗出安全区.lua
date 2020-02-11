function main()
	SetDeathPunish(0)
	SetFightState(1)
	for i=1,5 do	
		Tid = 1710 + i
		Tidx = 3100 + i
		if GetTrigger(Tidx) == 0 then
			if CreateTrigger(2,Tid,Tidx) == 0 then	--创建离开地图触发器
				bCreateFailed = 1
			end
		end
	end
	if bCreateFailed == 1 then
		local MapID = GetWorldPos()
		if MapID == 961 then
			NewWorld(300,1820,3573)
			if GetWorldPos() == 300 then
				SetDeathPunish(1)
				SetFightState(0)
				UseScrollEnable(1)
				SetTempRevPos(0,0,0)
				for SkillID=843,851 do
					RemoveSkill(SkillID)	--忘记打雪仗技能
				end
				SetDeathScript("")
			end
		elseif MapID == 962 then
			NewWorld(200,1409,3048)
			if GetWorldPos() == 200 then
				SetDeathPunish(1)
				SetFightState(0)
				UseScrollEnable(1)
				SetTempRevPos(0,0,0)
				for SkillID=843,851 do
					RemoveSkill(SkillID)	--忘记打雪仗技能
				end
				SetDeathScript("")
			end
		elseif MapID == 963 then
			NewWorld(100,1365,2932)
			if GetWorldPos() == 100 then
				SetDeathPunish(1)
				SetFightState(0)
				UseScrollEnable(1)
				SetTempRevPos(0,0,0)
				for SkillID=843,851 do
					RemoveSkill(SkillID)	--忘记打雪仗技能
				end
				SetDeathScript("")
			end
		elseif MapID == 964 then
			NewWorld(350,1575,2970)
			if GetWorldPos() == 350 then
				SetDeathPunish(1)
				SetFightState(0)
				UseScrollEnable(1)
				SetTempRevPos(0,0,0)
				for SkillID=843,851 do
					RemoveSkill(SkillID)	--忘记打雪仗技能
				end
				SetDeathScript("")
			end
		elseif MapID == 965 then
			NewWorld(150,1781,3154)
			if GetWorldPos() == 150 then
				SetDeathPunish(1)
				SetFightState(0)
				UseScrollEnable(1)
				SetTempRevPos(0,0,0)
				for SkillID=843,851 do
					RemoveSkill(SkillID)	--忘记打雪仗技能
				end
				SetDeathScript("")
			end
		end
	end
end
