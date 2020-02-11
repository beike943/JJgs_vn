--称号：祝贺金山二十周年
--by vivi
--2008/11/13

Include("\\script\\online\\qixi08\\head.lua");
Include("\\script\\lib\\time.lua");

function OnTimer()
	if IsOfflineLive() == 1 then
		return
	end	
	local nDate = tonumber(date("%Y%m%d"));
	local nBeginDate = GetTask(TSK_YEARS_BEGIN_DATE);
	local nEndDate = GetTask(TSK_YEARS_END_DATE);
	local nExpDate = GetTask(TSK_YEARS_EXP_DATE);
	local nExpNum = GetTask(TSK_YEARS_EXP_NUM);
	if nDate < nBeginDate then 
		return 0;
	end
	if nDate > nEndDate then   --结束了
		RemoveTrigger(GetTrigger(2023));
		return 0;	
	else
		if nExpDate < nDate then   --清0处理
			SetTask(TSK_YEARS_EXP_DATE,nDate);
			SetTask(TSK_YEARS_EXP_NUM,0);
		end
		if GetTask(TSK_YEARS_EXP_NUM) >= g_nYearsExpNums then  --当天起效60次了
			return 0;
		end		
		give_title_exp();
	end
end

function give_title_exp()
	local player_uplevel_num = {
	{10,3},{20,3},{40,3},{80,3},{140,3},
	{245,3},{429,3},{643,3},{965,4},{1302,4},
	{1758,4},{2373,4},{3086,4},{3857,4},{4725,4},
	{5670,4},{6662,4},{7661,4},{8695,5},{9782,5},
	{11005,5},{12381,5},{13928,5},{15669,5},{17628,5},
	{19832,5},{22311,5},{25099,5},{28237,6},{32049,6},
	{36375,6},{41286,6},{46860,6},{53186,6},{60366,6},
	{68515,6},{77765,6},{88263,6},{100178,7},{117710,7},
	{138309,7},{162513,7},{190953,7},{224369,7},{263634,7},
	{309770,7},{363980,7},{427676,7},{502519,8},{585435,8},
	{682032,8},{794567,8},{925671,8},{1078406,8},{1256343,8},
	{1463640,8},{1705140,8},{1986489,8},{2314259,9},{2672969,9},
	{3087280,9},{3565808,9},{4118508,9},{4756877,9},{5494193,9},
	{6345793,9},{7329390,9},{8465446,9},{9777590,10},{12710867,10},
	{16524127,10},{21481365,10},{27925775,10},{37699796,10},{50894725,10},
	{68707878,10},{92755636,10},{125220108,10},{169047146,11},{196094689,11},
	{227469839,11},{263865014,11},{306083416,11},{355056762,11},{411865844,11},
	{477764379,11},{554206680,11},{642879749,11},{745740509,12},{857601585,12},
	{986241823,12},{1134178096,12},{1304304811,12},{1499950532,12},{1724943112,12},
	{1950000000,12},{1950000000,12},{1950000000,12},{1950000000,12}
	}	
	local nDate = tonumber(date("%Y%m%d"));
	local nExpDate = GetTask(TSK_YEARS_EXP_DATE);
	local nExpNum = GetTask(TSK_YEARS_EXP_NUM);	
	local nLv = GetLevel();
	local nGeren, nDetail = GetCurTitle();
	if nExpNum >= g_nYearsExpNums then   --当天起效60次了
		return 0;
	end	
	if nGeren == 3 and nDetail == 8 then
		local	nExp = ceil(player_uplevel_num[nLv][1]*5/1000)
		if nExp > tYearsExp[IB_VERSION][1] then	
			nExp = tYearsExp[IB_VERSION][1]
		end 
		SetTask(TSK_YEARS_EXP_NUM,GetTask(TSK_YEARS_EXP_NUM)+1);
		ModifyExp(nExp);	
	end
end
