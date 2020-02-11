Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më LÔ r­¬ng lín? Cã thÓ nhËn ®­îc <color=yellow>500<color> lÔ kim.",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(5,50) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nRetCode = AddItem(ITEM_COIN[1],ITEM_COIN[2],ITEM_COIN[3],500)
		if nRetCode == 1 then
			Msg2Player("B¹n nhËn ®­îc 500 lÔ kim");
			WriteLog("[KÕt h«n]:"..GetName().."Më mét LÔ r­¬ng lín");
		else
			WriteLog("[KÕt h«n b¸o lçi]:"..GetName().."Më LÔ r­¬ng lín b¸o lçi, AddItem trÞ ph¶n håi:"..nRetCode);
		end;
	end;
end;