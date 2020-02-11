
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(9990000)
		Msg2Player("B¹n më bao l× x× hoµng kim nhËn ®­îc 999 l­îng");
		WriteLog("[KÕt h«n]:"..GetName().."B¹n ®· më 1 bao l× x× hoµng kim");
	end;
end;