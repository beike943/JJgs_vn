Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(100000);
		Msg2Player("B¹n nhËn ®­îc 100000 ®iÓm søc kháe");
		local nRand = random(1,100);
		if nRand <= 25 then
			CastState("state_confusion",0,10*18,1,211000);
			Msg2Player("Hçn lo¹n 10 gi©y");
		elseif nRand <= 50 then
			CastState("state_vertigo",0,10*18,1,213000);
			Msg2Player("BÞ cho¸ng 10 gi©y");
		end;
	end;
end;