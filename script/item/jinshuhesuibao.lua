Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Tói Kim Thö H¹ TuÕ";
g_NeedRoom = 16;
g_NeedWeight = 200;
TSK_COUNTER = 1149;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				format("Xem bªn trong cã g× ®·!/#see_item(%d)",nItemIdx),
				"T¹m thêi kh«ng më/nothing",
				}
	Say("§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. Mçi ng­êi mçi khi më 4 tói ph¶i ®­a 1 §¹i Néi Thanh §ång , khi më 10 tói ph¶i ®­a 1 Linh th¹ch phèi ph­¬ng cÊp 6 ngÉu nhiªn, khi më 20 tói ph¶i ®­a 1 NguyÖt Hoa, khi më 30 tói ph¶i ®­a 1 Linh th¹ch phèi ph­¬ng cÊp 6, khi më 40 tói ph¶i ®­a 1 ch×a khãa r­¬ng vµng (chØ cã 1 c¬ héi), khi më 60 tói ph¶i ®­a 1 Linh th¹ch cÊp 7 ngÉu nhiªn, khi më 100 tói ph¶i ®­a 1 Kú Kim, khi më 160 tói ph¶i ®­a 1 Vâ L©m B¶o §iÓn, khi më 240 tói ph¶i ®­a 1 Thanh §ång §Ønh cÊp 2, khi më 2000 tói ph¶i ®­a 1 Viªm Hoµng ThiÕt Hån. B¹n chÊp nhËn më b©y giê? <color=red>Chó ý<color>: cÇn cã "..g_NeedRoom.." chç trèng vµ "..g_NeedWeight.." søc lùc. Linh th¹ch vµ Linh th¹ch phèi ph­¬ng cho vµo Tô Linh §Ünh. ",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = " 1 XÝch ThiÕt Tinh, 2 Thiªn Th¹ch , 50 danh väng, 25 møc ®é ®ãng gãp s­ m«n (ph¶i gia nhËp m«n ph¸i), 1 cñ c¶i ®á, 3 Sinh §å Chøng Th­, 3 Tó Tµi Chøng Th­, 3 Cö Nh©n Chøng Th­, 1 §¹i Néi Thanh §ång, 1 Linh th¹ch phèi ph­¬ng cÊp 6 ngÉu nhiªn, 1 NguyÖt Hoa, 1 Linh th¹ch cÊp 6 ngÉu nhiªn, ch×a khãa r­¬ng chøa ®å (mçi ng­êi chØ cã 1 c¬ héi), 1 Linh th¹ch cÊp 7 ngÉu nhiªn, Kú Kim, 1 Vâ L©m B¶o §iÓn, 1 Thanh §ång §Ønh cÊp 2, 1 Viªm Hoµng ThiÕt Hån. ";
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
			AddItem(2,1,2652,1);
			Msg2Player("B¹n nhËn ®­îc 1 XÝch ThiÕt Tinh");
			AddItem(2,2,8,2);	--ÔÉÌú2¸ö
			Msg2Player("B¹n nhËn ®­îc 2 Thiªn th¹ch");
			ModifyReputation(50,0);	--ÉùÍû50µã
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
			give_item(2,1,3208,1,"1 §¹i Néi Thanh §ång",10,4);	--´óÄÚÇàÍ­Æ÷1¸ö,10%ÇÒÃ¿¿ª4¸ö°ü±Ø¸ø1¸ö
			add_peifang(6,1,5,10,0);	--Ëæ»ú6¼¶ÁéÊ¯Åä·½1ÕÅ,5%ÇÒÃ¿¿ª10¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æ
			give_item(2,1,2002,1,"1 th¸ng ",5,20,1);--ÔÂ»ª1¸ö,5%ÇÒÃ¿¿ª20¸ö°ü±Ø¸ø1¸ö
			add_lingshi(6,1,5,30,1);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª30¸ö°ü±Ø¸ø1¸ö
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch×a khãa vµng",1,40,1) == 1 then	--1°Ñ´¢ÎïÏä½ðÔ¿³×,1%ÇÒ¿ª40¸ö°ü±Ø¸ø£¨Ã¿ÈËÏÞµÃ1´Î£©
					SetTask(1482,1);	--Ö»ÄÜ»ñµÃÒ»´Î
				end;
			end;
			add_lingshi(7,1,0.2,60,1);	--Ëæ»ú7¼¶ÁéÊ¯1¿Å,0.2%ÇÒÃ¿¿ª60¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,563,1,"1 Kú Kim",0.2,100,1);	--Ææ½ð,0.2%ÇÒÃ¿¿ª100¸ö°ü±Ø¸øÒ»¸ö
			give_item(2,1,3206,1,"1Vâ L©m b¶o ®iÓn",0.1,160,1);--ÎäÁÖ±¦µä1±¾,0.1%ÇÒÃ¿¿ª160¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,3214,1,"1 Thanh §ång §Ønh cÊp 2",0.1,240,1);	--¶þ¼¶ÇàÍ­¶¦1¸ö,0.1%ÇÒÃ¿¿ª240¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,1146,1,"1 Viªm Hoµng ThiÕt hån",0.01,2000,1)	--Ñ×»ÆÌú»ê1¸ö,0.01%ÇÒÃ¿¿ª2000¸ö°ü±Ø¸ø 1¸ö
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
		Msg2Global(get_name().."Më '"..g_ItemName.." nhËn ®­îc "..szItemName);
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
--¸øÎïÆ·£¬²ÎÊýÒÀ´ÎÎª£ºÎïÆ·ID1,ÎïÆ·ID2,ÎïÆ·ID3,ÊýÁ¿£¬ÎïÆ·Ãû×Ö£¬¸ÅÂÊ£¬±Ø¸øµÄ´ÎÊý£¬ÊÇ·ñ·¢È«·þ¹«¸æ£¬ÓÐÏÞÌìÊý
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		nRetResult = 1;
	end;
	return nRetResult;
end;

function give_chest_key(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	if gf_ProbabilityJudge(nP) == 1 then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
		return 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		return 1;
	end;
	return 0;
end;
--¸øÁéÊ¯¡£²ÎÊý£ºµÈ¼¶£¬ÊýÁ¿£¬¸ÅÂÊ£¬±Ø¸øµÄ´ÎÊý£¬ÊÇ·ñ·¢È«·þ¹«¸æ£º0²»·¢£¬1·¢
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ä¬ÈÏ·¢È«·þ¹«¸æ
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (cÊp) Linh Th¹ch",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (cÊp) Linh Th¹ch",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;
--¸øÁéÊ¯Åä·½¡£²ÎÊý£ºµÈ¼¶£¬ÊýÁ¿£¬¸ÅÂÊ£¬±Ø¸øµÄ´ÎÊý
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ä¬ÈÏ·¢È«·þ¹«¸æ
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr­¬ng"..nLevel.." (cÊp)-linh th¹ch phèi ph­¬ng.",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."Tr­¬ng"..nLevel.." (cÊp)-linh th¹ch phèi ph­¬ng.",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;

function add_zpcp(tbZPCP,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		give_zpcp(tbZPCP,nCount);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		give_zpcp(tbZPCP,nCount);
		nRetResult = 1;
	end;
	return nRetResult;
end;

function add_horse(nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local szItemName = "";
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 		--±¼Ïü»òÌÚÎíËæ»ú1Æ¥
		if random(1,2) == 1 then
			szItemName = "1 B«n tiªu";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		else
			szItemName = "1 §»ng Vô";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		end;
		nRetResult = 1;
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
		nRetResult = 1;		
	end;
	return nRetResult;
end;

function get_name()
	local szName = GetName();
	local nLen = strlen(szName);
	if nLen > 4 then
		szName = strsub(szName,1,4);
		for i=1,nLen-4 do
			szName = szName.."*";
		end;
	end;
	return szName;
end;

function nothing()

end;