-------------------------------------------------------------
-- tag2.lua
-- by windle
-- 2010-8-25 11:57
-- 封装tag, 使之用起来和metatable一样用法
-------------------------------------------------------------
Include("\\script\\lib\\globalfunctions.lua")

-------------------------------------------------------------
TTagMgr = {
	_tags = {},
}

function TTagMgr:setmetatable(t, mt)
	local oldTag = self:getmetatable(t);
	local tTag = self:createTag(mt);
	settag(t, tTag);
	return oldTag;
end

function TTagMgr:getmetatable(t)
	local _tag = tag(t);
	local metatable = self._tags[_tag];
	return metatable;
end

TTagNone = {}

function TTagMgr:createTag(mt)
	mt = mt or TTagNone;
	local _tag = mt._tag;
	if not _tag then
		_tag = newtag();
		for key, func in mt do
			if TTagMgr:isTagMethod(key) then
				settagmethod(_tag, key, func);
			end
		end
		mt._tag = _tag;
		self._tags[_tag] = mt;
	end
	return _tag;
end

function TTagMgr:isTagMethod(key)
	local tKey = {
		"add",
		"sub",
		"mul",
		"div",
		"pow",
		"unm",
		"lt",
		"concat",
		"index",
		"getglobal",
		"setglobal",
		"gettable",
		"settable",
		"function",
		"gc",
    }
	for _, _key in tKey do
		if key == _key then return 1 end
	end
end

function setmetatable(table, metatable)
	if type(table) ~= "table" then
		print(format("[Warning] [setmetatable] [#1 : (%s) %s]", type(table), tostring(table)));
--		return
	end
	return TTagMgr:setmetatable(table, metatable);
end
function getmetatable(table)
	return TTagMgr:getmetatable(table);
end

-------------------------------------------------------------
-- tag base class
TTag = {
	_tag = nil,
	method = {
	},
}
function TTag:settag(table)
	if not self._tag then
		self._tag = newtag();
		_tag = self._tag;
		for key, func in self.method do
			settagmethod(_tag, key, func);
		end
	end
	settag(table, self._tag);
end
function TTag:gettagmethod(method)
	return self.method[method];
end
-------------------------------------------------------------

-------------------------------------------------------------
-- test
function f() end
function test_tag()
	local TTagTest = {
		[       "add"] = function(T, ...) print(       "add"); end,
		[       "sub"] = function(T, ...) print(       "sub"); end,
		[       "mul"] = function(T, ...) print(       "mul"); end,
		[       "div"] = function(T, ...) print(       "div"); end,
		[       "pow"] = function(T, ...) print(       "pow"); end,
		[       "unm"] = function(T, ...) print(       "unm"); end,
		[        "lt"] = function(T, ...) print(        "lt"); end,
		[    "concat"] = function(T, ...) print(    "concat"); end,
		[     "index"] = function(T, ...) print(     "index"); end,
		[ "getglobal"] = function(T, ...) print( "getglobal"); end,
		[ "setglobal"] = function(T, ...) print( "setglobal"); end,
		[  "gettable"] = function(T, ...) print(  "gettable"); end,
		[  "settable"] = function(T, ...) print(  "settable"); end,
		[  "function"] = function(T, ...) print(  "function"); end,
	--	[        "gc"] = function(T, ...) print(        "gc"); end,
	}

	local TTest = {}
	setmetatable(TTest, TTagTest);
	print(Val2Str(getmetatable(TTest)));
	print(TTest, "xxx");

	setmetatable(TTest);
	TTest()
end
function print1()
	return xxx > 1;
end
function errhandle(msg)
	n = 2;
	while(1) do
		local ar = getinfo(n)
		print("================================")
		print(Val2Str(ar));
		print("================================")
		if not ar then break end
		if n > 10 then break end
		local head = 'function ';
		if not ar.name then
			head = "";
		end
		if ar.short_src == "C" then
			msg = msg .. format("\n %d: function %s [C]", n-1, ar.name);
		else
			msg = msg .. format("\n %d: %s%s %s #%d", n-1, head, ar.name or ar.what, ar.source, ar.currentline);
		end
		n = n + 1;
	end
	print(msg);
end
--call(print1,{1,2,3},"x",errhandle);
--call(print1,{1,2,3},"x");
--test_tag()

-------------------------------------------------------------
-- usage
--metatable = TTag({
--	method = {
--		["function"] = function (T, ...)
--				print("calling");
--			end,
--	},
--})
--table = {}
--TTagMgr:setmetatable(table, metatable);
--_metatable = TTagMgr:getmetatable(table);
--table()
--TTagMgr:setmetatable(table, nil);
--table()

t = {a=1}
mt = {
		[     "add"] = function(...) print(     "add", Val2Str(arg)); end,
		[     "sub"] = function(...) print(     "sub", Val2Str(arg)); end,
--		["unm"] = function(...) print("unm", Val2Str(arg)); end,
--		[ "getglobal"] = function(...) 
--			print( "getglobal", Val2Str(arg)); 
--			local name = arg[1];
--			local oldvalue = arg[2];
--			--newvalue = arg[3];
--			
--			--print (rawget(globals()[t],)); 
--			return oldvalue;
--		end,
--		[ "setglobal"] = function(...) 
--			print( "setglobal", Val2Str(arg)); 
--			local name = arg[1];
--			local oldvalue = arg[2];
--			local newvalue = arg[3];
--			return rawset(globals(),name,newvalue); 
--		end,
}

setmetatable(t,mt)
