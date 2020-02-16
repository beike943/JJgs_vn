Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "春暖人间包";
g_NeedRoom = 11;
g_NeedWeight = 200;
TSK_COUNTER = 503;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	Talk(1,"#confirm_open("..nItemIdx..")","这是你第一次<color=yellow>"..nCurCount.."<color>打开。<color=yellow>"..g_ItemName.."<color>请注意:每个人只能打开8个袋子，而且只得一个替身符。每次打开10个袋子，就会随机得到一个6级灵石配方, 当你打开20个袋子时，你会得到一个6级的灵石。当你打开30个袋子时，你会得到一个7级的灵石,打开40个袋子就能得到一把金钥匙(每个角色只有一次机会)。当你打开60个袋子时，你会得到一个7级的灵石。当你打开80个袋子时，你会得到一本农桑辑要, 打开160个袋子就能得到一本武林宝典,打开240个袋子，你就会得到一匹奔宵或腾雾马,打开2000个袋子就会得到一个炎黄铁魂");
end;

function confirm_open(nItemIdx)
	local selTab = {
				format("好吧，我们开始吧。/#open(%d)",nItemIdx),
				format("让我看看里面有什么/#see_item(%d)",nItemIdx),
				"暂时打不开/nothing",
				}
	Say("<color=red>注意<color>:要打开礼包需备足背包的"..g_NeedRoom.."空间"..g_NeedWeight.."数量。因为里面包含有很多物品.还有你现在的声望和等级必须达到最高, 如果袋子的数量超过了限制,系统会自动扣掉,确定现在打开吗?",getn(selTab),selTab);
end

function see_item(nItemIdx)
	local szItems = "1 X輈h Thi誸 Tinh, 2 Thi猲 th筩h, 50 甶觤 Danh V鋘g,  c鑞g hi課 S? M玭 25? (c莕 ph秈 gia nh藀 M玭 Ph竔), 1 C? C秈 , 3 Sinh  ch鴑g th?, 3 T? t礽 ch鴑g th?, 3 C? nh﹏ ch鴑g th?, 1 Th? Th﹏ ph?, ng蓇 nhi猲 1 Linh Th筩h Ph鑙 Phng c蕄 6, ng蓇 nhi猲 1 Linh Th筩h c蕄 6, 1 Linh Th筩h Ph鑙 Phng c蕄 7 ng蓇 nhi猲, Ch譨 kh鉧 v祅g? (M鏸 ngi ch? c? duy nh蕋 1 c? h閕)? (nh﹏ v藅 trc   c? v藅 ph萴 n祔 s? kh玤n th? mua n鱝), 1 Linh Th筩h c蕄 7 ng蓇 nhi猲, 1 N玭g Tang Ph?, 1 V? L﹎ B秓 觧, 1 B玭 Ti猽 ho芻 Щng V? ng蓇 nhi猲 , 1 Vi猰 Ho祅g Thi誸 H錸.";
	Talk(1,"#OnUse("..nItemIdx..")","每个"..g_ItemName.."可以打开: "..szItems.."祝你好运！");
end;

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			AddItem(2,1,2652,1);
			Msg2Player("获得一个赤铁精");
			AddItem(2,2,8,2);	--陨铁2个
			Msg2Player("获得陨铁2个");
			ModifyReputation(50,0);	--声望50点
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+25);	--师门贡献度25
				Msg2Player("获得25点师门贡献度");
			end;
			AddItem(2,1,1090,1);
			Msg2Player("获得一个红萝卜");
			nRand = random(1,100);
			if nRand <= 60 then
				AddItem(2,0,597,3);
				Msg2Player("获得3本生员证书");			
			elseif nRand <= 90 then
				AddItem(2,0,598,3);
				Msg2Player("获得3本秀才证书");			
			else
				AddItem(2,0,599,3);
				Msg2Player("获得3本举人证书");			
			end;
			give_item(2,0,556,1,"获得替身符1个",5,8);	--替身符1个,5%且每开8个包必给1个
			--以下需要发全服公告
			add_peifang(6,1,5,10,1);	--随机6级灵石配方1张,5%且每开10个包必给1个
			add_lingshi(6,1,5,20,1);	--随机6级灵石1颗,5%且每开20个包必给1个
			add_peifang(7,1,2,30,1);	--随机7级灵石配方1张,2%且每开30个包必给1个
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"一把金钥匙",1,40,1) == 1 then	--1把储物箱金钥匙,1%且开40个包必给（每人限得1次）
					SetTask(1482,1);	--只能获得一次
				end;
			end;
			add_lingshi(7,1,0.2,60,1);	--随机7级灵石1颗,0.2%且每开60个包必给1个
			give_item(2,1,1056,1,"获得一本农桑辑要",0.5,80,1);	--农桑辑要,0.5%且每开80个包必给一个
			give_item(2,1,3206,1,"获得一本武林宝典",0.1,160,1);--武林宝典1本,0.1%且每开160个包必给1个
			--以下需要发全服公告和滚屏公告
			add_horse(0.2,240);	--奔宵或腾雾随机1匹，0.2%且每开240个包必给1个
			give_item(2,1,1146,1,"获得一个炎黄铁魂",0.01,2000,2)	--炎黄铁魂1个,0.01%且每开2000个包必给 1个
			WriteLog("["..g_ItemName.."]:"..GetName().."th?"..nCurCount.." m? "..g_ItemName);
		end;
	else
		Talk(1,"","你的负重或背包空间不足，请先检查一下背包。"..g_ItemName.."!");
	end;
end;
--系统提示及日志。第二个参数填1表示发全服务器系统消息，填2表示发全服务器系统消息和全服务器滚动信息。
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("你获得"..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."打开'"..g_ItemName.."收到"..szItemName);
	elseif bGlobalMsg == 2 then
		Msg2Global(get_name().."打开'"..g_ItemName.."收到"..szItemName);
		AddGlobalNews(get_name().."打开"..g_ItemName.."收到"..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."收到"..szItemName);	
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
	show_msg(szName,1);
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
		show_msg(nCount.." "..nLevel.."(等级)灵石",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.."(等级)灵石",bGlobalMsg);
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
		show_msg(nCount.."张"..nLevel.." (等级)-l灵石配方",bGlobalMsg);
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (等级)-l灵石配方",bGlobalMsg);
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
			szItemName = "获得一匹奔宵马";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "获得一匹腾雾马";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		end;
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "获得一匹奔宵马";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,2)
		else
			szItemName = "获得一匹腾雾马";
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
