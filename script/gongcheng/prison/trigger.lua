-- ¼ÆÊ±Æ÷

Include("\\script\\gongcheng\\prison\\prison_head.lua")

function OnTimer()
	local nTrigger = GetRunningTrigger()
	if nTrigger ~= 0 then
		local nStep = GetTriggerParam(nTrigger, 2)
		SetTriggerParam(nTrigger, 2, nStep + 1)
		if nStep + 1 < CITYWAR_MAX_STEP then
			Msg2Player("Thêi gian qua ["..(nStep + 1).."/"..CITYWAR_MAX_STEP.."]")
		else
			if mod(nStep, 10) == 0 then
				Msg2Player("B¹n ®· cã thÓ rêi lao!")
			end
		end
	end
end

function Leave_Map()
	print("Citywar Prison Leave_Map")
	RemoveTrigger(GetTrigger(CITYWAR_LEAVE_PRISON))
	StallEnable(1)		-- ÄÜ°ÚÌ¯
	ForbidRead(0)		--ÄÜÐÞÊé
	UseScrollEnable(1)	--ÔÊÐíÊ¹ÓÃ»Ø³Ç
end

function Enter_Map()
	print("Citywar Prison Enter_Map")
	RemoveTrigger(GetTrigger(CITYWAR_ENTER_PRISON))
	StallEnable(0)	-- ²»ÄÜ°ÚÌ¯
	ForbidRead(1)	--²»ÄÜÐÞÊé
	UseScrollEnable(0)	--½ûÖ¹Ê¹ÓÃ»Ø³Ç
end