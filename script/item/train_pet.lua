Include("\\script\\lib\\globalfunctions.lua");

--ÑµÁ·³èÎï
function OnUse(nIdx)
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end;
	if GetFightState() ~= 0 then
		Msg2Player("Tr¹ng th¸i chiÕn ®Êu, kh«ng thÓ huÊn luyÖn!");
		return
	end
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end

	StartTrainPet(nPetItemIndex);
end
