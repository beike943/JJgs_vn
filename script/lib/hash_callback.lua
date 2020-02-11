
function HashFunction(s)
	local s = loadstr(f)
	g_FuncHash = g_FuncHash or {};
	assert(g_FuncHash[s] == nil)
	g_FuncHash[s] = {}
	g_FuncHash[s][1] = f;
	g_FuncHash[s][2] = arg;
	return s;
end

function CallHashFunction(s)
	assert(g_FuncHash);
	assert(g_FuncHash[s]);
	g_FuncHash[s][1](g_FuncHash[s][2]);
end

function HashTable(t)
	g_TableHash = g_TableHash or {};
	local s = strsub(tostring(t), 8);
	g_TableHash[s] = t;
	return s;
end

function HashTableFunctionCallback(t, sf)
	return "#GetTable('"..HashTable(t).."'):"..sf;
end

function GetTable(s)
	return g_TableHash and g_TableHash[s];
end
