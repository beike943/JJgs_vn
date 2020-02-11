Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Tói Xu©n No·n Nh©n Gian ";
g_NeedRoom = 11;
g_NeedWeight = 200;
TSK_COUNTER = 503;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	Talk(1,"#confirm_open("..nItemIdx..")","§©y lµ lÇn thø <color=yellow>"..nCurCount.."<color> ng­¬i më <color=yellow>"..g_ItemName.."<color>. Xin chó ı: Mçi nh©n vËt khi mçi lÇn më 8 tói sÏ nhËn ®­îc 1 ThÕ Th©n phï, mçi lÇn më 10 tói sÏ ngÉu nhiªn nhËn ®­îc Phèi Ph­¬ng cÊp 6, khi më 20 tói sÏ ngÉu nhiªn nhËn ®­îc 1 Linh Th¹ch cÊp 6, khi më 30 tói sÏ ngÉu nhiªn nhËn ®­îc 1 Linh Th¹ch cÊp 7, më 40 tói sÏ nhËn ®­îc ch×a khãa vµng? (chØ cã 1 c¬ héi duy nhÊt)? (tr­íc khi tho¸t khái trß ch¬i, nh©n vËt ®ã sÏ kh«ng cã c¬ héi nµy lÇn n÷a), khi më 60 tói sÏ ngÉu nhiªn nhËn ®­îc 1 Linh Th¹ch cÊp 7, khi më 80 tói sÏ nhËn ®­îc 1 N«ng Tang phæ, më 160 tói sÏ nhËn ®­îc 1 Vâ L©m B¶o §iÓn, më 240 tói sÏ nhËn ®­îc 1 B«n Tiªu hoÆc 1 §»ng Vô, më 2000 tói sÏ nhËn ®­îc 1 Viªm Hoµng ThiÕt Hån.");
end;

function confirm_open(nItemIdx)
	local selTab = {
				format("§­îc råi. B¾t ®Çu më th«i!/#open(%d)",nItemIdx),
				format("Xem bªn trong cã g× ®·!/#see_item(%d)",nItemIdx),
				"T¹m thêi kh«ng më/nothing",
				}
	Say("<color=red> Chó ı<color>: R­¬ng b¹n ph¶i cã "..g_NeedRoom.." chç trèng vµ "..g_NeedWeight.." søc lùc. Linh Th¹ch vµ Linh Th¹ch Phèi Ph­¬ng sÏ tô hîp t¹i Tô Linh §Ønh. Xin h·y chó ı Danh Väng hiÖn t¹i cña b¹n, ®iÓm cèng hiÕn S­ M«n ph¶i ®¹t tèi ®a, nÕu nh­ sè l­îng tói më ®­îc v­ît qu¸ giíi h¹n, hÖ thèng sÏ tù ®éng khÊu trõ. QuyÕt ®Şnh më ngay b©y giê chø?",getn(selTab),selTab);
end

function see_item(nItemIdx)
	local szItems = "1 Xİch ThiÕt Tinh, 2 Thiªn th¹ch, 50 ®iÓm Danh Väng, ®é cèng hiÕn S­ M«n 25? (cÇn ph¶i gia nhËp M«n Ph¸i), 1 Cñ C¶i ®á, 3 Sinh ®å chøng th­, 3 Tó tµi chøng th­, 3 Cö nh©n chøng th­, 1 ThÕ Th©n phï, ngÉu nhiªn 1 Linh Th¹ch Phèi Ph­¬ng cÊp 6, ngÉu nhiªn 1 Linh Th¹ch cÊp 6, 1 Linh Th¹ch Phèi Ph­¬ng cÊp 7 ngÉu nhiªn, Ch×a khãa vµng? (Mçi ng­êi chØ cã duy nhÊt 1 c¬ héi)? (nh©n vËt tr­íc ®ã ®· cã vËt phÈm nµy sÏ kh«gn thÓ mua n÷a), 1 Linh Th¹ch cÊp 7 ngÉu nhiªn, 1 N«ng Tang Phæ, 1 Vâ L©m B¶o §iÓn, 1 B«n Tiªu hoÆc §»ng Vô ngÉu nhiªn , 1 Viªm Hoµng ThiÕt Hån.";
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
			Msg2Player("B¹n nhËn ®­îc 1 Xİch ThiÕt Tinh");
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
			give_item(2,0,556,1,"1 ThÕ Th©n phï",5,8);	--ÌæÉí·û1¸ö,5%ÇÒÃ¿¿ª8¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂĞèÒª·¢È«·ş¹«¸æ
			add_peifang(6,1,5,10,1);	--Ëæ»ú6¼¶ÁéÊ¯Åä·½1ÕÅ,5%ÇÒÃ¿¿ª10¸ö°ü±Ø¸ø1¸ö
			add_lingshi(6,1,5,20,1);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª20¸ö°ü±Ø¸ø1¸ö
			add_peifang(7,1,2,30,1);	--Ëæ»ú7¼¶ÁéÊ¯Åä·½1ÕÅ,2%ÇÒÃ¿¿ª30¸ö°ü±Ø¸ø1¸ö
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch×a khãa vµng",1,40,1) == 1 then	--1°Ñ´¢ÎïÏä½ğÔ¿³×,1%ÇÒ¿ª40¸ö°ü±Ø¸ø£¨Ã¿ÈËÏŞµÃ1´Î£©
					SetTask(1482,1);	--Ö»ÄÜ»ñµÃÒ»´Î
				end;
			end;
			add_lingshi(7,1,0.2,60,1);	--Ëæ»ú7¼¶ÁéÊ¯1¿Å,0.2%ÇÒÃ¿¿ª60¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,1056,1,"1 N«ng Tang phæ",0.5,80,1);	--Å©É£¼­Òª,0.5%ÇÒÃ¿¿ª80¸ö°ü±Ø¸øÒ»¸ö
			give_item(2,1,3206,1,"1Vâ L©m b¶o ®iÓn",0.1,160,1);--ÎäÁÖ±¦µä1±¾,0.1%ÇÒÃ¿¿ª160¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂĞèÒª·¢È«·ş¹«¸æºÍ¹öÆÁ¹«¸æ
			add_horse(0.2,240);	--±¼Ïü»òÌÚÎíËæ»ú1Æ¥£¬0.2%ÇÒÃ¿¿ª240¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,1146,1,"1 Viªm Hoµng ThiÕt hån",0.01,2000,2)	--Ñ×»ÆÌú»ê1¸ö,0.01%ÇÒÃ¿¿ª2000¸ö°ü±Ø¸ø 1¸ö
			WriteLog("["..g_ItemName.."]:"..GetName().."thø"..nCurCount.." më "..g_ItemName);
		end;
	else
		Talk(1,"","Kho¶ng trèng hoÆcsøc lùccña b¹n kh«ng ®ñ. Xin kiÓm tra l¹i hµnh trang tr­íc!"..g_ItemName.."!");
	end;
end;
--ÏµÍ³ÌáÊ¾¼°ÈÕÖ¾¡£µÚ¶ş¸ö²ÎÊıÌî1±íÊ¾·¢È«·şÎñÆ÷ÏµÍ³ÏûÏ¢£¬Ìî2±íÊ¾·¢È«·şÎñÆ÷ÏµÍ³ÏûÏ¢ºÍÈ«·şÎñÆ÷¹ö¶¯ĞÅÏ¢¡£
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("B¹n nhËn ®­îc "..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."Më '"..g_ItemName.." nhËn ®­îc "..szItemName);
	elseif bGlobalMsg == 2 then
		Msg2Global(get_name().."Më '"..g_ItemName.." nhËn ®­îc "..szItemName);
		AddGlobalNews(get_name().."Më '"..g_ItemName.." nhËn ®­îc "..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."NhËn ®­îc"..szItemName);	
end;
--¸øÕòÅÉ²ĞÆªµÄº¯Êı
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
--¸øÎïÆ·£¬²ÎÊıÒÀ´ÎÎª£ºÎïÆ·ID1,ÎïÆ·ID2,ÎïÆ·ID3,ÊıÁ¿£¬ÎïÆ·Ãû×Ö£¬¸ÅÂÊ£¬±Ø¸øµÄ´ÎÊı£¬ÊÇ·ñ·¢È«·ş¹«¸æ£¬ÓĞÏŞÌìÊı
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
--¸øÁéÊ¯¡£²ÎÊı£ºµÈ¼¶£¬ÊıÁ¿£¬¸ÅÂÊ£¬±Ø¸øµÄ´ÎÊı£¬ÊÇ·ñ·¢È«·ş¹«¸æ£º0²»·¢£¬1·¢
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ä¬ÈÏ·¢È«·ş¹«¸æ
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
--¸øÁéÊ¯Åä·½¡£²ÎÊı£ºµÈ¼¶£¬ÊıÁ¿£¬¸ÅÂÊ£¬±Ø¸øµÄ´ÎÊı
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--Ä¬ÈÏ·¢È«·ş¹«¸æ
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
			show_msg(szItemName,2)
		else
			szItemName = "1 §»ng Vô";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "1 B«n tiªu";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1 §»ng Vô";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
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