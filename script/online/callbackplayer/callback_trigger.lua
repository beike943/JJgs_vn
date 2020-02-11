--召回老玩家称号计时器
--by vivi
--2008/07/08

function OnTimer()
	if IsOfflineLive() == 1 then
		return
	end	
	local nDate = tonumber(date("%Y%m%d"));
	local nBackTask = GetTask(916);
	local nMonthTask = GetTask(565);
	if GetTask(919) >= nDate then   --当天起效60次了
		return
	end	
	local nYears = floor(nBackTask/10000);
	local nMonths = floor(mod(nBackTask,10000)/100);
	local nDays = mod(nBackTask,100);		
	if nBackTask > 0 and nMonthTask == 0 then  --领了老玩家但没开包的，即最原始的
		if GetTime() - MkTime(nYears,nMonths,nDays) > 15*24*3600 then
			RemoveTrigger(GetTrigger(2022));
			return
		else
			give_title_exp();
		end
	elseif nBackTask > 0 and nMonthTask ~= 0 then --领了老玩家且开包了的
		if GetTask(566) ~= 0 then  --先开包后领取老玩家奖励
			if MkTime(nYears,nMonths,nDays) - nMonthTask > 7*24*3600 then --从开包领取的那天算起到领取老玩家，超过7天
				if GetTime() - MkTime(nYears,nMonths,nDays) > 15*24*3600 then
					RemoveTrigger(GetTrigger(2022));
					return
				else
					give_title_exp();
				end		
			else   --还没超过7天 
				if GetTime() - nMonthTask > 22*24*3600 then
					RemoveTrigger(GetTrigger(2022));
					return
				else
					give_title_exp();			
				end
			end
		elseif nMonthTask - MkTime(nYears,nMonths,nDays) > 15*24*3600 then --之前的称号已经过了15天了
			if GetTime() - nMonthTask > 10*24*3600 then
				RemoveTrigger(GetTrigger(2022));
				return
			else
				give_title_exp();
			end
		elseif nMonthTask - MkTime(nYears,nMonths,nDays) < 15*24*3600 then  --之前的称号还没到15天
			if GetTime() - MkTime(nYears,nMonths,nDays) > 25*24*3600 then --从领老玩家那天起25天有效
				RemoveTrigger(GetTrigger(2022));
				return
			else
				give_title_exp();
			end
		end
	elseif nBackTask == 0 and nMonthTask ~= 0 then  --没领老玩家但开包了的
		if GetTime() - nMonthTask > 7*24*3600 then
			RemoveTrigger(GetTrigger(2022));
			return
		else
			give_title_exp();
		end		
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
	local nLv = GetLevel();
	local nGeren, nDetail = GetCurTitle();
	if GetTask(919) >= nDate then
		return
	end	
	if nGeren == 3 and nDetail == 5 then
		local	nExp = ceil(player_uplevel_num[nLv][1]*5/1000)
		if nExp > 845235 then	--免费区不一样
			nExp = 845235
		end
		if floor(GetTask(920)/100) < nDate then
			SetTask(920,nDate*100);
		end 
		SetTask(920,GetTask(920)+1);
		if mod(GetTask(920),100) >= 60 then
			SetTask(919,nDate);
		end
		ModifyExp(nExp);
	elseif nGeren == 3 and nDetail == 6 then
		local	nExp = ceil(player_uplevel_num[nLv][1]*4/1000)
		if nExp > 676188 then	--免费区不一样
			nExp = 676188
		end
		if floor(GetTask(920)/100) < nDate then
			SetTask(920,nDate*100);
		end 
		SetTask(920,GetTask(920)+1);
		if mod(GetTask(920),100) >= 60 then
			SetTask(919,nDate);
		end	
		ModifyExp(nExp);		
	elseif nGeren == 3 and nDetail == 7 then
		local	nExp = ceil(player_uplevel_num[nLv][1]*3/1000)
		if nExp > 507141 then	--免费区不一样
			nExp = 507141
		end
		if floor(GetTask(920)/100) < nDate then
			SetTask(920,nDate*100);
		end 
		SetTask(920,GetTask(920)+1);
		if mod(GetTask(920),100) >= 60 then
			SetTask(919,nDate);
		end	
		ModifyExp(nExp);		
	end
end