Include("\\script\\lib\\globalfunctions.lua");

g_ItemName = "烽烟待起包";
g_NeedRoom = 16;
g_NeedWeight = 300;
TSK_COUNTER = 1798;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("知道了，我现在要打开。/#open(%d)",nItemIdx),
				"让我看看里面有什么/see_item",
				"暂时打不开/nothing",
				}
	Say("这是你第<color=yellow>"..nCurCount.."<color>次打开<color=yellow>"..g_ItemName.."。<color>请注意:打开两个袋子获得一个军功章,打开10个获得1颗宝石,打开20个获得一本中卷残篇,打开80个可获得一颗龙血丸,打开150个可获得一颗战神丸, 打开200个可获得一匹奔宵或腾雾马,打开240个可获得一本镇派秘籍，你确定打开<color=yellow>"..g_ItemName.."<color>吗? <color=red>请注意<color>:你必须拥有足够的"..g_NeedRoom.."格背包空间和"..g_NeedWeight.."的负重力;如果你还没有加入门派，你将随机获得一个门派。",getn(selTab),selTab);
end;

function see_item()
	local szItems = " 1个磐龙璧,名人堂随机50-100分,1个杀手堂面具, 1个武器银宝箱,3本生员证书,3本秀才证书,3本举人证书,一个军功章,一个御用白玉石,对应门派的一本秘籍中卷残篇,一个龙血丸,一个战神丸,随机一匹马和一本镇派秘籍。";
	Talk(1,"","每个'"..g_ItemName.."物品包含: "..szItems.."祝你好运！");
end;

tZJCP = 
{
	[0]  = {{"易筋经中卷残篇",2,1,917},{"洗髓经中卷残篇",2,1,923},{"如来神掌中卷残篇",2,1,920},{"吸星阵中卷残篇",2,1,926},{"万相神功中卷残篇",2,1,929},{"天音镇魂曲中卷残篇",2,1,932},{"降龙十八掌中卷残篇",2,1,935},{"打狗棍阵中卷残篇",2,1,938},{"无上太极剑中卷残篇",2,1,941},{"太极神功中卷残篇",2,1,944},{"连环钻龙枪中卷残篇",2,1,947},{"霸王翔凤箭中卷残篇",2,1,950},{"无影魔蛊中卷残篇",2,1,953},{"无天魔功中卷残篇",2,1,956}},
	[1]  = {{"易筋经中卷残篇",2,1,917},{"洗髓经中卷残篇",2,1,923},{"如来神掌中卷残篇",2,1,920}},
	[2]  = {{"易筋经中卷残篇",2,1,917}},
	[3]  = {{"洗髓经中卷残篇",2,1,923}},
	[4]  = {{"如来神掌中卷残",2,1,920}},
	[5]  = {{"吸星阵中卷残篇",2,1,926}},
	[6]  = {{"吸星阵中卷残篇",2,1,926}},
	[7]  = {{"万相神功中卷残篇",2,1,929},{"天音镇魂曲中卷残篇",2,1,932}},
	[8]  = {{"万相神功中卷残篇",2,1,929}},
	[9]  = {{"天音镇魂曲中卷残篇",2,1,932}},
	[10] = {{"降龙十八掌中卷残篇",2,1,935},{"打狗棍阵中卷残篇",2,1,938}},
	[11] = {{"降龙十八掌中卷残篇",2,1,935}},
	[12] = {{"Ф C萿 C玭 Tr薾-trung",2,1,938}},
	[13] = {{"无上太极剑中卷残篇",2,1,941},{"太极神功中卷残篇",2,1,944}},
	[14] = {{"无上太极剑中卷残篇",2,1,941}},
	[15] = {{"太极神功中卷残篇",2,1,944}},
	[16] = {{"连环钻龙枪中卷残篇",2,1,947},{"霸王翔凤箭中卷残篇",2,1,950}},
	[17] = {{"连环钻龙枪中卷残篇",2,1,947}},
	[18] = {{"霸王翔凤箭中卷残篇",2,1,950}},
	[19] = {{"无天魔功中卷残篇",2,1,956},{"无影魔蛊中卷残篇",2,1,953}},
	[20] = {{"无天魔功中卷残篇",2,1,956}},
	[21] = {{"无影魔蛊中卷残篇",2,1,953}},
}

tXJCP = 
{
	[0]  = {{"易筋经下卷残篇",2,1,918},{"洗髓经下卷残篇",2,1,924},{"如来神掌下卷残篇",2,1,921},{"吸星阵下卷残篇",2,1,927},{"万相神功下卷残篇",2,1,930},{"天音镇魂曲下卷残篇",2,1,933},{"降龙十八掌下卷残篇",2,1,936},{"打狗棍阵下卷残篇",2,1,939},{"无上太极剑下卷残篇",2,1,942},{"太极神功下卷残篇",2,1,945},{"连环钻龙枪下卷残篇",2,1,948},{"霸王翔凤箭下卷残篇",2,1,951},{"无影魔蛊下卷残篇",2,1,954},{"无天魔功下卷残篇",2,1,957}},
	[1]  = {{"易筋经下卷残篇",2,1,918},{"T葃 T駓 Kinh-h? ",2,1,924},{"Nh? Lai Th莕 Chng-h? ",2,1,921}},
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
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--磐龙璧1个时限7天
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("获得磐龙璧1个");
			ModifyReputation(random(50,100),0);
			nRetCode,nItemIdx = AddItem(2,1,1087,1);	--杀手堂面具1个	
			Msg2Player("获得杀手堂面具1个");
			nRetCode,nItemIdx = AddItem(2,1,1147,1);
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("获得一个武器银宝箱");
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
			if mod(nCurCount,2) == 0 then	--军功章
				nRetCode,nItemIdx = AddItem(2,1,9999,1);
				Msg2Player("获得1个军功章");
			end;
			give_item(2,1,1024,1,"1御用白玉石",50,10);
			nRand = random(1,100);
			if nRand <= 3 then
				give_zpcp(tZJCP);
			end;
			if mod(nCurCount,20) == 0 then
				give_zpcp(tZJCP);
			end;
			nRand = random(1,1000);
			give_item(2,1,1002,1,"获得1个龙血丸",5,80,7);
			give_item(2,1,1005,1,"获得1个战神丸",4,150,7);
			nRand = random(1,1000);
			if nRand <= 2 then 		--奔宵或腾雾随机1匹
				if random(1,2) == 1 then
					szItemName = "获得1匹奔宵";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				else
					szItemName = "获得1匹腾雾";
					AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				end;
			end;
			if mod(nCurCount,200) == 0 then
				if random(1,2) == 1 then
					szItemName = "1奔宵";
					AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
					show_msg(szItemName,1)
				else
					szItemName = "腾雾";
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
		Talk(1,"","你的背包空间或负重力不够，请先检查一下。"..g_ItemName.."!");
	end;
end;

function show_msg(szItemName,bGlobalMsg)
	Msg2Player("你获得"..szItemName);
	if bGlobalMsg == 1 then
		Msg2Global(GetName().."打开'"..g_ItemName.."获得"..szItemName);
	end;
	WriteLog("["..g_ItemName.."]:"..GetName().."获得"..szItemName);	
end;

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

function nothing()

end;
