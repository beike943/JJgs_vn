Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "Tói n¨m míi vui vÎ";
g_NeedRoom = 17;
g_NeedWeight = 200;
TSK_COUNTER = 588;

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--µ±Ç°ÊÇµÚ¼¸´Î¿ªÆô
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,1000,2);
			Msg2Player("NhËn ®­îc 2 Bµn Long Bİch");
			AddItem(2,0,1082,1);
			Msg2Player("B¹n nhËn ®­îc 1 quyÓn Th¸i DŞch Hçn Nguyªn C«ng §å");	
			if GetPlayerRoute() ~= 0 then	
				SetTask(336,GetTask(336)+25);	--Ê¦ÃÅ¹±Ï×¶È25
				Msg2Player("B¹n nhËn ®­îc 25 ®iÓm cèng hiÕn s­ m«n");
			end
			ModifyReputation(50,0);	--ÉùÍû50					
			AddItem(2,0,398,1);
			Msg2Player("B¹n nhËn ®­îc 1 h¹t gièng B¸t Nh·")	;
			
			if GetTask(589) == 0 and nCurCount >= 15 then
				SetTask(589,1);
				give_item(0,200,40,1,"1 quyÓn ThÇn Hµnh B¶o §iÓn",0,15,1);	
			end			
			give_item(2,0,554,1,"1 quyÓn Tu Ch©n YÕu QuyÕt",10,2,0);  --ĞŞÕæÒª¾÷1±¾£¬10%ÇÒÃ¿¿ª2¸ö°ü±Ø¸ø1¸ö	
			give_item(2,1,3331,1,"1 Tam DiÖu Long Hi",10,4,0);  --1¸öÈıÒ«Áú x£¬10%ÇÒÃ¿¿ª4¸ö°ü±Ø¸ø1¸ö	
			give_item(2,0,1087,1,"1 ch×a khãa b¹c kû niÖm 20 n¨m",5,8,0);  --1°Ñ¶şÊ®ÖÜÄêÇìÒøÔ¿³×£¬5%ÇÒÃ¿¿ª8¸ö°ü±Ø¸ø1¸ö	
			give_item(2,1,3204,1,"1 Ngò Th¸i Lung Tñy",5,20,0);  --1¸öÎå²ÊççËè£¬5%ÇÒÃ¿¿ª20¸ö°ü±Ø¸ø1¸ö	
			add_lingshi(6,1,5,12,0);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª12¸ö°ü±Ø¸ø1¸ö	
			give_item(2,1,1042,1,"1 C¸i ThÕ Anh Hïng",0.5,30,0);  --1¸ö½­ºş¿ì±¨Ö®¸ÇÊÀÓ¢ºÀ£¬0.5%ÇÒÃ¿¿ª30¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂĞèÒª·¢È«·ş¹«¸æ
			add_lingshi(7,1,0.5,40,1);	--Ëæ»ú7¼¶ÁéÊ¯1¿Å,0.5%ÇÒÃ¿¿ª40¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,3206,1,"1Vâ L©m b¶o ®iÓn",0.1,160,1);	--1±¾ÎäÁÖ±¦µä,0.1%ÇÒÃ¿¿ª160¸ö°ü±Ø¸ø1¸ö
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1 Ch×a khãa vµng",1,40,1) == 1 then	--1°Ñ´¢ÎïÏä½ğÔ¿³×,1%ÇÒ¿ª40¸ö°ü±Ø¸ø£¨Ã¿ÈËÏŞµÃ1´Î£©
					SetTask(1482,1);	--Ö»ÄÜ»ñµÃÒ»´Î
				end;
			end;
			--ÒÔÏÂĞèÒª·¢È«·ş¹«¸æºÍ¹öÆÁ¹«¸æ
			give_item(2,0,1084,1,"1 Thiªn Qu¸i Th¹ch",0.01,500,2);	--1¸öÌìØÔÊ¯,0.01%ÇÒÃ¿¿ª500¸ö°ü±Ø¸ø1¸ö
			Msg2Player("§©y lµ lÇn thø "..nCurCount.." më "..g_ItemName);
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
	show_msg(szName,2);
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
	local szName = "§¹i hiÖp";
	return szName;
end;

function nothing()

end;