Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(2,30,"") == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			AddItem(2,1,2652,20,5);
			Msg2Player("你获得20个赤铁精");
		end;
	end;
end;
