Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(1500000);
		Msg2Player("Bπn nhÀn Æ≠Óc 1500000 Æi”m kinh nghi÷m");
		if random(1,100) <= 5 then
			local nRetCode = AddItem(tItemInfo[12][2],tItemInfo[12][3],tItemInfo[12][4],1,1,-1,-1,-1,-1,-1,-1);
			if nRetCode == 1 then
				Msg2Player("Bπn nhÀn Æ≠Óc mÈt bao thuËc cÒa Nguy÷t L≠Óng ThË");
				WriteLog("[Tam ti’t li™n th´ng]:"..GetName().."nhÀn Æ≠Óc mÈt bao thuËc cÒa Nguy÷t L≠Óng ThË");
			else
				WriteLog("[LÁi Tam ti’t li™n th´ng]:"..GetName().."LÁi nhÀn Æ≠Óc bao thuËc cÒa Nguy÷t L≠Óng ThË, trﬁ quay lπi AddItem:"..nRetCode);
			end;
		end;
	end;
end;