--ÓÀ½áÍ¬ÐÄ°ü
Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	if gf_JudgeRoomWeight(17,30) == 0 then
		Talk(1,"","Kho¶ng trèng trong hµnh trang kh«ng ®ñ, s¾p xÕp l¹i råi h·y më VÜnh KÕt §ång T©m bao");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local task_date = GetTask(TASK_WEDDING_DATE)
		local task_para = GetTask(TASK_WEDDING_FIELD)
		add_invitation(10,task_date,task_para);
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],3);
		Msg2Player("B¹n nhËn ®­îc 3 LÔ Hoa");
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],8);
		Msg2Player("B¹n nhËn ®­îc 8 viªn kÑo");
		AddItem(2,3,214,6);
		Msg2Player("B¹n nhËn ®­îc 6 viªn ph¸o")
		AddItem(ITEM_MTCXB[1],ITEM_MTCXB[2],ITEM_MTCXB[3],1);
		Msg2Player("B¹n nhËn ®­îc 1 M¹n Thiªn ThÓ TiÕt bao")
		AddItem(ITEM_NOTEBOOK[1],ITEM_NOTEBOOK[2],ITEM_NOTEBOOK[3],1)
		Msg2Player("B¹n nhËn ®­îc 1 quyÓn thuyÕt minh chiÕn ®Þa.");
		WriteLog("[KÕt h«n]:"..GetName().."Më VÜnh KÕt §ång T©m bao");
	end
end;