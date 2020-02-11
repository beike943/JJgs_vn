Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(200000);
		Msg2Player("Bπn nhÀn Æ≠Óc 200000 Æi”m kinh nghi÷m");
	end;
end;