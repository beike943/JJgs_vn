--Ì«Ò×»ìÔª¹¦Í¼¼ø
--by vivi
--2008/10/10

function OnUse()
	Say("Cã thÓ ®æi 1000 tÊm Th¸i DÞch Hçn Nguyªn C«ng lÊy 1 quyÓn Th¸i DÞch Hçn Nguyªn Phæ (cÇn khi luyÖn Tiªn Thiªn Th¸i DÞch Hçn Nguyªn C«ng). Ng­¬i x¸c nhËn muèn ®æi chø?",
		2,
		"§­îc/confirm_change",
		"Kh«ng cÇn/nothing")	
end

function nothing()

end

function confirm_change()
	if GetItemCount(2,0,1082) < 1000 then
		Talk(1,"","Trªn ng­êi ng­¬i kh«ng cã 1000 tÊm Th¸i DÞch Hçn Nguyªn C«ng.");
		return
	end
	if DelItem(2,0,1082,1000) == 1 then
		AddItem(2,0,1083,1);
		WriteLog("Ng­êi ch¬i"..GetName().."Dïng 1000 tÊm Th¸i DÞch Hçn Nguyªn C«ng ®æi 1 quyÓnTh¸i DÞch Hçn Nguyªn Phæ.");
	end
end
