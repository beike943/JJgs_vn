Include("\\script\\online\\Ê¥µ®½Ú»î¶¯\\christmas_head.lua")
function main()
	iMonth = GetCurMonth()
	iDay = GetCurDate()
	if iMonth == 12 and (iDay >=23 and iDay <=28) and CHRISTMAS_SWITCH == 1 then
		local nHour = GetLocalTime()
		if nHour == 20 then
			AddLocalNews("21h tèi nay, ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u sÏ treo 300 phÇn quµ trªn nh÷ng c©y th«ng Gi¸ng Sinh, ng­êi ch¬i h·y mau ®Õn lÊy.")
			Msg2SubWorld("21h tèi nay, ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u sÏ treo 300 phÇn quµ trªn nh÷ng c©y th«ng Gi¸ng Sinh, ng­êi ch¬i h·y mau ®Õn lÊy.")
		elseif nHour == 22 then
			AddLocalNews("23h tèi nay, ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u sÏ treo 300 phÇn quµ trªn nh÷ng c©y th«ng Gi¸ng Sinh, ng­êi ch¬i h·y mau ®Õn lÊy.")
			Msg2SubWorld("23h tèi nay, ë Nam BiÖn Kinh, Nam Thµnh §«, B¾c TuyÒn Ch©u sÏ treo 300 phÇn quµ trªn nh÷ng c©y th«ng Gi¸ng Sinh, ng­êi ch¬i h·y mau ®Õn lÊy.")
		end
	end
end