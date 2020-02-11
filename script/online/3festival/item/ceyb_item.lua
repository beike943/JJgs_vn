Include("\\script\\online\\3festival\\3festival_head.lua")
function OnUse(nItemIdx)
	if DelItemByIndex(nItemIdx,1) == 1 then
		ModifyGoldenExp(3000000);
		Msg2Player("Bπn nhÀn Æ≠Óc 3 tri÷u Æi”m kinh nghi÷m");
		if GetSex() == 1 then
			if random(1,100) <= 2 then
				local nRetCode = AddItem(tItemInfo[14][2],tItemInfo[14][3],tItemInfo[14][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Bπn nhÀn Æ≠Óc 1 HÀu Ngh÷ Lπc NhÀt Hoµn");
					WriteLog("[Tam ti’t li™n th´ng]:"..GetName().."NhÀn Æ≠Óc 1 HÀu Ngh÷ Lπc NhÀt Hoµn");
				else
					WriteLog("[LÁi Tam ti’t li™n th´ng]:"..GetName().."LÁi nhÀn Æ≠Óc HÀu Ngh÷ Lπc NhÀt Hoµn, trﬁ quay lπi AddItem:"..nRetCode);
				end;
			end;
		else
			if random(1,100) <= 2 then
				local nRetCode = AddItem(tItemInfo[13][2],tItemInfo[13][3],tItemInfo[13][4],1,1,-1,-1,-1,-1,-1,-1);
				if nRetCode == 1 then
					Msg2Player("Bπn nhÀn Æ≠Óc c∏i Hªng Nga Nguy÷t VÚ ß∏i");
					WriteLog("[Tam ti’t li™n th´ng]:"..GetName().."nhÀn Æ≠Óc 1 Hªng Nga Nguy÷t VÚ ß∏i");
				else
					WriteLog("[LÁi Tam ti’t li™n th´ng]:"..GetName().."LÁi nhÀn Æ≠Óc Hªng Nga Nguy÷t Quang GiÌi, trﬁ quay lπi AddItem:"..nRetCode);
				end;
			end;
		end;
	end;
end;