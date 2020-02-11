--´ó°üåĞÒ£Óñ
function OnUse(nItem)
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
		return 0;
	end
	if DelItemByIndex(nItem, 1) == 1 then
		AddItem(2,1,30603,1000);
	end
end