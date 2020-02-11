--ÎÄ¶¨¼ªÏé°ü
Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(8,250) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang kh«ng ®ñ, xin s¾p xÕp l¹i råi h·y më V¨n §Þnh C¸t T­êng bao.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(2);
		Msg2Player("B¹n nhËn ®­îc 2 thiÖp mêi");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],18);
		Msg2Player("B¹n nhËn ®­îc 18 LÔ Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],81);
		Msg2Player("B¹n nhËn ®­îc 81 viªn kÑo mõng");
		AddItem(2,3,214,81);
		Msg2Player("B¹n nhËn ®­îc 81 viªn ph¸o")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],18);
		Msg2Player("B¹n nhËn ®­îc 18 M¹n Thiªn ThÓ TiÕt bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn thuyÕt minh chiÕn ®Þa.");
		WriteLog("[KÕt h«n]:"..GetName().."Më V¨n §Þnh C¸t T­êng bao");
	end
end;