Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\lingshi_head.lua");
SYS_TB_LINGSHI_PF_TOTAL = new(KTabFile,"\\settings\\item\\lingshipeifang.txt");
SYS_TB_LINGSHI_PF_LEVEL = {};	--存放各个等级的灵石配方信息
--SYS_TB_LINGSHI_PF_LEVEL元素的结构：
--[nLevel] = {{nID1,nID2,nID3,nLevel,nUseLevel},...}
SYS_TB_LINGSHI_PF_USELEVEL = {};	--存放各个等级的灵石配方信息
--SYS_TB_LINGSHI_PF_USELEVEL元素的结构：
--[nUseLevel] = {{nID1,nID2,nID3,nLevel,nUseLevel},...}
--===================================================================================

--初始化灵石配方table
function lspf_InitLingShiPeiFangTable()
	local nCount = SYS_TB_LINGSHI_PF_TOTAL:getRow();
	--print("灵石配方数据加载中......");
	local nLevel,nUseLevel,nID1,nID2,nID3 = 0,0,0,0,0;
	for i=2,nCount do
		if tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,42)) ~= nil then
			nLevel = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,46));
			nUseLevel = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,47));
			nID1 = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,41));
			nID2 = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,42));
			nID3 = tonumber(SYS_TB_LINGSHI_PF_TOTAL:getCell(i,43));
			if SYS_TB_LINGSHI_PF_LEVEL[nLevel] == nil then
				SYS_TB_LINGSHI_PF_LEVEL[nLevel] = {};
			end;
			if SYS_TB_LINGSHI_PF_USELEVEL[nLevel] == nil then
				SYS_TB_LINGSHI_PF_USELEVEL[nLevel] = {};
			end;
			local tbEle = {nID1,nID2,nID3,nLevel,nUseLevel};
			tinsert(SYS_TB_LINGSHI_PF_LEVEL[nLevel],tbEle)
			tinsert(SYS_TB_LINGSHI_PF_USELEVEL[nUseLevel],tbEle);
		end;
	end;
--	print("灵石配方数据加载完毕！");
--	for i=1,getn(SYS_TB_LINGSHI_PF_LEVEL) do
--		print("等级"..i.."的灵石配方有："..getn(SYS_TB_LINGSHI_PF_LEVEL[i]).."种");
--	end;
--	for i=1,getn(SYS_TB_LINGSHI_PF_USELEVEL) do
--		print("使用价值为"..i.."的灵石配方有："..getn(SYS_TB_LINGSHI_PF_USELEVEL[i]).."种");
--	end;
end;
--获得某一等级的灵石配方table
function lspf_GetPeiFangTable(tbLingShi,nLevel)
	local tb = tbLingShi;
	return tb[nLevel];
end;
--获得某一等级的灵石配方数量，参数2为0或不填时为获得所有等级的灵石配方的数量
function lspf_GetPeiFangCount(tbLingShi,nLevel)
	local tb = tbLingShi;
	local nCount = 0;
	local nMaxLevel = getn(tb);
	if nLevel < 0 or nLevel > nMaxLevel then
		return 0;
	end;
	if nLevel == 0 or nLevel == nil then
		for i=1,nMaxLevel do
			nCount = getn(tb[i]) + nCount;
		end;
		return nCount;
	else
		return getn(tb[nLevel]);
	end;
end;
--从几个等级中随机出一个灵石配方信息
function lspf_GetRandomPeiFang(tbLingShi,nMinLevel,nMaxLevel)
	local tb = tbLingShi;
	local nTotalCount = 0;
	for i=nMinLevel,nMaxLevel do	--这次循环是为了获得总大小
		if tb[i] ~= nil then
			nTotalCount = getn(tb[i]) + nTotalCount;
		end;	
	end;
	if nTotalCount == 0 then
		return 0;
	end;
	local nRand = random(1,nTotalCount);
	nTotalCount = 0;
	local nPreCount = 0;
	for i=nMinLevel,nMaxLevel do
		nPreCount = nTotalCount;
		nTotalCount = getn(tb[i]) + nTotalCount;
		if nRand <= nTotalCount then
			return tb[i][nRand-nPreCount];
		end;
	end;
	return 0;
end;
--unpack函数
function unpack(tb,i)
	i = i or 1;
	if tb[i] then
		return tb[i],unpack(tb,i+1);
	end;
end;
--添加一个固定范围内的随机灵石配方
function lspf_AddRandomPeiFang(tbLingShi,nMinLevel,nMaxLevel)
	local tbLSPFInfo = lspf_GetRandomPeiFang(tbLingShi,nMinLevel,nMaxLevel);
	if type(tbLSPFInfo) ~= "table" then
		return 0;
	end;
	local nID1,nID2,nID3,nLevel,nUseLevel = tbLSPFInfo[1],tbLSPFInfo[2],tbLSPFInfo[3],tbLSPFInfo[4],tbLSPFInfo[5];
	local nRetCode = AddItem(nID1,nID2,nID3,1);
	return nRetCode,nLevel,nUseLevel;
end;
--从聚灵鼎中取出配方
function lspf_GetPeiFangFromBottle(nLevel,nCount)
	local nLeft = GetTask(SYS_TSK_PEIFANG_ONE+nLevel-1);
	if nCount > nLeft then
		return 0;
	end;
	SetTask(SYS_TSK_PEIFANG_ONE+nLevel-1,nLeft-nCount);
	for i=1,nCount do
		lspf_AddRandomPeiFang(SYS_TB_LINGSHI_PF_LEVEL,nLevel,nLevel);
	end;
	return 1;
end;
--================================================================================
lspf_InitLingShiPeiFangTable();
