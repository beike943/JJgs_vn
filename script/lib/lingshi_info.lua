Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\lingshi_head.lua");
SYS_TB_LINGSHI_TOTAL = new(KTabFile,"\\settings\\item\\lingshiattr.txt");
SYS_TB_LINGSHI_ID = {};
--SYS_TB_LINGSHI_ID元素的结构：
--[nID] = {nID,nMinLevel,nUseLevel,{可用位置列表}}
SYS_TB_LINGSHI_MINLEVEL = {};
--SYS_TB_LINGSHI_MINLEVEL元素的结构：
--[nMinLevel] = {{nID,nMinLevel,nUseLevel,{可用位置列表}},...}
SYS_TB_LINGSHI_USELEVEL = {};
--SYS_TB_LINGSHI_USELEVEL元素的结构：
--[nUseLevel] = {{nID,nMinLevel,nUseLevel,{可用位置列表}},...};
--==============================================================================

--初始化灵石数据
function ls_InitLingShiTable()
	--print("灵石数据加载中......");
	local nCount = SYS_TB_LINGSHI_TOTAL:getRow();
	for i=2,nCount do	--创建以属性ID为第一层索引的表
		local nID = tonumber(SYS_TB_LINGSHI_TOTAL:getCell(i,1));
		if nID ~= nil then
			local nUseLevel = tonumber(SYS_TB_LINGSHI_TOTAL:getCell(i,24));
			if SYS_TB_LINGSHI_ID[nID] == nil then
				SYS_TB_LINGSHI_ID[nID] = {};
			end;
			local nMinLevel = 1;
			while SYS_TB_LINGSHI_TOTAL:getCell(i,3*nMinLevel) == "" do
				nMinLevel = nMinLevel + 1;
			end;
			SYS_TB_LINGSHI_ID[nID][1] = nID;
			SYS_TB_LINGSHI_ID[nID][2] = nMinLevel;
			SYS_TB_LINGSHI_ID[nID][3] = nUseLevel;
			if SYS_TB_LINGSHI_ID[nID][4] == nil then
				SYS_TB_LINGSHI_ID[nID][4] = {};
			end;
			local nAcceptPos = SYS_TB_LINGSHI_TOTAL:getCell(i,2);
			tinsert(SYS_TB_LINGSHI_ID[nID][4],nAcceptPos);
		end;
	end;
	--在第一次遍历的结果上生成另外两个table
	for i,v in SYS_TB_LINGSHI_ID do
		local nMinLevel = v[2];
		local nUseLevel = v[3];
		if SYS_TB_LINGSHI_MINLEVEL[nMinLevel] == nil then
			SYS_TB_LINGSHI_MINLEVEL[nMinLevel] = {};
		end;
		tinsert(SYS_TB_LINGSHI_MINLEVEL[nMinLevel],v);	--创建以最低等级为第一层索引的表
		if SYS_TB_LINGSHI_USELEVEL[nUseLevel] == nil then
			SYS_TB_LINGSHI_USELEVEL[nUseLevel] = {};	
		end;
		tinsert(SYS_TB_LINGSHI_USELEVEL[nUseLevel],v);	--创建以使用价值为第一层索引的表
	end;
	--print("灵石数据加载完毕！");
end;
--获得某一等级的灵石属性数量，参数2为0或不填时为获得所有等级的灵石属性数量
function ls_GetLingShiCount(tbLingShi,nLevel)
	local tb = tbLingShi;
	local nCount = 0;
	if nLevel == 0 then
		for i,v in SYS_TB_LINGSHI_ID do
			nCount = nCount + 1;
		end;
		return nCount;
	else
		return getn(tb[nLevel]);
	end
end;
--从几个等级中随机出一个灵石信息
function ls_GetRandomLingShi(tbLingShi,nMinLevel,nMaxLevel)
	local tb = tbLingShi;
	local nLowLimit,nHiLimit = 0,0;
	if tb == SYS_TB_LINGSHI_MINLEVEL then
		nLowLimit = 1;
		nHiLimit = nMaxLevel;
	elseif tb == SYS_TB_LINGSHI_USELEVEL then
		nLowLimit = nMinLevel;
		nHiLimit = nMaxLevel;	
	else
		return 0;
	end;
	local nTotalCount = 0;
	for i=nLowLimit,nHiLimit do	--获得灵石信息总数
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
	for i=nLowLimit,nHiLimit do	--在几个table中随机一个信息
		if tb[i] ~= nil then
			nPreCount = nTotalCount;
			nTotalCount = getn(tb[i]) + nTotalCount;
			if nRand <= nTotalCount then
				return tb[i][nRand-nPreCount];
			end;
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
--添加一个固定等级范围内的随机灵石
function ls_AddRandomLingShi(tbLingShi,nMinLevel,nMaxLevel)
	local tb = tbLingShi;
	local tbLSInfo = ls_GetRandomLingShi(tb,nMinLevel,nMaxLevel);
	if type(tbLSInfo) ~= "table" then
		return 0;
	end;
	local nLevel = 0;
	if tb == SYS_TB_LINGSHI_MINLEVEL then
		nLevel = random(max(tbLSInfo[2],nMinLevel),nMaxLevel);
	elseif tb == SYS_TB_LINGSHI_USELEVEL then
		nLevel = random(tbLSInfo[2],7);
	else
		return 0;
	end;
	local nID = tbLSInfo[1];
	local nUseLevel = tbLSInfo[3];
	local nPos = tbLSInfo[4][random(1,getn(tbLSInfo[4]))];
	AddLingShi(nID,nPos,nLevel);
	return nLevel,nUseLevel;
end;
--从聚灵鼎中取出灵石
function lspf_GetLingShiFromBottle(nLevel,nCount)
	local nLeft = GetTask(SYS_TSK_LINGSHI_ONE+nLevel-1);
	if nCount > nLeft then
		return 0;
	end;
	SetTask(SYS_TSK_LINGSHI_ONE+nLevel-1,nLeft-nCount);
	for i=1,nCount do
		ls_AddRandomLingShi(SYS_TB_LINGSHI_MINLEVEL,nLevel,nLevel);
	end;
	return 1;
end;
--==============================================================================
ls_InitLingShiTable();