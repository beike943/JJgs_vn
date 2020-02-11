--ÖéÁªèµºÏ°ü
Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(8,100) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang kh«ng ®ñ, xin s¾p xÕp l¹i råi h·y më Chu Liªn BÝch Hîp bao.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		add_qingtie_packet(1);
		Msg2Player("B¹n nhËn ®­îc 1 thiÖp mêi");
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],9);
		Msg2Player("B¹n nhËn ®­îc 9 LÔ Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],36);
		Msg2Player("B¹n nhËn ®­îc 36 viªn kÑo mõng");
		AddItem(2,3,214,36);
		Msg2Player("B¹n nhËn ®­îc 36 viªn ph¸o")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],6);
		Msg2Player("B¹n nhËn ®­îc 6 M¹n Thiªn ThÓ TiÕt bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn thuyÕt minh chiÕn ®Þa.");
		WriteLog("[KÕt h«n]:"..GetName().."Më Chu Liªn BÝch Hîp bao");
	end
end;