--filename:snowwar_notice.lua
--create date:2006-01-18
--author:yanjun
--describe:´òÑ©ÕÌ»î¶¯¹«¸æ½Å±¾
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

function main()
	local nDay = GetCurDate()
	local nMonth = GetCurMonth()
	local nHour = GetLocalTime()
	if ((nMonth == 1 and nDay >= 20) or (nMonth == 2 and nDay <= 5)) and NEWYEAR_SWITCH == 1 then
		AddLocalNews("Chó ý: cßn 30 phót n÷a ë 5 khu vùc nÐm tuyÕt sÏ ph¸t tÆng 100 phÇn quµ n¨m míi!")
		Msg2SubWorld("Chó ý: cßn 30 phót n÷a ë 5 khu vùc nÐm tuyÕt sÏ ph¸t tÆng 100 phÇn quµ n¨m míi!")
	end
end		
