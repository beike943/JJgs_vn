Include("\\script\\task\\global_task\\gtask_head.lua");

tGTaskTSDL = {};		--特殊掉落的统一处理

--特殊掉落 当前任务是否存在
--返回值
	--0 不存在
	--其他值 存在
function tGTaskTSDL:IsTSDLExist(nTaskID)
	return tGTaskTSDL:GetTSDLIdx(nTaskID);
end

--特殊掉落 当前任务对应的Idx
--返回值
	-- 0 不存在
	-- 其他值 Idx
function tGTaskTSDL:GetTSDLIdx(nTaskID)
	for n = 2,TABLE_GT_TSDL:getRow() do
		local nTSDLTaskID = tonumber(TABLE_GT_TSDL:getCell(n,1));
		if nTSDLTaskID == nTaskID then
			return n
		end
	end
	
	return 0
end

--特殊掉落 从一堆任务ID中找到特殊掉落
function tGTaskTSDL:ExtractTSDLList(tTaskID)
	local tRetTaskID = {};
	local tRetTSDLIdx = {};
	
	for n = 2,TABLE_GT_TSDL:getRow() do
		local nTSDLTaskID = tonumber(TABLE_GT_TSDL:getCell(n,1));
		for i = 1, getn(tTaskID) do
			local nTaskID = tTaskID[i];
			if nTSDLTaskID == nTaskID then	--完了完了，这个任务需要特殊掉落
				tinsert(tRetTSDLIdx, n);
				tinsert(tRetTaskID, nTSDLTaskID);
				break
			end
		end
	end
	
	return tRetTaskID, tRetTSDLIdx
end

--特殊掉落 从一堆任务ID中找到还未完成的特殊掉落
function tGTaskTSDL:ExtractLiveTSDLList(tTaskID)
	local tRetTaskIDList = {};
	local tRetTSDLList = {};
	local tTaskIDList = {};
	local tTSDLList = {};
	
	tTaskIDList, tTSDLList = tGTaskTSDL:ExtractTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 0 then
			tinsert(tRetTSDLList, tTSDLList[i]);
			tinsert(tRetTaskIDList, tTaskIDList[i]);
		end
	end
	
	return tRetTaskIDList, tRetTSDLList
end

--特殊掉落 一堆任务ID中含有特殊掉落
-- 返回值
	--1、有
	--0、无
function tGTaskTSDL:IsLiveTSDL(tTaskID)
	local tTaskIDList = {}
	local tTSDLList = {};
	
	tTaskIDList , tTSDLList = tGTaskTSDL:ExtractTSDLList(tTaskID);
	
	for i = 1, getn(tTSDLList) do
		if tGTaskTSDL:IsTSDLEnd(tTSDLList[i]) == 0 then
			return 1
		end
	end
	
	return 0
end

--特殊掉落是否完成
--返回值
	--1、完成
	--0、未完成
function tGTaskTSDL:IsTSDLEnd(nTSDLIdx)
	local szTemp = TABLE_GT_TSDL:getCell(nTSDLIdx, 5);
	local tItemID = split(szTemp,",");
	
	if tonumber(TABLE_GT_TSDL:getCell(nTSDLIdx, 7)) > GetItemCount(tItemID[1],tItemID[2],tItemID[3]) then
		return 0
	end
	
	return 1
end

--特殊掉落地图匹配
--返回值
	--0、匹配
	--其他值、不匹配
function tGTaskTSDL:IsMatchMap(nTSDLIdx, nMapID)
	local nTabMapID = tonumber(TABLE_GT_TSDL:getCell(n, 2));
	if nTabMapID == nil then
		nTabMapID = 0
	end
	if  nTabMapID ~= 0 and nTabMapID == nMapID then
		nTabMapID = 0
	end	
	return nTabMapID;
end

--特殊掉落Npc匹配
--返回值
	--1、匹配
	--0、不匹配
function tGTaskTSDL:IsMatchNpc(nTSDLIdx, szNpcName)
	local strNpcName = TABLE_GT_TSDL:getCell(nTSDLIdx, 3);
	local tNpcName =split(strNpcName, ",");
	for i = 1, getn(tNpcName) do
		if tNpcName[i] == szNpcName then
			return 1;
		end
	end	
	
	return 0
end

--特殊掉落 满足特殊掉落条件
--返回值
	--1、满足
	--2、不满足
function tGTaskTSDL:IsMatch(nTSDLIdx, szNpcName, nMapID)
	local bMap = tGTaskTSDL:IsMatchMap(nTSDLIdx, nMapID);
	local nIsTSDLNpc = tGTaskTSDL:IsMatchNpc(nTSDLIdx, szNpcName);
	
	if bMap == 0 and nIsTSDLNpc == 1 then
		return 1
	end
	
	return 0
end

----------------------------------------------------------------------------------------------------与玩家有关
