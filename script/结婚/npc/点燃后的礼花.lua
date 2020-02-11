function main()
	local sName = GetName();
	if GetMissionS(1) == sName or GetMissionS(2) == sName then
		local selTab = {
					"Ta muèn hñy nã/put_out",
					"Kh«ng cÇn/nothing",
					}
		Say("Ng­¬i muèn ®èt lÔ hoa ­?",getn(selTab),selTab);
	end;
end;

function put_out()
	local nNpcIndex = GetTargetNpc();
	if nNpcIndex <= 0 then
		return 0;
	end;
	SetNpcLifeTime(nNpcIndex,0);
	SetMissionV(27,GetMissionV(27)-1);
	Msg2Player("B¹n ®· ®èt 1 lÔ hoa ");
end;

function nothing()

end;