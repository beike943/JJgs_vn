function OnUse(nItemIndex)
	local nPlace = GetItemPlace(nItemIndex);
	if nPlace == 1 then
		CastState("state_move_speed_percent_add",100,5*18,1,101);
		Msg2Player("TËc ÆÈ di chuy”n t®ng 100%, duy tr◊ trong 5 gi©y");
		SetItemUseLapse(nItemIndex,10*60*18);	--¿‰»¥ ±º‰£∫£±£∞∑÷÷”
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
