Include("\\script\\item\\standin_doll.lua");
Include("\\script\\global\\mate_head.lua");

-- ÅäÅ¼ÉÏÏßÊÂ¼þ
function OnMateOnline()
	if (IsDollActive() == 1) then
		FinishDoll()
	end
	SetTask(TASK_INCLOVE_TIME, 0)
end

-- ÅäÅ¼ÏÂÏßÊÂ¼þ
function OnMateOffline()
	SetTask(TASK_INCLOVE_TIME, 0)
end

-- Àë»éÊÂ¼þ
function OnDivorce()
	-- DEBUG
	print("OnDivorce")
	if (IsDollActive() == 1) then
		FinishDoll()
	end
	SetTask(TASK_INCLOVE_TIME, 0)
end

function UpdateLove(interval)	--Ò»·ÖÖÓµ÷ÓÃÒ»´Î
	-- Èç¹ûÅäÅ¼ÔÚÏß»òÕßÔÚÊ¹ÓÃÌæÉíÍÞÍÞ£¬Ôò¶¨Ê±Ôö¼ÓÍ¬ÐÄÖµ
	if (GetMateOnlineStatus() == 1 or
		IsDollActive() == 1) then
		local time = GetTask(TASK_INCLOVE_TIME)
		local same_heart_value_max = GetTask(2023)
		time = time + interval
		if (time >= INTERVAL_INCLOVE) then
			local love = GetTask(TASK_LOVEGRADE) + VALUE_INCCLOVE
			if (love > MAX_LOVEGRADE) then
				SetTask(TASK_INCLOVE_TIME, 0)
				return
			end
			-- DEBUG
			print(format("T¨ng [%s] trÞ ®ång t©m: %d", GetName(), love))
			SetTask(TASK_LOVEGRADE, love)
			SetTask(TASK_INCLOVE_TIME, 0)
		else
			SetTask(TASK_INCLOVE_TIME, time)
		end
	end
end
