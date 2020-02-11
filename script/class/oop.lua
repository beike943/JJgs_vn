#比较简单的面向对象

--author:libla
--data:2010-9-29

--用法：生成基类
--a = class()
--派生类(支持多重派生)：
--c = class(a, b, ...)
--创建对象
--b = a.new()
--不要直接把class创建出来的表当做对象使用


function class(...)
	local base_type = {}
	if getn(arg) > 0 then
		base_type.__super = arg
	end
	if not type_tag then
		type_tag = newtag()
		settagmethod(type_tag, "index",
		function(table, index)
			if not table.__super or type(table.__super) ~= "table" then
				return
			end
			for _,super in table.__super do
				if super[index] then
					table[index] = super[index]
					return super[index]
				end
			end
		end)
	end
	settag(base_type, type_tag)
	base_type.new = function()
		local base_type = %base_type
		local obj = {}
		local t = newtag()
		settagmethod(t, "index",
		function(table, index)
			return %base_type[index]
		end)
		settag(obj, t)
		return obj
	end
	return base_type
end