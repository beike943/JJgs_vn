Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 1 then
		local selTab = {
					format("§ång ý/#use_yes(%d)",nItemIdx),
					"Hñy bá/nothing",
					}
		Say("B¹n muèn më T¸i chiÕn giang hå-Hµo hoa lÔ bao?",getn(selTab),selTab);
	else
		Talk(1,"","B¹n ph¶i gia nhËp l­u ph¸i míi cã thÓ sö dông T¸i chiÕn giang hå-Hµo hoa lÔ bao.");
	end;
end;

function use_yes(nIdx)
	if gf_JudgeRoomWeight(16,400) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm tra l¹i!");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	if DelItemByIndex(nIdx,1) == 1 then
		Earn(20000000);		
		nRetCode,nItemIdx = AddItem(2,1,1002,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Long HuyÕt hoµn");
		nRetCode,nItemIdx = AddItem(2,1,1003,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Kú L©n hoµn");	
		nRetCode,nItemIdx = AddItem(2,1,1004,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Phông HuyÕt hoµn");
		nRetCode,nItemIdx = AddItem(2,1,1056,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 N«ng Tang phæ");
		nRetCode,nItemIdx = AddItem(2,1,1068,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Thiªn Th¹ch linh th¹ch");
		nRetCode,nItemIdx = AddItem(2,1,1067,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 §Þnh Hån Thiªn Th¹ch linh th¹ch");
		nRetCode,nItemIdx = AddItem(2,1,1051,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 bao Thiªn Th¹ch tinh th¹ch");
		nRetCode,nItemIdx = AddItem(2,1,1059,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 b¶o r­¬ng Tµng KiÕm ®Çu qu¸n");
		nRetCode,nItemIdx = AddItem(2,1,1060,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 b¶o r­¬ng Tµng KiÕm y gi¸p");
		nRetCode,nItemIdx = AddItem(2,1,1061,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 b¶o r­¬ng Tµng KiÕm hoa khè");
		nRetCode,nItemIdx = AddItem(2,1,1062,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 b¶o r­¬ng Tµng KiÕm trang søc");
		nRetCode,nItemIdx = AddItem(2,1,1063,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 b¶o r­¬ng vò khÝ Tµng KiÕm");
		nRetCode,nItemIdx = AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B¹n nhËn ®­îc 1 §«ng Ph­¬ng Long Ch©u");
		local nRand = random(38,40)
		if nRand == 38 then
			nRetCode,nItemIdx = AddItem(0,102,nRand,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm b¶o ch©u");		
		elseif nRand == 39 then
			nRetCode,nItemIdx = AddItem(0,102,nRand,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm kú th¹ch");			
		else
			nRetCode,nItemIdx = AddItem(0,102,nRand,1,1,-1,-1,-1,-1,-1,-1);
			Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm kim Ên");			
		end;
		WriteLog("[T¸i chiÕn giang hå-®¹i lÔ bao]:"..GetName().." ®· sö dông 1 T¸i chiÕn giang hå-Hµo hoa lÔ bao")
	end;
end;

function nothing()

end;
