Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(1000000);
		Msg2Player("Bπn nhÀn Æ≠Óc 1 tri÷u Æi”m kinh nghi÷m");
	end;
end;