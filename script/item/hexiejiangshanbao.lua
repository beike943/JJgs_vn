Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = " tói Hßa Hµi Giang S¬n";
g_NeedRoom = 15;
g_NeedWeight = 200;
TSK_COUNTER = 1158;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				format("Xem bªn trong cã g× ®·!/#see_item(%d)",nItemIdx),
				"T¹m thêi kh«ng më/nothing",
				}
	Say("§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. Xin l­u ý: Më 2 tói sÏ nhËn ®­îc 1 ThÇn N«ng §¬n, 4 tói sÏ nhËn ®­îc ngÉu nhiªn Linh Th¹ch cÊp 5, më 4 tói sÏ nhËn ®­îc ngÉu nhiªn 1 §¹o cô Hoµng Kim, më 10 tói sÏ nhËn ®­îc ngÉu nhiªn 1 Linh Th¹ch cÊp 6, më 30 tói sÏ nhËn ®­îc t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn - h¹, më 40 tói sÏ nhËn ®­îc 1 N«ng Tang phæ, më 60 tói sÏ nhËn ®­îc 1 Linh Th¹ch cÊp 7 ngÉu nhiªn, më 120 tói sÏ nhËn ®­îc t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn Tµn cña L­u Ph¸i - h¹, më 200 tói sÏ nhËn ®­îc ngÉu nhiªn 1 B«n Tiªu hoÆc §»ng Vô. B¹n x¸c nhËn më <color=yellow>"..g_ItemName.."<color> chø? <color=red>Chó ý <color>: B¹n cÇn ph¶i cã "..g_NeedRoom.." chç trèng vµ "..g_NeedWeight.." Søc lùc. Ng­êi ch­a gia nhËp L­u Ph¸i sÏ nhËn ®­îc ngÉu nhiªn L­u Ph¸i 1 TrÊn Ph¸i quyÓn",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = " 1 Bµn Long BÝch, 1 XÝch ThiÕt Tinh, Danh Väng ngÉu nhiªn 50-100 ®iÓm, cèng hiÕn S­ M«n 50 ®iÓm (CÇn ph¶i gia nhËp M«n Ph¸i), ngÉu nhiªn 1 Linh Th¹ch cÊp 1 - 4, 3 Sinh ®å chøng th­, 3 Tó tµi chøng th­, 3 Cö nh©n chøng th­, 1 ThÇn N«ng §¬n, ngÉu nhiªn 1 Linh Th¹ch cÊp 5, ngÉu nhiªn 1 §¹o cô Hoµng Kim, ngÉu nhiªn 1 Linh Th¹ch cÊp 6, t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn - h¹, N«ng Tang phæ, 1 Linh Th¹ch cÊp 7 ngÉu nhiªn, t­¬ng øng L­u Ph¸i TrÊn Ph¸i quyÓn - h¹, ngÉu nhiªn 1 B«n Tiªu hoÆc §»ng Vô";
	Talk(1,"#OnUse("..nItemIdx..")","Mçi '"..g_ItemName.." cã thÓ më ®­îc c¸c vËt phÈm: "..szItems..". Chóc b¹n may m¾n!");
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
	[19] = {{"V« ¶nh Ma Cæ-trung",2,1,956},{"V« Thiªn Ma C«ng-trung",2,1,953}},
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
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--ÅÍÁúèµ1¸ö
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("B¹n nhËn ®­îc 1 Bµn Long BÝch");
			AddItem(2,1,2652,1);
			Msg2Player("B¹n nhËn ®­îc 1 XÝch ThiÕt Tinh");
			ModifyReputation(random(50,100),0);	--ÉùÍû50-100Ëæ»ú
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+50);	--Ê¦ÃÅ¹±Ï×¶È50
				Msg2Player("B¹n nhËn ®­îc 50 ®iÓm cèng hiÕn S­ M«n");
			end;
			nRand = random(1,4);
			lspf_AddLingShiInBottle(nRand,1);	--Ëæ»ú1-4¼¶Ëæ»úÁéÊ¯1¿Å
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
			give_item(2,1,343,1,"ThÇn N«ng §¬n",200,2,0)	--ÉñÅ©µ¤1¿Å,20%ÇÒÃ¿¿ª2¸ö°ü±Ø¸ø1¸ö
			add_lingshi(5,1,100,4,0);	--Ëæ»ú5¼¶ÁéÊ¯1¿Å,10%ÇÒÃ¿¿ª4¸ö°ü±Ø¸ø1¸ö
			add_golden_tool(1,100,4);	--Ëæ»ú»Æ½ð¹¤¾ß1°Ñ,10%ÇÒÃ¿¿ª4¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æ
			add_lingshi(6,1,50,10);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª10¸ö°ü±Ø¸ø1¸ö
			add_zpcp(tZJCP,1,10,30);	--¶ÔÓ¦Á÷ÅÉÕòÅÉ²Ð¾íÖÐ¾í,1%ÇÒÃ¿¿ª30¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,1056,1,"N«ng Tang phæ",5,40,1);	--Å©É£¼­Òª,0.5%ÇÒÃ¿¿ª40¸ö°ü±Ø¸ø1¸ö
			add_lingshi(7,1,2,60);	--Ëæ»ú7¼¶ÁéÊ¯1¿Å,0.2%ÇÒÃ¿¿ª60¸ö°ü±Ø¸ø1¸ö
			add_zpcp(tXJCP,1,2,120);	--¶ÔÓ¦Á÷ÅÉÕòÅÉ²Ð¾íÏÂ²á,0.2%ÇÒÃ¿¿ª120¸ö°ü±Ø¸ø1¸ö
			add_horse(2,200);	--±¼Ïü»òÌÚÎíËæ»ú1Æ¥£¬0.2%ÇÒÃ¿¿ª200¸ö°ü±Ø¸ø1¸ö
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
function give_zpcp(tbZPCP,nCount)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,nCount);		
	show_msg(szName,1);
end;
--¸øÎïÆ·£¬²ÎÊýÒÀ´ÎÎª£ºÎïÆ·ID1,ÎïÆ·ID2,ÎïÆ·ID3,ÊýÁ¿£¬ÎïÆ·Ãû×Ö£¬¸ÅÂÊ£¨µ¥Î»Ç§·ÖÒ»£©£¬±Ø¸øµÄ´ÎÊý£¬ÊÇ·ñ·¢È«·þ¹«¸æ£¬ÓÐÏÞÌìÊý
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
	end;
end;
--¸øÁéÊ¯¡£²ÎÊý£ºµÈ¼¶£¬ÊýÁ¿£¬¸ÅÂÊ£¨µ¥Î»Ç§·ÖÒ»£©£¬±Ø¸øµÄ´ÎÊý£¬ÊÇ·ñ·¢È«·þ¹«¸æ£º0²»·¢£¬1·¢
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ä¬ÈÏ·¢È«·þ¹«¸æ
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (cÊp) Linh Th¹ch",bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (cÊp) Linh Th¹ch",bGlobalMsg);
	end;
end;
--¸øÁéÊ¯Åä·½¡£²ÎÊý£ºµÈ¼¶£¬ÊýÁ¿£¬¸ÅÂÊ£¨µ¥Î»Ç§·ÖÒ»£©£¬±Ø¸øµÄ´ÎÊý
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ä¬ÈÏ·¢È«·þ¹«¸æ
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr­¬ng"..nLevel.." (cÊp)-linh th¹ch phèi ph­¬ng.",bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr­¬ng"..nLevel.." (cÊp)-linh th¹ch phèi ph­¬ng.",bGlobalMsg);
	end;
end;

function add_zpcp(tbZPCP,nCount,nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	if nRand <= nP then
		give_zpcp(tbZPCP,nCount);
	end;
	if mod(nCurCount,nModCount) == 0 then
		give_zpcp(tbZPCP,nCount);
	end;
end;

function add_horse(nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	local szItemName = "";
	if nRand <= nP then 		--±¼Ïü»òÌÚÎíËæ»ú1Æ¥
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
	if mod(nCurCount,nModCount) == 0 then
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
end;

function add_golden_tool(nCount,nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	local nRandomItem = random(23,28);
	if nRand <= nP then
		AddItem(0,200,nRandomItem,nCount,1);
		Msg2Player("B¹n nhËn ®­îc 1 c«ng cô Kü n¨ng sèng");
	end;
	if mod(nCurCount,nModCount) == 0 then
		AddItem(0,200,nRandomItem,nCount,1);
		Msg2Player("B¹n nhËn ®­îc 1 c«ng cô Kü n¨ng sèng");	
	end;
end;

function nothing()

end;