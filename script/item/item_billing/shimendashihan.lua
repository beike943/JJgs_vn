------------------------------------------------------------
-- Ê¦ÃÅ´óÊÂº¯µÄ½Å±¾ shimendashihan.lua
--
-- comment: Ê¹ÓÃºóÖ±½Óµ½´ï73¼¶
-- creator: Tony(Jizheng)
-- Date   : Jan 17th, 2007
--
-- Item ID:  2,1,1021
------------------------------------------------------------

FACTION_EVENT_ID = 345		-- Ê¦ÃÅÈÎÎñ´óÊÂ¼şµÄÈÎÎñID´æ·ÅµÄÈÎÎñ±äÁ¿
shimendashihan_data = 87	-- ÉÏ´ÎÁìÈ¡Ê¦ÃÅ´óÊÂº¯µÄÈÕÆÚ

-- ½Å±¾±»³ÌĞòÄ¬ÈÏµ÷ÓÃµÄÈë¿Úº¯Êı
function OnUse()
	Say("B¹n muèn dïng <color=yellow>s­ m«n ®¹i sù hµm<color>? Cã thÓ nhËn mét nhiÖm vô ®¹i sù kiÖn.",
		2,
		"§­îc/use_shimendashihan",
		"Kh«ng sö dông/cancel_dialog")
end;

-- ÍË³ö¶Ô»°£¬²»×öÈÎºÎ²Ù×÷
function cancel_dialog()
end;

function use_shimendashihan()
	local nCurLevel = GetLevel()
	if (nCurLevel < 50) then
		Say("B¹n ch­a ®¹t ®Õn cÊp <color=yellow>50<color>, kh«ng thÓ sö dông s­ m«n ®¹i sù hµm!", 0)
		return
	end
	local nPlayerRoute = GetPlayerRoute()
	if (nPlayerRoute == 0 or nPlayerRoute == 1 or nPlayerRoute == 5 or nPlayerRoute == 7 or
		nPlayerRoute == 10 or nPlayerRoute == 13 or nPlayerRoute == 16 or nPlayerRoute == 19) then
		Say("B»ng h÷u ch­a b¸i s­ kh«ng thÓ sö dông s­ m«n ®¹i sù hµm!", 0)
		return
	end
	
	--		          Äê	       ÔÂ	       ÈÕ
	local nCurrTime = {date("%Y"), date("%m"), date("%d")}
	local nCurDate = tonumber( nCurrTime[1]..nCurrTime[2]..nCurrTime[3])	-- ÏÖÔÚµÄÈÕÆÚ
	local nLastDate = GetTask(shimendashihan_data)
	if (nCurDate - nLastDate < 2) then
		Say("HiÖn s­ m«n ch­a cã nhiÖm vô, khi kh¸c h·y quay l¹i!", 0)
		return
	end
	
	local bHaveGotATask = GetTask(FACTION_EVENT_ID)
	if (bHaveGotATask ~= 0) then
		Say("B¹n ch­a hoµn thµnh nhiÖm vô tr­íc, cè g¾ng lªn!", 0)
		return
	end
	
	if (DelItem(2, 1, 1021, 1) == 1) then
		local nTaskID = StartFactionEvent()
		if (nTaskID ~= 0) then
			local nSel = random(1, 4)
			local strTaskInfo = QueryFactionEventInfo(nSel)
			Say(strTaskInfo, 0);
			Msg2Player("B¹n nhËn ®­îc mét nhiÖm vô s­ m«n ®¹i sù!")
			SetTask(shimendashihan_data, nCurDate)
			SetTask(FACTION_EVENT_ID, nTaskID)
		end
	end
end;

