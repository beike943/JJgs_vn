Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	Say("Cã muèn më ra kh«ng?",2,"§ång ý/ensure","Hñy bá/nothing")
end

function ensure()
	if gf_Judge_Room_Weight(1,1) ~= 1 then
		Msg2Player("Kh«ng gian hµnh trang kh«ng ®ñ");
		return
	end
	if GetItemCount(2,1,30440) < 1 then
		Msg2Player("Kh«ng ph¸t hiÖn Bæ Kim Th¹ch bao nhá cã thÓ më ra");
		return
	end
	if DelItem(2,1,30440,1) == 1 then
		gf_AddItemEx2({2,1,30439,10}, "Bæ Kim Th¹ch bao nhá", "C«ng chiÕn Thiªn TÇm Th¸p", "Më Bæ Kim Th¹ch bao nhá", 0, 1);
	end	
end