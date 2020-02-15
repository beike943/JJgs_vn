--每个包的固定奖励如下
--4本实战心得
--20点师门贡献度
--1个宝石包裹
--每个包的随机奖励如下
--1个消劫散——10%（每开5个包必得）
--1个磐龙璧——10%（每开10个包必得）
--1颗随机6级灵石——10%（每开10个包必得）
--1张7级灵石配方——10%（每开10个包必得）
--1颗随机7级灵石——每开10个包必得
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\biwudahui\\tournament\\tournament_head.lua");
function OnUse(nItemIdx)
	use(nItemIdx);
end;

function use(nItemIdx)
	local nUseTime = GetTask(TSK_USE_GLORY_BAG_TIME);
	if gf_JudgeRoomWeight(6,50,"") == 1 then
		if DelItemByIndex(nItemIdx,1) == 1 then
			get_item();
			get_random_item(nUseTime+1);
			SetTask(TSK_USE_GLORY_BAG_TIME,nUseTime+1);
		end;
	end;
end;

function get_item()
	AddItem(2,1,1101,4);--4本实战心得
	Msg2Player("获得4本实战心得);
	SetTask(336,GetTask(336)+20);--20点师门贡献度
	Msg2Player("获得20点师门贡献度");
	AddItem(2,1,2642,1);--1个宝石包裹
	Msg2Player("获得1个宝石包裹");
end;

function get_random_item(nUseTime)
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
	if mod(nUseTime,10) == 0 then	--1颗随机7级灵石——每开10个包必得
		lspf_AddLingShiInBottle(7,1);
		Msg2Player("获得1颗随机7级灵石");
	end;
	Msg2Player("这是你第一次"..nUseTime.."在比武比赛中获得的奖励");
	WriteLog("[比武荣耀包:"..GetName().."物品"..nUseTime.."这是一场光荣的决斗");
end;

function nothing()

end;
