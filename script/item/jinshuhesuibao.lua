Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "金鼠贺岁包";
g_NeedRoom = 16;
g_NeedWeight = 200;
TSK_COUNTER = 1149;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("好了，开始吧！/#open(%d)",nItemIdx),
				format("看看里面有什么!/#see_item(%d)",nItemIdx),
				"暂时不打开/nothing",
				}
	Say("这是你第<color=yellow>"..nCurCount.."<color>次打开<color=yellow>"..g_ItemName.."<color>.打开4袋可获得1个大内青铜器 , 打开10袋可获得随机6级灵石1个, 打开20袋可获得一个月华, 打开30袋可获得6级灵石配方1张,打开40袋可获得1把储物箱金钥匙, 打开60袋可获得1个7级灵石, 打开100袋可获得一个奇金, 打开160袋可获得1本武林宝典, 打开240袋可获得1个二级青铜鼎, 打开2000袋可获得1个炎黄铁魂。你确定要打开吗？<color=red>注意<color>:你需要有"..g_NeedRoom.."格背包空间和"..g_NeedWeight.."负重力。获得的灵石和灵石配方均放在聚灵鼎里。",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = " 1个赤铁精,陨铁2个,声望50点,25点师门贡献度, 1个红萝卜, 3本生员证书, 3本秀才证书, 3本举人证书,1个大内青铜器,随机6级灵石配方1张,月华1个,随机6级灵石1颗,1把储物箱金钥匙,随机7级灵石1颗,1个奇金,1本武林宝典,1个二级青铜鼎,1个炎黄铁魂,奔宵或腾雾马随机1匹 ";
	Talk(1,"#OnUse("..nItemIdx..")","每个'"..g_ItemName.."打开可以获得: "..szItems..".祝你好运！");
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
			Msg2Player("你获得1个赤铁精");
			AddItem(2,2,8,2);	--陨铁2个
			Msg2Player("你获得陨铁2个");
			ModifyReputation(50,0);	--声望50点
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+25);	--师门贡献度25
				Msg2Player("你获得25点师门贡献度");
			end;
			AddItem(2,1,1090,1);
			Msg2Player("你获得1个红萝卜");
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
			give_item(2,1,3208,1,"1个大内青铜器",10,4);	--大内青铜器1个,10%且每开4个包必给1个
			add_peifang(6,1,5,10,0);	--随机6级灵石配方1张,5%且每开10个包必给1个
			--以下需要发全服公告
			give_item(2,1,2002,1,"1个月华",5,20,1);--月华1个,5%且每开20个包必给1个
			add_lingshi(6,1,5,30,1);	--随机6级灵石1颗,5%且每开30个包必给1个
			if GetTask(1482) == 0 then
				if give_chest_key(2,0,1050,1,"1把储物箱金钥匙",1,40,1) == 1 then	--1把储物箱金钥匙,1%且开40个包必给（每人限得1次）
					SetTask(1482,1);	--只能获得一次
				end;
			end;
			add_lingshi(7,1,0.2,60,1);	--随机7级灵石1颗,0.2%且每开60个包必给1个
			give_item(2,1,563,1,"1个奇金",0.2,100,1);	--奇金,0.2%且每开100个包必给一个
			give_item(2,1,3206,1,"1本武林宝典",0.1,160,1);--武林宝典1本,0.1%且每开160个包必给1个
			give_item(2,1,3214,1,"1个二级青铜鼎",0.1,240,1);	--二级青铜鼎1个,0.1%且每开240个包必给1个
			give_item(2,1,1146,1,"1个炎黄铁魂",0.01,2000,1)	--炎黄铁魂1个,0.01%且每开2000个包必给 1个
			WriteLog("["..g_ItemName.."]:"..GetName().."th?"..nCurCount.." m? "..g_ItemName);
		end;
	else
		Talk(1,"","你的背包空间或负重力不够，请检查背包！"..g_ItemName.."!");
	end;
end;
--系统提示及日志。第二个参数填1表示发全服务器系统消息
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("你获得"..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(get_name().."M? '"..g_ItemName.."获得"..szItemName);
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
			show_msg(szItemName,1)
		else
			szItemName = "1匹腾雾马";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		end;
		nRetResult = 1;
	end;
	if mod(nCurCount,nModCount) == 0 then
		if random(1,2) == 1 then
			szItemName = "1匹奔宵马";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		else
			szItemName = "1匹腾雾马";
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
