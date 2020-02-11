Include("\\script\\lib\\globalfunctions.lua");

tBoat = {"ThuyÒn Rång Thñy L«i","ThuyÒn Rång Thñy L·ng","ThuyÒn rång §o¶n Binh","ThuyÒn Rång Liªn X¹","ThuyÒn rång TiÒm Hµnh"};
function OnUse(nItemIdx)
	local selTab = {
				"Thñy L«i Long Chu (sö dông ®­îc 1 lÇn)/#select_boat(1,"..nItemIdx..")",
				"Thñy L·ng Long Chu (sö dông ®­îc 1 lÇn)/#select_boat(2,"..nItemIdx..")",
				"Thñy Ph¸o Long Chu (sö dông ®­îc 1 lÇn)/#select_boat(3,"..nItemIdx..")",
				"Liªn X¹ Long Chu (sö dông ®­îc 1 lÇn)/#select_boat(4,"..nItemIdx..")",
				"TiÒm Hµng Long Chu (sö dông ®­îc 1 lÇn)/#select_boat(5,"..nItemIdx..")",
				"§Ó ta nghÜ l¹i/nothing",
				}
	Say("Xin chän thuyÒn rång b¹n muèn sö dông:",getn(selTab),selTab);
end;

tBoadType = {
	[1] = {27,"ThuyÒn Rång Thñy L«i"},
	[2] = {28,"ThuyÒn Rång Thñy L·ng"},
	[3] = {26,"ThuyÒn Rång Thñy Ph¸o"},
	[4] = {30,"ThuyÒn Rång Liªn X¹"},
	[5] = {31,"ThuyÒn rång TiÒm Hµnh"},
	}

function select_boat(nType,nItemIdx)
	if gf_JudgeRoomWeight(1,100) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,105,tBoadType[nType][1],1);
		Msg2Player("B¹n nhËn ®­îc 1 "..tBoadType[nType][2]);
	end;
end;

function nothing()

end;