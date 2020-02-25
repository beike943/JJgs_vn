Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "辉煌荣耀包";
g_NeedRoom = 18;
g_NeedWeight = 200;
TSK_COUNTER = 575;

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,1000,2);
			Msg2Player("你获得2个磐龙璧");
			AddItem(2,1,2652,1);
			Msg2Player("你获得1个赤铁精");	
			if GetPlayerRoute() ~= 0 then	
				SetTask(336,GetTask(336)+25);	--师门贡献度25
				Msg2Player("你获得25点师门贡献度");
			end
			ModifyReputation(50,0);	--声望50					
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("你获得3本生员证书");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("你获得3本秀才证书");			
			else
				AddItem(2,0,599,3);
				Msg2Player("你获得3本举人证书");			
			end;	
			if GetTask(576) == 0 and nCurCount >= 8 then
				SetTask(576,1);
				AddItem(2,0,1074,2);
				Msg2Player("你获得2把荣耀银钥匙");					
			end				
			give_item(2,0,1073,1,"1把辉煌铜钥匙",5,6,0);  --1把辉煌铜钥匙，5%且每开6个包必给1个	
			give_item(2,1,3219,1,"1个月华之精",5,12,0);  --1个月华之精，5%且每开12个包必给1个	
			give_item(2,0,1078,1,"1个荣耀之银牌盒",0.2,20,0);--荣耀之银牌盒1个,0.2%且每开20个包必给1个
			--以下需要发全服公告
			give_item(2,1,3331,15,"15个三耀龙爔",0.2,60,1);	--三耀龙爔,0.2%且每开60个包必给15个
			give_item(2,0,1079,1,"1个荣耀之金牌盒",0.2,100,1);	--荣耀之金牌盒,0.2%且每开100个包必给1个
			give_item(2,1,3206,1,"1本武林宝典觧",0.1,160,1);--武林宝典1本,0.1%且每开160个包必给1个
			--以下需要发全服公告和滚屏公告
			give_item(2,0,1075,1,"1个荣耀金钥匙",0.05,300,2); --1个荣耀金钥匙0.05%且每开300个包必给1个
			give_item(2,1,1146,1,"1个炎黄铁魂",0.01,1600,2);	--炎黄铁魂1个,0.01%且每开1600个包必给 1个
			Msg2Player("这是你第"..nCurCount.."次打开"..g_ItemName);
			WriteLog("["..g_ItemName.."]:"..GetName().."物品"..nCurCount.."打开"..g_ItemName);
		end;
	else
		Talk(1,"","你的背包空间或负重力是不够的，请检查一下背包！"..g_ItemName.."!");
	end;
end;
--系统提示及日志。第二个参数填1表示发全服务器系统消息，填2表示发全服务器系统消息和全服务器滚动信息。
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("你获得"..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."打开'"..g_ItemName.."获得"..szItemName);
	elseif bGlobalMsg == 2 then
		Msg2Global(get_name().."打开'"..g_ItemName.."获得"..szItemName);
		AddGlobalNews(get_name().."打开'"..g_ItemName.."获得"..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."获得"..szItemName);	
end;
--给镇派残篇的函数
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
--给物品，参数依次为：物品ID1,物品ID2,物品ID3,数量，物品名字，概率，必给的次数，是否发全服公告，有限天数
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
--给灵石。参数：等级，数量，概率，必给的次数，是否发全服公告：0不发，1发
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--默认发全服公告
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.."个"..nLevel.." (级)灵石",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.."个"..nLevel.." (级)灵石",bGlobalMsg);
		nRetResult = 1;
	end;
	return nRetResult;
end;
--给灵石配方。参数：等级，数量，概率，必给的次数
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--默认发全服公告
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRetCode,nItemIdx = 0,0;
	local nRetResult = 0;
	if gf_ProbabilityJudge(nP) == 1 then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (级)-灵石配方",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (级)-灵石配方",bGlobalMsg);
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
	if gf_ProbabilityJudge(nP) == 1 then 		--奔宵或腾雾随机1匹
		if random(1,2) == 1 then
			szItemName = "1匹奔宵马";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1匹腾雾马";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "1匹奔宵马";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "1匹腾雾马";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;	
		nRetResult = 1;		
	end;
	return nRetResult;
end;

function get_name()
	local szName = "大侠";
	return szName;
end;

function nothing()

end;
