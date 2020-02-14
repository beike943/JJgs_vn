Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "百年圆梦包";
g_NeedRoom = 18;
g_NeedWeight = 200;
TSK_COUNTER = 572;

tXJCP = 
{
	[0]  = {{"易筋经下卷残篇",2,1,918},{"洗髓经下卷残篇",2,1,924},{"如来神掌下卷残篇",2,1,921},{"吸星阵下卷残篇",2,1,927},{"万相神功下卷残篇",2,1,930},{"天音镇魂曲下卷残篇",2,1,933},{"降龙十八掌下卷残篇",2,1,936},{"打狗棍阵下卷残篇",2,1,939},{"无上太极剑下卷残篇",2,1,942},{"太极神功下卷残篇",2,1,945},{"连环钻龙枪下卷残篇",2,1,948},{"霸王翔凤箭下卷残篇",2,1,951},{"无影魔蛊下卷残篇",2,1,954},{"无天魔功下卷残篇",2,1,957}},
	[1]  = {{"D辌h C﹏ Kinh-h? ",2,1,918},{"T葃 T駓 Kinh-h? ",2,1,924},{"Nh? Lai Th莕 Chng-h? ",2,1,921}},
	[2]  = {{"D辌h C﹏ Kinh-h? ",2,1,918}},
	[3]  = {{"T葃 T駓 Kinh-h? ",2,1,924}},
	[4]  = {{"Nh? Lai Th莕 Chng-h? ",2,1,921}},
	[5]  = {{"H蕄 Tinh Tr薾-h? ",2,1,927}},
	[6]  = {{"H蕄 Tinh Tr薾-h? ",2,1,927}},
	[7]  = {{"V筺 Tng Th莕 C玭g-h? ",2,1,930},{"Thi猲  Tr蕁 H錸 Kh骳-h? ",2,1,933}},
	[8]  = {{"V筺 Tng Th莕 C玭g-h? ",2,1,930}},
	[9]  = {{"Thi猲  Tr蕁 H錸 Kh骳-h? ",2,1,933}},
	[10] = {{"Gi竛g Long Th藀 B竧 Chng-h? ",2,1,936},{"Ф C萿 C玭 Tr薾-h? ",2,1,939}},
	[11] = {{"Gi竛g Long Th藀 B竧 Chng-h? ",2,1,936}},
	[12] = {{"Ф C萿 C玭 Tr薾-h? ",2,1,939}},
	[13] = {{"V? Thng Th竔 C鵦 Ki誱-h? ",2,1,942},{"Th竔 C鵦 Th莕 C玭g-h? ",2,1,945}},
	[14] = {{"V? Thng Th竔 C鵦 Ki誱-h? ",2,1,942}},
	[15] = {{"Th竔 C鵦 Th莕 C玭g-h? ",2,1,945}},
	[16] = {{"Li猲 Ho祅 To祅 Long Thng-h? ",2,1,948},{"B? Vng Tng Ph鬾g Ti詎-h? ",2,1,951}},
	[17] = {{"Li猲 Ho祅 To祅 Long Thng-h? ",2,1,948}},
	[18] = {{"B? Vng Tng Ph鬾g Ti詎-h? ",2,1,951}},
	[19] = {{"V? 秐h Ma C?-h? ",2,1,954},{"V? Thi猲 Ma C玭g-h? ",2,1,957}},
	[20] = {{"V? Thi猲 Ma C玭g-h? ",2,1,957}},
	[21] = {{"V? 秐h Ma C?-h? ",2,1,954}},
}

function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,1000,2);
			Msg2Player("获得两个磐龙璧");
			AddItem(2,1,2642,1);
			Msg2Player("获得一个宝石包裹");	
			if GetPlayerRoute() ~= 0 then	
				SetTask(336,GetTask(336)+25);	--师门贡献度25
				Msg2Player("你获得25师门贡献度");
			end
			ModifyReputation(50,0);	--声望50					
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("你获得3个生员证书");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("你获得3个秀才证书");			
			else
				AddItem(2,0,599,3);
				Msg2Player("你获得3个举人证书");			
			end;	
			if GetTask(573) == 0 and nCurCount >= 8 then
				if GetPlayerRoute() ~= 0 then
					SetTask(573,1);
					SetTask(336,GetTask(336)+3000);	--师门贡献度3000
					Msg2Player("你获得3000师门贡献度");
				end;					
			end				
			give_item(2,0,554,1,"1本修真要诀",10,2,0);  --1本修真要诀，10%且每开2个包必给1个	
			give_item(2,1,2002,1,"1个月华",5,8,0);  --1个月华，5%且每开8个包必给1个
			add_lingshi(6,1,5,15,0);	--随机6级灵石1颗,5%且每开15个包必给1个	
			give_item(2,1,1042,1,"1个江湖快报盖世英豪称号",1,25,1);--江湖快报盖世英豪1个,1%且每开25个包必给1个
			--以下需要发全服公告
			add_lingshi(7,1,0.5,45,1);	--随机7级灵石1颗,0.5%且每开45个包必给1个
			give_item(2,1,3331,15,"15个三耀龙爔",0.2,80,1);	--三耀龙爔,0.2%且每开80个包必给15个
			give_item(2,1,3206,1,"1本武林宝典",0.1,160,1);--武林宝典1本,0.1%且每开160个包必给1个
			give_item(2,0,1028,1,"1个盛世金宝箱",0.2,200,1); --1个盛世金宝箱0.2%且每开200个包必给1个
			--以下需要发全服公告和滚屏公告
			add_zpcp(tXJCP,1,0.2,300);	--对应流派镇派残卷下册,0.2%且每开300个包必给1个
			give_item(2,1,1146,1,"1个炎黄铁魂",0.01,1600,2);	--炎黄铁魂1个,0.01%且每开1600个包必给 1个
			Msg2Player("这是第一次"..nCurCount.."打开"..g_ItemName);
			WriteLog("["..g_ItemName.."]:"..GetName().."东西"..nCurCount.."打开"..g_ItemName);
		end;
	else
		Talk(1,"","你的负重或背包空间不足，请先检查一下背包。"..g_ItemName.."!");
	end;
end;
--系统提示及日志。第二个参数填1表示发全服务器系统消息，填2表示发全服务器系统消息和全服务器滚动信息。
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("你得到"..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."打开'"..g_ItemName.."获得"..szItemName);
	elseif bGlobalMsg == 2 then
		Msg2Global(get_name().."打开"..g_ItemName.."获得"..szItemName);
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
		show_msg(nCount.." "..nLevel.."等级）灵石",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.."等级）灵石",bGlobalMsg);
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
		show_msg(nCount.."张"..nLevel.."(等级)-灵石配方",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.."(等级)-灵石配方",bGlobalMsg);
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
