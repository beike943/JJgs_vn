function OnUse()
	if DelItem(2,1,394,1) == 1 then
		local nLevel = GetLevel();
		local nNeedExp = floor((nLevel^2*125000)/(80^2))
		ModifyExp(nNeedExp)
		Msg2Player("Bπn nhÀn Æ≠Óc "..nNeedExp.." Æi”m kinh nghi÷m");
		ModifyReputation(5,0);
		Msg2Player("Bπn nhÀn Æ≠Óc 5 Æi”m danh v‰ng.");
	end;
end;