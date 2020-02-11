Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if GetExpScale() > 1 then
		Msg2Player("Giê lµ lóc tinh hoa trêi ®Êt kÕt hîp, tu luyÖn ®¹t hiÖu qu¶ møc cao nhÊt.");
	else
		if DelItemByIndex(nItemIdx,1) == 1 then
			DoubleExpTime(2*3600)
			Msg2Player("B¹n cã 2 giê nh©n ®«i ®iÓm kinh nghiÖm");
		end
	end
end;