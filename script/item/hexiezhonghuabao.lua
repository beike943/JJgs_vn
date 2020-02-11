Include("\\script\\lib\\globalfunctions.lua");

g_ItemName = "Tói Hßa Hµi Trung Hoa";
TSK_COUNTER = 1797;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				"Xem bªn trong cã g× ®·!/see_item",
				"T¹m thêi kh«ng më/nothing",
				}
	Say("§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. L­u ı: më 2 tói sÏ nhËn ®­îc 1 Qu©n C«ng Ch­¬ng, më 2 tói sÏ nhËn ®­îc 1 R­¬ng vò khİ B¹c, më 8 tói sÏ nhËn ®­îc 1 tói Gi¸m ®Şnh phï cÊp 7, më 10 tói sÏ nhËn ®­îc 1 B¹ch Ngäc th¹ch, më 80 tói sÏ nhËn ®­îc 1 Long HuyÕt hoµn, më 150 tói sÏ nhËn ®­îc 1 ChiÕn ThÇn hoµn, më 200 tói sÏ nhËn ®­îc 1 B«n Tiªu hoÆc 1 §»ng Vô. B¹n x¸c nhËn më <color=yellow>"..g_ItemName.."<color> chø? CÇn ph¶i cã 17 chç trèng vµ 300 ®iÓm søc lùc.",getn(selTab),selTab);
end;

function see_item()
	Talk(1,"","Mçi '"..g_ItemName..". Cã thÓ nhËn ®­îc nh÷ng vËt sau ®©y: 1 Bµn Long Bİch, Danh Väng ngÉu nhiªn 50-100 ®iÓm, ngÉu nhiªn 20-30 ®iÓm cèng hiÕn S­ M«n (CÇn ph¶i gia nhËp M«n Ph¸i), 1 MÆt n¹ S¸t Thñ §­êng, 3 Sinh ®å chøng th­, 3 Tó tµi chøng th­, 3 Cö nh©n chøng th­, Qu©n C«ng Ch­¬ng, 1 R­¬ng vò khİ B¹c, 1 tói Gi¸m ®Şnh phï cÊp 7, b¹ch Ngäc th¹ch, Long HuyÕt hoµn, ChiÕn ThÇn hoµn, ngÉu nhiªn 1 B«n Tiªu hoÆc §»ng Vô. Chóc b¹n may m¾n!");
end;

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--µ±Ç°ÊÇµÚ¼¸´Î¿ªÆô
	local szItemName = "";
	if gf_JudgeRoomWeight(17,300) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--ÅÍÁúèµ1¸öÊ±ÏŞ7Ìì
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B¹n nhËn ®­îc 1 Bµn Long Bİch");
			ModifyReputation(random(50,100),0);	--50ÖÁ100Ëæ»úÉùÍû
			if GetPlayerRoute() ~= 0 then
				nRand = random(20,30);
				SetTask(336,GetTask(336)+nRand);	--25ÖÁ50Ëæ»úÊ¦ÃÅ¹±Ï×¶È
				Msg2Player("B¹n nhËn ®­îc "..nRand.." ®iÓm cèng hiÕn S­ M«n ");
			end;
			nRetCode,nItemIdx = AddItem(2,1,1087,1);	--É±ÊÖÌÃÃæ¾ß1¸ö	Ê±ÏŞ7Ìì
			--SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B¹n nhËn ®­îc 1 MÆt n¹ S¸t Thñ §­êng ");
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("B¹n ®¹t ®­îc 3 Sinh Viªn Chøng Th­");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("B¹n ®¹t ®­îc 3 Tó Tµi Chøng Th­");			
			else
				AddItem(2,0,599,3);
				Msg2Player("B¹n ®¹t ®­îc 3 Cö Nh©n chøng th­");			
			end;
			if mod(nCurCount,2) == 0 then	--¾ü¹¦ÕÂ,ÎäÆ÷Òø±¦Ïä,Ê±ÏŞ7Ìì
				nRetCode,nItemIdx = AddItem(2,1,9999,1);
				--SetItemExpireTime(nItemIdx,7*24*3600);
				Msg2Player("B¹n nhËn ®­îc 1 Qu©n C«ng Ch­¬ng");
				nRetCode,nItemIdx = AddItem(2,1,1147,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				Msg2Player("B¹n nhËn ®­îc 1 R­¬ng vò khİ B¹c");
			end;
			nRand = random(1,100);
			szItemName = " 1 tói Gi¸m ®Şnh phï cÊp 7";
			if nRand <= 5 then
				nRetCode,nItemIdx = AddItem(2,1,1058,1);	--´ó°ü7¼¶¼ø¶¨·û	Ê±ÏŞ7Ìì
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,8) == 0 then	
				nRetCode,nItemIdx = AddItem(2,1,1058,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,100);
			szItemName = "1 B¹ch Ngäc th¹ch";
			if nRand <= 5 then
				nRetCode,nItemIdx = AddItem(2,1,1024,1);	--ÓùÓÃ°×ÓñÊ¯ Ê±ÏŞ7Ìì
				--SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,10) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1024,1);	--ÓùÓÃ°×ÓñÊ¯ Ê±ÏŞ7Ìì
				--SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,1000);
			szItemName = "1 Long HuyÕt hoµn";
			if nRand <= 5 then 
				nRetCode,nItemIdx = AddItem(2,1,1002,1);	--ÁúÑªÍè Ê±ÏŞ7Ìì
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,80) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1002,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;		
			nRand = random(1,1000);
			szItemName = "1 ChiÕn ThÇn hoµn";
			if nRand <= 4 then 
				nRetCode,nItemIdx = AddItem(2,1,1005,1);	--Õ½ÉñÍè Ê±ÏŞ7Ìì
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			if mod(nCurCount,150) == 0 then
				nRetCode,nItemIdx = AddItem(2,1,1005,1);
				SetItemExpireTime(nItemIdx,7*24*3600);
				show_msg(szItemName);
			end;
			nRand = random(1,1000);
			if nRand <= 2 then 		--±¼Ïü»òÌÚÎíËæ»ú1Æ¥
				if random(1,2) == 1 then
					szItemName = "1 B«n tiªu";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				else
					szItemName = "1 §»ng Vô";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				end;
			end;
			if mod(nCurCount,200) == 0 then
				if random(1,2) == 1 then
					szItemName = "1 B«n tiªu";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				else
					szItemName = "1 §»ng Vô";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName)
				end;			
			end;
			WriteLog("["..g_ItemName.."]:"..GetName().."thø"..nCurCount.." më "..g_ItemName);
		end;
	else
		Talk(1,"","Kho¶ng trèng hoÆcsøc lùccña b¹n kh«ng ®ñ. Xin kiÓm tra l¹i hµnh trang tr­íc!"..g_ItemName.."!");
	end;
end;

function show_msg(szItemName)
	Msg2Player("B¹n nhËn ®­îc "..szItemName);
	Msg2Global(GetName().."Më '"..g_ItemName.." nhËn ®­îc "..szItemName);
	WriteLog("["..g_ItemName.."]:"..GetName().."NhËn ®­îc"..szItemName);	
end;

function nothing()

end;