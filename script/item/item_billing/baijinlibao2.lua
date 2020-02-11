Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	local selTab = {
				format("§ång ý/#use_yes(%d)",nItemIdx),
				"Hñy bá/nothing",
				}
	Say("B¹n muèn më Bao kiÕm hiÖp ®¹i lÔ kh«ng?",getn(selTab),selTab);
end;

function use_yes(nItemIdx)
	if gf_JudgeRoomWeight(20,300) == 0 then
		Talk(1,"","Hµnh trang hoÆc søc lùc kh«ng ®ñ, h·y ®iÒu chØnh hµnh trang tr­íc råi më Bao kiÕm hiÖp ®¹i lÔ.");
		return 0;
	end;
	if DelItemByIndex(nItemIdx,1) == 1 then
		local nBody = GetBody();
		AddItem(2,0,597,10);
		Msg2Player("B¹n nhËn ®­îc 10 Sinh viªn chøng th­");
		ModifyReputation(300,0);
		AddItem(2,1,481,1,4);
		Msg2Player("B¹n nhËn ®­îc 1 Ngò Hoa Ngäc Lé hoµn");
		AddItem(2,1,483,1,4);
		Msg2Player("B¹nh nhËn ®­îc 1 Sinh Sinh Hãa T¸n");
		AddItem(0,110,89+nBody-1,1,4);
		Msg2Player("B¹n nhËn ®­îc 1 Hoµng kim gi¸p khè tö");
		local nRand = random(1,100);
		if nRand <= 50 then
			AddItem(0,109,277+nBody-1,1,4);
			Msg2Player("B¹n nhËn ®­îc 1 Hoµng kim gi¸p y phôc");
		end;
		nRand = random(1,10000);
		if nRand <= 7000 then
			AddItem(2,1,270,10,4);
			Msg2Player("B¹n nhËn ®­îc 10 B¹ch C©u hoµn");
		elseif nRand <= 9500 then
			AddItem(2,1,1007,10,4);
			Msg2Player("B¹n nhËn ®­îc 10 ®¹i B¹ch C©u hoµn");
		elseif nRand <= 9990 then
			AddItem(2,1,1049,1,4);
			Msg2Player("B¹n nhËn ®­îc bao m¶nh Thiªn Th¹ch");
		elseif nRand <= 9995 then
			AddItem(2,1,1003,1,4);
			Msg2Player("B¹nh nhËn ®­îc Kú L©n hoµn");
		else
			AddItem(2,1,1002,1,4);
			Msg2Player("B¹n nhËn ®­îc Long HuyÕt hoµn");
		end;
		WriteLog("[Bao kiÕm hiÖp ®¹i lÔ]:"..GetName().."Sö dông mét Bao kiÕm hiÖp ®¹i lÔ")
	end;
end;

function nothing()

end;