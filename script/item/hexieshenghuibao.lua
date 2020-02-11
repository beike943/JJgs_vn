Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Tói Hßa Hµi Thµnh Héi ";
g_NeedRoom = 15;
g_NeedWeight = 200;
TSK_COUNTER = 1800;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				"Xem bªn trong cã g× ®·!/see_item",
				"T¹m thêi kh«ng më/nothing",
				}
	Say("§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. L­u ý: më 4 tói sÏ nhËn ®­îc ngÉu nhiªn 1 Linh Th¹ch cÊp 5, më 10 tói sÏ nhËn ®­îc ngÉu nhiªn 1 Linh Th¹ch Phèi Ph­¬ng cÊp 6, më 12 tói sÏ nhËn ®­îc 1 NguyÖt Hoa, më 20 tói sÏ nhËn ®­îc ngÉu nhiªn 1 Linh Th¹ch cÊp 6, më 40 tói sÏ nhËn ®­îc 1 N«ng Tang phæ, më 60 tói sÏ nhËn ®­îc 1 Linh Th¹ch cÊp 7 ngÉu nhiªn, më 200 tói sÏ nhËn ®­îc ngÉu nhiªn 1 B«n Tiªu hoÆc §»ng Vô, më 240 tói sÏ nhËn ®­îc t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn - h¹. B¹n x¸c nhËn më <color=yellow>"..g_ItemName.."<color> chø? <color=red>Chó ý <color>: B¹n cÇn ph¶i cã "..g_NeedRoom.." chç trèng vµ "..g_NeedWeight.." Søc lùc. Ng­êi ch­a gia nhËp L­u Ph¸i sÏ nhËn ®­îc ngÉu nhiªn L­u Ph¸i 1 TrÊn Ph¸i quyÓn",getn(selTab),selTab);
end;

function see_item()
	local szItems = " ngÉu nhiªn 1 - 2 Bµn Long BÝch, 50 ®iÓm Danh Väng, ngÉu nhiªn 1 Linh Th¹ch, 3 Sinh ®å chøng th­, 3 Tó tµi chøng th­, 3 Cö nh©n chøng th­, ngÉu nhiªn 1 Linh Th¹ch cÊp 5, ngÉu nhiªn 1 Linh Th¹ch Phèi Ph­¬ng cÊp 6, NguyÖt Hoa, ngÉu nhiªn 1 Linh Th¹ch cÊp 6, N«ng Tang phæ, 1 Linh Th¹ch cÊp 7 ngÉu nhiªn, ngÉu nhiªn 1 B«n Tiªu hoÆc §»ng Vô, t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn - h¹.";
	Talk(1,"","Mçi '"..g_ItemName.." cã thÓ më ®­îc c¸c vËt phÈm: "..szItems..". Chóc b¹n may m¾n!");
end;

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
			local nLSLevel = 0;
			local nRetCode,nItemIdx = 0,0;
			nRand = random(1,2);
			for i=1,nRand do
				nRetCode,nItemIdx = AddItem(2,1,1000,1);	--ÅÍÁúèµ1-2¸ö
				SetItemExpireTime(nItemIdx,7*24*3600);
			end;
			Msg2Player("B¹n nhËn ®­îc "..nRand.." Bµn Long BÝch ");
			ModifyReputation(50,0);
			nRand = random(1,4);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("B¹n nhËn ®­îc 1 "..nRand.." (cÊp) Linh Th¹ch");
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
			nRand = random(1,100);
			if nRand < 10 then
				lspf_AddLingShiInBottle(5,1);
				Msg2Player("B¹n nhËn ®­îc 1 Linh Th¹ch cÊp 5");
			end;
			if mod(nCurCount,4) == 0 then
				lspf_AddLingShiInBottle(5,1);
				Msg2Player("B¹n nhËn ®­îc 1 Linh Th¹ch cÊp 5");
			end;
			add_peifang(6,1,50,10);
			give_item(2,1,2002,1,"NguyÖt Hoa ",50,12);	
			add_lingshi(6,1,20,20);
			give_item(2,1,1056,1,"N«ng Tang phæ",5,40);
			add_lingshi(7,1,2,60);
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
--¸øÁéÊ¯¡£²ÎÊý£ºµÈ¼¶£¬ÊýÁ¿£¬¸ÅÂÊ£¨µ¥Î»Ç§·ÖÒ»£©£¬±Ø¸øµÄ´ÎÊý
function add_lingshi(nLevel,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (cÊp) Linh Th¹ch",1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (cÊp) Linh Th¹ch",1);
	end;
end;
--¸øÁéÊ¯Åä·½¡£²ÎÊý£ºµÈ¼¶£¬ÊýÁ¿£¬¸ÅÂÊ£¨µ¥Î»Ç§·ÖÒ»£©£¬±Ø¸øµÄ´ÎÊý
function add_peifang(nLevel,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr­¬ng"..nLevel.." (cÊp)-linh th¹ch phèi ph­¬ng.",1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr­¬ng"..nLevel.." (cÊp)-linh th¹ch phèi ph­¬ng.",1);
	end;
end;

function nothing()

end;