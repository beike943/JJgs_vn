Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\online\\laborday08\\mah_jong_head.lua");--ÎåÒ»Âé½«
g_ItemName = "Vâ L©m T«n Quý bao";
g_NeedRoom = 11;
g_NeedWeight = 200;
TSK_COUNTER = 543;

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--µ±Ç°ÊÇµÚ¼¸´Î¿ªÆô
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			if BigGetItemCount(2,0,1059) < 1 then
				AddItem(2,0,1059,1); --Âé½«Ïä×Ó
			end
			add_mahjong_prob(1000); --»ñµÃÂé½«
			AddItem(2,1,2652,1);
			Msg2Player("B¹n nhËn ®­îc 1 XÝch ThiÕt Tinh");
			AddItem(2,1,3330,2);	--Ò»ÉÁÑý»Í2¸ö
			Msg2Player("Sau <color=yellow>");
			ModifyReputation(50,0);	--ÉùÍû50µã
			if GetTask(546) == 0 and nCurCount >= 8 then		
				if GetLevel() >= 70 then	
					if GetPlayerRoute() ~= 0 then
						SetTask(546,1);
						SetTask(336,GetTask(336)+3000);	--Ê¦ÃÅ¹±Ï×¶È3000
						Msg2Player("NhËn ®­îc 3000 ®iÓm cèng hiÕn s­ m«n");
					end;
				else
					if GetTask(544) ~= 1 and GetTask(546) == 0 then
						if GetPlayerRoute() ~= 0 then
							SetTask(546,1);
							SetTask(336,GetTask(336)+3000);	--Ê¦ÃÅ¹±Ï×¶È3000
							Msg2Player("NhËn ®­îc 3000 ®iÓm cèng hiÕn s­ m«n");
						end;					
					end
				end
			end
			AddItem(2,1,2642,1);
			Msg2Player("NhËn ®­îc 1 Tói b¶o th¹ch");			
			add_peifang(6,1,5,8,0);	--Ëæ»ú6¼¶ÁéÊ¯Åä·½1ÕÅ,5%ÇÒÃ¿¿ª8¸ö°ü±Ø¸ø1¸ö
			add_lingshi(6,1,5,15,0);	--Ëæ»ú6¼¶ÁéÊ¯1¿Å,5%ÇÒÃ¿¿ª15¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,475,1,"Vßng Th¸i H­ B¸t Qu¸i - CÊn",2,20,0); --Ì«Ðé°ËØÔÅÌ-ôÞ,2%ÇÒÃ¿¿ª20¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æ
			add_peifang(7,1,2,30,1);	--Ëæ»ú7¼¶ÁéÊ¯Åä·½1ÕÅ,2%ÇÒÃ¿¿ª30¸ö°ü±Ø¸ø1¸ö
			add_lingshi(7,1,0.5,50,1);	--Ëæ»ú7¼¶ÁéÊ¯1¿Å,0.5%ÇÒÃ¿¿ª50¸ö°ü±Ø¸ø1¸ö
			give_item(2,1,3331,15,"15 Tam DiÖu Long Hi",0.2,80,1);	--ÈýÒ«Áú x,0.2%ÇÒÃ¿¿ª80¸ö°ü±Ø¸ø15¸ö
			give_item(2,1,3206,1,"1Vâ L©m b¶o ®iÓn",0.1,160,1);--ÎäÁÖ±¦µä1±¾,0.1%ÇÒÃ¿¿ª160¸ö°ü±Ø¸ø1¸ö
			--ÒÔÏÂÐèÒª·¢È«·þ¹«¸æºÍ¹öÆÁ¹«¸æ
			give_item(2,1,3204,25,"25 Ngò Th¸i Lung Tóy",0.2,240,2); --25¸öÎå²ÊççËè0.2%ÇÒÃ¿¿ª240¸ö°ü±Ø¸ø25¸ö
			give_item(2,1,3205,10,"10 c¸i ThÊt HuyÒn L­u V¨n",0.2,480,2); --10¸öÆßìÅ¬–ÎÆ0.2%ÇÒÃ¿¿ª480¸ö°ü±Ø¸ø10¸ö
			give_item(2,1,1146,1,"1 Viªm Hoµng ThiÕt hån",0.01,2000,2);	--Ñ×»ÆÌú»ê1¸ö,0.01%ÇÒÃ¿¿ª2000¸ö°ü±Ø¸ø 1¸ö
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