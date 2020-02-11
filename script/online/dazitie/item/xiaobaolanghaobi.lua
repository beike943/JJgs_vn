function OnUse(nItem)
	Say(format("C¸c h¹ ®ång ý më %s nhËn%d c¸i %s kh«ng?","Bao bót l«ng nhá",10,"Bót l«ng"),2,"§ång ý/ensure","Hñy bá/do_nothing")
end

function ensure()
	if GetFreeItemRoom() < 1 then
		Talk(1,"","Kh«ng gian hµnh trang kh«ng ®ñ");
	end
	if DelItem(2, 1, 30452, 1) == 1 then
		AddItem(2, 1, 30451, 10);
	end
end

function do_nothing()
end
