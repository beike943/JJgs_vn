Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "和谐盛会包";
g_NeedRoom = 15;
g_NeedWeight = 200;
TSK_COUNTER = 1800;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("我要打开/#open(%d)",nItemIdx),
				"看看里面有什么/see_item",
				"暂时不打开/nothing",
				}
	Say("这是你第<color=yellow>"..nCurCount.."<color>次打开<color=yellow>"..g_ItemName.."<color>.。请注意:打开4袋将收到随机1个5级灵石,打开10袋将收到随机1个6级灵石配方,打开12袋将收到1个月华,打开20袋将收到随机1个6级灵石,打开40袋将收到1本农桑辑要,打开60袋将收到随机1个7级灵石,打开200袋将收到随机一匹奔宵或腾雾马,打开240袋将收到对应流派的一本镇派秘籍残卷下册，您确认要打开<color=yellow>"..g_ItemName.."<color>吗？<color=red>注意<color>:你需要有"..g_NeedRoom.."格空间和"..g_NeedWeight.."负重力，尚未加入门派的人员将收到随机一个门派。",getn(selTab),selTab);
end;

function see_item()
	local szItems = "随机1-2个磐龙璧, 50点声望,随机1个灵石,3本生员证书,3本秀才证书,3本举人证,随机1个5级灵石,随机1个6级灵石,月华,随机1个6级灵石配方,农桑辑要，随机1个7级灵石,随机一匹奔宵或腾雾马,对应流派的一本镇派秘籍残卷下册";
	Talk(1,"","每个"..g_ItemName.."里包含: "..szItems.."，祝你好运！");
end;

tXJCP = 
{
	[0]  = {{"易筋经下卷残篇",2,1,918},{"洗髓经下卷残篇",2,1,924},{"如来神掌下卷残篇",2,1,921},{"吸星阵下卷残篇",2,1,927},{"万相神功下卷残篇",2,1,930},{"天音镇魂曲下卷残篇",2,1,933},{"降龙十八掌下卷残篇",2,1,936},{"打狗棍阵下卷残篇",2,1,939},{"无上太极剑下卷残篇",2,1,942},{"太极神功下卷残篇",2,1,945},{"连环钻龙枪下卷残篇",2,1,948},{"霸王翔凤箭下卷残篇",2,1,951},{"无影魔蛊下卷残篇",2,1,954},{"无天魔功下卷残篇",2,1,957}},
	[1]  = {{"易筋经下卷残篇",2,1,918},{"洗髓经下卷残篇",2,1,924},{"如来神掌下卷残篇",2,1,921}},
	[2]  = {{"易筋经下卷残篇",2,1,918}},
	[3]  = {{"洗髓经下卷残篇",2,1,924}},
	[4]  = {{"如来神掌下卷残篇",2,1,921}},
	[5]  = {{"吸星阵下卷残篇",2,1,927}},
	[6]  = {{"吸星阵下卷残篇",2,1,927}},
	[7]  = {{"万相神功下卷残篇",2,1,930},{"天音镇魂曲下卷残篇",2,1,933}},
	[8]  = {{"万相神功下卷残篇",2,1,930}},
	[9]  = {{"天音镇魂曲下卷残篇",2,1,933}},
	[10] = {{"降龙十八掌下卷残篇",2,1,936},{"打狗棍阵下卷残篇",2,1,939}},
	[11] = {{"降龙十八掌下卷残篇",2,1,936}},
	[12] = {{"打狗棍阵下卷残篇",2,1,939}},
	[13] = {{"无上太极剑下卷残篇",2,1,942},{"太极神功下卷残篇",2,1,945}},
	[14] = {{"无上太极剑下卷残篇",2,1,942}},
	[15] = {{"太极神功下卷残篇",2,1,945}},
	[16] = {{"连环钻龙枪下卷残篇",2,1,948},{"霸王翔凤箭下卷残篇",2,1,951}},
	[17] = {{"连环钻龙枪下卷残篇",2,1,948}},
	[18] = {{"霸王翔凤箭下卷残篇",2,1,951}},
	[19] = {{"无影魔蛊下卷残篇",2,1,954},{"无天魔功下卷残篇",2,1,957}},
	[20] = {{"无天魔功下卷残篇",2,1,957}},
	[21] = {{"无影魔蛊下卷残篇",2,1,954}},
}

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nLSLevel = 0;
			local nRetCode,nItemIdx = 0,0;
			nRand = random(1,2);
			for i=1,nRand do
				nRetCode,nItemIdx = AddItem(2,1,1000,1);	--磐龙璧1-2个
				SetItemExpireTime(nItemIdx,7*24*3600);
			end;
			Msg2Player("你获得"..nRand.."个磐龙璧");
			ModifyReputation(50,0);
			nRand = random(1,4);
			lspf_AddLingShiInBottle(nRand,1);
			Msg2Player("你获得1个"..nRand.." (级)灵石");
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
			nRand = random(1,100);
			if nRand < 10 then
				lspf_AddLingShiInBottle(5,1);
				Msg2Player("你获得1个5级灵石");
			end;
			if mod(nCurCount,4) == 0 then
				lspf_AddLingShiInBottle(5,1);
				Msg2Player("你获得1个5级灵石");
			end;
			add_peifang(6,1,50,10);
			give_item(2,1,2002,1,"月华",50,12);	
			add_lingshi(6,1,20,20);
			give_item(2,1,1056,1,"农桑辑要",5,40);
			add_lingshi(7,1,2,60);
			nRand = random(1,1000);
			if nRand <= 2 then 		--奔宵或腾雾随机1匹
				if random(1,2) == 1 then
					szItemName = "一匹奔宵马";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				else
					szItemName = "一匹腾雾马";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				end;
			end;
			if mod(nCurCount,200) == 0 then
				if random(1,2) == 1 then
					szItemName = "一匹奔宵马";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				else
					szItemName = "一匹腾雾马";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				end;			
			end;
			nRand = random(1,1000);
			if nRand <= 2 then
				give_zpcp(tXJCP);
			end;
			if mod(nCurCount,240) == 0 then
				give_zpcp(tXJCP);
			end;
			WriteLog("["..g_ItemName.."]:"..GetName().."物品"..nCurCount.."打开"..g_ItemName);
		end;
	else
		Talk(1,"","你的背包空间或负重力不够，请先确认一下背包！"..g_ItemName.."!");
	end;
end;
--系统提示及日志。第二个参数填1表示发全服务器系统消息
function show_msg(szItemName,bGlobalMsg)
	Msg2Player("你获得"..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(GetName().."打开'"..g_ItemName.."获得"..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."获得"..szItemName);	
end;
--给镇派残篇的函数
function give_zpcp(tbZPCP)
	local nRoute = GetPlayerRoute();
	local nRand = random(1,getn(tbZPCP[nRoute]));
	local nId1 = tbZPCP[nRoute][nRand][2];
	local nId2 = tbZPCP[nRoute][nRand][3];
	local nId3 = tbZPCP[nRoute][nRand][4];
	local szName = tbZPCP[nRoute][nRand][1];		
	AddItem(nId1,nId2,nId3,1);		
	show_msg(szName,1);
end;
--给物品，参数依次为：物品ID1,物品ID2,物品ID3,数量，物品名字，概率（单位千分一），必给的次数，有限天数
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,1);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
	end;
end;
--给灵石。参数：等级，数量，概率（单位千分一），必给的次数
function add_lingshi(nLevel,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.."(级)灵石",1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.."(级)灵石",1);
	end;
end;
--给灵石配方。参数：等级，数量，概率（单位千分一），必给的次数
function add_peifang(nLevel,nCount,nP,nModCount)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (级)-灵石配方",1);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (级)-灵石配方",1);
	end;
end;

function nothing()

end;
