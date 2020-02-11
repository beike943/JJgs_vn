--ÇÙÉªºÍÃù°ü
Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(6,50) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang kh«ng ®ñ, xin s¾p xÕp l¹i råi h·y më CÊm S¾t Hßa Minh bao.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(1);
		Msg2Player("B¹n nhËn ®­îc 1 thiÖp mêi");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],6);
		Msg2Player("B¹n nhËn ®­îc 6 LÔ Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],18);
		Msg2Player("B¹n nhËn ®­îc 18 viªn kÑo mõng");
		AddItem(2,3,214,18);
		Msg2Player("B¹n nhËn ®­îc 18 viªn ph¸o");
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],3);
		Msg2Player("B¹n nhËn ®­îc 3 M¹n Thiªn ThÓ TiÕt bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn thuyÕt minh chiÕn ®Þa.");
		WriteLog("[KÕt h«n]:"..GetName().."Më CÊm S¾t Hßa Minh bao");
	end
end;