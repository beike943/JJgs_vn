Include("\\script\\task_access_code_def.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\missions\\siling_trial\\slt_define.lua")
Include("\\settings\\static_script\\misc\\missionaward_head.lua")
Include("\\script\\misc\\observer\\observer_head.lua")

--¼ì²é¹¦ÄÜÊÇ·ñÔÚÓÐÐ§µ±Ç°GSÉÏ
function slt_CheckMap()
	for i = 1, getn(SLT_MAP_ID) do
		if -1 == SubWorldID2Idx(SLT_MAP_ID[i]) then
			WriteLog(format("slt_CheckMap faild, mapID = %d", SLT_MAP_ID[i]));
			DebugOutput(format("slt_CheckMap faild, mapID = %d", SLT_MAP_ID[i]));
			return 0;
		end
	end	
	return 1;
end

--¸Ã¹¦ÄÜ½öÇÒ½ö´æÔÚÓÚÒ»¸öÖ¸¶¨NPCÉíÉÏ£¡£¡£¡
function slt_CheckNpc(npcIndex)
--	if GetNpcName(npcIndex) ~= SLT_NPC_NAME then
--		WriteLog(format("slt_CheckNpc failed, npcName = %s", GetNpcName(npcIndex)))
--		DebugOutput(format("slt_CheckNpc failed, npcName = %s", GetNpcName(npcIndex)));
--		return 0;
--	end
	return 1;	
end

--»ñµÃÄÜ¹»½øÈëµÄµØÍ¼ºÍÇøÓò
function slt_GetRandMap(npcIndex)
	if slt_CheckMap() ~= 1 then
		return 0, 0;
	end
	if slt_CheckNpc(npcIndex) ~= 1 then
		return 0, 0;
	end
	--Éú³É¿ÉÓÃmap table[1-45ºÅ]
	local n = 0;
	local t = {}
	for i = 1, SLT_AERA_NUM * getn(SLT_MAP_ID) do
		if 0 ~= mod(i, SLT_AERA_NUM) then
			local nIndex, nByte = slt_ToNpcIndexByte(i);
			if GetNpcTempDataByte(npcIndex, nIndex, nByte) == 0 then
				n = n + 1;
				t[n] = i;
			end
		end
	end
	if n <= 0 then
		return 0, 0;
	end
	--Ëæ»úµØÍ¼
	local nSeq = t[random(n)];
	local nMapSeq = ceil(nSeq / SLT_AERA_NUM);
	local nAeraSeq = nSeq - floor(nSeq / SLT_AERA_NUM) * SLT_AERA_NUM;
	--Ëæ»úÖÐÑëµØÍ¼
	local nCtIndex, nCtByte = slt_ToNpcIndexByte(nMapSeq * SLT_AERA_NUM);
	if GetNpcTempDataByte(npcIndex, nCtIndex, nCtByte) == 0 and random(1000) <= 10 then
		nAeraSeq = SLT_AERA_NUM;
	end
	--·µ»Ø½á¹û
	DebugOutput("nMapSeq, nAeraSeq =", nMapSeq, nAeraSeq);
	return nMapSeq, nAeraSeq;
end

function slt_ToNpcIndexByte(nMapListId)
	DebugOutput("slt_ToNpcIndexByte", nMapListId);
	local nIndex = 1 + floor((nMapListId - 1)/4);
	local nByte = mod(nMapListId, 4)
	if nByte == 0 then  nByte = 4 end
	return nIndex, nByte;
end

--¼ÇÂ¼¸ÃÇøÓòÒÑ±»Ê¹ÓÃ
function slt_RecordMapUse(npcIndex, nMapSeq, nAeraSeq)
	--¼ÇÂ¼ÈÎÎñ±äÁ¿
	if slt_CheckNpc(npcIndex) ~= 1 then
		return 0;
	end
	SetTask(SLT_TASKID_3, npcIndex, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 1, nMapSeq, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 2, nAeraSeq, TASK_ACCESS_CODE_SLT);
	--¼ÇÂ¼µ½NPCÁÙÊ±Êý¾Ý
	local nIndex, nByte = slt_ToNpcIndexByte((nMapSeq - 1) * SLT_AERA_NUM + nAeraSeq);
	local nValue = GetNpcTempDataByte(npcIndex, nIndex, nByte);
	SetNpcTempDataByte(npcIndex, nIndex, nByte, nValue + 1);
	DebugOutput("slt_RecordMapUse", npcIndex, nIndex, nByte, nValue + 1)
end

--¼ÇÂ¼¸ÃÇøÓòÎ´±»Ê¹ÓÃ
function slt_RecordMapNoUse()
	--¼ÇÂ¼ÈÎÎñ±äÁ¿
	local npcIndex = GetTask(SLT_TASKID_3);
	if slt_CheckNpc(npcIndex) ~= 1 then
		return 0;
	end
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	--¼ÇÂ¼µ½NPCÁÙÊ±Êý¾Ý
	local nIndex, nByte = slt_ToNpcIndexByte((nMapSeq - 1) * SLT_AERA_NUM + nAeraSeq);
	local nValue = GetNpcTempDataByte(npcIndex, nIndex, nByte);
	SetNpcTempDataByte(npcIndex, nIndex, nByte, max(nValue - 1, 0));
	SetTask(SLT_TASKID_3, 0, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 1, 0, TASK_ACCESS_CODE_SLT);
	gf_SetTaskByte(SLT_TASKID_1, 2, 0, TASK_ACCESS_CODE_SLT);
	DebugOutput("slt_RecordMapNoUse", npcIndex, nIndex, nByte, max(nValue - 1, 0))
end

--¿ªÊ¼ËÄÁéÊÔÁ¶
function slt_JoinAera(npcIndex, nMapSeq, nAeraSeq)
	DebugOutput(GetNpcName(npcIndex, nMapSeq, nAeraSeq));
	gf_TeamOperateEX(function ()
		CleanInteractive();
		if NewWorld(SLT_MAP_ID[%nMapSeq], SLT_AERA_POS[%nAeraSeq][1], SLT_AERA_POS[%nAeraSeq][2]) == 1 then
			SetTask(SLT_TASKID_1, 0, TASK_ACCESS_CODE_SLT);	
			SetTask(SLT_TASKID_2, 0, TASK_ACCESS_CODE_SLT);
			--´´½¨µÇÂ½´¥·¢Æ÷
			CreateTrigger(1, SLT_TRIGGER_ID, SLT_TRIGGER_ID * 2);	
			ContinueTimer(GetTrigger(SLT_TRIGGER_ID * 2));
			CreateTrigger(3, SLT_LOGOUT_ID, SLT_LOGOUT_ID * 2);
			SetCreateTeam(1);
			SetFightState(1);	--Õ½¶·×´Ì¬
			SetDeathScript(SLT_SCRIPT);	--ËÀÍö½Å±¾
			ForbidChangePK(1);	--×ª»»PK×´Ì¬
			UseScrollEnable(0);	--Ê¹ÓÃ»Ø³Ç·û
			ForbitTrade(1);	--½»Ò×
			StallEnable(0);	--°ÚÌ¯
			OpenFriendliness(1);	--ºÃ¸Ð¶È
			SetDeathPunish(0);	--ËÀÍö³Í·£
			InteractiveEnable(0);	--»¥¶¯
			ResetToNpcDamage(0);
			ResetToPlayerDamage(0);
			StopTimeGuage(-2);	--Çå³ý½çÃæ¼ÆÊ±Æ÷
			UnLimitSkill(30149);
			BlockSkill(30149);
			slt_RecordMapUse(%npcIndex, %nMapSeq, %nAeraSeq);
			CountDownRevive(1, 120);
			SetTempRevPos(SLT_MAP_ID[%nMapSeq], SLT_AERA_POS[%nAeraSeq][1] * 32, SLT_AERA_POS[%nAeraSeq][2] * 32);
			SetTempRevScript(SLT_SCRIPT);
			Msg2Player("HiÖn t¹i b¾t ®Çu ThÝ LuyÖn Tø Linh!");
			
			if SLT_CHANGE_PET ~= 0 then
				--Èç¹û²»ÊÇ±äÉí×´Ì¬
				local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
				if bOk == 1 then
					ChangeModel2WorkingPet();
				end
				if ChangeModel2WorkingPet() ~= 1 then
					Say("Kh«ng thÓ biÕn th©n b¹n ®ång hµnh, v­ît ¶i thÊt b¹i!", 0);
					gf_Msg2Team(format("%s ®· rêi khái ThÝ LuyÖn Tø Linh!", GetName()), 1);
					slt_LeaveAera();
					return 0;
				end
				ForbitChangeModel(1); --½ûÖ¹pet±äÉí
			end
		end
	end)
	AddRuntimeStat(26, 2, 0, GetTeamSize());--¿ªÆô¹Ø¿¨ÈËÊý
end

--Àë¿ªËÄÁéÊÔÁ¶
function slt_LeaveAera(noLeaveTeam)
	if NewWorld(SLT_EXIT_POS[1], SLT_EXIT_POS[2], SLT_EXIT_POS[3]) == 1 then
		slt_RecordMapNoUse();
		SetCreateTeam(0);
		SetFightState(0);	--Õ½¶·×´Ì¬
		SetDeathScript("");	--ËÀÍö½Å±¾
		ForbidChangePK(0);	--×ª»»PK×´Ì¬
		UseScrollEnable(1);	--Ê¹ÓÃ»Ø³Ç·û
		ForbitTrade(0);	--½»Ò×
		StallEnable(1);	--°ÚÌ¯
		OpenFriendliness(0);	--ºÃ¸Ð¶È
		SetDeathPunish(1);	--ËÀÍö³Í·£
		InteractiveEnable(1);	--»¥¶¯
		ForbitChangeModel(0); --ÈÝÐípet±äÉí
		ResetToNpcDamage(0);
		ResetToPlayerDamage(0);
		StopTimeGuage(-2);	--Çå³ý½çÃæ¼ÆÊ±Æ÷
		UnBlockSkill(30149);
		LimitSkill(30149);
		RemoveTrigger(GetTrigger(SLT_TRIGGER_ID * 2));
		RemoveTrigger(GetTrigger(SLT_LOGOUT_ID * 2));
		CountDownRevive();
		SetTempRevPos(0,0,0);
		SetTempRevScript("");
		SetTask(SLT_TASKID_1, 0, TASK_ACCESS_CODE_SLT);	
		SetTask(SLT_TASKID_2, 0, TASK_ACCESS_CODE_SLT);
		local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
		if tonumber(bOk) == 1 then
			ChangeModel2WorkingPet();
		end
		if not noLeaveTeam then
			LeaveTeam();
		end
		if IsPlayerDeath() ~= 0 then
			RevivePlayer(0);
		end
		Msg2Player("B¹n ®· rêi khái ThÝ LuyÖn Tø Linh!");
	end
end

function slt_AtSltMap()
	local nMapId = GetWorldPos();
	for i = 1, getn(SLT_MAP_ID) do
		if SLT_MAP_ID[i] == nMapId then
			return 1;
		end
	end	
	return 0;
end

--´¦ÀíµôÏßµÄÎÊÌâ
function slt_LeaveGame()
	DebugOutput("slt_LeaveGame!", slt_AtSltMap(), GetTrigger(SLT_TRIGGER_ID * 2))
	if 1 == slt_AtSltMap() or GetTrigger(SLT_TRIGGER_ID * 2) ~= 0 then
		if GetName() == GetCaptainName() and GetTeamSize() == 1 then
			slt_RemoveAllNpc();
			slt_RemoveAllBox();
		end
		slt_LeaveAera();
	end
end

--trigger
function slt_OnTrigger()
	--µØÍ¼¼ì²é
	local nMapId = GetWorldPos();
	if gf_MapIsAllow(SLT_MAP_ID, nMapId) ~= 1 then
		gf_Msg2Team(format("%s ®· rêi khái ThÝ LuyÖn Tø Linh!", GetName()), 1);
		slt_LeaveAera();
		return 0;
	end
	--Ã¿¸öÈËµÄÊÂ
	local nStep = GetTask(SLT_TASKID_2);
	--´´½¨npc
	if nStep == 0 then
		if GetCaptainName() == GetName() then
			slt_DialogNpc(); 
		end
		SetTask(SLT_TASKID_2, nStep + 1, TASK_ACCESS_CODE_SLT);
		return 0;
	end
	--µÈ´ýnpc¿ªÆô
	if nStep <= 1 then
		return 0;
	end
	--ÒÑ¿ªÆô
	SetTask(SLT_TASKID_2, nStep + 1, TASK_ACCESS_CODE_SLT);
	--¼ì²é±äÉí×´Ì¬
	if nStep > 3 and SLT_CHANGE_PET ~= 0 then 
		local bOk, szName = IsNpcChangeModel(PIdx2NpcIdx());
		if bOk ~= 1 then
			Say("Kh«ng thÓ biÕn th©n b¹n ®ång hµnh, v­ît ¶i thÊt b¹i!", 0);
			gf_Msg2Team(format("%s ®· rêi khái ThÝ LuyÖn Tø Linh!", GetName()), 1);
			slt_LeaveAera();
			return 0;
		end
	end
	--ÒÔÏÂÊÇ¶Ó³¤µÄÊÂÁË
	if GetCaptainName() ~= GetName() then
		return 0;
	end
	if nStep == 3 then
		gf_Msg2Team("¶i khëi t¹o...", 1);
	end
	if mod(nStep, 6) == 0 then 
		gf_Msg2Team(format("TiÕn ®é ThÝ LuyÖn Tø Linh %d/%d", nStep, SLT_MISSION_STEP_MAX), 1);
		if gf_GetTaskByte(SLT_TASKID_1, 4) ~= 0 then
			gf_Msg2Team("NhËn th­ëng b¶o r­¬ng míi cã thÓ b­íc vµo giai ®o¹n tiÕp theo.", 1);
		end
	end
	--¹Ø¿¨×î³¤Ê±¼ä
	if nStep >=  SLT_MISSION_STEP_MAX then
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_TeamOperateEX(slt_LeaveAera, 1);
		return 0;
	end
	--Á÷³Ì
	if nStep < 5 then return 0; end
	if mod(nStep, 2) == 0 
		and mod(nStep, 4) ~= 0
		and slt_CanRefleshMonster() == 1 
		and gf_GetTaskByte(SLT_TASKID_1, 4) == 0 
		and gf_GetTaskByte(SLT_TASKID_1, 3) < 4 
	then
		gf_Msg2Team(format("Thêi gian ®ît qu¸i tiÕp theo xuÊt hiÖn cßn %d gi©y", 10), 1);
	end
	if mod(nStep, 4) == 0 
		and slt_CanRefleshMonster() == 1 
		and gf_GetTaskByte(SLT_TASKID_1, 4) == 0
		and gf_GetTaskByte(SLT_TASKID_1, 3) < 5 
	then
		gf_TeamOperateEX(function ()
			gf_SetTaskByte(SLT_TASKID_1, 3, gf_GetTaskByte(SLT_TASKID_1, 3) + 1, TASK_ACCESS_CODE_SLT)
			RestoreAll();
		end);
		local nType = gf_GetTaskByte(SLT_TASKID_1, 3);
		if nType >= 1 and nType <= 3 then
			slt_RemoveAllBox();
			slt_RefleshMonster(nType, SLT_POINT_NUM);
		elseif nType == 4 then
			slt_RemoveAllBox();
			slt_RefleshBoss();
		elseif nType == 5 then
			gf_Msg2Team("Chóc mõng v­ît ¶i thµnh c«ng!");
		end
	end
end

--ËÀÍö½Å±¾
function OnDeath(id, f, x)
	DebugOutput(id, f, x)
	--Npc Death
	if f and tonumber(f) == 0 then
		slt_RemoveNpc(id);
		if slt_CanRefleshMonster() == 1 then
			slt_PassAward(gf_GetTaskByte(SLT_TASKID_1, 3));
			gf_TeamOperateEX(function ()
				if IsPlayerDeath() == 1 then
					RevivePlayer(1);
				end
			end);
		end
	else
	--Player Death
		local oldPlayerIndex = PlayerIndex;
		for i = 1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if IsPlayerDeath() ~= 1 then
				return 0;
			end
		end
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_Msg2Team("ThÊt b¹i råi! ThÝ LuyÖn Tø Linh kÕt thóc!", 2);
		gf_TeamOperateEX(slt_LeaveAera, 1);
	end
end

--Player Revive
function OnRevive()
	DebugOutput("OnRevive")
	SetFightState(1);
	RestoreAll(); --ÂúÑª¸´»î
end

--Ë¢¹Ö
function slt_RefleshMonster(nType, nNum)
	local tTypeMonster = {
		SLT_NPC_TEMPLATE_1,
		SLT_NPC_TEMPLATE_2,
		SLT_NPC_TEMPLATE_3,
	}
	if not tTypeMonster[nType] then
		return 0;
	end
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	local npcIndex = nil;
	local nRandNpc = random(getn(tTypeMonster[nType]));
	local tNpc = tTypeMonster[nType][nRandNpc];
	for i = 1, nNum do
		npcIndex = slt_CreateNpc(tNpc[1], tNpc[2], SLT_MAP_ID[nMapSeq], SLT_NPC_POS_1[nAeraSeq][1] + random(-2, 2), SLT_NPC_POS_1[nAeraSeq][2] + random(-2, 2));
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end	
	nRandNpc = random(getn(tTypeMonster[nType]));
	tNpc = tTypeMonster[nType][nRandNpc];
	for i = 1, nNum do
		npcIndex = slt_CreateNpc(tNpc[1], tNpc[2], SLT_MAP_ID[nMapSeq], SLT_NPC_POS_2[nAeraSeq][1] + random(-2, 2), SLT_NPC_POS_2[nAeraSeq][2] + random(-2, 2));
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
	nRandNpc = random(getn(tTypeMonster[nType]));
	tNpc = tTypeMonster[nType][nRandNpc];
	for i = 1, nNum do
		npcIndex = slt_CreateNpc(tNpc[1], tNpc[2], SLT_MAP_ID[nMapSeq], SLT_NPC_POS_3[nAeraSeq][1] + random(-2, 2), SLT_NPC_POS_3[nAeraSeq][2] + random(-2, 2));
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
	gf_Msg2Team(format("L­ît qu¸i thø %d ®· xuÊt hiÖn!", nType));
end

--Ë¢°ÂÌØÂü
function slt_RefleshBoss()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	local nIndexNpc = ceil(nAeraSeq / 2);
	if not SLT_BOSS_TEMPLATE[nIndexNpc] or not SLT_PARTNER_TEMPLATE[nIndexNpc] then
		return 0;
	end
	local npcIndex = nil;
	npcIndex = slt_CreateNpc(SLT_BOSS_TEMPLATE[nIndexNpc][1], SLT_BOSS_TEMPLATE[nIndexNpc][2], SLT_MAP_ID[nMapSeq], SLT_BOSS_POS[nAeraSeq][1], SLT_BOSS_POS[nAeraSeq][2]);
	SetNpcDeathScript(npcIndex, SLT_SCRIPT);
	SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	for i = 1, SLT_GENBAN_NUM do
		npcIndex = slt_CreateNpc(SLT_PARTNER_TEMPLATE[nIndexNpc][1], SLT_PARTNER_TEMPLATE[nIndexNpc][2], SLT_MAP_ID[nMapSeq], SLT_BOSS_POS[nAeraSeq][1], SLT_BOSS_POS[nAeraSeq][2]);
		SetNpcDeathScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
	gf_Msg2Team("BOSS ®· xuÊt hiÖn!");
end

function slt_CreateNpc(szModel, szName, nMapId, nX, nY)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_npc_table then
		g_slt_npc_table = {};
	end
	if not g_slt_npc_table[nMapSeq] then
		g_slt_npc_table[nMapSeq] = {};
	end
	if not g_slt_npc_table[nMapSeq][nAeraSeq] then
		g_slt_npc_table[nMapSeq][nAeraSeq] = {};
	end
	local npcIndex = CreateNpc(szModel, szName, nMapId, nX, nY);
	tinsert(g_slt_npc_table[nMapSeq][nAeraSeq], npcIndex);
	DebugOutput("slt_CreateNpc", nMapSeq, nAeraSeq, npcIndex, getn(g_slt_npc_table[nMapSeq][nAeraSeq]));
	return npcIndex;
end

function slt_RemoveNpc(npcIndex)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	DebugOutput("slt_RemoveNpc", npcIndex, nMapSeq, nAeraSeq)
	if not g_slt_npc_table 
		or not g_slt_npc_table[nMapSeq] 
		or not g_slt_npc_table[nMapSeq][nAeraSeq]
		or type(g_slt_npc_table[nMapSeq][nAeraSeq]) ~= "table" then
		DebugOutput("slt_RemoveNpc error", type(g_slt_npc_table[nMapSeq][nAeraSeq]));
		return 0;
	end
	for i = 1, getn(g_slt_npc_table[nMapSeq][nAeraSeq]) do
		if tonumber(npcIndex) == tonumber(g_slt_npc_table[nMapSeq][nAeraSeq][i]) then
			DebugOutput(nMapSeq, nAeraSeq, npcIndex, GetNpcName(npcIndex));
			SetNpcLifeTime(npcIndex, 0);
			tremove(g_slt_npc_table[nMapSeq][nAeraSeq], i);
			return tonumber(npcIndex);
		end
	end
end

function slt_RemoveAllNpc()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_npc_table 
		or not g_slt_npc_table[nMapSeq] 
		or not g_slt_npc_table[nMapSeq][nAeraSeq]
		or type(g_slt_npc_table[nMapSeq][nAeraSeq]) ~= "table" then
		return 0;
	end
	local t = g_slt_npc_table[nMapSeq][nAeraSeq];
	for i = 1, getn(t) do
		DebugOutput(nMapSeq, nAeraSeq, t[i], GetNpcName(t[i]));
		SetNpcLifeTime(t[i], 0);
	end
	g_slt_npc_table[nMapSeq][nAeraSeq] = {};
end

function slt_CanRefleshMonster()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_npc_table then
		g_slt_npc_table = {};
	end
	if not g_slt_npc_table[nMapSeq] then
		g_slt_npc_table[nMapSeq] = {};
	end
	if not g_slt_npc_table[nMapSeq][nAeraSeq] then
		g_slt_npc_table[nMapSeq][nAeraSeq] = {};
	end
	if type(g_slt_npc_table[nMapSeq][nAeraSeq]) ~= "table" then
		g_slt_npc_table[nMapSeq][nAeraSeq] = {};
		return 1;
	end
	for i = 1, getn(g_slt_npc_table[nMapSeq][nAeraSeq]) do
		if IsNpcDeath(g_slt_npc_table[nMapSeq][nAeraSeq][i]) ~= 1 then
			return 0;
		end
	end
	g_slt_npc_table[nMapSeq][nAeraSeq] = {};	
	return 1;
end

--1-4
function slt_PassAward(nType)
	DebugOutput("slt_PassAward", nType);
	if nType < 1 or nType > 4 then
		return 0;
	end
	gf_TeamOperateEX(function ()
		local nExp = SLT_EXP[%nType] * (1 + GetVipCardParam() + SLT_ROUTE_ADD[gf_GetRouteCount() or 1] + SLT_EXP_ADD_PRB);
		gf_ModifyExp(nExp);
	end);
	local tAward = SLT_AWARD[nType];
	local nMapId, nX, nY = GetWorldPos();
	for k, v in tAward do
		if type(v) == "table" and getn(v) == 4 then
			for i = 1, v[3] do
				local npcIndex = slt_CreateBox(v[1], v[2], nMapId, nX + random(-4, 4), nY + random(-4, 4));
				SetNpcScript(npcIndex, v[4]);
				SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
			end
		end
	end
	slt_DialogNpc();
end

function slt_CreateBox(szModel, szName, nMapId, nX, nY)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table then
		g_slt_box_table = {};
	end
	if not g_slt_box_table[nMapSeq] then
		g_slt_box_table[nMapSeq] = {};
	end
	if not g_slt_box_table[nMapSeq][nAeraSeq] then
		g_slt_box_table[nMapSeq][nAeraSeq] = {};
	end
	local npcIndex = CreateNpc(szModel, szName, nMapId, nX, nY);
	tinsert(g_slt_box_table[nMapSeq][nAeraSeq], npcIndex);
	DebugOutput("slt_CreateBox", nMapSeq, nAeraSeq, npcIndex, getn(g_slt_box_table[nMapSeq][nAeraSeq]));
	gf_TeamOperateEX(function ()
		gf_SetTaskByte(SLT_TASKID_1, 4, gf_GetTaskByte(SLT_TASKID_1, 4) + 1, TASK_ACCESS_CODE_SLT);
	end);
	return npcIndex;
end

function slt_RemoveBox(npcIndex)
	local find = 0;
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table 
		or not g_slt_box_table[nMapSeq] 
		or not g_slt_box_table[nMapSeq][nAeraSeq]
		or type(g_slt_box_table[nMapSeq][nAeraSeq]) ~= "table" then
		DebugOutput("slt_RemoveBox error")
		return find;
	end
	DebugOutput("slt_RemoveBox", npcIndex, nMapSeq, nAeraSeq)
	for i = 1, getn(g_slt_box_table[nMapSeq][nAeraSeq]) do
		if tonumber(npcIndex) == tonumber(g_slt_box_table[nMapSeq][nAeraSeq][i]) then
			DebugOutput(nMapSeq, nAeraSeq, npcIndex, GetNpcName(npcIndex));
			SetNpcLifeTime(npcIndex, 0);
			SetNpcScript(npcIndex, "");
			tremove(g_slt_box_table[nMapSeq][nAeraSeq], i);
			gf_TeamOperateEX(function ()
				gf_SetTaskByte(SLT_TASKID_1, 4, gf_GetTaskByte(SLT_TASKID_1, 4) - 1, TASK_ACCESS_CODE_SLT);
			end);
			find = tonumber(npcIndex);
		end
	end
	--ÒªÉèÖÃÒ»ÏÂ²½½øÅäºÏ¸´»î½ÇÉ«
	if GetName() == GetCaptainName() and gf_GetTaskByte(SLT_TASKID_1, 4) == 0 then
		local nStep = GetTask(SLT_TASKID_2);
		if mod(nStep, 2) == 0 then
			SetTask(SLT_TASKID_2, nStep - 1, TASK_ACCESS_CODE_SLT);
		else
			if mod(nStep + 1, 4) == 0 then
				SetTask(SLT_TASKID_2, nStep - 2, TASK_ACCESS_CODE_SLT);
			end
		end
	end
	return find;
end

function slt_RemoveAllBox()
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table 
		or not g_slt_box_table[nMapSeq] 
		or not g_slt_box_table[nMapSeq][nAeraSeq]
		or type(g_slt_box_table[nMapSeq][nAeraSeq]) ~= "table" then
		return 0;
	end
	local t = g_slt_box_table[nMapSeq][nAeraSeq];
	for i = 1, getn(t) do
		DebugOutput(nMapSeq, nAeraSeq, t[i], GetNpcName(t[i]));
		SetNpcLifeTime(t[i], 0);
	end
	g_slt_box_table[nMapSeq][nAeraSeq] = {};
end

--Ïä×Ó
function main()
	local npcIndex = GetTargetNpc();
	local npcName = GetNpcName(npcIndex);
	DebugOutput(npcIndex, npcName);
	local nStep = gf_GetTaskByte(SLT_TASKID_1, 3);
	if npcName == SLT_TONG_BOX then
		slt_tong_box(npcIndex, nStep);
	elseif npcName == SLT_YING_BOX then
		slt_yin_box(npcIndex);
	elseif npcName == SLT_JING_BOX then
		slt_jin_box(npcIndex);
	elseif npcName == SLT_NPC_NAME then
		if GetName() ~= GetCaptainName() then
			Say("ChØ cã ®éi tr­ëng míi ®­îc tiÕn hµnh thao t¸c!", 0);
			return 0;
		end
		slt_intro_npc(npcIndex, nStep);
	end
end

function slt_intro_npc(npcIndex, nStep)
	if 0 == nStep then
		Say(format("<color=green>%s:<color> ThÝ LuyÖn Tø Linh!", SLT_NPC_NAME), 3,
			"\nMë v­ît ¶i/#slt_StartGame("..npcIndex..")",
			"\n rêi ¶i/#slt_EndGame("..npcIndex..")",
			"\nT«i chØ xem xem th«i/nothing");
	elseif nStep >= 1 and nStep < 4 then
		Say(format("<color=green>%s:<color> ThÝ LuyÖn Tø Linh!", SLT_NPC_NAME), 3,
			"\nB­íc vµo l­ît tiÕp theo/#slt_NextStep("..npcIndex..")",
			"\n rêi ¶i/#slt_EndGame("..npcIndex..")",
			"\nT«i chØ xem xem th«i/nothing");
	else
		Say(format("<color=green>%s:<color> ThÝ LuyÖn Tø Linh!", SLT_NPC_NAME), 2,
			"\n rêi ¶i/#slt_EndGame("..npcIndex..")",
			"\nT«i chØ xem xem th«i/nothing");
	end
end

function slt_tong_box(npcIndex, nType)
	--É¾Ïä×Ó
	if tonumber(npcIndex) ~= slt_RemoveBox(npcIndex) then
		return 0;
	end
	--¸ø½±Àø
	if 1 == nType then
		local nRetIndex = CustomAwardSelectOne("silian_tong_1");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex);
		end
	elseif 2 == nType then
		local nRetIndex = CustomAwardSelectOne("silian_tong_2");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex);
		end
	elseif 3 == nType then
		local nRetIndex = CustomAwardSelectOne("silian_tong_3");
		if nRetIndex > 0 then
			local ntype, tItem = CustomAwardGetAwardInfo2(nRetIndex);
			gf_ThrowDice(tItem, nil, nil, nil, nil, npcIndex);
		end
	end
end

function slt_yin_box(npcIndex)
	if GetNpcTempData(npcIndex, SLT_NPC_TEMP_DATA_1) == 0 then
		Say("Më [R­¬ng B¹c] cÇn 1 [Thiªn Kiªu LÖnh] (Ngù C¸c cã b¸n).",
			2, 
			"\n x¸c nhËn më/#slt_IamDaye("..npcIndex..")",	
			"\n hñy më/nothing")
			--"\nÉ¾³ý±¦Ïä/#slt_RemoveBox("..npcIndex..")")
		return
	else
		slt_speLoot(npcIndex);
	end
end

function slt_IamDaye(npcIdx)
	local daye = GetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_1);

	if 0 ~= daye then
		Talk(1, "", "§· cã ng­êi më r­¬ng nµy råi");
		return 0;
	end

	if DelItem(SLT_OPEN_NEED[2],SLT_OPEN_NEED[3],SLT_OPEN_NEED[4],SLT_OPEN_NEED[5]) == 1 then
		SetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_1, PlayerIndex);
		slt_speLoot(npcIdx);
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {SLT_OPEN_NEED[2],SLT_OPEN_NEED[3],SLT_OPEN_NEED[4],SLT_OPEN_NEED[5]})
		AddRuntimeStat(26, 4, 0, SLT_OPEN_NEED[5]);--IBÏûºÄ¼ÆÊý
	else
		Talk(1, "", "Trªn ng­êi kh«ng cã [Thiªn Kiªu LÖnh], kh«ng thÓ më <color=green>R­¬ng B¹c<color>. [Thiªn Kiªu LÖnh] cã thÓ mua trong <color=yellow>Ngù C¸c<color>");
	end
end

function slt_speLoot(npcIdx)
	local daye = GetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_1);
	if daye == 0 then
		return 0;
	end
	local tSel = {
		"KÕt thóc ®èi tho¹i/nothing",
	}
	local OldPlayerIndex = PlayerIndex;
	if daye == PlayerIndex then
		local player_name = ""
		for i = 1,GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			if PlayerIndex ~= OldPlayerIndex then
				player_name = GetName();
				player_name = gf_FilterName(player_name,"/","-");
				player_name = gf_FilterName(player_name,"|","-");
				player_name = gf_FilterName(player_name,":","-");
				tinsert(tSel, 1, "Ta cÇn mang phÇn th­ëng ph©n cho "..player_name.."/#slt_lootAwardOther("..PlayerIndex..","..npcIdx..")");
			end
		end
		PlayerIndex = OldPlayerIndex;
		tinsert(tSel, 1, "Ta muèn nhËn phÇn th­ëng/#slt_lootAward("..PlayerIndex..","..npcIdx..")");
	end

	local nLootItemId = GetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_2);
	if nLootItemId == 0 then
		nLootItemId = CustomAwardSelectOne("silian_yin");
		SetNpcTempData(npcIdx, SLT_NPC_TEMP_DATA_2, nLootItemId);
	end

	local ntype, tItem = CustomAwardGetAwardInfo2(nLootItemId);
	local msg = "";
	if tItem and getn(tItem) > 4 and tItem[4] > 0 then
		msg = format("<color=yellow>[%s]x%d<color>", GetItemName(tItem[1], tItem[2], tItem[3]), tItem[4]);
	end
	Say("<color=green>B¶o r­¬ng<color>: ë ®©y cã"..msg, getn(tSel), tSel);
end

function slt_lootAwardOther(player_index, box_index)
	local player_index_save = PlayerIndex
	--ÅÐ¶Ï¸ÃË÷ÒýÊÇ·ñ»¹ÊÇÔÚ¸Ã¶ÓÎéÖÐ
	local index_chg_chk_flag = 0
	local team_size = GetTeamSize()
	if team_size ~= 0 then
		index_chg_chk_flag = gf_IsInTeam(player_index);
	else
		index_chg_chk_flag = 1
	end
	if index_chg_chk_flag ~= 1 then
		Talk(1,"","<color=green>Chó ý<color>: Xin mêi h·y kiÓm tra l¹i nh÷ng ng­êi mµ b¹n ph©n chia cã ph¶i cã cïng <color=yellow>tæ ®éi<color> víi b¹n!")
		return
	end
	--·ÖÅä¶ÔÏóµÄ¿Õ¼ä¸ºÖØ¼ì²â
	PlayerIndex = player_index
	local s_palyer_name = GetName()
	if GetFreeItemRoom() < SLT_NEED_ROOM then
		Talk(1,"","<color=green>Th«ng b¸o<color>: <color=yellow>Hµnh trang<color> c¸c h¹ kh«ng ®ñ!")
		PlayerIndex = player_index_save
		Talk(1,"","<color=green>Th«ng b¸o<color>: : <color=green>"..s_palyer_name.."<color><color=yellow>Hµnh trang<color> ®· ®Çy, kh«ng thÓ ph©n phèi!")
		return
	end

	PlayerIndex = player_index_save
	slt_lootAward(player_index, box_index)
end

function slt_lootAward(player_index, box_index)
	local player_index_save = PlayerIndex
	--É¾Ïä×Ó
	if tonumber(box_index) ~= slt_RemoveBox(box_index) then
		return 0;
	end
	--¸ø½±Àø
	PlayerIndex = player_index;
	if gf_JudgeRoomWeight(SLT_NEED_ROOM, 100, "") ~= 1 then return end
	local nLootItemId = GetNpcTempData(box_index, SLT_NPC_TEMP_DATA_2);
	if nLootItemId == 0 then
		nLootItemId = CustomAwardSelectOne("silian_yin");
	end
	CustomAwardGiveOne(nLootItemId);
	SetNpcTempData(box_index, SLT_NPC_TEMP_DATA_1, 0);
	SetNpcTempData(box_index, SLT_NPC_TEMP_DATA_2, 0);

	PlayerIndex = player_index_save;
end

function slt_jin_box(npcIndex)
	--É¾Ïä×Ó
	if tonumber(npcIndex) ~= slt_RemoveBox(npcIndex) then
		return 0;
	end
	--¸ø½±Àø
	local tRequire = {};
	for i = 1, 8 do
		tinsert(tRequire, {SLT_OPEN_NEED[2],SLT_OPEN_NEED[3],SLT_OPEN_NEED[4], 1});
	end
	MA_Team_OpenUI(SLT_SCRIPT, "slt_jin_box_card", tRequire);
	--10Ãë½áÊø
	gf_TeamOperateEX(function ()
		SetTask(SLT_TASKID_2, SLT_MISSION_STEP_MAX - 3, TASK_ACCESS_CODE_SLT);
		Msg2Player(format("%d gi©y sau sÏ kÕt thóc ¶i!", 10));
	end);
end

function slt_jin_box_card(id)
	local nMapId = GetWorldPos();
	if gf_MapIsAllow(SLT_MAP_ID, nMapId) ~= 1 then
		SendScript2Client('Open([[ma]])');	--¹Ø±Õ·­ÅÆ½çÃæ
		return 0;
	end
	
	if gf_Judge_Room_Weight(2, 20, "") ~= 1 then
		return 0;
	end
	
	local g, d, p, n;
	if id < 8 then
		local nAwardIndex = CustomAwardSelectOne("silian_jin_free");
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(id, g, d, p, n, GetName());
		end
	else
		local tItem = MA_GetRequire(id);
		if DelItem(tItem[1], tItem[2], tItem[3], tItem[4]) ~= 1 then
			Talk(1, "", "Mang theo trªn ng­êi"..SLT_OPEN_NEED[1].."Kh«ng ®ñ!");
			return 0;
		end
		Observer:onEvent(SYSEVENT_GLOBAL_COST_IB, {tItem[1], tItem[2], tItem[3], tItem[4]})
		AddRuntimeStat(26, 4, 0, tItem[4]);--IBÏûºÄ¼ÆÊý
		local nAwardIndex = CustomAwardSelectOne("silian_jin_IB");
		if nAwardIndex > 0 then
			CustomAwardGiveOne(nAwardIndex);
			_,g,d,p,n = CustomAwardGetAwardInfo(nAwardIndex);
			MA_Team_SyncItem(id, g, d, p, n, GetName());
		end
	end
end

function slt_DialogNpc()
	local nMapId, nX, nY = GetWorldPos();
	local npcIndex = slt_CreateNpc("Chu BÊt HoÆc", SLT_NPC_NAME, nMapId, nX, nY);
	if npcIndex > 0 then
		SetNpcScript(npcIndex, SLT_SCRIPT);
		SetNpcLifeTime(npcIndex, (SLT_MISSION_STEP_MAX - GetTask(SLT_TASKID_2))*5);
	end
end

function slt_StartGame(npcIndex)
	if tonumber(npcIndex) ~= slt_RemoveNpc(npcIndex) then
		return 0;
	end
	gf_TeamOperateEX(function ()
		SetTask(SLT_TASKID_2, 3, TASK_ACCESS_CODE_SLT);
	end);
end

function slt_NextStep(npcIndex)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table then
		g_slt_box_table = {};
	end
	if not g_slt_box_table[nMapSeq] then
		g_slt_box_table[nMapSeq] = {};
	end
	if not g_slt_box_table[nMapSeq][nAeraSeq] then
		g_slt_box_table[nMapSeq][nAeraSeq] = {};
	end
	DebugOutput("Count =", getn(g_slt_box_table[nMapSeq][nAeraSeq]))
	local AllDelete = 1;
	for i =1, getn(g_slt_box_table[nMapSeq][nAeraSeq]) do
		local npcName = GetNpcName(g_slt_box_table[nMapSeq][nAeraSeq][i]);
		DebugOutput(g_slt_box_table[nMapSeq][nAeraSeq][i], npcName, GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1), GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2));
		if npcName == SLT_TONG_BOX
			or npcName == SLT_JING_BOX
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1) > 0 
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2) > 0 then
			AllDelete = 0;
			break;
		end
	end
	if 1 ~= AllDelete then
		Say("Ch­a nhËn th­ëng kh«ng thÓ më l­ît tiÕp theo!", 0);
		return 0;
	end
	if tonumber(npcIndex) == slt_RemoveNpc(npcIndex) then
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_TeamOperateEX(function ()
			gf_SetTaskByte(SLT_TASKID_1, 4, 0, TASK_ACCESS_CODE_SLT);
		end);
	end
end

function slt_EndGame(npcIndex)
	local nMapSeq = gf_GetTaskByte(SLT_TASKID_1, 1);
	local nAeraSeq = gf_GetTaskByte(SLT_TASKID_1, 2);
	if not g_slt_box_table then
		g_slt_box_table = {};
	end
	if not g_slt_box_table[nMapSeq] then
		g_slt_box_table[nMapSeq] = {};
	end
	if not g_slt_box_table[nMapSeq][nAeraSeq] then
		g_slt_box_table[nMapSeq][nAeraSeq] = {};
	end
	DebugOutput("Count =", getn(g_slt_box_table[nMapSeq][nAeraSeq]))
	local AllDelete = 1;
	for i =1, getn(g_slt_box_table[nMapSeq][nAeraSeq]) do
		local npcName = GetNpcName(g_slt_box_table[nMapSeq][nAeraSeq][i]);
		DebugOutput(g_slt_box_table[nMapSeq][nAeraSeq][i], npcName, GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1), GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2));
		if npcName == SLT_TONG_BOX
			or npcName == SLT_JING_BOX
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_1) > 0 
			or GetNpcTempData(g_slt_box_table[nMapSeq][nAeraSeq][i], SLT_NPC_TEMP_DATA_2) > 0 then
			AllDelete = 0;
			break;
		end
	end
	if 1 ~= AllDelete then
		Say("Ch­a nhËn th­ëng kh«ng thÓ rêi khái ¶i!", 0);
		return 0;
	end
	if tonumber(npcIndex) == slt_RemoveNpc(npcIndex) then
		slt_RemoveAllNpc();
		slt_RemoveAllBox();
		gf_TeamOperateEX(slt_LeaveAera, 1);
		AddRuntimeStat(26, 3, 0, 1); --Í¨¹Ø´ÎÊý
	end
end