Include("\\script\\lib\\globalfunctions.lua");
function OnUse()
	local selTab = {
				"V©ng, ta kh«ng thÓ ®îi ®­îc n÷a./use",
				"Th«i, ®Ó sau h·y më./nothing",
				}
	Say("Bªn trong tói quµ cã rÊt nhiÒu vËt phÈm, xin x¸c nhËn hµnh trang ®ñ kho¶ng trèng vµ søc lùc, b¹n muèn më kh«ng?",getn(selTab),selTab);
end;

function use()
	if gf_JudgeRoomWeight(6,300) ~= 1 then
		Talk(1,"","B¹n kh«ng ®ñ chç hoÆc kh«ng ®ñ søc lùc, h·y s¾p xÕp l¹i vµ më bao l× x× b¸nh Ýt.")
		return 0;
	end;
	if DelItem(2,1,966,1) == 1 then
		local nRand = random(1,100);
		if nRand <= 25 then
			if AddItem(2,1,390,100) == 1 then
				Msg2Player("B¹n ®· nhËn ®­îc 100 c¸i b¸nh Ýt nh©n trøng.");
			end;
		elseif nRand <= 50 then
			if AddItem(2,1,388,50) == 1 then
				Msg2Player("B¹n ®· nhËn ®­îc 50 c¸i b¸nh Ýt nh©n thÞt.");
			end;
		elseif nRand <= 70 then
			if AddItem(2,1,391,50) == 1 then
				Msg2Player("B¹n ®· nhËn ®­îc 50 c¸i b¸nh Ýt thËp cÈm.");
			end;
		elseif nRand <= 90 then
			if AddItem(2,1,389,50) == 1 then
				Msg2Player("B¹n ®· nhËn ®­îc 50 c¸i b¸nh Ýt møt.");
			end;
		else
			if AddItem(2,1,392,5) == 1 then
				Msg2Player("B¹n ®· nhËn ®­îc 5 c¸i b¸nh Ýt gia h­ng.");
			end;
		end;
	end;
end;

function nothing()

end;