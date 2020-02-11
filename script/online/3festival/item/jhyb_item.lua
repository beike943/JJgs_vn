Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyExp(400000);
		Msg2Player("Bπn nhÀn Æ≠Óc 400000 Æi”m kinh nghi÷m");
	end;
end;