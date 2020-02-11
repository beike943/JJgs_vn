Include("\\script\\lib\\globalfunctions.lua");

g_ItemName = "Tói ChiÕn Ho¶ Liªu Thµnh ";
g_NeedRoom = 18;
g_NeedWeight = 300;
TSK_COUNTER = 1799;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				"Xem bªn trong cã g× ®·!/see_item",
				"T¹m thêi kh«ng më/nothing",
				}
	Say("§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. Xin h·y l­u ý: Më 4 tói sÏ nhËn ®­îc 1 C«ng Thµnh Tiªn Phong MÖnh, më 4 tói sÏ nhËn ®­îc 1 R­¬ng §ång Giang S¬n, më 10 tói sÏ nhËn ®­îc 1 B¹ch Ngäc Th¹ch, më 20 tói sÏ nhËn ®­îc 1 TrÊn Ph¸i quyÓn-trung, më 40 Tói sÏ nhËn ®­îc 1 R­¬ng B¸u ThÞnh thÕ, më 150 tói sÏ nhËn ®­îc 1 R­¬ng Vµng ThÞnh thÕ, më 200 tói sÏ nhËn ®­îc 1 B«n Tiªu hoÆc 1 §»ng Vô, më 240 tói sÏ nhËn ®­îc 1 TrÊn Ph¸i quyÓn-h¹. B¹n x¸c ®Þnh më <color=yellow>"..g_ItemName.."<color> chø? <color=red>Chó ý <color>: B¹n cÇn ph¶i cã "..g_NeedRoom.." chç trèng vµ "..g_NeedWeight.."Søc lùc; ng­êi ch­a gia nhËp L­u Ph¸i sÏ ngÉu nhiªn nhËn ®­îc TrÊn Ph¸i quyÓn cña L­u Ph¸i.",getn(selTab),selTab);
end;

function see_item()
	local szItems = "1 Bµn Long BÝch, 50 ®iÓm Danh Väng, R­¬ng b¸u s¾t Giang S¬n, 1 R­¬ng vò khÝ b¹c, 3 Sinh Viªn chøng th­, 3 Tó Tµi chøng th­, 3 B»ng Cö Nh©n, C«ng Thµnh Tiªn Phong MÖnh, R­¬ng b¸u §ång Giang S¬n, b¹ch Ngäc Th¹ch, t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn-trung, R­¬ng B¸u ThÞnh thÕ, R­¬ng Vµng ThÞnh thÕ, b«n Tiªu hoÆc ngÉu nhiªn 1 §»ng Vô, t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn-h¹.";
	Talk(1,"","Mçi '"..g_ItemName.." cã thÓ më ®­îc c¸c vËt phÈm: "..szItems..". Chóc b¹n may m¾n!");
end;

tZJCP = 
{
	[0]  = {{"DÞch C©n Kinh-trung",2,1,917},{"TÈy Tñy Kinh-trung",2,1,923},{"Nh­ Lai ThÇn Ch­ëng-trung",2,1,920},{"HÊp Tinh TrËn-trung",2,1,926},{"V¹n T­íng ThÇn C«ng-trung",2,1,929},{"Thiªn ¢m TrÊn Hån Khóc-trung",2,1,932},{"Gi¸ng Long ThËp B¸t Ch­ëng-trung",2,1,935},{"§¶ CÈu C«n TrËn-trung",2,1,938},{"V« Th­îng Th¸i Cùc KiÕm-trung",2,1,941},{"Th¸i Cùc ThÇn C«ng-trung",2,1,944},{"Liªn Hoµn Toµn Long Th­¬ng-trung",2,1,947},{"B¸ V­¬ng T­êng Phông TiÔn-trung",2,1,950},{"V« ¶nh Ma Cæ-trung",2,1,953},{"V« Thiªn Ma C«ng-trung",2,1,956}},
	[1]  = {{"DÞch C©n Kinh-trung",2,1,917},{"TÈy Tñy Kinh-trung",2,1,923},{"Nh­ Lai ThÇn Ch­ëng-trung",2,1,920}},
	[2]  = {{"DÞch C©n Kinh-trung",2,1,917}},
	[3]  = {{"TÈy Tñy Kinh-trung",2,1,923}},
	[4]  = {{"Nh­ Lai ThÇn Ch­ëng-trung",2,1,920}},
	[5]  = {{"HÊp Tinh TrËn-trung",2,1,926}},
	[6]  = {{"HÊp Tinh TrËn-trung",2,1,926}},
	[7]  = {{"V¹n T­íng ThÇn C«ng-trung",2,1,929},{"Thiªn ¢m TrÊn Hån Khóc-trung",2,1,932}},
	[8]  = {{"V¹n T­íng ThÇn C«ng-trung",2,1,929}},
	[9]  = {{"Thiªn ¢m TrÊn Hån Khóc-trung",2,1,932}},
	[10] = {{"Gi¸ng Long ThËp B¸t Ch­ëng-trung",2,1,935},{"§¶ CÈu C«n TrËn-trung",2,1,938}},
	[11] = {{"Gi¸ng Long ThËp B¸t Ch­ëng-trung",2,1,935}},
	[12] = {{"§¶ CÈu C«n TrËn-trung",2,1,938}},
	[13] = {{"V« Th­îng Th¸i Cùc KiÕm-trung",2,1,941},{"Th¸i Cùc ThÇn C«ng-trung",2,1,944}},
	[14] = {{"V« Th­îng Th¸i Cùc KiÕm-trung",2,1,941}},
	[15] = {{"Th¸i Cùc ThÇn C«ng-trung",2,1,944}},
	[16] = {{"Liªn Hoµn Toµn Long Th­¬ng-trung",2,1,947},{"B¸ V­¬ng T­êng Phông TiÔn-trung",2,1,950}},
	[17] = {{"Liªn Hoµn Toµn Long Th­¬ng-trung",2,1,947}},
	[18] = {{"B¸ V­¬ng T­êng Phông TiÔn-trung",2,1,950}},
	[19] = {{"V« Thiªn Ma C«ng-trung",2,1,956},{"V« ¶nh Ma Cæ-trung",2,1,953}},
	[20] = {{"V« Thiªn Ma C«ng-trung",2,1,956}},
	[21] = {{"V« ¶nh Ma Cæ-trung",2,1,953}},
}

tXJCP = 
{
	[0]  = {{"DÞch C©n Kinh-h¹ ",2,1,918},{"TÈy Tñy Kinh-h¹ ",2,1,924},{"Nh­ Lai ThÇn Ch­ëng-h¹ ",2,1,921},{"HÊp Tinh TrËn-h¹ ",2,1,927},{"V¹n T­íng ThÇn C«ng-h¹ ",2,1,930},{"Thiªn ¢m TrÊn Hån Khóc-h¹ ",2,1,933},{"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ",2,1,936},{"§¶ CÈu C«n TrËn-h¹ ",2,1,939},{"V« Th­îng Th¸i Cùc KiÕm-h¹ ",2,1,942},{"Th¸i Cùc ThÇn C«ng-h¹ ",2,1,945},{"Liªn Hoµn Toµn Long Th­¬ng-h¹ ",2,1,948},{"B¸ V­¬ng T­êng Phông TiÔn-h¹ ",2,1,951},{"V« ¶nh Ma Cæ-h¹ ",2,1,954},{"V« Thiªn Ma C«ng-h¹ ",2,1,957}},
	[1]  = {{"DÞch C©n Kinh-h¹ ",2,1,918},{"TÈy Tñy Kinh-h¹ ",2,1,924},{"Nh­ Lai ThÇn Ch­ëng-h¹ ",2,1,921}},
	[2]  = {{"DÞch C©n Kinh-h¹ ",2,1,918}},
	[3]  = {{"TÈy Tñy Kinh-h¹ ",2,1,924}},
	[4]  = {{"Nh­ Lai ThÇn Ch­ëng-h¹ ",2,1,921}},
	[5]  = {{"HÊp Tinh TrËn-h¹ ",2,1,927}},
	[6]  = {{"HÊp Tinh TrËn-h¹ ",2,1,927}},
	[7]  = {{"V¹n T­íng ThÇn C«ng-h¹ ",2,1,930},{"Thiªn ¢m TrÊn Hån Khóc-h¹ ",2,1,933}},
	[8]  = {{"V¹n T­íng ThÇn C«ng-h¹ ",2,1,930}},
	[9]  = {{"Thiªn ¢m TrÊn Hån Khóc-h¹ ",2,1,933}},
	[10] = {{"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ",2,1,936},{"§¶ CÈu C«n TrËn-h¹ ",2,1,939}},
	[11] = {{"Gi¸ng Long ThËp B¸t Ch­ëng-h¹ ",2,1,936}},
	[12] = {{"§¶ CÈu C«n TrËn-h¹ ",2,1,939}},
	[13] = {{"V« Th­îng Th¸i Cùc KiÕm-h¹ ",2,1,942},{"Th¸i Cùc ThÇn C«ng-h¹ ",2,1,945}},
	[14] = {{"V« Th­îng Th¸i Cùc KiÕm-h¹ ",2,1,942}},
	[15] = {{"Th¸i Cùc ThÇn C«ng-h¹ ",2,1,945}},
	[16] = {{"Liªn Hoµn Toµn Long Th­¬ng-h¹ ",2,1,948},{"B¸ V­¬ng T­êng Phông TiÔn-h¹ ",2,1,951}},
	[17] = {{"Liªn Hoµn Toµn Long Th­¬ng-h¹ ",2,1,948}},
	[18] = {{"B¸ V­¬ng T­êng Phông TiÔn-h¹ ",2,1,951}},
	[19] = {{"V« ¶nh Ma Cæ-h¹ ",2,1,954},{"V« Thiªn Ma C«ng-h¹ ",2,1,957}},
	[20] = {{"V« Thiªn Ma C«ng-h¹ ",2,1,957}},
	[21] = {{"V« ¶nh Ma Cæ-h¹ ",2,1,954}},
}

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--µ±Ç°ÊÇµÚ¼¸´Î¿ªÆô
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--ÅÍÁúèµ1¸öÊ±ÏÞ7Ìì
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B¹n nhËn ®­îc 1 Bµn Long BÝch");
			ModifyReputation(50,0);
			AddItem(2,0,1025,1);
			Msg2Player("B¹n nhËn ®­îc 1 R­¬ng b¸u s¾t Giang S¬n ");
			nRetCode,nItemIdx = AddItem(2,1,1147,1);
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B¹n nhËn ®­îc 1 R­¬ng vò khÝ B¹c");
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
			szItemName = "1 C«ng Thµnh Tiªn Phong LÖnh ";
			if nRand <= 10 then
				AddItem(2,1,1203,1);	--¹¥³ÇÏÈ·æÁî
				show_msg(szItemName);
			end;
			if mod(nCurCount,4) == 0 then
				AddItem(2,1,1203,1);	--¹¥³ÇÏÈ·æÁî
				show_msg(szItemName);
			end;
			nRand = random(1,100);
			szItemName = "1 R­¬ng b¸u §ång Giang S¬n ";
			if nRand <= 10 then
				AddItem(2,0,1026,1);	--½­É½Í­±¦Ïä
				show_msg(szItemName);
			end;
			if mod(nCurCount,4) == 0 then
				AddItem(2,0,1026,1);	--½­É½Í­±¦Ïä
				show_msg(szItemName);
			end;
			give_item(2,1,1024,1,"1 B¹ch Ngäc th¹ch",50,10);
			nRand = random(1,100);
			if nRand <= 3 then
				give_zpcp(tZJCP);
			end;
			if mod(nCurCount,20) == 0 then
				give_zpcp(tZJCP);
			end;
			give_item(2,0,1027,1,"1 R­¬ng B¸u ThÞnh thÕ ",2,40);
			give_item(2,0,1028,1,"1 R­¬ng vµng ThÞnh ThÕ",4,150,7);
			nRand = random(1,1000);
			if nRand <= 2 then 		--±¼Ïü»òÌÚÎíËæ»ú1Æ¥
				if random(1,2) == 1 then
					szItemName = "1 B«n tiªu";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				else
					szItemName = "1 §»ng Vô";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				end;
			end;
			if mod(nCurCount,200) == 0 then
				if random(1,2) == 1 then
					szItemName = "1 B«n tiªu";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				else
					szItemName = "1 §»ng Vô";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				end;			
			end;
			nRand = random(1,1000);
			if nRand <= 2 then
				give_zpcp(tXJCP);
			end;
			if mod(nCurCount,240) == 0 then
				give_zpcp(tXJCP);
			end;
			WriteLog("["..g_ItemName.."]:"..GetName().."thø"..nCurCount.." më "..g_ItemName);
		end;
	else
		Talk(1,"","Kho¶ng trèng hoÆcsøc lùccña b¹n kh«ng ®ñ. Xin kiÓm tra l¹i hµnh trang tr­íc!"..g_ItemName.."!");
	end;
end;
--ÏµÍ³ÌáÊ¾¼°ÈÕÖ¾¡£µÚ¶þ¸ö²ÎÊýÌî1±íÊ¾·¢È«·þÎñÆ÷ÏµÍ³ÏûÏ¢
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("B¹n nhËn ®­îc "..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(GetName().."Më '"..g_ItemName.." nhËn ®­îc "..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."NhËn ®­îc"..szItemName);	
end;
--¸øÕòÅÉ²ÐÆªµÄº¯Êý
function give_zpcp(tbZPCP)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,1);		
	show_msg(szName,1);
end;
--¸øÎïÆ·£¬²ÎÊýÒÀ´ÎÎª£ºÎïÆ·ID1,ÎïÆ·ID2,ÎïÆ·ID3,ÊýÁ¿£¬ÎïÆ·Ãû×Ö£¬¸ÅÂÊ£¨µ¥Î»Ç§·ÖÒ»£©£¬±Ø¸øµÄ´ÎÊý£¬ÓÐÏÞÌìÊý
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,1);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
	end;
end;

function nothing()

end;