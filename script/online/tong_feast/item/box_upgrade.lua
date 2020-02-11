function OnUse(nItem)
	if GetFreeItemRoom() < 3 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddItem(2,1,30593,1);
		AddItem(2,1,30594,1);
		AddItem(2,1,30595,1);
	end
end