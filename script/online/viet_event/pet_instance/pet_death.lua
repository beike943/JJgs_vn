Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online\\viet_event\\pet_instance\\head.lua")

function OnDeath(npcIndex)
	local nMapid = GetTaskTemp(TAIXU_MAP_ID)
	local nPlayerIdx = GetUnitCurStates(npcIndex,6)
	local OldIdx = PlayerIndex
	PlayerIndex = nPlayerIdx
	if GetNpcName(npcIndex) == GetName() then
		Talk(1,"","B¹n §ång Hµnh ®· bÞ träng th­¬ng!")
	end
	local nPetNum = mod(GetTask(TSK_PET_TAIXU_DATE), 10)
	if nPetNum >= 1 then
		SetTask(TSK_PET_TAIXU_DATE, GetTask(TSK_PET_TAIXU_DATE) - nPetNum)
	end
	SetTask(TSK_PET_TAIXU_INFO, 0)
	SetNpcDeathScript(npcIndex, "")
--	DelGroupUnit(200, npcIndex)
	SetNpcLifeTime(npcIndex, 0)
	PlayerIndex = OldIdx
end