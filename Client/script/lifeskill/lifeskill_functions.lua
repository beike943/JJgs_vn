--�����趨��ʽ���£�
--						S KILLS = {
--���Ժϳ���Ʒ����ߵȼ�	{ , , , , , , , , , },
--���Ժϳ���Ʒ����͵ȼ�	{ , , , , , , , , , },
--��������			{ , , , , , , , , , },
--����				{ , , , , , , , , , },
--}

function GetSkillLevelData(idx,level)
	if (idx < 1)then
		return  -1
	end
	if (idx > 4)then
		return -1
	end
	return SKILLS[idx][level]
end
