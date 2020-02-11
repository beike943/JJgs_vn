Include("\\script\\½á»é\\marriage_head.lua");
function OnUse(nItemIdx)
	local selTab = {
			format("Më/#open(%d)",nItemIdx),
			"LÇn sau h·y më!/nothing",
			}
	Say("B¹n muèn më DiÖm háa bao?",getn(selTab),selTab);
end;

function open(nItemIdx)
	if gf_JudgeRoomWeight(6,18) == 0 then
		Talk(1,"","B¹n kh«ng ®ñ kho¶ng trèng hoÆc søc lùc, xin kiÓm tra l¹i!!");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		for i=189,194 do
			AddItem(2,1,i,3)
		end;
		Msg2Player("B¹n nhËn ®­îc 3 Tranh S¾c Yªn Hoa")
		Msg2Player("B¹n nhËn ®­îc 3 Ph¸o hoa Cam")
		Msg2Player("B¹n nhËn ®­îc 3 XÝch M¹c Háa DiÖm")
		Msg2Player("B¹n nhËn ®­îc 3 Lam M¹c Háa DiÖm")
		Msg2Player("B¹n nhËn ®­îc 3 Tranh M¹c Háa DiÖm")
		Msg2Player("B¹n nhËn ®­îc 3 Ph¸o hoa ThÇn bÝ")
	end;
end;