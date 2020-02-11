
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		Earn(880000);
		Msg2Player("B¹n më hång bao nhËn ®­îc 88 vµng");
		WriteLog("[KÕt h«n]:"..GetName().."®· më 1 tiÓu hång bao");
	end
end;