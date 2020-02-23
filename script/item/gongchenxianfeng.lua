Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(10,20,"") == 0 then
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(2,1,1203,10);
		Msg2Player("你获得了10个攻城先锋令");
	end;
end;
