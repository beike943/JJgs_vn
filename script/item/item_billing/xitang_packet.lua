Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më bao kÑo mõng? Bªn trong chøa <color=yellow>20<color> viªn kÑo mõng.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(2,30) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(ITEM_XITANG[1],ITEM_XITANG[2],ITEM_XITANG[3],20)
		Msg2Player("B¹n nhËn ®­îc 20 viªn kÑo mõng");
		WriteLog("[KÕt h«n]:"..GetName().."®· më 1 bao kÑo mõng");
	end;
end;