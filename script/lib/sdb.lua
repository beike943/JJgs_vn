Include("\\script\\class\\class.lua")
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\class\\mem.lua");

g_ThisFile = "\\script\\lib\\sdb.lua";

SDB = {
	key = "",
	n1 = 0,
	n2 = 0,
	bMatchRealm = nil,	-- nil:读写本地数据库; 2:原服读写跨服; 3:跨服读写原服
	sortType = 0,		-- 0:不排序; 1:升序; 2:降序
}
_DEBUG = nothing
function SDB:apply(file, func)
	_DEBUG("SDB:apply",file, func)
	self:reflash()
	if self.bMatchRealm == 2 then
		_DEBUG("ApplyRelayShareDataInMatchRealm",self.key, self.n1, self.n2, file, func);
		ApplyRelayShareDataInMatchRealm(self.key, self.n1, self.n2, file, func);
	elseif self.bMatchRealm == 3 then
		_DEBUG("ApplyRelayShareDataInSourceRealm",self.key, self.n1, self.n2, file, func);
		ApplyRelayShareDataInSourceRealm(self.key, self.n1, self.n2, file, func);
	else
		_DEBUG("ApplyRelayShareData",self.key, self.n1, self.n2, file, func);
		ApplyRelayShareData(self.key, self.n1, self.n2, file, func);
	end
end
g_tSDB_CB2 = {}
function SDB:apply2(cb)
	local cbKey = SDB_makeKey(self.key, self.n1, self.n2);
	if g_tSDB_CB2[cbKey] then
		if GetTime() - g_tSDB_CB2[cbKey].time > 60 then
			g_tSDB_CB2[cbKey] = nil;
		else
			tinsert(g_tSDB_CB2[cbKey], {PlayerIndex, GetPlayerID(), cb});
			return
		end
	end
	g_tSDB_CB2[cbKey] = {{PlayerIndex, GetPlayerID(), cb}};
	g_tSDB_CB2[cbKey].time = GetTime();
	self:apply(CALL_SCRIPT_NAME, "SDB_Apply2CB");
end
function SDB_Apply2CB(key, n1, n2, nCount, _key, _n1, _n2)
	local oldPlayerIdx = PlayerIndex
	if nCount <= 0 then
		key, n1, n2 = _key, _n1, _n2;
	end
	local sdbData = SDB(key, n1, n2);
	local cbKey = SDB_makeKey(key, n1, n2);
	local tCB = g_tSDB_CB2[cbKey] or {};
	_DEBUG("g_tSDB_CB2 = ", Val2Str(g_tSDB_CB2),"getn(tCB)",getn(tCB));
	for i = 1, getn(tCB) do
		PlayerIndex = tCB[i][1];
		if GetPlayerID() == tCB[i][2] then
			tCB[i][3](nCount, sdbData);
		end
	end
	g_tSDB_CB2[cbKey] = nil;
	PlayerIndex = oldPlayerIdx;
end

function SDB:reflash()
	_DEBUG("DelRelayShareDataCopy",self.key, self.n1, self.n2);
	DelRelayShareDataCopy(self.key, self.n1, self.n2);
end
function SDB:modify(index, data)
	if self.bMatchRealm == 2 then
		print(format("[SDB_settable] [error bMatchRealm] [bMatchRealm = %s]", tostring(2)));
		___();
	elseif self.bMatchRealm == 3 then
		_DEBUG("ModifyRelayShareDataToSourceRealm",self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2));
		ModifyRelayShareDataToSourceRealm(self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2));
	else
		_DEBUG("ModifyRelayShareData",self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2))
		ModifyRelayShareData(self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2))
	end
end
function SDB:delete(file, func)
	_DEBUG("SDB:delete",self.key, self.n1, self.n2, file, func)
	return ClearRelayShareData(self.key or "", self.n1, self.n2, file or "", func or "");
end
function SDB_newSDB(self, key, n1, n2, bMatchRealm)
	local t = new(self);
	t.key = key;
	t.n1 = n1;
	t.n2 = n2;
	t.bMatchRealm = bMatchRealm;
	settag(t, SDB_tag);
	return t;
end

tSDB_key = {
	"key",
	"n1",
	"n2",
	"apply",
	"apply2",
	"sortType",
	"reflash",
	"bMatchRealm",
	"modify",
	"delete",
}
function SDB_gettable(self, index)
	local data;
	for _, key in tSDB_key do
		if key == index then
			return rawget(self, index);
		end
	end
	if type(index) == "string" then
		_DEBUG("GetRelayShareDataByKey",self.key, self.n1, self.n2, index)
		data = totable(GetRelayShareDataByKey(self.key, self.n1, self.n2, index));
	elseif type(index) == "number" then
		_DEBUG("GetRelayShareDataByIndex",self.key, self.n1, self.n2, index)
		data = totable(GetRelayShareDataByIndex(self.key, self.n1, self.n2, index));
	else
		print(format("[SDB_gettable] [error index] [index = %s]", tostring(index)));
	end

	return data;
end

function SDB_settable(self, index, data)
	for _, key in tSDB_key do
		if key == index then
			return rawset(self, index, data);
		end
	end
	if self.bMatchRealm == 2 then
		print(format("[SDB_settable] [error bMatchRealm] [bMatchRealm = %s]", tostring(2)));
		___();
	elseif self.bMatchRealm == 3 then
		_DEBUG("AddRelayShareDataToSourceRealm",self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2));
		AddRelayShareDataToSourceRealm(self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2));
	else
		_DEBUG("AddRelayShareData",self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2))
		AddRelayShareData(self.key, self.n1, self.n2, g_ThisFile, "nothing", self.sortType, index, data[1], gf_UnPack(data, 2))
	end
--	self:reflash();
end

SDB_tag = newtag()
settagmethod(SDB_tag, "function", SDB_newSDB);
settagmethod(SDB_tag, "gettable", SDB_gettable);
settagmethod(SDB_tag, "settable", SDB_settable);
settag(SDB, SDB_tag);


---------Auxiliary----------------------------------------------
g_tSDB_CB = {};
function SDB_makeKey(key, n1, n2)
	return format("$%s$%08d%08d", key, n1, n2);
end
function SDBCallBack(key, n1, n2, cb)
	_DEBUG("SDBCallBack",key, n1, n2, cb)
	local cbKey = SDB_makeKey(key, n1, n2);
	if g_tSDB_CB[cbKey] then
		if GetTime() - g_tSDB_CB[cbKey].time > 60 then
			g_tSDB_CB[cbKey] = nil;
		else
			tinsert(g_tSDB_CB[cbKey], {PlayerIndex, GetPlayerID(), cb});
			return
		end
	end
	g_tSDB_CB[cbKey] = {{PlayerIndex, GetPlayerID(), cb}};
	g_tSDB_CB[cbKey].time = GetTime();
	local t3v3Data = SDB(key, n1, n2);
	_DEBUG("SDBCallBack",CALL_SCRIPT_NAME);
	t3v3Data:apply(CALL_SCRIPT_NAME, "SDBCallBackCB");
end

function SDBCallBackCB(key, n1, n2, nCount, _key, _n1, _n2)
	_DEBUG("SDBCallBackCB",key, n1, n2, nCount)
	_DEBUG("SDBCallBackCB",CALL_SCRIPT_NAME);
	local oldPlayerIdx = PlayerIndex
	if nCount <= 0 then
		key, n1, n2 = _key, _n1, _n2;
	end
	local sdbData = SDB(key, n1, n2);
	local cbKey = SDB_makeKey(key, n1, n2);
	local tCB = g_tSDB_CB[cbKey] or {};
	_DEBUG("g_tSDB_CB = ", Val2Str(g_tSDB_CB))
	for i = 1, getn(tCB) do
		PlayerIndex = tCB[i][1];
		if GetPlayerID() == tCB[i][2] then
			_DEBUG(tCB[i][3], nCount, sdbData);
			tCB[i][3](nCount, sdbData);
		end
	end
	g_tSDB_CB[cbKey] = nil;
	PlayerIndex = oldPlayerIdx;
end

------DataMgr----------------------------------------------------
-- 数据管理
-- 参考 \script\missions\nvn\data_mgr.lua
DataMgr = class {
	dataList = {
--		dataKey		= {sdbkey,  n1, n2, realmType,  interval}
--		BattleData 	= {SDBKEY_3V3, 0, 0, 2, 60},
--		MatchRound 	= {SDBKEY_3V3, 2, 0, 2, 60},
--		GlobalRank 	= {SDBKEY_RANK_GLOBAL, 0, 0, 2, 60},
--		LocalRank	= {SDBKEY_RANK_LOCAL, 0, 0, 0, 60},
	},
}

function DataMgr:Init(dataList)
	for dataKey, dataSetting in dataList do
		local dataHandle = {}
		dataHandle.sdb = SDB(dataSetting[1], dataSetting[2], dataSetting[3], dataSetting[4]);
		dataHandle.interval = dataSetting[5];
		dataHandle.lastTime = 0;
		
		self.dataList[dataKey] = dataHandle;
	end
end

function DataMgr:resetSDB(datakey, sdb, interval)
	local oldDataHandle = self.dataList[dataKey];
	if oldDataHandle then
		oldDataHandle.sdb:reflash();
	end
	local dataHandle = {}
	dataHandle.sdb = sdb;
	dataHandle.interval = interval;
	dataHandle.lastTime = 0;
	
	self.dataList[dataKey] = dataHandle;
end

function DataMgr:getData(dataKey, cb)
	local dataHandle = self.dataList[dataKey];
	if not dataHandle then
		WriteLog(format("[DataMgr] [Error Key] [Key=%s] [File=%s]", dataKey, CALL_SCRIPT_NAME));
		cb();
		return
	end
	_DEBUG("DataMgr:getData",GetTime(), dataHandle.lastTime, dataHandle.interval)
	if GetTime() - dataHandle.lastTime < dataHandle.interval then
		return cb(dataHandle.nCount or 0, dataHandle.data);
	end
	dataHandle.sdb:apply2(callout(DataMgr.getDataCB, self, dataKey, cb));
end

function DataMgr:getDataImm(dataKey, cb)
	local dataHandle = self.dataList[dataKey];
	if dataHandle then
		dataHandle.lastTime = 0;
	end
	self:getData(dataKey, cb);
end

function DataMgr:getDataCB(dataKey, cb, nCount, data)
	local dataHandle = self.dataList[dataKey];
	dataHandle.nCount = nCount;
	dataHandle.data = data;
	dataHandle.data.bMatchRealm = dataHandle.sdb.bMatchRealm;
	dataHandle.lastTime = GetTime();
	cb(nCount, data, 1);
end

-------------------------------------------------------
function totable(...)
	local t = new(arg)
	t.n = nil;
	return t;
end
-------------------------------------------------------
-- usage

--ApplyRelayShareData("世界数据ID",0,0,File_name,"CallBackGetWrdTask")
--GetRelayShareDataByKey(szKey, nKey1, nKey2,suit_id)
--AddRelayShareData("世界数据ID",0,0, File_name, "end_dialog", 0,suit_id, "dddddddddd", wrd_data[0],wrd_data[1],wrd_data[2],wrd_data[3],wrd_data[4],wrd_data[5],wrd_data[6],wrd_data[7],wrd_data[8],wrd_data[9])
--DelRelayShareDataCopy(szKey,nKey1,nKey2)
--
--function test_SDB()
--	local t = SDB("aaa", 0, 0);
--	t:apply("\\sdb\\sdb.lua", "cb")
--end
--
--function cb(key, n1, n2, nCount)
----	print(key, n1, n2, nCount)
--	local t = SDB(key, n1, n2);
--	t.sortType = 2;
--	t["1"] = {"dd", 2,1};
--	x = t["1"]
--	print(Val2Str(x))
--end

--print(Val2Str(t));
--print(Val2Str(t(1,2,3)));

--print(Val2Str(relayShareDB))
