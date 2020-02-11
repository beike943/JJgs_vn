-- Global Database Sync

Include("\\script\\lib\\sdb.lua")
Include("\\script\\lib\\define.lua")
Include("\\script\\lib\\val2str.lua");
Include("\\script\\lib\\define.lua")

GDS_thisFile = "\\script\\misc\\globaldatasync.lua";

function GDS_writeTask(nkey1, nkey2, keyword, tTask)
	if nkey1 == 0 and (nkey2 >= 1 and nkey2 <= 3) then
		print(format("[Error Type] [GDS_writeTask] [nkey1=%d, nkey2=%d, keyword=%s]",nkey1, nkey2, keyword));
		return
	end
	local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
	_DEBUG("GDS_writeTask strGbGroup,strName =",strGbGroup,strName)
	local key = "Realm_"..strName;
	
	local writer = SDB(key, nkey1, nkey2, 3);
	
	local TbList = {}
	local strFmt = "";
	local i, n = 1, 1;
	
	local name, acc = GetName(), GetAccount();
	while 1 do
		if tTask[i] then
			strFmt = strFmt .. "dd";
			tinsert(TbList,tTask[i]);
			tinsert(TbList,GetTask(tTask[i]));
		end
		if not tTask[i] or mod(i, 8) == 0 then
			tinsert(TbList, 1, strFmt);
			TbList.n = nil;
			writer[keyword..n] = TbList;
			WriteLog(format("[GDS] [writeTask] [Role:%s Acc:%s] [%s]",
				name, acc, Val2Str_mini(TbList)))
			n = n + 1;
			strFmt = "";
			TbList = {};
		end
		if not tTask[i] then break end
		i = i + 1;
	end
end

function GDS_updateTask(nkey1, nkey2)
	local key = "Realm_"..GetName();
	local data = SDB(key, nkey1, nkey2)
	data:apply(GDS_thisFile, "GDS_updateTaskCB")
end

function GDS_updateTaskCB(key, nkey1, nkey2, count)
	_DEBUG("GDS_updateTaskCB",key, nkey1, nkey2, count)
	local name, acc = GetName(), GetAccount();
	if count <= 0 then return end
	local data = SDB(key, nkey1, nkey2)
	if nkey1 == 0 and (nkey2 >= 1 and nkey2 <= 3) then
		if 1 == GDS_updateOther(nkey2) then
			data:delete();
		end
		return 1;
	end
	for i = 0, count - 1 do
		local TbList = data[i];
		if getn(TbList) < 2 then
			WriteLog(format("[GDS] [Update] [Role:%s Acc:%s] [DataCount=%d]",
				name, acc, TaskID, getn(TbList)));
		end
		for n = 2,getn(TbList),2 do
			if TbList[n] ~= 0 and TbList[n+1] ~= nil then
				local TaskID = TbList[n];
				local oldValue = GetTask(TaskID);
				local newValue = TbList[n+1];
				SetTask(TbList[n],TbList[n+1]);
				WriteLog(format("[GDS] [Update] [Role:%s Acc:%s] [TaskID=%d, oldValue=%d, Value=%d]",
					name, acc, TaskID, oldValue, newValue));
			end
		end
	end
	data:delete();
end

g_tGushiTask = {--¹ÆÊ¦µÄ±äÁ¿
	2204,2216,2207,2222,2219,2210,2228,2213,2225,2231
};

function GDS_writeOther(nkey2)
	local strGbGroup,strName = GLB_BW_GetRealmName(GetName());
	local key = "Realm_"..strName;
	local writer = SDB(key, 0, nkey2, 3);
	if nkey2 == 1 then	-- ¹ÆÊ¦
		local tGushi = {};
		local strFormat = "";
		for k,v in g_tGushiTask do
			local nValue = GetTask(v);
			strFormat = strFormat.."d";
			tinsert(tGushi,nValue);
		end
		tinsert(tGushi, 1, strFormat);
		tGushi.n = nil;
		writer["GS"] = tGushi;
	elseif nkey2 == 2 then -- åĞÒ£±Ò
		--writer["XYB"] = {"d", GetTask(TASKID_XOYO_CONSUME)};
	elseif nkey2 == 3 then -- åĞÒ£Óñ
		--writer["XYY"] = {"d", GetTask(TASKID_XOYOYU_CONSUME)};
	else
		print(format("[Error Type] [GDS_writeOther] [nkey2=%d]", nkey2));
		return
	end
end

function GDS_updateOther(nkey2)
	local key = "Realm_"..GetName();
	local data = SDB(key, 0, nkey2)
	if nkey2 == 1 then
		local TbList = data["GS"];
		if getn(TbList) < 2 then
			return 0;
		end
		for i = 1,getn(TbList) do
			SetTask(g_tGushiTask[i],TbList[i]);
		end
	elseif nkey2 == 2 then -- åĞÒ£±Ò
		--local val = data["XYB"];
		--PayXYB(val[1]);
		--SetTask(TASKID_XOYO_CONSUME, 0);
	elseif nkey2 == 3 then -- åĞÒ£Óñ
		--local val = data["XYY"];
		--PayXYY(val[1]);
		--SetTask(TASKID_XOYOYU_CONSUME, 0);
	else
		print(format("[Error Type] [GDS_writeOther] [nkey2=%d]", nkey2));
		return 0
	end
	return 1;
end
--======================================================================
--»ñÈ¡¿ç·şÍæ¼ÒÇø·şºÍÃû×Ö
function GLB_BW_GetRealmName(strName)
	local aa,bb,strGbGroup,strGbName = strfind(strName,"(.-)*(.*)");
	return strGbGroup,strGbName or strName;
end

--======================================================================
-- for test
--function GetName() return "$name$" end
--AddRelayShareDataToSourceRealm = AddRelayShareData
--
--for i = 1, 20 do SetTask(i,i) end
--GDS_writeTask(3,4,"xx",{1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19})
--GDS_updateTask(3,4)
--
--for k, v in g_tGushiTask do
--	SetTask(v, v);
--end
--
--print(TASKID_XOYO_CONSUME)
--SetTask(TASKID_XOYO_CONSUME, 11);
--SetTask(TASKID_XOYOYU_CONSUME, 12);
--GDS_writeOther(1)
--GDS_writeOther(2)
--GDS_writeOther(3)
--GDS_writeOther(4)
--GDS_updateTask(0,1)
--GDS_updateTask(0,2)
--GDS_updateTask(0,3)
--GDS_updateTask(0,4)

