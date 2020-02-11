Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më lÔ bao chñ h«n? Bªn trong chøa lÔ phôc chñ h«n.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(1,10) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!");
		return 0;
	end;
	local nBody = GetBody();
	if DelItemByIndex(nItemIdx,1) == 1 then
		AddItem(0,109,241+nBody-1,1)
		Msg2Player("B¹n nhËn ®­îc 1 lÔ phôc chñ h«n");
		WriteLog("[KÕt h«n]:"..GetName().."®· më 1 lÔ bao chñ h«n");
	end;
end;