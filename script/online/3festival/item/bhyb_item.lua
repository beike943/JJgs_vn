Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		CastState("state_strength_add_percent",50,600*18,1,304000);
		CastState("state_vitality_add_percent",50,600*18,1,305000);
		CastState("state_energy_add_percent",50,600*18,1,306000);
		CastState("state_observe_add_percent",50,600*18,1,307000);
		CastState("state_dexterity_add_percent",50,600*18,1,308000);
		Msg2Player("TÊt c¶ n¨ng lùc t¨ng 50% trong 10 phót");
		Msg2_LeiTai("B¸nh Trung Thu B¸ch Hoa");
	end;
end;