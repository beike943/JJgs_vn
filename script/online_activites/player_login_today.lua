Include("\\script\\online_activites\\2010_11\\activity_01\\head.lua"); --new title

function PLT_OnPlayerLogin()
	local lastLoginYear, lastLoginMonth, lastLoginDay, lastLoginHour = GmTime(GetLastLoginTime()+8*60*60);
	local curYear = tonumber(date("%Y"))
	local curMonth = tonumber(date("%m"));
	local curDay = tonumber(date("%d"));
	--WriteLog("lastLoginYear: "..lastLoginYear..", lastLoginMonth: "..lastLoginMonth..", lastLoginDay: "..lastLoginDay..", lastLoginHour: "..lastLoginHour);
	--WriteLog("curYear: "..curYear..", curMonth: "..curMonth..", curDay: "..curDay);
	if lastLoginYear ~= curYear or lastLoginMonth ~= curMonth or lastLoginDay ~= curDay then
		PLT_OnPlayer1stLoginToday();
	end
end

function PLT_OnPlayer1stLoginToday()
	--WriteLog("PLT_OnPlayer1stLoginToday::called");
	NT_OnPlayer1stLoginToday();
end