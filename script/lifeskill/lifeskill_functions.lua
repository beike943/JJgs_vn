--技能设定格式如下：
--						S KILLS = {
--可以合成物品的最高等级	{ , , , , , , , , , },
--可以合成物品的最低等级	{ , , , , , , , , , },
--体力消耗			{ , , , , , , , , , },
--经验				{ , , , , , , , , , },
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
