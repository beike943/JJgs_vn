Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më quµ h«n lÔ? Bªn trong chøa <color=yellow>5<color> ph¸o hoa.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(ITEM_LIHUA[1],ITEM_LIHUA[2],ITEM_LIHUA[3],5)
		Msg2Player("B¹n nhËn ®­îc 5 ph¸o hoa h«n lÔ");
		WriteLog("[KÕt h«n]:"..GetName().."®· më 1 tói ph¸o hoa h«n lÔ");
	end;
end;