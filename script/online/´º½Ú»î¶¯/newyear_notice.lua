--filename:newyear_notice.lua
--create date:2006-01-04
--author:yanjun
--describe:´º½Ú»î¶¯¹«¸æ½Å±¾
Include("\\script\\online\\´º½Ú»î¶¯\\newyear_head.lua")	

function main()
	local nDate = tonumber(date("%y%m%d"))
	local nHour = GetLocalTime();
	if (Check_Date() == 0) and NEWYEAR_SWITCH == 1 then
		if nHour == 9 or nHour == 15 or nHour == 19 or nHour == 22 then
			AddLocalNews("Ng­êi ch¬i chó ı, cßn 30 phót n÷a Phóc ThÇn sÏ ph¸t tÆng 50 hång bao ë Thµnh §«, BiÖn Kinh, TuyÒn Ch©u.")
			Msg2SubWorld("Ng­êi ch¬i chó ı, cßn 30 phót n÷a Phóc ThÇn sÏ ph¸t tÆng 50 hång bao ë Thµnh §«, BiÖn Kinh, TuyÒn Ch©u.")
		elseif nHour == 13 or nHour == 18 or nHour == 21 then
			AddLocalNews("Ng­êi ch¬i chó ı, cßn 30 phót n÷a, Niªn Thó sÏ xuÊt hiÖn!")
			Msg2SubWorld("Ng­êi ch¬i chó ı, cßn 30 phót n÷a, Niªn Thó sÏ xuÊt hiÖn!")
		end		
	end
end
