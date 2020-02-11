pairs = pairs or function(t) return t end
strsub = strsub or string.sub
gsub = gsub or string.gsub
function Val2Str(value, ind)
	ind = ind or "";
	if strlen(ind) > 10 then
		return "...";
	end
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
		value = gsub(value, "\n", "\\n");
		value = gsub(value, "\t", "\\t");
		return '"'..value..'"';
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
function Val2Str_red(value, ind)
	ind = ind or "";
	if strlen(ind) > 10 then
		return "...";
	end
	if type(value) == "table" then
		local str = '{';
		local tmp_ind = ind..''
		for k,v in pairs(value) do
			str = str .. tmp_ind .. '['..Val2Str(k)..']=' .. Val2Str_red(v, tmp_ind) .. ',';
		end
		str = str .. ind .. '}';
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		value = gsub(value, "\n", "\\n");
		value = gsub(value, "\t", "\\t");
		return '"'..value..'"';
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
function st2(t)
	if type(t) == 'table' then
		for k,v in t do
			write(t..":")
			st(v)
		end
	elseif type(t) == "string" then
		print('"'..t..'"')
	else
		print(t)
	end
end
pairs = pairs or function(t) return t end
getn = (table and table.getn) or getn
strlen = strlen or string.len
function st(t)
	for k,v in pairs(t) do
		print(k,v)
	end
end
--解包table。
--参数1：输入table
--参数2：开始位置。默认值为1
--参数3：结束位置。默认值为table大小
function unpack(tbTable,nStartIdx,nEndIdx)
	if not tbTable then return end
	if type(tbTable) ~= 'table' then
		return tbTable;
	end
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],unpack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;

function Val2Str_mini(value, ind)
	ind = ind or "";
	if strlen(ind) > 10 then
		return "...";
	end
	if type(value) == "table" then
		local str = '{';
		if strlen(ind) < 2 then
			str = '\n'..ind..str;
		end
		local tmp_ind = ind..'\t'
		local n = 1;

		for k,v in pairs(value) do
			if n == k then
				str = str .. Val2Str_mini(v, tmp_ind) .. ", ";
				n = n + 1
			else
				str = str ..'\n'.. tmp_ind .. '['..Val2Str_mini(k)..'] = ' .. Val2Str_mini(v, tmp_ind) .. ',';
			end
		end
		if n > 1 then
			str = str .. '}';
		else
			str = str ..'\n'.. ind .. '}';
		end
		return str;
	elseif type(value) == 'function' then
		return '"#FUNCTION"';
	elseif type(value) == 'string' then
		value = gsub(value, "\n", "\\n");
		value = gsub(value, "\t", "\\t");
		return '"'..value..'"';
	elseif type(value) == 'boolean' then
		return '"'..tostring(value)..'"';
	else
		return tostring(value);
	end
end
