Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Hoan Thiªn Hû §Þa Bao";
g_NeedRoom = 14;
g_NeedWeight = 200;
TSK_COUNTER = 577;

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--µ±Ç°ÊÇµÚ¼¸´Î¿ªÆô
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,1000,2);
			Msg2Player("NhËn ®­îc 2 Bµn Long BÝch");
			AddItem(2,1,2642,1);
			Msg2Player("NhËn ®­îc 1 Tói b¶o th¹ch");	
			if GetPlayerRoute() ~= 0 then	
				SetTask(336,GetTask(336)+25);	--Ê¦ÃÅ¹±Ï×¶È25
				Msg2Player("B¹n nhËn ®­îc 25 ®iÓm cèng hiÕn s­ m«n");
			end
			ModifyReputation(50,0);	--ÉùÍû50					
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
			if GetTask(578) == 0 and nCurCount >= 8 and GetTask(666) < 300 then
				SetTask(578,1);
				SetTask(666,GetTask(666)+100);
				if GetTask(666) > 300 then
					SetTask(666,300);
				end
				Msg2Player("NhËn ®­îc 100 ®iÓm ®¹i héi tû vâ");					
			end	
			if GetTask(579) == 0 and nCurCount >= 24 then
				SetTask(579,1);
				give_item(2,1,3388,1,"1 LÖnh th¸o gì miÔn phÝ",0,24,1);	--1¸öÃâ·Ñ²ð½âÁî,0%ÇÒÃ¿¿ª24¸ö°ü±Ø¸ø1¸ö£¬Ö»¸øÒ»¸ö¡£
			end			
			give_item(2,0,554,1,"1 quyÓn Tu Ch©n YÕu QuyÕt",10,2,0);  --ÐÞÕæÒª¾÷1±¾£¬10%ÇÒÃ¿¿ª2¸ö°ü±Ø¸ø1¸ö	
			give_item(2,0,553,1,"1 §¹i Nh©n s©m",5,10,0);  --1¸ö´óÈË²Î¹û£¬5%ÇÒÃ¿¿ª10¸ö°ü±Ø¸ø1¸ö	
			add_lingshi(6,1,5,15,0);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª15¸ö°ü±Ø¸ø1¸ö	
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æ
			add_lingshi(7,1,0.5,40,1);	--Ëæ»ú7¼¶ÁéÊ¯1¿Å,0.5%ÇÒÃ¿¿ª40¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,3331,15,"15 Tam DiÖu Long Hi",0.2,80,1);	--ÈýÒ«Áú x,0.2%ÇÒÃ¿¿ª80¸ö°ü±Ø¸ø15¸ö
			give_item(2,1,563,1,"1 Kú Kim cña thî rÌn L­u",0.1,120,1);	--ÁõÌú½³µÄÆæ½ð1¸ö,0.1%ÇÒÃ¿¿ª120¸ö°ü±Ø¸ø1¸ö
			give_item(2,0,1028,1,"1 R­¬ng vµng ThÞnh ThÕ",0.2,200,1); --1¸öÊ¢ÊÀ½ð±¦Ïä0.2%ÇÒÃ¿¿ª200¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æºÍ¹öÆÁ¹«¸æ
			add_horse(0.2,300);	--±¼Ïü»òÌÚÎíËæ»ú1Æ¥£¬0.2%ÇÒÃ¿¿ª300¸ö°ü±Ø¸ø1¸ö
			Msg2Player("§©y lµ lÇn thø "..nCurCount.." më "..g_ItemName);
			WriteLog("["..g_ItemName.."]:"..GetName().."thø"..nCurCount.." më "..g_ItemName);
		end;
	else
		Talk(1,"","Kho¶ng trèng hoÆcsøc lùccña b¹n kh«ng ®ñ. Xin kiÓm tra l¹i hµnh trang tr­íc!"..g_ItemName.."!");
	end;
end;
--ÏµÍ³ÌáÊ¾¼°ÈÕÖ¾¡£µÚ¶þ¸ö²ÎÊýÌî1±íÊ¾·¢È«·þÎñÆ÷ÏµÍ³ÏûÏ¢£¬Ìî2±íÊ¾·¢È«·þÎñÆ÷ÏµÍ³ÏûÏ¢ºÍÈ«·þÎñÆ÷¹ö¶¯ÐÅÏ¢¡£
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
--¸øÕòÅÉ²ÐÆªµÄº¯Êý
function give_zpcp(tbZPCP,nCount)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,nCount);		
	show_msg(szName,2);
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
	local szName = "§¹i hiÖp";
	return szName;
end;

function nothing()

end;