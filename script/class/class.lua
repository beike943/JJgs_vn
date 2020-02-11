--------------------------------------------------------------------------------
--
--  FileName    : \script\class\class.lua
--  Creator     : Windle
--  Create Date : 2013/01/04   17:34:53
--  Version     : 1.3
--  Comment     : inherit		简单引用继承, 使用必包把基类引用到upvalue中
--				: superInherit 	带super的引用继承,基类引用到self.getmetatable()._super中
--				: class			简单copy继承, 所有基类的成员都copy到当前table
--				: superClass	带super的copy继承, 所有基类的成员都copy到self._super中
--				: 
--				: 解决循环引用问题
--				:
--	Usage		: A = inherit {...};  a = A:new();
--				: B = A {...}
--				: C = inherit(A, B, {...})
--				: A:super():f();							调用基类的函数同时使用基类的变量
--				: A:super().f(A); self:super().f(self);		调用基类的函数同时使用派生类的变量
--
--------------------------------------------------------------------------------
Include("\\script\\lib\\tag.lua")

--Inherit----------------------------------------------------

gt_SIMPLE_INHERIT_NAMESPACE = {
	baseClass = {
		new = function (self)
			return gt_SIMPLE_INHERIT_NAMESPACE.inherit(self, {});
		end,
	},
	inherit = function (...)
		local derive = arg[getn(arg)];
		arg[getn(arg)] = nil;
		arg.n = nil;
		local super = arg;
		local index = function(self, key)
			for i = getn(%super), 1, -1 do
				if %super[i][key] then
					return %super[i][key];
				end
			end
		end
		local metatable = {
			["index"] = index,
			["function"] = gt_SIMPLE_INHERIT_NAMESPACE.inherit
		}
		setmetatable(derive, metatable);
		return derive;
	end,
}

function inherit(...)
	tinsert(arg, 1, gt_SIMPLE_INHERIT_NAMESPACE.baseClass);
	t = call(gt_SIMPLE_INHERIT_NAMESPACE.inherit, arg);
	return t;
end
--TEST inherit----------------------------------------------------
--print("--TEST inherit----------------------------------------------------")
--tBase = inherit {
--	a = 1,
--	f = function(self)
--		print("base", self.a);
--	end,
--}
--print("tBase",Val2Str(tBase));
--tBase:f()
--
--tBase2 = tBase:new();
--print("tBase2",Val2Str(tBase2));
--tBase2:f()
--
--tDrive = tBase {
--	a = 2,
--}
--print("tDrive",Val2Str(tDrive));
--tDrive:f()
--
--tDrive2 = tDrive {
--	f = function(self)
--		print("tDrive2", self.a);
--	end
--}
--print("tDrive2",Val2Str(tDrive2));
--tDrive2:f()
--
--tDrive3 = tDrive2:new();
--print("tDrive3",Val2Str(tDrive3));
--tDrive3:f()
--
--tBaseB = inherit {
--	b = 1,
--}
--print("tBaseB",Val2Str(tBaseB));
--
--tDriveB = inherit(tBase, tBaseB, {c = 1,})
--print("tDriveB",Val2Str(tDriveB));
--tDriveB:f()
--print(tDriveB.a, tDriveB.b, tDriveB.c, tDriveB.f)
--
--tBaseBB = tDriveB:new();
--print("tBaseBB",Val2Str(tBaseBB));
----tBaseBB:f()
--print(tBaseBB.a, tBaseBB.b, tBaseBB.c, tBaseBB.f)

--Super Inherit----------------------------------------------------
gt_SUPER_INHERIT_NAMESPACE = {
	baseClass = {
		new = function (self)
			return gt_SUPER_INHERIT_NAMESPACE.inherit(self, {});
		end,
		super = function (self)
			local metatable = getmetatable(self);
			if not metatable then
				return
			end
			return metatable._super;
		end
	},
	indexSuper = function(super, key)
		for i = getn(super), 1, -1 do
			if super[i][key] then
				return super[i][key];
			end
		end
	end,
	index = function(self, key)
		return gt_SUPER_INHERIT_NAMESPACE.baseClass.super(self)[key];
	end,
	inherit = function (...)
		local derive = arg[getn(arg)];
		arg[getn(arg)] = nil;
		arg.n = nil;
		local super = arg;
		local mt_super = {
			index = gt_SUPER_INHERIT_NAMESPACE.indexSuper,
		}
		setmetatable(super, mt_super);
		local mt_derive = {
			_super = super,
			["index"] = gt_SUPER_INHERIT_NAMESPACE.index,
			["function"] = gt_SUPER_INHERIT_NAMESPACE.inherit
		}
		setmetatable(derive, mt_derive);
		return derive;
	end,
}

function superInherit(...)
	tinsert(arg, 1, gt_SUPER_INHERIT_NAMESPACE.baseClass);
	t = call(gt_SUPER_INHERIT_NAMESPACE.inherit, arg);
	return t;
end
--TEST superInherit----------------------------------------------------
--print("--TEST superInherit----------------------------------------------------")
--tBase = superInherit {
--	a = 1,
--	f = function(self)
--		print("base", self.a);
--	end,
--}
--print("tBase",Val2Str(tBase));
--tBase:f()
--
--tBase2 = tBase:new();
--print("tBase2",Val2Str(tBase2));
--tBase2:f()
--
--tDrive = tBase {
--	a = 2,
--}
--print("tDrive",Val2Str(tDrive));
--tDrive:f()
--
--tDrive2 = tDrive {
--	f = function(self)
--		print("tDrive2", self.a);
--	end
--}
--print("tDrive2",Val2Str(tDrive2));
--tDrive2:f()
--
--tDrive3 = tDrive2:new();
--print("tDrive3",Val2Str(tDrive3));
--tDrive3:f()
--
--tBaseB = superInherit {
--	b = 1,
--}
--print("tBaseB",Val2Str(tBaseB));
--
--tDriveB = superInherit(tBase, tBaseB, {c = 1,})
--print("tDriveB",Val2Str(tDriveB));
--tDriveB:f()
--print(tDriveB.a, tDriveB.b, tDriveB.c, tDriveB.f)
--
--tBaseBB = tDriveB:new();
--print("tBaseBB",Val2Str(tBaseBB));
----tBaseBB:f()
--print(tBaseBB.a, tBaseBB.b, tBaseBB.c, tBaseBB.f)
--
--A = superInherit { a = 1, 
--	f3 = function(self) print("A", self.a) end,
--	f4 = function(self) print("4", self.a) end,
--}
--print("A", Val2Str(A));
--B = superInherit { a = 2 }
--print("B", Val2Str(B));
--ab = superInherit(A, B, {
--	f3 = function(self) print("C", self.a) end,
--	});
--print("ab", Val2Str(ab));
--
--print("new",ab.new)
--print("super", ab.super)
--print(ab.a);
--ab:f3();
--ab:f4();
--mt = getmetatable(ab);
--print("mt", Val2Str(mt));
--ab:super():f3();
--ab:super().f3(ab);
--
--A = superInherit { a = 1 }
--a = A {};
--print(a.a);
--A.a = 2;
--print(a.a);
--
--
--A = superInherit { a = 1, 
--	f = function(self) print("A", self.a) end,
--	f4 = function(self) print("4", self.b) end, 
--};
--B = A { 
--	a = 2,
--	b = 2,
--	f = function(self) print("B", self.b) end, 
--	f2 = function(self) 
--		f() 
--	end,
--	f3 = function(self)
--		print(self:f4());
--		local s1 = self.super(self)
--		local s2 = self:super();
--		print("s1, s2" ,Val2Str(s1), Val2Str(s2));
--		print(s1.f)
--		self:super().f(self)
--		self:super():f()
--	end
--};
--C = B { c=3}
--print("C", Val2Str(C), Val2Str(getmetatable(C)));
--C:f4()
--print(Val2Str(B))
--B:f();
--B:f2();
--B:f3();

--Class----------------------------------------------------
gt_CLASS_NAMESPACE = {
	baseClass = {
		new = function(self)
			return gt_CLASS_NAMESPACE:newClass(self);
		end,
	},
	_classMap = {},
	classCopy = function(self, super, derive)
		for k, v in super do
			if not derive[k] then
				if type(v) == "table" then
					local tablekey = tostring(v);
					if not self._classMap[tablekey] then
						self._classMap[tablekey] = {};
						self:classCopy(v, self._classMap[tablekey]);
					end
					derive[k] = self._classMap[tablekey];
				else
					derive[k] = v;
				end
			end
		end
		return derive;
	end,
	newClass = function(self, ...)
		self._classMap = {};
		local derive, tBase = {}, arg;
		tinsert(tBase, 1, self.baseClass);
		for i = getn(tBase), 1, -1 do
			self:classCopy(tBase[i], derive);
		end
		local class_metatable = {
			["function"] = class;
		}
		setmetatable(derive, class_metatable);
		self._classMap = {};
		return derive;
	end
}

function class(...)
	tinsert(arg, 1, gt_CLASS_NAMESPACE);
	local t = call(gt_CLASS_NAMESPACE.newClass, arg);
	return t;
end
--TEST Class----------------------------------------------------
--print("--TEST Class----------------------------------------------------")
--S = {name="S"}
--S.s = S;
--A = class(S, {name="A"});
--print("A",Val2Str(A))
--b = A:new();
--print("b",Val2Str(b))
--A.a = A;
--B = A {};
--print("B",Val2Str(B))
--A = {}
--B = {}
--A.b = B;
--B.a = A;
--c = class (A, B)
--print("c", Val2Str(c));
--tBase = class {
--	a = 1,
--	f = function(self)
--		print("base", self.a);
--	end,
--}
--print("tBase",Val2Str(tBase));
--tBase:f()
---------
--tBase2 = tBase:new();
--print("tBase2",Val2Str(tBase2));
--tBase2:f()
--
--tDrive = tBase {
--	a = 2,
--}
--print("tDrive",Val2Str(tDrive));
--tDrive:f()
--
--tDrive2 = tDrive {
--	f = function(self)
--		print("tDrive2", self.a);
--	end
--}
--print("tDrive2", Val2Str(tDrive2));
--tDrive2:f()
--
--tBaseB = class {
--	b = 1,
--}
--print("tBaseB",Val2Str(tBaseB));
--
--tDriveB = class(tBase,tBaseB, {c = 1,})
--print("tDriveB",Val2Str(tDriveB));
--tDriveB:f()
--
--A = class { a = 1 }
--B = class { a = 2 }
--ab = class(A, B, {f3 = print});
--print(ab.a);
--
--A = class { a = 1 }
--a = A {};
--print(a.a);
--A.a = 2;
--print(a.a);

--SuperClass----------------------------------------------------
gt_SUPER_CLASS_NAMESPACE = {
	baseClass = {
		new = function(self)
			return gt_SUPER_CLASS_NAMESPACE:newClass(self);
		end,
		super = function(self)
			return self._super;
		end
	},
	_classMap = {},
	index = function (self, key)
		return self._super[key];
	end,
	classCopy = function(self, super, derive)
		for k, v in super do
			if not derive[k] then
				if type(v) == "table" then
					local tablekey = tostring(v);
					if not self._classMap[tablekey] then
						self._classMap[tablekey] = {};
						self:classCopy(v, self._classMap[tablekey]);
						if (getmetatable(v)) then
							setmetatable(self._classMap[tablekey], getmetatable(v));
						end
					end
					derive[k] = self._classMap[tablekey];
				else
					derive[k] = v;
				end
			end
		end
		if getmetatable(super) then
			setmetatable(derive, getmetatable(super));
		end
		return derive;
	end,
	newClass = function (self, ...)
		self._classMap = {};
		local derive = arg[getn(arg)];
		arg[getn(arg)] = nil;
		tinsert(arg, 1, self.baseClass);
		arg.n = nil;
		local supers, super = arg, {};
		for i = getn(supers), 1, -1 do
			self:classCopy(supers[i], super);
		end
		derive._super = super;
		local class_metatable = {
			["function"] = superClass,
			["index"] = self.index,
		}
		setmetatable(derive, class_metatable);
		self._classMap = {};
		return derive;
	end
}

function superClass(...)
	tinsert(arg, 1, gt_SUPER_CLASS_NAMESPACE);
	local t = call(gt_SUPER_CLASS_NAMESPACE.newClass, arg);
	return t;
end

--TEST superClass----------------------------------------------------
--print("--TEST superClass----------------------------------------------------")
--S = {name="S"}
--S.s = S;
--A = superClass(S, {name="A"});
--print("A",Val2Str(A))
--b = A:new();
--print("b",Val2Str(b))
--A.a = A;
--B = A {};
--print("B",Val2Str(B))
--A = {}
--B = {}
--A.b = B;
--B.a = A;
--c = superClass (A, B)
--print("c", Val2Str(c));
--tBase = superClass {
--	a = 1,
--	f = function(self)
--		print("base", self.a);
--	end,
--}
--print("tBase",Val2Str(tBase));
--tBase:f()
---------
--tBase2 = tBase:new();
--print("tBase2",Val2Str(tBase2));
--tBase2:f()
--
--tDrive = tBase {
--	a = 2,
--}
--print("tDrive",Val2Str(tDrive));
--tDrive:f()
--
--tDrive2 = tDrive {
--	f = function(self)
--		print("tDrive2", self.a);
--	end
--}
--print("tDrive2", Val2Str(tDrive2));
--tDrive2:f()
--
--tBaseB = superClass {
--	b = 1,
--}
--print("tBaseB",Val2Str(tBaseB));
--
--tDriveB = superClass(tBase,tBaseB, {c = 1,})
--print("tDriveB",Val2Str(tDriveB));
--tDriveB:f()
--print(tDriveB.a, tDriveB.b, tDriveB.c, tDriveB.f)
--
--A = superClass { a = 1 }
--B = superClass { a = 2 }
--ab = superClass(A, B, {f3 = print});
--print(ab.a);
--
--A = superClass { a = 1 }
--a = A {};
--print(a.a);
--A.a = 2;
--print(a.a);
--
--A = superClass { a = 1, 
--	f = function(self) print("A", self.a) end,
--	f4 = function(self) print("4", self.b) end, 
--};
--B = A { 
--	a = 2,
--	b = 2,
--	f = function(self) print("B", self.b) end, 
--	f2 = function(self) 
--		f() 
--	end,
--	f3 = function(self)
--		print(self:f4());
--		self:super().f(self)
--		self:super():f()
--	end
--};
--C = B { c=3}
--print("C", Val2Str(C));
--C:f4()
--print(Val2Str(B))
--B:f();
--B:f2();
--print("new", B.new)
--print("super", B.super)
--B:f3();

--
