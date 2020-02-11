Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më r­¬ng lÔ kim? Bªn trong cã <color=yellow>50<color> lÔ kim.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = AddItem(ITEM_COIN[1],ITEM_COIN[2],ITEM_COIN[3],50)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 50 lÔ kim");
			WriteLog("[KÕt h«n]:"..GetName().."®· më 1 r­¬ng lÔ kim");
		else
			WriteLog("[KÕt h«n b¸o lçi]:"..GetName().."Më r­¬ng lÔ kim b¸o lçi, AddItem trÞ quay vÒ:"..nRetCode);
		end;
	end;
end;