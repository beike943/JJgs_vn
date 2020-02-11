--=============================================
--create by baiyun 2009.11.18
--describe:Ô½ÄÏ°æ12ÔÂ·Ý»î¶¯ Ïã²Ýµ°¸â½Å±¾ÎÄ¼þ
--=============================================
Include("\\script\\online\\viet_event\\200912\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%Y%m%d"))
	if nDate < 20091218 or nDate > 20100124 then
		Say("VËt phÈm hÕt h¹n sö dông!",0)
		return 0;
	end
	if gf_Judge_Room_Weight(2, 50, " ") == 0 then
		return 0;
	end
	local nHasCount = GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT);
	if nHasCount >= VIET_0912_XIANGCAODANGAO_MAX_COUNT then
		Say("B¹n ®· sö dông vËt phÈm ®¹t sè kinh nghiÖm tèi ®a!",0)
		return 0;
	end    
	if DelItemByIndex(nItemIdx, 1) == 1 then
		SetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT, nHasCount + 1);
		--¸øÎïÆ·½±Àø
		local szFullLogTitle = VIET_0912_STR_EVENT_LOG_TITLE
		if mod(GetTask(VIET_0912_TASK_XIANGCAODANGAO_COUNT),50) == 0 then
			gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD_50, 100, 1, szFullLogTitle, "B¸nh Kem Vani");
		else
			gf_EventGiveRandAward(VIET_0912_XIANGCAODANGAO_AWARD, 100, 7, szFullLogTitle, "B¸nh Kem Vani");
		end
		--¸ø¾­Ñé        
		ModifyExp(150000);		  
	end
end
