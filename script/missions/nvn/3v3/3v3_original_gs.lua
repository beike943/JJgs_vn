Include("\\script\\system_switch_config.lua")
Include("\\script\\missions\\nvn\\3v3\\head.lua")

-- from systemtimetask
--10:04这个时间点执行
function main()
	if Is3v3SystemOpen() ~= 1 then
		return 0;
	end
	local nVersion,nCurGs = GetRealmType();
	if nCurGs == 0 then
		DebugOutput("original-server 3v3 across season!!!");
		_3v3_System_Task();
	end
end