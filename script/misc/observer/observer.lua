-- observer.lua
-- by windle
-- 观察者, 集中游戏事件, 封装变化

Include("\\script\\misc\\observer\\observer_head.lua")
Include("\\script\\lib\\globalfunctions.lua")

Obsvr_Record = WriteLog

ObserverImpt = {
	--agents = {}
}

ObserverImpt.checkId = Observer.checkId;
ObserverImpt.agents = Observer.agents;
ObserverImpt.getname = Observer.getname;

function ObserverImpt:register(id, name, ...)
--	if self:checkId(id) ~= 1 then
--		WriteLog(format"[ObserverImpt:register] [Error register infomation] [id = %s, name = %s]", tostring(id), tostring(name));
--		return nil;
--	end
	if OBSERVER_DEGUG == 1 then
		Obsvr_Record(format("ObserverImpt:register(%d[%s], %s, %s)", id, self:getname(id), name, Val2Str(arg)))
	end
	
	if not self.agents[id] then
		--self.agents[id] = {}
		local szMsg = format("[ObserverImpt:register] [id=%s, name=%s] Error id", tostring(id), tostring(name))
		Obsvr_Record(szMsg)
		return nil
	end
	agents = self.agents[id];
	if agents[name] then
		local szMsg = format("[ObserverImpt:register] [id=%s, name=%s] name already exist", tostring(id), tostring(name))
		Obsvr_Record(szMsg)
		return nil
	end
	if getn(arg) == 1 then
		agents[name] = arg[1]
	else
		agents[name] = arg
	end
	return 1
end

function ObserverImpt:unregister(id, name)
	self:register(id, name)
end

function ObserverImpt:onEvent(id, data)
--	if self:checkId(id) ~= 1 then
--		WriteLog(format("[ObserverImpt:onEvent] [Error] [id = %d, data = %s]", id, Val2Str(data)));
--		return
--	end
	if OBSERVER_DEGUG == 1 then
		Obsvr_Record(format("ObserverImpt:onEvent(%s, %d[%s], %s)", GetName(), id, self:getname(id), Val2Str(data)))
	end
	
	local agents = self.agents[id];
	if not agents then
		local szMsg = format("[ObserverImpt:onEvent] [Error] [id = %d, data = %s]", id, Val2Str(data))
		Obsvr_Record(szMsg)
		return
	end
	
	for name, func in agents do
		local functype = type(func);
		if functype == "function" then
			func(id, data);
		elseif functype == "string" then
			local sCall = format("%s(%d, %s)", func, tonumber(id), Val2Str(data));
			dostring(sCall)
		elseif functype == "table" then
			local tCall = func;
			SendScript2VM(tCall[1], format("%s(%d, %s)", tCall[2], tonumber(id), Val2Str(data)));
		end
	end
end

function ObserverImpt:show_regs()
	Obsvr_Record(format("reges of Observer:"))
	for id,reg in self.agents do
		Obsvr_Record(format("reges of event %d[%s]:", id, self:getname(id)))
		for name,func in reg do
			Obsvr_Record(format("%s of %d[%s]: %s", name, id, self:getname(id), Val2Str(func)))
		end
	end
end

Include("\\script\\misc\\observer\\observer_functions.lua")
