--脚本名称：玉剑
--脚本功能：
--功能策划：谢徐春
--功能开发：朱力
--开发时间：2010-05-11
--代码修改记录

g_tInfo = {
	[10107]	= {
		tItem		= {0, 105, 10107},
		nEffectID	= 1,
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
		},
	[10108]	= {
		tItem		= {0, 105, 10108},
		nEffectID	= 2,
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[10109]	= {
		tItem		= {0, 105, 10109},
		nEffectID	= 3,
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[10110]	= {
		tItem		= {0, 105, 10110},
		nEffectID	= 4,
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[10111]	= {
		tItem		= {0, 105, 10111},
		nEffectID	= 5,
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[10112]	= {
		tItem		= {0, 105, 10112},
		nEffectID	= 6,
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[10113]	= {
		tItem		= {0, 105, 10113},
		tLimitSkill	= {20},
	},
	[10114]	= {
		tItem		= {0, 105, 10114},
		tLimitSkill	= {20},
	},
	[10115]	= {
		tItem		= {0, 105, 10115},
		tLimitSkill	= {20},
	},
	[10116]	= {
		tItem		= {0, 105, 10116},
		tLimitSkill	= {20},
	},
	[10117]	= {
		tItem		= {0, 105, 10117},
		tLimitSkill	= {20},
	},
	[10118]	= {
		tItem		= {0, 105, 10118},
		tLimitSkill	= {20},
	},
	[10119]	= {
		tItem		= {0, 105, 10119},
		tLimitSkill	= {20},
	},
	[10120]	= {
		tItem		= {0, 105, 10120},
		tLimitSkill	= {20},
	},
	[10121]	= {
		tItem		= {0, 105, 10121},
		tLimitSkill	= {20},
	},
	[10122]	= {
		tItem		= {0, 105, 10122},
		tLimitSkill	= {20},
	},
	[120] = {
		tItem		= {0, 105, 120},
		tLimitSkill 	= {20},
		bLimitInteractive	= 1,
	},
	[121] = {
		tItem		= {0, 105, 121},
		tLimitSkill 	= {20},
	},
	[122] = {
		tItem		= {0, 105, 122},
		tLimitSkill 	= {20},
	},
	[123] = {
		tItem		= {0, 105, 123},
		tLimitSkill 	= {20},
	},
	[124] = {
		tItem		= {0, 105, 124},
		tLimitSkill 	= {20},
	},
	[125] = {
		tItem		= {0, 105, 125},
		tLimitSkill 	= {20},
	},
	[126] = {
		tItem		= {0, 105, 126},
		tLimitSkill 	= {20},
	},
	[127] = {
		tItem		= {0, 105, 127},
		tLimitSkill 	= {20},
		bLimitInteractive	= 1;
	},
	[128] = {
		tItem		= {0, 105, 128},
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[129] = {
		tItem		= {0, 105, 129},
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[130] = {
		tItem		= {0, 105, 130},
		tLimitSkill	= {20},
		bLimitInteractive	= 1;
	},
	[131] = {
		tItem		= {0, 105, 131},
		tLimitSkill	= {20},
	},
	[132] = {
		tItem		= {0, 105, 132},
		tLimitSkill	= {20},
	},
	[133] = {
		tItem		= {0, 105, 133},
		tLimitSkill	= {20},
	},
	[30038] = {
		tItem		= {0, 105, 30038},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[30039] = {
		tItem		= {0, 105, 30039},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[30040] = {
		tItem		= {0, 105, 30040},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[30041] = {
		tItem		= {0, 105, 30041},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[30042] = {
		tItem		= {0, 105, 30042},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[30043] = {
		tItem		= {0, 105, 30043},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[142] = {
		tItem		= {0, 105, 142},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[148] = {
		tItem		= {0, 105, 148},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
	[149] = {
		tItem		= {0, 105, 149},
		tLimitSkill	= {20},
		bLimitInteractive	= 1,
	},
};

function OnEquip(nItemIndex)
	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	local tInfo		= g_tInfo[nP];

	if not tInfo then
		return 0;
	end

	if nG ~= tInfo.tItem[1] or nD ~= tInfo.tItem[2] or nP ~= tInfo.tItem[3] then
		return 0;
	end

	if tInfo.nEffectID then
		SetHorseEffect(tInfo.nEffectID);
	end

	if tInfo.tLimitSkill then
		for _, nSkillID in tInfo.tLimitSkill do
			LimitSkill(nSkillID);
		end
	end

	if tInfo.bLimitInteractive and 1 == tInfo.bLimitInteractive then
		CleanInteractive();
		InteractiveEnable(0);
	end

	return 1;
end

function OnUnEquip(nItemIndex)
	SetHorseEffect(0);

	local nG, nD, nP	= GetItemInfoByIndex(nItemIndex);
	local tInfo		= g_tInfo[nP];

	if not tInfo then
		return 0;
	end

	if nG ~= tInfo.tItem[1] or nD ~= tInfo.tItem[2] or nP ~= tInfo.tItem[3] then
		return 0;
	end

	if tInfo.tLimitSkill then
		for _, nSkillID in tInfo.tLimitSkill do
			UnLimitSkill(nSkillID);
		end
	end

	if tInfo.bLimitInteractive and 1 == tInfo.bLimitInteractive then
		InteractiveEnable(1);
	end

	return 0;
end

function OnUse()
end

function CanEquip()
end
