Include("\\script\\lib\\globalfunctions.lua");
function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 1 then
		local selTab = {
					format("§ång ý/#use_yes(%d)",nItemIdx),
					"Hñy bá/nothing",
					}
		Say("B¹n muèn më T¸i chiÕn giang hå-ChÝ t«n lÔ bao?",getn(selTab),selTab);
	else
		Talk(1,"","B¹n ph¶i gia nhËp l­u ph¸i míi cã thÓ sö dông T¸i chiÕn giang hå-ChÝ t«n lÔ bao.");
	end;
end;

tBFYWeapon = 
{
[2]  = {{"Ph¸ Yªn ®ao",0,3,6001},{"Ph¸ Yªn c«n",0,5,6002}},
[3]  = {{"Phï Yªn tr­îng",0,8,6003}},
[4]  = {{"Hµm Yªn thñ",0,0,6004}},
[6]  = {{"Tµng Yªn ch©m",0,1,6005}},
[8]  = {{"Phi Yªn kiÕm",0,2,6006}},
[9]  = {{"VËn Yªn cÇm",0,10,6007}},
[11] = {{"V©n Yªn thñ",0,0,6008}},
[12] = {{"L­u Yªn c«n",0,5,6009}},
[14] = {{"HuyÒn Yªn kiÕm",0,2,6010}},
[15] = {{"Vò Yªn bót",0,9,6011}},
[17] = {{"Hµ Tiªm Th­¬ng",0,6,6012}},
[18] = {{"Hµnh Yªn Cung",0,4,6013}},
[20] = {{"Träc Yªn nhÉn",0,7,6014}},
[21] = {{"Yªu Yªn tr¶o",0,11,6015}},
}

function use_yes(nIdx)
	if gf_JudgeRoomWeight(20,600) == 0 then
		Talk(1,"","Kho¶ng trèng hµnh trang hoÆc søc lùc kh«ng ®ñ, xin kiÓm l¹i!");
		return 0;
	end;
	local nRetCode,nItemIdx = 0,0;
	if DelItemByIndex(nIdx,1) == 1 then
		Earn(50000000);		
		nRetCode,nItemIdx = AddItem(2,1,1002,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Long HuyÕt hoµn");
		nRetCode,nItemIdx = AddItem(2,1,1003,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Kú L©n hoµn");	
		nRetCode,nItemIdx = AddItem(2,1,1004,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 Phông HuyÕt hoµn");
		nRetCode,nItemIdx = AddItem(2,1,1005,1);
		SetItemExpireTime(nItemIdx,7*24*3600);
		Msg2Player("B¹n nhËn ®­îc 1 ChiÕn ThÇn hoµn");
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
		local nRand = 0;
		nRand = random(38,40)
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
		local nSex = GetSex();
		nRand = random(1,2);
		if nSex == 1 then
			if nRand == 1 then
				nRetCode,nItemIdx = AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 §«ng Ph­¬ng Long Ch©u");				
			else
				nRetCode,nItemIdx = AddItem(0,102,43,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 HËu NghÖ L¹c NhËt Hoµn");				
			end;
		else
			if nRand == 1 then
				nRetCode,nItemIdx = AddItem(0,102,42,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 H»ng Nga NguyÖt Vò ®¸i");				
			else
				nRetCode,nItemIdx = AddItem(0,102,24,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 §«ng Ph­¬ng Long Ch©u");			
			end;		
		end;
		local nBody = GetBody();
		nRand = random(1,3);
		if nRand == 1 then
				nRetCode,nItemIdx = AddItem(0,103,94+nBody,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm Tö Kim m·o");			
		elseif nRand == 2 then
				nRetCode,nItemIdx = AddItem(0,100,94+nBody,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm Kim Lò th­êng");			
		else
				nRetCode,nItemIdx = AddItem(0,101,94+nBody,1,1,-1,-1,-1,-1,-1,-1);
				Msg2Player("B¹n nhËn ®­îc 1 Tµng KiÕm ¤ kim trang");			
		end;
		local nRoute = GetPlayerRoute();
		local nRandWeapon = random(1,getn(tBFYWeapon[nRoute]));
		local nId1 = tBFYWeapon[nRoute][nRandWeapon][2];
		local nId2 = tBFYWeapon[nRoute][nRandWeapon][3];
		local nId3 = tBFYWeapon[nRoute][nRandWeapon][4];
		local szWeaponName = tBFYWeapon[nRoute][nRandWeapon][1];
		nRetCode,nItemIdx = AddItem(nId1,nId2,nId3,1,1,-1,-1,-1,-1,-1,-1);
		Msg2Player("B¹n nhËn ®­îc "..tostring(szWeaponName).."1 ");				
		WriteLog("[T¸i chiÕn giang hå-®¹i lÔ bao]:"..GetName().." ®· sö dông 1 T¸i chiÕn giang hå-ChÝ t«n lÔ bao")
	end;
end;

function nothing()

end;
