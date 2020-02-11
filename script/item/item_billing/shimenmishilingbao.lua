Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(5,100,"") == 0 then
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(2,0,1048,5,5);
		Msg2Player("NhËn ®­îc 5 MËt thÊt s­ m«n lÖnh");
	end;
end;