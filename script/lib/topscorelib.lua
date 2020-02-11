-- topscore head lib

Include("\\script\\class\\mem.lua");

tTopScore = {};

--t = {
--	name = "天门阵",
--	title = {'名字','门派','阵营','杀人数','死亡数','分数'},
--	data = {
--		p11 = {'p134567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=gold>'},
--		p21 = {'p234567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p31 = {'p334567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p41 = {'p434567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p51 = {'p534567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p61 = {'p634567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p71 = {'p734567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p81 = {'p834567890123451', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		pa1 = {'pa34567890123451', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pb1 = {'pb34567890123451', '12345678', '近卫', 0, 6, 4, 1,'<color=blue>'},
--		pc1 = {'pc34567890123451', '12345678', '近卫', 0, 6, 3, 1,'<color=blue>'},
--		pd1 = {'pd34567890123451', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pe1 = {'pe34567890123451', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pf1 = {'pf34567890123451', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pg1 = {'pg34567890123451', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		ph1 = {'ph34567890123451', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		p12 = {'p134567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=gold>'},
--		p22 = {'p234567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p32 = {'p334567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p42 = {'p434567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p52 = {'p534567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p62 = {'p634567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p72 = {'p734567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		p82 = {'p834567890123452', '12345678', '天灾', 5, 5, 5, 1,'<color=red>'},
--		pa2 = {'pa34567890123452', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pb2 = {'pb34567890123452', '12345678', '近卫', 0, 6, 4, 1,'<color=blue>'},
--		pc2 = {'pc34567890123452', '12345678', '近卫', 0, 6, 3, 1,'<color=blue>'},
--		pd2 = {'pd34567890123452', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pe2 = {'pe34567890123452', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pf2 = {'pf34567890123452', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		pg2 = {'pg34567890123452', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--		ph2 = {'ph34567890123452', '12345678', '近卫', 0, 6, 2, 1,'<color=blue>'},
--	},
--	szFormat = "%-17s%-9s%-9s%-7s%-7s%-6s",
--	szMsg = "     占阵时间比: <color=blue>近卫 100<color> / <color=red>天灾 200<color>",
--}


-- 初始化TopScore的table, 一定要在每个showTable创建的时候调用
function initTopScore(t)
assert(type(t) == "table");
assert(type(t.data) == "table");
	function setValue(t,i,v, bData)
		local oldvalue = rawget(t,i);
		if type(oldvalue) == "table" then
			oldvalue = new(oldvalue);
		end
		rawset(t,i,v);
		if v == nil then
			syncScoreBuff(i, nil, bData, t);
			if bData then						-- 退出
				syncClearScore(oldvalue);
			end
		elseif oldvalue == nil and bData then	-- 新加入
			syncScoreBuff(i, v, bData, t);
			syncAllScore(v, tTopScore[t.parent]);
		else
			if type(oldvalue) ~= type(v) or type(v) ~= "table" then
				syncScoreBuff(i, v, bData, t);
			else
				local sync = {}
				for k=1, getn(v) do
					if (oldvalue and oldvalue[k]) ~= v[k] then
						if v[k] == nil then
							syncScoreBuff(i,v,bData, t);
						end
						sync[k] = v[k];
					end
				end
				syncScoreBuff(i, sync, bData, t);
			end
		end	
	end
	
	function setData(t,i,v)
		setValue(t,i,v,1);
	end

	tTopScore[getn(tTopScore)+1] = t;
	t.data.parent = getn(tTopScore);
	local nt = newtag()
	settagmethod(nt, "settable", setData);
	settag(t.data,nt)

	local nt = newtag()
	settagmethod(nt, "settable", setValue);
	settag(t,nt)
end

SyncTable = {};
SyncBuff = "";
function syncScoreBuff(key,v, bData, tData)
	if bData then
		if type(v) ~= "table" then
			SyncBuff = SyncBuff..format("SyncTSD(%s,%s);",Val2Str(key), Val2Str_red(v));
		else
			SyncTable.data = SyncTable.data or {};
			SyncTable.data[key] = v;
		end
	else
		tData = tData.data or tData;
		if type(v) ~= "table" then
			SyncBuff = SyncBuff..format("SyncTS(%s,%s);",Val2Str(key), Val2Str_red(v));
		else
			SyncTable[key] = v;
		end
	end
	local bTableData = nil;
	for k,v in SyncTable do
		bTableData = 1;
		break;
	end
	if bTableData then
		SyncBuff = SyncBuff.."SyncTable("..Val2Str_red(SyncTable)..")";
	end
	syncSendBuff(tData, SyncBuff);
	SyncBuff = "";
	SyncTable = {};
end
function syncSetKey(key, bData)
	if bData then
		key = "data["..key.."]";
	end
	key = Val2Str(key);
	return key;
end

function syncSendBuff(t, str)
	if type(t) ~= "table" or type(str) ~= "string" then return end
	if strlen(str) >= 2000 then
		local msg = format("[TopScore] [Error] overflow in %s, length=%d", str, strlen(str));
--		WriteLog(msg);
		return
	end
	local OldPlayerIndex = PlayerIndex;
	for k,v in t do
	for i=1,1 do
		if type(v) ~= "table" then break end
		PlayerIndex = tonumber(v[getn(v)-1]);
		if PlayerIndex <= 0 then
			local msg = format("[TopScore] [Error] PlayerIndex=%d, Data.Key=%s",PlayerIndex, k);
			WriteLog(msg);
			break;
		end
		SendScript2Client(str);
	end
	end
	PlayerIndex = OldPlayerIndex;
end

function syncClearScore(t)
	if type(t) ~= "table" then return end
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = tonumber(t[getn(t)-1]);
	if PlayerIndex <= 0 then
		local msg = format("[TopScore] [Error] PlayerIndex=%d, Data.Key=%s",PlayerIndex, k);
		WriteLog(msg);
		return
	end
	SendScript2Client("SyncClear()");
	PlayerIndex = OldPlayerIndex;
end

function syncAllScore(tTable, tAll)
	if type(tTable) ~= "table" or type(tAll) ~= "table" then return end
	local OldPlayerIndex = PlayerIndex;
	PlayerIndex = tonumber(tTable[getn(tTable)-1]);
	if PlayerIndex <= 0 then
		local msg = format("[TopScore] [Error] PlayerIndex=%d, Data.Key=%s",PlayerIndex, k);
		WriteLog(msg);
		return
	end
	local tTab = new(tAll);
	tTab.data = {};
	local str = "SyncTable("..Val2Str_red(tTab)..");";
	str = str.."Open('topscore');";
	sendScriptBuff(str);
	local tData = {};
	for k,v in tAll.data do
		tData.data = {};
		tData.data[k] = v;
		str = "SyncTable("..Val2Str_red(tData)..");";
		sendScriptBuff(str);
	end
	PlayerIndex = OldPlayerIndex;
end

function sendScriptBuff(str)
	if strlen(str) >= 2000 then
		local msg = format("[TopScore] [Error] overflow in %s, length=%d", str, strlen(str));
		WriteLog(msg);
		return
	end
	SendScript2Client(str);
end

pairs = pairs or function(t) return t end
function Val2Str(value, ind)
	ind = ind or "";
	if type(value) == "table" then
		local str = '{\n';
		local tmp_ind = ind..'\t'
		for k,v in pairs(value) do
			str = str .. tmp_ind .. '['..Val2Str(k)..'] = ' .. Val2Str(v, tmp_ind) .. ',\n';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2);
		else
			value = gsub(value, "\n", "\\n");
			value = gsub(value, "\t", "\\t");
			return '"'..value..'"';
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
function Val2Str_red(value, ind)
	ind = ind or "";
	if type(value) == "table" then
		local str = '{';
		local tmp_ind = ind..''
		for k,v in pairs(value) do
			str = str .. tmp_ind .. '['..Val2Str(k)..']=' .. Val2Str_red(v, tmp_ind) .. ',';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#F"';
	elseif type(value) == 'string' then
		if strsub(value,1,1) == '@' then
			return strsub(value,2);
		else
			value = gsub(value, "\n", "\\n");
			value = gsub(value, "\t", "\\t");
			return '"'..value..'"';
		end
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
