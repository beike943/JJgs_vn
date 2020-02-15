--每个包的固定奖励如下
--4本实战心得
--20点师门贡献度
--1个宝石包裹
--每个包的随机奖励如下
--1个消劫散——10%（每开5个包必得）
--1个磐龙璧——10%（每开10个包必得）
--1颗随机6级灵石——10%（每开10个包必得）
--1张7级灵石配方——10%（每开10个包必得）
--50个太易混元功图鉴（2,0,1082）——99级每开20个包必得
--3本师门高级秘籍——每开40个包必得
--1个炎黄铁魂——每开100个包必得
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
TSK_USE_GLORY_BAG_TIME = 593;

function OnUse(nItemIdx)
	if gf_CheckPlayerRoute() == 0 then
		Talk(1,"","没有加入帮会的人不能打开这个包裹");
		return 0;
	end;
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(11,150,"") == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			get_item();
			get_random_item(nUseTime+1);
			SetTask(TSK_USE_GLORY_BAG_TIME,nUseTime+1);
		end;
	end;
end;

function get_item()
	AddItem(2,1,1101,4);--4本实战心得
	Msg2Player("获得4本实战心得");
	SetTask(336,GetTask(336)+20);--20点师门贡献度
	Msg2Player("获得20点师门贡献度");
	AddItem(2,1,2642,1);--1个宝石包裹
	Msg2Player("获得1个宝石包裹");
end;

function get_random_item(nUseTime)
	local nLevel = GetLevel();
	local nRand = random(1,100);
	if nRand <= 10 then	--1个消劫散——10%（每开5个包必得）
		AddItem(2,0,141,1);
		Msg2Player("获得1个消劫散");
	end;
	if mod(nUseTime,5) == 0 then
		AddItem(2,0,141,1);
		Msg2Player("获得1个消劫散");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1个磐龙璧——10%（每开10个包必得）
		AddItem(2,1,1000,1);
		Msg2Player("获得1个磐龙璧");
	end;
	if mod(nUseTime,10) == 0 then
		AddItem(2,1,1000,1);
		Msg2Player("获得1个磐龙璧");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1颗随机6级灵石——10%（每开10个包必得）
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("获得1颗随机6级灵石");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddLingShiInBottle(6,1);
		Msg2Player("获得1颗随机6级灵石");
	end;
	--================================================================
	nRand = random(1,100);
	if nRand <= 10 then	--1张7级灵石配方——10%（每开10个包必得）
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("获得1张7级灵石配方");
	end;
	if mod(nUseTime,10) == 0 then
		lspf_AddPeiFangInBottle(7,1);
		Msg2Player("获得1张7级灵石配方");
	end;
	--================================================================
	if mod(nUseTime,20) == 0 and nLevel == 99 then	--50个太易混元功图鉴（2,0,1082）
		AddItem(2,0,1082,50);
		Msg2Player("获得50个太易混元功图鉴");
	end;
	--================================================================
	if mod(nUseTime,40) == 0 then	--3本师门高级秘籍——每开40个包必得
		give_book(3);
	end;
	--================================================================
	if mod(nUseTime,100) == 0 then	--1个炎黄铁魂——每开100个包必得
		AddItem(2,1,1146,1);
		Msg2Player("获得1个炎黄铁魂");
	end;
	Msg2Player("这是你第一次"..nUseTime.."在比武比赛中获得的奖励");
	WriteLog("[比武荣耀包2]:"..GetName().."物品"..nUseTime.."这是一场光荣的决斗");
end;

g_tbBook = 
{
	[2] = {"金刚般若经",0,107,166},	--少林俗家
	[4] = {"潜龙寂灭经",0,107,167}, --少林武僧
	[3] = {"无尘菩提经",0,107,168}, --少林禅僧
	[6] = {"天罗连珠录",0,107,169}, --唐门
	[8] = {"如意金顶秘籍",0,107,170}, --峨嵋佛家
	[9] = {"碧海绝音谱",0,107,171}, --峨嵋俗家
	[11] = {"混速镇岳秘籍",0,107,172}, --丐帮净衣
	[12] = {"揆天游龙秘籍",0,107,173}, --丐帮污衣
	[14] = {"幻影迷踪秘籍",0,107,174}, --武当道家
	[15] = {"君子截风秘籍",0,107,175}, --武当俗家
	[17] = {"镇军飞龙枪谱",0,107,176}, --杨门枪骑
	[18] = {"穿云落虹秘籍",0,107,177}, --杨门弓骑
	[20] = {"幽冥封魔录",0,107,178}, --五毒邪侠
	[21] = {"灵蛊幻邪录",0,107,179}, --五毒蛊师
	[23] = {"九天风雷诀",0,107,198},	
	[29] = {"红尘醉梦谱",0,107,202},
	[30] = {"风花千叶谱",0,107,203},	
}

function give_book(nNum)
	local nRoute = GetPlayerRoute();
	local tbBook = g_tbBook[nRoute];
	if not tbBook then
		return 0;
	end;
	local nID1,nID2,nID3 = tbBook[2],tbBook[3],tbBook[4];
	local szName = tbBook[1];
	AddItem(nID1,nID2,nID3,nNum,4);
	Msg2Player(format("获得%d这本%s",nNum,szName));
end;

function nothing()

end;
