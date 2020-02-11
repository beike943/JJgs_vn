Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "tói n¨m míi h­ng thÞnh";
g_NeedRoom = 16;
g_NeedWeight = 200;
TSK_COUNTER = 1159;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				format("Xem bªn trong cã g× ®·!/#see_item(%d)",nItemIdx),
				"T¹m thêi kh«ng më/nothing",
				}
	Say("§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. Xin l­u ý: mçi khi më 4 tói ph¶i cho 1 linh th¹ch cÊp 5 bÊt kú, 10 tói th× 1 linh th¹ch phèi ph­¬ng bÊt kú, 15 tói th× 1 nguyÖt hoa, 20 tói th× 1 linh th¹ch cÊp 6, 40 tói th× 1 Ngò Hµnh MËt TÞch, 80 tói th× 1 ThÇn Hµnh B¶o §iÓn, 120 tói th× 1 kú kim, 160 tói: 1 Vâ L©m B¶o §iÓn, 300 tói: 1 quyÓn L¨ng Ba Vi Bé. B¹n x¸c nhËn më <color=yellow>"..g_ItemName.."<color> chø? <color=red>Chó ý <color>: B¹n cÇn ph¶i cã "..g_NeedRoom.." chç trèng vµ "..g_NeedWeight.." søc lùc. Linh th¹ch vµ Linh th¹ch phèi ph­¬ng cho vµo Tô Linh §Ünh. ",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = "1 Bµn Long BÝch, 1 XÝch ThiÕt Tinh, danh väng 50, møc ®é ®ãng gãp s­ m«n 2? (ph¶i gia nhËp m«n ph¸i), 1 cñ c¶i ®á, 1 Sinh ®å chøng th­, 3 Tó tµi chøng th­, 3 Cö nh©n chøng th­, 1 linh th¹ch cÊp 5 ngÉu nhiªn, 1 ph«i ph­¬ng linh th¹ch cÊp 6 ngÉu nhiªn, 1 nguyÖt hoa, 1 linh th¹ch cÊp 6 ngÉu nhiªn, 1 Ngò Hµnh MËt TÞch, 1 ThÇn Hµnh B¶o §iÓn, kú kim, 1 Vâ L©m B¶o §iÓn, 1 L¨ng Ba Vi Bé.";
	Talk(1,"#OnUse("..nItemIdx..")","Mçi '"..g_ItemName.." cã thÓ më ®­îc c¸c vËt phÈm: "..szItems..". Chóc b¹n may m¾n!");
end;

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
			ModifyReputation(50,0);	--ÉùÍû50
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+25);	--Ê¦ÃÅ¹±Ï×¶È25
				Msg2Player("B¹n nhËn ®­îc 25 ®iÓm cèng hiÕn s­ m«n");
			end;
			AddItem(2,1,1090,1);
			Msg2Player("B¹n nhËn ®­îc 1 C¶i ®á");
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
			add_lingshi(5,1,100,4,0);	--Ëæ»ú5¼¶ÁéÊ¯1¿Å,10%ÇÒÃ¿¿ª4¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æ
			add_peifang(6,1,50,10,1);	--Ëæ»ú6¼¶ÁéÊ¯Åä·½1ÕÅ,5%ÇÒÃ¿¿ª10¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,2002,1,"1 th¸ng ",50,15,1);	--ÔÂ»ª1¸ö,5%ÇÒÃ¿¿ª15¸ö°ü±Ø¸ø1¸ö
			add_lingshi(6,1,50,20,1);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª20¸ö°ü±Ø¸ø1¸ö
			give_item(0,107,155,1,"1 quyÓn Ngò Hµnh MËt TÞch",10,40,1);--ÎåÐÐÃØ¼®1±¾,1%ÇÒÃ¿¿ª40¸ö°ü±Ø¸ø1¸ö
			give_item(0,200,40,1,"1 quyÓn ThÇn Hµnh B¶o §iÓn",5,80,1);	--ÉñÐÐ±¦µä1±¾,0.5%ÇÒÃ¿¿ª80¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,563,1,"1 Kú Kim",2,120,1);	--Ææ½ð,0.2%ÇÒÃ¿¿ª120¸ö°ü±Ø¸øÒ»¸ö
			give_item(2,1,3206,1,"1Vâ L©m b¶o ®iÓn",1,160,1);--ÎäÁÖ±¦µä1±¾,0.1%ÇÒÃ¿¿ª160¸ö°ü±Ø¸ø1¸ö
			give_item(0,112,78,1,"1 quyÓn L¨ng Ba Vi Bé",1,300,1);--Áè²¨Î¢²½1±¾,0.1%ÇÒÃ¿¿ª300¸ö°ü±Ø¸ø1¸ö
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

function nothing()

end;