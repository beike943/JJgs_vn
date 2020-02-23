Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\lingshi_head.lua");
g_ItemName = "和谐江山包";
g_NeedRoom = 15;
g_NeedWeight = 200;
TSK_COUNTER = 1158;
function OnUse(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;
	local selTab = {
				format("我要打开/#open(%d)",nItemIdx),
				format("看看里面有什么/#see_item(%d)",nItemIdx),
				"暂时不打开/nothing",
				}
	Say("这是你第<color=yellow>"..nCurCount.."<color>次打开<color=yellow>"..g_ItemName.."<color>。请注意：打开2袋将得到1个神农丹,打开4袋将得到一个5级随机灵石和随机1个黄金采集道具,打开10袋将随机6级灵石1颗,打开30袋将收到对应的1本流派镇派残卷中卷,打开40袋将收到1本农桑辑要,打开60袋将获得一个随机7级灵石1颗,打开120袋将获得对应的1本流派镇派残卷下册,打开200袋将随机获得1匹奔宵或腾雾马。您确认要打开<color=yellow>"..g_ItemName.."<color>吗？<color=red>注意<color>:你需要有足够的"..g_NeedRoom.."格空间和"..g_NeedWeight.."负重力，尚未加入门派的人员将收到随机一个门派。",getn(selTab),selTab);
end;

function see_item(nItemIdx)
	local szItems = "1个磐龙璧,1个赤铁精,50-100的声望, 50点（师门贡献度）,1-4级随机灵石1颗,3本生员证书,3本秀才证书, 3本举人证书,神农丹1颗,随机5级灵石1颗,随机黄金采集工具1把,随机6级灵石1颗,对应1本流派镇派残卷中卷,农桑辑要,随机7级灵石1颗,对应的1本流派镇派残卷下册,奔宵或腾雾马随机1匹";
	Talk(1,"#OnUse("..nItemIdx..")","每个'"..g_ItemName.."里包含: "..szItems.."，祝你好运！");
end;

tZJCP = 
{
	[0]  = {{"D辌h C﹏ Kinh-trung",2,1,917},{"T葃 T駓 Kinh-trung",2,1,923},{"Nh? Lai Th莕 Chng-trung",2,1,920},{"H蕄 Tinh Tr薾-trung",2,1,926},{"V筺 Tng Th莕 C玭g-trung",2,1,929},{"Thi猲  Tr蕁 H錸 Kh骳-trung",2,1,932},{"Gi竛g Long Th藀 B竧 Chng-trung",2,1,935},{"Ф C萿 C玭 Tr薾-trung",2,1,938},{"V? Thng Th竔 C鵦 Ki誱-trung",2,1,941},{"Th竔 C鵦 Th莕 C玭g-trung",2,1,944},{"Li猲 Ho祅 To祅 Long Thng-trung",2,1,947},{"B? Vng Tng Ph鬾g Ti詎-trung",2,1,950},{"V? 秐h Ma C?-trung",2,1,953},{"V? Thi猲 Ma C玭g-trung",2,1,956}},
	[1]  = {{"D辌h C﹏ Kinh-trung",2,1,917},{"T葃 T駓 Kinh-trung",2,1,923},{"Nh? Lai Th莕 Chng-trung",2,1,920}},
	[2]  = {{"D辌h C﹏ Kinh-trung",2,1,917}},
	[3]  = {{"T葃 T駓 Kinh-trung",2,1,923}},
	[4]  = {{"Nh? Lai Th莕 Chng-trung",2,1,920}},
	[5]  = {{"H蕄 Tinh Tr薾-trung",2,1,926}},
	[6]  = {{"H蕄 Tinh Tr薾-trung",2,1,926}},
	[7]  = {{"V筺 Tng Th莕 C玭g-trung",2,1,929},{"Thi猲  Tr蕁 H錸 Kh骳-trung",2,1,932}},
	[8]  = {{"V筺 Tng Th莕 C玭g-trung",2,1,929}},
	[9]  = {{"Thi猲  Tr蕁 H錸 Kh骳-trung",2,1,932}},
	[10] = {{"Gi竛g Long Th藀 B竧 Chng-trung",2,1,935},{"Ф C萿 C玭 Tr薾-trung",2,1,938}},
	[11] = {{"Gi竛g Long Th藀 B竧 Chng-trung",2,1,935}},
	[12] = {{"Ф C萿 C玭 Tr薾-trung",2,1,938}},
	[13] = {{"V? Thng Th竔 C鵦 Ki誱-trung",2,1,941},{"Th竔 C鵦 Th莕 C玭g-trung",2,1,944}},
	[14] = {{"V? Thng Th竔 C鵦 Ki誱-trung",2,1,941}},
	[15] = {{"Th竔 C鵦 Th莕 C玭g-trung",2,1,944}},
	[16] = {{"Li猲 Ho祅 To祅 Long Thng-trung",2,1,947},{"B? Vng Tng Ph鬾g Ti詎-trung",2,1,950}},
	[17] = {{"Li猲 Ho祅 To祅 Long Thng-trung",2,1,947}},
	[18] = {{"B? Vng Tng Ph鬾g Ti詎-trung",2,1,950}},
	[19] = {{"V? 秐h Ma C?-trung",2,1,956},{"V? Thi猲 Ma C玭g-trung",2,1,953}},
	[20] = {{"V? Thi猲 Ma C玭g-trung",2,1,956}},
	[21] = {{"V? 秐h Ma C?-trung",2,1,953}},
}

tXJCP = 
{
	[0]  = {{"D辌h C﹏ Kinh-h? ",2,1,918},{"T葃 T駓 Kinh-h? ",2,1,924},{"Nh? Lai Th莕 Chng-h? ",2,1,921},{"H蕄 Tinh Tr薾-h? ",2,1,927},{"V筺 Tng Th莕 C玭g-h? ",2,1,930},{"Thi猲  Tr蕁 H錸 Kh骳-h? ",2,1,933},{"Gi竛g Long Th藀 B竧 Chng-h? ",2,1,936},{"Ф C萿 C玭 Tr薾-h? ",2,1,939},{"V? Thng Th竔 C鵦 Ki誱-h? ",2,1,942},{"Th竔 C鵦 Th莕 C玭g-h? ",2,1,945},{"Li猲 Ho祅 To祅 Long Thng-h? ",2,1,948},{"B? Vng Tng Ph鬾g Ti詎-h? ",2,1,951},{"V? 秐h Ma C?-h? ",2,1,954},{"V? Thi猲 Ma C玭g-h? ",2,1,957}},
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

function open(nItemIdx)
	local nCurCount = GetTask(TSK_COUNTER)+1;	--当前是第几次开启
	local nRoute = GetPlayerRoute();
	if gf_JudgeRoomWeight(g_NeedRoom,g_NeedWeight) == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			SetTask(TSK_COUNTER,nCurCount);
			local nRand = 0;
			local nRetCode,nItemIdx = 0,0;
			nRetCode,nItemIdx = AddItem(2,1,1000,1);	--磐龙璧1个
			SetItemExpireTime(nItemIdx,7*24*3600);
			Msg2Player("你获得1个磐龙璧");
			AddItem(2,1,2652,1);
			Msg2Player("你获得1个赤铁精");
			ModifyReputation(random(50,100),0);	--声望50-100随机
			if GetPlayerRoute() ~= 0 then
				SetTask(336,GetTask(336)+50);	--师门贡献度50
				Msg2Player("你获得50点师门贡献度");
			end;
			nRand = random(1,4);
			lspf_AddLingShiInBottle(nRand,1);	--随机1-4级随机灵石1颗
			Msg2Player("你获得1-4级随机灵石1颗");
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
			give_item(2,1,343,1,"神农丹",200,2,0)	--神农丹1颗,20%且每开2个包必给1个
			add_lingshi(5,1,100,4,0);	--随机5级灵石1颗,10%且每开4个包必给1个
			add_golden_tool(1,100,4);	--随机黄金工具1把,10%且每开4个包必给1个
			--以下需要发全服公告
			add_lingshi(6,1,50,10);	--随机6级灵石1颗,5%且每开10个包必给1个
			add_zpcp(tZJCP,1,10,30);	--对应流派镇派残卷中卷,1%且每开30个包必给1个
			give_item(2,1,1056,1,"N玭g Tang ph?",5,40,1);	--农桑辑要,0.5%且每开40个包必给1个
			add_lingshi(7,1,2,60);	--随机7级灵石1颗,0.2%且每开60个包必给1个
			add_zpcp(tXJCP,1,2,120);	--对应流派镇派残卷下册,0.2%且每开120个包必给1个
			add_horse(2,200);	--奔宵或腾雾随机1匹，0.2%且每开200个包必给1个
			WriteLog("["..g_ItemName.."]:"..GetName().."th?"..nCurCount.." m? "..g_ItemName);
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
--给物品，参数依次为：物品ID1,物品ID2,物品ID3,数量，物品名字，概率（单位千分一），必给的次数，是否发全服公告，有限天数
function give_item(nID1,nID2,nID3,nCount,szItemName,nP,nModCount,bGlobalMsg,nDate)
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
		show_msg(szItemName,bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		nRetCode,nItemIdx = AddItem(nID1,nID2,nID3,nCount);
		show_msg(szItemName,bGlobalMsg);
		if nDate ~= nil then
			SetItemExpireTime(nItemIdx,nDate*24*3600);
		end;
	end;
end;
--给灵石。参数：等级，数量，概率（单位千分一），必给的次数，是否发全服公告：0不发，1发
function add_lingshi(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--默认发全服公告
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (等级)灵石",bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddLingShiInBottle(nLevel,nCount);
		show_msg(nCount.." "..nLevel.." (等级)灵石",bGlobalMsg);
	end;
end;
--给灵石配方。参数：等级，数量，概率（单位千分一），必给的次数
function add_peifang(nLevel,nCount,nP,nModCount,bGlobalMsg)
	if bGlobalMsg == nil then
		bGlobalMsg = 1;	--默认发全服公告
	end;
	local nCurCount = GetTask(TSK_COUNTER);
	local nRand = random(1,1000);
	local nRetCode,nItemIdx = 0,0;
	if nRand <= nP then 
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (等级)-灵石配方",bGlobalMsg);
	end;
	if mod(nCurCount,nModCount) == 0 then
		lspf_AddPeiFangInBottle(nLevel,nCount);
		show_msg(nCount.."张"..nLevel.." (等级)-灵石配方",bGlobalMsg);
	end;
end;

function add_zpcp(tbZPCP,nCount,nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	if nRand <= nP then
		give_zpcp(tbZPCP,nCount);
	end;
	if mod(nCurCount,nModCount) == 0 then
		give_zpcp(tbZPCP,nCount);
	end;
end;

function add_horse(nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	local szItemName = "";
	if nRand <= nP then 		--奔宵或腾雾随机1匹
		if random(1,2) == 1 then
			szItemName = "1匹奔宵马";
			AddItem(0,105,16,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		else
			szItemName = "1匹腾雾马";
			AddItem(0,105,20,1,1,-1,-1,-1,-1,-1,-1);
			show_msg(szItemName,1)
		end;
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
	end;
end;

function add_golden_tool(nCount,nP,nModCount)
	local nRand = random(1,1000);
	local nCurCount = GetTask(TSK_COUNTER);
	local nRandomItem = random(23,28);
	if nRand <= nP then
		AddItem(0,200,nRandomItem,nCount,1);
		Msg2Player("你随机得到一把黄金采集工具");
	end;
	if mod(nCurCount,nModCount) == 0 then
		AddItem(0,200,nRandomItem,nCount,1);
		Msg2Player("你随机得到一把黄金采集工具");	
	end;
end;

function nothing()

end;
