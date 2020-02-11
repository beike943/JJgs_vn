Include("\\script\\lib\\globalfunctions.lua");

--Ã·π©≥ËŒÔººƒ‹µƒŒÔ∆∑≈‰÷√±Ì
g_PetSkillTable = {
	--1¥Û¿‡	2∏±¿‡	3œ∏¿‡	4ººƒ‹ID	5ººƒ‹√˚≥∆
	{2,	97,	8,	1257,	"ßÿnh PhÛc"},
	{2,	97,	7,	1258,	"T≠ Gi∂o"},
	{2,	97,	6,	1260,	"Uy Nhi’p"},
}

function GetPetSkillConfig(nItemIdx)
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nItemIdx);
	if ItemGen == nil or ItemDetail == nil or ItemParticular == nil then
		return 0;
	end
	
	for i=1,getn(g_PetSkillTable) do
		if g_PetSkillTable[i][1] == ItemGen and
		g_PetSkillTable[i][2] == ItemDetail and
		g_PetSkillTable[i][3] == ItemParticular then
			return i;
		end
	end

	return 0;
end;

function OnUse(nItemIdx)
	--ªÒ»°≈‰÷√–≈œ¢
	local nConfigIdx = GetPetSkillConfig(nItemIdx);
	if nConfigIdx == 0 then
		return
	end;

	--ªÒ»°Œ‰∆˜¿©’π¿∏ŒÔ∆∑
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex <= 0) then
		Talk(1,"","Kh´ng c„ thÛ c≠ng, kh´ng th” dÔng vÀt ph»m nµy!")
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","Kh´ng c„ thÛ c≠ng, kh´ng th” dÔng vÀt ph»m nµy!")
		return
	end
	
	if (IsPetCanFight(nPetItemIndex) == 0) then
		Talk(1, "", "Kh´ng ph∂i thÛ c≠ng dπng t n c´ng, kh´ng th” h‰c k¸ n®ng!")
		return
	end

	local nOldSkill = GetPetSkill(nPetItemIndex);
	if (nOldSkill <= 0) then
		yes(nConfigIdx);
	elseif (nOldSkill == g_PetSkillTable[nConfigIdx][4]) then
		Talk(1,"","ThÛ c≠ng Æ∑ h‰c k¸ n®ng nµy!")
		return
	else
		Say("ThÛ c≠ng Æ∑ h‰c 1 k¸ n®ng, h‰c k¸ n®ng mÌi sœ thay th’ cho k¸ n®ng hi÷n tπi. ßÂng ˝ thay th’?", 
			2, "ßÛng/#yes(".. nConfigIdx ..")", "Sai/no")
	end;
end;

function yes(nConfigIdx)
	if (nConfigIdx <= 0 or nConfigIdx > getn(g_PetSkillTable)) then
		return
	end;
	if (g_PetSkillTable[nConfigIdx][4] <= 0) then
		return
	end;
	
	--ŒÔ∆∑ ˝¡ø
	local nItemCount = GetItemCount(g_PetSkillTable[nConfigIdx][1], g_PetSkillTable[nConfigIdx][2], g_PetSkillTable[nConfigIdx][3]);
	if (nItemCount == nil or nItemCount < 1) then
		return
	end;

	--ªÒ»°Œ‰∆˜¿©’π¿∏ŒÔ∆∑
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex <= 0) then
		Talk(1,"","Kh´ng c„ thÛ c≠ng, kh´ng th” dÔng vÀt ph»m nµy!")
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Talk(1,"","Kh´ng c„ thÛ c≠ng, kh´ng th” dÔng vÀt ph»m nµy!")
		return
	end
	
	if (IsPetCanFight(nPetItemIndex) == 0) then
		Talk(1, "", "Kh´ng ph∂i thÛ c≠ng dπng t n c´ng, kh´ng th” h‰c k¸ n®ng!")
		return
	end
	
	--…Ë÷√–¬ººƒ‹
	if (SetPetSkill(nPetItemIndex, g_PetSkillTable[nConfigIdx][4]) == 1) then
		DelItem(g_PetSkillTable[nConfigIdx][1], g_PetSkillTable[nConfigIdx][2], g_PetSkillTable[nConfigIdx][3], 1)
		Talk(1,"","ThÛ c≠ng Æ∑ h‰c k¸ n®ng mÌi: " .. g_PetSkillTable[nConfigIdx][5])
	end

	return
end

function no()
end