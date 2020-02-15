--ǰ�Ἴ���ж�
function Calfroskill(id)
	if (HaveLearnedSkill(id)==1) then	--�Ѿ�ѧ����ǰ����
   		return 1	--����ǰ�Ἴ������
	elseif  (SKILLS[id]["levelless"][2] == 0)  then	--û��ǰ�Ἴ��
		return 1	--����ǰ�Ἴ������
	elseif	(SKILLS[id]["levelless"][3] == 0)  then	--ǰ�Ἴ�ܣ����ϵ��
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) >= SKILLS[id]["levelless"][4 + var]) then
					return 1	--����ǰ�Ἴ������
				end
			end
	elseif	(SKILLS[id]["levelless"][3] == 1)  then	--ǰ�Ἴ�ܣ����ϵ��
			for var=1, 2 * (SKILLS[id]["levelless"][2]), 2  do
				if (GetSkillLevel(SKILLS[id]["levelless"][3 + var]) < SKILLS[id]["levelless"][4 + var]) then
					return 0	--������ǰ�Ἴ������
				end
			end
			return 1
	else 
	       return 0	--������ǰ�Ἴ������
   	end
end;

--�����ж�
function canlearnskill(id)
  skillLevel = GetSkillLevel(id)
  if skillLevel==nil	then
  return 0
  end
  if (GetLevel() >= LinearValue(skillLevel + 1, 2, SKILLS[id]["levelless"][1], SKILLS[id])) then	-- �����ҵȼ�
	needExp = floor(SKILLS[id][1][3] + (skillLevel - 1) * skillLevel * SKILLS[id][2][3] / 2)
	if (GetExp() >= needExp)  then	--��龭��ֵ
		if (GetReputation() >= LinearValue(skillLevel + 1, 4, SKILLS[id]["levelless"][1], SKILLS[id])) then	--�������
			i = Calfroskill(id)	--���ǰ�Ἴ��
		 	if (i == 1) then
		 		if (GetCash() >= (needExp / 2)) then	--����Ǯ
		 			return 1	--����ѧ
		 		else
		 			return 6	--��Ǯ����
		 		end
		 	else
				return 5	--ǰ�Ἴ��ûѧ��
			end
		else
				return 4	--��������
		end
	else
				return 3	--����ֵ����
	end
  else
	return 2	--�ȼ�����
  end
end;

--ѧϰ������ѯ��
function learnskill(id)
	local skillLevel = GetSkillLevel(id)
	if (skillLevel == nil) then
		return
	end

	if (skillLevel >= SKILLS[id][SKILLS[id]["levelless"][1]][1]) then
		return
	end

	local needExp = floor(SKILLS[id][1][3] + (skillLevel - 1) * skillLevel * SKILLS[id][2][3] / 2)
	
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
		Say(tipbeforelearn.."��ϰ���书��Ҫ"..needRep.."����������������"..needExp.."�㾭���"..floor(needExp/2).."��ͭǮ����ȷ����",2,"ȷ��/yeslearn","����/no")
	else
		Say(tipbeforelearn.."��ϰ���书��Ҫ"..needRep.."����������������"..needExp.."�㾭���"..floor(needExp/2).."��ͭǮ����ȷ����",2,"ȷ��/yeslearn","����/no")
	end
end

--ѧϰ������ִ��
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
		
		needExp = floor(SKILLS[id][1][3] + (skillLevel - 1) * skillLevel * SKILLS[id][2][3] / 2)
		ModifyExp(-needExp)	--�۳�����
 		Pay(floor(needExp/2))	--�۳���Ǯ
 
		if (HaveLearnedSkill(id)) == 0 then
 			LearnSkill(id)		--ѧ�Ἴ��
  		else
  			LevelUpSkill(id)	--��������
		end

		afterlearnskill(id)

	end
	showlimit(n)	--������Ϣ�����

end;

function no()
end;