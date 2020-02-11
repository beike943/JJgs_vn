Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(500000);
		Msg2Player("B¹n nhËn ®­îc 500000 ®iÓm søc kháe");
	end;
end;