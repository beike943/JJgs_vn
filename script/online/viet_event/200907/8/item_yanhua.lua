--=============================================
--create by baiyun 2009.5.30
--describe:Ô½ÄÏ°æ7ÔÂ·Ý»î¶¯Ö®°ËÑÌ»¨£¬ÑÌ»¨½Å±¾
--=============================================
Include("\\script\\item\\yanhuo.lua");
Include("\\script\\online\\viet_event\\200907\\event_head.lua");

function OnUse(nItemIdx)
	local nDate = tonumber(date("%y%m%d%H"));
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if nDate < 09061900 or nDate >= 09071924 then
		Talk(1, "", "Ho¹t ®éng lÇn nµy ®· kÕt thóc");
		return
	end
	if GetLevel() < 50 then
		Talk(1, "", "§¹i hiÖp vÉn ch­a ®ñ cÊp 50, kh«ng thÓ sö dông ph¸o hoa");
		return
	end
	if nDay == 1 or nDay == 2 or nDay == 3 then
		Talk(1, "", "Thêi gian sö dông ph¸o hoa lµ: thø 5, 6,7, chñ nhËt h»ng tuÇn trong kho¶ng thêi gian tõ 16:00 – 24:00");
		return
	end
	if nHour < 16 then
		Talk(1, "", "Thêi gian sö dông ph¸o hoa lµ: thø 5, 6,7, chñ nhËt h»ng tuÇn trong kho¶ng thêi gian tõ 16:00 – 24:00");
		return
	end
	if GetTask(TASK_LAST_USE_DATE) < tonumber(date("%y%m%d")) then
		SetTask(TASK_TODAY_USE_COUNT, 0);
		SetTask(TASK_USE_YANHUA_TIME, 0);
	end
	if GetTask(TASK_TODAY_USE_COUNT) >= CONST_MAX_USE_COUNT then
		Talk(1, "", "Mçi ngµy chØ ®­îc sö dông "..CONST_MAX_USE_COUNT.." ph¸o hoa");
		return
	end
	
	if tonumber(date("%H%M%S")) - GetTask(TASK_USE_YANHUA_TIME) < CONST_USE_YANHUA_INTERVAL  then
		Talk(1, "", "Gi·n c¸ch hai lÇn sö dông ph¸o hoa lµ 5 phót");
		return
	end
	
	if DelItemByIndex(nItemIdx, 1) ~= 1 then
		return
	end
	
	local nCount = getn(YANHUO_TABLE);
	local nIndex = random(1, nCount);
	local nRetCode = DoFireworks(YANHUO_TABLE[nIndex][2], YANHUO_TABLE[nIndex][3]);
	
	SetItemUseLapse(nItemIdx, CONST_USE_INTERVAL);	--ÀäÈ´Ê±¼ä£º5·ÖÖÓ
	
	SetTask(TASK_TODAY_USE_COUNT, GetTask(TASK_TODAY_USE_COUNT) + 1);
	SetTask(TASK_LAST_USE_DATE, tonumber(date("%y%m%d")));
	SetTask(TASK_USE_YANHUA_TIME, tonumber(date("%H%M%S")));
	gf_SetLogCaption("Hoat dong phao hoa viet nam");
	gf_Modify( "Exp", CONST_USE_GIVE_EXP);
	gf_SetLogCaption("");
	ModifyReputation(8,0)
	Msg2Player("B¹n nhËn ®­îc 8 ®iÓm danh väng.")
end