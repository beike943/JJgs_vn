Include("\\script\\online_activites\\2011_02\\plant\\strings.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\online\\zgc_public_fun.lua");

VET_201102_PLANT_ACTIVITY_ID = 30;
VET_201102_PLANT_NORMAL_TIMER_USER_ID = 2518;
VET_201102_PLANT_NORMAL_TIMER_TEMPLATE_ID = 1508; --10s
VET_201102_PLANT_SP_TIMER_USER_ID = 2519;
VET_201102_PLANT_SP_TIMER_TEMPLATE_ID = 1509; --5s
VET_201102_PLANT_BUY_COST = 200000;
VET_201102_PLANT_MAX_DAILY_COUNT = 4;
VET_201102_PLANT_LIFETIME = 5*60;
VET_201102_PLANT_TEAMSIZE_MIN = 2;
VET_201102_PLANT_LEVEL_MIN = 77;

--TaskGroup
VET_201102_PLANT_TaskGroup = TaskManager:Create(2, 1);
VET_201102_PLANT_TaskGroup.TSK_DAILY_COUNT = 1;
VET_201102_PLANT_TaskGroup.TSK_ACTIVE_END_TIME = 2;
VET_201102_PLANT_TaskGroup.TSK_ACTIVE_NPC_IDX = 3;
VET_201102_PLANT_TaskGroup.TSK_TRIGGER_ID = 4;
VET_201102_PLANT_TaskGroup.TSK_TRIGGER_CRT_TIME = 5

function VET_201102_Plant_JingNangDaShiJianDialog(tbSayDialog, szSayHead)
	if gf_CheckEventDateEx(VET_201102_PLANT_ACTIVITY_ID) == 1 then
		tinsert(tbSayDialog, format("%s/%s", format(VET_TB_201102_PLANT_DLG[1],VET_TB_201102_PLANT_NPC_NAME[1]),"VET_201102_Plant_ActiveCheck"));
		tinsert(tbSayDialog, format("%s/%s", format(VET_TB_201102_PLANT_DLG[2],VET_TB_201102_PLANT_ITEM_TITLE[1], 1,VET_TB_201102_PLANT_ITEM_TITLE[1],20,VET_TB_201102_PLANT_ITEM_TITLE[2]),"VET_201102_Plant_BuyItem"));
	end
	return tbSayDialog, szSayHead;
end

function VET_201102_Plant_ActiveCheck()
	local nTeamSize = GetTeamSize()
	if nTeamSize < VET_201102_PLANT_TEAMSIZE_MIN then
		Talk(1, "", format(VET_TB_201102_PLANT_DLG[3],VET_201102_PLANT_TEAMSIZE_MIN,VET_TB_201102_PLANT_NPC_NAME[1]))
		return
	end
	if GetCaptainName() ~= GetName() then
		Talk(1, "", format(VET_TB_201102_PLANT_DLG[4],VET_TB_201102_PLANT_NPC_NAME[1]))
		return
	end
	if VET_201102_Plant_CheckTeamMember(nTeamSize) == 0 then
		return
	end
	VET_201102_Plant_ActiveConfirm(nTeamSize)
end

function VET_201102_Plant_BuyItem()
	if GetCash() < VET_201102_PLANT_BUY_COST then
		Talk(1, "", VET_TB_201102_PLANT_DLG[10])
		return
	end
	if gf_Judge_Room_Weight(1,0," ") ~= 1 then
		return
	end
	if Pay(VET_201102_PLANT_BUY_COST) == 1 then
		gf_AddItemEx2({2,1,30289,1}, VET_TB_201102_PLANT_ITEM_TITLE[1],VET_STR_201102_PLANT_LOG_TITLE,format(VET_TB_201102_PLANT_LOG_ACTION_LIST[1],VET_TB_201102_PLANT_ITEM_TITLE[1]),24*3600,1)
	end
end

function VET_201102_Plant_IsInRightMap()
	local nMapId = GetWorldPos()
	local bMapIsOk = 0
	for i = 1, getn(VET_TB_201102_PLANT_RIGHT_MAP) do
		if nMapId == VET_TB_201102_PLANT_RIGHT_MAP[i] then
			return 1;
		end
	end
	return 0;
end

function VET_201102_Plant_CheckTeamMember(nTeamSize)
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex <= 0 then
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[5],VET_TB_201102_PLANT_NPC_NAME[1]));
			return 0;
		end
		if VET_201102_Plant_IsInRightMap() == 0 then
			PlayerIndex = nOldPlayer; --’‚∏ˆœ˚œ¢∏ÊÀﬂ∂”≥§æÕ––¡À
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[6],VET_TB_201102_PLANT_NPC_NAME[1]));
			return 0;
		end
		local nLevel = GetLevel()
		if nLevel < VET_201102_PLANT_LEVEL_MIN or GetPlayerFaction() == 0 or gf_Check55HaveSkill() == 0 then
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[7],VET_201102_PLANT_LEVEL_MIN,VET_TB_201102_PLANT_NPC_NAME[1]));
			PlayerIndex = nOldPlayer; --’‚∏ˆœ˚œ¢∏ÊÀﬂ∂”≥§æÕ––¡À
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[7],VET_201102_PLANT_LEVEL_MIN,VET_TB_201102_PLANT_NPC_NAME[1]));
			return 0;
		end
		if GetTrigger(VET_201102_PLANT_NORMAL_TIMER_USER_ID) ~= 0 or GetTrigger(VET_201102_PLANT_SP_TIMER_USER_ID) ~= 0 then
			gf_Msg2Team("C„ ng≠Íi trong tÊ ÆÈi v…n Æang trÂng Hoa HÂng, kh´ng th” k›ch hoπt!")
			return 0;
		end
		if GetItemCount(2,1,30289) < 1 then
			PlayerIndex = nOldPlayer; --’‚∏ˆœ˚œ¢∏ÊÀﬂ∂”≥§æÕ––¡À
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[8],1,VET_TB_201102_PLANT_ITEM_TITLE[1],VET_TB_201102_PLANT_NPC_NAME[1]));
			return 0;
		end
		local nDailyCount =	VET_201102_PLANT_TaskGroup:GetDailyTask(VET_201102_PLANT_TaskGroup.TSK_DAILY_COUNT);
		if nDailyCount >= VET_201102_PLANT_MAX_DAILY_COUNT then
			PlayerIndex = nOldPlayer; --’‚∏ˆœ˚œ¢∏ÊÀﬂ∂”≥§æÕ––¡À
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[9], VET_201102_PLANT_MAX_DAILY_COUNT));
			return 0;
		end
		--÷÷√µπÂCDºÏ≤‚
		local nCrtTimeDistance = GetTime() - VET_201102_PLANT_TaskGroup:GetTask(VET_201102_PLANT_TaskGroup.TSK_TRIGGER_CRT_TIME)
		if nCrtTimeDistance < VET_201102_PLANT_LIFETIME then
			local sPlayerName = GetName()
			PlayerIndex = nOldPlayer; --’‚∏ˆœ˚œ¢∏ÊÀﬂ∂”≥§æÕ––¡À
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[11], sPlayerName,Zgc_pub_time_sec_change((VET_201102_PLANT_LIFETIME - nCrtTimeDistance),0)));
			return 0;
		end
	end
	PlayerIndex = nOldPlayer
	return 1;
end

function VET_201102_Plant_ActiveConfirm(nTeamSize)
	local nOldPlayer = PlayerIndex
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex <= 0 then
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[5],VET_TB_201102_PLANT_NPC_NAME[1]));
			return
		end
		if DelItem(2,1,30289,1) ~= 1 then
			return
		end
	end
	
	PlayerIndex = nOldPlayer
	
	local nRate = random(1,100);
	local nTrigerTemplateId = VET_201102_PLANT_NORMAL_TIMER_TEMPLATE_ID;
	local nTrigerUserId = VET_201102_PLANT_NORMAL_TIMER_USER_ID;
	local strNpcTemplate = VET_TB_201102_PLANT_NPC_TEMPLATE[1];
	local strNpcName = VET_TB_201102_PLANT_NPC_NAME[2];
	
	if (nRate <= 10) then
		nTrigerTemplateId = VET_201102_PLANT_SP_TIMER_TEMPLATE_ID;
		nTrigerUserId = VET_201102_PLANT_SP_TIMER_USER_ID;
		strNpcTemplate = VET_TB_201102_PLANT_NPC_TEMPLATE[2];
		strNpcName = VET_TB_201102_PLANT_NPC_NAME[3];
	end
	
	local nNpcIndex = CreateNpc(strNpcTemplate,strNpcName,GetWorldPos());
	if (nNpcIndex <= 0) then
		Talk(1, "", format(VET_TB_201102_PLANT_DLG[5],VET_TB_201102_PLANT_NPC_NAME[1]));
		return
	end
	SetNpcLifeTime(nNpcIndex, VET_201102_PLANT_LIFETIME + 5);
	
	local nOldPlayer = PlayerIndex;
	local nEndTime = GetTime() + VET_201102_PLANT_LIFETIME;
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		if PlayerIndex <= 0 then
			Talk(1, "", format(VET_TB_201102_PLANT_DLG[5],VET_TB_201102_PLANT_NPC_NAME[1]));
			return
			
		end
		VET_201102_PLANT_TaskGroup:SetTask(VET_201102_PLANT_TaskGroup.TSK_ACTIVE_END_TIME,nEndTime);
		CreateTrigger(1, nTrigerTemplateId, nTrigerUserId);
		--SetTimerType(GetTrigger(nTrigerUserId), 0);
		ContinueTimer(GetTrigger(nTrigerUserId));
		Msg2Player("K›ch hoπt trÂng Hoa HÂng thµnh c´ng!")
		gf_WriteLogEx(VET_STR_201102_PLANT_LOG_TITLE,format(VET_TB_201102_PLANT_LOG_ACTION_LIST[2],strNpcName));
		VET_201102_PLANT_TaskGroup:SetTask(VET_201102_PLANT_TaskGroup.TSK_TRIGGER_ID, nTrigerUserId);
		VET_201102_PLANT_TaskGroup:SetTask(VET_201102_PLANT_TaskGroup.TSK_ACTIVE_NPC_IDX,nNpcIndex);
		VET_201102_PLANT_TaskGroup:SetTask(VET_201102_PLANT_TaskGroup.TSK_TRIGGER_CRT_TIME,GetTime());
		VET_201102_PLANT_TaskGroup:AddDailyTask(VET_201102_PLANT_TaskGroup.TSK_DAILY_COUNT, 1);
	end
	PlayerIndex = nOldPlayer
end

