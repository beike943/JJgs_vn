--Include("\\script\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\vip_feedback_system\\yinjuan_api.lua")

function OnUse(nItem)
	local nLeftCapacity = api_daily_limit_get_yinquan_left_capacity()
	if nLeftCapacity >= 3000 then
		if DelItemByIndex(nItem, 1) == 1 then
			api_daily_limit_award_yinquan(3000, 1, 1)
		end
	else
		Talk(1,"",format("H«m nay nhËn Ng©n PhiÕu ®· ®¹t giíi h¹n, kh«ng thÓ sö dông!"))
	end
end