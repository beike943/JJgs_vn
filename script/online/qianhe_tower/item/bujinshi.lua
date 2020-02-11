Include("\\script\\lib\\globalfunctions.lua")

function OnUse(nItem)
	Say("Dïng 3 m¶nh Hæ phï vµ 1 Bæ Kim Th¹ch ®æi 1 Kim Hæ phï?",2,"§ång ý/ensure","Hñy bá/nothing");
end

function ensure()
	local nNum1 = min(floor(GetItemCount(2,1,30435) / 3), GetItemCount(2,1,30439))
	local nNum2 = GetFreeItemRoom();
	AskClientForNumber("ensure_do", 0, min(nNum1, nNum2), "H·y nhËp sè l­îng vµo", "");
end

function ensure_do(nNum)
	for i = 1, nNum do
		if GetItemCount(2,1,30435) < 3 then
			Msg2Player("M¶nh Hæ phï kh«ng ®ñ 3 c¸i ");
			return
		end
		if GetItemCount(2,1,30439) < 1 then
			Msg2Player("Sè l­îng Bæ Kim Th¹ch kh«ng ®ñ 1 c¸i");
			return 
		end
		if gf_Judge_Room_Weight(1,1) ~= 1 then
			Msg2Player("Kh«ng gian hµnh trang kh«ng ®ñ");
			return 
		end
		if DelItem(2,1,30435,3) == 1 and DelItem(2,1,30439,1) == 1 then
			gf_AddItemEx2({2,1,30438,1}, "Kim Hæ phï", "C«ng chiÕn Thiªn TÇm Th¸p", "§æi Bæ Kim Th¹ch", 0, 1);
		end
	end
end