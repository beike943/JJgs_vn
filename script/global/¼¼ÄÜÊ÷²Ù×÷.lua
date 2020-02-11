--Ç°Ìá¼¼ÄÜÅĞ¶Ï
function Calfroskill(id)
	if (HaveLearnedSkill(id)==1) then	--ÒÑ¾­Ñ§¹ıµ±Ç°¼¼ÄÜ
   		return 1	--Âú×ãÇ°Ìá¼¼ÄÜÌõ¼ş
	elseif  (SKILLS[id]["levelless"][2] == 0)  then	--Ã»ÓĞÇ°Ìá¼¼ÄÜ
		return 1	--Âú×ãÇ°Ìá¼¼ÄÜÌõ¼ş
	elseif	(SKILLS[id]["levelless"][3] == 0)  then	--Ç°Ìá¼¼ÄÜ£¨»ò¹ØÏµ£©
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) >= SKILLS[id]["levelless"][4 + var]) then
					return 1	--Âú×ãÇ°Ìá¼¼ÄÜÌõ¼ş
				end
			end
	elseif	(SKILLS[id]["levelless"][3] == 1)  then	--Ç°Ìá¼¼ÄÜ£¨Óë¹ØÏµ£©
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) < SKILLS[id]["levelless"][4 + var]) then
					return 0	--²»Âú×ãÇ°Ìá¼¼ÄÜÌõ¼ş
				end
			end
			return 1
	else 
	       return 0	--²»Âú×ãÇ°Ìá¼¼ÄÜÌõ¼ş
   	end
end;

--»ñÈ¡Ñ§Ï°¼¼ÄÜĞèÒªµÄ¾­Ñé
function get_learn_need_exp(id)
	local skillLevel = GetSkillLevel(id)
	if not skillLevel then
		return 2100000000
	end
	local needExp = SKILLS[id][1][3]
	if SKILLS[id][2] then
		needExp = floor(needExp + (skillLevel - 1) * skillLevel * SKILLS[id][2][3] / 2)
	end
	return needExp
end

--Éı¼¶ÅĞ¶Ï
function canlearnskill(id)
  local skillLevel = GetSkillLevel(id)
  if skillLevel==nil	then
  	return 0
  end
  if (GetLevel() >= LinearValue(skillLevel + 1, 2, SKILLS[id]["levelless"][1], SKILLS[id])) then	-- ¼ì²éÍæ¼ÒµÈ¼¶
	local needExp = get_learn_need_exp(id)
	if (GetExp() >= needExp)  then	--¼ì²é¾­ÑéÖµ
		if (GetReputation() >= LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])) then	--¼ì²éÉùÍû
			i = Calfroskill(id)	--¼ì²éÇ°Ìá¼¼ÄÜ
		 	if (i == 1) then
		 		if (GetCash() >= (needExp / 2)) then	--¼ì²é½ğÇ®
		 			return 1	--¿ÉÒÔÑ§
		 		else
		 			return 6	--½ğÇ®²»¹»
		 		end
		 	else
				return 5	--Ç°Ìá¼¼ÄÜÃ»Ñ§Íê
			end
		else
				return 4	--ÉùÍû²»¹»
		end
	else
				return 3	--¾­ÑéÖµ²»¹»
	end
  else
	return 2	--µÈ¼¶²»¹»
  end
end;

--Ñ§Ï°£¬Éı¼¶Ñ¯ÎÊ
function learnskill(id)
	local skillLevel = GetSkillLevel(id)
	if (skillLevel == nil) then
		return
	end

	if (skillLevel >= SKILLS[id][SKILLS[id]["levelless"][1]][1]) then
		return
	end

	local needExp = get_learn_need_exp(id)
	
	local needRep = 0
	local needRepBefore = LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])
	if (needRepBefore ~= nil) then
		needRep = floor(needRepBefore)
	end

	local tipbeforelearn = beforelearnskill(id)
	if (type(tipbeforelearn) == "string") then
		tipbeforelearn = tipbeforelearn.."<enter>"
	else
		tipbeforelearn = ""
	end

	if (HaveLearnedSkill(id) == 0) then
		Say(tipbeforelearn.."Häc vâ c«ng nµy cÇn "..needRep.." ®iÓm danh väng vµ "..needExp.." ®iÓm kinh nghiÖm!"..floor(needExp/2).." ®ång, x¸c ®Şnh chø?",2,"§ång ı/yeslearn","Bá qua/no")
	else
		Say(tipbeforelearn.."Häc vâ c«ng nµy cÇn "..needRep.." ®iÓm danh väng vµ "..needExp.." ®iÓm kinh nghiÖm!"..floor(needExp/2).." ®ång, x¸c ®Şnh chø?",2,"§ång ı/yeslearn","Bá qua/no")
	end
end

--Ñ§Ï°£¬Éı¼¶Ö´ĞĞ
function yeslearn()
	id = GetLearningSkill()
	if (id == nil) then
		return
	end
	
	n = canlearnskill(id)
 	if (n==0) then
 		 return
 	end	
	if (n==1) then 
		skillLevel = GetSkillLevel(id)
		if (skillLevel == nil) then
			return
		end
		
		needExp = get_learn_need_exp(id)
		ModifyExp(-needExp)	--¿Û³ı¾­Ñé
 		Pay(floor(needExp/2))	--¿Û³ı½ğÇ®
 
		if (HaveLearnedSkill(id)) == 0 then
 			LearnSkill(id)		--Ñ§»á¼¼ÄÜ
  		else
  			LevelUpSkill(id)	--Éı¼¶¼¼ÄÜ
		end

		afterlearnskill(id)

	end
	showlimit(n)	--·´À¡ĞÅÏ¢¸øÍæ¼Ò

end;

function no()
end;