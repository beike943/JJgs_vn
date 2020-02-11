Include("\\script\\lib\\globalfunctions.lua")
--------------------------------------------------------------------
g_tMA_Callback = {}

--------------------------------------------------------------------
-- 脚本接口
function MA_RegisterCallback(name, file, cbfunc)
	g_tMA_Callback[name] = {file, cbfunc};
--	SendScript2VM("\\settings\\static_script\\misc\\missionaward.lua",format("MA_RegisterCallback('%s',%s)",name,Val2Str(tInfo)))
end

--------------------------------------------------------------------
-- 回调接口
function MA_OnOpen(nId)
	local tInfo = g_tMA_Callback[GetName()];
	if not tInfo then return end
	
	SendScript2VM(tInfo[1], format("MA_CallBack('%s',%d)",tInfo[2],nId));	
end

--function MA_SetOpened(nId)
--	tInfo.opened[nId] = 1;
--end

--------------------------------------------------------------------
-- test
