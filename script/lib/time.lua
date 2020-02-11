--输入两个字符串，如20060101,20060901，得到这两天相差了多少天，后者减前者
--考虑到润年的处理，这里不处理特殊润年。因此有些年份会有误差，敬请留意
--润年：年份能被400整除,或者能被4整除而不能被100整除的就是润年
function Get_Day_Diff(sTimeOld,sTimeNew)
	sTimeOld = tostring(sTimeOld);
	sTimeNew = tostring(sTimeNew);
	if strlen(sTimeOld) ~= 8 or strlen(sTimeNew) ~= 8 then
		return nil;
	end;
	local nYearOld,nYearNew,nMonthOld,nMonthNew,nDayOld,nDayNew = 0,0,0,0,0,0;
	nYearOld = tonumber(strsub(sTimeOld,1,4));
	nMonthOld = tonumber(strsub(sTimeOld,5,6));
	nDayOld = tonumber(strsub(sTimeOld,7,8));
	nYearNew = tonumber(strsub(sTimeNew,1,4));
	nMonthNew = tonumber(strsub(sTimeNew,5,6));
	nDayNew = tonumber(strsub(sTimeNew,7,8));
	if type(nYearOld) ~= "number" or type(nMonthOld) ~= "number" or type(nDayOld) ~= "number" or type(nYearNew) ~= "number" or type(nMonthNew) ~= "number" or type(nDayNew) ~= "number" then
		return nil;
	end;
	if nYearOld < 1 or nYearNew < 1 or nMonthOld > 12 or nMonthOld < 1 or nMonthNew > 12 or nMonthNew < 1 or nDayOld > 31 or nDayOld < 1 or nDayNew > 31 or nDayOld < 1 then
		return nil;
	end;
	local nDayCountOld,nDayCountNew,nDayCount = 0,0,0;
	local nYearLeft,nDayNum = 0,0;
	nDayCountOld = floor(nYearOld/4)*(365*3+366);
	nYearLeft = mod(nYearOld,4);
	nDayNum = Get_Day_Num(sTimeOld);
	if nDayNum == nil then
		return nil;
	end;
	nDayCountOld = nDayCountOld+365*nYearLeft+nDayNum;	
	
	nDayCountNew = floor(nYearNew/4)*(365*3+366);
	nYearLeft = mod(nYearNew,4);
	nDayNum = Get_Day_Num(sTimeNew);
	if nDayNum == nil then
		return nil;
	end;
	nDayCountNew = nDayCountNew+365*nYearLeft+nDayNum;
	
	nDayCount = nDayCountNew - nDayCountOld;
	return nDayCount;
end;
--输入一个日期字符串如20060901，得到这一天在这一年中处于第几天
function Get_Day_Num(sTime)
	sTime = tostring(sTime);
	if strlen(sTime) ~= 8 then
		return nil;
	end; 
	local nYear,nMonth,nDay = 0,0,0;
	local tMonthDay = {31,28,31,30,31,30,31,31,30,31,30,31};
	local tMonthDayYun = {31,29,31,30,31,30,31,31,30,31,30,31};
	nYear = tonumber(strsub(sTime,1,4));
	nMonth = tonumber(strsub(sTime,5,6));
	nDay = tonumber(strsub(sTime,7,8));
	if type(nYear) ~= "number" or type(nMonth) ~= "number" or type(nDay) ~= "number" then
		return nil;
	end;
	if nYear < 1 or nMonth > 12 or nMonth < 1 or nDay > 31 or nDay < 1 then
		return nil;
	end;
	local nDayNum = 0;
	local tMonth = {};
	if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
		tMonth = tMonthDayYun;
	else	
		tMonth = tMonthDay;
	end;
	if nDay > tMonth[nMonth] then
		return nil;
	else
		for i=1,nMonth-1 do
			nDayNum = nDayNum + tMonth[i];
		end;
		nDayNum = nDayNum + nDay;
	end;
	return nDayNum;
end;

--把时间值（单位秒）转为文字描述的格式，如１２１秒转为"2分钟1秒"
--输入参数１是时间值，单位为秒，参数２为输出格式，如果包含字母d则表示优先显示天，
--包含字母h表示优先显示小时，ms类似。如果第２个参数不填，则默认为"dhms"
function Get_Time_String(nSecond,sFormat)
	nSecond = floor(nSecond);	--保证是整数
	if nSecond <= 0 then
		return "0 gi﹜ ";	--小于等于0的都返回0秒
	end;
	if sFormat == nil then
		sFormat = "dhms";
	end;
	local nDay = 0;
	local nHour = 0;
	local nMin = 0;
	local nSec = 0;
	local sTime = "";
	local nDayTag,nHourTag,nMinTag,nSceTag = 1,1,1,1;
	if strfind(sFormat,"d") == nil then
		nDayTag = 0;
	end;
	if strfind(sFormat,"h") == nil then
		nHourTag = 0;
	end;
	if strfind(sFormat,"m") == nil then
		nMinTag = 0;
	end;
	if strfind(sFormat,"s") == nil then
		nSecTag = 0;
	end;
	nDay = floor(nSecond/(60*60*24));
	if nDay > 0 then
		if nDayTag == 0 then
			nHour = 24*nDay;
		else
			sTime = sTime..nDay.."Thi猲";
		end;
	end;
	nHour = floor(mod(nSecond/(60*60),24)) + nHour;
	if nHour > 0 then
		if nHourTag == 0 then
			nMin = 60*nHour;
		else
			sTime = sTime..nHour.."h ";
		end;
	end;
	nMin = floor(mod(nSecond/60,60)) + nMin;
	if nMin > 0 then
		if nMinTag == 0 then
			nSec = 60*nMin;
		else
			sTime = sTime..nMin.." ph髏 ";
		end;
	end;
	nSec = mod(nSecond,60) + nSec;
	if nSec > 0 then
		if nSecTag ~= 0 then
			sTime = sTime..nSec.." Gi﹜ ";
		end;
	end;
	return sTime;
end;
--Get_Day_Num的新接口
function tf_GetDayDiff(sTimeOld,sTimeNew)
	return Get_Day_Diff(sTimeOld,sTimeNew);
end;
--Get_Day_Num的新接口
function tf_GetDayNum(sTime)
	return Get_Day_Num(sTime);
end;
--Get_Time_String的新接口
function tf_GetTimeString(nSecond,sFormat)
	return Get_Time_String(nSecond,sFormat);
end;

--输入一个字符串和天数返回天数后的字符串，如20081113，10，返回10天后的日期：20081123
--润年：年份能被400整除,或者能被4整除而不能被100整除的就是润年
--同tf_GetOneDay，此函数作废
function tf_GetResultDate(sTime,nNum)
	local tMonthDays = {
		[1] = {31,29,31,30,31,30,31,31,30,31,30,31}, 
		[2] = {31,28,31,30,31,30,31,31,30,31,30,31},
	};
	sTime = tostring(sTime);
	if strlen(sTime) ~= 8 then
		return nil;
	end;
	local nYear,nMonth,nDay = 0,0,0,0,0,0;
	nYear = tonumber(strsub(sTime,1,4));
	nMonth = tonumber(strsub(sTime,5,6));
	nDay = tonumber(strsub(sTime,7,8));

	if type(nYear) ~= "number" or type(nMonth) ~= "number" or type(nDay) ~= "number" then
		return nil;
	end;
	if nYear < 1 or nMonth > 12 or nMonth < 1 or nDay > 31 or nDay < 1 then
		return nil;
	end;	
	
	local nReturnTime = 0;
	local nIsRun = 0; --是否是闰年 1为是，2为否;
	if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
		nIsRun = 1;
	else	
		nIsRun = 2;
	end;	
	if nNum >= 0 then
		nDay = nDay + nNum;
		if nDay > tMonthDays[nIsRun][nMonth] then		
			repeat
				nMonth = nMonth+1;
				nDay = nDay - tMonthDays[nIsRun][nMonth-1];
				if nMonth > 12 then
					nYear = nYear + 1;
					if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
						nIsRun = 1;
					else	
						nIsRun = 2;
					end;					
					nMonth = 1;
				end
			until nDay <= tMonthDays[nIsRun][nMonth]
		end
	else
		nDay = nDay + nNum;
		if nDay < 0 then
			repeat	
				nMonth = nMonth-1;
				if nMonth < 1 then
					nYear = nYear - 1;
					if mod(nYear,400) == 0 or (mod(nYear,4) == 0 and mod(nYear,100) ~= 0) then
						nIsRun = 1;
					else	
						nIsRun = 2;
					end;	
					nMonth = 12;
				end	
				nDay = tMonthDays[nIsRun][nMonth] + nDay;					 
			until nDay > 0;	
		end
	end
	if nMonth < 10 then
		nMonth = tostring(0)..tostring(nMonth);
	end
	if nDay < 10 then
		nDay = tostring(0)..tostring(nDay);
	end
	nReturnTime = tonumber(tostring(nYear)..tostring(nMonth)..tostring(nDay));	
	return nReturnTime;
end

--计算当地时间与格林威治标准时间的时差，中国是+8时差
function tf_GetTimeZoneInfo()
	local nCurTime = GetTime();
	local nTimeZoneDiff = floor((nCurTime - MkTime(GmTime(nCurTime)))/3600);
	return nTimeZoneDiff;
end;

--计算某个时间点的周序列
--nWeekDay:以哪天作为一周的开始（1－7）
--nHour:以哪个小时作为一天的开始
--nCurTime:时间点
function tf_GetWeekSequence(nWeekDay,nHour,nCurTime)
	nWeekDay = nWeekDay or 1;
	nHour = nHour or 0;
	nCurTime = nCurTime or GetTime();
	local nTimeZoneDiff = tf_GetTimeZoneInfo();
	nCurTime = nCurTime + nTimeZoneDiff*3600;		--处理时差
	nCurTime = nCurTime - 4*24*3600;	--对齐到1970年1月1日（星期四）后的第一个周一凌晨。
	local nWeekSecond = 7*24*3600;	--一周多少秒
	local nOffset = ((nWeekDay-1)*24+nHour)*3600;	--计算偏移时间
	local nTotalTime = nCurTime - nOffset;	--计算后的总时间
	local nWeekSeq = floor(nTotalTime/nWeekSecond);	--计算周的序数
	return nWeekSeq;
end;
--获得某天的日期
--nInitDate表示初始日期，默认为当前日期
--nIntervalDay表示与nInitDate与天数差，可以为负数
--如tf_GetOneDay(3,20080929)	获得2008年9月29日后第3天的日期,即20081002
function tf_GetOneDay(nIntervalDay,nInitDate)
	nInitDate = nInitDate or tf_GetToday();
	local nYear,nMonth,nDay = 0,0,0;
	nYear = floor(nInitDate/10000);
	nMonth = mod(floor(nInitDate/100),100);
	nDay = mod(nInitDate,100);
	local nTime = MkTime(nYear,nMonth,nDay) + tf_GetTimeZoneInfo() * 3600;	--要加上时差才可以正确用GmTime还原这个日期
	nTime = nTime + nIntervalDay*3600*24;
	nYear,nMonth,nDay = GmTime(nTime);
	return nYear,nMonth,nDay;
end;
--获得今天的日期，8位数格式
--用tf_Date就可以直接实现此函数功能了，不过还是保留这个函数
function tf_GetToday()
	return tonumber(tf_Date());
end;
--类似于Lua自带的date函数
--szFormat是格式化字符串，除了不用带%号，其余和date的使用方法差不多
--如果没有输入参数表示返回当前日期，格式为年月日（yyyymmdd）
function tf_Date(szFormat)
	local nYear,nMonth,nDay,nHour,nMin,nSec = GmTime(GetTime()+tf_GetTimeZoneInfo()*3600);
	local szDate = "";
	local format_time = function(nData,nLen)
		nLen = nLen or 2;
		local szRet = nData;
		local nDataLen = strlen(nData);
		if nDataLen > nLen then
			szRet = strsub(nData,nDataLen-nLen+1,nDataLen);
		else
			for i=1,nLen-nDataLen do
				szRet = "0"..szRet
			end;
		end;
		return szRet;
	end;
	if not szFormat then
		return nYear..format_time(nMonth)..format_time(nDay);
	end;
	local szChar = "";
	for i=1,strlen(szFormat) do
		szChar = strsub(szFormat,i,i);
		if szChar == "Y" then
			szDate = szDate..nYear;
		elseif szChar == "y" then	--年
			szDate = szDate..format_time(nYear);
		elseif szChar == "m" then	--月
			szDate = szDate..format_time(nMonth);
		elseif szChar == "d" then	--日
			szDate = szDate..format_time(nDay);
		elseif szChar == "H" then	--小时
			szDate = szDate..format_time(nHour);
		elseif szChar == "M" then	--分钟
			szDate = szDate..format_time(nMin);
		elseif szChar == "S" then	--秒
			szDate = szDate..format_time(nSec);
		elseif szChar == "w" then	--今天是星期几
			szDate = szDate..format_time(mod(floor((GetTime()+tf_GetTimeZoneInfo()*3600)/(24*3600))+4,7));
		elseif szChar == "W" or szChar == "U" then	--这周是今年的第几周
			szDate = szDate..format_time(tf_GetWeekSequence(1,0)-tf_GetWeekSequence(1,0,MkTime(nYear,1,1)));
		elseif szChar == "j" then	--今天是今年的第几天
			szDate = szDate..format_time(floor((GetTime()-MkTime(nYear,1,1))/(24*3600))+1,3);
		elseif szChar == "a" then	--今天是星期几（英文缩写，如Fri表示星期五）
		elseif szChar == "b" then	--几月份（英文缩写，如Nov表示11月份）
		elseif szChar == "c" then	--显示时间，如11/07/08 16:06:38
		elseif szChar == "p" then	--AM或PM，表示上下午
			if nHour >= 12 then
				szDate = szDate.."PM";
			else
				szDate = szDate.."AM";
			end;
		elseif szChar == "x" then	--日期，如11/07/08
		elseif szChar == "A" then	--今天是星期几（如Friday表示星期五）
		elseif szChar == "B" then	--几月份（如November表示11月份）
		elseif szChar == "I" then	--配合AM和PM来显示几点钟，如11表示可能是上午11点或晚上11点，配合AM和PM来看
			szDate = szDate..format_time(mod(i+11,12)+1);
		end;
	end;
	return szDate;
end
