Include("\\script\\lib\\tag.lua")
Include("\\script\\lib\\bitlib.lua")

_DAY_SEC			= (24 * 60 * 60)       --/* secs in a day */


Date = {
	year = 0,
	month = 0,
	day = 0,
	["tonumber"] = function(self)
		return self.year * 10000 + self.month * 100 + self.day;
	end,
	gettime = function(self)
		return MkTime(self.year, self.month, self.day) + 8 * 3600;
	end,
	week = function(self)
		return mod((self - Date(2010,1,3)), 7);
	end
}

mt_Date = {
	add = function (self,day)
		local time = self:gettime();
		time = time + day * _DAY_SEC;
		local tm = totable(GmTime(time));
		return Date(tm[1], tm[2], tm[3]);
	end,
	sub = function (self,day)
		if type(day) == "number" then
			return self + -day;
		end
		return (self:gettime() - day:gettime()) / _DAY_SEC;
	end,
	lt = function (op1, op2)
		return op1:gettime() < op2:gettime();
	end,
	["function"] = function(self, y, m, d)
		y = y or tonumber(date("%Y"));
		m = m or tonumber(date("%m"));
		d = d or tonumber(date("%d"));
		local tDate = {
			year = y,
			month = m,
			day = d,
		}
		tDate = gf_CopyInherit(Date, tDate);
		setmetatable(tDate, mt_Date);
		return tDate;
	end,
}
setmetatable(Date, mt_Date);

function Time2Date(time)
	local tm = totable(GmTime(time));
	return Date(tm[1], tm[2], tm[3]);
end
function nDate2Date(nDate)
	if not nDate then return nil end
	local y = getSubBit(nDate, 5,8, 10);
	local m = getSubBit(nDate, 3,4, 10);
	local d = getSubBit(nDate, 1,2, 10);
	return Date(y,m,d)
end

-- test
--print(GmTime(GetTime()))
--print(Date():tonumber()); 
--d = Date() - Date(2012,01,01)
--print(d) 
--d = Date() - 2;
--print(d:tonumber()) 
--d = (Date() - 365) < Date(2012,01,01)
--print(d) 
--print(Date():week())
