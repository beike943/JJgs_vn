Include("\\script\\lib\\globalfunctions.lua");
function OnUse()
	local selTab = {
				"V©ng, ta kh«ng thÓ ®îi ®­îc n÷a./use",
				"Th«i, ®Ó sau h·y më./nothing",
				}
	Say("Trong bao l× x× b¸nh Ýt cã rÊt nhiÒu vËt phÈm, h·y s¾p xÕp l¹i hµnh trang, ®Ó tr¸nh nh÷ng tæn thÊt kh«ng ®¸ng cã, b¹n cã muèn më bao l× x× b¸nh Ýt kh«ng?",getn(selTab),selTab);
end;

function use()
	if gf_JudgeRoomWeight(6,300) ~= 1 then
		Talk(1,"","B¹n kh«ng ®ñ chç hoÆc kh«ng ®ñ søc lùc, h·y s¾p xÕp l¹i vµ më bao l× x× b¸nh Ýt.")
		return 0;
	end;
	if DelItem(2,1,393,1) == 1 then
		if AddItem(2,1,390,100) == 1 then
			Msg2Player("B¹n ®· nhËn ®­îc 100 c¸i b¸nh Ýt nh©n trøng.");
		end;
		if AddItem(2,1,388,50) == 1 then
			Msg2Player("B¹n ®· nhËn ®­îc 50 c¸i b¸nh Ýt nh©n thÞt.");
		end;
		if AddItem(2,1,389,50) == 1 then
			Msg2Player("B¹n ®· nhËn ®­îc 50 c¸i b¸nh Ýt møt.");
		end;
		if AddItem(2,1,391,50) == 1 then
			Msg2Player("B¹n ®· nhËn ®­îc 50 c¸i b¸nh Ýt thËp cÈm.");
		end;
		if AddItem(2,1,392,5) == 1 then
			Msg2Player("B¹n ®· nhËn ®­îc 5 c¸i b¸nh Ýt gia h­ng.");
		end;
		WriteLog("[Bao l× x× b¸nh Ýt]:"..GetName().."Më bao l× x× b¸nh Ýt.");
	end;
end;

function nothing()

end;