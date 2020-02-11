function OnUse(nItemIndex)
	if GetPKFlag() ~= 0 then
		Msg2Player("Tr¹ng th¸i kh«ng luyÖn c«ng kh«ng thÓ sö dông bao thuèc cña NguyÖt L­îng Thè");
		return 1;
	end;
	local nPlace = GetItemPlace(nItemIndex);
	if nPlace == 1 then
		CastState("state_life_per_per8f",300,15*18,1,117000);
		CastState("state_neili_per_per8f",200,15*18,1,118000);
		Msg2Player("Mçi n÷a gi©y phôc håi 3% sinh lùc, håi phôc 2% néi lùc, duy tr× trong 15 gi©y");
		SetItemUseLapse(nItemIndex,5*60*18);	--ÀäÈ´Ê±¼ä£º5·ÖÖÓ
		return 1;
	end;
	return 0;
end;

function OnEquip()
	return 0
end

function CanEquip()
	return 0
end

function OnUnEquip()
	return 0
end
