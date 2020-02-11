
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(3600000)
		Msg2Player("B¹n ®· më 1 Tö Kim hång bao nhËn ®­îc 360 vµng");
		WriteLog("[KÕt h«n]:"..GetName().."B¹n ®· më 1 Tö Kim ®¹i hång bao");
	end;
end;