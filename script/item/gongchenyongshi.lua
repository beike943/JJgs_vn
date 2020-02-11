Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(10,20,"") == 0 then
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(2,1,1201,10);
		Msg2Player("B¹n nhËn ®­îc 10 Dòng SÜ LÖnh");
	end;
end;